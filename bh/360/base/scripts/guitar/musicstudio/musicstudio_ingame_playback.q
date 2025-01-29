musicstudio_current_album_art = [
]

script musicstudio_setup_custom_song 
	musicstudio_mainobj :MusicStudio_SetPlayingSongInGame \{playing = true}
	SongFileManager \{func = reset_static_song_compares}
	GetArraySize \{$jam_tracks}
	track_count = 0
	if NOT notetracker_is_using_stream
		<array_size> = (<array_size> - 1)
	endif
	musicstudio_update_playables
	begin
	if StructureContains structure = ($jam_tracks [<track_count>]) alt_id
		GenerateCustomGemArray track = ($jam_tracks [<track_count>].id) alt_track = ($jam_tracks [<track_count>].alt_id) gem_array = ($jam_tracks [<track_count>].gem_array)
	else
		GenerateCustomGemArray track = ($jam_tracks [<track_count>].id) gem_array = ($jam_tracks [<track_count>].gem_array)
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
	musicstudio_create_fretbars \{playback = 1}
	count = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	GetSongInfo
	jam_copy_in_game_playback_arrays
	GetFirstPlayer
	GetNumPlayersInGame \{local}
	begin
	GetPlayerInfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = beginner)
		<difficulty_real> = easy
	endif
	musicstudio_swap_playback_tracks player = <player>
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		musicstudio_setup_custom_song_guitar {
			playback_track = <playback_track1>
			player = <player>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
		case bass
		musicstudio_setup_custom_song_bass {
			playback_track = <playback_track2>
			player = <player>
			difficulty_real = <difficulty_real>
			difficulty_text = <difficulty_text>
		}
		case Drum
		if (<playback_track_drums> > 0)
			musicstudio_setup_custom_song_drums {
				player = <player>
				difficulty_real = <difficulty_real>
				difficulty_text = <difficulty_text>
			}
		endif
		case vocals
		if (<playback_track_vocals> > 0)
			if notetracker_is_using_stream
				musicstudio_setup_custom_song_vocals {
					player = <player>
					playback_track = 5
				}
			endif
		endif
	endswitch
	GetNextPlayer player = <player>
	repeat <num_players>
	ProcessDrumNotes \{name = editable_drums_notes
		gems = editable_song_drum_expert}
	CopyFinalScriptArray \{sourcename = editable_drums_notes
		destname = jamsession_drums_notes}
	Change musicstudio_current_album_art = ($jamsession_jam_album_cover)
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<songlist> = ($jamsession_songlist_props)
	<song_struct> = (<songlist>.jamsession)
	return {
		song_name = <song_name>
		songlist = <songlist>
		song_struct = <song_struct>
		end_time = <end_time>
	}
endscript

script musicstudio_create_fretbars \{playback = 0}
	song_prefix = 'editable'
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	AppendSuffixToChecksum base = <fretbar_array> SuffixString = '_size'
	fretbar_size_name = <appended_id>
	Change globalname = <fretbar_size_name> newValue = 0
	song_length = ($jam_highway_song_length)
	musicstudio_mainobj :MusicStudioGhmix_GetNoteQuantizeMS note = (1.0 / 4.0)
	if (<playback> = 1)
		<song_length> = (<song_length> + (<note_quantize_ms> * 12))
	endif
	song_time = 0.0
	song_time_int = 0
	begin
	AddScriptArrayItem name = <fretbar_array> integer = <song_time_int>
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
	AppendSuffixToChecksum base = <fretbar_array> SuffixString = <suffix>
	fretbar_size = <appended_id>
	Change jam_highway_end_time = ($<fretbar_array> [($<fretbar_size_name> - 1)])
	if (<playback> = 1)
		CopyFinalScriptArray \{sourcename = editable_fretbars
			destname = jamsession_fretbars}
	endif
endscript

script musicstudio_swap_playback_tracks 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	GetSongInfo
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

script musicstudio_setup_custom_song_guitar 
	RequireParams \{[
			playback_track
			player
			difficulty_text
			difficulty_real
		]
		all}
	Source = ($jam_tracks [<playback_track>].gem_array)
	FormatText checksumname = editable_dest 'editable_song_%s' s = <difficulty_text>
	FormatText checksumname = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
	GenerateDiffScriptArray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		type = guitar
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars guitar
	ProcessExtendedSustains name = <editable_dest> name_fretbar = editable_fretbars
	CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
	if GlobalExists \{name = guitar_gem_array
			type = array}
		DestroyScriptArray \{name = guitar_gem_array}
	endif
	SetPlayerInfo <player> jam_instrument = <playback_track>
	FormatText checksumname = editable_star 'editable_%s_star' s = <difficulty_text>
	FormatText checksumname = jamsession_star 'jamsession_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = lead
		alt_track = rhythm
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = <playback_track>
	}
endscript

script musicstudio_setup_custom_song_bass 
	RequireParams \{[
			playback_track
			player
			difficulty_text
			difficulty_real
		]
		all}
	Source = ($jam_tracks [<playback_track>].gem_array)
	FormatText checksumname = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
	FormatText checksumname = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
	GenerateDiffScriptArray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		type = bass
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars
	CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
	SetPlayerInfo <player> part = bass
	SetPlayerInfo <player> jam_instrument = <playback_track>
	FormatText checksumname = editable_star 'editable_rhythm_%s_star' s = <difficulty_text>
	FormatText checksumname = jamsession_star 'jamsession_rhythm_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = bass
		alt_track = melody
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = <playback_track>
	}
endscript

script musicstudio_setup_custom_song_drums 
	RequireParams \{[
			player
			difficulty_text
			difficulty_real
		]
		all}
	Source = editable_song_drum_expert
	FormatText checksumname = editable_dest 'editable_song_drum_%s' s = <difficulty_text>
	FormatText checksumname = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
	GenerateDiffScriptArray {sourcename = <Source>
		destname = <editable_dest>
		diff = <difficulty_real>
		type = Drum
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	ProcessDrumVelocity name = <editable_dest>
	CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
	SetPlayerInfo <player> part = Drum
	SetPlayerInfo <player> jam_instrument = 3
	FormatText checksumname = editable_star 'editable_drum_%s_star' s = <difficulty_text>
	FormatText checksumname = jamsession_star 'jamsession_drum_%s_star' s = <difficulty_text>
	set_jam_song_star_sequence {
		primary_track = Drum
		output_array = <jamsession_star>
		editable_array = <editable_star>
		gem_array = <Source>
		instrument = 3
	}
endscript

script musicstudio_setup_custom_song_vocals 
	RequireParams \{[
			player
		]
		all}
	GenerateDiffScriptArray {sourcename = ($jam_tracks [<playback_track>].gem_array)
		destname = ($jam_tracks [<playback_track>].gem_array)
		diff = hard
		type = guitar
		fretbars = editable_fretbars
		timesig = editible_timesig
	}
	GetTrackSize track = ($jam_tracks [<playback_track>].id)
	end_time = 0
	if (<track_size> > 0)
		GetCustomNote track = ($jam_tracks [<playback_track>].id) index = (<track_size> - 1)
		end_time = <note_time>
	endif
	if notetracker_is_using_stream
		jam_auto_generate_vocals_gem_array end_time = <end_time>
	else
		jam_auto_generate_melody_gem_array end_time = <end_time>
		CopyFinalScriptArray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
	endif
	SetPlayerInfo <player> part = vocals
	vocals_distribute_mics
	SetPlayerInfo <player> jam_instrument = <playback_track>
endscript

script process_gem_times 
	GetSongInfo
	if NOT (<streamfile> = '')
		return
	endif
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 4.0)
	ProcessGemTimes name = <editable_dest> name_fretbar = editable_fretbars offset_time = <offset_time>
endscript

script process_sound_times 
	GetSongInfo
	if NOT (<streamfile> = '')
		return
	endif
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 4.0)
	if GotParam \{negate}
		<offset_time> = (-1 * <offset_time>)
	endif
	ProcessSoundTimes offset_time = <offset_time>
endscript

script musicstudio_update_playables 
	musicstudio_mainobj :MusicStudio_UpdatePlayables \{primary_track = lead
		alt_track = rhythm}
	musicstudio_mainobj :MusicStudio_UpdatePlayables \{primary_track = bass
		alt_track = melody}
endscript
jamsession_max_star_sequences = 12

script set_jam_song_star_sequence 
	musicstudio_mainobj :MusicStudio_GenerateStarPowerSequences {primary_track = <primary_track>
		alt_track = <alt_track>
		star_power_array = <editable_array>}
	CopyFinalScriptArray sourcename = <editable_array> destname = <output_array>
	printstruct channel = musicstudio ($<output_array>)
endscript
