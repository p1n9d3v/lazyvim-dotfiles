local inputSource = {
	english = "com.apple.keylayout.ABC",
	korean = "com.apple.inputmethod.Korean.2SetKorean",
}

local changeInputSource = function()
	local current = hs.keycodes.currentSourceID()
	local nextInput = nil

	if current == inputSource.english then
		nextInput = inputSource.korean
	else
		nextInput = inputSource.english
	end

	hs.keycodes.currentSourceID(nextInput)
end

hs.hotkey.bind("shift", "space", changeInputSource)

local stroke_arrow = function(arrow_key, modifier)
	local event = require("hs.eventtap").event
	event.newKeyEvent(modifier or {}, arrow_key, true):post()
	event.newKeyEvent(modifier or {}, arrow_key, false):post()
end

hs.hotkey.bind(
	{ "ctrl" },
	"H",
	function()
		stroke_arrow("left")
	end,
	nil,
	function()
		stroke_arrow("left")
	end
)

hs.hotkey.bind(
	{ "ctrl" },
	"J",
	function()
		stroke_arrow("down")
	end,
	nil,
	function()
		stroke_arrow("down")
	end
)

hs.hotkey.bind(
	{ "ctrl" },
	"K",
	function()
		stroke_arrow("up")
	end,
	nil,
	function()
		stroke_arrow("up")
	end
)

hs.hotkey.bind(
	{ "ctrl" },
	"L",
	function()
		stroke_arrow("right")
	end,
	nil,
	function()
		stroke_arrow("right")
	end
)

hs.hotkey.bind(
	{ "ctrl", "shift" },
	"H",
	function()
		stroke_arrow("left", { "shift" })
	end,
	nil,
	function()
		stroke_arrow("left", { "shift" })
	end
)

hs.hotkey.bind(
	{ "ctrl", "shift" },
	"J",
	function()
		stroke_arrow("down", { "shift" })
	end,
	nil,
	function()
		stroke_arrow("down", { "shift" })
	end
)

hs.hotkey.bind(
	{ "ctrl", "shift" },
	"K",
	function()
		stroke_arrow("up", { "shift" })
	end,
	nil,
	function()
		stroke_arrow("up", { "shift" })
	end
)

hs.hotkey.bind(
	{ "ctrl", "shift" },
	"L",
	function()
		stroke_arrow("right", { "shift" })
	end,
	nil,
	function()
		stroke_arrow("right", { "shift" })
	end
)

hs.hotkey.bind({ "ctrl", "cmd" }, "H", function()
	stroke_arrow("left", { "cmd" })
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "J", function()
	stroke_arrow("down", { "cmd" })
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "K", function()
	stroke_arrow("up", { "cmd" })
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "L", function()
	stroke_arrow("right", { "cmd" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "H", function()
	stroke_arrow("left", { "cmd", "shift" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "J", function()
	stroke_arrow("down", { "cmd", "shift" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "K", function()
	stroke_arrow("up", { "cmd", "shift" })
end)

hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "L", function()
	stroke_arrow("right", { "cmd", "shift" })
end)

hs.hotkey.bind({ "ctrl", "alt" }, "H", function()
	stroke_arrow("left", { "alt" })
end)

hs.hotkey.bind({ "ctrl", "alt" }, "J", function()
	stroke_arrow("down", { "alt" })
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "K", function()
	stroke_arrow("up", { "alt", "shift" })
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "L", function()
	stroke_arrow("right", { "alt", "shift" })
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "H", function()
	stroke_arrow("left", { "alt", "shift" })
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "J", function()
	stroke_arrow("down", { "alt", "shift" })
end)

hs.hotkey.bind({ "ctrl", "alt" }, "K", function()
	stroke_arrow("up", { "alt" })
end)

hs.hotkey.bind({ "ctrl", "alt" }, "L", function()
	stroke_arrow("right", { "alt" })
end)

local focusApp = function(app)
	for _, name in ipairs(hs.application.runningApplications()) do
		print(name)
	end
	hs.application.launchOrFocus(app)
end

hs.hotkey.bind({ "alt" }, "T", function()
	focusApp("Ghostty")
end)

hs.hotkey.bind({ "alt" }, "B", function()
	focusApp("Arc")
end)

local reloadConfig = function(files)
	local doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({ "ctrl", "cmd" }, "T", function()
	hs.execute("open -a Ghostty")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "A", function()
	hs.execute("open -a Arc")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "O", function()
	hs.execute("open -a Obsidian")
end)
