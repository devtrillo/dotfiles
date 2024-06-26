-- Config reload
function debuglog(text)
  hs.console.printStyledtext("DEBUG: " .. tostring(text))
end

function reloadConfig(files)
  doReload = false
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
hs.pathwatcher.new(os.getenv("HOME") .. "/dotfiles/hammerspoon/.hammerspoon", reloadConfig):start()
hs.alert.show("Config loaded")

MEH = { "shift", "alt", "ctrl" }
HYPER = { "shift", "alt", "ctrl", "cmd" }

require 'shortcuts'
require 'window-management'
