ghmix_initial_snap = 6
ghmix_pattern_bpm = 120
musicstudio_time_before_pulse = 5.0
musicstudio_saved_patterns_max = 20
ghtunes_version = 7
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
		layers = [
			{
				texture = `tex/models/characters/skater_male/decals/cag_graphics044`
				flags = 3
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
