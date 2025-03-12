came_to_practice_from = main_menu

script practice_start_song \{device_num = 0}
	change \{game_mode = practice}
	change \{current_transition = practice}
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
	resetscoreupdateready
	spawnscriptnow practice_restart_song_spawned params = {generic_params = <generic_params>}
endscript

script practice_restart_song_spawned \{generic_params = {
		}}
	setscriptcannotpause
	hide_glitch \{num_frames = 20}
	change \{game_mode = practice}
	change \{current_transition = practice}
	setup_practice_mode
	generic_event_back state = uistate_gameplay <generic_params>
	restart_song practice_intro = 1 starttime = ($practice_start_time) endtime = ($practice_end_time)
	killspawnedscript \{name = practice_update}
	if scriptisrunning \{kill_gem_scroller}
		block \{type = kill_gem_scroller_done}
	endif
	spawnscriptnow \{practice_update}
endscript

script practice_pausesong 
	setscriptcannotpause
	songsetmastervolume \{vol = 0
		time = 0.1}
	wait \{0.1
		seconds}
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
	getsongtimems
	song_time_ms = <time>
	songgetaudiolength
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
		songsetmastervolume \{vol = -100
			time = 0.4}
		if (<song_time_ms> > (($practice_end_time) + ($song_win_delay * 1000 - 100)))
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
	getplayerinfo <player> server_id
	removeplayerserverfretbariterator fretbar_id = createfretbar id = <server_id>
	removeplayerserverfretbariterator fretbar_id = prefretbarevent id = <server_id>
	removeplayerserverfretbariterator fretbar_id = fretbarevent id = <server_id>
	removeplayerserverfretbariterator fretbar_id = createvocalmarker id = <server_id>
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
	killspawnedscript \{name = watchforstartplaying_iterator}
	killspawnedscript \{name = drumcontrolscript_iterator}
	killspawnedscript \{name = drummer_controlscript}
	killspawnedscript \{name = tempo_matching_iterator}
	killspawnedscript \{name = momentcamera_playanim_spawned}
	killspawnedscript \{name = fretbar_update_tempo}
	killspawnedscript \{name = fretbar_update_hammer_on_tolerance}
	killspawnedscript \{name = gem_scroller}
	killspawnedscript \{name = button_checker}
	killspawnedscript \{name = check_buttons}
	killspawnedscript \{name = update_score_fast}
	killspawnedscript \{name = event_iterator}
	notemap_deinit
	destroy_allwhammyfx
endscript

script practice_restart_gem_scroller 
	setarrayelement \{arrayname = currently_holding
		globalarray
		index = 0
		newvalue = 0}
	gman_songtool_getcurrentsong
	spawnscriptnow gem_scroller params = {
		player = <player>
		difficulty = <difficulty>
		song_name = <current_song>
		looping = 1
	}
	launch_fill_array_iterator song = <current_song>
	if NOT playerinfoequals <player> part = vocals
		spawnscriptnow button_checker params = {
			player = <player>
			difficulty = <difficulty>
			song_name = <current_song>
			looping = 1
		}
	endif
endscript

script practice_loop_song 
	setscriptcannotpause
	setbuttoneventmappings \{block_menu_input}
	getfirstplayer
	fade_out_time = 0.66
	wait_out_time = (<fade_out_time> * 2)
	practice_fade_out player = <player> time = <fade_out_time>
	wait (<fade_out_time>) seconds ignoreslomo
	current_percentage = ($practice_current_percentage)
	change \{practice_current_percentage = 0}
	practice_update_percentage_meter
	killspawnedscript \{name = practicemode_section}
	practice_kill_gem_scroller player = <player>
	reset_score player = <player>
	change \{current_section_array_entry = 0}
	get_lag_values
	transition_lag_offset = (0 - <video_offset> - <audio_offset>)
	transition_time = 4000
	practice_starttime = ($practice_start_time - <transition_time> - <transition_lag_offset>)
	if playerinfoequals <player> part = vocals
		resetvocalhighwayindexes player = <player>
		transition_time = 4000
	endif
	setslomo \{0.001}
	reset_song_time starttime = <practice_starttime>
	if playerinfoequals <player> part = drum
		resetdrumfills player = <player>
	endif
	spawnscriptlater update_score_fast params = {player = <player>}
	getplayerinfo <player> difficulty
	practice_setup_notemappings
	gman_songtool_getcurrentsong
	loaddrumkitall song = <current_song>
	practice_restart_gem_scroller player = <player> difficulty = <difficulty>
	spawnscriptnow \{practicemode_section}
	calc_songscoreinfo player = <player>
	spawnscriptnow \{practice_update}
	wait \{1
		gameframe}
	playersetvolume player = <player> volume = 100
	songpause
	setseekposition_song \{position = $practice_start_time}
	setslomo ($current_speedfactor)
	songsetmastervolume \{vol = 0
		time = 0.4}
	spawnscriptnow \{begin_song_after_intro
		params = {
			starttimeafterintro = $practice_start_time
		}}
	wait (<fade_out_time>) seconds ignoreslomo
	practice_fade_in player = <player> time = <fade_out_time> current_percentage = <current_percentage>
	setbuttoneventmappings \{unblock_menu_input}
endscript

script finish_practice_song 
	killspawnedscript \{name = practice_update}
	generic_event_choose \{state = uistate_song_breakdown
		data = {
			for_practice = 1
		}
		no_sound}
endscript

script practice_audio_filter 
endscript

script practice_mode_setup_sounds 
	setsoundbussparams \{crowd = {
			vol = -100
		}
		time = 2}
endscript

script setup_practice_mode 
	change \{disable_crowd = 1}
	change \{practice_enabled = 1}
endscript

script kill_practice_scripts 
	killspawnedscript \{name = practice_update}
	killspawnedscript \{name = practice_restart_gem_scroller}
	killspawnedscript \{name = practice_loop_song}
endscript

script shut_down_practice_mode 
	kill_practice_scripts
	getfirstplayer
	practice_kill_gem_scroller player = <player>
	change \{disable_crowd = 0}
	change \{practice_enabled = 0}
	if ($game_mode = practice)
		setsoundbussparams {crowd = {vol = ($default_bussset.crowd.vol)} time = 1}
	endif
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

script practice_fade_out 
	wait \{1
		gameframe}
	formattext checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	formattext checksumname = highway_2d_container 'Highway_2Dp%p' p = <player>
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <right_ns_id> alpha = 0 time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 0 time = <time>
	safe_screenelement_fade id = <highway_2d_container> rgba = [0 0 0 255] time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 0 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 0 time = <time>
endscript

script practice_fade_in 
	wait \{1
		gameframe}
	formattext checksumname = fretbar_container_name 'fretbar_containerp%p' p = <player>
	formattext checksumname = highway_2d_container 'Highway_2Dp%p' p = <player>
	formattext checksumname = right_ns_id 'sidebar_right_ns_meterp%p' p = <player>
	safe_screenelement_fade id = <highway_2d_container> rgba = [255 255 255 255] time = <time>
	safe_screenelement_fade id = <fretbar_container_name> alpha = 1 time = <time>
	safe_screenelement_fade id = <right_ns_id> alpha = 1 time = <time>
	safe_screenelement_fade id = practice_sectionpercentagetext alpha = 1 time = <time>
	if screenelementexists \{id = practice_sectionpercentagetext_highest}
		if (<current_percentage> > $practice_highest_percentage)
			change practice_highest_percentage = <current_percentage>
			formattext textname = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
			practice_sectionpercentagetext_highest :se_setprops text = <percentage_text>
		endif
	endif
	if ($practice_highest_percentage > 0)
		safe_screenelement_fade id = practice_sectionpercentagetext_highest alpha = 1 time = <time>
	endif
endscript

script safe_screenelement_fade 
	if screenelementexists id = <id>
		<id> :se_setprops <...>
	endif
endscript

script practice_update_percentage_meter 
	getfirstplayer
	getplayerinfo <player> max_notes
	getplayerinfo <player> notes_hit
	getplayerinfo <player> part
	if (<part> = vocals)
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		notes_hit = <vocal_phrase_quality>
		max_notes = <vocal_phrase_max_qual>
	endif
	if (<max_notes> > 0)
		max_notes = (<max_notes> * 1.0)
		percentage = ((<notes_hit> / <max_notes>) * 100)
		casttointeger \{percentage}
		if (<percentage> != $practice_current_percentage)
			change practice_current_percentage = <percentage>
			if screenelementexists \{id = practice_sectionpercentagetext}
				formattext textname = percentage_text qs(0x720688b0) d = <percentage>
				practice_sectionpercentagetext :se_setprops text = <percentage_text>
			endif
			if (<percentage> > $practice_highest_percentage)
				change practice_highest_percentage = <percentage>
				formattext textname = percentage_text qs(0x720688b0) d = ($practice_highest_percentage)
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
