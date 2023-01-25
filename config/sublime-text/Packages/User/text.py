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
        clip = sublime.get_clipboard();
        self.view.window().show_input_panel("RepeatPaste: How many times? ", "", self.on_done, None, None)

    def on_done(self, user_input):
        pasteCount = int(float(user_input))
        clip = sublime.get_clipboard();
        text = '';

        for x in range(0,pasteCount):
            text += clip

        sublime.set_clipboard(text);
        self.view.run_command('paste');
        sublime.set_clipboard(clip);
