jam_notetracker_mp3 = 'loopandloop.mp3'
jam_notetracker_usecdn = 0
jam_notetracking = 0
jam_stream_volume = 0.45000002
jam_notetracker_play_mode = 0
notetracker_note_held = 0
notetracker_note_held_time = 0
notetracker_in_quickedit = 0
notetracker_song_mode = 0
notetracker_quickedit_mode = Normal
notetrack_vocal_pitch_volume = 100
notetracker_vocal_shear_scaling = 1.1
notetracker_vocal_colors = [
	[
		0
		0
		200
		150
	]
	[
		0
		200
		0
		150
	]
	[
		200
		200
		0
		150
	]
	[
		200
		0
		0
		150
	]
]
notetracker_vocal_skip_color = [
	100
	100
	100
	150
]
notetracker_vocal_spoken_color = [
	200
	150
	150
	150
]
notetracker_vocal_quantize = 40
notetracker_lyric_display_params = {
	num_lyrics = 12
	start_pos = (950.0, 500.0)
	offset_pos = (0.0, -35.0)
	rgba = [
		255
		255
		255
		100
	]
	Scale = 0.4
	z_priority = 15.0
}
notetracker_vocal_singing_lag = 50
notetracker_movement_speed = 1.0
notetracker_play_sound_disable = 0
notetracker_quickedit_dropnote_snap_forward_ms = 100
notetracker_quickedit_dropnote_snap_backward_ms = 100
notetracker_quickedit_sustain_max = 20000
notetracker_quickedit_dropvocalnote_snap_forward_ms = 80
notetracker_quickedit_dropvocalnote_snap_backward_ms = 40
drum_delete_hold_frames = 6
jam_whammy_max_rewind_per_frame_ms = 1280.0
jam_whammy_direction = -1
jam_whammy_curve = 6
notetracker_from_menu_state = 0
notetracker_skip_by_note = 0

script musicstudio_notetracker_init \{editing = 0}
	jam_setup_song editing = <editing> advanced_record = 1
	Change \{jam_advanced_record = 1}
	musicstudio_notetracker_create_highway
	musicstudio_destroy_all_line6_effects
	musicstudio_mainobj :musicstudioghmix_init \{id = musicstudio_ghmix}
	musicstudio_mainobj :musicstudioghmix_setupdate \{On = true}
	notetracker_register_song
	musicstudio_mainobj :musicstudio_init \{using_samples = FALSE
		Stream = true}
	musicstudio_player0 :musicstudioplayer_setusingsamples \{using_samples = FALSE}
	notetracker_set_play_mode_text
	notetracker_set_instrument_text
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
	<main_player> :musicstudioplayer_allowopennote open_note_allowed = FALSE
	<main_player> :musicstudioplayer_getplayerindex
	musicstudio_setup_player_part Player = <Player>
	musicstudio_hide_nowbar_extended
	musicstudio_mainobj :musicstudioghmix_setmetronome \{On = FALSE}
	setsonginfo \{playback_track1 = 0}
	setsonginfo \{playback_track2 = 0}
	musicstudio_mainobj :musicstudioghmix_setsnap \{snap = 10}
	musicstudio_mainobj :musicstudioghmix_getsoundindex \{track = melody
		Sound = glockenspiel}
	Change current_notetracker_vocal_playsfx_index = <sound_index>
	SpawnScriptNow musicstudio_instrument_loadkeyboard params = {index = <sound_index>}
	FileName = ($jam_notetracker_mp3)
	if stringcontains text = <FileName> substring = '.fsb'
		stringremove text = <FileName> remove = '.fsb' new_string = stemname
	else
		stringremove text = <FileName> remove = '.mp3' new_string = stemname
	endif
	formatText TextName = FileName '%s.txt' s = <stemname>
	printf qs(0x3cdd3637) s = <FileName>
	musicstudio_mainobj :musicstudio_loadlyrics FileName = <FileName>
	printf \{qs(0x1986e9e4)}
	initmicpitch
	notetracker_quickedit_vocal_pitch_indicator_init
	musicstudio_stop_menu_music
endscript

script show_lyrics 
	musicstudio_mainobj :musicstudio_getnumlyrics
	printf \{qs(0xb215034f)}
	index = 0
	begin
	musicstudio_mainobj :musicstudio_getlyric lyric_index = <index>
	printf qs(0xf25770be) i = <lyric> l = <lyric_len>
	index = (<index> + 1)
	repeat <num_lyrics>
	printf \{qs(0x60fb082f)}
endscript

script notetracker_toggle_song_mode 
	if ($notetracker_song_mode = 1)
		notetracker_deinit_song_mode
	else
		notetracker_init_song_mode
	endif
endscript

script musicstudio_setup_player_part 
	getplayerinfo <Player> controller
	if isdrumcontroller controller = <controller>
		instrument = 3
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_setinstrument instrument = <instrument>
		setplayerinfo <Player> part = drum
		setplayerinfo <Player> jam_instrument = (<instrument>)
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	else
		setplayerinfo <Player> part = guitar
	endif
endscript

script notetracker_init_song_mode 
	if ($notetracker_song_mode = 0)
		musicstudio_mainobj :musicstudiohighway_songview \{On = true}
		musicstudio_mainobj :musicstudioghmix_getsongtime
		musicstudio_ghmix_destroy_highway
		musicstudio_notetracker_create_highway_song
		Change \{notetracker_song_mode = 1}
		musicstudio_mainobj :musicstudioghmix_reinitconstants
		musicstudio_mainobj :musicstudioghmix_movehighway time = <song_time>
	endif
endscript

script notetracker_deinit_song_mode 
	if ($notetracker_song_mode = 1)
		musicstudio_mainobj :musicstudiohighway_songview \{On = FALSE}
		musicstudio_mainobj :musicstudioghmix_getsongtime
		musicstudio_ghmix_destroy_highway
		musicstudio_notetracker_create_highway <...>
		Change \{notetracker_song_mode = 0}
		musicstudio_mainobj :musicstudioghmix_reinitconstants
		musicstudio_mainobj :musicstudioghmix_movehighway time = <song_time>
	endif
endscript

script notetracker_zoom_song \{pixels_per_beat = 80
		gem_scale = 1.0}
	if GotParam \{reset}
		<pixels_per_beat> = 80
		<gem_scale> = 0.8
	endif
	if GotParam \{cycle}
		if ($musicstudio_notetracker_current_pixels_per_beat > 80)
			<pixels_per_beat> = 80
			<gem_scale> = 1.0
		else
			if ($musicstudio_notetracker_current_pixels_per_beat > 30)
				<pixels_per_beat> = 30
				<gem_scale> = 0.3
			else
				<pixels_per_beat> = 130
				<gem_scale> = 1.3
			endif
		endif
	endif
	if GotParam \{cycle_down}
		if ($musicstudio_notetracker_current_pixels_per_beat < 50)
			<pixels_per_beat> = 50
			<gem_scale> = 0.5
		else
			if ($musicstudio_notetracker_current_pixels_per_beat < 80)
				<pixels_per_beat> = 80
				<gem_scale> = 0.8
			else
				if ($musicstudio_notetracker_current_pixels_per_beat < 100)
					<pixels_per_beat> = 100
					<gem_scale> = 1.0
				else
					<pixels_per_beat> = 130
					<gem_scale> = 1.3
				endif
			endif
		endif
	endif
	if GotParam \{cycle_up}
		if ($musicstudio_notetracker_current_pixels_per_beat > 100)
			<pixels_per_beat> = 100
			<gem_scale> = 1.0
		else
			if ($musicstudio_notetracker_current_pixels_per_beat > 80)
				<pixels_per_beat> = 80
				<gem_scale> = 0.8
			else
				if ($musicstudio_notetracker_current_pixels_per_beat > 50)
					<pixels_per_beat> = 50
					<gem_scale> = 0.5
				else
					<pixels_per_beat> = 30
					<gem_scale> = 0.3
				endif
			endif
		endif
	endif
	printstruct channel = music_studio <...>
	if GotParam \{zoom_in}
		<pixels_per_beat> = ($musicstudio_notetracker_current_pixels_per_beat + 10)
		if (<pixels_per_beat> > 30)
			<gem_scale> = ($musicstudio_notetracker_current_gem_scale + 0.1)
		else
			<gem_scale> = 0.3
		endif
		if ((<pixels_per_beat> > 160) || (<gem_scale> > 1.4))
			<pixels_per_beat> = 160
			<gem_scale> = 1.4
		endif
	elseif GotParam \{zoom_out}
		<pixels_per_beat> = ($musicstudio_notetracker_current_pixels_per_beat - 10)
		<gem_scale> = ($musicstudio_notetracker_current_gem_scale - 0.1)
		if ((<pixels_per_beat> < 8) || (<gem_scale> < 0.3))
			<pixels_per_beat> = 8
			<gem_scale> = 0.3
		endif
	endif
	PlaySound menu_colorwheel_rotate vol = 4 pitch_percent = (50 + <pixels_per_beat> / 2) buss = Front_End
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_ghmix_destroy_highway
	musicstudio_notetracker_create_highway <...>
	musicstudio_mainobj :musicstudioghmix_reinitconstants
	musicstudio_mainobj :musicstudioghmix_movehighway time = <song_time>
	Change musicstudio_notetracker_current_pixels_per_beat = <pixels_per_beat>
	Change musicstudio_notetracker_current_gem_scale = <gem_scale>
endscript

script notetracker_is_using_stream 
	if musicstudio_mainobj :musicstudio_isusingstream
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script notetracker_record_song 
endscript

script notetracker_register_song 
	if ($jam_notetracking = 1)
		printf \{qs(0x2aa7c55c)}
		if ($jam_notetracker_usecdn = 1)
			SpawnScriptNow \{begin_download_mp3}
		else
			loadmp3 ($jam_notetracker_mp3) usecdn = ($jam_notetracker_usecdn) Heap = heap_musicstudio_guitar
			spawnscript async_decompress params = {usecdn = ($jam_notetracker_usecdn) FileName = ($jam_notetracker_mp3)}
			addmp3stream xmp Name = ($jam_notetracker_mp3)
		endif
		printf \{qs(0x823d2440)}
	endif
endscript

script begin_download_mp3 
	FileName = ($jam_notetracker_mp3)
	authoringgetfile <FileName> Heap = BottomUpHeap
	frames = 0
	last_progress = -1
	begin
	if authoringisloaded <FileName>
		printf \{qs(0x80bb28ad)}
		break
	else
		if (<progress> != <last_progress>)
			printf qs(0x79981298) i = <progress>
			last_progress = <progress>
		endif
		if (<current> = FALSE)
			frames = (<frames> + 1)
			if (<frames> = 120)
				printf \{qs(0x67534dab)}
				authoringgetfile <FileName> Heap = BottomUpHeap
				frames = 0
			endif
		endif
		if (<progress> > 100000)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	loadmp3 ($jam_notetracker_mp3) usecdn = ($jam_notetracker_usecdn) Heap = heap_musicstudio_guitar
	addmp3stream xmp Name = ($jam_notetracker_mp3)
	spawnscript async_decompress params = {usecdn = ($jam_notetracker_usecdn) FileName = ($jam_notetracker_mp3)}
endscript

script async_decompress 
	add = 16000
	begin
	if (<usecdn> = 0)
		if downsamplemp3 Name = <FileName> additional_bytes = <add>
		else
			break
		endif
	else
		if authoringisloaded <FileName>
			if downsamplemp3 Name = <FileName> additional_bytes = <add>
			else
				break
			endif
		else
			downsamplemp3 Name = <FileName> additional_bytes = <add> limit = (<progress> - 16000)
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if GotParam \{error}
		return
	endif
endscript
musicstudio_whammy_hold_count = 0
musicstudio_whammy_rewind = 0
musicstudio_whammy_hold_start_counting_speed = 200
musicstudio_whammy_hold_frames_to_increase = 60
musicstudio_whammy_hold_frames_to_increase_2 = 120

script notetracker_whammy_rewind 
	if NOT ($blade_active = 1)
		if NOT musicstudio_mainobj :musicstudio_isusingstream
			if ($musicstudio_whammy_hold_count > ($musicstudio_whammy_hold_frames_to_increase))
				<speed> = (<speed> * 2)
				if ($musicstudio_whammy_hold_count > ($musicstudio_whammy_hold_frames_to_increase_2))
					<speed> = (<speed> * 2)
				endif
			endif
		endif
		<rewind_time> = (<speed> * ($jam_whammy_direction))
		musicstudio_mainobj :musicstudioghmix_getsongtime
		<new_time> = (<song_time> + <rewind_time>)
		CastToInteger \{new_time}
		musicstudio_mainobj :musicstudioghmix_rewindhighway time = <new_time>
		if (<speed> > ($musicstudio_whammy_hold_start_counting_speed))
			Change musicstudio_whammy_hold_count = ($musicstudio_whammy_hold_count + 1)
		else
			Change \{musicstudio_whammy_hold_count = 0}
		endif
		if ($notetracker_in_quickedit = 1)
			notetracker_calculate_quickedit_actions
		endif
		Change \{musicstudio_whammy_rewind = 1}
	endif
endscript

script notetracker_whammy_rewind_stop 
	if musicstudio_mainobj :musicstudiohighway_issongview
		if NOT musicstudio_innotetracker
			musicstudio_skip_closest_snap
		endif
	endif
	if NOT musicstudio_innotetracker
		if NOT ($musicstudio_note_edit_mode = None)
			if ($musicstudio_note_edit_mode = set_playable)
				musicstudio_skip_closest_snap snap = (1.0)
			else
				musicstudio_skip_next_note
			endif
		else
			musicstudio_force_skip_to_closest_tick
		endif
	endif
	Change \{musicstudio_whammy_hold_count = 0}
	Change \{musicstudio_whammy_rewind = 0}
	if ScriptIsRunning \{jam_recording_metronome}
		if NOT musicstudio_innotetracker
			musicstudio_mainobj :musicstudioghmix_getsongtime
			KillSpawnedScript \{Name = jam_recording_metronome}
			musicstudio_ghmix :Obj_SpawnScriptNow jam_recording_metronome params = {bpm = ($jam_current_bpm) time = <song_time> sound_only}
		endif
	endif
endscript

script notetracker_whammy_set_rewind 
	Change \{jam_whammy_direction = -1}
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_main_highway_arrow param = ghmix_main_highway_arrow
				<ghmix_main_highway_arrow> :SetProps flip_h = true
				KillSpawnedScript \{Name = notetracker_whammy_direction_change_arrow_notify}
				SpawnScriptNow \{notetracker_whammy_direction_change_arrow_notify
					params = {
						Color = [
							255
							0
							0
							255
						]
					}}
			endif
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_highway_small_arrow_container param = ghmix_highway_small_arrow_container
				<ghmix_highway_small_arrow_container> :SetProps rot_angle = 180
			endif
		endif
	endif
endscript

script notetracker_whammy_set_fast_forward 
	Change \{jam_whammy_direction = 1}
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_main_highway_arrow param = ghmix_main_highway_arrow
				<ghmix_main_highway_arrow> :SetProps flip_h = FALSE
				KillSpawnedScript \{Name = notetracker_whammy_direction_change_arrow_notify}
				SpawnScriptNow \{notetracker_whammy_direction_change_arrow_notify
					params = {
						Color = [
							0
							255
							0
							255
						]
					}}
			endif
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_highway_small_arrow_container param = ghmix_highway_small_arrow_container
				<ghmix_highway_small_arrow_container> :SetProps rot_angle = 0
			endif
		endif
	endif
endscript

script notetracker_whammy_direction_change_arrow_notify \{Color = [
			255
			255
			255
			255
		]}
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_main_highway_arrow param = ghmix_main_highway_arrow
				<ghmix_main_highway_arrow> :SetProps Scale = 2.2 rgba = <Color>
				Wait \{1
					frames}
				if ScreenElementExists \{id = musicstudio_ghmix}
					<ghmix_main_highway_arrow> :SetProps Scale = 1.6 time = 0.1
				endif
				Wait \{10
					frames}
				if ScreenElementExists \{id = musicstudio_ghmix}
					<ghmix_main_highway_arrow> :SetProps Scale = 2.0 time = 0.1
				endif
			endif
		endif
	endif
endscript

script notetracker_set_instrument_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	text = ($jam_tracks [<instrument>].name_text)
	formatText TextName = text qs(0x646d1d57) a = qs(0x5fa8c51d) b = <text>
	musicstudio_ghmix :se_setprops ab_mode_text = <text>
endscript

script notetracker_switch_instrument 
	printf \{channel = musicstudio
		qs(0x56c2a976)}
	musicstudio_ghmix_destroy_highway
	musicstudio_mainobj :musicstudioghmix_switchinstrument direction = <direction>
	musicstudio_notetracker_create_highway instrument = <new_instrument>
	musicstudio_mainobj :musicstudioghmix_movehighway time = <curr_song_time>
	notetracker_set_instrument_text
endscript

script notetracker_switch_instrument_left 
	notetracker_switch_instrument \{direction = 1}
endscript

script notetracker_switch_instrument_right 
	notetracer_switch_instrument \{direction = -1}
endscript

script notetracker_set_play_mode_text 
	switch ($jam_notetracker_play_mode)
		case 0
		text = qs(0xaebc3015)
		case 1
		text = qs(0xc22d9d11)
		case 2
		text = qs(0xfb566dc5)
	endswitch
	musicstudio_ghmix :se_setprops playback_mode_text = <text>
endscript

script notetracker_update_selection_loop \{select_area_start = 0
		select_area_end = 10}
	musicstudio_mainobj :musicstudioghmix_getselectarea \{include_downbeat = true}
	musicstudio_mainobj :musicstudioghmix_setloop \{CLEAR = true}
	musicstudio_mainobj :musicstudioghmix_setloop low_bound = <select_area_start>
	musicstudio_mainobj :musicstudioghmix_setloop high_bound = <select_area_end>
endscript

script notetracker_play_mode_toggle 
	<new_play_mode> = (($jam_notetracker_play_mode) + 1)
	if (<new_play_mode> > 1)
		<new_play_mode> = 0
	endif
	Change jam_notetracker_play_mode = <new_play_mode>
	notetracker_set_play_mode_text
endscript

script notetracker_live_record 
	clean_up_user_control_helpers
	notetracker_playback
	Change \{jam_highway_recording = 1}
endscript

script notetracker_playback \{repeat_selection = FALSE}
	<speed> = ($notetracker_record_speed * $notetracker_movement_speed)
	repeat_selection = FALSE
	if NOT GotParam \{scrolling}
		switch ($jam_notetracker_play_mode)
			case 1
			repeat_selection = true
			musicstudio_mainobj :musicstudioghmix_movehighway \{loop_start}
			case 2
			musicstudio_mainobj :musicstudioghmix_movehighway \{time = 0}
		endswitch
	endif
	printf \{qs(0xe3c5a9b2)}
	musicstudio_mainobj :musicstudioghmix_setspeed speed = <speed>
	musicstudio_mainobj :musicstudioghmix_seek
	printf \{qs(0xc8e8fa71)}
	error = 0
	begin
	if musicstudio_mainobj :musicstudioghmix_isready
		if (<error>)
			return
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	printf \{qs(0xd1f3cb30)}
	musicstudio_mainobj :musicstudioghmix_seek
	printf \{qs(0x9eb25df7)}
	begin
	if musicstudio_mainobj :musicstudioghmix_isready
		if (<error>)
			return
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if GotParam \{scrolling}
		<speed> = 1
		setdspeffectparams \{effects = [
				{
					effect = PitchShift
					Name = jampitchshift
					pitch = 1
				}
			]}
	endif
	setslomo <speed>
	musicstudio_mainobj :musicstudioghmix_setspeed speed = <speed>
	musicstudio_mainobj :musicstudioghmix_play On = true repeat_selection = <repeat_selection>
	if NOT GotParam \{scrolling}
		musicstudio_preview
	endif
endscript
notetracker_playback_restarting = 0
notetracker_playback_restart_request = 0
notetracker_playback_restart_repeat_selection = 0

script notetracker_playback_restart 
	printf \{qs(0x2038b80d)}
	Change \{notetracker_playback_restart_repeat_selection = 0}
	if GotParam \{repeat_selection}
		Change \{notetracker_playback_restart_repeat_selection = 1}
	endif
	if ($notetracker_playback_restarting = 1)
		Change \{notetracker_playback_restart_request = 1}
		return
	endif
	Change \{notetracker_playback_restarting = 1}
	begin
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	if (<was_playing> = FALSE)
		Change \{notetracker_playback_restarting = 0}
		return
	endif
	Wait \{2
		gameframe}
	musicstudio_mainobj :musicstudioghmix_seek
	error = 0
	begin
	if musicstudio_mainobj :musicstudioghmix_isready
		if (<error>)
			printf \{qs(0x5db31858)}
			Change \{notetracker_playback_restarting = 0}
			return
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	musicstudio_mainobj :musicstudioghmix_seek
	begin
	if musicstudio_mainobj :musicstudioghmix_isready
		if (<error>)
			printf \{qs(0x769e4b9b)}
			Change \{notetracker_playback_restarting = 0}
			return
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($notetracker_playback_restart_request = 1)
		Change \{notetracker_playback_restart_request = 0}
	else
		if ($notetracker_playback_restart_repeat_selection = 1)
			musicstudio_mainobj :musicstudioghmix_startstream \{On = true
				repeat_selection = true}
		else
			musicstudio_mainobj :musicstudioghmix_startstream \{On = true}
		endif
		break
	endif
	repeat
	Change \{notetracker_playback_restarting = 0}
endscript

script notetracker_playback_stop 
	if GotParam \{scrolling}
		<pitch> = (1.0 / $notetracker_record_speed)
		setdspeffectparams effects = [{effect = PitchShift Name = jampitchshift pitch = <pitch>}]
	endif
	setslomo \{1.0}
	musicstudio_mainobj :musicstudioghmix_setspeed \{speed = 1.0}
	musicstudio_mainobj :musicstudioghmix_play \{On = FALSE}
	musicstudio_preview_stop
endscript

script notetracker_selection_record 
	notetracker_playback \{repeat_selection = true}
	Change \{jam_highway_recording = 1}
endscript

script notetracker_selection_record_stop 
	musicstudio_playback_stop
	Change \{jam_highway_recording = 0}
endscript

script musicstudio_notetracker_deinit 
	printf \{qs(0xe1c68b2a)}
	notetracker_quickedit_vocal_pitch_indicator_deinit
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	<main_player> :musicstudioplayer_allowopennote open_note_allowed = true
	musicstudio_ghmix_destroy_highway
	Change \{jam_advanced_record = 0}
	musicstudio_mainobj :musicstudioghmix_setupdate \{On = FALSE}
	KillSpawnedScript \{id = jam_recording_spawns}
	musicstudio_preview_stop
	musicstudio_playback_stop
	musicstudio_live_record_stop
	musicstudio_step_record_stop
	KillSpawnedScript \{Name = async_decompress}
	KillSpawnedScript \{Name = begin_download_mp3}
	unloadmp3 Name = ($jam_notetracker_mp3)
	if ($jam_notetracker_usecdn = 1)
		authoringrelease Name = ($jam_notetracker_mp3)
	endif
	musicstudio_start_menu_music
endscript
musicstudio_notetracker_current_pixels_per_beat = 80
musicstudio_notetracker_current_gem_scale = 1.0

script musicstudio_notetracker_create_highway \{song = editable}
	musicstudio_create_highway {
		pixels_per_beat = 80
		visible_after = -400
		visible_before = 100
		highway_pos = (-55.0, 419.0)
		waveform = 1
		<...>
	}
	if ScreenElementExists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias Name = ghmix_main_highway_arrow param = ghmix_main_highway_arrow
				<ghmix_main_highway_arrow> :SetProps Scale = 2.0
			endif
		endif
	endif
endscript

script musicstudio_notetracker_create_highway_song \{song = editable}
	musicstudio_create_highway {
		pixels_per_beat = 8
		visible_after = -400
		visible_before = 100
		highway_pos = (-55.0, 419.0)
		waveform = 1
		gem_scale = 0.35000002
		small_view = 1
		<...>
	}
endscript

script musicstudio_notetracker_control_helpers \{scrub_direction = qs(0x0d01351b)}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xbde61b0d)
		button = strumbar
		z = 100}
	add_user_control_helper \{text = qs(0xc88a9b82)
		button = back
		z = 100}
endscript

script notetracker_quickedit_handle_drum_input 
	printstruct <...>
	switch <button>
		case green
		choose_params = {button = orange pad = L1}
		case red
		choose_params = {button = green pad = X}
		case yellow
		choose_params = {button = red pad = circle}
		case blue
		choose_params = {button = yellow pad = Triangle}
		case orange
		choose_params = {button = blue pad = Square}
		default
	endswitch
	return <choose_params>
endscript

script notetracker_quickedit_select_note 
	printf \{qs(0x19c96bb2)}
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getplayerindex
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 5)
		notetracker_quickedit_select_note_vocals <...>
		return
	endif
	if (<instrument> = 3)
		if ($notetracker_scrolling = 1)
			return
		endif
	endif
	findgem_params = {
		track = ($jam_tracks [<instrument>].id)
		time = <song_time>
		search_range_forward_ms = ($notetracker_quickedit_dropnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropnote_snap_backward_ms)
		include_sustain = FALSE
	}
	musicstudio_mainobj :musicstudioghmix_findgem <findgem_params> button = all
	<all_index> = <index>
	musicstudio_mainobj :musicstudioghmix_findgem <findgem_params> button = <button>
	if (<index> != -1)
		action = delete
	else
		if (<all_index> != -1)
			action = insert
			index = <all_index>
		else
			action = add
		endif
	endif
	musicstudio_mainobj :musicstudioghmix_performgemaction {
		track = ($jam_tracks [<instrument>].id)
		button = <button>
		time = <song_time>
		action = <action>
		index = <index>
		apply_to_all
	}
	notetracker_calculate_quickedit_actions
	if GotParam \{action_delete}
		return
	endif
	if ($notetracker_note_held = 1)
		return
	endif
	Change \{notetracker_note_held = 1}
	Change notetracker_note_held_time = <song_time>
	OnExitRun \{notetracker_quickedit_select_note_onexit}
	quickedit_hold_wait_frames = 3
	held_down = 1
	begin
	if NOT ControllerPressed <pad>
		<held_down> = 0
		break
	endif
	Wait \{1
		gameframe}
	repeat <quickedit_hold_wait_frames>
	if (<held_down> = 1)
		if musicstudio_mainobj :musicstudioghmix_pickupnotesustain {
				track = ($jam_tracks [<instrument>].id)
				button = <button>
				time = <song_time>
			}
			printf channel = music_studio qs(0x0a8cd800) a = <button>
			musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			<main_player> :musicstudiomenu_setstate {
				id = <ghmix_menu>
				state = notetracker_quickedit_taildrag_state
				init_params = {button = <button> pad = <pad>}
			}
		endif
	endif
endscript

script notetracker_quickedit_select_note_onexit 
	Change \{notetracker_note_held = 0}
endscript

script notetracker_quickedit_select_note_vocals 
	printf \{qs(0x4a6d0f62)}
	printstruct <...>
	if ($notetracker_note_held = 1)
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_findgem {
		track = ($jam_tracks [<instrument>].id)
		time = <song_time>
		search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
		include_sustain = true
	}
	notetracker_select_highlight index = <index>
	if ($notetracker_quickedit_mode = Normal)
		switch <button>
			case green
			if (<index> = -1)
				action = addremove
			else
				action_script = notetracker_quickedit_removeorholdnote
			endif
			case red
			setstate = notetracker_quickedit_lyric
			case yellow
			setstate = notetracker_quickedit_pitch
			case blue
			setstate = notetracker_quickedit_settings
			case orange
			default
		endswitch
	elseif ($notetracker_quickedit_mode = lyric)
		switch <button>
			case green
			action = togglelyric
			case red
			action_script = notetracker_jump_to_menu
			action_params = {musicstudio_state_now = notetracker_changechar_quick_state pad = circle}
			case yellow
			if (<index> != -1)
				if NOT notetracker_quickedit_isnoteskipped index = <index>
					action = togglespoken
				endif
			endif
			case blue
			action = toggleskip
			case orange
			default
		endswitch
	elseif ($notetracker_quickedit_mode = pitch)
		switch <button>
			case green
			action_script = notetracker_jump_to_menu
			action_params = {musicstudio_state_now = notetracker_changepitch_quick_state pad = X}
			case red
			action = singpitch
			case yellow
			action = join
			if (<index> != -1)
				musicstudio_mainobj :musicstudio_getcurrmainplayer
				<main_player> :musicstudioplayer_getinstrument
				getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
				if (<note_length> > $notetracker_vocal_quantize * 3)
					if (<select> = -1)
						action = Split
					endif
				endif
			endif
			case blue
			setstate = notetracker_quickedit_vocal_keyboard
			case orange
			default
		endswitch
	elseif ($notetracker_quickedit_mode = settings)
		switch <button>
			case green
			action_script = notetracker_quickedit_lag_change
			action_params = up
			auto_repeat = 1
			case red
			action_script = notetracker_quickedit_lag_change
			action_params = down
			auto_repeat = 1
			case yellow
			case blue
			case orange
			default
		endswitch
	endif
	if GotParam \{setstate}
		musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		<main_player> :musicstudiomenu_setstate {
			id = <ghmix_menu>
			state = <setstate>
			init_params = {button = <button> pad = <pad>}
		}
	endif
	Change \{notetracker_note_held = 1}
	Change notetracker_note_held_time = <song_time>
	OnExitRun \{notetracker_quickedit_select_note_vocals_onexit}
	if GotParam \{action}
		action_params = {
			track = ($jam_tracks [<instrument>].id)
			action = <action>
			time = <song_time>
			search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
			search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
			include_sustain = true
			pad = <pad>
			select = <select>
		}
		musicstudio_mainobj :musicstudioghmix_performvocalaction <action_params>
	elseif GotParam \{action_script}
		if GotParam \{auto_repeat}
			notetracker_quickedit_autorepeat <...>
		else
			<action_script> <...> <action_params>
		endif
		notetracker_calculate_quickedit_actions
		return
	else
		notetracker_calculate_quickedit_actions
		return
	endif
	if NOT GotParam \{action_added}
		notetracker_calculate_quickedit_actions
		return
	endif
	quickedit_hold_wait_frames = 3
	held_down = 1
	begin
	if NOT ControllerPressed <pad>
		<held_down> = 0
		break
	endif
	Wait \{1
		gameframe}
	repeat <quickedit_hold_wait_frames>
	if (<held_down> = 1)
		if musicstudio_mainobj :musicstudioghmix_pickupnotesustain {
				track = ($jam_tracks [<instrument>].id)
				button = <button>
				time = <song_time>
			}
			printf channel = music_studio qs(0x0a8cd800) a = <button>
			musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			<main_player> :musicstudiomenu_setstate {
				id = <ghmix_menu>
				state = notetracker_quickedit_taildrag_vocal_state
				init_params = {button = <button> pad = <pad>}
			}
		endif
	endif
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_select_note_vocals_onexit 
	Change \{notetracker_note_held = 0}
endscript

script notetracker_quickedit_autorepeat 
	printf \{qs(0xe141bbf6)}
	<action_script> <...> <action_params>
	GetStartTime
	starthold = <starttime>
	begin
	if NOT ControllerPressed <pad>
		return
	endif
	getelapsedtime starttime = <starthold>
	if (<ElapsedTime> > 400)
		getelapsedtime starttime = <starttime>
		if (<ElapsedTime> > 100)
			GetStartTime
			<action_script> <...> <action_params>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script notetracker_quickedit_removeorholdnote 
	printf \{qs(0xc3a3eda0)}
	Change \{notetracker_disable_jump_to_menu = 1}
	Change \{notetracker_calculate_quickedit_actions_disable = 1}
	Change \{notetracker_play_sound_disable = 1}
	Change \{musicstudio_show_nowbar_particles = 0}
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
	notetracker_select_highlight index = <index>
	musicstudio_mainobj :musicstudioghmix_getsongtime
	time_offset = (<note_time> - <song_time>)
	held_down = 0
	GetStartTime
	begin
	if NOT ControllerPressed <pad>
		break
	endif
	getelapsedtime starttime = <starttime>
	if (<ElapsedTime> > 400)
		held_down = 1
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<held_down> = 0)
		action_params = {
			track = ($jam_tracks [<instrument>].id)
			action = addremove
			time = <song_time>
			search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
			search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
			include_sustain = true
			pad = <pad>
		}
		musicstudio_mainobj :musicstudioghmix_performvocalaction <action_params>
	elseif (<held_down> = 1)
		Change \{notetracker_movement_speed = 0.4}
		begin
		if NOT ControllerPressed <pad>
			break
		endif
		musicstudio_mainobj :musicstudioghmix_getsongtime
		if (<select> = 0)
			musicstudio_mainobj :musicstudioghmix_updatenotetime track = ($jam_tracks [(<instrument>)].id) time = (<song_time> + <time_offset>) index = <index> update_sustain = true
		elseif (<select> = 1)
			musicstudio_mainobj :musicstudioghmix_updatenotesustain track = ($jam_tracks [(<instrument>)].id) time = (<song_time> + <time_offset> + <note_length>) index = <index>
		else
			musicstudio_mainobj :musicstudioghmix_updatenotetime track = ($jam_tracks [(<instrument>)].id) time = (<song_time> + <time_offset>) index = <index> update_sustain = FALSE
		endif
		musicstudio_mainobj :musicstudioghmix_refreshgems
		<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
		Wait \{1
			gameframe}
		repeat
		Change \{notetracker_movement_speed = 1.0}
	endif
	Change \{notetracker_disable_jump_to_menu = 0}
	Change \{notetracker_calculate_quickedit_actions_disable = 0}
	Change \{notetracker_play_sound_disable = 0}
	Change \{musicstudio_show_nowbar_particles = 1}
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script notetracker_quickedit_lag_change \{diff = 5}
	if GotParam \{up}
		Change notetracker_vocal_singing_lag = ($notetracker_vocal_singing_lag + <diff>)
	else
		Change notetracker_vocal_singing_lag = ($notetracker_vocal_singing_lag - <diff>)
	endif
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_lyric_init 
	printf \{qs(0xc451a74d)}
	Change \{notetracker_quickedit_mode = lyric}
	Change \{notetracker_in_quickedit = 1}
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_lyric_deinit 
	printf \{qs(0x439f7e26)}
	Change \{notetracker_quickedit_mode = Normal}
	Change \{notetracker_in_quickedit = 0}
endscript

script notetracker_quickedit_pitch_init 
	printf \{qs(0x29367aea)}
	Change \{notetracker_quickedit_mode = pitch}
	Change \{notetracker_in_quickedit = 1}
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_pitch_deinit 
	printf \{qs(0xe2759a5c)}
	Change \{notetracker_in_quickedit = 0}
endscript

script notetracker_quickedit_settings_init 
	printf \{qs(0xfa613fe2)}
	Change \{notetracker_quickedit_mode = settings}
	Change \{notetracker_in_quickedit = 1}
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_settings_deinit 
	printf \{qs(0xbbb0b565)}
	Change \{notetracker_quickedit_mode = Normal}
	Change \{notetracker_in_quickedit = 0}
endscript

script notetracker_quickedit_vocal_keyboard_init 
	SpawnScriptNow \{notetracker_quickedit_vocal_keyboard_update}
endscript

script notetracker_quickedit_vocal_keyboard_deinit 
	KillSpawnedScript \{Name = notetracker_quickedit_vocal_keyboard_update}
endscript

script notetracker_quickedit_vocal_keyboard_skip_forward 
	notetracker_skip_forward
endscript

script notetracker_quickedit_vocal_keyboard_skip_backward 
	notetracker_skip_backward
endscript

script notetracker_quickedit_vocal_keyboard_select_note 
endscript

script notetracker_quickedit_vocal_keyboard_update 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	track = ($jam_tracks [<instrument>].id)
	search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
	search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
	include_sustain = true
	last_pitch = -1
	wait_for_no_note = 1
	begin
	musicstudio_mainobj :musicstudioghmix_getsongtime
	time = <song_time>
	musicstudio_mainobj :musicstudioghmix_findgem <...>
	if (<index> != -1)
		musicstudio_mainobj :musicstudioghmix_setgemhighlight index = <index> select = -1
		getcustomnote <...>
		musicstudio_mainobj :musicstudio_getmainplayercontroller
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		pitch = -1
		Enabled = 1
		if GetHeldPattern controller = <controller> Player = <playerid_index>
			switch <hold_pattern>
				case 65536
				pitch = 0
				if (<last_pitch> = 10 ||
						<last_pitch> = 11)
					last_pitch = 0
				endif
				case 4096
				pitch = 1
				case 256
				pitch = 2
				case 16
				pitch = 3
				case 1
				pitch = 4
				case 69632
				pitch = 10
				case 65792
				pitch = 11
				default
			endswitch
		endif
		if guitargettouchpattern \{Player = 1}
			printf \{qs(0x75952bbe)}
			switch <touch_pattern>
				case 65536
				pitch = 5
				case 4096
				pitch = 6
				case 256
				pitch = 7
				case 16
				pitch = 8
				case 1
				pitch = 9
				default
			endswitch
		endif
		if (<wait_for_no_note> = 1)
			if (<pitch> = -1)
				wait_for_no_note = 0
			else
				Enabled = 0
			endif
		endif
		if (<pitch> != <last_pitch> &&
				<Enabled> = 1)
			last_pitch = <pitch>
			if (<pitch> != -1)
				printf qs(0xbab28041) i = <pitch>
				musicstudio_mainobj :musicstudioghmix_setvocalpitch {
					<...>
					pitch = <pitch>
					octave = <vocal_octave>
				}
				notetracker_quickedit_playpitch <...>
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script notetracker_quickedit_pitchupdown_autorepeat 
	GetStartTime
	starthold = <starttime>
	begin
	if NOT ControllerPressed <pad>
		return
	endif
	getelapsedtime starttime = <starthold>
	if (<ElapsedTime> > 400)
		getelapsedtime starttime = <starttime>
		if (<ElapsedTime> > 100)
			GetStartTime
			musicstudio_mainobj :musicstudioghmix_performvocalaction <action_params>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script notetracker_quickedit_performvocalaction \{action = pitchdown}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_getsongtime
	params = {
		track = ($jam_tracks [<instrument>].id)
		action = <action>
		time = <song_time>
		search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
		include_sustain = true
		pad = <pad>
	}
	musicstudio_mainobj :musicstudioghmix_performvocalaction <params>
endscript

script notetracker_quickedit_pitchup 
	printf \{qs(0xcff876a4)}
	notetracker_quickedit_playpitch <...>
endscript

script notetracker_quickedit_pitchdown 
	printf \{qs(0x0acc71d3)}
	notetracker_quickedit_playpitch <...>
endscript

script notetracker_quickedit_playpitch 
	SpawnScriptNow notetracker_quickedit_playpitch_spawned params = <...>
endscript

script notetracker_quickedit_isnotespoken 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
	if (<vocal_spoken> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script notetracker_quickedit_isnoteskipped 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
	if (<vocal_skip> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script notetracker_quickedit_playpitch_spawned \{note_velocity = 100
		pitch = 0
		note_string = 0
		octave = 0}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
	if (<vocal_skip> = 1)
		return
	endif
	if (<vocal_spoken> = 1)
		return
	endif
	if (<octave> > 3)
		octave = 3
	endif
	note_fret = (<pitch> + (<octave> * 12))
	note_fret = (<note_fret> - 4)
	note_string = 0
	play_instrument = 4
	jam_get_sample_checksum {
		fret = <note_fret>
		string = <note_string>
		Type = 0
		chord_dir = 0
		chord_type = 0
		jam_instrument = <play_instrument>
	}
	musicstudio_play_sound {
		instrument = <play_instrument>
		final_note_sample = <sample_checksum>
		pitch_shift = <pitch_shift>
		note_type = 0
		note_velocity = $notetrack_vocal_pitch_volume
		note_string = <note_string>
		note_fret = <note_fret>
	}
	unique_id = ($jam_input_current_melody)
	note_join = (<note_time> + <note_length>)
	note_fret_last = <note_fret>
	gettracksize track = ($jam_tracks [<instrument>].id)
	if (<vocal_join> = 1)
		if (<index> < <track_size>)
			next_index = (<index> + 1)
			getcustomnote track = ($jam_tracks [<instrument>].id) index = <next_index>
			if (<vocal_spoken> = 0)
				if (<vocal_skip> = 0)
					if (<vocal_octave> > 3)
						vocal_octave = 3
					endif
					note_fret_next = (<vocal_pitch> + (<vocal_octave> * 12))
					note_fret_next = (<note_fret_next> - 4)
					diff = (<note_fret_next> - <note_fret_last>)
				endif
			endif
		endif
	endif
	musicstudio_mainobj :musicstudioghmix_getsongtime
	GetStartTime
	begin
	getelapsedtime starttime = <starttime>
	if (<ElapsedTime> > 500)
		break
	endif
	if GotParam \{diff}
		musicstudio_mainobj :musicstudioghmix_getsongtime
		if (<song_time> > <note_join> && <song_time> < <note_time>)
			interp = ((<song_time> - <note_join> + 0.0) / (<note_time> - <note_join>))
			pitch_interp = ((<diff> * <interp>) + <pitch_shift>)
			printf qs(0x0fc2334c) i = <pitch_interp>
			SetSoundParams unique_id = <unique_id> pitch = <pitch_interp>
		elseif (<song_time> >= <note_time>)
			printf \{qs(0x7da233b9)}
			SetSoundParams unique_id = <unique_id> pitch = (<pitch_shift> + <diff>)
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	Change jam_input_current_melody = <unique_id>
	jam_stop_sound jam_instrument = <instrument>
	musicstudio_scale_get_note_num string = <note_string> fret = <note_fret> show_flats = 0
endscript

script notetracker_quickedit_skip_forward 
	notetracker_skip_forward
endscript

script notetracker_quickedit_skip_backward 
	notetracker_skip_backward
endscript

script notetracker_hopo_edit_skip_forward 
	notetracker_skip_forward
	notetracker_calculate_hopo_edit_actions
endscript

script notetracker_hopo_edit_skip_backward 
	notetracker_skip_backward
	notetracker_calculate_hopo_edit_actions
endscript
notetracker_calculate_quickedit_actions_disable = 0

script notetracker_calculate_quickedit_actions 
	if ($notetracker_in_quickedit = 0)
		return
	endif
	if ($notetracker_calculate_quickedit_actions_disable = 1)
		return
	endif
	buttons = [green red yellow blue orange]
	button_text = [qs(0x642270ec) qs(0x8aec23b5) qs(0x6217cf3a) qs(0x904e6e98) qs(0x2fcdf151)]
	GetArraySize <buttons>
	index = 0
	begin
	notetracker_menu_update_text button = (<buttons> [<index>])
	index = (<index> + 1)
	repeat <array_Size>
endscript

script notetracker_calculate_hopo_edit_actions 
	printf \{qs(0x0b2d181c)}
	buttons = [green red yellow blue orange]
	button_text = [qs(0x642270ec) qs(0x8aec23b5) qs(0x6217cf3a) qs(0x904e6e98) qs(0x2fcdf151)]
	GetArraySize <buttons>
	index = 0
	begin
	notetracker_hopo_edit_update_text button = (<buttons> [<index>])
	index = (<index> + 1)
	repeat <array_Size>
endscript

script notetracker_menu_update_text 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if ($notetracker_note_held = 1)
		song_time = ($notetracker_note_held_time)
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> = 5)
		notetracker_menu_update_text_vocals <...>
		return
	endif
	findgem_params = {
		track = ($jam_tracks [<instrument>].id)
		time = <song_time>
		search_range_forward_ms = ($notetracker_quickedit_dropnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropnote_snap_backward_ms)
		include_sustain = FALSE
	}
	musicstudio_mainobj :musicstudioghmix_findgem <findgem_params> button = all
	<all_index> = <index>
	musicstudio_mainobj :musicstudioghmix_findgem <findgem_params> button = <button>
	if (<index> != -1)
		text = qs(0x10052042)
	else
		if (<all_index> != -1)
			text = qs(0x16d0facc)
		else
			text = qs(0x878662ad)
		endif
	endif
	notetracker_select_highlight index = <index> button = <button>
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setbuttontext {
			button = <button>
			id = <ghmix_menu>
			animate = FALSE
			name_text = <text>
		}
	endif
endscript

script notetracker_hopo_edit_update_text 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if ($notetracker_note_held = 1)
		song_time = ($notetracker_note_held_time)
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_findhammeroncandidategem {
		button = <button>
		track = ($jam_tracks [<instrument>].id)
		search_range_forward_ms = ($notetracker_quickedit_dropnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropnote_snap_backward_ms)
		time = <song_time>
	}
	if GotParam \{index}
		switch <hammer_on_state>
			case auto
			text = qs(0xeda951d7)
			case Always
			text = qs(0x0f8671d5)
			case never
			text = qs(0x5d03e0f8)
		endswitch
	else
		text = qs(0x6161f4b5)
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setbuttontext {
			button = <button>
			id = <ghmix_menu>
			animate = FALSE
			name_text = <text>
		}
	endif
endscript

script notetracker_hopo_edit_select_note 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if ($notetracker_note_held = 1)
		song_time = ($notetracker_note_held_time)
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_findhammeroncandidategem {
		button = <button>
		track = ($jam_tracks [<instrument>].id)
		search_range_forward_ms = ($notetracker_quickedit_dropnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropnote_snap_backward_ms)
		time = <song_time>
	}
	if GotParam \{index}
		applynoteaction {
			action = togglehammeronstate
			track = ($jam_tracks [<instrument>].id)
			index = <index>
		}
		notetracker_hopo_edit_update_text <...>
	endif
endscript

script notetracker_menu_update_text_vocals 
	text = qs(0x03ac90f0)
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_findgem {
		track = ($jam_tracks [<instrument>].id)
		time = <song_time>
		search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
		include_sustain = true
	}
	if (<button> = yellow)
		notetracker_select_highlight index = <index>
	endif
	if ($notetracker_quickedit_mode = Normal)
		switch <button>
			case green
			text = qs(0x878662ad)
			note_text = qs(0xde16b1b2)
			case red
			text = qs(0x196c2c79)
			case yellow
			text = qs(0xf40bf1de)
			case blue
			text = qs(0xdb10d7cc)
			case orange
			text = qs(0x03ac90f0)
		endswitch
	elseif ($notetracker_quickedit_mode = lyric)
		switch <button>
			case green
			note_text = qs(0x86b65baf)
			case red
			note_text = qs(0x9c229019)
			case yellow
			if (<index> != -1)
				if NOT notetracker_quickedit_isnoteskipped index = <index>
					note_text = qs(0x6cb2f1c5)
				endif
			endif
			case blue
			note_text = qs(0x280f1c4b)
			case orange
			text = qs(0x03ac90f0)
		endswitch
	elseif ($notetracker_quickedit_mode = pitch)
		switch <button>
			case green
			note_text = qs(0x90de09df)
			case red
			note_text = qs(0xace82b2b)
			case yellow
			note_text = qs(0x612dba0a)
			if (<index> != -1)
				musicstudio_mainobj :musicstudio_getcurrmainplayer
				<main_player> :musicstudioplayer_getinstrument
				getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
				if (<note_length> > $notetracker_vocal_quantize * 3)
					if (<select> = -1)
						note_text = qs(0xe4f311fc)
					endif
				endif
			endif
			case blue
			text = qs(0xfde4bf55)
			case orange
			text = qs(0x03ac90f0)
		endswitch
	elseif ($notetracker_quickedit_mode = settings)
		switch <button>
			case green
			formatText TextName = text qs(0xea9220e0) i = ($notetracker_vocal_singing_lag)
			case red
			text = qs(0x046d5a7a)
			case yellow
			text = qs(0x03ac90f0)
			case blue
			text = qs(0x03ac90f0)
			case orange
			text = qs(0x03ac90f0)
		endswitch
	endif
	if (<index> != -1)
		if GotParam \{note_text}
			text = <note_text>
		endif
	endif
	if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudiomenu_setbuttontext {
			button = <button>
			id = <ghmix_menu>
			animate = FALSE
			name_text = <text>
		}
	endif
endscript

script notetracker_select_highlight index = <index> button = all
	select = -1
	if (<index> != -1)
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
		getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
		musicstudio_mainobj :musicstudioghmix_getsongtime
		if (<song_time> - $notetracker_quickedit_dropvocalnote_snap_backward_ms <= <note_time>)
			if (<song_time> + $notetracker_quickedit_dropvocalnote_snap_forward_ms >= <note_time>)
				select = 0
			endif
		else
			note_end = (<note_time> + <note_length>)
			if (<song_time> - $notetracker_quickedit_dropvocalnote_snap_backward_ms <= <note_end>)
				if (<song_time> + $notetracker_quickedit_dropvocalnote_snap_forward_ms >= <note_end>)
					select = 1
				endif
			endif
		endif
	endif
	musicstudio_mainobj :musicstudioghmix_setgemhighlight index = <index> select = <select> button = <button>
	return select = <select> note_time = <note_time> note_length = <note_length>
endscript

script notetracker_quickedit_singpitch 
	if NOT ScriptIsRunning \{notetracker_quickedit_singpitch_spawned}
		SpawnScriptNow notetracker_quickedit_singpitch_spawned params = <...>
	endif
endscript

script notetracker_quickedit_singpitch_spawned 
	printf \{qs(0x94bf98b2)}
	begin
	getmicpitch
	pitch = <note>
	octave = (<octave> - 3)
	if (<pitch> != 255)
		if (<pitch> >= 0 &&
				<pitch> < 12 &&
				<octave> < 4 &&
				<octave> >= 0)
			printf \{qs(0x37e4aa01)}
			musicstudio_mainobj :musicstudioghmix_setvocalpitch {
				<...>
				pitch = <pitch>
				octave = <octave>
			}
		else
			printf \{qs(0xd7b80ccf)}
		endif
	endif
	if NOT ControllerPressed <pad>
		<held_down> = 0
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{qs(0xfcc91bdd)}
endscript

script notetracker_dynamic_singpitch 
	printf \{qs(0xfbee52a7)}
	OnExitRun \{notetracker_dynamic_singpitch_onexit}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if NOT (<instrument> = 5)
		return
	endif
	standard_params = {
		track = ($jam_tracks [<instrument>].id)
		search_range_forward_ms = ($notetracker_quickedit_dropvocalnote_snap_forward_ms)
		search_range_backward_ms = ($notetracker_quickedit_dropvocalnote_snap_backward_ms)
		include_sustain = true
	}
	notetracker_dynamic_singpitch_resetstat
	current_index = -1
	begin
	getmicpitch
	Wait \{1
		gameframe}
	pitch = <note>
	octave = (<octave> - 3)
	if (<pitch> >= 0 && <pitch> < 12 &&
			<octave> < 4 && <octave> >= 0)
		musicstudio_mainobj :musicstudioghmix_getsongtime
		musicstudio_mainobj :musicstudioghmix_findgem {
			<standard_params>
			time = (<song_time> - $notetracker_vocal_singing_lag)
		}
		if (<index> != -1)
			if (<current_index> != <index>)
				notetracker_dynamic_singpitch_resetstat
				current_index = <index>
			endif
			notetracker_dynamic_singpitch_addstat pitch = <pitch> octave = <octave>
			notetracker_dynamic_singpitch_getaverage
			if (<pitch> >= 0 && <pitch> < 12 &&
					<octave> < 4 && <octave> >= 0)
				musicstudio_mainobj :musicstudioghmix_setvocalpitch {
					<standard_params>
					pitch = <pitch>
					octave = <octave>
					time = (<song_time> - $notetracker_vocal_singing_lag)
				}
			else
				printf \{qs(0xd7b80ccf)}
			endif
		else
			notetracker_dynamic_singpitch_resetstat
		endif
	else
	endif
	repeat
endscript
singpitch_use_average = 0
singpitch_total_pitch_value = 0.0
singpitch_num_pitch_value = 0.0
singpitch_mode_pitch = 0
singpitch_mode_pitch_count = 0

script notetracker_dynamic_singpitch_addstat 
	pitchoctave = (<pitch> + (<octave> * 12))
	if ($singpitch_use_average)
		Change singpitch_total_pitch_value = ($singpitch_total_pitch_value + <pitchoctave>)
		Change singpitch_num_pitch_value = ($singpitch_num_pitch_value + 1)
	else
		count = ($notetracker_dynamic_singpitch_stats [<pitchoctave>] + 1)
		SetArrayElement ArrayName = notetracker_dynamic_singpitch_stats globalarray index = <pitchoctave> NewValue = <count>
		if (<count> > $singpitch_mode_pitch_count)
			Change singpitch_mode_pitch = <pitchoctave>
			Change singpitch_mode_pitch_count = <count>
		endif
	endif
endscript

script notetracker_dynamic_singpitch_getaverage 
	if ($singpitch_use_average)
		pitchoctave = ($singpitch_total_pitch_value / $singpitch_num_pitch_value)
	else
		pitchoctave = ($singpitch_mode_pitch)
	endif
	octave = (<pitchoctave> / 12)
	CastToInteger \{octave}
	pitch = (<pitchoctave> - (<octave> * 12))
	pitch = (<pitch> + 0.5)
	CastToInteger \{pitch}
	return pitch = <pitch> octave = <octave>
endscript

script notetracker_dynamic_singpitch_resetstat 
	if ($singpitch_use_average)
		Change \{singpitch_total_pitch_value = 0.0}
		Change \{singpitch_num_pitch_value = 0.0}
	else
		notetracker_dynamic_singpitch_onexit
		createscriptarray \{Name = notetracker_dynamic_singpitch_stats
			size = 255
			Heap = heap_musicstudio_guitar}
		Change \{singpitch_mode_pitch = 0}
		Change \{singpitch_mode_pitch_count = 0}
	endif
endscript

script notetracker_dynamic_singpitch_onexit 
	if GlobalExists \{Name = notetracker_dynamic_singpitch_stats}
		destroyscriptarray \{Name = notetracker_dynamic_singpitch_stats}
	endif
endscript

script notetracker_quickedit_taildrag_skip_forward 
	if NOT ScriptIsRunning \{notetracker_quickedit_taildrag}
		SpawnScriptNow notetracker_quickedit_taildrag params = <...>
	endif
	notetracker_skip_forward
endscript

script notetracker_quickedit_taildrag_skip_backward 
	if NOT ScriptIsRunning \{notetracker_quickedit_taildrag}
		SpawnScriptNow notetracker_quickedit_taildrag params = <...>
	endif
	notetracker_skip_backward
endscript

script notetracker_quickedit_taildrag 
	printf \{qs(0x7f6a6f5f)}
	musicstudio_mainobj :musicstudio_getmainplayercontroller
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	begin
	musicstudio_mainobj :musicstudioghmix_getsongtime
	if NOT musicstudio_mainobj :musicstudioghmix_updatenotesustain track = ($jam_tracks [(<instrument>)].id) time = <song_time>
		break
	endif
	if NOT ControllerPressed \{up}
		if NOT ControllerPressed \{down}
			break
		endif
	endif
	if NOT ControllerPressed \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script notetracker_quickedit_pickup_note 
	return
	musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
		param = ghmix_highway}
	<ghmix_highway> :desc_resolvealias Name = ghmix_nowbar param = ghmix_nowbar
	switch <button>
		case blue
		<ghmix_nowbar> :se_setprops blue = [255 0 255 255] time = 0.2
		case green
		<ghmix_nowbar> :se_setprops green = [255 0 255 255] time = 0.2
		case yellow
		<ghmix_nowbar> :se_setprops yellow = [255 0 255 255] time = 0.2
		case orange
		<ghmix_nowbar> :se_setprops orange = [255 0 255 255] time = 0.2
		case red
		<ghmix_nowbar> :se_setprops red = [255 0 255 255] time = 0.2
		default
		printf \{qs(0x0658b679)}
	endswitch
endscript

script notetracker_quickedit_drop_note 
	return
	musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_highway
		param = ghmix_highway}
	<ghmix_highway> :desc_resolvealias Name = ghmix_nowbar param = ghmix_nowbar
	switch <button>
		case blue
		<ghmix_nowbar> :se_setprops blue = [255 255 255 255] time = 0.2
		case green
		<ghmix_nowbar> :se_setprops green = [255 255 255 255] time = 0.2
		case yellow
		<ghmix_nowbar> :se_setprops yellow = [255 255 255 255] time = 0.2
		case orange
		<ghmix_nowbar> :se_setprops orange = [255 255 255 255] time = 0.2
		case red
		<ghmix_nowbar> :se_setprops red = [255 255 255 255] time = 0.2
		default
		printf \{qs(0x0658b679)}
	endswitch
endscript

script notetracker_quickedit_hold_sustain 
	Change \{notetracker_movement_speed = 0.4}
	Change \{notetracker_note_held = 1}
	held_down = 1
	begin
	if NOT ControllerPressed <pad>
		<held_down> = 0
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Change \{notetracker_note_held = 0}
	musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
		param = ghmix_menu}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	Change \{notetracker_movement_speed = 1.0}
	<main_player> :musicstudiomenu_setstate {
		id = <ghmix_menu>
		state = notetracker_quickedit_state
	}
endscript

script notetracker_quickedit_hold_sustain_deinit 
	musicstudio_mainobj :musicstudioghmix_dropnotesustain
	Change \{notetracker_note_held = 0}
endscript

script notetracker_copy_area_and_return 
	if GotParam \{all}
		musicstudio_mainobj :musicstudioghmix_findareamatches
	else
		musicstudio_mainobj :musicstudioghmix_clearareamatches
	endif
	notetracker_copy_area
	notetracker_return_to_previous_menu
endscript

script notetracker_copy_area 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	jam_clear_clipboards
	musicstudio_mainobj :musicstudioghmix_copyarea
	musicstudio_mainobj :musicstudioghmix_movehighway time = <song_time>
endscript

script notetracker_select_area_init 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{reset
		update = true
		use_song_time = true}
	ghmix_menu_remove_area_highlight
	musicstudio_mainobj :musicstudioghmix_clearareamatches
endscript

script notetracker_select_area_init_no_reset 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{update = true
		use_song_time = FALSE}
endscript

script notetracker_select_area_deinit 
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{update = FALSE}
	notetracker_update_selection_loop
endscript

script notetracker_select_area_deinit_reset 
	ghmix_menu_remove_area_highlight
	musicstudio_mainobj :musicstudioghmix_clearareamatches
	musicstudio_mainobj :musicstudioghmix_updateselectarea \{update = FALSE
		reset}
endscript

script notetracker_paste_selection 
	musicstudio_update_undo_clipboard
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudioghmix_getselectarea \{include_downbeat = true}
	musicstudio_mainobj :musicstudioghmix_paste
	musicstudio_mainobj :musicstudioghmix_movehighway time = <song_time>
	select_length = (<select_area_end> - <select_area_start>)
	musicstudio_mainobj :musicstudioghmix_setselectarea low_bound = <song_time> high_bound = (<song_time> + <select_length>)
	printstruct channel = music_studio <...>
	notetracker_copy_area
	SpawnScriptLater \{notetracker_update_selection_loop}
endscript

script notetracker_delete_selection 
	musicstudio_update_undo_clipboard
	musicstudio_mainobj :musicstudioghmix_deletearea \{apply_to_all}
endscript

script notetracker_evenly_space_selection 
	musicstudio_mainobj :musicstudioghmix_evenlyspacearea \{apply_to_all}
endscript

script notetracker_quickedit_init 
	printf \{qs(0x193fadab)}
	Change \{notetracker_in_quickedit = 1}
	Change \{notetracker_note_held = 0}
	Change \{notetracker_quickedit_mode = Normal}
	notetracker_calculate_quickedit_actions
endscript

script notetracker_quickedit_deinit 
	printf \{qs(0xbe000d54)}
	Change \{notetracker_in_quickedit = 0}
	musicstudio_mainobj :musicstudioghmix_setgemhighlight \{index = -1
		select = -1}
endscript

script notetracker_quickedit_vocal_pitch_indicator_init 
	SpawnScriptNow \{notetracker_quickedit_vocal_pitch_indicator_update}
endscript

script notetracker_quickedit_vocal_pitch_indicator_update 
	if ScreenElementExists \{id = pitch_indicator}
		DestroyScreenElement \{id = pitch_indicator}
	endif
	initial_pos = (644.0, 520.0)
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	begin
	<main_player> :musicstudioplayer_getinstrument
	if (<instrument> != 5)
		if ScreenElementExists \{id = pitch_indicator}
			DestroyScreenElement \{id = pitch_indicator}
		endif
	else
		if NOT ScreenElementExists \{id = pitch_indicator}
			CreateScreenElement {
				parent = root_window
				Type = SpriteElement
				id = pitch_indicator
				just = [center center]
				texture = ghmix_button_triangle
				Pos = <initial_pos>
				Scale = (0.8, -2.5)
				z_priority = 1000
				rgba = [255 255 255 255]
				alpha = 1.0
				blend = blend
			}
		endif
		getmicpitch
		pitch = <note>
		octave = (<octave> - 3)
		if (<pitch> >= 0 &&
				<pitch> < 12 &&
				<octave> < 4 &&
				<octave> >= 0)
			rgba = ($notetracker_vocal_colors [<octave>])
			Pos = (<initial_pos> + (<pitch> + <cents> + 0.5) * (13.0, 0.0))
		else
			rgba = [255 255 255 255]
			Pos = <initial_pos>
		endif
		pitch_indicator :se_setprops rgba = <rgba> Pos = <Pos>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script notetracker_quickedit_vocal_pitch_indicator_deinit 
	KillSpawnedScript \{Name = notetracker_quickedit_vocal_pitch_indicator_update}
	if ScreenElementExists \{id = pitch_indicator}
		DestroyScreenElement \{id = pitch_indicator}
	endif
endscript
notetracker_timing_sounds = [
	{
		Name = Checkbox_SFX
		lag = 0
	}
	{
		Name = POW_SFX_02
		lag = 0
	}
	{
		Name = GH3_Beat_Sound
		lag = 0
	}
	{
		Name = HiHatClosed01
		lag = 0
	}
	{
		Name = StickClickSmall
		lag = 0
	}
	{
		Name = StickClickMed
		lag = 40
	}
	{
		Name = StickClickLarge
		lag = 0
	}
	{
		Name = menu_colorwheel_rotate
		lag = 0
	}
	{
		Name = ghtunes_menu_scroll
		lag = 0
	}
	{
		Name = 0x00000000
		lag = 0
	}
]
current_notetracker_timing_sound_index = 4

script musicstudio_notetracker_toggle_click 
	GetArraySize \{$notetracker_timing_sounds}
	Change current_notetracker_timing_sound_index = ($current_notetracker_timing_sound_index + 1)
	if ($current_notetracker_timing_sound_index >= <array_Size>)
		Change \{current_notetracker_timing_sound_index = 0}
	endif
	Sound = ($notetracker_timing_sounds [$current_notetracker_timing_sound_index].Name)
	if (<Sound> != 0x00000000)
		PlaySound <Sound> vol = 10 pitch_percent = <pitch> buss = Front_End
	endif
endscript
current_notetracker_vocal_playsfx_index = 0

script musicstudio_notetracker_vocal_instrument_cycle 
	if ($notetracker_quickedit_mode = Normal)
		Change current_notetracker_vocal_playsfx_index = ($current_notetracker_vocal_playsfx_index + 1)
		if ($current_notetracker_vocal_playsfx_index >= 30)
			Change \{current_notetracker_vocal_playsfx_index = 0}
		endif
		printf \{qs(0x26a5c0bb)}
		printstruct <...>
		SpawnScriptNow \{musicstudio_instrument_loadkeyboard
			params = {
				index = $current_notetracker_vocal_playsfx_index
			}}
		Wait \{60
			frames}
		notetracker_quickedit_playpitch_spawned
	endif
endscript

script notetracker_vocal_volume_toggle 
	if ($jam_stream_volume = 0.45000002)
		Change \{jam_stream_volume = 0.5}
		Change \{notetrack_vocal_pitch_volume = 10}
	else
		if ($jam_stream_volume = 0.5)
			Change \{jam_stream_volume = 0.05}
			Change \{notetrack_vocal_pitch_volume = 130}
		else
			Change \{jam_stream_volume = 0.45000002}
			Change \{notetrack_vocal_pitch_volume = 100}
		endif
	endif
endscript

script musicstudio_notetracker_mode_change \{pitch = 100
		sfx = menu_entername_back
		vol = 100}
	if GotParam \{from_menu}
		printf \{qs(0x29eaa96d)}
		Change notetracker_from_menu_state = <from_menu>
	endif
	musictudio_notetracker_switch_menu_data
	if ScreenElementExists \{id = musicstudio_ghmix}
		if GotParam \{Color}
			musicstudio_ghmix :SetProps foreground_rgba = <Color>
		endif
		PlaySound <sfx> vol_percent = <vol> pitch_percent = <pitch> buss = Front_End
	endif
	printf \{qs(0x8c0f3992)}
	printstruct <...>
endscript

script musictudio_notetracker_switch_menu_data 
	switch ($notetracker_from_menu_state)
		case 0
		new_menu = notetracker_main_menu_state
		Color = [150 150 150 255]
		pitch = 90
		case 10
		new_menu = notetracker_main_menu_play_state
		case 1
		new_menu = notetracker_selection_state
		Color = [100 255 100 255]
		pitch = 150
		case 11
		new_menu = notetracker_selection_state_play_state
		case 2
		new_menu = notetracker_quickedit_state
		Color = [255 100 100 255]
		pitch = 150
		case 12
		new_menu = notetracker_live_record_state
		Color = [255 10 10 255]
		case 3
		new_menu = notetracker_select_paste_state
		Color = [255 255 100 255]
		pitch = 150
		case 13
		new_menu = notetracker_select_paste_menu_play_state
		case 4
		new_menu = notetracker_gameedit_state
		Color = [100 100 255 255]
		pitch = 150
		case 14
		new_menu = notetracker_gameedit_menu_play_state
		case 5
		new_menu = notetracker_quickplay_menu_state
		Color = [255 200 100 255]
		pitch = 150
	endswitch
	return new_menu = <new_menu> Color = <Color> pitch = <pitch> sfx = <sfx>
endscript

script notetracker_transpose_selection 
	if NOT musicstudio_mainobj :musicstudioghmix_transposearea <direction> apply_to_all
		PlaySound \{menu_colorwheel_rotate
			buss = Front_End}
	endif
endscript

script notetracker_move_selection 
	<time> = 16
	if (<direction> = down)
		<time> = (<time> * -1)
	endif
	if musicstudio_mainobj :musicstudioghmix_movearea time = <time> apply_to_all
		SpawnScriptLater \{notetracker_update_selection_loop}
	else
		PlaySound \{menu_colorwheel_rotate
			buss = Front_End}
	endif
endscript
notetracker_disable_jump_to_menu = 0

script notetracker_jump_to_menu \{pad = left}
	if ($notetracker_disable_jump_to_menu = 1)
		return
	endif
	printf \{qs(0x5d638023)}
	printstruct <...>
	if GotParam \{musicstudio_state_now}
		musicstudio_mainobj :musicstudio_getmainplayercontroller
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		musicstudio_mainobj :musicstudio_getplayerfromindex Player = <playerid_index>
		if musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
				param = ghmix_menu}
			<player_object> :musicstudiomenu_setstate {
				id = <ghmix_menu>
				state = <musicstudio_state_now>
				init_params = <...>
			}
		endif
	endif
	if GotParam \{pad}
		begin
		if NOT ControllerPressed <pad>
			notetracker_return_to_previous_menu <...>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	else
		notetracker_return_to_previous_menu <...>
	endif
endscript

script notetracker_return_to_previous_menu 
	printf \{qs(0xd896f499)}
	musicstudio_ghmix :desc_resolvealias \{Name = alias_ghmix_menu
		param = ghmix_menu}
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudiomenu_setstate {
		id = <ghmix_menu>
		state = musicstudio_state_jump_back
	}
endscript

script musicstudio_notetracker_mode_change_and_quickedit_init 
	musicstudio_notetracker_mode_change from_menu = <from_menu>
	notetracker_quickedit_init
endscript

script musicstudio_notetracker_mode_change_and_select_area_init_no_reset 
	musicstudio_notetracker_mode_change from_menu = <from_menu>
	notetracker_select_area_init_no_reset
endscript

script musicstudio_notetracker_mode_change_and_live_record 
	musicstudio_notetracker_mode_change from_menu = <from_menu>
	notetracker_live_record
	if ($notetracker_quickedit_mode = pitch)
		SpawnScriptNow \{notetracker_dynamic_singpitch}
	endif
endscript

script notetracker_selection_area_set_star_power 
	musicstudio_mainobj :musicstudioghmix_getselectarea
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	applynoteactiontotimerange action = setstarpower track = ($jam_tracks [<instrument>].id) start_time = <select_area_start> end_time = <select_area_end>
endscript

script notetracker_selection_area_clear_star_power 
	musicstudio_mainobj :musicstudioghmix_getselectarea
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	applynoteactiontotimerange action = clearstarpower track = ($jam_tracks [<instrument>].id) start_time = <select_area_start> end_time = <select_area_end>
endscript
