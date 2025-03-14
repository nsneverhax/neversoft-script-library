
script net_login_xbox_menu_create {
		parent = root_window
		pad_back_script = printf
		pad_back_params = {"back"}
		success_script = printf
		success_params = {"success"}
		locked_text = "*"
		passcode_length = 4
		buttons = [
			{event_id = pad_square display_text = "\\m5" passcode_entry = button_x}
			{event_id = pad_space display_text = "\\m8" passcode_entry = button_y}
			{event_id = pad_l1 display_text = "\\be" passcode_entry = button_l1}
			{event_id = pad_r1 display_text = "\\bf" passcode_entry = button_r1}
			{event_id = pad_up display_text = "\\b7" passcode_entry = button_dp_u}
			{event_id = pad_down display_text = "\\b4" passcode_entry = button_dp_d}
			{event_id = pad_left display_text = "\\b6" passcode_entry = button_dp_l}
			{event_id = pad_right display_text = "\\b5" passcode_entry = button_dp_r}
			{event_id = pad_choose clear}
		]
	}
	if screenelementexists id = net_login_passcode_anchor
		destroyscreenelement id = net_login_passcode_anchor
	endif
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = net_login_passcode_anchor
		pos = (150.0, 150.0)
		tags = {
			passcode_length = <passcode_length>
			locked_text = <locked_text>
			success_script = <success_script>
			success_params = <success_params>
		}
		event_handlers = [
			{
				pad_back
				net_login_xbox_menu_kill
				params = {
					callback_script = <pad_back_script>
					callback_params = <pad_back_params>
				}
			}
		]
	}
	createscreenelement {
		type = spriteelement
		parent = net_login_passcode_anchor
		local_id = bg
		texture = white2
		scale = (40.0, 12.0)
		rgba = [0 0 20 128]
		just = [left top]
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = net_login_passcode_anchor
		local_id = bg
		texture = white2
		pos = (5.0, 25.0)
		scale = (38.0, 4.0)
		rgba = [128 128 128 50]
		just = [left top]
		z_priority = 1.5
	}
	createscreenelement {
		type = textelement
		parent = net_login_passcode_anchor
		local_id = text
		pos = (5.0, 0.0)
		text = "Please enter your pass code:"
		font = small
		rgba = [128 128 128 128]
		scale = 1
		just = [left top]
		z_priority = 2
	}
	createscreenelement {
		type = hmenu
		parent = net_login_passcode_anchor
		local_id = passcode
		pos = (10.0, 25.0)
		dims = (640.0, 20.0)
		just = [left top]
		internal_just = [left center]
		z_priority = 2
	}
	createscreenelement {
		type = hmenu
		parent = net_login_passcode_anchor
		local_id = buttons
		pos = (10.0, 60.0)
		dims = (640.0, 20.0)
		just = [left top]
		internal_just = [left center]
		z_priority = 2
	}
	foreachin <buttons> do = net_login_xbox_menu_item_add params = <...>
	launchevent type = focus target = net_login_passcode_anchor
endscript

script net_login_xbox_menu_item_add 
	if NOT gotparam \{clear}
		net_login_xbox_menu_item_element <...> parent = {net_login_passcode_anchor child = buttons}
	endif
	net_login_passcode_anchor :setprops {
		event_handlers = [
			{<event_id> net_login_xbox_menu_input params = <...>}
		]
	}
endscript

script net_login_xbox_menu_item_element 
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = <event_id>
		text = <display_text>
		font = small
		rgba = [128 128 128 128]
		scale = 1
		tags = {passcode_entry = <passcode_entry>}
	}
endscript

script net_login_xbox_menu_kill 
	disassociatefromobject
	if screenelementexists \{id = net_login_passcode_anchor}
		destroyscreenelement \{id = net_login_passcode_anchor}
	endif
	if gotparam \{callback_script}
		<callback_script> <callback_params>
	endif
endscript

script net_login_xbox_menu_input_clear 
	destroyscreenelement \{id = {
			net_login_passcode_anchor
			child = passcode
		}
		preserve_parent}
endscript

script net_login_xbox_menu_input 
	if gotparam \{clear}
		net_login_xbox_menu_input_clear
	else
		runscriptonscreenelement id = {net_login_passcode_anchor child = {buttons child = <event_id>}} net_login_xbox_menu_item_flash
		net_login_passcode_anchor :getsingletag \{locked_text}
		net_login_xbox_menu_item_element {
			<...>
			display_text = <locked_text>
			parent = {net_login_passcode_anchor child = passcode}
		}
		net_login_xbox_menu_verify_input <...>
	endif
endscript

script net_login_xbox_menu_verify_input 
	getscreenelementchildren id = {net_login_passcode_anchor child = passcode}
	getarraysize children
	net_login_passcode_anchor :getsingletag passcode_length
	if (<array_size> = <passcode_length>)
		setbuttoneventmappings block_menu_input
		wait 15 gameframes
		setbuttoneventmappings unblock_menu_input
		i = 0
		begin
		id = (<children> [<i>])
		if NOT <id> :getsingletag passcode_entry
			scriptassert "no passcode_entry tag on element"
		endif
		setarrayelement {
			arrayname = children
			index = <i>
			newvalue = <passcode_entry>
		}
		i = (<i> + 1)
		repeat <array_size>
		if netsessionfunc obj = auth func = verify_passcode params = {passcode = <children> index = <index>}
			net_login_passcode_anchor :getsetoftags [
				success_script
				success_params
			]
			if gotparam success_script
				net_login_xbox_menu_kill
				<success_script> <success_params>
			else
				scriptassert 'Passcode OK but no success script found!'
			endif
		else
			net_login_xbox_menu_input_clear
		endif
	endif
endscript

script net_login_xbox_menu_item_flash 
	domorph \{alpha = 0
		time = 0.1}
	domorph \{alpha = 1
		time = 0.3}
endscript
