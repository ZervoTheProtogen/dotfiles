local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {modkey},
            "Return",
            function()
                awful.spawn(terminal)
            end,
            {description = "open a terminal", group = "launcher"}
        )
        -- awful.key(
        --     {modkey},
        --     "r",
        --     function()
        --         awful.screen.focused().mypromptbox:run()
        --     end,
        --     {description = "run prompt", group = "launcher"}
        -- )
        -- awful.key(
        --     {modkey},
        --     "p",
        --     function()
        --         menubar.show()
        --     end,
        --     {description = "show the menubar", group = "launcher"}
        -- )
    }
)
