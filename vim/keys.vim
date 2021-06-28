"

" set space as the leader key
let mapleader=" "

" enable which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" -> space (fzf)
map <leader><Space> :Files<CR>
map <leader>/ :BLines<CR>
map <leader>s :Lines<CR>

" -> o (open)
map <leader>op :NERDTreeToggle<CR>

" -> f (file)
map <leader>fs :w<CR>
map <leader>ff :Files<CR>

" -> b (buffers)
map <leader>bb :Buffers<CR>
map <leader>bd :bd<CR>
map <leader>bD :bd!<CR>
map <leader>b[ :bp<CR>
map <leader>b] :bn<CR>
map <leader>bn :enew<CR>

" -> w (window)
map <leader>wh <C-w>h
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wl <C-w>l
map <leader>ws :split<CR>
"map <leader>w- :split<CR>
"map <leader>w| :vsplit<CR>
map <leader>wv :vsplit<CR>
map <leader>wd <C-w>q

" -> q (session)
map <leader>qq :qa<CR>
map <leader>qQ :qa!<CR>
