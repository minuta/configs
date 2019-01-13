
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" C++ plugins
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'bfrg/vim-cpp-modern'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'kshenoy/vim-signature'

" colorschemas
Plug 'crusoexia/vim-monokai'
Plug 'joshdick/onedark.vim/'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'henrik/vim-indexed-search'
Plug 'FooSoft/vim-argwrap'
Plug 'mhinz/vim-startify'

Plug 'vimwiki/vimwiki'

" Asynchronous linting/fixing for Vim
"
"" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"if has('nvim')
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
  "Plug 'Shougo/deoplete.nvim'
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

call plug#end() 


" basic configurations
set nocompatible
set encoding=utf8
set fileformat=unix
set ruler  " always show cursor position
set nowrap
set mouse=a


set foldmethod=manual
set foldlevel=2

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

"let MRU_Use_Current_Window = 1
"let MRU_Window_Height = 15


" syntax and theme
syntax on
filetype plugin indent on
"colorscheme onedark
colorscheme monokai
"colorscheme gruvbox
set background=dark
let g:monokai_thick_border = 1

" splits
set splitbelow " open splits below
set splitright  " open splits to the right

"nnoremap <left> :vertical resize +1<cr>
"nnoremap <right> :vertical resize -1<cr>
"nnoremap <up> :resize +1<cr>
"nnoremap <down> :resize -1<cr>


" Shortcuts and configs for plugins
"silent! map <C-m> :MRU<CR>

"let g:NERDTreeWinPos = "left"
"let NERDTreeIgnore=['\.o$', '\~$'] "ignore files in NERDTree
"map <C-n> :NERDTreeToggle<CR>

silent! map <C-d> :TagbarToggle<CR>

map <C-h> :nohl<cr>

" map jumping to previous buffer (Ctrl-6) to Backspace
map <BS> :bprev<Return>


" highlight the line number where cursor is on
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" status line
"hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
"hi StatusLineNC ctermfg=7 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none


" C++ features
" switch between c++ header file and class file (works if header and cpp are
" in the same directory)
nnoremap <Space>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" configuration of plugin Fswitch
au! BufEnter *.cpp,*.cc,*.c let b:fswitchdst = 'h,hpp'    | let b:fswitchlocs = 'reg:/src/include/,../include,./'
au! BufEnter *.h,*.hpp      let b:fswitchdst = 'cpp,cc,c' | let b:fswitchlocs = 'reg:/include/src/,../src,./'
nmap <silent> <Leader>s :FSHere<cr>

" set path for using with gf
let &path.="/src/include,/usr/include/AL,/usr/include/c++/7,"
set path+=/home/qp/Projects/ns-3.29/build/ 

" Ack and Ag plugin configuration
let g:ackprg = 'ag --column --nocolor --nogroup'
"cnoreabbrev Ack Ack!
"cnoreabbrev ack Ack! 
nnoremap <Leader>a :Ag<Space>

"let g:ackhighlight = 1
let g:ack_autoclose = 1


" FZF plugin configuration
cnoreabbrev fzf FZF
nnoremap <Leader>f :FZF<cr>

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


" compile all C++ files
"noremap <silent> <C-F9> :!g++ -Wall -std=c++11 -g *.cc && ./a.out<cr>

" compile only current C++ file with Ctrl+F9
"noremap <silent> <F33> :!clear<CR> :!g++ -Wall -std=c++11 % -o %< && ./%< <cr>
noremap <silent> <F33> :!clear<CR> :!g++ -std=c++11 -pthread % -o %< && ./%< <cr>

" compile only current C file with Ctrl+F9
"noremap <silent> <F33> :!clear<CR> :!gcc -Wall -std=c11 % -o %< && ./%< <cr>
"noremap <silent> <F33> :!clear<cr> :!gcc -Wall -std=c11 % -o %< && ./%< <cr>

" run current C or C++ file with Ctrl+F10
noremap <silent> <F34> :!clear<cr> :!./%< <cr>


" Ctrl + F11 : compile with waf
noremap <silent> <F35> :!/home/qp/Projects/ns-3.29/waf<cr>

" Ctrl + F12 : run with waf
noremap <silent> <F36> :!/home/qp/Projects/ns-3.29/waf --run %< <cr>

let g:gitgutter_sign_removed_first_line = "^_"
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | GitGutterDisable | endif
augroup END


map <F3> :bprevious<CR>
map <F4> :bnext<CR>
nnoremap <F2> :buffers<CR>:buffer<Space>

tnoremap <Esc> <C-\><C-n>:q!<CR>

" \   'left': [ [ 'mode', 'paste' ],

let g:lightline = { 'colorscheme': 'jellybeans' }
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ ['lineinfo'], ['percent'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \  'colorscheme': 'jellybeans' 
      \ }
set noshowmode   " don't show current vim mode in the status line

"augroup AutoSaveFolds
  "autocmd!
  "autocmd BufWinLeave * mkview
  "autocmd BufWinEnter * silent! loadview
"augroup END

set number
set nostartofline


" Latex shortcuts

"autocmd FileType tex map <F33> :w<CR>:!pdflatex "%"<CR>:!xreader "%:r".pdf<CR>
"autocmd FileType tex map <F33> :cd ~/Dropbox/Thesis/Script <CR>:!latexmk -pdf -pvc <CR>
" compile latex, make a pdf and open this pdf (Ctrl + F9)
autocmd FileType tex map <F33> :cd ~/Projects/my-github-repos/thesis-script <CR>:!make <CR>

" vim-gitgutter : set update time to 100ms
set updatetime=100 

let g:argwrap_wrap_closing_brace = 0

" open last edited file automatically (else use startify plugin)
"autocmd VimEnter * nested
      "\  if argc() == 0
      "\|   let last = filter(filter(copy(v:oldfiles), 'match(v:val, getcwd()) == 0'), 'filereadable(v:val)')
      "\|   if !empty(last)
      "\|     execute 'edit' fnameescape(last[0])
      "\|   endif
      "\| endif

" Custom mappings
" ---------------------------------------------------------------------------
" write all files and exit on double space
nnoremap <leader><leader> :xa<cr>
"nnoremap cc :call NERDComment(0,"toggle")<cr>
nnoremap cc :call NERDComment(0,"invert")<cr>

map Q :qa<CR>
map W :xa<CR>
imap hj <Esc>

" map leader (default = Backslash) to Space
let mapleader = "\<Space>"


" ---------------------------------------------------------------------------

"let g:gitgutter_highlight_lines = 1
"
"let g:ctrlp_map='<c-p>'
"let g:ctrlp_cmd = 'CtrlPMRU'

"use plugin fzf to get MRU files
map <c-p> :History<CR>

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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

" timestamp
nmap <F5> i<C-R>=strftime("%a %d-%m-%Y %H:%M")<CR><Esc>
imap <F5> <C-R>=strftime("%a %d-%m-%Y %H:%M")<CR>

nmap <F6> i<C-R>=strftime("%H:%M")<CR><Esc>
imap <F6> <C-R>=strftime("%H:%M")<CR>

"let g:vimwiki_folding='syntax'
" vimwiki configuration ----------------------------------------------------------------------------------------------------
"

" redifine bold to color of Operator-Group in Vimwiki (red color)
" see :hi for colors and https://github.com/vimwiki/vimwiki/issues/116
"hi def link VimwikiBold Operator
"hi def link VimwikiBold CursorLineNr
hi VimwikiBold guifg=#f08787
"hi VimwikiItalic guifg=#b588c9
"hi VimwikiItalic guifg=#93ccd6 #a1d9e2
hi VimwikiItalic guifg=#ce8ce2


" map alt+j, alt+k to move line up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" call fzf from current dir
map ; :Files<CR>


let g:ale_list_window_size = 5

set wildmenu
set wildmode=longest:full,full

"set completeopt=longest,menuone
set completeopt=menu,longest,menuone
inoremap <expr> <CR>pumvisible() ? "\<C-y>" : "\<CR>"

" highlight pmenu (autocomplete)
"highlight PmenuSbar ctermbg=blue guifg=gray 
highlight Pmenu guibg=gray guifg=black
highlight PmenuSel guibg=white guifg=gray
"highlight PmenuThumb ctermbg=blue guifg=blue 

"hi def link VimwikiLinkT VimwikiLink
"hi VimwikiLink guifg=#80a0ff gui=bold
hi VimwikiLink guifg=#80a0ff 

let g:vimwiki_hl_cb_checked = 2



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
