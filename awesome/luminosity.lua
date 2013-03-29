local wibox = require("wibox")
local awful = require("awful")

   --
   -- luminosity widget
   --
   lumin_w = wibox.widget.textbox()
   lumin_w:set_align("right")
   function lumin_status ()
      local actual=io.open("/sys/class/backlight/nvidia_backlight/brightness")
      local actual_value = actual:read()
      actual:close()
      local maxi=io.open("/sys/class/backlight/nvidia_backlight/max_brightness")
      local maxi_value = maxi:read()
      maxi:close()
      local value = math.floor(100*actual_value/maxi_value)
      lumin_w:set_markup(value.."% ")
   end
   lumin_status()
