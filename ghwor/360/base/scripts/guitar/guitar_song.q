song_is_waiting_to_start = 0

script songaudioplay 
	if NOT ($current_song_qpak = jamsession)
		sap_play
	endif
	if ($quickplay_whammy_rewind_enable = 1)
		spawnscript \{quickplay_whammy_rewind}
	endif
	Change \{song_is_waiting_to_start = 0}
endscript

script songaudiostop \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		sap_stop
		sap_unload \{noWait}
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
	SpawnScriptNow \{songaudiostop}
endscript

script songaudioseek \{position = 0
		callback = None}
	sap_seek time = <position> callback = <callback>
endscript

script songaudiosetwhammy 
	sap_setplayerwhammy Player = <Player> whammy_value = (1 - (<control> * 0.057))
endscript

script pauseaudio 
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
	if NOT GotParam \{no_seek}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> > $current_starttime)
			if NOT GotParam \{seek_on_unpause}
				if sap_seek time = <time> noWait callback = songaudio_seekdone
					Change \{songaudio_waitingforseek = 1}
				else
					Change \{songaudio_waitingforseek = 0}
				endif
			endif
		endif
	endif
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
	endif
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if GotParam \{seek_on_unpause}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> >= $current_starttime)
			sap_seek time = <time> noWait
		endif
	endif
	waitforaudioseek
	if (<can_unpause> = 1)
		sap_unpause
	endif
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> >= 0)
		SetSoundSeekPosition mp3stream position = <time>
		SetSoundSeekPosition fsbstream position = <time>
	endif
	UnpauseSoundsByBuss \{Master}
endscript

script songaudioinit \{callback = None}
	mode = $game_mode
	speed = ($current_speedfactor)
	sap_init <...> callback = <callback> noWait
endscript

script songaudiodeinit \{callback = None}
	sap_unload \{noWait}
	sap_deinit noWait callback = <callback>
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
g_start_streamload = 0

script songaudioload \{starttime = 0
		callback = None}
	setscriptcannotpause
	Change \{g_start_streamload = 0}
	if ($load_song_synchronous = FALSE && $calibrate_lag_enabled = 0)
		begin
		if ($g_start_streamload = 1)
			Change \{g_start_streamload = 0}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	getsongaudioinfo song_name = <song_name>
	get_song_encryption_type song_name = <song_name>
	Change \{song_is_waiting_to_start = 1}
	sap_load FileName = <song_stream_name> vol = <song_volume> encryption_type = <encryption_type>
	if (<song_command_success> = 0)
		formatText TextName = FileName 'a%s_1.fsb' s = <song_stream_name>
		contentfoldermanager func = get_content_folder_index_from_file file = <FileName>
		if (<device> = content)
			contentfoldermanager func = mark_content_file_damaged file = <FileName>
			DownloadContentLost
		else
			if NOT CD
				ScriptAssert 'Failed to load song: %s' s = <song_name>
			endif
		endif
		begin
		if ($start_gem_scroller_running = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		destroy_loading_screen
		return \{FALSE}
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
	if StructureContains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	if StructureContains structure = <song_struct> fake_bass_mode
		fake_bass_mode = (<song_struct>.fake_bass_mode)
	endif
	sap_setupplayerdsp <...>
	sap_settracksurroundpan track = Crowd pan1x = ($g_crowd_singalong_pan1x) pan1y = ($g_crowd_singalong_pan1y) pan2x = ($g_crowd_singalong_pan2x) pan2y = ($g_crowd_singalong_pan2y)
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
		if (<Type> != freeplay)
			audio_freeplay_music_and_crowd_transitions \{params = {
					transition = 'Setlist_To_Game'
				}}
		endif
	endif
	if localgameincludesabassist
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
		printdspsettingsonscreen
	else
	endif
endscript
dspsettings_printtoscreen = 0

script printdspsettingsonscreen 
	if ($dspsettings_printtoscreen = 1)
		formatText TextName = my_text qs(0xb61e1d96) n = ($g_current_eq_kick_gain) DontAssertForChecksums
		create_panel_message {text = <my_text>
			Pos = (950.0, 300.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_1
		}
		formatText TextName = my_text2 qs(0x81388595) n = ($g_current_delay_kick_wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text2>
			Pos = (950.0, 320.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_2
		}
		formatText TextName = my_text3 qs(0x90f84428) n = ($g_current_eq_snare_gain) DontAssertForChecksums
		create_panel_message {text = <my_text3>
			Pos = (950.0, 340.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_3
		}
		formatText TextName = my_text4 qs(0x7a95cf5f) n = ($g_current_delay_snare_wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text4>
			Pos = (950.0, 360.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_4
		}
		formatText TextName = my_text5 qs(0x98242f04) n = ($g_current_eq_cymbal_gain) DontAssertForChecksums
		create_panel_message {text = <my_text5>
			Pos = (950.0, 380.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_5
		}
		formatText TextName = my_text6 qs(0x91825885) n = ($g_current_comp_guitar_threshold) DontAssertForChecksums
		create_panel_message {text = <my_text6>
			Pos = (950.0, 400.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_6
		}
		formatText TextName = my_text7 qs(0x859f7bd7) n = ($g_current_eq_guitar_gain) DontAssertForChecksums
		create_panel_message {text = <my_text7>
			Pos = (950.0, 420.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_7
		}
		formatText TextName = my_text8 qs(0xf67cfb22) n = ($g_current_comp_bass_threshold) DontAssertForChecksums
		create_panel_message {text = <my_text8>
			Pos = (950.0, 440.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_8
		}
		formatText TextName = my_text9 qs(0x7882957d) n = ($g_current_eq_bass_gain) DontAssertForChecksums
		create_panel_message {text = <my_text9>
			Pos = (950.0, 460.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_9
		}
		formatText TextName = my_text10 qs(0xe971d45d) n = ($g_current_eq_vocals_gain) DontAssertForChecksums
		create_panel_message {text = <my_text10>
			Pos = (950.0, 480.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_10
		}
		formatText TextName = my_text11 qs(0xbc90e139) n = ($g_current_delay_vocals_wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text11>
			Pos = (950.0, 500.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			Scale = 0.33
			id = sfx_dsp_panel_message_11
		}
	endif
endscript

script waitthendumpsounds 
	Wait \{1.5
		Seconds}
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
	musicstudio_eq_settings_mastering
	Change \{song_is_waiting_to_start = 0}
endscript
last_performance_time = 0.0

script getperformancetime 
	if ($pause_grace_period < 0.0)
		GetSongTime
		Change last_performance_time = <songtime>
		return songtime = <songtime>
	else
		return songtime = ($last_performance_time)
	endif
endscript
last_performance_time_ms = 0.0

script getperformancetimems 
	if ($pause_grace_period < 0.0)
		GetSongTimeMs time_offset = <time_offset>
		Change last_performance_time_ms = <time>
		return time = <time>
	else
		return time = ($last_performance_time_ms)
	endif
endscript
