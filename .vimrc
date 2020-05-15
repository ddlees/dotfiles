scriptencoding utf-8

" vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tjdevries/coc-zsh'
Plug 'bazelbuild/vim-bazel'
Plug 'ervandew/eclim'
Plug 'junegunn/fzf'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-surround'
Plug 'whatyouhide/vim-lengthmatters'

" Initialize plugin system
call plug#end()
call glaive#Install()

""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Config """"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

" gruvbox theme
colorscheme gruvbox
set termguicolors

" Reduce updatetime for vim-gitgutter
set updatetime=100

" Reccomended editorconfig-vim settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Line numbers
set number relativenumber " Default: hybrid
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber " Buffer has focus: relative number
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber " Buffer loses focus: number
augroup END

" mouse mode
set mouse=a

" set system clipboard as default
set clipboard=unnamedplus

" Disable folding
set nofoldenable

" Spaces instead of tabs
set expandtab

"""""""""""""""
" vim-airline "
"""""""""""""""
let g:airline_powerline_fonts = 1

""""""""""""
" rust.vim "
""""""""""""
let g:rustfmt_autosave = 1

""""""""""""
" nerdtree "
""""""""""""
let NERDTreeShowHidden=1
filetype plugin on

augroup nerdtree_settings
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
    \ exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
augroup END

let g:NERDTreeIndicatorMapCustom = {}
let g:NERDTreeIndicatorMapCustom.Modified  = '~'
let g:NERDTreeIndicatorMapCustom.Staged    = '✚'
let g:NERDTreeIndicatorMapCustom.Untracked = '?'
let g:NERDTreeIndicatorMapCustom.Renamed   = '➜'
let g:NERDTreeIndicatorMapCustom.Unmerged  = '═'
let g:NERDTreeIndicatorMapCustom.Deleted   = '✖'
let g:NERDTreeIndicatorMapCustom.Dirty     = '!'
let g:NERDTreeIndicatorMapCustom.Clean     = ''
let g:NERDTreeIndicatorMapCustom.Ignored   = ''
let g:NERDTreeIndicatorMapCustom.Unknown   = '¿'

"""""""""""""""
" vim-codefmt "
"""""""""""""""
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

""""""""""""
" coc.nvim "
""""""""""""
set hidden " if hidden is not set, TextEdit might fail.
set nobackup
set nowritebackup
set cmdheight=2 " Better display for messages
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " Always show sign columns
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-rls',
  \ 'coc-sh',
  \ 'coc-java',
  \ 'coc-marketplace',
  \ 'coc-sql',
  \ 'coc-python',
  \ 'coc-tabnine'
\]

augroup coc_settings
  autocmd FileType json syntax match Comment +\/\/.\+$+
  au BufRead,BufNewFile *.build_defs set filetype=please.build
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

"""""""""""""""""""""
" vim-Lengthmatters "
"""""""""""""""""""""
set textwidth=120

""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Key-bindings """""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '

""""""""""""
" nerdtree "
""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""
" FZF "
""""""""""""
map <C-f> :FZF<CR>

""""""""""""
" coc.nvim "
""""""""""""

nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
