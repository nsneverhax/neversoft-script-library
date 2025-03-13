
script goal_custom_song_init 
	printf \{channel = minigame
		qs(0xe425a7f0)}
	printstruct channel = minigame <...>
endscript

script goal_custom_song_load \{skip_instrument_load = 0}
	printf \{channel = minigame
		qs(0xe8ef408f)}
	printstruct channel = minigame <...>
	if (<skip_instrument_load> = 0)
		create_loading_screen
	endif
	loadjam file_name = <file_name>
	stop_custom_song
	musicstudio_initialize_song skip_instrument_load = <skip_instrument_load>
	printf channel = minigame qs(0xfaef7bb0) s = ($jam_current_bpm)
	destroy_loading_screen
	broadcastevent \{type = goal_custom_song_load_complete}
endscript

script goal_custom_song_play 
	printf \{channel = minigame
		qs(0xba037a59)}
	printstruct channel = minigame <...>
	stop_custom_song
	playback_custom_song start_time = <start_time_ms> in_game = 1
endscript

script goal_custom_song_stop 
	printf \{channel = minigame
		qs(0xea143136)}
	printstruct channel = minigame <...>
	stop_custom_song
endscript

script goal_custom_song_deinit 
	printf \{channel = minigame
		qs(0xdcba745b)}
	printstruct channel = minigame <...>
	goal_custom_song_stop
endscript
