hs.hotkey.bind(HYPER, "Up", function()
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
hs.hotkey.bind(HYPER, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local size = 40
  f.x = f.x + (size / 2)
  f.y = f.y + (size / 2)
  f.w = f.w - size
  f.h = f.h - size
  win:setFrame(f)
end)
hs.hotkey.bind(HYPER, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(HYPER, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)
