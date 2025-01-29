0xeac18047 = -1
0xaf8e70d4 = [
	0
	0
	0
	0
	0
]

script 0xfd22d1e7 

	Change 0xeac18047 = ($0xeac18047 + 1)
	SetArrayElement ArrayName = 0xaf8e70d4 globalarray index = $0xeac18047 NewValue = <num>
	0x04d11dea num = <num>
endscript

script 0x88e84c31 
	Change 0xeac18047 = ($0xeac18047 - 1)
	if ($0xeac18047 = -1)
		0x04d11dea \{num = 0}
	else
		0x04d11dea num = ($0xaf8e70d4 [$0xeac18047])
	endif
endscript

script 0x04d11dea 

	getmaxplayers
	i = 1
	begin
	if (<i> <= <num>)
		in_game = 1
	else
		in_game = 0
	endif
	setplayerinfo <i> in_game = <in_game>
	<i> = (<i> + 1)
	repeat <max_players>
endscript
playerinfo = {
	p1 = {
	}
	p2 = {
	}
	p3 = {
	}
	p4 = {
	}
}
band_ids = [
	band1_status
	band2_status
]
band1_status = {
	current_health = 0.0
	star_power_amount = 0.0
	star_power_display_amount = 0.0
	star_power_active = 0
	score = 0.0
	stars = 0
	high_mult = 1.0
	current_mult = 1.0
	high_2p_streak = 0
	high_3p_streak = 0
	high_4p_streak = 0
	projected_song_stars = 0.0
}
band2_status = {
	current_health = 0.0
	star_power_amount = 0.0
	star_power_display_amount = 0.0
	star_power_active = 0
	score = 0.0
	stars = 0
	high_mult = 1.0
	current_mult = 1.0
	high_2p_streak = 0
	high_3p_streak = 0
	high_4p_streak = 0
	projected_song_stars = 0.0
}
player1_status = {
}
player2_status = {
}
player3_status = {
}
player4_status = {
}
player5_status = {
}
player6_status = {
}
player7_status = {
}
player8_status = {
}
player1_defaults = {
	checksum = player1_status
	gamertag = gamertag_1
	controller = 0
	Player = 1
	text = 'p1'
	part = guitar
	character_id = Judy
	band_member = GUITARIST
}
player2_defaults = {
	checksum = player2_status
	gamertag = gamertag_2
	controller = 1
	Player = 2
	text = 'p2'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player3_defaults = {
	checksum = player3_status
	gamertag = gamertag_3
	controller = 2
	Player = 3
	text = 'p3'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player4_defaults = {
	checksum = player4_status
	gamertag = gamertag_4
	controller = 3
	Player = 4
	text = 'p4'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player5_defaults = {
	checksum = player5_status
	gamertag = gamertag_5
	controller = 3
	Player = 5
	text = 'p5'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player6_defaults = {
	checksum = player6_status
	gamertag = gamertag_6
	controller = 3
	Player = 6
	text = 'p6'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player7_defaults = {
	checksum = player7_status
	gamertag = gamertag_7
	controller = 3
	Player = 7
	text = 'p7'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player8_defaults = {
	checksum = player8_status
	gamertag = gamertag_8
	controller = 3
	Player = 8
	text = 'p8'
	part = guitar
	character_id = Judy
	band_member = BASSIST
}
player_shared_defaults = {
	difficulty = easy
	double_kick_drum = 0
	fret_anims = fret_anims_rocker
	star_power_usable = 1
	star_power_amount = 0.0
	star_tilt_threshold = -1.0
	star_power_debug_mode = 0
	playline_song_measure_time = 0
	star_power_used = 0
	star_power_use_count = 0
	current_run = 0
	resting_whammy_position = -0.76
	bot_play = 0
	bot_pattern = 0
	bot_strum = 0
	bot_star_power = 0
	bot_original_controller = -1
	original_character_id = Axel
	lefty_flip = 0
	vocals_highway_view = scrolling
	use_tilt_for_starpower = 1
	enable_touch_strip = 1
	lefthanded_gems = 0
	lefthanded_button_ups = 0
	lefthanded_gems_flip_save = 0
	lefthanded_button_ups_flip_save = 0
	current_song_gem_array = None
	current_song_fretbar_array = None
	current_song_star_array = None
	current_drum_unmute_array = None
	current_drum_fill_array = None
	current_song_tapping_array = None
	current_song_section_array = None
	current_song_whammy_matching_array = None
	current_star_array_entry = 0
	current_song_beat_time = 0
	playline_song_beat_time = 0
	current_song_measure_time = 0
	current_detailedstats_array = None
	current_detailedstats_max_array = None
	current_detailedstats_array_entry = 0
	time_in_lead = 0.0
	current_tapping_creation_entry = 0
	current_tapping_input_entry = 0
	hammer_on_tolerance = 0.0
	check_time_early = 0.0
	check_time_late = 0.0
	whammy_on = 0
	star_power_sequence = 0
	star_power_note_count = 0
	whammy_control = 0.0
	whammy_every_note = 0
	slide_wah_every_note = 0
	has_held_notes = 0
	score = 0.0
	notes_hit = 0
	total_notes = 0
	best_run = 0
	highest_multiplier = 1
	beginning_run = 0
	max_notes = 0
	base_score = 0.0
	stars = 0
	sp_phrases_hit = 0
	sp_phrases_total = 0
	sim_bot_score = 0.0
	in_band_streak = 0
	guitar_performance_score = 0
	vocal_streak_phrases = 0
	vocal_total_phrases = 0
	vocal_phrase_quality = 0.0
	vocal_phrase_max_qual = 0.0
	vocals_sp_clap = 1
	mic_type = None
	mic_connected = connected
	scroll_time = 5.0
	game_speed = 1.5
	highway_speed = 0.0
	highway_texture = highway_axel
	Hyperspeed = 1.0
	four_lane_highway = -1
	extended_sustain_percent_hold = 0.0
	guitar_volume = 100
	last_guitar_volume = 100
	last_faceoff_note = 100
	drum_volume1 = 100
	drum_volume2 = 100
	drum_volume3 = 100
	drum_volume4 = 100
	net_whammy = 0.0
	is_local_client = 1
	highway_layout = default_highway
	net_id_first = 0
	net_id_second = 0
	controller_type = controller
	net_obj_id = -1
	net_difficulty = easy
	net_venue = load_z_frathouse
	team = 0
	party_id = -1
	individual_band_score = 0.0
	hud_parent = NULL
	message_parent = NULL
	highway_position = NULL
	current_health = 0.0
	health_invincible_time = 0.0
	lowest_health = 2.0
	cash = 0
	new_cash = 0
	cash_rank_up = 0
	career_earnings = 0
	FourX_FingerFXID01 = JOW_NIL
	FourX_FingerFXID02 = JOW_NIL
	FourX_FingerFXID03 = JOW_NIL
	FourX_FingerFXID04 = JOW_NIL
	button_checker_up_time = -1.0
	last_playline_song_beat_time = 1.0
	last_playline_song_beat_change_time = 1.0
	jam_instrument = -1
	projected_song_stars = 0.0
}
player1_device = 0
p1_ready = 0
p1_last_song_detailed_stats = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
p1_last_song_detailed_stats_max = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
player2_device = 1
p2_ready = 0
p2_last_song_detailed_stats = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
p2_last_song_detailed_stats_max = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
player3_device = 2
p3_ready = 0
p3_last_song_detailed_stats = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
p3_last_song_detailed_stats_max = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
player4_device = 3
p4_ready = 0
p4_last_song_detailed_stats = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
p4_last_song_detailed_stats_max = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
gig_detailed_stats = [
	[
	]
	[
	]
	[
	]
	[
	]
]
gig_detailed_stats_band = {
}
song_stats_backup = [
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
]
song_stats_backup_band = [
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
]
