import sublime
import sublime_plugin
import os

STATUS_KEY = "_view_status"

class ViewInStatusBar(sublime_plugin.EventListener):
    def on_activated_async(self, view):
        if view.is_scratch():
            view.set_status(STATUS_KEY, "SCRATCH \U0001F525") # 🔥
            return
        file_name = view.file_name()
        if not file_name:
            # untitled
            view.set_status(STATUS_KEY, "TEMP \U00002705") # ✅
            return
        if not os.path.exists(file_name):
            view.set_status(STATUS_KEY, "NOT EXISTS \U0000274C") # ❌
            return
        if not os.access(file_name, os.W_OK):
            view.set_status(STATUS_KEY, "RO \U0001F510") # 🔐
            return
        view.erase_status(STATUS_KEY)
