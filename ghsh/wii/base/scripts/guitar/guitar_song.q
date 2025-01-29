stream_config = gh1
song_is_waiting_to_start = 0

script preload_song \{starttime = 0
		fadeintime = 0.0
		Seek = 1
		0x922dc314 = FALSE}
	adjustedtime = <starttime>
	printf qs(0xd4f5c87b) s = <song_name>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> dlc_stream_name
		song_prefix = (<song_struct>.dlc_stream_name)
	endif
	SoundBussUnlock \{band_Balance}
	if StructureContains structure = <song_struct> Name = band_playback_volume
		setsoundbussparams {band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		setsoundbussparams {band_Balance = {vol = -1.5}} time = <fadeinttime>
	endif
	SoundBussLock \{band_Balance}
	if NOT ($current_song = jamsession)
		0x86586519 = 0
		if is_song_downloaded song_checksum = <song_name>
			<0x86586519> = <download>
		endif
		if songfileexists FileName = <song_prefix> 0x86586519 = <0x86586519>
			if NOT (<starttime> = 0)
				0x922dc314 = true
			endif
			0x275757a9 FileName = <song_prefix> 0x86586519 = <0x86586519> 0x922dc314 = <0x922dc314>
		endif
	endif
	Change \{song_is_waiting_to_start = 1}
	SetLastGuitarVolume \{Player = 1
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 2
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 3
		last_guitar_volume = 100}
	SetLastGuitarVolume \{Player = 4
		last_guitar_volume = 100}
	SetSeekPosition_Song position = <starttime>
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
	songsetupplayerparts <...>
	songsetplayereqsettings
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

script startpreloadpaused_song 
	songplay
endscript

script begin_jam_song \{Pause = 0}
	enableperformancedof
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

script begin_song \{Pause = 0
		0xb49e19e9 = 0}
	enableperformancedof
	startpreloadpaused_song
	UpdateGuitarVolume
	if NOT ($current_song_qpak = jamsession)
		if (<Pause> = 0)
			songunpause 0xb49e19e9 = <0xb49e19e9>
		else
			songpause
		endif
	endif
	broadcastevent \{Type = song_started}
	Change \{song_is_waiting_to_start = 0}
	enablemic
endscript

script SetSeekPosition_Song \{position = 0}
	if 0xbc4ae01a
		printf \{qs(0x699cbcf4)}
		waitforsonginitialized
		printf \{qs(0x165d3b6b)}
		songpause
		printf \{qs(0x07c04dca)}
		0x5943cc9e time = <position>
		printf \{qs(0xb0554c2a)}
		waitforsonginitialized
		songseek time = <position>
		waitforsonginitialized
		printf \{qs(0x048bcbff)}
		songunpause
	endif
endscript

script waitforsonginitialized 
	begin
	printf \{qs(0x7e6cea02)}
	if songisinitialized
		break
	endif
	Wait \{1
		gameframe}
	repeat
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
	disablemic
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		destroyeffectsendstack slot = ($starpower_sendeffect_slot)
		songunload
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		SpawnScriptNow \{Failed_Song_Pitch_Down}
	endif
endscript

script set_whammy_pitchshift 
	songsetplayerwhammy Player = ($<player_status>.Player) whammy_value = (1 - (<control> * 0.057))
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
	UnpauseSoundsByBuss \{UI}
	UnpauseSoundsByBuss \{Crowd_One_Shots}
	UnpauseSoundsByBuss \{Crowd_One_Shots_Negative}
	UnpauseSoundsByBuss \{Crowd_Beds}
	UnpauseSoundsByBuss \{Crowd_Cheers}
	UnpauseSoundsByBuss \{Crowd_Boos}
	UnpauseSoundsByBuss \{Crowd_Nuetral}
	UnpauseSoundsByBuss \{Default}
	UnpauseSoundsByBuss \{Test_Tones}
	UnpauseSoundsByBuss \{Practice_Band_Playback}
	UnpauseSoundsByBuss \{Test_Tones_DSP}
	UnpauseSoundsByBuss \{Right_Notes_Player2}
	UnpauseSoundsByBuss \{Wrong_Notes_Player1}
	UnpauseSoundsByBuss \{Wrong_Notes_Player2}
	UnpauseSoundsByBuss \{User_Vocal}
	UnpauseSoundsByBuss \{User_Music}
	UnpauseSoundsByBuss \{Encore_Events}
	UnpauseSoundsByBuss \{binkcutscenes}
	unlockdsp
endscript
