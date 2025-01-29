C_SCORE_SPOWER_GLOBAL_REF = {
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
		total_score = 0
		pre_deployment = 0
		total_deployments_score = 0
		deployment_score = 0
		difficulty_check = null
	}
	constants = {
		pre_activate = c_score_spower_pre_activate
		song_complete = c_score_spower_song_complete
		song_started = c_score_spower_song_started
		challenge_metric = calculated_value
		calculated_value = total_score
	}
	checkpoints = [
		{
			name = 'main'
			enter = c_score_spower_main_enter
			exit = c_score_spower_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'spower_watcher'
					type = var_watcher
					var_updated = c_score_spower_main_spower_watcher_varUpdated
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							type = int
						}
					]
				}
				{
					name = 'watcher'
					type = var_watcher
					var_updated = c_score_spower_main_watcher_varUpdated
					vars = [
						{
							Source = playerinfo
							var = score
							type = float
						}
						{
							Source = playerinfo
							var = individual_band_score
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
					target_reached = c_score_spower_meter_target_reached
				}
			]
		}
	]
}

script c_score_spower_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_score_spower_main_enter 
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
	goal_set_player_data_all_players goal = <goal_id> params = {pre_deployment = 0 total_deployments_score = 0}
endscript

script c_score_spower_song_started 
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

script c_score_spower_main_spower_watcher_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	if (<current_value> = 0)
		GMan_GetData goal = <goal_id> player = <player> name = deployment_score
		GMan_GetData goal = <goal_id> player = <player> name = total_deployments_score
		<new_total_deployments_score> = (<total_deployments_score> + <deployment_score>)
		GMan_SetData goal = <goal_id> player = <player> params = {total_deployments_score = <new_total_deployments_score> deployment_score = 0}
	endif
endscript

script c_score_spower_main_watcher_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GMan_GetData goal = <goal_id> name = valid_players
	if NOT ArrayContains array = <valid_players> contains = <player>
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<var> = score)
		if (<array_size> > 1)
			return
		endif
	elseif (<var> = individual_band_score)
		if (<array_size> = 1)
			return
		endif
	endif
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	GetPlayerInfo <player> star_power_used
	if (<star_power_used> = 0)
		GMan_SetData goal = <goal_id> player = <player> params = {pre_deployment = <current_value>}
	else
		if NOT challenge_section_valid goal_id = <goal_id>
			return
		endif
		GMan_GetData goal = <goal_id> player = <player> name = pre_deployment
		<deployment_score> = (<current_value> - <pre_deployment>)
		GMan_GetData goal = <goal_id> player = <player> name = banked_progress
		GMan_GetData goal = <goal_id> player = <player> name = total_deployments_score
		<total_progress> = (<deployment_score> + <total_deployments_score> + <banked_progress>)
		GMan_SetData goal = <goal_id> player = <player> params = {deployment_score = <deployment_score> total_score = <total_progress>}
		if (<array_size> > 1)
			<meter_player> = Band
			<total_progress> = 0
			GetNumPlayersInGame
			GetFirstPlayer
			begin
			GMan_GetData goal = <goal_id> player = <player> name = <total_score>
			<total_progress> = (<total_progress> + <total_score>)
			GetNextPlayer player = <player>
			repeat <num_players>
		else
			<meter_player> = <player>
		endif
		challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
	endif
endscript

script c_score_spower_song_complete 
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

script c_score_spower_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_score_spower_main_exit 
	killspawnedscript id = <goal_id>
endscript
