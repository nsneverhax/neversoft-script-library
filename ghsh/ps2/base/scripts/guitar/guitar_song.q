stream_config = gh1
0x84acfb5b = NULL
song_is_waiting_to_start = 0

script preload_song \{starttime = 0
		fadeintime = 0.0
		Seek = 1}
	adjustedtime = <starttime>

	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> dlc_stream_name
		song_prefix = (<song_struct>.dlc_stream_name)
	endif
	if NOT ($current_song = jamsession)
		if NOT GotParam \{0x22b8afbb}
			0x22b8afbb = $current_speedfactor
		endif
		if NOT songload FileName = <song_prefix> content_index = <content_index> position = <starttime> 0x22b8afbb = <0x22b8afbb>
			if NOT CD

			endif
			destroy_loading_screen
			DownloadContentLost
			return \{FALSE}
		endif
	endif
	Change \{song_is_waiting_to_start = 1}
	if (<Seek> = 1)

		SetSeekPosition_Song position = <starttime>
	else

	endif
	if NOT ($current_song = jamsession)
		if NOT ($game_mode = training)
			createeffectsendstack slot = ($starpower_sendeffect_slot) effects = [{$starpower_echo} {$starpower_reverb} {$highpass_starpower}]
		endif
	endif
	songsetcrowdpan pan1x = ($crowd_singalong_pan1x) pan1y = ($crowd_singalong_pan1y) pan2x = ($crowd_singalong_pan2x) pan2y = ($crowd_singalong_pan2y)
	if StructureContains structure = <song_struct> overall_song_volume
		songsetmastervolume vol = (<song_struct>.overall_song_volume)
	endif
	return adjustedtime = <adjustedtime>
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

	formatText checksumName = reverbparams 'Reverb_Crowd_Buss_%t' t = <pakname> donotresolve
	if GlobalExists Name = <reverbparams> Type = structure

		songsetcrowdreverbparams ($<reverbparams>)
	else

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

	getplayerinfo <primary_profile> part
	active_profile_part = <part>

	GetGlobalTags \{user_options
		attract_mode_fix = 1}
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

script begin_song \{Pause = 0
		0xb49e19e9 = 0}
	SpawnScriptLater \{0xc5a6b981}
	if NOT ($current_song_qpak = jamsession)
		if (<Pause> = 0)
			songunpause 0xb49e19e9 = <0xb49e19e9>
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
		0x05924e09
		songstop
	else

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
endscript

script UnPauseGh3Sounds 
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	unmuteeffectsend slot = ($starpower_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if ($song_is_waiting_to_start = 0)
		if ($0xd441408d = 0)
			songunpause
		endif
	endif
	UnpauseSoundsByBuss \{Master}
endscript
