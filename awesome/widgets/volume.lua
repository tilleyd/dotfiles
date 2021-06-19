-- Awesome WM volume widget
-- Author: tilleyd
-- Based on Pavel Mahov's widget from
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volume-widget

local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")

local GET_VOLUME_CMD = 'amixer -D pulse sget Master'
local INC_VOLUME_CMD = 'amixer -D pulse sset Master 5%+'
local DEC_VOLUME_CMD = 'amixer -D pulse sset Master 5%-'
local TOG_VOLUME_CMD = 'amixer -D pulse sset Master toggle'
local ICON_DIR = os.getenv("HOME") .. '/.config/awesome/icons/widgets/'

local volume = {}

local function worker(user_args)

    local args = user_args or {}

    local mixer_cmd = args.mixer_cmd or 'pavucontrol'
    local widget_type = args.widget_type
    local refresh_rate = args.refresh_rate or 1
    local icon_dir = args.icon_dir or ICON_DIR

    volume.widget = wibox.widget {
        {
            {
                {
                    {
                        id = "icon",
                        widget = wibox.widget.imagebox,
                    },
                    valign = "center",
                    layout = wibox.container.place,
                },
                {
                    id = "label",
                    font = beautiful.font_mono,
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left = 10,
            right = 10,
            widget = wibox.container.margin,
        },
        bg = beautiful.widget_bg_volume,
        fg = beautiful.widget_fg_volume,
        widget = wibox.container.background,

        set_volume = function(self, value)
            local icon_name
            if self.muted then
                icon_name = "volume-muted.png"
            else
                if value <= 0 then
                    icon_name = "volume-zero.png"
                elseif value < 33 then
                    icon_name = "volume-low.png"
                elseif value < 66 then
                    icon_name = "volume-medium.png"
                else
                    icon_name = "volume-high.png"
                end
            end

            local value_str = string.format("% 4d%%", value)

            self:get_children_by_id("icon")[1]:set_image(icon_dir .. icon_name)
            self:get_children_by_id("label")[1]:set_text(value_str)
        end,

        mute = function(self)
            self.muted = true
        end,

        unmute = function(self)
            self.muted = false
        end,
    }

    local function update_widget(widget, stdout)
        local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        if mute == 'off' then
            widget:mute()
        elseif mute == 'on' then
            widget:unmute()
        end

        local volume_level = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        widget:set_volume(tonumber(volume_level))
    end

    function volume:inc()
        spawn.easy_async(INC_VOLUME_CMD, function(stdout) update_widget(volume.widget, stdout) end)
    end

    function volume:dec()
        spawn.easy_async(DEC_VOLUME_CMD, function(stdout) update_widget(volume.widget, stdout) end)
    end

    function volume:toggle()
        spawn.easy_async(TOG_VOLUME_CMD, function(stdout) update_widget(volume.widget, stdout) end)
    end

    function volume:mixer()
        if mixer_cmd then
            spawn.easy_async(mixer_cmd)
        end
    end

    volume.widget:buttons(
            awful.util.table.join(
                    awful.button({}, 4, function() volume:inc() end),
                    awful.button({}, 5, function() volume:dec() end),
                    awful.button({}, 3, function() volume:toggle() end),
                    awful.button({}, 1, function() volume:mixer() end)
            )
    )

    watch(GET_VOLUME_CMD, refresh_rate, update_widget, volume.widget)

    return volume.widget
end

return setmetatable(
    volume,
    {
        __call = function(_, ...)
            return worker(...)
        end
    }
)
