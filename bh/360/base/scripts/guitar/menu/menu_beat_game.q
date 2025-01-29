beat_game_title = qs(0xab3c4e16)
beat_game_message = qs(0xe3d1dbcd)
beat_game_message_expert = qs(0xbf2dce3b)

script create_beat_game_menu 
	create_menu_backdrop \{texture = Beat_Game_BG}
	menu_font = fontgrid_title_a1
	get_current_band_name savegame = <savegame>
	band_name_text = <band_name>
	difficulty_text = qs(0x334908ac)
	next_difficulty_text = qs(0x46b84468)
	GetPlayerInfo \{1
		difficulty}
	if ($game_mode = gh4_p2_career)
		GetPlayerInfo \{1
			difficulty
			out = difficulty1}
		GetPlayerInfo \{2
			difficulty
			out = difficulty2}
		<index1> = ($difficulty_list_props.<difficulty1>.index)
		<index2> = ($difficulty_list_props.<difficulty2>.index)
		if (<index2> < <index1>)
			<difficulty> = <difficulty2>
		endif
	endif
	switch (<difficulty>)
		case easy
		<difficulty_text> = qs(0x8d657387)
		next_difficulty = medium
		<next_difficulty_text> = qs(0x6ef11a01)
		case medium
		<difficulty_text> = qs(0x6ef11a01)
		next_difficulty = hard
		<next_difficulty_text> = qs(0x51b06d2f)
		case hard
		<difficulty_text> = qs(0x51b06d2f)
		next_difficulty = expert
		<next_difficulty_text> = qs(0x334908ac)
	endswitch
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = beat_game_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement {
		type = TextElement
		parent = beat_game_container
		id = bgs_band_name
		just = [center top]
		font = <menu_font>
		text = <band_name_text>
		scale = 1.38
		rgba = [140 70 70 255]
		Pos = (640.0, 366.0)
	}
	GetScreenElementDims \{id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{id = bgs_band_name
			dims = (1060.0, 130.0)
			Pos = (640.0, 366.0)}
	endif
	FormatText TextName = title_text $beat_game_title d = <difficulty_text>
	CreateScreenElement {
		type = TextElement
		parent = beat_game_container
		id = bgs_under_title
		just = [left top]
		font = <menu_font>
		text = <title_text>
		scale = 1.0
		rgba = [250 245 145 255]
	}
	fit_text_in_rectangle \{id = bgs_under_title
		dims = (700.0, 65.0)
		Pos = (300.0, 428.0)}
	if (<difficulty> = expert)
		FormatText TextName = motivation_text ($beat_game_message_expert) n = <next_difficulty_text>
	else
		FormatText TextName = motivation_text ($beat_game_message) n = <next_difficulty_text>
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = beat_game_container
		font = fontgrid_text_A1
		text = <motivation_text>
		dims = (1100.0, 700.0)
		Pos = (640.0, 468.0)
		rgba = [250 245 145 255]
		just = [center top]
		internal_just = [center top]
		scale = 0.7
		z_priority = 3
	}
	<cheat> = qs(0x04463894)
	FormatText TextName = cheat_text qs(0x4563924d) c = <cheat>
	if (<difficulty> = expert)
		CreateScreenElement {
			type = TextElement
			parent = beat_game_container
			id = bgs_cheat_text
			just = [center top]
			font = <menu_font>
			text = <cheat_text>
			scale = 0.5
			Pos = (640.0, 622.0)
			rgba = [250 245 145 255]
		}
	endif
	button_font = buttons_x360
	displaySprite \{id = bgs_black_banner
		parent = beat_game_container
		tex = white
		Pos = (0.0, -2.0)
		dims = (1240.0, 100.0)
		rgba = [
			0
			0
			0
			255
		]
		z = -2}
	CreateScreenElement \{type = TextElement
		parent = beat_game_container
		id = continue_text
		scale = 1.0
		Pos = (40.0, 20.0)
		font = fontgrid_text_A1
		rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			center
		]
		event_handlers = [
			{
				pad_choose
				menu_beat_game_continue_to_song_breakdown
			}
		]}
	spawnscriptnow scroll_band_name params = {band_text = <band_name_text>}
	LaunchEvent \{type = focus
		target = continue_text}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		Bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100}
endscript

script destroy_beat_game_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	killspawnedscript \{name = scroll_band_name}
endscript

script scroll_band_name 
	displayText id = scrolling_bandname1 parent = beat_game_container Pos = (0.0, 34.0) scale = 1 font = <menu_font> text = <band_text> rgba = [124 77 65 255] z = -1
	GetScreenElementDims \{id = scrolling_bandname1}
	multi = (1280 / <width>)
	band_text_with_space = (<band_text> + qs(0x713755f7))
	long_band_text = <band_text_with_space>
	StringLength string = <band_text_with_space>
	<band_text_with_space_length> = <str_len>
	begin
	StringLength string = <long_band_text>
	<long_band_text_length> = <str_len>
	if NOT (<long_band_text_length> < (127 - <band_text_with_space_length>))
		break
	endif
	<long_band_text> = (<long_band_text> + <band_text_with_space>)
	SetScreenElementProps id = scrolling_bandname1 text = <long_band_text>
	GetScreenElementDims \{id = scrolling_bandname1}
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	SetScreenElementProps id = scrolling_bandname1 text = <long_band_text>
	fit_text_in_rectangle id = scrolling_bandname1 dims = ((1280.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (0.0, 34.0)
	displayText id = scrolling_bandname2 parent = beat_game_container scale = 1 font = <menu_font> text = <long_band_text> rgba = [124 77 65 255] z = -1
	GetScreenElementDims \{id = scrolling_bandname1}
	fit_text_in_rectangle id = scrolling_bandname2 dims = ((1280.0, 0.0) + (<height> * (0.0, 1.0))) Pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
	first = 1
	begin
	if (<first>)
		LegacyDoScreenElementMorph id = scrolling_bandname1 Pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		LegacyDoScreenElementMorph \{id = scrolling_bandname2
			Pos = (0.0, 34.0)
			time = 5}
	else
		LegacyDoScreenElementMorph id = scrolling_bandname2 Pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		LegacyDoScreenElementMorph \{id = scrolling_bandname1
			Pos = (0.0, 34.0)
			time = 5}
	endif
	wait \{5
		seconds}
	if (<first>)
		SetScreenElementProps id = scrolling_bandname1 Pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		SetScreenElementProps \{id = scrolling_bandname2
			Pos = (0.0, 34.0)}
		<first> = 0
	else
		SetScreenElementProps id = scrolling_bandname2 Pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		SetScreenElementProps \{id = scrolling_bandname1
			Pos = (0.0, 34.0)}
		<first> = 1
	endif
	repeat
endscript

script menu_beat_game_continue_to_song_breakdown 
	ui_event \{event = menu_change
		data = {
			state = UIstate_song_breakdown
			end_of_setlist_transition
			game_beat = 1
		}}
endscript
