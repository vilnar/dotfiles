import sublime
import sublime_plugin
import subprocess


PLUGIN_PATH = "User/find_files.py"

# source https://github.com/fgb/goto_selection
class GotoSelectionCommand(sublime_plugin.WindowCommand):
    def run(self, select_word_under_cursor = False):
        view = self.window.active_view()
        selection = view.sel()[0]
        overlay_args = {"overlay": "goto", "show_files": True}

        if not selection.empty():
            text = view.substr(selection)
        elif select_word_under_cursor:
            text = view.substr(view.word(selection))

        self.window.run_command("show_overlay", overlay_args)
        sublime.set_clipboard(text);
        self.window.run_command("paste")


class FindFilesByPartPathCommand(sublime_plugin.WindowCommand):
    is_case_sensitive = False

    def run(self, is_case_sensitive = False):
        self.is_case_sensitive = is_case_sensitive

        caption = "Enter file or folder part path name"
        if self.is_case_sensitive:
            caption += " (case sensitive)"
        else:
            caption += " (case ignore)"

        sublime.active_window().show_input_panel(
            caption,
            "",
            self.done,
            None,
            None,
        )

    def done(self, query: str):
        win = sublime.active_window()
        folder = win.extract_variables().get("folder")

        case_option = '-iname'
        if self.is_case_sensitive:
            case_option = '-name'

        p = subprocess.run([
            '/usr/bin/find',
            folder,
            '-not',
            '-path',
            './.git/*',
            case_option,
            '*{}'.format(query)
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if p.returncode != 0:
            print("{} Bash find: failed, error: {}".format(PLUGIN_PATH, p.stderr))
            win.run_command("show_panel", args={'panel': 'console'})
            return

        if len(p.stdout) < 1:
            print("{} Bash find: not found file or folder".format(PLUGIN_PATH))
            win.run_command("show_panel", args={'panel': 'console'})
            return

        scratch = win.new_file()
        scratch.run_command("insert_content_to_view", {"string": p.stdout})


class InsertContentToViewCommand(sublime_plugin.TextCommand):
    def run(self, edit, string):
        self.view.replace(edit, sublime.Region(0, self.view.size()), string)
