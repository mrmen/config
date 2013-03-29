local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")
--- Mail updater
mymail = wibox.widget.textbox()
mymail:set_align("right")
-- mymail.text = "| <b>Mail :</b> <span color='yellow'>0</span> - <span color='red'>0</span>"

-- Mail checker
function mail_check_old(option)
   -- if option == forced, Python scripts are launched
   -- they check unseen mail, end return the number of unseen
   -- in files.
   -- 
   -- force check
   if option == "forced" then
      -- experiencing some problems with laposte's server, so commenting
      -- os.execute('python /home/mrmen/.config/awesome/mail_laposte.py > ~/tmp/laposte')
      os.execute('python2 /home/mrmen/.config/awesome/mail_gmail.py > ~/tmp/gmail')
      os.execute('python2 /home/mrmen/.config/awesome/mail_ent.py > ~/tmp/ent')
      os.execute('date +"%H:%M" > ~/tmp/time')
   end
   -- 
   os.execute('/home/mrmen/.config/awesome/check_file')
   -- experiencing some problems with laposte's server, so commenting
   -- local f = io.open("/home/mrmen/tmp/laposte") 
   local gmail = io.open("/home/mrmen/tmp/gmail")
   local ent = io.open("/home/mrmen/tmp/ent")
   local time = io.open("/home/mrmen/tmp/time")
   -- experiencing some problems with laposte's server, so commenting
   -- local l = nil
   local g_unseen = nil
   local e_unseen = nil
   local t = nil
   local exists_unseen = 0
   -- 
   -- check if file is empty, if not, get the line 
   -- 
   -- experiencing some problems with laposte's server, so commenting
   -- if f ~= nil then
   --    l = f:read() -- read output of command
   -- else
   --    l = "<span color='yellow'>0</span>"
   -- end
   if gmail ~= nil then
      g_unseen = gmail:read() -- read output of command
   else
      g_unseen = "<span color='red'>0</span>"
   end
   if ent ~= nil then
      e_unseen = ent:read() -- read output of command
   else
      e_unseen = "<span color='green'>0</span>"
   end
   if time ~= nil then
      t = time:read()
   else
      t = "??:??"
   end
   if g_unseen ~= "<span color='red'>0</span>" then
      exists_unseen = 1
   end
   if e_unseen ~= "<span color='green'>0</span>" then
      exists_unseen = 1
   end
   -- experiencing some problems with laposte's server, so commenting
   -- f:close()
   gmail:close()
   ent:close()
   time:close()
   -- adapt for your mail
   mymail:set_markup("| Mail : "..g_unseen.."-"..e_unseen.." at "..t.." | ")
   if exists_unseen ~= 0 then
      local text = "Some mails are waiting for you...\n"
      text = text .. "Gmail : " .. g_unseen .. "\n"
      text = text .. "Ent     : " .. e_unseen  
      naughty.notify({title = "<b>Mails</b>", text = text, timeout = 30})
   end
end 
-- print last updated data
mail_check_old("null")

-- create a timer
-- mail_timer=timer({timeout=300})
-- mail_timer:connect_signal("timeout", function() mail_check_old("forced") end)
-- mail_timer:start()
-- }}}


function remove_mail()
   if mail ~= nil then
      naughty.destroy(mail)
      calendar = nil
   end
end

function grab_mail()
   remove_mail()
   local file = nil
   file = io.open("/home/mrmen/tmp/output")
   local text = ""
   local is_empty = ""
   if file ~= nil then
      for line in file:lines() do 
	 is_empty = line
	 text = text .. line .. "\n"
      end
   else
      text = "blabla"
   end
   return text
end

function add_mail()
   local out = grab_mail()
   if out ~= "" then
      mail = naughty.notify({
			       text = string.format('<span font_desc="%s">%s</span>', "monospace", out),timeout = 0, hover_timeout = 0.5,
			    })
   end
end


-- connect mouse
mymail:connect_signal("mouse::enter", function()
			 add_mail()
				      end)
mymail:connect_signal("mouse::leave", function ()
    			 remove_mail() 
    				      end)
