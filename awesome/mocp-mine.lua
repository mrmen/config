local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")

mocp_w = wibox.widget.textbox()
mocp_w:set_align("left")
mocp_w:set_font("Monospace 8")

local TITLE=""
local BEGIN=0
local DELTA=20

function getSongInfo()
   local test = io.popen("mocp -Q %state")
   

   if test:read()~="PLAY" then
      io.close(test)
      return "<span color='Yellow'>Not Playing </span>"
   end
   io.close(test)

   local all = io.popen("mocp -Q '[%ct/%tt]@%artist@%song' | tr '[éÉèÈàÀ]' '[eEeEaA]'", "r")
   local line = all:read()
   time,artist,song = line:match("([^-]*)@([^-]*)@([^-]*)")
   TITLE = artist.." : "..song 
   local max = TITLE:len()
   if BEGIN>=max then
      BEGIN = 0
   else
      BEGIN = BEGIN+1
   end
   local toPrint = TITLE:sub(BEGIN,BEGIN+DELTA)
   for i=0,20-toPrint:len(),1 do
      toPrint=toPrint.." "
   end
   io.close(all)
   return "<span color='yellow'>"..time.."</span> <span color='red'>-</span> <span color='SpringGreen'>"..toPrint.." </span>"
end

mocp_w:set_markup(getSongInfo())

my_mocp_timer = timer({timeout=1})
my_mocp_timer:connect_signal("timeout", function()
				mocp_w:set_markup(getSongInfo())
				end)

my_mocp_timer:start()

-- add popup support

function remove_mocp()
   if mocp ~= nil then
      naughty.destroy(mocp)
      calendar = nil
   end
end

function grab_mocp()
   remove_mocp()

   local test = io.popen("mocp -Q %state")
   

   if test:read()~="PLAY" then
      io.close(test)
      return "No Playlist"
   end
   io.close(test)


   local file = nil
   file = io.open("/home/mrmen/.moc/playlist.m3u")
   currentPlaying = io.popen("mocp -Q %song")
   song = currentPlaying:read()
   io.close(currentPlaying)   
   local text = ""
   local is_empty = ""
   if file ~= nil then
      for line in file:lines() do 
--	 is_empty = line
	 if string.match(line, "^#") then
	    text = text
	 else
	    outline = string.match(line, ".*/([^/]*)")
	    if string.match(line, song) then
	       text = text .. "<span color='red'>" .. outline .. "</span>"
	    else
	       text = text .. outline .. "\n"
	    end
	 end
      end
      io.close(file)
   else
      text = "No Playlist found"
   end
   return text
end

function add_mocp()
   local out = grab_mocp()
   if out ~= "" then
      mocp = naughty.notify({
			       text = string.format('<span font_desc="%s">%s</span>', "monospace", out),timeout = 0, hover_timeout = 0.5,
			    })
   end
end


-- connect mouse
mocp_w:connect_signal("mouse::enter", function()
			 add_mocp()
				      end)
mocp_w:connect_signal("mouse::leave", function ()
    			 remove_mocp() 
    				      end)

mocp_w:buttons(awful.util.table.join(
		  awful.button({ }, 1, function()
				  awful.util.spawn("urxvt -e mocp")
				       end)
				    )
	      )
