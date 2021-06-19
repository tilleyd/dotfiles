-- ~/.config/awesome/theme.lua
-- Author: tilleyd
-- Awesome WM theme

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local icon_path = "~/.config/awesome/icons/"
local wallpapers_path = "~/Pictures/Wallpapers/"

local theme = {}

-- Color definitions
theme.c_background = "#282c34"
theme.c_foreground = "#e8e8e8"
theme.c_background_light = "#ffffff"
theme.c_foreground_light = "#3e424d"
theme.c_darker = "#141a1f"
theme.c_dark = "#1a2128"
theme.c_red = "#ff9191"
theme.c_green = "#9acd68"
theme.c_yellow = "#eda55d"
theme.c_blue = "#7dbeff"
theme.c_magenta = "#cb96ff"
theme.c_cyan = "#6ecfcf"
theme.c_light = "#6b859e"
theme.c_lighter = "#a6b5c5"

theme.font          = "Sans 10"
theme.font_mono     = "Hack 10"

theme.bg_normal     = theme.c_background
theme.bg_focus      = theme.c_dark
theme.bg_urgent     = theme.c_red
theme.bg_minimize   = theme.c_green

theme.bg_systray    = theme.c_dark

theme.fg_normal     = theme.c_foreground
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.useless_gap   = dpi(8)
theme.border_width  = dpi(0)
theme.border_normal = theme.c_background
theme.border_focus  = theme.c_blue
theme.border_marked = theme.c_green

-- Taglist colors
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_font        = theme.font_mono
theme.taglist_fg_focus    = theme.c_background
theme.taglist_fg_urgent   = theme.c_yellow
theme.taglist_fg_occupied = theme.c_green
theme.taglist_fg_empty    = theme.c_magenta
theme.taglist_fg_volatile = theme.c_red
theme.taglist_bg_empty    = theme.c_background
theme.taglist_bg_focus    = theme.c_magenta
theme.taglist_bg_occupied = theme.c_background
theme.taglist_bg_urgent   = theme.c_background
theme.taglist_bg_volatile = theme.c_background

-- Status widget colors
theme.widget_bg_clock  = theme.c_background
theme.widget_fg_clock  = theme.c_blue
theme.widget_bg_volume = theme.c_background
theme.widget_fg_volume = theme.c_yellow
theme.widget_bg_cpu    = theme.c_background
theme.widget_fg_cpu    = theme.c_magenta
theme.widget_bg_ram    = theme.c_background
theme.widget_fg_ram    = theme.c_green

-- Naughty theming
theme.notification_fg  = theme.c_foreground_light
theme.notification_bg  = theme.c_background_light
theme.notification_border_width = 0
theme.notification_border_color = theme.c_background
theme.notification_width        = 480
theme.notification_max_width    = theme.notification_width
theme.notification_max_height   = 240
theme.notification_icon_size    = 128

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
-- local taglist_square_size = dpi(5)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, lighter
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, lighter
-- )

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = icon_path.."titlebar/close.png"
theme.titlebar_close_button_focus  = icon_path.."titlebar/close.png"

theme.titlebar_minimize_button_normal = icon_path.."titlebar/minimize.png"
theme.titlebar_minimize_button_focus  = icon_path.."titlebar/minimize.png"

theme.titlebar_ontop_button_normal_inactive = icon_path.."titlebar/ontop_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = icon_path.."titlebar/ontop_inactive.png"
theme.titlebar_ontop_button_normal_active = icon_path.."titlebar/ontop_active.png"
theme.titlebar_ontop_button_focus_active  = icon_path.."titlebar/ontop_active.png"

theme.titlebar_sticky_button_normal_inactive = icon_path.."titlebar/sticky_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = icon_path.."titlebar/sticky_inactive.png"
theme.titlebar_sticky_button_normal_active = icon_path.."titlebar/sticky_active.png"
theme.titlebar_sticky_button_focus_active  = icon_path.."titlebar/sticky_active.png"

theme.titlebar_floating_button_normal_inactive = icon_path.."titlebar/floating_inactive.png"
theme.titlebar_floating_button_focus_inactive  = icon_path.."titlebar/floating_inactive.png"
theme.titlebar_floating_button_normal_active = icon_path.."titlebar/floating_active.png"
theme.titlebar_floating_button_focus_active  = icon_path.."titlebar/floating_active.png"

theme.titlebar_maximized_button_normal_inactive = icon_path.."titlebar/maximized_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = icon_path.."titlebar/maximized_inactive.png"
theme.titlebar_maximized_button_normal_active = icon_path.."titlebar/maximized_active.png"
theme.titlebar_maximized_button_focus_active  = icon_path.."titlebar/maximized_active.png"

theme.wallpaper = wallpapers_path.."001.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = icon_path.."layouts/fairh.png"
theme.layout_fairv = icon_path.."layouts/fairv.png"
theme.layout_floating  = icon_path.."layouts/floating.png"
theme.layout_magnifier = icon_path.."layouts/magnifier.png"
theme.layout_max = icon_path.."layouts/max.png"
theme.layout_fullscreen = icon_path.."layouts/fullscreen.png"
theme.layout_tilebottom = icon_path.."layouts/tilebottom.png"
theme.layout_tileleft   = icon_path.."layouts/tileleft.png"
theme.layout_tile = icon_path.."layouts/tile.png"
theme.layout_tiletop = icon_path.."layouts/tiletop.png"
theme.layout_spiral  = icon_path.."layouts/spiral.png"
theme.layout_dwindle = icon_path.."layouts/dwindle.png"
theme.layout_cornernw = icon_path.."layouts/cornernw.png"
theme.layout_cornerne = icon_path.."layouts/cornerne.png"
theme.layout_cornersw = icon_path.."layouts/cornersw.png"
theme.layout_cornerse = icon_path.."layouts/cornerse.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
