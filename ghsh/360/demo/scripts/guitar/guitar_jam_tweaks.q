ghtunes_version = 3
jam_song_version = 10
jam_song_version_valid = 0
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
jam_song_assets = [
	{
		display_name = qs(0x8ad5732e)
		filename = qs(0xa427d759)
		artist = qs(0xd2b3fbdf)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs(0x1b0cf59b)
		filename = qs(0xc7453583)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs(0x0fa710c8)
		filename = qs(0x793cfc0c)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xa274e68a)
		filename = qs(0xf4b06a4e)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x850f62c1)
		filename = qs(0x9e5a8dd1)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x1bb0d29c)
		filename = qs(0xab144925)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x8dc760e8)
		filename = qs(0x4526efa8)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x32ac075e)
		filename = qs(0x34cbe855)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x65a651e4)
		filename = qs(0x3f371a26)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x5c5454b0)
		filename = qs(0x11de0040)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xa8fe5500)
		filename = qs(0x5b2f6353)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xe6138a7b)
		filename = qs(0x635a6e88)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xa6f5864a)
		filename = qs(0x5e04b54e)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x154ebfe7)
		filename = qs(0x574c9df0)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xc76adf02)
		filename = qs(0x29aef64e)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x3cd556bf)
		filename = qs(0x6a6b832b)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x68f22025)
		filename = qs(0x7c831c03)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0xc03a1deb)
		filename = qs(0x2e1b2769)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x9f8d7525)
		filename = qs(0x342047a6)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x64c77460)
		filename = qs(0xeb45d1b8)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x0f2b98c6)
		filename = qs(0x0f2b98c6)
		artist = qs(0x97a22785)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs(0x1e7dec68)
		filename = qs(0xe6561adf)
		artist = qs(0x508c3746)
		no_qp
		playback_track1 = -1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs(0x3550bfab)
		filename = qs(0xcd7b491c)
		artist = qs(0x508c3746)
		no_qp
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 0
		playback_track_vocals = 1
	}
]
num_jam_players = 4
gemarraysize = 1201
starsize = 20
fretbarsize = 1000
markerssize = 50
arraylistsize = 200
jam_fade_time = 0.2
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
jam_playback_instrument = 0
jam_line6_inuse = -1
jam_falling_gem_limit = 195
jam_num_falling_gems = 0
humanizer_strength = 0.02
jam_select_area_wait = 10
jam_skip_wait = 15
jam_current_track = 0
jam_tracks = [
	{
		id = rhythm
		gem_array = editable_song_expert
		in_game_gem_array = jamsession_song_in_game
		name_text = qs(0x1f0659c1)
		alt_text = qs(0xdfa3a913)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_rhythm
		color = [
			255
			100
			100
			255
		]
	}
	{
		id = lead
		gem_array = editable_song_rhythm_expert
		in_game_gem_array = jamsession_song_rhythm_in_game
		name_text = qs(0x0cc7d9b2)
		alt_text = qs(0x15d22c2f)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_lead
		color = [
			100
			255
			100
			255
		]
	}
	{
		id = bass
		gem_array = editable_song_guitarcoop_expert
		in_game_gem_array = jamsession_song_guitarcoop_in_game
		name_text = qs(0x7d4f9214)
		alt_text = qs(0x7d4f9214)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_bass_recording
		color = [
			100
			100
			255
			255
		]
	}
	{
		id = drum
		gem_array = editable_song_drum_expert
		in_game_gem_array = jamsession_song_drum_in_game
		name_text = qs(0x388cd3db)
		alt_text = qs(0x388cd3db)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_drums
		color = [
			100
			255
			255
			255
		]
	}
	{
		id = melody
		gem_array = editable_song_rhythmcoop_expert
		in_game_gem_array = jamsession_song_rhythmcoop_in_game
		name_text = qs(0x58ce03d1)
		alt_text = qs(0x58ce03d1)
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_melody
		color = [
			155
			10
			200
			255
		]
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
		base_tex = `tex\models\characters\global\global_blank_logo.dds`
		material = band_logo_primary
		layers = [
			{
				texture = `tex/models/characters/skater_male/decals/cag_graphics034.img`
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
		pos = (6.8088183, 0.69271696, 17.46861)
		quat = (0.018455999, -0.93279594, 0.048289)
		fov = 72.0
	}
	jam_song_select = {
		lockto = world
		pos = (5.4437647, 0.503254, 14.515142)
		quat = (0.0072620003, -0.95180696, 0.022633001)
		fov = 82.0
	}
	jam_ghmix_song_select = {
		lockto = world
		pos = (3.547465, 0.88637495, 15.532417)
		quat = (3.6999998E-05, -0.78921694, 6E-05)
		fov = 72.0
	}
	jam_band = {
		lockto = world
		pos = (4.023829, 1.503876, 7.939243)
		quat = (0.02543, -0.957867, 0.089661)
		fov = 72.0
	}
	jam_publish = {
		lockto = world
		pos = (3.547465, 0.88637495, 15.532417)
		quat = (3.6999998E-05, -0.78921694, 6E-05)
		fov = 72.0
	}
	jam_tutorials = {
		lockto = world
		pos = (3.1381366, 0.778926, 15.54697)
		quat = (-0.0008539999, -0.95400697, -0.006998)
		fov = 55.0
	}
	jam_advanced_recording = {
		lockto = world
		pos = (3.547465, 0.88637495, 15.532417)
		quat = (3.6999998E-05, -0.78921694, 6E-05)
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
		pos = (4.629108, 1.017684, 14.313607)
		quat = (0.006964, -0.96487796, 0.26133898)
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
		special_up = trk_b_hrm_s1_f12
		special_down = trk_b_hrm_s1_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 65552
	}
	{
		special_up = trk_b_hrm_s2_f12
		special_down = trk_b_hrm_s2_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 4097
	}
	{
		special_up = trk_b_hrm_s3_f12
		special_down = trk_b_hrm_s3_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 65537
	}
	{
		special_up = trk_b_stringmute_up
		special_down = trk_b_stringmute_down
		note_txt = qs(0x74dfd1b0)
		pattern = 69904
	}
	{
		special_up = trk_b_divebomb_down
		special_down = trk_b_divebomb_down
		note_txt = qs(0x74dfd1b0)
		pattern = 4369
	}
	{
		special_up = trk_b_hrm_s4_f12
		special_down = trk_b_hrm_s4_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 69889
	}
	{
		special_up = trk_b_hrm_s5_f12
		special_down = trk_b_hrm_s5_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 65809
	}
	{
		special_up = trk_b_hrm_s6_f12
		special_down = trk_b_hrm_s6_f12
		note_txt = qs(0x74dfd1b0)
		pattern = 69633
	}
	{
		special_up = trk_b_pkslideslow
		special_down = trk_b_pkslideslow
		note_txt = qs(0x74dfd1b0)
		pattern = 65553
	}
	{
		special_up = trk_b_pkslidefast
		special_down = trk_b_pkslidefast
		note_txt = qs(0x74dfd1b0)
		pattern = 69649
	}
	{
		special_up = trk_b_fingerslide
		special_down = trk_b_fingerslide
		note_txt = qs(0x74dfd1b0)
		pattern = 69905
	}
	{
		special_up = trk_b_divebomb_updown
		special_down = trk_b_divebomb_updown
		note_txt = qs(0x74dfd1b0)
		pattern = 65793
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
jam_current_melody_kit = 0
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
jamsession_lyrics = [
]
jamsession_vocals_phrases = [
	0
	3
	1000
	3
]
jamsession_vocals_freeform = [
]
jam_mic_id = 5
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
		name = qs(0xbc536ba1)
	}
	{
		pattern = pent_major_pattern
		pattern2 = pent_major_pattern2
		pattern_rhythm = pent_major_pattern_rhythm
		chord_pattern = pent_major_chord_pattern
		name = qs(0x34d995a1)
	}
	{
		pattern = pent_minor_pattern
		pattern2 = pent_minor_pattern2
		pattern_rhythm = pent_minor_pattern_rhythm
		chord_pattern = pent_minor_chord_pattern
		name = qs(0xe0e8d926)
	}
	{
		pattern = blues_pattern
		pattern2 = blues_pattern2
		pattern_rhythm = blues_pattern_rhythm
		chord_pattern = blues_chord_pattern
		name = qs(0x527b4496)
	}
	{
		pattern = minor_pattern
		pattern2 = minor_pattern2
		pattern_rhythm = minor_pattern_rhythm
		chord_pattern = minor_chord_pattern
		name = qs(0xf4273202)
	}
	{
		pattern = chromatic_pattern
		pattern_rhythm = chromatic_pattern_rhythm
		chord_pattern = chromatic_chord_pattern
		name = qs(0x736feb36)
		chromatic
	}
	{
		pattern = null
		pattern_rhythm = null
		chord_pattern = custom_chord_pattern
		name = qs(0xd2cd3957)
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
	6
	1
	6
	9
	6
	1
	6
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
		-1
		-1
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
