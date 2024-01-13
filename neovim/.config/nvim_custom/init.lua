


vim.opt.number = true
vim.opt.relativenumber = true

return {
    colorscheme = "catppuccin",
    plugins = {

        { "ThePrimeagen/vim-be-good" }, --:VimBeGood
        --[[{
            "jay-babu/mason-nvim-dap.nvim",
            opts = {
              ensure_installed = {  }
            }
        },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
              ensure_installed = {  }, -- automatically install lsp
            },
        },]]--

        "AstroNvim/astrocommunity",
        { import = "astrocommunity.colorscheme.kanagawa-nvim" },
        { import = "astrocommunity.colorscheme.catppuccin"},
        { import = "astrocommunity.colorscheme.gruvbox-baby" },
        { import = "astrocommunity.colorscheme.gruvbox-nvim" },

        --{ import = "astrocommunity.bars-and-lines.lualine-nvim" },
        { import = "astrocommunity.diagnostics.trouble-nvim" },

        { import = "astrocommunity.pack.markdown" },
        { import = "astrocommunity.pack.lua" },
        { import = "astrocommunity.pack.json" },
        { import = "astrocommunity.pack.html-css" },
        { import = "astrocommunity.pack.docker" },
        { import = "astrocommunity.pack.cs" },
        { import = "astrocommunity.pack.rust" },
        { import = "astrocommunity.pack.swift" },
        { import = "astrocommunity.pack.typescript" },
        --tailwindcss
        { import = "astrocommunity.pack.yaml" },
        { import = "astrocommunity.test.neotest" },
        --[[
        { 
            "nvim-neotest/neotest",
            opts = {
            },
        },
        {
            'nvimdev/lspsaga.nvim',
            --cmd = { "Lspsaga" },
            event = "LspAttach",
            config = function()
                require('lspsaga').setup({})
            end,
            dependencies = {
                "nvim-treesitter/nvim-treesitter", -- optional
                "nvim-tree/nvim-web-devicons"   -- optional
            }
        },
        {
            "mfussenegger/nvim-lint",
            --todo add linters
            config = function()
            require('lint').linters_by_ft = {
                typescript = { 'eslint_d', 'cspell' },
                javascript = { 'eslint_d', 'cspell' },
                typescriptreact = { 'eslint_d', 'cspell' },
                javascriptreact = { 'eslint_d', 'cspell' },
                markdown = { 'vale', }
            }

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                require("lint").try_lint()
                end,
            })
            end,
        },
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
            event = "LspAttach",
            dependencies = {
            "neovim/nvim-lspconfig",
            },
            config = function()
            require("fidget").setup()
            end,
        },
        {
            "max397574/better-escape.nvim",
            event = "InsertEnter",
            config = function()
            require("better_escape").setup()
            end,
        },
        {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            config = function()
            require("lsp_lines").setup()
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            opts = overrides.telescope,
            dependencies = {
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    build = "make",
                    cond = vim.fn.executable("make") == 1,
                },
            }
        },
        {
            "saecki/crates.nvim",
            ft = { "rust", "toml" },
            config = function(_, opts)
                local crates = require("crates")
                crates.setup(opts)
                crates.show()
            end,
        },
        {
            "okuuva/auto-save.nvim",
            event = "VeryLazy",
            config = function()
            require("auto-save").setup({
                execution_message = { enabled = false },
                debounce_delay = 1000,
            })
            end,
        },
        {
            'stevearc/aerial.nvim',
            opts = {},
            cmd = { "AerialToggle", "AerialPrev", "AerialNext" },
            -- Optional dependencies
            dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
            },
            config = function ()
            require("aerial").setup({
                backends = { "treesitter", "lsp", "markdown", "man" },
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })
            end,
        },
        {
            "folke/neodev.nvim",
            opts = {},
            config = function(_, opts)
            require("neodev").setup({
                library = { plugins = { "nvim-dap-ui", "neotest" }, types = true },
                -- add any options here, or leave empty to use the default settings
            })
            end,
        },
        {
            "sindrets/diffview.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },
            -- :h diffview-merge-tool
            -- :h :DiffviewFileHistory
            -- :DiffviewOpen, :DiffviewOpen origin/main...HEAD, :DiffviewOpen HEAD~4..HEAD~2
            -- :h diffview-config-keymaps
            -- :h diffview-actions
            config = function()
                require("diffview").setup()
            end,
        }


        --https://github.com/aznhe21/actions-preview.nvim
        --"nvim-tree/nvim-web-devicons"
        --"rafamadriz/friendly-snippets"
        --"jackMort/ChatGPT.nvim"
        --"rcarriga/nvim-dap-ui"
        ]]--

    },
}