stream_config = gh1
song_is_waiting_to_start = 0

script initsongaudiosystem 
	printf \{qs(0x2ec92d28)}
	mode = $game_mode
	speed = ($current_speedfactor)
	songaudioplayerinit <...>
endscript

script deinitsongaudiosystem \{no_script_wait = 0}
	printf \{qs(0x498dcb03)}
	if (<no_script_wait> = 1)
		songunload \{noWait
			slot = 0}
		songunload \{noWait
			slot = 1}
	else
		songunload \{slot = 0}
		songunload \{slot = 1}
	endif
	setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
	songaudioplayerdeinit
endscript

script setupsongdsp 
	printf \{qs(0x21fc77d4)}
	gman_songfunc \{func = get_current_song}
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
	songsetupplayerdsp <...>
	gman_songfunc \{func = get_current_song}
	song = <current_song>
	gamemode_gettype
	if NOT ($game_mode = practice)
		printf \{channel = sfx
			qs(0xe39f244f)}
		if NOT (<song> = jamsession)
			reset_to_current_snapshot
		endif
		setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
	else
		Change \{current_music_dsp_snapshot_setting = 'game'}
		reset_to_current_snapshot
	endif
	if (<song> != jamsession)
		if NOT musicstudio_mainobj :musicstudio_isplayingsongingame
			if (<Type> != freeplay)
				printf \{channel = sfx
					qs(0xca7fda07)}
				freeplay_music_crowd_transitions \{params = {
						transition = 'Setlist_To_Game'
					}}
			endif
		endif
	endif
	if localgameincludesabassist
		printf \{channel = sfx
			qs(0x8ae80b4c)}
		printf \{channel = sfx
			'SETTING BASS EQ SINCE A BASS PLAYER IS PLAYING'}
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
			Change \{current_eq_bass_gain = 0.8}
		endif
		printdspsettingsonscreen
	else
		printf \{channel = sfx
			qs(0x461089eb)}
	endif
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

script preload_song \{starttime = 0
		fadeintime = 0.0
		slot = 0}
	printscriptinfo \{qs(0x2e9fb54c)}
	adjustedtime = <starttime>
	printf qs(0xd4f5c87b) s = <song_name>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	SoundBussUnlock \{band_Balance}
	if StructureContains structure = <song_struct> Name = band_playback_volume
		setsoundbussparams {band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {band_Balance = {vol = -1.5}} time = <fadeinttime>
	endif
	SoundBussLock \{band_Balance}
	if StructureContains structure = <song_struct> overall_song_volume
		songsetmastervolume vol = (<song_struct>.overall_song_volume)
	endif
	if NOT is_current_song_a_jam_session
		if songfileexists FileName = <song_prefix>
			get_song_seek_lock
			songload FileName = <song_prefix> slot = <slot>
			release_song_seek_lock
			Change \{wii_seek_lag = 0}
		endif
	endif
	Change \{song_is_waiting_to_start = 1}
	if (<starttime> > 0)
		SetSeekPosition_Song position = <starttime> slot = <slot>
	endif
	return adjustedtime = <adjustedtime>
endscript

script songsetplayereqsettings 
endscript

script waitforseek_song 
	ScriptAssert \{'waitforseek_song: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script setslomo_song 
	songsetpitch pitch_percent = (<slomo> * 100.0)
endscript

script startpreloadpaused_song \{slot = -1}
	songplay slot = <slot>
endscript

script begin_song \{Pause = 0
		slot = 0}
	enableperformancedof
	startpreloadpaused_song slot = <slot>
	UpdateGuitarVolume
	if NOT ($current_song_qpak = jamsession)
		if (<Pause> = 0)
			songunpause slot = <slot>
		else
			songpause slot = <slot>
		endif
	endif
	Change \{song_is_waiting_to_start = 0}
	enablemic
endscript
g_song_seeking_now = 0

script is_song_seek_lock 
	if ($g_song_seeking_now = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

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

script block_song_seek_lock 
	begin
	if ($g_song_seeking_now = 0)
		break
	else
		WaitOneGameFrame
	endif
	repeat
endscript

script assert_song_seek_lock 
	if ($g_song_seeking_now = 1)
		ScriptAssert \{'Song seek lock is currently taken!'}
	endif
endscript

script require_song_seek_lock 
	if ($g_song_seeking_now = 0)
		ScriptAssert \{'This function needs to be called when the lock is taken.'}
	endif
endscript

script SetSeekPosition_Song \{position = 0
		slot = 0}
	get_song_seek_lock
	printf \{qs(0x699cbcf4)}
	waitforsonginitialized slot = <slot>
	songseek time = <position> slot = <slot>
	songgetseeklag time = <position>
	Change wii_seek_lag = <seek_lag>
	waitforsonginitialized slot = <slot>
	release_song_seek_lock
endscript

script waitforsonginitialized \{slot = 0}
	begin
	printf \{'waiting'}
	if songisinitialized slot = <slot>
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{'Done waiting'}
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	songsetpitch \{pitch = -8
		time = 3}
	songsetmastervolume \{vol = -20
		time = 3}
	Change \{Waiting_For_Pitching = 1}
	Wait \{3
		Seconds}
	SpawnScriptNow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0
		slot = -1}
	disablemic
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		songstop slot = <slot>
		if ($current_song_qpak = jamsession)
			if notetracker_is_using_stream
				end_mp3_song
			endif
		endif
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		SpawnScriptNow \{Failed_Song_Pitch_Down}
	endif
endscript

script set_whammy_pitchshift 
	songsetplayerwhammy Player = <Player> whammy_value = (1 - (<control> * 0.057))
endscript

script PauseGh3Sounds 
	lockdsp
	songpause
	PauseSoundsByBuss \{Master}
	unlockdsp
endscript

script UnPauseGh3Sounds 
	lockdsp
	songunpause
	UnpauseSoundsByBuss \{Master}
	unlockdsp
endscript

script begin_jam_song \{Pause = 0}
	GetSongTimeMs
	CastToInteger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	if NOT notetracker_is_using_stream
		playback_custom_song start_time = <time> in_game = 1
	endif
	musicstudio_init_volumes
	jam_init_reverb
	musicstudio_init_pan
	musicstudio_init_all_line6_effects
	SpawnScriptNow \{jam_input_whammy_spawned
		id = jam_input_spawns}
	Change \{song_is_waiting_to_start = 0}
endscript
