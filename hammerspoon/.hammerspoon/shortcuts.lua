local hyperShortcuts = {}

local mehShortcuts = {
  { "B", "Google Chrome" },
  { "C", "Visual Studio Code" },
  { "F", "Figma" },
  { "S", "Slack" },
  { "T", "Wezterm" },
}

hs.application.enableSpotlightForNameSearches(true)

local workingFullScreen = true

local function openApp(appName)
  hs.alert.closeAll()
  hs.alert.show("Oppening application " .. appName)
  hs.application.launchOrFocus(appName)
  if workingFullScreen == false then
    return
  end
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end
for _, shortcut in ipairs(mehShortcuts) do
  hs.hotkey.bind(MEH, shortcut[1], function()
    openApp(shortcut[2])
  end)
end

for _, shortcut in ipairs(hyperShortcuts) do
  hs.hotkey.bind(HYPER, shortcut[1], function()
    hs.alert.closeAll()
    hs.alert.show("Oppening application " .. shortcut[2])
    hs.application.launchOrFocus(shortcut[2])
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
  end)
end
