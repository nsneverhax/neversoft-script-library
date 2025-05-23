ghtunes_version = 4
jam_song_version = 10
jam_max_user_songs = 0
jam_max_downloaded_songs = 0

script set_plat_jam_maximums 
	if isps3
		change \{jam_max_user_songs = 40}
		change \{jam_max_downloaded_songs = 50}
	else
		change \{jam_max_user_songs = 50}
		change \{jam_max_downloaded_songs = 100}
	endif
endscript
jam_midi_input_killswitch = 1
num_jam_players = 4
gemarraysize = 7500
starsize = 20
fretbarsize = 4000
markerssize = 50
arraylistsize = 200
drumnotessize = 4000
jam_click_track = 1
jam_current_marker_bpm = 120
jam_min_bpm = 40
jam_max_bpm = 180
jam_highway_last_backwards_interval = -1
jam_highway_last_forwards_interval = -1
jam_current_bpm = 120
jam_current_quantize = 0
jam_current_tuning = 0
jam_lead_pan = 3
jam_rhythm_pan = -3
jam_melody_pan = 0
jam_falling_gem_limit = 195
jam_num_falling_gems = 0
jam_select_area_wait = 10
jam_skip_wait = 15
jam_tracks = [
	{
		id = rhythm
		alt_id = lead
		icon = ghmix_rguitar_icon
		gem_array = editable_song_expert
		in_game_gem_array = jamsession_song_in_game
		name_text = qs(0x1f0659c1)
		save_text = 'rhythm'
		alt_text = qs(0x7d5eb9c0)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_rhythm
		color = [
			185
			171
			71
			255
		]
		spawn_id = playback_sustain_note_0
		jamroom_track_offset = 2
	}
	{
		id = lead
		alt_id = rhythm
		icon = ghmix_guitar_icon
		gem_array = editable_song_rhythm_expert
		in_game_gem_array = jamsession_song_rhythm_in_game
		name_text = qs(0x0cc7d9b2)
		save_text = 'lead'
		alt_text = qs(0xc1665045)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_lead
		color = [
			55
			116
			61
			255
		]
		spawn_id = playback_sustain_note_1
		jamroom_track_offset = 0
	}
	{
		id = bass
		alt_id = melody
		icon = ghmix_bass_icon
		gem_array = editable_song_guitarcoop_expert
		in_game_gem_array = jamsession_song_guitarcoop_in_game
		name_text = qs(0x7d4f9214)
		save_text = 'bass'
		alt_text = qs(0x749036ec)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_bass_recording
		color = [
			68
			92
			131
			255
		]
		spawn_id = playback_sustain_note_2
		jamroom_track_offset = 3
	}
	{
		id = drum
		icon = ghmix_drum_icon
		gem_array = editable_song_drum_expert
		in_game_gem_array = jamsession_song_drum_in_game
		name_text = qs(0x388cd3db)
		save_text = 'drums'
		alt_text = qs(0xf3e03f27)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_drums
		color = [
			154
			80
			56
			255
		]
		spawn_id = playback_sustain_note_3
		jamroom_track_offset = 4
	}
	{
		id = melody
		alt_id = bass
		icon = ghmix_synth_icon
		gem_array = editable_song_rhythmcoop_expert
		in_game_gem_array = jamsession_song_rhythmcoop_in_game
		name_text = qs(0x58ce03d1)
		save_text = 'keyboard'
		alt_text = qs(0x09aa4fdd)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_melody
		color = [
			151
			68
			85
			255
		]
		spawn_id = playback_sustain_note_4
		jamroom_track_offset = 1
	}
	{
		id = vocals
		alt_id = bass
		icon = ghmix_synth_icon
		gem_array = editable_song_rhythmcoop_expert
		in_game_gem_array = jamsession_song_rhythmcoop_in_game
		name_text = qs(0x1b9f6f84)
		save_text = 'vocals'
		alt_text = qs(0x9fae80a8)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_melody
		color = [
			154
			80
			56
			255
		]
		spawn_id = playback_sustain_note_4
		jamroom_track_offset = 5
	}
]
jam_genre_list = [
	{
		name_text = qs(0x5222d1db)
		abrev_text = qs(0xef861323)
		checksum = alternative
		leaderboard = user_content_alternative
	}
	{
		name_text = qs(0x0ec9c808)
		abrev_text = qs(0x0ec9c808)
		checksum = pop
		leaderboard = user_content_pop
	}
	{
		name_text = qs(0xe829168a)
		abrev_text = qs(0xf72c525e)
		checksum = experimental
		leaderboard = user_content_experimental
	}
	{
		name_text = qs(0x4911c80a)
		abrev_text = qs(0x4911c80a)
		checksum = hip_hop
		leaderboard = user_content_hip_hop
	}
	{
		name_text = qs(0xdbe68323)
		abrev_text = qs(0xdbe68323)
		checksum = rock
		leaderboard = user_content_rock
	}
	{
		name_text = qs(0x355b4e5c)
		abrev_text = qs(0x355b4e5c)
		checksum = metal
		leaderboard = user_content_metal
	}
	{
		name_text = qs(0x40f5ecbc)
		abrev_text = qs(0x6dd8f8f0)
		checksum = electronic
		leaderboard = user_content_electronic
	}
	{
		name_text = qs(0xae88c5bc)
		abrev_text = qs(0xae88c5bc)
		checksum = other
		leaderboard = user_content_other
	}
]
default_album_cover = [
	{
		base_tex = `tex\models\characters\global\global_blank_logo`
		material = band_logo_primary
		layers = [
			{
				texture = `tex/models/characters/skater_male/decals/cag_graphics044`
				flags = 3
			}
		]
		diffuse
	}
]
ghtunes_minimum_note_count = 20
ghtunes_minimum_song_time = 10000
jam_songs_rated_this_session = [
]
jam_highway_fretbar_color = [
	150
	150
	150
	255
]
jam_highway_measurebar_color = [
	240
	240
	240
	255
]
jam_recording_metaview_length = 470.0
jam_camera_props = {
	jam_look_at_mixer = {
		lockto = world
		pos = (0.507738, 1.892075, 16.786266)
		quat = (0.02289, -0.948689, 0.070403)
		fov = 72.0
	}
	jam_song_select = {
		lockto = world
		pos = (-2.208166, 1.7454499, 13.966361)
		quat = (0.001762, -0.99729997, 0.025651002)
		fov = 72.0
	}
	jam_ghmix_song_select = {
		lockto = world
		pos = (-2.130476, 1.888687, 14.1753235)
		quat = (0.028432999, -0.78749603, 0.036445998)
		fov = 72.0
	}
	jam_band = {
		lockto = world
		pos = (-0.51169395, 1.7524859, 9.7445545)
		quat = (0.001013, 0.9969439, -0.076838)
		fov = 72.0
	}
	jam_publish = {
		lockto = world
		pos = (-0.536864, 2.1043458, 15.148574)
		quat = (0.0052940003, 0.02768, -0.000218)
		fov = 72.0
	}
	jam_tutorials = {
		lockto = world
		pos = (-3.6637907, 1.6212071, 12.313894)
		quat = (0.020512, -0.966841, 0.076533005)
		fov = 72.0
	}
	jam_advanced_recording = {
		lockto = world
		pos = (-3.9595852, 1.8264489, 13.100554)
		quat = (0.011898, -0.70952004, 0.0119940005)
		fov = 72.0
	}
	jam_gh_tunes = {
		lockto = world
		pos = (-3.222695, 1.3334249, 11.540949)
		quat = (0.019791, 0.941012, -0.056126006)
		fov = 72.0
	}
	jam_song_wizard = {
		lockto = world
		pos = (-2.3648896, 1.668748, 12.441849)
		quat = (0.002055, 0.98574096, -0.167789)
		fov = 72.0
	}
}
jam_gem_colors = [
	[
		0
		165
		130
		160
	]
	[
		230
		80
		90
		160
	]
	[
		240
		240
		0
		160
	]
	[
		0
		135
		210
		160
	]
	[
		220
		160
		25
		160
	]
	[
		181
		11
		170
		160
	]
]
jam_tilt_rhythm = 0
jam_button_patterns_singles = [
	1048576
	65536
	4096
	256
	16
	1
]
jam_button_patterns_chords = [
	69632
	65792
	4352
	4112
	272
	257
	17
]
jam_bonus_pattern_samples = 1
jam_button_patterns_bonus = [
	69888
	69648
	65808
	4368
	4353
	4113
	273
]
rhythm_pitch_shift = {
	effect = whammy
	name = jamrhythmpitchshift
	pitch = 1.0
	maxchannels = 0
}
jam_special_chords = [
	{
		name_text = qs(0xe5cff9b3)
		special_up = 'stringmute_up'
		special_down = 'stringmute_down'
		note_txt = qs(0xc1e75f6d)
		pattern = 65552
	}
	{
		name_text = qs(0xcbe02690)
		special_up = 'DiveBomb_Down_02'
		special_down = 'DiveBomb_Down_01'
		note_txt = qs(0x76cc99a7)
		pattern = 4097
		no_random = true
	}
	{
		name_text = qs(0xe0cd7553)
		special_up = 'DiveBomb_UpDown_01'
		special_down = 'DiveBomb_UpDown_02'
		note_txt = qs(0xc1e75f6d)
		pattern = 65537
		no_random = true
	}
	{
		name_text = qs(0xc0b20247)
		special_up = 'fingerslide_01'
		special_down = 'fingerslide_01'
		note_txt = qs(0xc1e75f6d)
		pattern = 69904
		no_random = true
	}
	{
		name_text = qs(0xeb9f5184)
		special_up = 'fingerslide_02'
		special_down = 'fingerslide_02'
		note_txt = qs(0xc1e75f6d)
		pattern = 4369
		no_random = true
	}
	{
		name_text = qs(0xf28460c5)
		special_up = 'fingerslide_03'
		special_down = 'fingerslide_03'
		note_txt = qs(0xc1e75f6d)
		pattern = 69889
		no_random = true
	}
	{
		name_text = qs(0x1060a59d)
		special_up = 'pkslidefast_01'
		special_down = 'pkslidefast_01'
		note_txt = qs(0xc1e75f6d)
		pattern = 65809
		no_random = true
	}
	{
		name_text = qs(0x3b4df65e)
		special_up = 'pkslidefast_02'
		special_down = 'pkslidefast_02'
		note_txt = qs(0xc1e75f6d)
		pattern = 69633
		no_random = true
	}
	{
		name_text = qs(0x2256c71f)
		special_up = 'pkslidefast_03'
		special_down = 'pkslidefast_03'
		note_txt = qs(0xc1e75f6d)
		pattern = 65553
		no_random = true
	}
	{
		name_text = qs(0xdca5e20b)
		special_up = 'pkslideslow_01'
		special_down = 'pkslideslow_01'
		note_txt = qs(0xc1e75f6d)
		pattern = 69649
		no_random = true
	}
	{
		name_text = qs(0xf788b1c8)
		special_up = 'pkslideslow_02'
		special_down = 'pkslideslow_02'
		note_txt = qs(0xc1e75f6d)
		pattern = 69905
		no_random = true
	}
	{
		name_text = qs(0xee938089)
		special_up = 'pkslideslow_03'
		special_down = 'pkslideslow_03'
		note_txt = qs(0xc1e75f6d)
		pattern = 65793
		no_random = true
	}
]
jam_tilt_lead = 0
jam_lead_octave_range = 1
lead_pitch_shift = {
	effect = whammy
	name = jamleadpitchshift
	pitch = 1.0
	maxchannels = 0
}
jam_hopo_initial_check_frames = 20
jam_hopo_check_frames = 40
jam_lead_vibrato_depth = 10
jam_tilt_bass = 0
loadedbasskitpak = 'none'
bass_kit_sample = deepsh101
bass_pitch_shift = {
	effect = whammy
	name = jambasspitchshift
	pitch = 1.0
	maxchannels = 0
}
jam_default_drum_velocity = 70
jam_default_snare_velocity = 90
jam_default_hihat_velocity = 80
jam_default_tom1_velocity = 100
jam_default_cymbal_velocity = 105
jam_default_tom2_velocity = 100
jam_default_kick_velocity = 110
snare_stop_repeat = 0
hihat_stop_repeat = 0
tom1_stop_repeat = 0
cymbal_stop_repeat = 0
tom2_stop_repeat = 0
kick_stop_repeat = 0
drum_humanizer_low_bound = 10
drum_humanizer_high_bound = 10
jam_tilt_melody = 0
jam_melody_octave_range = 0
loadedmelodykitpak = 'none'
melody_sample = deepsh101
melody_pitch_shift = {
	effect = whammy
	name = jammelodypitchshift
	pitch = 1.0
	maxchannels = 0
}
jamsession_vocals_note_range = [
	0
	0
]
jamsession_vocals_freeform = [
]
jam_mic_id = 5
jamsession_diffcrunchparams = {
	drum = {
		easy = {
			filter_note_time_array = [
				{
					type = 4096
					time = 4
				}
				{
					type = 256
					time = 4
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 4
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 1
				}
			]
			chord_filter = standard_drum_filter
		}
		medium = {
			filter_note_time_array = [
				{
					type = 4096
					time = 16
				}
				{
					type = 256
					time = 8
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 8
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 0.5
				}
			]
			chord_filter = standard_drum_filter
		}
		hard = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 16
				}
				{
					type = 16
					time = 8
				}
				{
					type = 1
					time = 16
				}
				{
					type = 65536
					time = 8
				}
				{
					type = 1048576
					time = 4
				}
			]
			chord_filter = standard_drum_filter
		}
		expert = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 32
				}
				{
					type = 16
					time = 32
				}
				{
					type = 1
					time = 32
				}
				{
					type = 65536
					time = 32
				}
				{
					type = 1048576
					time = 32
				}
			]
			chord_filter = standard_drum_filter
		}
	}
	guitar = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
	bass = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
}
jam_rhythm_string1_limit = 4
jam_rhythm_string2_limit = 9
jam_rhythm_string1_rollover = 5
jam_rhythm_string2_rollover = 7
jam_leadbass_string_limit = 4
jam_scales_new = [
	{
		pattern = major_pattern
		pattern2 = major_pattern2
		pattern_rhythm = major_pattern_rhythm
		chord_pattern = major_chord_pattern
		name_text = qs(0xbc536ba1)
		diatonic
	}
	{
		pattern = pent_major_pattern
		pattern2 = pent_major_pattern2
		pattern_rhythm = pent_major_pattern_rhythm
		chord_pattern = pent_major_chord_pattern
		name_text = qs(0x1318b9c0)
	}
	{
		pattern = minor_pattern
		pattern2 = minor_pattern2
		pattern_rhythm = minor_pattern_rhythm
		chord_pattern = minor_chord_pattern
		name_text = qs(0xf4273202)
		diatonic
	}
	{
		pattern = pent_minor_pattern
		pattern2 = pent_minor_pattern2
		pattern_rhythm = pent_minor_pattern_rhythm
		chord_pattern = pent_minor_chord_pattern
		name_text = qs(0x2db953b5)
	}
	{
		pattern = blues_pattern
		pattern2 = blues_pattern2
		pattern_rhythm = blues_pattern_rhythm
		chord_pattern = blues_chord_pattern
		name_text = qs(0x527b4496)
		diatonic
	}
	{
		pattern = harm_minor_pattern
		pattern2 = harm_minor_pattern2
		pattern_rhythm = harm_minor_pattern_rhythm
		chord_pattern = harm_minor_chord_pattern
		name_text = qs(0x34948cbf)
		diatonic
	}
	{
		pattern = phryg_dom_pattern
		pattern2 = phryg_dom_pattern2
		pattern_rhythm = phryg_dom_pattern_rhythm
		chord_pattern = phryg_dom_chord_pattern
		name_text = qs(0x17555c64)
		diatonic
	}
	{
		pattern = hung_minor_pattern
		pattern2 = hung_minor_pattern2
		pattern_rhythm = hung_minor_pattern_rhythm
		chord_pattern = hung_minor_chord_pattern
		name_text = qs(0x3f6a917d)
		diatonic
	}
	{
		pattern = whole_tone_pattern
		pattern2 = whole_tone_pattern2
		pattern_rhythm = whole_tone_pattern_rhythm
		chord_pattern = whole_tone_chord_pattern
		name_text = qs(0x31581c9e)
		diatonic
	}
	{
		pattern = dim_whole_pattern
		pattern2 = dim_whole_pattern2
		pattern_rhythm = dim_whole_pattern_rhythm
		chord_pattern = dim_whole_chord_pattern
		name_text = qs(0xd884e2e7)
		diatonic
	}
	{
		pattern = chromatic_pattern
		pattern_rhythm = chromatic_pattern_rhythm
		chord_pattern = chromatic_chord_pattern
		name_text = qs(0x736feb36)
		chromatic
	}
	{
		pattern = null
		pattern_rhythm = null
		chord_pattern = custom_chord_pattern
		name_text = qs(0xd2cd3957)
		diatonic
		custom
	}
]
major_chord_pattern = [
	1
	2
	2
	1
	1
	2
	9
]
minor_chord_pattern = [
	2
	9
	1
	2
	2
	1
	1
]
pent_major_chord_pattern = [
	1
	5
	5
	8
	5
	1
	5
]
pent_minor_chord_pattern = [
	5
	1
	5
	5
	8
	5
	1
]
blues_chord_pattern = [
	1
	1
	1
	9
	1
	1
	1
]
harm_minor_chord_pattern = [
	2
	7
	10
	5
	6
	4
	9
]
phryg_dom_chord_pattern = [
	1
	1
	9
	2
	9
	10
	2
]
hung_minor_chord_pattern = [
	2
	1
	10
	1
	1
	1
	1
]
whole_tone_chord_pattern = [
	10
	10
	10
	10
	10
	10
	10
]
dim_whole_chord_pattern = [
	10
	2
	2
	10
	1
	10
	9
]
chromatic_chord_pattern = [
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
]
custom_chord_pattern = [
	1
	1
	1
	1
	1
	1
	1
]
major_pattern_rhythm = [
	0
	2
	4
	5
	7
	9
	11
]
pent_minor_pattern_rhythm = [
	0
	3
	5
	7
	10
	12
	15
]
pent_major_pattern_rhythm = [
	0
	2
	4
	7
	9
	12
	14
]
blues_pattern_rhythm = [
	0
	3
	5
	6
	7
	10
	12
]
minor_pattern_rhythm = [
	0
	2
	3
	5
	7
	8
	10
]
harm_minor_pattern_rhythm = [
	0
	2
	3
	5
	7
	8
	11
]
phryg_dom_pattern_rhythm = [
	0
	1
	4
	5
	7
	8
	10
]
hung_minor_pattern_rhythm = [
	0
	2
	3
	6
	7
	8
	11
]
whole_tone_pattern_rhythm = [
	0
	2
	4
	6
	8
	10
	12
]
dim_whole_pattern_rhythm = [
	0
	1
	3
	4
	6
	8
	10
]
chromatic_pattern_rhythm = [
	0
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10
	11
	12
	13
]
major_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		4
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		4
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		1
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		2
	]
	[
		4
		4
	]
]
major_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		11
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		11
	]
	[
		3
		8
	]
	[
		3
		9
	]
	[
		3
		11
	]
	[
		4
		9
	]
	[
		4
		10
	]
	[
		4
		12
	]
	[
		5
		9
	]
	[
		5
		11
	]
]
pent_major_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		4
	]
	[
		1
		2
	]
	[
		1
		4
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		1
	]
	[
		4
		0
	]
	[
		4
		2
	]
	[
		5
		0
	]
	[
		5
		0
	]
]
pent_major_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		2
		6
	]
	[
		2
		9
	]
	[
		3
		6
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		9
	]
	[
		5
		7
	]
	[
		5
		9
	]
	[
		5
		12
	]
	[
		5
		12
	]
]
pent_minor_pattern = [
	[
		0
		0
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		3
	]
	[
		5
		0
	]
	[
		5
		0
	]
]
pent_minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		10
	]
	[
		5
		12
	]
	[
		5
		12
	]
]
blues_pattern = [
	[
		0
		0
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		1
	]
	[
		1
		2
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		3
	]
	[
		4
		0
	]
	[
		4
		3
	]
	[
		5
		0
	]
]
blues_pattern2 = [
	[
		1
		7
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		8
	]
	[
		2
		9
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		4
		11
	]
	[
		5
		7
	]
	[
		5
		10
	]
	[
		5
		12
	]
]
minor_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		1
	]
	[
		4
		3
	]
]
minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		10
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		8
	]
	[
		5
		10
	]
]
harm_minor_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		1
	]
	[
		4
		4
	]
]
harm_minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		10
	]
	[
		3
		8
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		8
	]
	[
		5
		11
	]
]
phryg_dom_pattern = [
	[
		0
		0
	]
	[
		0
		1
	]
	[
		0
		4
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		3
	]
	[
		3
		1
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		1
	]
	[
		4
		3
	]
]
phryg_dom_pattern2 = [
	[
		1
		7
	]
	[
		1
		8
	]
	[
		1
		11
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		10
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		4
		6
	]
	[
		4
		9
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		8
	]
	[
		5
		10
	]
]
hung_minor_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		1
		1
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		3
	]
	[
		3
		4
	]
	[
		4
		1
	]
	[
		4
		4
	]
]
hung_minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		10
	]
	[
		2
		8
	]
	[
		2
		9
	]
	[
		2
		10
	]
	[
		3
		8
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		8
	]
	[
		4
		11
	]
	[
		5
		7
	]
	[
		5
		8
	]
	[
		5
		11
	]
]
whole_tone_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		4
	]
	[
		1
		1
	]
	[
		1
		3
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		1
	]
	[
		3
		3
	]
	[
		3
		5
	]
	[
		4
		3
	]
	[
		4
		5
	]
]
whole_tone_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		11
	]
	[
		2
		8
	]
	[
		2
		10
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		9
	]
	[
		4
		11
	]
	[
		5
		8
	]
	[
		5
		10
	]
	[
		5
		12
	]
]
dim_whole_pattern = [
	[
		0
		0
	]
	[
		0
		1
	]
	[
		0
		3
	]
	[
		0
		4
	]
	[
		1
		1
	]
	[
		1
		3
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		3
	]
	[
		3
		0
	]
	[
		3
		1
	]
	[
		3
		3
	]
	[
		3
		5
	]
	[
		4
		3
	]
]
dim_whole_pattern2 = [
	[
		1
		7
	]
	[
		1
		8
	]
	[
		1
		10
	]
	[
		1
		11
	]
	[
		2
		8
	]
	[
		2
		10
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		3
		10
	]
	[
		4
		8
	]
	[
		4
		9
	]
	[
		4
		11
	]
	[
		5
		8
	]
	[
		5
		10
	]
]
chromatic_pattern = [
	[
		0
		0
	]
	[
		0
		1
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		0
		4
	]
	[
		1
		0
	]
	[
		1
		1
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		1
		4
	]
	[
		2
		0
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		3
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		1
	]
	[
		3
		2
	]
	[
		3
		3
	]
	[
		4
		0
	]
	[
		4
		1
	]
	[
		4
		2
	]
	[
		4
		3
	]
	[
		4
		4
	]
]
