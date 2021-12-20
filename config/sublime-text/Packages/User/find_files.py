import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/find_files.py"

class FindInCurrentFolderCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        window = self.view.window()
        current_dir = os.path.dirname(self.view.file_name())
        if not os.path.exists(current_dir):
            print("{} Directory not found in path: {}".format(PLUGIN_PATH, current_dir))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        window.run_command("show_panel", args={"panel": "find_in_files", "where": current_dir})


class FindFilesByPartPathCommand(sublime_plugin.WindowCommand):
    def run(self):
        sublime.active_window().show_input_panel(
            "Enter file or folder part path name",
            "",
            self.done,
            None,
            None,
        )

    def done(self, query: str):
        win = sublime.active_window()
        folder = win.extract_variables().get("folder")

        SHELL_COMMAND = [
            '/usr/bin/find',
            folder,
            '-not',
            '-path',
            './.git/*',
            '-iname',
            '*{}'.format(query)
        ]
        p = subprocess.run(SHELL_COMMAND, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if p.returncode != 0:
            print("{} Bash find: failed, error code: {}".format(PLUGIN_PATH, p.returncode))
            win.run_command("show_panel", args={'panel': 'console'})
            return

        if len(p.stdout) < 1:
            print("{} Bash find: not found file or folder".format(PLUGIN_PATH))
            win.run_command("show_panel", args={'panel': 'console'})
            return

        scratch = win.new_file()
        scratch.set_name("__Files__")
        scratch.set_scratch(True)
        scratch.run_command("insert_content_to_view", {"string": p.stdout})


class InsertContentToViewCommand(sublime_plugin.TextCommand):
    def run(self, edit, string):
        self.view.set_read_only(False)
        self.view.replace(edit, sublime.Region(0, self.view.size()), string)
        self.view.set_read_only(True)
