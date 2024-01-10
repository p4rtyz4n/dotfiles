local on_attach_from_lsp = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local omnisharp_extended = require("omnisharp_extended")
local lspconfig = require("lspconfig")

local servers = {
	"html", "tsserver",
	"bashls", "dockerls", "astro",
	"html", "jsonls", "stylelint_lsp",
	"svelte", "tailwindcss", "yamlls", "eslint"
}

-- for ufo plugin
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local on_attach = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
    end
	on_attach_from_lsp(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	if client.name == "omnisharp" then
		vim.keymap.set("n", "gd", "<Cmd>lua require('omnisharp_extended').lsp_definitions()<CR>", opts)
	else
		vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	end
	-- replaced with lsp_lines
	vim.diagnostic.config({
		virtual_text = false,
	})
end

local rounded_border_handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		handlers = rounded_border_handlers,
		--filetypes
		root_dir = function() return vim.loop.cwd() end
	})
end


lspconfig.omnisharp.setup({
	on_attach = on_attach,
	capabilities = capabilities,

	cmd = { "omnisharp" },

	handlers = vim.tbl_extend("force", rounded_border_handlers, {
		["textDocument/definition"] = omnisharp_extended.handler,
	}),
	-- Enables support for reading code style, naming convention and analyzer
	-- settings from .editorconfig.
	enable_editorconfig_support = true,

	-- If true, MSBuild project system will only load projects for files that
	-- were opened in the editor. This setting is useful for big C# codebases
	-- and allows for faster initialization of code navigation features only
	-- for projects that are relevant to code that is being edited. With this
	-- setting enabled OmniSharp may load fewer projects and may thus display
	-- incomplete reference lists for symbols.
	enable_ms_build_load_projects_on_demand = false,

	-- Enables support for roslyn analyzers, code fixes and rulesets.
	enable_roslyn_analyzers = false,

	-- Specifies whether "using" directives should be grouped and sorted during
	-- document formatting.
	organize_imports_on_format = false,

	-- Enables support for showing unimported types and unimported extension
	-- methods in completion lists. When committed, the appropriate using
	-- directive will be added at the top of the current file. This option can
	-- have a negative impact on initial completion responsiveness,
	-- particularly for the first few completion sessions after opening a
	-- solution.
	enable_import_completion = false,

	-- Specifies whether to include preview versions of the .NET SDK when
	-- determining which version to use for project loading.
	sdk_include_prereleases = true,

	-- Only run analyzers against open files when "enableRoslynAnalyzers" is
	-- true
	analyze_open_documents_only = false,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = rounded_border_handlers,
	--filetypes
	root_dir = function() return vim.loop.cwd() end,
	settings = {
	  Lua = {
		completion = {
		  callSnippet = "Replace"
		}
	  }
	}
})

local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })
 vim.api.nvim_create_autocmd("FileType", {
 	pattern = { "swift" },
 	callback = function()
 		local root_dir = vim.fs.dirname(vim.fs.find({
 			"Package.swift",
 			".git",
 		}, { upward = true })[1])
 		local client = vim.lsp.start({
 			name = "sourcekit-lsp",
 			cmd = { "sourcekit-lsp" },
 			root_dir = root_dir,
 		})
 		vim.lsp.buf_attach_client(0, client)
 	end,
 	group = swift_lsp,
 })
