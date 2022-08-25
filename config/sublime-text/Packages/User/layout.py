import sublime
import sublime_plugin


PLUGIN_PATH = "User/layout.py"

def copy_position_and_selections(source, destination):
    destination.set_viewport_position(source.viewport_position(), False)
    destination.sel().clear()
    destination.sel().add_all(source.sel())

# https://stackoverflow.com/questions/23957730/showing-the-same-file-in-both-columns-of-a-sublime-text-window
class SplitViewKeepPostionCommand(sublime_plugin.WindowCommand):
    def run(self):
        view1 = self.window.active_view()
        self.window.run_command('clone_file', args={"add_to_selection": "true"})
        self.window.run_command('select_to_left')
        self.window.run_command('focus_to_right')
        view2 = self.window.active_view()
        copy_position_and_selections(view1, view2)


class DuplicateViewCommand(sublime_plugin.WindowCommand):
    def run(self):
        view1 = self.window.active_view()
        self.window.run_command('clone_file', args={"add_to_selection": "true"})
        view2 = self.window.active_view()
        copy_position_and_selections(view1, view2)