-- Awesome WM clock widget
-- Author: tilleyd

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")

local CLOCK_CMD = "date +' %a %-d %b %H:%M:%S'"
local ICON_DIR = os.getenv("HOME") .. "/.config/awesome/icons/widgets/"

local clock = {}

local function worker(user_args)

    local args = user_args or {}

    local refresh_rate = args.refresh_rate or 1
    local icon_dir = args.icon_dir or ICON_DIR

    clock.widget = wibox.widget {
        {
            {
                {
                    {
                        image = ICON_DIR .. "clock.png",
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
        bg = beautiful.widget_bg_clock,
        fg = beautiful.widget_fg_clock,
        widget = wibox.container.background,

        set_time = function(self, time)
            self:get_children_by_id("label")[1]:set_text(time)
        end,
    }

    local function update_widget(widget, stdout)
        widget:set_time(stdout)
    end

    watch(CLOCK_CMD, refresh_rate, update_widget, clock.widget)

    return clock.widget
end

return setmetatable(clock, { __call = function(_, ...) return worker(...) end })
