-- Configuration
require("settings")
require("decorations")
require("keybinds")
require("windowrules")

require("startup-apps")

-- This is pretty janky ngl, but I need it since I have a script that changes
-- my monitor layout and there is a race condition sometimes.
local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
while (
    (not file_exists('/home/hayden/.config/hypr/monitors.lua'))
    and
    (not file_exists('/home/hayden/.config/hypr/workspaces.lua'))
) do
    -- Just spin I guess, hyprland will give up after too long anyway
end
require("monitors")
require("workspaces")
