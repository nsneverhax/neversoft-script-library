came_to_practice_from = main_menu
came_to_practice_difficulty = easy
came_to_practice_difficulty2 = easy

script practice_check_song_for_parts 
	destroy_band
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> no_rhythm_track
		change \{structurename = player1_status
			part = guitar}
		generic_event_choose \{state = uistate_select_difficulty}
		return
	endif
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			generic_event_choose \{state = uistate_practice_select_part}
			return
		endif
	endif
	if structurecontains structure = <song_struct> use_coop_notetracks
		generic_event_choose \{state = uistate_practice_select_part}
		return
	endif
	change \{structurename = player1_status
		part = guitar}
	generic_event_choose \{state = uistate_select_difficulty}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> no_rhythm_track
		return \{flow_state = practice_setlist_fs}
	endif
	get_song_prefix song = ($current_song)
	formattext checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if globalexists name = <song_rhythm_array_id> type = array
		getarraysize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if structurecontains structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	return \{flow_state = practice_setlist_fs}
endscript

script practice_start_song \{device_num = 0}
	change \{game_mode = training}
	change \{current_transition = practice}
	change \{current_level = load_z_studio}
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

script practice_restart_song 
	resetscoreupdateready
	spawnscriptnow \{practice_restart_song_spawned}
endscript

script practice_restart_song_spawned 
	setscriptcannotpause
	change \{game_mode = training}
	change \{current_transition = practice}
	generic_event_back \{state = uistate_gameplay}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 2)
			change \{special_event_stage = 2}
			destroy_pause_menu
			reset_special_event \{num = 2}
		endif
	endif
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	killspawnedscript \{name = practice_update}
	spawnscriptnow \{practice_update}
endscript

script practice_update 
	setscriptcannotpause
	if ($special_event_stage != 0)
		check_current_special_event_percentages \{dont_use_extra_notes}
	endif
	begin
	practice_audio_filter
	if ($special_event_stage != 0)
		if screenelementexists \{id = practice_container}
			setscreenelementprops \{id = practice_container
				alpha = 0}
		endif
		getplayerinfo \{1
			part}
		formattext \{checksumname = event_num
			'special_event%d'
			d = $current_special_event_num}
		formattext \{checksumname = challenge_num
			'challenge%d'
			d = $current_special_event_challenge_num}
		formattext checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			show_recording_text = 1
			if ($current_special_event_num = 2)
				if ($special_event_stage >= 2)
					if ($current_section_array_entry = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]))
						if screenelementexists \{id = special_event_question_markp1}
							setscreenelementprops \{id = special_event_question_markp1
								unhide}
							special_event_question_markp1 :legacydomorph \{alpha = 1
								time = 1}
						endif
						change \{special_event_alpha_out_gems = 1}
					else
						if screenelementexists \{id = special_event_question_markp1}
							special_event_question_markp1 :legacydomorph \{alpha = 0
								time = 1}
						endif
					endif
				else
					if ($current_special_event_num != 2)
						<show_recording_text> = 0
					endif
				endif
			endif
			if (<show_recording_text> = 1)
				get_song_section_array
				getsongtimems
				recording_text = qs(0x03ac90f0)
				recording = -1
				recording_countdown = -1
				set_special_event_section = false
				getarraysize ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				use_special_event_section_array = 1
				if (<array_size> = 0)
					<use_special_event_section_array> = 0
					get_song_section_array
					getmarkerarraysize array = <song_section_array>
				endif
				entry = 0
				begin
				if (<use_special_event_section_array> = 1)
					recording_section = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<entry>])
				else
					recording_section = <entry>
				endif
				section_time = ($<song_section_array> [<recording_section>].time)
				if (<section_time> >= <time>)
					if (<set_special_event_section> = false)
						change current_special_event_section = <recording_section>
						<set_special_event_section> = true
					endif
				endif
				continue = 0
				if check_current_special_event_percentages section_to_check = <recording_section>
					if (<recording_section> = ($current_section_array_entry))
						<continue> = 1
					endif
				else
					<recording> = 0
					<recording_countdown> = 0
				endif
				if (<continue> = 0)
					if ($current_section_array_entry = <recording_section> && $practice_start_time <= (<time> - 50))
						if (<recording_section> < $practice_end_index)
							<recording> = 1
							<recording_text> = qs(0x328a62fb)
							break
						endif
					endif
					if (<section_time> >= <time> && <recording> = 0 && <recording_countdown> = 0)
						if (<recording_section> < $practice_end_index)
							if (<section_time> - <time> <= 10000)
								time_to_format = (<section_time> + 1000)
								format_time_from_seconds time = ((<time_to_format> - <time>) / 1000.0)
								formattext textname = recording_text qs(0x2f96f37c) d = <time_formatted>
								<recording_countdown> = 1
								break
							endif
						endif
					endif
				endif
				<entry> = (<entry> + 1)
				repeat <array_size>
				if (<recording> = 1 || <recording_countdown> = 1)
					if screenelementexists \{id = special_event_recording_textp1}
						setscreenelementprops id = special_event_recording_textp1 text = <recording_text> alpha = 1 unhide
					endif
				else
					if screenelementexists \{id = special_event_recording_textp1}
						setscreenelementprops id = special_event_recording_textp1 text = <recording_text> alpha = 0
					endif
				endif
			endif
		endif
	endif
	getsongtimems
	if (<time> > ($practice_end_time))
		songsetmastervolume \{vol = -100
			time = 0.4}
		if (<time> > (($practice_end_time) + ($song_win_delay * 1000 - 100)))
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

script special_event_show_miss_notes 
	if screenelementexists \{id = special_event_missed_note_textp1}
		if gotparam \{close}
			setscreenelementprops \{id = special_event_missed_note_textp1
				unhide
				text = qs(0xbd725f3d)
				rgba = [
					255
					215
					0
					255
				]
				alpha = 1}
		elseif gotparam \{missed}
			setscreenelementprops \{id = special_event_missed_note_textp1
				unhide
				text = qs(0x21250f96)
				rgba = [
					255
					20
					20
					255
				]
				alpha = 1}
		elseif gotparam \{good}
			setscreenelementprops \{id = special_event_missed_note_textp1
				unhide
				text = qs(0x10e991b1)
				rgba = [
					20
					200
					20
					255
				]
				alpha = 1}
		endif
		wait \{0.52
			seconds}
		special_event_missed_note_textp1 :legacydomorph \{alpha = 0
			time = 1}
	endif
endscript

script practice_loop_song 
	stoprendering
	removeplayerserverfretbariterator \{fretbar_id = createfretbar
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = prefretbarevent
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = fretbarevent
		id = player1_status}
	removeplayerserverfretbariterator \{fretbar_id = createvocalmarker
		id = player1_status}
	clearplayerservermessages
	launchgemevent \{event = kill_objects}
	flushplayerservermessages
	killspawnedscript \{name = guitarevent_missednote}
	killspawnedscript \{name = guitarevent_unnecessarynote}
	killspawnedscript \{name = guitarevent_hitnotes}
	killspawnedscript \{name = guitarevent_hitnote}
	killspawnedscript \{name = guitarevent_starpoweron}
	killspawnedscript \{name = guitarevent_starpoweroff}
	killspawnedscript \{name = guitarevent_starhitnote}
	killspawnedscript \{name = guitarevent_starsequencebonus}
	killspawnedscript \{name = guitarevent_starmissnote}
	killspawnedscript \{name = guitarevent_whammyon}
	killspawnedscript \{name = guitarevent_whammyoff}
	killspawnedscript \{name = guitarevent_starwhammyon}
	killspawnedscript \{name = guitarevent_starwhammyoff}
	killspawnedscript \{name = guitarevent_note_window_open}
	killspawnedscript \{name = guitarevent_note_window_close}
	killspawnedscript \{name = guitarevent_crowd_poor_medium}
	killspawnedscript \{name = guitarevent_crowd_medium_good}
	killspawnedscript \{name = guitarevent_crowd_medium_poor}
	killspawnedscript \{name = guitarevent_crowd_good_medium}
	killspawnedscript \{name = guitarevent_createfirstgem}
	killspawnedscript \{name = highway_pulse_black}
	killspawnedscript \{name = guitarevent_hitnote_spawned}
	killspawnedscript \{name = hit_note_fx}
	killspawnedscript \{name = do_starpower_stagefx}
	killspawnedscript \{name = do_starpower_camera}
	killspawnedscript \{name = first_gem_fx}
	killspawnedscript \{name = gem_iterator}
	killspawnedscript \{name = gem_array_stepper}
	killspawnedscript \{name = gem_array_events}
	killspawnedscript \{name = gem_step}
	killspawnedscript \{name = gem_step_end}
	killspawnedscript \{name = strum_iterator}
	killspawnedscript \{name = fretpos_iterator}
	killspawnedscript \{name = fretfingers_iterator}
	killspawnedscript \{name = drumkit_anim_iterator}
	killspawnedscript \{name = watchforstartplaying_iterator}
	killspawnedscript \{name = faceoff_anim_iterator}
	killspawnedscript \{name = tempo_matching_iterator}
	killspawnedscript \{name = momentcamera_playanim_spawned}
	killspawnedscript \{name = fretbar_update_tempo}
	killspawnedscript \{name = fretbar_update_hammer_on_tolerance}
	killspawnedscript \{name = check_note_hold}
	killspawnedscript \{name = net_check_note_hold}
	killspawnedscript \{name = gem_scroller}
	killspawnedscript \{name = button_checker}
	killspawnedscript \{name = check_buttons}
	notemap_deinit
	reset_score \{player_status = player1_status}
	reset_buffer = 2000
	if (($player1_status.part) = vocals)
		resetvocalhighwayindexes \{player = 1}
		reset_buffer = 4000
	endif
	setslomo \{0.001}
	reset_song_time starttime = ($practice_start_time - <reset_buffer>)
	setarrayelement \{arrayname = currently_holding
		globalarray
		index = 0
		newvalue = 0}
	spawnscriptlater \{update_score_fast
		params = {
			player_status = player1_status
		}}
	spawnscriptnow gem_scroller params = {
		player = 1
		player_status = player1_status
		player_text = 'p1'
		training_mode = 0
		song_name = ($current_song)
		difficulty = ($player1_status.difficulty)
		difficulty2 = ($player2_status.difficulty)
		looping = 1
	}
	if (($player1_status.part) != vocals)
		spawnscriptnow button_checker params = {
			player = 1
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
	spawnscriptnow \{practice_update}
	wait \{1
		gameframe}
	songpause
	setseekposition_song position = ($practice_start_time - <reset_buffer>)
	songunpause
	setslomo \{$current_speedfactor}
	pausegh3
	wait \{1
		gameframe}
	unpausegh3
	startrendering
endscript

script finish_practice_song 
	killspawnedscript \{name = practice_update}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			kill_gem_scroller
			if ($special_event_stage = 1)
				change \{special_event_stage = 2}
			endif
			generic_event_choose \{state = uistate_special_event_win
				no_sound}
		elseif ($current_special_event_num = 2)
			kill_gem_scroller
			create_special_event_win_menu \{check_special_event_and_return}
			reset_special_event \{num = 2}
			generic_event_choose \{state = uistate_special_event_win
				no_sound}
		endif
	else
		generic_event_choose \{state = uistate_song_breakdown
			data = {
				for_practice = 1
			}
			no_sound}
	endif
endscript

script practice_audio_filter 
endscript

script shut_down_practice_mode 
	killspawnedscript \{name = practice_update}
	if ($game_mode = training)
		setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)}}
	endif
endscript
practice_calibrate_speedfactor = 1.0

script practice_calibrate_speedfactor_store 
	change practice_calibrate_speedfactor = ($current_speedfactor)
	change \{current_speedfactor = 1.0}
	setslomo \{1.0}
endscript

script practice_calibrate_restart_song 
	change current_speedfactor = ($practice_calibrate_speedfactor)
	setslomo \{$current_speedfactor}
	practice_restart_song
endscript

script end_practice_song_slomo 
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	change \{structurename = pitchshiftslow1
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
