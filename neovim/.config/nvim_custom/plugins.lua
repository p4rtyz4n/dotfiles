local overrides = require("custom.configs.overrides")

local plugins = {
	{ "ThePrimeagen/vim-be-good" }, --:VimBeGood
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim"
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		opts = overrides.mason,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim"
		},
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer", "omnisharp" },
		},
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs" },
	-- code formatting, linting etc
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("custom.configs.null-ls")
		end,
	},
	{
		"j-hui/fidget.nvim",
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
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help"
		},
		--opts = function()
		--	local options = require("plugins.configs.cmp")
		--	options.sources.insert({ name = 'nvim_lsp_signature_help' })
		--	return options
		--end,
	},
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "stevearc/dressing.nvim" },
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
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
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
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"rouge8/neotest-rust",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust")({
						--  args = { "--no-capture" },
					}),
				},
			})
		end,
	},
	{
		--[[
			close = { "<C-c>" },
			yank_last = "<C-y>",
			yank_last_code = "<C-k>",
			scroll_up = "<C-u>",
			scroll_down = "<C-d>",
			new_session = "<C-n>",
			cycle_windows = "<Tab>",
			cycle_modes = "<C-f>",
			select_session = "<Space>",
			rename_session = "r",
			delete_session = "d",
			draft_message = "<C-d>",
			toggle_settings = "<C-o>",
			toggle_message_role = "<C-r>",
			toggle_system_role_open = "<C-s>",
		]]--
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				openai_params = {
					max_tokens = 1500,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
		},
		opts = function ()
			return require "custom.configs.rust-tools"
		end,
		config = function (_, opts)
			require("rust-tools").setup(opts)
		end
	},
	{
		"mfussenegger/nvim-dap",
	}
}
return plugins
