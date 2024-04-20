local wezterm = require 'wezterm'
local scheme = wezterm.get_builtin_color_schemes()['Gruvbox Dark (Gogh)'];

local schemeWithElements = {
  tab_bar = {
    background = scheme.background, --"#16161D",
    foreground = scheme.foreground,
    active_tab = {
      bg_color = scheme.foreground,--"#957FB8",
      fg_color = scheme.background,--"#1F1F28",
    },

    inactive_tab = {
      bg_color = scheme.foreground,--"#727169",
      fg_color = scheme.background,--"#181820",
    },

    inactive_tab_hover = {
      bg_color = "#223249",
      fg_color = scheme.background, --"#727169",
    },

    new_tab = {
      bg_color = scheme.foreground,--"#727169",
      fg_color = scheme.background,--"#181820",
    },

    new_tab_hover = {
      bg_color = "#9CABCA",
      fg_color = scheme.background,--"#181820",
    },
  },
}

for k,v in pairs(scheme) do schemeWithElements[k] = v end

return {
  ['gruvbox-dark'] = schemeWithElements
}