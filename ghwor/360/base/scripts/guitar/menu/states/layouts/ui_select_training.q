
script ui_create_select_training 
	SpawnScriptNow \{audio_ui_menu_music_on
		params = {
			Unpause
		}}
	Change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement {
		parent = root_window
		id = training_menu_id
		Type = descinterface
		desc = 'mainmenu'
		exclusive_device = ($primary_controller)
		tags = {
		}
		event_handlers = [
			{pad_back training_choose_back}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xd093953b)
	}
	attempt_to_add_friend_feed \{parent_id = training_menu_id
		menu = main_generic}
	if training_menu_id :desc_resolvealias \{Name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
	if training_menu_id :desc_resolvealias \{Name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			Hide
		}
	endif
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
	mainmenu_setup_option \{choose_script = training_choose_tutorials
		back_script = training_choose_back
		menu_item_text = qs(0xc6510dd1)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = training_choose_practice
		back_script = training_choose_back
		menu_item_text = qs(0x3ea7dec9)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_script = training_choose_help
		back_script = training_choose_back
		menu_item_text = qs(0xa4c1fd9a)
		screen_id = training_menu_id
		helper_text = qs(0x03ac90f0)}
	main_menu_finalize
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	StartRendering
	play_cameracut \{prefix = 'cameras_no_band'}
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

script ui_deinit_select_training 
	reset_practice_mode
	shut_down_practice_mode
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
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	mainmenu_animate \{id = training_menu_id
		block_events = 1}
	net_counter_increment \{counter_name = globalcounter_practice}
	get_controller_type controller_index = <device_num>
	if (<controller_type> = controller)
		vocals_getavailablemics
		if (<available_mics> = 0)
			if NOT controller_has_headset controller = <device_num>
				if isXenon
					band_lobby_get_is_guest device_num = <device_num>
					if (<is_guest> = 0)
						<body_text> = qs(0x1f6a0a99)
					else
						<body_text> = qs(0x819ee37f)
					endif
				else
					<body_text> = qs(0x819ee37f)
				endif
				ui_sfx \{menustate = Generic
					uitype = select}
				destroy_friend_feed
				generic_event_choose state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <body_text>}
				return
			endif
		endif
	endif
	if (<controller_type> = guitar)
		setplayerinfo \{1
			part = guitar}
		setplayerinfo \{1
			stored_part = guitar}
	elseif (<controller_type> = drum)
		setplayerinfo \{1
			part = drum}
		setplayerinfo \{1
			stored_part = drum}
	else
		setplayerinfo \{1
			part = vocals}
		setplayerinfo \{1
			stored_part = vocals}
	endif
	setplayerinfo 1 controller = <device_num>
	Hide_Band
	hide_crowd_models
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
	<dc> = ($disable_crowd)
	Change \{disable_crowd = 0}
	ensure_current_venue_is_loaded
	Change disable_crowd = <dc>
	restore_user_options_to_playerinfo device_num = <device_num>
	pushdisablerendering \{context = going_into_songlist
		Type = unchecked}
	generic_event_choose state = uistate_songlist data = {device_num = <device_num> no_jamsession mode = practice}
endscript

script training_choose_tutorials 
	ui_sfx \{menustate = Generic
		uitype = select}
	destroy_friend_feed
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
	if ui_event_exists_in_stack \{Name = 'mainmenu_play'}
		generic_event_back \{state = uistate_mainmenu_play}
	else
		ui_event \{event = menu_replace
			data = {
				state = uistate_mainmenu_play
				focus_training = 1
			}}
	endif
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
	mainmenu_animate \{id = training_menu_id}
endscript

script ui_select_training_anim_out 
	mainmenu_animate \{id = training_menu_id}
endscript
