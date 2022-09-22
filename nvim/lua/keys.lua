-- Configures keybindings.

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

function vmap(shortcut, command)
    map('v', shortcut, command)
end

-- improve movement

nmap('*', '*<c-o>') -- don't jump with *
-- center search matches
nmap('n', 'nzz')
nmap('N', 'Nzz')
-- jump to line endings
nmap('H', '^')
nmap('L', '$')
-- natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')
-- keep selection after in/outdent
vmap('<', '<gv')
vmap('>', '>gv')


-- space leader mappings

vim.cmd('let mapleader=" "')
nmap('<leader>', ":WhichKey '<Space>'<CR>")

-- root
nmap('<leader><Space>', ':Files<CR>')
nmap('<leader>/', ':BLines<CR>')
nmap('<leader>s', ':Lines<CR>')
nmap('<leader>n', ':NvimTreeFindFileToggle<CR>')
nmap('<leader>[', ':bp<CR>')
nmap('<leader>]', ':bn<CR>')
nmap('<leader>`', ':12split<CR>:terminal<CR>')

-- f (file)
nmap('<leader>fs', ':w<CR>')
nmap('<leader>ff', ':Files<CR>')
nmap('<leader>fq', ':wq<CR>')

-- p (project)
nmap('<leader>pf', ':GFiles<CR>')

-- b (buffers)
nmap('<leader>bb', ':Buffers<CR>')
nmap('<leader>bd', ':bp|bd #<CR>')
nmap('<leader>bD', ':bp|bd! #<CR>')
nmap('<leader>bn', ':enew<CR>')

-- w (windows)
nmap('<leader>wh', '<C-w>h')
nmap('<leader>wj', '<C-w>j')
nmap('<leader>wk', '<C-w>k')
nmap('<leader>wl', '<C-w>l')
nmap('<leader>w-', ':split<CR>')
nmap('<leader>w/', ':vsplit<CR>')
nmap('<leader>wd', '<C-w>q')

-- q (session)
nmap('<leader>qq', ':qa<CR>')
nmap('<leader>qQ', ':qa!<CR>')

