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

def run_git_show(view, hash_with_path):
    window = view.window()
    root_path = get_first_root_path(window)
    os.chdir(root_path) # by default path, this is sublime installation directory

    p = subprocess.run(
        ['git', 'show', hash_with_path],
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
    )
    if p.returncode != 0:
        print("{} git show file by hash is failed. Error: {}".format(PLUGIN_PATH, p.stderr))
        window.run_command("show_panel", args={'panel': 'console'})
        return

    if len(p.stdout) < 1:
        print("{} git show file by hash is empty stdout".format(PLUGIN_PATH))
        window.run_command("show_panel", args={'panel': 'console'})
        return

    scratch = window.new_file()
    scratch.set_name("git show {}".format(hash_with_path))
    scratch.set_scratch(True)
    scratch.run_command("insert_content_to_view", {"string": p.stdout})

    sublime.set_timeout(lambda: sublime.status_message("Git show file by commit hash is work"), 0)


class GitShowByHash(sublime_plugin.TextCommand):
    def run(self, edit):
        sublime.active_window().show_input_panel(
            "Enter hash",
            "",
            self.done,
            None,
            None,
        )

    def done(self, commit_hash: str):
        path = self.view.file_name()
        relative_path = get_relative_path(path, self.view.window())

        hash_with_path = "{}:./{}".format(commit_hash, relative_path)
        run_git_show(self.view, hash_with_path)

    def is_enabled(self):
        return is_exist_view(self.view)

    def is_visible(self):
        return is_exist_view(self.view)


class GitShowByHashWithPath(sublime_plugin.TextCommand):
    def run(self, edit):
        sublime.active_window().show_input_panel(
            "Enter hash:path",
            "",
            self.done,
            None,
            None,
        )

    def done(self, hash_with_path: str):
        if hash_with_path == "":
            print("{}. Error: empty input param".format(PLUGIN_PATH))
            window.run_command("show_panel", args={'panel': 'console'})
            return

        run_git_show(self.view, hash_with_path)