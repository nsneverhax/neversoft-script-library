g_career_movie_stream = none

script ui_create_career_movie \{device_num = !i1768515945
		new_state = !q1768515945
		new_data = 0x69696969
		movie = 0x69696969
		stream = 'none'}
	setscriptcannotpause
	destroy_band
	destroy_friend_feed
	if console_is_net_career_client
		<career_first_time_setup> = ($g_net_career_progression.career_progression_tags.career_first_time_setup)
	else
		getglobaltags career_progression_tags params = career_first_time_setup controller = <device_num>
	endif
	spawn_player_drop_listeners \{drop_player_script = career_movie_drop_player
		end_game_script = career_movie_end_game}
	startrendering
	hide_glitch \{num_frames = 20}
	lightshow_notingameplay_setmood \{mood = menu}
	play_cameracut \{prefix = 'cameras_no_band'
		transition_time = 0}
	spawnscriptnow {
		ui_career_movie_play_movie_spawned
		params = {
			movie = <movie>
			new_state = <new_state>
			new_data = <new_data>
			stream = <stream>
		}
	}
endscript

script ui_destroy_career_movie 
endscript

script ui_init_career_movie 
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change \{respond_to_signin_changed_func = none}
	killspawnedscript \{name = persistent_band_cancel_lobby}
endscript

script ui_deinit_career_movie 
endscript

script ui_career_movie_preload_stream \{stream = 'none'}
	if (<stream> != 'none')
		tutorial_system_get_language_prefix
		formattext checksumname = localized_stream '%l_%s' l = <language_prefix> s = <stream> addtostringlookup = true
		preloadstream <localized_stream>
		change g_career_movie_stream = <unique_id>
		begin
		if preloadstreamdone \{$g_career_movie_stream}
			printf \{qs(0xdacf95fa)
				s = $g_career_movie_stream}
			break
		endif
		printf \{qs(0x173d455d)
			s = $g_career_movie_stream}
		wait \{1
			gameframe}
		repeat
	endif
endscript

script ui_career_movie_play_movie_spawned \{movie = 0x69696969
		new_state = !q1768515945
		new_data = 0x69696969
		stream = 'none'}
	setscriptcannotpause
	pushunsafeforshutdown \{context = ui_career_movie_play_movie_spawned}
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 100}
	if (<stream> != 'none')
		ui_career_movie_preload_stream stream = <stream>
	endif
	if ($g_career_movie_stream != none)
		printf \{qs(0xb15638bb)
			s = $g_career_movie_stream}
		startpreloadedstream \{$g_career_movie_stream
			buss = encore_events
			forcesafepreload = 1
			vol = 0.0}
	endif
	destroy_song_and_musicstudio_heaps \{do_unloads}
	setbinkheap \{heap_cas_cache}
	playmovieandwait movie = <movie> noblack hide_glitch_frames = 4
	setbinkheap \{heap_bink}
	create_song_and_musicstudio_heaps
	stopsound unique_id = ($g_career_movie_stream) fade_time = 0.1 fade_type = linear
	change \{g_career_movie_stream = none}
	fadetoblack \{off
		time = 0}
	popunsafeforshutdown \{context = ui_career_movie_play_movie_spawned}
	killspawnedscript \{name = net_career_flip_save_warning_flag}
	spawnscriptnow \{net_career_flip_save_warning_flag}
	ui_event_wait event = menu_replace data = {state = <new_state> <new_data>}
endscript

script career_movie_drop_player 
	band_lobby_drop_player <...>
endscript

script career_movie_end_game 
	wait_for_safe_shutdown
	band_lobby_end_game <...>
endscript
