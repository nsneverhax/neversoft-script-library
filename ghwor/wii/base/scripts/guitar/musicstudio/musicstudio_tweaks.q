ghmix_initial_snap = 6
ghmix_pattern_bpm = 120
musicstudio_time_before_pulse = 5.0
musicstudio_saved_patterns_max = 50
ghtunes_version = 7
jam_song_version = 10
jam_song_version_dummy = 0
jam_max_user_songs = 0
jam_max_downloaded_songs = 0

script set_plat_jam_maximums 
	if isps3
		Change \{jam_max_user_songs = 40}
		Change \{jam_max_downloaded_songs = 50}
	elseif isngc
		Change \{jam_max_user_songs = 20}
	else
		Change \{jam_max_user_songs = 50}
		Change \{jam_max_downloaded_songs = 100}
	endif
endscript
jam_midi_input_killswitch = 1
num_jam_players = 4
gemarraysize = 5000
starsize = 20
fretbarsize = 2750
markerssize = 50
arraylistsize = 200
drumnotessize = 2750
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
		input_func = jam_input_rhythm
		Color = [
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
		input_func = jam_input_lead
		Color = [
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
		input_func = jam_input_bass_recording
		Color = [
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
		input_func = jam_input_drums
		Color = [
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
		input_func = jam_input_melody
		Color = [
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
		input_func = jam_input_melody
		Color = [
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
		layers = [
			{
				texture_id = cag_graphics075
				texture_name = qs(0x2f3472fb)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 104
				pos_y = 116
				rot = 330
				scale_x = 0.3
				scale_y = 0.3
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 0
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 48
				pos_y = 8
				rot = 0
				scale_x = 0.4
				scale_y = 0.4
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 1
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 8
				pos_y = 8
				rot = 0
				scale_x = 0.4
				scale_y = 0.4
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 2
			}
			{
				texture_id = cag_icon_wing007
				texture_name = qs(0xf46b197f)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = -8
				pos_y = 108
				rot = 0
				scale_x = 0.6
				scale_y = 0.6
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 3
			}
			{
				texture_id = gh3_bunny
				texture_name = qs(0x7570f345)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 4
			}
			{
				texture_id = cag_icon_wing007
				texture_name = qs(0xf46b197f)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 120
				pos_y = 124
				rot = 0
				scale_x = 0.7
				scale_y = 0.7
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 5
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 104
				pos_y = 164
				rot = 330
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = yellow_1guitar
				layer_id = 6
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 48
				pos_y = 164
				rot = 0
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = yellow_1guitar
				layer_id = 7
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = -12
				pos_y = 156
				rot = 15
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = yellow_1guitar
				layer_id = 8
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = -28
				pos_y = -4
				rot = 0
				scale_x = 0.5
				scale_y = 0.5
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 9
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 152
				pos_y = -4
				rot = 0
				scale_x = 0.5
				scale_y = 0.5
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 10
			}
			{
				texture_id = cag_graphics031
				texture_name = qs(0x1773a510)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = -48
				rot = 135
				scale_x = 0.7
				scale_y = 0.7
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 11
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				layer_id = 12
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 13
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 14
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 15
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 16
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 17
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 18
			}
			{
				texture_id = None
				texture_name = qs(0x00000000)
				string = qs(0x00000000)
				canvas_id = None
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				Color = None
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 19
			}
		]
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
		LockTo = World
		Pos = (0.507738, 1.892075, 16.786266)
		Quat = (0.02289, -0.948689, 0.070403)
		FOV = 72.0
	}
	jam_song_select = {
		LockTo = World
		Pos = (-2.208166, 1.7454499, 13.966361)
		Quat = (0.001762, -0.99729997, 0.025651002)
		FOV = 72.0
	}
	jam_ghmix_song_select = {
		LockTo = World
		Pos = (-2.130476, 1.888687, 14.1753235)
		Quat = (0.028432999, -0.78749603, 0.036445998)
		FOV = 72.0
	}
	jam_band = {
		LockTo = World
		Pos = (-0.51169395, 1.7524859, 9.7445545)
		Quat = (0.001013, 0.9969439, -0.076838)
		FOV = 72.0
	}
	jam_publish = {
		LockTo = World
		Pos = (-0.536864, 2.1043458, 15.148574)
		Quat = (0.0052940003, 0.02768, -0.000218)
		FOV = 72.0
	}
	jam_tutorials = {
		LockTo = World
		Pos = (-3.6637907, 1.6212071, 12.313894)
		Quat = (0.020512, -0.966841, 0.076533005)
		FOV = 72.0
	}
	jam_advanced_recording = {
		LockTo = World
		Pos = (-3.9595852, 1.8264489, 13.100554)
		Quat = (0.011898, -0.70952004, 0.0119940005)
		FOV = 72.0
	}
	jam_gh_tunes = {
		LockTo = World
		Pos = (-3.222695, 1.3334249, 11.540949)
		Quat = (0.019791, 0.941012, -0.056126006)
		FOV = 72.0
	}
	jam_song_wizard = {
		LockTo = World
		Pos = (-2.3648896, 1.668748, 12.441849)
		Quat = (0.002055, 0.98574096, -0.167789)
		FOV = 72.0
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
	Name = jamrhythmpitchshift
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
	Name = jamleadpitchshift
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
	Name = jambasspitchshift
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
	Name = jammelodypitchshift
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
					Type = 4096
					time = 4
				}
				{
					Type = 256
					time = 4
				}
				{
					Type = 16
					time = 4
				}
				{
					Type = 1
					time = 4
				}
				{
					Type = 65536
					time = 4
				}
				{
					Type = 1048576
					time = 1
				}
			]
			chord_filter = standard_drum_filter
		}
		medium = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 16
				}
				{
					Type = 256
					time = 8
				}
				{
					Type = 16
					time = 4
				}
				{
					Type = 1
					time = 8
				}
				{
					Type = 65536
					time = 4
				}
				{
					Type = 1048576
					time = 0.5
				}
			]
			chord_filter = standard_drum_filter
		}
		hard = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 32
				}
				{
					Type = 256
					time = 16
				}
				{
					Type = 16
					time = 8
				}
				{
					Type = 1
					time = 16
				}
				{
					Type = 65536
					time = 8
				}
				{
					Type = 1048576
					time = 4
				}
			]
			chord_filter = standard_drum_filter
		}
		expert = {
			filter_note_time_array = [
				{
					Type = 4096
					time = 32
				}
				{
					Type = 256
					time = 32
				}
				{
					Type = 16
					time = 32
				}
				{
					Type = 1
					time = 32
				}
				{
					Type = 65536
					time = 32
				}
				{
					Type = 1048576
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
