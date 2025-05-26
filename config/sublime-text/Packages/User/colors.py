import sublime
import sublime_plugin
from pathlib import Path
import os

DEFAULT_COLOR_SCHEME = "Mariana.sublime-color-scheme"
DEFAULT_FONT_FACE = "Monospace"
DEFAULT_FONT_SIZE = 13
EDITOR_PREFERENCES = "Preferences.sublime-settings"


def GET_MERGE_PREFERENCES():
    if os.name == 'nt':
        return "~\\AppData\\Roaming\\Sublime Merge\\Packages\\User\\Preferences.sublime-settings"
    else:
        return "~/.config/sublime-merge/Packages/User/Preferences.sublime-settings"


class ColorSchemeToggleCommand(sublime_plugin.TextCommand):
    def run(self, edit, **args):
        settings = sublime.load_settings(EDITOR_PREFERENCES)

        dark_color_scheme = settings.get("dark_color_scheme", DEFAULT_COLOR_SCHEME)
        dark_font_face = settings.get("dark_font_face", DEFAULT_FONT_FACE)
        dark_font_size = settings.get("dark_font_size", DEFAULT_FONT_SIZE)
        light_color_scheme = settings.get("light_color_scheme", DEFAULT_COLOR_SCHEME)
        light_font_face = settings.get("light_font_face", DEFAULT_FONT_FACE)
        light_font_size = settings.get("light_font_size", DEFAULT_FONT_SIZE)

        current_theme = settings.get("color_scheme", light_color_scheme)
        is_light = current_theme == light_color_scheme

        if is_light:
            settings.set("color_scheme", dark_color_scheme)
            settings.set("font_face", dark_font_face)
            settings.set("font_size", dark_font_size)
        else:
            settings.set("color_scheme", light_color_scheme)
            settings.set("font_face", light_font_face)
            settings.set("font_size", light_font_size)

        sublime.save_settings(EDITOR_PREFERENCES)

       # custom save and get setting for sublime merge, because smerge API does not exist
        merge_path = self.get_smerge_path()
        with open(merge_path, 'r') as file:
                    settings_merge = sublime.decode_value(file.read())

        light_theme_merge = settings_merge.get("theme_light", "Merge.sublime-theme")
        dark_theme_merge = settings_merge.get("theme_dark", "Merge Dark.sublime-theme")

        if is_light:
            settings_merge["theme"] = dark_theme_merge
            settings_merge["font_face"] = dark_font_face
            settings_merge["font_size"] = dark_font_size
        else:
            settings_merge["theme"] = light_theme_merge
            settings_merge["font_face"] = light_font_face
            settings_merge["font_size"] = light_font_size

        with open(merge_path, 'w') as file:
            file.write(sublime.encode_value(settings_merge, pretty = True))

    @staticmethod
    def get_smerge_path():
        return os.path.abspath(os.path.expanduser(GET_MERGE_PREFERENCES()))

    def is_enabled(self):
        # print("debug")
        return os.path.exists(self.get_smerge_path())
