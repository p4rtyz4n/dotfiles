local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

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

null_ls.setup {
  --debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end,
}