import sublime
import sublime_plugin
import subprocess
import os
import functools


class SideBarOpenInNewWindowCommand(sublime_plugin.WindowCommand):
    def run(self, dirs=[]):
        items = [sublime.executable_path(), "-n"]
        for dir in dirs:
            items.append(dir)

        subprocess.Popen(items)

    def is_visible(self, dirs):
        return len(dirs) > 0

# source https://forum.sublimetext.com/t/new-file-from-sidebar-context-menu/37626
# and https://github.com/wisdman/SideBarMenuAdvanced
class EnhancedNewFileAtCommand(sublime_plugin.WindowCommand):
    def run(self, dirs):
        base = self.get_path(dirs)
        if os.path.isfile(base):
            base = os.path.dirname(base)

        self.window.show_input_panel('File Name:', "", functools.partial(self.on_done, base), None, None)

    def get_path(self, paths):
        try:
            return paths[0]
        except IndexError:
            return self.window.active_view().file_name()

    def on_done(self, base, leaf):
        if not leaf:
            return

        new = os.path.join(base, leaf)
        try:
            if os.path.exists(new):
                raise OSError("File or Folder already exists")

            base = os.path.dirname(new)
            if not os.path.exists(base):
                os.makedirs(base)

            with open(new, "w+", encoding="utf8", newline="") as f:
                f.write(str(""))

            self.window.open_file(new)

        except OSError as error:
            self.window.status_message('Unable to create file: "{}"'.format(error))
        except:
            self.window.status_message('Unable to create file: "{}"'.format(new))

    def description(self):
        return 'New File'

    def is_visible(self, paths):
        return len(paths) == 1

class NewFileEventListener(sublime_plugin.EventListener):
    def on_window_command(self, window, cmd, args):
        if cmd == "new_file_at":
            return ("enhanced_new_file_at", args)
