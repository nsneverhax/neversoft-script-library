c_score_spower_global_ref = {
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
		difficulty_check = NULL
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
			Name = 'main'
			enter = c_score_spower_main_enter
			exit = c_score_spower_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					Name = 'spower_watcher'
					Type = var_watcher
					var_updated = c_score_spower_main_spower_watcher_varupdated
					vars = [
						{
							Source = playerinfo
							var = star_power_used
							Type = int
						}
					]
				}
				{
					Name = 'watcher'
					Type = var_watcher
					var_updated = c_score_spower_main_watcher_varupdated
					vars = [
						{
							Source = playerinfo
							var = score
							Type = float
						}
						{
							Source = playerinfo
							var = individual_band_score
							Type = float
						}
					]
				}
				{
					Name = 'meter_watcher'
					Type = var_watcher
					var_updated = challenge_meter_watcher_varupdated
					vars = [
						{
							Source = goalplayerdata
							var = meter_displayed
							Type = float
						}
					]
				}
				{
					Name = 'challenge_meter'
					Type = meter
					target_reached = c_score_spower_meter_target_reached
				}
			]
		}
	]
}

script c_score_spower_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_score_spower_main_enter 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
	if GotParam \{retry}
		challenge_restore_meter_high_and_grade goal_id = <goal_id>
		challenge_multi_song_difficulty_check goal_id = <goal_id>
	else
		challenge_store_meter_high_and_grade goal_id = <goal_id>
	endif
	gman_getdata goal = <goal_id> Name = band_setup
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
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if StructureContains structure = ($<goal_id>) song_sections
		goal_start_section_watcher goal_id = <goal_id>
		SpawnScriptNow challenge_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
endscript

script c_score_spower_main_spower_watcher_varupdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	if (<current_value> = 0)
		gman_getdata goal = <goal_id> Player = <Player> Name = deployment_score
		gman_getdata goal = <goal_id> Player = <Player> Name = total_deployments_score
		<new_total_deployments_score> = (<total_deployments_score> + <deployment_score>)
		gman_setdata goal = <goal_id> Player = <Player> params = {total_deployments_score = <new_total_deployments_score> deployment_score = 0}
	endif
endscript

script c_score_spower_main_watcher_varupdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	gman_getdata goal = <goal_id> Name = valid_players
	if NOT ArrayContains array = <valid_players> contains = <Player>
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<var> = score)
		if (<array_Size> > 1)
			return
		endif
	elseif (<var> = individual_band_score)
		if (<array_Size> = 1)
			return
		endif
	endif
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	getplayerinfo <Player> star_power_used
	if (<star_power_used> = 0)
		gman_setdata goal = <goal_id> Player = <Player> params = {pre_deployment = <current_value>}
	else
		if NOT challenge_section_valid goal_id = <goal_id>
			return
		endif
		gman_getdata goal = <goal_id> Player = <Player> Name = pre_deployment
		<deployment_score> = (<current_value> - <pre_deployment>)
		gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
		gman_getdata goal = <goal_id> Player = <Player> Name = total_deployments_score
		<total_progress> = (<deployment_score> + <total_deployments_score> + <banked_progress>)
		gman_setdata goal = <goal_id> Player = <Player> params = {deployment_score = <deployment_score> total_score = <total_progress>}
		if (<array_Size> > 1)
			<meter_player> = Band
			<total_progress> = 0
			getnumplayersingame
			getfirstplayer
			begin
			gman_getdata goal = <goal_id> Player = <Player> Name = <total_score>
			<total_progress> = (<total_progress> + <total_score>)
			getnextplayer Player = <Player>
			repeat <num_players>
		else
			<meter_player> = <Player>
		endif
		challenge_update_meter goal_id = <goal_id> Player = <meter_player> current_progress = <total_progress>
	endif
endscript

script c_score_spower_song_complete 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id>
	endif
endscript

script c_score_spower_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> Player = <Player>
endscript

script c_score_spower_main_exit 
	KillSpawnedScript id = <goal_id>
endscript
