-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
local theme = gears.filesystem.get_configuration_dir() .. "themes/2023.lua"

tagNames = {"󱓞 1", "󰈮 2", " 3", "󰇮 4", "󰦑 5", "󰭻 6", "󰝚 7", "󱛉 8", "󰊴 9", "󰖟 10"}

local mytextclock = wibox.widget.textclock("%H:%M:%S", 1)
local month_calendar = awful.widget.calendar_popup.month()
month_calendar:attach(mytextclock, "tc")

local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

screen.connect_signal(
    "request::desktop_decoration",
    function(s)
        -- Each screen has its own tag table.
        -- awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, awful.layout.layouts[1])
        -- awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, s, awful.layout.layouts[1])
        -- Each screen has its own tag table.
        local l = awful.layout.suit -- Just to save some typing: use an alias.
        local layouts = {
            l.floating,
            l.fair,
            l.fair,
            l.tile,
            l.tile,
            l.max,
            l.tile,
            l.fair,
            l.tile,
            l.fair
        }
        awful.tag(tagNames, s, layouts)

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox =
            awful.widget.layoutbox {
            screen = s,
            buttons = {
                awful.button(
                    {},
                    1,
                    function()
                        awful.layout.inc(1)
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    4,
                    function()
                        awful.layout.inc(-1)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function()
                        awful.layout.inc(1)
                    end
                )
            }
        }

        -- Create a taglist widget
        s.mytaglist =
            awful.widget.taglist {
            screen = s,
            filter = awful.widget.taglist.filter.all,
            buttons = {
                awful.button(
                    {},
                    1,
                    function(t)
                        t:view_only()
                    end
                ),
                awful.button(
                    {modkey},
                    1,
                    function(t)
                        if client.focus then
                            client.focus:move_to_tag(t)
                        end
                    end
                ),
                awful.button({}, 3, awful.tag.viewtoggle),
                awful.button(
                    {modkey},
                    3,
                    function(t)
                        if client.focus then
                            client.focus:toggle_tag(t)
                        end
                    end
                ),
                awful.button(
                    {},
                    4,
                    function(t)
                        awful.tag.viewprev(t.screen)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function(t)
                        awful.tag.viewnext(t.screen)
                    end
                )
            }
        }

        -- Create a tasklist widget
        s.mytasklist =
            awful.widget.tasklist {
            screen = s,
            filter = awful.widget.tasklist.filter.currenttags,
            buttons = {
                awful.button(
                    {},
                    1,
                    function(c)
                        c:activate {context = "tasklist", action = "toggle_minimization"}
                    end
                ),
                awful.button(
                    {},
                    3,
                    function()
                        awful.menu.client_list {theme = {width = 250}}
                    end
                ),
                awful.button(
                    {},
                    4,
                    function()
                        awful.client.focus.byidx(-1)
                    end
                ),
                awful.button(
                    {},
                    5,
                    function()
                        awful.client.focus.byidx(1)
                    end
                )
            }
        }

        -- Create the wibox
        s.mywibox =
            awful.wibar {
            position = "top",
            screen = s,
            height = "20",
            widget = {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                {
                    -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    s.mytaglist,
                    --mylauncher,
                    s.mypromptbox
                },
                {
                    layout = wibox.layout.fixed.horizontal,
                    mytextclock
                    --wibox.layout.margin(wibox.widget.systray(), 3, 3, 3, 3)
                },
                {
                    -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    battery_widget(),
                    -- wibox.widget.textbox("|"),
                    -- mykeyboardlayout,
                    wibox.widget.textbox("|"),
                    wibox.container.margin(s.mylayoutbox, 3, 3, 3, 3)
                }
            }
        }
    end
)
