competitive_rules = faceoff
competitive_rules_array = [
	faceoff
	momentum
	streakers
	do_or_die
	perfectionist
	elimination
	solo_fest_mode
	team_faceoff
	team_momentum
	team_streakers
	team_do_or_die
	team_perfectionist
	team_elimination
	team_fest_mode
	p8_pro_faceoff
]
temp_net_comp_goals = [
	do_or_die
	elimination
]
p8_pro_faceoff = {
	text = qs(0xd10b1c3a)
	upper_text = qs(0xaba5da2e)
	description = qs(0x7f19953e)
	full_rules = qs(0xeb3efa42)
	image = gr_compete_band_v_band
	condition = band_lobby_is_public_vs_state
	difficulty = any
	ranking_criteria = score
	team = 1
}
solo_fest_mode = {
	text = qs(0x752dc50e)
	upper_text = qs(0xdd3feb54)
	description = qs(0x22865f43)
	full_rules = qs(0x91564db2)
	image = gr_competitive_fest_mode
	condition = band_lobby_is_vs_state
	team = 0
}
team_fest_mode = {
	text = qs(0xd3a5fe1f)
	upper_text = qs(0x1702ecf7)
	description = qs(0x94d3514f)
	full_rules = qs(0x7a70b167)
	image = gr_compete_team_fest_mode
	condition = band_lobby_is_vs_state
	team = 1
}
faceoff = {
	text = qs(0x4bf74995)
	upper_text = qs(0x904d957a)
	description = qs(0x6a68700a)
	full_rules = qs(0x8e1c4228)
	image = gr_competitive_pro_faceoff
	condition = band_lobby_is_vs_state
	difficulty = any
	ranking_criteria = score
	team = 0
}
team_faceoff = {
	text = qs(0xa094ae3a)
	upper_text = qs(0x239c19c0)
	description = qs(0xc0f204c5)
	full_rules = qs(0x68f3b27d)
	image = gr_compete_team_pro_faceoff
	condition = band_lobby_is_vs_state
	difficulty = any
	ranking_criteria = score
	team = 1
}
do_or_die = {
	text = qs(0xc86fae2a)
	upper_text = qs(0xbd8a86e3)
	description = qs(0x72254014)
	full_rules = qs(0x1af46706)
	image = gr_competitive_do_or_die
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = invincible
	team = 0
	elimination_rules = {
		criteria = notes_missed
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		player_lives = -1
		revive_interval = section
		revive_interval_value = 1
		vocals_revive_interval_value = 3
	}
	bonus_rules = {
		criteria = alive
		criteria_value = 1
		interval = section
		interval_value = 1
		vocals_interval_value = 3
		reward = performance_value
		reward_value = 1
	}
}
team_do_or_die = {
	text = qs(0x2abdc296)
	upper_text = qs(0xa6c43657)
	description = qs(0x22119672)
	full_rules = qs(0x70c85726)
	image = gr_compete_team_do_or_die
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = invincible
	team = 1
	elimination_rules = {
		criteria = notes_missed
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		player_lives = -1
		revive_interval = section
		revive_interval_value = 1
		vocals_revive_interval_value = 3
	}
	bonus_rules = {
		criteria = alive
		criteria_value = 1
		interval = section
		interval_value = 1
		vocals_interval_value = 3
		reward = performance_value
		reward_value = 1
	}
}
momentum = {
	text = qs(0xb66a211e)
	upper_text = qs(0xe70e6d12)
	description = qs(0xb5c7ccf3)
	full_rules = qs(0x0afa400d)
	image = gr_competitive_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	team = 0
	elimination_rules = {
		criteria = notes_missed_sequential
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		effect = difficulty
		effect_value = down
		player_lives = -1
	}
	bonus_rules = {
		criteria = streak
		criteria_value = 20
		interval = instant
		interval_value = 1
		reward = difficulty
		reward_value = up
	}
}
team_momentum = {
	text = qs(0x10e21a0f)
	upper_text = qs(0x2d336ab1)
	description = qs(0x24f48c5d)
	full_rules = qs(0x1f6ef217)
	image = gr_compete_team_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	elimination_rules = {
		criteria = notes_missed_sequential
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		effect = difficulty
		effect_value = down
		player_lives = -1
	}
	bonus_rules = {
		criteria = streak
		criteria_value = 20
		interval = instant
		interval_value = 1
		reward = difficulty
		reward_value = up
	}
	team = 1
}
perfectionist = {
	text = qs(0xcdcc274f)
	upper_text = qs(0xba6494bc)
	description = qs(0x435889f9)
	full_rules = qs(0xdb5bb9be)
	image = gr_competitive_perfectionist
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	team = 0
	starpower = disabled
	bonus_rules = {
		criteria = percent_hit
		criteria_value = high_to_low
		interval = section
		interval_value = 1
		reward = performance_value
		reward_value = [
			4
			2
			1
		]
	}
}
team_perfectionist = {
	text = qs(0x0d61ebad)
	upper_text = qs(0xeacfcece)
	description = qs(0xc205cd8b)
	full_rules = qs(0x804505f1)
	image = gr_compete_team_perfectionist
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = disabled
	bonus_rules = {
		criteria = percent_hit
		criteria_value = high_to_low
		interval = section
		interval_value = 1
		reward = performance_value
		reward_value = [
			4
			2
			1
		]
	}
	team = 1
}
elimination = {
	text = qs(0x47f78838)
	upper_text = qs(0x46165772)
	description = qs(0xab5d8e14)
	full_rules = qs(0x2c93896e)
	image = gr_competitive_elimination
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = elimination_order
	team = 0
	min_players = 3
	elimination_rules = {
		criteria = score
		criteria_value = lowest
		interval = num_players
		interval_value = 2
	}
}
team_elimination = {
	text = qs(0xac946f97)
	upper_text = qs(0xf5c7dbc8)
	description = qs(0xc25f3add)
	full_rules = qs(0xe1188209)
	image = gr_compete_team_elimination
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = elimination_order
	elimination_rules = {
		criteria = score
		criteria_value = lowest
		interval = num_players
		interval_value = 2
	}
	team = 1
}
streakers = {
	text = qs(0x78525dae)
	upper_text = qs(0x3e096adf)
	description = qs(0xcbfeb612)
	full_rules = qs(0xe6667b79)
	image = gr_competitive_streakers
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	team = 0
	bonus_rules = {
		criteria = streak
		criteria_value = 10
		interval = instant
		interval_value = 1
		reward = performance_value
		reward_value = multiplier
	}
}
team_streakers = {
	text = qs(0x9a803112)
	upper_text = qs(0x2547da6b)
	description = qs(0x0af0e5bd)
	full_rules = qs(0x06ae777a)
	image = gr_compete_team_streakers
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	bonus_rules = {
		criteria = streak
		criteria_value = 10
		interval = instant
		interval_value = 1
		reward = performance_value
		reward_value = multiplier
	}
	team = 1
}
competitive_info = {
	name = 'competitive'
	goal_type = game_mode
	initial_data = {
		eliminated_players = [
		]
	}
	data = {
		eliminated_players = [
		]
		last_missed_note_index = [
			-1
			-1
			-1
			-1
			-1
			-1
			-1
			-1
		]
		overstrum_total = [
			0
			0
			0
			0
			0
			0
			0
			0
		]
		difficulty_changes = [
			0
			0
			0
			0
			0
			0
			0
			0
		]
		current_section = 0
		results_screen_goal_data = {
			column_title = qs(0x302c47e0)
			data_source = player_info_data
			var_name = score
			ranking_method = highest_to_lowest
		}
	}
	player_data = {
		performance_value = 0
		strikes = 0
		invincible = 0
		eliminated = 0
		current_percent_hit = -1
		current_vocal_percent_hit = -1
	}
	constants = {
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'pause'
					type = pause
					settings = {
						default_options = {
							resume
							quit
						}
						custom_options = [
						]
					}
				}
				{
					$goal_debug_bot_struct
				}
				{
					name = 'miss_listener'
					type = event_listener
					callback_mode = any
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
						missed_notep5
						missed_notep6
						missed_notep7
						missed_notep8
					]
					dont_start_on_enter
				}
				{
					name = 'extra_strum_listener'
					type = event_listener
					callback_mode = any
					events = [
						unnecessary_notep1
						unnecessary_notep2
						unnecessary_notep3
						unnecessary_notep4
						unnecessary_notep5
						unnecessary_notep6
						unnecessary_notep7
						unnecessary_notep8
					]
					got_event = competitive_main_miss_listener_gotevent
					dont_start_on_enter
				}
				{
					name = 'vocals_listener'
					type = event_listener
					callback_mode = any
					events = [
						vocals_end_phrase_eventp1
						vocals_end_phrase_eventp2
						vocals_end_phrase_eventp3
						vocals_end_phrase_eventp4
						vocals_end_phrase_eventp5
						vocals_end_phrase_eventp6
						vocals_end_phrase_eventp7
						vocals_end_phrase_eventp8
					]
				}
				{
					name = 'vocals_miss_listener'
					type = event_listener
					callback_mode = any
					events = [
						vocals_note_miss_eventp1
						vocals_note_miss_eventp2
						vocals_note_miss_eventp3
						vocals_note_miss_eventp4
						vocals_note_miss_eventp5
						vocals_note_miss_eventp6
						vocals_note_miss_eventp7
						vocals_note_miss_eventp8
					]
					got_event = competitive_main_miss_listener_gotevent
					dont_start_on_enter
				}
				{
					name = 'vocals_hit_listener'
					type = event_listener
					callback_mode = any
					events = [
						vocals_note_hit_eventp1
						vocals_note_hit_eventp2
						vocals_note_hit_eventp3
						vocals_note_hit_eventp4
						vocals_note_hit_eventp5
						vocals_note_hit_eventp6
						vocals_hit_hit_eventp7
						vocals_note_hit_eventp8
					]
					dont_start_on_enter
				}
				{
					name = 'streak_watcher'
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = current_run
							type = int
						}
					]
				}
				{
					name = 'Starpower_watcher'
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = star_power_used
							type = int
						}
					]
				}
				{
					name = 'strike_watcher'
					type = var_watcher
					vars = [
						{
							source = goalplayerdata
							var = strikes
							type = int
						}
					]
				}
				{
					name = 'difficulty_watcher'
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = difficulty
							type = checksum
						}
					]
				}
				{
					name = 'score_watcher'
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = score
							type = float
						}
						{
							source = goalplayerdata
							var = performance_value
							type = int
						}
					]
				}
				{
					name = 'percent_hit_watcher'
					type = var_watcher
					vars = [
						{
							source = goalplayerdata
							var = current_percent_hit
							type = float
						}
						{
							source = goalplayerdata
							var = current_vocal_percent_hit
							type = float
						}
					]
				}
				{
					name = 'elimination_watcher'
					type = var_watcher
					vars = [
						{
							source = goalplayerdata
							var = eliminated
							type = int
						}
					]
				}
				{
					name = 'interactive_watcher'
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = interactive
							type = int
						}
					]
				}
				{
					name = 'invincible_watcher'
					type = var_watcher
					vars = [
						{
							source = goalplayerdata
							var = invincible
							type = int
						}
					]
				}
				{
					name = 'win_timer'
					type = timer
					start_time = 5
					end_time = 0
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					timer_style = gh5_style
					attach_hud_to_player = 0
				}
				{
					name = 'section_timer'
					type = timer
					start_time = 5
					end_time = 0
					timer_style = gh5_style
					dont_expire_checkpoint
					dont_start_on_enter
					dont_show_on_enter
					attach_hud_to_player = 0
					beep_synced
				}
				{
					name = 'comp_meter'
					type = competitive_meter
					dont_start_on_enter
				}
			]
		}
	]
}

script competitive_pause_quit 
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_quit
		}}
	gman_shutdowngamemodegoal
	kill_gem_scroller <...>
	songlist_clear_playlist
	generic_event_back \{nosound
		state = uistate_songlist}
endscript

script competitive_post_activate 
	printf \{'competitive::Post_Activate'
		channel = competitive}
	if ($competitive_rules = null)
		printf \{qs(0xdbad40b4)}
		change \{competitive_rules = do_or_die}
	endif
	competitive_store_player_difficulty
	competitive_rule_difficulty
endscript

script competitive_main_enter 
	printf \{'competitive::Main_Enter'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> starpower
		if ($<ruleset>.starpower = disabled)
			change \{disable_all_starpower = 1}
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				hide_sp_meter player = <player>
				getnextplayer player = <player>
				repeat <num_players>
			endif
		endif
	endif
endscript

script competitive_song_started 
	printf 'competitive::Song Started::%r' channel = competitive r = ($competitive_rules)
	competitive_rule_ranking_criteria
	competitive_rule_elimination
	competitive_rule_bonus
	competitive_start_sound_scripts
	if NOT ($competitive_rules = team_faceoff || $competitive_rules = p8_pro_faceoff)
		gman_create_difficulty_indicators
	endif
endscript

script competitive_on_fret_section_indicators 
	<challenge_fretbars_array> = []
	gman_songtool_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	getarraysize <marker_array>
	<i> = 0
	<i2> = 0
	begin
	<start> = (<marker_array> [<i>].time - 150)
	<end> = (<marker_array> [<i>].time + 150)
	begin
	songfilemanager func = get_fretbar_note song_name = <current_song> index = <i2>
	if ((<marker_array> [<i>].time) <= (<fretbar_time>))
		<start> = ((<fretbar_time>) - 50)
		<end> = ((<fretbar_time>) + 50)
		break
	endif
	<i2> = (<i2> + 1)
	repeat <num_fretbar_notes>
	<challenge_fretbars_array> = (<challenge_fretbars_array> + ({start = <start> , end = <end>}))
	<i> = (<i> + 1)
	repeat <array_size>
	vocals_challenge_fretbars_array = []
	songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	getarraysize <marker_array>
	<section> = 0
	<ruleset> = ($competitive_rules)
	<vocals_section_interval> = 1
	if structurecontains structure = $<ruleset> bonus_rules
		bonus_ruleset = ($<ruleset>.bonus_rules)
		if structurecontains structure = <bonus_ruleset> vocals_interval_value
			<vocals_section_interval> = (<bonus_ruleset>.vocals_interval_value)
		endif
	endif
	begin
	mod a = <section> b = <vocals_section_interval>
	if (<mod> = 0)
		<start> = (<marker_array> [<section>].time)
		<end> = (<start> + 1)
		<vocals_challenge_fretbars_array> = (<vocals_challenge_fretbars_array> + ({start = <start> end = <end>}))
	endif
	<section> = (<section> + 1)
	repeat <array_size>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		if NOT (<part> = vocals)
			set_challenge_marker_times player = <player> challenge_marker_times = <challenge_fretbars_array>
		else
			set_challenge_marker_times player = <player> challenge_marker_times = <vocals_challenge_fretbars_array>
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script competitive_store_player_difficulty 
	printf \{qs(0x259003a5)}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<player_difficulties> = []
		<player_expert_plus_setting> = []
		begin
		getplayerinfo <player> difficulty
		getplayerinfo <player> double_kick_drum
		<player_difficulties> = (<player_difficulties> + <difficulty>)
		<player_expert_plus_setting> = (<player_expert_plus_setting> + <double_kick_drum>)
		printf qs(0xcc4b8811) p = <player> d = <difficulty>
		getnextplayer local player = <player>
		repeat <num_players>
		gman_setdata goal = competitive params = {player_difficulties = <player_difficulties> player_expert_plus_setting = <player_expert_plus_setting>}
	endif
endscript

script competitive_restore_player_difficulty 
	printf \{qs(0x1fc2c8bb)}
	gman_getdata \{goal = competitive
		player_difficulties}
	gman_getdata \{goal = competitive
		player_expert_plus_setting}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<i> = 0
		begin
		setplayerinfo <player> difficulty = (<player_difficulties> [<i>])
		setplayerinfo <player> double_kick_drum = (<player_expert_plus_setting> [<i>])
		printf qs(0x28a5627f) p = <player> d = (<player_difficulties> [<i>])
		getnextplayer local player = <player>
		<i> = (<i> + 1)
		repeat <num_players>
	endif
endscript

script competitive_main_section_timer_expire 
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = hide}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = reset}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = stop}
endscript

script competitive_section_countdown 
	get_song_section_array
	getarraysize <song_section_array>
	begin
	getsongtimems
	gman_getdata \{goal = competitive
		current_section}
	<delay> = ((((<song_section_array> [(<current_section> + 1)].time) - 5000) - (<time>)) / 1000.0)
	if (<delay> < 5.0)
		<delay> = ((((<song_section_array> [(<current_section> + 2)].time) - 5000) - (<time>)) / 1000.0)
	endif
	wait <delay> seconds
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = attach_timer_to_player
		params = {
			player = 0
		}}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = show}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = start}
	wait \{15
		seconds}
	repeat (<array_size> - 1)
endscript

script competitive_on_highway_countdown 
	<i> = 5
	begin
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> interactive
		if (<interactive> = 0)
			formattext textname = time qs(0x4d4555da) s = (<i>)
			spawnscriptnow id = <script_id> competitive_create_on_highway_text params = {player = <player> text = <time> destroy_old scale = 2}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	wait \{1
		second}
	<i> = (<i> - 1)
	repeat 5
endscript

script stop_rhythm_hard_star 
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if structurecontains structure = <elimination_ruleset> effect
			getplayerinfo <player> difficulty
			if ((<elimination_ruleset>.effect = difficulty) && (<difficulty> = beginner))
				<current_value> = 0
			endif
		endif
	endif
	competitive_meter_update_strikes player = <player> strikes = <current_value>
endscript

script competitive_main_difficulty_watcher_varupdated 
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	switch <current_value>
		case beginner
		<difficulty_text> = qs(0x7c69c087)
		<icon> = icon_difficulty_beginner
		case easy
		<difficulty_text> = qs(0x33285640)
		<icon> = icon_difficulty_easy
		case medium
		<difficulty_text> = qs(0xfbf1dc48)
		<icon> = icon_difficulty_medium
		case hard
		<difficulty_text> = qs(0x8686280d)
		<icon> = icon_difficulty_hard
		case expert
		<difficulty_text> = qs(0xcc443a5c)
		<icon> = icon_difficulty_expert
		case expert_plus
		<difficulty_text> = qs(0xa672fac7)
		<icon> = icon_difficulty_expert_plus
	endswitch
	getplayerinfo <player> double_kick_drum
	getplayerinfo <player> part
	if (<part> = drum && <current_value> = expert && <double_kick_drum> = 1)
		<difficulty_text> = qs(0xa672fac7)
		<icon> = icon_difficulty_expert_plus
	endif
	if NOT (<part> = vocals)
		get_highway_hud_root_id player = <player>
		if screenelementexists id = <highway_hud_root>
			if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
				setscreenelementprops id = <hud_player_meter> difficulty_texture = <icon>
			endif
		endif
	else
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if screenelementexists id = <competitive_meters_id>
			setscreenelementprops id = <competitive_meters_id> difficulty_texture = <icon>
		endif
	endif
endscript

script competitive_main_score_watcher_varupdated 
	competitive_update_band_meter
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	switch ($<ruleset>.ranking_criteria)
		case score
		if (<var> = score)
			formattext checksumname = element_id 'p%p_points' p = <player>
		endif
		case performance_value
		if (<var> = performance_value)
			if gotparam \{player}
				switch <player>
					case 1
					change \{player_1_points_for_section = 0}
					case 2
					change \{player_2_points_for_section = 0}
					case 3
					change \{player_3_points_for_section = 0}
					case 4
					change \{player_4_points_for_section = 0}
					default
					printf \{channel = sfx
						qs(0x0eb7f0d9)}
				endswitch
			endif
			<difference> = (<current_value> - <last_value>)
			formattext textname = points_text qs(0xb0a8de90) s = <difference>
			if gotparam \{player}
				switch <player>
					case 1
					change player_1_points_for_section = <difference>
					case 2
					change player_2_points_for_section = <difference>
					case 3
					change player_3_points_for_section = <difference>
					case 4
					change player_4_points_for_section = <difference>
					default
					printf \{channel = sfx
						qs(0x0eb7f0d9)}
				endswitch
			endif
			spawnscript id = competitive competitive_create_on_highway_text params = {player = <player> text = <points_text>}
		endif
		case elimination_order
		if (<var> = score)
			formattext checksumname = element_id 'p%p_points' p = <player>
		endif
	endswitch
	if screenelementexists id = <element_id>
		setscreenelementprops id = <element_id> text = <score_text>
	endif
endscript

script competitive_main_percent_hit_watcher_varupdated 
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id player = <player>
	if (<current_value> = -1)
		return
	endif
	if screenelementexists id = <highway_hud_root>
		casttointeger \{current_value}
		formattext textname = new_text qs(0xcfd55336) s = <current_value>
		spawnscriptnow id = competitive competitive_create_on_highway_text params = {player = <player> text = <new_text>}
	endif
endscript

script competitive_main_elimination_watcher_varupdated 
	printf channel = competitive 'Competitive::Elimination Watcher::Player %p Eliminated' p = <player>
	competitive_update_band_meter
	getplayerinfo <player> is_onscreen
	getplayerinfo <player> part
	if (<is_onscreen> = 1)
		if (<part> = vocals)
			if (<current_value> = 1)
				hud_vocal_dead_script player = <player>
				setplayerinfo <player> scoring = 0
				formattext checksumname = event_name 'competitive_player_eliminated_p%p' p = <player>
				broadcastevent type = <event_name> data = {player = <player>}
			else
				hud_vocal_revive player = <player>
				setplayerinfo <player> scoring = 1
			endif
		else
			if (<current_value> = 1)
				get_highway_hud_root_id player = <player>
				if screenelementexists id = <highway_hud_root>
					setscreenelementprops id = <highway_hud_root> skull_alpha = 1.0
				endif
				launchgemevent event = kill_objects_and_switch_player_non_interactive player = <player>
				whammyfxoffall player = <player>
				formattext checksumname = event_name 'competitive_player_eliminated_p%p' p = <player>
				broadcastevent type = <event_name> data = {player = <player>}
			else
				get_highway_hud_root_id player = <player>
				if screenelementexists id = <highway_hud_root>
					setscreenelementprops id = <highway_hud_root> skull_alpha = 0.0
				endif
				getsongtimems
				setplayerinfo <player> interactive = 1
				setplayerinfo <player> last_noninteractive_end_time = <time>
			endif
		endif
	endif
	if (<part> != vocals)
		<ruleset> = ($competitive_rules)
		if structurecontains structure = $<ruleset> bonus_rules
			<bonus_ruleset> = ($<ruleset>.bonus_rules)
			if structurecontains structure = <bonus_ruleset> criteria
				if (<bonus_ruleset>.criteria = alive)
					competitive_check_all_players_eliminated
					if (<all_players_eliminated> = 1)
						gman_timerfunc goal = <goal_id> tool = section_timer func = get_precise_time
						if (<time> > 10000)
							killspawnedscript \{name = competitive_delayed_revive}
							spawnscript \{id = competitive
								competitive_delayed_revive
								params = {
									delay = 2
								}}
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script competitive_main_interactive_watcher_varupdated 
	if (<current_value> = 0)
		setplayerinfo <player> star_power_amount = 0.0
		setplayerinfo <player> current_run = 0
		resetplayernotestreak player = <player>
		updaterunchange player = <player>
		playersetvolume player = <player> volume = 0 include_drums = 1
		updateguitarvolume
		whammyfxoffall player = <player>
		reset_player_touch_glow player = <player>
	else
		playersetvolume player = <player> volume = 100
		updateguitarvolume
	endif
endscript

script competitive_delayed_revive 
	wait <delay> seconds
	competitive_revive_all_players
endscript

script competitive_check_all_players_eliminated 
	getnumplayersingame
	<eliminated_players> = 0
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = competitive player = <player> name = eliminated
		if (<eliminated> = 1)
			<eliminated_players> = (<eliminated_players> + 1)
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<eliminated_players> = <num_players>)
		return \{all_players_eliminated = 1}
	else
		return \{all_players_eliminated = 0}
	endif
endscript

script competitive_main_invincible_watcher_varupdated 
endscript

script competitive_clear_all_grace_period 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			highway_grace_period_end player = <player>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script competitive_main_starpower_watcher_varupdated 
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> starpower
		switch ($<ruleset>.starpower)
			case invincible
			if (<current_value> = 1)
				gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
				gman_setdata goal = competitive player = <player> params = {invincible = 1}
			else
				gman_setdata goal = competitive player = <player> params = {invincible = 0}
			endif
		endswitch
	endif
endscript

script competitive_main_streak_watcher_varupdated 
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if structurecontains structure = <elimination_ruleset> criteria
			if (<elimination_ruleset>.criteria = notes_missed_sequential)
				if (<current_value> >= 1)
					gman_getdata goal = competitive player = <player> name = strikes
					if NOT (<strikes> = 0)
						gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
					endif
				endif
			endif
		endif
	endif
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if structurecontains structure = <bonus_ruleset> criteria
			if (<bonus_ruleset>.criteria = streak)
				<streak_length> = (<bonus_ruleset>.criteria_value)
				mod a = <current_value> b = (<streak_length>)
				if ((<mod> = 0) && (<current_value> > 0))
					if structurecontains structure = <bonus_ruleset> reward
						switch (<bonus_ruleset>.reward)
							case difficulty
							getplayerinfo <player> difficulty
							getplayerinfo <player> part
							getplayerinfo <player> double_kick_drum
							if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 0)
								gman_songtool_getcurrentsong
								if structurecontains structure = ($gh_songlist_props.<current_song>) double_kick
									if ($gh_songlist_props.<current_song>.double_kick = 1)
										spawn_do_diff_change player = <player> direction = (<bonus_ruleset>.reward_value)
									endif
								endif
							else
								if NOT (<difficulty> = expert)
									spawn_do_diff_change player = <player> direction = (<bonus_ruleset>.reward_value)
								endif
							endif
							case performance_value
							switch (<bonus_ruleset>.reward_value)
								case streak_length
								gman_getdata goal = competitive player = <player> name = performance_value
								<points> = (<current_value> / 10)
								casttointeger \{points}
								<performance_value> = (<performance_value> + <points>)
								gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
								case multiplier
								gman_getdata goal = competitive player = <player> name = performance_value
								getplayerinfo <player> star_power_used
								<points> = (<current_value> / 10)
								if (<points> > 4)
									<points> = 4
								endif
								if (<star_power_used> = 1)
									<points> = (<points> * 2)
								endif
								casttointeger \{points}
								<performance_value> = (<performance_value> + <points>)
								gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
							endswitch
						endswitch
					endif
				endif
			endif
		endif
	endif
endscript

script competitive_apply_reward 
	scriptassert \{'Mike was wrong! please let him know asap... x4161'}
	printf \{'competitive::Rule Enforcer::Apply Reward'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	if structurecontains structure = <bonus_ruleset> reward
		return
	endif
endscript

script competitive_main_exit 
	printf \{'competitive::Main_Exit'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> starpower
		if ($<ruleset>.starpower = disabled)
			change \{disable_all_starpower = 0}
		endif
	endif
	competitive_restore_player_difficulty
	competitive_clear_all_grace_period
	killspawnedscript \{id = competitive}
	killspawnedscript \{id = highway1_script}
	killspawnedscript \{id = highway2_script}
	killspawnedscript \{id = highway3_script}
	killspawnedscript \{id = highway4_script}
	killspawnedscript \{name = competitive_create_on_highway_text}
	competitive_kill_sound_scripts
	destroyscreenelement \{id = competitive_container}
endscript

script competitive_rule_difficulty 
	printf \{'competitive::Rule Enforcer::Difficulty'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if structurecontains structure = ($<ruleset>) difficulty
		switch ($<ruleset>.difficulty)
			case any
			return
			case all_one
			if structurecontains structure = ($<ruleset>) difficulty_value
				difficulty_value = ($<ruleset>.difficulty_value)
				getnumplayersingame \{local}
				if (<num_players> > 0)
					getfirstplayer \{local}
					begin
					setplayerinfo <player> difficulty = <difficulty_value>
					getnextplayer local player = <player>
					repeat <num_players>
				endif
			else
				scriptassert \{'Competitive difficulty rule set to all_one but no difficulty_value set!'}
			endif
			case all_leader
			getplayerinfo \{$primary_controller
				difficulty}
		endswitch
	endif
endscript

script competitive_rule_ranking_criteria 
	printf \{'competitive::Rule Enforcer::Ranking'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT ($competitive_rules = team_faceoff || $competitive_rules = p8_pro_faceoff)
		gman_competitivemeterfunc \{goal = competitive
			tool = comp_meter
			func = start}
	endif
	ranking_order = high_to_low
	metric = score
	switch ($<ruleset>.ranking_criteria)
		case score
		if ($<ruleset>.team = 1)
			competitive_setup_results_data \{title = qs(0x302c47e0)
				source = band_info_data
				data = score}
		else
			competitive_setup_results_data
		endif
		metric = score
		case time_alive
		competitive_setup_results_data \{title = qs(0xdb6c469d)
			source = player_goal_data
			data = performance_value}
		metric = time_alive
		case elimination_order
		competitive_setup_results_data \{title = qs(0xc35ef9eb)
			source = player_info_data
			data = score}
		metric = elimination_order
		case performance_value
		competitive_setup_results_data \{title = qs(0x85a8f425)
			source = player_goal_data
			data = performance_value}
		metric = performance_value
	endswitch
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_ranking_order
		params = {ranking_order = <ranking_order>}
	}
	spawnscriptnow competitive_meter_track_player_scores params = {metric = <metric>}
endscript

script competitive_meter_track_player_scores 
	begin
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT gman_goalisactive \{goal = competitive}
			return
		endif
		switch <metric>
			case score
			getplayerinfo <player> score
			casttointeger \{score}
			case time_alive
			competitive_get_time_alive player = <player>
			<score> = (<time_alive> / 1000.0)
			case elimination_order
			getplayerinfo <player> score
			casttointeger \{score}
			case performance_value
			gman_getdata goal = competitive player = <player> name = performance_value
			<score> = (<performance_value>)
			casttointeger \{score}
			case performance_value_percent
			gman_getdata goal = competitive player = <player> name = performance_value
			<score> = (<performance_value>)
			casttointeger \{score}
		endswitch
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = update_player
			params = {player = <player> score = <score>}
		}
		getnextplayer player = <player>
		repeat <num_players>
	endif
	wait \{5
		gameframes}
	repeat
endscript

script competitive_rule_elimination 
	printf \{'competitive::Rule Enforcer::Elimination'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	if structurecontains structure = <elimination_ruleset> interval
		switch (<elimination_ruleset>.interval)
			case section
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <player> part
				if NOT (<part> = vocals)
					if NOT scriptisrunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT scriptisrunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer player = <player>
				repeat <num_players>
				spawnscript id = competitive competitive_section_elimination params = {sections = (<elimination_ruleset>.interval_value)}
				competitive_on_fret_section_indicators
			endif
			case num_players
			if NOT scriptisrunning \{competitive_segment_song_by_num_players}
				spawnscript \{id = competitive
					competitive_segment_song_by_num_players}
			endif
			if NOT scriptisrunning \{competitive_segment_elimination}
				spawnscript \{id = competitive
					competitive_segment_elimination}
			endif
			case instant
			if structurecontains structure = <elimination_ruleset> criteria
				switch (<elimination_ruleset>.criteria)
					case notes_missed
					if structurecontains structure = <elimination_ruleset> criteria_value
						num_notes = (<elimination_ruleset>.criteria_value)
					else
						num_notes = 1
					endif
					competitive_activate_miss_listener num_notes = <num_notes>
					case notes_missed_sequential
					if structurecontains structure = <elimination_ruleset> criteria_value
						num_notes = (<elimination_ruleset>.criteria_value)
					else
						num_notes = 1
					endif
					competitive_activate_miss_listener num_notes = <num_notes>
				endswitch
			endif
		endswitch
	endif
	if structurecontains structure = <elimination_ruleset> player_lives
		player_lives = (<elimination_ruleset>.player_lives)
	else
		player_lives = 1
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_setdata goal = competitive player = <player> params = {player_lives = <player_lives>}
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if structurecontains structure = <elimination_ruleset> revive_interval
		switch (<elimination_ruleset>.revive_interval)
			case section
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <player> part
				if NOT (<part> = vocals)
					if NOT scriptisrunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT scriptisrunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer player = <player>
				repeat <num_players>
				spawnscript id = competitive competitive_section_revival params = {interval = (<elimination_ruleset>.revive_interval)}
				competitive_on_fret_section_indicators
			endif
		endswitch
	endif
endscript

script competitive_segment_elimination 
	printf \{'competitive::Rule Enforcer::Segment Elimination'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	begin
	block \{type = song_segment_by_num_players_end}
	if structurecontains structure = <elimination_ruleset> criteria
		switch (<elimination_ruleset>.criteria)
			case score
			printf \{channel = competitive
				'Requesting Arbitration... score'}
			gman_requestarbitrationdata \{source = playerinfo
				var = score
				goal = competitive}
		endswitch
	endif
	wait \{1
		gameframe}
	repeat
endscript

script competitive_segment_bonus 
	printf \{'competitive::Rule Enforcer::Segment Bonus'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	begin
	block \{type = song_segment_by_num_players_end}
	wait \{10
		gameframes}
	if structurecontains structure = <bonus_ruleset> criteria
		switch (<bonus_ruleset>.criteria)
			case alive
			competitive_rank_section_alive
		endswitch
	endif
	wait \{1
		gameframe}
	repeat
endscript

script competitive_section_elimination \{sections = 1}
	printf \{'competitive::Rule Enforcer::Section Elimination'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	begin
	block \{type = song_section_end}
	<section> = (<event_data>.section)
	mod a = (<section> + 1) b = (<sections>)
	if ((<mod> = 0) && ((<section> + 1) >= <sections>))
		if structurecontains structure = <elimination_ruleset> criteria
			switch (<elimination_ruleset>.criteria)
				case score
				printf \{channel = competitive
					'Requesting Arbitration... score'}
				gman_requestarbitrationdata \{source = playerinfo
					var = score
					goal = competitive}
			endswitch
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script competitive_rank_score 
	<ruleset> = ($competitive_rules)
	<worst_score> = 999999999
	<eliminated> = 0
	<tie> = []
	gman_getdata \{goal = competitive
		name = eliminated_players}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT arraycontains array = <eliminated_players> contains = <player>
			if gotparam \{data_array}
				printf \{channel = competitive
					'Using Arbitrated Data...'}
				<i> = 0
				getarraysize <data_array>
				begin
				if (<data_array> [<i>].player = <player>)
					<score> = (<data_array> [<i>].score)
					break
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			else
				getplayerinfo <player> score
			endif
			if (<score> = <worst_score>)
				<eliminated> = tie
				<tie> = (<tie> + <player>)
			elseif (<score> < <worst_score>)
				<worst_score> = <score>
				<eliminated> = <player>
				<tie> = []
				<tie> = (<tie> + <player>)
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<eliminated> = tie)
		getarraysize <eliminated_players>
		<num_remaining_players> = (<num_players> - <array_size>)
		getarraysize <tie>
		<num_tied_players> = <array_size>
		if (<num_remaining_players> != <num_tied_players>)
			<i> = 0
			begin
			competitive_eliminate_player player = (<tie> [<i>])
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	else
		competitive_eliminate_player player = <eliminated>
	endif
	gman_getdata \{goal = competitive
		name = eliminated_players}
	getarraysize <eliminated_players>
	printf channel = competitive qs(0xb3c8c24c) s = <array_size> p = <num_players>
	if structurecontains structure = $<ruleset> team
		if ($<ruleset>.team = 0)
			if ((<array_size>) >= (<num_players> - 1))
				competitive_mode_final_elimination_complete
			endif
		else
			<winning_band> = -1
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <player> band
				gman_getdata goal = competitive player = <player> name = eliminated
				if (<eliminated> = 0)
					if NOT (<winning_band> = -1)
						if NOT (<winning_band> = <band>)
							printf channel = competitive qs(0x1465c841) t = <band>
							return
						endif
					else
						<winning_band> = (<band>)
						printf channel = competitive qs(0x1465c841) t = <band>
					endif
				endif
				getnextplayer player = <player>
				repeat <num_players>
				competitive_mode_final_elimination_complete
			endif
		endif
	endif
endscript

script competitive_mode_final_elimination_complete 
	gman_songtool_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	getsongtimems
	casttointeger \{time}
	printstruct <...> channel = meb
	if (<time> < (<total_end_time> -5000))
		spawnscript \{noqbid
			gman_songtool_songwon}
	endif
endscript

script competitive_segment_song_by_num_players 
	gman_songtool_getcurrentsong
	competitive_get_measure_times
	getarraysize <measure_times>
	getnumplayersingame
	<segments> = (<num_players> - 1)
	<measures_per_segment> = (<array_size> / <segments>)
	<time_per_segment> = []
	i = 1
	if (<segments> > 1)
		begin
		<time_per_segment> = (<time_per_segment> + (<measure_times> [(<measures_per_segment> * <i>)]))
		<i> = (<i> + 1)
		repeat (<segments> - 1)
	endif
	songfilemanager func = get_song_end_time song_name = <current_song>
	<time_per_segment> = (<time_per_segment> + (<total_end_time>))
	<i> = 0
	begin
	getsongtimems
	<segment_length> = (<time_per_segment> [<i>] - <time>)
	if NOT gotparam \{notimer}
		<new_time> = (<segment_length>)
		casttointeger \{new_time}
		gman_timerfunc goal = competitive tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = attach_timer_to_player
			params = {
				player = 0
			}}
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = reset}
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = show}
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = start}
	endif
	begin
	getsongtimems
	if (<time> > (<time_per_segment> [<i>]))
		break
	endif
	wait \{1
		frame}
	repeat
	getsongtimems
	broadcastevent \{type = song_segment_by_num_players_end}
	<i> = (<i> + 1)
	repeat <segments>
endscript

script competitive_section_revival 
	printf \{'competitive::Rule Enforcer::Section Revive'
		channel = competitive}
	begin
	block \{type = song_section_end}
	<section> = (<event_data>.section)
	competitive_revive_all_players \{exclude_vocals}
	wait \{1
		gameframe}
	repeat
endscript

script competitive_revive_all_players 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = competitive player = <player> name = eliminated
		getplayerinfo <player> part
		if gotparam \{vocals_only}
			if NOT (<part> = vocals)
				<eliminated> = 0
			endif
		elseif gotparam \{exclude_vocals}
			if (<part> = vocals)
				<eliminated> = 0
			endif
		endif
		if (<eliminated> = 1)
			gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
			competitive_revive_player player = <player>
		elseif (<part> = vocals)
			getplayerinfo <player> scoring
			if (<scoring> = 0)
				gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
				competitive_revive_player player = <player>
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script competitive_rule_bonus 
	printf \{'competitive::Rule Enforcer::Setup Bonuses'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	if structurecontains structure = <bonus_ruleset> interval
		switch (<bonus_ruleset>.interval)
			case instant
			if structurecontains structure = <bonus_ruleset> criteria
				switch (<bonus_ruleset>.criteria)
					case streak
					streak_length = (<bonus_ruleset>.criteria_value)
					gman_setdata goal = competitive params = {bonus_streak_length = <streak_length>}
				endswitch
			endif
			case num_players
			if NOT scriptisrunning \{competitive_segment_song_by_num_players}
				spawnscript \{id = competitive
					competitive_segment_song_by_num_players}
			endif
			spawnscript \{id = competitive
				competitive_segment_bonus}
			case section
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <player> part
				if NOT (<part> = vocals)
					if NOT scriptisrunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT scriptisrunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer player = <player>
				repeat <num_players>
				spawnscript id = competitive competitive_section_bonus params = {interval = (<bonus_ruleset>.interval_value)}
				competitive_on_fret_section_indicators
				gman_eventlistenerfunc \{goal = competitive
					tool = extra_strum_listener
					func = start}
			endif
		endswitch
	endif
endscript

script competitive_section_bonus 
	printf \{'competitive::Rule Enforcer::Section Bonus'
		channel = competitive}
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	begin
	block \{type = song_section_end}
	<section> = (<event_data>.section)
	if structurecontains structure = <bonus_ruleset> criteria
		switch (<bonus_ruleset>.criteria)
			case percent_hit
			competitive_rank_section_percent_hit section = <section>
			case alive
			competitive_rank_section_alive section = <section>
		endswitch
	endif
	wait \{1
		gameframe}
	repeat
endscript

script competitive_rank_section_alive \{vocals = 0}
	<local_players_survived> = []
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> interactive
		getplayerinfo <player> part
		if ((<vocals> = 1) && (<part> = vocals))
			if (<interactive> = 1)
				gman_getdata goal = competitive player = <player> name = performance_value
				<performance_value> = (<performance_value> + 1)
				gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
				<local_players_survived> = (<local_players_survived> + <player>)
			endif
		elseif ((<vocals> = 0) && (<part> != vocals))
			if (<interactive> = 1)
				getplayerinfo <player> current_detailedstats_array
				<notes_hit> = (($<current_detailedstats_array>) [<section>])
				if (<notes_hit> = 0)
					printf channel = competitive 'no notes hit in section %s' s = <section>
				else
					gman_getdata goal = competitive player = <player> name = performance_value
					<performance_value> = (<performance_value> + 1)
					gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
					<local_players_survived> = (<local_players_survived> + <player>)
				endif
			endif
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	getarraysize <local_players_survived>
	if (<array_size> > 0)
		if (<array_size> = 1)
			printf channel = competitive 'Playing SFX for SOLE SURVIVOR: player %p' p = (<local_players_survived> [0])
			sfx_do_or_die_section_won player = (<local_players_survived> [0]) pan_wide = 0
		else
			printf \{channel = competitive
				'Playing SFX for MULTIPLE SURVIVORs'}
			sfx_do_or_die_section_won player = (<local_players_survived> [0]) pan_wide = 1
		endif
	endif
endscript

script competitive_setup_results_data \{title = qs(0x302c47e0)
		source = player_info_data
		data = score
		method = highest_to_lowest}
	printf \{'competitive::Rule Enforcer::Setup Results Data'
		channel = competitive}
	gman_setdata goal = competitive params = {results_screen_goal_data = {column_title = (<title>) data_source = (<source>) var_name = (<data>) ranking_method = (<method>)}}
endscript

script competitive_activate_miss_listener 
	printf \{'competitive::Rule Enforcer::Activate Miss Listener'
		channel = competitive}
	gman_setdata goal = competitive params = {miss_num_notes = <num_notes>}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_setdata goal = competitive player = <player> params = {strikes = 0}
		competitive_meter_update_strikes player = <player> strikes = 0
		getnextplayer player = <player>
		repeat <num_players>
	endif
	gman_eventlistenerfunc \{goal = competitive
		tool = vocals_miss_listener
		func = start}
	gman_eventlistenerfunc \{goal = competitive
		tool = vocals_hit_listener
		func = start}
	gman_eventlistenerfunc \{goal = competitive
		tool = miss_listener
		func = start}
	gman_eventlistenerfunc \{goal = competitive
		tool = extra_strum_listener
		func = start}
endscript

script competitive_main_vocals_hit_listener_gotevent 
	<player> = (<event_data>.player)
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if structurecontains structure = <elimination_ruleset> criteria
			if (<elimination_ruleset>.criteria = notes_missed_sequential)
				gman_getdata goal = competitive player = <player> name = strikes
				if NOT (<strikes> = 0)
					gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
				endif
			endif
		endif
	endif
endscript

script competitive_main_miss_listener_gotevent 
	printf 'competitive::Rule Enforcer::Got Missed Note %p' channel = competitive p = <event>
	gman_getdata goal = competitive player = (<event_data>.player) name = eliminated
	if (<eliminated> = 1)
		return
	endif
	getplayerinfo (<event_data>.player) time_of_first_note
	if (<tool_id> = extra_strum_listener)
		gman_getdata \{goal = competitive
			name = overstrum_total}
		<player_overstrum_total> = (<overstrum_total> [(<event_data>.player - 1)] + 1)
		setarrayelement arrayname = overstrum_total index = (<event_data>.player - 1) newvalue = (<player_overstrum_total>)
		gman_setdata goal = competitive params = {overstrum_total = <overstrum_total>}
		printf channel = competitive qs(0xba675e25) p = (<event_data>.player) s = <player_overstrum_total>
	endif
	if structurecontains structure = <event_data> songtime
		if (<time_of_first_note> > <event_data>.songtime)
			return
		endif
	else
		gman_getdata \{goal = competitive
			name = last_missed_note_index}
		if structurecontains structure = <event_data> array_entry
			if (<event_data>.array_entry = <last_missed_note_index> [(<event_data>.player - 1)])
				return
			endif
			setarrayelement arrayname = last_missed_note_index index = (<event_data>.player - 1) newvalue = (<event_data>.array_entry)
			gman_setdata goal = competitive params = {last_missed_note_index = <last_missed_note_index>}
		endif
	endif
	<ruleset> = ($competitive_rules)
	gman_getdata goal = competitive player = (<event_data>.player) name = invincible
	if (<invincible> = 1)
		return
	endif
	gman_getdata \{goal = competitive
		miss_num_notes}
	if NOT gotparam \{miss_num_notes}
		return
	endif
	gman_getdata goal = competitive player = (<event_data>.player) name = strikes
	<missed_notes> = (<strikes> + 1)
	gman_setdata goal = competitive player = (<event_data>.player) params = {strikes = <missed_notes>}
	if (<missed_notes> >= <miss_num_notes>)
		if structurecontains structure = $<ruleset> elimination_rules
			<elimination_ruleset> = ($<ruleset>.elimination_rules)
			if structurecontains structure = <elimination_ruleset> effect
				switch (<elimination_ruleset>.effect)
					case difficulty
					getplayerinfo (<event_data>.player) difficulty
					if NOT (<difficulty> = beginner)
						spawn_do_diff_change player = (<event_data>.player) direction = (<elimination_ruleset>.effect_value)
					endif
					gman_setdata goal = competitive player = (<event_data>.player) params = {strikes = 0 notes_missed = 0}
				endswitch
			else
				competitive_eliminate_player player = (<event_data>.player)
			endif
		endif
	endif
endscript

script competitive_main_vocals_listener_gotevent 
	printf 'competitive::Rule Enforcer::Got vocals phrase complete %p' channel = competitive p = <event>
	<ruleset> = ($competitive_rules)
	<player> = (<event_data>.player)
	if structurecontains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		gman_getdata goal = competitive player = <player> name = invincible
		getplayerinfo (<player>) interactive
		if structurecontains structure = <elimination_ruleset> revive_interval
			if (<interactive> = 0)
				competitive_revive_player
			endif
		endif
	endif
	<vocals_section_interval> = 1
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		<valid_section> = true
		if structurecontains structure = <bonus_ruleset> vocals_interval_value
			vocals_section_interval = (<bonus_ruleset>.vocals_interval_value)
			<section_index> = (<event_data>.section_index)
			<last_phrase> = (<event_data>.last_phrase)
			if NOT (<last_phrase> = 1)
				if NOT (<section_index> = -1)
					mod a = <section_index> b = <vocals_section_interval>
					if NOT (<mod> = 0)
						<valid_section> = false
					endif
				else
					<valid_section> = false
				endif
			endif
			if (<section_index> = 0)
				<valid_section> = false
			endif
		endif
		if (<valid_section> = true)
			if structurecontains structure = <bonus_ruleset> criteria
				switch (<bonus_ruleset>.criteria)
					case percent_hit
					if (<event_data>.empty_phrase = 0)
						if NOT scriptisrunning \{competitive_vocals_phrase_end_watcher}
							spawnscriptnow \{id = competitive
								competitive_vocals_phrase_end_watcher}
						endif
						<percentage_hit> = (<event_data>.quality * 100)
						casttointeger \{percentage_hit}
						gman_setdata goal = competitive player = <player> params = {current_vocal_percent_hit = <percentage_hit>}
					endif
					case alive
					if (<event_data>.phrase_score > 0 || <vocals_section_interval> > 1)
						gman_getdata goal = competitive player = <player> name = performance_value
						<performance_value> = (<performance_value> + 1)
						gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
					endif
				endswitch
			endif
		endif
	endif
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	if playerinfoequals <player> part = vocals
		last_vocalist = <player>
	endif
	getnextplayer local player = <player>
	repeat <num_players>
	if (<last_vocalist> = <event_data>.player)
		broadcastevent \{type = vocals_phrase_end}
	endif
endscript

script competitive_vocals_phrase_end_watcher 
	<ruleset> = ($competitive_rules)
	<i> = 1
	begin
	block \{type = vocals_phrase_end}
	formattext checksumname = request_id 'vocals_%s' s = <i>
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if (<bonus_ruleset>.criteria = percent_hit)
			printf \{channel = competitive
				'Requesting Arbitration... current_vocal_percent_hit'}
			gman_requestarbitrationdata source = goalplayerdata var = current_vocal_percent_hit goal = competitive request_id = <request_id>
		endif
	endif
	<i> = (<i> + 1)
	repeat
endscript

script competitive_vocals_section_watcher 
	printf \{channel = goal
		'Vocals Section Watcher Started...'}
	<ruleset> = ($competitive_rules)
	<section> = 0
	gman_songtool_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	<song_section_array> = <marker_array>
	getarraysize <song_section_array>
	songfilemanager func = get_song_end_time song_name = <current_song>
	if (<array_size> = 0)
		printf \{channel = goal
			'No Vocals markers found in song, exiting competitive_vocals_section_revival...'}
		return
	endif
	getsongtimems
	<new_time> = ((<song_section_array> [1].time) - (<time>))
	<vocals_section_interval> = 1
	if structurecontains structure = $<ruleset> elimination_rules
		elimination_ruleset = ($<ruleset>.elimination_rules)
		if structurecontains structure = <elimination_ruleset> vocals_revive_interval_value
			<vocals_section_interval> = (<elimination_ruleset>.vocals_revive_interval_value)
		endif
	endif
	begin
	getsongtimems
	casttointeger \{time}
	if (<section> >= (<array_size> - 1))
		break
	elseif ((<song_section_array> [(<section> + 1)].time) < (<time>))
		<section> = (<section> + 1)
		mod a = <section> b = <vocals_section_interval>
		if (<mod> = 0)
			if structurecontains structure = $<ruleset> elimination_rules
				<elimination_ruleset> = ($<ruleset>.elimination_rules)
				if structurecontains structure = <elimination_ruleset> revive_interval
					competitive_revive_all_players \{vocals_only}
				endif
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
	begin
	getsongtimems
	casttointeger \{time}
	if (<time> > <total_end_time>)
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script competitive_eliminate_player 
	requireparams \{[
			player
		]
		all}
	printf 'competitive::Rule Enforcer::Eliminate Player %p' channel = competitive p = <player>
	gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
	setplayerinfo <player> star_power_amount = 0.0
	setplayerinfo <player> current_run = 0
	gman_setdata goal = competitive player = <player> params = {eliminated = 1}
	gman_getdata goal = competitive player = <player> name = player_lives
	<new_player_lives> = (<player_lives> - 1)
	if (<new_player_lives> = 0)
		player_completely_eliminated player = <player>
	else
		gman_setdata goal = competitive player = <player> params = {player_lives = <new_player_lives>}
	endif
	getplayerinfo <player> highway_position
	elimination_sfx_logic player = <player> highway_position = <highway_position>
endscript

script player_completely_eliminated 
	requireparams \{[
			player
		]
		all}
	getnumplayersingame
	gman_getdata \{goal = competitive
		eliminated_players}
	<new_eliminated_players> = (<eliminated_players> + <player>)
	gman_setdata goal = competitive params = {eliminated_players = <new_eliminated_players>}
	getarraysize (<new_eliminated_players>)
endscript

script competitive_revive_player 
	requireparams \{[
			player
		]
		all}
	printf 'competitive::Rule Enforcer::Revive Player %p' channel = competitive p = <player>
	gman_setdata goal = competitive player = <player> params = {eliminated = 0}
	spawnscript id = competitive competitive_temporary_immunity params = {player = <player> bonus_time = 1}
endscript

script competitive_temporary_immunity \{bonus_time = 0}
	printf 'competitive::Temporary Immunity::Protect Player %p' channel = competitive p = <player>
	gman_getdata goal = competitive player = <player> name = invincible
	getplayerinfo <player> part
	gman_setdata goal = competitive player = <player> params = {invincible = 1}
	if (<part> = vocals)
		wait \{1
			second}
	else
		getplayerinfo <player> scroll_time
		wait (<scroll_time> + <bonus_time>) seconds
	endif
	gman_setdata goal = competitive player = <player> params = {invincible = 0}
	if (<player> != 1)
		wait ((<player> - 1) * 3) gameframes
	endif
	gman_getdata \{goal = competitive
		name = difficulty_changes}
	setarrayelement arrayname = difficulty_changes index = (<player> -1) newvalue = 0
	gman_setdata goal = competitive params = {difficulty_changes = <difficulty_changes>}
endscript

script competitive_get_time_alive 
	requireparams \{[
			player
		]
		all}
	gman_getdata goal = competitive player = <player> name = current_life_start_time
	gman_getdata goal = competitive player = <player> name = past_life_time
	gman_getdata goal = competitive player = <player> name = alive
	getsongtimems
	if (<time> < 0)
		return \{time_alive = 0}
	endif
	if (<alive> = 1)
		<time_alive> = ((<past_life_time>) + (<time>) - (<current_life_start_time>))
	else
		<time_alive> = (<past_life_time>)
	endif
	return time_alive = <time_alive>
endscript

script competitive_rank_section_percent_hit \{section = 0}
	printf \{channel = competitive
		'competitive_rank_section_percent_hit'}
	competitive_compute_current_percent_hit section = <section>
	printf \{channel = competitive
		'Requesting Arbitration... current_percent_hit'}
	formattext checksumname = request_id 'standard_%s' s = <section>
	gman_requestarbitrationdata source = goalplayerdata var = current_percent_hit goal = competitive request_id = <request_id>
endscript

script competitive_compute_current_percent_hit 
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <player> current_detailedstats_array
			getplayerinfo <player> current_detailedstats_max_array
			getplayerinfo <player> part
			<notes_hit> = (($<current_detailedstats_array>) [<section>])
			<notes_max> = (($<current_detailedstats_max_array>) [<section>])
			gman_getdata \{goal = competitive
				name = overstrum_total}
			<player_overstrum_total> = (<overstrum_total> [(<player> - 1)])
			<overstrum_adjust> = 0
			if (<player_overstrum_total> > (<notes_max> - <notes_hit>))
				<overstrum_adjust> = (<player_overstrum_total> - (<notes_max> - <notes_hit>))
			endif
			if (<part> = vocals)
				<notes_hit> = 0
				<notes_max> = 1
				<percentage_hit> = (-1)
			else
				if (<notes_max> = 0)
					printf channel = competitive 'no notes in section %s' s = <section>
					return
				endif
				<percentage_hit> = (((<notes_hit> * 1.0) / ((<notes_max> + <overstrum_adjust>) * 1.0)) * 100.0)
				casttointeger \{percentage_hit}
			endif
			setarrayelement arrayname = overstrum_total index = (<player> - 1) newvalue = 0
			gman_setdata goal = competitive player = <player> params = {current_percent_hit = <percentage_hit>}
			gman_setdata goal = competitive params = {overstrum_total = <overstrum_total>}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script competitive_arbitration_complete 
	getarraysize <data_array>
	if (<array_size> > 0)
		if structurecontains structure = (<data_array> [0]) score
			printf \{channel = competitive
				'Arbitration used... score data updated'}
			competitive_rank_score data_array = <data_array>
		elseif structurecontains structure = (<data_array> [0]) current_percent_hit
			printf \{channel = competitive
				'Arbitration used... current_percent_hit data updated'}
			competitive_reward_players_for_percent_hit data_array = <data_array>
		elseif structurecontains structure = (<data_array> [0]) current_vocal_percent_hit
			printf \{channel = competitive
				'Arbitration used... current_vocal_percent_hit data updated'}
			competitive_reward_players_for_percent_hit data_array = <data_array> vocals = 1
		endif
	endif
endscript

script competitive_reward_players_for_percent_hit \{vocals = 0}
	requireparams \{[
			data_array
		]
		all}
	<local_players_scored> = []
	<custom_metric_values> = []
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
	endif
	getarraysize <data_array>
	<i> = 0
	begin
	<player> = (<data_array> [<i>].player)
	if (<vocals> = 1)
		<score> = (<data_array> [<i>].current_vocal_percent_hit)
	else
		<score> = (<data_array> [<i>].current_percent_hit)
	endif
	<custom_metric_values> = (<custom_metric_values> + {player = <player> score = <score> rank = 0})
	<i> = (<i> + 1)
	repeat <array_size>
	competitive_sort_players_by_metric metric = custom best = highest custom_metric_values = <custom_metric_values>
	getarraysize (<bonus_ruleset>.reward_value)
	<i> = 1
	begin
	<i2> = 0
	getnumplayersingame
	begin
	if (<standings> [<i2>].rank = <i>)
		if NOT (<standings> [<i2>].score <= 0)
			getplayerinfo (<standings> [<i2>].player) is_local_client
			if (<is_local_client> = 1)
				gman_getdata goal = competitive player = (<standings> [<i2>].player) name = performance_value
				<performance_value> = (<performance_value> + (<bonus_ruleset>.reward_value [(<i> - 1)]))
				gman_setdata goal = competitive player = (<standings> [<i2>].player) params = {performance_value = <performance_value>}
				<local_player> = (<standings> [<i2>].player)
				<local_players_scored> = (<local_players_scored> + <local_player>)
			endif
		endif
	endif
	gman_setdata goal = competitive player = (<standings> [<i2>].player) params = {current_percent_hit = -1 current_vocal_percent_hit = -1}
	<i2> = (<i2> + 1)
	repeat <num_players>
	<i> = (<i> + 1)
	repeat <array_size>
	getarraysize <local_players_scored>
	if (<array_size> > 0)
		if (<array_size> = 1)
			printf channel = competitive 'Playing SFX for Local Scorer: player %p' p = (<local_players_scored> [0])
			spawnscript sfx_perfectionist_section_won params = {player = (<local_players_scored> [0]) pan_wide = 0}
		else
			printf \{channel = competitive
				'Playing SFX for MULTIPLE LOCAL SCORERS'}
			spawnscript sfx_perfectionist_section_won params = {player = (<local_players_scored> [0]) pan_wide = 1}
		endif
	endif
endscript

script competitive_create_place_indicators 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		if NOT (<part> = vocals)
			formattext checksumname = element_id 'p%p_place' p = <player>
			formattext checksumname = parent_id 'gem_containerp%p' p = <player>
			if screenelementexists id = <element_id>
				destroyscreenelement id = <element_id>
			endif
			if screenelementexists \{id = gem_containerp4}
				<pos> = (520.0, 515.0)
			else
				<pos> = (460.0, 515.0)
			endif
			createscreenelement {
				type = textelement
				id = <element_id>
				parent = <parent_id>
				rgba = [255 255 255 255]
				font = fontgrid_text_a1
				pos = <pos>
				text = qs(0x787beab2)
				just = [center center]
				scale = 0.8
				z_priority = 31
			}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script competitive_update_place_indicators \{standings = [
			{
				player = 1
				rank = 1
			}
			{
				player = 2
				rank = 2
			}
			{
				player = 3
				rank = 3
			}
			{
				player = 4
				rank = 4
			}
			{
				player = 5
				rank = 5
			}
			{
				player = 6
				rank = 6
			}
			{
				player = 7
				rank = 7
			}
			{
				player = 8
				rank = 8
			}
		]}
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		if NOT (<part> = vocals)
			<i> = 0
			getarraysize <standings>
			begin
			if (<standings> [<i>].player = <player>)
				formattext checksumname = element_id 'p%p_place' p = <player>
				formattext textname = place_text qs(0x66680619) p = (<standings> [<i>].rank)
				if screenelementexists id = <element_id>
					<element_id> :se_getprops text
					if (<place_text> = <text>)
						break
					endif
					switch (<standings> [<i>].rank)
						case 1
						<scale> = 0.8
						case 2
						<scale> = 0.7
						case 3
						<scale> = 0.6
						default
						<scale> = 0.5
					endswitch
					setscreenelementprops id = <element_id> text = <place_text>
					spawnscriptnow id = competitive competitive_place_indicator_pop_scale params = {element_id = <element_id> scale = <scale>}
				endif
				break
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script competitive_place_indicator_pop_scale \{scale = 0.5}
	requireparams \{[
			element_id
		]
		all}
	<element_id> :se_setprops scale = (<scale> * 1.5) time = 0.1
	<element_id> :se_waitprops
	<element_id> :se_setprops scale = (<scale>) time = 0.1
endscript

script competitive_player_message_create 
	<meter_exists> = 0
	get_highway_hud_root_id player = <player>
	formattext checksumname = hud_player_meter 'comp_meters_p%a' a = <player>
	if screenelementexists id = <hud_player_meter>
		<meter_exists> = 1
		<display_time> = 0.25
	endif
	if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<meter_exists> = 1
		<display_time> = 0.75
	endif
	if (<meter_exists> = 1)
		<meter_message> = {meter_text = <text> meter_text_alpha = 0 meter_text_rgba = <color>}
		<hud_player_meter> :gettags
		if NOT gotparam \{meter_message_queue}
			<meter_message_queue> = []
		endif
		<meter_message_queue> = (<meter_message_queue> + <meter_message>)
		<hud_player_meter> :settags meter_message_queue = <meter_message_queue>
		getarraysize <meter_message_queue>
		if (<array_size> = 1)
			formattext checksumname = script_id 'highway%p_script' p = <player>
			killspawnedscript id = <script_id>
			<hud_player_meter> :obj_spawnscriptnow competitive_player_message_display id = <script_id> params = <...>
		endif
	endif
endscript

script competitive_player_message_display \{display_time = 1}
	begin
	<hud_player_meter> :gettags
	getarraysize <meter_message_queue>
	if (<array_size> = 0)
		break
	else
		<hud_player_meter> :se_setprops meter_text_alpha = 0
		wait \{1
			gameframe}
		<hud_player_meter> :se_waitprops
		<message_params> = (<meter_message_queue> [0])
		<hud_player_meter> :se_setprops meter_text_rgba = (<message_params>.meter_text_rgba)
		<hud_player_meter> :se_setprops meter_text = (<message_params>.meter_text)
		<hud_player_meter> :se_setprops meter_text_alpha = 1 time = 0.01
		<hud_player_meter> :se_waitprops
		wait <display_time> seconds
		<hud_player_meter> :se_setprops meter_text_alpha = 0 time = 0.2
		<hud_player_meter> :se_waitprops
		<hud_player_meter> :se_setprops meter_text = qs(0x00000000)
		<hud_player_meter> :gettags
		removearrayelement array = <meter_message_queue> index = 0
		<hud_player_meter> :settags meter_message_queue = <array>
	endif
	repeat
endscript

script competitive_create_on_highway_text \{text = qs(0x6fd50f6e)
		scale = 1.0
		color = [
			255
			255
			255
			255
		]
		alpha = 1
		use_new_message_system = 1}
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	competitive_player_message_create <...>
endscript

script competitive_show_difficulty_icon \{fade_in_time = 0.75
		wait_time = 2.0
		fade_out_time = 0.75}
	requireparams \{[
			player
			change_direction
		]
		all}
	getplayerinfo <player> part
	get_highway_hud_root_id player = <player>
	if (<part> = vocals)
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		meter = <competitive_meters_id>
	else
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			meter = <hud_player_meter>
		endif
	endif
	if NOT screenelementexists id = <meter>
		return
	endif
	if (<change_direction> = up)
		<meter> :se_setprops difficulty_up_scale = 1.0
		<meter> :se_setprops difficulty_up_alpha = 1.0 time = <fade_in_time>
	elseif (<change_direction> = down)
		<meter> :se_setprops difficulty_down_scale = 1.0
		<meter> :se_setprops difficulty_down_alpha = 1.0 time = <fade_in_time>
	endif
	block_until_diff_safe player = <player>
	if (<part> = vocals)
		wait <wait_time> seconds
		if NOT screenelementexists id = <meter>
			return
		endif
		if (<change_direction> = up)
			<meter> :se_setprops difficulty_up_alpha = 0.0 time = <fade_out_time>
		elseif (<change_direction> = down)
			<meter> :se_setprops difficulty_down_alpha = 0.0 time = <fade_out_time>
		endif
	else
		<pulse_fade_time> = 0.1
		getplayerinfo <player> scroll_time
		printf channel = meb 'PLAYER %p: SCROLL TIME = %s' p = <player> s = <scroll_time>
		<time_remaining> = <scroll_time>
		<wait_time> = (<time_remaining> * 0.6)
		wait <wait_time> seconds
		<time_remaining> = (<time_remaining> - <wait_time>)
		if (<change_direction> = up)
			begin
			if NOT screenelementexists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_up_alpha = 0.0 time = <pulse_fade_time>
			wait <pulse_fade_time> seconds
			if (<time_remaining> < (<pulse_fade_time> * 2.5))
				break
			endif
			if NOT screenelementexists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_up_alpha = 1.0 time = <pulse_fade_time>
			wait <pulse_fade_time> seconds
			<pulse_length> = (<time_remaining> * 0.1)
			wait <pulse_length> seconds
			<time_remaining> = ((<time_remaining> - <pulse_length>) - (<pulse_fade_time> * 2))
			repeat
		elseif (<change_direction> = down)
			begin
			if NOT screenelementexists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_down_alpha = 0.0 time = <pulse_fade_time>
			wait <pulse_fade_time> seconds
			if (<time_remaining> < (<pulse_fade_time> * 2.5))
				break
			endif
			if NOT screenelementexists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_down_alpha = 1.0 time = <pulse_fade_time>
			wait <pulse_fade_time> seconds
			<pulse_length> = (<time_remaining> * 0.1)
			wait <pulse_length> seconds
			<time_remaining> = ((<time_remaining> - <pulse_length>) - (<pulse_fade_time> * 2))
			repeat
		endif
	endif
endscript

script competitive_song_complete 
	printf channel = competitive 'competitive_song_complete event = %a' a = <event>
	killspawnedscript \{name = competitive_meter_track_player_scores}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	destroy_highway_color_manager player = <player>
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
	gman_passcheckpoint \{goal = competitive}
endscript

script competitive_update_band_meter 
	<ruleset> = ($competitive_rules)
	<band1_score> = 0
	<band2_score> = 0
	if structurecontains structure = $<ruleset> team
		if (($<ruleset>.team) = 1)
			if structurecontains structure = $<ruleset> ranking_criteria
				switch ($<ruleset>.ranking_criteria)
					case score
					getbandinfo \{1
						score
						out = band1_score}
					getbandinfo \{2
						score
						out = band2_score}
					case performance_value
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <player> band
						gman_getdata goal = competitive player = <player> name = performance_value
						if (<band> = 1)
							<band1_score> = (<band1_score> + <performance_value>)
						else
							<band2_score> = (<band2_score> + <performance_value>)
						endif
						getnextplayer player = <player>
						repeat <num_players>
					endif
					case elimination_order
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <player> band
						getplayerinfo <player> score
						gman_getdata goal = competitive player = <player> name = eliminated
						if (<band> = 1)
							if (<eliminated> = 0)
								<band1_score> = (<band1_score> + 1)
							endif
						else
							if (<eliminated> = 0)
								<band2_score> = (<band2_score> + 1)
							endif
						endif
						getnextplayer player = <player>
						repeat <num_players>
					endif
				endswitch
				gman_competitivemeterfunc {
					goal = competitive
					tool = comp_meter
					func = update_band
					params = {band = 1 value = <band1_score>}
				}
				gman_competitivemeterfunc {
					goal = competitive
					tool = comp_meter
					func = update_band
					params = {band = 2 value = <band2_score>}
				}
			endif
		endif
	endif
endscript

script competitive_find_winner 
	<ruleset> = ($competitive_rules)
	<band1_score> = 0
	<band2_score> = 0
	if structurecontains structure = $<ruleset> team
		if (($<ruleset>.team) = 1)
			if structurecontains structure = $<ruleset> ranking_criteria
				switch ($<ruleset>.ranking_criteria)
					case score
					getbandinfo \{1
						score
						out = band1_score}
					getbandinfo \{2
						score
						out = band2_score}
					case performance_value
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <player> band
						gman_getdata goal = competitive player = <player> name = performance_value
						if (<band> = 1)
							<band1_score> = (<band1_score> + <performance_value>)
						else
							<band2_score> = (<band2_score> + <performance_value>)
						endif
						getnextplayer player = <player>
						repeat <num_players>
					endif
					case elimination_order
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <player> band
						getplayerinfo <player> score
						if (<band> = 1)
							if (<band1_score> < <score>)
								<band1_score> = (<score>)
							endif
						else
							if (<band2_score> < <score>)
								<band2_score> = (<score>)
							endif
						endif
						getnextplayer player = <player>
						repeat <num_players>
					endif
				endswitch
				if (<band1_score> > <band2_score>)
					printf \{channel = competitive
						qs(0x32ac7cf2)}
				elseif (<band1_score> < <band2_score>)
					printf \{channel = competitive
						qs(0x4ecd5929)}
				else
					printf \{channel = competitive
						qs(0x88c08ea9)}
				endif
			endif
		endif
	endif
endscript

script competitive_get_measure_times 
	gman_songtool_getcurrentsong
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	songfilemanager func = get_num_timesig_notes song_name = <current_song>
	timesig_entry = 0
	timesig_num_val = 0
	measure_count = 0
	fretbar_entry = 0
	fretbar_count = 0
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	timesig_entry = 0
	measure_count = 0
	fretbar_entry = 0
	fretbar_count = 0
	<measure_time_array> = []
	begin
	if (<timesig_entry> < <num_timesig_notes>)
		songfilemanager func = get_timesig_note song_name = <current_song> index = <timesig_entry>
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		if (<timesig_time> <= <fretbar_time>)
			timesig_num_val = <timesig_num>
			fretbar_count = 0
			timesig_entry = (<timesig_entry> + 1)
		endif
	endif
	if (<fretbar_count> = 0)
		songfilemanager func = get_fretbar_note song_name = <current_song> index = <fretbar_entry>
		time = <fretbar_time>
		<measure_time_array> = (<measure_time_array> + <time>)
	endif
	fretbar_count = (<fretbar_count> + 1)
	if (<fretbar_count> = <timesig_num_val>)
		measure_count = (<measure_count> + 1)
		fretbar_count = 0
	endif
	fretbar_entry = (<fretbar_entry> + 1)
	repeat <num_fretbar_notes>
	return measure_times = <measure_time_array>
endscript

script competitive_sort_players_by_metric \{metric = performance_value
		best = highest}
	<standings> = []
	getnumplayersingame
	if (<num_players> > 1)
		getfirstplayer
		begin
		switch <metric>
			case score
			getplayerinfo <player> score
			<metric_value> = <score>
			case performance_value
			gman_getdata goal = competitive player = <player> name = performance_value
			<metric_value> = <performance_value>
			case custom
			<standings> = (<custom_metric_values>)
			break
		endswitch
		<standings> = (<standings> + {player = <player> score = <metric_value> rank = 0})
		getnextplayer player = <player>
		repeat <num_players>
	endif
	getarraysize <standings>
	if (<array_size> > 1)
		<i> = 0
		begin
		<i2> = 0
		<new_rank> = 1
		begin
		if (<best> = highest)
			if NOT ((<i> = <i2>) || (<standings> [<i>].score >= <standings> [<i2>].score))
				<new_rank> = (<new_rank> + 1)
			endif
		elseif (<best> = lowest)
			if NOT ((<i> = <i2>) || (<standings> [<i>].score <= <standings> [<i2>].score))
				<new_rank> = (<new_rank> + 1)
			endif
		else
			scriptassert 'score can only be ranked best=highest or best=lowest you passed best=%b' b = <best>
		endif
		<i2> = (<i2> + 1)
		repeat <array_size>
		<player> = (<standings> [<i>].player)
		<score> = (<standings> [<i>].score)
		setarrayelement arrayname = standings index = <i> newvalue = {player = <player> score = <score> rank = <new_rank>}
		<i> = (<i> + 1)
		repeat <array_size>
		if gotparam \{sort_by_rank}
			<new_standings> = []
			<i> = 1
			begin
			<i2> = 0
			begin
			if ((<standings> [<i2>].rank) = <i>)
				<new_standings> = (<new_standings> + <standings> [<i2>])
			endif
			<i2> = (<i2> + 1)
			repeat <array_size>
			<i> = (<i> + 1)
			repeat <array_size>
		endif
		<standings> = <new_standings>
	endif
	return standings = <standings>
endscript

script competitive_start_sound_scripts 
	competitive_kill_sound_scripts
	<ruleset> = ($competitive_rules)
	switch ($competitive_rules)
		case perfectionist
		case team_perfectionist
		spawnscriptnow \{sfx_perfectionist_watch_song_section_end}
		case do_or_die
		case team_do_or_die
		spawnscriptnow \{sfx_perfectionist_watch_song_section_end}
		spawnscriptnow \{sfx_do_or_die_watch_for_eliminated_player}
		case elimination
		case team_elimination
		spawnscriptnow \{sfx_elimination_watch_for_eliminated_player}
		case streakers
		case team_streakers
		spawnscriptnow \{sfx_streakers_watch_for_big_multiplier}
		case momentum
		case team_momentum
		spawnscriptnow \{sfx_momentum_watch_for_difficulty_increase}
		spawnscriptnow \{sfx_momentum_watch_for_difficulty_decrease}
	endswitch
endscript

script competitive_kill_sound_scripts 
	killspawnedscript \{name = sfx_perfectionist_watch_song_section_end}
	killspawnedscript \{name = sfx_do_or_die_watch_for_eliminated_player}
	killspawnedscript \{name = sfx_do_or_die_watch_for_eliminated_player_individual}
	killspawnedscript \{name = sfx_elimination_watch_for_eliminated_player}
	killspawnedscript \{name = sfx_elimination_watch_for_eliminated_player_individual}
	killspawnedscript \{name = sfx_streakers_watch_for_big_multiplier}
	killspawnedscript \{name = sfx_momentum_watch_for_difficulty_increase}
	killspawnedscript \{name = sfx_momentum_watch_for_difficulty_decrease}
endscript

script sfx_perfectionist_watch_song_section_end 
endscript

script sfx_do_or_die_watch_for_eliminated_player 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscript sfx_do_or_die_watch_for_eliminated_player_individual params = {<...>}
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script sfx_do_or_die_watch_for_eliminated_player_individual 
	formattext checksumname = event_name 'competitive_player_eliminated_p%p' p = <player>
	begin
	block type = <event_name>
	<player> = (<event_data>.player)
	getplayerinfo <player> highway_position
	sfx_do_or_die_player_eliminated player = <player> highway_position = <highway_position>
	printf channel = competitive 'playing Do-or-Die elimination sfx for player %p' p = <player>
	wait \{1
		gameframe}
	repeat
endscript

script sfx_elimination_watch_for_eliminated_player 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscript sfx_elimination_watch_for_eliminated_player_individual params = {<...>}
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
endscript

script sfx_elimination_watch_for_eliminated_player_individual 
	formattext checksumname = event_name 'competitive_player_eliminated_p%p' p = <player>
	begin
	block type = <event_name>
	<player> = (<event_data>.player)
	getplayerinfo <player> highway_position
	sfx_elimination_player_eliminated player = <player> highway_position = <highway_position>
	printf channel = competitive 'playing Elimination elimination sfx for player %p' p = <player>
	wait \{1
		gameframe}
	repeat
endscript

script sfx_streakers_watch_for_big_multiplier 
	begin
	block \{type = multiplier_increased}
	<player> = (<event_data>.player)
	<multiplier> = (<event_data>.multiplier)
	if (<multiplier> = 10)
		getplayerinfo <player> highway_position
		sfx_streakers_big_multiplier player = <player> multiplier = <multiplier> highway_position = <highway_position>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script sfx_momentum_watch_for_difficulty_increase 
	begin
	block \{type = player_difficulty_increased}
	<player> = (<event_data>.player)
	getplayerinfo <player> highway_position
	sfx_momentum_difficulty_increased player = <player> highway_position = <highway_position>
	wait \{1
		gameframe}
	repeat
endscript

script sfx_momentum_watch_for_difficulty_decrease 
	begin
	block \{type = player_difficulty_decreased}
	<player> = (<event_data>.player)
	getplayerinfo <player> highway_position
	sfx_momentum_difficulty_decreased player = <player> highway_position = <highway_position>
	wait \{1
		gameframe}
	repeat
endscript

script sfx_perfectionist_section_won 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	wait \{1.1
		seconds}
	spawnscriptnow spawned_point_awarded_perfectionist_sfx params = {<...>}
	printf channel = sfx qs(0xc64e0f27) a = <player> b = <highway_position>
endscript

script sfx_do_or_die_section_won 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	printf channel = sfx qs(0x10d38172) a = <player> b = <highway_position>
	spawnscriptnow spawned_point_awarded_waiting params = {<...>}
endscript

script sfx_do_or_die_player_eliminated 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	printf qs(0xf9747c61) a = <player> b = <highway_position>
	soundevent \{event = shredfest_play_suddendeath_dropped}
endscript

script sfx_elimination_player_eliminated 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	printf qs(0x8bfc2a84) a = <player> b = <highway_position>
	soundevent \{event = shredfest_play_suddendeath_dropped}
endscript

script sfx_streakers_big_multiplier 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	printf qs(0xfa136495) a = <player> b = <highway_position>
endscript

script sfx_momentum_difficulty_increased 
	printf \{channel = comp
		qs(0x80505221)}
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	momentum_difficulty_up_sfx player = <player> highway_position = <highway_position>
	printf qs(0xaeb9c072) a = <player> b = <highway_position>
endscript

script sfx_momentum_difficulty_decreased 
	printf \{channel = comp
		qs(0x2920b677)}
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	getplayerinfo <player> highway_position
	momentum_difficulty_down_sfx player = <player> highway_position = <highway_position>
	printf qs(0xfd0d7590) a = <player> b = <highway_position>
endscript

script spawn_do_diff_change \{player = 1
		direction = up}
	requireparams \{[
			player
		]
		all}
	spawnscriptnow do_diff_change_spawned params = {player = <player> direction = <direction>}
endscript

script do_diff_change_spawned 
	formattext checksumname = script_id 'p%pdifficulty_script' p = <player>
	if scriptisrunning id = <script_id>
		killspawnedscript id = <script_id>
	endif
	spawnscriptnow id = <script_id> wait_and_change_difficulty params = {player = <player> direction = <direction>}
endscript

script wait_and_change_difficulty 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_root_id player = <player>
	getplayerinfo <player> part
	if (<part> = vocals)
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		meter = <competitive_meters_id>
	else
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			meter = <hud_player_meter>
		endif
	endif
	if NOT screenelementexists id = <meter>
		return
	endif
	if (<direction> = up)
		broadcastevent type = player_difficulty_increased data = {player = <player>}
		<meter> :se_setprops difficulty_up_scale = 1.0
		<meter> :se_setprops difficulty_up_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = 1
	elseif (<direction> = down)
		broadcastevent type = player_difficulty_decreased data = {player = <player>}
		<meter> :se_setprops difficulty_down_scale = 1.0
		<meter> :se_setprops difficulty_down_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = -1
	endif
	gman_setdata goal = competitive player = <player> params = {invincible = 1}
	if (<player> != 1)
		wait ((<player> - 1) * 3) gameframes
	endif
	gman_getdata \{goal = competitive
		name = difficulty_changes}
	setarrayelement arrayname = difficulty_changes index = (<player> -1) newvalue = <difficulty_change>
	gman_setdata goal = competitive params = {difficulty_changes = <difficulty_changes>}
	spawnscript id = competitive competitive_show_difficulty_icon params = {player = <player> change_direction = <direction>}
	block_until_diff_safe player = <player>
	if (<safe> = 1)
		if (<direction> = up)
			gman_adjust_difficulty player = <player> adjustment = up
			spawnscriptnow id = competitive competitive_temporary_immunity params = {player = <player>}
		else
			gman_adjust_difficulty player = <player> adjustment = down
			spawnscriptnow id = competitive competitive_temporary_immunity params = {player = <player>}
		endif
	endif
endscript

script block_until_diff_safe 
	requireparams \{[
			player
		]}
	begin
	if NOT screenelementexists \{id = hud_root}
		return \{safe = 0}
	endif
	getplayerinfo <player> safe_to_change_difficulty
	if (<safe_to_change_difficulty> = 1)
		return \{safe = 1}
	endif
	wait \{1
		gameframe}
	repeat
endscript
