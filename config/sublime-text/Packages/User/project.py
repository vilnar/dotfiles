import sublime
import sublime_plugin

class ProjectRestart(sublime_plugin.WindowCommand):
    def run(self):
        name = self.window.extract_variables().get("project_base_name")
        project = self.window.project_file_name()
        self.window.run_command('close_workspace')
        self.window.run_command('open_project_or_workspace', {"file": project})
        sublime.set_timeout(
            lambda: sublime.status_message('Restarted project {}!'.format(name)),
            0
        )

    def is_enabled(self):
        return bool(self.window.project_file_name())