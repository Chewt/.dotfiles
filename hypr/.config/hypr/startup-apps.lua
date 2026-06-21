local scriptsDir = "$HOME/.config/hypr/scripts"

hl.on("hyprland.start", function()
    -- wallpaper stuff 
    hl.exec_cmd("awww-daemon --format xrgb")

    -- Startup
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Polkit (Polkit Gnome / KDE)
    hl.exec_cmd(scriptsDir.."/Polkit.sh") -- auth popup

    -- starup apps
    hl.exec_cmd("nm-applet --indicator") -- network manager
    hl.exec_cmd("swaync")                -- notification daemon
    hl.exec_cmd("blueman-applet")        -- bluetooth manager
    hl.exec_cmd("waybar")

    --clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
