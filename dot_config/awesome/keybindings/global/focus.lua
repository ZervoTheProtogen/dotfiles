local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        -- Focus by direction
        awful.key(
            {modkey},
            "Right",
            function()
                awful.client.focus.global_bydirection("right")
            end,
            {description = "focus right", group = "client"}
        ),
        awful.key(
            {modkey},
            "Left",
            function()
                awful.client.focus.global_bydirection("left")
            end,
            {description = "focus left", group = "client"}
        ),
        awful.key(
            {modkey},
            "Up",
            function()
                awful.client.focus.global_bydirection("up")
            end,
            {description = "focus up", group = "client"}
        ),
        awful.key(
            {modkey},
            "Down",
            function()
                awful.client.focus.global_bydirection("down")
            end,
            {description = "focus down", group = "client"}
        ),
        -- HMM
        awful.key(
            {modkey},
            "Tab",
            function()
                awful.client.focus.history.previous()
                if client.focus then
                    client.focus:raise()
                end
            end,
            {description = "go back", group = "client"}
        ),
        awful.key(
            {modkey},
            "p",
            function()
                awful.screen.focus_relative(1)
            end,
            {description = "focus the next screen", group = "screen"}
        ),
        awful.key(
            {modkey, "Shift"},
            "p",
            function()
                awful.screen.focus_relative(-1)
            end,
            {description = "focus the previous screen", group = "screen"}
        ),
        awful.key(
            {modkey, "Control"},
            "n",
            function()
                local c = awful.client.restore()
                -- Focus restored client
                if c then
                    c:activate {raise = true, context = "key.unminimize"}
                end
            end,
            {description = "restore minimized", group = "client"}
        )
    }
)
