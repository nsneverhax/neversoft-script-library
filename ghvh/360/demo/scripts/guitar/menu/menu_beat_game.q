beat_game_title = qs(0x7825eb9b)
beat_game_message = qs(0xe3d1dbcd)
beat_game_message_expert = qs(0xbf2dce3b)

script create_beat_game_menu 
	create_menu_backdrop \{texture = beat_game_bg}
	menu_font = fontgrid_title_a1
	get_current_band_info
	getglobaltags <band_info> param = name
	band_name = <name>
	formattext textname = band_name_text qs(0x73307931) s = <band_name>
	difficulty_text = qs(0x334908ac)
	next_difficulty_text = qs(0x46b84468)
	<difficulty> = ($player1_status.difficulty)
	if ($game_mode = p2_career)
		<index1> = ($difficulty_list_props.($player1_status.difficulty).index)
		<index2> = ($difficulty_list_props.($player2_status.difficulty).index)
		if (<index2> < <index1>)
			<difficulty> = ($player2_status.difficulty)
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
	createscreenelement \{type = containerelement
		parent = root_window
		id = beat_game_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = textelement
		parent = beat_game_container
		id = bgs_band_name
		just = [center top]
		font = <menu_font>
		text = <band_name_text>
		scale = 1.38
		rgba = [140 70 70 255]
		pos = (640.0, 366.0)
	}
	getscreenelementdims \{id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{id = bgs_band_name
			dims = (1060.0, 130.0)
			pos = (640.0, 366.0)}
	endif
	formattext textname = title_text $beat_game_title d = <difficulty_text>
	createscreenelement {
		type = textelement
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
		pos = (300.0, 428.0)}
	if (<difficulty> = expert)
		formattext textname = motivation_text ($beat_game_message_expert) n = <next_difficulty_text>
	else
		formattext textname = motivation_text ($beat_game_message) n = <next_difficulty_text>
	endif
	createscreenelement {
		type = textblockelement
		parent = beat_game_container
		font = fontgrid_text_a8
		text = <motivation_text>
		dims = (1100.0, 700.0)
		pos = (640.0, 468.0)
		rgba = [250 245 145 255]
		just = [center top]
		internal_just = [center top]
		scale = 0.7
		z_priority = 3
	}
	<cheat> = qs(0x04463894)
	formattext textname = cheat_text qs(0x4563924d) c = <cheat>
	if (<difficulty> = expert)
		createscreenelement {
			type = textelement
			parent = beat_game_container
			id = bgs_cheat_text
			just = [center top]
			font = <menu_font>
			text = <cheat_text>
			scale = 0.5
			pos = (640.0, 622.0)
			rgba = [250 245 145 255]
		}
	endif
	button_font = buttons_x360
	displaysprite \{id = bgs_black_banner
		parent = beat_game_container
		tex = white
		pos = (0.0, -2.0)
		dims = (1240.0, 100.0)
		rgba = [
			0
			0
			0
			255
		]
		z = -2}
	createscreenelement \{type = textelement
		parent = beat_game_container
		id = continue_text
		scale = 1.0
		pos = (40.0, 20.0)
		font = fontgrid_text_a8
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
	launchevent \{type = focus
		target = continue_text}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
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
	displaytext id = scrolling_bandname1 parent = beat_game_container pos = (0.0, 34.0) scale = 1 font = <menu_font> text = <band_text> rgba = [124 77 65 255] z = -1
	getscreenelementdims \{id = scrolling_bandname1}
	multi = (1280 / <width>)
	band_text_with_space = (<band_text> + qs(0x713755f7))
	long_band_text = <band_text_with_space>
	stringlength string = <band_text_with_space>
	<band_text_with_space_length> = <str_len>
	begin
	stringlength string = <long_band_text>
	<long_band_text_length> = <str_len>
	if NOT (<long_band_text_length> < (127 - <band_text_with_space_length>))
		break
	endif
	<long_band_text> = (<long_band_text> + <band_text_with_space>)
	setscreenelementprops id = scrolling_bandname1 text = <long_band_text>
	getscreenelementdims \{id = scrolling_bandname1}
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	setscreenelementprops id = scrolling_bandname1 text = <long_band_text>
	fit_text_in_rectangle id = scrolling_bandname1 dims = ((1280.0, 0.0) + (<height> * (0.0, 1.0))) pos = (0.0, 34.0)
	displaytext id = scrolling_bandname2 parent = beat_game_container scale = 1 font = <menu_font> text = <long_band_text> rgba = [124 77 65 255] z = -1
	getscreenelementdims \{id = scrolling_bandname1}
	fit_text_in_rectangle id = scrolling_bandname2 dims = ((1280.0, 0.0) + (<height> * (0.0, 1.0))) pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
	first = 1
	begin
	if (<first>)
		legacydoscreenelementmorph id = scrolling_bandname1 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		legacydoscreenelementmorph \{id = scrolling_bandname2
			pos = (0.0, 34.0)
			time = 5}
	else
		legacydoscreenelementmorph id = scrolling_bandname2 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		legacydoscreenelementmorph \{id = scrolling_bandname1
			pos = (0.0, 34.0)
			time = 5}
	endif
	wait \{5
		seconds}
	if (<first>)
		setscreenelementprops id = scrolling_bandname1 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		setscreenelementprops \{id = scrolling_bandname2
			pos = (0.0, 34.0)}
		<first> = 0
	else
		setscreenelementprops id = scrolling_bandname2 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		setscreenelementprops \{id = scrolling_bandname1
			pos = (0.0, 34.0)}
		<first> = 1
	endif
	repeat
endscript

script menu_beat_game_continue_to_song_breakdown 
	ui_event \{event = menu_change
		data = {
			state = uistate_song_breakdown
			gig_complete = 1
			game_beat = 1
		}}
endscript
