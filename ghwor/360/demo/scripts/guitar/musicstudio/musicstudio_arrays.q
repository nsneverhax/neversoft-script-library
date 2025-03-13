
script jam_recording_create_editable_arrays 
	song_prefix = 'editable'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	jamsession_array_action <...> func = createscriptarray
	formattext checksumname = arraylist '%s_arraylist' s = <song_prefix> addtostringlookup = true
	musicstudio_mainobj :musicstudio_getcurrentheap
	createscriptarray name = <arraylist> size = <arraylistsize> heap = <heap> type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem
endscript

script jam_recording_create_jamsession_arrays 
	song_prefix = 'jamsession'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	drumnotessize = ($drumnotessize)
	arraylistsize = ($arraylistsize)
	formattext checksumname = arraylist2 '%s_arraylist' s = <song_prefix> addtostringlookup = true
	musicstudio_mainobj :musicstudio_getcurrentheap
	createscriptarray name = <arraylist2> size = <arraylistsize> heap = <heap> type = checksum
	jamsession_array_action <...> func = jamsession_addscriptarrayitem arraylist = <arraylist2>
endscript

script jam_recording_setup_timesig 
	song_prefix = 'editable'
	formattext checksumname = timesig_array '%s_timesig' s = <song_prefix> addtostringlookup = true
	timesig_to_add = [0 , 4 , 4]
	addscriptarrayitem name = <timesig_array> array = <timesig_to_add>
endscript

script jam_recording_cleanup 
	song_prefix = 'editable'
	formattext checksumname = arraylist '%s_arraylist' s = <song_prefix> addtostringlookup = true
	song_prefix = 'jamsession'
	formattext checksumname = arraylist2 '%s_arraylist' s = <song_prefix> addtostringlookup = true
	clearcustomsong
	jamsession_unload \{song_prefix = 'editable'}
endscript

script jamsession_addscriptarrayitem 
	addscriptarrayitem name = <arraylist> checksum = <song_checksum>
endscript

script jamsession_array_action 
	musicstudio_mainobj :musicstudio_getcurrentheap
	formattext checksumname = song_checksum '%s_jam_markers' s = <song_prefix> addtostringlookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_jam_album_cover' s = <song_prefix> addtostringlookup = true
	<func> name = <song_checksum> size = 1 heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_vocals_Star' s = <song_prefix> addtostringlookup = true
	<func> name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 heap = <heap> <...>
	formattext checksumname = song_checksum '%s_song_vocals' s = <song_prefix> addtostringlookup = true
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
	formattext checksumname = song_checksum '%s_song%t_%d' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = (2 * <gem_count>) heap = <heap> <...>
	if NOT (<count> = 5)
		formattext checksumname = song_checksum '%s%t_%d_star' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
		<func> name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 heap = <heap> <...>
		formattext checksumname = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
		formattext checksumname = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		formattext checksumname = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
		formattext checksumname = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = <heap> <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	formattext checksumname = song_checksum '%s_DrumSolo' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = <heap> <...>
	formattext checksumname = song_checksum '%s_BandMoment' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = 0 heap = <heap> <...>
	formattext checksumname = song_checksum '%s_timesig' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = <starsize> size2 = 3 heap = <heap> <...>
	formattext checksumname = song_checksum '%s_fretbars' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> <...>
	formattext checksumname = song_checksum '%s_drums_notes' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = <drumnotessize> heap = <heap> <...>
	formattext checksumname = song_checksum '%s_markers' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_guitar_markers' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_rhythm_markers' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = 1 heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_drum_markers' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = 1 heap = <heap> type = structure <...>
	formattext checksumname = song_checksum '%s_vocals_markers' s = <song_prefix> t = <type> d = <difficulty_text> addtostringlookup = true
	<func> name = <song_checksum> size = 1 heap = <heap> type = structure <...>
	getarraysize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	formattext checksumname = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].name) addtostringlookup = true
	<func> name = <song_checksum> size = <script_array_size> heap = <heap> <...>
	formattext checksumname = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].name) addtostringlookup = true
	<func> name = <song_checksum> size = 0 heap = <heap> type = structure <...>
	count = (<count> + 1)
	repeat <array_size>
endscript

script jamsession_copyfinalscriptarrays 
	extendcrc <arraylist> '_size' out = arraylistsize
	count = 0
	begin
	copyfinalscriptarray sourcename = ($<arraylist> [<count>]) destname = ($<arraylist2> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
endscript

script jamsession_unload \{song_prefix = 'jamsession'}
	formattext checksumname = arraylist '%s_arraylist' s = <song_prefix>
	extendcrc <arraylist> '_size' out = arraylistsize
	if NOT globalexists name = <arraylist> type = array
		return
	endif
	if ($<arraylistsize> <= 0)
		return
	endif
	count = 0
	begin
	destroyscriptarray name = ($<arraylist> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
	destroyscriptarray name = <arraylist>
	if (<song_prefix> = 'jamsession')
		songfilemanager \{func = clear_stub_file_data
			song_name = jamsession}
		destroyscriptarray \{name = jamsession_song_vocals
			song_array = 1}
		destroyscriptarray \{name = jamsession_lyrics}
		destroyscriptarray \{name = jamsession_vocals_markers}
		destroyscriptarray \{name = jamsession_vocals_phrases}
	endif
	jam_clear_clipboards
	if (<song_prefix> = 'jamsession')
		musicstudio_mainobj :musicstudio_removecurrentsong
	endif
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
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	getarraysize \{$gem_colors}
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
	getnotetrackitem name = <gem_array> index = <count>
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
	gettracksize track = <track>
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
