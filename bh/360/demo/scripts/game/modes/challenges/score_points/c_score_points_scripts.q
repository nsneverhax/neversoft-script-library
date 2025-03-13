c_score_points_global_ref = {
	goal_type = challenge
	initial_data = {
	}
	results_screen_goal_data = {
		column_title = qs(0xb757b950)
		data_source = player_goal_data
		var_name = meter_high
		ranking_method = highest_to_lowest
	}
	player_data = {
		banked_progress = 0
		reset_progress = 0
		section_starting_value = 0
		current_section_progress = 0
		valid_sections_progress = 0
		meter_high = 0
		meter_displayed = 0
		difficulty_check = null
	}
	constants = {
		pre_activate = c_score_points_pre_activate
		song_started = c_score_points_song_started
		song_complete = c_score_points_song_complete
		challenge_metric = score
	}
	checkpoints = [
		{
			name = 'main'
			enter = c_score_points_main_enter
			exit = c_score_points_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'player_watcher'
					type = var_watcher
					var_updated = c_score_playerpoints_watcher_varupdated
					vars = [
						{
							source = playerinfo
							var = score
							type = float
						}
					]
				}
				{
					name = 'band_watcher'
					type = var_watcher
					var_updated = c_score_bandpoints_watcher_varupdated
					vars = [
						{
							source = bandinfo
							var = score
							type = float
						}
					]
				}
				{
					name = 'meter_watcher'
					type = var_watcher
					var_updated = challenge_meter_watcher_varupdated
					vars = [
						{
							source = goalplayerdata
							var = meter_displayed
							type = float
						}
					]
				}
				{
					name = 'challenge_meter'
					type = meter
					target_reached = c_score_points_target_reached
				}
			]
		}
	]
}

script c_score_points_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_score_points_main_enter 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
	if gotparam \{retry}
		challenge_restore_meter_high_and_grade goal_id = <goal_id>
		challenge_multi_song_difficulty_check goal_id = <goal_id>
	else
		challenge_store_meter_high_and_grade goal_id = <goal_id>
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	challenge_init_meter goal_id = <goal_id>
endscript

script c_score_points_song_started 
	printf \{channel = career_challenge
		'Score Points - Song Started'}
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if structurecontains structure = ($<goal_id>) song_sections
		goal_start_section_watcher goal_id = <goal_id>
		spawnscriptnow challenge_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
endscript

script c_score_playerpoints_watcher_varupdated 
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	getarraysize ($<goal_id>.required_band)
	if NOT (<array_size> = 1)
		return
	endif
	c_score_points_watcher_varupdated <...>
endscript

script c_score_bandpoints_watcher_varupdated 
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	getarraysize ($<goal_id>.required_band)
	if NOT (<array_size> > 1)
		return
	endif
	<player> = band
	c_score_points_watcher_varupdated <...>
endscript

script c_score_points_watcher_varupdated \{player = band}
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		return
	endif
	if (<player> = band)
		getfirstplayer
		getplayerinfo <player> band
		gman_getdata goal = <goal_id> player = <band> name = banked_progress
		<meter_player> = band
	else
		gman_getdata goal = <goal_id> player = <player> name = banked_progress
		<meter_player> = <player>
	endif
	if structurecontains structure = ($<goal_id>) song_sections
		challenge_update_current_section_progress goal_id = <goal_id> player = <player> current_value = <current_value>
	else
		<current_progress> = (<current_value>)
	endif
	<total_progress> = (<banked_progress> + <current_progress>)
	challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
endscript

script c_score_points_song_complete 
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id>
	endif
endscript

script c_score_points_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_score_points_main_exit 
	killspawnedscript id = <goal_id>
endscript
