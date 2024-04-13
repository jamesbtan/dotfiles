vim.cmd("colorscheme slate")

-- Options {{{1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.foldmethod = 'marker'

-- Keybinds {{{1
vim.keymap.set("n", "<leader>gc", "<cmd>edit /home/james/.config/nvim/<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>edit $HOME/Documents/todo/todo.txt<cr>")

-- Autocommands {{{1
-- TODO strip whitespace on save

-- Plugins {{{1
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "stevearc/oil.nvim",
    opts = {},
  },
  -- TODO presence.nvim?
})
