local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

local function viewTag(index)
    local screen = awful.screen.focused()
    local tag = screen.tags[index]

    if index == 0 then
        tag = screen.tags[10]
    end

    if tag then
        tag:view_only()
    end
end

local function toggleTag(index)
    local screen = awful.screen.focused()
    local tag = screen.tags[index]

    if index == 0 then
        tag = screen.tags[10]
    end

    if tag then
        awful.tag.viewtoggle(tag)
    end
end

local function moveClientToTag(index)
    if client.focus then
        local tag = client.focus.screen.tags[index]

        if index == 0 then
            tag = client.focus.screen.tags[10]
        end

        if tag then
            client.focus:move_to_tag(tag)
        end
    end
end

local function toggleClientOnTag(index)
    if client.focus then
        local tag = client.focus.screen.tags[index]

        if index == 0 then
            tag = client.focus.screen.tags[10]
        end

        if tag then
            client.focus:toggle_tag(tag)
        end
    end
end

local function selectLayout(index)
    local t = awful.screen.focused().selected_tag
    if t then
        t.layout = t.layouts[index] or t.layout
    end
end

awful.keyboard.append_global_keybindings(
    {
        awful.key {
            modifiers = {modkey},
            keygroup = "numrow",
            description = "only view tag",
            group = "tag",
            on_press = viewTag
        },
        awful.key {
            modifiers = {modkey, "Control"},
            keygroup = "numrow",
            description = "toggle tag",
            group = "tag",
            on_press = toggleTag
        },
        awful.key {
            modifiers = {modkey, "Shift"},
            keygroup = "numrow",
            description = "move focused client to tag",
            group = "tag",
            on_press = moveClientToTag
        },
        awful.key {
            modifiers = {modkey, "Control", "Shift"},
            keygroup = "numrow",
            description = "toggle focused client on tag",
            group = "tag",
            on_press = toggleClientOnTag
        },
        awful.key {
            modifiers = {modkey},
            keygroup = "numpad",
            description = "select layout directly",
            group = "layout",
            on_press = selectLayout
        }
    }
)
