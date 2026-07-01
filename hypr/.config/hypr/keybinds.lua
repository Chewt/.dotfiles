local mainMod = 'ALT'
local superMod = 'SUPER'
local term = 'ghostty'
local scriptsDir = '$HOME/.config/hypr/scripts'
local UserScripts = '$HOME/.config/hypr/UserScripts'

-- common shortcuts
hl.bind(mainMod.." + D", hl.dsp.exec_cmd("pkill rofi || true && rofi -show drun -modi drun,output,filebrowser,run,window")) -- Main Menu (APP Launcher)
hl.bind(mainMod.." + Return", hl.dsp.exec_cmd(term))
hl.bind(mainMod.." + APOSTROPHE", hl.dsp.window.close()) -- close active (not kill)
hl.bind(superMod.." + L", hl.dsp.exec_cmd(UserScripts.."/LockScreen.sh")) -- screen lock
hl.bind(mainMod.." + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw ")) -- swayNC notification panel
hl.bind(mainMod.." + M", hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"))
hl.bind(mainMod.." + SHIFT + E", hl.dsp.exec_cmd(scriptsDir.."/Kool_Quick_Settings.sh")) -- Settings Menu KooL Hyprland Settings
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(scriptsDir.."/Wlogout.sh")) -- power menu

-- Cycle windows if floating bring to top
hl.bind(mainMod.." + tab", hl.dsp.window.cycle_next())
hl.bind(mainMod.." + tab", hl.dsp.window.bring_to_top())
hl.bind(mainMod.." + SHIFT + G", hl.dsp.group.toggle()) -- Create a window group
hl.bind(mainMod.." + SHIFT + tab", hl.dsp.group.next()) -- Switch between windows in group

-- MOVEMENT AND WINDOW MANAGEMENT

-- move windows
hl.bind(mainMod.." + CTRL + h", hl.dsp.window.move({ direction = "left"  }))
hl.bind(mainMod.." + CTRL + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod.." + CTRL + k", hl.dsp.window.move({ direction = "up"    }))
hl.bind(mainMod.." + CTRL + j", hl.dsp.window.move({ direction = "down"  }))

-- move windows into groups
hl.bind(mainMod.." + SHIFT + h", hl.dsp.window.move({ into_group = "left"  }))
hl.bind(mainMod.." + SHIFT + l", hl.dsp.window.move({ into_group = "right" }))
hl.bind(mainMod.." + SHIFT + k", hl.dsp.window.move({ into_group = "up"    }))
hl.bind(mainMod.." + SHIFT + j", hl.dsp.window.move({ into_group = "down"  }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod.." + h", hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod.." + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod.." + k", hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod.." + j", hl.dsp.focus({ direction = "down"  }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod.." + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- NOTE: mouse:272 = left click
hl.bind(mainMod.." + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- NOTE: mouse:272 = right click

-- Resize the active window with keybinds
local resize_step = 10
hl.bind(
    superMod.." + h",
    hl.dsp.window.resize({ x = -resize_step, y =  0, relative = true }),
    { repeating = true }
) -- Resize left  5 px
hl.bind(
    superMod.." + l",
    hl.dsp.window.resize({ x =  resize_step, y =  0, relative = true }),
    { repeating = true }
) -- Resize right 5 px
hl.bind(
    superMod.." + k",
    hl.dsp.window.resize({ x =  0, y = -resize_step, relative = true }),
    { repeating = true }
) -- Resize up    5 px
hl.bind(
    superMod.." + j",
    hl.dsp.window.resize({ x =  0, y =  resize_step, relative = true }),
    { repeating = true }
) -- Resize down  5 px


-- The following mappings use the key codes to better support various keyboard layouts
-- 1 is code:10, 2 is code 11, etc
-- Switch workspaces with mainMod + [0-9] 
hl.bind(mainMod.." + code:10", hl.dsp.focus({ workspace = 1  })) -- NOTE: code:10 = key 1
hl.bind(mainMod.." + code:11", hl.dsp.focus({ workspace = 2  })) -- NOTE: code:11 = key 2
hl.bind(mainMod.." + code:12", hl.dsp.focus({ workspace = 3  })) -- NOTE: code:12 = key 3
hl.bind(mainMod.." + code:13", hl.dsp.focus({ workspace = 4  })) -- NOTE: code:13 = key 4
hl.bind(mainMod.." + code:14", hl.dsp.focus({ workspace = 5  })) -- NOTE: code:14 = key 5
hl.bind(mainMod.." + code:15", hl.dsp.focus({ workspace = 6  })) -- NOTE: code:15 = key 6
hl.bind(mainMod.." + code:16", hl.dsp.focus({ workspace = 7  })) -- NOTE: code:16 = key 7
hl.bind(mainMod.." + code:17", hl.dsp.focus({ workspace = 8  })) -- NOTE: code:17 = key 8
hl.bind(mainMod.." + code:18", hl.dsp.focus({ workspace = 9  })) -- NOTE: code:18 = key 9
hl.bind(mainMod.." + code:19", hl.dsp.focus({ workspace = 10 })) -- NOTE: code:19 = key 0

-- Move active window and follow to workspace mainMod + SHIFT [0-9]
hl.bind(mainMod.." + SHIFT + code:10", hl.dsp.window.move({ workspace = 1  }))-- NOTE: code:10 = key 1
hl.bind(mainMod.." + SHIFT + code:11", hl.dsp.window.move({ workspace = 2  }))-- NOTE: code:11 = key 2
hl.bind(mainMod.." + SHIFT + code:12", hl.dsp.window.move({ workspace = 3  }))-- NOTE: code:12 = key 3
hl.bind(mainMod.." + SHIFT + code:13", hl.dsp.window.move({ workspace = 4  }))-- NOTE: code:13 = key 4
hl.bind(mainMod.." + SHIFT + code:14", hl.dsp.window.move({ workspace = 5  }))-- NOTE: code:14 = key 5
hl.bind(mainMod.." + SHIFT + code:15", hl.dsp.window.move({ workspace = 6  }))-- NOTE: code:15 = key 6
hl.bind(mainMod.." + SHIFT + code:16", hl.dsp.window.move({ workspace = 7  }))-- NOTE: code:16 = key 7
hl.bind(mainMod.." + SHIFT + code:17", hl.dsp.window.move({ workspace = 8  }))-- NOTE: code:17 = key 8
hl.bind(mainMod.." + SHIFT + code:18", hl.dsp.window.move({ workspace = 9  }))-- NOTE: code:18 = key 9
hl.bind(mainMod.." + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }))-- NOTE: code:19 = key 0

-- FEATURES / EXTRAS
hl.bind(mainMod.." + R", hl.dsp.exec_cmd(scriptsDir.."/Refresh.sh")) -- Refresh waybar, swaync, rofi
hl.bind(mainMod.." + E", hl.dsp.exec_cmd(scriptsDir.."/RofiEmoji.sh")) -- emoji menu
hl.bind(mainMod.." + S", hl.dsp.exec_cmd(scriptsDir.."/RofiSearch.sh")) -- Google search using rofi
hl.bind(mainMod.." + V", hl.dsp.exec_cmd(scriptsDir.."/ClipManager.sh")) -- Clipboard Manager
hl.bind(mainMod.." + SHIFT + V", hl.dsp.exec_cmd("rofi-rbw")) -- Clipboard Manager
hl.bind(mainMod.." + CTRL + R", hl.dsp.exec_cmd(scriptsDir.."/RofiThemeSelector.sh")) -- KooL Rofi Menu Theme Selector

hl.bind(mainMod.." + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle" })) -- whole full screen
hl.bind(mainMod.." + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" })) --Float Mode

-- Waybar / Bar related
hl.bind(mainMod.." + CTRL + B", hl.dsp.exec_cmd(scriptsDir.."/WaybarStyles.sh")) -- Waybar Styles Menu
hl.bind(mainMod.." + SHIFT + B", hl.dsp.exec_cmd(scriptsDir.."/WaybarLayout.sh")) -- Waybar Layout Menu

-- FEATURES / EXTRAS (UserScripts)
hl.bind(mainMod.." + W", hl.dsp.exec_cmd(UserScripts.."/WallpaperSelect.sh")) -- Select wallpaper to apply
hl.bind(mainMod.." + SHIFT + K", hl.dsp.exec_cmd(scriptsDir.."/KeyBinds.sh")) -- search keybinds via rofi

-- Special Keys / Hot Keys
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir.."/Volume.sh --inc")) -- volume up
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir.."/Volume.sh --dec")) -- volume down
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd(scriptsDir.."/Volume.sh --toggle-mic")) -- mic mute
hl.bind("xf86audiomute", hl.dsp.exec_cmd(scriptsDir.."/Volume.sh --toggle")) -- mute
hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend ")) -- sleep button 
hl.bind("xf86Rfkill", hl.dsp.exec_cmd(scriptsDir.."/AirplaneMode.sh")) -- Airplane mode

-- media controls using keyboards
hl.bind(mainMod.." + xf86AudioPlay", hl.dsp.exec_cmd(UserScripts.."/swap_sink.py"))
hl.bind("xf86AudioPause", hl.dsp.exec_cmd(scriptsDir.."/MediaCtrl.sh --pause"))
hl.bind("xf86AudioPlay", hl.dsp.exec_cmd(scriptsDir.."/MediaCtrl.sh --pause"))
hl.bind("xf86AudioNext", hl.dsp.exec_cmd(scriptsDir.."/MediaCtrl.sh --nxt "))
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd(scriptsDir.."/MediaCtrl.sh --prv"))
hl.bind("xf86audiostop", hl.dsp.exec_cmd(scriptsDir.."/MediaCtrl.sh --stop"))

-- screenshot with swappy (another screenshot tool)
hl.bind(mainMod.." + SHIFT + S", hl.dsp.exec_cmd(scriptsDir.."/ScreenShot.sh --swappy")) --screenshot (swappy)

-- Laptop specific keys
hl.bind("xf86KbdBrightnessDown", hl.dsp.exec_cmd(scriptsDir..'/BrightnessKbd.sh --dec')) -- decrease keyboard brightness
hl.bind("xf86KbdBrightnessUp", hl.dsp.exec_cmd(scriptsDir..'/BrightnessKbd.sh --inc')) -- increase keyboard brightness
hl.bind("xf86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir..'/Brightness.sh --dec')) -- decrease monitor brightness
hl.bind("xf86MonBrightnessUp", hl.dsp.exec_cmd(scriptsDir..'/Brightness.sh --inc')) -- increase monitor brightness
hl.bind("SHIFT + xf86MonBrightnessUp", hl.dsp.exec_cmd(scriptsDir..'/Brightness.sh --inc-one')) -- increase monitor brightness
hl.bind("SHIFT + xf86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir..'/Brightness.sh --dec-one')) -- decrease monitor brightness
hl.bind("xf86TouchpadToggle", hl.dsp.exec_cmd(scriptsDir..'/TouchPad.sh')) -- disable touchpad
