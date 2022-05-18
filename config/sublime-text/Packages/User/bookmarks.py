import sublime, sublime_plugin
import os

class PrintBookmarksCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        items=[]
        all_files = list(filter(None, map(lambda f : f.file_name(), sublime.active_window().views())))
        common_prefix = os.path.commonprefix(all_files)
        for view in sublime.active_window().views():
            prefix = ""
            if view.name():
                prefix = view.name() + ":"
            elif view.file_name():
                prefix = view.file_name() + ":"
                if prefix.startswith(common_prefix):
                    prefix = prefix[len(common_prefix):]
            for region in view.get_regions("bookmarks"):
                row, _ = view.rowcol(region.a)
                items.append(prefix + str(row + 1))
        if len(items) > 0:
            win = self.view.window()
            win.new_file()
            view_temp = win.active_view()
            view_temp.insert(edit, 0, "\n".join(items))
        else:
            sublime.set_timeout(lambda: sublime.status_message('No bookmarks found'), 0)

