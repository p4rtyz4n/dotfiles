local wezterm = require "wezterm"
local Utils = require "utils"

local color = Utils.fn.color
local fs = Utils.fn.fs

local Config = {}

--local theme = wezterm.get_builtin_color_schemes()["Tokyo Night Moon"] //default is broken
local theme = wezterm.color.load_scheme(wezterm.config_dir .. "/themes/tokyonight_moon.toml")
--fixes for tab bar
theme.tab_bar.new_tab.bg_color = theme.foreground
theme.tab_bar.new_tab.fg_color = theme.background
theme.tab_bar.new_tab_hover.bg_color = theme.foreground
theme.tab_bar.new_tab_hover.fg_color = theme.background

--local theme = Config.color_schemes[Config.color_scheme]
Config.color_schemes =  { ["Tokyo Night Moon"] = theme }
Config.color_scheme = "Tokyo Night Moon"

Config.background = {
  {
    source = { Color = theme.background },
    width = "100%",
    height = "100%",
  },
}


Config.bold_brightens_ansi_colors = "BrightAndBold"

---char select and command palette
Config.char_select_bg_color = theme.brights[6]
Config.char_select_fg_color = theme.background
Config.char_select_font_size = 12

Config.command_palette_bg_color = theme.brights[6]
Config.command_palette_fg_color = theme.background
Config.command_palette_font_size = 14
Config.command_palette_rows = 20

---cursor
Config.cursor_blink_ease_in = "EaseIn"
Config.cursor_blink_ease_out = "EaseOut"
Config.cursor_blink_rate = 500
Config.default_cursor_style = "BlinkingUnderline"
Config.cursor_thickness = 1
Config.force_reverse_video_cursor = true

Config.enable_scroll_bar = true

Config.hide_mouse_cursor_when_typing = true

---text blink
Config.text_blink_ease_in = "EaseIn"
Config.text_blink_ease_out = "EaseOut"
Config.text_blink_rapid_ease_in = "Linear"
Config.text_blink_rapid_ease_out = "Linear"
Config.text_blink_rate = 500
Config.text_blink_rate_rapid = 250

---visual bell
Config.audible_bell = "SystemBeep"
Config.visual_bell = {
  fade_in_function = "EaseOut",
  fade_in_duration_ms = 200,
  fade_out_function = "EaseIn",
  fade_out_duration_ms = 200,
}

---window appearance
Config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
--Config.window_padding = { left = 2, right = 2, top = 2, bottom = 1 }
Config.window_decorations = "RESIZE"
Config.integrated_title_button_alignment = "Right"
Config.integrated_title_button_style = "Windows"
Config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

---exit behavior
Config.clean_exit_codes = { 130 }
Config.exit_behavior = "CloseOnCleanExit"
Config.exit_behavior_messaging = "Verbose"
Config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "tmux",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
}
Config.window_close_confirmation = "AlwaysPrompt"

color.set_tab_button(Config, theme)

return Config