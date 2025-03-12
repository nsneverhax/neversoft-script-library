
script ui_create_select_training 
	spawnscriptnow \{menu_music_on
		params = {
			unpause
		}}
	change \{respond_to_signin_changed = 1}
	createscreenelement \{type = descinterface
		parent = root_window
		id = selecttraininginterface
		desc = 'menu_quickplay'
		highlight_1_container_alpha = 0
		highlight_2_container_alpha = 0
		mainmenu_helper_text_text = qs(0xea7ecad0)}
	if selecttraininginterface :desc_resolvealias \{name = alias_genie_cat
			param = genie_cat_id}
		<genie_cat_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	if selecttraininginterface :desc_resolvealias \{name = alias_genie_cat_add
			param = genie_cat_add_id}
		<genie_cat_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'pdetrich'}
	endif
	create_2d_spring_system \{desc_id = selecttraininginterface
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	selecttraininginterface :desc_resolvealias \{name = alias_menu}
	assignalias id = <resolved_id> alias = current_menu
	<resolved_id> :se_setprops {
		event_handlers = [
			{pad_back training_choose_back}
		]
		exclusive_device = ($primary_controller)
	}
	selecttraininginterface :desc_resolvealias \{name = alias_item01}
	<resolved_id> :se_setprops {
		text = qs(0x3ea7dec9)
		event_handlers = [
			{focus select_training_focus params = {idx = 0}}
			{unfocus select_training_unfocus params = {idx = 0}}
			{pad_choose training_choose_practice}
		]
		exclusive_device = ($primary_controller)
		rgba = ($menu_unfocus_color)
	}
	selecttraininginterface :desc_resolvealias \{name = alias_item02}
	<resolved_id> :se_setprops {
		text = qs(0xc6510dd1)
		event_handlers = [
			{focus select_training_focus params = {idx = 1}}
			{unfocus select_training_unfocus params = {idx = 1}}
			{pad_choose training_choose_tutorials}
		]
		exclusive_device = ($primary_controller)
		rgba = ($menu_unfocus_color)
	}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	launchevent \{type = focus
		target = current_menu}
	startrendering
	spawnscriptnow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript

script ui_init_select_training 
endscript

script ui_deinit_select_training 
endscript

script ui_destroy_select_training 
	clean_up_user_control_helpers
	if screenelementexists \{id = selecttraininginterface}
		destroyscreenelement \{id = selecttraininginterface}
	endif
endscript

script select_training_focus \{time = 0.05
		grow_scale = 1.1}
	if screenelementexists \{id = selecttraininginterface}
		selecttraininginterface :gettags
		if NOT gotparam \{old_idx}
			<old_idx> = 3
		endif
		if NOT (<idx> = <old_idx>)
			generic_menu_up_or_down_sound
			selecttraininginterface :settags old_idx = <idx>
		endif
	endif
	if (<idx> = 0)
		selecttraininginterface :se_setprops \{highlight_1_container_alpha = 1}
	else
		selecttraininginterface :se_setprops \{highlight_2_container_alpha = 1}
	endif
	se_setprops {
		rgba = [255 255 255 255]
		scale = <grow_scale>
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
		scale = 1.0
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
				if isxenon
					body_text = qs(0x1f6a0a99)
				else
					body_text = qs(0x9ca8a7fc)
				endif
				generic_event_choose state = uistate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <body_text>}
				return
			endif
		endif
	endif
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
	change \{came_to_practice_from = main_menu}
	change \{game_mode = practice}
	menu_music_off
	printf \{channel = sfx
		qs(0x0841284e)}
	setplayerinfo \{1
		in_game = 1}
	songlist_force_num_songs_to_choose \{num_songs = 1}
	songlist_clear
	songlist_clear_filterspec
	restore_user_options_to_playerinfo device_num = <device_num>
	generic_event_choose state = uistate_songlist data = {device_num = <device_num> no_jamsession mode = practice}
endscript

script training_choose_tutorials 
	generic_event_choose \{state = uistate_tutorial_menu}
endscript

script training_choose_back 
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
		if (<user_option> != none)
			setplayerinfo 1 mic_preference = <user_option>
		endif
		get_progression_instrument_user_option controller = <device_num> part = vocals option = 'highway_view'
		if (<user_option> != none)
			setplayerinfo 1 vocals_highway_view = <user_option>
		endif
		get_progression_instrument_user_option part = drum controller = <device_num> option = 'hyperspeed'
		if (<user_option> != -1)
			setplayerinfo 1 cheat_hyperspeed_value = <user_option>
		endif
	endif
	load_saved_extras_states_for_player player = 1 controller = <device_num> leader = 1 dont_reset_cheats
endscript
