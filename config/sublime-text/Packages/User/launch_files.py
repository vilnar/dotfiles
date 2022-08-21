import os
import subprocess
import sys
import sublime
import sublime_plugin

class LaunchFiles(sublime_plugin.WindowCommand):
    def run(self, files):
        try:
            subprocess.check_call(["xdg-open", files[0]])
        except Exception as e:
            sublime.error_message(str(e))

    def is_visible(self, files):
        return bool(files)

    def is_enabled(self, files):
        return len(files) == 1