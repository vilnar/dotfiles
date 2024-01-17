import sublime
import sublime_plugin
import subprocess
import os
import shutil


PLUGIN_PATH = "User/json_format.py"
JQ_EXE = "jq"

class JsonFormatCommand(sublime_plugin.TextCommand):

    def run(self, edit, is_minify = False):
        path = shutil.which(JQ_EXE)
        if path is None:
            print("{} JQ not found in path: {}".format(PLUGIN_PATH, JQ_EXE))
            self.view.window().run_command("show_panel", args={'panel': 'console'})
            return

        if self.has_empty_region(self.view.sel()):
            self.parse_region(edit, sublime.Region(0, self.view.size()), is_minify)
            return

        for region in self.view.sel():
            self.parse_region(edit, region, is_minify)

    def has_empty_region(self, selectionСoordinates):
        for region in selectionСoordinates:
            if not region.empty():
                return False
        return True

    def parse_region(self, edit, region, is_minify):
        raw_json = self.view.substr(region)
        commands = [JQ_EXE]
        if is_minify:
            commands.append("-c")
        p = subprocess.Popen(
            commands,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            stdin=subprocess.PIPE,
        )
        out, err = p.communicate(bytes(raw_json, "UTF-8"))
        output = out.decode("UTF-8").replace(os.linesep, "\n").strip()
        errors = err.decode("UTF-8").replace(os.linesep, "\n").strip()
        if errors:
            print("{} JQ errors: {}".format(PLUGIN_PATH, errors))
            self.view.window().run_command("show_panel", args={'panel': 'console'})
            return

        self.view.replace(
            edit,
            region,
            output
        )
        self.view.window().status_message("JQ format done!")
