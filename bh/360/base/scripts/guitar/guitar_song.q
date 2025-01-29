song_is_waiting_to_start = 0

script begin_song 
	if NOT ($current_song_qpak = jamsession)
		SongPlay
	else
		if notetracker_is_using_stream
			begin_mp3_song
		endif
	endif
	Change \{song_is_waiting_to_start = 0}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		killspawnedscript \{name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			Change \{Waiting_For_Pitching = 0}
		endif
		SongStop
		if ($current_song_qpak = jamsession)
			if notetracker_is_using_stream
				end_mp3_song
			endif
		endif
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		spawnscriptnow \{Failed_Song_Pitch_Down}
	endif
	Change \{song_is_waiting_to_start = 0}
endscript

script setslomo_song 
	SongSetPitch pitch_percent = (<slomo> * 100.0)
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	SongSetPitch \{pitch = -8
		time = 3}
	SongSetMasterVolume \{vol = -20
		time = 3}
	Change \{Waiting_For_Pitching = 1}
	wait \{3
		seconds}
	spawnscriptnow \{end_song}
endscript

script SetSeekPosition_Song \{position = 0
		Slot = 0}
	SongSeek time = <position> Slot = <Slot>
endscript

script set_whammy_pitchshift 
	SongSetPlayerWhammy player = <player> whammy_value = (1 - (<control> * 0.057))
endscript

script PauseGh3Sounds 
	GameMode_GetType
	Slot = 0
	if ($medley_mode_on)
		Slot = ($medley_last_slot_used)
	endif
	if (<type> = freeplay)
		StopSoundsByBuss \{Crowd_One_Shots}
		StopSoundsByBuss \{Crowd_beds}
		StopSoundsByBuss \{Crowd_Cheers}
		StopSoundsByBuss \{Crowd_Star_Power}
		StopSoundsByBuss \{Music_FrontEnd}
		StopSoundsByBuss \{Music_Setlist}
		StopSoundsByBuss \{BinkCutScenes}
		StopSoundsByBuss \{Tutorial_VO}
		StopSoundsByBuss \{Encore_Events}
		StopSoundsByBuss \{pause_menu}
		PauseSoundsByBuss \{User_Vocals}
		PauseSoundsByBuss \{User_Microphone}
		PauseSoundsByBuss \{User_Drums}
		PauseSoundsByBuss \{User_Guitar}
		PauseSoundsByBuss \{User_Bass}
		PauseSoundsByBuss \{User_RhythmGTR}
		PauseSoundsByBuss \{User_Band}
		PauseSoundsByBuss \{User_CrowdSingalong}
		PauseSoundsByBuss \{User_JamMode}
		PauseSoundsByBuss \{User_User_SFX}
		PauseSoundsByBuss \{User_Crowd}
	else
		PauseSoundsByBuss \{Master}
	endif
	songpause Slot = <Slot>
	MuteEffectSend Slot = ($venue_sendeffect_slot)
	VocalDSPSetParams \{mute_all}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	if NOT GotParam \{no_seek}
		GetSongTimeMs
		CastToInteger \{time}
		if ($medley_mode_on && <time> > 0)
			GetMedleyAudioStartTime \{medley_index = $medley_current_index_loaded}
			time = ((<time> - $medley_last_start_time) + <medley_audio_start_time>)
		endif
		if (<time> > $current_starttime)
			if NOT GotParam \{seek_on_unpause}
				SongSeek time = <time> Slot = <Slot> nowait
			endif
		endif
	endif
endscript

script UnpauseGh3Sounds 
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	can_unpause = 1
	if ($song_is_waiting_to_start = 1)
		can_unpause = 0
	endif
	if NOT can_medley_unpause
		can_unpause = 0
	endif
	GameMode_GetType
	if (<type> = practice)
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> < $practice_start_time || <time> > $practice_end_time)
			RemoveParameter \{seek_on_unpause}
			can_unpause = 0
		endif
	endif
	Slot = 0
	if ($medley_mode_on)
		Slot = ($medley_last_slot_used)
	endif
	UnMuteEffectSend Slot = ($venue_sendeffect_slot)
	VocalDSPSetParams \{unmute_all}
	if GotParam \{seek_on_unpause}
		GetSongTimeMs
		CastToInteger \{time}
		if ($medley_mode_on && <time> > 0)
			time = ((<time> - $medley_last_start_time) + $medley_last_seek_time)
		endif
		if (<time> > $current_starttime)
			SongSeek time = <time> Slot = <Slot> nowait
		endif
	endif
	begin
	if SongIsReady Slot = <Slot>
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<can_unpause> = 1)
		SongUnPause Slot = <Slot>
	endif
	UnPauseSoundsByBuss \{Master}
endscript

script InitSongAudioSystem 
	printf \{qs(0x2ec92d28)}
	mode = $game_mode
	speed = ($current_speedfactor)
	SongAudioPlayerInit <...>
endscript

script DeInitSongAudioSystem \{no_script_wait = 0}
	printf \{qs(0x498dcb03)}
	if (<no_script_wait> = 1)
		SongUnload \{nowait}
		SongAudioPlayerDeInit \{nowait}
	else
		SongUnload
		SongAudioPlayerDeInit
	endif
	SetSoundBussParams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
endscript

script preload_song \{starttime = 0
		Slot = 0}
	SetScriptCannotPause
	printf \{qs(0xcb115ec8)}
	printf qs(0xd4f5c87b) s = <song_name>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	Change \{song_is_waiting_to_start = 1}
	SongLoad FileName = <song_prefix> Slot = <Slot> vol = (<song_struct>.overall_song_volume)
	if (<song_command_success> = false)
		if NOT CD
			ScriptAssert 'Failed to load song: %s' s = <song_prefix>
		endif
		begin
		if ($start_gem_scroller_running = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		destroy_loading_screen
		DownloadContentLost
		return \{false}
	endif
	printf qs(0x341f4698) s = <starttime>
	if (<starttime> > 0)
		SongSeek time = <starttime> Slot = <Slot>
	endif
	return \{true}
endscript

script SetupSongDSP 
	printf \{qs(0x21fc77d4)}
	GMan_SongFunc \{func = get_current_song}
	song_name = <current_song>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	GetNumPlayersInGame
	GetNumPlayersInGame \{on_screen}
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
	SongSetupPlayerDSP <...>
	SongSetTrackSurroundPan track = Crowd pan1x = ($Crowd_Singalong_Pan1x) pan1y = ($Crowd_Singalong_Pan1y) pan2x = ($Crowd_Singalong_Pan2x) pan2y = ($Crowd_Singalong_Pan2y)
	GMan_SongFunc \{func = get_current_song}
	song = <current_song>
	GameMode_GetType
	if NOT ($game_mode = practice)
		printf \{channel = sfx
			qs(0xe39f244f)}
		if NOT (<song> = jamsession)
			Reset_To_Current_Snapshot
		else
			SetSoundBussParams {Crowd = {vol = (($Game_BussSet.Crowd.vol))} time = 0.02}
		endif
		SetSoundBussParams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol))} time = 0.02}
	else
		Change \{Current_Music_DSP_SnapShot_Setting = 'game'}
		Reset_To_Current_Snapshot
	endif
	if NOT (<song> = jamsession)
		if (<type> != freeplay)
			printf \{channel = sfx
				qs(0xca7fda07)}
			Freeplay_Music_Crowd_Transitions \{params = {
					transition = 'Setlist_To_Game'
				}}
		endif
	endif
	if LocalGameIncludesABassist
		printf \{channel = sfx
			qs(0x8ae80b4c)}
		printf \{channel = sfx
			'SETTING BASS EQ SINCE A BASS PLAYER IS PLAYING'}
		if NOT (<song> = jamsession)
			setsoundbusseffects \{effects = [
					{
						name = Bass_EQ
						Effect = ParamEQ
						center = 100
						bandwidth = 1
						gain = 0.8
					}
				]
				time = 0.2}
			Change \{Current_EQ_Bass_Gain = 0.8}
		endif
		PrintDSPSettingsOnScreen
	else
		printf \{channel = sfx
			qs(0x461089eb)}
	endif
	spawnscriptnow \{waitthendumpsounds}
endscript
DSPSettings_PrintToScreen = 0

script PrintDSPSettingsOnScreen 
	if ($DSPSettings_PrintToScreen = 1)
		FormatText TextName = my_text qs(0xb61e1d96) n = ($Current_EQ_Kick_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text>
			Pos = (950.0, 300.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_1
		}
		FormatText TextName = my_text2 qs(0x81388595) n = ($Current_Delay_Kick_Wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text2>
			Pos = (950.0, 320.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_2
		}
		FormatText TextName = my_text3 qs(0x90f84428) n = ($Current_EQ_Snare_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text3>
			Pos = (950.0, 340.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_3
		}
		FormatText TextName = my_text4 qs(0x7a95cf5f) n = ($Current_Delay_Snare_Wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text4>
			Pos = (950.0, 360.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_4
		}
		FormatText TextName = my_text5 qs(0x98242f04) n = ($Current_EQ_Cymbal_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text5>
			Pos = (950.0, 380.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_5
		}
		FormatText TextName = my_text6 qs(0x91825885) n = ($Current_Comp_Guitar_Threshold) DontAssertForChecksums
		create_panel_message {text = <my_text6>
			Pos = (950.0, 400.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_6
		}
		FormatText TextName = my_text7 qs(0x859f7bd7) n = ($Current_EQ_Guitar_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text7>
			Pos = (950.0, 420.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_7
		}
		FormatText TextName = my_text8 qs(0xf67cfb22) n = ($Current_Comp_Bass_Threshold) DontAssertForChecksums
		create_panel_message {text = <my_text8>
			Pos = (950.0, 440.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_8
		}
		FormatText TextName = my_text9 qs(0x7882957d) n = ($Current_EQ_Bass_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text9>
			Pos = (950.0, 460.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_9
		}
		FormatText TextName = my_text10 qs(0xe971d45d) n = ($Current_EQ_Vocals_Gain) DontAssertForChecksums
		create_panel_message {text = <my_text10>
			Pos = (950.0, 480.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_10
		}
		FormatText TextName = my_text11 qs(0xbc90e139) n = ($Current_Delay_Vocals_Wetmix) DontAssertForChecksums
		create_panel_message {text = <my_text11>
			Pos = (950.0, 500.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_A3
			time = 180000
			just = [left left]
			scale = 0.33
			id = SFX_DSP_PANEL_MESSAGE_11
		}
	endif
endscript

script waitthendumpsounds 
	wait \{1.5
		seconds}
	if ($DebugSoundFX = 1)
		dumpsounds
	endif
	PrintDSPSettingsOnScreen
endscript

script LocalGameIncludesABassist 
	GameMode_GetType
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	if (<num_players> > 0)
		begin
		if PlayerInfoEquals <player> part = bass
			if (<type> != freeplay)
				return \{true}
			else
				GetPlayerInfo <player> freeplay_state
				if (<freeplay_state> != dropped && <freeplay_state> != joining)
					return \{true}
				endif
			endif
		endif
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	return \{false}
endscript

script SongSetPlayerEQSettings 
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
	Change \{song_is_waiting_to_start = 0}
endscript

script net_stream_mp3 
	printf \{qs(0x2c7f49b5)}
	NetSessionFunc \{func = cdn_init}
	wait \{1
		second}
	printf \{qs(0x07521a76)}
	AuthoringInit
	wait \{1
		second}
	printf \{qs(0x4acd4ff1)}
	if NOT GotParam \{FileName}
		FileName = 'ClickClickBoom.mp3'
	endif
	AuthoringGetFile <FileName> heap = BottomUpHeap
	begin
	if AuthoringIsLoaded <FileName>
		printf \{qs(0x0d3b51e8)}
		break
	else
		printf qs(0x167dad2a) i = <progress>
		if (<progress> > 500000)
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
	printf \{qs(0x57adc52f)}
	StopAllSounds
	printf qs(0x50a5d267) s = <FileName>
	loadmp3 <FileName> usecdn = true
	buffer_pos = (1024 * 1024)
	printf \{qs(0x32de9625)}
	DecompressMp3 name = <FileName> reset
	DecompressMp3 name = <FileName> Pos = <buffer_pos>
	printf \{qs(0x53bf4f66)}
	AddPcmStream mp3stream name = <FileName> sample_freq = 44100 floatformat = false
	wait \{2
		gameframe}
	PlaySound \{mp3stream
		buss = Master}
	GetStartTime
	song_starttime = <starttime>
	GetPcmStreamSeekPos \{mp3stream}
	printf qs(0x35461467) i = <Pos>
	begin
	GetPcmStreamSeekPos \{mp3stream}
	new_buffer_pos = (<buffer_pos> + 16 * 1024)
	if (<Pos> + 1024 * 1024 > <buffer_pos>)
		if NOT DecompressMp3 name = <FileName> Pos = <new_buffer_pos>
			break
		endif
		<buffer_pos> = <new_buffer_pos>
	endif
	wait \{1
		gameframe}
	repeat
	song_lengthms = ((1000.0 * <totalsize>) / (44100 * 2 * 2))
	printstruct <...>
	begin
	GetStartTime
	song_time = (<starttime> - <song_starttime>)
	if (<song_time> >= <song_lengthms>)
		printstruct <...>
		printf \{qs(0x3111b13e)}
		break
	endif
	wait \{1
		gameframe}
	repeat
	StopSound \{mp3stream}
	StopSound \{fsbstream}
	wait \{4
		gameframes}
	DecompressMp3 name = <FileName> reset
	unloadmp3 name = ($jam_notetracker_mp3)
	RemovePcmStream \{mp3stream}
	RemoveFsbStream \{fsbstream}
endscript

script preload_mp3_song 
	MusicStudio_Instrument_UnloadAll
	GetSongInfo
	Change jam_notetracker_mp3 = <streamfile>
	Change jam_notetracker_usecdn = <usecdn>
	SpawnScript \{mp3_decoder}
endscript

script mp3_decoder 
	usecdn = ($jam_notetracker_usecdn)
	if StringContains text = ($jam_notetracker_mp3) substring = '.fsb'
		usefsb = 1
		progress_required = (32 * 1024)
	else
		usefsb = 0
		progress_required = (100 * 1024)
	endif
	if (<usecdn>)
		CreateScreenElement \{type = TextElement
			parent = root_window
			id = cdn_progress
			just = [
				center
				top
			]
			font = debug
			text = qs(0xc66308a5)
			scale = 0.5
			Pos = (640.0, 200.0)
			rgba = [
				250
				245
				145
				255
			]}
	endif
	FileName = ($jam_notetracker_mp3)
	if (<usecdn>)
		printf \{qs(0x2c7f49b5)}
		NetSessionFunc \{func = cdn_init}
		begin
		if NetSessionFunc \{Obj = raf
				func = is_ready}
			printf \{qs(0x03c8ecd6)}
			break
		endif
		if NetSessionFunc \{Obj = raf
				func = check_for_manifest_error}
			printf 'Manifest download error %e' e = <error>
			FormatText TextName = mp3_text qs(0xcd97b6e0) s = <percent>
			SetScreenElementProps id = cdn_progress text = <mp3_text>
			return
			break
		endif
		wait \{1
			gameframe}
		repeat
		printf \{qs(0x07521a76)}
		AuthoringInit
		printf \{qs(0x1e492b37)}
		AuthoringGetFile ($jam_notetracker_mp3) heap = heap_musicstudio_guitar
		frames = 0
		last_progress = -1
		begin
		if AuthoringIsLoaded <FileName>
			printf \{qs(0x80bb28ad)}
			break
		else
			if (<progress> != <last_progress>)
				printf qs(0x79981298) i = <progress>
				last_progress = <progress>
			endif
			if (<current> = false)
				frames = (<frames> + 1)
				if (<frames> = 120)
					printf \{qs(0x67534dab)}
					frames = 0
				endif
			endif
			if (<progress> > <progress_required>)
				break
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if (<usefsb> = 0)
		printf \{qs(0xf3676e6b)}
		loadmp3 ($jam_notetracker_mp3) usecdn = ($jam_notetracker_usecdn) heap = heap_musicstudio_guitar
		add = 16000
		pcm_registered = 0
		buffer_pos = 0
		finished = 0
		begin
		if (<pcm_registered>)
			GetPcmStreamSeekPos \{mp3stream}
			new_buffer_pos = (<buffer_pos> + 16 * 1024)
		else
			Pos = 0
			new_buffer_pos = (<buffer_pos> + 16 * 1024)
		endif
		totalsize = <buffer_pos>
		if (<Pos> + 1024 * 1024 > <buffer_pos>)
			if (<usecdn> = 0)
				if DecompressMp3 name = <FileName> Pos = <new_buffer_pos>
				else
					break
				endif
			else
				if AuthoringIsLoaded <FileName>
					if DecompressMp3 name = <FileName> Pos = <new_buffer_pos>
						finished = 1
					else
						break
					endif
				else
					DecompressMp3 name = <FileName> Pos = <new_buffer_pos> limit = (<progress> - 16000)
				endif
			endif
		endif
		if (<finished> = 1)
			percent = 100
		else
			percent = ((<totalsize> - <Pos>) / (1024 * 10))
			if (<percent> > 100)
				percent = 100
			endif
			if (<percent> < 0)
				percent = 0
			endif
		endif
		if (<usecdn>)
			FormatText TextName = mp3_text qs(0xcfd55336) s = <percent>
			SetScreenElementProps id = cdn_progress text = <mp3_text>
		endif
		if (<pcm_registered> = 0)
			if (<totalsize> > 768 * 1024)
				printf \{qs(0xb5286151)}
				AddPcmStream mp3stream name = ($jam_notetracker_mp3) sample_freq = 44100 floatformat = false
				pcm_registered = 1
			endif
		endif
		buffer_pos = <totalsize>
		wait \{1
			gameframe}
		repeat
	else
		AddFSBStream fsbstream ($jam_notetracker_mp3) usecdn = <usecdn>
		if (<usecdn>)
			begin
			GetPcmStreamSeekPos \{fsbstream}
			if AuthoringIsLoaded <FileName>
				FormatText \{TextName = mp3_text
					qs(0xcfd55336)
					s = 100}
				SetScreenElementProps id = cdn_progress text = <mp3_text>
				break
			else
				percent = ((<progress> - <Pos>) * 100)
				percent = (<percent> / (128 * 1024))
				if (<percent> > 100)
					percent = 100
				endif
				if (<percent> < 0)
					percent = 0
				endif
				FormatText TextName = mp3_text qs(0xcfd55336) s = <percent>
				SetScreenElementProps id = cdn_progress text = <mp3_text>
			endif
			wait \{1
				gameframe}
			repeat
		endif
	endif
endscript

script begin_mp3_song 
	printf \{qs(0x99bf2c18)}
	if ($single_stream_effects_created = 0)
		Effect = [
			{Effect = HighPass name = MP3_HIGHPASS cutoff = 10 resonance = 1.0}
			{Effect = LowPass name = MP3_LOWPASS cutoff = 22000 resonance = 1.0}
		]
		CreateSoundBussEffects buss = guitar_stream Effect = <Effect>
		Change \{single_stream_effects_created = 1}
	endif
	Change \{single_stream_enabled = 1}
	single_stream_reset
	if StringContains text = ($jam_notetracker_mp3) substring = '.fsb'
		SpawnScript \{fsb_streamer}
	else
		SpawnScript \{mp3_streamer}
	endif
endscript

script end_mp3_song 
	killspawnedscript \{name = mp3_decoder}
	killspawnedscript \{name = mp3_streamer}
	DestroyScreenElement \{id = cdn_progress}
	StopSound \{mp3stream}
	StopSound \{fsbstream}
	wait \{4
		gameframes}
	DecompressMp3 name = ($jam_notetracker_mp3) reset
	unloadmp3 name = ($jam_notetracker_mp3)
	RemovePcmStream \{mp3stream}
	RemoveFsbStream \{fsbstream}
	DestroySoundBussEffects \{buss = guitar_stream
		buss_array = [
			MP3_HIGHPASS
			MP3_LOWPASS
		]}
	Change \{single_stream_effects_created = 0}
	Change \{single_stream_enabled = 0}
	single_stream_reset
endscript

script mp3_streamer 
	playing = 0
	song_starttime = 0
	begin
	if NOT GameIsPaused
		if (<playing> = 0)
			if IsPcmStreamAdded \{mp3stream}
				PlaySound mp3stream buss = guitar_stream vol_percent = ($single_stream_max_vol) pan1x = 0.25 pan1y = 1 pan2x = -0.25 pan2y = 1
				playing = 1
				GetStartTime
				song_starttime = <starttime>
			else
				printf \{qs(0xf894a92d)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		else
			GetPcmStreamSeekPos \{mp3stream}
			if NOT DecompressMp3 name = ($jam_notetracker_mp3) Pos = 0
				break
			endif
			if (<totalsize> < <Pos> + 768 * 1024)
				printf \{qs(0xe50baad2)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
	song_lengthms = ((1000.0 * <totalsize>) / (44100 * 2 * 2))
	printstruct <...>
	begin
	GetStartTime
	song_time = (<starttime> - <song_starttime>)
	if (<song_time> >= <song_lengthms>)
		printstruct <...>
		printf \{qs(0x3111b13e)}
		break
	endif
	wait \{1
		gameframe}
	repeat
	StopSound \{mp3stream}
	wait \{4
		gameframes}
	DecompressMp3 name = ($jam_notetracker_mp3) reset
	unloadmp3 name = ($jam_notetracker_mp3)
	RemovePcmStream \{mp3stream}
endscript

script fsb_streamer 
	playing = 0
	song_starttime = 0
	begin
	if NOT GameIsPaused
		if (<playing> = 0)
			if IsFsbStreamAdded \{fsbstream}
				PlaySound fsbstream buss = guitar_stream vol_percent = ($single_stream_max_vol) pan1x = 0.25 pan1y = 1 pan2x = -0.25 pan2y = 1
				playing = 1
				GetStartTime
				song_starttime = <starttime>
			else
				printf \{qs(0xd5bbdba1)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		else
			GetFsbStreamSeekPos \{fsbstream}
			if AuthoringIsLoaded ($jam_notetracker_mp3)
				break
			endif
			if (<progress> < <Pos> + 16 * 1024)
				printf \{qs(0xcadb2ba0)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
