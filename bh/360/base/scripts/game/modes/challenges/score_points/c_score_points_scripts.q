C_SCORE_POINTS_GLOBAL_REF = {
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
					var_updated = c_score_playerpoints_watcher_varUpdated
					vars = [
						{
							Source = playerinfo
							var = score
							type = float
						}
					]
				}
				{
					name = 'band_watcher'
					type = var_watcher
					var_updated = c_score_bandpoints_watcher_varUpdated
					vars = [
						{
							Source = bandinfo
							var = score
							type = float
						}
					]
				}
				{
					name = 'meter_watcher'
					type = var_watcher
					var_updated = challenge_meter_watcher_varUpdated
					vars = [
						{
							Source = goalplayerdata
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
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_score_points_main_enter 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
	if GotParam \{retry}
		challenge_restore_meter_high_and_grade goal_id = <goal_id>
		challenge_multi_song_difficulty_check goal_id = <goal_id>
	else
		challenge_store_meter_high_and_grade goal_id = <goal_id>
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	challenge_init_meter goal_id = <goal_id>
endscript

script c_score_points_song_started 
	printf \{channel = career_challenge
		'Score Points - Song Started'}
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if StructureContains structure = ($<goal_id>) song_sections
		goal_start_section_watcher goal_id = <goal_id>
		spawnscriptnow challenge_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
endscript

script c_score_playerpoints_watcher_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if NOT (<array_size> = 1)
		return
	endif
	c_score_points_watcher_varUpdated <...>
endscript

script c_score_bandpoints_watcher_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if NOT (<array_size> > 1)
		return
	endif
	<player> = Band
	c_score_points_watcher_varUpdated <...>
endscript

script c_score_points_watcher_varUpdated \{player = Band}
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		return
	endif
	if (<player> = Band)
		GetFirstPlayer
		GetPlayerInfo <player> Band
		GMan_GetData goal = <goal_id> player = <Band> name = banked_progress
		<meter_player> = Band
	else
		GMan_GetData goal = <goal_id> player = <player> name = banked_progress
		<meter_player> = <player>
	endif
	if StructureContains structure = ($<goal_id>) song_sections
		challenge_update_current_section_progress goal_id = <goal_id> player = <player> current_value = <current_value>
	else
		<current_progress> = (<current_value>)
	endif
	<total_progress> = (<banked_progress> + <current_progress>)
	challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
endscript

script c_score_points_song_complete 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
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
