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
	{
		name = '5'
		name_text = qs(0xab7c82ea)
		small_name_text = qs(0xa952d5fa)
	}
	{
		name = 'Maj'
		name_text = qs(0xbc536ba1)
		small_name_text = qs(0xe17354a5)
	}
	{
		name = 'Min'
		name_text = qs(0xf4273202)
		small_name_text = qs(0x40abb94e)
	}
	{
		name = 'pm'
		name_text = qs(0xd1cb9389)
		small_name_text = qs(0xc5e53aab)
	}
	{
		name = 'Maj7'
		name_text = qs(0xd221a49b)
		small_name_text = qs(0x2f719c06)
	}
	{
		name = 'Min7'
		name_text = qs(0xddc6721f)
		small_name_text = qs(0x4c40893c)
	}
	{
		name = 'dom7'
		name_text = qs(0x12aadebe)
		small_name_text = qs(0x97e3dee4)
	}
	{
		name = 'min7b5'
		name_text = qs(0x131e1eb7)
		small_name_text = qs(0xe814d896)
	}
	{
		name = 'sus4'
		name_text = qs(0x14b0becf)
		small_name_text = qs(0xd83bb444)
	}
	{
		name = 'dim'
		name_text = qs(0xa1f7624d)
		small_name_text = qs(0x4c89bb45)
	}
	{
		name = 'aug'
		name_text = qs(0x589c4bcb)
		small_name_text = qs(0xfc642a5b)
	}
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
	2
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
	use_melody_samples = 0
	if (<jam_instrument> = 4 || <jam_instrument> = 5)
		<use_melody_samples> = 1
	endif
	if (<jam_instrument> = 2 && $MusicStudio_LoadedBass_IsKeyboard = 1)
		<use_melody_samples> = 1
	endif
	if (<use_melody_samples> = 1)
		jam_get_single_sample_for_melody jam_instrument = <jam_instrument> string = <string> Fret = <Fret> jam_instrument = <jam_instrument>
		octave = ((<note_id> / 12) + 1)
		CastToInteger \{octave}
		if (<full_note_num> < 0)
			full_note_num = (<full_note_num> + 12)
		endif
		note_text = ($jam_note_text [<full_note_num>])
	else
		musicstudio_mainobj :MusicStudio_GetSampleChecksum Fret = <Fret> string = <string> type = <type> jam_instrument = <jam_instrument> chord_type = <chord_type>
	endif
	return sample_checksum = <sample_checksum> note_text = <note_text> pitch_shift = <pitch_shift> note_id = <note_id> keyboard_octave = <octave>
endscript
