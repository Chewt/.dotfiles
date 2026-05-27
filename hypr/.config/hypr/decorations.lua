local colors = {
    background = "rgb(22201E)",
    foreground = "rgb(E4E0D6)",
    color0 = "rgb(484644)",
    color1 = "rgb(241C11)",
    color2 = "rgb(2A2216)",
    color3 = "rgb(514A36)",
    color4 = "rgb(544C3C)",
    color5 = "rgb(7E7663)",
    color6 = "rgb(847C68)",
    color7 = "rgb(CFCABC)",
    color8 = "rgb(918D84)",
    color9 = "rgb(302616)",
    color10 = "rgb(382E1D)",
    color11 = "rgb(6C6348)",
    color12 = "rgb(706650)",
    color13 = "rgb(A99E84)",
    color14 = "rgb(B1A68B)",
    color15 = "rgb(CFCABC)",
}

hl.config({
    general = {
        border_size = 2,
        gaps_in = 1,
        gaps_out = 2,
        col = {
            active_border = colors.color10,
            inactive_border = colors.color10,
        }
    },
    decoration = {
        rounding = 10,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,

        dim_inactive = false,
        dim_strength = 0.1,
        dim_special = 0.8,

        shadow = {
            enabled = true,
            range = 3,
            render_power = 1,

            color = colors.color12,
            color_inactive = colors.color10,
        },
        blur =  {
            enabled = false,
            size = 6,
            passes = 2,
            ignore_opacity = true,
            new_optimizations = true,
            special = true,
            popups = true,
        },
    },
    group = {
        col = {
            border_active = colors.color15,
        },
        groupbar = {
            col = {
                active = colors.color0,
            },
        }
    },
    animations = {
        enabled = true,
    }
})

hl.curve( "linear",        { type = "bezier", points = { { 0, 0,     }, {1, 1,       } } } )
hl.curve( "md3_standard",  { type = "bezier", points = { { 0.2, 0,   }, {0, 1,       } } } )
hl.curve( "md3_decel",     { type = "bezier", points = { { 0.05, 0.7,}, {0.1, 1,     } } } )
hl.curve( "md3_accel",     { type = "bezier", points = { { 0.3, 0,   }, {0.8, 0.15,  } } } )
hl.curve( "overshot",      { type = "bezier", points = { { 0.05, 0.9,}, {0.1, 1.1,   } } } )
hl.curve( "crazyshot",     { type = "bezier", points = { { 0.1, 1.5, }, {0.76, 0.92 ,} } } )
hl.curve( "hyprnostretch", { type = "bezier", points = { { 0.05, 0.9,}, {0.1, 1.0,   } } } )
hl.curve( "fluent_decel",  { type = "bezier", points = { { 0.1, 1,   }, {0, 1,       } } } )
hl.curve( "easeInOutCirc", { type = "bezier", points = { { 0.85, 0,  }, {0.15, 1,    } } } )
hl.curve( "easeOutCirc",   { type = "bezier", points = { { 0, 0.55,  }, {0.45, 1,    } } } )
hl.curve( "easeOutExpo",   { type = "bezier", points = { { 0.16, 1,  }, {0.3, 1,     } } } )

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })


