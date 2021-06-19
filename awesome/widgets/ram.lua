-- Awesome WM RAM widget
-- Author: tilleyd

local awful = require("awful")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local MEM_CMD = [[bash -c "free | grep -z Mem.*Swap.*"]]
local ICON_DIR = os.getenv("HOME") .. "/.config/awesome/icons/widgets/"

local ram_widget = {}

local function worker(user_args)
    local args = user_args or {}
    local refresh_rate = args.refresh_rate or 1
    local color_used = args.color_used or beautiful.bg_urgent
    local color_free = args.color_free or beautiful.fg_normal
    local color_buf  = args.color_buf  or beautiful.border_color_active
    local widget_show_buf = args.widget_show_buf or false

    ram_widget = wibox.widget {
        {
            {
                {
                    {
                        id = "icon",
                        image = ICON_DIR .. "ram.png",
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
        bg = beautiful.widget_bg_ram,
        fg = beautiful.widget_fg_ram,
        widget = wibox.container.background,

        update_value = function(self)
            local val_str
            if self.show_gb then
                -- Show GB used
                local gb = 1024*1024
                val_str = string.format(" %4.1f/%4.1f GiB", self.used / gb, self.total / gb)
            else
                -- Show a percentage
                val_str = string.format("% 4.0f%%", 100 * (self.used / self.total))
            end
            self:get_children_by_id("label")[1]:set_text(val_str)

        end,

        set_ram = function(self, bytes_used, bytes_total)
            self.used = bytes_used
            self.total = bytes_total
            self:update_value()
        end,

        toggle_view = function(self)
            self.show_gb = not self.show_gb
            self:update_value()
        end,
    }

    ram_widget:buttons(
        awful.util.table.join(
            awful.button(
                {},
                1,
                function()
                    ram_widget:toggle_view()
                end
            )
        )
    )

    --luacheck:ignore 231
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap

    watch(
        MEM_CMD,
        refresh_rate,
        function(widget, stdout)
            total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
                stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')

            widget:set_ram(used, total)
        end,
        ram_widget
    )

    return ram_widget
end


return setmetatable(
    ram_widget,
    {
        __call = function(_, ...)
            return worker(...)
        end
    }
)
