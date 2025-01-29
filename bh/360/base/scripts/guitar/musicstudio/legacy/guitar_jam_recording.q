guitar_jam_playback_recordng_increment_track_index = 0

script playback_custom_song \{in_game = 0}
	reset_song_time starttime = <start_time>
	musicstudio_mainobj :MusicStudio_PlaySong start_time = <start_time>
endscript

script stop_custom_song 
	if CompositeObjectExists \{name = musicstudio_mainobj}
		musicstudio_mainobj :MusicStudio_PauseSong
	endif
endscript

script playback_custom_track \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf channel = musicstudio qs(0x71cf05c5) a = <jam_instrument> b = <start_time>
	track = ($jam_tracks [<jam_instrument>].id)
	reset_song_time starttime = <start_time>
	GetTrackSize track = <track>
	orig_size = <track_size>
	if (<track_size> = 0)
		return
	endif
	start_at_index = -1
	CastToInteger \{start_time}
	if FindCustomNote track = ($jam_tracks [<jam_instrument>].id) time = <start_time>
		printf channel = musicstudio qs(0xd95807c8) a = <jam_instrument> b = <index>
		<start_at_index> = <index>
	endif
	if (<start_at_index> < 0 || <start_at_index> >= <track_size>)
		ScriptAssert qs(0x5e10de6a) a = <jam_instrument> b = <start_at_index>
		return
	endif
	FormatText checksumname = spawn_id 'playback_sustain_note_%s' s = <jam_instrument>
	playback_index = <start_at_index>
	begin
	if (<playback_index> >= <track_size>)
		break
	endif
	if NOT musicstudio_mainobj :MusicStudio_PlaySong {
			track = <track>
			jam_instrument = <jam_instrument>
			playback_index = <playback_index>
			orig_size = <orig_size>
			spawn_id = <spawn_id>
		}
		break
	endif
	wait \{1
		gameframe}
	repeat
	printf channel = musicstudio qs(0xe8ba1c7e) a = <jam_instrument>
endscript

script playback_delete_custom_track \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf channel = musicstudio qs(0x90053ebc) a = <jam_instrument> b = <start_time>
	jam_stop_sound jam_instrument = <jam_instrument>
	track = ($jam_tracks [<jam_instrument>].id)
	reset_song_time starttime = <start_time>
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 4.0)
	forward_delete = <note_quantize_ms>
	CastToInteger \{forward_delete}
	GetTrackSize track = <track>
	orig_size = <track_size>
	if (<track_size> = 0)
		return
	endif
	start_at_index = -1
	CastToInteger \{start_time}
	if FindCustomNote track = ($jam_tracks [<jam_instrument>].id) time = <start_time>
		printf channel = musicstudio qs(0xbd6a64e4) a = <jam_instrument> b = <index>
		<start_at_index> = <index>
	endif
	if (<start_at_index> < 0 || <start_at_index> >= <track_size>)
		ScriptAssert qs(0x9c65709d) a = <jam_instrument> b = <start_at_index>
		return
	endif
	delete_index = <start_at_index>
	begin
	if NOT PlaybackDeleteCustomTrack {
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

script jam_recording_sustain_note 
	length_seconds = (<length> / 1000.0)
	wait <length_seconds> seconds
	switch <instrument>
		case 0
		StopSound \{unique_id = $jam_input_current_chord
			fade_type = linear
			fade_time = $jam_fade_time}
		case 1
		StopSound \{unique_id = $jam_input_current_lead
			fade_type = linear
			fade_time = $jam_fade_time}
		case 2
		StopSound \{unique_id = $jam_input_current_bass
			fade_type = linear
			fade_time = $jam_fade_time}
		case 4
		jam_input_melody_stop_sound
	endswitch
endscript

script jam_stop_all_samples 
	StopSound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	StopSound unique_id = ($jam_input_current_lead) fade_type = linear fade_time = $jam_fade_time
	StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	jam_input_melody_stop_sound
endscript

script jam_stop_instrument_sample \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		StopSound \{unique_id = $jam_input_current_chord
			fade_type = linear
			fade_time = $jam_fade_time}
		case 1
		StopSound \{unique_id = $jam_input_current_lead
			fade_type = linear
			fade_time = $jam_fade_time}
		case 2
		StopSound \{unique_id = $jam_input_current_bass
			fade_type = linear
			fade_time = $jam_fade_time}
		case 4
		jam_input_melody_stop_sound
	endswitch
endscript

script jam_fadeout_sound_event 
	fade_out_event = <event>
	if IsSoundEventPlaying <fade_out_event>
		AppendSuffixToChecksum base = <fade_out_event> SuffixString = '_container'
		event_container = <appended_id>
		sound_array = (($<event_container>).sounds)
		GetArraySize <sound_array>
		count = 0
		begin
		if issoundplaying (<sound_array> [<count>])
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
		SetSoundParams (<sound_array> [<count>]) vol = 0
		wait \{0.15
			seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -6
		wait \{0.15
			seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -12
		StopSoundEvent <fade_out_event>
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
	FormatText \{checksumname = simple_rec_button_onl1
		'jam_simple_rec_button_onl_%s'
		s = 1}
	FormatText \{checksumname = simple_rec_button_onl2
		'jam_simple_rec_button_onl_%s'
		s = 2}
	FormatText \{checksumname = simple_rec_button_onl3
		'jam_simple_rec_button_onl_%s'
		s = 3}
	FormatText \{checksumname = simple_rec_button_onl4
		'jam_simple_rec_button_onl_%s'
		s = 4}
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	tick = 0
	begin
	if GotParam \{tempo_preview}
		GetSongTimeMs
	else
		musicstudio_mainobj :MusicStudioGhmix_GetSongTime
		time = <song_time>
	endif
	CastToInteger \{time}
	if (<time> >= <new_time_measure>)
		<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
		<new_time_measure> = (<new_time_measure> + <quantize_measure>)
		if ($jam_click_track = 1)
			SoundEvent \{event = Jam_Mode_Metronome
				downbeat = 1}
			printf \{channel = jam_mode
				qs(0xdd747a2e)}
		endif
		if NOT GotParam \{sound_only}
			if (<flash_light> = 1)
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
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
			SoundEvent \{event = Jam_Mode_Metronome}
		endif
		if NOT GotParam \{sound_only}
			if (<flash_light> = 1)
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
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
	wait \{1
		gameframe}
	repeat
endscript

script jam_recording_metronome_stop 
	killspawnedscript \{name = jam_recording_metronome}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = metronome_box}
			<resolved_id> :SetProps Pos = (51.0, 800.0) time = 0.2
			<resolved_id> :SE_WaitProps
		endif
	endif
endscript

script jam_flash_recording_element 
	safe_show id = <id>
	wait \{10
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

script jamsession_AddScriptArrayItem 
	AddScriptArrayItem name = <arraylist> checksum = <song_checksum>
endscript

script jamsession_array_action 
	musicstudio_mainobj :MusicStudio_GetCurrentHeap
	FormatText checksumname = song_checksum '%s_jam_markers' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	FormatText checksumname = song_checksum '%s_jam_album_cover' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = 1 heap = <heap> type = structure <...>
	FormatText checksumname = song_checksum '%s_vocals_Star' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_song_vocals' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = (3 * <gemarraysize>) heap = <heap> <...>
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
		type = ''
		case 1
		type = '_rhythm'
		case 2
		type = '_drum'
		case 3
		type = '_guitarcoop'
		case 4
		type = '_rhythmcoop'
	endswitch
	FormatText checksumname = song_checksum '%s_song%t_%d' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = (2 * <gem_count>) heap = <heap> <...>
	if NOT (<count> = 5)
		FormatText checksumname = song_checksum '%s%t_%d_star' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 heap = <heap> <...>
		FormatText checksumname = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
		FormatText checksumname = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		FormatText checksumname = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
		FormatText checksumname = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	FormatText checksumname = song_checksum '%s_DrumSolo' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_BandMoment' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_timesig' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <starsize> size2 = 3 heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_fretbars' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_drums_notes' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <drumnotessize> heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_markers' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	FormatText checksumname = song_checksum '%s_guitar_markers' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	GetArraySize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	FormatText checksumname = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].name) AddToStringLookup = true
	<func> name = <song_checksum> size = <script_array_size> heap = <heap> <...>
	FormatText checksumname = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].name) AddToStringLookup = true
	<func> name = <song_checksum> size = 0 heap = <heap> type = structure <...>
	count = (<count> + 1)
	repeat <array_size>
endscript

script jamsession_copyfinalscriptarrays 
	ExtendCrc <arraylist> '_size' out = arraylistsize
	count = 0
	begin
	CopyFinalScriptArray sourcename = ($<arraylist> [<count>]) destname = ($<arraylist2> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
endscript

script jamsession_unload \{song_prefix = 'jamsession'}
	if ($notetracker_quickplay_active = 1)
		return
	endif
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix>
	ExtendCrc <arraylist> '_size' out = arraylistsize
	if NOT GlobalExists name = <arraylist> type = array
		return
	endif
	if ($<arraylistsize> <= 0)
		return
	endif
	count = 0
	begin
	if GlobalExists name = ($<arraylist> [<count>]) type = array
		DestroyScriptArray name = ($<arraylist> [<count>])
	endif
	count = (<count> + 1)
	repeat $<arraylistsize>
	if GlobalExists name = <arraylist> type = array
		DestroyScriptArray name = <arraylist>
	endif
	if (<song_prefix> = 'jamsession')
		if GlobalExists \{name = jamsession_song_vocals
				type = array}
			DestroyScriptArray \{name = jamsession_song_vocals}
		endif
		if GlobalExists \{name = jamsession_lyrics
				type = array}
			DestroyScriptArray \{name = jamsession_lyrics}
		endif
		if GlobalExists \{name = jamsession_vocals_markers
				type = array}
			DestroyScriptArray \{name = jamsession_vocals_markers}
		endif
		if GlobalExists \{name = jamsession_vocals_phrases
				type = array}
			DestroyScriptArray \{name = jamsession_vocals_phrases}
		endif
	endif
	jam_clear_clipboards
	if (<song_prefix> = 'jamsession')
		musicstudio_mainobj :MusicStudio_RemoveCurrentSong
	endif
endscript

script jam_add_end_of_song_marker 
	track_count = 0
	last_end_time = 0
	begin
	GetTrackSize track = ($jam_tracks [<track_count>].id)
	if (<track_size> > 0)
		GetCustomNote track = ($jam_tracks [<track_count>].id) index = (<track_size> - 1)
		if ((<note_time> + <note_length>) > <last_end_time>)
			<last_end_time> = (<note_time> + <note_length>)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat 5
	musicstudio_mainobj :MusicStudioGhmix_GetSnapTime time = <last_end_time> snap = 1.0 direction = 1
	CastToInteger \{snap_time}
	if ($musicstudio_0_song_length = 1)
		<snap_time> = 0
	endif
	new_marker = {time = <snap_time> , marker = qs(0x00167369)}
	SetArrayElement arrayName = editable_guitar_markers GlobalArray index = 0 newValue = <new_marker>
	Change \{globalname = editable_guitar_markers_size
		newValue = 1}
	CopyFinalScriptArray \{sourcename = editable_guitar_markers
		destname = jamsession_guitar_markers}
	printf channel = jam_mode qs(0x897e20dd) a = <snap_time>
	return end_time = <snap_time>
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
	AppendSuffixToChecksum base = <gem_array> SuffixString = <suffix>
	GetArraySize \{$gem_colors}
	gem_color_array_size = <array_size>
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
	printf channel = jam_mode qs(0xdf54467d) s = ($<appended_id>)
	<notetrack_size> = <appended_id>
	count = 0
	begin
	if (($<notetrack_size>) = 0)
		break
	endif
	GetNoteTrackItem name = <gem_array> index = <count>
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
	OutputJamSessionSounds
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
	GetTrackSize track = <track>
	printf channel = jam_mode qs(0xf28bdd7a) s = <track_size>
	track_index = 0
	begin
	if (<track_size> = 0)
		return
	endif
	GetJamSessionSound track = <track> index = <track_index>
	printf channel = jam_mode qs(0xb485e83b) i = <track_index> t = <time>
	<track_index> = (<track_index> + 1)
	repeat <track_size>
	printf \{channel = jam_mode
		qs(0x3fa9d5dd)}
endscript
