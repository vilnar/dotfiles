import sublime
import sublime_plugin
import os

STATUS_KEY = "_view_status"

class ViewInStatusBar(sublime_plugin.EventListener):
    def on_activated_async(self, view):
        if view.is_scratch():
            view.set_status(STATUS_KEY, "View: SCRATCH \U000026A1")
            return
        file_name = view.file_name()
        if not file_name:
            view.set_status(STATUS_KEY, "View: TEMP \U0001F4DD")
            return
        if not os.path.exists(file_name):
            view.set_status(STATUS_KEY, "File: NOT EXISTS \U0001F5D1")
            return
        if not os.access(file_name, os.W_OK):
            view.set_status(STATUS_KEY, "File: READ ONLY \U0001F440")
            return
        view.erase_status(STATUS_KEY)
