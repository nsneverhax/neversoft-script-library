musicstudio_curr_marker_name_index = -1
musicstudio_curr_lightshow_index = -1
musicstudio_curr_line6_0 = a
musicstudio_curr_line6_1 = a

script musicstudio_skip_forward_record_state 
	musicstudio_skip_forward <...>
	musicstudio_add_marker_update_name_text
endscript

script musicstudio_skip_backward_record_state 
	musicstudio_skip_backward <...>
	musicstudio_add_marker_update_name_text
endscript

script musicstudio_add_marker_update_name_text 
	musicstudio_add_marker_get_name_text
	musicstudio_add_marker_get_active
	musicstudio_menu_update_button_text button = orange button_text = <name_text> Active = <Active>
endscript

script musicstudio_add_marker_get_name_text 
	if musicstudio_is_marker_focus
		return \{name_text = qs(0xbc4e8553)}
	endif
	return \{name_text = qs(0x619cf5cd)}
endscript

script musicstudio_add_marker_get_active 
	if musicstudio_is_marker_focus
		return \{Active = 1}
	endif
	musicstudio_mainobj :musicstudio_getnummarkers
	if (<num_markers> >= ($musicstudio_max_markers))
		return \{Active = 0}
	endif
	return \{Active = 1}
endscript

script musicstudio_is_marker_focus 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudio_getmarkerindexfromtime time_ms = <song_time>
	musicstudio_mainobj :musicstudio_getmarkerinfo index = <index>
	if ((<time_ms> >= (<song_time> - 2)) && (<time_ms> <= (<song_time> + 2)))
		if NOT (<index> = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript
musicstudio_marker_removed = 0

script musicstudio_remove_marker 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_mainobj :musicstudio_getmarkerindexfromtime time_ms = <song_time>
	musicstudio_mainobj :musicstudio_getmarkerinfo index = <index>
	if ((<time_ms> >= (<song_time> - 2)) && (<time_ms> <= (<song_time> + 2)))
		if NOT (<index> = 0)
			musicstudio_mainobj :musicstudio_destroymarkeratindex index = <index>
			Change \{musicstudio_marker_removed = 1}
		endif
	endif
endscript

script musicstudio_add_marker_get_state 
	if ($musicstudio_marker_removed = 1)
		return \{musicstudio_state = musicstudio_transport_state}
	endif
	Change \{musicstudio_marker_removed = 0}
	return \{musicstudio_state = musicstudio_add_marker_state}
endscript

script musicstudio_add_marker_setup 
	if musicstudio_is_marker_focus
		musicstudio_remove_marker
	else
		Change \{musicstudio_curr_marker_name_index = -1}
		Change \{musicstudio_curr_lightshow_index = -1}
		Change \{musicstudio_curr_line6_0 = a}
		Change \{musicstudio_curr_line6_1 = a}
		Change \{musicstudio_marker_removed = 0}
	endif
endscript

script musicstudio_add_marker_init 
	musicstudio_skip_closest_snap snap = (1.0 / 4.0)
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = FALSE
endscript

script musicstudio_add_marker_deinit 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_enablewhammyrewind enable = true
endscript

script musicstudio_add_marker_skip_forward 
	musicstudio_skip_forward snap = (1.0 / 4.0)
endscript

script musicstudio_add_marker_skip_backward 
	musicstudio_skip_backward snap = (1.0 / 4.0)
endscript

script musicstudio_line6_0_ab_toggle 
	if ($musicstudio_curr_line6_0 = a)
		Change \{musicstudio_curr_line6_0 = b}
	else
		Change \{musicstudio_curr_line6_0 = a}
	endif
	musicstudio_line6_0_get_name_text
	musicstudio_menu_update_button_text button = blue button_text = <name_text>
endscript

script musicstudio_line6_0_get_name_text 
	line6_0_effect_text = qs(0x48020cf2)
	if (($musicstudio_curr_line6_0) = b)
		<line6_0_effect_text> = qs(0x61cab800)
	endif
	return name_text = <line6_0_effect_text>
endscript

script musicstudio_line6_1_ab_toggle 
	if ($musicstudio_curr_line6_1 = a)
		Change \{musicstudio_curr_line6_1 = b}
	else
		Change \{musicstudio_curr_line6_1 = a}
	endif
	musicstudio_line6_1_get_name_text
	musicstudio_menu_update_button_text button = orange button_text = <name_text>
endscript

script musicstudio_line6_1_get_name_text 
	line6_1_effect_text = qs(0x717aa1b2)
	if (($musicstudio_curr_line6_1) = b)
		<line6_1_effect_text> = qs(0x58b21540)
	endif
	return name_text = <line6_1_effect_text>
endscript
musicstudio_max_markers = 100

script musicstudio_add_marker 
	musicstudio_mainobj :musicstudioghmix_getsongtime
	musicstudio_get_selected_marker_name
	marker_name_index = <selected>
	musicstudio_get_selected_marker_lightshow
	marker_lightshow_index = <selected>
	musicstudio_mainobj :musicstudio_getnummarkers
	if (<num_markers> < ($musicstudio_max_markers))
		musicstudio_mainobj :musicstudio_addmarkerattime {
			time_ms = <song_time>
			marker_name = ($musicstudio_markers [<marker_name_index>].id)
			LightShow = ($musicstudio_lightshows [<marker_lightshow_index>].id)
			line6_0_effect_ab = ($musicstudio_curr_line6_0)
			line6_1_effect_ab = ($musicstudio_curr_line6_1)
		}
		musicstudio_ghmix_highway_reinit_all
	endif
	print_marker_info
endscript

script print_marker_info 
	musicstudio_mainobj :musicstudio_getnummarkers
	<ii> = 0
	begin
	musicstudio_mainobj :musicstudio_getmarkerinfo index = <ii>
	printf qs(0x7c0c4582) a = <ii>
	dump
	<ii> = (<ii> + 1)
	repeat <num_markers>
endscript

script musicstudio_marker_name_get_name_text 
	musicstudio_get_selected_marker_name
	formatText TextName = name_text qs(0x222befc1) s = ($musicstudio_markers [<selected>].name_text)
	return name_text = <name_text>
endscript

script musicstudio_change_marker_name 
	Change musicstudio_curr_marker_name_index = <index>
endscript

script musicstudio_get_selected_marker_name 
	selected = 0
	if ($musicstudio_curr_marker_name_index >= 0)
		<selected> = ($musicstudio_curr_marker_name_index)
	endif
	return selected = <selected>
endscript

script musicstudio_get_list_checksum_marker_name 
	return \{list_checksum = musicstudio_markers}
endscript

script musicstudio_marker_lightshow_get_name_text 
	musicstudio_get_selected_marker_lightshow
	formatText TextName = name_text qs(0xb067eea9) s = ($musicstudio_lightshows [<selected>].name_text)
	return name_text = <name_text>
endscript

script musicstudio_change_marker_lightshow 
	Change musicstudio_curr_lightshow_index = <index>
endscript

script musicstudio_get_selected_marker_lightshow 
	selected = 0
	if ($musicstudio_curr_lightshow_index >= 0)
		<selected> = ($musicstudio_curr_lightshow_index)
	endif
	return selected = <selected>
endscript

script musicstudio_get_list_checksum_marker_lightshow 
	return \{list_checksum = musicstudio_lightshows}
endscript

script jamsession_copymarkerarrays \{song = editable}
	suffix = '_lightshow_notes'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_lightshow_notes = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_lightshow_notes> SuffixString = <suffix>
	lightshow_notes_size = <appended_id>
	Change GlobalName = <lightshow_notes_size> NewValue = 0
	musicstudio_mainobj :musicstudio_getnummarkers
	if NOT GlobalExists Name = <song_lightshow_notes> Type = array
		return
	endif
	count = 0
	note_count = 0
	begin
	ms_per_beat = (60000.0 / $jam_current_bpm)
	offset_time = (<ms_per_beat> * 2.0)
	musicstudio_mainobj :musicstudio_getmarkerinfo index = <count>
	curr_time = (<time_ms> + <offset_time>)
	CastToInteger \{curr_time}
	curr_marker_lightshow = <lightshow_index>
	next_time = -1
	if (<count> < (<num_markers> - 1))
		musicstudio_mainobj :musicstudio_getmarkerinfo index = (<count> + 1)
		next_time = (<time_ms> + <offset_time>)
		CastToInteger \{next_time}
	endif
	addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = ($musicstudio_lightshows [<curr_marker_lightshow>].note) velocity = 100
	<note_count> = (<note_count> + 1)
	strobe = 0
	if StructureContains structure = ($musicstudio_lightshows [<curr_marker_lightshow>]) strobe
		strobe = 1
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 40 velocity = 100
		<note_count> = (<note_count> + 1)
	else
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 39 velocity = 100
		<note_count> = (<note_count> + 1)
	endif
	if StructureContains structure = ($musicstudio_lightshows [<curr_marker_lightshow>]) pyro
		addscriptarraynoteitem Name = <song_lightshow_notes> time = <curr_time> length = 80 note = 37 velocity = 100
		<note_count> = (<note_count> + 1)
	endif
	curr_change = ($musicstudio_lightshows [<curr_marker_lightshow>].Change)
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
	repeat <num_markers>
endscript
musicstudio_markers = [
	{
		id = Intro
		name_text = qs(0x085b59c2)
	}
	{
		id = verse
		name_text = qs(0x179ef303)
	}
	{
		id = chorus
		name_text = qs(0x16357c52)
	}
	{
		id = bridge
		name_text = qs(0x4874e3de)
	}
	{
		id = solo
		name_text = qs(0x2b4356ef)
	}
	{
		id = breakdown
		name_text = qs(0x35e56a1a)
	}
	{
		id = fill
		name_text = qs(0xe26cd97e)
	}
	{
		id = lead
		name_text = qs(0x3edd5718)
	}
	{
		id = jam
		name_text = qs(0xb337f2da)
	}
	{
		id = riff
		name_text = qs(0x8fcfee41)
	}
	{
		id = refrain
		name_text = qs(0x14a45295)
	}
	{
		id = coda
		name_text = qs(0x0ccf62a5)
	}
	{
		id = outro
		name_text = qs(0x249404f8)
	}
	{
		id = ending
		name_text = qs(0x69db4030)
	}
]
musicstudio_lightshows = [
	{
		id = prelude_slow
		note = 79
		Change = 0.5
		name_text = qs(0x5705565f)
	}
	{
		id = prelude_med
		note = 79
		Change = 1
		name_text = qs(0x99be6ac8)
	}
	{
		id = prelude_fast
		note = 79
		Change = 2
		name_text = qs(0xee22c12a)
	}
	{
		id = verse_slow
		note = 78
		Change = 0.5
		name_text = qs(0x2d75de17)
	}
	{
		id = verse_med
		note = 78
		Change = 1
		name_text = qs(0x918a9cdc)
	}
	{
		id = verse_fast
		note = 78
		Change = 2
		name_text = qs(0x94524962)
	}
	{
		id = chorus_slow
		note = 77
		Change = 0.5
		name_text = qs(0xf926561d)
	}
	{
		id = chorus_med
		note = 77
		Change = 1
		name_text = qs(0x91b6cc9b)
	}
	{
		id = chorus_fast
		note = 77
		Change = 2
		name_text = qs(0x4001c168)
	}
	{
		id = tension_slow
		note = 76
		Change = 0.5
		name_text = qs(0x672cadbc)
	}
	{
		id = tension_med
		note = 76
		Change = 1
		name_text = qs(0x94b22c0c)
	}
	{
		id = tension_fast
		note = 76
		Change = 2
		name_text = qs(0xde0b3ac9)
	}
	{
		id = climax_slow
		note = 75
		Change = 0.5
		name_text = qs(0xac7cbbe8)
	}
	{
		id = climax_med
		note = 75
		Change = 1
		name_text = qs(0x5fe473a2)
	}
	{
		id = climax_fast
		note = 75
		Change = 2
		name_text = qs(0x155b2c9d)
	}
	{
		id = mellow_slow
		note = 74
		Change = 0.5
		name_text = qs(0x6cef101b)
	}
	{
		id = mellow_med
		note = 74
		Change = 1
		name_text = qs(0x417394db)
	}
	{
		id = mellow_fast
		note = 74
		Change = 2
		name_text = qs(0xd5c8876e)
	}
	{
		id = resolve_slow
		note = 73
		Change = 0.5
		name_text = qs(0x70f3cd42)
	}
	{
		id = resolve_med
		note = 73
		Change = 1
		name_text = qs(0x97bc4ade)
	}
	{
		id = resolve_fast
		note = 73
		Change = 2
		name_text = qs(0xc9d45a37)
	}
	{
		id = strobe
		note = 81
		Change = 8
		name_text = qs(0xae1f1f86)
		strobe
	}
	{
		id = pyro
		note = 72
		Change = 1
		name_text = qs(0xc0859026)
		pyro
	}
	{
		id = silhouette
		note = 71
		Change = 1
		name_text = qs(0x0a5bc9e2)
	}
	{
		id = blackout
		note = 83
		Change = 1
		name_text = qs(0xf6040b1d)
	}
]
