right_hold_player1 = 0
right_hold_player2 = 0
right_hold_player3 = 0
right_hold_player4 = 0
jam_player_recording_armed = [
	0
	0
	0
	0
]
jam_player_recording_begin_time = [
	0
	0
	0
	0
]

script guitar_jam_simplerecops_play 
	if NOT gotparam \{from_countin}
		if scriptisrunning \{musicstudio_jamroom_count_in}
			return
		endif
	endif
	if ($jam_band_recording = 0)
		if ($jam_highway_playing = 0)
			guitar_jam_simplerecops_command_startplay select_player = <select_player>
			soundevent \{event = audio_ui_jam_play}
		else
			guitar_jam_simplerecops_command_stopplay
			soundevent \{event = audio_ui_jam_stop}
		endif
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
		guitar_jam_simplerecops_command_stopplay
	endif
endscript

script guitar_jam_simplerecops_record 
	if scriptisrunning \{musicstudio_jamroom_count_in}
		return
	endif
	if ($jam_player_recording_armed [(<select_player> - 1)] = 0)
		guitar_jam_simplerecops_command_startrec select_player = <select_player>
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
	endif
endscript

script playback_custom_song \{in_game = 0}
	reset_song_time starttime = <start_time>
	musicstudio_mainobj :musicstudio_playsong start_time = <start_time>
endscript

script stop_custom_song 
	if compositeobjectexists \{name = musicstudio_mainobj}
		musicstudio_mainobj :musicstudio_pausesong
	endif
endscript

script guitar_jam_simplerecops_command_startplay 
	change \{jam_highway_playing = 1}
	spawnscriptnow \{jam_band_recording_begin
		id = jam_band_spawns}
	<player> = 1
	begin
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	if screenelementexists id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_icon_play>
		safe_show id = <simple_rec_icon_stop>
		safe_show id = <simple_rec_button_onr>
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
endscript

script guitar_jam_simplerecops_command_stopplay 
	change \{jam_band_recording = 0}
	change \{jam_highway_playing = 0}
	change \{jam_highway_recording = 0}
	killspawnedscript \{name = playback_delete_custom_track}
	stop_custom_song
	killspawnedscript \{name = jam_band_recording_begin}
	killspawnedscript \{name = jam_recording_metronome}
	jam_stop_all_samples
	jam_stop_all_sound
	jam_input_melody_stop_sound
	<player> = 1
	begin
	if ($jam_player_recording_armed [<player> -1] = 1)
		if musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
			set_highway_recording_effect player = <player> state = off blend_off
		endif
	endif
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <player>
	formattext checksumname = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <player>
	formattext checksumname = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <player>
	formattext checksumname = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <player>
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <player>
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <player>
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <player>
	formattext checksumname = right_hold 'right_hold_player%s' s = <player>
	if screenelementexists id = <simple_rec_button_onr>
		safe_show id = <simple_rec_icon_play>
		safe_hide id = <simple_rec_icon_rec>
		safe_show id = <simple_rec_icon_rw>
		safe_hide id = <simple_rec_icon_ff>
		safe_hide id = <simple_rec_icon_stop>
		safe_hide id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_button_onl>
		safe_hide id = <right_hold>
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
	change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
endscript

script guitar_jam_simplerecops_command_startrec 
	musicstudio_jamroom_set_state_text player = <select_player> state = recording
	set_highway_recording_effect player = <select_player> state = on
	change \{jam_band_recording = 1}
	change \{jam_highway_recording = 1}
	soundevent \{event = audio_ui_jam_recording_start}
	setarrayelement arrayname = jam_player_recording_armed globalarray index = (<select_player> - 1) newvalue = 1
	curr_time = ($jam_highway_play_time)
	casttointeger \{curr_time}
	setarrayelement arrayname = jam_player_recording_begin_time globalarray index = (<select_player> - 1) newvalue = <curr_time>
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		killspawnedscript \{id = jam_band_rhythm_playback}
		case 1
		killspawnedscript \{id = jam_band_lead_playback}
		case 2
		killspawnedscript \{id = jam_band_bass_playback}
		case 3
		killspawnedscript \{id = jam_band_drum_playback}
		case 4
		killspawnedscript \{id = jam_band_melody_playback}
	endswitch
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	spawnscriptnow playback_delete_custom_track id = <jam_playback_delete> params = {jam_instrument = <jam_instrument> start_time = $jam_highway_play_time}
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	spawnscriptnow jam_recording_metronome id = <jam_player_spawns> params = {select_player = <select_player>}
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	safe_show id = <simple_rec_button_onl>
endscript

script playback_delete_custom_track \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf channel = musicstudio qs(0x90053ebc) a = <jam_instrument> b = <start_time>
	jam_stop_sound jam_instrument = <jam_instrument>
	track = ($jam_tracks [<jam_instrument>].id)
	reset_song_time starttime = <start_time>
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 4.0)
	forward_delete = <note_quantize_ms>
	casttointeger \{forward_delete}
	gettracksize track = <track>
	orig_size = <track_size>
	if (<track_size> = 0)
		return
	endif
	start_at_index = -1
	casttointeger \{start_time}
	if findcustomnote track = ($jam_tracks [<jam_instrument>].id) time = <start_time>
		printf channel = musicstudio qs(0xbd6a64e4) a = <jam_instrument> b = <index>
		<start_at_index> = <index>
	endif
	if (<start_at_index> < 0 || <start_at_index> >= <track_size>)
		scriptassert qs(0x9c65709d) a = <jam_instrument> b = <start_at_index>
		return
	endif
	delete_index = <start_at_index>
	begin
	if NOT playbackdeletecustomtrack {
			track = <track>
			jam_instrument = <jam_instrument>
			delete_index = <delete_index>
			orig_size = <orig_size>
			forward_delete = <forward_delete>
		}
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf channel = musicstudio qs(0x83b29e05) a = <jam_instrument>
endscript

script jam_band_recording_begin 
	reset_song_time starttime = ($jam_highway_play_time)
	playback_custom_song \{start_time = $jam_highway_play_time}
	begin_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	setscreenelementprops id = jam_band_highway_playline pos = <begin_pos>
	pixels_per_frame = ($jam_band_pixels_per_second / 60)
	getscreenelementposition \{id = jam_band_highway_playline}
	end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
	begin
	new_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	if NOT (<new_pos> [0] > <end_pos> [0])
		setscreenelementprops id = jam_band_highway_playline pos = <new_pos>
		getsongtimems
		change jam_highway_play_time = <time>
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_band_pause_record_text option = <option>
	player = 1
	begin
	guitar_jam_simplerecops_command_stoprec select_player = <player>
	player = (<player> + 1)
	repeat 4
	guitar_jam_simplerecops_command_stopplay
endscript

script guitar_jam_simplerecops_command_stoprec 
	musicstudio_jamroom_set_state_text player = <select_player> state = play
	set_highway_recording_effect player = <select_player> state = off blend_off
	setarrayelement arrayname = jam_player_recording_armed globalarray index = (<select_player> - 1) newvalue = 0
	setarrayelement arrayname = jam_player_recording_begin_time globalarray index = (<select_player> - 1) newvalue = 0
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	killspawnedscript id = <jam_playback_delete>
	musicstudio_mainobj :musicstudio_playsong \{start_time = $jam_highway_play_time}
	if NOT gotparam \{no_sound}
		soundevent \{event = audio_ui_jam_recording_stop}
	endif
	if gotparam \{all}
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 1}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 2}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 3}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 4}
		safe_hide id = <simple_rec_button_onl>
	else
		formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_onl>
	endif
	getarraysize \{$jam_player_recording_armed}
	i = 0
	is_recording = 0
	begin
	if ($jam_player_recording_armed [<i>] = 1)
		<is_recording> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<is_recording> = 0)
		killspawnedscript \{name = jam_recording_metronome}
		change \{jam_band_recording = 0}
		change \{jam_highway_recording = 0}
	endif
endscript

script guitar_jam_simplerecops_skipfb 
	<button> = <dir>
	if gotparam \{direction_override}
		<button> = <direction_override>
	endif
	musicstudio_update_dir_for_lefty_flip button = <button> player = <select_player>
	<initial_button_flash_time> = 0.15
	<time_held_before_spam> = 0.15
	<spam_frequency> = 0.1
	if (($jam_highway_playing = 1) || ($jam_highway_recording = 1))
		printf \{channel = jam_mode
			qs(0x25c1e3fb)}
		return
	endif
	soundevent \{event = audio_ui_jam_play}
	if (<dir> = right)
		formattext checksumname = simple_rec_arrow 'jam_simple_rec_arrow_r_%s' s = <select_player>
		formattext checksumname = simple_rec_button_on 'jam_simple_rec_button_onr_%s' s = <select_player>
		formattext checksumname = simple_rec_button_other 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time + 1000)
	elseif (<dir> = left)
		formattext checksumname = simple_rec_arrow 'jam_simple_rec_arrow_l_%s' s = <select_player>
		formattext checksumname = simple_rec_button_on 'jam_simple_rec_button_onl_%s' s = <select_player>
		formattext checksumname = simple_rec_button_other 'jam_simple_rec_button_onr_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time - 1000)
	endif
	getplayerinfo <select_player> controller
	<scroll_5> = 5
	<scroll_4> = 3
	<scroll_3> = 1
	<scroll_2> = 0.5
	<scroll_1> = 0.2
	<speed_5> = 100
	<speed_4> = 50
	<speed_3> = 20
	<speed_2> = 3
	<speed_1> = 1.5
	<time_held> = 0
	begin
	if controllerpressed <button> <controller>
		<right_not_held> = 0
	else
		<right_not_held> = 1
	endif
	safe_show id = <simple_rec_button_on>
	if (<right_not_held>)
		safe_hide id = <simple_rec_button_on>
		return
	endif
	if (<time_held> >= <scroll_5>)
		<scroll_speed> = <speed_5>
	elseif (<time_held> >= <scroll_4>)
		<scroll_speed> = <speed_4>
	elseif (<time_held> >= <scroll_3>)
		<scroll_speed> = <speed_3>
	elseif (<time_held> >= <scroll_2>)
		<scroll_speed> = <speed_2>
	elseif (<time_held> >= <scroll_1>)
		<scroll_speed> = <speed_1>
	else
		<scroll_speed> = 1.0
	endif
	getdeltatime
	<delta_time> = (<delta_time> * 1000.0)
	<scroll_speed> = (<scroll_speed> * (<delta_time> * 0.5))
	if (<dir> = right)
		change jam_highway_play_time = (($jam_highway_play_time) + <scroll_speed>)
	else
		change jam_highway_play_time = (($jam_highway_play_time) - <scroll_speed>)
	endif
	if (($jam_highway_play_time) < 0)
		change \{jam_highway_play_time = 0}
	endif
	<time_held> = (<time_held> + <spam_frequency>)
	wait \{1
		gameframe}
	repeat
endscript
