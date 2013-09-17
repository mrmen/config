
local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")

todo_w = wibox.widget.textbox()
todo_w:set_align("right")

function updateTODO ()
   fdWork = io.popen("bash ~/.is-there-todo", "r")
   local line = fdWork:read()
   todoTask = 0
   while line do
      if string.match(line,"%d/%d") then
	 todoTask = todoTask + 1
      end
      line = fdWork:read()
   end
   fdWork:close()
   return " | "..todoTask.." taches en attente | "
end

todo_w:set_markup(updateTODO())
todo_timer=timer({timeout=600})
todo_timer:connect_signal("timeout", function()
			     todo_w:set_markup(updateTODO())
				     end)


function remove_todo()
   if todo ~= nil then
      naughty.destroy(todo)
      todo = nil
   end
end

function grab_todo()
   remove_todo()
   local file = nil
   file = io.popen("bash ~/.is-there-todo")
   local text = ""
   local is_empty = ""
   if file ~= nil then
      for line in file:lines() do 
	 is_empty = line
	 if string.match(line,"Status") then
	    text = text
	 else
	    text = text .. line .. "\n"
	 end
      end
   else
      text = ""
   end
   file:close()
   return text
end

function add_todo()
   local out = grab_todo()
   if out ~= "" then
      todo = naughty.notify({
			       text = string.format('<span font_desc="%s">%s</span>', "monospace", out),timeout = 0, hover_timeout = 0.5,
			    })
   end
end


-- connect mouse
todo_w:connect_signal("mouse::enter", function()
			 add_todo()
				      end)
todo_w:connect_signal("mouse::leave", function ()
    			 remove_todo() 
    				      end)

