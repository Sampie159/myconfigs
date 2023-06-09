set autoindent
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set colorcolumn=90
set termguicolors

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rhysd/vim-lsp-ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" }}}

"MAPPINGS --------------------------------------------------------------- {{{

let mapleader = " "

nnoremap <leader>fs :write<CR>
nnoremap ;q :quit!<CR>
nnoremap ;f :e 
nnoremap ;d :!mkdir -p 

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

nnoremap <leader>bk :bdelete<CR>

" nnoremap o o<Esc>
" nnoremap O O<Esc>

nnoremap ;s :%s/\<<C-r><C-w>\>/<C-w>/gI<Left><Left><Left>

nnoremap <leader>x :!chmod +x %<CR>

nnoremap ;g :G<CR>
nnoremap <leader>fga :G add .<CR>
nnoremap <leader>fc :G commit<CR>
nnoremap <leader>fpl :G pull<CR>
nnoremap <leader>fps :G push<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup file_configurations
    autocmd BufNewFile,BufRead *.h,*.c :set filetype=c tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.hh,*.hpp,*.cc,*.cpp :set tabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rs,*.ml :set colorcolumn=90
augroup END

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

set statusline=

set statusline+=\ %F\ %M\ %Y\ %R

set statusline+=%=

set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

set laststatus=2

" }}}

