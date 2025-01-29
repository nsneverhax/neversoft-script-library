c_spower_banked_global_ref = {
	goal_type = challenge
	initial_data = {
	}
	results_screen_goal_data = {
		column_title = qs(0xcc6c9b33)
		data_source = player_goal_data
		var_name = meter_high
		ranking_method = highest_to_lowest
	}
	player_data = {
		banked_progress = 0
		reset_progress = 0
		current_section_progress = 0
		valid_sections_progress = 0
		meter_high = 0
		meter_displayed = 0
		song_star_power_banked = 0
		difficulty_check = NULL
	}
	constants = {
		pre_activate = c_spower_banked_pre_activate
		song_complete = c_spower_banked_song_complete
		song_started = c_spower_banked_song_started
		challenge_metric = calculated_value
		calculated_value = song_star_power_banked
	}
	checkpoints = [
		{
			Name = 'main'
			enter = c_spower_banked_main_enter
			exit = c_spower_banked_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					Name = 'watcher'
					var_updated = c_spower_banked_main_watcher_varupdated
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = star_power_amount
							Type = float
						}
					]
				}
				{
					Name = 'player_watcher'
					Type = var_watcher
					var_updated = c_spower_banked_player_watcher_varupdated
					vars = [
						{
							Source = goalplayerdata
							var = song_star_power_banked
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
					target_reached = c_spower_banked_meter_target_reached
				}
			]
		}
	]
}

script c_spower_banked_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_spower_banked_main_enter 
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
	goal_set_player_data_all_players goal = <goal_id> params = {song_star_power_banked = 0}
	challenge_init_meter goal_id = <goal_id>
endscript

script c_spower_banked_song_started 
	printf \{channel = career_challenge
		'Star Power Banked - Song Started'}
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

script c_spower_banked_main_watcher_varupdated 
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		return
	endif
	if (<current_value> > <last_value>)
		<new_starpower> = (<current_value> - <last_value>)
		gman_getdata goal = <goal_id> Player = <Player> Name = song_star_power_banked
		<new_song_star_power_banked> = (<song_star_power_banked> + <new_starpower>)
		gman_setdata goal = <goal_id> Player = <Player> params = {song_star_power_banked = <new_song_star_power_banked>}
	endif
endscript

script c_spower_banked_player_watcher_varupdated 
	GetArraySize ($<goal_id>.required_band)
	if (<array_Size> > 1)
		<Player> = Band
	endif
	if (<Player> = Band)
		goal_get_data_sum_all_players goal_id = <goal_id> data_name = song_star_power_banked
		<total_banked_this_song> = <data_sum>
		goal_get_data_sum_all_players goal_id = <goal_id> data_name = banked_progress
		<total_banked_before_this_song> = <data_sum>
		<total_progress> = (<total_banked_this_song> + <total_banked_before_this_song>)
		<meter_player> = Band
	else
		gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
		gman_getdata goal = <goal_id> Player = <Player> Name = song_star_power_banked
		<total_progress> = (<banked_progress> + <song_star_power_banked>)
		<meter_player> = <Player>
	endif
	challenge_update_meter goal_id = <goal_id> Player = <meter_player> current_progress = <total_progress>
endscript

script c_spower_banked_song_complete 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id> metric = calculated_value
	endif
endscript

script c_spower_banked_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> Player = <Player>
endscript

script c_spower_banked_main_exit 
	KillSpawnedScript id = <goal_id>
endscript
