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

script guitar_jam_scales_change_scale 
	jam_stop_sound jam_instrument = <jam_instrument>
	KillSpawnedScript \{Name = musicstudio_audible_scale_preview_spawn}
	switch (<jam_instrument>)
		case 0
		guitar_jam_scales_change_scale_rhythm jam_instrument = <jam_instrument>
		Change jam_active_rhythm_scale = <final_scale>
		case 1
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		Change jam_active_lead_scale = <final_scale>
		case 2
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		Change jam_active_bass_scale = <final_scale>
		case 4
		guitar_jam_scales_change_scale_leadbass jam_instrument = <jam_instrument>
		Change jam_active_melody_scale = <final_scale>
	endswitch
endscript

script guitar_jam_scales_change_scale_rhythm 
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> chromatic
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
	else
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
	endif
	if StructureContains structure = <chosen_scale> custom
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
	GetArraySize \{scale_pattern}
	<pattern_size> = <array_Size>
	<count> = 0
	begin
	<new_scale_entry> = [0 , 0]
	<string> = 0
	<fret> = (<scale_pattern> [<count>])
	<fret> = (<fret> + <root_note>)
	if GotParam \{custom_root}
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
	SetArrayElement ArrayName = new_scale_entry index = 0 NewValue = <string>
	SetArrayElement ArrayName = new_scale_entry index = 1 NewValue = <fret>
	SetArrayElement ArrayName = final_scale index = <count> NewValue = <new_scale_entry>
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
	if StructureContains structure = <chosen_scale> chromatic
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
	if StructureContains structure = <chosen_scale> custom
		<custom_scales_array> = ($jam_track_custom_scales_new)
		<custom_scale_name> = (<custom_scales_array> [<jam_instrument>])
		<custom_scale> = ($<custom_scale_name>)
		if (<jam_instrument> = 1 || <jam_instrument> = 4)
			<Range> = <curr_octave_range>
			if (<Range> = 2)
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
		SetArrayElement ArrayName = new_scale_entry index = 0 NewValue = <string>
		SetArrayElement ArrayName = new_scale_entry index = 1 NewValue = <fret>
		SetArrayElement ArrayName = final_scale index = <count> NewValue = <new_scale_entry>
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
		SetArrayElement ArrayName = new_scale_entry_upper index = 0 NewValue = <string>
		SetArrayElement ArrayName = new_scale_entry_upper index = 1 NewValue = <fret>
		SetArrayElement ArrayName = final_scale index = (<count> + 7) NewValue = <new_scale_entry_upper>
		<count> = (<count> + 1)
		repeat 7
	else
		if (<jam_instrument> = 1 || <jam_instrument> = 4)
			if (<is_chromatic> = 1)
				<scale_pattern_name> = (<chosen_scale>.pattern)
				<root_modifier> = 0
				<Range> = <curr_octave_range>
				if (<Range> = 2)
					<root_modifier> = 12
				endif
			else
				<Range> = <curr_octave_range>
				if (<Range> = 1)
					if (<root_note> <= 6)
						<scale_pattern_name> = (<chosen_scale>.pattern)
						<root_modifier> = 0
					else
						<scale_pattern_name> = (<chosen_scale>.pattern2)
						<root_modifier> = -12
					endif
				elseif (<Range> = 2)
					<scale_pattern_name> = (<chosen_scale>.pattern2)
					<root_modifier> = 0
				endif
			endif
			<root_note> = (<root_note> + <root_modifier>)
		else
			<scale_pattern_name> = (<chosen_scale>.pattern)
		endif
		<scale_pattern> = ($<scale_pattern_name>)
		GetArraySize \{scale_pattern}
		<pattern_size> = <array_Size>
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
		SetArrayElement ArrayName = new_scale_entry index = 0 NewValue = <note_string>
		SetArrayElement ArrayName = new_scale_entry index = 1 NewValue = <note_fret>
		SetArrayElement ArrayName = final_scale index = <count> NewValue = <new_scale_entry>
		<count> = (<count> + 1)
		repeat <pattern_size>
	endif
	return final_scale = <final_scale>
endscript

script guitar_jam_scales_get_diatonic 
	RequireParams \{[
			instrument
		]
		all}
	curr_scale = ($jam_track_scaleindex [<instrument>])
	diatonic = 0
	curr_scale_structure = ($jam_scales_new [<curr_scale>])
	if StructureContains structure = <curr_scale_structure> diatonic
		<diatonic> = 1
	endif
	return diatonic = <diatonic>
endscript

script jam_get_sample \{chord_type = 0
		force_bar_chords = 0}
	if NOT GotParam \{jam_instrument}
		getplayerinfo <Player> jam_instrument
	endif
	if NOT GotParam \{sample_type}
		sample_type = <chord_type>
	endif
	<current_scale> = (($jam_track_scales_new) [<jam_instrument>])
	<chromatic> = 0
	GetArraySize ($<current_scale>)
	if (<array_Size> = 24)
		<chromatic> = 1
	endif
	if (<jam_instrument> = 0)
		GetArraySize ($<current_scale>)
		if (<array_Size> = 14)
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
	if GotParam \{get_text}
		return single_note_text = <final_text> note_string = <final_note_string> full_note_num = <full_note_num>
	endif
	if GotParam \{final_sample}
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
	GetArraySize <current_scale>
	if NOT (<button> < <array_Size>)
		printstruct <...>
		ScriptAssert 'GUITAR_JAM_SCALES: button index larger than scale array (BUTTON: %a SCALE_SIZE %b)' a = <button> b = <array_Size>
	endif
	<note_struct> = (<current_scale> [<button>])
	if GotParam \{hopo}
		<sample_type> = <hopo>
	endif
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = <sample_type> jam_instrument = <jam_instrument>
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
	GetArraySize <current_scale>
	if (<button> > <array_Size>)
		SoftAssert 'ERROR: Requested button is out of this scale! %a > %b' a = <button> b = <array_Size>
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
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) Type = <chord_dir> chord_type = <chord_type> jam_instrument = <jam_instrument>
	if (<get_text> = 1)
		return final_text = <note_text> final_note_string = <note_text>
	endif
	return final_sample = <sample_checksum> pitch_shift = <pitch_shift> note_string = (<note_struct> [0]) note_fret = (<note_struct> [1]) note_type = <chord_dir> chord_type = <chord_type>
endscript

script jam_get_single_sample_for_melody \{get_text = 0
		jam_instrument = 4}
	if NOT GotParam \{string}
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
	num_samples = ($musicstudio_instrument_list_keyboard [<keyboard_sound>].num_samples)
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
		note = (<keyboard_notes> [<full_note_num>])
		pitch_shift = (<keyboard_pitch_shift> [<full_note_num>])
	else
		note = (<keyboard_notes> [0])
		pitch_shift = (<keyboard_pitch_shift> [0] + <full_note_num>)
	endif
	curr_loaded_keyboard = ($musicstudio_loadedkeyboard)
	formatText checksumName = sample_checksum '%a_%b%c_01' a = <curr_loaded_keyboard> b = <note> c = <octave>
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
	Change \{jam_track_rootnotes = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_track_scaleindex = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_custom_rhythm_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_custom_lead_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_custom_bass_scale = [
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_custom_melody_scale = [
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
	GetArraySize ($jam_tracks)
	begin
	if NOT (<track_count> = 3)
		<root> = (<roots> [<track_count>])
		<Scale> = (<scales> [<track_count>])
		<custom_name> = (<custom_scales> [<track_count>])
		<custom> = ($<custom_name>)
		settrackscale track = ($jam_tracks [<track_count>].id) custom_scale = <custom> last_root = <root> last_scale = <Scale>
	endif
	<track_count> = (<track_count> + 1)
	repeat (<array_Size> - 1)
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
	GetArraySize ($jam_tracks)
	track_count = 0
	begin
	if NOT (<track_count> = 3)
		gettrackscale track = ($jam_tracks [<track_count>].id)
		if (<last_root> >= 0 && <last_scale> >= 0)
			SetArrayElement ArrayName = loaded_roots index = <track_count> NewValue = <last_root>
			SetArrayElement ArrayName = loaded_scales index = <track_count> NewValue = <last_scale>
			switch (<track_count>)
				case 0
				Change jam_custom_rhythm_scale = <custom_scale>
				case 1
				Change jam_custom_lead_scale = <custom_scale>
				case 2
				Change jam_custom_bass_scale = <custom_scale>
				case 4
				Change jam_custom_melody_scale = <custom_scale>
			endswitch
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat (<array_Size> - 1)
	Change jam_track_rootnotes = <loaded_roots>
	Change jam_track_scaleindex = <loaded_scales>
	jam_init_scales_all_instruments
endscript

script jam_set_band_scale 
	getplayerinfo <select_player> jam_instrument
	<scales> = ($jam_track_scaleindex)
	<roots> = ($jam_track_rootnotes)
	<band_scale> = (<scales> [<jam_instrument>])
	<band_root> = (<roots> [<jam_instrument>])
	<loop_count> = 0
	begin
	SetArrayElement ArrayName = scales index = <loop_count> NewValue = <band_scale>
	SetArrayElement ArrayName = roots index = <loop_count> NewValue = <band_root>
	<loop_count> = (<loop_count> + 1)
	if (<loop_count> = 3)
		<loop_count> = (<loop_count> + 1)
	endif
	repeat 4
	Change jam_track_rootnotes = <roots>
	Change jam_track_scaleindex = <scales>
	GetArraySize ($jam_scales_new)
	if (<band_scale> = (<array_Size> -1))
		<customs> = ($jam_track_custom_scales_new)
		<band_leader_scale> = (<customs> [<jam_instrument>])
		<band_custom_scale> = ($<band_leader_scale>)
		<loop_count> = 0
		begin
		if NOT (<loop_count> = <jam_instrument>)
			<inst_scale_name> = (<customs> [<loop_count>])
			Change GlobalName = <inst_scale_name> NewValue = <band_custom_scale>
		endif
		<loop_count> = (<loop_count> + 1)
		if (<loop_count> = 3)
			<loop_count> = (<loop_count> + 1)
		endif
		repeat 4
	endif
	jam_init_scales_all_instruments
	<Player> = 1
	begin
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> > -1 && <jam_instrument> != 3 && <Player> != <select_player>)
		guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
		formatText checksumName = scales_root_text 'jam_scales_root_txt_%s' s = <Player>
		if ScreenElementExists id = <scales_root_text>
			formatText checksumName = scales_scale_text 'jam_scales_scale_txt_%s' s = <Player>
			formatText TextName = new_text qs(0x6e7099b2) a = ($jam_roots [<band_root>].name_text)
			<scales_root_text> :se_setprops text = <new_text>
			<scale_struct> = ($jam_scales_new [<band_scale>])
			formatText TextName = new_text qs(0x052a3756) a = (<scale_struct>.Name)
			<scales_scale_text> :se_setprops text = <new_text>
			jam_scales_update_note_gems Player = <Player>
		else
			formatText checksumName = inst_cont 'inst_cont_%s' s = <Player>
			if ScreenElementExists id = <inst_cont>
				formatText checksumName = player_pause 'jam_band_pause_%s' s = <Player>
				formatText checksumName = line6_pod_id 'line6_pod_%a' a = <Player>
				formatText checksumName = warning_box 'jam_band_warning_box_%a' a = <Player>
				if NOT ScreenElementExists id = <player_pause>
					if NOT ScreenElementExists id = <line6_pod_id>
						if NOT ScreenElementExists id = <warning_box>
							Change \{jam_num_falling_gems = 0}
							if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
								formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
								KillSpawnedScript id = <jam_player_spawns>
								SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {Player = <Player>}
							endif
							if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
								getplayerinfo <Player> controller
								formatText checksumName = inst_cont 'inst_cont_%s' s = <Player>
								formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
								SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> Player = <Player> controller = <controller>}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 4
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_choose_sound
endscript
jam_input_current_chord_preview = NULL
jam_input_current_lead_preview = NULL
jam_input_current_bass_preview = NULL
jam_input_current_melody_preview = NULL

script jam_scales_audible_scale_preview 
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = VMenu 'jam_vmenu_scales_%s' s = <select_player>
	formatText checksumName = curr_preview_sound 'curr_preview_sound_%s' s = <select_player>
	<VMenu> :GetTags
	StopSoundEvent <last_previewed_note>
	Wait \{0.1
		Seconds}
	<delay_between_notes> = 0.25
	<loop_count> = 0
	<last_sound> = <last_previewed_note>
	begin
	Wait <delay_between_notes> Seconds
	if (<jam_instrument> = 0)
		jam_get_sample Player = <select_player> button = <loop_count> tilt = 0 chord_dir = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		Wait \{1
			gameframe}
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		Change jam_input_current_chord_preview = <final_note_sample>
	elseif (<jam_instrument> = 1)
		jam_get_sample Player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		Wait \{1
			gameframe}
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		Change jam_input_current_lead_preview = <final_note_sample>
	elseif (<jam_instrument> = 2)
		jam_get_sample Player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		Wait \{1
			gameframe}
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
		Change jam_input_current_bass_preview = <final_note_sample>
	elseif (<jam_instrument> = 4)
		jam_get_sample Player = <select_player> button = <loop_count> tilt = 0
		stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
		<last_sound> = <final_note_sample>
		Wait \{1
			gameframe}
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
		Change jam_input_current_melody_preview = <final_note_sample>
	endif
	<VMenu> :SetTags last_previewed_note = <final_note_sample>
	<loop_count> = (<loop_count> + 1)
	repeat <num_buttons>
	Wait \{1
		Seconds}
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
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	formatText checksumName = VMenu 'jam_vmenu_scales_%s' s = <select_player>
	<VMenu> :GetTags
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
		jam_get_sample_checksum string = <string> fret = <fret> Type = 0 jam_instrument = 0 chord_type = <chord_type>
		stopsound <last_previewed_note> fade_type = linear fade_time = $jam_fade_time
		<last_previewed_note> = <sample_checksum>
		Wait \{1
			gameframe}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		Change jam_input_current_chord_preview = <sample_checksum>
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
			jam_get_single_sample_for_melody_playback fret = <fret> string = <string> Type = 0 jam_instrument = <jam_instrument>
		else
			jam_get_sample_checksum string = <string> fret = <fret> Type = 0 jam_instrument = <jam_instrument>
		endif
		stopsound <last_previewed_note> fade_type = linear fade_time = $jam_fade_time
		<last_previewed_note> = <sample_checksum>
		Wait \{1
			gameframe}
		switch (<jam_instrument>)
			case 1
			PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
			Change jam_input_current_lead_preview = <sample_checksum>
			case 2
			PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
			Change jam_input_current_bass_preview = <sample_checksum>
			case 4
			PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
			Change jam_input_current_melody_preview = <sample_checksum>
		endswitch
	endif
	<VMenu> :SetTags last_previewed_note = <sample_checksum>
endscript

script jam_sort_custom_scale 
endscript

script jam_scales_toggle_lead_range 
	formatText checksumName = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
	switch ($jam_lead_octave_range)
		case 1
		Change \{jam_lead_octave_range = 2}
		<scales_range_txt> :se_setprops text = qs(0x0d691f47)
		case 2
		Change \{jam_lead_octave_range = 1}
		<scales_range_txt> :se_setprops text = qs(0x5a679075)
	endswitch
	getplayerinfo <select_player> jam_instrument
	guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script jam_scales_toggle_melody_range 
	formatText checksumName = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
	switch ($jam_melody_octave_range)
		case 1
		Change \{jam_melody_octave_range = 2}
		<scales_range_txt> :se_setprops text = qs(0x0d691f47)
		case 2
		Change \{jam_melody_octave_range = 1}
		<scales_range_txt> :se_setprops text = qs(0x5a679075)
	endswitch
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript
jam_rhythm_chord_type = 0

script jam_scales_toggle_chord_type 
	formatText checksumName = chord_text 'jam_chord_type_txt_%s' s = <select_player>
	switch ($jam_rhythm_chord_type)
		case 0
		Change \{jam_rhythm_chord_type = 1}
		<chord_text> :se_setprops text = qs(0x27c54a39)
		case 1
		printf \{qs(0x7125d780)}
		Change \{jam_rhythm_chord_type = 0}
		<chord_text> :se_setprops text = qs(0x596dd695)
	endswitch
	generic_menu_pad_choose_sound
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	KillSpawnedScript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	SpawnScriptNow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript
