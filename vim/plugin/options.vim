vim9script

# :help netrw
# g:loaded_netrw = 0
# g:loaded_netrwPlugin = 0

# don't open archive files
g:loaded_gzip = 0

g:php_special_functions = 0
g:go_highlight_functions = 1

# fzf
g:fzf_history_dir = '~/.fzf-history'

# :help bufexplorer
# WARNING: works correctly only with the option - set autoread
g:bufExplorerShowNoName = 1
#g:bufExplorerSortBy = "number"
g:bufExplorerSortBy = "mru"
g:bufExplorerShowRelativePath = 1
g:bufExplorerDisableDefaultKeyMapping = 1
g:bufExplorerShowTabBuffer = 0

# :help NERDTree
g:NERDTreeMouseMode = 2
g:NERDTreeWinSize = 40
g:NERDTreeMinimalUI = 0
g:NERDTreeShowHidden = 1
g:NERDTreeIgnore = []
g:NERDTreeDirArrows = 1
g:NERDTreeShowLineNumbers = 0
g:NERDTreeNodeDelimiter = "\u00a0"
g:NERDTreeRemoveFileCmd = "gio trash "
g:NERDTreeRemoveDirCmd = "gio trash "
g:NERDTreeHijackNetrw = 0

# easytree is a simple tree file manager
# g:easytree_show_hidden_files = 1
# g:easytree_git_indicators = {'Unmerged': '═', 'Untracked': '✭', 'Deleted': '✖', 'Ignored': '☒', 'Unknown': '?', 'Added': '✚', 'Modified': '✹', 'Renamed': '➜', 'Separator': '|', 'Unstaged': '✗', 'Staged': '✔︎', 'Copied': '➜', 'Branch': '*'}
# g:easytree_ignore_files = []
# g:easytree_auto_load_settings = 0

g:EasyMotion_smartcase = 1

# :help UltiSnips
g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]


# :help asyncrun
g:asyncrun_open = 8
g:asyncrun_save = 2


g:fugitive_dynamic_colors = 0
g:merginal_splitType = ''



g:goyo_width = 100
g:goyo_linenr = 0

# GoImportRun
g:goimports = 0

g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh', 'sql']


# lint
g:ale_lint_on_text_changed = 'never'
g:ale_lint_on_insert_leave = 0
g:ale_lint_on_enter = 1

# Only run linters named in ale_linters settings.
g:ale_linters_explicit = 1

# keep the sign gutter open
g:ale_sign_column_always = 0


g:php_cs_fixer_enable_default_mapping = 0
g:php_cs_fixer_rules = "@PSR12,@PhpCsFixer,@Symfony,array_syntax,array_indentation"
g:php_cs_fixer_php_path = "/usr/local/bin/php"
g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
command PhpCsFixerFixFile :call PhpCsFixerFixFile()

# translate-shell
g:trans_default_direction = "en:uk"
g:trans_directions_list = [
  ['en', 'uk'],
  ['uk', 'en'],
]

# LSP settings --------------------------------------------------
# g:lsp_auto_enable = 0
# g:lsp_diagnostics_signs_enabled = 0
# g:lsp_document_code_action_signs_enabled = 0
# g:lsp_diagnostics_virtual_text_enabled = 1
# g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
# g:lsp_inlay_hints_enabled = 1

# g:asyncomplete_min_chars = 2
# g:asyncomplete_popup_delay = 100


# see lib/custom.vim
# g:vdebug_options = {
#  'port': 9000,
#  'path_maps': {"remote_folder": "local_folder"}
# }

