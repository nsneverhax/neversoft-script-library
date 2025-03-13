competitive_rules = faceoff
competitive_rules_array = [
	faceoff
	momentum
	momentum_plus
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
	band_vs_band
]
temp_net_comp_goals = [
	do_or_die
	elimination
]
band_vs_band = {
	text = qs(0x47dc962b)
	upper_text = qs(0x6fb6c159)
	description = qs(0x7f19953e)
	full_rules = qs(0xb0f243fe)
	image = gr_compete_band_v_band
	condition = band_lobby_is_public_vs_state
	difficulty = any
	ranking_criteria = score
	team = 1
	highway_glow = 0
	section_timer = none
}
solo_fest_mode = {
	text = qs(0x752dc50e)
	upper_text = qs(0xdd3feb54)
	description = qs(0x22865f43)
	full_rules = qs(0x91564db2)
	image = gr_competitive_fest_mode
	condition = band_lobby_is_vs_state
	team = 0
	highway_glow = 0
	section_timer = none
}
team_fest_mode = {
	text = qs(0xd3a5fe1f)
	upper_text = qs(0x1702ecf7)
	description = qs(0x94d3514f)
	full_rules = qs(0x7a70b167)
	image = gr_compete_team_fest_mode
	condition = band_lobby_is_vs_state
	team = 1
	highway_glow = 0
	section_timer = none
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
	highway_glow = 0
	section_timer = none
}
team_faceoff = {
	text = qs(0xa094ae3a)
	upper_text = qs(0x239c19c0)
	description = qs(0xc0f204c5)
	full_rules = qs(0x9aab44f4)
	image = gr_compete_team_pro_faceoff
	condition = band_lobby_is_vs_state
	difficulty = any
	ranking_criteria = score
	team = 1
	highway_glow = 0
	section_timer = none
}
do_or_die = {
	text = qs(0xc86fae2a)
	upper_text = qs(0xbd8a86e3)
	description = qs(0xeaf8cc07)
	full_rules = qs(0x1af46706)
	image = gr_competitive_do_or_die
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = invincible
	team = 0
	highway_glow = 1
	section_timer = every_section
	elimination_rules = {
		criteria = notes_missed
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		revive_interval = section
		revive_interval_value = 1
		vocals_revive_interval_value = 1
	}
	bonus_rules = {
		criteria = alive
		criteria_value = 1
		interval = section
		interval_value = 1
		vocals_interval_value = 1
		reward = performance_value
		reward_value = 1
	}
}
team_do_or_die = {
	text = qs(0x2abdc296)
	upper_text = qs(0xa6c43657)
	description = qs(0x7d248873)
	full_rules = qs(0x70c85726)
	image = gr_compete_team_do_or_die
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = invincible
	team = 1
	highway_glow = 1
	section_timer = every_section
	elimination_rules = {
		criteria = notes_missed
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		revive_interval = section
		revive_interval_value = 1
		vocals_revive_interval_value = 1
	}
	bonus_rules = {
		criteria = alive
		criteria_value = 1
		interval = section
		interval_value = 1
		vocals_interval_value = 1
		reward = performance_value
		reward_value = 1
	}
}
momentum = {
	text = qs(0xb66a211e)
	upper_text = qs(0xe70e6d12)
	description = qs(0x4ce34087)
	full_rules = qs(0x0afa400d)
	image = gr_competitive_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	double_kick_drum = 0
	team = 0
	highway_glow = 0
	section_timer = none
	elimination_rules = {
		criteria = notes_missed_sequential
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		effect = difficulty
		effect_value = down
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
momentum_plus = {
	text = qs(0xee586482)
	upper_text = qs(0x3d877751)
	description = qs(0x44c46c93)
	full_rules = qs(0xff25eef3)
	image = gr_competitive_momentum
	condition = band_lobby_is_local_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	double_kick_drum = 0
	starpower = attack
	team = 0
	highway_glow = 0
	section_timer = none
	elimination_rules = {
		criteria = notes_missed_sequential
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		effect = difficulty
		effect_value = down
	}
	bonus_rules = {
		criteria = streak
		criteria_value = 20
		interval = instant
		interval_value = 1
		reward = difficulty
		reward_value = up
	}
	attack_rules = {
		target = leader_only
		criteria = starpower
		criteria_value = 1
		effect = difficulty
		effect_value = beginner
		attack_fx = attack_bolt
	}
}
team_momentum = {
	text = qs(0x10e21a0f)
	upper_text = qs(0x2d336ab1)
	description = qs(0x83a17f71)
	full_rules = qs(0xc423a73a)
	image = gr_compete_team_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	double_kick_drum = 0
	highway_glow = 0
	section_timer = none
	elimination_rules = {
		criteria = notes_missed_sequential
		criteria_value = 3
		status_display = notes_missed
		interval = instant
		interval_value = 1
		effect = difficulty
		effect_value = down
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
	description = qs(0xceed589f)
	full_rules = qs(0xdb5bb9be)
	image = gr_competitive_perfectionist
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	team = 0
	starpower = disabled
	highway_glow = 1
	section_timer = every_section
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
	description = qs(0x8103a1a1)
	full_rules = qs(0x804505f1)
	image = gr_compete_team_perfectionist
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	starpower = disabled
	highway_glow = 1
	section_timer = every_section
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
	description = qs(0x93809fb6)
	full_rules = qs(0x2c93896e)
	image = gr_competitive_elimination
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = elimination_order
	team = 0
	min_players = 3
	highway_glow = 1
	section_timer = even_divisions
	elimination_rules = {
		criteria = score
		criteria_value = lowest
		interval = num_players
		interval_value = 2
		player_lives = 1
	}
}
team_elimination = {
	text = qs(0xac946f97)
	upper_text = qs(0xf5c7dbc8)
	description = qs(0x46d03421)
	full_rules = qs(0xa31a4922)
	image = gr_compete_team_elimination
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = elimination_order
	highway_glow = 1
	section_timer = even_divisions
	elimination_rules = {
		criteria = score
		criteria_value = lowest
		interval = num_players
		interval_value = 2
		player_lives = 1
	}
	team = 1
}
streakers = {
	text = qs(0x78525dae)
	upper_text = qs(0x3e096adf)
	description = qs(0x28fdc277)
	full_rules = qs(0xe6667b79)
	image = gr_competitive_streakers
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	team = 0
	highway_glow = 0
	section_timer = none
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
	description = qs(0x2f24f254)
	full_rules = qs(0x06ae777a)
	image = gr_compete_team_streakers
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = performance_value
	highway_glow = 0
	section_timer = none
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
		streak_bases = [
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
		num_local_finished_phrase = 0
		elimination_win = 0
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
					dont_start_on_enter
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
					score_gap_ui_script = competitive_show_score_gap
					rank_change_script = competitive_rank_change
					dont_start_on_enter
				}
				{
					name = 'section_watcher'
					type = section_watcher
					section_marker_hit = competitive_main_section_watcher_section_marker_hit
					custom_section_hit = competitive_main_section_watcher_section_marker_hit
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
	songlist_remove_first_song_in_playlist
	songlist_clear_playlist
	pushdisablerendering \{context = going_into_songlist
		type = unchecked}
	generic_event_back \{state = uistate_songlist}
endscript

script competitive_post_activate 
	if ($competitive_rules = null)
		change \{competitive_rules = do_or_die}
	endif
	competitive_store_player_difficulty
	competitive_rule_difficulty
endscript

script competitive_main_enter 
	<unhide_sp_meter> = 1
	<ruleset> = ($competitive_rules)
	if structurecontains structure = $<ruleset> starpower
		if ($<ruleset>.starpower = disabled)
			change \{disable_all_starpower = 1}
			<unhide_sp_meter> = 0
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				hide_sp_meter player = <player>
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
	if (<unhide_sp_meter> = 1)
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			show_sp_meter player = <player>
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
		endif
	endif
endscript

script competitive_song_started 
	rules = ($competitive_rules)
	highway_glow = (($<rules>).highway_glow)
	getfirstplayer \{local}
	getplayerinfo <player> part
	gman_sectionwatcherfunc goal = competitive tool = section_watcher func = start params = {highway_glow = <highway_glow>}
	gman_varwatcherfunc \{goal = competitive
		tool = streak_watcher
		func = start}
	competitive_rule_ranking_criteria
	competitive_rule_elimination
	competitive_rule_bonus
	competitive_start_sound_scripts
	if NOT ($competitive_rules = team_faceoff || $competitive_rules = band_vs_band)
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			competitive_set_difficulty_indicator player = <player>
			getnextplayer on_screen player = <player>
			repeat <num_players_shown>
		endif
	endif
	gman_setdata \{goal = competitive
		params = {
			elimination_win = 0
		}}
endscript

script competitive_store_player_difficulty 
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
		getnextplayer local player = <player>
		repeat <num_players>
		gman_setdata goal = competitive params = {player_difficulties = <player_difficulties> player_expert_plus_setting = <player_expert_plus_setting>}
	endif
endscript

script competitive_restore_player_difficulty 
	gman_getdata \{goal = competitive
		player_difficulties}
	gman_getdata \{goal = competitive
		player_expert_plus_setting}
	if NOT gotparam \{player_difficulties}
		return
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<i> = 0
		begin
		setplayerinfo <player> difficulty = (<player_difficulties> [<i>])
		setplayerinfo <player> double_kick_drum = (<player_expert_plus_setting> [<i>])
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
	competitive_set_difficulty_indicator player = <player>
	if playerinfoequals <player> is_onscreen = 1
		if playerinfoequals <player> is_local_client = 0
			if screenelementexists \{id = hud_root}
				<show_difficulty_change> = 0
				<ruleset> = ($competitive_rules)
				if structurecontains structure = $<ruleset> elimination_rules
					<elimination_ruleset> = ($<ruleset>.elimination_rules)
					if structurecontains structure = <elimination_ruleset> effect
						if (<elimination_ruleset>.effect = difficulty)
							<show_difficulty_change> = 1
						endif
					endif
				elseif structurecontains structure = ($<ruleset>) bonus_rules
					<bonus_ruleset> = ($<ruleset>.bonus_rules)
					if structurecontains structure = <bonus_ruleset> reward
						if (<bonus_ruleset>.reward = difficulty)
							<show_difficulty_change> = 1
						endif
					endif
				endif
				if (<show_difficulty_change> = 1)
					if difficulty_is_higher compare = <current_value> against = <last_value>
						<change_direction> = up
					else
						<change_direction> = down
					endif
					formattext checksumname = icon_script_id 'comp_diff_icon_p%p' p = <player>
					spawnscript id = <icon_script_id> competitive_show_difficulty_icon params = {player = <player> change_direction = <change_direction>}
				endif
			endif
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
					change \{g_player_1_points_for_section = 0}
					case 2
					change \{g_player_2_points_for_section = 0}
					case 3
					change \{g_player_3_points_for_section = 0}
					case 4
					change \{g_player_4_points_for_section = 0}
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
					change g_player_1_points_for_section = <difference>
					case 2
					change g_player_2_points_for_section = <difference>
					case 3
					change g_player_3_points_for_section = <difference>
					case 4
					change g_player_4_points_for_section = <difference>
					default
					printf \{channel = sfx
						qs(0x0eb7f0d9)}
				endswitch
			endif
			spawnscript id = competitive competitive_create_on_highway_text params = {player = <player> text = <points_text> points}
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
	if (<current_value> > 100)
		current_value = 100
	endif
	if screenelementexists id = <highway_hud_root>
		casttointeger \{current_value}
		formattext textname = new_text qs(0xcfd55336) s = <current_value>
		spawnscriptnow id = competitive competitive_create_on_highway_text params = {player = <player> text = <new_text>}
	endif
endscript

script competitive_main_elimination_watcher_varupdated 
	<ruleset> = ($competitive_rules)
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
						else
						endif
					endif
				endif
			endif
		endif
	endif
	if ($<ruleset>.ranking_criteria = elimination_order)
		competitive_elimination_check_for_winner
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
	competitive_get_num_players_eliminated
	if (<num_players_eliminated> = <num_players>)
		return \{all_players_eliminated = 1}
	else
		return \{all_players_eliminated = 0}
	endif
endscript

script competitive_get_num_players_eliminated 
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
	return num_players_eliminated = <eliminated_players> num_players = <num_players>
endscript

script competitive_main_invincible_watcher_varupdated 
endscript

script competitive_clear_all_grace_period 
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		highway_grace_period_end player = <player>
		getnextplayer local player = <player>
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
			case attack
			if (<current_value> = 1)
				gman_setdata goal = competitive player = <player> params = {invincible = 1}
				competitive_get_leaders
				if arraycontains array = <leaders> contains = <player>
					spawnscript goal_hud_competitive_shield_create params = {player = <player>}
				endif
				competitive_attack_triggered player = <player>
			else
				gman_setdata goal = competitive player = <player> params = {invincible = 0}
				spawnscript goal_hud_competitive_shield_destroy params = {player = <player>}
			endif
		endswitch
	endif
endscript

script competitive_main_streak_watcher_varupdated 
	getsongtimems
	if (<time> < 0)
		return
	endif
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
				competitive_get_streak_base player = <player>
				if (<streak_base> > <current_value>)
					competitive_set_streak_base player = <player>
				endif
				<current_value> = (<current_value> - <streak_base>)
				mod a = <current_value> b = (<streak_length>)
				if ((<mod> = 0) && (<current_value> > 0))
					if structurecontains structure = <bonus_ruleset> reward
						switch (<bonus_ruleset>.reward)
							case difficulty
							getplayerinfo <player> difficulty
							getplayerinfo <player> part
							getplayerinfo <player> double_kick_drum
							if NOT (<difficulty> = expert)
								spawn_do_diff_change player = <player> adjustment = (<bonus_ruleset>.reward_value)
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

script competitive_main_exit 
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
	killspawnedscript \{name = competitive_temporary_immunity}
	competitive_kill_sound_scripts
	destroyscreenelement \{id = competitive_container}
endscript

script competitive_rule_difficulty 
	<ruleset> = ($competitive_rules)
	if structurecontains structure = ($<ruleset>) difficulty
		switch ($<ruleset>.difficulty)
			case any
			return
			case all_one
			if structurecontains structure = ($<ruleset>) difficulty_value
				difficulty_value = ($<ruleset>.difficulty_value)
				double_kick_drum = ($<ruleset>.double_kick_drum)
				getnumplayersingame \{local}
				if (<num_players> > 0)
					getfirstplayer \{local}
					begin
					setplayerinfo <player> difficulty = <difficulty_value>
					setplayerinfo <player> double_kick_drum = <double_kick_drum>
					getnextplayer local player = <player>
					repeat <num_players>
				endif
			else
				scriptassert \{'competitive difficulty rule set to all_one but no difficulty_value set!'}
			endif
			case all_leader
			getplayerinfo \{$primary_controller
				difficulty}
		endswitch
	endif
endscript

script competitive_rule_ranking_criteria 
	<ruleset> = ($competitive_rules)
	if NOT ($competitive_rules = team_faceoff || $competitive_rules = band_vs_band)
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
		player_scores = []
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
		new_player_score = {player = <player> score = <score>}
		addarrayelement array = <player_scores> element = <new_player_score>
		player_scores = <array>
		getnextplayer player = <player>
		repeat <num_players>
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = update_players
			params = {player_scores = <player_scores>}
		}
	endif
	wait \{5
		gameframes}
	repeat
endscript

script competitive_rule_elimination 
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	if structurecontains structure = <elimination_ruleset> interval
		switch (<elimination_ruleset>.interval)
			case num_players
			getnumplayersingame
			gman_sectionwatcherfunc goal = competitive tool = section_watcher func = set_num_even_divisions params = {num_even_divisions = (<num_players> - 1)}
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
	getfirstplayer \{local}
	getplayerinfo <player> part
	show_timer = 1
	if (<part> = vocals && (<ruleset> = do_or_die || <ruleset> = team_do_or_die))
		show_timer = 0
	endif
	if (<part> = vocals && (<ruleset> = perfectionist || <ruleset> = team_perfectionist))
		show_timer = 0
	endif
	if (<show_timer> = 1)
		competitive_show_timer_to_next_section
	endif
	if structurecontains structure = <elimination_ruleset> player_lives
		player_lives = (<elimination_ruleset>.player_lives)
	else
		player_lives = -1
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		gman_setdata goal = competitive player = <player> params = {player_lives = <player_lives>}
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script competitive_show_timer_to_next_section 
	last_section = false
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> section_timer
		return
	endif
	getfirstplayer \{local}
	getplayerinfo <player> part
	if ($<ruleset>.section_timer = none)
		return
	endif
	getfirstplayer \{local}
	getplayerinfo <player> part
	gman_sectionwatcherfunc goal = competitive tool = section_watcher func = get_time_to_next_section params = {type = ($<ruleset>.section_timer) part = <part>}
	if (<time_to_next_section> > 0)
		gman_timerfunc goal = competitive tool = section_timer func = set_precise_start_time params = {precise_time = <time_to_next_section>}
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
		if (<is_last_section> = true)
			gman_timerfunc \{goal = competitive
				tool = section_timer
				func = set_sync_beep
				params = {
					beep_active = 0
				}}
		endif
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = start}
	endif
endscript

script competitive_rank_score 
	<ruleset> = ($competitive_rules)
	<worst_score> = 999999999
	<elimination> = 0
	<tie> = []
	competitive_get_num_players_eliminated
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = competitive player = <player> name = eliminated
		if (<eliminated> = 0)
			if gotparam \{data_array}
				printf \{qs(0x205475d9)}
				<i> = 0
				<score> = 999999999
				getarraysize <data_array>
				begin
				if (<data_array> [<i>].player = <player>)
					<score> = (<data_array> [<i>].score)
					break
				endif
				<i> = (<i> + 1)
				repeat <array_size>
				if (<score> = 999999999)
					scriptassert \{'Player does not exist in arbitrated data'}
				endif
			else
				printf \{qs(0x7d56546b)}
				getplayerinfo <player> score
			endif
			if (<score> = <worst_score>)
				<elimination> = tie
				<tie> = (<tie> + <player>)
			elseif (<score> < <worst_score>)
				<worst_score> = <score>
				<elimination> = not_tie
				<tie> = []
				<tie> = (<tie> + <player>)
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	if (<elimination> = tie)
		<num_remaining_players> = (<num_players> - <num_players_eliminated>)
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
		competitive_eliminate_player player = (<tie> [0])
	endif
endscript

script competitive_elimination_check_for_winner 
	<ruleset> = ($competitive_rules)
	getnumplayersingame
	competitive_get_num_players_eliminated
	if structurecontains structure = $<ruleset> team
		if ($<ruleset>.team = 0)
			if ((<num_players_eliminated>) >= (<num_players> - 1))
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
							return
						endif
					else
						<winning_band> = (<band>)
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
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	getsongtimems
	casttointeger \{time}
	if (<time> < (<total_end_time> -5000))
		gman_getdata \{goal = competitive
			elimination_win}
		if (<elimination_win> = 1)
			return
		endif
		gman_setdata \{goal = competitive
			params = {
				elimination_win = 1
			}}
		if innetgame
			if NOT scriptisrunning \{online_end_song}
				spawnscriptnow \{noqbid
					online_end_song}
			endif
		else
			if NOT scriptisrunning \{guitarevent_songwon}
				spawnscriptnow \{noqbid
					guitarevent_songwon}
			endif
		endif
	endif
endscript

script competitive_revive_all_players 
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
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
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script competitive_rule_bonus 
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
			getnumplayersingame
			gman_sectionwatcherfunc goal = competitive tool = section_watcher func = set_num_even_divisions params = {num_even_divisions = (<num_players> - 1)}
			case section
			getnumplayersingame
			if (<num_players> > 0)
				gman_eventlistenerfunc \{goal = competitive
					tool = extra_strum_listener
					func = start}
			endif
		endswitch
	endif
endscript

script competitive_rank_section_alive \{vocals = 0}
	<local_players_survived> = []
	if (<section> < 0)
		return
	endif
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
				gman_getdata goal = competitive player = <player> name = performance_value
				<performance_value> = (<performance_value> + 1)
				gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
				<local_players_survived> = (<local_players_survived> + <player>)
			endif
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	getarraysize <local_players_survived>
	if (<array_size> > 0)
		if (<array_size> = 1)
			sfx_do_or_die_section_won player = (<local_players_survived> [0]) pan_wide = 0
		else
			sfx_do_or_die_section_won player = (<local_players_survived> [0]) pan_wide = 1
		endif
	endif
endscript

script competitive_setup_results_data \{title = qs(0x302c47e0)
		source = player_info_data
		data = score
		method = highest_to_lowest}
	gman_setdata goal = competitive params = {results_screen_goal_data = {column_title = (<title>) data_source = (<source>) var_name = (<data>) ranking_method = (<method>)}}
endscript

script competitive_activate_miss_listener 
	gman_setdata goal = competitive params = {miss_num_notes = <num_notes>}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			gman_setdata goal = competitive player = <player> params = {strikes = 0}
			competitive_meter_update_strikes player = <player> strikes = 0
		endif
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
						spawn_do_diff_change player = (<event_data>.player) adjustment = (<elimination_ruleset>.effect_value)
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
	if NOT playerinfoequals (<event_data>.player) is_local_client = 1
		return
	endif
	<ruleset> = ($competitive_rules)
	<player> = (<event_data>.player)
	if structurecontains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if structurecontains structure = <elimination_ruleset> vocals_interval_value
			competitive_check_all_players_eliminated
			if NOT (<all_players_eliminated> = 1)
				getplayerinfo (<player>) interactive
				if (<interactive> = 0)
					competitive_revive_player player = <player>
				endif
			else
				competitive_revive_all_players \{vocals_only}
			endif
		endif
	endif
	<vocals_section_interval> = 1
	if structurecontains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		<valid_section> = true
		if (<valid_section> = true)
			if structurecontains structure = <bonus_ruleset> criteria
				switch (<bonus_ruleset>.criteria)
					case percent_hit
					if (<event_data>.empty_phrase = 0 || $competitive_rules = do_or_die || $competitive_rules = team_do_or_die)
						if NOT scriptisrunning \{competitive_vocals_phrase_end_watcher}
							spawnscriptnow \{id = competitive
								competitive_vocals_phrase_end_watcher}
						endif
						<percentage_hit> = (<event_data>.quality * 100)
						casttointeger \{percentage_hit}
						if (<percentage_hit> < 1)
							percentage_hit = (<percentage_hit> + 0.001)
						endif
						gman_setdata goal = competitive player = <player> params = {current_vocal_percent_hit = <percentage_hit>}
					endif
					case alive
					getplayerinfo <player> star_power_used
					if (<event_data>.phrase_score > 0 || <star_power_used> = 1)
						gman_getdata goal = competitive player = <player> name = performance_value
						<performance_value> = (<performance_value> + 1)
						gman_setdata goal = competitive player = <player> params = {performance_value = <performance_value>}
					endif
				endswitch
			endif
		endif
	endif
	<num_vocalists> = 0
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <player> part = vocals
			<num_vocalists> = (<num_vocalists> + 1)
		endif
		getnextplayer local player = <player>
		repeat <num_players>
		gman_getdata \{goal = competitive
			num_local_finished_phrase}
		if (<num_vocalists> <= (<num_local_finished_phrase> + 1))
			gman_setdata \{goal = competitive
				params = {
					num_local_finished_phrase = 0
				}}
			broadcastevent \{type = vocals_phrase_end}
		else
			gman_setdata goal = competitive params = {num_local_finished_phrase = (<num_local_finished_phrase> + 1)}
		endif
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
			gman_requestarbitrationdata source = goalplayerdata var = current_vocal_percent_hit goal = competitive request_id = <request_id>
		endif
	endif
	<i> = (<i> + 1)
	repeat
endscript

script competitive_eliminate_player 
	requireparams \{[
			player
		]
		all}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
	gman_setdata goal = competitive player = <player> params = {strikes = 0 notes_missed = 0}
	setplayerinfo <player> star_power_amount = 0.0
	setplayerinfo <player> current_run = 0
	gman_setdata goal = competitive player = <player> params = {eliminated = 1}
	gman_getdata goal = competitive player = <player> name = player_lives
	gman_competitivemeterfunc \{goal = competitive
		tool = comp_meter
		func = update_players_ui}
	<new_player_lives> = (<player_lives> - 1)
	if (<new_player_lives> = 0)
		player_completely_eliminated player = <player>
	else
		gman_setdata goal = competitive player = <player> params = {player_lives = <new_player_lives>}
	endif
	getplayerinfo <player> highway_position
	audio_gameplay_elimination_sfx_logic player = <player> highway_position = <highway_position>
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
endscript

script competitive_revive_player 
	requireparams \{[
			player
		]
		all}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
	gman_setdata goal = competitive player = <player> params = {eliminated = 0}
	gman_competitivemeterfunc \{goal = competitive
		tool = comp_meter
		func = update_players_ui}
	formattext checksumname = temp_immunity_id 'temp_immunity_p%p' p = <player>
	killspawnedscript id = <temp_immunity_id>
	spawnscript id = <temp_immunity_id> competitive_temporary_immunity params = {player = <player> bonus_time = 1}
endscript

script competitive_temporary_immunity \{bonus_time = 0}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
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
	ruleset = ($competitive_rules)
	if (<ruleset> = momentum_plus)
		getplayerinfo <player> star_power_used
		if (<star_power_used> = 0)
			gman_setdata goal = competitive player = <player> params = {invincible = 0}
		endif
	else
		gman_setdata goal = competitive player = <player> params = {invincible = 0}
	endif
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
	if (<section> < 0)
		return
	endif
	competitive_compute_current_percent_hit section = <section>
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
				<percentage_hit> = (-1)
			else
				if (<notes_max> = 0)
					<percentage_hit> = (-1)
				else
					<percentage_hit> = (((<notes_hit> * 1.0) / ((<notes_max> + <overstrum_adjust>) * 1.0)) * 100.0)
					casttointeger \{percentage_hit}
				endif
			endif
			setarrayelement arrayname = overstrum_total index = (<player> - 1) newvalue = 0
			gman_setdata goal = competitive player = <player> params = {current_percent_hit = <percentage_hit>}
			gman_setdata goal = competitive params = {overstrum_total = <overstrum_total>}
			competitive_main_percent_hit_watcher_varupdated player = <player> current_value = <percentage_hit>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script competitive_arbitration_complete 
	getarraysize <data_array>
	if (<array_size> > 0)
		if structurecontains structure = (<data_array> [0]) score
			competitive_rank_score data_array = <data_array>
		elseif structurecontains structure = (<data_array> [0]) current_percent_hit
			competitive_reward_players_for_percent_hit data_array = <data_array>
		elseif structurecontains structure = (<data_array> [0]) current_vocal_percent_hit
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
	if playerinfoequals <player> is_onscreen = 1
		if playerinfoequals <player> is_local_client = 0
			competitive_main_percent_hit_watcher_varupdated player = <player> current_value = <score>
		endif
	endif
	<custom_metric_values> = (<custom_metric_values> + {player = <player> score = <score> rank = 0})
	<i> = (<i> + 1)
	repeat <array_size>
	competitive_sort_players_by_metric metric = custom best = highest custom_metric_values = <custom_metric_values>
	getarraysize (<bonus_ruleset>.reward_value)
	<non_local_player_scored> = 0
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
				if (<standings> [<i2>].score >= 1)
					<performance_value> = (<performance_value> + (<bonus_ruleset>.reward_value [(<i> - 1)]))
				endif
				gman_setdata goal = competitive player = (<standings> [<i2>].player) params = {performance_value = <performance_value> current_percent_hit = -1 current_vocal_percent_hit = -1}
				<local_player> = (<standings> [<i2>].player)
				<local_players_scored> = (<local_players_scored> + <local_player>)
			else
				<non_local_player_scored> = 1
			endif
		endif
	endif
	<i2> = (<i2> + 1)
	repeat <num_players>
	<i> = (<i> + 1)
	repeat <array_size>
	getarraysize <local_players_scored>
	if (<array_size> > 0 || <non_local_player_scored> = 1)
		if (<array_size> = 1 && <non_local_player_scored> = 0)
			spawnscript sfx_perfectionist_section_won params = {player = (<local_players_scored> [0]) pan_wide = 0}
		else
			spawnscript \{sfx_perfectionist_section_won
				params = {
					pan_wide = 1
				}}
		endif
	endif
endscript

script competitive_player_message_create 
	<meter_exists> = 0
	get_highway_hud_root_id player = <player>
	formattext checksumname = hud_player_meter 'comp_meters_p%a' a = <player>
	if NOT screenelementexists id = <highway_hud_root>
		return
	endif
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
		if gotparam \{shift_right}
			if (<shift_right> = 1)
				<hud_player_meter> :se_setprops meter_text_pos = (195.0, 31.0)
			endif
		endif
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
		<hud_player_meter> :se_setprops meter_text = qs(0x03ac90f0)
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
		use_new_message_system = 1
		shift_right = 0}
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	if gotparam \{points}
		if ($competitive_rules = do_or_die || $competitive_rules = team_do_or_die)
			shift_right = 1
		endif
	endif
	competitive_player_message_create player = <player> text = <text> shift_right = <shift_right>
endscript

script competitive_show_score_gap \{player = !i1768515945
		score_gap = !i1768515945
		player_leading = !i1768515945}
	initial_pos = (-32.0, 60.0)
	above_pos = (-32.0, 16.0)
	below_pos = (-32.0, 105.0)
	meter_exists = 0
	vocal2_initial_pos = (-32.0, -153.0)
	vocal2_pos = (-32.0, -199.0)
	static_offset = (0.0, -35.0)
	extend_time = 0.15
	display_time = 1.5
	retract_time = 0.55
	pos_color = [68 215 22]
	neg_color = [243 43 53]
	get_highway_hud_root_id player = <player>
	formattext checksumname = hud_player_meter 'comp_meters_p%a' a = <player>
	formattext textname = text qs(0x8c5c152d) n = <score_gap> usecommas
	if screenelementexists id = <hud_player_meter>
		<meter_exists> = 1
		vocals_getactivehighwayindex player = <player>
		vocals_get_highway_pos highway_index = <active_highway_index>
		if (<highway_pos> = vocal1)
			meter_activated_pos = <below_pos>
		elseif (<highway_pos> = vocal2)
			initial_pos = <vocal2_initial_pos>
			meter_activated_pos = <vocal2_pos>
			getplayerinfo <player> vocals_highway_view
			if (<player> = 4)
				getplayerinfo \{3
					vocals_highway_view}
			endif
			if (<vocals_highway_view> = static || <vocals_highway_view> = karaoke)
				initial_pos = (<initial_pos> + <static_offset>)
				meter_activated_pos = (<meter_activated_pos> + <static_offset>)
			endif
		endif
	else
		if hud_root :desc_resolvealias \{name = alias_versus_meter
				param = versus_meter}
			if screenelementexists id = <versus_meter>
				above_pos = <below_pos>
			endif
		endif
	endif
	if screenelementexists id = <highway_hud_root>
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			<meter_exists> = 1
			if (<player_leading> = 1)
				meter_activated_pos = <above_pos>
			elseif (<player_leading> = 0)
				meter_activated_pos = <below_pos>
			endif
		endif
	endif
	if (<player_leading> = 1)
		text_color = <pos_color>
	elseif (<player_leading> = 0)
		text_color = <neg_color>
	endif
	if (<meter_exists> = 1)
		<hud_player_meter> :se_setprops gap_meter_pos = <initial_pos>
		<hud_player_meter> :se_setprops gap_amount_text = <text>
		<hud_player_meter> :se_setprops gap_amount_rgba = <text_color>
		<hud_player_meter> :se_setprops gap_meter_pos = <meter_activated_pos> time = <extend_time>
		<hud_player_meter> :se_waitprops
		wait <display_time> seconds
		if screenelementexists id = <hud_player_meter>
			<hud_player_meter> :se_setprops gap_meter_pos = <initial_pos> time = <retract_time>
			<hud_player_meter> :se_waitprops
			if screenelementexists id = <hud_player_meter>
				<hud_player_meter> :se_setprops extra_txt = qs(0x03ac90f0)
			endif
		endif
	endif
endscript

script competitive_rank_change \{player = !i1768515945
		current_rank = !i1768515945
		previous_rank = !i1768515945}
	<ruleset> = ($competitive_rules)
	if (<ruleset> = momentum_plus && <current_rank> = 1 && <previous_rank> > 1)
		getplayerinfo <player> star_power_used
		if (<star_power_used> = 1)
			spawnscript goal_hud_competitive_shield_create params = {player = <player>}
		endif
	endif
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
		if NOT screenelementexists id = <highway_hud_root>
			return
		endif
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

script competitive_clear_difficulty_icon 
	requireparams \{[
			player
		]
		all}
	formattext checksumname = icon_script_id 'comp_diff_icon_p%p' p = <player>
	killspawnedscript id = <icon_script_id>
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
	<meter> :se_setprops difficulty_up_alpha = 0
	<meter> :se_setprops difficulty_down_alpha = 0
endscript

script competitive_song_complete \{event = none}
	killspawnedscript \{name = competitive_meter_track_player_scores}
	killspawnedscript \{name = competitive_player_message_display}
	if NOT (<event> = song_quit)
		getnumplayersingame \{on_screen}
		getfirstplayer \{on_screen}
		begin
		destroy_highway_color_manager player = <player>
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
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
				casttointeger \{band1_score}
				casttointeger \{band2_score}
				band_scores = [
					{band = 1 value = <band1_score>}
					{band = 2 value = <band2_score>}
				]
				gman_competitivemeterfunc {
					goal = competitive
					tool = comp_meter
					func = update_bands
					params = {band_scores = <band_scores>}
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
				elseif (<band1_score> < <band2_score>)
				else
				endif
			endif
		endif
	endif
endscript

script competitive_get_measure_times 
	playlist_getcurrentsong
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
		<standings> = (<new_standings>)
	endif
	return standings = <standings>
endscript

script competitive_start_sound_scripts 
	competitive_kill_sound_scripts
	<ruleset> = ($competitive_rules)
	switch ($competitive_rules)
		case do_or_die
		case team_do_or_die
		spawnscriptnow \{sfx_do_or_die_watch_for_eliminated_player}
		case elimination
		case team_elimination
		spawnscriptnow \{sfx_elimination_watch_for_eliminated_player}
		case streakers
		case team_streakers
		spawnscriptnow \{sfx_streakers_watch_for_big_multiplier}
	endswitch
endscript

script competitive_kill_sound_scripts 
	killspawnedscript \{name = sfx_do_or_die_watch_for_eliminated_player}
	killspawnedscript \{name = sfx_do_or_die_watch_for_eliminated_player_individual}
	killspawnedscript \{name = sfx_elimination_watch_for_eliminated_player}
	killspawnedscript \{name = sfx_elimination_watch_for_eliminated_player_individual}
	killspawnedscript \{name = sfx_streakers_watch_for_big_multiplier}
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

script sfx_perfectionist_section_won 
	if (<pan_wide> = 0)
		if NOT gotparam \{player}
			scriptassert \{'missing param player'}
		endif
	endif
	if NOT gotparam \{player}
		getfirstplayer
	endif
	getplayerinfo <player> part
	if (<part> = vocals)
		delay_time = 0.55
	else
		delay_time = 1.1
	endif
	wait <delay_time> seconds
	spawnscriptnow audio_gameplay_spawned_point_awarded_perfectionist_sfx params = {<...>}
endscript

script sfx_do_or_die_section_won 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	spawnscriptnow audio_gameplay_spawned_point_awarded_waiting params = {<...>}
endscript

script sfx_do_or_die_player_eliminated 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	soundevent \{event = audio_multiplayer_sudden_death_dropped}
endscript

script sfx_elimination_player_eliminated 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	soundevent \{event = audio_multiplayer_sudden_death_dropped}
endscript

script sfx_streakers_big_multiplier 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
endscript

script sfx_momentum_difficulty_increased 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	audio_gameplay_play_momentum_difficulty_up_sfx player = <player> highway_position = <highway_position>
endscript

script sfx_momentum_difficulty_decreased 
	if NOT gotparam \{player}
		scriptassert \{'missing param player'}
	endif
	getplayerinfo <player> highway_position
	audio_gameplay_play_momentum_difficulty_down_sfx player = <player> highway_position = <highway_position>
endscript

script spawn_do_diff_change \{player = 1
		adjustment = up}
	requireparams \{[
			player
		]
		all}
	spawnscriptnow do_diff_change_spawned params = {player = <player> adjustment = <adjustment>}
endscript

script do_diff_change_spawned 
	formattext checksumname = script_id 'p%pdifficulty_script' p = <player>
	if scriptisrunning id = <script_id>
		killspawnedscript id = <script_id>
	endif
	spawnscriptnow id = <script_id> wait_and_change_difficulty params = {player = <player> adjustment = <adjustment>}
endscript

script competitive_adjust_difficulty 
	requireparams \{[
			player
			adjustment
		]
		all}
	getplayerinfo <player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			setplayerinfo <player> difficulty = easy
			case easy
			setplayerinfo <player> difficulty = medium
			case medium
			setplayerinfo <player> difficulty = hard
			case hard
			setplayerinfo <player> difficulty = expert
			case expert
		endswitch
		case down
		switch <difficulty>
			case easy
			setplayerinfo <player> difficulty = beginner
			case medium
			setplayerinfo <player> difficulty = easy
			case hard
			setplayerinfo <player> difficulty = medium
			case expert
			setplayerinfo <player> difficulty = hard
		endswitch
		case down_2
		switch <difficulty>
			case easy
			setplayerinfo <player> difficulty = beginner
			case medium
			setplayerinfo <player> difficulty = beginner
			case hard
			setplayerinfo <player> difficulty = easy
			case expert
			setplayerinfo <player> difficulty = medium
		endswitch
		case beginner
		setplayerinfo <player> difficulty = beginner
		case easy
		setplayerinfo <player> difficulty = easy
		case medium
		setplayerinfo <player> difficulty = medium
		case hard
		setplayerinfo <player> difficulty = hard
		case expert
		setplayerinfo <player> difficulty = expert
	endswitch
	getplayerinfo <player> part
	if NOT (<part> = vocals)
		getplayerinfo <player> difficulty
		formattext checksumname = morph_script_id 'comp_morph_speed_p%p' p = <player>
		killspawnedscript id = <morph_script_id>
		spawnscriptnow id = <morph_script_id> morph_scroll_speed params = {player = <player> difficulty = <difficulty> blend_time = 2.0}
	endif
	competitive_set_streak_base player = <player>
endscript

script wait_and_change_difficulty 
	requireparams \{[
			player
		]
		all}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
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
	competitive_get_difficulty_change_direction adjustment = <adjustment> player = <player>
	switch <change_direction>
		case up
		getplayerinfo <player> highway_position
		sfx_momentum_difficulty_increased player = <player> highway_position = <highway_position>
		<meter> :se_setprops difficulty_up_scale = 1.0
		<meter> :se_setprops difficulty_up_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = 1
		case down
		getplayerinfo <player> highway_position
		sfx_momentum_difficulty_decreased player = <player> highway_position = <highway_position>
		<meter> :se_setprops difficulty_down_scale = 1.0
		<meter> :se_setprops difficulty_down_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = -1
		case none
		return
	endswitch
	gman_setdata goal = competitive player = <player> params = {invincible = 1}
	if (<player> != 1)
		wait ((<player> - 1) * 3) gameframes
	endif
	gman_getdata \{goal = competitive
		name = difficulty_changes}
	setarrayelement arrayname = difficulty_changes index = (<player> -1) newvalue = <difficulty_change>
	gman_setdata goal = competitive params = {difficulty_changes = <difficulty_changes>}
	formattext checksumname = icon_script_id 'comp_diff_icon_p%p' p = <player>
	spawnscript id = <icon_script_id> competitive_show_difficulty_icon params = {player = <player> change_direction = <change_direction>}
	block_until_diff_safe player = <player>
	if (<safe> = 1)
		competitive_adjust_difficulty player = <player> adjustment = <adjustment>
		formattext checksumname = temp_immunity_id 'temp_immunity_p%p' p = <player>
		killspawnedscript id = <temp_immunity_id>
		spawnscriptnow id = <temp_immunity_id> competitive_temporary_immunity params = {player = <player>}
	endif
endscript

script competitive_get_difficulty_change_direction 
	switch <adjustment>
		case up
		<change_direction> = up
		case down
		case down_2
		<change_direction> = down
		case beginner
		getplayerinfo <player> difficulty
		if NOT (<difficulty> = beginner)
			<change_direction> = down
		else
			<change_direction> = none
		endif
	endswitch
	return change_direction = <change_direction>
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

script competitive_get_streak_base 
	requireparams \{[
			player
		]}
	gman_getdata \{goal = competitive
		name = streak_bases}
	<pi> = (<player> - 1)
	<streak_base> = (<streak_bases> [<pi>])
	return streak_base = <streak_base>
endscript

script competitive_set_streak_base 
	requireparams \{[
			player
		]}
	gman_getdata \{goal = competitive
		name = streak_bases}
	getplayerinfo <player> current_run
	<pi> = (<player> - 1)
	setarrayelement arrayname = streak_bases index = <pi> newvalue = <current_run>
	gman_setdata goal = competitive params = {streak_bases = <streak_bases>}
endscript

script competitive_set_difficulty_indicator 
	requireparams \{[
			player
		]}
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	getplayerinfo <player> part
	getplayerinfo <player> double_kick_drum
	getplayerinfo <player> difficulty
	switch <difficulty>
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
	if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 1)
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

script competitive_main_section_watcher_section_marker_hit 
	getfirstplayer \{local}
	getplayerinfo <player> part
	if (<part> != vocals && <vocal_phrase> = 1)
		return
	endif
	ruleset = ($competitive_rules)
	if structurecontains structure = ($<ruleset>) bonus_rules
		<bonus_ruleset> = (($<ruleset>).bonus_rules)
		switch (<bonus_ruleset>.interval)
			case num_players
			if (<bonus_ruleset>.criteria = alive)
				competitive_rank_section_alive
			endif
			case section
			if (<bonus_ruleset>.criteria = percent_hit)
				competitive_rank_section_percent_hit section = (<started_section_index> - 1)
			elseif (<bonus_ruleset>.criteria = alive)
				competitive_rank_section_alive section = (<started_section_index> - 1)
			endif
		endswitch
	endif
	if structurecontains structure = ($<ruleset>) elimination_rules
		<elimination_ruleset> = (($<ruleset>).elimination_rules)
		if structurecontains structure = <elimination_ruleset> interval
			if ((<elimination_ruleset>.interval) = section && <elimination_ruleset>.criteria = score)
				gman_requestarbitrationdata \{source = playerinfo
					var = score
					goal = competitive}
			elseif ((<elimination_ruleset>.interval) = num_players && <elimination_ruleset>.criteria = score)
				if (<callback_type> != even_divisions)
					return
				endif
				gman_requestarbitrationdata \{source = playerinfo
					var = score
					goal = competitive}
			endif
		endif
		if structurecontains structure = <elimination_ruleset> revive_interval
			if ((<elimination_ruleset>.revive_interval) = section)
				if (<part> = vocals)
					competitive_revive_all_players \{vocals_only}
				elseif (<part> != vocals && <vocal_phrase> = 0)
					competitive_revive_all_players \{exclude_vocals}
				endif
			endif
		endif
	endif
	show_timer = 1
	if (<part> = vocals && (<ruleset> = perfectionist || <ruleset> = team_perfectionist))
		show_timer = 0
	endif
	if (<part> = vocals && (<ruleset> = do_or_die || <ruleset> = team_do_or_die))
		show_timer = 0
	endif
	if (<show_timer> = 1)
		competitive_show_timer_to_next_section
	endif
	challenge_section = 0
	if (<part> = vocals && <challenge_section> = 1)
		getfirstplayer \{on_screen}
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			begin
			if (<ruleset> = perfectionist || <ruleset> = team_perfectionist)
				gman_getdata goal = competitive player = <player> name = current_vocal_percent_hit
				competitive_main_percent_hit_watcher_varupdated player = <player> current_value = <current_vocal_percent_hit>
				getnextplayer on_screen player = <player>
			endif
			repeat <num_players_shown>
		endif
		gman_setdata \{goal = competitive
			params = {
				num_local_finished_phrase = 0
			}}
		broadcastevent \{type = vocals_phrase_end}
	endif
	if NOT scriptisrunning \{competitive_main_section_display_score_gap_spawned}
		spawnscriptnow id = competitive competitive_main_section_display_score_gap_spawned params = {
			part = <part>
			text = <new_text>
			section_index = <started_section_index>
		}
	endif
endscript

script competitive_main_section_display_score_gap_spawned 
	<ruleset> = ($competitive_rules)
	if structurecontains structure = ($<ruleset>) bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if ((<bonus_ruleset>.interval = section) && (<bonus_ruleset>.reward = performance_value))
			if (<part> = vocals)
				if structurecontains structure = <bonus_ruleset> vocals_interval_value
					mod a = <section_index> b = (<bonus_ruleset>.vocals_interval_value)
					if NOT (<mod> = 0)
						return
					endif
				endif
			endif
			getnumplayersingame
			<total_players> = <num_players>
			getnumplayersingame \{local}
			<wait_time> = (0.25 + (0.2 * (<total_players> - <num_players>)))
			wait <wait_time> seconds
			if NOT gman_goalisactive \{goal = competitive}
				return
			endif
		endif
	endif
	gman_competitivemeterfunc \{goal = competitive
		tool = comp_meter
		func = display_score_gap}
endscript

script competitive_attack_triggered 
	requireparams \{[
			player
		]
		all}
	<attacker> = (<player>)
	<ruleset> = ($competitive_rules)
	if NOT structurecontains structure = $<ruleset> attack_rules
		scriptassert \{'Called competitive attack script without attack rules defined!'}
	endif
	<attack_ruleset> = ($<ruleset>.attack_rules)
	if structurecontains structure = <attack_ruleset> target
		<target> = (<attack_ruleset>.target)
		switch <target>
			case leader_only
			competitive_get_leaders exclude = <attacker>
			<victims> = (<leaders>)
			case leader_or_all
			competitive_get_leaders exclude = <attacker>
			getarraysize <leaders>
			if (<array_size> = 0)
				<victims> = all_opponents
			else
				<victims> = (<leaders>)
			endif
			case all_opponents
			<victims> = all_opponents
		endswitch
	else
		<victims> = all_opponents
	endif
	if (<victims> = all_opponents)
		<victims> = []
		getnumplayersingame
		getfirstplayer
		begin
		if NOT (<player> = <attacker>)
			<victims> = (<victims> + <player>)
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	competitive_attack_victim attacker = <attacker> victims = <victims> attack_ruleset = <attack_ruleset>
endscript

script competitive_attack_victim 
	requireparams \{[
			attacker
			victims
			attack_ruleset
		]
		all}
	getarraysize <victims>
	if (<array_size> > 0)
		<i> = 0
		begin
		<attack_status> = failed
		switch (<attack_ruleset>.effect)
			case difficulty
			gman_getdata goal = competitive player = (<victims> [<i>]) name = invincible
			if (<invincible> = 0)
				printf channel = competitive 'victim (player %v) is not currently invincible' v = (<victims> [<i>])
				spawn_do_diff_change player = (<victims> [<i>]) adjustment = (<attack_ruleset>.effect_value)
				<attack_status> = success
			else
				printf channel = competitive 'victim (player %v) is currently invincible' v = (<victims> [<i>])
				getplayerinfo (<victims> [<i>]) star_power_used
				if (<star_power_used> = 0)
					printf channel = competitive 'victim (player %v) is not shielded star_power_used=%s' v = (<victims> [<i>]) s = <star_power_used>
					competitive_clear_difficulty_icon player = (<victims> [<i>])
					spawn_do_diff_change player = (<victims> [<i>]) adjustment = (<attack_ruleset>.effect_value)
					<attack_status> = success
				else
					printf channel = competitive 'victim (player %v) is shielded star_power_used=%s' v = (<victims> [<i>]) s = <star_power_used>
					if structurecontains structure = <attack_ruleset> attack_fx
						switch (<attack_ruleset>.attack_fx)
							case attack_bolt
							spawnscript competitive_p2p_bolt_spawned params = {attacker = <attacker> victim = (<victims> [<i>])}
						endswitch
					endif
				endif
			endif
			default
		endswitch
		if (<attack_status> = success)
			if structurecontains structure = <attack_ruleset> attack_fx
				switch (<attack_ruleset>.attack_fx)
					case attack_bolt
					spawnscript competitive_p2p_bolt_spawned params = {attacker = <attacker> victim = (<victims> [<i>])}
					case lightning_strike
					competitive_lightning_strike player = (<victims> [<i>]) notes = [green red yellow blue orange]
					default
					softassert 'No FX script for attack_fx=%v' v = (<attack_ruleset>.attack_fx)
				endswitch
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	else
	endif
endscript

script competitive_get_leaders \{exclude = -1}
	<leaders> = []
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT (<exclude> = <player>)
			gman_competitivemeterfunc goal = competitive tool = comp_meter func = is_player_in_the_lead params = {player = <player>}
			if (<player_is_in_the_lead> = 1)
				<leaders> = (<leaders> + <player>)
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	return leaders = <leaders>
endscript

script competitive_lightning_strike 
	getplayerinfo <player> part
	if (<part> = vocals)
	else
		spawnscriptnow competitive_lightning_strike_spawned params = {<...>}
	endif
endscript

script competitive_lightning_strike_spawned 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	if gotparam \{notes}
		getarraysize <notes>
		if (<array_size> > 0)
			<i> = 0
			gem_array = [13093 , 0 , 0 , 0 , 0 , 0 , 0 , 13255 , 0 , 40 , 40 , 40 , 40 , 40 , 4 , 0 , 0 , 0]
			begin
			switch (<notes> [<i>])
				case green
				<gem_index> = 1
				case red
				<gem_index> = 2
				case yellow
				<gem_index> = 3
				case blue
				<gem_index> = 4
				case orange
				<gem_index> = 5
				case purple
				<gem_index> = 6
				default
				printf \{channel = competitive
					'WARNING: Illegal note in array to strike with lightning!'}
			endswitch
			setarrayelement arrayname = gem_array index = <gem_index> newvalue = 40
			<i> = (<i> + 1)
			repeat <array_size>
			<array_size> = 6
		else
			printf \{channel = competitive
				'WARNING: No notes in array to strike with lightning!'}
		endif
	else
		<gem_array> = [13093 , 40 , 0 , 0 , 0 , 0 , 0 , 13255 , 0 , 40 , 40 , 40 , 40 , 40 , 4 , 0 , 0 , 0]
		<array_size> = 6
	endif
	onexitrun guitarevent_starsequencebonus_exit params = {player = <player> gem_array = <gem_array>}
	destroy_big_bolt {player = <player> gem_array = <gem_array>}
	formattext checksumname = container_id 'nowbar_container_p%p' p = <player>
	getnowbarscale player = <player>
	player_index = (<player> - 1)
	gem_count = 0
	begin
	<note_value> = (<gem_array> [(<gem_count> + 1)])
	if (<note_value> > 0)
		if (<gem_count> = (<array_size> -1))
			if gotparam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		color = ($gem_colors [<gem_count>])
		if playerinfoequals <player> lefthanded_button_ups = 1
			<pos2d> = (($button_up_models [<player_index>]).<color>.left_pos_2d)
			<angle> = (($button_models [<player_index>]).<color>.angle)
		else
			<pos2d> = (($button_up_models [<player_index>]).<color>.pos_2d)
			<angle> = (($button_models [<player_index>]).<color>.left_angle)
		endif
		lightning_rgba_01 = [255 128 128 255]
		lightning_rgba_02 = [255 0 0 128]
		bolt_dims = (128.0, 32.0)
		formattext checksumname = name 'big_boltp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <name>
			createscreenelement {
				type = containerelement
				id = <name>
				parent = <container_id>
				pos = <pos2d>
				rot_angle = <angle>
				alpha = 1
				scale = (1.0, 1.0)
				just = [right bottom]
				z_priority = 16
				dims = (32.0, 32.0)
			}
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim01
				rgba = <lightning_rgba_01>
				rot_angle = 0
				scale = <scale>
				just = [right bottom]
				z_priority = 16
				alpha = <default_lightning_alpha>
			}
			bolt1 = <id>
			createscreenelement {
				type = spriteelement
				parent = <bolt_cont>
				material = mat_lightning_arc_anim02
				rgba = <lightning_rgba_02>
				pos = (0.0, 0.0)
				rot_angle = 0
				scale = <scale>
				just = [right bottom]
				z_priority = 16
				alpha = <default_lightning_alpha>
				dims = <bolt_dims>
			}
			bolt2 = <id>
		endif
		formattext checksumname = nameh 'big_bolt_hitp%p%e' p = <player> e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <nameh>
			createscreenelement {
				type = spriteelement
				id = <nameh>
				parent = <container_id>
				material = mat_sp_xplosion1
				rgba = [255 0 0 255]
				pos = <pos2d>
				rot_angle = 0
				scale = (2.0, 2.0)
				just = [center bottom]
				z_priority = 16
			}
		endif
		formattext checksumname = fx_id 'big_bolt_particlep%p%e' p = <player> e = <gem_count> addtostringlookup = true
		destroy2dparticlesystem id = <fx_id>
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		formattext checksumname = hwy 'highway_containerp%p' p = <player>
		if NOT objectexists id = <fx_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = sys_particle_star01_sys_particle_star01
					parent = <container_id>
					start_color = [255 32 0 255]
					end_color = [128 16 0 0]
					start_scale = (0.25, 0.25)
					end_scale = (0.25, 0.25)
					start_angle_spread = 360.0
					min_rotation = -120.0
					max_rotation = 240.0
					emit_start_radius = 0.0
					emit_radius = 2.0
					emit_rate = 0.04
					emit_dir = 0.0
					emit_spread = 44.0
					velocity = 24.0
					friction = (0.0, 66.0)
					time = 2.0
				}
			endif
		endif
		formattext checksumname = fx2_id 'big_bolt_particle2p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT objectexists id = <fx2_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx2_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = mat_star03
					parent = <container_id>
					start_color = [255 255 255 128]
					end_color = [128 128 128 0]
					start_scale = (0.125, 0.125)
					end_scale = (0.15, 0.15)
					start_angle_spread = 360.0
					min_rotation = -120.0
					max_rotation = 508.0
					emit_start_radius = 0.0
					emit_radius = 2.0
					emit_rate = 0.07
					emit_dir = 0.0
					emit_spread = 28.0
					velocity = 12.0
					friction = (0.0, 33.0)
					time = 1.0
				}
			endif
		endif
		formattext checksumname = fx3_id 'big_bolt_particle3p%p%e' p = <player> e = <gem_count> addtostringlookup = true
		<particle_pos> = <pos2d>
		<particle_pos> = (<particle_pos> - (0.0, 15.0))
		<particle_pos> = ((((<particle_pos> [0]) * <nowbar_x_scale>) * (1.0, 0.0)) + ((((<particle_pos> [1]) * <nowbar_y_scale>)) * (0.0, 1.0)))
		if NOT objectexists id = <fx3_id>
			if (($g_debug_highway_visible) = 1)
				create2dparticlesystem {
					id = <fx3_id>
					pos = <particle_pos>
					z_priority = 8.0
					material = sys_particle_lnzflare02_sys_particle_lnzflare02
					parent = <container_id>
					start_color = [255 255 255 255]
					end_color = [255 0 0 0]
					start_scale = (0.5, 0.5)
					end_scale = (0.05, 0.05)
					start_angle_spread = 360.0
					min_rotation = -500.0
					max_rotation = 500.0
					emit_start_radius = 0.0
					emit_radius = 2.0
					emit_rate = 0.05
					emit_dir = 0.0
					emit_spread = 180.0
					velocity = 12.0
					friction = (0.0, 12.0)
					time = 0.5
				}
			endif
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player = <player> gem_array = <gem_array> kill_when_empty = kill_when_empty}
	onexitrun \{nullscript}
endscript
