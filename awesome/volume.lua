local wibox = require("wibox")
local awful = require("awful")

--
-- Sound widget
--

local max=100
local min=0
local step=5

sound_i = wibox.widget.imagebox()

sound_w = wibox.widget.textbox()
sound_w:set_align("right")

function sound_status ()
   local output=io.popen("amixer | grep Mono | head -n 2 | tail -n 1") -- must be modified
   local line=output:read()
   local sound_num = string.match(line, "%d+%%")    
   if string.match(line, "off") then
      sound_num = sound_num --.. "(mute)"
      sound_i:set_image("/home/mrmen/.config/awesome/icons/vol-mute.png")
   else
      sound_i:set_image("/home/mrmen/.config/awesome/icons/vol-hi.png")
   end
   sound_w:set_markup(sound_num.." ")
end

sound_status()

-- volume modification

sound_w:buttons(awful.util.table.join(
		  awful.button({ }, 1, function ()
			       awful.util.spawn("amixer set Master toggle")
			       sound_status()
						  end
			   )
				    )
	       )