net_horse_ui_handlers = [
	{
		pad_choose
		cap_piece_placed
	}
	{
		pad_square
		net_horse_move_next_state
	}
]
net_horse_layout_validation_script = nullscript

script net_horse_menu_create 
	printf "--- net_horse_menu_create"
	if screenelementexists id = net_round_game_desc_cont
		destroyscreenelement {
			id = net_round_game_desc_cont
		}
	endif
	just = [top left]
	createscreenelement {
		id = net_horse_menu_cont
		parent = root_window
		type = containerelement
		just = <just>
	}
	net_horse_menu_cont :settags layout_state = 0
	createscreenelement {
		id = net_horse_menu_holder
		parent = net_horse_menu_cont
		type = containerelement
		pos = (100.0, 100.0)
		just = <just>
		focusable_child = net_horse_menu_vmenu
	}
	z_priority = 0
	createscreenelement {
		type = containerelement
		id = cap_control_bottom
		parent = net_horse_menu_holder
		pos = (775.0, 0.0)
		scale = 0.75
	}
	createscreenelement {
		type = spriteelement
		parent = cap_control_bottom
		texture = cap_controlsbg
		just = [left top]
		pos = (78.0, -32.0)
		rgba = [0 0 0 120]
		dims = (420.0, 280.0)
		z_priority = (<z_priority> - 2)
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "move"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (250.0, 25.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\bk"
		just = [center center]
		pos = (320.0, 25.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "rotate"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (250.0, 70.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\mf \\mg"
		just = [center center]
		pos = (320.0, 70.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "camera"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (250.0, 115.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\bl"
		just = [center center]
		pos = (320.0, 115.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "zoom"
		rgba = [200 200 200 255]
		just = [right center]
		pos = (250.0, 160.0)
		scale = (0.85, 0.7)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 200]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = cap_control_bottom
		font = text_a1
		text = "\\ml+\\bl"
		just = [center center]
		pos = (320.0, 160.0)
		scale = <buttonscale>
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		id = net_horse_menu_vmenu
		parent = net_horse_menu_holder
		type = vmenu
		just = <just>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {}}
			{pad_down generic_menu_up_or_down_sound params = {}}
		]
	}
	setscreenelementprops {
		id = net_horse_menu_vmenu
		event_handlers = ($net_horse_ui_handlers)
	}
	net_horse_initialize_layout_state
	net_horse_menu_finish
	gman_getactivatedgoalid
	if checksumequals a = <activated_goal_id> b = net_horse
		net_horse_menu_classic_piece_counter_create
		net_horse_menu_classic_piece_counter_refresh
	endif
	runscriptonscreenelement id = net_horse_menu_cont net_horse_wait_and_pause_skaters
	pauseskaters
endscript

script net_horse_wait_and_pause_skaters 
	onexitrun \{net_horse_unpause_skaters}
	begin
	pauseskaters
	killspawnedscript \{name = net_horse_wait_and_hide_layout_skater}
	wait \{1
		gameframes}
	repeat
endscript

script net_horse_unpause_skaters 
	unpauseskaters
endscript

script net_horse_menu_classic_piece_counter_destroy 
	printf \{"--- net_horse_menu_classic_piece_counter_destroy"}
	if screenelementexists \{id = net_horse_piece_count_cont}
		destroyscreenelement \{id = net_horse_piece_count_cont}
	endif
endscript

script net_horse_menu_classic_piece_counter_create {
		parent = net_horse_menu_cont
		pos = (832.0, 108.0)
	}
	printf "--- net_horse_menu_classic_piece_counter_create"
	if NOT screenelementexists id = <parent>
		printf "the parent does not exist! returning!"
		return
	endif
	just = [left top]
	if screenelementexists id = net_horse_piece_count_cont
		destroyscreenelement id = net_horse_piece_count_cont
	endif
	createscreenelement {
		id = net_horse_piece_count_cont
		parent = <parent>
		type = containerelement
		pos = <pos>
		just = <just>
	}
	cont_id = <id>
	z_priority = 0
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = cap_controlsbg
		just = <just>
		rgba = [0 0 0 120]
		dims = (250.0, 60.0)
		z_priority = (<z_priority> - 2)
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	createscreenelement {
		type = textelement
		parent = <cont_id>
		font = text_a1
		text = "# pieces:"
		rgba = [200 200 200 255]
		just = [left top]
		pos = (-100.0, -10.0)
		scale = (0.78, 0.6)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 200]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = <cont_id>
		local_id = pieces_text
		font = text_a1
		text = "null"
		rgba = [200 200 200 255]
		just = [right top]
		pos = (90.0, -10.0)
		scale = (0.78, 0.6)
		z_priority = (<z_priority> - 1)
		shadow
		shadow_rgba = [0 0 0 200]
		shadow_offs = (2.0, 2.0)
	}
endscript

script net_horse_menu_classic_piece_counter_refresh 
	printf "--- net_horse_menu_classic_piece_counter_refresh"
	net_horse_get_data
	if gotparam trick_obj_select_list
		getarraysize trick_obj_select_list
		formattext textname = piece_string "%d/%e" d = <array_size> e = $max_net_line_items
		if screenelementexists id = {net_horse_piece_count_cont child = pieces_text}
			setscreenelementprops {
				id = {net_horse_piece_count_cont child = pieces_text}
				text = <piece_string>
			}
		else
			printf "ui isn't up?!"
		endif
	else
		printf "didn't get trick_obj_select_list"
	endif
endscript

script net_horse_menu_classic_piece_counter_refresh_in_goal 
	printf "--- net_horse_menu_classic_piece_counter_refresh_in_goal"
	net_horse_get_data
	if gotparam trick_objs
		getarraysize trick_objs
		num_trick_objs = <array_size>
		net_horse_count_touched_pieces
		formattext textname = piece_string "%d/%e" e = <num_trick_objs> d = <num_pieces>
		if screenelementexists id = {net_horse_piece_count_cont child = pieces_text}
			setscreenelementprops {
				id = {net_horse_piece_count_cont child = pieces_text}
				text = <piece_string>
			}
		else
			printf "ui isn't up?!"
		endif
	else
		printf "didn't get trick_objs"
	endif
endscript

script net_horse_menu_finish_selection 
	printf \{"--- net_horse_menu_finish_selection"}
	validation_script = $net_horse_layout_validation_script
	<validation_script>
	if (<is_valid> = 1)
		spawnscriptlater \{net_horse_menu_wait_and_finish_cap}
	else
		create_net_panel_message \{text = "You must select at least one object!"}
	endif
endscript

script net_horse_menu_wait_and_finish_cap 
	printf \{"--- net_horse_menu_wait_and_finish_cap"}
	wait \{5
		gameframes}
	cap_finish
	net_horse_menu_cleanup
	change \{net_horse_is_laying_pieces = 0}
	broadcastevent \{type = net_horse_ready_to_send_data}
	net_horse_enable_skater_input
endscript

script net_horse_menu_fill 
	printf "--- net_horse_menu_fill"
	cap_piece_array = ($ConstructionTypes.$cap_current_category)
	getarraysize <cap_piece_array>
	i = 0
	begin
	can_add = true
	if structurecontains structure = (<cap_piece_array> [<i>]) is_valid_script
		is_valid_script = (<cap_piece_array> [<i>].is_valid_script)
		<is_valid_script> category = ($cap_current_category) index = <i>
		can_add = <is_valid>
		printf "checkin piece"
		printstruct <...>
	endif
	if checksumequals a = <can_add> b = true
		net_horse_menu_add_item {
			text = (<cap_piece_array> [<i>].ui_name)
			index = <i>
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script net_horse_menu_finish 
	printf \{"--- net_horse_menu_finish"}
	sel_index = $cap_current_index
	printstruct <...>
	launchevent \{type = focus
		target = net_horse_menu_vmenu
		data = {
			grid_index = $cap_current_index
		}}
	assignalias \{id = net_horse_menu_cont
		alias = current_menu}
	assignalias \{id = net_horse_menu_vmenu
		alias = current_menu_anchor}
endscript

script net_horse_menu_add_item 
	if NOT gotparam text
		softassert "Did not get text for net horse menu item"
	endif
	just = [top left]
	text_rgba = [128 128 128 255]
	createscreenelement {
		parent = net_horse_menu_vmenu
		type = containerelement
		just = <just>
		dims = (0.0, 40.0)
		event_handlers = [
			{focus net_horse_menu_item_focus params = {}}
			{unfocus net_horse_menu_item_unfocus params = {}}
		]
		tags = {
			tag_grid_x = <index>
		}
	}
	cont_id = <id>
	createscreenelement {
		local_id = item_text
		parent = <cont_id>
		type = textelement
		font = text_a1
		rgba = <text_rgba>
		just = <just>
		text = <text>
	}
endscript

script net_horse_menu_item_focus 
	printf \{"--- net_horse_item_focus"}
	obj_getid
	printstruct <...>
	text_rgba = [255 0 0 255]
	setscreenelementprops {
		id = {<objid> child = item_text}
		rgba = <text_rgba>
	}
endscript

script net_horse_menu_item_unfocus 
	printf \{"--- net_horse_menu_item_unfocus"}
	obj_getid
	printstruct <...>
	text_rgba = [128 128 128 255]
	setscreenelementprops {
		id = {<objid> child = item_text}
		rgba = <text_rgba>
	}
endscript

script net_horse_menu_cleanup 
	printf \{"--- net_horse_menu_cleanup"}
	if screenelementexists \{id = net_horse_menu_cont}
		destroyscreenelement \{id = net_horse_menu_cont}
	endif
endscript

script net_horse_menu_item_validation_script 
	printf \{"--- net_horse_menu_item_validation_script"}
	valid = false
	gman_getactivatedgoalid
	if checksumequals a = <activated_goal_id> b = ($ConstructionTypes.<category> [<index>].associated_goal)
		valid = true
	endif
	return <valid> is_valid = <valid>
endscript
