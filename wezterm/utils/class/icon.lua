---@module "utils.class.icon"
---@author sravioli
---@license GNU-GPLv3

local nf = require("wezterm").nerdfonts

local M = {}

M.Notification = nf.cod_circle_small_filled

M.Sep = {
  block = "█",

  sb = {
    left = nf.pl_left_hard_divider,
    right = nf.pl_right_hard_divider,
    modal = nf.ple_forwardslash_separator,
  },

  tb = {
    leftmost = "▐",
    left = nf.ple_upper_right_triangle,
    right = nf.ple_lower_left_triangle,
  },
}

M.Bat = {
  Full = {
    ["100"] = nf.md_battery,
  },

  Charging = {
    ["00"] = nf.md_battery_alert,
    ["10"] = nf.md_battery_charging_10,
    ["20"] = nf.md_battery_charging_20,
    ["30"] = nf.md_battery_charging_30,
    ["40"] = nf.md_battery_charging_40,
    ["50"] = nf.md_battery_charging_50,
    ["60"] = nf.md_battery_charging_60,
    ["70"] = nf.md_battery_charging_70,
    ["80"] = nf.md_battery_charging_80,
    ["90"] = nf.md_battery_charging_90,
    ["100"] = nf.md_battery_charging_100,
  },

  Discharging = {
    ["00"] = nf.md_battery_outline,
    ["10"] = nf.md_battery_10,
    ["20"] = nf.md_battery_20,
    ["30"] = nf.md_battery_30,
    ["40"] = nf.md_battery_40,
    ["50"] = nf.md_battery_50,
    ["60"] = nf.md_battery_60,
    ["70"] = nf.md_battery_70,
    ["80"] = nf.md_battery_80,
    ["90"] = nf.md_battery_90,
    ["100"] = nf.md_battery,
  },
}

M.Nums = {
  nf.md_numeric_1,
  nf.md_numeric_2,
  nf.md_numeric_3,
  nf.md_numeric_4,
  nf.md_numeric_5,
  nf.md_numeric_6,
  nf.md_numeric_7,
  nf.md_numeric_8,
  nf.md_numeric_9,
  nf.md_numeric_10,
}

M.Progs = {
  ["C:\\WINDOWS\\system32\\cmd.exe"] = nf.md_console_line,
  ["Topgrade"] = nf.md_rocket_launch,
  ["bash"] = nf.cod_terminal_bash,
  ["btm"] = nf.md_chart_donut_variant,
  ["cargo"] = nf.dev_rust,
  ["curl"] = nf.mdi_flattr,
  ["docker"] = nf.linux_docker,
  ["docker-compose"] = nf.linux_docker,
  ["fish"] = nf.md_fish,
  ["gh"] = nf.dev_github_badge,
  ["git"] = nf.dev_git,
  ["go"] = nf.seti_go,
  ["htop"] = nf.md_chart_areaspline,
  ["btop"] = nf.md_chart_areaspline,
  ["kubectl"] = nf.linux_docker,
  ["kuberlr"] = nf.linux_docker,
  ["lazydocker"] = nf.linux_docker,
  ["lua"] = nf.seti_lua,
  ["python"] = nf.seti_python,
  ["perl"] = nf.seti_perl,
  ["make"] = nf.seti_makefile,
  ["node"] = nf.md_nodejs,
  ["nvim"] = nf.custom_neovim,
  ["pacman"] = "󰮯 ",
  ["paru"] = "󰮯 ",
  ["psql"] = nf.dev_postgresql,
  ["pwsh.exe"] = nf.md_console,
  ["ruby"] = nf.cod_ruby,
  ["sudo"] = nf.fa_hashtag,
  ["vim"] = nf.dev_vim,
  ["wget"] = nf.mdi_arrow_down_box,
  ["zsh"] = nf.dev_terminal,
  ["lazygit"] = nf.cod_github,
}

return M
