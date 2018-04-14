" initialize vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme custom
syntax on

" set up airline
"let g:airline_powerline_fonts = 1
"let g:airline_theme='onedark'

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
" show the status line
set laststatus=2
set statusline=%f%m%r%h%w%=%l:%c
" reduce the updatetime to 250ms
set updatetime=250
" add right margin
"set colorcolumn=80
" enable mouse interaction
set mouse=a
" disable line wrapping
set nowrap
" make a nice 80-column setup
let &colorcolumn=join(range(81,999), ",")
" always show 10 lines around the cursor
set scrolloff=10

" switch assembly syntax to use nasm syntax
" instead of AT&T syntax
au BufRead,BufNewFile *.asm set filetype=nasm

" keymaps
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
map <C-n> :NERDTreeToggle<CR>

" gitgutter setup
let g:gitgutter_sign_added='|'
let g:gitgutter_sign_modified='|'
let g:gitgutter_sign_reomved='|'
let g:gitgutter_sign_removed_first_line='|'
let g:gitgutter_sign_modified_removed='|'

" custom statusline
set laststatus=2
set statusline=\ %t
set statusline+=%{&readonly?'\ ':!&modifiable?'\ ':''}\ 
set statusline+=%{gitbranch#name()!=''?'\ \ '.gitbranch#name().'\ ':''}
set statusline+=%{&modified?'\ \ [+]':''}
set statusline+=%=
set statusline+=%-14.(%l:%c%V%)
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=\ %4p%%\ 
hi StatusLine guibg=gray guifg=black
hi StatusLineNC guibg=black guifg=gray
