-- Awesome WM cpu widget
-- Author: tilleyd
-- Based on Pavel Mahov's widget from
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/cpu-widget

local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local beautiful = require("beautiful")

-- A smaller command, less resource intensive, used when popup is not shown.
local CPU_CMD = [[sh -c "grep '^cpu.' /proc/stat | head -n 1" ]]
local SYSMON_CMD = [[alacritty -e htop]]

local ICON_DIR = os.getenv("HOME") .. "/.config/awesome/icons/widgets/"

local cpu_widget = {}

local function worker(user_args)

    local args = user_args or {}

    local refresh_rate = args.refresh_rate or 1

    local cpu_widget = wibox.widget {
        {
            {
                {
                    {
                        id = "icon",
                        image = ICON_DIR .. "cpu.png",
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
        bg = beautiful.widget_bg_cpu,
        fg = beautiful.widget_fg_cpu,
        widget = wibox.container.background,

        set_cpu = function(self, value)
            local val_str = string.format("% 4.0f%%", value)
            self:get_children_by_id("label")[1]:set_text(val_str)
        end,
    }

    cpu_widget:buttons(
        awful.util.table.join(
            awful.button(
                {},
                1,
                function()
                    spawn.easy_async(SYSMON_CMD, function(_) end)
                end
            )
        )
    )

    local maincpu = {}

    watch(
        CPU_CMD,
        refresh_rate,
        function(widget, stdout)
            local _, user, nice, system, idle, iowait, irq, softirq, steal, _, _ =
                stdout:match('(%w+)%s+(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)')

            local total = user + nice + system + idle + iowait + irq + softirq + steal

            local diff_idle = idle - tonumber(maincpu['idle_prev'] == nil and 0 or maincpu['idle_prev'])
            local diff_total = total - tonumber(maincpu['total_prev'] == nil and 0 or maincpu['total_prev'])
            local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

            maincpu['total_prev'] = total
            maincpu['idle_prev'] = idle

            widget:set_cpu(diff_usage)
        end,
        cpu_widget
    )

    return cpu_widget
end

return setmetatable(
    cpu_widget,
    {
        __call = function(_, ...)
            return worker(...)
        end
    }
)
