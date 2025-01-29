guitar_hero_cheats = [
	{
		Name = AirGuitar
		name_text = "air guitar"
		var = Cheat_AirGuitar
		unlock_pattern = [
			4352
			69632
			4352
			4352
			4112
			4112
			4112
			4112
			4112
			272
			272
			257
		]
	}
	{
		Name = PerformanceMode
		name_text = "performance mode"
		var = Cheat_PerformanceMode
		unlock_pattern = [
			69632
			69632
			4097
			4112
			69632
			69632
			4097
			4112
		]
	}
	{
		Name = Hyperspeed
		name_text = "hyperspeed"
		var = Cheat_Hyperspeed
		unlock_pattern = [
			257
			257
			257
			257
			257
			4352
			4352
			4352
			4352
			4112
			4112
			4112
			4112
			4112
			272
			257
			257
		]
	}
	{
		Name = NoFail
		name_text = "no fail"
		var = Cheat_NoFail
		unlock_pattern = [
			69632
			16
			69632
			65792
			16
			65792
			4352
			1
			4352
			65792
			256
			65792
			69632
		]
	}
	{
		Name = PrecisionMode
		name_text = "precision mode"
		var = Cheat_PrecisionMode
		unlock_pattern = [
			4352
			4112
			4112
			4352
			4352
			272
			272
			272
			4112
			4352
			4112
			4112
			4352
			4352
			272
			272
			272
			4112
		]
	}
	{
		Name = UnlockAll
		name_text = "unlocked all songs"
		var = Cheat_UnlockAll
		unlock_pattern = [
			4352
			69632
			69632
			4352
			4352
			69632
			4352
			4352
			69632
			69632
			4352
			4352
			69632
			4352
			4112
		]
	}
]
guitar_hero_cheats_completed = [
	0
	0
	0
	0
	0
	0
	0
]

script clear_cheats 
	Change \{Cheat_AirGuitar = -1}
	Change \{Cheat_Hyperspeed = -1}
	Change \{Cheat_PerformanceMode = -1}
	Change \{Cheat_NoFail = -1}
	Change \{Cheat_PrecisionMode = -1}
endscript

script create_cheats_menu 
	disable_pause
	if ($entering_cheat = 0)
		CreateScreenElement \{Type = ContainerElement
			id = cheats_container
			parent = root_window
			Pos = (0.0, 0.0)}
		if NOT ScreenElementExists \{id = menu_backdrop_container}
			create_menu_backdrop \{texture = Venue_BG}
		endif
		if NOT ScreenElementExists \{id = cheats_container}
			return
		endif
		displaySprite \{parent = cheats_container
			tex = options_video_poster
			rot_angle = 1
			Pos = (640.0, 215.0)
			dims = (820.0, 440.0)
			just = [
				center
				center
			]
			z = 1
			font = $video_settings_menu_font}
		displayText \{parent = cheats_container
			Pos = (910.0, 402.0)
			just = [
				right
				center
			]
			id = cheats_menu_title
			text = "CHEATS"
			Scale = 1.1
			rgba = [
				240
				235
				240
				255
			]
			font = text_a5
			noshadow}
		displaySprite \{parent = cheats_container
			tex = tape_H_03
			Pos = (270.0, 185.0)
			rot_angle = -50
			Scale = 0.5
			z = 20}
		displaySprite {
			parent = <id>
			tex = tape_H_03
			Pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			z = 19
		}
		displaySprite \{parent = cheats_container
			tex = tape_H_04
			Pos = (930.0, 380.0)
			rot_angle = -120
			Scale = 0.5
			z = 20}
		displaySprite {
			parent = <id>
			tex = tape_H_04
			Pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			z = 19
		}
		CreateScreenElement \{Type = ContainerElement
			id = cheats_warning_container
			parent = root_window
			alpha = 0
			Scale = 0.5
			Pos = (640.0, 540.0)}
		displaySprite \{parent = cheats_warning_container
			id = cheats_warning
			tex = Control_pill_body
			Pos = (0.0, 0.0)
			just = [
				center
				center
			]
			rgba = [
				96
				0
				0
				255
			]
			z = 100}
		GetPlatform
		switch <Platform>
			case Xenon
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, achievement unlocking and leaderboard posts are turned off."
			case PS3
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, leaderboard posts are turned off."
			case PS2
			warning = "WARNING: Some active cheats do not work in career modes."
			warning_cont = ""
			default
			warning = "WARNING: Some active cheats do not work in career modes and online."
			warning_cont = "Also, leaderboard posts are turned off."
		endswitch
		formatText TextName = warning_text "%a %b" a = <warning> b = <warning_cont>
		CreateScreenElement {
			Type = TextBlockElement
			id = first_warning
			parent = cheats_warning_container
			font = text_a6
			Scale = 1
			text = <warning_text>
			rgba = [186 105 0 255]
			just = [center center]
			z_priority = 101.0
			Pos = (0.0, 0.0)
			dims = (1400.0, 100.0)
			allow_expansion
		}
		GetScreenElementDims \{id = first_warning}
		bg_dims = (<width> * (1.0, 0.0) + (<height> * (0.0, 1.0) + (0.0, 40.0)))
		cheats_warning :SetProps dims = <bg_dims>
		displaySprite {
			parent = cheats_warning_container
			tex = Control_pill_end
			Pos = (-1 * <width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			dims = ((64.0, 0.0) + (<height> * (0.0, 1.0) + (0.0, 40.0)))
			just = [right center]
			flip_v
			z = 100
		}
		displaySprite {
			parent = cheats_warning_container
			tex = Control_pill_end
			Pos = (<width> * (0.5, 0.0))
			rgba = [96 0 0 255]
			dims = ((64.0, 0.0) + (<height> * (0.0, 1.0) + (0.0, 40.0)))
			just = [left center]
			z = 100
		}
		cheats_create_guitar
	endif
	show_cheat_warning
	displaySprite \{parent = cheats_container
		id = cheats_hilite
		tex = white
		rgba = [
			150
			0
			50
			255
		]
		rot_angle = 1
		Pos = (349.0, 382.0)
		dims = (230.0, 20.0)
		z = 2}
	new_menu \{scrollid = cheats_scroll
		vmenuid = cheats_vmenu
		menu_pos = (360.0, 260.0)
		text_left
		spacing = -12
		rot_angle = 1}
	LaunchEvent \{Type = unfocus
		target = cheats_vmenu}
	text_params = {parent = cheats_vmenu Type = TextElement font = text_a3 rgba = [255 245 225 255] z_priority = 50 rot_angle = 0 Scale = 1}
	text_params2 = {parent = cheats_vmenu Type = TextElement font = text_a5 rgba = [255 245 225 255] z_priority = 50 rot_angle = 0 Scale = 0.63}
	hilite_pos = (349.0, 278.0)
	hilite_offset = (0.0, 19.0)
	GetGlobalTags \{user_options}
	<text> = "locked"
	if (<unlock_Cheat_NoFail> > 0)
		if ($Cheat_NoFail = 1)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [3].name_text)
		else
			if ($Cheat_NoFail < 0)
				Change \{Cheat_NoFail = 2}
			endif
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [3].name_text)
		endif
	endif
	CreateScreenElement {
		<text_params2>
		text = <text>
		id = Cheat_NoFail_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos>) id = Cheat_NoFail_Text}}
			{pad_choose toggle_cheat params = {cheat = Cheat_NoFail id = Cheat_NoFail_Text index = 3}}
		]
	}
	<text> = "locked"
	if (<unlock_Cheat_AirGuitar> > 0)
		if ($Cheat_AirGuitar = 1)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [0].name_text)
		else
			if ($Cheat_AirGuitar < 0)
				Change \{Cheat_AirGuitar = 2}
			endif
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [0].name_text)
		endif
	endif
	CreateScreenElement {
		<text_params2>
		text = <text>
		id = Cheat_AirGuitar_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos> + (<hilite_offset> * 1)) id = Cheat_AirGuitar_Text}}
			{pad_choose toggle_cheat params = {cheat = Cheat_AirGuitar id = Cheat_AirGuitar_Text index = 0}}
		]
	}
	<text> = "locked"
	if (<unlock_Cheat_Hyperspeed> > 0)
		if ($Cheat_Hyperspeed > 0)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [2].name_text)
			formatText TextName = text "%c, %d" c = <text> d = ($Cheat_Hyperspeed)
		else
			if ($Cheat_Hyperspeed < 0)
				Change \{Cheat_Hyperspeed = 0}
			endif
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [2].name_text)
		endif
	endif
	CreateScreenElement {
		<text_params2>
		text = <text>
		id = Cheat_Hyperspeed_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos> + (<hilite_offset> * 2)) id = Cheat_Hyperspeed_Text}}
			{pad_choose toggle_hyperspeed params = {cheat = Cheat_Hyperspeed id = Cheat_Hyperspeed_Text index = 2}}
		]
	}
	<text> = "locked"
	if (<unlock_Cheat_PerformanceMode> > 0)
		if ($Cheat_PerformanceMode = 1)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [1].name_text)
		else
			if ($Cheat_PerformanceMode < 0)
				Change \{Cheat_PerformanceMode = 2}
			endif
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [1].name_text)
		endif
	endif
	CreateScreenElement {
		<text_params2>
		text = <text>
		id = Cheat_PerformanceMode_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos> + (<hilite_offset> * 3)) id = Cheat_PerformanceMode_Text}}
			{pad_choose toggle_cheat params = {cheat = Cheat_PerformanceMode id = Cheat_PerformanceMode_Text index = 1}}
		]
	}
	<text> = "locked"
	if (<unlock_Cheat_PrecisionMode> > 0)
		if ($Cheat_PrecisionMode = 1)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [4].name_text)
		else
			if ($Cheat_PrecisionMode < 0)
				Change \{Cheat_PrecisionMode = 2}
			endif
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [4].name_text)
		endif
	endif
	CreateScreenElement {
		<text_params2>
		text = <text>
		id = Cheat_PrecisionMode_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos> + (<hilite_offset> * 4)) id = Cheat_PrecisionMode_Text}}
			{pad_choose toggle_cheat params = {cheat = Cheat_PrecisionMode id = Cheat_PrecisionMode_Text index = 4}}
		]
	}
	CreateScreenElement {
		<text_params>
		text = "enter cheat"
		id = Cheat_EnterCheat_Text
		event_handlers = [
			{focus cheats_morph_hilite params = {Pos = (<hilite_pos> + (<hilite_offset> * 5) + (0.0, 9.0)) id = Cheat_EnterCheat_Text}}
			{pad_choose enter_new_cheat}
		]
	}
	clean_up_user_control_helpers
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
	Change \{entering_cheat = 0}
	Change \{guitar_hero_cheats_completed = [
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	LaunchEvent \{Type = focus
		target = cheats_vmenu}
endscript

script show_cheat_warning 
	if (Cheat_NoFail = 1)
		DoScreenElementMorph \{id = cheats_warning_container
			alpha = 1
			time = 0.1}
	else
		DoScreenElementMorph \{id = cheats_warning_container
			alpha = 0
			time = 0.1}
	endif
endscript

script enter_new_cheat 
	disable_pause
	Change \{entering_cheat = 1}
	ui_flow_manager_respond_to_action \{action = enter_new_cheat}
endscript

script cheats_morph_hilite \{time = 0.025}
	GetScreenElementDims id = <id>
	cheats_hilite :SetProps dims = ((<width> * (1.0, 0.0)) + (22.0, 20.0))
	cheats_hilite :DoMorph Pos = <Pos> time = <time>
endscript
entering_cheat = 0

script destroy_cheats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = cheats_scroll}
	if ScreenElementExists \{id = cheats_hilite}
		DestroyScreenElement \{id = cheats_hilite}
	endif
	if ($entering_cheat = 0)
		KillSpawnedScript \{Name = cheats_watch_buttons}
		if ScreenElementExists \{id = cheats_container}
			DestroyScreenElement \{id = cheats_container}
		endif
		if ScreenElementExists \{id = cheats_warning_container}
			DestroyScreenElement \{id = cheats_warning_container}
		endif
		cheats_destroy_pressed_notes
	endif
endscript

script cheats_create_guitar 
	CreateScreenElement \{parent = cheats_container
		Type = SpriteElement
		id = guitar_sprite
		just = [
			left
			center
		]
		texture = training_guitar
		Pos = (1200.0, 545.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		Scale = (1.0, 1.0)
		z_priority = 2}
endscript

script cheats_create_pressed_notes 
	if NOT ScreenElementExists \{id = cheats_container}
		return
	endif
	x_offset = 67
	green_pos = (506.0, 543.0)
	red_pos = (<green_pos> + ((1.0, 0.0) * <x_offset>))
	yellow_pos = (<red_pos> + ((1.0, 0.0) * <x_offset>))
	blue_pos = (<yellow_pos> + ((1.0, 0.0) * <x_offset>))
	orange_pos = (<blue_pos> + ((1.0, 0.0) * <x_offset>))
	CreateScreenElement {
		parent = cheats_container
		Type = SpriteElement
		id = green_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		Pos = <green_pos>
		rot_angle = 0
		rgba = [0 165 130 255]
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	CreateScreenElement {
		parent = cheats_container
		Type = SpriteElement
		id = red_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		Pos = <red_pos>
		rot_angle = 0
		rgba = [230 80 90 255]
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	CreateScreenElement {
		parent = cheats_container
		Type = SpriteElement
		id = yellow_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		Pos = <yellow_pos>
		rot_angle = 0
		rgba = [220 160 25 255]
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	CreateScreenElement {
		parent = cheats_container
		Type = SpriteElement
		id = blue_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		Pos = <blue_pos>
		rot_angle = 0
		rgba = [0 135 210 255]
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	CreateScreenElement {
		parent = cheats_container
		Type = SpriteElement
		id = orange_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		Pos = <orange_pos>
		rot_angle = 0
		rgba = [215 120 40 255]
		Scale = (0.36, 0.36)
		z_priority = 3
	}
	hide_pressed_notes
endscript

script cheats_destroy_pressed_notes 
	safe_destroy \{id = green_pressed_sprite}
	safe_destroy \{id = red_pressed_sprite}
	safe_destroy \{id = yellow_pressed_sprite}
	safe_destroy \{id = orange_pressed_sprite}
	safe_destroy \{id = blue_pressed_sprite}
endscript

script cheats_watch_buttons 
	cheats_create_pressed_notes
	begin
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	hide_pressed_notes
	check_button = 65536
	array_count = 0
	begin
	if (<hold_pattern> && <check_button>)
		show_pressed_note note = <array_count>
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat 5
	Wait \{1
		gameframe}
	repeat
endscript

script cheats_zoomin_guitar 
	DoScreenElementMorph \{id = cheats_warning_container
		alpha = 0
		time = 1}
	event_handlers = [
		{pad_up create_cheat_guitar_strum}
		{pad_down create_cheat_guitar_strum}
		{pad_start ui_flow_manager_respond_to_action params = {action = new_cheat_finished}}
	]
	new_menu {
		scrollid = menu_new_cheat
		vmenuid = vmenu_new_cheat
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{Type = unfocus
		target = vmenu_new_cheat}
	menu_music_off
	SetMenuAutoRepeatTimes \{(60.0, 60.0)}
	clean_up_user_control_helpers
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
	add_user_control_helper \{text = "FINISH ENTERING CHEAT"
		button = start
		z = 100
		fit_to_rectangle = 0}
	add_user_control_helper \{text = "UP/DOWN TO STRUM"
		button = strumbar
		z = 100
		fit_to_rectangle = 0}
	SpawnScriptNow \{cheats_do_guitar_morphs}
	Wait \{1.25
		Seconds}
	SpawnScriptNow \{cheats_watch_buttons}
	if ScreenElementExists \{id = vmenu_new_cheat}
		LaunchEvent \{Type = focus
			target = vmenu_new_cheat}
	endif
endscript

script cheats_do_guitar_morphs 
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :DoMorph \{Scale = (1.0, 1.0)
			Pos = (140.0, 545.0)
			time = 0.75
			motion = ease_in}
		guitar_sprite :DoMorph \{Pos = (150.0, 545.0)
			time = 0.2
			motion = ease_out}
		guitar_sprite :DoMorph \{Pos = (140.0, 545.0)
			time = 0.2
			motion = ease_in}
	endif
	return
endscript

script cheats_zoomout_guitar 
	cheats_destroy_pressed_notes
	if ScreenElementExists \{id = guitar_sprite}
		guitar_sprite :DoMorph \{Pos = (150.0, 545.0)
			time = 0.2
			motion = ease_out}
		guitar_sprite :DoMorph \{Pos = (140.0, 545.0)
			time = 0.2
			motion = ease_in}
		guitar_sprite :DoMorph \{Scale = (1.0, 1.0)
			Pos = (1400.0, 545.0)
			time = 0.5
			motion = ease_in}
	endif
	SpawnScriptNow \{menu_music_on}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	KillSpawnedScript \{Name = cheats_watch_buttons}
	if ScreenElementExists \{id = awardtext}
		DestroyScreenElement \{id = awardtext}
	endif
	KillSpawnedScript \{Name = cheat_award_text}
	destroy_menu \{menu_id = menu_new_cheat}
	Change \{entering_cheat = 0}
	destroy_cheats_menu
endscript
new_cheat_strum = 0

script stop_guitar_strum 
	Change \{new_cheat_strum = 0}
	begin
	if ($new_cheat_strum = 1)
		StopSoundEvent <event>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_cheat_guitar_strum 
	Change \{new_cheat_strum = 1}
	Wait \{2
		gameframes}
	GetHeldPattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	switch <hold_pattern>
		case 65536
		SoundEvent \{event = Cheat_Single_Strum_Note_1}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Single_Strum_Note_1 pattern_to_stop = <hold_pattern>}
		case 4096
		SoundEvent \{event = Cheat_Single_Strum_Note_2}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Single_Strum_Note_2 pattern_to_stop = <hold_pattern>}
		case 256
		SoundEvent \{event = Cheat_Single_Strum_Note_3}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Single_Strum_Note_3 pattern_to_stop = <hold_pattern>}
		case 16
		SoundEvent \{event = Cheat_Single_Strum_Note_4}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Single_Strum_Note_4 pattern_to_stop = <hold_pattern>}
		case 1
		SoundEvent \{event = Cheat_Single_Strum_Note_5}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Single_Strum_Note_5 pattern_to_stop = <hold_pattern>}
		case 69632
		SoundEvent \{event = Cheat_Chord_Strum_1}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_1 pattern_to_stop = <hold_pattern>}
		case 65792
		SoundEvent \{event = Cheat_Chord_Strum_10}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_10 pattern_to_stop = <hold_pattern>}
		case 65552
		SoundEvent \{event = Cheat_Chord_Strum_4}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_4 pattern_to_stop = <hold_pattern>}
		case 4352
		SoundEvent \{event = Cheat_Chord_Strum_2}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_2 pattern_to_stop = <hold_pattern>}
		case 4112
		SoundEvent \{event = Cheat_Chord_Strum_3}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_3 pattern_to_stop = <hold_pattern>}
		case 4097
		SoundEvent \{event = Cheat_Chord_Strum_6}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_6 pattern_to_stop = <hold_pattern>}
		case 272
		SoundEvent \{event = Cheat_Chord_Strum_5}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_5 pattern_to_stop = <hold_pattern>}
		case 257
		SoundEvent \{event = Cheat_Chord_Strum_7}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_7 pattern_to_stop = <hold_pattern>}
		case 17
		SoundEvent \{event = Cheat_Chord_Strum_8}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_8 pattern_to_stop = <hold_pattern>}
		case 69888
		SoundEvent \{event = Cheat_Chord_Strum_9}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_9 pattern_to_stop = <hold_pattern>}
		case 4368
		SoundEvent \{event = Cheat_Chord_Strum_11}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_11 pattern_to_stop = <hold_pattern>}
		case 273
		SoundEvent \{event = Cheat_Chord_Strum_12}
		SpawnScriptNow stop_guitar_strum params = {event = Cheat_Chord_Strum_12 pattern_to_stop = <hold_pattern>}
		default
	endswitch
	GetArraySize \{$guitar_hero_cheats}
	num_of_cheats = <array_Size>
	<index> = 0
	begin
	pattern_array = ($guitar_hero_cheats [<index>].unlock_pattern)
	completed_index = ($guitar_hero_cheats_completed [<index>])
	if (<hold_pattern> = (<pattern_array> [<completed_index>]))
		printf channel = trchen "MATCH CHEAT: %s, STEP: %l" s = <index> l = <completed_index>
		SetArrayElement ArrayName = guitar_hero_cheats_completed globalarray index = <index> NewValue = (<completed_index> + 1)
		GetArraySize \{pattern_array}
		if (<array_Size> = ($guitar_hero_cheats_completed [<index>]))
			printf channel = trchen "CHEAT %s UNLOCKED!" s = <index>
			unlock_cheat cheat = ($guitar_hero_cheats [<index>].var) index = <index>
			SetArrayElement ArrayName = guitar_hero_cheats_completed globalarray index = <index> NewValue = 0
		endif
	else
		if (<hold_pattern> = (<pattern_array> [0]))
			printf channel = trchen "MATCH CHEAT: %s, STEP: 0" s = <index>
			SetArrayElement ArrayName = guitar_hero_cheats_completed globalarray index = <index> NewValue = 1
		else
			SetArrayElement ArrayName = guitar_hero_cheats_completed globalarray index = <index> NewValue = 0
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_of_cheats>
endscript

script cheat_award_text \{show_unlock = 1}
	if ScreenElementExists \{id = awardtext}
		DestroyScreenElement \{id = awardtext}
	endif
	award_text = ($guitar_hero_cheats [<index>].name_text)
	CreateScreenElement {
		Type = TextElement
		id = awardtext
		parent = cheats_container
		Pos = (360.0, 360.0)
		text = <award_text>
		font = text_a3
		rot_angle = 1
		Scale = 1
		rgba = [255 255 255 255]
		just = [left center]
		z_priority = 25
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((550.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	if (<show_unlock> = 1)
		CreateScreenElement \{Type = TextElement
			id = awardtext_sub
			parent = awardtext
			Pos = (1.0, 57.0)
			text = "unlocked"
			font = text_a3
			Scale = 0.7
			rgba = [
				255
				255
				255
				255
			]
			just = [
				left
				center
			]
			z_priority = 25}
	endif
	if ScreenElementExists \{id = cheats_menu_title}
		cheats_menu_title :DoMorph \{alpha = 0
			time = 0.2}
	endif
	do_extra_exploding_particles \{z_priority = 80
		Pos = (300.0, 150.0)
		parent = awardtext}
	begin
	awardtext :DoMorph \{alpha = 1.0
		time = 0.2
		motion = ease_out}
	awardtext :DoMorph \{alpha = 0.3
		time = 0}
	repeat 16
	DoScreenElementMorph \{id = awardtext
		alpha = 0
		time = 1}
	if ScreenElementExists \{id = cheats_menu_title}
		cheats_menu_title :DoMorph \{alpha = 1
			time = 0.5}
	endif
endscript

script unlock_cheat 
	if (<cheat> = Cheat_UnlockAll)
		GlobalTags_UnlockAll \{SongList = GH3_General_Songs
			songs_only = 1}
		GlobalTags_UnlockAll \{SongList = GH3_Bonus_Songs
			songs_only = 1}
		GetArraySize ($GH3_Bonus_Songs.tier1.songs)
		i = 0
		begin
		if NOT (<i> = 9)
			SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [<i>]) params = {unlocked = 1}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		SpawnScriptNow cheat_award_text params = {index = <index> show_unlock = 0}
		return
	endif
	if (<cheat> = Cheat_PrecisionMode)
		Change \{check_time_early = $original_check_time_early}
		Change \{check_time_late = $original_check_time_late}
	endif
	if NOT (<cheat> > 0)
		SoundEvent \{event = Crowd_OneShots_Cheer_Close}
		Change GlobalName = <cheat> NewValue = 2
		updateUnlockedCheats
		SpawnScriptNow cheat_award_text params = {index = <index>}
	endif
endscript

script updateUnlockedCheats 
	if ($Cheat_AirGuitar > 0)
		SetGlobalTags \{user_options
			params = {
				unlock_Cheat_AirGuitar = 1
			}}
	endif
	if ($Cheat_PerformanceMode > 0)
		SetGlobalTags \{user_options
			params = {
				unlock_Cheat_PerformanceMode = 1
			}}
	endif
	if ($Cheat_Hyperspeed > 0)
		SetGlobalTags \{user_options
			params = {
				unlock_Cheat_Hyperspeed = 1
			}}
	endif
	if ($Cheat_NoFail > 0)
		SetGlobalTags \{user_options
			params = {
				unlock_Cheat_NoFail = 1
			}}
	endif
	if ($Cheat_PrecisionMode > 0)
		SetGlobalTags \{user_options
			params = {
				unlock_Cheat_PrecisionMode = 1
			}}
	endif
endscript
original_check_time_early = 0.116
original_check_time_late = 0.1

script toggle_hyperspeed 
	if ($<cheat> >= 0)
		if ($<cheat> = 5)
			Change GlobalName = <cheat> NewValue = 0
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [<index>].name_text)
			SetScreenElementProps id = <id> text = <text>
			SoundEvent \{event = Generic_Menu_Back_SFX}
		else
			Change GlobalName = <cheat> NewValue = ($<cheat> + 1)
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [<index>].name_text)
			formatText TextName = text "%c, %d" c = <text> d = ($Cheat_Hyperspeed)
			SetScreenElementProps id = <id> text = <text>
			SoundEvent \{event = ui_sfx_select}
		endif
	endif
	cheats_morph_hilite id = <id>
endscript

script toggle_cheat 
	if ($<cheat> > 0)
		if ($<cheat> = 1)
			Change GlobalName = <cheat> NewValue = 2
			formatText TextName = text "%c : off" c = ($guitar_hero_cheats [<index>].name_text)
			SetScreenElementProps id = <id> text = <text>
			SoundEvent \{event = Generic_Menu_Back_SFX}
			if ($Cheat_PrecisionMode = 2)
				Change \{check_time_early = $original_check_time_early}
				Change \{check_time_late = $original_check_time_late}
			endif
		else
			Change GlobalName = <cheat> NewValue = 1
			formatText TextName = text "%c : on" c = ($guitar_hero_cheats [<index>].name_text)
			turnOn_cheat = ($guitar_hero_cheats [<index>].Name)
			SetScreenElementProps id = <id> text = <text>
			SoundEvent \{event = ui_sfx_select}
			if (<turnOn_cheat> = PrecisionMode)
				Change check_time_early = ($original_check_time_early / 2)
				Change check_time_late = ($original_check_time_late / 2)
			endif
		endif
	else
		SetScreenElementProps id = <id> text = "locked"
	endif
	show_cheat_warning
endscript
