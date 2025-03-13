xboxlive_num_results = 0

script xboxlive_menu_optimatch_results_stop 
	netsessionfunc \{obj = match
		func = stop_server_list}
	if gotparam \{xboxlive_num_results}
		xboxlive_menu_optimatch_results_end xboxlive_num_results = <xboxlive_num_results>
	else
		xboxlive_menu_optimatch_results_end \{xboxlive_num_results = 0}
	endif
endscript

script xboxlive_menu_optimatch_results_end 
	destroy_server_list_searching_dialog
	if gotparam \{xboxlive_num_results}
		change xboxlive_num_results = <xboxlive_num_results>
	endif
	printf qs(0x88790069) d = ($xboxlive_num_results)
	if (($xboxlive_num_results) = 0)
		if checkforsignin
			if screenelementexists \{id = search_results_container}
				create_server_list_create_match_dialog
			else
				printf \{qs(0xc87c5d4c)}
			endif
		endif
	else
		spawnscript \{xboxlive_menu_optimatch_results_wait_and_focus}
	endif
endscript

script xboxlive_menu_optimatch_results_wait_and_focus 
	wait \{1
		gameframes}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if screenelementexists \{id = search_results_vmenu}
		launchevent \{type = focus
			target = search_results_vmenu}
		setscreenelementprops \{id = search_results_vmenu
			enable_pad_handling}
	endif
	if screenelementexists \{id = search_results_container}
		getscreenelementchildren \{id = search_results_container}
		if gotparam \{children}
			getarraysize \{children}
			i = 0
			begin
			if screenelementexists id = (<children> [<i>])
				(<children> [<i>]) :gettags
				if NOT gotparam \{highlight}
					(<children> [<i>]) :se_setprops preserve_flip alpha = 1.0
				endif
				<i> = (<i> + 1)
			endif
			repeat <array_size>
		endif
	endif
endscript

script xboxlive_menu_optimatch_results_item_add 
	printf \{qs(0x417b8ab2)}
	printstruct <...>
	change xboxlive_num_results = (($xboxlive_num_results) + 1)
	if NOT screenelementexists \{id = search_results_vmenu}
		printf \{qs(0xc5757bfc)}
		return
	endif
	translate_server_checksums_to_strings {
		game_mode_checksum = <game_mode>
		num_songs_checksum = <num_songs>
		difficulty_checksum = <difficulty>
	}
	if ($match_type = ranked)
		<host_text> = qs(0x99c4796b)
	else
		<host_text> = <server_name>
	endif
	createscreenelement \{type = containerelement
		parent = search_results_vmenu
		dims = (210.0, 30.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	<container_element> = <id>
	<id> :se_setprops {
		event_handlers = [
			{focus serverlist_focus params = {parent = <id>}}
			{unfocus serverlist_unfocus params = {parent = <id>}}
			{pad_choose net_choose_server params = {id = <server_id>}}
		]
	}
	if isxenon
		if ($match_type = player)
			<id> :se_setprops event_handlers = [{pad_start menu_show_gamercard_from_netid params = {net_id = <player_xuid>}}]
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = highlight_bar
		texture = white
		dims = (625.0, 30.0)
		rgba = ($online_light_blue)
		pos = (-4.0, 0.0)
		just = [left top]
		z_priority = 4
	}
	<id> :settags highlight = 1
	<id> :se_setprops alpha = 0.0
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = bookend_left
		texture = character_hub_hilite_bookend
		dims = (35.0, 35.0)
		rgba = ($online_light_blue)
		pos = (-5.0, -3.0)
		just = [center top]
		z_priority = 4
	}
	<id> :settags highlight = 1
	<id> :se_setprops alpha = 0.0
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = bookend_right
		texture = character_hub_hilite_bookend
		dims = (35.0, 35.0)
		rgba = ($online_light_blue)
		pos = (632.0, -3.0)
		just = [center top]
		z_priority = 4
	}
	<id> :settags highlight = 1
	<id> :se_setprops alpha = 0.0
	createscreenelement {
		type = textelement
		parent = <container_element>
		font = fontgrid_title_a1
		local_id = server_name
		scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = <host_text>
		just = [left top]
		internal_just = [left top]
		z_priority = 10.0
	}
	<server_entry_id> = <id>
	fit_text_into_menu_item id = <id> max_width = 200
	createscreenelement {
		type = textelement
		parent = <container_element>
		font = fontgrid_title_a1
		local_id = mode
		scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = <game_mode_value>
		pos = (220.0, 0.0)
		just = [left top]
		internal_just = [left top]
		z_priority = 10.0
	}
	fit_text_into_menu_item id = <id> max_width = 200
	createscreenelement {
		type = textelement
		parent = <container_element>
		font = fontgrid_title_a1
		local_id = songs
		scale = (0.75, 0.65000004)
		rgba = ($online_light_blue)
		text = <num_songs_value>
		pos = (460.0, 0.0)
		just = [left top]
		internal_just = [left top]
		z_priority = 10.0
	}
	get_qos_color qos = <qos>
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = signal_bar1
		texture = white
		pos = (552.0, 26.5)
		dims = (7.5, 5.0)
		rgba = <color>
		just = [left bottom]
		z_priority = 10.0
		alpha = 1.0
	}
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = signal_bar2
		texture = white
		pos = (566.0, 26.5)
		dims = (7.5, 10.0)
		rgba = <color>
		just = [left bottom]
		z_priority = 10.0
		alpha = 0.0
	}
	if (<qos> > 2.0)
		<id> :se_setprops alpha = 1.0
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = signal_bar3
		texture = white
		pos = (580.0, 26.5)
		dims = (7.5, 15.0)
		rgba = <color>
		just = [left bottom]
		z_priority = 10.0
		alpha = 0.0
	}
	if (<qos> > 4.0)
		<id> :se_setprops alpha = 1.0
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = signal_bar4
		texture = white
		pos = (594.0, 26.5)
		dims = (7.5, 20.0)
		rgba = <color>
		just = [left bottom]
		z_priority = 10.0
		alpha = 0.0
	}
	if (<qos> > 6.0)
		<id> :se_setprops alpha = 1.0
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_element>
		local_id = signal_bar5
		texture = white
		pos = (608.0, 26.5)
		dims = (7.5, 25.0)
		rgba = <color>
		just = [left bottom]
		z_priority = 10.0
		alpha = 0.0
	}
	if (<qos> > 8)
		<id> :se_setprops alpha = 1.0
	endif
endscript

script translate_server_checksums_to_strings 
	printstruct <...>
	if gotparam \{game_mode_checksum}
		switch (<game_mode_checksum>)
			case p2_battle
			<game_mode_value> = qs(0x33b59779)
			case p2_faceoff
			<game_mode_value> = qs(0x0952b48b)
			case p2_pro_faceoff
			<game_mode_value> = qs(0x46577877)
			case p2_coop
			<game_mode_value> = qs(0x5bbbf8bc)
		endswitch
	endif
	if gotparam \{num_songs_checksum}
		switch (<num_songs_checksum>)
			case num_1
			<num_songs_value> = qs(0x787beab2)
			case num_3
			<num_songs_value> = qs(0x4a4d8830)
			case num_5
			<num_songs_value> = qs(0x1c172fb6)
			case num_7
			<num_songs_value> = qs(0x2e214d34)
		endswitch
	endif
	return num_songs_value = <num_songs_value> game_mode_value = <game_mode_value>
endscript

script serverlist_focus 
	obj_getid
	legacydoscreenelementmorph id = {<objid> child = server_name} rgba = ($online_dark_purple)
	legacydoscreenelementmorph id = {<objid> child = mode} rgba = ($online_dark_purple)
	legacydoscreenelementmorph id = {<objid> child = songs} rgba = ($online_dark_purple)
	legacydoscreenelementmorph id = {<objid> child = highlight_bar} alpha = 1.0
	legacydoscreenelementmorph id = {<objid> child = bookend_left} alpha = 1.0
	legacydoscreenelementmorph id = {<objid> child = bookend_right} alpha = 1.0
endscript

script serverlist_unfocus 
	obj_getid
	legacydoscreenelementmorph id = {<objid> child = server_name} rgba = ($online_light_blue)
	legacydoscreenelementmorph id = {<objid> child = mode} rgba = ($online_light_blue)
	legacydoscreenelementmorph id = {<objid> child = songs} rgba = ($online_light_blue)
	legacydoscreenelementmorph id = {<objid> child = highlight_bar} alpha = 0.0
	legacydoscreenelementmorph id = {<objid> child = bookend_left} alpha = 0.0
	legacydoscreenelementmorph id = {<objid> child = bookend_right} alpha = 0.0
endscript

script get_qos_color 
	color = ($online_red)
	if (<qos> > 3)
		color = ($online_orange)
	endif
	if (<qos> > 5)
		color = ($online_yellow)
	endif
	if (<qos> > 7)
		color = ($online_green)
	endif
	return color = <color>
endscript
