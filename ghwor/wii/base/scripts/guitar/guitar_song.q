song_is_waiting_to_start = 0

script songaudioplay \{slot = 0}
	if NOT ($current_song_qpak = jamsession)
		sap_play
	endif
	if ($quickplay_whammy_rewind_enable = 1)
		spawnscript \{quickplay_whammy_rewind}
	endif
	UpdateGuitarVolume
	Change \{song_is_waiting_to_start = 0}
endscript

script songaudiostop \{song_failed_pitch_streams = 0
		callback = None
		should_keep_cached_song = FALSE}
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		if (<should_keep_cached_song> = FALSE)
			if (sdcardmanagerfunc func = has_cached_song)
				sd_unload_song
			endif
		endif
		sap_stop
		sap_unload noWait callback = <callback>
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		SpawnScriptNow \{Failed_Song_Pitch_Down}
	endif
	Change \{song_is_waiting_to_start = 0}
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	sap_setpitch \{pitch = -8
		time = 3}
	sap_setmastervolume \{vol = -20
		time = 3}
	Change \{Waiting_For_Pitching = 1}
	Wait \{3
		Seconds}
	SpawnScriptNow \{songaudiostop
		params = {
			should_keep_cached_song = true
		}}
endscript

script songaudioseek \{position = 0
		callback = None}
	if sap_isloaded
		get_song_seek_lock
		printf \{'wait for song initialized'}
		waitforsonginitialized slot = <slot>
		sap_seek time = <position> callback = <callback>
		sap_getseeklag time = <position>
		Change wii_seek_lag = <seek_lag>
		waitforsonginitialized slot = <slot>
		printf \{'Done waiting'}
		release_song_seek_lock
		return \{true}
	endif
	return \{FALSE}
endscript

script songaudiosetwhammy 
	sap_setplayerwhammy Player = <Player> whammy_value = (1 - (<control> * 0.057))
endscript

script pauseaudio 
	lockdsp
	gamemode_gettype
	PauseSoundsByBuss \{Master}
	if (<Type> = freeplay)
		if GotParam \{do_not_pause_front_end_buss}
			UnpauseSoundsByBuss \{Front_End}
		endif
	endif
	sap_pause
	muteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{mute_all}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	GetSongTimeMs
	CastToInteger \{time}
	gamemode_gettype
	if (<Type> = practice)
		if (<time> < $practice_start_time || <time> > $practice_end_time)
			<no_seek> = 1
		endif
	elseif (<Type> = tutorial)
		<no_seek> = 1
	endif
	if NOT GotParam \{no_seek}
		if (<time> > 750 && <time> < $current_endtime)
			if NOT GotParam \{seek_on_unpause}
				<saved_time> = <time>
				sap_getaudiolength
				<end_time> = <time>
				<time> = <saved_time>
				if (<time> < <end_time>)
					if songaudioseek position = <time> callback = songaudio_seekdone
						Change \{songaudio_waitingforseek = 1}
					else
						Change \{songaudio_waitingforseek = 0}
					endif
				endif
			endif
		endif
	endif
	unlockdsp
endscript
songaudio_waitingforseek = 0

script songaudio_seekdone 
	Change \{songaudio_waitingforseek = 0}
endscript

script waitforaudioseek 
	begin
	if ($songaudio_waitingforseek = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script unpauseaudio 
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	can_unpause = 1
	if ($song_is_waiting_to_start = 1)
		can_unpause = 0
	endif
	gamemode_gettype
	if (<Type> = practice)
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> < $practice_start_time || <time> > $practice_end_time)
			RemoveParameter \{seek_on_unpause}
			can_unpause = 0
		endif
	elseif (<Type> = tutorial)
		RemoveParameter \{seek_on_unpause}
	endif
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if GotParam \{seek_on_unpause}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> > 750 && <time> < $current_endtime)
			if songaudioseek position = <time> callback = songaudio_seekdone
				Change \{songaudio_waitingforseek = 1}
			else
				Change \{songaudio_waitingforseek = 0}
			endif
		endif
	endif
	waitforaudioseek
	lockdsp
	if (<can_unpause> = 1)
		sap_unpause
	endif
	UnpauseSoundsByBuss \{Master}
	unlockdsp
endscript

script songaudioinit \{callback = None}
	mode = $game_mode
	speed = ($current_speedfactor)
	sap_init <...> callback = <callback> noWait
endscript

script songaudiodeinit \{callback = None}
	sap_unload \{noWait}
	sap_deinit callback = <callback>
	setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
endscript

script getsongaudioinfo 
	RequireParams \{[
			song_name
		]
		all}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	stream_name = <song_prefix>
	if StructureContains structure = <song_struct> streamname
		stream_name = (<song_struct>.streamname)
	endif
	if ($calibrate_lag_enabled = 1)
		return song_stream_name = <stream_name> song_volume = ((<song_struct>.overall_song_volume) - 6)
	else
		return song_stream_name = <stream_name> song_volume = (<song_struct>.overall_song_volume)
	endif
endscript

script songaudioload \{starttime = 0
		fadeintime = 0.0
		callback = None}
	setscriptcannotpause
	printf \{qs(0x2dda7263)}
	adjustedtime = <starttime>
	printf qs(0xd4f5c87b) s = <song_name>
	getsongaudioinfo song_name = <song_name>
	SoundBussUnlock \{band_Balance}
	if StructureContains structure = <song_struct> Name = band_playback_volume
		setsoundbussparams {band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {band_Balance = {vol = -1.5}} time = <fadeinttime>
	endif
	SoundBussLock \{band_Balance}
	if StructureContains structure = <song_struct> overall_song_volume
		sap_setmastervolume vol = (<song_struct>.overall_song_volume)
	endif
	if NOT is_current_song_a_jam_session
		if songfileexists FileName = <song_stream_name>
			get_song_seek_lock
			sap_load FileName = <song_stream_name> vol = <song_volume>
			release_song_seek_lock
			Change \{wii_seek_lag = 0}
		endif
	endif
	Change \{song_is_waiting_to_start = 1}
	printf qs(0x341f4698) s = <starttime>
	if (<starttime> > 0)
		sap_seek time = <starttime>
	endif
	return adjustedtime = <adjustedtime>
endscript

script songaudiosetupdsp 
	playlist_getcurrentsong
	song_name = <current_song>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	getnumplayersingame
	getnumplayersingame \{on_screen}
	if (<num_players_shown> < <num_players>)
		<num_players> = <num_players_shown>
	endif
	mono_drums = 0
	if StructureContains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	if StructureContains structure = <song_struct> fake_bass_mode
		fake_bass_mode = (<song_struct>.fake_bass_mode)
	endif
	sap_setupplayerdsp <...>
	playlist_getcurrentsong
	song = <current_song>
	gamemode_gettype
	if NOT ($game_mode = practice)
		if NOT (<song> = jamsession)
			audio_effects_reset_to_current_snapshot
		else
			setsoundbussparams {Crowd = {vol = (($game_bussset.Crowd.vol))} time = 0.02}
		endif
		setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
	else
		Change \{g_current_music_dsp_snapshot_setting = 'game'}
		audio_effects_reset_to_current_snapshot
	endif
	if NOT (<song> = jamsession)
		if NOT musicstudio_mainobj :musicstudio_isplayingsongingame
			if (<Type> != freeplay)
				audio_freeplay_music_and_crowd_transitions \{params = {
						transition = 'Setlist_To_Game'
					}}
			endif
		endif
	endif
	if localgameincludesabassist
		if NOT isngc
			if NOT (<song> = jamsession)
				setsoundbusseffects \{effects = [
						{
							Name = bass_eq
							effect = ParamEQ
							center = 100
							bandwidth = 1
							gain = 0.8
						}
					]
					time = 0.2}
				Change \{g_current_eq_bass_gain = 0.8}
			endif
		endif
		printdspsettingsonscreen
	else
	endif
endscript
dspsettings_printtoscreen = 0

script printdspsettingsonscreen 
endscript

script localgameincludesabassist 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		if playerinfoequals <Player> part = bass
			if (<Type> != freeplay)
				return \{true}
			else
				getplayerinfo <Player> freeplay_state
				if (<freeplay_state> != dropped && <freeplay_state> != joining)
					return \{true}
				endif
			endif
		endif
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	return \{FALSE}
endscript

script begin_jam_song \{Pause = 0}
	GetSongTimeMs
	CastToInteger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	playback_custom_song start_time = <time> in_game = 1
	musicstudio_init_volumes
	jam_init_reverb
	musicstudio_init_pan
	musicstudio_init_all_line6_effects
	SpawnScriptNow \{jam_input_whammy_spawned
		id = jam_input_spawns}
	Change \{song_is_waiting_to_start = 0}
endscript
last_performance_time = 0.0
last_performance_time_ms = 0.0

script waitforsonginitialized \{slot = 0}
	begin
	printf \{'waiting'}
	if sap_isinitialized slot = <slot>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
g_song_seeking_now = 0

script get_song_seek_lock 
	if ($g_song_seeking_now = 0)
		Change \{g_song_seeking_now = 1}
		return \{true}
	else
		if NOT GotParam \{no_assert}
			ScriptAssert \{'Failed to get song seek lock'}
		endif
		return \{FALSE}
	endif
endscript

script release_song_seek_lock 
	if ($g_song_seeking_now = 0)
		ScriptAssert \{'Attempt to release song seek lock when you do not have it!'}
	endif
	Change \{g_song_seeking_now = 0}
endscript
