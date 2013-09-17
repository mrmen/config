-- default rc.lua for shifty
--
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty-mod")
local menubar = require("menubar")
-- shifty - dynamic tagging library
local shifty = require("shifty")

os.setlocale("fr_FR.UTF-8")

--
-- My modules
--
require("battery") 
require("mail")
require("luminosity")
require("volume")
require("hardware")
require("vicious_widget")
require("calendar")
require("todo-widget")
require("mocp-mine")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/mrmen/.config/awesome/themes/zenburn/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- Define if we want to use titlebar on all applications.
use_titlebar = false


-- Shifty configured tags.
shifty.config.tags = {
    ["[Term]"] = {
        layout    = awful.layout.suit.max,
        exclusive = false,
        position  = 1,
        init      = false,
        screen    = 1,
        slave     = true,
    },
    ["[Emacs]"] = {
        layout    = awful.layout.suit.max,
        exclusive = true,
        position  = 0,
        init      = true,
        screen    = 1,
        slave     = true,
    },
    ["[Web]"] = {
        layout      = awful.layout.suit.tile.bottom,
        position    = 2,
        spawn       = browser,
	nopopup     = true,
    },
    ["[Mail]"] = {
        layout    = awful.layout.suit.tile,
        exclusive = false,
        position  = 3,
        spawn     = mail,
        slave     = true,
	nopopup     = true,
    },
    ["[Media]"] = {
        layout    = awful.layout.suit.float,
        exclusive = false,
        position  = 5,
	nopopup     = true,
    },
    ["[Office]"] = {
        layout   = awful.layout.suit.tile,
        position = 9,
    },
    ["[Math]"] = {
        layout   = awful.layout.suit.max,
        position = 4,
    },
}
-- SHIFTY: application matching rules
-- order here matters, early rules will be applied first
shifty.config.apps = {
    {
        match = {
            "Navigator",
            "Vimperator",
            "Gran Paradiso",
	    "uzbl-tabbed",
	    "uzbl-browser"
        },
        tag = "[Web]",
    },
    {
        match = {
            "Shredder.*",
            "Thunderbird",
            "mutt",
        },
        tag = "[Mail]",
    },
    {
        match = {
            "pcmanfm",
        },
        slave = true
    },
    {
        match = {
	   "LibreOffice.*",
	   "OpenOffice.*",
	   "Abiword",
	   "Gnumeric",
        },
        tag = "[Office]",
    },
    {
        match = {
	   "Mplayer.*",
	   "Mirage",
	   "gimp",
	   "gtkpod",
	   "Ufraw",
	   "easytag",
	   "vlc",
        },
        tag = "[Media]",
        nopopup = true,
    },
    {
        match = {
            terminal,
	    "URxvt",
	    "xterm",
        },
	tag = "[Term]",
        honorsizehints = false,
    },
    {
        match = {
	   "wxmaxima",
	   "xcas",
	   "geogebra",
        },
        honorsizehints = false,
        tag = "[Math]",
    },
    {    match = {
	   "emacs",
        },
        honorsizehints = false,
        tag = "[Emacs]",
    },

    {
        match = {""},
        buttons = awful.util.table.join(
            awful.button({}, 1, function (c) client.focus = c; c:raise() end),
            awful.button({modkey}, 1, function(c)
                client.focus = c
                c:raise()
                awful.mouse.client.move(c)
                end),
            awful.button({modkey}, 3, awful.mouse.client.resize)
            )
    },
}
-- SHIFTY: default tag creation rules
-- parameter description
--  * floatBars : if floating clients should always have a titlebar
--  * guess_name : should shifty try and guess tag names when creating
--                 new (unconfigured) tags?
--  * guess_position: as above, but for position parameter
--  * run : function to exec when shifty creates a new tag
--  * all other parameters (e.g. layout, mwfact) follow awesome's tag API
shifty.config.defaults = {
    layout = awful.layout.suit.tile.bottom,
    ncol = 1,
    mwfact = 0.60,
    floatBars = true,
    guess_name = true,
    guess_position = true,
}



-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

mytextclock:connect_signal("mouse::enter", function()
			  add_calendar(0)
				       end)
mytextclock:connect_signal("mouse::leave", remove_calendar)

mytextclock:buttons(awful.util.table.join(
		       awful.button({ }, 4, function()
				       add_calendar(-1)
					    end),
		       awful.button({ }, 5, function()
				       add_calendar(1)
					    end)
					 ))


-- Create a wibox for each screen and add it
mywibox = {}
mywibox2 = {}

mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- create second wibox
    mywibox2[s] = awful.wibox({ position = "bottom", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()--fixed
    local left_layout2 = wibox.layout.fixed.horizontal()--fixed
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout2 = wibox.layout.fixed.horizontal()
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout2:add(wibox.widget.systray()) end

-- todo
    right_layout2:add(todo_w)
-- mocp 
    right_layout2:add(mocp_w)
-- from luminosity module
    right_layout2:add(lumin_w)   
-- from volume module
    right_layout2:add(sound_i)
    right_layout2:add(sound_w)
-- from battery module
    right_layout:add(battery_i)
    right_layout:add(battery_w)
-- from mail module
    right_layout2:add(mymail)
-- from hardware module
    right_layout2:add(ram_w)
    right_layout2:add(cputemp)
    right_layout2:add(cpuwidget)


    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    local layout2 = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    layout2:set_middle(right_layout2)

    mywibox[s]:set_widget(layout)
    mywibox2[s]:set_widget(layout2)

end
-- }}}

-- SHIFTY: initialize shifty
-- the assignment of shifty.taglist must always be after its actually
-- initialized with awful.widget.taglist.new()
shifty.taglist = mytaglist
shifty.init()

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
--
-- rasp Pi moc bindings
-- 
    -- awful.key({ }, "XF86AudioPlay",   function ()  awful.util.spawn("bash /home/mrmen/.bin/mocPi.sh pause") end),
    -- awful.key({ }, "XF86AudioPrev",   function ()  awful.util.spawn("bash /home/mrmen/.bin/mocPi.sh previous") end),
    -- awful.key({ }, "XF86AudioNext",   function ()  awful.util.spawn("bash /home/mrmen/.bin/mocPi.sh next") end),
    awful.key({ }, "XF86AudioPlay",   function ()  awful.util.spawn("mocp -G") end),
    awful.key({ }, "XF86AudioPrev",   function ()  awful.util.spawn("mocp -r") end),
    awful.key({ }, "XF86AudioNext",   function ()  awful.util.spawn("mocp -f") end),

    awful.key({ modkey,           }, "p",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "n",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "z", function () mail_check_old("forced") end),

    -- brightness modification for nvidia (look at repo)
    awful.key({ }, "XF86MonBrightnessUp", function ()
		 awful.util.spawn("/home/mrmen/.bright/mod +25")
		 awful.util.spawn("bash /tmp/test.sh")
		 lumin_status()
					  end),
    awful.key({ }, "XF86MonBrightnessDown", function ()
		 awful.util.spawn("/home/mrmen/.bright/mod -25")
		 awful.util.spawn("bash /tmp/test.sh")
		 lumin_status()
					    end),
    -- volume modification
    awful.key({ }, "XF86AudioMute", function ()
		 awful.util.spawn("amixer set Master toggle")
		 sound_status()
				    end),    
    awful.key({ }, "XF86AudioRaiseVolume", function ()
		 awful.util.spawn("amixer set Master,0 1+")-- 650 because of pulseaudio
		 sound_status()
					   end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
		 awful.util.spawn("amixer set Master,0 1-")
		 sound_status()
					   end),
    -- lock your screen
    -- !!
    -- !! require xlock
    awful.key({ }, "XF86Eject", function () awful.util.spawn("slock") end),
--    awful.key({ }, "F5", function () awful.util.spawn("bash /home/mrmen/.config/awesome/touchpad-toggle.sh") end),
    
    -- awful.key({ modkey,      }, "z",
    -- 	      function ()
    -- 		 awful.menu.menu_keys.down = { "Down", "Alt_L" }
    -- 		 local cmenu = awful.menu.clients({width=400}, {keygrabber=true, coords={x=0, y=10}})
    -- 	      end),

    -- Shifty: keybindings specific to shifty
    awful.key({modkey, "Shift"}, "d", shifty.del), -- delete a tag
    awful.key({modkey, "Shift"}, "s", shifty.send_prev), -- client to prev tag
    awful.key({modkey}, "s", shifty.send_next), -- client to next tag
    awful.key({modkey, "Control"},
              "n",
              function()
                  local t = awful.tag.selected()
                  local s = awful.util.cycle(screen.count(), awful.tag.getscreen(t) + 1)
                  awful.tag.history.restore()
                  t = shifty.tagtoscr(s, t)
                  awful.tag.viewonly(t)
              end),
    awful.key({modkey}, "a", shifty.add), -- creat a new tag
    awful.key({modkey, "Shift"}, "r", shifty.rename), -- rename a tag
    awful.key({modkey, "Shift"}, "a", -- nopopup new tag
    function()
        shifty.add({nopopup = true})
    end),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    --~ awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "b", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "g",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- SHIFTY: assign client keys to shifty for use in
-- match() function(manage hook)
shifty.config.clientkeys = clientkeys
shifty.config.modkey = modkey

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, (shifty.config.maxtags or 9) do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                      awful.tag.viewonly(shifty.getpos(i))
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      awful.tag.viewtoggle(shifty.getpos(i))
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local t = shifty.getpos(i)
                          awful.client.movetotag(t)
                          awful.tag.viewonly(t)
                       end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          awful.client.toggletag(shifty.getpos(i))
                      end
                  end))
end

-- Set keys
root.keys(globalkeys)
-- }}}

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- }}}

-- {{{ Rules
awful.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    -- Application specific rules
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "Sozi.py" },
      properties = { floating = true } },
    { rule = { class = "Gtk-recordMyDesktop" },
      properties = { floating = true } },
}
-- }}}
