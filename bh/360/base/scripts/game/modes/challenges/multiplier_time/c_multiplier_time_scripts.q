C_multiplier_TIME_GLOBAL_REF = {
	goal_type = challenge
	initial_data = {
	}
	results_screen_goal_data = {
		column_title = qs(0xb58c3304)
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
		Multiplier_time = 0
		difficulty_check = null
	}
	constants = {
		pre_activate = c_multiplier_time_pre_activate
		song_started = c_multiplier_time_song_started
		song_complete = c_multiplier_time_song_complete
		challenge_metric = calculated_value
		calculated_value = Multiplier_time
	}
	checkpoints = [
		{
			name = 'main'
			enter = c_multiplier_time_main_enter
			exit = c_multiplier_time_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'multiplier_timer_1'
					type = timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'multiplier_timer_2'
					type = timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'multiplier_timer_3'
					type = timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'multiplier_timer_4'
					type = timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'watcher'
					var_updated = c_multiplier_time_main_watcher_varUpdated
					type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = current_run
							type = int
						}
					]
				}
				{
					name = 'band_watcher'
					var_updated = c_multiplier_time_main_band_watcher_varUpdated
					type = var_watcher
					vars = [
						{
							Source = bandinfo
							var = current_mult
							type = float
						}
					]
				}
				{
					name = 'time'
					var_updated = c_multiplier_time_main_time_varUpdated
					type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = Multiplier_time
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
					target_reached = c_multiplier_time_meter_target_reached
				}
			]
		}
	]
}

script c_multiplier_time_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_multiplier_time_main_enter 
	printf \{'c_multiplier_time::Main_Enter'
		channel = career_challenge}
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
	c_multiplier_timer_setup goal_id = <goal_id>
endscript

script c_multiplier_time_song_started 
	printf \{channel = career_challenge
		'c_multiplier_time::Song_Started'}
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
		spawnscriptnow c_multiplier_time_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
endscript

script c_multiplier_timer_setup 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			FormatText checksumname = tool 'multiplier_timer_%t' t = <player>
			GMan_GetData goal = <goal_id> player = <player> name = banked_progress
			CastToInteger \{banked_progress}
			GMan_TimerFunc goal = <goal_id> tool = <tool> func = set_time params = {time = <banked_progress>}
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script c_multiplier_time_main_multiplier_timer_tic 
	switch <tool_id>
		case multiplier_timer_1
		<player> = 1
		case multiplier_timer_2
		<player> = 2
		case multiplier_timer_3
		<player> = 3
		case multiplier_timer_4
		<player> = 4
	endswitch
	<new_time> = (<time_ms> / 1000.0)
	GMan_SetData goal = <goal_id> player = <player> params = {Multiplier_time = <new_time>}
endscript

script c_multiplier_time_main_time_varUpdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<total_progress> = 0
		GetNumPlayersInGame
		if (<num_players> > 0)
			<meter_player> = Band
			GetFirstPlayer
			begin
			GMan_GetData goal = <goal_id> player = <player> name = banked_progress
			GMan_GetData goal = <goal_id> player = <player> name = Multiplier_time
			<total_progress> = (<total_progress> + <banked_progress> + <Multiplier_time>)
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
	else
		GMan_GetData goal = <goal_id> player = <player> name = banked_progress
		<total_progress> = (<banked_progress> + <current_value>)
		<meter_player> = <player>
	endif
	challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
endscript

script c_multiplier_time_main_watcher_varUpdated 
	if NOT PlayerInfoEquals <player> is_local_client = 1
		return
	endif
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		return
	endif
	FormatText checksumname = tool 'multiplier_timer_%t' t = <player>
	killspawnedscript id = <tool>
	if NOT challenge_section_valid goal_id = <goal_id>
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
		return
	endif
	get_current_multiplier player = <player>
	if (<Multiplier> >= 4)
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = start
	else
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
	endif
endscript

script c_multiplier_time_main_band_watcher_varUpdated 
	if ($is_network_game)
		if NOT IsHost
			return
		endif
	endif
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if NOT (<array_size> > 1)
		return
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GetFirstPlayer
	GetPlayerInfo <player> Band
	GMan_GetData goal = <goal_id> player = <Band> name = banked_progress
	<meter_player> = Band
	FormatText checksumname = tool 'multiplier_timer_%t' t = <player>
	killspawnedscript id = <tool>
	if NOT challenge_section_valid goal_id = <goal_id>
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
		return
	endif
	if (<current_value> >= 2)
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = start
	else
		GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
	endif
endscript

script c_multiplier_time_section_monitor 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	begin
	Block \{type = song_section_end}
	<section> = (<event_data>.section + 1)
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	GMan_GetData goal = <goal_id> name = valid_players
	begin
	if ArrayContains array = <valid_players> contains = <player>
		FormatText checksumname = tool 'multiplier_timer_%t' t = <player>
		killspawnedscript id = <tool>
		if NOT challenge_section_valid goal_id = <goal_id>
			GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
		elseif
			get_current_multiplier player = <player>
			if (<Multiplier> >= 4)
				GMan_TimerFunc goal = <goal_id> tool = <tool> func = start
			endif
		endif
	endif
	GetNextPlayer local player = <player>
	repeat <num_players>
	repeat
endscript

script c_multiplier_time_song_complete 
	printf \{'c_multiplier_time::Song_Complete'
		channel = career_challenge}
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	c_multiplier_stop_timers goal_id = <goal_id>
	GMan_GetData goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id>
	endif
endscript

script c_multiplier_stop_timers 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			FormatText checksumname = tool 'multiplier_timer_%t' t = <player>
			GMan_TimerFunc goal = <goal_id> tool = <tool> func = Stop
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script c_multiplier_time_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_multiplier_time_main_exit 
	killspawnedscript id = <goal_id>
endscript
