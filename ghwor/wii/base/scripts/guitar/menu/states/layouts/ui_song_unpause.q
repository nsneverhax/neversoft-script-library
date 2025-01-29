
script ui_create_song_unpause 
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> begin ui_create_song_unpause >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	hide_glitch \{num_frames = 4}
	push_disable_wii_invites_menu
	CreateScreenElement \{parent = root_window
		id = song_unpause
		Type = descinterface
		desc = 'song_unpause'
		z_priority = 10000
		alpha = 0.0}
	if (($g_pause_menu_exit_script) != NULL)
		($g_pause_menu_exit_script) ($g_pause_menu_exit_script_params)
		begin
		if ScriptIsRunning ($g_pause_menu_exit_script)
			Wait \{1
				gameframe}
		else
			break
		endif
		repeat
	endif
	song_unpause :obj_spawnscript \{ui_song_unpause}
	LaunchEvent \{Type = focus
		target = song_unpause}
	printscriptinfo \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> end ui_create_song_unpause >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
	printstruct channel = clayton <...>
	printf \{channel = clayton
		'>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'}
endscript

script ui_destroy_song_unpause 
	DestroyScreenElement \{id = song_unpause}
	SpawnScriptNow \{ui_destroy_song_unpause_spawned}
endscript

script ui_destroy_song_unpause_spawned 
	ui_event_wait_for_safe
	gamemode_gettype
	if NOT (<Type> = freeplay)
		if NOT ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_breakdown'}
			if ($current_playing_transition = None)
				enable_pause
			else
				printf 'ui_destroy_song_unpause_spawned - Not enabling pause becase of transition: %t' t = ($current_playing_transition)
			endif
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		setup_pause \{pad_start_script = calibrate_hit_pause}
	endif
	pop_disable_wii_invites_menu
endscript

script ui_song_unpause 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	setscriptcannotpause
	ui_event_wait_for_safe
	waitforaudioseek
	if ($allowed_rewind_unpause = 0 || $is_network_game = 1)
		ui_song_unpause_done
		kill_pause_curtain
		Change \{pause_grace_period = -1.0}
		return
	endif
	ui_song_unpause_done \{unpause_audio = 0}
	SpawnScriptNow \{wait_and_set_songtime}
	<rew_time> = 0.0
	<play_time> = 0.0
	SoundEvent \{event = ui_sfx_rewind_highway}
	GetSongTime
	<hack_resync_amount> = (3.0 / 60.0)
	<rewind_target_songtime> = ((<songtime> - $rewind_time) - <hack_resync_amount>)
	setalldeadwhammyalphas \{alpha = 1.0}
	killdeadgems
	<elapsed_time> = 0.0
	<audio_unpaused> = 0
	begin
	Wait \{1
		gameframe}
	GetDeltaTime \{ignore_slomo}
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	<rewind_wait_time> = ($rewind_scrollback_time + $rewind_hold_time)
	<elapsed_time_delta> = (<elapsed_time> - <rewind_wait_time>)
	if (<elapsed_time_delta> > 0.008)
		if (<audio_unpaused> = 0)
			unpauseaudio <...>
			if is_current_song_a_jam_session
				GetSongTimeMs
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
		GetSongTime
		if (<songtime> < <rewind_target_songtime>)
			setsongtime songtime = <rewind_target_songtime>
		endif
	endif
	Change pause_grace_period = ($pause_grace_period - <delta_time>)
	if ($pause_grace_period < $rewind_whammy_fadeout)
		alpha = ($pause_grace_period * (1.0 / $rewind_whammy_fadeout))
		setalldeadwhammyalphas alpha = <alpha>
	endif
	repeat
	kill_pause_curtain
	finalprintf qs(0x5c38fb65) a = <rew_time> b = <play_time> c = (<rew_time> + <play_time>)
endscript

script stop_rewind_sound_fx 
	if (IsSoundEventPlaying ui_sfx_rewind_highway)
		printf \{channel = zdebug
			qs(0x89555931)}
		StopSoundEvent \{ui_sfx_rewind_highway}
	endif
endscript

script wait_and_set_songtime 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	pausecompositeobjects
	if GetSkaterCamAnimParams \{Name = CameraCutCam}
		if GotParam \{cam_object_id}
			<cam_object_id> :ccam_pause
		endif
	endif
	UI :Unpause
	GetSongTime
	<original_songtime> = <songtime>
	<wait_time> = $pause_grace_period
	<elapsed_time> = 0.0
	begin
	Wait \{1
		gameframe}
	GetDeltaTime \{ignore_slomo}
	<elapsed_time> = (<elapsed_time> + <delta_time>)
	<elapsed_time_delta> = (<elapsed_time> - <wait_time>)
	if (<elapsed_time_delta> > -0.008)
		break
	endif
	repeat
	Change \{pause_grace_period = -1.0}
	unpausecompositeobjects
	if GetSkaterCamAnimParams \{Name = CameraCutCam}
		if GotParam \{cam_object_id}
			<cam_object_id> :ccam_unpause
		endif
	endif
endscript

script ui_song_unpause_done \{unpause_audio = 1}
	setscriptcannotpause
	ui_event_wait_for_safe
	gh_unpause_game unpause_audio = <unpause_audio>
	ui_event \{event = menu_back
		data = {
			state = Uistate_gameplay
			repausing = FALSE
		}}
	if IsObjectScript
		Die
	endif
endscript

script ui_song_unpause_repause 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = ui_song_unpause}
	ui_event_wait_for_safe
	if GotParam \{from_system}
		if ui_event_exists_in_stack \{Name = 'gameplay'}
			ui_event \{event = menu_back
				data = {
					state = Uistate_gameplay
					repausing = true
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		printf \{qs(0x20ab9428)
			channel = here}
		ui_sfx \{menustate = Generic
			uitype = select}
		printscriptinfo \{qs(0x386f8ca0)}
		printstruct <...>
		ui_event event = menu_replace state = Uistate_pausemenu data = {device_num = <device_num>}
	endif
endscript
