local vicious = require("vicious")
local wibox = require("wibox")
local awful = require("awful")

-- ram_w = wibox.widget.textbox()
-- vicious.register(ram_w, vicious.widgets.mem, " RAM <span color='yellow'>$1% </span>", 13)

-- Initialize widget
ram_w = awful.widget.progressbar()
-- Progressbar properties
ram_w:set_width(50)
ram_w:set_height(10)
ram_w:set_vertical(true)
ram_w:set_background_color("#494B4F")
ram_w:set_border_color(nil)
ram_w:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
										 {1, "#FF5656"}}})
-- Register widget
vicious.register(ram_w, vicious.widgets.mem, "$1", 13)



cputemp = wibox.widget.textbox()
   -- vicious.register(thermalwidget, vicious.widgets.thermal, "CPU ",19,"thermal_zone0"})
vicious.register(cputemp, vicious.widgets.thermal, "CPU : <span color='red'> $1°C</span> ", 19, {"coretemp.0","core"})

--    -- 
--    -- Cpu widget (freq)
-- cpuwidget = wibox.widget.textbox()
-- --cpuwidget.width, cpuwidget.align=70, "left"
-- vicious.register(cpuwidget, vicious.widgets.cpu, " CPU <span color='orange'>$1%</span>")


-- Initialize widget
cpuwidget = awful.widget.graph()
-- Graph properties
cpuwidget:set_width(50)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#FF5656"}, {0.5, "#88A175"}, 
										 {1, "#AECF96" }}})
-- Register widget
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")


   -- 
   -- Ram widget
   -- 
-- ram_w = wibox.widget.textbox()
-- vicious.register(ram_w, vicious.widgets.mem,"$1", 11)
--" RAM <span color='yellow'>$1% </span>", 13)
   -- if you want more eye candy
   -- "<span weight='bold'>RAM :</span> <span color='green'>$1%</span> |", 13)
   -- 
   -- Cpu widget (temp)
   -- 
   -- cputemp = widget({ type = "textbox" })
   -- -- vicious.register(thermalwidget, vicious.widgets.thermal, "CPU ",19,"thermal_zone0"})
   -- vicious.register(cputemp, vicious.widgets.thermal, "<span color='red'> $1°C</span> | ", 19, {"coretemp.0","core"})
   -- -- 
   -- -- Cpu widget (freq)
   -- cpuwidget = widget({ type = "textbox" })
   -- cpuwidget.width, cpuwidget.align=60, "left"
   -- vicious.register(cpuwidget, vicious.widgets.cpu, " CPU <span color='orange'>$1%</span>")
   -- 
   -- Pacman Widget
   -- 
   -- pacwidget = widget({type="textbox"})
   -- vicious.register(pacwidget, vicious.widgets.pkg, "|<b> UPDATES :</b> $1 | ", 1801, "Arch")
     
