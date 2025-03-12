song_is_waiting_to_start = 0

script begin_song 
	if NOT ($current_song_qpak = jamsession)
		songplay
	else
		if notetracker_is_using_stream
			begin_mp3_song
		endif
	endif
	change \{song_is_waiting_to_start = 0}
endscript

script end_song \{song_failed_pitch_streams = 0}
	if NOT (<song_failed_pitch_streams> = 1)
		killspawnedscript \{name = failed_song_pitch_down}
		if ($waiting_for_pitching = 1)
			change \{waiting_for_pitching = 0}
		endif
		songstop
		if ($current_song_qpak = jamsession)
			if notetracker_is_using_stream
				end_mp3_song
			endif
		endif
	else
		printf \{channel = sfx
			qs(0xc2b5a42d)}
		spawnscriptnow \{failed_song_pitch_down}
	endif
	change \{song_is_waiting_to_start = 0}
endscript

script setslomo_song 
	songsetpitch pitch_percent = (<slomo> * 100.0)
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

script setseekposition_song \{position = 0
		slot = 0}
	songseek time = <position> slot = <slot>
endscript

script set_whammy_pitchshift 
	songsetplayerwhammy player = <player> whammy_value = (1 - (<control> * 0.057))
endscript

script pausegh3sounds 
	slot = 0
	if ($medley_mode_on)
		slot = ($medley_last_slot_used)
	endif
	pausesoundsbybuss \{master}
	songpause slot = <slot>
	muteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{mute_all}
	if ($drum_solo_songtime_paused = 1)
		return
	endif
	if NOT gotparam \{no_seek}
		getsongtimems
		casttointeger \{time}
		if ($medley_mode_on && <time> > 0)
			getmedleyaudiostarttime \{medley_index = $medley_current_index_loaded}
			time = ((<time> - $medley_last_start_time) + <medley_audio_start_time>)
		endif
		if (<time> > $current_starttime)
			if NOT gotparam \{seek_on_unpause}
				songseek time = <time> slot = <slot> nowait
			endif
		endif
	endif
endscript

script unpausegh3sounds 
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
	gamemode_gettype
	if (<type> = practice)
		getsongtimems
		casttointeger \{time}
		if (<time> < $practice_start_time || <time> > $practice_end_time)
			removeparameter \{seek_on_unpause}
			can_unpause = 0
		endif
	endif
	slot = 0
	if ($medley_mode_on)
		slot = ($medley_last_slot_used)
	endif
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if gotparam \{seek_on_unpause}
		getsongtimems
		casttointeger \{time}
		if ($medley_mode_on && <time> > 0)
			time = ((<time> - $medley_last_start_time) + $medley_last_seek_time)
		endif
		if (<time> > $current_starttime)
			songseek time = <time> slot = <slot> nowait
		endif
	endif
	begin
	if songisready slot = <slot>
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<can_unpause> = 1)
		songunpause slot = <slot>
	endif
	unpausesoundsbybuss \{master}
endscript

script initsongaudiosystem 
	printf \{qs(0x2ec92d28)}
	mode = $game_mode
	speed = ($current_speedfactor)
	songaudioplayerinit <...>
endscript

script deinitsongaudiosystem \{no_script_wait = 0}
	printf \{qs(0x498dcb03)}
	if (<no_script_wait> = 1)
		songunload \{nowait}
		songaudioplayerdeinit \{nowait}
	else
		songunload
		songaudioplayerdeinit
	endif
	setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol))} time = 0.02}
endscript

script preload_song \{starttime = 0
		slot = 0}
	setscriptcannotpause
	printf \{qs(0xcb115ec8)}
	printf qs(0xd4f5c87b) s = <song_name>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if structurecontains structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	change \{song_is_waiting_to_start = 1}
	songload filename = <song_prefix> slot = <slot> vol = (<song_struct>.overall_song_volume)
	if (<song_command_success> = false)
		if NOT cd
			scriptassert 'Failed to load song: %s' s = <song_prefix>
		endif
		begin
		if ($start_gem_scroller_running = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		destroy_loading_screen
		downloadcontentlost
		return \{false}
	endif
	printf qs(0x341f4698) s = <starttime>
	if (<starttime> > 0)
		songseek time = <starttime> slot = <slot>
	endif
	return \{true}
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
	if structurecontains structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	if structurecontains structure = <song_struct> fake_bass_mode
		fake_bass_mode = (<song_struct>.fake_bass_mode)
	endif
	songsetupplayerdsp <...>
	songsettracksurroundpan track = crowd pan1x = ($crowd_singalong_pan1x) pan1y = ($crowd_singalong_pan1y) pan2x = ($crowd_singalong_pan2x) pan2y = ($crowd_singalong_pan2y)
	gman_songfunc \{func = get_current_song}
	song = <current_song>
	gamemode_gettype
	if NOT ($game_mode = practice)
		printf \{channel = sfx
			qs(0xe39f244f)}
		if NOT (<song> = jamsession)
			reset_to_current_snapshot
		endif
		setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol))} time = 0.02}
	else
		change \{current_music_dsp_snapshot_setting = 'game'}
		reset_to_current_snapshot
	endif
	if NOT (<song> = jamsession)
		if (<type> != freeplay)
			printf \{channel = sfx
				qs(0xca7fda07)}
			freeplay_music_crowd_transitions \{params = {
					transition = 'Setlist_To_Game'
				}}
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
						name = bass_eq
						effect = parameq
						center = 100
						bandwidth = 1
						gain = 0.8
					}
				]
				time = 0.2}
			change \{current_eq_bass_gain = 0.8}
		endif
		printdspsettingsonscreen
	else
		printf \{channel = sfx
			qs(0x461089eb)}
	endif
	spawnscriptnow \{waitthendumpsounds}
endscript
dspsettings_printtoscreen = 0

script printdspsettingsonscreen 
	if ($dspsettings_printtoscreen = 1)
		formattext textname = my_text qs(0xb61e1d96) n = ($current_eq_kick_gain) dontassertforchecksums
		create_panel_message {text = <my_text>
			pos = (950.0, 300.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_1
		}
		formattext textname = my_text2 qs(0x81388595) n = ($current_delay_kick_wetmix) dontassertforchecksums
		create_panel_message {text = <my_text2>
			pos = (950.0, 320.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_2
		}
		formattext textname = my_text3 qs(0x90f84428) n = ($current_eq_snare_gain) dontassertforchecksums
		create_panel_message {text = <my_text3>
			pos = (950.0, 340.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_3
		}
		formattext textname = my_text4 qs(0x7a95cf5f) n = ($current_delay_snare_wetmix) dontassertforchecksums
		create_panel_message {text = <my_text4>
			pos = (950.0, 360.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_4
		}
		formattext textname = my_text5 qs(0x98242f04) n = ($current_eq_cymbal_gain) dontassertforchecksums
		create_panel_message {text = <my_text5>
			pos = (950.0, 380.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_5
		}
		formattext textname = my_text6 qs(0x91825885) n = ($current_comp_guitar_threshold) dontassertforchecksums
		create_panel_message {text = <my_text6>
			pos = (950.0, 400.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_6
		}
		formattext textname = my_text7 qs(0x859f7bd7) n = ($current_eq_guitar_gain) dontassertforchecksums
		create_panel_message {text = <my_text7>
			pos = (950.0, 420.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_7
		}
		formattext textname = my_text8 qs(0xf67cfb22) n = ($current_comp_bass_threshold) dontassertforchecksums
		create_panel_message {text = <my_text8>
			pos = (950.0, 440.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_8
		}
		formattext textname = my_text9 qs(0x7882957d) n = ($current_eq_bass_gain) dontassertforchecksums
		create_panel_message {text = <my_text9>
			pos = (950.0, 460.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_9
		}
		formattext textname = my_text10 qs(0xe971d45d) n = ($current_eq_vocals_gain) dontassertforchecksums
		create_panel_message {text = <my_text10>
			pos = (950.0, 480.0)
			rgba = [255 255 255 255]
			font_face = fontgrid_text_a3
			time = 180000
			just = [left left]
			scale = 0.33
			id = sfx_dsp_panel_message_10
		}
		formattext textname = my_text11 qs(0xbc90e139) n = ($current_delay_vocals_wetmix) dontassertforchecksums
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

script songsetplayereqsettings 
endscript

script begin_jam_song \{pause = 0}
	getsongtimems
	casttointeger \{time}
	printf \{channel = jam_mode
		qs(0xca536e9e)}
	if NOT notetracker_is_using_stream
		playback_custom_song start_time = <time> in_game = 1
	endif
	musicstudio_init_volumes
	jam_init_reverb
	musicstudio_init_pan
	musicstudio_init_all_line6_effects
	change \{song_is_waiting_to_start = 0}
endscript

script net_stream_mp3 
	printf \{qs(0x2c7f49b5)}
	netsessionfunc \{func = cdn_init}
	wait \{1
		second}
	printf \{qs(0x07521a76)}
	authoringinit
	wait \{1
		second}
	printf \{qs(0x4acd4ff1)}
	if NOT gotparam \{filename}
		filename = 'ClickClickBoom.mp3'
	endif
	authoringgetfile <filename> heap = bottomupheap
	begin
	if authoringisloaded <filename>
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
	stopallsounds
	printf qs(0x50a5d267) s = <filename>
	loadmp3 <filename> usecdn = true
	buffer_pos = (1024 * 1024)
	printf \{qs(0x32de9625)}
	decompressmp3 name = <filename> reset
	decompressmp3 name = <filename> pos = <buffer_pos>
	printf \{qs(0x53bf4f66)}
	addpcmstream mp3stream name = <filename> sample_freq = 44100 floatformat = false
	wait \{2
		gameframe}
	playsound \{mp3stream
		buss = master}
	getstarttime
	song_starttime = <starttime>
	getpcmstreamseekpos \{mp3stream}
	printf qs(0x35461467) i = <pos>
	begin
	getpcmstreamseekpos \{mp3stream}
	new_buffer_pos = (<buffer_pos> + 16 * 1024)
	if (<pos> + 1024 * 1024 > <buffer_pos>)
		if NOT decompressmp3 name = <filename> pos = <new_buffer_pos>
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
	getstarttime
	song_time = (<starttime> - <song_starttime>)
	if (<song_time> >= <song_lengthms>)
		printstruct <...>
		printf \{qs(0x3111b13e)}
		break
	endif
	wait \{1
		gameframe}
	repeat
	stopsound \{mp3stream}
	stopsound \{fsbstream}
	wait \{4
		gameframes}
	decompressmp3 name = <filename> reset
	unloadmp3 name = ($jam_notetracker_mp3)
	removepcmstream \{mp3stream}
	removefsbstream \{fsbstream}
endscript

script preload_mp3_song 
	musicstudio_instrument_unloadall
	getsonginfo
	change jam_notetracker_mp3 = <streamfile>
	change jam_notetracker_usecdn = <usecdn>
	spawnscript \{mp3_decoder}
endscript

script mp3_decoder 
	usecdn = ($jam_notetracker_usecdn)
	if stringcontains text = ($jam_notetracker_mp3) substring = '.fsb'
		usefsb = 1
		progress_required = (32 * 1024)
	else
		usefsb = 0
		progress_required = (100 * 1024)
	endif
	if (<usecdn>)
		createscreenelement \{type = textelement
			parent = root_window
			id = cdn_progress
			just = [
				center
				top
			]
			font = debug
			text = qs(0xc66308a5)
			scale = 0.5
			pos = (640.0, 200.0)
			rgba = [
				250
				245
				145
				255
			]}
	endif
	filename = ($jam_notetracker_mp3)
	if (<usecdn>)
		printf \{qs(0x2c7f49b5)}
		netsessionfunc \{func = cdn_init}
		begin
		if netsessionfunc \{obj = raf
				func = is_ready}
			printf \{qs(0x03c8ecd6)}
			break
		endif
		if netsessionfunc \{obj = raf
				func = check_for_manifest_error}
			printf 'Manifest download error %e' e = <error>
			formattext textname = mp3_text qs(0xcd97b6e0) s = <percent>
			setscreenelementprops id = cdn_progress text = <mp3_text>
			return
			break
		endif
		wait \{1
			gameframe}
		repeat
		printf \{qs(0x07521a76)}
		authoringinit
		printf \{qs(0x1e492b37)}
		authoringgetfile ($jam_notetracker_mp3) heap = heap_musicstudio_guitar
		frames = 0
		last_progress = -1
		begin
		if authoringisloaded <filename>
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
			getpcmstreamseekpos \{mp3stream}
			new_buffer_pos = (<buffer_pos> + 16 * 1024)
		else
			pos = 0
			new_buffer_pos = (<buffer_pos> + 16 * 1024)
		endif
		totalsize = <buffer_pos>
		if (<pos> + 1024 * 1024 > <buffer_pos>)
			if (<usecdn> = 0)
				if decompressmp3 name = <filename> pos = <new_buffer_pos>
				else
					break
				endif
			else
				if authoringisloaded <filename>
					if decompressmp3 name = <filename> pos = <new_buffer_pos>
						finished = 1
					else
						break
					endif
				else
					decompressmp3 name = <filename> pos = <new_buffer_pos> limit = (<progress> - 16000)
				endif
			endif
		endif
		if (<finished> = 1)
			percent = 100
		else
			percent = ((<totalsize> - <pos>) / (1024 * 10))
			if (<percent> > 100)
				percent = 100
			endif
			if (<percent> < 0)
				percent = 0
			endif
		endif
		if (<usecdn>)
			formattext textname = mp3_text qs(0xcfd55336) s = <percent>
			setscreenelementprops id = cdn_progress text = <mp3_text>
		endif
		if (<pcm_registered> = 0)
			if (<totalsize> > 768 * 1024)
				printf \{qs(0xb5286151)}
				addpcmstream mp3stream name = ($jam_notetracker_mp3) sample_freq = 44100 floatformat = false
				pcm_registered = 1
			endif
		endif
		buffer_pos = <totalsize>
		wait \{1
			gameframe}
		repeat
	else
		addfsbstream fsbstream ($jam_notetracker_mp3) usecdn = <usecdn>
		if (<usecdn>)
			begin
			getpcmstreamseekpos \{fsbstream}
			if authoringisloaded <filename>
				formattext \{textname = mp3_text
					qs(0xcfd55336)
					s = 100}
				setscreenelementprops id = cdn_progress text = <mp3_text>
				break
			else
				percent = ((<progress> - <pos>) * 100)
				percent = (<percent> / (128 * 1024))
				if (<percent> > 100)
					percent = 100
				endif
				if (<percent> < 0)
					percent = 0
				endif
				formattext textname = mp3_text qs(0xcfd55336) s = <percent>
				setscreenelementprops id = cdn_progress text = <mp3_text>
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
		effect = [
			{effect = highpass name = mp3_highpass cutoff = 10 resonance = 1.0}
			{effect = lowpass name = mp3_lowpass cutoff = 22000 resonance = 1.0}
		]
		createsoundbusseffects buss = guitar_stream effect = <effect>
		change \{single_stream_effects_created = 1}
	endif
	change \{single_stream_enabled = 1}
	single_stream_reset
	if stringcontains text = ($jam_notetracker_mp3) substring = '.fsb'
		spawnscript \{fsb_streamer}
	else
		spawnscript \{mp3_streamer}
	endif
endscript

script end_mp3_song 
	killspawnedscript \{name = mp3_decoder}
	killspawnedscript \{name = mp3_streamer}
	destroyscreenelement \{id = cdn_progress}
	stopsound \{mp3stream}
	stopsound \{fsbstream}
	wait \{4
		gameframes}
	decompressmp3 name = ($jam_notetracker_mp3) reset
	unloadmp3 name = ($jam_notetracker_mp3)
	removepcmstream \{mp3stream}
	removefsbstream \{fsbstream}
	destroysoundbusseffects \{buss = guitar_stream
		buss_array = [
			mp3_highpass
			mp3_lowpass
		]}
	change \{single_stream_effects_created = 0}
	change \{single_stream_enabled = 0}
	single_stream_reset
endscript

script mp3_streamer 
	playing = 0
	song_starttime = 0
	begin
	if NOT gameispaused
		if (<playing> = 0)
			if ispcmstreamadded \{mp3stream}
				playsound mp3stream buss = guitar_stream vol_percent = ($single_stream_max_vol) pan1x = 0.25 pan1y = 1 pan2x = -0.25 pan2y = 1
				playing = 1
				getstarttime
				song_starttime = <starttime>
			else
				printf \{qs(0xf894a92d)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		else
			getpcmstreamseekpos \{mp3stream}
			if NOT decompressmp3 name = ($jam_notetracker_mp3) pos = 0
				break
			endif
			if (<totalsize> < <pos> + 768 * 1024)
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
	getstarttime
	song_time = (<starttime> - <song_starttime>)
	if (<song_time> >= <song_lengthms>)
		printstruct <...>
		printf \{qs(0x3111b13e)}
		break
	endif
	wait \{1
		gameframe}
	repeat
	stopsound \{mp3stream}
	wait \{4
		gameframes}
	decompressmp3 name = ($jam_notetracker_mp3) reset
	unloadmp3 name = ($jam_notetracker_mp3)
	removepcmstream \{mp3stream}
endscript

script fsb_streamer 
	playing = 0
	song_starttime = 0
	begin
	if NOT gameispaused
		if (<playing> = 0)
			if isfsbstreamadded \{fsbstream}
				playsound fsbstream buss = guitar_stream vol_percent = ($single_stream_max_vol) pan1x = 0.25 pan1y = 1 pan2x = -0.25 pan2y = 1
				playing = 1
				getstarttime
				song_starttime = <starttime>
			else
				printf \{qs(0xd5bbdba1)}
				printstruct <...>
				gh3_start_pressed \{from_handler}
				unpausespawnedscript \{mp3_decoder}
				unpausespawnedscript \{rafoverlay_thread}
			endif
		else
			getfsbstreamseekpos \{fsbstream}
			if authoringisloaded ($jam_notetracker_mp3)
				break
			endif
			if (<progress> < <pos> + 16 * 1024)
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
