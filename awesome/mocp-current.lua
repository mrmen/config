local wibox = require("wibox")
local awful = require("awful")

mocp_w = wibox.widget.textbox()
mocp_w:set_align("right")

TITLE=""
BEGIN=0
DELTA=20

function getSongInfo()
   local all = io.popen("mocp -Q '[%ct/%tt]@%artist@%song'", "r")
   local line = all:read()
   time,artist,song = line:match("([^-]*)@([^-]*)@([^-]*)")
   TITLE = artist.." : "..song
   BEGIN = BEGIN+1
   return time.." - "..TITLE:sub(BEGIN,BEGIN+DELTA))
end

getSongInfo()

mocp_w:set_markup(getSongInfo())

my_mocp_timer = timer({timeout=5})
my_mocp_timer:connect_signal("timeout", function()
				mocp_w:set_markup(getSongInfo())
				end)

my_mocp_timer:start()