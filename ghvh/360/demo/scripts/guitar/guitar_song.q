stream_config = gh1
song_is_waiting_to_start = 0

script preload_song \{starttime = 0
		fadeintime = 0.0
		seek = 1}
	printf qs(0x74e073e7) s = <song_name>
	wait_for_songpreview_monitor
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> dlc_stream_name
		song_prefix = (<song_struct>.dlc_stream_name)
	endif
	if songcheckifdownloaded filename = <song_prefix>
		if NOT downloads_opencontentfolder content_index = <content_index>
			return \{false}
		endif
	endif
	if NOT songload filename = <song_prefix> content_index = <content_index>
		if NOT cd
			scriptassert 'Failed to load song: %s' s = <song_prefix>
		endif
		destroy_loading_screen
		downloadcontentlost
		return \{false}
	endif
	change \{song_is_waiting_to_start = 1}
	if (<seek> = 1)
		printf \{qs(0x105baf4d)}
		setseekposition_song position = <starttime>
	else
		printf \{qs(0xa7ccd55b)}
	endif
	if NOT ($current_song = jamsession)
		if NOT ($game_mode = training)
			createeffectsendstack slot = ($starpower_sendeffect_slot) effects = [{$starpower_echo} {$starpower_reverb} {$highpass_starpower}]
		endif
	endif
	if structurecontains structure = <song_struct> overall_song_volume
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
	if ui_event_exists_in_stack \{name = 'metallifacts'}
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
	if structurecontains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	speed = ($current_speedfactor)
	songsetupplayerparts <...>
	songsetplayereqsettings
	getpakmancurrentname \{map = zones}
	printf qs(0x666d6b87) s = <pakname>
	formattext checksumname = reverbparams 'Reverb_Crowd_Buss_%t' t = <pakname> donotresolve
	if globalexists name = <reverbparams> type = structure
		printf qs(0xe3bab4b1) f = <reverbparams> donotresolve
		songsetcrowdreverbparams ($<reverbparams>)
	else
		printf qs(0x77b4943a) s = <reverbparams> donotresolve
	endif
endscript

script songsetplayereqsettings 
	primary_profile = 1
	player = 1
	begin
	getplayerinfo <player> controller
	if ((<controller>) = ($primary_controller))
		primary_profile = <player>
	endif
	player = (<player> + 1)
	repeat $current_num_players
	printf qs(0x9747ab48) c = ($primary_controller)
	getplayerinfo <primary_profile> part
	active_profile_part = <part>
	printf qs(0xcebfeb82) p = <primary_profile> a = <part>
	getglobaltags \{user_options
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
	wait \{15
		gameframe}
	return
endscript

script setslomo_song 
	songsetpitch pitch_percent = (<slomo> * 100.0)
endscript

script begin_jam_song \{pause = 0}
	getsongtimems
	casttointeger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 0 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 1 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 2 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 4 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_drum_playback params = {start_time = <time> gem_array = ($jam_tracks [3].in_game_gem_array)}
	jam_init_volumes
	jam_init_reverb
	jam_init_pan
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = on}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = on}
	spawnscriptnow \{jam_input_whammy_spawned
		id = jam_input_spawns}
	change \{song_is_waiting_to_start = 0}
endscript

script begin_song \{pause = 0}
	if NOT ($current_song_qpak = jamsession)
		if (<pause> = 0)
			songunpause
		else
			songpause
		endif
	endif
	broadcastevent \{type = song_started}
	change \{song_is_waiting_to_start = 0}
endscript

script setseekposition_song \{position = 0}
	songseek time = <position>
endscript
waiting_for_pitching = 0

script failed_song_pitch_down 
	songsetpitch \{pitch = -8
		time = 3}
	songsetmastervolume \{vol = -20
		time = 3}
	change \{waiting_for_pitching = 1}
	wait \{3
		seconds}
	spawnscriptnow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		killspawnedscript \{name = failed_song_pitch_down}
		if ($waiting_for_pitching = 1)
			change \{waiting_for_pitching = 0}
		endif
		destroyeffectsendstack slot = ($starpower_sendeffect_slot)
		songstop
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		spawnscriptnow \{failed_song_pitch_down}
	endif
	change \{song_is_waiting_to_start = 0}
endscript

script set_whammy_pitchshift 
	songsetplayerwhammy player = ($<player_status>.player) whammy_value = (1 - (<control> * 0.057))
endscript

script pausegh3sounds 
	songpause
	muteeffectsend slot = ($starpower_sendeffect_slot)
	vocaldspsetparams \{mute_all}
	pausesoundsbybuss \{master}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	if NOT gotparam \{no_seek}
		getsongtimems
		casttointeger \{time}
		if (<time> > $current_starttime)
			if NOT gotparam \{seek_on_unpause}
				songseek time = <time>
			endif
		endif
	endif
endscript

script unpausegh3sounds 
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	unmuteeffectsend slot = ($starpower_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if gotparam \{seek_on_unpause}
		getsongtimems
		casttointeger \{time}
		if (<time> > $current_starttime)
			songseek time = <time>
		endif
	endif
	if ($song_is_waiting_to_start = 0)
		songunpause
	endif
	unpausesoundsbybuss \{master}
endscript
