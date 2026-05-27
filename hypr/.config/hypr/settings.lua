hl.config({
    -- Dwindle Layout
    dwindle = {
        preserve_split       = true,
        special_scale_factor = 0.8,
    },
    -- Master Config
    master = {
        new_status = "master",
        new_on_top = true,
        mfact      = 0.5,
    },
    general = {
        resize_on_border = true,
        layout           = "dwindle",
    },
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "ctrl:nocaps",
        kb_rules     = "",
        repeat_rate  = 50,
        repeat_delay = 300,

        sensitivity                 = 0, -- mouse sensitivity
        numlock_by_default          = true,
        follow_mouse                = 1,
        float_switch_override_focus = false,

        touchpad = {
            disable_while_typing    = true,
            natural_scroll          = true ,
            clickfinger_behavior    = false,
            middle_button_emulation = true,
            tap_to_click            = true,
            drag_lock               = false,
        },

        touchdevice = {
            enabled = false,
        },
        tablet = {
            transform   = 0,
            left_handed = 0,
        },
    },
    gestures = {
        workspace_swipe_distance           = 500,
        workspace_swipe_invert             = true,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio       = 0.5,
        workspace_swipe_create_new         = true ,
        workspace_swipe_forever            = true,
    },
    misc = {
        disable_hyprland_logo      = true,
        disable_splash_rendering   = true,
        vrr                        = 2,
        mouse_move_enables_dpms    = true,
        enable_swallow             = false,
        focus_on_activate          = false,
        initial_workspace_tracking = 0,
        middle_click_paste         = false,
    },
    binds = {
        workspace_back_and_forth = false,
        allow_workspace_cycles   = true,
        pass_mouse_when_bound    = false,
    },
    xwayland = {
        enabled            = true,
        force_zero_scaling = true,
    },
    render = {
        direct_scanout = 0,
    },
    cursor = {
        sync_gsettings_theme     = true,
        no_hardware_cursors      = 2,
        enable_hyprcursor        = true,
        warp_on_change_workspace = 2,
        inactive_timeout         = 10,
    }
})

-- Laptop overrides
hl.device({
    name = "at-translated-set-2-keyboard",
    kb_variant = "dvorak",
    resolve_binds_by_sym = true,
})
