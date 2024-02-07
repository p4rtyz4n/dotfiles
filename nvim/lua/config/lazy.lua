local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or vim.loop.fs_stat(lazypath)) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

local lazy_loaded, lazy = pcall(require, "lazy") -- validate that lazy is available
if not lazy_loaded then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

---@type LazyConfig
lazy.setup({
  -- TODO: change `branch="v4"` to `version="^4"` on release
  { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },
  -- AstroCommunity: import any community modules here
  -- TODO: Remove branch v4 on release
  -- https://github.com/AstroNvim/astrocommunity/tree/v4/lua/astrocommunity
  { "AstroNvim/astrocommunity", branch = "v4" },

  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.utility.telescope-fzy-native-nvim" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  --{ import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.syntax.hlargs-nvim" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  --https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/tokyonight-nvim

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
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.test.neotest" },
  --{ import = "astrocommunity.scrolling.satellite-nvim", enabled = false },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  -- import/override with your plugins
  { import = "plugins" },
} --[[@as LazySpec]], {
  install = { colorscheme = { "gruvbox-baby", "catppuccin" } },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
