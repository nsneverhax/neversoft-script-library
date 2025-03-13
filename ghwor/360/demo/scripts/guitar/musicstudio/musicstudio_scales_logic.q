jam_track_rootnotes = [
	0
	0
	0
	0
	0
	0
]
jam_track_scaleindex = [
	0
	0
	0
	0
	0
	0
]
jam_track_scales_new = [
	jam_active_rhythm_scale
	jam_active_lead_scale
	jam_active_bass_scale
	jam_unused_drum_scale
	jam_active_melody_scale
	jam_active_melody_scale
]
jam_track_custom_scales_new = [
	jam_custom_rhythm_scale
	jam_custom_lead_scale
	jam_custom_bass_scale
	jam_unused_drum_scale
	jam_custom_melody_scale
	jam_custom_melody_scale
]
jam_active_rhythm_scale = [
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
]
jam_active_lead_scale = [
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
]
jam_active_bass_scale = [
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
]
jam_active_melody_scale = [
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
	[
		0
		0
	]
]
jam_custom_rhythm_scale = [
	0
	0
	0
	0
	0
	0
	0
]
jam_custom_lead_scale = [
	0
	0
	0
	0
	0
	0
	0
]
jam_custom_bass_scale = [
	0
	0
	0
	0
	0
	0
	0
]
jam_custom_melody_scale = [
	0
	0
	0
	0
	0
	0
	0
]
jam_rhythm_chord_type = 0

script guitar_jam_scales_change_scale 
	jam_stop_sound jam_instrument = <jam_instrument>
	killspawnedscript \{name = musicstudio_audible_scale_preview_spawn}
	switch (<jam_instrument>)
		case 0
		guitar_jam_scales_change_scale_rhythm jam_instrument = <jam_instrument>
		change jam_active_rhythm_scale = <final_scale>
		case 1
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		change jam_active_lead_scale = <final_scale>
		case 2
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		change jam_active_bass_scale = <final_scale>
		case 4
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		change jam_active_melody_scale = <final_scale>
	endswitch
endscript

script guitar_jam_scales_change_scale_rhythm 
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
	else
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
	endif
	if structurecontains structure = <chosen_scale> custom
		<custom_scales_array> = ($jam_track_custom_scales_new)
		<custom_scale_name> = (<custom_scales_array> [<jam_instrument>])
		<scale_pattern> = ($<custom_scale_name>)
		<chosen_roots_array> = ($jam_track_rootnotes)
		<custom_root> = (<chosen_roots_array> [<jam_instrument>])
		<root_note> = 0
	else
		<scale_pattern_name> = (<chosen_scale>.pattern_rhythm)
		<scale_pattern> = ($<scale_pattern_name>)
	endif
	getarraysize \{scale_pattern}
	<pattern_size> = <array_size>
	<count> = 0
	begin
	<new_scale_entry> = [0 , 0]
	<string> = 0
	<fret> = (<scale_pattern> [<count>])
	<fret> = (<fret> + <root_note>)
	if gotparam \{custom_root}
		if (<fret> < <custom_root>)
			<fret> = (<fret> + 12)
		endif
	endif
	if (<fret> > ($jam_rhythm_string1_limit))
		<string> = (<string> + 1)
		<fret> = ((<fret> - ($jam_rhythm_string1_limit)) - (($jam_rhythm_string1_rollover) - ($jam_rhythm_string1_limit)))
		if (<fret> > ($jam_rhythm_string2_limit))
			<string> = 0
			<fret> = ((<fret> - ($jam_rhythm_string2_limit)) - (($jam_rhythm_string2_rollover) - ($jam_rhythm_string2_limit)))
			if (<fret> > ($jam_rhythm_string1_limit))
				<string> = (<string> + 1)
				<fret> = ((<fret> - ($jam_rhythm_string1_limit)) - (($jam_rhythm_string1_rollover) - ($jam_rhythm_string1_limit)))
			endif
		endif
	endif
	setarrayelement arrayname = new_scale_entry index = 0 newvalue = <string>
	setarrayelement arrayname = new_scale_entry index = 1 newvalue = <fret>
	setarrayelement arrayname = final_scale index = <count> newvalue = <new_scale_entry>
	<count> = (<count> + 1)
	repeat <pattern_size>
	return final_scale = <final_scale>
endscript

script guitar_jam_scales_change_scale_leadbass 
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] ,
			[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
		<is_chromatic> = 1
	else
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
		<is_chromatic> = 0
	endif
	curr_octave_range = ($jam_lead_octave_range)
	switch <jam_instrument>
		case 1
		curr_octave_range = ($jam_lead_octave_range)
		case 4
		curr_octave_range = ($jam_melody_octave_range)
	endswitch
	if structurecontains structure = <chosen_scale> custom
		<custom_scales_array> = ($jam_track_custom_scales_new)
		<custom_scale_name> = (<custom_scales_array> [<jam_instrument>])
		<custom_scale> = ($<custom_scale_name>)
		if (<jam_instrument> = 1 || <jam_instrument> = 4)
			<range> = <curr_octave_range>
			if (<range> = 2)
				<root_note> = (<root_note> + 12)
			endif
		endif
		<count> = 0
		begin
		<custom_note> = (<custom_scale> [<count>])
		<string> = 0
		if (<custom_note> < <root_note>)
			<wrap_me> = (12 - (<root_note> - <custom_note>))
			begin
			if (<wrap_me> > 4)
				<string> = (<string> + 1)
				<wrap_me> = (<wrap_me> - 5)
			else
				<fret> = (<wrap_me> + <root_note>)
				break
			endif
			repeat
		else
			<fret> = <custom_note>
		endif
		if ((<jam_instrument> = 2) && (<string> >= 4))
			<string> = (<string> - 1)
			<fret> = (<fret> + 4)
			if (<string> >= 4)
				<string> = (<string> - 1)
				<fret> = (<fret> + 5)
			endif
		endif
		<new_scale_entry> = [0 , 0]
		setarrayelement arrayname = new_scale_entry index = 0 newvalue = <string>
		setarrayelement arrayname = new_scale_entry index = 1 newvalue = <fret>
		setarrayelement arrayname = final_scale index = <count> newvalue = <new_scale_entry>
		<custom_note> = (<custom_scale> [<count>])
		<string> = 0
		if (<custom_note> >= <root_note>)
			<wrap_me> = (12 - (<root_note> - <custom_note>))
		else
			<wrap_me> = (24 - (<root_note> - <custom_note>))
		endif
		begin
		if (<string> = 3)
			<fret_limit> = 4
		else
			<fret_limit> = 4
		endif
		if ((<wrap_me> + <root_note>) > (<fret_limit> + <root_note>))
			<string> = (<string> + 1)
			if (<string> = 4)
				<wrap_me> = (<wrap_me> - 4)
			else
				<wrap_me> = (<wrap_me> - 5)
			endif
		else
			<fret> = (<wrap_me> + <root_note>)
			break
		endif
		repeat
		if ((<jam_instrument> = 2) && (<string> >= 4))
			<string> = (<string> - 1)
			<fret> = (<fret> + 4)
			if (<string> >= 4)
				<string> = (<string> - 1)
				<fret> = (<fret> + 5)
			endif
		endif
		<new_scale_entry_upper> = [0 , 0]
		setarrayelement arrayname = new_scale_entry_upper index = 0 newvalue = <string>
		setarrayelement arrayname = new_scale_entry_upper index = 1 newvalue = <fret>
		setarrayelement arrayname = final_scale index = (<count> + 7) newvalue = <new_scale_entry_upper>
		<count> = (<count> + 1)
		repeat 7
	else
		if (<jam_instrument> = 1 || <jam_instrument> = 4)
			if (<is_chromatic> = 1)
				<scale_pattern_name> = (<chosen_scale>.pattern)
				<root_modifier> = 0
				<range> = <curr_octave_range>
				if (<range> = 2)
					<root_modifier> = 12
				endif
			else
				<range> = <curr_octave_range>
				if (<range> = 1)
					if (<root_note> <= 6)
						<scale_pattern_name> = (<chosen_scale>.pattern)
						<root_modifier> = 0
					else
						<scale_pattern_name> = (<chosen_scale>.pattern2)
						<root_modifier> = -12
					endif
				elseif (<range> = 2)
					<scale_pattern_name> = (<chosen_scale>.pattern2)
					<root_modifier> = 0
				endif
			endif
			<root_note> = (<root_note> + <root_modifier>)
		else
			<scale_pattern_name> = (<chosen_scale>.pattern)
		endif
		<scale_pattern> = ($<scale_pattern_name>)
		getarraysize \{scale_pattern}
		<pattern_size> = <array_size>
		<count> = 0
		begin
		<new_scale_entry> = [0 , 0]
		<note_string> = (<scale_pattern> [<count>] [0])
		<note_fret> = ((<scale_pattern> [<count>] [1]) + <root_note>)
		if ((<jam_instrument> = 2) && (<note_string> >= 4))
			<note_string> = (<note_string> - 1)
			<note_fret> = (<note_fret> + 4)
			if (<note_string> >= 4)
				<note_string> = (<note_string> - 1)
				<note_fret> = (<note_fret> + 5)
			endif
		endif
		setarrayelement arrayname = new_scale_entry index = 0 newvalue = <note_string>
		setarrayelement arrayname = new_scale_entry index = 1 newvalue = <note_fret>
		setarrayelement arrayname = final_scale index = <count> newvalue = <new_scale_entry>
		<count> = (<count> + 1)
		repeat <pattern_size>
	endif
	return final_scale = <final_scale>
endscript

script guitar_jam_scales_get_diatonic 
	requireparams \{[
			instrument
		]
		all}
	curr_scale = ($jam_track_scaleindex [<instrument>])
	diatonic = 0
	curr_scale_structure = ($jam_scales_new [<curr_scale>])
	if structurecontains structure = <curr_scale_structure> diatonic
		<diatonic> = 1
	endif
	return diatonic = <diatonic>
endscript

script jam_get_sample \{chord_type = 0
		force_bar_chords = 0}
	if NOT gotparam \{jam_instrument}
		getplayerinfo <player> jam_instrument
	endif
	if NOT gotparam \{sample_type}
		sample_type = <chord_type>
	endif
	<current_scale> = (($jam_track_scales_new) [<jam_instrument>])
	<chromatic> = 0
	getarraysize ($<current_scale>)
	if (<array_size> = 24)
		<chromatic> = 1
	endif
	if (<jam_instrument> = 0)
		getarraysize ($<current_scale>)
		if (<array_size> = 14)
			if ($jam_tilt_rhythm = 1)
				<button> = (<button> + 7)
			endif
		endif
		jam_get_rhythm_sample_from_scale {
			jam_instrument = <jam_instrument>
			button = <button>
			tilt = <tilt>
			chord_dir = <chord_dir>
			chord_type = <chord_type>
			current_scale = <current_scale>
			get_text = <get_text>
			force_bar_chords = <force_bar_chords>
		}
	elseif (<jam_instrument> = 4 || <jam_instrument> = 5)
		jam_get_single_sample_for_melody {
			jam_instrument = <jam_instrument>
			button = <button>
			tilt = <tilt>
			current_scale = <current_scale>
			get_text = <get_text>
			sample_type = <sample_type>
			chromatic = <chromatic>
		}
	elseif (<jam_instrument> = 2 && $musicstudio_loadedbass_iskeyboard = 1)
		jam_get_single_sample_for_melody {
			jam_instrument = <jam_instrument>
			button = <button>
			tilt = <tilt>
			current_scale = <current_scale>
			get_text = <get_text>
			sample_type = <sample_type>
			chromatic = <chromatic>
		}
	else
		jam_get_leadbass_sample_from_scale {
			jam_instrument = <jam_instrument>
			button = <button>
			tilt = <tilt>
			hopo = <hopo>
			current_scale = <current_scale>
			get_text = <get_text>
			sample_type = <sample_type>
			chromatic = <chromatic>
		}
	endif
	if gotparam \{get_text}
		return single_note_text = <final_text> note_string = <final_note_string> full_note_num = <full_note_num>
	endif
	if gotparam \{final_sample}
		return final_note_sample = <final_sample> pitch_shift = <pitch_shift> note_string = <note_string> note_fret = <note_fret> note_type = <note_type> chord_type = <chord_type>
	endif
endscript

script jam_get_leadbass_sample_from_scale \{get_text = 0
		sample_type = 0}
	<jam_active_scales> = ($jam_track_scales_new)
	<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
	<current_scale> = ($<current_scale_name>)
	if (<chromatic> = 1)
		if (<button> = 6)
			<button> = 5
		endif
		<button> = (<button> + (<tilt> * 6))
	else
		if (<tilt> >= 1)
			<button> = (<button> + 7)
		endif
	endif
	getarraysize <current_scale>
	if NOT (<button> < <array_size>)
		printstruct <...>
		scriptassert 'GUITAR_JAM_SCALES: button index larger than scale array (BUTTON: %a SCALE_SIZE %b)' a = <button> b = <array_size>
	endif
	<note_struct> = (<current_scale> [<button>])
	if gotparam \{hopo}
		<sample_type> = <hopo>
	endif
	if ((<jam_instrument> = 2) && (($bass_kit_mode) > 0))
		jam_get_single_sample_for_melody string = (<note_struct> [0]) fret = (<note_struct> [1]) tilt = <tilt> jam_instrument = <jam_instrument> get_text = <get_text>
		note_text = <final_text>
	else
		jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = <sample_type> jam_instrument = <jam_instrument>
	endif
	if (<get_text> = 1)
		return final_text = <note_text>
	endif
	return final_sample = <sample_checksum> pitch_shift = <pitch_shift> note_string = (<note_struct> [0]) note_fret = (<note_struct> [1]) note_type = <sample_type>
endscript

script jam_get_rhythm_sample_from_scale \{get_text = 0
		force_bar_chords = 0}
	<jam_active_scales> = ($jam_track_scales_new)
	<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
	<current_scale> = ($<current_scale_name>)
	getarraysize <current_scale>
	if (<button> > <array_size>)
		softassert 'ERROR: Requested button is out of this scale! %a > %b' a = <button> b = <array_size>
		return
	endif
	<note_struct> = (<current_scale> [<button>])
	use_clean_chords = 0
	if NOT ($jam_rhythm_chord_type = 0)
		if NOT (<chord_type> = 3)
			if (<chord_type> = 1 || <chord_type> = 2)
				<use_clean_chords> = 0
				<chord_type> = 0
			else
				<use_clean_chords> = 1
			endif
		endif
	else
		if (<chord_type> = 1 || <chord_type> = 2)
			<use_clean_chords> = 1
		else
			<use_clean_chords> = 0
		endif
	endif
	if (<force_bar_chords> = 1)
		<use_clean_chords> = 1
	endif
	if (<use_clean_chords> = 1)
		scale_index = ($jam_track_scaleindex [<jam_instrument>])
		chord_pattern = ($jam_scales_new [<scale_index>].chord_pattern)
		chord_type = ($<chord_pattern> [<button>])
	endif
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = <chord_dir> chord_type = <chord_type> jam_instrument = <jam_instrument>
	if (<get_text> = 1)
		return final_text = <note_text> final_note_string = <note_text>
	endif
	return final_sample = <sample_checksum> pitch_shift = <pitch_shift> note_string = (<note_struct> [0]) note_fret = (<note_struct> [1]) note_type = <chord_dir> chord_type = <chord_type>
endscript

script jam_get_single_sample_for_melody \{get_text = 0
		jam_instrument = 4}
	if NOT gotparam \{string}
		<jam_active_scales> = ($jam_track_scales_new)
		<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
		<current_scale> = ($<current_scale_name>)
		if (<chromatic> = 1)
			if (<button> = 6)
				<button> = 5
			endif
			<button> = (<button> + (<tilt> * 6))
		else
			if (<tilt> >= 1)
				<button> = (<button> + 7)
			endif
		endif
		note_struct = (<current_scale> [<button>])
		string = (<note_struct> [0])
		fret = (<note_struct> [1])
	endif
	getsonginfo
	num_samples = 2
	switch <jam_instrument>
		case 2
		<num_samples> = ($musicstudio_instrument_list_bass [<bass_sound>].num_samples)
		case 4
		<num_samples> = ($musicstudio_instrument_list_keyboard [<keyboard_sound>].num_samples)
	endswitch
	octave_switch_point = 0
	switch <num_samples>
		case 2
		keyboard_pitch_shift = [-2 -1 0 1 2 3 -2 -1 0 1 2 3]
		keyboard_notes = ['Gb' 'Gb' 'Gb' 'Gb' 'Gb' 'Gb' 'C' 'C' 'C' 'C' 'C' 'C']
		octave_switch_point = 6
		case 4
		keyboard_pitch_shift = [1 -1 0 1 -1 0 1 -1 0 1 -1 0]
		keyboard_notes = ['Eb' 'Gb' 'Gb' 'Gb' 'A' 'A' 'A' 'C' 'C' 'C' 'Eb' 'Eb']
		octave_switch_point = 7
	endswitch
	musicstudio_scale_get_note_num string = <string> fret = <fret> show_flats = 0
	saved_full_note_num = <full_note_num>
	octave = 0
	begin
	if (<full_note_num> >= 12)
		<full_note_num> = (<full_note_num> - 12)
		<octave> = (<octave> + 1)
	else
		break
	endif
	repeat
	octave = (<octave> + 2)
	if (<full_note_num> >= <octave_switch_point>)
		<octave> = (<octave> + 1)
	endif
	if (<full_note_num> >= 0)
		note_value = (<keyboard_notes> [<full_note_num>])
		pitch_shift = (<keyboard_pitch_shift> [<full_note_num>])
	else
		note_value = (<keyboard_notes> [0])
		pitch_shift = (<keyboard_pitch_shift> [0] + <full_note_num>)
	endif
	curr_loaded_keyboard = ($musicstudio_loadedkeyboard)
	if ($musicstudio_loadedbass_iskeyboard = 1 && <jam_instrument> = 2)
		<curr_loaded_keyboard> = ($musicstudio_loadedbass)
	endif
	formattext checksumname = sample_checksum '%a_%b%c_01' a = <curr_loaded_keyboard> b = <note_value> c = <octave>
	return {
		final_sample = <sample_checksum>
		pitch_shift = <pitch_shift>
		note_string = <string>
		note_fret = <fret>
		note_type = <sample_type>
		sample_checksum = <sample_checksum>
		note_id = <saved_full_note_num>
		octave = <octave>
		full_note_num = <full_note_num>
	}
endscript

script jam_init_scales 
	change \{jam_track_rootnotes = [
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_track_scaleindex = [
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_custom_rhythm_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_custom_lead_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_custom_bass_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_custom_melody_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	jam_init_scales_all_instruments
endscript

script jam_init_scales_all_instruments 
	guitar_jam_scales_change_scale \{jam_instrument = 0}
	guitar_jam_scales_change_scale \{jam_instrument = 1}
	guitar_jam_scales_change_scale \{jam_instrument = 2}
	guitar_jam_scales_change_scale \{jam_instrument = 4}
endscript

script jam_save_scale 
	<track_count> = 0
	<roots> = ($jam_track_rootnotes)
	<scales> = ($jam_track_scaleindex)
	<custom_scales> = ($jam_track_custom_scales_new)
	getarraysize ($jam_tracks)
	begin
	if NOT (<track_count> = 3)
		<root> = (<roots> [<track_count>])
		<scale> = (<scales> [<track_count>])
		<custom_name> = (<custom_scales> [<track_count>])
		<custom> = ($<custom_name>)
		settrackscale track = ($jam_tracks [<track_count>].id) custom_scale = <custom> last_root = <root> last_scale = <scale>
	endif
	<track_count> = (<track_count> + 1)
	repeat (<array_size> - 1)
endscript

script jam_load_scale \{loaded_roots = [
			0
			0
			0
			0
			0
		]
		loaded_scales = [
			0
			0
			0
			0
			0
		]}
	jam_active_rhythm_scale = [
		[0 , 0] ,
		[0 , 0] ,
		[0 , 0] ,
		[0 , 0] ,
		[0 , 0] ,
		[0 , 0] ,
		[0 , 0] ,
	]
	jam_active_lead_scale = [
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0]
	]
	jam_active_bass_scale = [
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0]
	]
	jam_active_melody_scale = [
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0] ,
		[0 , 0] , [0 , 0]
	]
	jam_custom_rhythm_scale = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	jam_custom_lead_scale = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	jam_custom_bass_scale = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	jam_custom_melody_scale = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	loaded_custom_scales = [
		[0 , 0 , 0 , 0 , 0 , 0 , 0] ,
		[0 , 0 , 0 , 0 , 0 , 0 , 0] ,
		[0 , 0 , 0 , 0 , 0 , 0 , 0] ,
		[0 , 0 , 0 , 0 , 0 , 0 , 0] ,
	]
	getarraysize ($jam_tracks)
	track_count = 0
	begin
	if NOT (<track_count> = 3)
		gettrackscale track = ($jam_tracks [<track_count>].id)
		if (<last_root> >= 0 && <last_scale> >= 0)
			setarrayelement arrayname = loaded_roots index = <track_count> newvalue = <last_root>
			setarrayelement arrayname = loaded_scales index = <track_count> newvalue = <last_scale>
			switch (<track_count>)
				case 0
				change jam_custom_rhythm_scale = <custom_scale>
				case 1
				change jam_custom_lead_scale = <custom_scale>
				case 2
				change jam_custom_bass_scale = <custom_scale>
				case 4
				change jam_custom_melody_scale = <custom_scale>
			endswitch
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat (<array_size> - 1)
	change jam_track_rootnotes = <loaded_roots>
	change jam_track_scaleindex = <loaded_scales>
	jam_init_scales_all_instruments
endscript
jam_input_current_chord_preview = null
jam_input_current_lead_preview = null
jam_input_current_bass_preview = null
jam_input_current_melody_preview = null

script jam_scales_audible_scale_preview 
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = vmenu 'jam_vmenu_scales_%s' s = <select_player>
	formattext checksumname = curr_preview_sound 'curr_preview_sound_%s' s = <select_player>
	<vmenu> :gettags
	stopsoundevent <last_previewed_note>
	wait \{0.1
		seconds}
	<delay_between_notes> = 0.25
	<loop_count> = 0
	<last_sound> = <last_previewed_note>
	begin
	wait <delay_between_notes> seconds
	if (<jam_instrument> = 0)
		jam_get_sample player = <select_player> button = <loop_count> tilt = 0 chord_dir = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		wait \{1
			gameframe}
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		change jam_input_current_chord_preview = <final_note_sample>
	elseif (<jam_instrument> = 1)
		jam_get_sample player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		wait \{1
			gameframe}
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		change jam_input_current_lead_preview = <final_note_sample>
	elseif (<jam_instrument> = 2)
		jam_get_sample player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		wait \{1
			gameframe}
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
		change jam_input_current_bass_preview = <final_note_sample>
	elseif (<jam_instrument> = 4)
		jam_get_sample player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		wait \{1
			gameframe}
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
		change jam_input_current_melody_preview = <final_note_sample>
	endif
	<vmenu> :settags last_previewed_note = <final_note_sample>
	<loop_count> = (<loop_count> + 1)
	repeat <num_buttons>
	wait \{1
		seconds}
	stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
endscript

script jam_stop_preview_sound \{jam_instrument = 0}
	switch (<jam_instrument>)
		case 0
		stopsound \{$jam_input_current_chord_preview}
		case 1
		stopsound \{$jam_input_current_lead_preview}
		case 2
		stopsound \{$jam_input_current_bass_preview}
		case 4
		stopsound \{$jam_input_current_melody_preview}
	endswitch
endscript

script jam_scales_audible_note_preview 
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	formattext checksumname = vmenu 'jam_vmenu_scales_%s' s = <select_player>
	<vmenu> :gettags
	if (<jam_instrument> = 0)
		<string> = 0
		<fret> = <target_note>
		if (<target_note> < <root_note>)
			<fret> = (<fret> + 12)
		endif
		if (<fret> > ($jam_rhythm_string1_limit))
			<string> = (<string> + 1)
			<fret> = ((<fret> - ($jam_rhythm_string1_limit)) - (($jam_rhythm_string1_rollover) - ($jam_rhythm_string1_limit)))
			if (<fret> > ($jam_rhythm_string2_limit))
				<string> = 0
				<fret> = ((<fret> - ($jam_rhythm_string2_limit)) - (($jam_rhythm_string2_rollover) - ($jam_rhythm_string2_limit)))
				if (<fret> > ($jam_rhythm_string1_limit))
					<string> = (<string> + 1)
					<fret> = ((<fret> - ($jam_rhythm_string1_limit)) - (($jam_rhythm_string1_rollover) - ($jam_rhythm_string1_limit)))
				endif
			endif
		endif
		chord_type = 0
		use_clean_chords = 0
		if NOT ($jam_rhythm_chord_type = 0)
			<use_clean_chords> = 1
		else
			<use_clean_chords> = 0
		endif
		if (<use_clean_chords> = 1)
			scale_index = ($jam_track_scaleindex [<jam_instrument>])
			chord_pattern = ($jam_scales_new [<scale_index>].chord_pattern)
			chord_type = ($<chord_pattern> [<note_index>])
		endif
		jam_get_sample_checksum string = <string> fret = <fret> type = 0 jam_instrument = 0 chord_type = <chord_type>
		stopsound <last_previewed_note> fade_type = linear fade_time = $jam_fade_time
		<last_previewed_note> = <sample_checksum>
		wait \{1
			gameframe}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		change jam_input_current_chord_preview = <sample_checksum>
	else
		<custom_note> = <target_note>
		<string> = 0
		if (<custom_note> < <root_note>)
			<wrap_me> = (12 - (<root_note> - <custom_note>))
			begin
			if (<wrap_me> > 4)
				<string> = (<string> + 1)
				<wrap_me> = (<wrap_me> - 5)
			else
				<fret> = (<wrap_me> + <root_note>)
				break
			endif
			repeat
		else
			<fret> = <custom_note>
		endif
		if (<jam_instrument> = 4)
			jam_get_single_sample_for_melody_playback fret = <fret> string = <string> type = 0 jam_instrument = <jam_instrument>
		else
			jam_get_sample_checksum string = <string> fret = <fret> type = 0 jam_instrument = <jam_instrument>
		endif
		stopsound <last_previewed_note> fade_type = linear fade_time = $jam_fade_time
		<last_previewed_note> = <sample_checksum>
		wait \{1
			gameframe}
		switch (<jam_instrument>)
			case 1
			playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
			change jam_input_current_lead_preview = <sample_checksum>
			case 2
			playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
			change jam_input_current_bass_preview = <sample_checksum>
			case 4
			playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
			change jam_input_current_melody_preview = <sample_checksum>
		endswitch
	endif
	<vmenu> :settags last_previewed_note = <sample_checksum>
endscript

script jam_scales_toggle_lead_range 
	formattext checksumname = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
	switch ($jam_lead_octave_range)
		case 1
		change \{jam_lead_octave_range = 2}
		<scales_range_txt> :se_setprops text = qs(0x0d691f47)
		case 2
		change \{jam_lead_octave_range = 1}
		<scales_range_txt> :se_setprops text = qs(0x5a679075)
	endswitch
	getplayerinfo <select_player> jam_instrument
	guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script jam_scales_toggle_melody_range 
	formattext checksumname = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
	switch ($jam_melody_octave_range)
		case 1
		change \{jam_melody_octave_range = 2}
		<scales_range_txt> :se_setprops text = qs(0x0d691f47)
		case 2
		change \{jam_melody_octave_range = 1}
		<scales_range_txt> :se_setprops text = qs(0x5a679075)
	endswitch
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script jam_scales_toggle_chord_type 
	formattext checksumname = chord_text 'jam_chord_type_txt_%s' s = <select_player>
	switch ($jam_rhythm_chord_type)
		case 0
		change \{jam_rhythm_chord_type = 1}
		<chord_text> :se_setprops text = qs(0x27c54a39)
		case 1
		printf \{qs(0x7125d780)}
		change \{jam_rhythm_chord_type = 0}
		<chord_text> :se_setprops text = qs(0x596dd695)
	endswitch
	ui_sfx \{menustate = ghtunes
		uitype = select}
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript
