local overrides = require "custom.plugins.overrides"

return {

  ["ThePrimeagen/vim-be-good"] = {}, -- :VimBeGood

  ["Hoffs/omnisharp-extended-lsp.nvim"] = {},

  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
    ensure_installed = { "sumneko_lua", "rust_analyzer", "omnisharp" },
  },

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

  ["stevearc/dressing.nvim"] = {},

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

  ["weilbith/nvim-code-action-menu"] = {
    cmd = "CodeActionMenu"
  },

  ["antoinemadec/FixCursorHold.nvim"] = {},
  ["sindrets/diffview.nvim"] = { 
    after = 'plenary.nvim',
    requires = 'nvim-lua/plenary.nvim' 
    -- :h diffview-merge-tool
    -- :h :DiffviewFileHistory
    -- :DiffviewOpen, :DiffviewOpen origin/main...HEAD, :DiffviewOpen HEAD~4..HEAD~2
    -- :h diffview-config-keymaps
    -- :h diffview-actions
  },


  ["rouge8/neotest-rust"] = {
  },
  ["nvim-neotest/neotest"] = {
    after = "neotest-rust",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "ouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust") {
            --  args = { "--no-capture" },
          },
        },
      })
    end,
  },

  --[[
  ["jackMort/ChatGPT.nvim"] = {
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  --]]
  

}