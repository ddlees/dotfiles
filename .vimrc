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
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
" Plug 'valloric/youcompleteme'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'google/vim-searchindex'
Plug 'google/vim-codefmt'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1
filetype plugin on

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
autocmd CursorHold * silent call CocActionAsync('highlight') " Highlight symbol under cursor on CursorHold

""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Key-bindings """""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "

""""""""""""
" nerdtree "
""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""
" coc.nvim "
""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
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

