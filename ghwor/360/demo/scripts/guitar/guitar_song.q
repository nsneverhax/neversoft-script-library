song_is_waiting_to_start = 0

script songaudioplay 
	if NOT ($current_song_qpak = jamsession)
		sap_play
	endif
	if ($quickplay_whammy_rewind_enable = 1)
		spawnscript \{quickplay_whammy_rewind}
	endif
	change \{song_is_waiting_to_start = 0}
endscript

script songaudiostop \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		killspawnedscript \{name = failed_song_pitch_down}
		if ($waiting_for_pitching = 1)
			change \{waiting_for_pitching = 0}
		endif
		sap_stop
		sap_unload \{nowait}
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		spawnscriptnow \{failed_song_pitch_down}
	endif
	change \{song_is_waiting_to_start = 0}
endscript
waiting_for_pitching = 0

script failed_song_pitch_down 
	sap_setpitch \{pitch = -8
		time = 3}
	sap_setmastervolume \{vol = -20
		time = 3}
	change \{waiting_for_pitching = 1}
	wait \{3
		seconds}
	spawnscriptnow \{songaudiostop}
endscript

script songaudioseek \{position = 0
		callback = none}
	sap_seek time = <position> callback = <callback>
endscript

script songaudiosetwhammy 
	sap_setplayerwhammy player = <player> whammy_value = (1 - (<control> * 0.057))
endscript

script pauseaudio 
	gamemode_gettype
	pausesoundsbybuss \{master}
	if (<type> = freeplay)
		if gotparam \{do_not_pause_front_end_buss}
			unpausesoundsbybuss \{front_end}
		endif
	endif
	sap_pause
	muteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{mute_all}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	if NOT gotparam \{no_seek}
		getsongtimems
		casttointeger \{time}
		if (<time> > $current_starttime)
			if NOT gotparam \{seek_on_unpause}
				if sap_seek time = <time> nowait callback = songaudio_seekdone
					change \{songaudio_waitingforseek = 1}
				else
					change \{songaudio_waitingforseek = 0}
				endif
			endif
		endif
	endif
endscript
songaudio_waitingforseek = 0

script songaudio_seekdone 
	change \{songaudio_waitingforseek = 0}
endscript

script waitforaudioseek 
	begin
	if ($songaudio_waitingforseek = 0)
		break
	endif
	wait \{1
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
	if (<type> = practice)
		getsongtimems
		casttointeger \{time}
		if (<time> < $practice_start_time || <time> > $practice_end_time)
			removeparameter \{seek_on_unpause}
			can_unpause = 0
		endif
	endif
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if gotparam \{seek_on_unpause}
		getsongtimems
		casttointeger \{time}
		if (<time> >= $current_starttime)
			sap_seek time = <time> nowait
		endif
	endif
	waitforaudioseek
	if (<can_unpause> = 1)
		sap_unpause
	endif
	getsongtimems
	casttointeger \{time}
	if (<time> >= 0)
		setsoundseekposition mp3stream position = <time>
		setsoundseekposition fsbstream position = <time>
	endif
	unpausesoundsbybuss \{master}
endscript

script songaudioinit \{callback = none}
	mode = $game_mode
	speed = ($current_speedfactor)
	sap_init <...> callback = <callback> nowait
endscript

script songaudiodeinit \{callback = none}
	sap_unload \{nowait}
	sap_deinit nowait callback = <callback>
	setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol))} time = 0.02}
endscript

script getsongaudioinfo 
	requireparams \{[
			song_name
		]
		all}
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	stream_name = <song_prefix>
	if structurecontains structure = <song_struct> streamname
		stream_name = (<song_struct>.streamname)
	endif
	if ($calibrate_lag_enabled = 1)
		return song_stream_name = <stream_name> song_volume = ((<song_struct>.overall_song_volume) - 6)
	else
		return song_stream_name = <stream_name> song_volume = (<song_struct>.overall_song_volume)
	endif
endscript
g_start_streamload = 0

script songaudioload \{starttime = 0
		callback = none}
	setscriptcannotpause
	change \{g_start_streamload = 0}
	if ($load_song_synchronous = false && $calibrate_lag_enabled = 0)
		begin
		if ($g_start_streamload = 1)
			change \{g_start_streamload = 0}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	getsongaudioinfo song_name = <song_name>
	get_song_encryption_type song_name = <song_name>
	change \{song_is_waiting_to_start = 1}
	sap_load filename = <song_stream_name> vol = <song_volume> encryption_type = <encryption_type>
	if (<song_command_success> = 0)
		formattext textname = filename 'a%s_1.fsb' s = <song_stream_name>
		contentfoldermanager func = get_content_folder_index_from_file file = <filename>
		if (<device> = content)
			contentfoldermanager func = mark_content_file_damaged file = <filename>
			downloadcontentlost
		else
			if NOT cd
				scriptassert 'Failed to load song: %s' s = <song_name>
			endif
		endif
		begin
		if ($start_gem_scroller_running = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		destroy_loading_screen
		return \{false}
	endif
	if (<starttime> > 0)
		sap_seek time = <starttime>
	endif
	return \{true}
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
	if structurecontains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	if structurecontains structure = <song_struct> fake_bass_mode
		fake_bass_mode = (<song_struct>.fake_bass_mode)
	endif
	sap_setupplayerdsp <...>
	sap_settracksurroundpan track = crowd pan1x = ($g_crowd_singalong_pan1x) pan1y = ($g_crowd_singalong_pan1y) pan2x = ($g_crowd_singalong_pan2x) pan2y = ($g_crowd_singalong_pan2y)
	playlist_getcurrentsong
	song = <current_song>
	gamemode_gettype
	if NOT ($game_mode = practice)
		if NOT (<song> = jamsession)
			audio_effects_reset_to_current_snapshot
		else
			setsoundbussparams {crowd = {vol = (($game_bussset.crowd.vol))} time = 0.02}
		endif
		setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol))} time = 0.02}
	else
		change \{g_current_music_dsp_snapshot_setting = 'game'}
		audio_effects_reset_to_current_snapshot
	endif
	if NOT (<song> = jamsession)
		if (<type> != freeplay)
			audio_freeplay_music_and_crowd_transitions \{params = {
					transition = 'Setlist_To_Game'
				}}
		endif
	endif
	if localgameincludesabassist
		if NOT (<song> = jamsession)
			setsoundbusseffects \{effects = [
					{
						name = bass_eq
						effect = parameq
						center = 100
						bandwidth = 1
						gain = 0.8
					}
				]
				time = 0.2}
			change \{g_current_eq_bass_gain = 0.8}
		endif
		printdspsettingsonscreen
	else
	endif
endscript
dspsettings_printtoscreen = 0

script printdspsettingsonscreen 
	if ($dspsettings_printtoscreen = 1)
		formattext textname = my_text qs(0xb61e1d96) n = ($g_current_eq_kick_gain) dontassertforchecksums
		create_panel_message {text = <my_text>
			pos = (950.0, 300.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_1
		}
		formattext textname = my_text2 qs(0x81388595) n = ($g_current_delay_kick_wetmix) dontassertforchecksums
		create_panel_message {text = <my_text2>
			pos = (950.0, 320.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_2
		}
		formattext textname = my_text3 qs(0x90f84428) n = ($g_current_eq_snare_gain) dontassertforchecksums
		create_panel_message {text = <my_text3>
			pos = (950.0, 340.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_3
		}
		formattext textname = my_text4 qs(0x7a95cf5f) n = ($g_current_delay_snare_wetmix) dontassertforchecksums
		create_panel_message {text = <my_text4>
			pos = (950.0, 360.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_4
		}
		formattext textname = my_text5 qs(0x98242f04) n = ($g_current_eq_cymbal_gain) dontassertforchecksums
		create_panel_message {text = <my_text5>
			pos = (950.0, 380.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_5
		}
		formattext textname = my_text6 qs(0x91825885) n = ($g_current_comp_guitar_threshold) dontassertforchecksums
		create_panel_message {text = <my_text6>
			pos = (950.0, 400.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_6
		}
		formattext textname = my_text7 qs(0x859f7bd7) n = ($g_current_eq_guitar_gain) dontassertforchecksums
		create_panel_message {text = <my_text7>
			pos = (950.0, 420.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_7
		}
		formattext textname = my_text8 qs(0xf67cfb22) n = ($g_current_comp_bass_threshold) dontassertforchecksums
		create_panel_message {text = <my_text8>
			pos = (950.0, 440.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_8
		}
		formattext textname = my_text9 qs(0x7882957d) n = ($g_current_eq_bass_gain) dontassertforchecksums
		create_panel_message {text = <my_text9>
			pos = (950.0, 460.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_9
		}
		formattext textname = my_text10 qs(0xe971d45d) n = ($g_current_eq_vocals_gain) dontassertforchecksums
		create_panel_message {text = <my_text10>
			pos = (950.0, 480.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_10
		}
		formattext textname = my_text11 qs(0xbc90e139) n = ($g_current_delay_vocals_wetmix) dontassertforchecksums
		create_panel_message {text = <my_text11>
			pos = (950.0, 500.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_11
		}
	endif
endscript

script waitthendumpsounds 
	wait \{1.5
		seconds}
	if ($debugsoundfx = 1)
		dumpsounds
	endif
	printdspsettingsonscreen
endscript

script localgameincludesabassist 
	gamemode_gettype
	getnumplayersingame \{local}
	getfirstplayer \{local}
	if (<num_players> > 0)
		begin
		if playerinfoequals <player> part = bass
			if (<type> != freeplay)
				return \{true}
			else
				getplayerinfo <player> freeplay_state
				if (<freeplay_state> != dropped && <freeplay_state> != joining)
					return \{true}
				endif
			endif
		endif
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script begin_jam_song \{pause = 0}
	getsongtimems
	casttointeger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	playback_custom_song start_time = <time> in_game = 1
	musicstudio_init_volumes
	jam_init_reverb
	musicstudio_init_pan
	musicstudio_init_all_line6_effects
	musicstudio_eq_settings_mastering
	change \{song_is_waiting_to_start = 0}
endscript
last_performance_time = 0.0

script getperformancetime 
	if ($pause_grace_period < 0.0)
		getsongtime
		change last_performance_time = <songtime>
		return songtime = <songtime>
	else
		return songtime = ($last_performance_time)
	endif
endscript
last_performance_time_ms = 0.0

script getperformancetimems 
	if ($pause_grace_period < 0.0)
		getsongtimems time_offset = <time_offset>
		change last_performance_time_ms = <time>
		return time = <time>
	else
		return time = ($last_performance_time_ms)
	endif
endscript
