local wibox = require("wibox")
local awful = require("awful")

function activeram()
   local active, total
   for line in io.lines('/proc/meminfo') do
      for key, value in string.gmatch(line, "(%w+):(%d+).+") do
	 if key == "Active" then active = tonumber(value)
	 elseif key == "MemTotal" then total = tonumber(value) end
      end
   end
   
   return string.format("%.0f%%",(active/total)*100)
end

mem_w = wibox.widget.textbox()

-- create a timer
mem_timer=timer({timeout=10})
mem_timer:connect_signal("timeout", function() mem_w:set_markup(activeram()) end)
--mem_timer:start()
-- }}}
