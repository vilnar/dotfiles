import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/file.py"

def is_file_exist(view):
    return bool(view.file_name() and len(view.file_name()) > 0)

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
        if not path:
            window.status_message("View is temp, don't open in vim")
            return
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return

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
        root_paths = window.folders()

        relative_path = path
        for root in root_paths:
            if path.startswith(root):
                relative_path = os.path.relpath(path, root)
                break

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
