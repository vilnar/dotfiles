import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/file.py"

def is_file_exist(view):
    return bool(view.file_name() and len(view.file_name()) > 0)

def get_relative_path(abs_path, window):
    root_paths = window.folders()
    relative_path = abs_path
    for root in root_paths:
        if abs_path.startswith(root):
            relative_path = os.path.relpath(abs_path, root)
            break
    return relative_path

def get_first_root_path(window):
    root_paths = window.folders()
    result = None
    for root in root_paths:
        result = root
        break
    return result


class FileDeleteCommand(sublime_plugin.WindowCommand):
    def run(self):
        path = self.window.extract_variables().get('file')
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            self.view.window().run_command("show_panel", args={'panel': 'console'})
            return

        p = subprocess.run(
            "gio trash {}".format(path),
            shell=True,
            capture_output=False
        )
        if p.returncode != 0:
            print("{} gio trash failed. Error code: {}".format(PLUGIN_PATH, p.returncode))
            self.window.run_command("show_panel", args={'panel': 'console'})
            return

        # self.window.active_view().close()
        self.window.status_message("gio trash done!")

    def is_enabled(self):
        return is_file_exist(self.window.active_view())

    def is_visible(self):
        return is_file_exist(self.window.active_view())


class OpenFileInNewWindow(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        sublime.run_command("new_window")
        sublime.active_window().open_file(path)
        sublime.set_timeout(lambda: sublime.status_message('New window open!!!'), 0)

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)


class OpenFileInVim(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        p = subprocess.run(
            # TODO: fix freeze for term kitty
            "gnome-terminal -- vim {}".format(path),
            shell=True,
            capture_output=False
        )
        if p.returncode != 0:
            print("{} run vim failed. Error code: {}".format(PLUGIN_PATH, p.returncode))
            self.window.run_command("show_panel", args={'panel': 'console'})
            return
        sublime.set_timeout(lambda: sublime.status_message('Open file in vim'), 0)

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)


class OpenFileInCommit(sublime_plugin.TextCommand):
    def run(self, edit):
        sublime.active_window().show_input_panel(
            "Enter commit hash",
            "",
            self.done,
            None,
            None,
        )

    def done(self, commit: str):
        window = self.view.window()
        path = self.view.file_name()
        relative_path = get_relative_path(path, window)

        root_path = get_first_root_path(window)
        os.chdir(root_path) # by default path, this is sublime installation directory

        commit_with_path = '{}:{}'.format(commit, relative_path)
        p = subprocess.run(
            ['git', 'show', commit_with_path],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        if p.returncode != 0:
            print("{} open file in commit failed. Error code: {}".format(PLUGIN_PATH, p.returncode))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        if len(p.stdout) < 1:
            print("{} stdout is empty".format(PLUGIN_PATH))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        scratch = window.new_file()
        scratch.set_name("git show {}".format(commit_with_path))
        scratch.set_scratch(True)
        scratch.run_command("insert_content_to_view", {"string": p.stdout})

        sublime.set_timeout(lambda: sublime.status_message('Open file in commit'), 0)

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)



class CopyCurrentFolderPathCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        dirPath = os.path.dirname(path)
        sublime.set_clipboard(dirPath)
        window.status_message("Copied {} to clipboard".format(dirPath))

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)


class CopyFileNameCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        name = os.path.split(path)[1]
        sublime.set_clipboard(name)
        window.status_message("Copied {} to clipboard".format(name))

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)

class CopyFilePathWithLineCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        relative_path = get_relative_path(path, window)

        row, _ = self.view.rowcol(self.view.sel()[0].begin())
        result = "{}:{}".format(relative_path, row + 1)
        sublime.set_clipboard(result)
        window.status_message("Copied {} to clipboard".format(result))

    def is_enabled(self):
        return is_file_exist(self.view)

    def is_visible(self):
        return is_file_exist(self.view)

class ClearFileCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("run_macro_file", {"file": "res://Packages/User/macros/clear_file.sublime-macro"})
        self.window.run_command("save", {"encoding": "utf-8" })
