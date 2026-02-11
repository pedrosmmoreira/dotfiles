-- ==========================================================================
-- Leader (must be set before plugins)
-- ==========================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ==========================================================================
-- Core Settings
-- ==========================================================================

-- No backup/swap files — Git handles versioning
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Persistent undo across sessions
vim.opt.undofile = true

-- Softtabs, 2 spaces (Ruby/Rails standard)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.signcolumn = "yes"

-- Show trailing whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }

-- Splits open to right/bottom
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Autowrite before running tests, switching buffers
vim.opt.autowrite = true

-- Security
vim.opt.modelines = 0
vim.opt.modeline = false

-- History
vim.opt.history = 1000

-- ==========================================================================
-- Keymaps
-- ==========================================================================

-- Switch between last two files (thoughtbot classic: space-space)
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Switch to last file" })

-- Clear search highlighting
vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
