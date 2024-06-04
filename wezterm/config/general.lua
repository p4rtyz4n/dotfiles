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
Config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"

return Config
