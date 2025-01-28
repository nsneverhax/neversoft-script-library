xboxlive_num_results = 0

script xboxlive_menu_optimatch_results_stop 
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	if GotParam \{xboxlive_num_results}
		xboxlive_menu_optimatch_results_end xboxlive_num_results = <xboxlive_num_results>
	else
		xboxlive_menu_optimatch_results_end \{xboxlive_num_results = 0}
	endif
endscript

script xboxlive_menu_optimatch_results_end 
	destroy_server_list_searching_dialog
	if GotParam \{xboxlive_num_results}
		Change xboxlive_num_results = <xboxlive_num_results>
	endif
	Printf "xboxlive_menu_optimatch_results_end : %d" D = ($xboxlive_num_results)
	if (($xboxlive_num_results) = 0)
		if CheckForSignIn
			if ScreenElementExists \{Id = search_results_container}
				create_server_list_create_match_dialog
			else
				Printf \{"our serverlist doesn't exist any more"}
			endif
		endif
	else
		SpawnScript \{xboxlive_menu_optimatch_results_wait_and_focus}
	endif
endscript

script xboxlive_menu_optimatch_results_wait_and_focus 
	Wait \{1
		GameFrames}
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenElementExists \{Id = search_results_vmenu}
		LaunchEvent \{Type = Focus
			Target = search_results_vmenu}
		SetScreenElementProps \{Id = search_results_vmenu
			enable_pad_handling}
	endif
	if ScreenElementExists \{Id = search_results_container}
		GetScreenElementChildren \{Id = search_results_container}
		if GotParam \{children}
			GetArraySize \{children}
			I = 0
			begin
			if ScreenElementExists Id = (<children> [<I>])
				(<children> [<I>]) :GetTags
				if NOT GotParam \{Highlight}
					(<children> [<I>]) :SetProps preserve_flip Alpha = 1.0
				endif
				<I> = (<I> + 1)
			endif
			repeat <array_Size>
		endif
	endif
endscript

script xboxlive_menu_optimatch_results_item_add 
	Printf \{"--- xboxlive_menu_optimatch_results_item_add"}
	PrintStruct <...>
	if (<num_players> < 2)
		Change xboxlive_num_results = (($xboxlive_num_results) + 1)
		if NOT ScreenElementExists \{Id = search_results_vmenu}
			Printf \{"Warning! tried to add a server when results menu not up"}
			return
		endif
		translate_server_checksums_to_strings {
			game_mode_checksum = <game_mode>
			num_songs_checksum = <num_songs>
			difficulty_checksum = <DIFFICULTY>
		}
		if ($match_type = Ranked)
			<host_text> = "HOST"
		else
			<host_text> = <server_name>
		endif
		CreateScreenElement \{Type = ContainerElement
			PARENT = search_results_vmenu
			Dims = (210.0, 30.0)
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]}
		<container_element> = <Id>
		<Id> :SetProps {
			event_handlers = [
				{Focus serverlist_focus Params = {PARENT = <Id>}}
				{unfocus serverlist_unfocus Params = {PARENT = <Id>}}
				{pad_choose net_choose_server Params = {Id = <server_id>}}
			]
		}
		if IsXENON
			if ($match_type = Player)
				<Id> :SetProps event_handlers = [{pad_start menu_show_gamercard_from_netid Params = {net_id = <player_xuid>}}]
			endif
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = Highlight_Bar
			texture = White
			Dims = (625.0, 30.0)
			rgba = ($online_light_blue)
			Pos = (-4.0, 0.0)
			just = [LEFT Top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = bookend_left
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (-5.0, -3.0)
			just = [Center Top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = bookend_right
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (632.0, -3.0)
			just = [Center Top]
			z_priority = 4
		}
		<Id> :SetTags Highlight = 1
		<Id> :SetProps Alpha = 0.0
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_element>
			font = text_a5
			local_id = server_name
			Scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <host_text>
			just = [LEFT Top]
			internal_just = [LEFT Top]
			z_priority = 10.0
		}
		<server_entry_id> = <Id>
		fit_text_into_menu_item Id = <Id> max_width = 200
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_element>
			font = text_a5
			local_id = mode
			Scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <game_mode_value>
			Pos = (220.0, 0.0)
			just = [LEFT Top]
			internal_just = [LEFT Top]
			z_priority = 10.0
		}
		fit_text_into_menu_item Id = <Id> max_width = 200
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_element>
			font = text_a5
			local_id = songs
			Scale = (0.75, 0.65000004)
			rgba = ($online_light_blue)
			Text = <num_songs_value>
			Pos = (460.0, 0.0)
			just = [LEFT Top]
			internal_just = [LEFT Top]
			z_priority = 10.0
		}
		get_qos_color qos = <qos>
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = signal_bar1
			texture = White
			Pos = (552.0, 26.5)
			Dims = (7.5, 5.0)
			rgba = <Color>
			just = [LEFT Bottom]
			z_priority = 10.0
			Alpha = 1.0
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = signal_bar2
			texture = White
			Pos = (566.0, 26.5)
			Dims = (7.5, 10.0)
			rgba = <Color>
			just = [LEFT Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 2.0)
			<Id> :SetProps Alpha = 1.0
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = signal_bar3
			texture = White
			Pos = (580.0, 26.5)
			Dims = (7.5, 15.0)
			rgba = <Color>
			just = [LEFT Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 4.0)
			<Id> :SetProps Alpha = 1.0
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = signal_bar4
			texture = White
			Pos = (594.0, 26.5)
			Dims = (7.5, 20.0)
			rgba = <Color>
			just = [LEFT Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 6.0)
			<Id> :SetProps Alpha = 1.0
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = signal_bar5
			texture = White
			Pos = (608.0, 26.5)
			Dims = (7.5, 25.0)
			rgba = <Color>
			just = [LEFT Bottom]
			z_priority = 10.0
			Alpha = 0.0
		}
		if (<qos> > 8)
			<Id> :SetProps Alpha = 1.0
		endif
	endif
endscript

script translate_server_checksums_to_strings 
	PrintStruct <...>
	if GotParam \{game_mode_checksum}
		switch (<game_mode_checksum>)
			case p2_battle
			<game_mode_value> = "BATTLE"
			case p2_faceoff
			<game_mode_value> = "FACE-OFF"
			case p2_pro_faceoff
			<game_mode_value> = "PRO FACE-OFF"
			if GotParam \{difficulty_checksum}
				switch (<difficulty_checksum>)
					case EASY
					<game_mode_value> = "PRO FACE-OFF EASY"
					case MEDIUM
					<game_mode_value> = "PRO FACE-OFF MED"
					case HARD
					<game_mode_value> = "PRO FACE-OFF HARD"
					case EXPERT
					<game_mode_value> = "PRO FACE-OFF EXP"
				endswitch
			endif
			case p2_coop
			<game_mode_value> = "CO-OP"
		endswitch
	endif
	if GotParam \{num_songs_checksum}
		switch (<num_songs_checksum>)
			case num_1
			<num_songs_value> = "1"
			case num_3
			<num_songs_value> = "3"
			case num_5
			<num_songs_value> = "5"
			case num_7
			<num_songs_value> = "7"
		endswitch
	endif
	return num_songs_value = <num_songs_value> game_mode_value = <game_mode_value>
endscript

script serverlist_focus 
	Obj_GetID
	DoScreenElementMorph Id = {<ObjID> child = server_name} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<ObjID> child = mode} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<ObjID> child = songs} rgba = ($online_dark_purple)
	DoScreenElementMorph Id = {<ObjID> child = Highlight_Bar} Alpha = 1.0
	DoScreenElementMorph Id = {<ObjID> child = bookend_left} Alpha = 1.0
	DoScreenElementMorph Id = {<ObjID> child = bookend_right} Alpha = 1.0
endscript

script serverlist_unfocus 
	Obj_GetID
	DoScreenElementMorph Id = {<ObjID> child = server_name} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<ObjID> child = mode} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<ObjID> child = songs} rgba = ($online_light_blue)
	DoScreenElementMorph Id = {<ObjID> child = Highlight_Bar} Alpha = 0.0
	DoScreenElementMorph Id = {<ObjID> child = bookend_left} Alpha = 0.0
	DoScreenElementMorph Id = {<ObjID> child = bookend_right} Alpha = 0.0
endscript

script get_qos_color 
	Color = ($online_red)
	if (<qos> > 3)
		Color = ($online_orange)
	endif
	if (<qos> > 5)
		Color = ($online_yellow)
	endif
	if (<qos> > 7)
		Color = ($online_green)
	endif
	return Color = <Color>
endscript
