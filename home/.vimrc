"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"
"
"
"
"                ╔══════════════════════════════════════════╗
"                ║           Created by Morgareth           ║
"                ║                                          ║
"                ║        Email:morgareth@tutanota.com      ║
"                ║                                          ║
"                ╚══════════════════════════════════════════╝

"Visual and generall settings
set shell=/bin/ksh "Sets the shell
set completeopt=longest,menuone
filetype plugin on "Enables the recognition files
filetype indent on
set tabstop=4
set smarttab " Autotabs for certain code
set shiftwidth=4
set magic "Enable regular expressions
set laststatus=2        " always show statusline
set ruler   "Ruler breaks
set wrap    "It allows navigation within a long line with j and k
set showcmd " Show me what I'm typing
set hlsearch " Highlight found searches
set lazyredraw "Redraw only when we need to.
set splitbelow " Split horizontal windows below to the current windows
set splitright " Split vertical windows right to the current windows
" Allow colours to work correctly, regardless of terminal
set t_Co=256
set t_ut=""
set termguicolors
set background=dark
syntax enable   "  Syntax highlighting
set nolinebreak
set showmatch  " highlight matching [{()}]
set number  "Show line numbers
set relativenumber
set updatetime=250
set cursorline
set showmode  " Show current mode.
set whichwrap=b,s,<,>,[,]
set title " Show title
set showtabline=2
set fillchars+=stl:\ ,stlnc:\
set cmdheight=2 "Height command bar
hi TabLineFill ctermfg=White ctermbg=Yellow
hi TabLine ctermfg=Blue ctermbg=Yellow

"Visual Gui

set guifont=PragmataPro\ for\ Powerline\ 9
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guiheadroom=0

" PEP8 indentation

augroup pep8
    au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
augroup END

"Format documents
autocmd FileType txt,txt2tags,markdown,textile set
  \ textwidth=78
  \ shiftwidth=2
  \ wrap
  \ wrapscan
  \ wrapmargin=78
  \ formatoptions+=t
  \ spell

autocmd FileType html,textile set
  \ wrapmargin=0
  \ textwidth=0

" Store backups under $HOME/.vim/backup
set backupdir=$HOME/.vim/backup
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

" Keep swap files under $HOME/.vim/swap
set directory=$HOME/.vim/swap/,.,$HOME/tmp,/tmp

" Errorformats
match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

augroup WhiteSpace
    autocmd FileWritePre    * :call TrimWhiteSpace()
    autocmd FileAppendPre   * :call TrimWhiteSpace()
    autocmd FilterWritePre  * :call TrimWhiteSpace()
    autocmd BufWritePre     * :call TrimWhiteSpace()
augroup END

augroup WhiteSpace1
    autocmd FileType python autocmd FileWritePre    * :call TrimWhiteSpace()
    autocmd FileType python autocmd FileAppendPre   * :call TrimWhiteSpace()
    autocmd FileType python autocmd FilterWritePre  * :call TrimWhiteSpace()
    autocmd FileType python autocmd BufWritePre     * :call TrimWhiteSpace()
augroup END

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

"Encoding
" Set default encoding to UTF-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set bomb
set binary
set ttyfast

"File handling

set autoread " Automatically reread changed files without asking me anything
set history=50
set noswapfile " Don't use swapfile

" Use modeline overrides
set modelines=10

"Handling
set backspace=indent,eol,start "Makes backspace key more powerful.
set clipboard=unnamedplus "Clipboard system
set foldlevel=99
set foldmethod=indent
set foldminlines=5
set foldcolumn=0
set ignorecase " Search case insensitive...
set smartcase
set incsearch " Shows the match while typing
set writebackup "  Do keep a backup while working
set backupcopy=yes "Keep attributes of original file
set startofline "It allows you to change the column when moving through the line
set showmatch "Every time you close a parenthesis, bracket or brace, Vi shows where it was opened. If there is no  pair.

"Spell pt_BR
"set spell spelllang=pt

"hi SpellCap ctermfg=Gray ctermbg=Blue
"hi SpellBad ctermfg=Gray ctermbg=DarkRed

let g:mapleader = ','

"Shortcuts
nnoremap <C-Delete> :tabclose<CR>
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

"Save,exit and quit

inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

"split navigations
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>

"Save session
nnoremap <leader>s :mksession<CR>

" Toggling the display of a widget
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Completion Menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Return to last edit position when opening files
augroup last
    autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
\ endif
augroup END

"Completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"Scrolling
"Start scrolling when we're 8 lines away from  margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

augroup Shebang
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8  -*-\<nl># Author: Morgareth <morgareth@tutanota.com>\"|$
    autocmd BufNewFile *.pl 0put =\"#!/usr/bin/env perl\<nl># -*- coding: None -*-\<nl># Author: Morgareth <morgareth@tutanota.com>\"|$
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl># -*- coding: None -*-\<nl># Author: Morgareth <morgareth@tutanota.com>\"|$
augroup END

" Plugins
call plug#begin('~/.vim/plugged')

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'dense-analysis/ale'

Plug 'Yggdroot/indentLine'

Plug 'ervandew/supertab'

Plug 'itchyny/lightline.vim'

Plug 'ayu-theme/ayu-vim'

Plug 'sheerun/vim-polyglot'

Plug 'arcticicestudio/nord-vim'

  " Initialize plugin system
call plug#end()

colorscheme nord  " colorscheme from plugin
"let ayucolor="dark"



"Settings for Lightline

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" Settings for Vim-gitgutter

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=237
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

"Settings for  ale (Asynchronous Lint Engine)

let g:ale_sign_column_always = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:airline#extensions#ale#enabled = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Settings for Tagbar
nmap <silent> <leader>b :TagbarToggle<CR>

" Settings for indentLine
"let g:indentLine_color_term = 197
"let g:indentLine_char = '│'

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Settings for Vim-Supertab
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

