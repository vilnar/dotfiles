import sublime
import sublime_plugin
import subprocess
from shutil import copyfile
import os
import webbrowser


PLUGIN_PATH = "User/markdown.py"
DEFAULT_TEMP_DIR = "/tmp/markdown_to_html/"
MARKDOWN_FILETYPES = ['.md', '.markdown', '.mdown']

def is_markdown(view):
    file_path = view.file_name()
    return file_path is not None and file_path.endswith(tuple(MARKDOWN_FILETYPES))

def get_temp_preview_path(view):
    tmp_dir = DEFAULT_TEMP_DIR
    if not os.path.isdir(tmp_dir):
        os.makedirs(tmp_dir)

    html = '{}.html'.format(view.id())
    fullpath = os.path.join(tmp_dir, html)
    return fullpath

class MarkdownViewHtmlCommand(sublime_plugin.TextCommand):
    def run(self, edit, target='browser'):

        file_path = self.view.file_name()

        tmp_html_path = get_temp_preview_path(self.view)
        pp = subprocess.run(
            'pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o {} {}'.format(tmp_html_path, file_path),
            shell=True,
            capture_output=False
        )
        if pp.returncode != 0:
            print("{} Pandoc failed. Error: {}".format(PLUGIN_PATH, pp.stderr))
            self.view.window().run_command("show_panel", args={'panel': 'console'})
            return

        if target == 'browser':
            webbrowser.open_new_tab("file://" + tmp_html_path)
            # fp = subprocess.run(
            #     "firefox {} > /dev/null 2> /dev/null&".format(tmp_html_path),
            #     shell=True,
            #     capture_output=False
            # )
            # if fp.returncode != 0:
            #     print("{} Firefox failed. Error: {}".format(PLUGIN_PATH, fp.stderr))
            #     self.view.window().run_command("show_panel", args={'panel': 'console'})
            #     return

        self.view.window().status_message("MarkdownViewHtml done!")

    def is_enabled(self):
        return is_markdown(self.view)

class MarkdownViewHtmlListener(sublime_plugin.EventListener):

    def on_post_save(self, view):
        if is_markdown(view):
            html = get_temp_preview_path(view)
            if os.path.isfile(html):
                # re-execute markdown conversion
                # TODO: check if browser still opened and reopen it if needed
                view.run_command('markdown_view_html', {'target': 'disk'})
                print('{} User/markdown.py updated file: {}'.format(PLUGIN_PATH, html))

    def on_close(self, view):
        if is_markdown(view):
            html = get_temp_preview_path(view)
            if os.path.isfile(html):
                os.remove(html)
                print("{} User/markdown.py remove file: {}".format(PLUGIN_PATH, html))
                return
