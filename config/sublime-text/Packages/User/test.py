import sublime
import sublime_plugin

class TestCommand(sublime_plugin.WindowCommand):
    def run(self):
        print(self.window.extract_variables())
        print(self.window.views())
        self.window.run_command("show_panel", args={'panel': 'console'})
