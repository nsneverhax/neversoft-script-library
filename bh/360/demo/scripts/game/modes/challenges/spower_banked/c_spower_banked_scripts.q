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
		difficulty_check = null
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
			name = 'main'
			enter = c_spower_banked_main_enter
			exit = c_spower_banked_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'watcher'
					var_updated = c_spower_banked_main_watcher_varupdated
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = star_power_amount
							type = float
						}
					]
				}
				{
					name = 'player_watcher'
					type = var_watcher
					var_updated = c_spower_banked_player_watcher_varupdated
					vars = [
						{
							source = goalplayerdata
							var = song_star_power_banked
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
	goal_set_player_data_all_players goal = <goal_id> params = {song_star_power_banked = 0}
	challenge_init_meter goal_id = <goal_id>
endscript

script c_spower_banked_song_started 
	printf \{channel = career_challenge
		'Star Power Banked - Song Started'}
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

script c_spower_banked_main_watcher_varupdated 
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
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
	if (<current_value> > <last_value>)
		<new_starpower> = (<current_value> - <last_value>)
		gman_getdata goal = <goal_id> player = <player> name = song_star_power_banked
		<new_song_star_power_banked> = (<song_star_power_banked> + <new_starpower>)
		gman_setdata goal = <goal_id> player = <player> params = {song_star_power_banked = <new_song_star_power_banked>}
	endif
endscript

script c_spower_banked_player_watcher_varupdated 
	getarraysize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<player> = band
	endif
	if (<player> = band)
		goal_get_data_sum_all_players goal_id = <goal_id> data_name = song_star_power_banked
		<total_banked_this_song> = <data_sum>
		goal_get_data_sum_all_players goal_id = <goal_id> data_name = banked_progress
		<total_banked_before_this_song> = <data_sum>
		<total_progress> = (<total_banked_this_song> + <total_banked_before_this_song>)
		<meter_player> = band
	else
		gman_getdata goal = <goal_id> player = <player> name = banked_progress
		gman_getdata goal = <goal_id> player = <player> name = song_star_power_banked
		<total_progress> = (<banked_progress> + <song_star_power_banked>)
		<meter_player> = <player>
	endif
	challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
endscript

script c_spower_banked_song_complete 
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id> metric = calculated_value
	endif
endscript

script c_spower_banked_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_spower_banked_main_exit 
	killspawnedscript id = <goal_id>
endscript
