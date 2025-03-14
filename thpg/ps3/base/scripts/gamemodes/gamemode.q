mode_info = [
	{
		name = "Free Skate"
		checksum = freeskate
		definition = mode_freeskate
	}
	{
		name = "2 Player Free Skate"
		checksum = freeskate2p
		definition = mode_freeskate2p
	}
	{
		name = "Single Session"
		checksum = singlesession
		definition = mode_singlesession
	}
	{
		name = "Trick Attack"
		checksum = trickattack
		definition = mode_trickattack
	}
	{
		name = "Scavenger Hunt"
		checksum = scavengerhunt
		definition = mode_scavengerhunt
	}
	{
		name = "Score Challenge"
		checksum = scorechallenge
		definition = mode_scorechallenge
	}
	{
		name = "Combo Mambo"
		checksum = combomambo
		definition = mode_combomambo
	}
	{
		name = "Combo Challenge"
		checksum = combochallenge
		definition = mode_combochallenge
	}
	{
		name = "Graffiti"
		checksum = graffiti
		definition = mode_graffiti
	}
	{
		name = "Slap!"
		checksum = slap
		definition = mode_slap
	}
	{
		name = "King of the Hill"
		checksum = king
		definition = mode_king
	}
	{
		name = "Pot O' Gold"
		checksum = gold
		definition = mode_gold
	}
	{
		name = "Horse"
		checksum = horse
		definition = mode_horse
	}
	{
		name = "Net Horse"
		checksum = net_horse
		definition = mode_net_horse
	}
	{
		name = "Net Line"
		checksum = net_line
		definition = mode_net_line
	}
	{
		name = "Net Nail"
		checksum = net_nail
		definition = mode_net_nail
	}
	{
		name = "Career"
		checksum = career
		definition = mode_career
	}
	{
		name = "Net"
		checksum = net
		definition = mode_net
	}
	{
		name = "Lobby"
		checksum = netlobby
		definition = mode_netlobby
	}
	{
		name = "Trick Attack"
		checksum = nettrickattack
		definition = mode_nettrickattack
	}
	{
		name = "Scavenger Hunt"
		checksum = netscavengerhunt
		definition = mode_netscavengerhunt
	}
	{
		name = "Elimiskate"
		checksum = netelimiskate
		definition = mode_netelimiskate
	}
	{
		name = "Score Challenge"
		checksum = netscorechallenge
		definition = mode_netscorechallenge
	}
	{
		name = "Combo Mambo"
		checksum = netcombomambo
		definition = mode_netcombomambo
	}
	{
		name = "Combo Challenge"
		checksum = netcombochallenge
		definition = mode_netcombochallenge
	}
	{
		name = "Graffiti"
		checksum = netgraffiti
		definition = mode_netgraffiti
	}
	{
		name = "Goal Attack"
		checksum = netgoalattack
		definition = mode_netgoalattack
	}
	{
		name = "Slap!"
		checksum = netslap
		definition = mode_netslap
	}
	{
		name = "King of the Hill"
		checksum = netking
		definition = mode_netking
	}
	{
		name = "Pot O' Gold"
		checksum = netgold
		definition = mode_netgold
	}
	{
		name = "Capture the Flag"
		checksum = netctf
		definition = mode_netctf
	}
	{
		name = "FireFight"
		checksum = firefight
		definition = mode_firefight
	}
	{
		name = "FireFight"
		checksum = netfirefight
		definition = mode_netfirefight
	}
	{
		name = "WallGame"
		checksum = netwalls
		definition = mode_netwalls
	}
	{
		name = "Classic Mode"
		checksum = classic
		definition = mode_classic
	}
	{
		name = "Co-Op Mode"
		checksum = coop
		definition = mode_coop
	}
	{
		name = "Mocap Viewer"
		checksum = mocap
		definition = mode_mocap
	}
]
mode_freeskate = {
	name = freeskate
	initial_players = 1
	max_players = 2
	time_limit_type = fixed
	default_time_limit = 0
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_score_challenge = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_net = 0
	is_freeskate = 1
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_freeskate2p = {
	name = freeskate
	initial_players = 2
	max_players = 2
	time_limit_type = fixed
	default_time_limit = 0
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 1
	screenmode = splitscreen
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_net = 0
	is_freeskate = 1
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_singlesession = {
	name = singlesession
	initial_players = 1
	max_players = 1
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 1
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_career = {
	name = career
	initial_players = 1
	max_players = 1
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 1
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_net = {
	name = net
	initial_players = 1
	max_players = 1
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_trickattack = {
	name = trickattack
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 1
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_nettrickattack = {
	name = nettrickattack
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 1
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_net_line = 0
	is_net_nail = 0
	is_ctf = 0
	is_firefight = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_elimiskate = {
	name = elimiskate
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = elimination
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	round = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 1
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netelimiskate = {
	name = netelimiskate
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = elimination
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	round = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trickattack = 0
	is_elimiskate = 1
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_scorechallenge = {
	name = scorechallenge
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = target_score
			score = 10000
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 1
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netscorechallenge = {
	name = netscorechallenge
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = target_score
			score = 10000
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 1
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_combochallenge = {
	name = combochallenge
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_best_combo = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_combo_challenge = 1
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netcombochallenge = {
	name = netcombochallenge
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_best_combo = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_combo_challenge = 1
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_combomambo = {
	name = combomambo
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_best_combo = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 1
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netcombomambo = {
	name = netcombomambo
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_best_combo = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 1
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_graffiti = {
	name = graffiti
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 1
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	team_graffiti_mode = graffiti_individual_scoring
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netgraffiti = {
	name = netgraffiti
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 1
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	team_graffiti_mode = graffiti_team_scoring
	score_mode = points_scoring
	target_tags = tags_10
}
mode_scavengerhunt = {
	name = scavengerhunt
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = collect_all_objects
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_scavenger_hunt = 1
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netscavengerhunt = {
	name = netscavengerhunt
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 0
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = collect_all_objects
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_scavenger_hunt = 1
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netgoalattack = {
	name = netgoalattack
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = complete_goals
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 1
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	goals_mode = goals_classic
	score_mode = points_scoring
	target_tags = tags_10
}
mode_slap = {
	name = slap
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netslap = {
	name = netslap
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_firefight = {
	name = firefight
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = last_man_standing
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 1
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netfirefight = {
	name = netfirefight
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = last_man_standing
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 1
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netking = {
	name = netking
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = target_score
			score = 10000
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 1
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 0
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_king = {
	name = king
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 0
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = target_score
			score = 120000
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 1
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netgold = {
	name = netgold
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_rangold_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 1
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_gold = {
	name = gold
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = splitscreen
	victory_conditions = [
		{
			type = highest_score
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_rangold_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 1
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netctf = {
	name = netctf
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 120
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_ctf = 1
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_mocap = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_netwalls = {
	name = netwalls
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 90
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
		{
			type = last_man_standing
		}
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 1
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_net_line = {
	name = net_line
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 10
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 1
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_net_nail = {
	name = net_nail
	initial_players = 1
	max_players = 8
	time_limit_type = config
	default_time_limit = 10
	victory_condition_type = config
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	victory_conditions = [
	]
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 1
	stop_at_zero = 1
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 1
	is_mocap = 0
	show_leader_messages = 1
	timer_beeps = 1
	num_teams = 0
	is_net = 1
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
targetscorearray = [
	{
		type = target_score
		score = 10000
	}
]
highestscorearray = [
	{
		type = highest_score
	}
]
mode_netlobby = {
	name = netlobby
	initial_players = 1
	max_players = 8
	time_limit_type = fixed
	default_time_limit = 0
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 1
	screenmode = single
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_freeskate = 0
	is_net = 1
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_horse = {
	name = horse
	initial_players = 2
	max_players = 2
	time_limit_type = config
	default_time_limit = 10
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 0
	is_lobby = 0
	screenmode = horse
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 1
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_freeskate = 0
	is_net = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_classic = {
	name = classic
	initial_players = 1
	max_players = 1
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 1
	is_coop = 0
	has_timer = 1
	score_mode = points_scoring
	target_tags = tags_10
}
mode_coop = {
	name = classic
	initial_players = 2
	max_players = 2
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 1
	track_trick_score = 1
	degrade_score = 1
	is_lobby = 0
	screenmode = splitscreen
	should_run_intro_camera = 1
	should_run_intro_camera_noncd = 1
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 0
	show_leader_messages = 0
	timer_beeps = 1
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 1
	is_coop = 1
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}
mode_mocap = {
	name = mocap
	initial_players = 1
	max_players = 1
	time_limit_type = fixed
	default_time_limit = 120
	victory_condition_type = fixed
	score_frozen = 0
	accumulate_score = 0
	track_trick_score = 0
	degrade_score = 0
	is_lobby = 0
	screenmode = single
	should_run_intro_camera = 0
	should_run_intro_camera_noncd = 0
	show_ranking_screen = 0
	stop_at_zero = 0
	is_career = 0
	is_singlesession = 0
	should_modulate_color = 0
	is_horse = 0
	is_king = 0
	is_gold = 0
	is_trick_attack = 0
	is_elimiskate = 0
	is_score_challenge = 0
	is_combo_mambo = 0
	is_goal_attack = 0
	is_ctf = 0
	is_firefight = 0
	is_wallgame = 0
	is_net_horse = 0
	is_net_line = 0
	is_net_nail = 0
	is_mocap = 1
	show_leader_messages = 0
	timer_beeps = 0
	num_teams = 0
	is_net = 0
	is_freeskate = 0
	is_classic = 0
	is_coop = 0
	has_timer = 0
	score_mode = points_scoring
	target_tags = tags_10
}

script force_close_rankings 
	printf "************************* FORCE CLOSING RANKINGS ******************************"
	speech_box_exit
	restore_start_key_binding
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	setbuttoneventmappings unblock_menu_input
	if objectexists id = rankings_list_anchor
		runscriptonscreenelement id = rankings_anchor menu_offscreen
		if gameisover
			if NOT gotparam dont_retry
				do_backend_retry
			endif
		endif
	endif
endscript

script close_rankings 
	printf "************************* CLOSING RANKINGS ******************************"
	speech_box_exit
	restore_start_key_binding
	if innetgame
		if objectexists id = skater
			if NOT isobserving
				skater :netenableplayerinput
			endif
		endif
	endif
	if objectexists id = rankings_anchor
		destroyscreenelement id = rankings_anchor
		setscreenelementprops id = root_window tags = {menu_state = off}
	endif
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	if gamemodeequals is_singlesession
		pause_game_and_create_pause_menu no_exit
	else
		if NOT gamemodeequals is_lobby
			if insplitscreengame
				ui_change_state state = UIstate_2player_create_game
			else
				setgametype netlobby
				setcurrentgametype
				if NOT NetworkGamePending
					printf "do_backend_retry"
					do_backend_retry
				endif
			endif
		endif
	endif
endscript

script wait_then_force_close_rankings 
	wait \{5
		seconds}
	force_close_rankings
	do_backend_retry
endscript

script wait_then_create_rankings 
	begin
	printf "wait_then_create_rankings - waiting for CalculateFinalScores..."
	if CalculateFinalScores
		printf "wait_then_create_rankings - CalculateFinalScores returned true."
		break
	endif
	wait 1 gameframe
	repeat
	create_rankings <...>
	if NOT innetgame
		report_stats final
	endif
endscript
just_finished_net_game = 0

script create_rankings score_title_text = "SCORE"
	if NetRoundFunc func = in_round_mode
		net_rounds_prepare_rankings
		return
	endif
	change just_finished_net_game = 1
	if OnServer
		MarkGameOver
	endif
	kill_panel_message_if_it_exists id = mp_observer_text
	if screenelementexists id = ped_speech_dialog
		destroyscreenelement id = ped_speech_dialog
	endif
	printf "create_rankings"
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if objectexists id = edit_tricks_sub_menu_anchor
		destroyscreenelement id = edit_tricks_sub_menu_anchor
	endif
	if objectexists id = dialog_box_anchor
		close_rankings
		return
	endif
	if objectexists id = quit_dialog_anchor
		close_rankings
		return
	endif
	pause_trick_text
	unpause_game_and_destroy_pause_menu
	pausegame
	hide_panel_stuff
	printf "****************** CREATING RANKINGS!!!! ********************"
	on_rgba = [128 123 20 255]
	off_rgba = [128 128 128 240]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = rankings_anchor
		pos = (30.0, 0.0)
	}
	assignalias id = rankings_anchor alias = current_menu_anchor
	createscreenelement {
		type = containerelement
		parent = rankings_anchor
		id = player_list_anchor
	}
	createscreenelement {
		type = vmenu
		parent = player_list_anchor
		id = player_list_menu
		font = text_a1
		just = [left top]
		pos = (105.0, 100.0)
		internal_just = [left top]
		event_handlers = [
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose close_rankings}
		]
	}
	assignalias id = player_list_menu alias = current_menu
	extra_z = 15
	bg_color = ($pause_color_scheme.bg_color)
	menu_bg_pos = (10.0, -40.0)
	menu_bg_scale = (2.0, 0.3)
	basepos = (0.0, 0.0)
	createscreenelement {
		type = containerelement
		id = player_rankings_bg_container
		parent = player_list_menu
		local_id = menu_bg_container
		just = [left top]
	}
	<menu_bg_container> = <id>
	bg_dims = (400.0, 96.0)
	createscreenelement {
		type = containerelement
		parent = player_list_menu
		dims = (256.0, 30.0)
		not_focusable
	}
	<title_cont_id> = <id>
	createscreenelement {
		type = textelement
		parent = <title_cont_id>
		font = text_a1
		text = "RANKINGS"
		pos = (20.0, 2.0)
		just = [left top]
		scale = 0.5
		rgba = ($net_rounds_round_list_entry_color)
		not_focusable
		z_priority = (<extra_z> + 5)
	}
	<height> = 30
	createscreenelement {
		parent = <title_cont_id>
		type = spriteelement
		texture = cap_whitenoise
		pos = ((0.0, -2.0) + ((0.5, 0.0) * (<bg_dims>.(1.0, 0.0))) + ((0.0, 0.5) * <height>))
		just = [center center]
		rgba = [220 220 220 220]
		z_priority = -49
		alpha = 0.5
	}
	scale_element_to_size {
		id = <id>
		target_height = <height>
		target_width = (<bg_dims>.(1.0, 0.0))
	}
	createscreenelement {
		parent = <title_cont_id>
		type = spriteelement
		texture = menu_highlight
		pos = ((0.0, -10.0) + ((0.5, 0.0) * (<bg_dims>.(1.0, 0.0))))
		just = [center top]
		rgba = [0 0 0 255]
		alpha = 1
		z_priority = -51
		alpha = 0.75
	}
	scale_element_to_size {
		id = <id>
		target_height = (<height> * 3.5)
		target_width = (<bg_dims>.(1.0, 0.0))
	}
	createscreenelement {
		parent = <title_cont_id>
		type = spriteelement
		texture = menu_highlight
		pos = ((0.0, -2.0) + ((0.5, 0.0) * (<bg_dims>.(1.0, 0.0))) + ((0.0, 0.5) * <height>))
		just = [center center]
		rgba = ($goal_generic_ui_scheme.main)
		alpha = 1
		z_priority = -50
		alpha = 0.5
	}
	scale_element_to_size {
		id = <id>
		target_height = <height>
		target_width = (<bg_dims>.(1.0, 0.0))
	}
	createscreenelement {
		type = containerelement
		parent = rankings_anchor
		id = rankings_list_anchor
	}
	createscreenelement {
		type = vmenu
		parent = rankings_list_anchor
		id = rankings_list_menu
		just = [left top]
		pos = (345.0, 102.0)
		internal_just = [left top]
	}
	createscreenelement {
		type = containerelement
		parent = rankings_list_menu
		dims = (205.0, 30.0)
		not_focusable
	}
	createscreenelement {
		type = textelement
		parent = <id>
		font = text_a1
		text = <score_title_text>
		pos = (115.0, 0.0)
		scale = 0.5
		just = [right top]
		rgba = ($net_rounds_round_list_entry_color)
		not_focusable
		z_priority = (<extra_z> + 5)
	}
	kill_start_key_binding
	FillRankingScreen
	create_helper_text {
		helper_text_elements = [
			{text = "\\m0 Continue"}
		]
	}
	runscriptonscreenelement id = current_menu_anchor dialog_box_delay_input params = {delay_input_time = 2000}
	runscriptonscreenelement id = current_menu_anchor menu_onscreen
	soundevent event = Online_Generic_You_Took_The_Lead_SFX
	gman_deactivateallgoals
	gman_setcanstartgoal 0
endscript

script server_choose_game 
	do_actual_pause
	set_pause_menu_allow_continue
	xboxlive_dialog_box {
		title = "HOST MENU"
		text = "Choose game option..."
		buttons = [
			{text = "Launch" pad_choose_script = server_choose_launch}
			{text = "Change Game Type" pad_choose_script = server_choose_change_gametype}
			{text = "Free Skate" pad_choose_script = server_choose_freeskate}
		]
		no_bg
	}
endscript

script server_choose_freeskate 
	dialog_box_exit
	do_actual_unpause
endscript

script server_choose_change_gametype 
	dialog_box_exit
	ui_change_state \{state = UIstate_net_gametype}
endscript

script server_choose_launch 
	dialog_box_exit
	chosen_host_game
endscript

script player_menu_add_item font = text_a1
	printf "player_menu_add_item 2"
	on_rgba = [128 123 20 255]
	setscreenelementlock id = <parent> off
	if gotparam team_score
		<text_just> = [left top]
		<text_pos> = (20.0, 0.0)
		<container_dims> = (256.0, 24.0)
		<bg_bar_pos> = (0.0, 0.0)
		<end_cap_scale> = (1.0, 5.0)
	else
		<text_just> = [left top]
		<text_pos> = (20.0, 0.0)
		<container_dims> = (256.0, 21.0)
		<bg_bar_pos> = (0.0, 0.0)
		<end_cap_scale> = (1.0, 5.25)
	endif
	createscreenelement {
		type = containerelement
		parent = player_list_menu
		dims = (256.0, 21.0)
		not_focusable
	}
	<container_id> = <id>
	extra_z = 15
	createscreenelement {
		type = textelement
		parent = <container_id>
		local_id = name
		exclusive_device = <exclusive_device>
		z_priority = (10 + <extra_z>)
		scale = 0.5
		font = <font>
		text = <text>
		pos = <text_pos>
		just = <text_just>
		rgba = ($net_rounds_round_list_entry_color)
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
	bg_nudge = 10
	if gotparam team_score
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			texture = white2
			pos = (-30.0, 20.0)
			rgba = <on_rgba>
			scale = (55.0, 0.2)
			just = [left top]
			z_priority = (3 + <extra_z>)
		}
	endif
	setscreenelementprops {
		id = <container_id>
		replace_handlers
		event_handlers = [
			{focus player_rankings_focus}
			{unfocus player_rankings_unfocus}
		]
	}
	setscreenelementlock id = <parent> on
	launchevent type = focus target = player_list_menu
endscript

script player_rankings_focus 
	obj_getid
	setscreenelementprops id = {<objid> child = name} rgba = ($pause_color_scheme.text_focus_color)
	setscreenelementprops id = {<objid> child = bg_bar} rgba = ($pause_color_scheme.bar_color)
	doscreenelementmorph id = {<objid> child = bg_bar}
endscript

script player_rankings_unfocus 
	obj_getid
	setscreenelementprops id = {<objid> child = name} rgba = ($pause_color_scheme.text_color)
	setscreenelementprops id = {<objid> child = bg_bar} rgba = ($pause_color_scheme.item_bg_color)
	doscreenelementmorph id = {<objid> child = bg_bar}
endscript

script score_menu_add_item 
	<container_dims> = (205.0, 21.0)
	if isxenon
		createscreenelement {
			type = containerelement
			parent = <parent>
			dims = <container_dims>
		}
	else
		createscreenelement {
			type = containerelement
			parent = <parent>
			dims = <container_dims>
			not_focusable
		}
	endif
	<container_id> = <id>
	createscreenelement {
		type = textelement
		parent = <container_id>
		z_priority = (20)
		font = fontstrip_numbers_mono_sk8
		text = <text>
		scale = 1.0
		pos = (113.0, 13.0)
		rgba = ($net_rounds_round_list_entry_color)
		just = [right center]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
	}
endscript
