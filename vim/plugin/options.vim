vim9script

# :help netrw
# g:loaded_netrw = 0
# g:loaded_netrwPlugin = 0

# don't open archive files
g:loaded_gzip = 0

# fzf
g:fzf_history_dir = '~/.fzf-history'
g:fzf_buffer_tags_is_sort = false


g:enable_fuzzyy_keymaps = 0
g:files_respect_gitignore = 0
g:fuzzyy_devicons = 0

## :help bufexplorer
## WARNING: works correctly only with the option - autoread
# noticed delays if the file is updated very often
set autoread

g:fern#default_hidden = 1

var options = {
    completor: { shuffleEqualPriority: true, postfixHighlight: true },
    buffer: { enable: true, priority: 10, urlComplete: true, envComplete: true },
    abbrev: { enable: true, priority: 10 },
    lsp: { enable: false},
    omnifunc: { enable: false },
    vsnip: { enable: false },
    vimscript: { enable: true, priority: 11 },
    ngram: { enable: false },
}
autocmd VimEnter * g:VimCompleteOptionsSet(options)


g:bufExplorerShowNoName = 1
g:bufExplorerSortBy = "mru"
g:bufExplorerShowRelativePath = 1
g:bufExplorerDisableDefaultKeyMapping = 1
g:bufExplorerShowTabBuffer = 0
g:bufExplorerShowUnlisted = 0
g:bufExplorerFindActive = 1

# g:buffergator_suppress_keymaps = 1
# g:buffergator_viewport_split_policy = "n"
# g:buffergator_sort_regime = "mru"


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
if has("win32")
  g:NERDTreeRemoveFileCmd = "recycle-bin "
  g:NERDTreeRemoveDirCmd = "recycle-bin "
endif
g:NERDTreeHijackNetrw = 0

# easytree is a simple tree file manager
# g:easytree_show_hidden_files = 1
# g:easytree_git_indicators = {'Unmerged': '═', 'Untracked': '✭', 'Deleted': '✖', 'Ignored': '☒', 'Unknown': '?', 'Added': '✚', 'Modified': '✹', 'Renamed': '➜', 'Separator': '|', 'Unstaged': '✗', 'Staged': '✔︎', 'Copied': '➜', 'Branch': '*'}
# g:easytree_ignore_files = []
# g:easytree_auto_load_settings = 0


# :help UltiSnips
g:UltiSnipsSnippetDirectories = ["UltiSnips", "customsnippets"]


# :help asyncrun
g:asyncrun_open = 8
g:asyncrun_save = 2


g:fugitive_dynamic_colors = 0
g:merginal_splitType = ''


g:goyo_width = 100
g:goyo_linenr = 0


g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


g:translate#default_languages = {
  'en': 'uk',
  'uk': 'en'
}
