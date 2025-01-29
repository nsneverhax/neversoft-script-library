c_multiplier_time_global_ref = {
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
		multiplier_time = 0
		difficulty_check = NULL
	}
	constants = {
		pre_activate = c_multiplier_time_pre_activate
		song_started = c_multiplier_time_song_started
		song_complete = c_multiplier_time_song_complete
		challenge_metric = calculated_value
		calculated_value = multiplier_time
	}
	checkpoints = [
		{
			Name = 'main'
			enter = c_multiplier_time_main_enter
			exit = c_multiplier_time_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					Name = 'multiplier_timer_1'
					Type = Timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
					extra_params = {
						assigned_player = 1
					}
				}
				{
					Name = 'multiplier_timer_2'
					Type = Timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
					extra_params = {
						assigned_player = 2
					}
				}
				{
					Name = 'multiplier_timer_3'
					Type = Timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
					extra_params = {
						assigned_player = 3
					}
				}
				{
					Name = 'multiplier_timer_4'
					Type = Timer
					start_time = 0
					end_time = 6000
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_multiplier_time_main_multiplier_timer_tic
					tic_interval_ms = 100
					extra_params = {
						assigned_player = 4
					}
				}
				{
					Name = 'watcher'
					var_updated = c_multiplier_time_main_watcher_varupdated
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
					Name = 'band_watcher'
					var_updated = c_multiplier_time_main_band_watcher_varupdated
					Type = var_watcher
					vars = [
						{
							Source = bandinfo
							var = current_mult
							Type = float
						}
					]
				}
				{
					Name = 'time'
					var_updated = c_multiplier_time_main_time_varupdated
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = multiplier_time
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
					target_reached = c_multiplier_time_meter_target_reached
				}
			]
		}
	]
}

script c_multiplier_time_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_multiplier_time_main_enter 
	printf \{'c_multiplier_time::Main_Enter'
		channel = career_challenge}
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
	c_multiplier_timer_setup goal_id = <goal_id>
endscript

script c_multiplier_time_song_started 
	printf \{channel = career_challenge
		'c_multiplier_time::Song_Started'}
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
		SpawnScriptNow c_multiplier_time_section_monitor params = {goal_id = <goal_id>}
		challenge_section_ended goal_id = <goal_id> section = -1
		section_fret_display goal_id = <goal_id>
	endif
endscript

script c_multiplier_timer_setup 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> Player = <Player>
		if (<player_instrument> = valid)
			formatText checksumName = tool 'multiplier_timer_%t' t = <Player>
			gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
			CastToInteger \{banked_progress}
			gman_timerfunc goal = <goal_id> tool = <tool> func = set_time params = {time = <banked_progress>}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script c_multiplier_time_main_multiplier_timer_tic 
	<new_time> = (<time_ms> / 1000.0)
	gman_setdata goal = <goal_id> Player = <assigned_player> params = {multiplier_time = <new_time>}
endscript

script c_multiplier_time_main_time_varupdated 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_Size> > 1)
		<total_progress> = 0
		getnumplayersingame
		if (<num_players> > 0)
			<meter_player> = Band
			getfirstplayer
			begin
			gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
			gman_getdata goal = <goal_id> Player = <Player> Name = multiplier_time
			<total_progress> = (<total_progress> + <banked_progress> + <multiplier_time>)
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
	else
		gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
		<total_progress> = (<banked_progress> + <current_value>)
		<meter_player> = <Player>
	endif
	challenge_update_meter goal_id = <goal_id> Player = <meter_player> current_progress = <total_progress>
endscript

script c_multiplier_time_main_watcher_varupdated 
	if NOT playerinfoequals <Player> is_local_client = 1
		return
	endif
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_Size> > 1)
		return
	endif
	formatText checksumName = tool 'multiplier_timer_%t' t = <Player>
	KillSpawnedScript id = <tool>
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	get_current_multiplier Player = <Player>
	if (<multiplier> >= 4)
		gman_timerfunc goal = <goal_id> tool = <tool> func = start
	else
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	endif
endscript

script c_multiplier_time_main_band_watcher_varupdated 
	if ($is_network_game)
		if NOT IsHost
			return
		endif
	endif
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	GetArraySize ($<goal_id>.required_band)
	if NOT (<array_Size> > 1)
		return
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	getfirstplayer
	getplayerinfo <Player> Band
	gman_getdata goal = <goal_id> Player = <Band> Name = banked_progress
	<meter_player> = Band
	formatText checksumName = tool 'multiplier_timer_%t' t = <Player>
	KillSpawnedScript id = <tool>
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	if (<current_value> >= 2)
		gman_timerfunc goal = <goal_id> tool = <tool> func = start
	else
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	endif
endscript

script c_multiplier_time_section_monitor 
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	begin
	Block \{Type = song_section_end}
	<section> = (<event_data>.section + 1)
	getnumplayersingame \{local}
	getfirstplayer \{local}
	gman_getdata goal = <goal_id> Name = valid_players
	begin
	if ArrayContains array = <valid_players> contains = <Player>
		formatText checksumName = tool 'multiplier_timer_%t' t = <Player>
		KillSpawnedScript id = <tool>
		if NOT challenge_section_valid goal_id = <goal_id>
			gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		elseif
			get_current_multiplier Player = <Player>
			if (<multiplier> >= 4)
				gman_timerfunc goal = <goal_id> tool = <tool> func = start
			endif
		endif
	endif
	getnextplayer local Player = <Player>
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
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if (<event> = song_won)
		challenge_bank_progress goal_id = <goal_id>
	endif
endscript

script c_multiplier_stop_timers 
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> Player = <Player>
		if (<player_instrument> = valid)
			formatText checksumName = tool 'multiplier_timer_%t' t = <Player>
			gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script c_multiplier_time_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> Player = <Player>
endscript

script c_multiplier_time_main_exit 
	KillSpawnedScript id = <goal_id>
endscript
