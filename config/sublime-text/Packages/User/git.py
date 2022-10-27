import sublime
import sublime_plugin
import os
import subprocess

from .lib import (
    is_exist_view,
    get_relative_path,
    get_first_root_path,
)

PLUGIN_PATH = "User/git.py"

class OpenFileInCommit(sublime_plugin.TextCommand):
    def run(self, edit):
        sublime.active_window().show_input_panel(
            "Enter commit hash",
            "",
            self.done,
            None,
            None,
        )

    def done(self, commit: str):
        window = self.view.window()
        path = self.view.file_name()
        relative_path = get_relative_path(path, window)

        root_path = get_first_root_path(window)
        os.chdir(root_path) # by default path, this is sublime installation directory

        commit_with_path = "{}:{}".format(commit, relative_path)
        p = subprocess.run(
            ['git', 'show', commit_with_path],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
        )
        if p.returncode != 0:
            print("{} git show commit failed. Error code: {}".format(PLUGIN_PATH, p.returncode))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        if len(p.stdout) < 1:
            print("{} git show commit stdout is empty".format(PLUGIN_PATH))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        scratch = window.new_file()
        scratch.set_name("git show {}".format(commit_with_path))
        scratch.set_scratch(True)
        scratch.run_command("insert_content_to_view", {"string": p.stdout})

        sublime.set_timeout(lambda: sublime.status_message("Open file in commit"), 0)

    def is_enabled(self):
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)

