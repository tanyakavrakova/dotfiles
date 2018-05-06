" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" ================ General Config ====================

set number                      " Display line numbers on the left
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink

syntax on

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype off

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'vim-ruby/vim-ruby.git'

Plugin 'rking/ag.vim'

Plugin 'slim-template/vim-slim'
Plugin 'ctrlp.vim'

Plugin 'wincent/command-t'


" Elixir
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'mtscout6/vim-cjsx'
Plugin 'othree/javascript-libraries-syntax.vim'

" HTML
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'

Plugin 'jpalardy/vim-slime'

" All of your Plugins must be added before the following line
call vundle#end()            " required

autocmd VimEnter * NERDTree

autocmd VimEnter * wincmd l

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

filetype on

" nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
" vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>

" Enable use of the mouse for all modes
set mouse=a

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

set tabstop=2
set shiftwidth=2
set expandtab

set clipboard=unnamedplus

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(plugged|vim-backup|vim-undo)|([\/]\.(git|hg|svn)$)',
  \ }
let g:ctrlp_working_path_mode = 'ra'

map <Tab> <C-w><C-w>

colorscheme desert

set tags=$PWD/tags

" NERDTree shortcuts
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" vim-javascript configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

let g:slime_target = "tmux"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
map <Leader>r <Plug>SlimeLineSend
map <Leader>e <Plug>SlimeRegionSend

set mouse+=a
if &term =~ '^screen'  || &term =~ "xterm"
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" CommandT configuration
if &term =~ "xterm"
  let g:CommandTCancelMap = ['<C-c>']
endif

let g:CommandTWildIgnore=&wildignore . ",*/_build,*/deps,*/assets"

nnoremap <C-j> :m.+1<CR>
nnoremap <C-k> :m.-2<CR>
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m'>+1<CR>gv=gv
vnoremap <C-k> :m'<-2<CR>gv=gv
