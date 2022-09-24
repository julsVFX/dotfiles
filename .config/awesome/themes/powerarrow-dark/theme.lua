--[[

     Powerarrow Dark Awesome WM theme
     github.com/lcpz

--]]
local vicious = require("vicious")
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local nvidia_widget = require("awesome-wm-widgets.cpu-widget.nvidia-widget")
local ram_widget = require("awesome-wm-widgets.ram-widget.ram-graph-widget")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local common = require("awful.widget.common")
naughty = require('naughty')  

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-dark"
theme.wallpaper                                 = theme.dir .. "/mountains8.jpg"
theme.font                          = "SF Pro Display Bold 11" --"Terminus 9"
theme.fg_focus                      = "#E6E6E6"
theme.fg_normal                     = theme.fg_focus    --"#DDDDFF"
theme.fg_urgent                     = "#CC9393"
theme.bg_normal                     = "#323232"--"#1A1A1A"
theme.bg_focus                      = "#545454"--"#313131"
theme.bg_focus2                     = "#313131"--"#615C50"
theme.bar_normal                    = "#212121"
theme.bg_urgent                     = "#1A1A1A"
theme.border_width                  = dpi(3)
theme.border_normal                 = "#3B3B3B"
theme.border_focus                  = theme.bg_focus --"#667177"
theme.border_marked                 = "#CC9393"
theme.titlebar_fg_normal            = "#676767" --"#3F3F3F"
theme.titlebar_bg_normal            = theme.bg_focus2 --"#3F3F3F"
theme.titlebar_bg_focus             = theme.titlebar_bg_normal
theme.taglist_font                  = "SF Pro Display Bold 13"
theme.taglist_fg_focus              = theme.fg_focus
--theme.taglist_bg_occupied           = "#262626"
theme.taglist_fg_occupied           = "#737373"
--theme.taglist_bg_occupied           = "#424242"
theme.tasklist_bg_focus             = "#1A1A1A"
theme.tasklist_fg_focus             = "#5a6266"  --"#D8D782"
theme.tasklist_bg_image_focus       = gears.surface.load_from_shape(dpi(30), dpi(2), gears.shape.rectangle, theme.fg_focus)
theme.textbox_widget_margin_top     = 1
theme.notify_fg                     = theme.fg_normal
theme.notify_bg                     = theme.bg_normal
theme.notify_border                 = theme.border_focus
theme.awful_widget_height           = 14
theme.awful_widget_margin_top       = 2
theme.mouse_finder_color            = "#CC9393"
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.awesome_icon_launcher                     = theme.dir .. "/icons/awesome_icon.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
--theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
--theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_bat_100                            = theme.dir .. "/icons/bat_100.png"
theme.widget_bat_80                             = theme.dir .. "/icons/bat_80.png"
theme.widget_bat_60                             = theme.dir .. "/icons/bat_60.png"
theme.widget_bat_40                             = theme.dir .. "/icons/bat_40.png"
theme.widget_bat_20                             = theme.dir .. "/icons/bat_20.png"
theme.widget_bat_0                              = theme.dir .. "/icons/bat_0.png"
theme.widget_bat                                = theme.dir .. "/icons/bat.png"
theme.widget_bat_charge                         = theme.dir .. "/icons/bat_charge.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_nvidia                             = theme.dir .. "/icons/nvidia_lgt.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_vpn                                = theme.dir .. "/icons/vpn_logo.png"
theme.widget_trixter                            = theme.dir .. "/icons/trixter_logo.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = dpi(3)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_unfocus.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"



local markup = lain.util.markup
local separators = lain.util.separators

--sel vertical ramp for tasklist
local barcolor = gears.color({
    type  = "linear",
    from  = { dpi(18), 0 },
    to    = { dpi(18), dpi(25) },
    stops = { {0.0, theme.bg_focus2}, {1.0, theme.bg_normal} }
})

--tasklist settings
--[[
function list_update(w, buttons, label, data, objects)
    -- call default widget drawing function
    common.list_update(w, buttons, label, data, objects)
    -- set widget size
    w:vertical()
    w:horizontal()
    w:fit(dpi(25), dpi(25))
    w:set_max_widget_size(dpi(15))
end
--]]

theme.taglist_shape = function(cr, w, h)
    return gears.shape.rounded_rect(cr, w, h, dpi(5))
end

local mytagbuttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )


local mytasklistbuttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))


--Tabs
-- For tabbed only
theme.tabbed_spawn_in_tab = false  -- whether a new client should spawn into the focused tabbing container

-- For tabbar in general
theme.tabbar_ontop  = false
theme.tabbar_radius = 20                -- border radius of the tabbar
theme.tabbar_style = "default"         -- style of the tabbar ("default", "boxes" or "modern")
theme.tabbar_font = theme.font         -- font of the tabbar
theme.tabbar_size = 24                 -- size of the tabbar
theme.tabbar_position = "bottom"          -- position of the tabbar
theme.tabbar_bg_normal = theme.bg_normal     -- background color of the focused client on the tabbar
theme.tabbar_fg_normal = theme.fg_normal     -- foreground color of the focused client on the tabbar
theme.tabbar_bg_focus  = theme.bg_focus     -- background color of unfocused clients on the tabbar
theme.tabbar_fg_focus  = theme.fg_focus     -- foreground color of unfocused clients on the tabbar
theme.tabbar_bg_focus_inactive = nil   -- background color of the focused client on the tabbar when inactive
theme.tabbar_fg_focus_inactive = nil   -- foreground color of the focused client on the tabbar when inactive
theme.tabbar_bg_normal_inactive = nil  -- background color of unfocused clients on the tabbar when inactive
theme.tabbar_fg_normal_inactive = nil  -- foreground color of unfocused clients on the tabbar when inactive
theme.tabbar_disable = false           -- disable the tab bar entirely

-- the following variables are currently only for the "modern" tabbar style
--[[theme.tabbar_color_close = "#f9929b" -- chnges the color of the close button
theme.tabbar_color_min   = "#fbdf90" -- chnges the color of the minimize button
theme.tabbar_color_float = "#ccaced" -- chnges the color of the float button
--]]

-- Launcher
local mylauncher = awful.widget.button({ image = theme.awesome_icon_launcher })
mylauncher:connect_signal("button::press", function() awful.util.mymainmenu:toggle() end)

--vicious widgets
--CPU
cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_background_color"#313131"
cpuwidget:set_color{type = "linear", from = {0, 0}, to = {0, 50},
                    stops = {{0, "#0072B3"}, {0.5, "#2D82B3"}, {1, "#5A92B3"}}}
vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 3)

--RAM
memwidget = awful.widget.graph()
memwidget:set_width(50)
memwidget:set_background_color"#1A1A1A"
memwidget:set_color{type = "linear", from = {0, 0}, to = {0, 50},
                    stops = {{0, "#00B35B"}, {0.5, "#00FF82"}, {1, "#AAF5D0"}}}
vicious.register(memwidget, vicious.widgets.mem, "$1", 3)



-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch(
    "date +'􀉉 %a, %d %b   􀐫 %R'", 60,
    function(widget, stdout)
        widget:set_markup(" " .. markup.font(theme.font, stdout))
    end
)

-- Calendar
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local cw = calendar_widget({
    theme = 'outrun',
    radius = 8,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})
clock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

--[[theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})--]]

-- Mail IMAP check
local mailicon = wibox.widget.imagebox(theme.widget_mail)
--[[ commented because it needs to be set before use
mailicon:buttons(my_table.join(awful.button({ }, 1, function () awful.spawn(mail) end)))
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            widget:set_markup(markup.font(theme.font, " " .. mailcount .. " "))
            mailicon:set_image(theme.widget_mail_on)
        else
            widget:set_text("")
            mailicon:set_image(theme.widget_mail)
        end
    end
})
--]]

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function () awful.spawn.with_shell(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        theme.mpd.update()
    end)))
theme.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            mpdicon:set_image(theme.widget_music)
        end

        widget:set_markup(markup.font(theme.font, markup("#EA6F81", artist) .. title))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. string.format("%.2f", mem_now.used) .. "GB "))
    end
})

-- NVIDIA
local nvidiaicon = wibox.widget.imagebox(theme.widget_nvidia)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]


-- Battery
--[[
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                baticon:set_image(theme.widget_bat_charge)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 10 then
                baticon:set_image(theme.widget_bat_0)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 20 then
                baticon:set_image(theme.widget_bat_20)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 40 then
                baticon:set_image(theme.widget_bat_40)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 60 then
                baticon:set_image(theme.widget_bat_60)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 75 then
                baticon:set_image(theme.widget_bat_80)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 90 then
                baticon:set_image(theme.widget_bat_100)
            else
                baticon:set_image(theme.widget_bat)
            end
            --widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            --widget:set_markup(markup.font(theme.font, " AC "))
            baticon:set_image(theme.widget_ac)
        end
    end
})--]]
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")


-- ALSA volume
--[[
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.pulse({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(theme.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(theme.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(theme.widget_vol_low)
        else
            volicon:set_image(theme.widget_vol)
        end

        widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
    end
})
--]]

-- Net
local vpn_check_cmd = 'cn=$(nmcli con); if [[ $(echo "$cn" | grep "ihleju" | tr -s " " | cut -d " " -f4) != "--" ]]; then echo "trixter"; elif [[ $(echo "$cn" | egrep "^tun0" | tr -s " " | cut -d " " -f4) == "tun0" ]]; then echo "vpn"; else echo ""; fi'
--local neticon = wibox.widget.imagebox(theme.widget_net)
local neticon = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = false
    },
    layout = wibox.container.margin(_, 0, 0, 3)
}

local function split_str(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

awful.widget.watch(
    "bash -c '" .. vpn_check_cmd .. "'", 3,
    function(widget, stdout)
        if string.match(stdout, "vpn") then
            widget.icon:set_image(theme.widget_vpn)
        elseif string.match(stdout, "trixter") then
            widget.icon:set_image(theme.widget_trixter)
        else 
            widget.icon:set_image(theme.widget_net)
        end
    end,
    neticon
)

local netspeed_down = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = true
    },
    layout = wibox.container.margin(_, 0, 0, 3)
}
local netspeed_up = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = true
    },
    layout = wibox.container.margin(_, 0, 0, 3)
}

local function clamp(val, min, max)
    if val > max then
        return max
    elseif val < min then
        return min
    else 
        return val
    end
end

awful.widget.watch(
    "sh -c \"ifstat -qwnT 1 1 | tail -1 | tr -s ' ' | rev | cut -d ' ' -f1-2 | rev\"", 2,
    function(widget, stdout)
        local img_path = '/home/julius/.config/awesome/themes/powerarrow-dark/icons/'
        local down = tonumber(split_str(stdout)[1])
        local down_img_id = clamp(math.floor(down/100)*10, 0, 100)
        local down_img = img_path .. 'download_' .. down_img_id .. '.png'
        widget.icon:set_image(down_img)
    end,
    netspeed_down
)

awful.widget.watch(
    "sh -c \"ifstat -qwnT 1 1 | tail -1 | tr -s ' ' | rev | cut -d ' ' -f1-2 | rev\"", 2,
    function(widget, stdout)
        local img_path = '/home/julius/.config/awesome/themes/powerarrow-dark/icons/'
        local up = tonumber(split_str(stdout)[2])
        local up_img_id = clamp(math.floor(up/100)*10, 0, 100)
        local up_img = img_path .. 'upload_' .. up_img_id .. '.png'
        widget.icon:set_image(up_img)
    end,
    netspeed_up
)

--[[
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.font(theme.font,
                          markup("#7AC82E", " " .. net_now.received)
                          .. " " ..
                          markup("#46A8C3", " " .. net_now.sent .. " ")))
    end
})--]]

-- Separators
local spr     = wibox.widget.textbox('  ')
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)


--shape for wibar
function wibar_shape(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(6))
end

--generic shape for clock, etc
function generic_shape(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(6))
end


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = "mate-terminal" })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))



    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter = function() return true end, -- Filtering is already done in source
        source = function()
            -- Get all clients
            local cls = client.get()

            -- Filter by an existing filter function and allowing only one client per class
            local result = {}
            local class_seen = {}
            for _, c in pairs(cls) do
                if awful.widget.tasklist.filter.alltags(c, s) then
                    if not class_seen[c.class] then
                        class_seen[c.class] = #result + 1
                        table.insert(result, c)
                    elseif client.focus == c then 
                        result[class_seen[c.class]] = c
                    end
                end
            end
            return result
        end,
        buttons  = tasklist_buttons,
        layout   = {
            spacing_widget = {
                {
                    forced_width  = 5,
                    forced_height = 12,
                    thickness     = 1,
                    color         = '#777777',
                    widget        = wibox.widget.separator
                },
                valign = 'center',
                halign = 'center',
                widget = wibox.container.place,
            },
            spacing = 10,
            layout  = wibox.layout.fixed.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                wibox.widget.base.make_widget(),
                forced_height = 2,
                id            = 'background_role',
                widget        = wibox.container.background,
            },
            {
                {
                    id     = 'clienticon',
                    widget = awful.widget.clienticon,
                },
                margins = 1,
                widget  = wibox.container.margin
            },
            nil,
            create_callback = function(self, c, index, objects) --luacheck: no unused args
                self:get_children_by_id('clienticon')[1].client = c
            end,
            layout = wibox.layout.align.vertical,
        },
    }

    tl = wibox.container.background(s.mytasklist, theme.bg_normal)
    --pl = wibox.container.margin(tl, 0, 0, 0, 0)
    tasklist = wibox.container.place(tl, {halign="center", halign="center"})




    --fancy taglist
    local fancy_taglist = require("fancy_taglist")
    s.mytaglist = fancy_taglist.new({
        screen = s,
        taglist = { buttons = mytagbuttons },
        tasklist = { buttons = mytasklistbuttons }
    })


    -- Create a taglist widget
    --s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    --dummy wibox for top margins
    awful.wibox({ screen = s, height = 7, bg = "#00000000", })
    
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(28), width = dpi(1900), bg = theme.bg_normal, fg = theme.fg_normal, border_width = dpi(4), border_color = theme.bg_normal, shape = wibar_shape })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            spr,
        },
        {-- Middle widget
            --expand = "none",
            layout = wibox.layout.fixed.horizontal,
            clock,--wibox.container.background(clock, theme.bar_normal, generic_shape),
        },        
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --wibox.container.background(spr, theme.bg_focus),
            --arrl_dl,
            --wibox.container.background(mpdicon, theme.bg_focus),
            --wibox.container.background(theme.mpd.widget, theme.bg_focus),
            -- default
            --volume_widget(),
            -- customized
            --[[spotify_widget({
               font = 'Ubuntu Mono 9',
               play_icon = '/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg',
               pause_icon = '/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg'
            }),--]]
            --arrl_ld,
            --volicon,
            --spotify_widget(),
            spr,
            --wibox.container.background(mailicon, theme.bg_focus),
            --wibox.container.background(theme.mail.widget, theme.bg_focus),
            --nvidia
            nvidiaicon,
            nvidia_widget(),
            spr,
            memicon,
            --wibox.container.background(mem.widget, theme.bg_focus),
            ram_widget(),
            spr,
           -- memwidget,
            cpuicon,
            cpu_widget(), --pavel widget   
            spr,        
            --wibox.container.background(cpu.widget, theme.bg_focus),
            --[[cpu_widget({
                width = 70,
                step_width = 2,
                step_spacing = 0,
                color = "#1A1A1A"
            }),--]]
            --fsicon,
            --fs_widget(),            
            --tempicon,
            --temp.widget,
            --arrl_ld,
            --wibox.container.background(fsicon, theme.bg_focus),
            --wibox.container.background(theme.fs.widget, theme.bg_focus),
            battery_widget,
            spr,
            neticon,
            netspeed_down,--net.widget,
            netspeed_up,
            wibox.widget.systray(),
            spr,
            s.mylayoutbox,
        },
    }
end

return theme
