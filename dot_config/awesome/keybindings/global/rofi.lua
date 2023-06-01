local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {modkey},
            "d",
            function()
                awful.spawn("rofi -combi-modi drun,window -show drun")
            end,
            {description = "rofi for drun and windows", group = "rofi"}
        ),
        awful.key(
            {modkey},
            "x",
            function()
                awful.spawn("rofimoji")
            end,
            {description = "Emoji Selector", group = "rofi"}
        ),
        awful.key(
            {modkey},
            "q",
            function()
                awful.spawn("rofi -show calc -modi calc -no-show-match -no-sort")
            end,
            {description = "Calculator", group = "rofi"}
        )
    }
)
