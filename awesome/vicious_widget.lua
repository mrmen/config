local vicious = require("vicious")
local wibox = require("wibox")


ram_w = wibox.widget.textbox()
vicious.register(ram_w, vicious.widgets.mem, " RAM <span color='yellow'>$1% </span>", 13)

cputemp = wibox.widget.textbox()
   -- vicious.register(thermalwidget, vicious.widgets.thermal, "CPU ",19,"thermal_zone0"})
vicious.register(cputemp, vicious.widgets.thermal, "<span color='red'> $1°C</span> | ", 19, {"coretemp.0","core"})
   -- 
   -- Cpu widget (freq)
cpuwidget = wibox.widget.textbox()
cpuwidget.width, cpuwidget.align=60, "left"
vicious.register(cpuwidget, vicious.widgets.cpu, " CPU <span color='orange'>$1%</span>")

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
     
