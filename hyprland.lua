-- macOS Liquid Glass theme fragment for Hyprland (Omarchy 4.0 Lua).
-- Loaded after Omarchy defaults via omarchy.current.theme.hyprland.

local active_border_color = { colors = { "rgba(2ea8ffee)", "rgba(4dd0e1ee)", "rgba(b388ffee)" }, angle = 120 }
local inactive_border_color = "rgba(2a3352cc)"

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 14,
    border_size = 1,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },

    groupbar = {
      col = {
        active = "rgba(2ea8ffcc)",
        inactive = "rgba(2a335266)",
      },
      text_color = "rgba(f2f6ffee)",
      text_color_inactive = "rgba(c9d4e899)",
    },
  },

  decoration = {
    rounding = 16,
    rounding_power = 3.0,

    shadow = {
      enabled = true,
      range = 22,
      render_power = 3,
      color = "rgba(000000b0)",
      color_inactive = "rgba(00000080)",
    },

    blur = {
      enabled = true,
      size = 10,
      passes = 3,
      ignore_opacity = true,
      xray = true,
      noise = 0.01,
      contrast = 1.20,
      brightness = 1.00,
      vibrancy = 0.25,
      vibrancy_darkness = 0.15,
      special = true,
      popups = true,
    },
  },
})

-- Frosted glass curves.
hl.curve("glassOut", { type = "bezier", points = { { 0.32, 1.10 }, { 0.24, 1.00 } } })
hl.curve("glassIn", { type = "bezier", points = { { 0.30, 0.00 }, { 0.70, 0.05 } } })
hl.curve("glassEase", { type = "bezier", points = { { 0.25, 0.80 }, { 0.20, 1.00 } } })
hl.curve("glassSpring", { type = "bezier", points = { { 0.55, 1.30 }, { 0.35, 1.00 } } })
hl.curve("glassBounce", { type = "bezier", points = { { 0.45, 1.65 }, { 0.35, 1.05 } } })
hl.curve("glassBack", { type = "bezier", points = { { 0.34, 1.56 }, { 0.64, 1.00 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })

-- Windows.
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "glassOut", style = "popin 75%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "glassIn", style = "gnomed" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "glassOut", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "emphasizedDecel" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "glassBounce", style = "loop" })
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "glassOut" })

-- Layers.
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "glassOut", style = "popin 88%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.4, bezier = "glassIn", style = "popin 92%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.6, bezier = "glassEase" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.6, bezier = "glassIn" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 4, bezier = "glassEase" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "glassEase" })

-- Workspaces.
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "glassEase", style = "slidefade 40%" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "glassOut", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.4, bezier = "glassIn", style = "slidevert" })

-- Frosted glass on translucent windows (active slightly more opaque for readability).
o.window({ tag = "default-opacity" }, { opacity = "0.98 0.5" })
o.window({ tag = "default-opacity" }, { no_dim = true })

-- Keep fullscreen content (video, games) fully opaque and crisp.
o.window({ fullscreen = 1 }, { opacity = "1.0 override 1.0 override" })
o.window({ fullscreen = 1 }, { no_blur = true })

-- Frosted glass for layer surfaces (bar, notifications, launcher, OSD, polkit).
hl.layer_rule({ match = { namespace = "omarchy-bar" }, blur = true, ignore_alpha = 0.4 })
hl.layer_rule({ match = { namespace = "omarchy-notifications" }, blur = true, ignore_alpha = 0.4 })
hl.layer_rule({ match = { namespace = "omarchy-menu" }, blur = true, ignore_alpha = 0.4 })
hl.layer_rule({ match = { namespace = "omarchy-osd" }, blur = true, ignore_alpha = 0.4 })
hl.layer_rule({ match = { namespace = "omarchy-polkit" }, blur = true, ignore_alpha = 0.4 })

hl.layer_rule({ match = { namespace = "omarchy-bar" }, animation = "slide down" })
hl.layer_rule({ match = { namespace = "omarchy-menu" }, animation = "popin 85%" })
hl.layer_rule({ match = { namespace = "omarchy-notifications" }, animation = "popin 85%" })
hl.layer_rule({ match = { namespace = "omarchy-osd" }, animation = "popin 85%" })
