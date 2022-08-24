import os
import sublime
import sublime_plugin

# source https://github.com/sublimehq/sublime_text/issues/5001#issuecomment-958715838
class CustomFileHistoryCommand(sublime_plugin.WindowCommand):
    def run(self):
        items = []
        for file in self.window.file_history():
            if os.path.exists(file):
                kind = (sublime.KIND_ID_SNIPPET, "A", "File exists.")
            else:
                kind = (sublime.KIND_ID_FUNCTION, "D", "File does not exist.")

            items.append(
                sublime.QuickPanelItem(trigger = os.path.basename(file), details = file, kind = kind)
            )

        self.window.show_quick_panel(
            items = items,
            on_select = lambda id: self.on_select(id),
            placeholder = "Browse through file history ...",
            flags = sublime.KEEP_OPEN_ON_FOCUS_LOST | sublime.MONOSPACE_FONT
        )

    def on_select(self, id):
        if id < 0:
            return
        selected_file = self.window.file_history()[id]
        if os.path.exists(selected_file):
            self.window.open_file(selected_file)
        else:
            sublime.status_message("File doesn't exist on disk.")
