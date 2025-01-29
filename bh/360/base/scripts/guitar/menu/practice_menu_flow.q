came_to_practice_from = main_menu

script practice_start_song \{device_num = 0}
	Change \{game_mode = practice}
	Change \{current_transition = practice}
	setup_practice_mode
	start_song {
		starttime = ($practice_start_time)
		device_num = <device_num>
		practice_intro = 1
		endtime = ($practice_end_time)
		starttime = <starttime>
		uselaststarttime = <uselaststarttime>
	}
	spawnscriptnow \{practice_update}
endscript

script practice_restart_song \{generic_params = {
		}}
	ResetScoreUpdateReady
	spawnscriptnow practice_restart_song_spawned params = {generic_params = <generic_params>}
endscript

script practice_restart_song_spawned \{generic_params = {
		}}
	SetScriptCannotPause
	hide_glitch \{num_frames = 20}
	Change \{game_mode = practice}
	Change \{current_transition = practice}
	setup_practice_mode
	generic_event_back state = uistate_gameplay <generic_params>
	wait \{1
		gameframe}
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	killspawnedscript \{name = practice_update}
	if ScriptIsRunning \{kill_gem_scroller}
		Block \{type = kill_gem_scroller_done}
	endif
	spawnscriptnow \{practice_update}
endscript

script practice_pausesong 
	SetScriptCannotPause
	SongSetMasterVolume \{vol = 0
		time = 0.1}
	wait \{0.1
		seconds}
	songpause
endscript

script practice_update 
	SetScriptCannotPause
	has_paused = 0
	GMan_SongTool_GetCurrentSong
	SongFileManager func = get_song_end_time song_name = <current_song>
	begin
	practice_audio_filter
	practice_update_percentage_meter
	GetSongTimeMs
	song_time_ms = <time>
	SongGetAudioLength
	if ($practice_loop_section = 1 && <has_paused> = 0)
		if (<time> > 0 && <song_time_ms> > <time> - 200)
			spawnscriptnow \{practice_pausesong}
			has_paused = 1
		endif
	endif
	if (<song_time_ms> > ($practice_end_time) - 200)
		if ($practice_loop_section = 1 && <has_paused> = 0)
			spawnscriptnow \{practice_pausesong}
			has_paused = 1
		endif
		SongSetMasterVolume \{vol = -100
			time = 0.4}
		if (<song_time_ms> > (($practice_end_time) + ($Song_Win_Delay * 1000 - 100)))
			if ($practice_loop_section = 0)
				spawnscriptnow \{finish_practice_song}
			else
				spawnscriptnow \{practice_loop_song}
				return
			endif
		endif
	endif
	wait \{1
		gameframes}
	repeat
endscript

script practice_kill_gem_scroller 
	GetPlayerInfo <player> server_id
	RemovePlayerServerFretbarIterator fretbar_id = CreateFretbar id = <server_id>
	RemovePlayerServerFretbarIterator fretbar_id = PreFretbarEvent id = <server_id>
	RemovePlayerServerFretbarIterator fretbar_id = FretbarEvent id = <server_id>
	RemovePlayerServerFretbarIterator fretbar_id = CreateVocalMarker id = <server_id>
	ClearPlayerServerMessages
	LaunchGemEvent \{event = kill_objects}
	FlushPlayerServerMessages
	killspawnedscript \{name = GuitarEvent_MissedNote}
	killspawnedscript \{name = GuitarEvent_UnnecessaryNote}
	killspawnedscript \{name = GuitarEvent_HitNotes}
	killspawnedscript \{name = GuitarEvent_HitNote}
	killspawnedscript \{name = GuitarEvent_StarPowerOn}
	killspawnedscript \{name = GuitarEvent_StarPowerOff}
	killspawnedscript \{name = GuitarEvent_StarHitNote}
	killspawnedscript \{name = GuitarEvent_StarSequenceBonus}
	killspawnedscript \{name = GuitarEvent_StarMissNote}
	killspawnedscript \{name = GuitarEvent_WhammyOn}
	killspawnedscript \{name = GuitarEvent_WhammyOff}
	killspawnedscript \{name = GuitarEvent_StarWhammyOn}
	killspawnedscript \{name = GuitarEvent_StarWhammyOff}
	killspawnedscript \{name = GuitarEvent_Note_Window_Open}
	killspawnedscript \{name = GuitarEvent_Note_Window_Close}
	killspawnedscript \{name = GuitarEvent_crowd_poor_medium}
	killspawnedscript \{name = GuitarEvent_crowd_medium_good}
	killspawnedscript \{name = GuitarEvent_crowd_medium_poor}
	killspawnedscript \{name = GuitarEvent_crowd_good_medium}
	killspawnedscript \{name = GuitarEvent_CreateFirstGem}
	killspawnedscript \{name = highway_pulse_black}
	killspawnedscript \{name = GuitarEvent_HitNote_Spawned}
	killspawnedscript \{name = hit_note_fx}
	killspawnedscript \{name = Do_StarPower_StageFX}
	killspawnedscript \{name = Do_StarPower_Camera}
	killspawnedscript \{name = first_gem_fx}
	killspawnedscript \{name = gem_iterator}
	killspawnedscript \{name = gem_array_stepper}
	killspawnedscript \{name = gem_array_events}
	killspawnedscript \{name = gem_step}
	killspawnedscript \{name = gem_step_end}
	killspawnedscript \{name = WatchForStartPlaying_iterator}
	killspawnedscript \{name = DrumControlScript_Iterator}
	killspawnedscript \{name = drummer_controlscript}
	killspawnedscript \{name = Tempo_matching_iterator}
	killspawnedscript \{name = MomentCamera_PlayAnim_Spawned}
	killspawnedscript \{name = fretbar_update_tempo}
	killspawnedscript \{name = fretbar_update_hammer_on_tolerance}
	killspawnedscript \{name = gem_scroller}
	killspawnedscript \{name = button_checker}
	killspawnedscript \{name = check_buttons}
	killspawnedscript \{name = update_score_fast}
	killspawnedscript \{name = event_iterator}
	notemap_deinit
	Destroy_AllWhammyFX
endscript

script practice_restart_gem_scroller 
	SetArrayElement \{arrayName = currently_holding
		GlobalArray
		index = 0
		newValue = 0}
	GMan_SongTool_GetCurrentSong
	spawnscriptnow gem_scroller params = {
		player = <player>
		difficulty = <difficulty>
		song_name = <current_song>
		looping = 1
	}
	launch_fill_array_iterator song = <current_song>
	if NOT PlayerInfoEquals <player> part = vocals
		spawnscriptnow button_checker params = {
			player = <player>
			difficulty = <difficulty>
			song_name = <current_song>
			looping = 1
		}
	endif
endscript

script practice_loop_song 
	SetScriptCannotPause
	SetButtonEventMappings \{block_menu_input}
	Change \{disable_note_input = 1}
	GetFirstPlayer
	fade_out_time = 0.66
	wait_out_time = (<fade_out_time> * 2)
	practice_fade_out player = <player> time = <fade_out_time>
	wait (<fade_out_time>) seconds ignoreslomo
	current_percentage = ($practice_current_percentage)
	Change \{practice_current_percentage = 0}
	practice_update_percentage_meter
	killspawnedscript \{name = practicemode_section}
	practice_kill_gem_scroller player = <player>
	reset_score player = <player>
	Change \{current_section_array_entry = 0}
	get_lag_values
	transition_lag_offset = (0 - <video_offset> - <audio_offset>)
	transition_time = 4000
	practice_starttime = ($practice_start_time - <transition_time> - <transition_lag_offset>)
	if PlayerInfoEquals <player> part = vocals
		ResetVocalHighwayIndexes player = <player>
		transition_time = 4000
	endif
	setslomo \{0.001}
	reset_song_time starttime = <practice_starttime>
	if PlayerInfoEquals <player> part = Drum
		ResetDrumFills player = <player>
	endif
	spawnscriptlater update_score_fast params = {player = <player>}
	GetPlayerInfo <player> difficulty
	practice_setup_notemappings
	GMan_SongTool_GetCurrentSong
	LoadDrumKitAll song = <current_song>
	practice_restart_gem_scroller player = <player> difficulty = <difficulty>
	spawnscriptnow \{practicemode_section}
	calc_songscoreinfo player = <player>
	spawnscriptnow \{practice_update}
	wait \{1
		gameframe}
	PlayerSetVolume player = <player> volume = 100
	songpause
	SetSeekPosition_Song \{position = $practice_start_time}
	setslomo ($current_speedfactor)
	SongSetMasterVolume \{vol = 0
		time = 0.4}
	spawnscriptnow \{begin_song_after_intro
		params = {
			starttimeafterintro = $practice_start_time
		}}
	wait (<fade_out_time>) seconds ignoreslomo
	practice_fade_in player = <player> time = <fade_out_time> current_percentage = <current_percentage>
	Change \{disable_note_input = 0}
	SetButtonEventMappings \{unblock_menu_input}
	broadcastevent \{type = practice_looping_done}
endscript

script finish_practice_song 
	killspawnedscript \{name = practice_update}
	ui_event_wait \{event = menu_change
		data = {
			state = UIstate_song_breakdown
			for_practice = 1
		}}
endscript

script practice_audio_filter 
endscript

script practice_mode_setup_sounds 
	SetSoundBussParams \{Crowd = {
			vol = -100
		}
		time = 2}
endscript

script setup_practice_mode 
	Change \{disable_crowd = 1}
	Change \{practice_enabled = 1}
endscript

script kill_practice_scripts 
	killspawnedscript \{name = practice_update}
	killspawnedscript \{name = practice_restart_gem_scroller}
	if ScriptIsRunning \{practice_loop_song}
		Block \{type = practice_looping_done}
	endif
	killspawnedscript \{name = practice_loop_song}
endscript

script shut_down_practice_mode 
	kill_practice_scripts
	GetFirstPlayer
	practice_kill_gem_scroller player = <player>
	Change \{disable_crowd = 0}
	Change \{practice_enabled = 0}
	if ($game_mode = practice)
		SetSoundBussParams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
	endif
endscript

script end_practice_song_slomo 
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	Change \{structurename = PitchShiftSlow1
		pitch = 1.0}
endscript

script end_practice_song 
	printf \{qs(0x4946182f)}
	end_practice_song_slomo
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	kill_gem_scroller
endscript

script practice_fade_out 
	wait \{1
		gameframe}
	FormatText checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	FormatText checksumname = Highway_2D_container 'Highway_2Dp%p' p = <player>
	FormatText checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <right_ns_id> alpha = 0 time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 0 time = <time>
	safe_screenelement_fade id = <Highway_2D_container> rgba = [0 0 0 255] time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 0 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 0 time = <time>
endscript

script practice_fade_in 
	wait \{1
		gameframe}
	FormatText checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	FormatText checksumname = Highway_2D_container 'Highway_2Dp%p' p = <player>
	FormatText checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <Highway_2D_container> rgba = [255 255 255 255] time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 1 time = <time>
	safe_screenelement_fade id = <right_ns_id> alpha = 1 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 1 time = <time>
	if ScreenElementExists \{id = practice_sectionpercentagetext_highest}
		if (<current_percentage> > $practice_highest_percentage)
			Change practice_highest_percentage = <current_percentage>
			FormatText TextName = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
			practice_sectionpercentagetext_highest :SE_SetProps text = <percentage_text>
		endif
	endif
	if ($practice_highest_percentage > 0)
		safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 1 time = <time>
	endif
endscript

script safe_screenelement_fade 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps <...>
	endif
endscript

script practice_update_percentage_meter 
	GetFirstPlayer
	GetPlayerInfo <player> max_notes
	GetPlayerInfo <player> notes_hit
	GetPlayerInfo <player> part
	if (<part> = vocals)
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_max_qual
		notes_hit = <vocal_phrase_quality>
		max_notes = <vocal_phrase_max_qual>
	endif
	if (<max_notes> > 0)
		max_notes = (<max_notes> * 1.0)
		percentage = ((<notes_hit> / <max_notes>) * 100)
		CastToInteger \{percentage}
		if (<percentage> != $practice_current_percentage)
			Change practice_current_percentage = <percentage>
			if ScreenElementExists \{id = practice_sectionpercentagetext}
				FormatText TextName = percentage_text qs(0x720688b0) d = <percentage>
				practice_sectionpercentagetext :SE_SetProps text = <percentage_text>
			endif
			if (<percentage> > $practice_highest_percentage)
				Change practice_highest_percentage = <percentage>
				FormatText TextName = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
				practice_sectionpercentagetext_highest :SE_SetProps text = <percentage_text>
			endif
		endif
	endif
endscript

script practice_choose_change_section 
	kill_gem_scroller \{no_render = 1}
	sound_params = {}
	if GotParam \{no_sound}
		sound_params = {no_sound}
	endif
	generic_event_replace state = UIstate_select_song_section data = {<...>} <sound_params>
endscript

script practice_choose_change_speed 
	generic_event_replace state = UIstate_practice_select_speed data = {<...>}
endscript
