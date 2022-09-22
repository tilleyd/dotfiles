-- Configures basic vim settings.

vim.o.compatible = false
vim.cmd('filetype plugin on')

-- tabs
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- better editing
vim.o.backspace = 'indent,eol,start'

-- command completion
vim.o.wildmenu = true
vim.o.wildmode = 'full'

-- formatting
vim.o.formatoptions = 'jcrql'
vim.o.textwidth = 80

-- disable backups and swap files
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

-- reload a file when changed on disk
vim.o.autoread = true

-- colorscheme
vim.o.termguicolors = true
vim.g.onedark_hide_endofbuffer = 1
-- vim.g.onedark_termcolors = 16
vim.g.onedark_terminal_italics = 0
vim.cmd('colorscheme onedark')

-- basic ui improvements
vim.cmd('syntax on')
vim.o.number = true -- line numbers
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.fillchars = 'vert:│' -- vertical window borders

-- reduce updatetime for CursorHold autocommand
vim.o.updatetime = 250 -- ms

-- enable clipboard integration
-- NOTE: this disables the use of different registers since all default to the
-- clipboard
vim.o.clipboard = 'unnamedplus'

-- whichkey setup
vim.o.timeoutlen = 500 -- timeout before showing popup
vim.g.which_key_use_floating_win = 1

-- gitgutter setup
vim.g.gitgutter_sign_added = '▐'
vim.g.gitgutter_sign_modified = '▐'
vim.g.gitgutter_sign_removed = '▐'
vim.g.gitgutter_sign_removed_first_line = '▐'
vim.g.gitgutter_sign_modified_removed = '▐'

-- nvim-tree setup
require('nvim-tree').setup {
    open_on_setup = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
    },
    filters = {
        dotfiles = true,
    },
}

-- custom statusline
vim.o.laststatus = 2 -- status line on all windows
sl = ' %t'
sl = sl .. "%{&readonly? '  ' : !&modifiable? '  ' : ''}"
sl = sl .. "%{&modified ? '[+] ' : ''}"
sl = sl .. "%{gitbranch#name() != '' ? '  '.gitbranch#name() : ''}"
sl = sl .. "%=" -- spacer
sl = sl .. "%-14.(%l:%c%V%)" -- line and column
sl = sl .. " %{&filetype != '' ? &filetype : 'text'}"
sl = sl .. " %4p%% " -- scroll percentage
vim.o.statusline = sl

-- markdown setup
vim.o.conceallevel=2
vim.g.vim_markdown_folding_disabled = 1
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_no_extensions_in_markdown = 1 -- links don't need .md
vim.g.vim_markdown_autowrite = 1

-- latex setup
vim.g.vimtex_vew_general_viewer='atril'
vim.cmd('autocmd FileType tex setlocal wrap')

-- terminal setup
vim.cmd('autocmd TermOpen * setlocal nonumber')

-- gui setup
vim.o.guifont = "RobotoMono Nerd Font:h11"
