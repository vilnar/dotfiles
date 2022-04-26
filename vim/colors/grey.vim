vim9script

# Name:             Grey
# Description:      Transfer colorscheme https://gitlab.com/yorickpeterse/nvim-grey.git to vim9script
# Original author:  Yorick Peterse <yorick@yorickpeterse.com>

set background=light

highlight clear

if exists('g:syntax_on')
  syntax reset
endif

g:colors_name = 'grey'

# Available colors
var available_colors = {
  'background': '#f2f2f2',
  'black': '#000000',
  'blue': '#1e6fcc',
  'green': '#216609',
  'lgreen': '#dfeacc',
  'lred': '#f2d3cd',
  'red': '#cc3e28',
  'grey': '#777777',
  'dgrey': '#555555',
  'lgrey1': '#dddddd',
  'lgrey2': '#eaeaea',
  'lgrey3': '#aaaaaa',
  'lgrey4': '#eeeeee',
  'yellow': '#bf8f00',
  'lyellow1': '#f9e595',
  'lyellow2': '#f9efc7',
  'orange': '#a55000',
  'purple': '#5c21a5',
  'white': '#ffffff',
  'cyan': '#158c86',
  }

g:terminal_ansi_colors = [
  available_colors['black'],
  available_colors['red'],
  available_colors['green'],
  available_colors['yellow'],
  available_colors['blue'],
  available_colors['purple'],
  available_colors['cyan'],
  available_colors['lgrey3'],
  available_colors['dgrey'],
  available_colors['red'],
  available_colors['green'],
  available_colors['yellow'],
  available_colors['blue'],
  available_colors['purple'],
  available_colors['cyan'],
  available_colors['lgrey3']
  ]





# Function for creating a highlight group
#
# We use this function so we can use variables in our highlight groups, instead
# of having to repeat the same color codes in a bunch of places.
def Hi(group: string, fg_name: string, bg_name: string, gui: string, sp_name = 'NONE')
  var fg = fg_name
  if fg_name != 'NONE'
    fg = available_colors[fg_name]
  endif

  var bg = bg_name
  if bg_name != 'NONE'
    bg = available_colors[bg_name]
  endif

  var style = gui
  if empty(gui)
    style = 'NONE'
  endif
  
  var sp = sp_name
  if sp_name != 'NONE'
    sp = available_colors[sp_name]
  endif

  exe 'highlight ' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg .. ' gui=' .. style .. ' guisp=' .. sp .. ' cterm=' .. style
enddef

# A temporary command is used to make it easier/less verbose to define highlight
# groups. This command is removed at the end of this file.
command -nargs=+ Hi call Hi(<f-args>)




# Set up all highlight groups.
#
# We use the custom Hi command for this. The syntax of this command is as
# follows:
#
#     Hi NAME FG BG GUI GUISP
#
# Where NAME is the highlight name, FG the foreground color, BG the background
# color, and GUI the settings for the `gui` option (e.g. bold). Since Hi is a
# command and not a function, quotes shouldn't be used. To refer to a color,
# simply use its name (e.g. "black").

# Generic highlight groups
Hi ColorColumn NONE lgrey4 NONE
Hi Comment grey NONE NONE
Hi Conceal NONE NONE NONE
Hi Constant black NONE NONE
Hi Cursor white black NONE
Hi CursorLine NONE lgrey4 NONE
Hi CursorLineNR black NONE bold
Hi Directory purple NONE NONE
Hi EndOfBuffer lgrey3 NONE NONE
Hi ErrorMsg red NONE bold
Hi FoldColumn black lgrey1 NONE
Hi Identifier black NONE NONE
Hi Include black NONE bold
Hi InstanceVariable purple NONE NONE
Hi Keyword black NONE bold
Hi LineNr black NONE NONE
Hi Macro orange NONE NONE
Hi MatchParen black cyan bold
Hi MoreMsg black NONE NONE
Hi NonText lgrey3 NONE NONE
Hi Normal black background NONE
Hi NormalFloat black background NONE
Hi Bold black NONE bold
Hi Number blue NONE NONE
Hi Operator black NONE NONE
Hi Pmenu black lgrey2 NONE
Hi PmenuSbar NONE lgrey2 NONE
Hi PmenuSel black lgrey1 bold
Hi PreProc black NONE NONE
Hi Question black NONE NONE
Hi QuickFixLine NONE lgrey2 bold
Hi Regexp orange NONE NONE
Hi Search NONE lyellow1 NONE
Hi IncSearch black orange NONE
Hi Special black NONE NONE
Hi SpellBad red NONE bold,undercurl
Hi SpellCap purple NONE undercurl
Hi SpellLocal green NONE undercurl
Hi SpellRare purple NONE undercurl
Hi StatusLine black lgrey1 NONE
Hi StatusLineNC black lgrey4 NONE
Hi String green NONE NONE
Hi Symbol orange NONE NONE
Hi TabLine dgrey lgrey1 NONE
Hi TabLineFill black lgrey1 NONE
Hi TabLineSel black background bold
Hi Title black NONE bold
Hi Todo grey NONE bold
Hi VertSplit grey NONE NONE
Hi WarningMsg yellow NONE bold
Hi Underlined NONE NONE underline
Hi Visual NONE lgrey1 NONE


Hi Boolean black NONE bold
Hi Character green NONE NONE
Hi Error red NONE bold
Hi Folded grey NONE NONE
Hi Label black NONE bold
Hi PmenuThumb black lgrey1 bold
Hi PreCondit orange NONE NONE
Hi SignColumn lgrey1 background NONE
Hi SpecialKey blue NONE NONE
Hi Statement black NONE bold
Hi StorageClass black NONE bold
Hi Type black NONE bold
Hi WildMenu black lgrey1 bold
Hi Function black NONE NONE

# These highlight groups can be used for statuslines, for example when
# displaying ALE warnings and errors.
Hi BlackOnLightYellow black lyellow1 NONE
Hi LightRedBackground NONE lred NONE
Hi WhiteOnBlue white blue NONE
Hi WhiteOnOrange white orange NONE
Hi WhiteOnRed white red NONE
Hi WhiteOnYellow white yellow NONE
Hi Yellow yellow NONE bold

# ALE
Hi ALEError red NONE bold
Hi ALEErrorSign red NONE bold
Hi ALEWarning yellow NONE bold
Hi ALEWarningSign yellow NONE bold

# CSS
highlight link cssClassName Keyword
highlight link cssColor Number
highlight link cssIdentifier Keyword
highlight link cssImportant Keyword
highlight link cssProp Identifier
highlight link cssTagName Keyword

# Diffs
Hi DiffAdd NONE lgreen NONE
Hi DiffChange NONE NONE NONE
Hi DiffDelete red NONE NONE
Hi DiffText NONE lyellow2 NONE
Hi diffFile black NONE bold
Hi diffLine blue NONE NONE
Hi diffAdded NONE lgreen NONE
Hi diffChanged NONE NONE NONE
Hi diffRemoved red NONE NONE
Hi dotKeyChar black NONE NONE

# Fugitive
Hi FugitiveblameTime blue NONE NONE
Hi FugitiveblameHash purple NONE NONE
highlight link gitCommitOverflow ErrorMsg
highlight link gitCommitSummary String

# HAML
Hi hamlClass black NONE NONE
Hi hamlId black NONE NONE
Hi hamlTag black NONE bold
highlight link hamlDocType Comment

# HTML
Hi htmlTag black NONE bold
highlight link htmlArg Identifier
highlight link htmlLink Directory
highlight link htmlScriptTag htmlTag
highlight link htmlSpecialTagName htmlTag
highlight link htmlTagName htmlTag

# Inko
Hi inkoCommentBold grey NONE bold
Hi inkoCommentItalic grey NONE italic
Hi inkoCommentTitle grey NONE bold
highlight link inkoCommentInlineUrl Number
highlight link inkoInstanceVariable InstanceVariable
highlight link inkoKeywordArgument Regexp

# Java
highlight link javaAnnotation Directory
highlight link javaCommentTitle javaComment
highlight link javaDocParam Todo
highlight link javaDocTags Todo
highlight link javaExternal Keyword
highlight link javaStorageClass Keyword

# Javascript
highlight link JavaScriptNumber Number
highlight link javaScriptBraces Operator
highlight link javaScriptFunction Keyword
highlight link javaScriptIdentifier Keyword
highlight link javaScriptMember Identifier

# JSON
highlight link jsonKeyword String

# Lua
highlight link luaFunction Keyword

# LSP
Hi LspDiagnosticsUnderlineError NONE NONE undercurl red
Hi LspDiagnosticsUnderlineWarning NONE NONE undercurl yellow

# Make
highlight link makeTarget Function

# Markdown
highlight link markdownCode markdownCodeBlock
highlight link markdownCodeBlock String
highlight link markdownListMarker Keyword
highlight link markdownOrderedListMarker Keyword

# netrw
highlight link netrwClassify Identifier

# Perl
highlight link perlPackageDecl Identifier
highlight link perlStatementInclude Statement
highlight link perlStatementPackage Statement
highlight link podCmdText Todo
highlight link podCommand Comment
highlight link podVerbatimLine Todo

# Ruby
highlight link rubyAttribute Identifier
highlight link rubyClass Keyword
highlight link rubyClassVariable rubyInstancevariable
highlight link rubyConstant Constant
highlight link rubyDefine Keyword
highlight link rubyFunction Function
highlight link rubyInstanceVariable InstanceVariable
highlight link rubyMacro Identifier
highlight link rubyModule rubyClass
highlight link rubyRegexp Regexp
highlight link rubyRegexpCharClass Regexp
highlight link rubyRegexpDelimiter Regexp
highlight link rubyRegexpQuantifier Regexp
highlight link rubyRegexpSpecial Regexp
highlight link rubyStringDelimiter String
highlight link rubySymbol Regexp

# Rust
highlight link rustCommentBlockDoc Comment
highlight link rustCommentLineDoc Comment
highlight link rustFuncCall Identifier
highlight link rustModPath Identifier

# Python
highlight link pythonOperator Keyword

# SASS
highlight link sassClass cssClassName
highlight link sassId cssIdentifier

# Shell
highlight link shFunctionKey Keyword

# SQL
highlight link sqlKeyword Keyword

# Typescript
highlight link typescriptBraces Operator
highlight link typescriptEndColons Operator
highlight link typescriptExceptions Keyword
highlight link typescriptFuncKeyword Keyword
highlight link typescriptFunction Function
highlight link typescriptIdentifier Identifier
highlight link typescriptLogicSymbols Operator

# Vimscript
highlight link VimCommentTitle Todo
highlight link VimIsCommand Constant
highlight link vimGroup Constant
highlight link vimHiGroup Constant

# XML
highlight link xmlAttrib Identifier
highlight link xmlTag Identifier
highlight link xmlTagName Identifier

# YAML
highlight link yamlPlainScalar String

# YARD
highlight link yardComment Comment
highlight link yardType Todo
highlight link yardTypeList Todo

# FZF
g:fzf_colors = {
  'fg':      ['fg', 'Normal'],                                                           
  'bg':      ['bg', 'Normal'],                                                           
  'hl':      ['fg', 'Comment'],                                                          
  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],                             
  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],                                       
  'hl+':     ['fg', 'Directory'],                                                        
  'info':    ['fg', 'PreProc'],                                                          
  'border':  ['fg', 'Ignore'],                                                           
  'prompt':  ['fg', 'Conditional'],                                                      
  'pointer': ['fg', 'Exception'],                                                        
  'marker':  ['fg', 'Keyword'],                                                          
  'spinner': ['fg', 'Label'],                                                            
  'header':  ['fg', 'Comment']
  } 
