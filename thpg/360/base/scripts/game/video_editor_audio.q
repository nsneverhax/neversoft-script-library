ve_playing_music = not_playing
ve_music_paused = 0

script ve_play_music_track \{start = 0.0}
	printf \{'ve_play_music_track'}
	if NOT ($ve_playing_music = not_playing)
		ve_stop_music_track asset = ($ve_playing_music)
	endif
	if ve_is_music_busy
		printf \{'Cant play music, already busy'}
		return
	endif
	ve_play_music_track_worker <...>
endscript

script ve_play_music_track_worker 
	printf 've_play_music_track_worker'
	if ($ve_editing_buss_pushed = 1)
		scriptassert 'Editing buss is pushed, please pop it first'
	endif
	printpushpopdebuginfo push name = "video editor push"
	pushsoundbussparams
	setsoundbussparams $Video_Editor_Playing_BussSet time = 0.0
	change ve_playing_music = <asset>
	PlayListPause pause = 1
	if ve_get_playlist_track_from_asset asset = <asset>
		cap_length = ((<track>.length) + 50.0)
		if (<start> > <cap_length>)
			start = <cap_length>
		endif
		start = (<start> * 1000.0)
		casttointeger start
		preloadstream <asset> buss = playlist
		audio_track_id = <unique_id>
		change ve_playing_music = <audio_track_id>
		begin
		if preloadstreamdone <audio_track_id>
			wait 1 gameframe
			break
		endif
		wait 1 gameframe
		printf "Waiting for preload %s" s = <asset>
		repeat
		startpreloadedstream <audio_track_id> startpaused = 1 buss = playlist
		setsoundseekposition unique_id = <audio_track_id> position = <start>
		lockdsp
		pausesound unique_id = <audio_track_id> pause = 0
		unlockdsp
	endif
endscript

script ve_is_music_busy 
	if scriptisrunning \{ve_play_music_track_worker}
		return \{true}
	endif
	if scriptisrunning \{ve_stop_music_track_worker}
		return \{true}
	endif
	return \{false}
endscript

script ve_wait_for_music 
	if ve_is_music_busy
		begin
		if NOT ve_is_music_busy
			break
		endif
		wait \{1
			gameframe}
		printf \{"ve_wait_for_music - Waiting for play script to finish..."}
		unpausespawnedscript \{ve_play_music_track_worker}
		unpausespawnedscript \{ve_stop_music_track_worker}
		repeat
	endif
endscript

script ve_stop_music_track 
	ve_wait_for_music
	ve_stop_music_track_worker <...>
endscript

script ve_stop_music_track_worker 
	if ($ve_playing_music = not_playing)
		return
	endif
	if ($ve_music_paused = 1)
		change \{ve_music_paused = 0}
	endif
	printf \{'ve_stop_music_track_worker'}
	stopstream unique_id = ($ve_playing_music)
	printpushpopdebuginfo \{pop
		name = "video editor pop"}
	popsoundbussparams \{time = 0.0}
	PlayListPause \{pause = 0}
	change \{ve_playing_music = not_playing}
endscript

script ve_pause_music 
	if ($ve_music_paused = <pause>)
		return
	endif
	if NOT ($ve_playing_music = not_playing)
		pausesound unique_id = ($ve_playing_music) pause = <pause>
	endif
	change ve_music_paused = <pause>
endscript

script ve_get_playlist_track_from_asset 
	getarraysize $playlist_tracks
	i = 0
	begin
	track = ($playlist_tracks [<i>])
	if ((<track>.asset) = <asset>)
		length_mins = ((<track>.nextsongstart) / 100)
		casttointeger length_mins
		length_secs = ((<track>.nextsongstart) - (<length_mins> * 100))
		length = ((<length_mins> * 60) + (<length_secs>))
		return true track = {<track> length = <length>}
	endif
	i = (<i> + 1)
	repeat <array_size>
	return false
endscript

script ve_play_audio_clip_start 
	if NOT VideoClipSlotFunc is_clip_loaded name = <name>
		VideoClipSlotFunc copy_audio_from_skater_buffer object = <object>
	else
		VideoClipSlotFunc use_audio_buffer name = <name> object = <object>
	endif
	pitch = ((1.0 - <speed>) * -20.0)
	casttointeger \{pitch}
	setsoundbussparams {ingame = {pitch = <pitch>}}
	<object> :playbacksoundrecording
	<object> :seeksoundrecording seconds = <time>
endscript

script ve_play_audio_clip_update 
	if (ve_playback_paused = 0)
		<object> :playbacksoundframe seconds = <time>
	endif
endscript

script ve_play_audio_clip_end 
	<object> :stopplaybacksoundrecording
	setsoundbussparams \{ingame = {
			pitch = 0
		}}
endscript
ve_editing_buss_pushed = 0

script ve_push_editing_buss 
	ve_wait_for_music
	if NOT ($ve_playing_music = not_playing)
	endif
	if ($ve_editing_buss_pushed = 0)
		change ve_editing_buss_pushed = 1
		printf 've_push_editing_buss - Pushing'
		printscriptinfo
		printpushpopdebuginfo push name = "video editor editing push"
		pushsoundbussparams
		setsoundbussparams $default_bussset $Video_Editor_BussSet time = 0.0
	else
		printf 've_push_editing_buss - Already pushed'
	endif
endscript

script ve_pop_editing_buss 
	ve_wait_for_music
	if ($ve_editing_buss_pushed = 1)
		change \{ve_editing_buss_pushed = 0}
		printf \{'ve_pop_editing_buss - Popping'}
		printscriptinfo
		printpushpopdebuginfo \{pop
			name = "video editor editing pop"}
		popsoundbussparams \{time = 0.0}
	else
		printf \{'ve_pop_editing_buss - Already popped'}
	endif
endscript
