-- #######################################################################################
-- HYPRLAND CONFIGURATION FILE (Lua version for Hyprland 0.55.2+)
-- Converted from hyprlang (hyprland.conf) format
-- See https://wiki.hypr.land/Configuring/ for documentation
-- #######################################################################################

------------------
---- MONITORS ----
------------------
hl.monitor({
    output = ",",
    mode = "preferred",
    position = "auto",
    scale = 1
})


---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "ghostty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local menu2 = "rofi -show filebrowser"
local menu3 = "rofi -show window"
local mainMod = "SUPER"


-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("waybar &")
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("udiskie -n -t &")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- General settings
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    
    decoration = {
        rounding = 10,
        active_opacity = 0.97,
        inactive_opacity = 0.90,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = false,
            size = 2,
            passes = 2,
            vibrancy = 0.1696,
            new_optimizations = true,
            ignore_opacity = false,
        }
    },
})

-- Bezier curves for animations
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- Dwindle layout
hl.config({
    dwindle = {
        pseudotile = true,
        preserve_split = true
    }
})

-- Master layout
hl.config({
    master = {
        new_status = "master"
    }
})

-- Misc settings
hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false
    }
})


--------------
---- INPUT ----
--------------

hl.config({
    input = {
        kb_layout = "dk",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = true
        }
    }
})

-- Per-device config
hl.config({
    device = {
        name = "epic-mouse-v1",
        sensitivity = -0.5
    }
})


--------------------
---- KEYBINDINGS ----
--------------------

-- Exit popup
hl.bind(mainMod .. ", M", hl.dsp.exec_cmd("~/.config/hypr-exit.sh"))
hl.bind(mainMod .. ", N", hl.dsp.exec_cmd("hyprlock"))

-- Basic binds
hl.bind(mainMod .. ", Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ", C", hl.dsp.killactive)
hl.bind(mainMod .. ", E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. ", V", hl.dsp.togglefloating)
hl.bind(mainMod .. ", R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. ", F", hl.dsp.exec_cmd(menu2))
hl.bind(mainMod .. ", W", hl.dsp.exec_cmd(menu3))
hl.bind(mainMod .. ", P", hl.dsp.pseudo)  -- dwindle
hl.bind(mainMod .. ", O", hl.dsp.togglesplit)  -- dwindle

-- Move focus with arrow keys
hl.bind(mainMod .. ", left", hl.dsp.movefocus("l"))
hl.bind(mainMod .. ", right", hl.dsp.movefocus("r"))
hl.bind(mainMod .. ", up", hl.dsp.movefocus("u"))
hl.bind(mainMod .. ", down", hl.dsp.movefocus("d"))
hl.bind(mainMod .. ", h", hl.dsp.movefocus("l"))
hl.bind(mainMod .. ", l", hl.dsp.movefocus("r"))
hl.bind(mainMod .. ", k", hl.dsp.movefocus("u"))
hl.bind(mainMod .. ", j", hl.dsp.movefocus("d"))

-- Switch workspaces
for i = 1, 9 do
    hl.bind(mainMod .. ", " .. tostring(i), hl.dsp.workspace(tostring(i)))
    hl.bind(mainMod .. " SHIFT, " .. tostring(i), hl.dsp.movetoworkspace(tostring(i)))
end
-- Workspace 10 (bound to 0)
hl.bind(mainMod .. ", 0", hl.dsp.workspace("10"))
hl.bind(mainMod .. " SHIFT, 0", hl.dsp.movetoworkspace("10"))

-- Special workspace (scratchpad)
hl.bind(mainMod .. ", S", hl.dsp.togglespecialworkspace("magic"))
hl.bind(mainMod .. " SHIFT, S", hl.dsp.movetoworkspace("special:magic"))

-- Scroll through workspaces
hl.bind(mainMod .. ", mouse_down", hl.dsp.workspace("e+1"))
hl.bind(mainMod .. ", mouse_up", hl.dsp.workspace("e-1"))

-- Move/resize windows with mouse
hl.bind(mainMod .. ", mouse:272", hl.dsp.movewindow)
hl.bind(mainMod .. ", mouse:273", hl.dsp.resizewindow)

-- Move windows with SUPER SHIFT + HJKL/Arrows
hl.bind("SUPER SHIFT, H", hl.dsp.movewindow("l"))
hl.bind("SUPER SHIFT, L", hl.dsp.movewindow("r"))
hl.bind("SUPER SHIFT, K", hl.dsp.movewindow("u"))
hl.bind("SUPER SHIFT, J", hl.dsp.movewindow("d"))
hl.bind("SUPER SHIFT, left", hl.dsp.movewindow("l"))
hl.bind("SUPER SHIFT, right", hl.dsp.movewindow("r"))
hl.bind("SUPER SHIFT, up", hl.dsp.movewindow("u"))
hl.bind("SUPER SHIFT, down", hl.dsp.movewindow("d"))

-- Resize with SUPER CTRL + HJKL/Arrows
hl.bind("SUPER CTRL, right", hl.dsp.resizeactive("50 0"))
hl.bind("SUPER CTRL, left", hl.dsp.resizeactive("-50 0"))
hl.bind("SUPER CTRL, up", hl.dsp.resizeactive("0 -40"))
hl.bind("SUPER CTRL, down", hl.dsp.resizeactive("0 40"))
hl.bind("SUPER CTRL, L", hl.dsp.resizeactive("50 0"))
hl.bind("SUPER CTRL, H", hl.dsp.resizeactive("-50 0"))
hl.bind("SUPER CTRL, k", hl.dsp.resizeactive("0 -40"))
hl.bind("SUPER CTRL, J", hl.dsp.resizeactive("0 40"))


-------------------------------
---- LAPTOP MULTIMEDIA KEYS ----
-------------------------------

-- Volume and brightness
hl.bind("", "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("", "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("", "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("", "XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("", "XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"))
hl.bind("", "XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"))

-- Player controls (using bindl for lock modifiers)
hl.bindl("", "XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bindl("", "XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bindl("", "XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bindl("", "XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))


------------------------------
---- WINDOWS AND WORKSPACES ----
------------------------------

-- Window rules (using table-based syntax as shown in official example)
hl.windowrule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.windowrule({
    name = "nofocus-xwayland-drag",
    match = { class = "^$", title = "^$", xwayland = 1, floating = 1, fullscreen = 0, pinned = 0 },
    nofocus = true
})
