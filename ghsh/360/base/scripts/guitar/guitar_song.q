stream_config = gh1
song_is_waiting_to_start = 0

script preload_song \{starttime = 0
		fadeintime = 0.0
		Seek = 1}
	printf qs(0x74e073e7) s = <song_name>
	wait_for_songpreview_monitor
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> dlc_stream_name
		song_prefix = (<song_struct>.dlc_stream_name)
	endif
	if songcheckifdownloaded FileName = <song_prefix>
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			return \{FALSE}
		endif
	endif
	if NOT songload FileName = <song_prefix> content_index = <content_index>
		if NOT CD
			ScriptAssert 'Failed to load song: %s' s = <song_prefix>
		endif
		destroy_loading_screen
		DownloadContentLost
		return \{FALSE}
	endif
	Change \{song_is_waiting_to_start = 1}
	if (<Seek> = 1)
		printf \{qs(0x105baf4d)}
		SetSeekPosition_Song position = <starttime>
	else
		printf \{qs(0xa7ccd55b)}
	endif
	if NOT ($current_song = jamsession)
		if NOT ($game_mode = training)
			createeffectsendstack slot = ($starpower_sendeffect_slot) effects = [{$starpower_echo} {$starpower_reverb} {$highpass_starpower}]
		endif
	endif
	if StructureContains structure = <song_struct> overall_song_volume
		songsetmastervolume vol = (<song_struct>.overall_song_volume)
	endif
	songsetcrowdpan pan1x = ($crowd_singalong_pan1x) pan1y = ($crowd_singalong_pan1y) pan2x = ($crowd_singalong_pan2x) pan2y = ($crowd_singalong_pan2y)
	return \{true}
endscript

script setupsongdspnetworks 
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	mode = $game_mode
	if ($boss_battle = 1)
		mode = boss_battle
	endif
	if ($is_attract_mode = 1)
		mode = attract_mode
	endif
	if ui_event_exists_in_stack \{Name = 'metallifacts'}
		mode = attract_mode
	endif
	num_players = $current_num_players
	gamemode_getnumplayersshown
	if (<num_players_shown> < <num_players>)
		<num_players> = <num_players_shown>
	endif
	player1_part = ($player1_status.part)
	player2_part = ($player2_status.part)
	player3_part = ($player3_status.part)
	player4_part = ($player4_status.part)
	getplayerinfo \{1
		highway_position}
	p1_highway_position = <highway_position>
	getplayerinfo \{2
		highway_position}
	p2_highway_position = <highway_position>
	getplayerinfo \{3
		highway_position}
	p3_highway_position = <highway_position>
	getplayerinfo \{4
		highway_position}
	p4_highway_position = <highway_position>
	mono_drums = 0
	if StructureContains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	speed = ($current_speedfactor)
	songsetupplayerparts <...>
	songsetplayereqsettings
	GetPakManCurrentName \{map = zones}
	printf qs(0x666d6b87) s = <pakname>
	formatText checksumName = reverbparams 'Reverb_Crowd_Buss_%t' t = <pakname> donotresolve
	if GlobalExists Name = <reverbparams> Type = structure
		printf qs(0xe3bab4b1) f = <reverbparams> donotresolve
		songsetcrowdreverbparams ($<reverbparams>)
	else
		printf qs(0x77b4943a) s = <reverbparams> donotresolve
	endif
endscript

script songsetplayereqsettings 
	primary_profile = 1
	Player = 1
	begin
	getplayerinfo <Player> controller
	if ((<controller>) = ($primary_controller))
		primary_profile = <Player>
	endif
	Player = (<Player> + 1)
	repeat $current_num_players
	printf qs(0x9747ab48) c = ($primary_controller)
	getplayerinfo <primary_profile> part
	active_profile_part = <part>
	printf qs(0xcebfeb82) p = <primary_profile> a = <part>
	GetGlobalTags \{user_options
		attract_mode_fix = 1}
	index = (<volumes>.guitar.guitar.eq - 1)
	printf qs(0x406cd5d8) i = <index> p = <active_profile_part>
	songsetplayerparteq part = guitar {((($playerparteqlookup)).(guitar) [<index>])}
	index = (<volumes>.guitar.bass.eq - 1)
	printf qs(0x0f04ac35) i = <index> p = <active_profile_part>
	songsetplayerparteq part = guitar {((($playerparteqlookup)).(guitar) [<index>])}
	index = (<volumes>.guitar.drum.eq - 1)
	printf qs(0xe166ecec) i = <index> p = <active_profile_part>
	songsetplayerparteq part = guitar {((($playerparteqlookup)).(guitar) [<index>])}
endscript

script waitforseek_song 
	Wait \{15
		gameframe}
	return
endscript

script setslomo_song 
	songsetpitch pitch_percent = (<slomo> * 100.0)
endscript

script begin_jam_song \{Pause = 0}
	GetSongTimeMs
	CastToInteger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	SpawnScriptNow guitar_jam_playback_recording params = {jam_instrument = 0 start_time = <time> in_game = 1}
	SpawnScriptNow guitar_jam_playback_recording params = {jam_instrument = 1 start_time = <time> in_game = 1}
	SpawnScriptNow guitar_jam_playback_recording params = {jam_instrument = 2 start_time = <time> in_game = 1}
	SpawnScriptNow guitar_jam_playback_recording params = {jam_instrument = 4 start_time = <time> in_game = 1}
	SpawnScriptNow guitar_jam_drum_playback params = {start_time = <time> gem_array = ($jam_tracks [3].in_game_gem_array)}
	jam_init_volumes
	jam_init_reverb
	jam_init_pan
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = On}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = On}
	SpawnScriptNow \{jam_input_whammy_spawned
		id = jam_input_spawns}
	Change \{song_is_waiting_to_start = 0}
endscript

script begin_song \{Pause = 0}
	if NOT ($current_song_qpak = jamsession)
		if (<Pause> = 0)
			songunpause
		else
			songpause
		endif
	endif
	broadcastevent \{Type = song_started}
	Change \{song_is_waiting_to_start = 0}
endscript

script SetSeekPosition_Song \{position = 0}
	songseek time = <position>
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

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		destroyeffectsendstack slot = ($starpower_sendeffect_slot)
		songstop
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		SpawnScriptNow \{Failed_Song_Pitch_Down}
	endif
	Change \{song_is_waiting_to_start = 0}
endscript

script set_whammy_pitchshift 
	songsetplayerwhammy Player = ($<player_status>.Player) whammy_value = (1 - (<control> * 0.057))
endscript

script PauseGh3Sounds 
	songpause
	muteeffectsend slot = ($starpower_sendeffect_slot)
	vocaldspsetparams \{mute_all}
	PauseSoundsByBuss \{Master}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	if NOT GotParam \{no_seek}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> > $current_starttime)
			if NOT GotParam \{seek_on_unpause}
				songseek time = <time>
			endif
		endif
	endif
endscript

script UnPauseGh3Sounds 
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	unmuteeffectsend slot = ($starpower_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if GotParam \{seek_on_unpause}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> > $current_starttime)
			songseek time = <time>
		endif
	endif
	if ($song_is_waiting_to_start = 0)
		songunpause
	endif
	UnpauseSoundsByBuss \{Master}
endscript
