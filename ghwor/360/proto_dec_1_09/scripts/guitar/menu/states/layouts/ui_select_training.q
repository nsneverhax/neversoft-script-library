
script ui_create_select_training 
	SpawnScriptNow \{audio_ui_menu_music_on
		params = {
			Unpause
		}}
	Change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement \{parent = root_window
		id = training_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				training_choose_back
			}
		]}
	mainmenu_setup_physics_elements \{screen_id = training_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = training_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = training_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = training_menu_id
		}}
	mainmenu_setup_option \{choose_script = training_choose_practice
		back_script = training_choose_back
		menu_item_text = qs(0x3ea7dec9)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = training_choose_tutorials
		back_script = training_choose_back
		menu_item_text = qs(0xc6510dd1)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = training_choose_help
		back_script = training_choose_back
		menu_item_text = qs(0xc33aee71)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = current_menu}
	StartRendering
	SpawnScriptNow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
	reset_practice_mode
	shut_down_practice_mode
endscript

script ui_destroy_select_training 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = training_menu_id}
		DestroyScreenElement \{id = training_menu_id}
	endif
endscript

script ui_return_select_training 
	mainmenu_setup_physics_elements \{screen_id = training_menu_id}
endscript

script select_training_focus \{time = 0.05
		grow_scale = 1.1}
	if ScreenElementExists \{id = selecttraininginterface}
		selecttraininginterface :GetTags
		if NOT (<idx> = <old_idx>)
			ui_sfx \{menustate = Generic
				uitype = scrollup}
			selecttraininginterface :SetTags old_idx = <idx>
		endif
	endif
	if (<idx> = 0)
		selecttraininginterface :se_setprops \{highlight_1_container_alpha = 1}
	else
		selecttraininginterface :se_setprops \{highlight_2_container_alpha = 1}
	endif
	se_setprops {
		rgba = [255 255 255 255]
		Scale = <grow_scale>
		motion = ease_in
		time = <time>
	}
endscript

script select_training_unfocus \{time = 0.05}
	if (<idx> = 0)
		selecttraininginterface :se_setprops \{highlight_1_container_alpha = 0}
	else
		selecttraininginterface :se_setprops \{highlight_2_container_alpha = 0}
	endif
	se_setprops {
		rgba = ($menu_unfocus_color)
		Scale = 1.0
		motion = ease_in
		time = <time>
	}
endscript

script training_choose_practice 
	get_controller_type controller_index = <device_num>
	if (<controller_type> = controller)
		vocals_getavailablemics
		if (<available_mics> = 0)
			if NOT controller_has_headset controller = <device_num>
				if isXenon
					<body_text> = qs(0x1f6a0a99)
				else
					<body_text> = qs(0x819ee37f)
				endif
				ui_sfx \{menustate = Generic
					uitype = select}
				generic_event_choose state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <body_text>}
				return
			endif
		endif
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	if (<controller_type> = guitar)
		setplayerinfo \{1
			part = guitar}
	elseif (<controller_type> = drum)
		setplayerinfo \{1
			part = drum}
	else
		setplayerinfo \{1
			part = vocals}
	endif
	setup_practice_mode
	Change \{came_to_practice_from = main_menu}
	Change \{game_mode = practice}
	audio_ui_menu_music_off
	printf \{channel = sfx
		qs(0x0841284e)}
	setplayerinfo \{1
		in_game = 1}
	songlist_force_num_songs_to_choose \{num_songs = 1}
	songlist_clear
	songlist_clear_filterspec
	restore_user_options_to_playerinfo device_num = <device_num>
	generic_event_choose state = 0x0604ee76 data = {0x3002594a = {device_num = <device_num> no_jamsession mode = practice}}
endscript

script training_choose_tutorials 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_tutorial_menu}
endscript

script training_choose_help 
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose \{state = uistate_universal_help_index}
endscript

script training_choose_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	setplayerinfo \{1
		in_game = 0}
	songlist_dont_force_num_songs
	generic_event_back \{state = uistate_mainmenu}
endscript

script restore_user_options_to_playerinfo 
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar)
		get_progression_instrument_user_option part = guitar controller = <device_num> option = 'lefty_flip'
		if (<user_option> != -1)
			setplayerinfo 1 lefty_flip = <user_option>
		endif
	elseif (<controller_type> = drum)
		get_progression_instrument_user_option part = drum controller = <device_num> option = 'lefty_flip'
		if (<user_option> != -1)
			setplayerinfo 1 lefty_flip = <user_option>
		endif
		get_progression_instrument_user_option part = drum controller = <device_num> option = 'hyperspeed'
		if (<user_option> != -1)
			setplayerinfo 1 cheat_hyperspeed_value = <user_option>
		endif
	else
		get_progression_instrument_user_option controller = <device_num> part = vocals option = 'mic_preference'
		if (<user_option> != None)
			setplayerinfo 1 mic_preference = <user_option>
		endif
		get_progression_instrument_user_option controller = <device_num> part = vocals option = 'highway_view'
		if (<user_option> != None)
			setplayerinfo 1 vocals_highway_view = <user_option>
		endif
		get_progression_instrument_user_option part = drum controller = <device_num> option = 'hyperspeed'
		if (<user_option> != -1)
			setplayerinfo 1 cheat_hyperspeed_value = <user_option>
		endif
	endif
	load_saved_extras_states_for_player Player = 1 controller = <device_num> leader = 1 dont_reset_cheats
endscript

script ui_select_training_anim_in 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = training_menu_id}
		begin
		training_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops {
			chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = <Pos>
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01
		}
		training_menu_id :se_waitprops
		repeat 3
	endif
endscript

script ui_select_training_anim_out 
	printf \{channel = blah
		qs(0x0d1a424d)}
	if ScreenElementExists \{id = training_menu_id}
		begin
		training_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-315.0, 233.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.03, 1.03)
			bgrock_anim_pos = (-155.0, -178.0)
			axestone_anim_pos = (330.0, 72.0)
			ampzilla_anim_pos = (10.0, -169.0)
			mainmenu_anim_calcium_fulltop_pos = (79.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-305.0, 233.0)
			gor_anim_pos = (-260.0, -20.0)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (310.0, 82.0)
			ampzilla_anim_pos = (25.0, -180.0)
			mainmenu_anim_calcium_fulltop_pos = (90.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-315.0, 240.0)
			gor_anim_pos = (-272.0, -20.0)
			gor_anim_scale = (1.06, 1.06)
			bgrock_anim_pos = (-130.0, -180.0)
			axestone_anim_pos = (310.0, 92.0)
			ampzilla_anim_pos = (12.0, -170.0)
			mainmenu_anim_calcium_fulltop_pos = (78.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-309.0, 233.0)
			gor_anim_pos = (-255.0, -20.0)
			gor_anim_scale = (1.05, 1.05)
			bgrock_anim_pos = (-130.0, -195.0)
			axestone_anim_pos = (330.0, 75.0)
			ampzilla_anim_pos = (22.0, -160.0)
			mainmenu_anim_calcium_fulltop_pos = (85.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-313.0, 233.0)
			gor_anim_pos = (-271.0, -20.0)
			gor_anim_scale = (1.01, 1.01)
			bgrock_anim_pos = (-150.0, -178.0)
			axestone_anim_pos = (310.0, 90.0)
			ampzilla_anim_pos = (18.0, -179.0)
			mainmenu_anim_calcium_fulltop_pos = (93.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		training_menu_id :se_setprops \{chain_anim_pos = (-309.0, 210.0)
			gor_anim_pos = (-269.0, -20.0)
			gor_anim_scale = (1.0, 1.0)
			bgrock_anim_pos = (-130.0, -186.0)
			axestone_anim_pos = (317.0, 82.0)
			ampzilla_anim_pos = (18.0, -176.0)
			mainmenu_anim_calcium_fulltop_pos = (86.0, 100.0)
			time = 0.01}
		training_menu_id :se_waitprops
		repeat 1
	endif
endscript
