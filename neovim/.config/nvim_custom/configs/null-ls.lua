local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.code_actions.gitsigns,
  -- webdev stuff
  --b.formatting.deno_fmt,       
  --b.diagnostics.deno_lint,
  b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,
  --b.completion.luasnip,

  -- Shell
  b.formatting.shfmt,
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  --eslint
  --b.code_actions.eslint,
  --b.diagnostics.eslint,
  --b.formatting.eslint,
  --eslint_d
  b.formatting.eslint_d,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,

  --b.diagnostics.cspell,
  b.diagnostics.codespell,
  b.completion.spell,
  b.completion.tags,
  --b.completion.vsnip,
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
  --b.formatting.rustfmt,
}

null_ls.setup({
  --debug = true,
  sources = sources,
})

