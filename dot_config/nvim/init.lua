-- {{{1 Options
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.foldmethod = "marker"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess = vim.opt.shortmess + "I"
vim.opt.signcolumn = "no"
-- vim.g.markdown_recommended_style = 0
-- {{{1 Keybinds
-- {{{2 Quick-access Files
vim.keymap.set({"n", "v"}, "<leader>gc", "<cmd>edit /home/james/.config/nvim/<cr>")
vim.keymap.set({"n", "v"}, "<leader>gz", "<cmd>edit $HOME/Documents/zk<cr>")
vim.keymap.set({"n", "v"}, "<leader>gg", "<cmd>edit $HOME/Documents/todo/todo.txt<cr>")
-- {{{2 Buffers
vim.keymap.set({"n", "v"}, "<leader>ba", "<cmd>buffer #<cr>")
vim.keymap.set({"n", "v"}, "<leader>bn", "<cmd>bnext<cr>")
vim.keymap.set({"n", "v"}, "<leader>bp", "<cmd>bprevious<cr>")
vim.keymap.set({"n", "v"}, "<leader>bd", "<cmd>bdelete<cr>")
vim.keymap.set({"n", "v"}, "<leader>bD", "<cmd>bdelete!<cr>")
vim.keymap.set({"n", "v"}, "<leader>bo", "<cmd>%bdelete|edit #|bdelete #<cr>")
-- {{{2 Convenience
vim.keymap.set("n", "<leader>dd", "<cmd>put =strftime('%Y%m%d%H%M')<cr>")
vim.keymap.set("n", "<leader>dD", "<cmd>put =strftime('%Y%m%d%H%M%S')<cr>")
vim.keymap.set("n", "<leader>ds", "<cmd>put =strftime('%s')<cr>")
vim.keymap.set("n", "<leader><cr>", "<cmd>:nohlsearch<cr>")
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
