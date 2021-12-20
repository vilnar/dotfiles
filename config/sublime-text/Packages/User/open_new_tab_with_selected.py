import sublime
import sublime_plugin


class OpenNewTabWithSelectedTextCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        rawTexts = []
        for region in self.view.sel():
            rawTexts.append(self.view.substr(region))

        win = self.view.window()
        win.new_file()
        viewTemp = win.active_view()
        viewTemp.set_name("__TEMP__")
        viewTemp.insert(edit, 0, "\n".join(rawTexts))
