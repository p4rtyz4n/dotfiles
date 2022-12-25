local M = {}


M.ui = {
  theme_toggle = { "gruvbox" },
  theme = "gruvbox",

  --transparency = false,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M