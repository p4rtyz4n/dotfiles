local overrides = require("custom.configs.overrides")

local plugins = {
	{ "ThePrimeagen/vim-be-good" }, --:VimBeGood
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
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
			ensure_installed = {
				"lua_ls", "bashls", "dockerls", "astro", "rust_analyzer",
				 "omnisharp", "html", "jsonls", "tsserver", "stylelint_lsp",
				 "svelte", "tailwindcss", "yamlls"
				 --"denols"
			},
			automatic_installation = true,
		},
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs" },
	{
		'nvimdev/lspsaga.nvim',
		cmd = { "Lspsaga" },
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons"     -- optional
		}
	},
	-- code formatting, linting etc
	{
		"MunifTanjim/eslint.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function ()
			require("custom.config.eslint")
		end
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
		opts = function ()
			local M = require "plugins.configs.cmp"
			table.insert(M.sources, {name = "crates"})
			return M
		end,
	},
	--[[{
		"stevearc/dressing.nvim",
		config =function ()
			require('dressing').setup({})
		end
	},]]--
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
			"haydenmeade/neotest-jest",
			"nvim-lua/plenary.nvim",
			"Issafalcon/neotest-dotnet",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function (_, opts)
			require("custom.configs.neotest")
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
		"simrat39/rust-tools.nvim",  --todo: check how to us
		ft = "rust",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap", --todo: check how to use
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
		dependencies = {
			{
				"mxsdev/nvim-dap-vscode-js",
				config = function ()
					require("dap-vscode-js").setup({
						adapters = { 'pwa-node' },
					})
				end
			},
			{
				"microsoft/vscode-js-debug",
				lazy = true,
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
			}
		},
		config = function (_, opts)
			require("custom.configs.dap")
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"},
		config = function ()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
			vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
			vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
		end
	},
	{
		"saecki/crates.nvim",
		ft = {"rust", "toml"},
		config = function (_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
	{
		"folke/neodev.nvim",
		opts = {},
		config = function (_, opts)
			require("neodev").setup({
  				library = { plugins = { "nvim-dap-ui", "neotest" }, types = true },
				-- add any options here, or leave empty to use the default settings
			  })
		end,
	}
}
return plugins
