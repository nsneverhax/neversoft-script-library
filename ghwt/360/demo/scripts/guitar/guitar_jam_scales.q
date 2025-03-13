jam_track_rootnotes = [
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
]
jam_track_scales_new = [
	jam_active_rhythm_scale
	jam_active_lead_scale
	jam_active_bass_scale
	jam_unused_drum_scale
	jam_active_melody_scale
]
jam_track_custom_scales_new = [
	jam_custom_rhythm_scale
	jam_custom_lead_scale
	jam_custom_bass_scale
	jam_unused_drum_scale
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
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	switch (<jam_instrument>)
		case 0
		guitar_jam_scales_change_scale_rhythm <...>
		change jam_active_rhythm_scale = <final_scale>
		case 1
		guitar_jam_scales_change_scale_leadbass <...>
		change jam_active_lead_scale = <final_scale>
		case 2
		guitar_jam_scales_change_scale_leadbass <...>
		change jam_active_bass_scale = <final_scale>
		case 4
		guitar_jam_scales_change_scale_leadbass <...>
		change jam_active_melody_scale = <final_scale>
	endswitch
endscript

script guitar_jam_scales_change_scale_rhythm 
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
	if structurecontains structure = <chosen_scale> chromatic
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] ,
			[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
		<is_chromatic> = 1
	else
		final_scale = [[0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0] , [0 , 0]]
		<is_chromatic> = 0
	endif
	if structurecontains structure = <chosen_scale> custom
		<custom_scales_array> = ($jam_track_custom_scales_new)
		<custom_scale_name> = (<custom_scales_array> [<jam_instrument>])
		<custom_scale> = ($<custom_scale_name>)
		if (<jam_instrument> = 1)
			<range> = ($jam_lead_octave_range)
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
		repeat 6
		setarrayelement arrayname = final_scale index = 6 newvalue = (<final_scale> [5])
		setarrayelement arrayname = final_scale index = 13 newvalue = (<final_scale> [12])
	else
		if (<jam_instrument> = 1)
			if (<is_chromatic> = 1)
				<scale_pattern_name> = (<chosen_scale>.pattern)
				<root_modifier> = 0
				<range> = ($jam_lead_octave_range)
				if (<range> = 2)
					<root_modifier> = 12
				endif
			else
				<range> = ($jam_lead_octave_range)
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

script jam_get_sample \{chord_type = 0}
	getplayerinfo <player> jam_instrument
	<current_scale> = (($jam_track_scales_new) [<jam_instrument>])
	if gotparam \{chord_dir}
		getarraysize ($<current_scale>)
		if (<array_size> = 14)
			if ($jam_tilt_rhythm = 1)
				<button> = (<button> + 7)
			endif
		endif
		jam_get_chord_sample_from_scale player = <player> button = <button> tilt = <tilt> chord_dir = <chord_dir> chord_type = <chord_type> current_scale = <current_scale> get_text = <get_text>
	elseif (<jam_instrument> = 4)
		jam_get_single_sample_for_melody player = <player> button = <button> tilt = <tilt> current_scale = <current_scale> get_text = <get_text> sample_type = <sample_type>
	else
		getarraysize ($<current_scale>)
		if (<array_size> = 24)
			jam_get_single_sample_from_chromatic player = <player> button = <button> tilt = <tilt> hopo = <hopo> current_scale = <current_scale> get_text = <get_text> sample_type = <sample_type>
		else
			jam_get_single_sample_from_scale player = <player> button = <button> tilt = <tilt> hopo = <hopo> current_scale = <current_scale> get_text = <get_text> sample_type = <sample_type>
		endif
	endif
	if gotparam \{get_text}
		return single_note_text = <final_text> note_string = <final_note_string>
	endif
	if gotparam \{final_sample}
		return final_note_sample = <final_sample> pitch_shift = <pitch_shift> note_string = <note_string> note_fret = <note_fret> note_type = <note_type> chord_type = <chord_type>
	endif
endscript

script jam_get_single_sample_from_scale \{get_text = 0
		sample_type = 0}
	getplayerinfo <player> jam_instrument
	<jam_active_scales> = ($jam_track_scales_new)
	<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
	<current_scale> = ($<current_scale_name>)
	if (<tilt> >= 1)
		<button> = (<button> + 7)
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
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = <sample_type> jam_instrument = <jam_instrument>
	if (<get_text> = 1)
		return final_text = <note_text>
	endif
	return final_sample = <sample_checksum> pitch_shift = <pitch_shift> note_string = (<note_struct> [0]) note_fret = (<note_struct> [1]) note_type = <sample_type>
endscript

script jam_get_chord_sample_from_scale \{get_text = 0}
	getplayerinfo <player> jam_instrument
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
	if (<get_text> = 1)
		if (<target_note> > 14)
			printstruct <...>
			softassert 'ERROR: Target Note too large for get_chord_sample get_text: %a' a = <target_note>
			printf \{'ERROR: Target Note too large for get_chord_sample get_text'}
			<final_note_text> = {note = qs(0x4569cb67) full = qs(0xb8374156)}
			return final_note_text = <final_note_text>
		else
			<name_text> = ((<samples> [<target_note>]).name_text)
			<note_text> = ((<samples> [<target_note>]).note_text)
			<final_note_text> = {note = <note_text> full = <name_text>}
			return final_note_text = <final_note_text>
		endif
	endif
	return final_sample = <final_sample>
endscript

script jam_get_single_sample_from_chromatic \{get_text = 0
		sample_type = 0}
	getplayerinfo <player> jam_instrument
	<jam_active_scales> = ($jam_track_scales_new)
	<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
	<current_scale> = ($<current_scale_name>)
	<button> = (<button> + (<tilt> * 6))
	<note_struct> = (<current_scale> [<button>])
	if gotparam \{hopo}
		<sample_type> = <hopo>
	endif
	jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = <sample_type> jam_instrument = <jam_instrument>
	if (<get_text> = 1)
		return final_text = <note_text>
	endif
	return final_sample = <sample_checksum> pitch_shift = <pitch_shift> note_string = (<note_struct> [0]) note_fret = (<note_struct> [1]) note_type = <sample_type>
endscript

script jam_get_single_sample_for_melody \{get_text = 0}
	<passed_in_note> = 0
	if ((gotparam string) && (gotparam fret))
		<passed_in_note> = 1
	endif
	if (<passed_in_note> = 0)
		getplayerinfo <player> jam_instrument
		<jam_active_scales> = ($jam_track_scales_new)
		<current_scale_name> = (<jam_active_scales> [<jam_instrument>])
		<current_scale> = ($<current_scale_name>)
		getarraysize <current_scale>
		if (<tilt> = 1)
			if (<array_size> = 24)
				<button> = (<button> + 6)
			else
				<button> = (<button> + 7)
			endif
		elseif (<tilt> = 2)
			<button> = (<button> + 12)
		elseif (<tilt> = 3)
			<button> = (<button> + 18)
		endif
		if (<button> >= <array_size>)
			<button> = (<array_size> -1)
		endif
		<note_struct> = (<current_scale> [<button>])
		jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = 0 jam_instrument = 1
		if (<get_text> = 1)
			return final_text = <note_text>
		endif
		<string> = (<note_struct> [0])
		<fret> = (<note_struct> [1])
	endif
	<sample_checksum> = ($melody_sample)
	<oct> = 1
	if (<string> = 5)
		<oct> = 3
	elseif ((<string> = 2) && (<fret> >= 2))
		<oct> = 2
	elseif (<string> > 2)
		<oct> = 2
	endif
	begin
	if (<string> > 0)
		if (<string> = 4)
			<fret> = (<fret> + 4)
		else
			<fret> = (<fret> + 5)
		endif
		<string> = (<string> -1)
	endif
	if (<fret> < 0)
		<fret> = (<fret> + 12)
	endif
	if (<string> = 0)
		break
	endif
	repeat
	<range> = ($jam_melody_octave_range)
	if (<range> = 2)
		<fret> = (<fret> + 12)
	endif
	<final_pitch> = (<fret> - 16)
	return final_sample = <sample_checksum> pitch_shift = <final_pitch> note_string = <string> note_fret = <fret> note_type = <sample_type>
endscript

script jam_init_scales 
	change \{jam_track_rootnotes = [
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
	begin
	<root> = (<roots> [<track_count>])
	<scale> = (<scales> [<track_count>])
	<custom_name> = (<custom_scales> [<track_count>])
	<custom> = ($<custom_name>)
	settrackscale track = ($jam_tracks [<track_count>].id) custom_scale = <custom> last_root = <root> last_scale = <scale>
	<track_count> = (<track_count> + 1)
	repeat 3
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
	track_count = 0
	begin
	gettrackscale track = ($jam_tracks [<track_count>].id)
	setarrayelement arrayname = loaded_roots index = <track_count> newvalue = <last_root>
	setarrayelement arrayname = loaded_scales index = <track_count> newvalue = <last_scale>
	switch (<track_count>)
		case 0
		change jam_custom_rhythm_scale = <custom_scale>
		case 1
		change jam_custom_lead_scale = <custom_scale>
		case 2
		change jam_custom_bass_scale = <custom_scale>
	endswitch
	<track_count> = (<track_count> + 1)
	repeat 3
	change jam_track_rootnotes = <loaded_roots>
	change jam_track_scaleindex = <loaded_scales>
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
	setarrayelement arrayname = scales index = <loop_count> newvalue = <band_scale>
	setarrayelement arrayname = roots index = <loop_count> newvalue = <band_root>
	<loop_count> = (<loop_count> + 1)
	if (<loop_count> = 3)
		<loop_count> = (<loop_count> + 1)
	endif
	repeat 4
	change jam_track_rootnotes = <roots>
	change jam_track_scaleindex = <scales>
	getarraysize ($jam_scales_new)
	if (<band_scale> = (<array_size> -1))
		<customs> = ($jam_track_custom_scales_new)
		<band_leader_scale> = (<customs> [<jam_instrument>])
		<band_custom_scale> = ($<band_leader_scale>)
		<loop_count> = 0
		begin
		if NOT (<loop_count> = <jam_instrument>)
			<inst_scale_name> = (<customs> [<loop_count>])
			change globalname = <inst_scale_name> newvalue = <band_custom_scale>
		endif
		<loop_count> = (<loop_count> + 1)
		if (<loop_count> = 3)
			<loop_count> = (<loop_count> + 1)
		endif
		repeat 4
	endif
	jam_init_scales_all_instruments
	<player> = 1
	begin
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> > -1 && <jam_instrument> != 3 && <player> != <select_player>)
		guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
		formattext checksumname = scales_root_text 'jam_scales_root_txt_%s' s = <player>
		if screenelementexists id = <scales_root_text>
			formattext checksumname = scales_scale_text 'jam_scales_scale_txt_%s' s = <player>
			formattext textname = new_text qs(0x6e7099b2) a = ($jam_roots [<band_root>])
			<scales_root_text> :se_setprops text = <new_text>
			<scale_struct> = ($jam_scales_new [<band_scale>])
			formattext textname = new_text qs(0x052a3756) a = (<scale_struct>.name)
			<scales_scale_text> :se_setprops text = <new_text>
			jam_scales_update_note_gems player = <player>
		else
			formattext checksumname = inst_cont 'inst_cont_%s' s = <player>
			if screenelementexists id = <inst_cont>
				formattext checksumname = player_pause 'jam_band_pause_%s' s = <player>
				if NOT screenelementexists id = <player_pause>
					change \{jam_num_falling_gems = 0}
					if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
						formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
						killspawnedscript id = <jam_player_spawns>
						spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <player>}
					endif
					if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
						getplayerinfo <player> controller
						formattext checksumname = inst_cont 'inst_cont_%s' s = <player>
						formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
						spawnscriptnow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> player = <player> controller = <controller>}
					endif
				endif
			endif
		endif
	endif
	<player> = (<player> + 1)
	repeat 4
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_choose_sound
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
			printf 'booting fret to %a' a = (<target_note> + 12) channel = jrdebug
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
		printstruct channel = jam_mode <...>
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

script jam_sort_custom_scale 
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
jam_rhythm_chord_type = 0

script jam_scales_toggle_chord_type 
	formattext checksumname = chord_text 'jam_chord_type_txt_%s' s = <select_player>
	switch ($jam_rhythm_chord_type)
		case 0
		change \{jam_rhythm_chord_type = 1}
		<chord_text> :se_setprops text = qs(0x27c54a39)
		case 1
		change \{jam_rhythm_chord_type = 0}
		<chord_text> :se_setprops text = qs(0x596dd695)
	endswitch
	generic_menu_pad_choose_sound
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript
