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
	SpawnScriptNow \{practice_update}
endscript

script practice_restart_song \{generic_params = {
		}}
	resetscoreupdateready
	SpawnScriptNow practice_restart_song_spawned params = {generic_params = <generic_params>}
endscript

script practice_restart_song_spawned \{generic_params = {
		}}
	setscriptcannotpause
	Change \{game_mode = practice}
	Change \{current_transition = practice}
	setup_practice_mode
	generic_event_back state = Uistate_gameplay <generic_params>
	ui_event_wait_for_safe
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	KillSpawnedScript \{Name = practice_update}
	if ScriptIsRunning \{kill_gem_scroller}
		Block \{Type = kill_gem_scroller_done}
	endif
	SpawnScriptNow \{practice_update}
endscript

script practice_pausesong 
	setscriptcannotpause
	songsetmastervolume \{vol = 0
		time = 0.1}
	Wait \{0.1
		Seconds}
	songpause
endscript

script practice_update 
	setscriptcannotpause
	has_paused = 0
	gman_songtool_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	begin
	practice_audio_filter
	practice_update_percentage_meter
	GetSongTimeMs
	song_time_ms = <time>
	songgetaudiolength
	if ($practice_loop_section = 1 && <has_paused> = 0)
		if (<time> > 0 && <song_time_ms> > <time> - 200)
			SpawnScriptNow \{practice_pausesong}
			has_paused = 1
		endif
	endif
	if (<song_time_ms> > (($practice_end_time) - 200 + $wii_seek_lag))
		if ($practice_loop_section = 1 && <has_paused> = 0)
			SpawnScriptNow \{practice_pausesong}
			has_paused = 1
		endif
		songsetmastervolume \{vol = -100
			time = 0.4}
		if (<song_time_ms> > (($practice_end_time) + ($Song_Win_Delay * 1000 - 100)))
			disable_pause
			KillSpawnedScript \{Name = practice_delayed_pause_enable}
			if ($practice_loop_section = 0)
				SpawnScriptNow \{finish_practice_song}
			else
				SpawnScriptNow \{practice_loop_song}
				return
			endif
		endif
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script practice_kill_gem_scroller 
	getplayerinfo <Player> server_id
	removeplayerserverfretbariterator fretbar_id = createfretbar id = <server_id>
	removeplayerserverfretbariterator fretbar_id = prefretbarevent id = <server_id>
	removeplayerserverfretbariterator fretbar_id = fretbarevent id = <server_id>
	removeplayerserverfretbariterator fretbar_id = createvocalmarker id = <server_id>
	clearplayerservermessages
	LaunchGemEvent \{event = kill_objects}
	flushplayerservermessages
	KillSpawnedScript \{Name = GuitarEvent_MissedNote}
	KillSpawnedScript \{Name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{Name = GuitarEvent_HitNotes}
	KillSpawnedScript \{Name = GuitarEvent_HitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{Name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{Name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{Name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{Name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{Name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{Name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{Name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{Name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{Name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{Name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{Name = highway_pulse_black}
	KillSpawnedScript \{Name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{Name = hit_note_fx}
	KillSpawnedScript \{Name = Do_StarPower_StageFX}
	KillSpawnedScript \{Name = Do_StarPower_Camera}
	KillSpawnedScript \{Name = first_gem_fx}
	KillSpawnedScript \{Name = gem_iterator}
	KillSpawnedScript \{Name = gem_array_stepper}
	KillSpawnedScript \{Name = gem_array_events}
	KillSpawnedScript \{Name = gem_step}
	KillSpawnedScript \{Name = gem_step_end}
	KillSpawnedScript \{Name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{Name = drumcontrolscript_iterator}
	KillSpawnedScript \{Name = drummer_controlscript}
	KillSpawnedScript \{Name = tempo_matching_iterator}
	KillSpawnedScript \{Name = momentcamera_playanim_spawned}
	KillSpawnedScript \{Name = fretbar_update_tempo}
	KillSpawnedScript \{Name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{Name = gem_scroller}
	KillSpawnedScript \{Name = button_checker}
	KillSpawnedScript \{Name = check_buttons}
	KillSpawnedScript \{Name = update_score_fast}
	KillSpawnedScript \{Name = event_iterator}
	notemap_deinit
	Destroy_AllWhammyFX
endscript

script practice_restart_gem_scroller 
	SetArrayElement \{ArrayName = currently_holding
		globalarray
		index = 0
		NewValue = 0}
	gman_songtool_getcurrentsong
	SpawnScriptNow gem_scroller params = {
		Player = <Player>
		difficulty = <difficulty>
		song_name = <current_song>
		looping = 1
	}
	launch_fill_array_iterator song = <current_song>
	if NOT playerinfoequals <Player> part = vocals
		SpawnScriptNow button_checker params = {
			Player = <Player>
			difficulty = <difficulty>
			song_name = <current_song>
			looping = 1
		}
	endif
endscript

script practice_loop_song 
	setscriptcannotpause
	SetButtonEventMappings \{block_menu_input}
	getfirstplayer
	fade_out_time = 0.66
	wait_out_time = (<fade_out_time> * 2)
	practice_fade_out Player = <Player> time = <fade_out_time>
	Wait (<fade_out_time>) Seconds ignoreslomo
	current_percentage = ($practice_current_percentage)
	Change \{practice_current_percentage = 0}
	practice_update_percentage_meter
	KillSpawnedScript \{Name = practicemode_section}
	practice_kill_gem_scroller Player = <Player>
	reset_score Player = <Player>
	Change \{current_section_array_entry = 0}
	get_lag_values
	transition_lag_offset = (0 - <video_offset> - <audio_offset>)
	transition_time = 4000
	practice_starttime = ($practice_start_time - <transition_time> - <transition_lag_offset>)
	if playerinfoequals <Player> part = vocals
		resetvocalhighwayindexes Player = <Player>
		transition_time = 4000
	endif
	setslomo \{0.001}
	reset_song_time starttime = <practice_starttime>
	if playerinfoequals <Player> part = drum
		resetdrumfills Player = <Player>
	endif
	SpawnScriptLater update_score_fast params = {Player = <Player>}
	getplayerinfo <Player> difficulty
	practice_setup_notemappings
	gman_songtool_getcurrentsong
	loaddrumkitall song = <current_song>
	practice_restart_gem_scroller Player = <Player> difficulty = <difficulty>
	SpawnScriptNow \{practicemode_section}
	calc_songscoreinfo Player = <Player>
	SpawnScriptNow \{practice_update}
	Wait \{1
		gameframe}
	playersetvolume Player = <Player> Volume = 100
	songpause
	SetSeekPosition_Song \{position = $practice_start_time}
	setslomo ($current_speedfactor)
	songsetmastervolume \{vol = 0
		time = 0.4}
	SpawnScriptNow \{begin_song_after_intro
		params = {
			starttimeafterintro = $practice_start_time
		}}
	Wait (<fade_out_time>) Seconds ignoreslomo
	practice_fade_in Player = <Player> time = <fade_out_time> current_percentage = <current_percentage>
	SetButtonEventMappings \{unblock_menu_input}
	SpawnScriptLater \{practice_delayed_pause_enable}
	vocals_muteoutput Player = <Player> mute = FALSE
endscript

script practice_delayed_pause_enable 
	begin
	if NOT ScriptIsRunning \{begin_song_after_intro}
		break
	endif
	WaitOneGameFrame
	repeat
	Wait \{1
		Second}
	enable_pause
endscript

script finish_practice_song 
	KillSpawnedScript \{Name = practice_update}
	generic_event_choose \{state = uistate_song_breakdown
		data = {
			for_practice = 1
		}
		no_sound}
endscript

script practice_audio_filter 
endscript

script practice_mode_setup_sounds 
	setsoundbussparams \{Crowd = {
			vol = -100
		}
		time = 2}
endscript

script setup_practice_mode 
	Change \{disable_crowd = 1}
	Change \{practice_enabled = 1}
endscript

script kill_practice_scripts 
	KillSpawnedScript \{Name = practice_update}
	KillSpawnedScript \{Name = practice_restart_gem_scroller}
	KillSpawnedScript \{Name = practice_loop_song}
	KillSpawnedScript \{Name = practice_delayed_pause_enable}
endscript

script shut_down_practice_mode 
	kill_practice_scripts
	getfirstplayer
	practice_kill_gem_scroller Player = <Player>
	Change \{disable_crowd = 0}
	Change \{practice_enabled = 0}
	if ($game_mode = practice)
		setsoundbussparams {Crowd = {vol = ($default_BussSet.Crowd.vol)} time = 1}
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
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	kill_gem_scroller
endscript

script practice_fade_out 
	Wait \{1
		gameframe}
	formatText checksumName = fretbar_container_name 'fretbar_containerp%p' p = <Player>
	formatText checksumName = highway_2d_container 'Highway_2Dp%p' p = <Player>
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player>
	safe_screenelement_fade id = <right_ns_id> alpha = 0 time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 0 time = <time>
	safe_screenelement_fade id = <highway_2d_container> rgba = [0 0 0 255] time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 0 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 0 time = <time>
endscript

script practice_fade_in 
	Wait \{1
		gameframe}
	formatText checksumName = fretbar_container_name 'fretbar_containerp%p' p = <Player>
	formatText checksumName = highway_2d_container 'Highway_2Dp%p' p = <Player>
	formatText checksumName = right_ns_id 'sidebar_right_ns_meterp%p' p = <Player>
	safe_screenelement_fade id = <highway_2d_container> rgba = [255 255 255 255] time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 1 time = <time>
	safe_screenelement_fade id = <right_ns_id> alpha = 1 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 1 time = <time>
	if ScreenElementExists \{id = practice_sectionpercentagetext_highest}
		if (<current_percentage> > $practice_highest_percentage)
			Change practice_highest_percentage = <current_percentage>
			formatText TextName = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
			practice_sectionpercentagetext_highest :se_setprops text = <percentage_text>
		endif
	endif
	if ($practice_highest_percentage > 0)
		safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 1 time = <time>
	endif
endscript

script safe_screenelement_fade 
	if ScreenElementExists id = <id>
		<id> :se_setprops <...>
	endif
endscript

script practice_update_percentage_meter 
	getfirstplayer
	getplayerinfo <Player> max_notes
	getplayerinfo <Player> notes_hit
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_max_qual
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
				formatText TextName = percentage_text qs(0x720688b0) d = <percentage>
				practice_sectionpercentagetext :se_setprops text = <percentage_text>
			endif
			if (<percentage> > $practice_highest_percentage)
				Change practice_highest_percentage = <percentage>
				formatText TextName = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
				practice_sectionpercentagetext_highest :se_setprops text = <percentage_text>
			endif
		endif
	endif
endscript

script practice_choose_change_section 
	kill_gem_scroller \{no_render = 1}
	generic_event_replace state = uistate_select_song_section data = {<...>}
endscript

script practice_choose_change_speed 
	generic_event_replace state = uistate_practice_select_speed data = {<...>}
endscript
