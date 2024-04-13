return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "-", "<cmd>Oil<cr>" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>fg", builtin.git_files)
      vim.keymap.set("n", "<leader>fb", builtin.buffers)
      vim.keymap.set("n", "<leader>fs", builtin.grep_string)
      vim.keymap.set("n", "<leader>fS", function() builtin.grep_string{ search = vim.fn.input("Grep > ")} end)
    end,
  },
  -- TODO undotree
    -- https://github.com/debugloop/telescope-undo.nvim
    -- https://github.com/mbbill/undotree
  -- TODO lazygit
  -- TODO treesitter
  -- TODO LSP zero
  -- TODO https://github.com/andweeb/presence.nvim
}
