jam_num_strings_lead = 6
jam_num_strings_bass = 4
jam_num_strings_rhythm = 2
jam_num_frets_lead = 22
jam_num_frets_bass = 20
jam_num_frets_rhythm_0 = 5
jam_num_frets_rhythm_1 = 10
jam_num_samples = 2
jam_current_lead_position = null
jam_current_rhythm_position = null
jam_current_bass_position = null
lead_types = [
	'pk'
	'pk'
	'pk'
	'pm'
]
lead_types_num_samples = [
	3
	3
	3
	3
]
bass_types = [
	'fingered'
	'fingered'
	'fingered'
	'slap'
]
bass_types_num_samples = [
	2
	2
	2
	2
]
rhythm_types = [
	'chrd_down'
	'chrd_up'
]
rhythm_chord_types = [
	'5'
	'Maj'
	'Min'
	'pm'
	'Maj7'
	'Min7'
	'dom7'
	'min7b5'
	'sus4'
	'dim'
]
rhythm_types_num_samples = [
	3
	2
	2
	3
	2
	2
	2
	2
	1
	1
]
lead_string_notes = [
	0
	5
	10
	3
	7
	0
]
lead_string_octs = [
	2
	2
	2
	3
	3
	4
]
bass_string_octs = [
	1
	1
	1
	2
]
jam_checksum_notes = [
	'E'
	'F'
	'Gb'
	'G'
	'Ab'
	'A'
	'Bb'
	'B'
	'C'
	'Db'
	'D'
	'Eb'
]
jam_note_text = [
	qs(0x69bdca15)
	qs(0x429099d6)
	qs(0xe0187c88)
	qs(0x5b8ba897)
	qs(0x58a41bed)
	qs(0x0dd10f11)
	qs(0x7dcf4431)
	qs(0x26fc5cd2)
	qs(0x3fe76d93)
	qs(0xd7c68cba)
	qs(0x70a6fb54)
	qs(0x4a11b403)
]
jam_pitch_modifier = [
	0
	1
	-1
	0
	1
	2
	-1
	0
	1
	2
	-2
	-1
	0
	1
	2
	-2
	-1
	0
	1
	2
	-1
	0
]
jam_pitch_modifier_rhythm_0 = [
	0
	0
	-1
	0
	-1
	0
]
jam_pitch_modifier_rhythm_1 = [
	0
	0
	-1
	0
	-1
	0
	-1
	0
	-1
	0
	-1
	0
	-1
]

script jam_get_sample_checksum 
	jamgetsamplechecksum_cfunc fret = <fret> string = <string> type = <type> jam_instrument = <jam_instrument> chord_type = <chord_type>
	return sample_checksum = <sample_checksum> note_text = <note_text> pitch_shift = <pitch_shift> note_id = <note_id>
endscript

script jam_get_sample_checksum_unoptimized \{fret = 0
		string = 0
		type = 0
		jam_instrument = 0
		chord_type = 0}
endscript

script test_all_samples 
	test_lead_samples
	test_rhythm_samples
	test_rhythm_special_samples
	test_bass_samples
endscript

script test_lead_samples 
	getarraysize \{$lead_types}
	num_lead_types = <array_size>
	fret = 0
	string = 0
	type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 1
	switch <type>
		case 0
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
		case 1
		playsound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = jammode_leadguitar attack_time = 0.055 attack_function = flat_middle
		case 2
		playsound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = jammode_leadguitar attack_time = 0.07 attack_function = flat_middle
		case 3
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs(0x5c186ce5) s = <sample_checksum>
	endif
	wait \{0.05
		seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<type> = (<type> + 1)
	repeat <num_lead_types>
	<type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_lead
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_lead
	printf \{channel = jam_samples
		qs(0x35747d83)}
endscript

script test_rhythm_samples 
	printf \{channel = jam_samples
		qs(0x5dd5a3f8)}
	getarraysize \{$rhythm_types}
	num_rhythm_types = <array_size>
	getarraysize \{$rhythm_chord_types}
	num_rhythm_chord_types = <array_size>
	num_frets_rhythm = $jam_num_frets_rhythm_0
	fret = 0
	string = 0
	type = 0
	chord_type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 0 chord_type = <chord_type>
	switch <type>
		case 0
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_rhythmguitar
		case 1
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_rhythmguitar
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs(0x5c186ce5) s = <sample_checksum>
	endif
	wait \{0.1
		seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<type> = (<type> + 1)
	repeat <num_rhythm_types>
	<type> = 0
	<chord_type> = (<chord_type> + 1)
	repeat <num_rhythm_chord_types>
	chord_type = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat <num_frets_rhythm>
	<fret> = 0
	<string> = (<string> + 1)
	if (<string> = 1)
		<num_frets_rhythm> = $jam_num_frets_rhythm_1
	endif
	repeat $jam_num_strings_rhythm
	printf \{channel = jam_samples
		qs(0x4bd64827)}
endscript

script test_rhythm_special_samples 
	getarraysize \{$jam_special_chords}
	special_chord = 0
	begin
	dir = 2
	begin
	sample_num = 1
	begin
	jam_get_sample_checksum fret = 0 string = 0 type = <dir> sample_num = <sample_num> jam_instrument = 0 chord_type = <special_chord>
	playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs(0x5c186ce5) s = <sample_checksum>
	endif
	wait \{0.1
		seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<dir> = (<dir> + 1)
	repeat 2
	<special_chord> = (<special_chord> + 1)
	repeat <array_size>
endscript

script test_bass_samples 
	printf \{channel = jam_samples
		qs(0x4b907356)}
	getarraysize \{$bass_types}
	num_bass_types = <array_size>
	fret = 0
	string = 0
	type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 2
	switch <type>
		case 0
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_bass
		case 1
		playsound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = jammode_bass attack_time = 0.055 attack_function = flat_middle
		case 2
		playsound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = jammode_bass attack_time = 0.07 attack_function = flat_middle
		case 3
		playsound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_bass
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs(0x5c186ce5) s = <sample_checksum>
	endif
	wait \{0.1
		seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<type> = (<type> + 1)
	repeat <num_bass_types>
	<type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_bass
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_bass
	printf \{channel = jam_samples
		qs(0x6110f35a)}
endscript
