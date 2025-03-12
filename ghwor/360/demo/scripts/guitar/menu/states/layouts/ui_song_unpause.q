
script ui_create_song_unpause 
	hide_glitch \{num_frames = 4}
	createscreenelement \{parent = root_window
		id = song_unpause
		type = descinterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0}
	if (($g_pause_menu_exit_script) != null)
		($g_pause_menu_exit_script) ($g_pause_menu_exit_script_params)
		begin
		if scriptisrunning ($g_pause_menu_exit_script)
			wait \{1
				gameframe}
		else
			break
		endif
		repeat
	endif
	song_unpause :obj_spawnscript \{ui_song_unpause}
	launchevent \{type = focus
		target = song_unpause}
endscript

script ui_destroy_song_unpause 
	destroyscreenelement \{id = song_unpause}
	spawnscriptnow \{ui_destroy_song_unpause_spawned}
endscript

script ui_destroy_song_unpause_spawned 
	ui_event_wait_for_safe
	gamemode_gettype
	if NOT (<type> = freeplay)
		if NOT ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_breakdown'}
			if ($current_playing_transition = none)
				enable_pause
			else
				printf 'ui_destroy_song_unpause_spawned - Not enabling pause becase of transition: %t' t = ($current_playing_transition)
			endif
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
endscript

script ui_song_unpause 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	setscriptcannotpause
	ui_event_wait_for_safe
	waitforaudioseek
	if ($allowed_rewind_unpause = 0 || $is_network_game = 1)
		ui_song_unpause_done
		kill_pause_curtain
		change \{pause_grace_period = -1.0}
		return
	endif
	ui_song_unpause_done \{unpause_audio = 0}
	spawnscriptnow \{wait_and_set_songtime}
	<rew_time> = 0.0
	<play_time> = 0.0
	soundevent \{event = ui_sfx_rewind_highway}
	getsongtime
	<rewind_target_songtime> = (<songtime> - $rewind_time)
	setallwhammyfxalphas \{alpha = 0.0}
	setalldeadwhammyalphas \{alpha = 1.0}
	killdeadgems
	<elapsed_time> = 0.0
	<audio_unpaused> = 0
	begin
	wait \{1
		gameframe}
	getdeltatime \{ignore_slomo}
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	<rewind_wait_time> = ($rewind_scrollback_time + $rewind_hold_time)
	<elapsed_time_delta> = (<elapsed_time> - <rewind_wait_time>)
	if (<elapsed_time_delta> > 0.008)
		if (<audio_unpaused> = 0)
			unpauseaudio <...>
			if is_current_song_a_jam_session
				getsongtimems
				start_time = (<time> + (-1000.0 * $rewind_time))
				musicstudio_mainobj :musicstudio_playsong start_time = <start_time>
			endif
			<audio_unpaused> = 1
		endif
		if ($pause_grace_period < 0.0)
			break
		endif
		<play_time> = (<play_time> + <delta_time>)
		update_pause_curtain_alpha
	else
		<rewind_speed> = (1.0 + ($rewind_time / $rewind_scrollback_time))
		incrementsongtimer delta_time = ((0.0 - <rewind_speed>) * <delta_time>)
		<rew_time> = (<rew_time> + <delta_time>)
		getsongtime
		if (<songtime> < <rewind_target_songtime>)
			setsongtime songtime = <rewind_target_songtime>
		endif
	endif
	change pause_grace_period = ($pause_grace_period - <delta_time>)
	if ($pause_grace_period < $rewind_whammy_fadeout)
		alpha = ($pause_grace_period * (1.0 / $rewind_whammy_fadeout))
		setalldeadwhammyalphas alpha = <alpha>
	endif
	repeat
	kill_pause_curtain
	setallwhammyfxalphas \{alpha = 1.0}
	finalprintf qs(0xb156d165) a = <rew_time> b = <play_time> c = (<rew_time> + <play_time>)
endscript

script stop_rewind_sound_fx 
	if (issoundeventplaying ui_sfx_rewind_highway)
		printf \{channel = zdebug
			qs(0x89555931)}
		stopsoundevent \{ui_sfx_rewind_highway}
	endif
endscript

script wait_and_set_songtime 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	pausecompositeobjects
	if getskatercamanimparams \{name = cameracutcam}
		if gotparam \{cam_object_id}
			<cam_object_id> :ccam_pause
		endif
	endif
	ui :unpause
	getsongtime
	<original_songtime> = <songtime>
	<wait_time> = $pause_grace_period
	<elapsed_time> = 0.0
	begin
	wait \{1
		gameframe}
	getdeltatime \{ignore_slomo}
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	<elapsed_time_delta> = (<elapsed_time> - <wait_time>)
	if (<elapsed_time_delta> > -0.008)
		break
	endif
	repeat
	change \{pause_grace_period = -1.0}
	unpausecompositeobjects
	if getskatercamanimparams \{name = cameracutcam}
		if gotparam \{cam_object_id}
			<cam_object_id> :ccam_unpause
		endif
	endif
endscript

script fireoff_countdown_by_user_lag 
	wait_time = (<video_offset> - <audio_offset>)
	if (<wait_time> < 0)
		wait_time = 0
	endif
	wait (<wait_time> / 1000.0) seconds
	formattext textname = number_text qs(0xc31d83ea) i = <i>
	se_setprops number_text = <number_text>
endscript

script ui_song_unpause_done \{unpause_audio = 1}
	setscriptcannotpause
	ui_event_wait_for_safe
	gh_unpause_game unpause_audio = <unpause_audio>
	ui_event \{event = menu_back
		data = {
			state = uistate_gameplay
			repausing = false
		}}
	if isobjectscript
		die
	endif
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	killspawnedscript \{name = ui_song_unpause}
	ui_event_wait_for_safe
	if gotparam \{from_system}
		if ui_event_exists_in_stack \{name = 'gameplay'}
			ui_event \{event = menu_back
				data = {
					state = uistate_gameplay
					repausing = true
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		printf \{qs(0x20ab9428)
			channel = here}
		ui_sfx \{menustate = generic
			uitype = select}
		ui_event event = menu_replace state = uistate_pausemenu data = {device_num = <device_num>}
	endif
endscript
