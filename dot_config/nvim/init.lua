-- {{{1 Options
vim.cmd("colorscheme slate")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.foldmethod = 'marker'
-- {{{1 Keybinds
vim.keymap.set("n", "<leader>gc", "<cmd>edit /home/james/.config/nvim/<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>edit $HOME/Documents/todo/todo.txt<cr>")
vim.keymap.set("n", "<cr>", "<cmd>:nohlsearch<cr>")
-- {{{1 Plugins
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
require("lazy").setup("plugins")
-- {{{1 Autocommands
-- TODO strip whitespace on save
