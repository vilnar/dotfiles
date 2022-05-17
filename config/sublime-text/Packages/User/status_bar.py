import sublime
import sublime_plugin
import os


class ShowFileStatusInStatusBar(sublime_plugin.EventListener):
    def on_activated_async(self, view):
        if view.is_scratch():
            view.set_status('_file_status', "View: SCRATCH \U000026A1")
            return
        file_name = view.file_name()
        if not file_name:
            view.set_status('_file_status', "View: TEMP \U0001F4DD")
            return
        if not os.path.exists(file_name):
            view.set_status('_file_status', "File: NOT EXISTS \U0001F5D1")
            return
        if not os.access(file_name, os.W_OK):
            view.set_status('_file_status', "File: READ ONLY \U0001F440")
            return
        view.erase_status('_file_status')
