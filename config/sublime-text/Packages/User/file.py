import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/file.py"

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


class OpenFileInNewWindow(sublime_plugin.TextCommand):
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
        sublime.set_timeout(lambda: sublime.status_message('New window open!!!'), 0)


class OpenFileInExternal(sublime_plugin.TextCommand):
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


class CopyCurrentFolderPathCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return
        dirPath = os.path.dirname(path)
        sublime.set_clipboard(dirPath)
        window.status_message("Copied {} to clipboard".format(dirPath))


class CopyFileNameCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        path = self.view.file_name()
        if not os.path.exists(path):
            print("{} File not found in path: {}".format(PLUGIN_PATH, path))
            window.run_command("show_panel", args={'panel': 'console'})
            return
        name = os.path.split(path)[1]
        sublime.set_clipboard(name)
        window.status_message("Copied {} to clipboard".format(name))
