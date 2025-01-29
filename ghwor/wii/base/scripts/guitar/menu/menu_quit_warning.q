
script create_quit_warning_menu \{Player = 1
		option1_text = qs(0xf7723015)
		option2_text = qs(0x67d9c56d)
		option1_func = generic_event_back
		option1_func_params = {
			nosound
		}
		option2_func = quit_warning_select_quit
		option2_func_params = {
		}
		has_third_choice = 0
		option3_text = qs(0xd62d107d)
		option3_func = quit_warning_select_quit
		option3_func_params = {
		}
		disconnect_dialog = 0}
	disable_pause
	player_device = ($last_start_pressed_device)
	if GotParam \{exclusive_device}
		player_device = <exclusive_device>
	endif
	if NOT GotParam \{body_text}
		gamemode_gettype
		if ($calibrate_lag_enabled = 1)
			<body_text> = qs(0x9c8497b1)
		elseif (<disconnect_dialog> = 1)
			<body_text> = qs(0x9c8497b1)
		elseif (<Type> = tutorial)
			<body_text> = qs(0x7e72cce4)
		elseif (<Type> = quickplay || <Type> = competitive)
			if ui_event_exists_in_stack \{Name = 'songlist'}
				<body_text> = qs(0x802f8c8d)
			else
				<body_text> = qs(0x9c8497b1)
			endif
		elseif GotParam \{quit_text}
			formatText TextName = body_text qs(0x36ac8d93) t = <quit_text>
		else
			<body_text> = qs(0xb681c26c)
		endif
	endif
	<options> = [
		{
			func = <option1_func>
			func_params = <option1_func_params>
			text = <option1_text>
		}
		{
			func = generic_quit_warning_select_quit
			func_params = {func = <option2_func> func_params = <option2_func_params>}
			text = <option2_text>
		}
	]
	if (<has_third_choice> = 1)
		AddArrayElement {
			array = <options>
			element = {
				func = generic_quit_warning_select_quit
				func_params = {func = <option3_func> func_params = <option3_func_params>}
				text = <option3_text>
			}
		}
		<options> = <array>
	endif
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		dlg_z_priority = <dlg_z_priority>
		no_background
		options = <options>
	}
endscript

script create_quit_warning_menu_with_custom_options \{options = !a1768515945}
	disable_pause
	player_device = ($last_start_pressed_device)
	if GotParam \{exclusive_device}
		<player_device> = <exclusive_device>
	endif
	gamemode_gettype
	if (<Type> = tutorial)
		<body_text> = qs(0x7e72cce4)
	elseif GotParam \{quit_text}
		formatText TextName = body_text qs(0x36ac8d93) t = <quit_text>
	else
		<body_text> = qs(0xb681c26c)
	endif
	create_dialog_box {
		body_text = <body_text>
		player_device = <player_device>
		dlg_z_priority = 500
		no_background
		options = <options>
	}
endscript

script destroy_quit_warning_menu 
	destroy_dialog_box
endscript

script generic_quit_warning_select_quit 
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	SpawnScriptNow \{sfx_backgrounds_new_area
		params = {
			BG_SFX_Area = FrontEnd
		}}
	restore_player_part_settings
	<func> <func_params>
endscript

script quit_warning_select_quit \{Player = 1
		callback = song_ended_menu_select_quit}
	end_practice_song_slomo
	Change \{end_credits = 0}
	if ($practice_enabled = 1)
		ui_sfx \{menustate = Generic
			uitype = select}
	endif
	StopSoundsByBuss \{Encore_Events}
	StopSoundsByBuss \{sfx_balance}
	set_all_highway_props \{alpha = 0.0}
	hide_entire_hud
	hide_glitch \{num_frames = 10}
	if ($calibrate_lag_enabled = 1)
		calibrate_highway_shutdown
		generic_event_back \{nosound
			state = uistate_mainmenu}
		return
	endif
	restore_player_part_settings
	gamemode_gettype
	if (<Type> = career)
		kill_intro_celeb_ui
		career_pause_quit <...>
		songlist_clear_playlist
		return
	endif
	if (<Type> = competitive)
		competitive_pause_quit <...>
		return
	endif
	if (<Type> = tutorial)
		tutorial_system_pausemenu_quit <...>
		return
	endif
	if (<Type> = quickplay)
		if NOT GotParam \{new_song}
			callback = song_ended_menu_select_quit
			data = {}
			if GotParam \{quit_type}
				if (<quit_type> = bandlobby)
					data = {bandlobby}
				endif
			endif
		endif
	endif
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_quit
		}}
	ngc_clean_up_exploding_text
	if GotParam \{quit_career_confirm}
		if (<Type> = career)
			career_song_ended_select_quit
		endif
	endif
	if isxenonorwindx
		if NOT is_current_song_a_jam_session
			writesongdatatofile \{incomplete = 1}
		endif
	endif
	end_singleplayer_game
	xenon_singleplayer_session_begin_uninit
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	resetscoreupdateready
	audio_gameplay_fail_song_stop_sounds
	<callback> data = <data> no_sound
endscript
