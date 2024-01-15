local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup {
  spec = {
    -- TODO: change `branch="v4"` to `version="^4"` on release
    { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },
    -- AstroCommunity: import any community modules here
    -- TODO: Remove branch v4 on release
    { "AstroNvim/astrocommunity", branch = "v4" },

    { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
    --{ import = "astrocommunity.recipes.telescope-nvchad-theme" },
    { import = "astrocommunity.terminal-integration.flatten-nvim" },
    { import = "astrocommunity.utility.telescope-fzy-native-nvim" },
    { import = "astrocommunity.editing-support.auto-save-nvim" },
    { import = "astrocommunity.editing-support.chatgpt-nvim" },
    --{ import = "astrocommunity.diagnostics.lsp_lines-nvim" },
    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.git.diffview-nvim" },
    { import = "astrocommunity.syntax.hlargs-nvim" },

    { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = false },
    { import = "astrocommunity.colorscheme.catppuccin", enabled = false },
    { import = "astrocommunity.colorscheme.gruvbox-baby" },
    { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = false },
    --https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/tokyonight-nvim

    { import = "astrocommunity.diagnostics.trouble-nvim" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.markdown" },
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
  },
  install = { colorscheme = { "astrodark", "habamax", "gruvbox-baby" } },
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
}
