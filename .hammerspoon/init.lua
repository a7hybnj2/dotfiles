hs.window.animationDuration = 0
-- units = {
-- 	third7		= { x = 0.000, y = 0.000, w = 0.333, h = 0.333 },
-- 	third8		= { x = 0.333, y = 0.000, w = 0.333, h = 0.333 },
-- 	third9		= { x = 0.666, y = 0.000, w = 0.333, h = 0.333 },
-- 	third4		= { x = 0.000, y = 0.333, w = 0.333, h = 0.333 },
-- 	third5		= { x = 0.333, y = 0.333, w = 0.333, h = 0.333 },
-- 	third6		= { x = 0.666, y = 0.333, w = 0.333, h = 0.333 },
-- 	third1		= { x = 0.000, y = 0.666, w = 0.333, h = 0.333 },
-- 	third2		= { x = 0.333, y = 0.666, w = 0.333, h = 0.333 },
-- 	third3		= { x = 0.666, y = 0.666, w = 0.333, h = 0.333 },

-- 	half4		= { x = 0.000, y = 0.000, w = 0.500, h = 1.000 },
-- 	half8		= { x = 0.000, y = 0.000, w = 1.000, h = 0.500 },
-- 	half6		= { x = 0.500, y = 0.000, w = 0.500, h = 1.000 },
-- 	half2		= { x = 0.000, y = 0.500, w = 1.000, h = 0.500 },
-- 
-- 
-- 	right30		= { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
-- 	right70		= { x = 0.30, y = 0.00, w = 0.70, h = 1.00 },
-- 	left70		= { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
-- 	left30		= { x = 0.00, y = 0.00, w = 0.30, h = 1.00 },
-- 	top50		= { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
-- 	bot50		= { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
-- 	upright30	= { x = 0.70, y = 0.00, w = 0.30, h = 0.50 },
-- 	botright30	= { x = 0.70, y = 0.50, w = 0.30, h = 0.50 },
-- 	upleft70	= { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
-- 	botleft70	= { x = 0.00, y = 0.50, w = 0.70, h = 0.50 },
-- }
-- 
-- half = { 'alt', 'cmd' }
-- third = { 'alt', 'ctrl', 'cmd' }
hyper = { 'alt', 'ctrl', 'cmd' }
shift_hyper = { 'shift', 'ctrl', 'cmd', 'alt'}

hs.loadSpoon("MiroWindowsManager")
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})

-- center window on screen
-- This has a bug and results in the frame being moved behind the dock: https://github.com/Hammerspoon/hammerspoon/issues/2022
-- hs.hotkey.bind(hyper, 'c', function() hs.window.focusedWindow():centerOnScreen() end)
hs.hotkey.bind(hyper, 'c', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local max = win:screen():frame()

	local x = f

	x.x = ((max.w - f.w) / 2) + max.x
	x.y = ((max.h - f.h) / 2) + max.y
	win:setFrame(x)
end)

hs.hotkey.bind(hyper, 'x', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local max = win:screen():frame()

	local x = f

	x.y = ((max.h - f.h) / 2) + max.y
	win:setFrame(x)
end)

hs.hotkey.bind(hyper, 'v', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local max = win:screen():frame()

	local x = f

	x.x = ((max.w - f.w) / 2) + max.x
	win:setFrame(x)
end)

-- move focused window to other screen
hs.hotkey.bind(shift_hyper, 'right', function() hs.window.focusedWindow():moveOneScreenEast(true, true) end)
hs.hotkey.bind(shift_hyper, 'left', function() hs.window.focusedWindow():moveOneScreenWest(true, true) end)

-- -- resize window to 3rds
-- hs.hotkey.bind(third, 'pad7', function() hs.window.focusedWindow():move(units.third7,	nil, true) end)
-- hs.hotkey.bind(third, 'pad8', function() hs.window.focusedWindow():move(units.third8,	nil, true) end)
-- hs.hotkey.bind(third, 'pad9', function() hs.window.focusedWindow():move(units.third9,	nil, true) end)
-- hs.hotkey.bind(third, 'pad4', function() hs.window.focusedWindow():move(units.third4,	nil, true) end)
-- hs.hotkey.bind(third, 'pad5', function() hs.window.focusedWindow():move(units.third5,	nil, true) end)
-- hs.hotkey.bind(third, 'pad6', function() hs.window.focusedWindow():move(units.third6,	nil, true) end)
-- hs.hotkey.bind(third, 'pad1', function() hs.window.focusedWindow():move(units.third1,	nil, true) end)
-- hs.hotkey.bind(third, 'pad2', function() hs.window.focusedWindow():move(units.third2,	nil, true) end)
-- hs.hotkey.bind(third, 'pad3', function() hs.window.focusedWindow():move(units.third3,	nil, true) end)
-- 
-- -- resize window to 1/2s
-- hs.hotkey.bind(half, 'pad4', function() hs.window.focusedWindow():move(units.half4,	nil, true) end)
-- hs.hotkey.bind(half, 'pad8', function() hs.window.focusedWindow():move(units.half8,	nil, true) end)
-- hs.hotkey.bind(half, 'pad6', function() hs.window.focusedWindow():move(units.half6,	nil, true) end)
-- hs.hotkey.bind(half, 'pad2', function() hs.window.focusedWindow():move(units.half2,	nil, true) end)
