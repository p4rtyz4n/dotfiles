local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.code_actions.gitsigns,
  -- webdev stuff
  b.formatting.deno_fmt,                                                    -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  --eslint
  --b.code_actions.eslint,
  --b.diagnostics.eslint,
  --b.formatting.eslint,
  --eslint_d
  --b.formatting.eslint_d,
  --b.code_actions.eslint_d,
  --b.diagnostics.eslint_d,

  b.completion.spell,
  b.completion.tags,
  b.formatting.trim_newlines,
  b.formatting.trim_whitespace,
  b.code_actions.gitsigns,

  --"scss", "less", "css", "sass"
  b.diagnostics.stylelint,
  b.formatting.stylelint,
  --"yaml"
  b.diagnostics.yamllint,

  -- "cs"
  b.formatting.csharpier,

  -- "rust"
  b.formatting.rustfmt,
}

local lsp_formatting = function(bufnr)
  -- vim.lsp.buf.format({ bufnr = bufnr})
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

null_ls.setup({
  --debug = true,
  sources = sources,
  on_attach = on_attach,
})

