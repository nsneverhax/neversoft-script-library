detailed_stats_font = fontgrid_text_a3
detailed_stats_text_color = [
	0
	0
	0
	255
]
detailed_stats_text_scale = 1
initial_column_y_end = 340
left_column_num_elements = 0
left_column_x = 200
left_column_y_end = 100
left_column_just = [
	left
	top
]
center_column_num_elements = 0
center_column_y_end = 100
center_column_x = 640
center_column_just = [
	center
	top
]
right_column_num_elements = 0
right_column_x = 1070
right_column_y_end = 100
right_column_just = [
	right
	top
]
relative_screen_y_position = 0
up_down_y_change = 50
bottom_gap = 150

script create_detailed_stats_menu 
	ScriptAssert \{'create_detailed_stats_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_detailed_stats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ds_container}
	destroy_menu \{menu_id = temp_ds_background}
	destroy_menu \{menu_id = continue_text}
	destroy_menu \{menu_id = detailed_stats_bg_container}
	destroy_menu \{menu_id = ds_spotlight}
endscript

script add_basic_stats_desc 
	if isSinglePlayerGame
		desc_column = 'left'
	elseif ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> text = qs(0x7d221f06) dims = (400.0, 0.0)
	add_text_to_column column = <desc_column> text = qs(0xf75837da) dims = (400.0, 0.0)
	add_text_to_column column = <desc_column> text = qs(0xff3216c6) dims = (400.0, 0.0)
	getnumplayersingame
	if (<num_players> = 2)
		if ($game_mode = p2_pro_faceoff ||
				is_roadie_battle_mode)
			add_text_to_column column = <desc_column> text = qs(0x2db115e5) dims = (400.0, 0.0)
		endif
	endif
endscript

script add_basic_stats 
	Player = 0
	getnumplayersingame
	begin
	if isSinglePlayerGame
		stat_column = 'right'
	elseif ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		stat_column = 'right'
	else
		if (<Player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	add_text_to_column column = <stat_column> text = (<notes_ratio> [<Player>]) dims = (150.0, 0.0)
	add_text_to_column column = <stat_column> text = (<sp_ratio> [<Player>]) dims = (150.0, 0.0)
	add_text_to_column column = <stat_column> text = (<avg_multiplier> [<Player>]) dims = (150.0, 0.0)
	getnumplayersingame
	if (<num_players> = 2)
		if ($game_mode = p2_pro_faceoff ||
				is_roadie_battle_mode)
			add_text_to_column column = <stat_column> text = (<lead_percentage> [<Player>]) dims = (150.0, 0.0)
		endif
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		break
	endif
	<Player> = (<Player> + 1)
	repeat <num_players>
endscript
g_players_lowest_stat = [
	0.0
	0.0
]
g_players_highest_stat = [
	0.0
	0.0
]

script get_highest_lowest_stats 
	get_section_stats section_index = <section_index> section_array = <section_array>
	Player = 0
	getnumplayersingame
	begin
	if (<section_index> = 0)
		SetArrayElement ArrayName = g_players_lowest_stat globalarray index = <Player> NewValue = 99.9
		SetArrayElement ArrayName = g_players_highest_stat globalarray index = <Player> NewValue = 0.1
	endif
	if (<notes_max> [<Player>] > 0)
		hit_percent = ((100 * (<notes_hit> [<Player>])) / (<notes_max> [<Player>]))
		if (<hit_percent> < $g_players_lowest_stat [<Player>])
			SetArrayElement ArrayName = g_players_lowest_stat globalarray index = <Player> NewValue = <hit_percent>
		endif
		if (<hit_percent> > $g_players_highest_stat [<Player>])
			SetArrayElement ArrayName = g_players_highest_stat globalarray index = <Player> NewValue = <hit_percent>
		endif
	endif
	<Player> = (<Player> + 1)
	repeat <num_players>
endscript

script add_section_stats_and_desc \{section_index = 0
		highlight = 0
		for_practice = 0}
	get_section_stats section_index = <section_index> section_array = <section_array>
	if isSinglePlayerGame
		desc_column = 'left'
	elseif ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> text = <section_name> for_practice = <for_practice> dims = (500.0, 0.0)
	GetArraySize <notes_max>
	getnumplayersingame
	if (<array_Size> < <num_players>)
		ScriptAssert 'More players (%p) than detailed stats columns (%c)' p = <num_players> c = <array_Size>
		return
	endif
	Player = 0
	getnumplayersingame
	begin
	if isSinglePlayerGame
		stat_column = 'right'
	elseif (|| $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		stat_column = 'right'
	else
		if (<Player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	if (<notes_max> [<Player>] > 0)
		hit_percent = ((100 * (<notes_hit> [<Player>])) / (<notes_max> [<Player>]))
		formatText TextName = section_percent qs(0x858225e7) d = <hit_percent>
		if (<hit_percent> = 100)
			add_text_to_column column = <stat_column> text = <section_percent> rgba = [20 165 0 255] highlight = <highlight> for_practice = <for_practice>
		elseif (<hit_percent> = $g_players_lowest_stat [<Player>])
			add_text_to_column column = <stat_column> text = <section_percent> rgba = [165 0 0 255] highlight = <highlight> for_practice = <for_practice>
		else
			add_text_to_column column = <stat_column> text = <section_percent> highlight = <highlight> for_practice = <for_practice>
		endif
	else
		hit_percent = 0
		formatText \{TextName = section_percent
			qs(0x6a5cf46c)}
		add_text_to_column column = <stat_column> text = <section_percent> highlight = <highlight> for_practice = <for_practice>
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		break
	endif
	<Player> = (<Player> + 1)
	repeat <num_players>
endscript

script detailed_stats_create_container \{for_practice = 0}
	if playerinfoequals \{1
			bot_play = 1}
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_roadie_battle ||
				$game_mode = p2_quickplay)
			RemoveParameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = ds_container
		Pos = (0.0, 0.0)
		exclusive_device = <exclusive_device>
	}
	pad_back_script = nullscript
	if ($special_event_stage = 0)
		<pad_back_script> = generic_event_back
	endif
	CreateScreenElement {
		Type = TextElement
		parent = root_window
		id = continue_text
		Scale = 0.8
		Pos = (50.0, 23.0)
		font = fontgrid_text_a1
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 101
		event_handlers = [
			{pad_back <pad_back_script>}
			{pad_choose ui_win_song_continue}
			{pad_down menu_detailed_stats_move_screen_up}
			{pad_up menu_detailed_stats_move_screen_down}
		]
	}
	if (<for_practice> = 0)
		LaunchEvent \{Type = focus
			target = continue_text}
	endif
	CreateScreenElement \{Type = SpriteElement
		id = detailed_stats_paper_top
		parent = ds_container
		texture = song_summary_detail_sheet_top
		rot_angle = 2
		Pos = (140.0, 50.0)
		dims = (1024.0, 256.0)
		just = [
			left
			top
		]
		z_priority = 1}
	if ($special_event_stage != 0)
		formatText \{checksumName = special_event_num
			'special_event%d'
			d = $current_special_event_num}
		practice_title = ($special_events_challenges.<special_event_num>.title)
	else
		practice_title = qs(0x66fbc84d)
	endif
	if (<for_practice> = 1)
		CreateScreenElement {
			Type = TextElement
			parent = ds_container
			Pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = <practice_title>
			rgba = [118 29 30 255]
			Scale = (1.7, 2.25)
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = ds_container
			Pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = qs(0x1483ab79)
			rgba = [118 29 30 255]
			Scale = 2.75
		}
		CreateScreenElement {
			Type = TextElement
			parent = ds_container
			Pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 215.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = qs(0x0b3b793c)
			rgba = [118 29 30 255]
			Scale = 2.75
		}
	endif
	CreateScreenElement \{Type = ContainerElement
		id = detailed_stats_bg_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		id = detailed_stats_bg0
		parent = detailed_stats_bg_container
		texture = song_summary_detail_bg
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		id = detailed_stats_bg1
		parent = detailed_stats_bg_container
		texture = song_summary_detail_bg
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 240.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		id = detailed_stats_bg2
		parent = detailed_stats_bg_container
		texture = song_summary_detail_bg
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 480.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		id = detailed_stats_bg3
		parent = detailed_stats_bg_container
		texture = song_summary_detail_bg
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 720.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
endscript

script add_text_to_column {
		column = 'left'
		text = qs(0x72913c21)
		rgba = [75 75 75 255]
		Scale = ($detailed_stats_text_scale)
		rot = 0
		highlight = 0
		font = ($detailed_stats_font)
		for_practice = 0
	}
	formatText checksumName = column_x '%s_column_x' s = (<column>)
	formatText checksumName = column_y_end '%s_column_y_end' s = (<column>)
	formatText checksumName = column_just '%s_column_just' s = (<column>)
	formatText checksumName = column_elements '%s_column_num_elements' s = <column>
	formatText checksumName = entry_id '%s_column_%d' s = <column> d = ($<column_elements>)
	GetUpperCaseString <text>
	if (<for_practice> = 1)
		<UppercaseString> = qs(0x03ac90f0)
		font = fontgrid_text_a1
	endif
	if GotParam \{dont_force_caps}
		<display_string> = <text>
	else
		<display_string> = <UppercaseString>
	endif
	CreateScreenElement {
		Type = TextElement
		parent = ds_container
		id = <entry_id>
		font = <font>
		rgba = <rgba>
		Scale = <Scale>
		rot_angle = <rot>
		Pos = ((1.0, 0.0) * $<column_x> + (0.0, 1.0) * $<column_y_end> - (-7.0, 7.0))
		just = (<column_just>)
		text = <display_string>
		z_priority = 6
		font_spacing = 1
	}
	if GotParam \{dims}
		GetScreenElementDims id = <id>
		if NOT (<width> = 0)
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = (((<dims>.(1.0, 0.0)) * (1.0, 0.0)) + <height> * (0.0, 1.0))
		endif
	endif
	GetScreenElementDims id = <entry_id>
	if (<for_practice> = 1)
		height = (<height> - 1)
	endif
	highlight_width = ($right_column_x - $left_column_x + 50)
	if (<highlight> = 1)
		CreateScreenElement {
			Type = SpriteElement
			parent = ds_container
			Pos = ((1.0, 0.0) * ($left_column_x - 25) + (0.0, 1.0) * ($<column_y_end> - 4))
			dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <height>)
			rgba = [0 0 0 25]
			just = [left top]
			z_priority = 3
		}
	endif
	new_column_y_end = ($<column_y_end> + <height>)
	new_num_column_elements = ($<column_elements> + 1)
	Change GlobalName = <column_y_end> NewValue = <new_column_y_end>
	Change GlobalName = <column_elements> NewValue = <new_num_column_elements>
endscript

script get_section_stats \{section_index = 0}
	notes_hit = [0 0]
	notes_max = [1 1]
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		SetArrayElement ArrayName = notes_hit index = 0 NewValue = (($p1_last_song_detailed_stats [<section_index>]) + ($p2_last_song_detailed_stats [<section_index>]))
		SetArrayElement ArrayName = notes_max index = 0 NewValue = (($p1_last_song_detailed_stats_max [<section_index>]) + ($p2_last_song_detailed_stats_max [<section_index>]))
	else
		SetArrayElement ArrayName = notes_hit index = 0 NewValue = ($p1_last_song_detailed_stats [<section_index>])
		SetArrayElement ArrayName = notes_hit index = 1 NewValue = ($p2_last_song_detailed_stats [<section_index>])
		SetArrayElement ArrayName = notes_max index = 0 NewValue = ($p1_last_song_detailed_stats_max [<section_index>])
		SetArrayElement ArrayName = notes_max index = 1 NewValue = ($p2_last_song_detailed_stats_max [<section_index>])
	endif
	return <...>
endscript

script menu_detailed_stats_move_screen_down 
	if (($relative_screen_y_position + $up_down_y_change) < 0)
		Change relative_screen_y_position = ($relative_screen_y_position + $up_down_y_change)
		generic_menu_up_or_down_sound \{down}
	else
		Change \{relative_screen_y_position = 0}
	endif
	SetScreenElementProps id = ds_container Pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_detailed_stats_move_screen_up 
	stats_end = ($relative_screen_y_position + $left_column_y_end)
	GetScreenElementDims \{id = root_window}
	bottom_end = (<height> - $bottom_gap + 300)
	if ((<stats_end> - $up_down_y_change) > <bottom_end>)
		Change relative_screen_y_position = ($relative_screen_y_position - $up_down_y_change)
		generic_menu_up_or_down_sound \{up}
	endif
	SetScreenElementProps id = ds_container Pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_ds_scroll_all 
	menu_ds_scroll_background
endscript

script menu_ds_scroll_background 
	scroll_position = (-1 * ($relative_screen_y_position))
	printf qs(0x12f58af8) d = <scroll_position>
	if (<scroll_position> < 240)
		SetScreenElementProps id = detailed_stats_bg_container Pos = ((0.0, -1.0) * <scroll_position>)
	else
		Mod a = <scroll_position> b = 240
		SetScreenElementProps id = detailed_stats_bg_container Pos = ((0.0, -1.0) * <Mod>)
	endif
endscript

script menu_detailed_stats_add_paper_sprites 
	CreateScreenElement {
		Type = SpriteElement
		parent = ds_container
		Pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * ($left_column_y_end))
		rot_angle = 2
		dims = (1016.0, 128.0)
		texture = song_summary_detail_sheet_bottom
		just = [left top]
		z_priority = 2
	}
	num_left_side_paper_repetitions = 3
	y_position = 304
	total_desired_dim = ($left_column_y_end - $initial_column_y_end)
	piecewise_desired_dim = ((<total_desired_dim> + 39) / <num_left_side_paper_repetitions>)
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = ds_container
		Pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * <y_position>)
		dims = ((32.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = song_summary_detail_sheet_l
		just = [left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_left_side_paper_repetitions>
	num_right_side_paper_repetitions = 3
	y_position = 339
	piecewise_desired_dim = ((<total_desired_dim> + 37) / <num_right_side_paper_repetitions>)
	begin
	CreateScreenElement {
		Type = SpriteElement
		parent = ds_container
		Pos = ((1.0, 0.0) * 1087 + (0.0, 1.0) * <y_position>)
		dims = ((64.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = song_summary_detail_sheet_r
		just = [left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_right_side_paper_repetitions>
	CreateScreenElement {
		Type = SpriteElement
		parent = ds_container
		Pos = (139.0, 304.0)
		dims = ((1.0, 0.0) * 976 + (0.0, 1.0) * (<total_desired_dim> + 70))
		texture = white
		rgba = [255 255 255 255]
		z_priority = 1
		just = [left top]
	}
endscript

script add_divider_graphic 
	if ($is_network_game)
		divider_element_num = 8
	elseif isSinglePlayerGame
		divider_element_num = 4
	elseif ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		divider_element_num = 4
	else
		if ($game_mode = p2_pro_faceoff ||
				$game_mode = p2_roadie_battle)
			divider_element_num = 7
		else
			divider_element_num = 6
		endif
	endif
	formatText checksumName = entry_id '%c_column_%d' c = 'left' d = <divider_element_num>
	GetScreenElementProps id = <entry_id>
	divider_y = (<Pos> [1])
	printf qs(0x96305180) d = <divider_y>
	CreateScreenElement {
		Type = SpriteElement
		parent = ds_container
		Pos = ((1.0, 0.0) * $center_column_x + (0.0, 1.0) * (<divider_y> - 8))
		Scale = (2.5, 1.4)
		texture = song_summary_detail_divider
		just = [center center]
		z_priority = 5
	}
endscript
