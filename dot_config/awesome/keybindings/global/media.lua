local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {},
            "XF86AudioPlay",
            function()
                awful.spawn("playerctl --player=spotify,%any play-pause", false)
            end,
            {description = "Play or Pause media", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioPrev",
            function()
                awful.spawn("playerctl --player=spotify,%any previous", false)
            end,
            {description = "Previous media", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioNext",
            function()
                awful.spawn("playerctl --player=spotify,%any next", false)
            end,
            {description = "Next media", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioRaiseVolume",
            function()
                awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%", false)
            end,
            {description = "Increase Volume", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioLowerVolume",
            function()
                awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%", false)
            end,
            {description = "Decrease Volume", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioMute",
            function()
                awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false)
            end,
            {description = "Mute Audio", group = "media"}
        ),
        awful.key(
            {},
            "XF86AudioMicMute",
            function()
                awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle", false)
            end,
            {description = "Mute Microphone", group = "media"}
        )
    }
)
