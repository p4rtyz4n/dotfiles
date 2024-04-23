local wezterm = require "wezterm"
local baseTheme = wezterm.get_builtin_color_schemes()["Gruvbox Dark (Gogh)"]
--local baseTheme = wezterm.get_builtin_color_schemes()["Kanagawa (Gogh)"] --
--local baseTheme = wezterm.get_builtin_color_schemes()["Catppuccin Mocha"]
local background = "#1d2021" --gruvbox-hard "#282828"
local foreground = baseTheme.foreground --"#ebdbb2"
local override = {
  background = background,
  foreground = foreground,

  -- gruvbox overrrides
  --         Black      Maroon     Green      Olive      Navy       Purple     Teal       Silver
  --ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#ebdbb2" },

  --             Grey       Red        Lime      Yellow      Blue      Fuchsia    Squa      White
  --brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#a89984" },

  tab_bar = {
    background = background,
    active_tab = {
      bg_color = foreground,
      fg_color = background,
    },

    inactive_tab = {
      bg_color = foreground,
      fg_color = background,
    },

    inactive_tab_hover = {
      bg_color = background,
      fg_color = background,
    },

    new_tab = {
      bg_color = foreground,
      fg_color = background,
    },

    new_tab_hover = {
      bg_color = foreground,
      fg_color = background,
    },
  },
}

local scheme = {}
for k, v in pairs(baseTheme) do
  scheme[k] = v
end
for k, v in pairs(override) do
  scheme[k] = v
end

return {
  ["gruvbox-dark"] = scheme,
}
