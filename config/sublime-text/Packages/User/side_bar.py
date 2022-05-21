import sublime
import sublime_plugin
import subprocess
import os
import functools


class SideBarOpenInNewWindowCommand(sublime_plugin.WindowCommand):
    def run(self, dirs=[]):
        items = [sublime.executable_path(), "-n"]
        for dir in dirs:
            items.append(dir)

        subprocess.Popen(items)

    def is_visible(self, dirs):
        return len(dirs) > 0


class EnhancedNewFileAtCommand(sublime_plugin.WindowCommand):
    def run(self, dirs):
        self.window.show_input_panel("File Name:", "",functools.partial(self.on_done, dirs[0]), None, None)

    def on_done(self, dir_name, file_name):
        view = self.window.new_file()
        view.retarget(os.path.join(dir_name, file_name))
        view.run_command("save")

    def is_visible(self, dirs):
        return len(dirs) == 1


class NewFileEventListener(sublime_plugin.EventListener):
    def on_window_command(self, window, cmd, args):
        if cmd == "new_file_at":
            return ("enhanced_new_file_at", args)
