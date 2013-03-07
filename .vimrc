filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set background=dark
set t_Co=256
let g:badwolf_termcolors=256
colorscheme badwolf

" set guifont=Menlo\ for\ Powerline:h14
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

let g:Powerline_symbols='fancy'

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber

" Define mapleaer
let mapleader = ","

" Search related
nnoremap / /\v
vnoremap / /\v
set incsearch
set hlsearch
set showmatch
set ignorecase
set smartcase
set gdefault
nnoremap <leader><space> :noh<CR>

set clipboard=unnamed

" undofile w/ special location
set undofile
set undodir=~/.vim/tmp


inoremap jk <ESC>
nmap <space> :

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set list
set listchars=tab:▸\ ,eol:¬

cmap w!! w !sudo tee % >/dev/null

set guioptions-=T

" Splitscreen mappings
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j
map + <C-w>w
" Swap screens
map <C-x> <C-w>x
" Move between screen
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" easymotion
let g:EasyMotion_do_mapping = 0
nnoremap <silent> <Leader>f :call EasyMotion#F(0, 0)<CR>
nnoremap <silent> <Leader>F :call EasyMotion#F(0, 1)<CR>

" Comment/Uncomment
map <leader>c \\\
autocmd FileType gringo set commentstring=%\ %s
autocmd FileType puppet set commentstring=#\ %s

" get .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" CtrlP settings
let g:ctrlp_map = '<leader>,'
nnoremap <leader>. :CtrlPTag<CR>
let g:ctrlp_working_path_mode = 0 " don't chdir FFS
let g:ctrlp_extensions = ['tag']
" Set the max files
let g:ctrlp_max_files = 10000
" Optimize file searching
let g:ctrlp_user_command = { 'types': { 1: ['.git/', 'cd %s && git ls-files'], 2: ['.hg/', 'cd %s && hg manifest'] }, 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files }
