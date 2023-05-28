local overrides = require("custom.configs.overrides")

local plugins = {
	{ "ThePrimeagen/vim-be-good" }, --:VimBeGood
	{
		"j-hui/fidget.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
				--	after = "mason-lspconfig.nvim",
				dependencies = {
					{
						"williamboman/mason-lspconfig.nvim",
						dependencies = {
							{
								"williamboman/mason.nvim",
								dependencies = {
									{ "Hoffs/omnisharp-extended-lsp.nvim" },
								},
								opts = overrides.mason,
							},
						},
						opts = {
							ensure_installed = { "lua_ls", "rust_analyzer", "omnisharp" },
						},
					},
					-- code formatting, linting etc
					{
						"jose-elias-alvarez/null-ls.nvim",
						config = function()
							require("custom.configs.null-ls")
						end,
					},
				},
				config = function()
					require("plugins.configs.lspconfig")
					require("custom.configs.lspconfig")
				end,
			},
		},
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
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

	-- not tested
	{
		"sindrets/diffview.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		-- :h diffview-merge-tool
		-- :h :DiffviewFileHistory
		-- :DiffviewOpen, :DiffviewOpen origin/main...HEAD, :DiffviewOpen HEAD~4..HEAD~2
		-- :h diffview-config-keymaps
		-- :h diffview-actions
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
}
return plugins
