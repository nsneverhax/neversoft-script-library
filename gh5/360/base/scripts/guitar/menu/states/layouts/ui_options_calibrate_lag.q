calibrate_saved_video_offset = 0
calibrate_saved_audio_offset = 0

script ui_init_options_calibrate_lag 
endscript

script ui_deinit_options_calibrate_lag 
endscript

script ui_create_options_calibrate_lag \{from_in_game = 0}
endscript

script ui_destroy_options_calibrate_lag 
endscript

script ui_options_calibrate_cancel 
	SetGlobalTags user_options params = {lag_video_calibration = ($calibrate_saved_video_offset) lag_audio_calibration = ($calibrate_saved_audio_offset)}
	ui_calibrate_pausemenu_choose_quit
	idx = 0
	begin
	setplayerinfo (<idx> + 1) in_game = ($calibrate_prev_parts [<idx>].in_game)
	idx = (<idx> + 1)
	repeat 4
endscript

script ui_calibrate_option_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_menu_select_sfx
	switch (<idx>)
		case 0
		calibrate_highway_events_container :SetTags \{current_changing = video}
		Wait \{1
			gameframe}
		LaunchEvent \{Type = unfocus
			target = generic_barrel_vmenu}
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
		case 1
		calibrate_highway_events_container :SetTags \{current_changing = audio}
		LaunchEvent \{Type = unfocus
			target = generic_barrel_vmenu}
		LaunchEvent \{Type = focus
			target = calibrate_highway_events_container}
		case 2
		ui_calibrate_reset_change
		case 3
		Change \{calibrating_helper_text = qs(0x0dfed203)}
		jump_in_calibrate
		case 5
		LaunchEvent \{Type = unfocus
			target = generic_barrel_vmenu}
		get_lag_values
		SetGlobalTags user_options params = {lag_video_calibration = <video_offset> lag_audio_calibration = ($current_calibrate_audio_lag)}
		calibrate_highway_shutdown
		ui_calibrate_reset_practice_data
		if (<practice_enabled> = 1)
			if GotParam \{nosave}
				SpawnScriptLater \{practice_restart_song}
			else
				Change \{memcard_after_func = practice_restart_song}
			endif
			state = Uistate_gameplay
		else
			if ui_event_exists_in_stack \{Name = 'jam'}
				Change \{gameplay_restart_song = 1}
				state = Uistate_gameplay
			elseif ui_event_exists_in_stack \{Name = 'band_lobby'}
				Change \{gameplay_restart_song = 1}
				state = Uistate_gameplay
			elseif ui_event_exists_in_stack \{Name = 'select_training'}
				Change \{gameplay_restart_song = 1}
				state = Uistate_gameplay
			elseif ui_event_exists_in_stack \{Name = 'options'}
				state = uistate_options
			else
				state = uistate_mainmenu
			endif
		endif
		idx = 0
		begin
		setplayerinfo (<idx> + 1) in_game = ($calibrate_prev_parts [<idx>].in_game)
		idx = (<idx> + 1)
		repeat 4
		if GotParam \{nosave}
			generic_event_back state = <state>
		else
			ui_memcard_autosave event = menu_back state = <state>
		endif
		case 6
		ui_options_calibrate_cancel
	endswitch
endscript

script ui_calibrate_option_back 
	generic_menu_pad_back_sound
	LaunchEvent \{Type = unfocus
		target = calibrate_highway_events_container}
	LaunchEvent \{Type = unfocus
		target = generic_barrel_vmenu}
endscript

script jump_in_calibrate 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT GotParam \{for_testing}
		ui_calibrate_reset_change
	endif
	LaunchEvent \{Type = unfocus
		target = generic_barrel_vmenu}
	generic_barrel_vmenu :se_setprops \{alpha = 0
		time = 0.5}
	generic_barrel_menu :se_setprops \{highlight_btn_alpha = 0
		time = 0.5}
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_up_arrow}
		<resolved_id> :se_setprops alpha = 0 time = 0.5
	endif
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_down_arrow}
		<resolved_id> :se_setprops alpha = 0 time = 0.5
	endif
	generic_barrel_menu :se_waitprops
	generic_barrel_vmenu :se_waitprops
	Change \{disable_note_input = 0}
	SpawnScriptNow \{mock_highway_restart
		params = {
			fade_helpers = 1
		}}
endscript

script ui_calibrate_reset_change 
	formatText \{TextName = video_text
		qs(0x0f904228)
		d = 0}
	formatText \{TextName = audio_text
		qs(0x6172b8bf)
		d = 0}
	Change \{calibrate_highway_video_offset = 0}
	Change \{current_calibrate_audio_lag = 0}
	SetGlobalTags \{user_options
		params = {
			lag_video_calibration = 0
			lag_audio_calibration = 0
		}}
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
endscript

script ui_calibrate_lag_change 
	get_lag_values
	if GotParam \{up}
		change_val = -1
	elseif GotParam \{down}
		change_val = 1
	endif
	should_return = 0
	if (<current_changing> = video)
		video_offset = (<video_offset> + <change_val>)
		if (<video_offset> > 0)
			should_return = 1
		endif
		if (<video_offset> < -200)
			should_return = 1
		endif
	elseif (<current_changing> = audio)
		change_val = (<change_val> * -1)
		audio_offset = ($current_calibrate_audio_lag + <change_val>)
		if (<audio_offset> < 0)
			should_return = 1
		endif
		if (<audio_offset> > 200)
			should_return = 1
		endif
	endif
	if (<should_return> = 1)
		return
	endif
	if (<current_changing> = audio)
		Change current_calibrate_audio_lag = <audio_offset>
	endif
	generic_menu_up_or_down_sound
	formatText TextName = video_text qs(0x0f904228) d = (<video_offset> * -1)
	formatText TextName = audio_text qs(0x6172b8bf) d = ($current_calibrate_audio_lag)
	SetGlobalTags user_options params = {lag_video_calibration = <video_offset> lag_audio_calibration = ($current_calibrate_audio_lag)}
	calibrationinterface :se_setprops videolag_text = <video_text> audiolag_text = <audio_text>
endscript

script ui_calibrate_option_focus 
	GetTags
	if GotParam \{current_changing}
		if (<current_changing> = video)
			calibrationinterface :se_setprops \{videolag_rgba = [
					0
					75
					10
					255
				]}
		elseif (<current_changing> = audio)
			calibrationinterface :se_setprops \{audiolag_rgba = [
					0
					75
					10
					255
				]}
		endif
	endif
endscript

script ui_calibrate_option_unfocus 
	GetTags
	if GotParam \{current_changing}
		if (<current_changing> = video)
			calibrationinterface :se_setprops \{videolag_rgba = [
					100
					75
					10
					255
				]}
		elseif (<current_changing> = audio)
			calibrationinterface :se_setprops \{audiolag_rgba = [
					100
					75
					10
					255
				]}
		endif
	else
		Obj_GetID
		<objID> :se_setprops rgba = [70 70 70 255]
	endif
endscript
calibrate_saved_practice_info = [
	0
	0
	0
	0
]

script choose_calibrate_lag 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	reset_song_loading_hack_global
	gman_songtool_getcurrentsong
	if (<current_song> = jamsession)
		unload_songqpak
		gman_songfunc \{func = clear_play_list}
	endif
	if gman_songfunc \{func = is_play_list_empty}
		gman_songfunc func = add_song_to_play_list params = {song = ($startup_song)}
	endif
	get_lag_values
	Change calibrate_saved_video_offset = <video_offset>
	Change calibrate_saved_audio_offset = <audio_offset>
	practice_enabled = 0
	if ($game_mode = practice)
		practice_enabled = 1
	endif
	SetArrayElement ArrayName = calibrate_saved_practice_info globalarray index = 0 NewValue = <practice_enabled>
	SetArrayElement ArrayName = calibrate_saved_practice_info globalarray index = 1 NewValue = ($practice_start_time)
	SetArrayElement ArrayName = calibrate_saved_practice_info globalarray index = 2 NewValue = ($practice_end_time)
	SetArrayElement ArrayName = calibrate_saved_practice_info globalarray index = 3 NewValue = ($current_starttime)
	reset_practice_mode
	Change \{practice_enabled = 0}
	Change \{practice_start_time = 0}
	Change \{practice_end_time = 0}
	kill_gem_scroller \{no_render = 1}
	Change \{calibrate_lag_enabled = 1}
	Change calibrate_lag_previous_mode = ($game_mode)
	Change \{game_mode = gh4_p1_career}
	getfirstplayer
	getplayerinfo <Player> part
	get_controller_type controller_index = ($primary_controller)
	if NOT (<controller_type> = controller)
		part = <controller_type>
	else
		part = guitar
	endif
	if (<part> = vocals)
		part = guitar
	endif
	resetyieldinfo \{yield = FALSE}
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		Change \{gameplay_restart_song = 1}
		generic_event_back \{nosound
			state = Uistate_gameplay}
	else
		generic_event_choose \{no_sound
			state = uistate_play_song}
	endif
	SpawnScriptNow calibrate_highway_start_song params = {device_num = ($primary_controller) part = <part>}
endscript

script ui_calibrate_pausemenu 
	show_option = 0
	num_options = 0
	new_option = {
		text = qs(0xb8790f2f)
		func = ui_calibrate_pausemenu_choose_skip
		func_params = {state = video}
	}
	if ScreenElementExists \{id = calibrate_highway_container}
		if ($calibrate_highway_state = video)
			show_option = 1
		endif
	endif
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	if (<show_option> = 1)
		new_option = {
			text = qs(0xf6a0ac6e)
			func = ui_calibrate_pausemenu_choose_skip
			func_params = {state = audio reset_pause_script}
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
		num_options = (<num_options> + 1)
	endif
	if NOT ui_event_exists_in_stack \{Name = 'options'}
		back_to_text = qs(0x84aa9787)
		new_option = {
			text = <back_to_text>
			func = ui_calibrate_pausemenu_back_to_game
		}
		AddArrayElement array = <options> element = <new_option>
		<options> = <array>
		num_options = (<num_options> + 1)
	endif
	new_option = {
		text = qs(0x67d9c56d)
		func = ui_calibrate_pausemenu_choose_quit
	}
	AddArrayElement array = <options> element = <new_option>
	<options> = <array>
	num_options = (<num_options> + 1)
	if (<num_options> > 0)
		return options = <options>
	endif
endscript

script ui_calibrate_pausemenu_choose_skip 
	setup_pause \{pad_start_script = calibrate_hit_pause}
	ui_calibrate_skip state = <state>
	generic_event_back
	UnPauseGame
endscript

script ui_calibrate_skip \{fade_helpers = 1}
	Change calibrate_highway_gameplay_state = <state>
	calibrate_highway_kill_scripts
	LaunchEvent \{Type = unfocus
		target = calibrate_highway_events_container}
	calibrate_highway_events_container :SetTags \{current_changing = None}
	calibrationinterface :se_setprops \{helper_alpha = 0
		time = 0.25}
	calibrationinterface :se_waitprops
	SpawnScriptNow mock_highway_restart params = {<...>}
endscript

script ui_calibrate_reset_practice_data 
	practice_enabled = ($calibrate_saved_practice_info [0])
	Change practice_start_time = ($calibrate_saved_practice_info [1])
	Change practice_end_time = ($calibrate_saved_practice_info [2])
	Change current_starttime = ($calibrate_saved_practice_info [3])
	return practice_enabled = <practice_enabled>
endscript

script ui_calibrate_pausemenu_back_to_game 
	if NOT GotParam \{no_shutdown}
		calibrate_highway_shutdown
	endif
	ui_calibrate_reset_practice_data
	if (<practice_enabled> = 1)
		practice_restart_song
	else
		Change \{gameplay_restart_song = 1}
		generic_event_back \{state = Uistate_gameplay
			nosound}
	endif
endscript

script ui_calibrate_pausemenu_choose_quit 
	calibrate_highway_shutdown
	if ui_event_exists_in_stack \{Name = 'band_lobby'}
		ui_calibrate_pausemenu_back_to_game \{no_shutdown}
		return
	elseif ui_event_exists_in_stack \{Name = 'select_training'}
		ui_calibrate_pausemenu_back_to_game \{no_shutdown}
		return
	elseif ui_event_exists_in_stack \{Name = 'options'}
		quit_to_state = uistate_options
	elseif ui_event_exists_in_stack \{Name = 'jam'}
		quit_to_state = uistate_jam
	else
		quit_to_state = uistate_mainmenu
	endif
	generic_event_back state = <quit_to_state> nosound
endscript
