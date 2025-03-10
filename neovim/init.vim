" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

"------------------------- PLUG -----------------------------------------------
call plug#begin()

Plug 'airblade/vim-gitgutter'  " show colorful markers for git diff
Plug 'tpope/vim-fugitive'      " plugin for working with git directly from NeoVim
Plug 'mileszs/ack.vim'         " a grep like tool for working from NeoVim
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " FZF is a tool for searching files
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdcommenter'        " better comments
Plug 'Raimondi/delimitMate'            " automatic closing of quotes, parenthesis, brackets, etc
Plug 'kshenoy/vim-signature'           " plugin to place, toggle and display marks.

" Colorscheme plugins
"Plug 'crusoexia/vim-monokai'
"Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'joshdick/onedark.vim/'

Plug 'henrik/vim-indexed-search'
"Plug 'vimwiki/vimwiki'

"let g:ale_completion_enabled = 1
"Plug 'w0rp/ale'                     " plugin for providing linting

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommended)

Plug 'mhinz/vim-startify'   "a fancy start for the NeoVim session"
call plug#end() 
"------------------------------------------------------------------------------


" basic configurations
set nocompatible
set encoding=utf8
set fileformat=unix
set ruler  " always show cursor position
set nowrap
set mouse=a


"set foldmethod=manual
set foldlevel=1
set foldnestmax=1

" wrap long lines
"set linebreak

set smartindent
set autoindent

set shiftwidth=4
set smarttab
set expandtab
set tabstop=4
set softtabstop=4

set scrolloff=5

" search and highlightning
set hlsearch
set incsearch
set ignorecase

" no backup
set nobackup
set noswapfile
set nowritebackup

set autowrite

" working with system clipboard
set clipboard+=unnamed
set clipboard=unnamedplus

" activate 256 colors in terminal
set termguicolors
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }


syntax on
filetype plugin indent on

"let g:monokai_thick_border = 1
"set background=dark

colorscheme onedark
"colorscheme monokai

" splits
set splitbelow " open splits below
set splitright  " open splits to the right

nnoremap <left> :vertical resize +1<cr>
nnoremap <right> :vertical resize -1<cr>
nnoremap <up> :resize +1<cr>
nnoremap <down> :resize -1<cr>


" Shortcuts and configs for plugins

silent! map <C-d> :TagbarToggle<CR>

noremap <A-h> :nohl<cr>

" map jumping to previous buffer (Ctrl-6) to Backspace
map <BS> :bprev<Return>


" highlight the line number where cursor is on
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=BOLD
set cursorline

" C++ features
" switch between c++ header file and class file (works if header and cpp are
" in the same directory)
"nnoremap <Space>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" set path for using with gf
"let &path.="/src/include,/usr/include/AL,/usr/include/c++/7,"
"set path+=/home/qp/Projects/ns-3.29/build/ 

" Ack and Ag plugin configuration
let g:ackprg = 'ag --column --nocolor --nogroup'
nnoremap <Leader>a :Ag<Space>

"let g:ackhighlight = 1
let g:ack_autoclose = 1


" FZF plugin configuration
cnoreabbrev fzf FZF
"nnoremap <Leader>f :FZF<cr>

" compile only current C++ file with Ctrl+F9
"noremap <silent> <F33> :!clear<CR> :!g++ -Wall -std=c++11 % -o %< && ./%< <cr>
"noremap <silent> <F33> :!clear<CR> :!g++ -std=c++11 -pthread % -o %< && ./%< <cr>

" compile only current C file with Ctrl+F9
"noremap <silent> <F33> :!clear<CR> :!gcc -Wall -std=c11 % -o %< && ./%< <cr>

" run current C or C++ file with Ctrl+F10
"noremap <silent> <F34> :!clear<cr> :!./%< <cr>


" Ctrl + F11 : compile with waf
"noremap <silent> <F35> :!/home/qp/Projects/ns-3.29/waf<cr>
"

" Ctrl + F9 : run a C++ or python script
"noremap <silent> <F35> :!/home/qp/Projects/ns-3.29/waf<cr>
"autocmd FileType python nnoremap <buffer> <F33> :exec '!python3' shellescape(@%, 1)<cr>
"autocmd FileType cpp nnoremap <buffer> <F33> :!clear<CR> :!g++ -std=c++11 -pthread % -o %< && ./%< <cr>
"autocmd FileType java nnoremap <buffer> <F33> :!javac % && java %< <cr>

" Ctrl + F12 : run with waf
"noremap <silent> <F36> :!/home/qp/Projects/ns-3.29/waf --run %< <cr>

"let g:gitgutter_async = 0
let g:gitgutter_sign_removed_first_line = '^'

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_modified_removed ='█'

" vim-gitgutter : set update time to 100ms
set updatetime=10


map <F3> :bprevious<CR>
map <F4> :bnext<CR>
nnoremap <F2> :buffers<CR>:buffer<Space>

tnoremap <Esc> <C-\><C-n>:q!<CR>


set number
set nostartofline


let g:argwrap_wrap_closing_brace = 0

" Custom mappings
" ---------------------------------------------------------------------------
" write all files and exit on double space
nnoremap <leader><leader> :xa<cr>
nnoremap cc :call NERDComment(0,"toggle")<cr>
vnoremap cc :call NERDComment(0,"toggle")<cr>
"nnoremap cc :call NERDComment(0,"invert")<cr>
"vnoremap cc :call NERDComment(0,"invert")<cr>

map Q :qa<CR>
map W :xa<CR>

" map leader (default = Backslash) to Space
let mapleader = "\<Space>"


" ---------------------------------------------------------------------------

"use plugin fzf to get MRU files
map <c-p> :History<CR>

let g:fzf_layout = {'window': 'rightbelow new'}

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Operator'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Error'],
  \ 'marker':  ['fg', 'Operator'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" remove fzf status line
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" remove netrw help banner
let g:netrw_banner = 0
" set tree view
let g:netrw_liststyle = 3
" call netrw in vertical split
map <c-n> :Vex<CR>

" vimwiki configuration ----------------------------------------------------------------------------------------------------

" vimwiki header colors
hi VimwikiHeader1 guifg=#ea175a
hi VimwikiHeader2 guifg=#f78cab
hi VimwikiHeader3 guifg=#7dcfed
hi VimwikiHeader4 guifg=#5bef5b
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00


let g:vimwiki_list = [{'auto_tags': 1}]

autocmd FileType markdown let g:indentLine_enabled=0
let g:vimwiki_url_maxsave = 0

let wiki = {}
"let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
"let g:vimwiki_list = [wiki]
let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

" redifine bold to color of Operator-Group in Vimwiki (red color)
" see :hi for colors and https://github.com/vimwiki/vimwiki/issues/116
"hi def link VimwikiBold Operator
"hi def link VimwikiBold CursorLineNr
hi VimwikiBold guifg=#f08787
"hi VimwikiItalic guifg=#b588c9
"hi VimwikiItalic guifg=#93ccd6 #a1d9e2
hi VimwikiItalic guifg=#ce8ce2

"let g:vimwiki_folding='syntax'
let g:vimwiki_folding='expr'

"hi def link VimwikiLinkT VimwikiLink
"hi VimwikiLink guifg=#80a0ff gui=bold
hi VimwikiLink guifg=#80a0ff 

let g:vimwiki_hl_cb_checked = 2

" end of vimwiki configuration ----------------------------------------------------------------------------------------------------

" timestamps : current date and current time
nmap <silent> <F5> i<C-R>=strftime("%H:%M")<CR><Esc>
imap <silent> <F5> <C-R>=strftime("%H:%M")<CR>

nmap <silent> <F6> i<C-R>=strftime("%a %d-%m-%Y")<CR><Esc>
imap <silent> <F6> <C-R>=strftime("%a %d-%m-%Y")<CR>


" map alt+j, alt+k to move line up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" call fzf from current dir
"map ; :Files<CR>


let g:ale_list_window_size = 5

set wildmenu
set wildmode=longest:full,full

set completeopt=menu,longest,menuone

"---------------- MONOKAI MENU ---------------------------
"highlight Pmenu guibg=gray guifg=black
"highlight PmenuSel guibg=white guifg=gray
"---------------------------------------------------------

" ------------------------------- :call GetSyntax() to get current hi group
function! GetSyntaxID()
    return synID(line('.'), col('.'), 1)
endfunction

function! GetSyntaxParentID()
    return synIDtrans(GetSyntaxID())
endfunction

function! GetSyntax()
    echo synIDattr(GetSyntaxID(), 'name')
    exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction
"-------------------------------------------------------------------------

"augroup VimDiff
  "autocmd!
  "autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
"augroup END

set noshowmode   " don't show current vim mode in the status line

set formatoptions=croql " repeat commenting for a new line 
"set colorcolumn=80


" remap moving between splits to Control+<direction>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


set fillchars=fold:\     " remove ugly dashed line in folds
"hi Folded guifg=#31A8CF
hi Folded guifg=#629B4B  " change foreground color of fold name

" Toggle 80 column marker
nnoremap <A-l> :call ToggleColorColumn()<CR>
"
func! ToggleColorColumn()
    if exists("b:colorcolumnon") && b:colorcolumnon
        let b:colorcolumnon = 0
        exec ':set colorcolumn=0'
        echo ''
"         echo '80 column marker off'
    else
        let b:colorcolumnon = 1
        exec ':set colorcolumn=80'
        echo ''
"         echo '80 column marker on'
    endif
endfunc


let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'}, {'s': '~/session.vim'}]
nnoremap <A-s> :Startify<CR>


" statusline configs " ---------------------------------------------------------
"set laststatus=2

" status line color
"hi StatusLine   guifg=#46F352 guibg=#1A181A gui=bold
hi StatusLine   guifg=#46F352 guibg=#201D20 gui=none
hi StatusLineNC guifg=#FFFFFF guibg=#201D20 gui=none

" Formats the statusline
"hi User1 guibg=#3a3a3a guifg=pink

"set laststatus=2
set statusline=
"set statusline+=\      " place a whitespace 
"set statusline+=%#PmenuSel#
"set statusline+=%#Keyword#
"set statusline+=%1*  " use colors defined in User1

"set statusline +=%{fugitive#statusline()}
"set statusline+=%*       "switch back to normal statusline highlight
set statusline+=\ \ %f
set statusline+=\ %m
set statusline+=\ %r

set statusline+=\ %=                        " align left
set statusline+=%p%%            " line X of Y [percent of file]

set statusline+=\ 
" ------------------------------------------------------------------------------


" search color" ----------------------------------------------------------------
highlight IncSearch guibg=#B1DFE0 guifg=black 
highlight Search guibg=#B1DFE0 guifg=black 
" ------------------------------------------------------------------------------

" redesign highlighting of Diff-Groups, 'cause it's ugly made in onedark 
" color scheme
if &diff
    "highlight! link DiffText MatchParen
    "highlight! link DiffText DiffChange
    highlight! link DiffChange WarningMsg
endif


" open all folds
nnoremap <Space><Space> zR

" type "sw" to swap current and next word
nnoremap sw hdeep

" some useful configs for handling vim sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds


" set color for marks
hi mark_color guifg=#46F352 gui=bold
let g:SignatureMarkTextHL = "mark_color"

" open file under sursor in vertical split with Ctrl + wf
nnoremap <C-W>f <C-W>v gf
vnoremap <C-W>f <C-W>v gf

hi Todo guifg=red gui=bold

" map Control + W + b to open a horizontal split
nnoremap <C-W>b :sp<CR>
