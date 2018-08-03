
local function rename_tag()
    awful.prompt.run {
        prompt       = "New tag name: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = function(new_name)
            if not new_name or #new_name == 0 then return end

            local t = awful.screen.focused().selected_tag
            if t then
                t.name = new_name
            end
        end
    }
end

local function delete_tag()
    local t = awful.screen.focused().selected_tag
    if not t then return end
    t:delete()
end

local function add_tag()
    awful.tag.add("NewTag",{screen= awful.screen.focused(), layout = awful.layout.suit.tile, }):view_only()
end

local function add_or_move_tag()
	local screen = awful.screen.focused()
	local tag_index = screen.selected_tag.index
	local tag_index_next = tag_index + 1
	if screen.tags[tag_index_next] then
		awful.tag.viewnext()
	else
		add_tag()
		awful.tag.viewidx(tag_index_next)
		rename_tag()
	end
end

local function prepend_tag_or_move()
	local screen = awful.screen.focused()
	local tag_index = screen.selected_tag.index
	local tag_index_next = tag_index - 1
	if tag_index == 1 then
		-- We have the left-most tag focused.
		add_tag()
		local number_of_tags = 0
		for index, value in pairs(screen.tags)
			do
				number_of_tags = number_of_tags+ 1
			end
		
		awful.tag.viewidx(number_of_tags)
		rename_tag()
		-- since we want to prepend the new tag, we are going to swap them through now.
		for i=(number_of_tags*-1),-2 do
			local left = screen.tags[(i*-1)-1]
			local right= screen.tags[(i*-1)]
			awful.tag.swap(left, right)
		end
	else
		awful.tag.viewprev()
	end

end
