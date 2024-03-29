import sublime
import sublime_plugin


class OpenNewTabWithSelectedTextCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        raw_texts = []
        for region in self.view.sel():
            raw_texts.append(self.view.substr(region))

        win = self.view.window()
        win.new_file()
        view_temp = win.active_view()
        view_temp.insert(edit, 0, "\n".join(raw_texts))


# source https://github.com/philsinatra/SublimePasteRepeater/blob/master/PasteRepeater.py
class RepeatPasteCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        self.view.window().show_input_panel("RepeatPaste: How many times? ", "", self.on_done, None, None)

    def on_done(self, uinput):
        count = int(float(uinput))
        clip = sublime.get_clipboard()

        text = ""
        for x in range(0, count):
            text += clip

        sublime.set_clipboard(text)
        self.view.run_command("paste")
        sublime.set_clipboard(clip)


class ClearViewCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command("run_macro_file", {"file": "res://Packages/User/macros/clear_view.sublime-macro"})
        v = self.window.active_view()
        file_name = v.file_name()
        if v.is_scratch() or not file_name:
            return

        self.window.run_command("save", {"encoding": "utf-8" })
