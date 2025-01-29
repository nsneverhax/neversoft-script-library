
script ui_create_select_training 
	spawnscriptnow \{menu_music_on
		params = {
			UnPause
		}}
	Change \{respond_to_signin_changed = 1}
	CreateScreenElement \{type = DescInterface
		parent = root_window
		id = SelectTrainingInterface
		desc = 'menu_quickplay'
		highlight_1_container_alpha = 0
		highlight_2_container_alpha = 0
		mainmenu_helper_text_text = qs(0xea7ecad0)}
	if SelectTrainingInterface :Desc_ResolveAlias \{name = alias_grad_bar_overlay1
			param = bg_overlay1}
		<bg_overlay1> :SE_GetProps
		<bg_overlay1> :Obj_SpawnScript anim_1280_loop_L params = {time = 30.0 startpos = <grad_bar_overlay1_pos>}
	else
		ScriptAssert \{'UI_art'}
	endif
	SelectTrainingInterface :Desc_ResolveAlias \{name = alias_Menu}
	AssignAlias id = <resolved_id> alias = current_menu
	<resolved_id> :SE_SetProps {
		event_handlers = [
			{pad_back training_choose_back}
		]
		exclusive_device = ($primary_controller)
	}
	SelectTrainingInterface :Desc_ResolveAlias \{name = alias_item01}
	<resolved_id> :SE_SetProps {
		text = qs(0x3ea7dec9)
		event_handlers = [
			{focus select_training_focus params = {idx = 0}}
			{unfocus select_training_unfocus params = {idx = 0}}
			{pad_choose training_choose_practice}
		]
		exclusive_device = ($primary_controller)
		rgba = ($menu_unfocus_color)
	}
	SelectTrainingInterface :Desc_ResolveAlias \{name = alias_item02}
	<resolved_id> :SE_SetProps {
		text = qs(0xc6510dd1)
		font = fontgrid_text_A1
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
	current_menu :SE_SetProps \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]}
	LaunchEvent \{type = focus
		target = current_menu}
	StartRendering
	spawnscriptnow \{reset_mainmenu_camera}
	LightShow_NotInGamePlay_SetMood \{mood = Band_Lobby}
endscript

script ui_init_select_training 
endscript

script ui_deinit_select_training 
endscript

script ui_destroy_select_training 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = SelectTrainingInterface}
		DestroyScreenElement \{id = SelectTrainingInterface}
	endif
endscript

script select_training_focus \{time = 0.05
		grow_scale = 1.1}
	if ScreenElementExists \{id = SelectTrainingInterface}
		SelectTrainingInterface :GetTags
		if NOT GotParam \{old_idx}
			<old_idx> = 3
		endif
		if NOT (<idx> = <old_idx>)
			SelectTrainingInterface :SetTags old_idx = <idx>
		endif
	endif
	if (<idx> = 0)
		SelectTrainingInterface :SE_SetProps \{highlight_1_container_alpha = 1}
	else
		SelectTrainingInterface :SE_SetProps \{highlight_2_container_alpha = 1}
	endif
	SE_SetProps {
		rgba = [255 255 255 255]
		scale = <grow_scale>
		motion = ease_in
		time = <time>
		font = fontgrid_title_a1
	}
endscript

script select_training_unfocus \{time = 0.05}
	if (<idx> = 0)
		SelectTrainingInterface :SE_SetProps \{highlight_1_container_alpha = 0}
	else
		SelectTrainingInterface :SE_SetProps \{highlight_2_container_alpha = 0}
	endif
	SE_SetProps {
		rgba = ($menu_unfocus_color)
		font = fontgrid_text_A1
		scale = 1.0
		motion = ease_in
		time = <time>
	}
endscript

script training_choose_practice 
	get_controller_type controller_index = <device_num>
	if (<controller_type> = controller)
		Vocals_GetAvailableMics
		if (<available_mics> = 0)
			if NOT controller_has_headset controller = <device_num>
				if isXenon
					body_text = qs(0x1f6a0a99)
				else
					body_text = qs(0x819ee37f)
				endif
				generic_event_choose state = UIstate_generic_dialog_box data = {template = continue heading_text = qs(0xaa163738) body_text = <body_text>}
				return
			endif
		endif
	endif
	if (<controller_type> = guitar)
		SetPlayerInfo \{1
			part = guitar}
	elseif (<controller_type> = Drum)
		SetPlayerInfo \{1
			part = Drum}
	else
		SetPlayerInfo \{1
			part = vocals}
	endif
	Change \{came_to_practice_from = main_menu}
	Change \{game_mode = practice}
	Menu_Music_Off
	printf \{channel = sfx
		qs(0x0841284e)}
	SetPlayerInfo \{1
		in_game = 1}
	songlist_force_num_songs_to_choose \{num_songs = 1}
	songlist_clear
	songlist_clear_filterspec
	restore_user_options_to_playerinfo device_num = <device_num>
	generic_event_choose state = uistate_songlist data = {device_num = <device_num> no_jamsession mode = practice}
endscript

script training_choose_tutorials 
	generic_event_choose \{state = UIstate_tutorial_menu}
endscript

script training_choose_back 
	SetPlayerInfo \{1
		in_game = 0}
	songlist_dont_force_num_songs
	generic_event_back \{state = uistate_mainmenu}
endscript

script restore_user_options_to_playerinfo 
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar)
		get_progression_instrument_user_option part = guitar controller = <device_num> option = 'lefty_flip'
		if (<user_option> != -1)
			SetPlayerInfo 1 lefty_flip = <user_option>
		endif
	elseif (<controller_type> = Drum)
		get_progression_instrument_user_option part = Drum controller = <device_num> option = 'lefty_flip'
		if (<user_option> != -1)
			SetPlayerInfo 1 lefty_flip = <user_option>
		endif
		get_progression_instrument_user_option part = Drum controller = <device_num> option = 'hyperspeed'
		if (<user_option> != -1)
			SetPlayerInfo 1 Cheat_HyperSpeed_Value = <user_option>
		endif
	else
		get_progression_instrument_user_option controller = <device_num> part = vocals option = 'mic_preference'
		if (<user_option> != None)
			SetPlayerInfo 1 mic_preference = <user_option>
		endif
		get_progression_instrument_user_option controller = <device_num> part = vocals option = 'highway_view'
		if (<user_option> != None)
			SetPlayerInfo 1 vocals_highway_view = <user_option>
		endif
		get_progression_instrument_user_option part = Drum controller = <device_num> option = 'hyperspeed'
		if (<user_option> != -1)
			SetPlayerInfo 1 Cheat_HyperSpeed_Value = <user_option>
		endif
	endif
	load_saved_extras_states_for_player player = 1 controller = <device_num> leader = 1 dont_reset_cheats
endscript
