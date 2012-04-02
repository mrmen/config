--     ____                  __
--    |    |      |         /  \
--    | ___|___   |        /____\
--    | \  |    _ |    |  |      \
--    |  \ |___/ \|____|__|       \
--             \_/
-- 
-- 
-- A vast part of this code has been found over the 
-- net. Have a look on many website and you'll find 
-- my sources. :-)
-- 
-- ################################################
-- 
--   What does it contain ?
-- - Widgets
--   * Ram widget based on vicious
--   * Cpu widget based on vicious
--   * Battery monitor (from http://blog.mitemitreski.com/2011/05/small-remake-of-acpitool-based-power.html)
--      !!
--      !! this script require acpitool
--      !!
--   * Mail widget written in Python (inspired from wiki)
--   * Pacman widget based on vicious
-- - Shortcuts
--   all (almost) scripts called with shortcuts can be found on my repo
-- - Some code have been modified into
--    /usr/share/awesome/lib/awful/widget/tasklist
--    The results is also given in the repo
-- 
-- ################################################
-- 
-- This config file require some libs :
-- - awful   \
--            = defaults ?
-- - naughty /
-- - vicious  : to have widgets 



-- 
-- {{{ Libs import
-- 
-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")

-- Notification library
require("naughty") 

-- vicious lib to have some widget
require("vicious")
-- }}}


-- 
-- {{{ Setting locales
-- 
os.setlocale("fr_FR.UTF-8", "time")
-- }}}




-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(".config/awesome/themes/zenburn/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt" or "xterm" -- remove tmux if you don't use
editor = os.getenv("EDITOR") or "nano"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
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
   
   -- {{{ Tags
   -- Define a tag table which hold all screen tags.
   tags = {
      names = {"Main", "Web", "Multimedia", "LaTeX", "RedStar", "Stage"}
   }
   for s = 1, screen.count() do
      -- Each screen has its own tag table.
      tags[s] = awful.tag(tags.names, s, layouts[10])
   end
   -- }}}
   
   -- {{{ Menu
   -- Create a laucher widget and a main menu
   -- add what you want :-)
   myawesomemenu = {
      { "manual", terminal .. " -e man awesome" },
      { "emacs configuration", terminal .. "-e e .emacs"},
      { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
      { "restart", awesome.restart },
      { "quit", awesome.quit }
   }
   
   mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
				       { "open terminal", terminal }
				     }
			   })
   
   mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
					menu = mymainmenu })
   -- }}}
   
   -- {{{ Wibox
   -- Create a textclock widget
   mytextclock = awful.widget.textclock({ align = "right" })
   -- Create a systray
   mysystray = widget({ type = "systray" })
   -- 
   -- 
   -- {{{
   -- Mes widget
   -- 
   -- A box to have a conky bar on the bottom of your screen
   -- 
   -- create a box for conky
   --   mystatusbar = awful.wibox({ position = "bottom", screen = 1, ontop = false, width = 1, height = 16 })
   -- 
   -- Battery monitor
   --   
   mybattmon = widget({ type = "textbox", name = "mybattmon", align = "right" })
   function battery_status ()
      local output={} --output buffer
      local fd=io.popen("acpitool -b", "r") --list present batteries
      local line=fd:read()
      while line do --there might be several batteries.
   	 local battery_num = string.match(line, "Battery \#(%d+)")
   	 local battery_load = string.match(line, " (%d*\.%d+)%%")
   	 local time_rem = string.match(line, "(%d+\:%d+)\:%d+")
   	 local discharging
   	 if string.match(line, "discharging")=="discharging" then --discharging: always red
   	    discharging="<span color=\"#CC7777\">-"
   	 elseif tonumber(battery_load)>85 then --almost charged
   	    discharging="<span color=\"#77CC77\">-"
   	 else --charging
   	    discharging="<span color=\"#DCDCCC\">+" --#CCCC77\">ch"
   	 end
   	 table.insert(output, discharging..battery_load.."%".."</span>")
   	 line=fd:read() --read next line
      end
      return table.concat(output," ")
   end
   mybattmon.text = " " .. battery_status() .. " "
   -- add a timer
   my_battmon_timer=timer({timeout=60})
   my_battmon_timer:add_signal("timeout", function()
   				  mybattmon.text = " " .. battery_status() .. " "
   					  end)
   my_battmon_timer:start()
   -- 
   -- Ram widget
   -- 
   memwidget = widget({ type = "textbox" })
   vicious.register(memwidget, vicious.widgets.mem," RAM $1%", 13)
   -- if you want more eye candy
   -- "<span weight='bold'>RAM :</span> <span color='green'>$1%</span> |", 13)
   -- 
   -- Cpu widget (temp)
   -- 
   -- cputemp = widget({ type = "textbox" })
   -- vicious.register(thermalwidget, vicious.widgets.thermal, "CPU ",19,"thermal_zone0"})
   -- vicious.register(cputemp, vicious.widgets.thermal, "<span color='orange'>$1 °C</span> | ", 19, {"","core"})
   -- 
   -- Cpu widget (freq)
   cpuwidget = widget({ type = "textbox" })
   vicious.register(cpuwidget, vicious.widgets.cpu, " CPU $1%")
   -- 
   -- Pacman Widget
   -- 
   -- pacwidget = widget({type="textbox"})
   -- vicious.register(pacwidget, vicious.widgets.pkg, "|<b> UPDATES :</b> $1 | ", 1801, "Arch")
   
   
   --- Mail updater
   mymail = widget({ type = "textbox", align = "right" })
   -- mymail.text = "| <b>Mail :</b> <span color='yellow'>0</span> - <span color='red'>0</span>"
   
   -- Mail checker
   -- local function mail_check_old(option)
   --    -- if option == forced, Python scripts are launched
   --    -- they check unseen mail, end return the number of unseen
   --    -- in files.
   --    -- 
   --    -- force check
   --    if option == "forced" then
   -- 	 -- experiencing some problems with laposte's server, so commenting
   --       -- os.execute('python /home/thomas/.config/awesome/mail_laposte.py > ~/tmp/laposte')
   --       os.execute('/home/thomas/.config/awesome/mail_gmail.py > ~/tmp/gmail')
   --       os.execute('/home/thomas/.config/awesome/mail_ent.py > ~/tmp/ent')
   --    end
   --    -- 
   --     os.execute('/home/thomas/.config/awesome/check_file')
   --     -- experiencing some problems with laposte's server, so commenting
   --     -- local f = io.open("/home/thomas/tmp/laposte") 
   --     local gmail = io.open("/home/thomas/tmp/gmail")
   --     local ent = io.open("/home/thomas/tmp/ent")
   --     -- experiencing some problems with laposte's server, so commenting
   --     -- local l = nil
   --     local g_unseen = nil
   --     local e_unseen = nil
   --     -- 
   --     -- check if file is empty, if not, get the line 
   --     -- 
   --     -- experiencing some problems with laposte's server, so commenting
   --     -- if f ~= nil then
   --     --    l = f:read() -- read output of command
   --     -- else
   --     --    l = "<span color='yellow'>0</span>"
   --     -- end
   --     if gmail ~= nil then
   --        g_unseen = h:read() -- read output of command
   --     else
   --        g_unseen = "<span color='red'>0</span>"
   --     end
   --     if ent ~= nil then
   --        e_unseen = ent:read() -- read output of command
   --     else
   --        e_unseen = "<span color='green'>0</span>"
   --     end
   --     -- experiencing some problems with laposte's server, so commenting
   --     -- f:close()
   --     gmail:close()
   --     ent:close()
   --     -- adapt for your mail
   --     mymail.text = "| Mail : "..g.."-"..e" | "
   -- end 
   -- -- print last updated data
   -- mail_check_old("null")
   -- 
   -- create a timer
   -- !!
   -- !! be aware that you need an internet connection if you don't want errors !
   -- !!
   --    my_battmon_timer=timer({timeout=300})
   --   my_battmon_timer:add_signal("timeout", function() mail_check_old("forced") end)
   -- my_battmon_timer:start()
   -- 
   -- }}}
   
   
   -- Create a wibox for each screen and add it
   mywibox = {}
   mypromptbox = {}
   mylayoutbox = {}
   mytaglist = {}
   mytaglist.buttons = awful.util.table.join(
      awful.button({ }, 1, awful.tag.viewonly),
      awful.button({ modkey }, 1, awful.client.movetotag),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, awful.client.toggletag),
      awful.button({ }, 4, awful.tag.viewnext),
      awful.button({ }, 5, awful.tag.viewprev)
					    )
   mytasklist = {}
   mytasklist.buttons = awful.util.table.join(
      awful.button({ }, 1, function (c)
		      if c == client.focus then
			 c.minimized = true
		      else
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
      mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
      -- Create an imagebox widget which will contains an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      mylayoutbox[s] = awful.widget.layoutbox(s)
      mylayoutbox[s]:buttons(awful.util.table.join(
				awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
				awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
				awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
				awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
      -- Create a taglist widget
      mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
      
      -- Create a tasklist widget
      mytasklist[s] = awful.widget.tasklist(function(c)
					       return awful.widget.tasklist.label.currenttags(c, s)
					    end, mytasklist.buttons)
      
      -- Create the wibox
      mywibox[s] = awful.wibox({ position = "top", screen = s })
      -- Add widgets to the wibox - order matters
      mywibox[s].widgets = {
	 {
	    mylauncher,
	    mytaglist[s],
	    mylayoutbox[s],
	    mypromptbox[s],
	    layout = awful.widget.layout.horizontal.leftright
	 },
	 -- place it as you want :-)
	 -- mylayoutbox[s],
	 mytextclock,
	 cputemp,
	 cpuwidget,
	 memwidget,
	 mybattmon,
	 -- pacwidget,
	 -- mymail,
	 s == 1 and mysystray or nil,
	 mytasklist[s],
	 layout = awful.widget.layout.horizontal.rightleft
      }
   end
   -- }}}
   
   -- 
   -- 
   -- Manipulate bindings
   -- 
   -- 

   -- {{{ Mouse bindings
   root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
   -- remap tag manipulation to match emacs style
    awful.key({ modkey,           }, "p",      awful.tag.viewprev       ),
    awful.key({ modkey,           }, "n",      awful.tag.viewnext       ),--"Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    -- brightness modification for nvidia (look at repo)
    awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("/home/thomas/.bright/mod 100") end),
    awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("/home/thomas/.bright/mod -100") end),
    -- volume modification
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer set Master,0 5+") end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer set Master,0 5-") end),
    awful.key({ }, "XF86AudioMute", function () awful.util.spawn("amixer set Master toggle") end),    
    -- lock your screen
    -- !!
    -- !! require xlock
    awful.key({ }, "F12", function () awful.util.spawn("xlock") end),
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
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

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

    -- perso
    awful.key({ modkey,           }, "z", function () mail_check_old("forced") end),


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

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    -- awful.key({ modkey,           }, "n",
    --     function (c)
    --         -- The client currently has the input focus, so it cannot be
    --         -- minimized, since minimized clients can't have the focus.
    --         c.minimized = true
    --     end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
