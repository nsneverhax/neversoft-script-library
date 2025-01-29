guitar_jam_playback_recordng_increment_track_index = 0

script guitar_jam_playback_recording \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf \{channel = jam_mode
		qs(0x02f54805)}
	track = ($jam_tracks [<jam_instrument>].id)
	if (<in_game> != 1)
		gem_array = ($jam_tracks [<jam_instrument>].gem_array)
		AppendSuffixToChecksum Base = <gem_array> SuffixString = '_size'
		gem_array_size = ($<appended_id>)
		gem_array_size_id = <appended_id>
	else
		gem_array = ($jam_tracks [<jam_instrument>].in_game_gem_array)
		GetArraySize ($<gem_array>)
		gem_array_size = <array_Size>
	endif
	reset_song_time starttime = <start_time>
	getjamsessionsize track = <track>
	orig_size = <track_size>
	if (<track_size> = 0)
		return
	endif
	track_index = 0
	start_at_index = -1
	begin
	getjamsessionsound track = <track> index = <track_index>
	if (<time> >= <start_time>)
		start_at_index = <track_index>
		break
	endif
	<track_index> = (<track_index> + 1)
	if (<track_index> >= <track_size>)
		break
	endif
	repeat
	if (<start_at_index> = -1)
		return
	endif
	old_effect_on = ($jam_current_active_effects [<jam_instrument>])
	is_effect_on = ($jam_current_active_effects [<jam_instrument>])
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<sustain_min> = (<ms_per_beat> / <sustain_min>)
	CastToInteger \{sustain_min}
	sustain_cutoff = 8
	<sustain_cutoff> = (<ms_per_beat> / <sustain_cutoff>)
	CastToInteger \{sustain_cutoff}
	formatText checksumName = spawn_id 'playback_sustain_note_%s' s = <jam_instrument>
	if IsTrue \{$g_optimized_guitar_jam_playback_recording}
		<track_index> = <start_at_index>
		Change \{guitar_jam_playback_recordng_increment_track_index = 0}
		begin
		<track_index> = (<track_index> + ($guitar_jam_playback_recordng_increment_track_index))
		Change \{guitar_jam_playback_recordng_increment_track_index = 0}
		if (<track_index> >= <track_size>)
			break
		endif
		if NOT jamplaybackrecording_process <...>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		printf \{channel = jam_mode
			qs(0xdbc66a87)}
		return
	endif
	<track_index> = <start_at_index>
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	getjamsessionsize track = <track>
	if (<track_size> = <orig_size>)
		getjamsessionsound track = <track> index = <track_index>
		if (<curr_song_time> >= <time>)
			if (<in_game> != 1)
				<gem_array_size> = ($<gem_array_size_id>)
			endif
			if ((<track_index> * 2) < <gem_array_size>)
				getnotetrackitem Name = <gem_array> index = (<track_index> * 2)
			else
				gem_length = 60
			endif
			curr_length = <gem_length>
			curr_effect = <effect>
			KillSpawnedScript \{Name = jam_recording_sustain_note}
			if (<track> = rhythm)
				KillSpawnedScript \{Name = jam_input_stop_sound_rhythm}
				jam_get_sample_checksum fret = <note_fret> string = <note_string> Type = <note_type> chord_dir = 1 chord_type = <chord_type> jam_instrument = <jam_instrument>
				jam_input_rhythm_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = lead)
				KillSpawnedScript \{Name = jam_input_stop_sound_lead}
				jam_get_sample_checksum fret = <note_fret> string = <note_string> Type = <note_type> jam_instrument = <jam_instrument>
				jam_input_lead_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = bass)
				KillSpawnedScript \{Name = jam_input_stop_sound_bass}
				if ($bass_kit_mode != 0)
					jam_get_sample_checksum fret = <note_fret> string = <note_string> Type = <note_type> jam_instrument = <jam_instrument>
				else
					jam_get_single_sample_for_melody_playback fret = <note_fret> string = <note_string> Type = <note_type> jam_instrument = <jam_instrument>
				endif
				jam_input_bass_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = melody)
				KillSpawnedScript \{Name = jam_input_stop_sound_melody}
				jam_get_single_sample_for_melody_playback fret = <note_fret> string = <note_string> Type = <note_type> jam_instrument = <jam_instrument>
				jam_input_melody_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> playback = 1
			endif
			SpawnScriptNow jam_recording_sustain_note params = {length = <curr_length> track = <track>}
			<track_index> = (<track_index> + 1)
		endif
	endif
	getjamsessionsize track = <track>
	if (<track_size> > <orig_size>)
		<track_index> = (<track_index> + 1)
		<orig_size> = <track_size>
	endif
	if (<track_index> >= <track_size>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{channel = jam_mode
		qs(0xdbc66a87)}
endscript

script guitar_jam_playback_delete \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf \{channel = jam_mode
		qs(0xf083e0f8)}
	track = ($jam_tracks [<jam_instrument>].id)
	jam_stop_sound jam_instrument = <jam_instrument>
	gem_array = ($jam_tracks [<jam_instrument>].gem_array)
	AppendSuffixToChecksum Base = <gem_array> SuffixString = '_size'
	gem_array_size = ($<appended_id>)
	gem_array_size_id = <appended_id>
	reset_song_time starttime = <start_time>
	getjamsessionsize track = <track>
	orig_size = <track_size>
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<forward_delete> = (<ms_per_beat> / <sustain_min>)
	CastToInteger \{forward_delete}
	if (<track_size> = 0)
		return
	endif
	track_index = 0
	start_at_index = -1
	begin
	getjamsessionsound track = <track> index = <track_index>
	if (<time> >= <start_time>)
		start_at_index = <track_index>
		break
	endif
	<track_index> = (<track_index> + 1)
	if (<track_index> >= <track_size>)
		break
	endif
	repeat
	if (<start_at_index> = -1)
		return
	endif
	<delete_index> = <start_at_index>
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	getjamsessionsize track = <track>
	if (<track_size> > 0 && <track_size> = <orig_size>)
		getjamsessionsound track = <track> index = <delete_index>
		if ((<curr_song_time> + <forward_delete>) >= <time>)
			deletejamsessionsound track = ($jam_tracks [<jam_instrument>].id) index = <delete_index>
			deletenotetrackitem Name = <gem_array> index = (<delete_index> * 2)
			<orig_size> = (<orig_size> - 1)
		endif
	endif
	getjamsessionsize track = <track>
	if (<track_size> > <orig_size>)
		<add_index> = (<track_size> - <orig_size>)
		<delete_index> = (<delete_index> + <add_index>)
		<orig_size> = <track_size>
	endif
	if (<delete_index> >= <track_size>)
		printf \{channel = jam_mode
			qs(0x602c38da)}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_recording_sustain_note 
	length_seconds = (<length> / 1000.0)
	Wait <length_seconds> Seconds
	if (<length> < 60)
		switch <track>
			case rhythm
			stopsound \{unique_id = $jam_input_current_chord}
			case lead
			stopsound \{unique_id = $jam_input_current_lead}
			case bass
			stopsound \{unique_id = $jam_input_current_bass}
			case melody
			jam_input_melody_stop_sound
		endswitch
	else
		switch <track>
			case rhythm
			stopsound \{unique_id = $jam_input_current_chord
				fade_type = linear
				fade_time = $jam_fade_time}
			case lead
			stopsound \{unique_id = $jam_input_current_lead
				fade_type = linear
				fade_time = $jam_fade_time}
			case bass
			stopsound \{unique_id = $jam_input_current_bass
				fade_type = linear
				fade_time = $jam_fade_time}
			case melody
			jam_input_melody_stop_sound
		endswitch
	endif
endscript

script jam_stop_all_samples 
	stopsound unique_id = ($jam_input_current_chord)
	stopsound unique_id = ($jam_input_current_lead)
	stopsound unique_id = ($jam_input_current_bass)
	jam_input_melody_stop_sound
endscript

script jam_update_volume \{Volume = 0}
	update_volume = <Volume>
	if NOT ($current_song_qpak = jamsession)
		return
	endif
	if (<Volume> = 0)
		<new_vol> = 100
	endif
	getsonginfo
	getplayerinfo <Player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = bass)
		inst = <playback_track2>
	else
		return
	endif
	if ((<inst> < 0) || (<inst> > 4))
		return
	endif
	gettrackinfo track = ($jam_tracks [<inst>].id)
	new_vol = ((10 - <Volume>) * 2)
	vocals_get_num_vocalists
	if (<num_vocalists> > 0 && <inst> = 4)
		return
	endif
	switch <inst>
		case 0
		if (<update_volume> = 0)
			setsoundbussparams \{jammode_rhythmguitar = {
					vol = -100
				}}
		else
			setsoundbussparams {jammode_rhythmguitar = {vol = (($default_BussSet.jammode_rhythmguitar.vol) - <new_vol>)}}
		endif
		case 1
		if (<update_volume> = 0)
			setsoundbussparams \{jammode_leadguitar = {
					vol = -100
				}}
		else
			setsoundbussparams {jammode_leadguitar = {vol = (($default_BussSet.jammode_leadguitar.vol) - <new_vol>)}}
		endif
		case 2
		if (<update_volume> = 0)
			setsoundbussparams \{jammode_bass = {
					vol = -100
				}}
		else
			setsoundbussparams {jammode_bass = {vol = (($default_BussSet.jammode_bass.vol) - <new_vol>)}}
		endif
		case 4
		if (<update_volume> = 0)
			setsoundbussparams \{jammode_vox = {
					vol = -100
				}}
		else
			setsoundbussparams {jammode_vox = {vol = (($default_BussSet.jammode_vox.vol) - <new_vol>)}}
		endif
	endswitch
endscript

script jam_fadeout_sound_event 
	fade_out_event = <event>
	if IsSoundEventPlaying <fade_out_event>
		AppendSuffixToChecksum Base = <fade_out_event> SuffixString = '_container'
		event_container = <appended_id>
		sound_array = (($<event_container>).Sounds)
		GetArraySize <sound_array>
		count = 0
		begin
		if issoundplaying (<sound_array> [<count>])
			break
		endif
		<count> = (<count> + 1)
		repeat <array_Size>
		SetSoundParams (<sound_array> [<count>]) vol = 0
		Wait \{0.15
			Seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -6
		Wait \{0.15
			Seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -12
		StopSoundEvent <fade_out_event>
	endif
endscript

script jam_delete_range track = ($jam_current_track) low_bound = 0 high_bound = 1000
	CastToInteger \{low_bound}
	CastToInteger \{high_bound}
	if (<high_bound> < ($jam_highway_play_time))
		delete_size = (<high_bound> - <low_bound>)
		if (<delete_size> >= 15)
			sixty_fourth_note = ((60000.0 / $jam_current_bpm) / 16.0)
			CastToInteger \{sixty_fourth_note}
			<high_bound> = (<high_bound> - <sixty_fourth_note>)
			if (<high_bound> < <low_bound>)
				<high_bound> = <low_bound>
			endif
		endif
	endif
	<low_bound> = (<low_bound> - 2)
	<high_bound> = (<high_bound> + 2)
	getjamsessionsize track = ($jam_tracks [<track>].id)
	sessionsound_index = 0
	if (<track_size> > 0)
		begin
		getjamsessionsound track = ($jam_tracks [<track>].id) index = <sessionsound_index>
		if (<time> >= <low_bound> && <time> <= <high_bound>)
			deletejamsessionsound track = ($jam_tracks [<track>].id) index = <sessionsound_index>
			<track_size> = (<track_size> - 1)
		else
			<sessionsound_index> = (<sessionsound_index> + 1)
		endif
		if (<sessionsound_index> >= <track_size>)
			break
		endif
		repeat
	endif
	getjamsessionsize track = ($jam_tracks [<track>].id)
	if (<track_size> = 0)
		printf \{channel = jam_mode
			qs(0x25df324b)}
	endif
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		notetrack_index = 0
		begin
		time = ($<gem_array> [<notetrack_index>])
		if (<time> >= <low_bound> && <time> <= <high_bound>)
			deletenotetrackitem Name = <gem_array> index = <notetrack_index>
		else
			<notetrack_index> = (<notetrack_index> + 2)
		endif
		if (<notetrack_index> >= ($<notetrack_size>))
			break
		endif
		repeat
	endif
	if (($<notetrack_size>) = 0)
		printf \{channel = jam_mode
			qs(0xb4d68540)}
	endif
	if (<low_bound> = (<high_bound> -104))
		markers_array = editable_jam_markers
		suffix = '_size'
		AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
		<markers_size> = <appended_id>
		if (($<markers_size>) > 0)
			marker_index = 0
			begin
			time = ($<markers_array> [<marker_index>].time)
			if (<time> >= <low_bound> && <time> <= <high_bound>)
				deletemarkeritem Name = <markers_array> index = <marker_index>
			else
				<marker_index> = (<marker_index> + 1)
			endif
			if (<marker_index> >= ($<markers_size>))
				break
			endif
			repeat
		endif
	endif
endscript

script jam_recording_metronome \{flash_light = 0}
	if NOT GotParam \{time}
		<curr_time> = $jam_highway_play_time
	else
		<curr_time> = <time>
	endif
	CastToInteger \{curr_time}
	if NOT GotParam \{bpm}
		bpm = ($jam_current_bpm)
	endif
	quantize_to = 1
	ms_per_beat = (60000.0 / <bpm>)
	quantize_fretbar = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_fretbar>)
	CastToInteger \{intervals}
	new_time_fretbar = (<intervals> * <quantize_fretbar>)
	<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
	CastToInteger \{new_time_fretbar}
	quantize_to = 0.25
	ms_per_beat = (60000.0 / <bpm>)
	quantize_measure = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_measure>)
	CastToInteger \{intervals}
	new_time_measure = (<intervals> * <quantize_measure>)
	<new_time_measure> = (<new_time_measure> + <quantize_measure>)
	CastToInteger \{new_time_measure}
	flipper = 0
	formatText \{checksumName = simple_rec_button_onl1
		'jam_simple_rec_button_onl_%s'
		s = 1}
	formatText \{checksumName = simple_rec_button_onl2
		'jam_simple_rec_button_onl_%s'
		s = 2}
	formatText \{checksumName = simple_rec_button_onl3
		'jam_simple_rec_button_onl_%s'
		s = 3}
	formatText \{checksumName = simple_rec_button_onl4
		'jam_simple_rec_button_onl_%s'
		s = 4}
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	tick = 0
	begin
	if NOT ui_event_exists_in_stack \{Name = 'recording_disconnect'}
		GetSongTimeMs
		CastToInteger \{time}
		if (<time> >= <new_time_measure>)
			<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
			<new_time_measure> = (<new_time_measure> + <quantize_measure>)
			if ($jam_click_track = 1)
				SoundEvent \{event = jam_mode_metronome
					downbeat = 1}
				printf \{channel = jam_mode
					qs(0xdd747a2e)}
			endif
			if NOT GotParam \{sound_only}
				if (<flash_light> = 1)
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
				endif
				if (<tick> = 0)
					toggle_advanced_record_metronome \{left}
					<tick> = 1
				else
					toggle_advanced_record_metronome \{right}
					<tick> = 0
				endif
			endif
		endif
		if (<time> >= <new_time_fretbar>)
			<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
			if ($jam_click_track = 1)
				SoundEvent \{event = jam_mode_metronome}
			endif
			if NOT GotParam \{sound_only}
				if (<flash_light> = 1)
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
					SpawnScriptNow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
				endif
				if (<tick> = 0)
					toggle_advanced_record_metronome \{left}
					<tick> = 1
				else
					toggle_advanced_record_metronome \{right}
					<tick> = 0
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_recording_metronome_stop 
	KillSpawnedScript \{Name = jam_recording_metronome}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{Name = metronome_box}
			<resolved_id> :SetProps Pos = (51.0, 800.0) time = 0.2
			<resolved_id> :se_waitprops
		endif
	endif
endscript

script jam_flash_recording_element 
	safe_show id = <id>
	Wait \{10
		frames}
	safe_hide id = <id>
endscript

script toggle_advanced_record_metronome 
	if ScreenElementExists \{id = jam_studio_element}
		if GotParam \{left}
			jam_studio_element :SetProps \{metronome_left_texture = metronome_tick}
			jam_studio_element :SetProps \{metronome_right_texture = metronome_tock}
		else
			jam_studio_element :SetProps \{metronome_right_texture = metronome_tick}
			jam_studio_element :SetProps \{metronome_left_texture = metronome_tock}
		endif
	endif
endscript

script jamsession_addscriptarrayitem 
	addscriptarrayitem Name = <arraylist> checksum = <song_checksum>
endscript

script jamsession_array_action 
	formatText checksumName = song_checksum '%s_jam_markers' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = heap_song Type = structure <...>
	formatText checksumName = song_checksum '%s_jam_album_cover' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = 1 Heap = heap_song Type = structure <...>
	count = 1
	begin
	if (<count> = 5)
		<difficulty_text> = 'in_game'
	else
		difficulty = ($difficulty_list [<count>])
		get_difficulty_text_nl difficulty = <difficulty>
		<difficulty_text> = <difficulty_text_nl>
	endif
	gem_count = <gemarraysize>
	star_count = <starsize>
	count2 = 0
	begin
	switch <count2>
		case 0
		Type = ''
		case 1
		Type = '_rhythm'
		case 2
		Type = '_drum'
		case 3
		Type = '_guitarcoop'
		case 4
		Type = '_rhythmcoop'
	endswitch
	formatText checksumName = song_checksum '%s_song%t_%d' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = (2 * <gem_count>) Heap = heap_song <...>
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s%t_%d_star' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 Heap = heap_song <...>
		formatText checksumName = song_checksum '%s%t_%d_FaceOffStar' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
		formatText checksumName = song_checksum '%s%t_%d_StarBattleMode' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
		formatText checksumName = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
		formatText checksumName = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
		formatText checksumName = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = heap_song <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	formatText checksumName = song_checksum '%s_DrumSolo' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_FaceOffP1' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_FaceOffP2' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_BossBattleP1' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_BossBattleP2' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_timesig' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <starsize> size2 = 3 Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_fretbars' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = heap_song Type = structure <...>
	formatText checksumName = song_checksum '%s_guitar_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = heap_song Type = structure <...>
	GetArraySize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].Name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	formatText checksumName = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	<func> Name = <song_checksum> size = <script_array_size> Heap = heap_song <...>
	formatText checksumName = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 Heap = heap_song Type = structure <...>
	count = (<count> + 1)
	repeat <array_Size>
endscript

script jamsession_copyfinalscriptarrays 
	ExtendCrc <arraylist> '_size' out = arraylistsize
	count = 0
	begin
	copyfinalscriptarray sourcename = ($<arraylist> [<count>]) destname = ($<arraylist2> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
endscript

script jamsession_copymarkerarrays \{song = editable}
	suffix = '_jam_markers'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_jam_markers = <appended_id>
	suffix = '_lightshow_notes'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_lightshow_notes = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_lightshow_notes> SuffixString = <suffix>
	lightshow_notes_size = <appended_id>
	Change GlobalName = <lightshow_notes_size> NewValue = 0
	AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
	jam_markers_size = ($<appended_id>)
	if NOT GlobalExists Name = <song_lightshow_notes> Type = array
		return
	endif
	addscriptarraynoteitem Name = <song_lightshow_notes> time = 0 length = 80 note = ($jam_lightshow [0].note) velocity = 100
	count = 0
	note_count = 0
	begin
	if (<jam_markers_size> = 0)
		break
	endif
	ms_per_beat = (60000.0 / $jam_current_bpm)
	offset_time = (<ms_per_beat> * 2.0)
	curr_time = (($<song_jam_markers> [<count>].time) + <offset_time>)
	curr_marker_lightshow = ($<song_jam_markers> [<count>].LightShow)
	CastToInteger \{curr_time}
	next_time = -1
	if (<count> < (<jam_markers_size> - 1))
		next_time = (($<song_jam_markers> [(<count> + 1)].time) + <offset_time>)
		CastToInteger \{next_time}
	endif
	addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = ($jam_lightshow [<curr_marker_lightshow>].note) velocity = 100
	<note_count> = (<note_count> + 1)
	strobe = 0
	if StructureContains structure = ($jam_lightshow [<curr_marker_lightshow>]) strobe
		strobe = 1
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 40 velocity = 100
		<note_count> = (<note_count> + 1)
	else
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 39 velocity = 100
		<note_count> = (<note_count> + 1)
	endif
	if StructureContains structure = ($jam_lightshow [<curr_marker_lightshow>]) pyro
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 37 velocity = 100
		<note_count> = (<note_count> + 1)
	endif
	curr_change = ($jam_lightshow [<curr_marker_lightshow>].Change)
	ms_per_beat = ((60000.0 / $jam_current_bpm) / <curr_change>)
	beat_count = 0
	begin
	if (<next_time> > 0)
		color_change_time = (<curr_time> + (<ms_per_beat> * <beat_count>))
		CastToInteger \{color_change_time}
		if (<color_change_time> < <next_time>)
			if (<strobe> = 1)
				Mod a = <note_count> b = (2)
				if (<Mod> = 0)
					addscriptarraynoteitem Name = <song_lightshow_notes> time = <color_change_time> length = 80 note = 82 velocity = 100
				else
					addscriptarraynoteitem Name = <song_lightshow_notes> time = <color_change_time> length = 80 note = 83 velocity = 100
				endif
			else
				addscriptarraynoteitem Name = <song_lightshow_notes> time = (<color_change_time> - 75) length = 80 note = 58 velocity = 100
			endif
			<note_count> = (<note_count> + 1)
			if (<note_count> >= (($gemarraysize) * 2))
				break
			endif
		else
			break
		endif
	else
		break
	endif
	<beat_count> = (<beat_count> + 1)
	repeat
	if (<note_count> >= (($gemarraysize) * 2))
		break
	endif
	<count> = (<count> + 1)
	if (<count> > (<jam_markers_size> - 1))
		break
	endif
	repeat
endscript

script jamsession_unload \{song_prefix = 'jamsession'}
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix>
	ExtendCrc <arraylist> '_size' out = arraylistsize
	if NOT GlobalExists Name = <arraylist> Type = array
		return
	endif
	if ($<arraylistsize> <= 0)
		return
	endif
	count = 0
	begin
	if GlobalExists Name = ($<arraylist> [<count>]) Type = array
		destroyscriptarray Name = ($<arraylist> [<count>])
	endif
	count = (<count> + 1)
	repeat $<arraylistsize>
	if GlobalExists Name = <arraylist> Type = array
		destroyscriptarray Name = <arraylist>
	endif
	if (<song_prefix> = 'jamsession')
		if GlobalExists \{Name = jamsession_song_vocals
				Type = array}
			destroyscriptarray \{Name = jamsession_song_vocals}
		endif
	endif
	jam_clear_clipboards
endscript

script jamsession_startsong 
	return
endscript

script jam_add_end_of_song_marker 
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		getnotetrackitem Name = <gem_array> index = (($<notetrack_size>) - 2)
		if ((<gem_time> + <gem_length>) > <last_end_time>)
			<last_end_time> = (<gem_time> + <gem_length>)
		endif
	endif
	<count> = (<count> + 1)
	repeat 5
	fret_ms = (60000.0 / $jam_current_bpm)
	intervals = (<last_end_time> / <fret_ms>)
	CastToInteger \{intervals}
	end_marker_time = ((<intervals> * <fret_ms>) + <fret_ms>)
	CastToInteger \{end_marker_time}
	new_marker = {time = <end_marker_time> , marker = qs(0x00167369)}
	SetArrayElement ArrayName = editable_guitar_markers globalarray index = 0 NewValue = <new_marker>
	Change \{GlobalName = editable_guitar_markers_size
		NewValue = 1}
	copyfinalscriptarray \{sourcename = editable_guitar_markers
		destname = jamsession_guitar_markers}
	printf channel = jam_mode qs(0x897e20dd) a = <end_marker_time>
	return end_time = <end_marker_time>
endscript

script jam_debug_track \{jam_instrument = 0}
	printf \{channel = jam_mode
		qs(0xc6ec2cf0)}
	printf \{channel = jam_mode
		qs(0x03ac90f0)}
	printf \{channel = jam_mode
		qs(0x03ac90f0)}
	gem_array = ($jam_tracks [<jam_instrument>].gem_array)
	jamsession_debug_print_script_array gem_array = <gem_array>
	printf \{channel = jam_mode
		qs(0x03ac90f0)}
	guitar_jam_print_recording track = ($jam_tracks [<jam_instrument>].id)
	printf \{channel = jam_mode
		qs(0x03ac90f0)}
	printf \{channel = jam_mode
		qs(0x03ac90f0)}
	printf \{channel = jam_mode
		qs(0xc6ec2cf0)}
endscript

script jamsession_debug_print_script_array gem_array = <gem_array>
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	GetArraySize \{$gem_colors}
	gem_color_array_size = <array_Size>
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
	printf channel = jam_mode qs(0xdf54467d) s = ($<appended_id>)
	<notetrack_size> = <appended_id>
	count = 0
	begin
	if (($<notetrack_size>) = 0)
		break
	endif
	getnotetrackitem Name = <gem_array> index = <count>
	debug_get_bitfield_text curr_bitfield = <gem_pattern> num_bits = (<gem_color_array_size> + 6)
	printf channel = jam_mode qs(0x9218e367) d = <bitfield_text> a = <gem_time> b = <gem_length>
	count = (<count> + 2)
	if (<count> > (($<notetrack_size>) - 2))
		break
	endif
	repeat
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
endscript

script guitar_jam_print_recording \{track = rhythm}
	outputjamsessionsounds
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
	getjamsessionsize track = <track>
	printf channel = jam_mode qs(0xf28bdd7a) s = <track_size>
	track_index = 0
	begin
	if (<track_size> = 0)
		return
	endif
	getjamsessionsound track = <track> index = <track_index>
	printf channel = jam_mode qs(0xb485e83b) i = <track_index> t = <time>
	<track_index> = (<track_index> + 1)
	repeat <track_size>
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
endscript
g_optimized_guitar_jam_playback_recording = 1
