local map = vim.api.nvim_set_keymap
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Abrir tree
--map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
--Guardado
map('n', '<C-S>', ':w<CR>', opts)
map('i', '<C-S>', '<Esc>:w<CR>', opts)
-- Salir
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<C-Q>', ':wq<CR>', opts)
map('i', '<C-Q>', '<Esc>:wq<CR>', opts)
-- Telescope
-- map('n', '<leader>ff', ':Telescope find_files<CR>', opts)

-- yank
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Lsp-Saga
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gd', ':Lspsaga lsp_finder<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', '<C-d>', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- Format
vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

--vim.keymap.set('n', 'dc', require 'dap'.continue)
--vim.keymap.set('n', 'do', require 'dap'.step_over)
--vim.keymap.set('n', 'di', require 'dap'.step_into)
--vim.keymap.set('n', 'ds', require 'dap'.step_out)
--vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

