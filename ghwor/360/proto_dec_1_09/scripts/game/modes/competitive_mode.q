competitive_rules = faceoff
competitive_rules_array = [
	faceoff
	momentum
	0x59f8581c
	streakers
	do_or_die
	PERFECTIONIST
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
	text = qs(0xd10b1c3a)
	upper_text = qs(0xaba5da2e)
	description = qs(0x7f19953e)
	full_rules = qs(0xe0395d6b)
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
	full_rules = qs(0x65b9cdc9)
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
	full_rules = qs(0xcff8fc82)
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
	full_rules = qs(0xef421365)
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
0x59f8581c = {
	text = qs(0xf6bbffb7)
	upper_text = qs(0x92c6c821)
	description = qs(0xcd42fc73)
	full_rules = qs(0x35d836f7)
	image = gr_competitive_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	starpower = Attack
	team = 0
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
		effect_value = down_2
	}
}
PERFECTIONIST = {
	text = qs(0xb0b59e6b)
	upper_text = qs(0xcad996dd)
	description = qs(0xcd42fc73)
	full_rules = qs(0x35d836f7)
	image = gr_competitive_momentum
	condition = band_lobby_is_private_vs_state
	difficulty = all_one
	difficulty_value = medium
	ranking_criteria = score
	starpower = Attack
	team = 0
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
	}
}
team_momentum = {
	text = qs(0x10e21a0f)
	upper_text = qs(0x2d336ab1)
	description = qs(0x24f48c5d)
	full_rules = qs(0x4abc7887)
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
team_perfectionist = {
	text = qs(0x0d61ebad)
	upper_text = qs(0xeacfcece)
	description = qs(0xc205cd8b)
	full_rules = qs(0x742f38fc)
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
		player_lives = 1
	}
}
team_elimination = {
	text = qs(0xac946f97)
	upper_text = qs(0xf5c7dbc8)
	description = qs(0xc25f3add)
	full_rules = qs(0xc9b44a47)
	image = gr_compete_team_elimination
	condition = band_lobby_is_private_vs_state
	difficulty = any
	ranking_criteria = elimination_order
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
	full_rules = qs(0x918aaeff)
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
	Name = 'competitive'
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
			Name = 'main'
			tools = [
				{
					Name = 'pause'
					Type = Pause
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
					Name = 'miss_listener'
					Type = event_listener
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
					Name = 'extra_strum_listener'
					Type = event_listener
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
					Name = 'vocals_listener'
					Type = event_listener
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
					Name = 'vocals_miss_listener'
					Type = event_listener
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
					Name = 'vocals_hit_listener'
					Type = event_listener
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
					Name = 'streak_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = current_run
							Type = int
						}
					]
				}
				{
					Name = 'Starpower_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							Type = int
						}
					]
				}
				{
					Name = 'strike_watcher'
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = strikes
							Type = int
						}
					]
				}
				{
					Name = 'difficulty_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = difficulty
							Type = checksum
						}
					]
				}
				{
					Name = 'score_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = score
							Type = float
						}
						{
							Source = goalplayerdata
							var = performance_value
							Type = int
						}
					]
				}
				{
					Name = 'percent_hit_watcher'
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = current_percent_hit
							Type = float
						}
						{
							Source = goalplayerdata
							var = current_vocal_percent_hit
							Type = float
						}
					]
				}
				{
					Name = 'elimination_watcher'
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = eliminated
							Type = int
						}
					]
				}
				{
					Name = 'interactive_watcher'
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = interactive
							Type = int
						}
					]
				}
				{
					Name = 'invincible_watcher'
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = invincible
							Type = int
						}
					]
				}
				{
					Name = 'win_timer'
					Type = Timer
					start_time = 5
					end_time = 0
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					timer_style = gh5_style
					attach_hud_to_player = 0
				}
				{
					Name = 'section_timer'
					Type = Timer
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
					Name = 'comp_meter'
					Type = competitive_meter
					score_gap_ui_script = competitive_show_score_gap
					dont_start_on_enter
				}
				{
					Name = 'section_watcher'
					Type = section_watcher
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
	generic_event_choose \{nosound
		state = 0x0604ee76
		data = {
			0x28f2d5b2 = menu_back
		}}
endscript

script competitive_post_activate 
	if ($competitive_rules = NULL)
		printf \{qs(0xdbad40b4)}
		Change \{competitive_rules = do_or_die}
	endif
	competitive_store_player_difficulty
	competitive_rule_difficulty
endscript

script competitive_main_enter 
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> starpower
		if ($<ruleset>.starpower = disabled)
			Change \{disable_all_starpower = 1}
			getnumplayersingame \{on_screen}
			if (<num_players> > 0)
				getfirstplayer \{on_screen}
				begin
				hide_sp_meter Player = <Player>
				getnextplayer on_screen Player = <Player>
				repeat <num_players>
			endif
		endif
	endif
endscript

script competitive_song_started 
	competitive_rule_ranking_criteria
	competitive_rule_elimination
	competitive_rule_bonus
	competitive_start_sound_scripts
	if NOT ($competitive_rules = team_faceoff || $competitive_rules = band_vs_band)
		getnumplayersingame \{on_screen}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen}
			begin
			competitive_set_difficulty_indicator Player = <Player>
			getnextplayer on_screen Player = <Player>
			repeat <num_players_shown>
		endif
	endif
	gman_sectionwatcherfunc \{goal = competitive
		tool = section_watcher
		func = start}
endscript

script competitive_on_fret_section_indicators 
	<challenge_fretbars_array> = []
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = guitar
	songfilemanager func = get_num_fretbar_notes song_name = <current_song>
	GetArraySize <marker_array>
	if (<array_Size> = 0)
		return
	endif
	array = []
	i = 0
	begin
	AddArrayElement array = <array> element = (<marker_array> [<i>].time)
	i = (<i> + 1)
	repeat <array_Size>
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		set_challenge_marker_times Player = <Player> challenge_marker_times = <array>
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script competitive_store_player_difficulty 
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<player_difficulties> = []
		<player_expert_plus_setting> = []
		begin
		getplayerinfo <Player> difficulty
		getplayerinfo <Player> double_kick_drum
		<player_difficulties> = (<player_difficulties> + <difficulty>)
		<player_expert_plus_setting> = (<player_expert_plus_setting> + <double_kick_drum>)
		getnextplayer local Player = <Player>
		repeat <num_players>
		gman_setdata goal = competitive params = {player_difficulties = <player_difficulties> player_expert_plus_setting = <player_expert_plus_setting>}
	endif
endscript

script competitive_restore_player_difficulty 
	gman_getdata \{goal = competitive
		player_difficulties}
	gman_getdata \{goal = competitive
		player_expert_plus_setting}
	if NOT GotParam \{player_difficulties}
		return
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		<i> = 0
		begin
		setplayerinfo <Player> difficulty = (<player_difficulties> [<i>])
		setplayerinfo <Player> double_kick_drum = (<player_expert_plus_setting> [<i>])
		getnextplayer local Player = <Player>
		<i> = (<i> + 1)
		repeat <num_players>
	endif
endscript

script competitive_main_section_timer_expire 
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = Hide}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = reset}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = stop}
endscript

script competitive_section_countdown 
	get_song_section_array
	GetArraySize <song_section_array>
	begin
	GetSongTimeMs
	gman_getdata \{goal = competitive
		current_section}
	<delay> = ((((<song_section_array> [(<current_section> + 1)].time) - 5000) - (<time>)) / 1000.0)
	if (<delay> < 5.0)
		<delay> = ((((<song_section_array> [(<current_section> + 2)].time) - 5000) - (<time>)) / 1000.0)
	endif
	Wait <delay> Seconds
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = attach_timer_to_player
		params = {
			Player = 0
		}}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = show}
	gman_timerfunc \{goal = competitive
		tool = section_timer
		func = start}
	Wait \{15
		Seconds}
	repeat (<array_Size> - 1)
endscript

script stop_rhythm_hard_star 
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if StructureContains structure = <elimination_ruleset> effect
			getplayerinfo <Player> difficulty
			if ((<elimination_ruleset>.effect = difficulty) && (<difficulty> = beginner))
				<current_value> = 0
			endif
		endif
	endif
	competitive_meter_update_strikes Player = <Player> strikes = <current_value>
endscript

script competitive_main_difficulty_watcher_varupdated 
	competitive_set_difficulty_indicator Player = <Player>
endscript

script competitive_main_score_watcher_varupdated 
	competitive_update_band_meter
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	switch ($<ruleset>.ranking_criteria)
		case score
		if (<var> = score)
			formatText checksumName = element_id 'p%p_points' p = <Player>
		endif
		case performance_value
		if (<var> = performance_value)
			if GotParam \{Player}
				switch <Player>
					case 1
					Change \{g_player_1_points_for_section = 0}
					case 2
					Change \{g_player_2_points_for_section = 0}
					case 3
					Change \{g_player_3_points_for_section = 0}
					case 4
					Change \{g_player_4_points_for_section = 0}
					default
					printf \{channel = sfx
						qs(0x0eb7f0d9)}
				endswitch
			endif
			<difference> = (<current_value> - <last_value>)
			formatText TextName = points_text qs(0xb0a8de90) s = <difference>
			if GotParam \{Player}
				switch <Player>
					case 1
					Change g_player_1_points_for_section = <difference>
					case 2
					Change g_player_2_points_for_section = <difference>
					case 3
					Change g_player_3_points_for_section = <difference>
					case 4
					Change g_player_4_points_for_section = <difference>
					default
					printf \{channel = sfx
						qs(0x0eb7f0d9)}
				endswitch
			endif
			spawnscript id = competitive competitive_create_on_highway_text params = {Player = <Player> text = <points_text>}
		endif
		case elimination_order
		if (<var> = score)
			formatText checksumName = element_id 'p%p_points' p = <Player>
		endif
	endswitch
	if ScreenElementExists id = <element_id>
		SetScreenElementProps id = <element_id> text = <score_text>
	endif
endscript

script competitive_main_percent_hit_watcher_varupdated 
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id Player = <Player>
	if (<current_value> = -1)
		return
	endif
	if ScreenElementExists id = <highway_hud_root>
		CastToInteger \{current_value}
		formatText TextName = new_text qs(0xcfd55336) s = <current_value>
		SpawnScriptNow id = competitive competitive_create_on_highway_text params = {Player = <Player> text = <new_text>}
	endif
endscript

script competitive_main_elimination_watcher_varupdated 
	competitive_update_band_meter
	getplayerinfo <Player> is_onscreen
	getplayerinfo <Player> part
	if (<is_onscreen> = 1)
		if (<part> = vocals)
			if (<current_value> = 1)
				hud_vocal_dead_script Player = <Player>
				setplayerinfo <Player> scoring = 0
				formatText checksumName = event_name 'competitive_player_eliminated_p%p' p = <Player>
				broadcastevent Type = <event_name> data = {Player = <Player>}
			else
				hud_vocal_revive Player = <Player>
				setplayerinfo <Player> scoring = 1
			endif
		else
			if (<current_value> = 1)
				get_highway_hud_root_id Player = <Player>
				if ScreenElementExists id = <highway_hud_root>
					SetScreenElementProps id = <highway_hud_root> skull_alpha = 1.0
				endif
				LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <Player>
				WhammyFXOffAll Player = <Player>
				formatText checksumName = event_name 'competitive_player_eliminated_p%p' p = <Player>
				broadcastevent Type = <event_name> data = {Player = <Player>}
			else
				get_highway_hud_root_id Player = <Player>
				if ScreenElementExists id = <highway_hud_root>
					SetScreenElementProps id = <highway_hud_root> skull_alpha = 0.0
				endif
				GetSongTimeMs
				setplayerinfo <Player> interactive = 1
				setplayerinfo <Player> last_noninteractive_end_time = <time>
			endif
		endif
	endif
	if (<part> != vocals)
		<ruleset> = ($competitive_rules)
		if StructureContains structure = $<ruleset> bonus_rules
			<bonus_ruleset> = ($<ruleset>.bonus_rules)
			if StructureContains structure = <bonus_ruleset> criteria
				if (<bonus_ruleset>.criteria = alive)
					competitive_check_all_players_eliminated
					if (<all_players_eliminated> = 1)
						printf \{channel = competitive
							'All players have been eliminated...'}
						gman_timerfunc goal = <goal_id> tool = section_timer func = get_precise_time
						if (<time> > 10000)
							printf \{channel = competitive
								'There is more than 10 seconds on the countdown, reviving early!'}
							KillSpawnedScript \{Name = competitive_delayed_revive}
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
		setplayerinfo <Player> star_power_amount = 0.0
		setplayerinfo <Player> current_run = 0
		resetplayernotestreak Player = <Player>
		updaterunchange Player = <Player>
		playersetvolume Player = <Player> Volume = 0 include_drums = 1
		UpdateGuitarVolume
		WhammyFXOffAll Player = <Player>
		reset_player_touch_glow Player = <Player>
	else
		playersetvolume Player = <Player> Volume = 100
		UpdateGuitarVolume
	endif
endscript

script competitive_delayed_revive 
	Wait <delay> Seconds
	competitive_revive_all_players
endscript

script competitive_check_all_players_eliminated 
	getnumplayersingame
	<eliminated_players> = 0
	if (<num_players> > 0)
		getfirstplayer
		begin
		gman_getdata goal = competitive Player = <Player> Name = eliminated
		if (<eliminated> = 1)
			<eliminated_players> = (<eliminated_players> + 1)
		endif
		getnextplayer Player = <Player>
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
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		highway_grace_period_end Player = <Player>
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script competitive_main_starpower_watcher_varupdated 
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> starpower
		switch ($<ruleset>.starpower)
			case invincible
			if (<current_value> = 1)
				gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
				gman_setdata goal = competitive Player = <Player> params = {invincible = 1}
			else
				gman_setdata goal = competitive Player = <Player> params = {invincible = 0}
			endif
			case Attack
			if (<current_value> = 1)
				gman_setdata goal = competitive Player = <Player> params = {invincible = 1}
				competitive_attack_triggered Player = <Player>
			else
				gman_setdata goal = competitive Player = <Player> params = {invincible = 0}
			endif
		endswitch
	endif
endscript

script competitive_main_streak_watcher_varupdated 
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if StructureContains structure = <elimination_ruleset> criteria
			if (<elimination_ruleset>.criteria = notes_missed_sequential)
				if (<current_value> >= 1)
					gman_getdata goal = competitive Player = <Player> Name = strikes
					if NOT (<strikes> = 0)
						gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
					endif
				endif
			endif
		endif
	endif
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if StructureContains structure = <bonus_ruleset> criteria
			if (<bonus_ruleset>.criteria = streak)
				<streak_length> = (<bonus_ruleset>.criteria_value)
				competitive_get_streak_base Player = <Player>
				if (<streak_base> > <current_value>)
					competitive_set_streak_base Player = <Player>
				endif
				<current_value> = (<current_value> - <streak_base>)
				Mod a = <current_value> b = (<streak_length>)
				if ((<Mod> = 0) && (<current_value> > 0))
					if StructureContains structure = <bonus_ruleset> reward
						switch (<bonus_ruleset>.reward)
							case difficulty
							getplayerinfo <Player> difficulty
							getplayerinfo <Player> part
							getplayerinfo <Player> double_kick_drum
							if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 0)
								playlist_getcurrentsong
								if StructureContains structure = ($gh_songlist_props.<current_song>) double_kick
									if ($gh_songlist_props.<current_song>.double_kick = 1)
										spawn_do_diff_change Player = <Player> adjustment = (<bonus_ruleset>.reward_value)
									endif
								endif
							else
								if NOT (<difficulty> = expert)
									spawn_do_diff_change Player = <Player> adjustment = (<bonus_ruleset>.reward_value)
								endif
							endif
							case performance_value
							switch (<bonus_ruleset>.reward_value)
								case streak_length
								gman_getdata goal = competitive Player = <Player> Name = performance_value
								<points> = (<current_value> / 10)
								CastToInteger \{points}
								<performance_value> = (<performance_value> + <points>)
								gman_setdata goal = competitive Player = <Player> params = {performance_value = <performance_value>}
								case multiplier
								gman_getdata goal = competitive Player = <Player> Name = performance_value
								getplayerinfo <Player> star_power_used
								<points> = (<current_value> / 10)
								if (<points> > 4)
									<points> = 4
								endif
								if (<star_power_used> = 1)
									<points> = (<points> * 2)
								endif
								CastToInteger \{points}
								<performance_value> = (<performance_value> + <points>)
								gman_setdata goal = competitive Player = <Player> params = {performance_value = <performance_value>}
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
	if StructureContains structure = $<ruleset> starpower
		if ($<ruleset>.starpower = disabled)
			Change \{disable_all_starpower = 0}
		endif
	endif
	competitive_restore_player_difficulty
	competitive_clear_all_grace_period
	KillSpawnedScript \{id = competitive}
	KillSpawnedScript \{id = highway1_script}
	KillSpawnedScript \{id = highway2_script}
	KillSpawnedScript \{id = highway3_script}
	KillSpawnedScript \{id = highway4_script}
	KillSpawnedScript \{Name = competitive_create_on_highway_text}
	competitive_kill_sound_scripts
	DestroyScreenElement \{id = competitive_container}
endscript

script competitive_rule_difficulty 
	<ruleset> = ($competitive_rules)
	if StructureContains structure = ($<ruleset>) difficulty
		switch ($<ruleset>.difficulty)
			case any
			return
			case all_one
			if StructureContains structure = ($<ruleset>) difficulty_value
				difficulty_value = ($<ruleset>.difficulty_value)
				getnumplayersingame \{local}
				if (<num_players> > 0)
					getfirstplayer \{local}
					begin
					setplayerinfo <Player> difficulty = <difficulty_value>
					getnextplayer local Player = <Player>
					repeat <num_players>
				endif
			else
				ScriptAssert \{'competitive difficulty rule set to all_one but no difficulty_value set!'}
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
				Source = band_info_data
				data = score}
		else
			competitive_setup_results_data
		endif
		metric = score
		case time_alive
		competitive_setup_results_data \{title = qs(0xdb6c469d)
			Source = player_goal_data
			data = performance_value}
		metric = time_alive
		case elimination_order
		competitive_setup_results_data \{title = qs(0xc35ef9eb)
			Source = player_info_data
			data = score}
		metric = elimination_order
		case performance_value
		competitive_setup_results_data \{title = qs(0x85a8f425)
			Source = player_goal_data
			data = performance_value}
		metric = performance_value
	endswitch
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_ranking_order
		params = {ranking_order = <ranking_order>}
	}
	SpawnScriptNow competitive_meter_track_player_scores params = {metric = <metric>}
endscript

script competitive_meter_track_player_scores 
	begin
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT GMan_GoalIsActive \{goal = competitive}
			return
		endif
		switch <metric>
			case score
			getplayerinfo <Player> score
			CastToInteger \{score}
			case time_alive
			competitive_get_time_alive Player = <Player>
			<score> = (<time_alive> / 1000.0)
			case elimination_order
			getplayerinfo <Player> score
			CastToInteger \{score}
			case performance_value
			gman_getdata goal = competitive Player = <Player> Name = performance_value
			<score> = (<performance_value>)
			CastToInteger \{score}
			case performance_value_percent
			gman_getdata goal = competitive Player = <Player> Name = performance_value
			<score> = (<performance_value>)
			CastToInteger \{score}
		endswitch
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = update_player
			params = {Player = <Player> score = <score>}
		}
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script competitive_rule_elimination 
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	if StructureContains structure = <elimination_ruleset> interval
		switch (<elimination_ruleset>.interval)
			case section
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> part
				if NOT (<part> = vocals)
					if NOT ScriptIsRunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT ScriptIsRunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
				spawnscript id = competitive competitive_section_elimination params = {sections = (<elimination_ruleset>.interval_value)}
				competitive_on_fret_section_indicators
			endif
			case num_players
			if NOT ScriptIsRunning \{competitive_segment_song_by_num_players}
				spawnscript \{id = competitive
					competitive_segment_song_by_num_players}
			endif
			if NOT ScriptIsRunning \{competitive_segment_elimination}
				spawnscript \{id = competitive
					competitive_segment_elimination}
			endif
			case instant
			if StructureContains structure = <elimination_ruleset> criteria
				switch (<elimination_ruleset>.criteria)
					case notes_missed
					if StructureContains structure = <elimination_ruleset> criteria_value
						num_notes = (<elimination_ruleset>.criteria_value)
					else
						num_notes = 1
					endif
					competitive_activate_miss_listener num_notes = <num_notes>
					case notes_missed_sequential
					if StructureContains structure = <elimination_ruleset> criteria_value
						num_notes = (<elimination_ruleset>.criteria_value)
					else
						num_notes = 1
					endif
					competitive_activate_miss_listener num_notes = <num_notes>
				endswitch
			endif
		endswitch
	endif
	if StructureContains structure = <elimination_ruleset> player_lives
		player_lives = (<elimination_ruleset>.player_lives)
	else
		player_lives = -1
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		gman_setdata goal = competitive Player = <Player> params = {player_lives = <player_lives>}
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
	if StructureContains structure = <elimination_ruleset> revive_interval
		switch (<elimination_ruleset>.revive_interval)
			case section
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> part
				if NOT (<part> = vocals)
					if NOT ScriptIsRunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT ScriptIsRunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
				spawnscript id = competitive competitive_section_revival params = {interval = (<elimination_ruleset>.revive_interval)}
				competitive_on_fret_section_indicators
			endif
		endswitch
	endif
endscript

script competitive_segment_elimination 
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	begin
	Block \{Type = song_segment_by_num_players_end}
	if StructureContains structure = <elimination_ruleset> criteria
		switch (<elimination_ruleset>.criteria)
			case score
			gman_requestarbitrationdata \{Source = playerinfo
				var = score
				goal = competitive}
		endswitch
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_segment_bonus 
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	begin
	Block \{Type = song_segment_by_num_players_end}
	Wait \{10
		gameframes}
	if StructureContains structure = <bonus_ruleset> criteria
		switch (<bonus_ruleset>.criteria)
			case alive
			competitive_rank_section_alive
		endswitch
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_section_elimination \{sections = 1}
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> elimination_rules
		return
	endif
	<elimination_ruleset> = ($<ruleset>.elimination_rules)
	begin
	Block \{Type = song_section_end}
	<section> = (<event_data>.section)
	Mod a = (<section> + 1) b = (<sections>)
	if ((<Mod> = 0) && ((<section> + 1) >= <sections>))
		if StructureContains structure = <elimination_ruleset> criteria
			switch (<elimination_ruleset>.criteria)
				case score
				gman_requestarbitrationdata \{Source = playerinfo
					var = score
					goal = competitive}
			endswitch
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_rank_score 
	<ruleset> = ($competitive_rules)
	<worst_score> = 999999999
	<eliminated> = 0
	<tie> = []
	gman_getdata \{goal = competitive
		Name = eliminated_players}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT ArrayContains array = <eliminated_players> contains = <Player>
			if GotParam \{data_array}
				<i> = 0
				GetArraySize <data_array>
				begin
				if (<data_array> [<i>].Player = <Player>)
					<score> = (<data_array> [<i>].score)
					break
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			else
				getplayerinfo <Player> score
			endif
			if (<score> = <worst_score>)
				<eliminated> = tie
				<tie> = (<tie> + <Player>)
			elseif (<score> < <worst_score>)
				<worst_score> = <score>
				<eliminated> = <Player>
				<tie> = []
				<tie> = (<tie> + <Player>)
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	if (<eliminated> = tie)
		GetArraySize <eliminated_players>
		<num_remaining_players> = (<num_players> - <array_Size>)
		GetArraySize <tie>
		<num_tied_players> = <array_Size>
		if (<num_remaining_players> != <num_tied_players>)
			<i> = 0
			begin
			competitive_eliminate_player Player = (<tie> [<i>])
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	else
		competitive_eliminate_player Player = <eliminated>
	endif
	gman_getdata \{goal = competitive
		Name = eliminated_players}
	GetArraySize <eliminated_players>
	if StructureContains structure = $<ruleset> team
		if ($<ruleset>.team = 0)
			if ((<array_Size>) >= (<num_players> - 1))
				competitive_mode_final_elimination_complete
			endif
		else
			<winning_band> = -1
			getnumplayersingame
			if (<num_players> > 0)
				getfirstplayer
				begin
				getplayerinfo <Player> Band
				gman_getdata goal = competitive Player = <Player> Name = eliminated
				if (<eliminated> = 0)
					if NOT (<winning_band> = -1)
						if NOT (<winning_band> = <Band>)
							return
						endif
					else
						<winning_band> = (<Band>)
					endif
				endif
				getnextplayer Player = <Player>
				repeat <num_players>
				competitive_mode_final_elimination_complete
			endif
		endif
	endif
endscript

script competitive_mode_final_elimination_complete 
	playlist_getcurrentsong
	songfilemanager func = get_song_end_time song_name = <current_song>
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> < (<total_end_time> -5000))
		spawnscript \{noqbid
			GuitarEvent_SongWon}
	endif
endscript

script competitive_segment_song_by_num_players 
	playlist_getcurrentsong
	competitive_get_measure_times
	GetArraySize <measure_times>
	getnumplayersingame
	<segments> = (<num_players> - 1)
	<measures_per_segment> = (<array_Size> / <segments>)
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
	GetSongTimeMs
	<segment_length> = (<time_per_segment> [<i>] - <time>)
	if NOT GotParam \{notimer}
		<new_time> = (<segment_length>)
		CastToInteger \{new_time}
		gman_timerfunc goal = competitive tool = section_timer func = set_precise_start_time params = {precise_time = (<new_time>)}
		gman_timerfunc \{goal = competitive
			tool = section_timer
			func = attach_timer_to_player
			params = {
				Player = 0
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
	GetSongTimeMs
	if (<time> > (<time_per_segment> [<i>]))
		break
	endif
	Wait \{1
		Frame}
	repeat
	GetSongTimeMs
	broadcastevent \{Type = song_segment_by_num_players_end}
	<i> = (<i> + 1)
	repeat <segments>
endscript

script competitive_section_revival 
	begin
	Block \{Type = song_section_end}
	<section> = (<event_data>.section)
	competitive_revive_all_players \{exclude_vocals}
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_revive_all_players 
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		gman_getdata goal = competitive Player = <Player> Name = eliminated
		getplayerinfo <Player> part
		if GotParam \{vocals_only}
			if NOT (<part> = vocals)
				<eliminated> = 0
			endif
		elseif GotParam \{exclude_vocals}
			if (<part> = vocals)
				<eliminated> = 0
			endif
		endif
		if (<eliminated> = 1)
			gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
			competitive_revive_player Player = <Player>
		elseif (<part> = vocals)
			getplayerinfo <Player> scoring
			if (<scoring> = 0)
				gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
				competitive_revive_player Player = <Player>
			endif
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script competitive_rule_bonus 
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	if StructureContains structure = <bonus_ruleset> interval
		switch (<bonus_ruleset>.interval)
			case instant
			if StructureContains structure = <bonus_ruleset> criteria
				switch (<bonus_ruleset>.criteria)
					case streak
					streak_length = (<bonus_ruleset>.criteria_value)
					gman_setdata goal = competitive params = {bonus_streak_length = <streak_length>}
				endswitch
			endif
			case num_players
			if NOT ScriptIsRunning \{competitive_segment_song_by_num_players}
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
				getplayerinfo <Player> part
				if NOT (<part> = vocals)
					if NOT ScriptIsRunning \{section_watcher}
						spawnscript \{id = competitive
							section_watcher
							params = {
								goal_id = competitive
								show_timer = 1
							}}
					endif
				else
					if NOT ScriptIsRunning \{competitive_vocals_section_watcher}
						spawnscript \{id = competitive
							competitive_vocals_section_watcher}
					endif
				endif
				getnextplayer Player = <Player>
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
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> bonus_rules
		return
	endif
	<bonus_ruleset> = ($<ruleset>.bonus_rules)
	begin
	Block \{Type = song_section_end}
	<section> = (<event_data>.section)
	if StructureContains structure = <bonus_ruleset> criteria
		switch (<bonus_ruleset>.criteria)
			case percent_hit
			competitive_rank_section_percent_hit section = <section>
			case alive
			competitive_rank_section_alive section = <section>
		endswitch
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_rank_section_alive \{vocals = 0}
	<local_players_survived> = []
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> interactive
		getplayerinfo <Player> part
		if ((<vocals> = 1) && (<part> = vocals))
			if (<interactive> = 1)
				gman_getdata goal = competitive Player = <Player> Name = performance_value
				<performance_value> = (<performance_value> + 1)
				gman_setdata goal = competitive Player = <Player> params = {performance_value = <performance_value>}
				<local_players_survived> = (<local_players_survived> + <Player>)
			endif
		elseif ((<vocals> = 0) && (<part> != vocals))
			if (<interactive> = 1)
				getplayerinfo <Player> current_detailedstats_array
				<notes_hit> = (($<current_detailedstats_array>) [<section>])
				if NOT (<notes_hit> = 0)
					gman_getdata goal = competitive Player = <Player> Name = performance_value
					<performance_value> = (<performance_value> + 1)
					gman_setdata goal = competitive Player = <Player> params = {performance_value = <performance_value>}
					<local_players_survived> = (<local_players_survived> + <Player>)
				endif
			endif
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
	GetArraySize <local_players_survived>
	if (<array_Size> > 0)
		if (<array_Size> = 1)
			sfx_do_or_die_section_won Player = (<local_players_survived> [0]) pan_wide = 0
		else
			sfx_do_or_die_section_won Player = (<local_players_survived> [0]) pan_wide = 1
		endif
	endif
endscript

script competitive_setup_results_data \{title = qs(0x302c47e0)
		Source = player_info_data
		data = score
		method = highest_to_lowest}
	gman_setdata goal = competitive params = {results_screen_goal_data = {column_title = (<title>) data_source = (<Source>) var_name = (<data>) ranking_method = (<method>)}}
endscript

script competitive_activate_miss_listener 
	gman_setdata goal = competitive params = {miss_num_notes = <num_notes>}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			gman_setdata goal = competitive Player = <Player> params = {strikes = 0}
			competitive_meter_update_strikes Player = <Player> strikes = 0
		endif
		getnextplayer Player = <Player>
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
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		if StructureContains structure = <elimination_ruleset> criteria
			if (<elimination_ruleset>.criteria = notes_missed_sequential)
				gman_getdata goal = competitive Player = <Player> Name = strikes
				if NOT (<strikes> = 0)
					gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
				endif
			endif
		endif
	endif
endscript

script competitive_main_miss_listener_gotevent 
	gman_getdata goal = competitive Player = (<event_data>.Player) Name = eliminated
	if (<eliminated> = 1)
		return
	endif
	getplayerinfo (<event_data>.Player) time_of_first_note
	if (<tool_id> = extra_strum_listener)
		gman_getdata \{goal = competitive
			Name = overstrum_total}
		<player_overstrum_total> = (<overstrum_total> [(<event_data>.Player - 1)] + 1)
		SetArrayElement ArrayName = overstrum_total index = (<event_data>.Player - 1) NewValue = (<player_overstrum_total>)
		gman_setdata goal = competitive params = {overstrum_total = <overstrum_total>}
	endif
	if StructureContains structure = <event_data> songtime
		if (<time_of_first_note> > <event_data>.songtime)
			return
		endif
	else
		gman_getdata \{goal = competitive
			Name = last_missed_note_index}
		if StructureContains structure = <event_data> array_entry
			if (<event_data>.array_entry = <last_missed_note_index> [(<event_data>.Player - 1)])
				return
			endif
			SetArrayElement ArrayName = last_missed_note_index index = (<event_data>.Player - 1) NewValue = (<event_data>.array_entry)
			gman_setdata goal = competitive params = {last_missed_note_index = <last_missed_note_index>}
		endif
	endif
	<ruleset> = ($competitive_rules)
	gman_getdata goal = competitive Player = (<event_data>.Player) Name = invincible
	if (<invincible> = 1)
		return
	endif
	gman_getdata \{goal = competitive
		miss_num_notes}
	if NOT GotParam \{miss_num_notes}
		return
	endif
	gman_getdata goal = competitive Player = (<event_data>.Player) Name = strikes
	<missed_notes> = (<strikes> + 1)
	gman_setdata goal = competitive Player = (<event_data>.Player) params = {strikes = <missed_notes>}
	if (<missed_notes> >= <miss_num_notes>)
		if StructureContains structure = $<ruleset> elimination_rules
			<elimination_ruleset> = ($<ruleset>.elimination_rules)
			if StructureContains structure = <elimination_ruleset> effect
				switch (<elimination_ruleset>.effect)
					case difficulty
					getplayerinfo (<event_data>.Player) difficulty
					if NOT (<difficulty> = beginner)
						spawn_do_diff_change Player = (<event_data>.Player) adjustment = (<elimination_ruleset>.effect_value)
					endif
					gman_setdata goal = competitive Player = (<event_data>.Player) params = {strikes = 0 notes_missed = 0}
				endswitch
			else
				competitive_eliminate_player Player = (<event_data>.Player)
			endif
		endif
	endif
endscript

script competitive_main_vocals_listener_gotevent 
	<ruleset> = ($competitive_rules)
	<Player> = (<event_data>.Player)
	if NOT playerinfoequals (<event_data>.Player) is_local_client = 1
		return
	endif
	if StructureContains structure = $<ruleset> elimination_rules
		<elimination_ruleset> = ($<ruleset>.elimination_rules)
		gman_getdata goal = competitive Player = <Player> Name = invincible
		getplayerinfo (<Player>) interactive
		if StructureContains structure = <elimination_ruleset> revive_interval
			if (<interactive> = 0)
				competitive_revive_player
			endif
		endif
	endif
	<vocals_section_interval> = 1
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		<valid_section> = true
		if StructureContains structure = <bonus_ruleset> vocals_interval_value
			vocals_section_interval = (<bonus_ruleset>.vocals_interval_value)
			<section_index> = (<event_data>.section_index)
			<last_phrase> = (<event_data>.last_phrase)
			if NOT (<last_phrase> = 1)
				if NOT (<section_index> = -1)
					Mod a = <section_index> b = <vocals_section_interval>
					if NOT (<Mod> = 0)
						<valid_section> = FALSE
					endif
				else
					<valid_section> = FALSE
				endif
			endif
			if (<section_index> = 0)
				<valid_section> = FALSE
			endif
		endif
		if (<valid_section> = true)
			if StructureContains structure = <bonus_ruleset> criteria
				switch (<bonus_ruleset>.criteria)
					case percent_hit
					if (<event_data>.empty_phrase = 0)
						if NOT ScriptIsRunning \{competitive_vocals_phrase_end_watcher}
							SpawnScriptNow \{id = competitive
								competitive_vocals_phrase_end_watcher}
						endif
						<percentage_hit> = (<event_data>.quality * 100)
						CastToInteger \{percentage_hit}
						gman_setdata goal = competitive Player = <Player> params = {current_vocal_percent_hit = <percentage_hit>}
					endif
					case alive
					if (<event_data>.phrase_score > 0 || <vocals_section_interval> > 1)
						gman_getdata goal = competitive Player = <Player> Name = performance_value
						<performance_value> = (<performance_value> + 1)
						gman_setdata goal = competitive Player = <Player> params = {performance_value = <performance_value>}
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
		if playerinfoequals <Player> part = vocals
			<num_vocalists> = (<num_vocalists> + 1)
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
		gman_getdata \{goal = competitive
			num_local_finished_phrase}
		if (<num_vocalists> <= (<num_local_finished_phrase> + 1))
			gman_setdata \{goal = competitive
				params = {
					num_local_finished_phrase = 0
				}}
			broadcastevent \{Type = vocals_phrase_end}
		else
			gman_setdata goal = competitive params = {num_local_finished_phrase = (<num_local_finished_phrase> + 1)}
		endif
	endif
endscript

script competitive_vocals_phrase_end_watcher 
	<ruleset> = ($competitive_rules)
	<i> = 1
	begin
	Block \{Type = vocals_phrase_end}
	formatText checksumName = request_id 'vocals_%s' s = <i>
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if (<bonus_ruleset>.criteria = percent_hit)
			gman_requestarbitrationdata Source = goalplayerdata var = current_vocal_percent_hit goal = competitive request_id = <request_id>
		endif
	endif
	<i> = (<i> + 1)
	repeat
endscript

script competitive_vocals_section_watcher 
	<ruleset> = ($competitive_rules)
	<section> = 0
	playlist_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = vocals
	<song_section_array> = <marker_array>
	GetArraySize <song_section_array>
	songfilemanager func = get_song_end_time song_name = <current_song>
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMs
	<new_time> = ((<song_section_array> [1].time) - (<time>))
	<vocals_section_interval> = 1
	if StructureContains structure = $<ruleset> elimination_rules
		elimination_ruleset = ($<ruleset>.elimination_rules)
		if StructureContains structure = <elimination_ruleset> vocals_revive_interval_value
			<vocals_section_interval> = (<elimination_ruleset>.vocals_revive_interval_value)
		endif
	endif
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<section> >= (<array_Size> - 1))
		break
	elseif ((<song_section_array> [(<section> + 1)].time) < (<time>))
		<section> = (<section> + 1)
		Mod a = <section> b = <vocals_section_interval>
		if (<Mod> = 0)
			if StructureContains structure = $<ruleset> elimination_rules
				<elimination_ruleset> = ($<ruleset>.elimination_rules)
				if StructureContains structure = <elimination_ruleset> revive_interval
					competitive_revive_all_players \{vocals_only}
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> > <total_end_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_eliminate_player 
	RequireParams \{[
			Player
		]
		all}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	gman_setdata goal = competitive Player = <Player> params = {strikes = 0 notes_missed = 0}
	setplayerinfo <Player> star_power_amount = 0.0
	setplayerinfo <Player> current_run = 0
	gman_setdata goal = competitive Player = <Player> params = {eliminated = 1}
	gman_getdata goal = competitive Player = <Player> Name = player_lives
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = update_player
		params = {Player = <Player>}
	}
	<new_player_lives> = (<player_lives> - 1)
	if (<new_player_lives> = 0)
		player_completely_eliminated Player = <Player>
	else
		gman_setdata goal = competitive Player = <Player> params = {player_lives = <new_player_lives>}
	endif
	getplayerinfo <Player> highway_position
	audio_gameplay_elimination_sfx_logic Player = <Player> highway_position = <highway_position>
endscript

script player_completely_eliminated 
	RequireParams \{[
			Player
		]
		all}
	getnumplayersingame
	gman_getdata \{goal = competitive
		eliminated_players}
	<new_eliminated_players> = (<eliminated_players> + <Player>)
	gman_setdata goal = competitive params = {eliminated_players = <new_eliminated_players>}
endscript

script competitive_revive_player 
	RequireParams \{[
			Player
		]
		all}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	gman_setdata goal = competitive Player = <Player> params = {eliminated = 0}
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = update_player
		params = {Player = <Player>}
	}
	spawnscript id = competitive competitive_temporary_immunity params = {Player = <Player> bonus_time = 1}
endscript

script competitive_temporary_immunity \{bonus_time = 0}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	gman_getdata goal = competitive Player = <Player> Name = invincible
	getplayerinfo <Player> part
	gman_setdata goal = competitive Player = <Player> params = {invincible = 1}
	if (<part> = vocals)
		Wait \{1
			Second}
	else
		getplayerinfo <Player> scroll_time
		Wait (<scroll_time> + <bonus_time>) Seconds
	endif
	gman_setdata goal = competitive Player = <Player> params = {invincible = 0}
	if (<Player> != 1)
		Wait ((<Player> - 1) * 3) gameframes
	endif
	gman_getdata \{goal = competitive
		Name = difficulty_changes}
	SetArrayElement ArrayName = difficulty_changes index = (<Player> -1) NewValue = 0
	gman_setdata goal = competitive params = {difficulty_changes = <difficulty_changes>}
endscript

script competitive_get_time_alive 
	RequireParams \{[
			Player
		]
		all}
	gman_getdata goal = competitive Player = <Player> Name = current_life_start_time
	gman_getdata goal = competitive Player = <Player> Name = past_life_time
	gman_getdata goal = competitive Player = <Player> Name = alive
	GetSongTimeMs
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
	competitive_compute_current_percent_hit section = <section>
	formatText checksumName = request_id 'standard_%s' s = <section>
	gman_requestarbitrationdata Source = goalplayerdata var = current_percent_hit goal = competitive request_id = <request_id>
endscript

script competitive_compute_current_percent_hit 
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
	endif
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <Player> current_detailedstats_array
			getplayerinfo <Player> current_detailedstats_max_array
			getplayerinfo <Player> part
			<notes_hit> = (($<current_detailedstats_array>) [<section>])
			<notes_max> = (($<current_detailedstats_max_array>) [<section>])
			gman_getdata \{goal = competitive
				Name = overstrum_total}
			<player_overstrum_total> = (<overstrum_total> [(<Player> - 1)])
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
					<percentage_hit> = (-1)
				else
					<percentage_hit> = (((<notes_hit> * 1.0) / ((<notes_max> + <overstrum_adjust>) * 1.0)) * 100.0)
					CastToInteger \{percentage_hit}
				endif
			endif
			SetArrayElement ArrayName = overstrum_total index = (<Player> - 1) NewValue = 0
			gman_setdata goal = competitive Player = <Player> params = {current_percent_hit = <percentage_hit>}
			gman_setdata goal = competitive params = {overstrum_total = <overstrum_total>}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script competitive_arbitration_complete 
	GetArraySize <data_array>
	if (<array_Size> > 0)
		if StructureContains structure = (<data_array> [0]) score
			competitive_rank_score data_array = <data_array>
		elseif StructureContains structure = (<data_array> [0]) current_percent_hit
			competitive_reward_players_for_percent_hit data_array = <data_array>
		elseif StructureContains structure = (<data_array> [0]) current_vocal_percent_hit
			competitive_reward_players_for_percent_hit data_array = <data_array> vocals = 1
		endif
	endif
endscript

script competitive_reward_players_for_percent_hit \{vocals = 0}
	RequireParams \{[
			data_array
		]
		all}
	<local_players_scored> = []
	<custom_metric_values> = []
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
	endif
	GetArraySize <data_array>
	<i> = 0
	begin
	<Player> = (<data_array> [<i>].Player)
	if (<vocals> = 1)
		<score> = (<data_array> [<i>].current_vocal_percent_hit)
	else
		<score> = (<data_array> [<i>].current_percent_hit)
	endif
	<custom_metric_values> = (<custom_metric_values> + {Player = <Player> score = <score> rank = 0})
	<i> = (<i> + 1)
	repeat <array_Size>
	competitive_sort_players_by_metric metric = custom best = highest custom_metric_values = <custom_metric_values>
	GetArraySize (<bonus_ruleset>.reward_value)
	<i> = 1
	begin
	<i2> = 0
	getnumplayersingame
	begin
	if (<standings> [<i2>].rank = <i>)
		if NOT (<standings> [<i2>].score <= 0)
			getplayerinfo (<standings> [<i2>].Player) is_local_client
			if (<is_local_client> = 1)
				gman_getdata goal = competitive Player = (<standings> [<i2>].Player) Name = performance_value
				<performance_value> = (<performance_value> + (<bonus_ruleset>.reward_value [(<i> - 1)]))
				gman_setdata goal = competitive Player = (<standings> [<i2>].Player) params = {performance_value = <performance_value>}
				<local_player> = (<standings> [<i2>].Player)
				<local_players_scored> = (<local_players_scored> + <local_player>)
			endif
		endif
	endif
	gman_setdata goal = competitive Player = (<standings> [<i2>].Player) params = {current_percent_hit = -1 current_vocal_percent_hit = -1}
	<i2> = (<i2> + 1)
	repeat <num_players>
	<i> = (<i> + 1)
	repeat <array_Size>
	GetArraySize <local_players_scored>
	if (<array_Size> > 0)
		if (<array_Size> = 1)
			spawnscript sfx_perfectionist_section_won params = {Player = (<local_players_scored> [0]) pan_wide = 0}
		else
			spawnscript sfx_perfectionist_section_won params = {Player = (<local_players_scored> [0]) pan_wide = 1}
		endif
	endif
endscript

script competitive_player_message_create 
	<meter_exists> = 0
	get_highway_hud_root_id Player = <Player>
	formatText checksumName = hud_player_meter 'comp_meters_p%a' a = <Player>
	if ScreenElementExists id = <hud_player_meter>
		<meter_exists> = 1
		<display_time> = 0.25
	endif
	if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<meter_exists> = 1
		<display_time> = 0.75
	endif
	if (<meter_exists> = 1)
		<meter_message> = {meter_text = <text> meter_text_alpha = 0 meter_text_rgba = <Color>}
		<hud_player_meter> :GetTags
		if NOT GotParam \{meter_message_queue}
			<meter_message_queue> = []
		endif
		<meter_message_queue> = (<meter_message_queue> + <meter_message>)
		<hud_player_meter> :SetTags meter_message_queue = <meter_message_queue>
		GetArraySize <meter_message_queue>
		if (<array_Size> = 1)
			formatText checksumName = script_id 'highway%p_script' p = <Player>
			KillSpawnedScript id = <script_id>
			<hud_player_meter> :Obj_SpawnScriptNow competitive_player_message_display id = <script_id> params = <...>
		endif
	endif
endscript

script competitive_player_message_display \{display_time = 1}
	begin
	<hud_player_meter> :GetTags
	GetArraySize <meter_message_queue>
	if (<array_Size> = 0)
		break
	else
		<hud_player_meter> :se_setprops meter_text_alpha = 0
		Wait \{1
			gameframe}
		<hud_player_meter> :se_waitprops
		<message_params> = (<meter_message_queue> [0])
		<hud_player_meter> :se_setprops meter_text_rgba = (<message_params>.meter_text_rgba)
		<hud_player_meter> :se_setprops meter_text = (<message_params>.meter_text)
		<hud_player_meter> :se_setprops meter_text_alpha = 1 time = 0.01
		<hud_player_meter> :se_waitprops
		Wait <display_time> Seconds
		<hud_player_meter> :se_setprops meter_text_alpha = 0 time = 0.2
		<hud_player_meter> :se_waitprops
		<hud_player_meter> :se_setprops meter_text = qs(0x00000000)
		<hud_player_meter> :GetTags
		RemoveArrayElement array = <meter_message_queue> index = 0
		<hud_player_meter> :SetTags meter_message_queue = <array>
	endif
	repeat
endscript

script competitive_create_on_highway_text \{text = qs(0x6fd50f6e)
		Scale = 1.0
		Color = [
			255
			255
			255
			255
		]
		alpha = 1
		use_new_message_system = 1}
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	competitive_player_message_create Player = <Player> text = <text>
endscript

script competitive_show_score_gap \{Player = !i1768515945
		score_gap = !i1768515945
		player_leading = !i1768515945}
	initial_pos = (-32.0, 60.0)
	above_pos = (-32.0, 16.0)
	below_pos = (-32.0, 105.0)
	vocal2_initial_pos = (-32.0, -153.0)
	vocal2_pos = (-32.0, -199.0)
	extend_time = 0.15
	display_time = 1.5
	retract_time = 0.55
	pos_color = [68 215 22]
	neg_color = [243 43 53]
	get_highway_hud_root_id Player = <Player>
	formatText checksumName = hud_player_meter 'comp_meters_p%a' a = <Player>
	formatText TextName = text qs(0x8c5c152d) n = <score_gap> usecommas
	if ScreenElementExists id = <hud_player_meter>
		<meter_exists> = 1
		vocals_getactivehighwayindex Player = <Player>
		vocals_get_highway_pos highway_index = <active_highway_index>
		if (<highway_pos> = vocal1)
			meter_activated_pos = <below_pos>
		elseif (<highway_pos> = vocal2)
			initial_pos = <vocal2_initial_pos>
			meter_activated_pos = <vocal2_pos>
		endif
	endif
	if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<meter_exists> = 1
		if (<player_leading> = 1)
			meter_activated_pos = <above_pos>
		elseif (<player_leading> = 0)
			meter_activated_pos = <below_pos>
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
		Wait <display_time> Seconds
		<hud_player_meter> :se_setprops gap_meter_pos = <initial_pos> time = <retract_time>
		<hud_player_meter> :se_waitprops
		<hud_player_meter> :se_setprops extra_txt = qs(0x00000000)
	endif
endscript

script competitive_show_difficulty_icon \{fade_in_time = 0.75
		wait_time = 2.0
		fade_out_time = 0.75}
	RequireParams \{[
			Player
			change_direction
		]
		all}
	getplayerinfo <Player> part
	get_highway_hud_root_id Player = <Player>
	if (<part> = vocals)
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		meter = <competitive_meters_id>
	else
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			meter = <hud_player_meter>
		endif
	endif
	if NOT ScreenElementExists id = <meter>
		return
	endif
	if (<change_direction> = up)
		<meter> :se_setprops difficulty_up_scale = 1.0
		<meter> :se_setprops difficulty_up_alpha = 1.0 time = <fade_in_time>
	elseif (<change_direction> = down)
		<meter> :se_setprops difficulty_down_scale = 1.0
		<meter> :se_setprops difficulty_down_alpha = 1.0 time = <fade_in_time>
	endif
	block_until_diff_safe Player = <Player>
	if (<part> = vocals)
		Wait <wait_time> Seconds
		if NOT ScreenElementExists id = <meter>
			return
		endif
		if (<change_direction> = up)
			<meter> :se_setprops difficulty_up_alpha = 0.0 time = <fade_out_time>
		elseif (<change_direction> = down)
			<meter> :se_setprops difficulty_down_alpha = 0.0 time = <fade_out_time>
		endif
	else
		<pulse_fade_time> = 0.1
		getplayerinfo <Player> scroll_time
		<time_remaining> = <scroll_time>
		<wait_time> = (<time_remaining> * 0.6)
		Wait <wait_time> Seconds
		<time_remaining> = (<time_remaining> - <wait_time>)
		if (<change_direction> = up)
			begin
			if NOT ScreenElementExists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_up_alpha = 0.0 time = <pulse_fade_time>
			Wait <pulse_fade_time> Seconds
			if (<time_remaining> < (<pulse_fade_time> * 2.5))
				break
			endif
			if NOT ScreenElementExists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_up_alpha = 1.0 time = <pulse_fade_time>
			Wait <pulse_fade_time> Seconds
			<pulse_length> = (<time_remaining> * 0.1)
			Wait <pulse_length> Seconds
			<time_remaining> = ((<time_remaining> - <pulse_length>) - (<pulse_fade_time> * 2))
			repeat
		elseif (<change_direction> = down)
			begin
			if NOT ScreenElementExists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_down_alpha = 0.0 time = <pulse_fade_time>
			Wait <pulse_fade_time> Seconds
			if (<time_remaining> < (<pulse_fade_time> * 2.5))
				break
			endif
			if NOT ScreenElementExists id = <meter>
				return
			endif
			<meter> :se_setprops difficulty_down_alpha = 1.0 time = <pulse_fade_time>
			Wait <pulse_fade_time> Seconds
			<pulse_length> = (<time_remaining> * 0.1)
			Wait <pulse_length> Seconds
			<time_remaining> = ((<time_remaining> - <pulse_length>) - (<pulse_fade_time> * 2))
			repeat
		endif
	endif
endscript

script competitive_clear_difficulty_icon 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = icon_script_id 'comp_diff_icon_p%p' p = <Player>
	KillSpawnedScript id = <icon_script_id>
	getplayerinfo <Player> part
	get_highway_hud_root_id Player = <Player>
	if (<part> = vocals)
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		meter = <competitive_meters_id>
	else
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			meter = <hud_player_meter>
		endif
	endif
	if NOT ScreenElementExists id = <meter>
		return
	endif
	<meter> :se_setprops difficulty_up_alpha = 0
	<meter> :se_setprops difficulty_down_alpha = 0
endscript

script competitive_song_complete 
	KillSpawnedScript \{Name = competitive_meter_track_player_scores}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	destroy_highway_color_manager Player = <Player>
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	gman_passcheckpoint \{goal = competitive}
endscript

script competitive_update_band_meter 
	<ruleset> = ($competitive_rules)
	<band1_score> = 0
	<band2_score> = 0
	if StructureContains structure = $<ruleset> team
		if (($<ruleset>.team) = 1)
			if StructureContains structure = $<ruleset> ranking_criteria
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
						getplayerinfo <Player> Band
						gman_getdata goal = competitive Player = <Player> Name = performance_value
						if (<Band> = 1)
							<band1_score> = (<band1_score> + <performance_value>)
						else
							<band2_score> = (<band2_score> + <performance_value>)
						endif
						getnextplayer Player = <Player>
						repeat <num_players>
					endif
					case elimination_order
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <Player> Band
						getplayerinfo <Player> score
						gman_getdata goal = competitive Player = <Player> Name = eliminated
						if (<Band> = 1)
							if (<eliminated> = 0)
								<band1_score> = (<band1_score> + 1)
							endif
						else
							if (<eliminated> = 0)
								<band2_score> = (<band2_score> + 1)
							endif
						endif
						getnextplayer Player = <Player>
						repeat <num_players>
					endif
				endswitch
				gman_competitivemeterfunc {
					goal = competitive
					tool = comp_meter
					func = update_band
					params = {Band = 1 value = <band1_score>}
				}
				gman_competitivemeterfunc {
					goal = competitive
					tool = comp_meter
					func = update_band
					params = {Band = 2 value = <band2_score>}
				}
			endif
		endif
	endif
endscript

script competitive_find_winner 
	<ruleset> = ($competitive_rules)
	<band1_score> = 0
	<band2_score> = 0
	if StructureContains structure = $<ruleset> team
		if (($<ruleset>.team) = 1)
			if StructureContains structure = $<ruleset> ranking_criteria
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
						getplayerinfo <Player> Band
						gman_getdata goal = competitive Player = <Player> Name = performance_value
						if (<Band> = 1)
							<band1_score> = (<band1_score> + <performance_value>)
						else
							<band2_score> = (<band2_score> + <performance_value>)
						endif
						getnextplayer Player = <Player>
						repeat <num_players>
					endif
					case elimination_order
					getnumplayersingame
					if (<num_players> > 1)
						getfirstplayer
						begin
						getplayerinfo <Player> Band
						getplayerinfo <Player> score
						if (<Band> = 1)
							if (<band1_score> < <score>)
								<band1_score> = (<score>)
							endif
						else
							if (<band2_score> < <score>)
								<band2_score> = (<score>)
							endif
						endif
						getnextplayer Player = <Player>
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
			getplayerinfo <Player> score
			<metric_value> = <score>
			case performance_value
			gman_getdata goal = competitive Player = <Player> Name = performance_value
			<metric_value> = <performance_value>
			case custom
			<standings> = (<custom_metric_values>)
			break
		endswitch
		<standings> = (<standings> + {Player = <Player> score = <metric_value> rank = 0})
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	GetArraySize <standings>
	if (<array_Size> > 1)
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
			ScriptAssert 'score can only be ranked best=highest or best=lowest you passed best=%b' b = <best>
		endif
		<i2> = (<i2> + 1)
		repeat <array_Size>
		<Player> = (<standings> [<i>].Player)
		<score> = (<standings> [<i>].score)
		SetArrayElement ArrayName = standings index = <i> NewValue = {Player = <Player> score = <score> rank = <new_rank>}
		<i> = (<i> + 1)
		repeat <array_Size>
		if GotParam \{sort_by_rank}
			<new_standings> = []
			<i> = 1
			begin
			<i2> = 0
			begin
			if ((<standings> [<i2>].rank) = <i>)
				<new_standings> = (<new_standings> + <standings> [<i2>])
			endif
			<i2> = (<i2> + 1)
			repeat <array_Size>
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		<standings> = (<new_standings>)
	endif
	return standings = <standings>
endscript

script competitive_start_sound_scripts 
	competitive_kill_sound_scripts
	<ruleset> = ($competitive_rules)
	switch ($competitive_rules)
		case PERFECTIONIST
		case team_perfectionist
		SpawnScriptNow \{sfx_perfectionist_watch_song_section_end}
		case do_or_die
		case team_do_or_die
		SpawnScriptNow \{sfx_perfectionist_watch_song_section_end}
		SpawnScriptNow \{sfx_do_or_die_watch_for_eliminated_player}
		case elimination
		case team_elimination
		SpawnScriptNow \{sfx_elimination_watch_for_eliminated_player}
		case streakers
		case team_streakers
		SpawnScriptNow \{sfx_streakers_watch_for_big_multiplier}
		case momentum
		case team_momentum
		SpawnScriptNow \{sfx_momentum_watch_for_difficulty_increase}
		SpawnScriptNow \{sfx_momentum_watch_for_difficulty_decrease}
	endswitch
endscript

script competitive_kill_sound_scripts 
	KillSpawnedScript \{Name = sfx_perfectionist_watch_song_section_end}
	KillSpawnedScript \{Name = sfx_do_or_die_watch_for_eliminated_player}
	KillSpawnedScript \{Name = sfx_do_or_die_watch_for_eliminated_player_individual}
	KillSpawnedScript \{Name = sfx_elimination_watch_for_eliminated_player}
	KillSpawnedScript \{Name = sfx_elimination_watch_for_eliminated_player_individual}
	KillSpawnedScript \{Name = sfx_streakers_watch_for_big_multiplier}
	KillSpawnedScript \{Name = sfx_momentum_watch_for_difficulty_increase}
	KillSpawnedScript \{Name = sfx_momentum_watch_for_difficulty_decrease}
endscript

script sfx_perfectionist_watch_song_section_end 
endscript

script sfx_do_or_die_watch_for_eliminated_player 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscript sfx_do_or_die_watch_for_eliminated_player_individual params = {<...>}
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script sfx_do_or_die_watch_for_eliminated_player_individual 
	formatText checksumName = event_name 'competitive_player_eliminated_p%p' p = <Player>
	begin
	Block Type = <event_name>
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> highway_position
	sfx_do_or_die_player_eliminated Player = <Player> highway_position = <highway_position>
	Wait \{1
		gameframe}
	repeat
endscript

script sfx_elimination_watch_for_eliminated_player 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		spawnscript sfx_elimination_watch_for_eliminated_player_individual params = {<...>}
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script sfx_elimination_watch_for_eliminated_player_individual 
	formatText checksumName = event_name 'competitive_player_eliminated_p%p' p = <Player>
	begin
	Block Type = <event_name>
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> highway_position
	sfx_elimination_player_eliminated Player = <Player> highway_position = <highway_position>
	Wait \{1
		gameframe}
	repeat
endscript

script sfx_streakers_watch_for_big_multiplier 
	begin
	Block \{Type = multiplier_increased}
	<Player> = (<event_data>.Player)
	<multiplier> = (<event_data>.multiplier)
	if (<multiplier> = 10)
		getplayerinfo <Player> highway_position
		sfx_streakers_big_multiplier Player = <Player> multiplier = <multiplier> highway_position = <highway_position>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script sfx_momentum_watch_for_difficulty_increase 
	begin
	Block \{Type = player_difficulty_increased}
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> highway_position
	sfx_momentum_difficulty_increased Player = <Player> highway_position = <highway_position>
	Wait \{1
		gameframe}
	repeat
endscript

script sfx_momentum_watch_for_difficulty_decrease 
	begin
	Block \{Type = player_difficulty_decreased}
	<Player> = (<event_data>.Player)
	getplayerinfo <Player> highway_position
	sfx_momentum_difficulty_decreased Player = <Player> highway_position = <highway_position>
	Wait \{1
		gameframe}
	repeat
endscript

script sfx_perfectionist_section_won 
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	Wait \{1.1
		Seconds}
	SpawnScriptNow audio_gameplay_spawned_point_awarded_perfectionist_sfx params = {<...>}
	printf channel = sfx qs(0xc64e0f27) a = <Player> b = <highway_position>
endscript

script sfx_do_or_die_section_won 
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	printf channel = sfx qs(0x10d38172) a = <Player> b = <highway_position>
	SpawnScriptNow audio_gameplay_spawned_point_awarded_waiting params = {<...>}
endscript

script sfx_do_or_die_player_eliminated 
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	printf qs(0xf9747c61) a = <Player> b = <highway_position>
	SoundEvent \{event = audio_multiplayer_sudden_death_dropped}
endscript

script sfx_elimination_player_eliminated 
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	printf qs(0x8bfc2a84) a = <Player> b = <highway_position>
	SoundEvent \{event = audio_multiplayer_sudden_death_dropped}
endscript

script sfx_streakers_big_multiplier 
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	printf qs(0xfa136495) a = <Player> b = <highway_position>
endscript

script sfx_momentum_difficulty_increased 
	printf \{channel = comp
		qs(0x80505221)}
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	audio_gameplay_play_momentum_difficulty_up_sfx Player = <Player> highway_position = <highway_position>
	printf qs(0xaeb9c072) a = <Player> b = <highway_position>
endscript

script sfx_momentum_difficulty_decreased 
	printf \{channel = comp
		qs(0x2920b677)}
	if NOT GotParam \{Player}
		ScriptAssert \{'missing param player'}
	endif
	getplayerinfo <Player> highway_position
	audio_gameplay_play_momentum_difficulty_down_sfx Player = <Player> highway_position = <highway_position>
	printf qs(0xfd0d7590) a = <Player> b = <highway_position>
endscript

script spawn_do_diff_change \{Player = 1
		adjustment = up}
	RequireParams \{[
			Player
		]
		all}
	SpawnScriptNow do_diff_change_spawned params = {Player = <Player> adjustment = <adjustment>}
endscript

script do_diff_change_spawned 
	formatText checksumName = script_id 'p%pdifficulty_script' p = <Player>
	if ScriptIsRunning id = <script_id>
		KillSpawnedScript id = <script_id>
	endif
	SpawnScriptNow id = <script_id> wait_and_change_difficulty params = {Player = <Player> adjustment = <adjustment>}
endscript

script competitive_adjust_difficulty 
	RequireParams \{[
			Player
			adjustment
		]
		all}
	getplayerinfo <Player> difficulty
	get_difficulty_text difficulty = <difficulty>
	<difficulty_text> = <difficulty_text_nl>
	switch <adjustment>
		case up
		switch <difficulty>
			case beginner
			setplayerinfo <Player> difficulty = easy
			case easy
			setplayerinfo <Player> difficulty = medium
			case medium
			setplayerinfo <Player> difficulty = hard
			case hard
			setplayerinfo <Player> difficulty = expert
			setplayerinfo <Player> double_kick_drum = 0
			case expert
			getplayerinfo <Player> part
			if (<part> = drum)
				setplayerinfo <Player> double_kick_drum = 1
				competitive_main_difficulty_watcher_varupdated Player = <Player> current_value = expert_plus
			endif
		endswitch
		case down
		switch <difficulty>
			case easy
			setplayerinfo <Player> difficulty = beginner
			case medium
			setplayerinfo <Player> difficulty = easy
			case hard
			setplayerinfo <Player> difficulty = medium
			case expert
			getplayerinfo <Player> part
			getplayerinfo <Player> double_kick_drum
			if (<part> = drum && <double_kick_drum> = 1)
				setplayerinfo <Player> double_kick_drum = 0
				competitive_main_difficulty_watcher_varupdated Player = <Player> current_value = expert
			else
				setplayerinfo <Player> difficulty = hard
			endif
		endswitch
		case down_2
		switch <difficulty>
			case easy
			setplayerinfo <Player> difficulty = beginner
			case medium
			setplayerinfo <Player> difficulty = beginner
			case hard
			setplayerinfo <Player> difficulty = easy
			case expert
			getplayerinfo <Player> part
			getplayerinfo <Player> double_kick_drum
			if (<part> = drum && <double_kick_drum> = 1)
				setplayerinfo <Player> double_kick_drum = 0
				competitive_main_difficulty_watcher_varupdated Player = <Player> current_value = hard
			else
				setplayerinfo <Player> difficulty = medium
			endif
		endswitch
		case beginner
		setplayerinfo <Player> difficulty = beginner
		case easy
		setplayerinfo <Player> difficulty = easy
		case medium
		setplayerinfo <Player> difficulty = medium
		case hard
		setplayerinfo <Player> difficulty = hard
		case expert
		setplayerinfo <Player> difficulty = expert
	endswitch
	getplayerinfo <Player> part
	if NOT (<part> = vocals)
		getplayerinfo <Player> difficulty
		formatText checksumName = morph_script_id 'comp_morph_speed_p%p' p = <Player>
		KillSpawnedScript id = <morph_script_id>
		SpawnScriptNow id = <morph_script_id> morph_scroll_speed params = {Player = <Player> difficulty = <difficulty> blend_time = 2.0}
	endif
	competitive_set_streak_base Player = <Player>
endscript

script wait_and_change_difficulty 
	RequireParams \{[
			Player
		]
		all}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	get_highway_hud_root_id Player = <Player>
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		meter = <competitive_meters_id>
	else
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			meter = <hud_player_meter>
		endif
	endif
	if NOT ScreenElementExists id = <meter>
		return
	endif
	competitive_get_difficulty_change_direction adjustment = <adjustment> Player = <Player>
	switch <change_direction>
		case up
		broadcastevent Type = player_difficulty_increased data = {Player = <Player>}
		<meter> :se_setprops difficulty_up_scale = 1.0
		<meter> :se_setprops difficulty_up_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = 1
		case down
		broadcastevent Type = player_difficulty_decreased data = {Player = <Player>}
		<meter> :se_setprops difficulty_down_scale = 1.0
		<meter> :se_setprops difficulty_down_alpha = 1.0 time = <fade_in_time>
		<difficulty_change> = -1
		case None
		return
	endswitch
	gman_setdata goal = competitive Player = <Player> params = {invincible = 1}
	if (<Player> != 1)
		Wait ((<Player> - 1) * 3) gameframes
	endif
	gman_getdata \{goal = competitive
		Name = difficulty_changes}
	SetArrayElement ArrayName = difficulty_changes index = (<Player> -1) NewValue = <difficulty_change>
	gman_setdata goal = competitive params = {difficulty_changes = <difficulty_changes>}
	formatText checksumName = icon_script_id 'comp_diff_icon_p%p' p = <Player>
	spawnscript id = <icon_script_id> competitive_show_difficulty_icon params = {Player = <Player> change_direction = <change_direction>}
	block_until_diff_safe Player = <Player>
	if (<safe> = 1)
		competitive_adjust_difficulty Player = <Player> adjustment = <adjustment>
		formatText checksumName = temp_immunity_id 'temp_immunity_p%p' p = <Player>
		KillSpawnedScript id = <temp_immunity_id>
		SpawnScriptNow id = temp_immunity_id competitive_temporary_immunity params = {Player = <Player>}
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
		getplayerinfo <Player> difficulty
		if NOT (<difficulty> = beginner)
			<change_direction> = down
		else
			<change_direction> = None
		endif
	endswitch
	return change_direction = <change_direction>
endscript

script block_until_diff_safe 
	RequireParams \{[
			Player
		]}
	begin
	if NOT ScreenElementExists \{id = hud_root}
		return \{safe = 0}
	endif
	getplayerinfo <Player> safe_to_change_difficulty
	if (<safe_to_change_difficulty> = 1)
		return \{safe = 1}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script competitive_get_streak_base 
	RequireParams \{[
			Player
		]}
	gman_getdata \{goal = competitive
		Name = streak_bases}
	<pi> = (<Player> - 1)
	<streak_base> = (<streak_bases> [<pi>])
	return streak_base = <streak_base>
endscript

script competitive_set_streak_base 
	RequireParams \{[
			Player
		]}
	gman_getdata \{goal = competitive
		Name = streak_bases}
	getplayerinfo <Player> current_run
	<pi> = (<Player> - 1)
	SetArrayElement ArrayName = streak_bases index = <pi> NewValue = <current_run>
	gman_setdata goal = competitive params = {streak_bases = <streak_bases>}
endscript

script competitive_set_difficulty_indicator 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	getplayerinfo <Player> part
	getplayerinfo <Player> double_kick_drum
	getplayerinfo <Player> difficulty
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
		get_highway_hud_root_id Player = <Player>
		if ScreenElementExists id = <highway_hud_root>
			if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
				SetScreenElementProps id = <hud_player_meter> difficulty_texture = <icon>
			endif
		endif
	else
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		if ScreenElementExists id = <competitive_meters_id>
			SetScreenElementProps id = <competitive_meters_id> difficulty_texture = <icon>
		endif
	endif
endscript

script competitive_main_section_watcher_section_marker_hit 
	SpawnScriptNow id = competitive competitive_main_section_display_score_gap_spawned params = {Player = <Player> text = <new_text>}
endscript

script competitive_main_section_display_score_gap_spawned 
	<ruleset> = ($competitive_rules)
	if StructureContains structure = $<ruleset> bonus_rules
		<bonus_ruleset> = ($<ruleset>.bonus_rules)
		if ((<bonus_ruleset>.interval = section) && (<bonus_ruleset>.reward = performance_value))
			getnumplayersingame
			<total_players> = <num_players>
			getnumplayersingame \{local}
			<wait_time> = (0.25 + (0.2 * (<total_players> - <num_players>)))
			Wait <wait_time> Seconds
			if NOT GMan_GoalIsActive \{goal = competitive}
				return
			endif
		endif
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		gman_competitivemeterfunc {
			goal = competitive
			tool = comp_meter
			func = display_score_gap
			params = {Player = <Player>}
		}
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
endscript

script competitive_attack_triggered 
	RequireParams \{[
			Player
		]
		all}
	<attacker> = (<Player>)
	<ruleset> = ($competitive_rules)
	if NOT StructureContains structure = $<ruleset> attack_rules
		ScriptAssert \{'Called competitive attack script without attack rules defined!'}
	endif
	<attack_ruleset> = ($<ruleset>.attack_rules)
	if StructureContains structure = <attack_ruleset> target
		<target> = (<attack_ruleset>.target)
		switch <target>
			case leader_only
			competitive_get_leaders exclude = <attacker>
			<victims> = (<leaders>)
			case leader_or_all
			competitive_get_leaders exclude = <attacker>
			GetArraySize <leaders>
			if (<array_Size> = 0)
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
		if NOT (<Player> = <attacker>)
			<victims> = (<victims> + <Player>)
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	competitive_attack_victim attacker = <attacker> victims = <victims> attack_ruleset = <attack_ruleset>
endscript

script competitive_attack_victim 
	RequireParams \{[
			attacker
			victims
			attack_ruleset
		]
		all}
	GetArraySize <victims>
	if (<array_Size> > 0)
		<i> = 0
		begin
		switch (<attack_ruleset>.effect)
			case difficulty
			gman_getdata goal = competitive Player = (<victims> [<i>]) Name = invincible
			if (<invincible> = 0)
				spawn_do_diff_change Player = (<victims> [<i>]) adjustment = (<attack_ruleset>.effect_value)
			else
				getplayerinfo (<victims> [<i>]) star_power_used
				if (<star_power_used> = 0)
					competitive_clear_difficulty_icon Player = (<victims> [<i>])
					spawn_do_diff_change Player = (<victims> [<i>]) adjustment = (<attack_ruleset>.effect_value)
				endif
			endif
			default
			printf \{channel = competitive
				'Invalid attack effect, nothing is going to happen.'}
		endswitch
		<i> = (<i> + 1)
		repeat <array_Size>
	else
		printf \{channel = competitive
			'No valid victims, canceling attack.'}
	endif
endscript

script competitive_get_leaders \{exclude = -1}
	<leaders> = []
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT (<exclude> = <Player>)
			gman_competitivemeterfunc goal = competitive tool = comp_meter func = is_player_in_the_lead params = {Player = <Player>}
			if (<player_is_in_the_lead> = 1)
				<leaders> = (<leaders> + <Player>)
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	return leaders = <leaders>
endscript
