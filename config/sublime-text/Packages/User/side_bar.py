import sublime
import sublime_plugin
import subprocess


class SideBarOpenInNewWindowCommand(sublime_plugin.WindowCommand):
    def run(self, dirs=[]):
        items = [sublime.executable_path(), "-n"]
        for dir in dirs:
            items.append(dir)

        subprocess.Popen(items)

    def is_visible(self, dirs):
        return len(dirs) > 0
