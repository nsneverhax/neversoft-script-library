
script jam_recording_create_editable_arrays 
	song_prefix = 'editable'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	jamsession_array_action <...> func = createscriptarray
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	if NOT GotParam \{Heap}
		musicstudio_mainobj :musicstudio_getcurrentheap
	endif
	createscriptarray Name = <arraylist> size = <arraylistsize> Heap = <Heap> Type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem
endscript

script jamsession_array_action_destroy 
	if NOT GotParam \{Heap}
		musicstudio_mainobj :musicstudio_getcurrentheap
	endif
	gem_count = <gemarraysize>
	star_count = <starsize>
	formatText checksumName = song_checksum '%s_guitar_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_drums_notes' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <drumnotessize> Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_fretbars' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <fretbarsize> Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_timesig' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <starsize> size2 = 3 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_BandMoment' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = 0 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_DrumSolo' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = 0 size2 = 2 Heap = <Heap> <...>
	GetArraySize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].Name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	formatText checksumName = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = 0 Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <script_array_size> Heap = <Heap> <...>
	count = (<count> + 1)
	repeat <array_Size>
	count = 1
	begin
	if (<count> = 5)
		<difficulty_text> = 'in_game'
	else
		difficulty = ($difficulty_list [<count>])
		get_difficulty_text_nl difficulty = <difficulty>
		<difficulty_text> = <difficulty_text_nl>
	endif
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
	destroyscriptarray Name = <song_checksum> size = (2 * <gem_count>) Heap = <Heap> <...>
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		destroyscriptarray Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		destroyscriptarray Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s%t_%d_star' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		destroyscriptarray Name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 Heap = <Heap> <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		destroyscriptarray Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		destroyscriptarray Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	formatText checksumName = song_checksum '%s_song_vocals' s = <song_prefix> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = (3 * <gemarraysize>) Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_vocals_Star' s = <song_prefix> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_jam_album_cover' s = <song_prefix> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = 1 Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_jam_markers' s = <song_prefix> AddToStringLookup = true
	destroyscriptarray Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
endscript

script jam_recording_create_jamsession_arrays 
	song_prefix = 'jamsession'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	if NOT GotParam \{Heap}
		musicstudio_mainobj :musicstudio_getcurrentheap
	endif
	createscriptarray Name = <arraylist2> size = <arraylistsize> Heap = <Heap> Type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem arraylist = <arraylist2>
endscript

script jam_recording_setup_timesig 
	song_prefix = 'editable'
	formatText checksumName = timesig_array '%s_timesig' s = <song_prefix> AddToStringLookup = true
	timesig_to_add = [0 , 4 , 4]
	addscriptarrayitem Name = <timesig_array> array = <timesig_to_add>
endscript

script jam_recording_cleanup 
	song_prefix = 'editable'
	formatText checksumName = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	formatText checksumName = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	clearcustomsong
	jamsession_unload \{song_prefix = 'editable'}
endscript

script jamsession_addscriptarrayitem 
	addscriptarrayitem Name = <arraylist> checksum = <song_checksum>
endscript

script jamsession_array_action 
	if NOT GotParam \{Heap}
		musicstudio_mainobj :musicstudio_getcurrentheap
	endif
	formatText checksumName = song_checksum '%s_jam_markers' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_jam_album_cover' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = 1 Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_vocals_Star' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_song_vocals' s = <song_prefix> AddToStringLookup = true
	<func> Name = <song_checksum> size = (3 * <gemarraysize>) Heap = <Heap> <...>
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
	<func> Name = <song_checksum> size = (2 * <gem_count>) Heap = <Heap> <...>
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s%t_%d_star' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		formatText checksumName = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
		formatText checksumName = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
		<func> Name = <song_checksum> size = 0 size2 = 3 Heap = <Heap> <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	formatText checksumName = song_checksum '%s_DrumSolo' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 size2 = 2 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_BandMoment' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_timesig' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <starsize> size2 = 3 Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_fretbars' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_drums_notes' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <drumnotessize> Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_guitar_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = <fretbarsize> Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_rhythm_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 1 Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_drum_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 1 Heap = <Heap> Type = structure <...>
	formatText checksumName = song_checksum '%s_vocals_markers' s = <song_prefix> t = <Type> d = <difficulty_text> AddToStringLookup = true
	<func> Name = <song_checksum> size = 1 Heap = <Heap> Type = structure <...>
	GetArraySize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].Name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	formatText checksumName = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	<func> Name = <song_checksum> size = <script_array_size> Heap = <Heap> <...>
	formatText checksumName = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].Name) AddToStringLookup = true
	<func> Name = <song_checksum> size = 0 Heap = <Heap> Type = structure <...>
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

script jamsession_unload \{song_prefix = 'jamsession'}
	if ($notetracker_quickplay_active = 1)
		return
	endif
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
	destroyscriptarray Name = ($<arraylist> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
	destroyscriptarray Name = <arraylist>
	if (<song_prefix> = 'jamsession')
		songfilemanager \{func = clear_stub_file_data
			song_name = jamsession}
		destroyscriptarray \{Name = jamsession_song_vocals
			song_array = 1}
		destroyscriptarray \{Name = jamsession_lyrics}
		destroyscriptarray \{Name = jamsession_vocals_markers}
		destroyscriptarray \{Name = jamsession_vocals_phrases}
	endif
	jam_clear_clipboards
	if (<song_prefix> = 'jamsession')
		musicstudio_mainobj :musicstudio_removecurrentsong
	endif
endscript
