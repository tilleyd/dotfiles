" nvim config
" Author: Duncan Tilley

" initialize vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'leafgarland/typescript-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'sophacles/vim-processing'
Plug 'terryma/vim-multiple-cursors'
Plug 'shiracamus/vim-syntax-x86-objdump-d'
call plug#end()

colorscheme custom
syntax on

" set up vimtex
let g:vimtex_view_general_viewer='evince'
autocmd FileType tex setlocal wrap textwidth=0
autocmd FileType tex match

set backspace=indent,eol,start
set shiftwidth=4
set nocompatible
" autocomplete commands
"set wildmode=longest,list,full
"set wildmenu
" tab width in spaces
set tabstop=4
" use spaces instead of tabs
set expandtab
" auto wrap lines
set formatoptions=jcroql
set textwidth=80
" disable swap files and backup
set nobackup noswapfile nowritebackup autoread
" autoindent next line
set autoindent
" show line numbers
set number
" highlight current line
set cursorline
" autocomplete command menu
set wildmenu
" redraw the screen only when necessary
set lazyredraw
" search as characters are entered
set incsearch
" highlight search matches
set hlsearch
" reduce the updatetime to 250ms
set updatetime=250
" add right margin
"set colorcolumn=80
" enable mouse interaction
set mouse=a
" disable line wrapping
set nowrap
" make a nice 80-column setup
"let &colorcolumn=join(range(81,999), ",")
" highlight past 80-column
"let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
match ErrorMsg '\%>80v.\+'
" always show 10 lines around the cursor
set scrolloff=10
" more natural splitting
set splitbelow
set splitright

" switch assembly syntax to use nasm syntax
" instead of AT&T syntax
au BufRead,BufNewFile *.asm set filetype=nasm

" keymaps
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-t> :split \| terminal <return>i
map <C-b> :NERDTreeToggle<CR>

" gitgutter setup
let g:gitgutter_sign_added='|'
let g:gitgutter_sign_modified='|'
let g:gitgutter_sign_reomved='|'
let g:gitgutter_sign_removed_first_line='|'
let g:gitgutter_sign_modified_removed='|'

" custom statusline
set laststatus=2
set statusline=\ %t
set statusline+=%{&readonly?'\ ':!&modifiable?'\ ':''}
set statusline+=%{gitbranch#name()!=''?'\ \ '.gitbranch#name().'\':''}
set statusline+=%{&modified?'\ \ [+]':''}
set statusline+=%=
set statusline+=%-14.(%l:%c%V%)
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=\ %4p%%\ 
hi StatusLine ctermbg=none ctermfg=gray
hi StatusLineNC ctermbg=none ctermfg=black
