
script musicstudio_setup_custom_song 
	musicstudio_mainobj :musicstudio_setplayingsongingame \{playing = true}
	songfilemanager \{func = reset_static_song_compares}
	GetArraySize \{$jam_tracks}
	track_count = 0
	<array_Size> = (<array_Size> - 1)
	musicstudio_update_playables
	begin
	if StructureContains structure = ($jam_tracks [<track_count>]) alt_id
		generatecustomgemarray track = ($jam_tracks [<track_count>].id) alt_track = ($jam_tracks [<track_count>].alt_id) gem_array = ($jam_tracks [<track_count>].gem_array)
	else
		generatecustomgemarray track = ($jam_tracks [<track_count>].id) gem_array = ($jam_tracks [<track_count>].gem_array)
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_Size>
	musicstudio_create_fretbars \{playback = 1}
	count = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	getsonginfo
	jam_copy_in_game_playback_arrays
	musicstudio_copy_jam_array_to_note_file \{sourcename = editable_timesig
		Type = timesig}
	<guitar_setup> = 0
	<bass_setup> = 0
	getfirstplayer
	getnumplayersingame \{local}
	begin
	getplayerinfo <Player> difficulty
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm = 1
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = beginner)
		<difficulty_real> = easy
	endif
	musicstudio_swap_playback_tracks Player = <Player>
	getplayerinfo <Player> part
	switch <part>
		case guitar
		musicstudio_setup_custom_song_guitar {
			playback_track = <playback_track1>
			Player = <Player>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
		<guitar_setup> = 1
		case bass
		musicstudio_setup_custom_song_bass {
			playback_track = <playback_track2>
			Player = <Player>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
		<bass_setup> = 1
		case drum
		if (<playback_track_drums> > 0)
			musicstudio_setup_custom_song_drums {
				Player = <Player>
				difficulty_real = <difficulty_real>
				difficulty_text = <difficulty_text>
			}
		endif
		case vocals
	endswitch
	getnextplayer Player = <Player>
	repeat <num_players>
	if (<guitar_setup> = 0 && <playback_track1> >= 0)
		musicstudio_setup_custom_song_guitar {
			playback_track = <playback_track1>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
	endif
	if (<bass_setup> = 0 && <playback_track2> >= 0)
		musicstudio_setup_custom_song_bass {
			playback_track = <playback_track2>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
	endif
	processdrumnotes \{Name = editable_drums_notes
		gems = editable_song_drum_expert}
	copyfinalscriptarray \{sourcename = editable_drums_notes
		destname = jamsession_drums_notes}
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<SongList> = ($jamsession_songlist_props)
	<song_struct> = (<SongList>.jamsession)
	return {
		song_name = <song_name>
		SongList = <SongList>
		song_struct = <song_struct>
		end_time = <end_time>
	}
endscript

script musicstudio_create_fretbars \{playback = 0}
	song_prefix = 'editable'
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	AppendSuffixToChecksum Base = <fretbar_array> SuffixString = '_size'
	fretbar_size_name = <appended_id>
	Change GlobalName = <fretbar_size_name> NewValue = 0
	song_length = ($jam_highway_song_length)
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 4.0)
	if (<playback> = 1)
		<song_length> = (<song_length> + (<note_quantize_ms> * 12))
	endif
	song_time = 0.0
	song_time_int = 0
	begin
	addscriptarrayitem Name = <fretbar_array> integer = <song_time_int>
	<song_time> = (<song_time> + <note_quantize_ms>)
	<new_time_rounding_check> = (<song_time> + 0.5)
	CastToInteger \{new_time_rounding_check}
	<song_time_int> = <song_time>
	CastToInteger \{song_time_int}
	if NOT (<new_time_rounding_check> = <song_time_int>)
		<song_time_int> = (<song_time_int> + 1)
	endif
	if (<song_time> > <song_length>)
		break
	endif
	repeat
	suffix = '_size'
	AppendSuffixToChecksum Base = <fretbar_array> SuffixString = <suffix>
	fretbar_size = <appended_id>
	Change jam_highway_end_time = ($<fretbar_array> [($<fretbar_size_name> - 1)])
	if (<playback> = 1)
		copyfinalscriptarray \{sourcename = editable_fretbars
			destname = jamsession_fretbars}
		musicstudio_copy_jam_array_to_note_file \{sourcename = editable_fretbars
			Type = fretbars}
	endif
endscript

script musicstudio_swap_playback_tracks 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	getsonginfo
	switch <part>
		case guitar
		if (<playback_track1> < 0)
			<playback_track1> = <playback_track2>
		endif
		case bass
		if (<playback_track2> < 0)
			<playback_track2> = <playback_track1>
		endif
	endswitch
	return playback_track1 = <playback_track1> playback_track2 = <playback_track2>
endscript

script musicstudio_copy_diff_related_jam_array_to_note_file 
	if (<sub_type> = 'drumfill')
		formatText checksumName = notefile_dest_struct '%b%c' b = <difficulty> c = <sub_type>
	else
		formatText checksumName = notefile_dest_struct '%a%b%c' a = <part> b = <difficulty> c = <sub_type>
	endif
	copyjamarraytonotefile sourcename = <sourcename> structure_name = <notefile_dest_struct> note_type = <note_type> part = <part>
	if (<difficulty> != 'expert')
		num_fretbar_notes = 0
		songfilemanager \{func = get_num_fretbar_notes
			song_name = jamsession}
		if (<num_fretbar_notes> <= 0)
			musicstudio_copy_diff_related_jam_array_to_note_file <...> difficulty = 'expert'
		endif
	endif
endscript

script musicstudio_copy_jam_array_to_note_file 
	printf channel = bkutcher qs(0xf9dcfea3) c = <Type>
	switch <Type>
		case instrument
		musicstudio_copy_diff_related_jam_array_to_note_file {
			sourcename = <sourcename_instrument>
			part = <part>
			difficulty = <difficulty>
			sub_type = 'instrument'
			note_type = gh5_instrument_note
		}
		musicstudio_copy_diff_related_jam_array_to_note_file {
			sourcename = <sourcename_starpower>
			part = <part>
			difficulty = <difficulty>
			sub_type = 'starpower'
			note_type = gh5_star_note
		}
		case fretbars
		copyjamarraytonotefile sourcename = <sourcename> structure_name = fretbar note_type = gh5_fretbar_note
		case markers
		copyjamarraytonotefile sourcename = <sourcename> structure_name = guitarmarkers note_type = gh5_marker_note
		case timesig
		copyjamarraytonotefile sourcename = <sourcename> structure_name = timesig note_type = gh5_timesig_note
		case drumfill
		musicstudio_copy_diff_related_jam_array_to_note_file {
			sourcename = <sourcename>
			part = 'drum'
			difficulty = <difficulty>
			sub_type = 'drumfill'
			note_type = gh5_drumfill_note
		}
		case vocal_note
		copyjamarraytonotefile sourcename = <sourcename> structure_name = vocals note_type = gh5_vocal_note
		case vocal_marker
		copyjamarraytonotefile sourcename = <sourcename> structure_name = vocalsmarkers note_type = gh5_marker_note
		case vocal_phrase
		copyjamarraytonotefile sourcename = <sourcename> structure_name = vocalphrase note_type = gh5_vocal_phrase
		case vocal_lyric
		copyjamarraytonotefile sourcename = <sourcename> structure_name = vocallyrics note_type = gh5_vocal_lyric
	endswitch
endscript

script musicstudio_setup_custom_song_guitar 
	RequireParams \{[
			playback_track
			difficulty_text
			difficulty_real
		]
		all}
	Source = ($jam_tracks [<playback_track>].gem_array)
	formatText checksumName = editable_dest 'editable_song_%s' s = <difficulty_text>
	formatText checksumName = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
	generatediffscriptarray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		Type = guitar
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	processhammerons Name = <editable_dest> name_fretbar = editable_fretbars guitar
	processextendedsustains Name = <editable_dest> name_fretbar = editable_fretbars
	copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
	destroyscriptarray \{Name = guitar_gem_array}
	if GotParam \{Player}
		setplayerinfo <Player> jam_instrument = <playback_track>
	endif
	formatText checksumName = editable_star 'editable_%s_star' s = <difficulty_text>
	formatText checksumName = jamsession_star 'jamsession_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = lead
		alt_track = rhythm
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = <playback_track>
	}
	musicstudio_copy_jam_array_to_note_file {
		sourcename_instrument = <editable_dest>
		sourcename_starpower = <editable_star>
		part = 'guitar'
		difficulty = <difficulty_text>
		Type = instrument
	}
endscript

script musicstudio_setup_custom_song_bass 
	RequireParams \{[
			playback_track
			difficulty_text
			difficulty_real
		]
		all}
	Source = ($jam_tracks [<playback_track>].gem_array)
	formatText checksumName = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
	formatText checksumName = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
	generatediffscriptarray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		Type = bass
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	processhammerons Name = <editable_dest> name_fretbar = editable_fretbars
	copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
	if GotParam \{Player}
		setplayerinfo <Player> part = bass
		setplayerinfo <Player> jam_instrument = <playback_track>
	endif
	formatText checksumName = editable_star 'editable_rhythm_%s_star' s = <difficulty_text>
	formatText checksumName = jamsession_star 'jamsession_rhythm_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = bass
		alt_track = melody
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = <playback_track>
	}
	musicstudio_copy_jam_array_to_note_file {
		sourcename_instrument = <editable_dest>
		sourcename_starpower = <editable_star>
		part = 'bass'
		difficulty = <difficulty_text>
		Type = instrument
	}
endscript

script musicstudio_setup_custom_song_drums 
	RequireParams \{[
			Player
			difficulty_text
			difficulty_real
		]
		all}
	Source = editable_song_drum_expert
	formatText checksumName = editable_dest 'editable_song_drum_%s' s = <difficulty_text>
	formatText checksumName = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
	generatediffscriptarray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		Type = drum
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	processdrumvelocity Name = <editable_dest>
	copyfinalscriptarray sourcename = <editable_dest> destname = <jamsession_dest>
	setplayerinfo <Player> part = drum
	setplayerinfo <Player> jam_instrument = 3
	formatText checksumName = editable_star 'editable_drum_%s_star' s = <difficulty_text>
	formatText checksumName = jamsession_star 'jamsession_drum_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = drum
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = 3
	}
	musicstudio_copy_jam_array_to_note_file {
		sourcename_instrument = <editable_dest>
		sourcename_starpower = <editable_star>
		part = 'drums'
		difficulty = <difficulty_text>
		Type = instrument
	}
	formatText checksumName = drumfill_array 'editable_%d_DrumFill' d = <difficulty_text>
	musicstudio_copy_jam_array_to_note_file {
		sourcename = <drumfill_array>
		part = 'drums'
		difficulty = <difficulty_text>
		Type = drumfill
	}
endscript

script process_gem_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 4.0)
	processgemtimes Name = <editable_dest> name_fretbar = editable_fretbars offset_time = <offset_time>
endscript

script process_sound_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 4.0)
	if GotParam \{negate}
		<offset_time> = (-1 * <offset_time>)
	endif
	processsoundtimes offset_time = <offset_time>
endscript

script musicstudio_update_playables 
	musicstudio_mainobj :musicstudio_updateplayables \{primary_track = lead
		alt_track = rhythm}
	musicstudio_mainobj :musicstudio_updateplayables \{primary_track = bass
		alt_track = melody}
endscript
jamsession_max_star_sequences = 24

script set_jam_song_star_sequence 
	musicstudio_mainobj :musicstudio_generatestarpowersequences {primary_track = <primary_track>
		alt_track = <alt_track>
		star_power_array = <editable_array>}
	copyfinalscriptarray sourcename = <editable_array> destname = <output_array>
	printstruct channel = musicstudio ($<output_array>)
endscript

script jam_add_end_of_song_marker 
	track_count = 0
	last_end_time = 0
	begin
	gettracksize track = ($jam_tracks [<track_count>].id)
	if (<track_size> > 0)
		getcustomnote track = ($jam_tracks [<track_count>].id) index = (<track_size> - 1)
		if ((<note_time> + <note_length>) > <last_end_time>)
			<last_end_time> = (<note_time> + <note_length>)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat 5
	musicstudio_mainobj :musicstudioghmix_getsnaptime time = <last_end_time> snap = 1.0 direction = 1
	CastToInteger \{snap_time}
	if ($musicstudio_0_song_length = 1)
		<snap_time> = 0
	endif
	new_marker = {time = <snap_time> , marker = qs(0x00167369)}
	SetArrayElement ArrayName = editable_guitar_markers globalarray index = 0 NewValue = <new_marker>
	SetArrayElement ArrayName = editable_rhythm_markers globalarray index = 0 NewValue = <new_marker>
	SetArrayElement ArrayName = editable_drum_markers globalarray index = 0 NewValue = <new_marker>
	SetArrayElement ArrayName = editable_vocals_markers globalarray index = 0 NewValue = <new_marker>
	Change \{GlobalName = editable_guitar_markers_size
		NewValue = 1}
	Change \{GlobalName = editable_rhythm_markers_size
		NewValue = 1}
	Change \{GlobalName = editable_drum_markers_size
		NewValue = 1}
	Change \{GlobalName = editable_vocals_markers_size
		NewValue = 1}
	copyfinalscriptarray \{sourcename = editable_guitar_markers
		destname = jamsession_guitar_markers}
	copyfinalscriptarray \{sourcename = editable_rhythm_markers
		destname = jamsession_rhythm_markers}
	copyfinalscriptarray \{sourcename = editable_drum_markers
		destname = jamsession_drum_markers}
	copyfinalscriptarray \{sourcename = editable_vocals_markers
		destname = jamsession_vocals_markers}
	musicstudio_copy_jam_array_to_note_file \{sourcename = editable_guitar_markers
		Type = markers}
	musicstudio_copy_jam_array_to_note_file \{sourcename = editable_rhythm_markers
		Type = markers}
	musicstudio_copy_jam_array_to_note_file \{sourcename = editable_drum_markers
		Type = markers}
	musicstudio_copy_jam_array_to_note_file \{sourcename = editable_vocals_markers
		Type = markers}
	printf channel = jam_mode qs(0x897e20dd) a = <snap_time>
	return end_time = <snap_time>
endscript
