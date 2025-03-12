note_scores = [
	1.0
	1.25
	1.5
	1.75
	2.0
]
note_distance_score = [
	0.0
	1.25
	1.5
	1.75
	4.0
]
repeat_degradation = 0.25
rd_threshold = 350
note_bits = [
	1
	2
	4
	8
	16
	32
]
current_da_diff = easy
diffchannels = [
	diffanalyzer_guitar
	diffanalyzer_rhythm
	diffanalyzer_vocals
	diffanalyzer_drum
]

script difficulty_analyzer_show \{song_name = hotblooded}
	destroy_difficulty_analyzer
	createscreenelement \{type = containerelement
		parent = root_window
		id = diff_analyzer_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		parent = diff_analyzer_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		dims = (1280.0, 720.0)
		rgba = [
			0
			0
			0
			255
		]
		z_priority = 0}
	if (<song_name> = jamsession)
		return
	endif
	destroy_band
	load_songqpak song_name = <song_name>
	text_params = {parent = diff_analyzer_container just = [top left]}
	createscreenelement {
		type = textelement
		<text_params>
		type = textblockelement
		id = diff_analyzer_loading_text
		text = qs(0x5d9a8bef)
		pos = (230.0, 320.0)
		scale = 1.5
		just = [left top]
		rgba = [200 50 50 255]
	}
	wait \{1
		frame}
	if (<difficulty> = all)
		diff_analyzer_show_all_diffs <...>
	else
		diff_analyzer_show_diff <...>
	endif
	if screenelementexists \{id = diff_analyzer_loading_text}
		destroyscreenelement \{id = diff_analyzer_loading_text}
	endif
endscript

script destroy_difficulty_analyzer 
	if screenelementexists \{id = diff_analyzer_container}
		destroyscreenelement \{id = diff_analyzer_container}
	endif
endscript

script diff_analyzer_show_diff 
	change current_da_diff = ($difficulty_list [($difficulty_list_props.<difficulty>.index)])
	array_index = 0
	text_pos = (220.0, 120.0)
	loaded_song = $current_song_qpak
	loaded_marker = $current_song_qpak
	if (<instrument> = guitar)
		extendcrc <loaded_song> '_song_' out = loaded_song
		extendcrc <loaded_marker> '_guitar_markers' out = loaded_marker
	elseif (<instrument> = bass)
		extendcrc <loaded_song> '_song_rhythm_' out = loaded_song
		extendcrc <loaded_marker> '_rhythm_markers' out = loaded_marker
	elseif (<instrument> = drum)
		extendcrc <loaded_song> '_song_drum_' out = loaded_song
		extendcrc <loaded_marker> '_drum_markers' out = loaded_marker
	elseif (<instrument> = vocals)
		extendcrc <loaded_marker> '_vocals_markers' out = loaded_marker
	endif
	extendcrc <loaded_song> ($difficulty_list_props.<difficulty>.text_nl) out = loaded_song
	createscreenelement {
		type = textelement
		<text_params>
		text = ($difficulty_list_props.<difficulty>.text)
		pos = (<text_pos>)
	}
	loaded_fretbar = $current_song_qpak
	extendcrc <loaded_fretbar> '_fretbars' out = loaded_fretbar
	calc_difficulty_from_all_song_sections {
		song_array = <loaded_song>
		marker_array = <loaded_marker>
		fretbar_array = <loaded_fretbar>
		for_graph = 1
	}
	formattext textname = score_text qs(0x1ac8dd83) d = <diff_score>
	createscreenelement {
		type = textelement
		<text_params>
		text = <score_text>
		pos = (<text_pos> + (20.0, 40.0))
		rgba = [255 255 255 255]
	}
endscript

script diff_analyzer_show_all_diffs 
	array_index = 0
	text_pos = (220.0, 160.0)
	begin
	change current_da_diff = ($difficulty_list [<array_index>])
	loaded_song = $current_song_qpak
	loaded_marker = $current_song_qpak
	if (<instrument> = guitar)
		extendcrc <loaded_song> '_song_' out = loaded_song
		extendcrc <loaded_marker> '_guitar_markers' out = loaded_marker
	elseif (<instrument> = bass)
		extendcrc <loaded_song> '_song_rhythm_' out = loaded_song
		extendcrc <loaded_marker> '_rhythm_markers' out = loaded_marker
	elseif (<instrument> = drum)
		extendcrc <loaded_song> '_song_drum_' out = loaded_song
		extendcrc <loaded_marker> '_drum_markers' out = loaded_marker
	elseif (<instrument> = vocals)
		extendcrc <loaded_marker> '_vocals_markers' out = loaded_marker
	endif
	extendcrc <loaded_song> ($difficulty_list_props.($difficulty_list [<array_index>]).text_nl) out = loaded_song
	createscreenelement {
		type = textelement
		<text_params>
		text = ($difficulty_list_props.($difficulty_list [<array_index>]).text)
		pos = (<text_pos> + ((0.0, 120.0) * <array_index>))
	}
	loaded_fretbar = $current_song_qpak
	extendcrc <loaded_fretbar> '_fretbars' out = loaded_fretbar
	calc_difficulty_from_all_song_sections {
		song_array = <loaded_song>
		marker_array = <loaded_marker>
		fretbar_array = <loaded_fretbar>
	}
	formattext textname = score_text qs(0x1ac8dd83) d = <diff_score>
	createscreenelement {
		type = textelement
		<text_params>
		text = <score_text>
		pos = (<text_pos> + (20.0, 40.0) + ((0.0, 120.0) * <array_index>))
		rgba = [255 255 255 255]
	}
	<array_index> = (<array_index> + 1)
	repeat 4
	get_bpm_from_song loaded_fretbar = <loaded_fretbar>
	if NOT (<avg> = 0)
		formattext textname = bpm_text qs(0x3f8a6bc1) a = <low> b = <high> c = <avg>
		createscreenelement {
			type = textelement
			<text_params>
			text = qs(0x0d25b360)
			pos = (<text_pos> + (0.0, -90.0))
		}
		createscreenelement {
			type = textelement
			<text_params>
			text = <bpm_text>
			pos = (<text_pos> + (20.0, -60.0))
			rgba = [255 255 255 255]
		}
	endif
endscript

script calc_difficulty_from_all_song_sections \{song_array = none
		marker_array = none
		fretbar_array = none
		for_graph = 0
		output_section_scores = 0
		instrument_num = 0}
	score = 0
	if (<marker_array> = none || <song_array> = none || <fretbar_array> = none)
		return diff_score = <score>
	endif
	if NOT globalexists name = <song_array> type = array
		printf channel = da_errors qs(0xd8c337d0) s = ($current_song_qpak)
		return diff_score = <score>
	endif
	if NOT globalexists name = <fretbar_array> type = array
		printf channel = da_errors qs(0xac1801ac) s = ($current_song_qpak)
		return diff_score = <score>
	endif
	if NOT globalexists name = <marker_array> type = array
		printf channel = da_errors qs(0x4de4fd24) s = ($current_song_qpak)
		return diff_score = <score>
	endif
	array_index = 0
	section_index = 0
	fretbar_index = 0
	getarraysize $<song_array>
	if (<array_size> = 0)
		return diff_score = <score>
	endif
	getarraysize $<fretbar_array>
	if (<array_size> = 0)
		return diff_score = <score>
	endif
	getarraysize $<marker_array>
	if (<array_size> = 0)
		calc_difficulty_from_song_section {
			array = <song_array>
			fretbar_array = <fretbar_array>
		}
		return diff_score = <diff_score>
	endif
	text_pos = (230.0, 230.0)
	text_spacing = (0.0, 20.0)
	begin
	section_begin = ($<marker_array> [<array_index>].time)
	if (<array_index> + 1 < <array_size>)
		section_end = ($<marker_array> [(<array_index> + 1)].time)
	else
		section_end = 0
	endif
	calc_difficulty_from_song_section {
		array = <song_array>
		section_begin = <section_begin>
		section_end = <section_end>
		index_begin = <section_index>
		fretbar_array = <fretbar_array>
		fretbar_index = <fretbar_index>
	}
	<section_index> = <last_section_index>
	<fretbar_index> = <last_fretbar_index>
	<score> = (<score> + <diff_score>)
	if (<output_section_scores> = 1)
		get_song_struct song = <song_checksum>
		get_song_title song = <song_checksum>
		printf {
			channel = ($diffchannels [<instrument_num>])
			qs(0x65eacc04)
			a = ($difficulty_list_props.<difficulty>.text)
			b = <song_title>
			c = (<array_index> + 1)
			d = ($<marker_array> [<array_index>].marker)
			e = <diff_score>
		}
	endif
	if (<for_graph> = 1)
		formattext textname = diff_score_text qs(0xdeb87c34) n = (<array_index> + 1) d = <diff_score>
		if (<diff_score> < 200)
			rgba = [50 200 50 255]
		elseif (<diff_score> < 300)
			rgba = [250 240 60 255]
		else
			rgba = [200 50 50 255]
		endif
		extra_text_pos = (0.0, 0.0)
		if (<array_index> >= 40)
			<extra_text_pos> = ((240.0, 0.0) - (<text_spacing> * 40))
		elseif (<array_index> >= 20)
			<extra_text_pos> = ((120.0, 0.0) - (<text_spacing> * 20))
		endif
		createscreenelement {
			type = textelement
			parent = diff_analyzer_container
			pos = (<text_pos> + (<text_spacing> * <array_index>) + <extra_text_pos>)
			text = <diff_score_text>
			rgba = <rgba>
			scale = 0.5
		}
	endif
	<array_index> = (<array_index> + 1)
	repeat <array_size>
	return diff_score = <score>
endscript

script calc_difficulty_from_song_section \{array = none
		section_begin = 0
		section_end = 0
		index_begin = 0
		fretbar_array = none
		fretbar_index = 0}
	score = 0
	if (<array> = none || <fretbar_array> = none)
		return diff_score = <score>
	endif
	array_index = <index_begin>
	getarraysize $<fretbar_array>
	fretbar_array_size = <array_size>
	if (<array_size> = 0)
		return diff_score = <score>
	endif
	getarraysize $<array>
	if (<array_size> = 0)
		return diff_score = <score>
	endif
	mod a = <array_size> b = 2
	if NOT (<mod> = 0)
		return diff_score = <score>
	endif
	repeat_num = ((<array_size> - <index_begin>) / 2)
	in_begin = 0
	current_note = -1
	current_time = -1
	current_fretbar_time = -1
	last_note = -1
	last_time = -1
	begin
	if (<array_index> >= <array_size>)
		return diff_score = <score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
	endif
	<current_time> = ($<array> [<array_index>])
	<current_note> = ($<array> [(<array_index> + 1)])
	<current_note> = (<current_note> / 65536)
	<current_fretbar_time> = ($<fretbar_array> [<fretbar_index>])
	if (<in_begin> = 0)
		if (($<array> [<array_index>]) >= <section_begin>)
			<in_begin> = 1
			calc_score_for_note note_value = <current_note>
			<score> = (<score> + <note_score>)
			<last_note> = <current_note>
			<last_time> = <current_time>
		endif
	else
		if (($<array> [<array_index>]) >= <section_end>)
			if NOT (<section_end> = 0)
				return diff_score = <score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
			endif
		endif
		calc_score_for_note note_value = <current_note>
		note_time_distance = (<current_time> - <last_time>)
		if (<last_note> = <current_note>)
			if (<note_time_distance> < $rd_threshold)
				<note_score> = (<note_score> * $repeat_degradation)
			endif
		endif
		if (<current_fretbar_time> < <current_time>)
			begin
			<fretbar_index> = (<fretbar_index> + 1)
			<current_fretbar_time> = ($<fretbar_array> [<fretbar_index>])
			if (<current_fretbar_time> >= <current_time>)
				break
			endif
			if (<fretbar_array_size> - <fretbar_index> <= 0)
				break
			endif
			repeat
		endif
		fretbar_distance = (<current_fretbar_time> - ($<fretbar_array> [(<fretbar_index> - 1)]))
		if (<note_time_distance> < <fretbar_distance>)
			<note_score> = (<note_score> + (<note_score> - (<note_time_distance> / <fretbar_distance>)))
		endif
		if (<single_note> = 1)
			get_note_placement_value note1 = <current_note> note2 = <last_note>
			<note_score> = (<note_score> * <note_placement_value>)
		else
			make_orange_4 = 0
			only_different_notes = 0
			if is_any_note_the_same note1 = <current_note> note2 = <last_note>
				get_num_of_notes_in_chord note_value = <current_note>
				current_num_notes = <num_notes>
				get_num_of_notes_in_chord note_value = <last_note>
				if (<current_num_notes> >= <num_notes>)
					if (<current_note> && ($note_bits [4]))
						if NOT (<last_note> && ($note_bits [4]))
							<make_orange_4> = 1
							<only_different_notes> = 1
						endif
					else
						<only_different_notes> = 1
					endif
				endif
			endif
			get_note_placement_value {
				note1 = <current_note>
				note2 = <last_note>
				chord
				make_orange_4 = <make_orange_4>
				only_different_notes = <only_different_notes>
			}
			<note_score> = (<note_score> * <note_placement_value>)
		endif
		<score> = (<score> + <note_score>)
		<last_note> = <current_note>
		<last_time> = <current_time>
	endif
	<array_index> = (<array_index> + 2)
	repeat <repeat_num>
	return diff_score = <score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
endscript

script calc_score_for_note 
	da_check_for_errors note_value = <note_value>
	array_index = 0
	begin
	if (<note_value> = ($note_bits [<array_index>]))
		return note_score = ($note_scores [<array_index>]) single_note = 1
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	score = 0
	<array_index> = 0
	begin
	if (<note_value> && ($note_bits [<array_index>]))
		<score> = (<score> + ($note_scores [<array_index>]))
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return note_score = <score> single_note = 0
endscript

script get_note_placement_value \{note1 = 0
		note2 = 0
		make_orange_4 = 0
		only_different_notes = 0}
	note_placement = 0
	array_index = 0
	array_index2 = 0
	begin
	if (<note1> && ($note_bits [<array_index>]))
		if (<array_index> = 4)
			if (<make_orange_4> = 1)
				<note_placement> = (<note_placement> + 4)
			endif
		else
			begin
			if (<array_index2> >= 5)
				break
			endif
			if (<note2> && ($note_bits [<array_index2>]))
				temp_placement = -1
				if gotparam \{chord}
					if (<only_different_notes> = 1)
						if ((<note1> && ($note_bits [<array_index2>])) && (<note2> && ($note_bits [<array_index2>])))
							break
						endif
					endif
				endif
				<temp_placement> = (<array_index> - <array_index2>)
				if (<temp_placement> < 0)
					<temp_placement> = (0 - <temp_placement>)
				endif
				if NOT (<temp_placement> = -1)
					<note_placement> = (<note_placement> + ($note_distance_score [<temp_placement>]))
					<array_index2> = (<array_index2> + 1)
				endif
				if gotparam \{chord}
					break
				else
					return note_placement_value = <note_placement>
				endif
			endif
			<array_index2> = (<array_index2> + 1)
			repeat
		endif
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return note_placement_value = <note_placement>
endscript

script is_any_note_the_same \{note1 = 0
		note2 = 0}
	if (<note1> && <note2>)
		return \{true}
	endif
	return \{false}
endscript

script get_num_of_notes_in_chord \{note_value = 0}
	num_notes = 0
	array_index = 0
	begin
	if (<note_value> && ($note_bits [<array_index>]))
		<num_notes> = (<num_notes> + 1)
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return num_notes = <num_notes>
endscript

script output_diff_scores 
	difficulty_num = 4
	repeat_num = 1
	if gotparam \{all}
		<difficulty_num> = 1
		<repeat_num> = 4
	elseif (<difficulty> = easy)
		<difficulty_num> = 1
	elseif (<difficulty> = medium)
		<difficulty_num> = 2
	elseif (<difficulty> = hard)
		<difficulty_num> = 3
	endif
	getarraysize \{$instrument_checksums}
	if gotparam \{all}
		if (<instrument> = all)
			instrument_size = <array_size>
		else
			instrument_size = 1
		endif
	else
		instrument_size = 1
	endif
	instrument_num = 0
	instrument_to_use = <instrument>
	begin
	if gotparam \{all}
		if (<instrument> = all)
			<instrument_to_use> = ($instrument_checksums [<instrument_num>])
		endif
		<difficulty_num> = 1
	endif
	if (<instrument> = guitar)
		<instrument_num> = 0
	elseif (<instrument> = rhythm)
		<instrument_num> = 1
	elseif (<instrument> = vocals)
		<instrument_num> = 2
	elseif (<instrument> = drum)
		<instrument_num> = 3
	endif
	begin
	change current_da_diff = ($difficulty_list [<difficulty_num>])
	array_entry = 0
	getsonglistsize
	begin
	getsonglistchecksum index = <array_entry>
	if NOT (<song_checksum> = jamsession)
		destroy_band
		load_songqpak song_name = <song_checksum>
		loaded_song = $current_song_qpak
		loaded_marker = $current_song_qpak
		if (<instrument_to_use> = guitar)
			extendcrc <loaded_song> '_song_' out = loaded_song
			extendcrc <loaded_marker> '_guitar_markers' out = loaded_marker
		elseif (<instrument_to_use> = bass)
			extendcrc <loaded_song> '_song_rhythm_' out = loaded_song
			extendcrc <loaded_marker> '_rhythm_markers' out = loaded_marker
		elseif (<instrument_to_use> = drum)
			extendcrc <loaded_song> '_song_drum_' out = loaded_song
			extendcrc <loaded_marker> '_drum_markers' out = loaded_marker
		elseif (<instrument_to_use> = vocals)
			extendcrc <loaded_marker> '_vocals_markers' out = loaded_marker
		endif
		extendcrc <loaded_song> ($difficulty_list_props.($difficulty_list [<difficulty_num>]).text_nl) out = loaded_song
		loaded_fretbar = $current_song_qpak
		extendcrc <loaded_fretbar> '_fretbars' out = loaded_fretbar
		calc_difficulty_from_all_song_sections {
			song_array = <loaded_song>
			marker_array = <loaded_marker>
			fretbar_array = <loaded_fretbar>
			song_checksum = <song_checksum>
			difficulty = ($difficulty_list [<difficulty_num>])
			output_section_scores = 1
			instrument_num = <instrument_num>
		}
		get_song_struct song = <song_checksum>
		get_song_title song = <song_checksum>
		printf {
			channel = ($diffchannels [<instrument_num>])
			qs(0x8599ca0c)
			s = ($difficulty_list_props.($difficulty_list [<difficulty_num>]).text)
			a = <song_title>
			x = 0
			d = <diff_score>
		}
		get_bpm_from_song loaded_fretbar = <loaded_fretbar>
		if NOT (<avg> = 0)
			printf {
				channel = diffanalyzersectiontempo
				qs(0x6496e5db)
				d = ($difficulty_list_props.($difficulty_list [<difficulty_num>]).text)
				s = <song_title>
				a = <low>
				b = <high>
				c = <avg>
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	if gotparam \{all}
		<difficulty_num> = (<difficulty_num> + 1)
	endif
	repeat <repeat_num>
	<instrument_num> = (<instrument_num> + 1)
	repeat <instrument_size>
endscript

script get_bpm_from_song \{loaded_fretbar = none}
	if NOT globalexists name = <loaded_fretbar> type = array
		printf channel = da_errors qs(0xd43f9817) s = ($current_song_qpak)
		return \{low = 0
			high = 0
			avg = 0}
	endif
	beattime_low = 9999999
	beattime_high = 0
	beattime_avg = 0
	getarraysize $<loaded_fretbar>
	array_index = 1
	begin
	beattime = (($<loaded_fretbar> [<array_index>]) - ($<loaded_fretbar> [(<array_index> - 1)]))
	<beattime> = ((1.0 / <beattime>) * 60000.0)
	casttointeger \{beattime}
	<beattime_avg> = (<beattime_avg> + <beattime>)
	if (<beattime> < <beattime_low>)
		<beattime_low> = <beattime>
	endif
	if (<beattime> > <beattime_high>)
		<beattime_high> = <beattime>
	endif
	<array_index> = (<array_index> + 1)
	repeat (<array_size> - 1)
	<beattime_avg> = (<beattime_avg> / <array_size>)
	return low = <beattime_low> high = <beattime_high> avg = <beattime_avg>
endscript

script da_check_for_errors \{note_value = 0}
	is_chord = 1
	array_index = 0
	begin
	if (<note_value> = ($note_bits [<array_index>]))
		<is_chord> = 0
		break
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	if (<is_chord>)
		get_num_of_notes_in_chord note_value = <note_value>
		if (<num_notes> >= 4)
			printf channel = da_errors qs(0x72dc9073) c = <num_notes> a = $current_song_qpak b = $current_da_diff
		endif
		if (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [3]) && <note_value> && ($note_bits [4]))
			printf \{channel = da_errors
				qs(0x097246c9)
				a = $current_song_qpak
				b = $current_da_diff}
		elseif (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [1]) && <note_value> && ($note_bits [4]))
			printf \{channel = da_errors
				qs(0x82e91e72)
				a = $current_song_qpak
				b = $current_da_diff}
		elseif (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [2]) && <note_value> && ($note_bits [4]))
			printf \{channel = da_errors
				qs(0xb524033b)
				a = $current_song_qpak
				b = $current_da_diff}
		elseif (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [4]))
			printf \{channel = da_errors
				qs(0x587e65e2)
				a = $current_song_qpak
				b = $current_da_diff}
		endif
		if ($current_da_diff = easy || $current_da_diff = medium)
			if (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [3]))
				printf \{channel = da_errors
					qs(0xa671041d)
					a = $current_song_qpak
					b = $current_da_diff}
			endif
			if (<num_notes> >= 3)
				printf channel = da_errors qs(0x72dc9073) c = <num_notes> a = $current_song_qpak b = $current_da_diff
			endif
			if ($current_da_diff = easy)
				if (<note_value> && ($note_bits [0]) && <note_value> && ($note_bits [2]))
					printf \{channel = da_errors
						qs(0xf7b4f31a)
						a = $current_song_qpak
						b = $current_da_diff}
				endif
			endif
		endif
	else
		if ($current_da_diff = easy || $current_da_diff = medium)
			if (<note_value> && ($note_bits [4]))
				printf \{channel = da_errors
					qs(0x2e51dea7)
					a = $current_song_qpak
					b = $current_da_diff}
			endif
		endif
		if ($current_da_diff = easy)
			if (<note_value> && ($note_bits [3]))
				printf \{channel = da_errors
					qs(0x5c31f73e)
					a = $current_song_qpak
					b = $current_da_diff}
			endif
		endif
	endif
endscript
