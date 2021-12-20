import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/file.py"

class FileDeleteCommand(sublime_plugin.WindowCommand):
    def run(self):
        file_path = self.window.extract_variables().get('file')
        if not os.path.exists(file_path):
            print("File not found in path: {}".format(PLUGIN_PATH, file_path))
            self.view.window().run_command("show_panel", args={'panel': 'console'})
            return

        SHELL_COMMAND = "gio trash {}".format(file_path)
        p = subprocess.run(SHELL_COMMAND, shell=True, capture_output=False)
        if p.returncode != 0:
            print("gio trash failed. Error code: {}".format(PLUGIN_PATH, p.returncode))
            self.window.run_command("show_panel", args={'panel': 'console'})
            return

        # self.window.active_view().close()
        self.window.status_message("gio trash done!")


class OpenCurrentFileInNewWindow(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not path:
            window.status_message("View is temp, don't open in new window")
            return
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        sublime.run_command("new_window")
        sublime.active_window().open_file(path)
        window.status_message("new window open!!!")


class CopyCurrentFolderPathCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not os.path.exists(path):
            print("File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return
        current_dir = os.path.dirname(path)
        sublime.set_clipboard(current_dir)
        window.status_message("Copied {} to clipboard".format(current_dir))


class CopyFileNameCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not os.path.exists(path):
            print("File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return
        name = os.path.split(path)[1]
        sublime.set_clipboard(name)
        window.status_message("Copied {} to clipboard".format(name))
