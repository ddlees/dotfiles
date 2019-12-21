" vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'

" Initialize plugin system
call plug#end()
call glaive#Install()

" enable line numbers
let NERDTreeShowLineNumbers=1

let g:rustfmt_autosave = 1
let mapleader = " "
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
filetype plugin on

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType sh,bash,zsh AutoFormatBuffer shfmt
augroup END

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

