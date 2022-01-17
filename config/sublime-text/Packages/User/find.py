import sublime
import sublime_plugin
import os


PLUGIN_PATH = "User/find.py"

class FindUnderCursorCommand(sublime_plugin.WindowCommand):
    def run(self):
        view = self.window.active_view()
        view.run_command("expand_selection", {"to": "word"})
        view.run_command("slurp_find_string")
        id_group = self.window.active_group()
        self.window.run_command("show_panel", args={"panel": "find", "whole_word": True, "case_sensitive": False})
        self.window.run_command("focus_group", {"group": id_group})

class FindInCurrentFileCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("show_panel",
            args={
                "panel": "find_in_files",
                "case_sensitive": False,
                "whole_word": False,
                "show_context": False,
                "use_buffer": True,
                "where": "<current file>",
            }
        )


class FindInCurrentFolderCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        current_dir = os.path.dirname(self.view.file_name())
        if not os.path.exists(current_dir):
            print("{} Directory not found in path: {}".format(PLUGIN_PATH, current_dir))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        window.run_command("show_panel", args={"panel": "find_in_files", "where": current_dir})

