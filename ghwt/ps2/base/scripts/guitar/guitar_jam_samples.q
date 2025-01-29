jam_num_strings_lead = 6
jam_num_strings_bass = 4
jam_num_strings_rhythm = 2
jam_num_frets_lead = 22
jam_num_frets_bass = 20
jam_num_frets_rhythm_0 = 5
jam_num_frets_rhythm_1 = 10
jam_num_samples = 2
jam_current_lead_position = NULL
jam_current_rhythm_position = NULL
jam_current_bass_position = NULL
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
	'chrd_down'
]
rhythm_chord_types = [
	'5'
	'Maj'
	'Min'
	'pm'
	'Maj'
	'Min'
	'Maj'
	'Min'
	'Maj'
	'Min'
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
0x0c4737fc = 'big_tone'
0x355c9929 = 'big_tone'
rhythm_jam_set = 'big_tone'
lead_jam_set = 'big_tone'
jam_pitch_modifier = [
	-5
	-4
	-3
	-2
	-1
	0
	1
	2
	3
	4
	5
	-5
	-4
	-3
	-2
	-1
	0
	1
	2
	3
	4
	5
]
jam_pitch_modifier_rhythm_0 = [
	-3
	-2
	-1
	0
	1
	2
]
jam_pitch_modifier_rhythm_1 = [
	-3
	-2
	-1
	0
	1
	2
	3
	-2
	-1
	0
	1
	2
	3
]

script jam_get_sample_checksum 
	jamgetsamplechecksum_cfunc fret = <fret> string = <string> Type = <Type> jam_instrument = <jam_instrument> chord_type = <chord_type>
	return sample_checksum = <sample_checksum> note_text = <note_text> pitch_shift = <pitch_shift> note_id = <note_id>
endscript

script jam_get_sample_checksum_unoptimized \{fret = 0
		string = 0
		Type = 0
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
	GetArraySize \{$lead_types}
	num_lead_types = <array_Size>
	fret = 0
	string = 0
	Type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> Type = <Type> sample_num = <sample_num> jam_instrument = 1
	switch <Type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = jammode_leadguitar attack_time = 0.055 attack_function = flat_middle 0xc765acc7 = 1
		case 2
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = jammode_leadguitar attack_time = 0.07 attack_function = flat_middle 0xc765acc7 = 2
		case 3
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
	endswitch
	if NOT issoundplaying <sample_checksum>

	endif
	if (<Type> = 3)
		Wait \{0.5
			Seconds}
	else
		Wait \{1.0
			Seconds}
	endif
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	Wait \{0.3
		Seconds}
	<Type> = (<Type> + 1)
	repeat <num_lead_types>
	<Type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 1
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_lead
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_lead

endscript

script test_rhythm_samples 

	GetArraySize \{$rhythm_types}
	num_rhythm_types = <array_Size>
	GetArraySize \{$rhythm_chord_types}
	num_rhythm_chord_types = <array_Size>
	num_frets_rhythm = $jam_num_frets_rhythm_0
	fret = 0
	string = 0
	Type = 0
	chord_type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> Type = <Type> sample_num = <sample_num> jam_instrument = 0 chord_type = <chord_type>
	switch <Type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_rhythmguitar
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_rhythmguitar
	endswitch
	if NOT issoundplaying <sample_checksum>

	endif
	Wait \{0.1
		Seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<Type> = (<Type> + 1)
	repeat <num_rhythm_types>
	<Type> = 0
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

endscript

script test_rhythm_special_samples 
	GetArraySize \{$jam_special_chords}
	special_chord = 0
	begin
	Dir = 2
	begin
	sample_num = 1
	begin
	jam_get_sample_checksum fret = 0 string = 0 Type = <Dir> sample_num = <sample_num> jam_instrument = 0 chord_type = <special_chord>
	PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_leadguitar
	if NOT issoundplaying <sample_checksum>

	endif
	Wait \{0.1
		Seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<Dir> = (<Dir> + 1)
	repeat 2
	<special_chord> = (<special_chord> + 1)
	repeat <array_Size>
endscript

script test_bass_samples 

	GetArraySize \{$bass_types}
	num_bass_types = <array_Size>
	fret = 0
	string = 0
	Type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> Type = <Type> sample_num = <sample_num> jam_instrument = 2
	switch <Type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_bass
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = jammode_bass attack_time = 0.055 attack_function = flat_middle 0xc765acc7 = 1
		case 2
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = jammode_bass attack_time = 0.07 attack_function = flat_middle 0xc765acc7 = 2
		case 3
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = jammode_bass
	endswitch
	if NOT issoundplaying <sample_checksum>

	endif
	Wait \{0.1
		Seconds}
	stopsound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<Type> = (<Type> + 1)
	repeat <num_bass_types>
	<Type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_bass
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_bass

endscript
