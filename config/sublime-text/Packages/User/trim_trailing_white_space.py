import re
import sublime
import sublime_plugin


def selections(view, default_to_all=True):
    regions = []
    for r in view.sel():
        if not r.empty():
            regions.append(r)

    if not regions and default_to_all:
        regions = [sublime.Region(0, view.size())]
    return regions

class TrimTrailingWhiteSpaceCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        view = self.view
        has_matches = False
        reobj = re.compile('[\t ]+$', re.MULTILINE)

        for region in selections(view, False):
            str_buffer = view.substr(region)
            trimmed = reobj.sub('', str_buffer)
            if str_buffer != trimmed:
                view.replace(edit, region, trimmed)
                has_matches = True

        if has_matches is True:
            sublime.set_timeout(lambda: sublime.status_message('Trimmer: leading whitespace removed.'), 0)
        else:
            sublime.set_timeout(lambda: sublime.status_message('Trimmer: no leading whitespace to remove.'), 0)

