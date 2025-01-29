guitar_hero_cheats = [
	{
		name = airguitar
		name_text = "air guitar"
		var = cheat_airguitar
		unlock_pattern = [
			65536
			4096
			256
			16
			1
			16
			256
			4096
			65536
		]
	}
	{
		name = performancemode
		name_text = "performance mode"
		var = cheat_performancemode
		unlock_pattern = [
			1
			256
			16
			16
			256
			1
			16
			16
		]
	}
	{
		name = hyperspeed
		name_text = "hyperspeed"
		var = cheat_hyperspeed
		unlock_pattern = [
			16
			1
			256
			1
			16
			1
			256
			256
		]
	}
	{
		name = unlock
		all
		name_text = "unlocked all songs"
		var = cheat_unlockall
		unlock_pattern = [
			16
			256
			1
			4096
			256
			1
			16
			256
			16
			256
			16
			256
			16
			256
			16
			256
		]
	}
]
guitar_hero_cheats_completed = [
	0
	0
	0
	0
]

script clear_cheats 
	change \{cheat_airguitar = -1}
	change \{cheat_performancemode = -1}
endscript

script create_cheats_menu 
	if ($entering_cheat = 0)
		createscreenelement {
			type = containerelement
			id = cheats_container
			parent = root_window
			pos = (0.0, 0.0)
		}
		create_menu_backdrop texture = venue_bg
		displaysprite parent = cheats_container tex = options_video_poster rot_angle = 1 pos = (640.0, 240.0) dims = (820.0, 410.0) just = [center center] z = 1 font = $video_settings_menu_font
		displaytext {
			parent = cheats_container
			pos = (910.0, 402.0)
			just = [right center]
			text = "CHEATS"
			scale = 1.5
			rgba = [240 235 240 255]
			font = text_a5
			noshadow
		}
		displaysprite {
			parent = cheats_container
			tex = tape_h_03
			pos = (270.0, 185.0)
			rot_angle = -50
			scale = 0.5
			z = 20
		}
		displaysprite {
			parent = <id>
			tex = tape_h_03
			pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			z = 19
		}
		displaysprite {
			parent = cheats_container
			tex = tape_h_04
			pos = (930.0, 380.0)
			rot_angle = -120
			scale = 0.5
			z = 20
		}
		displaysprite {
			parent = <id>
			tex = tape_h_04
			pos = (5.0, 5.0)
			rgba = [0 0 0 128]
			z = 19
		}
		cheats_create_guitar
	endif
	displaysprite parent = cheats_container id = cheats_hilite tex = white rgba = [40 60 110 255] rot_angle = 1 pos = (346.0, 382.0) dims = (230.0, 35.0) z = 2
	new_menu scrollid = cheats_scroll vmenuid = cheats_vmenu menu_pos = (360.0, 250.0) text_left spacing = -12 rot_angle = 1
	text_params = {parent = cheats_vmenu type = textelement font = text_a3 rgba = [255 245 225 255] z_priority = 50 rot_angle = 1 scale = 1}
	text_params2 = {parent = cheats_vmenu type = textelement font = text_a5 rgba = [255 245 225 255] z_priority = 50 rot_angle = 1 scale = 0.7}
	<text> = "locked"
	if ($cheat_airguitar > 0)
		if ($cheat_airguitar = 1)
			formattext textname = text "%c : ON" c = ($guitar_hero_cheats [0].name_text)
		else
			formattext textname = text "%c : OFF" c = ($guitar_hero_cheats [0].name_text)
		endif
	endif
	createscreenelement {
		<text_params2>
		text = <text>
		id = cheat_airguitar_text
		event_handlers = [
			{focus cheats_morph_hilite params = {pos = (346.0, 267.0)}}
			{pad_choose toggle_cheat params = {cheat = cheat_airguitar id = cheat_airguitar_text index = 0}}
		]
	}
	<text> = "locked"
	if ($cheat_performancemode > 0)
		if ($cheat_performancemode = 1)
			formattext textname = text "%c : ON" c = ($guitar_hero_cheats [1].name_text)
		else
			formattext textname = text "%c : OFF" c = ($guitar_hero_cheats [1].name_text)
		endif
	endif
	createscreenelement {
		<text_params2>
		text = <text>
		id = cheat_performancemode_text
		event_handlers = [
			{focus cheats_morph_hilite params = {pos = (346.0, 295.0)}}
			{pad_choose toggle_cheat params = {cheat = cheat_performancemode id = cheat_performancemode_text index = 1}}
		]
	}
	<text> = "locked"
	if ($cheat_hyperspeed > 0)
		if ($cheat_hyperspeed = 1)
			formattext textname = text "%c : ON" c = ($guitar_hero_cheats [2].name_text)
		else
			formattext textname = text "%c : OFF" c = ($guitar_hero_cheats [2].name_text)
		endif
	endif
	createscreenelement {
		<text_params2>
		text = <text>
		id = cheat_hyperspeed_text
		event_handlers = [
			{focus cheats_morph_hilite params = {pos = (346.0, 320.0)}}
			{pad_choose toggle_cheat params = {cheat = cheat_hyperspeed id = cheat_hyperspeed_text index = 2}}
		]
	}
	createscreenelement {
		<text_params2>
		text = "locked"
		event_handlers = [
			{focus cheats_morph_hilite params = {pos = (346.0, 347.0)}}
		]
	}
	createscreenelement {
		<text_params>
		text = "enter cheat"
		event_handlers = [
			{focus cheats_morph_hilite params = {pos = (346.0, 382.0)}}
			{pad_choose enter_new_cheat}
		]
	}
	clean_up_user_control_helpers
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	change entering_cheat = 0
endscript

script enter_new_cheat 
	disable_pause
	change \{entering_cheat = 1}
	ui_flow_manager_respond_to_action \{action = enter_new_cheat}
endscript

script cheats_morph_hilite \{time = 0.025}
	cheats_hilite :domorph pos = <pos> time = <time>
endscript
entering_cheat = 0

script destroy_cheats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = cheats_scroll}
	if screenelementexists \{id = cheats_hilite}
		destroyscreenelement \{id = cheats_hilite}
	endif
	if ($entering_cheat = 0)
		killspawnedscript \{name = cheats_watch_buttons}
		if screenelementexists \{id = cheats_container}
			destroyscreenelement \{id = cheats_container}
		endif
		cheats_destroy_pressed_notes
	endif
endscript

script cheats_create_guitar 
	createscreenelement \{parent = cheats_container
		type = spriteelement
		id = guitar_sprite
		just = [
			left
			center
		]
		texture = training_guitar
		pos = (1200.0, 545.0)
		rot_angle = 0
		rgba = [
			255
			255
			255
			255
		]
		scale = (1.0, 1.0)
		z_priority = 2}
endscript

script cheats_create_pressed_notes 
	x_offset = 67
	green_pos = (506.0, 543.0)
	red_pos = (<green_pos> + ((1.0, 0.0) * <x_offset>))
	yellow_pos = (<red_pos> + ((1.0, 0.0) * <x_offset>))
	blue_pos = (<yellow_pos> + ((1.0, 0.0) * <x_offset>))
	orange_pos = (<blue_pos> + ((1.0, 0.0) * <x_offset>))
	createscreenelement {
		parent = cheats_container
		type = spriteelement
		id = green_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		pos = <green_pos>
		rot_angle = 0
		rgba = [0 165 130 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createscreenelement {
		parent = cheats_container
		type = spriteelement
		id = red_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		pos = <red_pos>
		rot_angle = 0
		rgba = [230 80 90 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createscreenelement {
		parent = cheats_container
		type = spriteelement
		id = yellow_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		pos = <yellow_pos>
		rot_angle = 0
		rgba = [220 160 25 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createscreenelement {
		parent = cheats_container
		type = spriteelement
		id = blue_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		pos = <blue_pos>
		rot_angle = 0
		rgba = [0 135 210 255]
		scale = (0.36, 0.36)
		z_priority = 3
	}
	createscreenelement {
		parent = cheats_container
		type = spriteelement
		id = orange_pressed_sprite
		just = [center center]
		texture = training_guitar_button_down
		pos = <orange_pos>
		rot_angle = 0
		rgba = [215 120 40 255]
		scale = (0.36, 0.36)
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
	wait \{0.75
		seconds}
	cheats_create_pressed_notes
	begin
	getheldpattern controller = ($player1_status.controller) nobrokenstring
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
	wait \{1
		gameframe}
	repeat
endscript

script cheats_zoomin_guitar 
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
	menu_music_off
	setmenuautorepeattimes (60.0, 60.0)
	clean_up_user_control_helpers
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "PRESS START TO FINISH" button = start z = 100
	spawnscriptnow cheats_watch_buttons
	if screenelementexists id = guitar_sprite
		guitar_sprite :domorph scale = (1.0, 1.0) pos = (140.0, 545.0) time = 0.75
	endif
endscript

script cheats_zoomout_guitar 
	spawnscriptnow \{menu_music_on}
	setmenuautorepeattimes \{(0.3, 0.05)}
	killspawnedscript \{name = cheats_watch_buttons}
	cheats_destroy_pressed_notes
	if screenelementexists \{id = awardtext}
		destroyscreenelement \{id = awardtext}
	endif
	killspawnedscript \{name = cheat_award_text}
	destroy_menu \{menu_id = menu_new_cheat}
	if screenelementexists \{id = guitar_sprite}
		guitar_sprite :domorph \{scale = (1.0, 1.0)
			pos = (1200.0, 545.0)
			time = 0.75}
	endif
	enable_pause
endscript

script create_cheat_guitar_strum 
	getheldpattern controller = ($player1_status.controller) nobrokenstring
	check_button = 65536
	array_count = 0
	switch <hold_pattern>
		case 65536
		soundevent event = practice_mode_kick
		case 4096
		soundevent event = practice_mode_snare
		case 256
		soundevent event = practice_mode_hihatclosed
		case 16
		soundevent event = practice_mode_hihatopen
		case 1
		soundevent event = practice_mode_crash2
		default
	endswitch
	getarraysize $guitar_hero_cheats
	num_of_cheats = <array_size>
	<index> = 0
	begin
	pattern_array = ($guitar_hero_cheats [<index>].unlock_pattern)
	completed_index = ($guitar_hero_cheats_completed [<index>])
	if (<hold_pattern> = (<pattern_array> [<completed_index>]))
		printf channel = trchen "MATCH CHEAT: %s, STEP: %l" s = <index> l = <completed_index>
		setarrayelement arrayname = guitar_hero_cheats_completed globalarray index = <index> newvalue = (<completed_index> + 1)
		getarraysize pattern_array
		if (<array_size> = ($guitar_hero_cheats_completed [<index>]))
			printf channel = trchen "CHEAT %s UNLOCKED!" s = <index>
			unlock_cheat cheat = ($guitar_hero_cheats [<index>].var) index = <index>
			setarrayelement arrayname = guitar_hero_cheats_completed globalarray index = <index> newvalue = 0
		endif
	else
		if (<hold_pattern> = (<pattern_array> [0]))
			printf channel = trchen "MATCH CHEAT: %s, STEP: 0" s = <index>
			setarrayelement arrayname = guitar_hero_cheats_completed globalarray index = <index> newvalue = 1
		else
			setarrayelement arrayname = guitar_hero_cheats_completed globalarray index = <index> newvalue = 0
		endif
	endif
	<index> = (<index> + 1)
	repeat <num_of_cheats>
endscript

script cheat_award_text show_unlock = 1
	if screenelementexists id = awardtext
		destroyscreenelement id = awardtext
	endif
	award_text = ($guitar_hero_cheats [<index>].name_text)
	createscreenelement {
		type = textelement
		id = awardtext
		parent = cheats_container
		pos = (360.0, 366.0)
		text = <award_text>
		font = text_a3
		scale = 1.1
		rgba = [255 255 255 255]
		just = [left center]
		z_priority = 25
	}
	if (<show_unlock> = 1)
		createscreenelement {
			type = textelement
			id = awardtext_sub
			parent = awardtext
			pos = (1.0, 57.0)
			text = "unlocked"
			font = text_a3
			scale = 0.7
			rgba = [255 255 255 255]
			just = [left center]
			z_priority = 25
		}
	endif
	wait 1.5 seconds
	doscreenelementmorph {
		id = awardtext
		alpha = 0
		time = 1
	}
endscript

script unlock_cheat 
	if (<cheat> = cheat_unlockall)
		globaltags_unlockall songlist = gh3_general_songs songs_only = 1
		globaltags_unlockall songlist = gh3_generalp2_songs songs_only = 1
		globaltags_unlockall songlist = gh3_bonus_songs songs_only = 1
		soundevent event = crowd_oneshots_cheer_close
		spawnscriptnow cheat_award_text params = {index = <index> show_unlock = 0}
		return
	endif
	if NOT (<cheat> > 0)
		soundevent event = crowd_oneshots_cheer_close
		change globalname = <cheat> newvalue = 2
		spawnscriptnow cheat_award_text params = {index = <index>}
	endif
endscript

script toggle_cheat 
	if ($<cheat> > 0)
		if ($<cheat> = 1)
			change globalname = <cheat> newvalue = 2
			formattext textname = text "%c : OFF" c = ($guitar_hero_cheats [<index>].name_text)
			setscreenelementprops id = <id> text = <text>
		else
			change globalname = <cheat> newvalue = 1
			formattext textname = text "%c : ON" c = ($guitar_hero_cheats [<index>].name_text)
			setscreenelementprops id = <id> text = <text>
		endif
	else
		setscreenelementprops id = <id> text = "locked"
	endif
endscript
