import sublime_plugin
import sublime
import os


class FileNameInputHandler(sublime_plugin.TextInputHandler):
    def __init__(self, view):
        self.view = view
        self.file_name = os.path.basename(self.view.file_name() or self.view.name())

    def name(self):
        return "new_name"

    def placeholder(self):
        return "New File Name"

    def initial_text(self):
        return self.file_name

    def initial_selection(self):
        name = os.path.splitext(self.file_name)[0]
        return [(0, len(name))]

    def validate(self, name):
        if self.view.file_name() is None:
            return True
        else:
            return len(name) > 0


class RenameFileCommand(sublime_plugin.WindowCommand):
    def run(self, new_name):
        view = self.window.active_view()
        old = view.file_name()

        if old is None:
            # Unsaved file
            view.set_name(new_name)
        else:
            branch, leaf = os.path.split(old)
            new = os.path.join(branch, new_name)

            if new == old:
                return

            try:
                if os.path.isfile(new) and not self.is_case_change(old, new):
                    raise OSError("File already exists")

                os.rename(old, new)

                if view:
                    view.retarget(new) # standard behavior
                    # Custom
                    view.assign_syntax(sublime.find_syntax_for_file(new))
            except OSError as e:
                sublime.status_message("Unable to rename: " + str(e))
            except:
                sublime.status_message("Unable to rename")

    def input(self, args):
        if "new_name" not in args:
            return FileNameInputHandler(self.window.active_view())
        else:
            return None

    def is_case_change(self, old, new):
        if old.lower() != new.lower():
            return False
        if os.stat(old).st_ino != os.stat(new).st_ino:
            return False
        return True
