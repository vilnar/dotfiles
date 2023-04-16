import sublime
import sublime_plugin

class TestCommand(sublime_plugin.WindowCommand):
    def run(self):
        print(self.window.extract_variables())
