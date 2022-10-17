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


class EnhancedRenamePathCommand(sublime_plugin.WindowCommand):
    def run(self, paths):
        branch, leaf = os.path.split(paths[0])
        v = self.window.show_input_panel(
            "New Name:",
            leaf,
            functools.partial(self.on_done, paths[0], branch),
            None,
            None)
        name, ext = os.path.splitext(leaf)

        v.sel().clear()
        v.sel().add(sublime.Region(0, len(name)))

    def is_case_change(self, old, new):
        if old.lower() != new.lower():
            return False
        if os.stat(old).st_ino != os.stat(new).st_ino:
            return False
        return True

    def on_done(self, old, branch, leaf):
        new = os.path.join(branch, leaf)

        if new == old:
            return

        try:
            if os.path.isfile(new) and not self.is_case_change(old, new):
                raise OSError("File already exists")

            os.rename(old, new)

            v = self.window.find_open_file(old)
            if v:
                v.retarget(new) # standard behavior
                # Custom
                v.assign_syntax(sublime.find_syntax_for_file(new))
        except OSError as e:
            sublime.status_message("Unable to rename: " + str(e))
        except:
            sublime.status_message("Unable to rename")

    def is_visible(self, paths):
        return len(paths) == 1


class NewFileEventListener(sublime_plugin.EventListener):
    def on_window_command(self, window, cmd, args):
        if cmd == "new_file_at":
            return ("enhanced_new_file_at", args)
        if cmd == "rename_path":
            return ("enhanced_rename_path", args)
