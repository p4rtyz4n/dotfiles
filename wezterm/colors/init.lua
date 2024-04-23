local wezterm = require "wezterm"
local baseTheme = wezterm.get_builtin_color_schemes()["Gruvbox Dark (Gogh)"]
local background = "#282828"
local foreground = "#ebdbb2"
local override = {
	background = background,
	foreground = foreground,

	--         Black      Maroon     Green      Olive      Navy       Purple     Teal       Silver
	--ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#ebdbb2" },

	--             Grey       Red        Lime      Yellow      Blue      Fuchsia    Squa      White
	--brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#a89984" },

  tab_bar = {
    background = background, --#16161D",
    --foreground = foreground,
    active_tab = {
      bg_color = foreground, --"#957FB8",
      fg_color = background, --"#1F1F28",
    },

    inactive_tab = {
      bg_color = foreground, --"#727169",
      fg_color = background, --"#181820",
    },

    inactive_tab_hover = {
      --bg_color = "#223249",
      bg_color = foreground,
      fg_color = background, --"#727169",
    },

    new_tab = {
      bg_color = foreground, --"#727169",
      fg_color = background, --"#181820",
    },

    new_tab_hover = {
      --bg_color = "#9CABCA",
      bg_color = foreground,
      fg_color = background, --"#181820",
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
