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
