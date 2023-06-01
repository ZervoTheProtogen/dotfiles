local gears = require("gears")
local naughty = require("naughty")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {modkey},
            "s",
            function()
                hotkeys_popup.show_help(nil, awful.screen.focused())
            end,
            {description = "show help", group = "awesome"}
        ),
        awful.key(
            {modkey, "Shift"},
            "r",
            function()
                awesome.restart()
                naughty.notify({title = "Achtung!", text = "You're idling", timeout = 0})
            end,
            {description = "reload awesome", group = "awesome"}
        ),
        awful.key({modkey, "Shift"}, "e", awesome.quit, {description = "quit awesome", group = "awesome"}),
        awful.key(
            {modkey, "Shift"},
            "s",
            function()
                awful.spawn("slock")
            end,
            {description = "lock screen", group = "awesome"}
        )
    }
)
