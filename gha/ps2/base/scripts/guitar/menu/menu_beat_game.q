beat_game_title = 'YOU BEAT GUITAR HERO AEROSMITH ON \\c0%d!\\c0'
beat_game_message = 'Think you\'ve got what it takes to really\\n blow their minds? Try this bad boy out on \\c1%n\\c0. There may be a reward waiting for you if you succeed. Pain, fame and glory await, lil\' rocker.'
beat_game_message_expert = 'Wow. You\'ve mastered \\c1EXPERT\\c0 -- Go start a band already! Take it to the next level with the \\c1%n\\c0! Cheats can be unlocked in the options menu.'

script create_beat_game_menu 
	PlayMovieAndWait \{movie = 'singleplayer_end'}
	load_songqpak song_name = ($current_song) async = 0
	Change \{progression_play_completion_movie = 0}
	create_menu_backdrop \{texture = Beat_Game_BG}
	menu_font = fontgrid_title_gh3
	get_current_band_info
	GetGlobalTags <band_info> param = Name
	band_name = <Name>
	formatText TextName = band_name_text '%s' s = <band_name>
	difficulty_text = 'EXPERT'
	next_difficulty_text = 'PRECISION MODE CHEAT'
	<difficulty> = ($current_difficulty)
	switch (<difficulty>)
		case easy
		<difficulty_text> = 'EASY'
		next_difficulty = medium
		<next_difficulty_text> = 'MEDIUM'
		case medium
		<difficulty_text> = 'MEDIUM'
		next_difficulty = hard
		<next_difficulty_text> = 'HARD'
		case hard
		<difficulty_text> = 'HARD'
		next_difficulty = expert
		<next_difficulty_text> = 'EXPERT'
	endswitch
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = beat_game_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement {
		Type = TextElement
		parent = beat_game_container
		id = bgs_band_name
		just = [center top]
		font = <menu_font>
		text = <band_name_text>
		Scale = 1.8499999
		rgba = (($g_menu_colors).pink)
		Pos = (640.0, 346.0)
	}
	GetScreenElementDims \{id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{id = bgs_band_name
			dims = (1160.0, 130.0)
			Pos = (640.0, 346.0)}
	endif
	formatText TextName = title_text $beat_game_title d = <difficulty_text>
	CreateScreenElement {
		Type = TextElement
		parent = beat_game_container
		id = bgs_under_title
		just = [left top]
		font = <menu_font>
		text = <title_text>
		Scale = 1.4
		rgba = (($g_menu_colors).lt_violet_grey)
	}
	fit_text_in_rectangle \{id = bgs_under_title
		dims = (1000.0, 80.0)
		Pos = (280.0, 422.0)
		keep_ar = 1}
	if (<difficulty> = expert)
		formatText TextName = motivation_text ($beat_game_message_expert) n = <next_difficulty_text>
	else
		formatText TextName = motivation_text ($beat_game_message) n = <next_difficulty_text>
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = beat_game_container
		font = text_a4
		text = <motivation_text>
		dims = (1050.0, 700.0)
		Pos = (640.0, 475.0)
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [center top]
		internal_just = [center top]
		Scale = 0.8
		z_priority = 3
	}
	<cheat> = 'ALL DAY AND ALL OF THE NIGHT RIFF x 2'
	formatText TextName = cheat_text 'CHEAT HINT: %c' c = <cheat>
	if (<difficulty> = expert)
		CreateScreenElement {
			Type = TextElement
			parent = beat_game_container
			id = bgs_cheat_text
			just = [center top]
			font = <menu_font>
			text = <cheat_text>
			Scale = 0.8
			Pos = (640.0, 602.0)
			rgba = (($g_menu_colors).lt_violet_grey)
		}
	endif
	button_font = buttonsxenon
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
	CreateScreenElement {
		Type = TextElement
		parent = beat_game_container
		id = continue_text
		Scale = 1.0
		Pos = (40.0, 20.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	SpawnScriptNow scroll_ticker_text params = {ticker_text = <band_name_text>}
	LaunchEvent \{Type = focus
		target = continue_text}
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = 'CONTINUE'
		button = green
		z = 100}
endscript

script destroy_beat_game_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = scroll_ticker_text}
endscript
g_num_scrolling_texts = 0

script scroll_ticker_text {
		ticker_text = 'I NEED TICKER TEXT!'
		ticker_space = ' '
		ticker_pos = (0.0, 18.0)
		ticker_just = [left top]
		ticker_parent = beat_game_container
		ticker_x_scale = 1
		ticker_y_scale = 1
		ticker_font = text_a5
		ticker_rgba1 = (($g_menu_colors).dk_violet_grey)
		ticker_rgba2 = (($g_menu_colors).pink)
		ticker_alpha = 1
		ticker_z_priority = -1
		time = 5
	}
	formatText \{checksumName = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		Type = TextElement
		just = <ticker_just>
		id = <ticker_text_id_1>
		parent = <ticker_parent>
		Pos = <ticker_pos>
		Scale = ((<ticker_x_scale> * (1.333, 0.0)) + (<ticker_y_scale> * (0.0, 1.333)))
		font = <ticker_font>
		text = <ticker_text>
		rgba = <ticker_rgba1>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	GetScreenElementDims id = <ticker_text_id_1>
	if (<width> > 0)
		multi = (1280 / <width>)
	else
		ScriptAssert \{'Can\'t perform this operation using a screen element with no width!'}
	endif
	ticker_text_with_space = (<ticker_text> + <ticker_space>)
	long_ticker_text = <ticker_text_with_space>
	StringLength string = <ticker_text_with_space>
	<ticker_text_with_space_length> = <str_len>
	begin
	StringLength string = <long_ticker_text>
	<long_ticker_text_length> = <str_len>
	if NOT (<long_ticker_text_length> < (127 - <ticker_text_with_space_length>))
		break
	endif
	<long_ticker_text> = (<long_ticker_text> + <ticker_text_with_space>)
	SetScreenElementProps id = <ticker_text_id_1> text = <long_band_text>
	GetScreenElementDims id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	SetScreenElementProps id = <ticker_text_id_1> text = <long_ticker_text> Pos = <ticker_pos>
	formatText \{checksumName = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		id = <ticker_text_id_2>
		Type = TextElement
		just = <ticker_just>
		parent = <ticker_parent>
		Scale = ((<ticker_x_scale> * (1.333, 0.0)) + (<ticker_y_scale> * (0.0, 1.333)))
		font = <ticker_font>
		text = <long_ticker_text>
		rgba = <ticker_rgba2>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	GetScreenElementDims id = <ticker_text_id_1>
	SetScreenElementProps id = <ticker_text_id_2> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	Change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	first = 1
	begin
	if (<first>)
		DoScreenElementMorph id = <ticker_text_id_1> Pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) time = <time>
		DoScreenElementMorph id = <ticker_text_id_2> Pos = <ticker_pos> time = <time>
	else
		DoScreenElementMorph id = <ticker_text_id_2> Pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) time = <time>
		DoScreenElementMorph id = <ticker_text_id_1> Pos = <ticker_pos> time = <time>
	endif
	Wait <time> Seconds
	if (<first>)
		SetScreenElementProps id = <ticker_text_id_1> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		SetScreenElementProps id = <ticker_text_id_2> Pos = <ticker_pos>
		<first> = 0
	else
		SetScreenElementProps id = <ticker_text_id_2> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		SetScreenElementProps id = <ticker_text_id_1> Pos = <ticker_pos>
		<first> = 1
	endif
	repeat
endscript
