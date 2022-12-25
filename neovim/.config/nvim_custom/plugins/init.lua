local overrides = require "custom.plugins.overrides"

return {

  ["ThePrimeagen/vim-be-good"] = {}, -- :VimBeGood

  ["Hoffs/omnisharp-extended-lsp.nvim"] = {},

  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
    ensure_installed = { "sumneko_lua", "rust_analyzer", "omnisharp" },
  },
  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    after = "mason-lspconfig.nvim",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["hrsh7th/cmp-nvim-lsp-signature-help"] = {},

  ["j-hui/fidget.nvim"] = {
    after = "nvim-lspconfig",
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
    cond = vim.fn.executable 'make' == 1,
    after = "telescope.nvim"
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("lsp_lines").setup();
    end,
  },

  -- overrde plugin configs
  ["nvim-telescope/telescope.nvim"] = {
      override_options = overrides.telescope,
  },  

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  
  ["williamboman/mason.nvim"] = {
    after = "omnisharp-extended-lsp.nvim",
    override_options = overrides.mason,
  },
  
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
}