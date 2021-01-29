-- Adapted from https://github.com/trishume/dotfiles/blob/master/hammerspoon/hammerspoon.symlink/init.lua

-- Load Extensions
local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local fnutils = require "hs.fnutils"
local alert = require "hs.alert"
local screen = require "hs.screen"
local grid = require "hs.grid"
local appfinder = require "hs.appfinder"

local definitions = nil
local hyper = nil

local hotkeys = {}

local gridset = function(frame)
	return function()
		local win = window.focusedWindow()
		if win then
			grid.set(win, frame, win:screen())
		else
			alert.show("No focused window.")
		end
	end
end

function createHotkeys()
  for key, fun in pairs(definitions) do
    local mod = hyper
    if string.len(key) == 2 and string.sub(key,2,2) == "c" then
      mod = {"cmd"}
    elseif string.len(key) == 2 and string.sub(key,2,2) == "l" then
      mod = {"ctrl"}
    end

    local hk = hotkey.new(mod, string.sub(key,1,1), fun)
    table.insert(hotkeys, hk)
    hk:enable()
  end
end

function rebindHotkeys()
  for i, hk in ipairs(hotkeys) do
    hk:disable()
  end

  hotkeys = {}
  createHotkeys()
  alert.show("Rebound Hotkeys")
end

function init()
  createHotkeys()
  alert.show("Hammerspoon reloaded")
end

-- Actual config =================================

hyper = {"cmd","ctrl","alt","shift"}
hs.window.animationDuration = 0;

-- Set grid size.
grid.GRIDWIDTH  = 6
grid.GRIDHEIGHT = 8
grid.MARGINX = 0
grid.MARGINY = 0
local gw = grid.GRIDWIDTH
local gh = grid.GRIDHEIGHT

local gomiddle = {x = 1, y = 1, w = 4, h = 6}
local goleft = {x = 0, y = 0, w = gw/2, h = gh}
local goright = {x = gw/2, y = 0, w = gw/2, h = gh}
local gobig = {x = 0, y = 0, w = gw, h = gh}

definitions = {
  j = gridset(goleft),
  k = gridset(goright),
  b = gridset(gobig),

  r = hs.reload,
  q = function() appfinder.appFromName("Hammerspoon"):kill() end,
}

-- Launch and focus applications
fnutils.each({
  { key = "f", app = "Finder" },
  { key = "s", app = "Safari" },
  { key = "v", app = "Code" },
  { key = "i", app = "iTerm2" },
  { key = "c", app = "Sublime Text" },
}, function(object)
    definitions[object.key] = function()
      local app = appfinder.appFromName(object.app)
      if app then app:activate() end
    end
end)

init()
