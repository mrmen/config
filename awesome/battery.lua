---
--- battery monitor
---

local wibox = require("wibox")
local awful = require("awful")

battery_w = wibox.widget.textbox()
battery_w:set_align("right")
battery_w:set_markup("test")
battery_i = wibox.widget.imagebox()
   function battery_status ()
      local output={} --output buffer
      local fd=io.popen("acpi", "r") --list present batteries
      local line=fd:read()
      while line do --there might be several batteries.
   	 local battery_num = string.match(line, "Battery 0")
   	 local battery_load = string.match(line, "%d+%%")
   	 local time_rem = string.match(line, "(%d+:%d+):")
   	 local discharging
   	 if string.match(line, "Discharging") then --discharging: always red
   	    discharging="<span color=\"#CC7777\">"
	    battery_i:set_image("/home/mrmen/.config/awesome/icons/power-bat.png")
	    battery_load=battery_load.."</span> ("..time_rem..")"
   	 else --charging
   	    discharging="<span color=\"#DCDCCC\">" --#CCCC77\">ch"
	    battery_load=battery_load.."</span>"
	    battery_i:set_image("/home/mrmen/.config/awesome/icons/power-ac.png")
	    -- on AC so launch timer for mail
--	    mail_timer:start()
   	 end
   	 table.insert(output, discharging..battery_load.." |")
   	 line=fd:read() --read next line
      end
      return table.concat(output," ")
   end

battery_w:set_markup(battery_status())

my_battmon_timer=timer({timeout=60})
my_battmon_timer:connect_signal("timeout", function()
   				  battery_w:set_markup(battery_status())
   					  end)
my_battmon_timer:start()
----
---
---
