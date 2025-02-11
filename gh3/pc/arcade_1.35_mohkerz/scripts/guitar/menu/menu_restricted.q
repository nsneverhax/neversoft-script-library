
script create_restricted_menu 
	create_menu_backdrop \{texture = Venue_BG}
	set_focus_color \{rgba = [
			223
			223
			223
			255
		]}
	set_unfocus_color \{rgba = [
			50
			0
			0
			255
		]}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = rm_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = rm_container
		id = as_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 9
		event_handlers = [
			{
				pad_back
				menu_flow_go_back
			}
		]}
	displaySprite \{parent = rm_container
		tex = Options_Calibrate_Poster
		Pos = (50.0, 0.0)
		dims = (216.0, 477.0)
		z = 10}
	displaySprite \{parent = rm_container
		tex = Options_Calibrate_Paper
		Pos = (225.0, -140.0)
		dims = (1250.0, 1800.0)
		z = 8}
	displaySprite \{parent = rm_container
		tex = Toprockers_Tape_2
		Pos = (320.0, -100.0)
		dims = (180.0, 80.0)
		rot_angle = 93
		z = 12}
	displaySprite \{parent = rm_container
		tex = Toprockers_Tape_2
		rgba = [
			0
			0
			0
			128
		]
		Pos = (325.0, -102.0)
		dims = (180.0, 80.0)
		rot_angle = 93
		z = 11}
	displaySprite \{parent = rm_container
		tex = tape_H_02
		Pos = (20.0, 266.0)
		dims = (132.0, 64.0)
		rot_angle = 8
		z = 12}
	displaySprite \{parent = rm_container
		tex = tape_H_02
		rgba = [
			0
			0
			0
			128
		]
		Pos = (12.0, 272.0)
		dims = (132.0, 64.0)
		rot_angle = 8
		z = 11}
	displaySprite \{parent = rm_container
		id = rm_black_bg
		tex = options_main_highlight
		Pos = (500.0, 210.0)
		dims = (180.0, 30.0)
		rgba = [
			50
			0
			0
			255
		]
		z = 11
		just = [
			left
			top
		]}
	displayText \{parent = rm_container
		text = "DISABLE SONGS"
		Pos = (500.0, 40.0)
		z = 12
		Scale = 1.15
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a11_Large
		rot = -6
		noshadow}
	displayText \{parent = rm_container
		text = "DISABLE SONGS"
		Pos = (505.0, 45.0)
		z = 12
		Scale = 1.15
		just = [
			center
			center
		]
		rgba = [
			160
			130
			105
			255
		]
		font = text_a11_Large
		rot = -5
		noshadow}
	printf \{"create_restricted_menu: family_mode_enabled = %d"
		d = $family_mode_enabled}
	if ($family_mode_enabled)
		switch ($family_mode_enabled)
			case 1
			displayText \{parent = rm_container
				text = "FAMILY MODE 1 ENABLED"
				Pos = (970.0, 30.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
			displayText \{parent = rm_container
				text = "Turn off DIP switch 1 and power-cycle to"
				Pos = (970.0, 50.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
			case 2
			displayText \{parent = rm_container
				text = "FAMILY MODE 2 ENABLED"
				Pos = (970.0, 30.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
			displayText \{parent = rm_container
				text = "Turn off DIP switch 2 and power-cycle to"
				Pos = (970.0, 50.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
			case 3
			displayText \{parent = rm_container
				text = "FAMILY MODES 1 & 2 ENABLED"
				Pos = (970.0, 30.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
			displayText \{parent = rm_container
				text = "Turn off DIP switches 1 & 2 and power-cycle to"
				Pos = (970.0, 50.0)
				z = 12
				Scale = 0.5
				just = [
					center
					center
				]
				rgba = [
					50
					0
					0
					255
				]
				font = text_a4
				rot = 0
				noshadow}
		endswitch
		displayText \{parent = rm_container
			text = "re-enable manual control of affected songs"
			Pos = (970.0, 70.0)
			z = 12
			Scale = 0.5
			just = [
				center
				center
			]
			rgba = [
				50
				0
				0
				255
			]
			font = text_a4
			rot = 0
			noshadow}
		displayText \{parent = rm_container
			text = "NOTE: turning DIP off does not turn songs back on."
			Pos = (970.0, 90.0)
			z = 12
			Scale = 0.5
			just = [
				center
				center
			]
			rgba = [
				50
				0
				0
				255
			]
			font = text_a4
			rot = 0
			noshadow}
	endif
	create_restricted_song_list
	Change \{menu_restricted_current_index = 0}
	LaunchEvent \{Type = focus
		target = restricted_song_id_0}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_restricted_menu 
	destroy_menu_backdrop
	destroy_menu \{menu_id = rm_container}
	clean_up_user_control_helpers
endscript

script create_restricted_song_list 
	GetArraySize \{$gh3_arcade_tier_songs}
	start_song_pos = (330.0, 120.0)
	song_stat_offset_pos = (440.0, 0.0)
	col_offset_pos = (490.0, 0.0)
	next_song_offset_pos = (0.0, 20.0)
	num_songs_per_column = 26
	cur_pos = <start_song_pos>
	song_count = 0
	song_col_count = 0
	num_columns_count = 0
	temp_song_name = ''
	z = 12
	tier_global = GH3_General_Songs
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	tier_size = <array_Size>
	array_count = 0
	begin
	get_song_title song = ($gh3_arcade_tier_songs [<song_count>])
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier>
	formatText checksumName = restricted_id 'restricted_song_id_%i' i = <song_count>
	CreateScreenElement {
		Type = TextElement
		parent = rm_container
		id = <restricted_id>
		text = <song_title>
		Pos = <cur_pos>
		z_priority = <z>
		rgba = [50 0 0 255]
		Scale = 0.5
		font = text_a4
		just = [left top]
		noshadow
		event_handlers = [
			{focus restricted_menu_hilight}
			{unfocus retail_menu_unfocus}
			{pad_choose toggle_restricted}
			{pad_up restricted_change_index params = {move = up}}
			{pad_down restricted_change_index params = {move = down}}
			{pad_back menu_flow_go_back}
		]
	}
	<id> :SetTags bg_pos = (<cur_pos> + (-6.0, 5.0)) bg_dims = (320.0, 24.0)
	if (<song_count> = 0)
		<id> :SetProps rgba = [200 150 150 255]
	else
		if ($family_mode_enabled)
			switch ($family_mode_enabled)
				case 1
				GetArraySize \{$disney_restricted_songs}
				i = 0
				begin
				if ($gh3_arcade_tier_songs [<song_count>] = $disney_restricted_songs [<i>])
					<id> :SetTags tag_disabled
					<id> :SetProps rgba = [200 150 150 255]
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
				case 2
				GetArraySize \{$chuck_restricted_songs}
				i = 0
				begin
				if ($gh3_arcade_tier_songs [<song_count>] = $chuck_restricted_songs [<i>])
					<id> :SetTags tag_disabled
					<id> :SetProps rgba = [200 150 150 255]
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
				case 3
				GetArraySize \{$disney_restricted_songs}
				i = 0
				begin
				if ($gh3_arcade_tier_songs [<song_count>] = $disney_restricted_songs [<i>])
					<id> :SetTags tag_disabled
					<id> :SetProps rgba = [200 150 150 255]
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
				GetArraySize \{$chuck_restricted_songs}
				i = 0
				begin
				if ($gh3_arcade_tier_songs [<song_count>] = $chuck_restricted_songs [<i>])
					<id> :SetTags tag_disabled
					<id> :SetProps rgba = [200 150 150 255]
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			endswitch
		endif
	endif
	formatText checksumName = restricted_yes_id 'restricted_yes_id_%i' i = <song_count>
	CreateScreenElement {
		Type = SpriteElement
		parent = rm_container
		id = <restricted_yes_id>
		texture = checkmarkgr
		Pos = (<cur_pos> + (-20.0, 9.0))
		just = [left top]
		z_priority = <z>
	}
	<id> :SetProps alpha = 0
	formatText checksumName = restricted_no_id 'restricted_no_id_%i' i = <song_count>
	CreateScreenElement {
		Type = SpriteElement
		parent = rm_container
		id = <restricted_no_id>
		texture = xmarkred
		Pos = (<cur_pos> + (-20.0, 9.0))
		just = [left top]
		z_priority = <z>
	}
	<id> :SetProps alpha = 0
	GetGlobalTags <song_checksum> param = restricted
	if (<restricted> = 1)
		<restricted_no_id> :SetProps alpha = 1
		<restricted_id> :SetTags restricted = 1
	else
		<restricted_yes_id> :SetProps alpha = 1
		<restricted_id> :SetTags restricted = 0
	endif
	<cur_pos> = (<cur_pos> + <next_song_offset_pos>)
	Increment \{song_count}
	Increment \{song_col_count}
	if (<song_col_count> = <num_songs_per_column>)
		Increment \{num_columns_count}
		<song_col_count> = 0
		<cur_pos> = (<start_song_pos> + (<col_offset_pos> * <num_columns_count>))
	endif
	array_count = (<array_count> + 1)
	repeat <tier_size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript
menu_restricted_current_index = 0

script restricted_change_index \{move = up}
	menu_restricted_last_index = ($menu_restricted_current_index)
	formatText checksumName = last_text_id 'restricted_song_id_%d' d = ($menu_restricted_current_index)
	formatText TextName = last_text_id_text 'restricted_song_id_%d' d = ($menu_restricted_current_index)
	printf "restricted_change_index: id = %d" d = <last_text_id_text>
	if (<move> = up)
		if ($menu_restricted_current_index = 0)
			Change \{menu_restricted_current_index = 49}
		else
			Change menu_restricted_current_index = ($menu_restricted_current_index - 1)
		endif
	else
		if ($menu_restricted_current_index = 49)
			Change \{menu_restricted_current_index = 0}
		else
			Change menu_restricted_current_index = ($menu_restricted_current_index + 1)
		endif
	endif
	index = ($menu_restricted_current_index)
	if NOT is_disabled id = <last_text_id>
		LaunchEvent Type = unfocus target = <id>
		if (<menu_restricted_last_index> = 0)
			<last_text_id> :SetProps rgba = [200 150 150 255]
		endif
	endif
	formatText checksumName = text_id 'restricted_song_id_%d' d = <index>
	formatText TextName = text_id_text 'restricted_song_id_%d' d = <index>
	printf "restricted_change_index: id = %d" d = <text_id_text>
	<text_id> :GetTags
	if (GotParam tag_disabled)
		if (<move> = up)
			LaunchEvent Type = pad_up target = <text_id>
		else
			LaunchEvent Type = pad_down target = <text_id>
		endif
		return
	endif
	LaunchEvent Type = focus target = <text_id>
	generic_menu_up_or_down_sound
endscript

script toggle_restricted 
	if ($menu_restricted_current_index = 0)
		return
	endif
	index = ($menu_restricted_current_index)
	get_song_title song = ($gh3_arcade_tier_songs [<index>])
	formatText checksumName = restricted_id 'restricted_song_id_%i' i = <index>
	formatText checksumName = restricted_yes_id 'restricted_yes_id_%i' i = <index>
	formatText checksumName = restricted_no_id 'restricted_no_id_%i' i = <index>
	<restricted_id> :GetTags
	printf "toggle_restricted: getting elements for %s" s = <restricted_id>
	GetScreenElementProps id = <restricted_id>
	if (<restricted> = 1)
		<restricted> = 0
		<restricted_yes_id> :SetProps alpha = 1
		<restricted_no_id> :SetProps alpha = 0
	else
		<restricted> = 1
		<restricted_yes_id> :SetProps alpha = 0
		<restricted_no_id> :SetProps alpha = 1
	endif
	printf "toggle_restricted: song_title = %a restricted = %b" a = <song_title> b = <restricted>
	Progression_RestrictSong tier_global = GH3_General_Songs song = ($gh3_arcade_tier_songs [<index>]) restricted = <restricted>
	<id> :SetTags restricted = <restricted>
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
endscript

script restricted_menu_hilight 
	index = ($menu_restricted_current_index)
	GetTags
	printf "restricted_menu_hilight: getting elements for %s" s = <id>
	GetScreenElementProps id = <id>
	SetScreenElementProps id = rm_black_bg Pos = <bg_pos> dims = <bg_dims>
	retail_menu_focus
endscript
