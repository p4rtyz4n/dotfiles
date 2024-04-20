---@class WezTerm
local wez = require "wezterm"

local icons = require "utils.icons" ---@class Icons
local fun = require "utils.fun" ---@class Fun

---@class Config
local Config = {}

Config.default_cwd = fun.home
Config.default_prog = { "/opt/homebrew/bin/nu" }
Config.front_end = "WebGpu"
Config.animation_fps = 60
Config.max_fps = 120 --60
Config.dpi = 144.0
Config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
--Config.window_decorations = "RESIZE" --INTEGRATED_BUTTONS
--[[Config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}]]--
return Config

