import sublime
import sublime_plugin


class FindUnderCursor(sublime_plugin.WindowCommand):
    def run(self):
        view = self.window.active_view()
        view.run_command("expand_selection", {"to": "word"})
        view.run_command("slurp_find_string")
        id_group = self.window.active_group()
        self.window.run_command("show_panel", args={"panel": "find", "whole_word": True, "case_sensitive": False})
        self.window.run_command("focus_group", {"group": id_group})


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
