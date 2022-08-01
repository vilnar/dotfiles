import sublime
import sublime_plugin


PLUGIN_PATH = "User/layout.py"

# https://stackoverflow.com/questions/23957730/showing-the-same-file-in-both-columns-of-a-sublime-text-window
class CloneToRightCommand(sublime_plugin.WindowCommand):
    def run(self):
        w = self.window
        if w.num_groups() == 1:
            # w.run_command('set_layout', {
            #     "cols": [0.0, 0.46, 1.0],
            #     "rows": [0.0, 1.0],
            #     "cells": [[0, 0, 1, 1], [1, 0, 2, 1]]
            # })
            # w.focus_group(0)
            # w.run_command('clone_file')
            # w.run_command('move_to_group', {'group': 1})
            # w.focus_group(1)
            # self.copy_position_and_selections(self.window.active_view_in_group(0), self.window.active_view_in_group(1))
            view1 = self.window.active_view()
            w.run_command('clone_file', args={"add_to_selection": "true"})
            w.run_command('select_to_left')
            w.run_command('focus_to_right')
            view2 = self.window.active_view()
            self.copy_position_and_selections(view1, view2)
        else:
            w.focus_group(1)
            w.run_command('close')
            w.run_command('set_layout', {
                'cols': [0.0, 1.0],
                'rows': [0.0, 1.0],
                'cells': [[0, 0, 1, 1]]
            })

    def copy_position_and_selections(self, view_source, view_destination):
        view_destination.set_viewport_position(view_source.viewport_position(), False)
        view_destination.sel().clear()
        view_destination.sel().add_all(view_source.sel())