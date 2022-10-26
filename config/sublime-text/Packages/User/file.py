import sublime
import sublime_plugin
import os
import subprocess
from .lib import (
    is_exist_view,
    get_relative_path,
    get_first_root_path,
)


PLUGIN_PATH = "User/file.py"


class FileDeleteCommand(sublime_plugin.WindowCommand):
    def run(self):
        path = self.window.extract_variables().get('file')

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
        return is_exist_view(self.window.active_view())

    def is_visible(self):
        return is_exist_view(self.window.active_view())


class OpenFileInNewWindow(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        sublime.run_command("new_window")
        sublime.active_window().open_file(path)
        sublime.set_timeout(lambda: sublime.status_message('New window open!!!'), 0)

    def is_enabled(self):
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)


class OpenFileInVim(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        root_path = get_first_root_path(window)
        os.chdir(root_path) # by default path, this is sublime installation directory
        p = subprocess.run(
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
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)



class CopyCurrentFolderPathCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        dirPath = os.path.dirname(path)
        sublime.set_clipboard(dirPath)
        window.status_message("Copied {} to clipboard".format(dirPath))

    def is_enabled(self):
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)


class CopyFileNameCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()

        name = os.path.split(path)[1]
        sublime.set_clipboard(name)
        window.status_message("Copied {} to clipboard".format(name))

    def is_enabled(self):
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)

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
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)

class ClearFileCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("run_macro_file", {"file": "res://Packages/User/macros/clear_file.sublime-macro"})
        self.window.run_command("save", {"encoding": "utf-8" })
