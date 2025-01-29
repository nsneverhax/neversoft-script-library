
script nt_debug_songlist_choose_script_builder 
	RequireParams \{[
			index
			song_checksum
		]
		all}
	return pad_choose_script = nt_debug_songlist_caller pad_choose_params = {song_name = <song_checksum>}
endscript

script nt_debug_songlist_caller 
	RequireParams \{[
			song_name
		]
		all}
	debug_menu_select_start_song song_name = <song_name>
endscript

script select_nt_debug_drum_fourplay 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = drum}
	setplayerinfo \{2
		part = drum}
	setplayerinfo \{3
		part = drum}
	setplayerinfo \{4
		part = drum}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 1}
	setplayerinfo \{3
		in_game = 1}
	setplayerinfo \{4
		in_game = 1}
	setplayerinfo \{1
		difficulty = easy}
	setplayerinfo \{2
		difficulty = medium}
	setplayerinfo \{3
		difficulty = hard}
	setplayerinfo \{4
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_drum_viewer 
	game_mode = quickplay
	setplayerinfo \{1
		part = drum}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	Camera = 'cameras_debug_drum'
	camera_index = 0
	camera_use_debug = 1
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_turn_on_performance_mode
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
	SpawnScriptNow \{nt_debug_hide_3_drummer}
	debug_launch_cameracut Camera = <Camera> index = <camera_index>
endscript

script select_nt_debug_guitar_fourplay 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{2
		part = guitar}
	setplayerinfo \{3
		part = guitar}
	setplayerinfo \{4
		part = guitar}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 1}
	setplayerinfo \{3
		in_game = 1}
	setplayerinfo \{4
		in_game = 1}
	setplayerinfo \{1
		difficulty = easy}
	setplayerinfo \{2
		difficulty = medium}
	setplayerinfo \{3
		difficulty = hard}
	setplayerinfo \{4
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_bass_fourplay 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = bass}
	setplayerinfo \{2
		part = bass}
	setplayerinfo \{3
		part = bass}
	setplayerinfo \{4
		part = bass}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 1}
	setplayerinfo \{3
		in_game = 1}
	setplayerinfo \{4
		in_game = 1}
	setplayerinfo \{1
		difficulty = easy}
	setplayerinfo \{2
		difficulty = medium}
	setplayerinfo \{3
		difficulty = hard}
	setplayerinfo \{4
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_band_moment_script 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{2
		part = bass}
	setplayerinfo \{3
		part = drum}
	setplayerinfo \{4
		part = vocals}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 1}
	setplayerinfo \{3
		in_game = 1}
	setplayerinfo \{4
		in_game = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{2
		difficulty = expert}
	setplayerinfo \{3
		difficulty = expert}
	setplayerinfo \{4
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	active_band_moment_starpower
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_lightshow_viewer 
	game_mode = quickplay
	Camera = 'cameras_debug_ntlightshow'
	camera_index = 0
	camera_use_debug = 1
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_turn_on_performance_mode
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
	debug_launch_cameracut Camera = <Camera> index = <camera_index>
endscript

script select_nt_debug_guitar_viewer 
	game_mode = quickplay
	Camera = 'cameras_debug_guitar'
	camera_index = 0
	camera_use_debug = 1
	setplayerinfo \{1
		part = guitar}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	venue = load_z_egypt
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_turn_on_performance_mode
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
	SpawnScriptNow \{nt_debug_hide_3_guitarist}
	debug_launch_cameracut Camera = <Camera> index = <camera_index>
endscript

script select_nt_debug_bass_viewer 
	game_mode = quickplay
	Camera = 'cameras_debug_bass'
	camera_index = 0
	camera_use_debug = 1
	setplayerinfo \{1
		part = bass}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_off_bot_instructions
	debug_turn_on_performance_mode
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
	SpawnScriptNow \{nt_debug_hide_3_bassist}
	debug_launch_cameracut Camera = <Camera> index = <camera_index>
endscript

script active_band_moment_starpower 
	wait_until_ingame
	Change \{g_debug_band_moment_starpower = 1}
	begin
	if ($band_moment_temp_mult_time >= 1)
		getnumplayersingame
		getfirstplayer
		printf \{channel = cvance
			qs(0xef76e802)}
		printf \{channel = cvance}
		begin
		getplayerinfo <Player> star_power_used
		getplayerinfo <Player> star_power_amount
		if (<star_power_used> = 0 && <star_power_amount> >= 50.0)
			setplayerinfo <Player> bot_star_power = 1
		endif
		getnextplayer Player = <Player>
		printf \{channel = cvance
			qs(0xcf772e0e)}
		repeat <num_players>
	endif
	Wait \{0.02
		Seconds}
	repeat
endscript

script debug_performance_mode_check 
	if ($g_debug_performance_mode = 1)
		Change \{Cheat_PerformanceMode = 0}
		printf \{channel = cvance
			qs(0xeb9ebfae)}
		Change \{g_debug_performance_mode = 0}
	endif
endscript

script debug_turn_on_performance_mode 
	Change \{g_debug_performance_mode = 1}
	get_savegame_from_controller controller = ($primary_controller)
	cheat_set_playerinfo_or_global cheat_name = Cheat_PerformanceMode state_index = 1 Player = 1 savegame = <savegame> unlock_it
	printf \{channel = cvance
		qs(0x525a32c3)}
endscript

script nt_debug_hide_3_guitarist 
	Change \{g_debug_band_hide = 1}
	begin
	if CompositeObjectExists \{Name = musician1}
		musician1 :Hide
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Hide
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Hide
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Hide
	endif
	if CompositeObjectExists \{Name = GUITARIST}
		get_musician_id \{Name = GUITARIST}
		<Name> :unhide
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script nt_debug_hide_3_bassist 
	Change \{g_debug_band_hide = 1}
	begin
	if CompositeObjectExists \{Name = musician1}
		musician1 :Hide
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Hide
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Hide
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Hide
	endif
	if CompositeObjectExists \{Name = BASSIST}
		get_musician_id \{Name = BASSIST}
		<Name> :unhide
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script nt_debug_hide_3_drummer 
	Change \{g_debug_band_hide = 1}
	begin
	if CompositeObjectExists \{Name = musician1}
		musician1 :Hide
	endif
	if CompositeObjectExists \{Name = musician2}
		musician2 :Hide
	endif
	if CompositeObjectExists \{Name = musician3}
		musician3 :Hide
	endif
	if CompositeObjectExists \{Name = musician4}
		musician4 :Hide
	endif
	if CompositeObjectExists \{Name = drummer}
		get_musician_id \{Name = drummer}
		<Name> :unhide
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script nt_debug_unhide_band 
	if ($g_debug_band_hide = 1)
		KillSpawnedScript \{Name = nt_debug_hide_3_drummer}
		KillSpawnedScript \{Name = nt_debug_hide_3_bassist}
		KillSpawnedScript \{Name = nt_debug_hide_3_guitarist}
	endif
endscript

script select_nt_debug_vocals_static 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo \{1
		vocals_highway_view = static}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_vocals_karaoke 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo \{1
		vocals_highway_view = karaoke}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	setplayerinfo \{1
		difficulty = expert}
	debug_performance_mode_check
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_nt_debug_vocals_scrolling 
	Change \{game_mode = quickplay}
	setplayerinfo \{1
		part = vocals}
	setplayerinfo \{1
		vocals_highway_view = scrolling}
	setplayerinfo \{1
		in_game = 1}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{1
		bot_play = 1}
	debug_performance_mode_check
	debug_menu_turn_on_show_measures
	nt_debug_unhide_band
endscript

script select_debug_vocal_highway_scrolling 
	restart_gem_scroller
	setplayerinfo \{1
		vocals_highway_view = scrolling}
	debug_menu_select_start_song
endscript

script select_debug_vocal_highway_static 
	restart_gem_scroller
	setplayerinfo \{1
		vocals_highway_view = static}
	debug_menu_select_start_song
endscript

script select_debug_vocal_highway_karaoke 
	restart_gem_scroller
	setplayerinfo \{1
		vocals_highway_view = karaoke}
	debug_menu_select_start_song
endscript
