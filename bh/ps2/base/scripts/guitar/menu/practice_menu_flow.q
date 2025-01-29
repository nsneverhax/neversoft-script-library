came_to_practice_from = main_menu
came_to_practice_from_progression = None
came_to_practice_character_id = emptyguy
came_to_practice_difficulty = easy

script practice_check_song_for_parts 
	destroy_band
	0xce69e479
	load_songqpak song_name = ($current_song) async = 0
	set_song_section_array \{Player = 1}
	generic_event_choose \{state = uistate_practice_select_difficulty}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> no_rhythm_track
		return \{flow_state = practice_setlist_fs}
	endif
	songfilemanager func = 0xb08ce65f song_name = ($current_song) difficulty = easy part = guitar
	if (<0x2d1d62d3> > 0)
		return \{flow_state = practice_select_part_fs}
	endif
	if StructureContains structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	return \{flow_state = practice_setlist_fs}
endscript

script practice_start_song \{device_num = 0}
	Change \{game_mode = practice}
	Change \{current_transition = practice}
	0x72fc1318
	Change current_level = <0x2132a86b>
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

script practice_restart_song 
	end_song
	resetscoreupdateready
	SpawnScriptNow \{practice_restart_song_spawned}
endscript

script practice_restart_song_spawned 
	setscriptcannotpause
	Change \{game_mode = practice}
	Change \{current_transition = practice}
	generic_event_back \{state = Uistate_gameplay}
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	KillSpawnedScript \{Name = practice_update}
	SpawnScriptNow \{practice_update}
endscript

script practice_update 
	setscriptcannotpause
	resetpracticesoundbusses
	begin
	practice_audio_filter
	GetSongTimeMs
	if (<time> > ($practice_end_time))
		songsetmastervolume \{vol = -100
			time = 0.4}
		if (<time> > (($practice_end_time) + ($Song_Win_Delay * 1000 - 100)))
			if ($practice_loop_section = 0)
				disable_pause
				ui_event_wait_for_safe
				ui_event_get_top
				if NOT (<base_name> = 'gameplay')
					ui_event_block \{event = menu_back
						data = {
							state = Uistate_gameplay
						}}
					do_gh3_unpause
				endif
				SpawnScriptNow \{finish_practice_song}
				return
			else
				SpawnScriptNow \{practice_loop_song}
				return
			endif
		endif
	endif
	enable_pause \{nospam}
	Wait \{1
		gameframes}
	repeat
endscript

script practice_loop_song 
	StopRendering
	removeplayerserverfretbariterator \{fretbar_id = createfretbar
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = prefretbarevent
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = fretbarevent
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = createvocalmarker
		id = player1_status}
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
	KillSpawnedScript \{Name = drumkit_anim_iterator}
	KillSpawnedScript \{Name = WatchForStartPlaying_iterator}
	band_disabletempoiterator
	KillSpawnedScript \{Name = tempo_matching_iterator}
	KillSpawnedScript \{Name = momentcamera_playanim_spawned}
	KillSpawnedScript \{Name = fretbar_update_tempo}
	KillSpawnedScript \{Name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{Name = gem_scroller}
	KillSpawnedScript \{Name = button_checker}
	KillSpawnedScript \{Name = check_buttons}
	notemap_deinit
	reset_score \{player_status = player1_status}
	transition_time = 2000
	if (($player1_status.part) = vocals)
		resetvocalhighwayindexes \{Player = 1}
		transition_time = 4000
	endif
	setslomo \{0.001}
	reset_song_time starttime = ($practice_start_time - <transition_time>)
	SetArrayElement \{ArrayName = currently_holding
		globalarray
		index = 0
		NewValue = 0}
	SpawnScriptLater \{update_score_fast
		params = {
			player_status = player1_status
		}}
	SpawnScriptNow gem_scroller params = {
		Player = 1
		player_status = player1_status
		player_text = 'p1'
		training_mode = 0
		song_name = ($current_song)
		difficulty = ($player1_status.difficulty)
		difficulty2 = ($player2_status.difficulty)
		looping = 1
	}
	if (($player1_status.part) != vocals)
		SpawnScriptNow button_checker params = {
			Player = 1
			player_status = player1_status
			player_text = 'p1'
			training_mode = 0
			song_name = ($current_song)
			difficulty = ($player1_status.difficulty)
			difficulty2 = ($player2_status.difficulty)
			looping = 1
		}
	endif
	calc_songscoreinfo \{player_status = player1_status}
	SpawnScriptNow \{practice_update}
	Wait \{1
		gameframe}
	songpause
	SetSeekPosition_Song position = ($practice_start_time - <transition_time>)
	songunpause
	setslomo \{$current_speedfactor}
	pausegh3
	Wait \{1
		gameframe}
	unpausegh3
	StartRendering
endscript

script finish_practice_song 
	KillSpawnedScript \{Name = practice_update}
	GuitarEvent_SongWon
	disable_pause
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = Uistate_gameplay
			}}
	endif
	menu_start_transition
	generic_event_choose \{state = uistate_song_breakdown
		data = {
			for_practice = 1
		}
		no_sound}
	ui_event_wait_for_safe
endscript

script practice_audio_filter 
endscript

script shut_down_practice_mode 
	KillSpawnedScript \{Name = practice_update}
endscript

script end_practice_song_slomo 
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
endscript

script end_practice_song 

	end_practice_song_slomo
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	kill_gem_scroller
endscript
