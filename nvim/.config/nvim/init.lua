-- ==========================================================================
-- Leader (must be set before plugins)
-- ==========================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ==========================================================================
-- Plugin Manager (lazy.nvim)
-- ==========================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Tim Pope essentials
  "tpope/vim-rails",       -- Rails navigation: :A, gf, :Emodel, :Econtroller
  "tpope/vim-fugitive",    -- Git: :Git blame, :Git diff, :Git log
  "tpope/vim-sleuth",      -- Auto-detect indent settings
  "tpope/vim-endwise",     -- Auto-add 'end' in Ruby

  -- Fuzzy finder
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({
        "default-title",
        winopts = {
          preview = { layout = "vertical" },
        },
      })

      vim.keymap.set("n", "<Leader>f", fzf.files, { desc = "Find files" })
      vim.keymap.set("n", "<Leader>g", fzf.live_grep, { desc = "Grep project" })
      vim.keymap.set("n", "<Leader>b", fzf.buffers, { desc = "Switch buffer" })
      vim.keymap.set("n", "<Leader>t", fzf.helptags, { desc = "Help tags" })
      vim.keymap.set("n", "<C-p>", fzf.git_files, { desc = "Git files" })
    end,
  },

  -- Syntax highlighting (treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "ruby",
          "typescript",
          "tsx",
          "javascript",
          "html",
          "erb",
          "css",
          "json",
          "yaml",
          "toml",
          "lua",
          "bash",
          "markdown",
          "markdown_inline",
          "regex",
          "vim",
          "vimdoc",
          "sql",
          "diff",
          "gitcommit",
        },
      })
    end,
  },
  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ruby_lsp",
        "ts_ls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

})

-- ==========================================================================
-- Core Settings
-- ==========================================================================

-- No backup/swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Softtabs, 2 spaces
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

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Misc
vim.opt.autowrite = true
vim.opt.modelines = 0
vim.opt.modeline = false
vim.opt.history = 1000

-- LSP keymaps (supplements Neovim 0.11 defaults)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
    vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { buffer = buf, desc = "Line diagnostics" })
  end,
})

-- ==========================================================================
-- Keymaps
-- ==========================================================================

-- Switch between last two files (space-space)
vim.keymap.set("n", "<Leader><Leader>", "<C-^>", { desc = "Switch to last file" })

-- Clear search highlighting
vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
