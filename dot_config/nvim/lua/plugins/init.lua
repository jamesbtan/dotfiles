return {
  {
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme modus_vivendi")
    end,
  },
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
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set({"n", "v"}, "<leader>fb", builtin.buffers)
      vim.keymap.set({"n", "v"}, "<leader>ff", builtin.find_files)
      vim.keymap.set({"n", "v"}, "<leader>fg", builtin.git_files)
      vim.keymap.set({"n", "v"}, "<leader>fl", builtin.quickfix)
      vim.keymap.set({"n", "v"}, "<leader>fL", builtin.loclist)
      vim.keymap.set({"n", "v"}, "<leader>fm", function() builtin.man_pages{sections = { "ALL" }} end)
      vim.keymap.set({"n", "v"}, "<leader>fs", builtin.grep_string)
      vim.keymap.set({"n", "v"}, "<leader>fS", function() builtin.grep_string{ search = vim.fn.input("Grep > ")} end)
    end,
  },
  {
    "echasnovski/mini.align",
    version = false,
    config = true,
  },
  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function(plugin, opts)
      local is = require("mini.indentscope");
      opts.draw = { animation = is.gen_animation.none() }
      is.setup(opts)
    end,
  },
  -- [true-zen.nvim](https://github.com/Pocco81/true-zen.nvim)
  -- [undotree](https://github.com/debugloop/telescope-undo.nvim)
  -- [LSP zero](https://github.com/VonHeikemen/lsp-zero.nvim)
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {"williamboman/mason-lspconfig.nvim"},
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function(plugin, opts)
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      vim.diagnostic.config({
        signs = false
      })
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end,
  },
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"hrsh7th/nvim-cmp"},
  {"L3MON4D3/LuaSnip"},
}
