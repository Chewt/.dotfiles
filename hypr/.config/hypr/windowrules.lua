hl.window_rule({tag = "+browser", match = { class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$"}})
hl.window_rule({tag = "+browser", match = { class = "^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$"}})
hl.window_rule({tag = "+browser", match = { class = "^(chrome-.+-Default)$"}})
hl.window_rule({tag = "+browser", match = { class = "^([Cc]hromium)$"}})
hl.window_rule({tag = "+browser", match = { class = "^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable))$"}})
hl.window_rule({tag = "+browser", match = { class = "^(Brave-browser(-beta|-dev|-unstable)?)$"}})
hl.window_rule({tag = "+browser", match = { class = "^([Tt]horium-browser|[Cc]achy-browser)$"}})
hl.window_rule({tag = "+browser", match = { class = "^(zen-alpha|zen)$"}})
hl.window_rule({tag = "+notif", match = { class = "^(swaync-control-center|swaync-notification-window|swaync-client|class)$"}})
hl.window_rule({tag = "+KooL_Cheat", match = { title = "^(KooL Quick Cheat Sheet)$"}})
hl.window_rule({tag = "+KooL_Settings", match = { title = "^(KooL Hyprland Settings)$"}})
hl.window_rule({tag = "+KooL-Settings", match = { class = "^(nwg-displays|nwg-look)$"}})

-- terminal tags
hl.window_rule({tag = "+terminal", match = { class = "^(Alacritty|kitty|kitty-dropterm)$"}})

-- email tags
hl.window_rule({tag = "+email", match = { class = "^([Tt]hunderbird|org.gnome.Evolution)$"}})
hl.window_rule({tag = "+email", match = { class = "^(eu.betterbird.Betterbird)$"}})

-- project tags
hl.window_rule({tag = "+projects", match = { class = "^(codium|codium-url-handler|VSCodium)$"}})
hl.window_rule({tag = "+projects", match = { class = "^(VSCode|code-url-handler)$"}})
hl.window_rule({tag = "+projects", match = { class = "^(jetbrains-.+)$"}}) -- JetBrains IDEs

-- screenshare tags
hl.window_rule({tag = "+screenshare", match = { class = "^(com.obsproject.Studio)$"}})

-- IM tags
hl.window_rule({tag = "+im", match = { class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$"}})
hl.window_rule({tag = "+im", match = { class = "^([Ff]erdium)$"}})
hl.window_rule({tag = "+im", match = { class = "^([Ww]hatsapp-for-linux)$"}})
hl.window_rule({tag = "+im", match = { class = "^(ZapZap|com.rtosta.zapzap)$ "}})
hl.window_rule({tag = "+im", match = { class = "^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$"}})
hl.window_rule({tag = "+im", match = { class = "^(teams-for-linux)$"}})

-- game tags
hl.window_rule({tag = "+games", match = { class = "^(gamescope)$"}})
hl.window_rule({tag = "+games", match = { class = "^(steam_app_\\d+)$"}})

-- gamestore tags
hl.window_rule({tag = "+gamestore", match = { class = "^([Ss]team)$"}})
hl.window_rule({tag = "+gamestore", match = { title = "^([Ll]utris)$"}})
hl.window_rule({tag = "+gamestore", match = { class = "^(com.heroicgameslauncher.hgl)$"}})

-- file-manager tags
hl.window_rule({tag = "+file-manager", match = { class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$"}})
hl.window_rule({tag = "+file-manager", match = { class = "^(app.drey.Warp)$"}})

-- wallpaper tags
hl.window_rule({tag = "+wallpaper", match = { title = "^([Ww]aytrogen)$"}})
hl.window_rule({tag = "+wallpaper", match = { class = "^([Ww]aytrogen)$"}})

-- multimedia tags
hl.window_rule({tag = "+multimedia", match = { class = "^([Aa]udacious)$"}})
hl.window_rule({tag = "+multimedia", match = { class = "^(Spotify)$"}})


-- settings tags
hl.window_rule({tag = "+settings", match = { title = "^(ROG Control)$"}})
hl.window_rule({tag = "+settings", match = { class = "^(wihotspot(-gui)?)$"}}) -- wifi hotspot
hl.window_rule({tag = "+settings", match = { class = "^([Bb]aobab|org.gnome.[Bb]aobab)$"}}) -- Disk usage analyzer
hl.window_rule({tag = "+settings", match = { class = "^(gnome-disks|wihotspot(-gui)?)$"}})
hl.window_rule({tag = "+settings", match = { title = "(Kvantum Manager)"}})
hl.window_rule({tag = "+settings", match = { class = "^(file-roller|org.gnome.FileRoller)$"}}) -- archive manager
hl.window_rule({tag = "+settings", match = { class = "^(nm-applet|nm-connection-editor|blueman-manager)$"}})
hl.window_rule({tag = "+settings", match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$"}})
hl.window_rule({tag = "+settings", match = { class = "^(qt5ct|qt6ct|[Yy]ad)$"}})
hl.window_rule({tag = "+settings", match = { class = "(xdg-desktop-portal-gtk)"}})
hl.window_rule({tag = "+settings", match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$"}})
hl.window_rule({tag = "+settings", match = { class = "^([Rr]ofi)$"}})

-- viewer tags
hl.window_rule({tag = "+viewer", match = { class = "^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$"}}) -- system monitor
hl.window_rule({tag = "+viewer", match = { class = "^(evince)$"}}) -- document viewer 
hl.window_rule({tag = "+viewer", match = { class = "^(eog|org.gnome.Loupe)$"}}) -- image viewer

-- FLOAT
hl.window_rule({float = true, match = { tag = "file-manager*"}})
hl.window_rule({float = true, match = { tag = "KooL_Cheat*"}})
hl.window_rule({float = true, match = { tag = "wallpaper*"}})
hl.window_rule({float = true, match = { tag = "settings*"}})
hl.window_rule({float = true, match = { tag = "viewer*"}})
hl.window_rule({float = true, match = { tag = "KooL-Settings*"}})
hl.window_rule({float = true, match = { class = "([Zz]oom|onedriver|onedriver-launcher)$"}})
hl.window_rule({float = true, match = { class = "(org.gnome.Calculator), match:title (Calculator)"}})
hl.window_rule({float = true, match = { class = "^(mpv|com.github.rafostar.Clapper)$"}})
hl.window_rule({float = true, match = { class = "^([Qq]alculate-gtk)$"}})
hl.window_rule({float = true, match = { class = "^([Ff]erdium)$"}})
hl.window_rule({float = true, match = { title = "^(Picture-in-Picture)$"}})
hl.window_rule({float = true, match = { class = "^(org.remmina.Remmina)$"}})
hl.window_rule({float = true, match = { tag = "browser*", title = "^(*Extension*)$"}})

-- POSITION
hl.window_rule({move = "onscreen 100%-monitor_w-20 100%-monitor_w-20", match = { tag = "file-manager*" }})
hl.window_rule({center = true, match = { tag = "KooL_Cheat*" }})
hl.window_rule({center = true, match = { title = "^(ROG Control)$" }})
hl.window_rule({center = true, match = { tag = "KooL-Settings*" }})
hl.window_rule({center = true, match = { title = "^(Keybindings)$" }})
hl.window_rule({center = true, match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" }})
hl.window_rule({center = true, match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" }})
hl.window_rule({center = true, match = { class = "^([Ff]erdium)$" }})
hl.window_rule({move = "72% 7%", match = { title = "^(Picture-in-Picture)$" }})
hl.window_rule({size = "(monitor_w*0.2) (monitor_h*0.2)", match = { class = "^([Qq]alculate-gtk)$" }})
hl.window_rule({move = "(monitor_w-(window_w*1.4)) (window_h*0.75)", match = { class = "^([Qq]alculate-gtk)$" }})

-- Avoid idle if window is fullscreen
hl.window_rule({ idle_inhibit = "fullscreen", match = { fullscreen = true }})

-- windowrule v2 move to workspace
hl.window_rule({ workspace = "10", match = { tag = "im*" }})

-- windowrule v2 move to workspace (silent)
hl.window_rule({ workspace = "9 silent", match = { tag = "multimedia*" }})

--windowrule v2 - float popups and dialogue
hl.window_rule({ float  = true, match = { title = "^(Authentication Required)$" }})
hl.window_rule({ center  = true, match = { title = "^(Authentication Required)$" }})
hl.window_rule({ float  = true, match = { class = "(codium|codium-url-handler|VSCodium)", title = "negative:(.*codium.*|.*VSCodium.*)" }})
hl.window_rule({ float  = true, match = { class = "^(com.heroicgameslauncher.hgl)$", title = "negative:(Heroic Games Launcher)" }})
hl.window_rule({ float  = true, match = { class = "^([Ss]team)$", title = "negative:^([Ss]team)$" }})
hl.window_rule({ float  = true, match = { class = "([Tt]hunar)", title = "negative:(.*[Tt]hunar.*)" }})
hl.window_rule({ float  = true, match = { title = "^(Add Folder to Workspace)$" }})
hl.window_rule({ center = true, match = { title = "^(Add Folder to Workspace)$" }})
hl.window_rule({ center = true, match = { title = "^(SDDM Background)$" }})
hl.window_rule({ float = false, match = { title = "^(minifox)$ " }})
hl.window_rule({ float = true, match = { initial_title = "(Open Files)" }})
hl.window_rule({ float = true, match = { title = "^(SDDM Background)$" }})

-- SIZE
hl.window_rule({ size = "70% 60%", match = { initial_title = "(Open Files)" }})
hl.window_rule({ size = "70% 60%", match = { title = "^(Add Folder to Workspace)$" }})
hl.window_rule({ size = "16% 12%", match = { title = "^(SDDM Background)$" }})
hl.window_rule({ size = "65% 90%", match = { tag = "KooL_Cheat*" }})
hl.window_rule({ size = "70% 70%", match = { tag = "wallpaper*" }})
hl.window_rule({ size = "70% 70%", match = { tag = "settings*" }})
hl.window_rule({ size = "60% 70%", match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" }})
hl.window_rule({ size = "60% 70%", match = { class = "^([Ff]erdium)$" }})

-- PINNING
hl.window_rule({pin = true, match = { title = "^(Picture-in-Picture)$" }})

-- windowrule v2 - extras
hl.window_rule({keep_aspect_ratio = true, match = { title = "^(Picture-in-Picture)$" }})

-- BLUR & FULLSCREEN
hl.window_rule({no_blur = true, match = { tag = "games*" }})
hl.window_rule({fullscreen = true, match = { tag = "games*" }})

-- LAYER RULES
hl.layer_rule({ blur = true, match = { namespace = "rofi" }})
hl.layer_rule({ ignore_alpha = 0, match = { namespace = "rofi" }})
hl.layer_rule({ blur = true, match = { namespace = "notifications" }})
hl.layer_rule({ ignore_alpha = 0, match = { namespace = "notifications" }})

-- GROUPS
-- Make both windows tile (required for grouping)
hl.window_rule({ tile = true, match = { class = "^(VirtualBox Manager|VirtualBox Machine)$" }})

-- Automatically create a tabbed group shared between Manager + VM
hl.window_rule({ group = "set", match = { class = "^(VirtualBox (Manager|Machine))$" }})
