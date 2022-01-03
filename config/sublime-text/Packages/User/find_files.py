import sublime
import sublime_plugin
import os
import subprocess


PLUGIN_PATH = "User/find_files.py"

# source https://github.com/fgb/goto_selection
class GotoSelectionCommand(sublime_plugin.WindowCommand):
    def run(self, select_word_under_cursor = False):
        view = self.window.active_view()
        selection = view.sel()[0]
        overlay_args = {"overlay":"goto", "show_files" : True}

        if not selection.empty():
            overlay_args["text"] = view.substr(selection)
        elif select_word_under_cursor:
            overlay_args["text"] = view.substr(view.word(selection))

        self.window.run_command("show_overlay", overlay_args)


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
