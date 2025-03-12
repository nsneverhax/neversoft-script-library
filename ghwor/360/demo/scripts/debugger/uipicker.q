g_debug_mouse_pos = (640.0, 360.0, 0.0)
g_uipicker_picked_elem_id = none
g_uipicker_picked_elem_string = qs(0x67b9f89e)
g_uipicker_picked_elem_z = 0
g_uipicker_index = 0

script uipicker_start 
	setbuttoneventmappings \{block_menu_input}
	if screenelementexists \{id = debug_mouse}
		destroyscreenelement \{id = debug_mouse}
	endif
	change \{g_debug_mouse_pos = (640.0, 360.0, 0.0)}
	createscreenelement \{type = descinterface
		desc = 'debug_mouse'
		id = debug_mouse
		parent = root_window
		z_priority = 1000
		pos_anchor = [
			left
			top
		]
		pos = (0.0, 0.0)}
	debug_mouse :obj_spawnscript \{uipicker_update_mouse}
endscript

script uipicker_stop 
	destroyscreenelement \{id = debug_mouse}
	killspawnedscript \{name = uipickerupdater}
	setbuttoneventmappings \{unblock_menu_input}
endscript

script uipicker_pick \{pick_hidden = true
		pick_unfocused = true}
	if uipickerpick {pos = ($g_debug_mouse_pos)
			pick_hidden = <pick_hidden>
			pick_unfocused = <pick_unfocused>
			pick_index = 0}
		change g_uipicker_index = <picked_index>
		change g_uipicker_picked_elem_z = <picked_element_z>
	endif
	change g_uipicker_picked_elem_id = <picked_element>
	change g_uipicker_picked_elem_string = <picked_element_string>
endscript

script uipicker_step_thru \{pick_hidden = true
		pick_unfocused = true}
	if uipickerpick {pos = ($g_debug_mouse_pos)
			pick_hidden = <pick_hidden>
			pick_unfocused = <pick_unfocused>
			pick_index = ($g_uipicker_index + 1)}
		change g_uipicker_picked_elem_id = <picked_element>
		change g_uipicker_picked_elem_z = <picked_element_z>
		change g_uipicker_index = <picked_index>
		change g_uipicker_picked_elem_string = <picked_element_string>
		return \{true}
	endif
	return \{false}
endscript

script uipicker_send_output 
	if screenelementexists id = ($g_uipicker_picked_elem_id)
		getscreenelementprops id = ($g_uipicker_picked_elem_id)
		printstruct <...> channel = uipicker
	else
		printf \{qs(0x5dc691d5)
			channel = uipicker}
	endif
endscript

script uipicker_update_mouse 
	begin
	getanalogueinfo
	<delta_pos> = ((<leftx> * (10.0, 0.0, 0.0)) + (<lefty> * (0.0, 10.0, 0.0)))
	<lefttrigger> = ((<lefttrigger> + 128) / 128)
	<righttrigger> = ((<righttrigger> + 128) / 128)
	if controllermake r1 ($primary_controller)
		<delta_pos> = (<delta_pos> + (0.0, 0.0, 1.0))
	elseif controllerpressed r2 ($primary_controller)
		<delta_pos> = (<delta_pos> + (0.0, 0.0, 1.0) * <righttrigger>)
	elseif controllermake l1 ($primary_controller)
		<delta_pos> = (<delta_pos> - (0.0, 0.0, 1.0))
	elseif controllerpressed l2 ($primary_controller)
		<delta_pos> = (<delta_pos> - (0.0, 0.0, 1.0) * <lefttrigger>)
	endif
	if controllermake x ($primary_controller)
		uipicker_step_thru
	endif
	if controllermake triangle ($primary_controller)
		uipicker_send_output
	endif
	if (<delta_pos>.(1.0, 0.0, 0.0) != 0 || <delta_pos>.(0.0, 1.0, 0.0) != 0 || <delta_pos>.(0.0, 0.0, 1.0) != 0)
		uipicker_pick
	endif
	<new_pos> = ($g_debug_mouse_pos + <delta_pos>)
	if (<new_pos>.(1.0, 0.0, 0.0) < 0)
		setvectorcomponents \{new_pos
			x = 0}
	endif
	if (<new_pos>.(1.0, 0.0, 0.0) > 1280)
		setvectorcomponents \{new_pos
			x = 1280}
	endif
	if (<new_pos>.(0.0, 1.0, 0.0) < 0)
		setvectorcomponents \{new_pos
			y = 0}
	endif
	if (<new_pos>.(0.0, 1.0, 0.0) > 720)
		setvectorcomponents \{new_pos
			y = 720}
	endif
	change g_debug_mouse_pos = <new_pos>
	<x_pos> = (<new_pos>.(1.0, 0.0, 0.0))
	<y_pos> = (<new_pos>.(0.0, 1.0, 0.0))
	<z_pos> = (<new_pos>.(0.0, 0.0, 1.0))
	casttointeger \{x_pos}
	casttointeger \{y_pos}
	casttointeger \{z_pos}
	formattext textname = z_value_text qs(0x8c5c152d) n = <z_pos>
	formattext textname = coords_value_text qs(0xf6fc3b3d) x = <x_pos> y = <y_pos>
	<picked_value_text> = qs(0x67b9f89e)
	<picked_z_value_text> = qs(0x67b9f89e)
	if ($g_uipicker_picked_elem_id != none)
		formattext textname = picked_element_string qs(0x73307931) s = ($g_uipicker_picked_elem_string)
		formattext textname = picked_z_value_text qs(0x8c5c152d) n = ($g_uipicker_picked_elem_z)
	endif
	se_setprops {
		debug_mouse_pos = ($g_debug_mouse_pos)
		z_value_text = <z_value_text>
		coords_value_text = <coords_value_text>
		picked_value_text = <picked_value_text>
		picked_z_value_text = <picked_z_value_text>
	}
	wait \{1
		gameframe}
	repeat
endscript
