c_whammy_time_global_ref = {
	goal_type = challenge
	initial_data = {
		old_whammy_pos = 0
	}
	results_screen_goal_data = {
		column_title = qs(0x67f2f869)
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
		whammy_time = 0
		hitting_sustain_note = 0
		difficulty_check = NULL
	}
	constants = {
		pre_activate = c_whammy_time_pre_activate
		song_started = c_whammy_time_song_started
		song_complete = c_whammy_time_song_complete
		challenge_metric = calculated_value
		calculated_value = whammy_time
	}
	checkpoints = [
		{
			Name = 'main'
			enter = c_whammy_time_main_enter
			exit = c_whammy_time_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					Name = 'listener'
					Type = event_listener
					got_event = c_whammy_time_main_listener_gotevent
					callback_mode = any
					events = [
						whammy_onp1
						whammy_onp2
						whammy_onp3
						whammy_onp4
						whammy_offp1
						whammy_offp2
						whammy_offp3
						whammy_offp4
					]
				}
				{
					Name = 'whammy_timer_1'
					Type = Timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					Name = 'whammy_timer_2'
					Type = Timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					Name = 'whammy_timer_3'
					Type = Timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					Name = 'whammy_timer_4'
					Type = Timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					Name = 'watcher'
					var_updated = c_whammy_time_main_watcher_varupdated
					Type = var_watcher
					vars = [
						{
							Source = playerinfo
							var = whammy_control
							Type = float
						}
					]
				}
				{
					Name = 'time'
					var_updated = c_whammy_time_main_time_varupdated
					Type = var_watcher
					vars = [
						{
							Source = goalplayerdata
							var = whammy_time
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
					target_reached = c_whammy_time_meter_target_reached
				}
			]
		}
	]
}

script c_whammy_time_pre_activate 
	printf \{channel = career_challenge
		'c_whammy_time::Pre_Activate'}
	challenge_validate_band_setup goal_id = <goal_id>
	gman_setdata goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_whammy_time_main_enter 
	printf \{'c_whammy_time::Main_Enter'
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
	goal_set_player_data_all_players goal = <goal_id> params = {hitting_sustain_note = 0}
	challenge_init_meter goal_id = <goal_id>
	c_whammy_timer_setup goal_id = <goal_id>
endscript

script c_whammy_time_song_started 
	printf \{channel = career_challenge
		'c_whammy_time::Song_Started'}
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

script c_whammy_timer_setup 
	printf \{channel = career_challenge
		'c_whammy_time::Timer_Setup'}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> Player = <Player>
		if (<player_instrument> = valid)
			formatText checksumName = tool 'whammy_timer_%t' t = <Player>
			gman_getdata goal = <goal_id> Player = <Player> Name = banked_progress
			<precise_time> = (<banked_progress> * 1000)
			CastToInteger \{precise_time}
			gman_timerfunc goal = <goal_id> tool = <tool> func = set_precise_time params = {precise_time = <precise_time>}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script c_whammy_time_main_whammy_timer_tic 
	printf \{channel = career_challenge
		'c_whammy_time::Timer_Tic'}
	switch <tool_id>
		case whammy_timer_1
		<Player> = 1
		case whammy_timer_2
		<Player> = 2
		case whammy_timer_3
		<Player> = 3
		case whammy_timer_4
		<Player> = 4
	endswitch
	<precise_time> = (<time_ms> / 1000.0)
	gman_setdata goal = <goal_id> Player = <Player> params = {whammy_time = <precise_time>}
endscript

script c_whammy_time_main_time_varupdated 
	printf \{channel = career_challenge
		'c_whammy_time::Time_VarUpdated'}
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
			gman_getdata goal = <goal_id> Player = <Player> Name = whammy_time
			<total_progress> = (<total_progress> + <banked_progress> + <whammy_time>)
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

script c_whammy_time_main_listener_gotevent 
	printf \{channel = career_challenge
		'c_whammy_time::Listener_gotEvent'}
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 0}
		formatText checksumName = tool 'whammy_timer_%t' t = <Player>
		KillSpawnedScript id = <tool>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	<Player> = (<event_data>.Player)
	formatText checksumName = whammy_off 'whammy_offp%t' t = <Player>
	formatText checksumName = whammy_on 'whammy_onp%t' t = <Player>
	switch <event>
		case (<whammy_on>)
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 1}
		case (<whammy_off>)
		gman_setdata goal = <goal_id> Player = <Player> params = {hitting_sustain_note = 0}
		formatText checksumName = tool 'whammy_timer_%t' t = <Player>
		KillSpawnedScript id = <tool>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	endswitch
endscript

script c_whammy_time_main_watcher_varupdated 
	printf channel = career_challenge 'c_whammy_time::Watcher_VarUpdated whammy_control=%c' c = <current_value>
	if NOT GotParam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	formatText checksumName = tool 'whammy_timer_%t' t = <Player>
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	gman_getdata goal = <goal_id> Player = <Player> Name = hitting_sustain_note
	if ((<hitting_sustain_note> = 1) && (<current_value> > 0.1))
		gman_getdata goal = <goal_id> Player = <Player> Name = old_whammy_pos
		if ((<current_value> > (<old_whammy_pos> + 0.1)) || (<current_value> < (<old_whammy_pos> - 0.1)))
			gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = <current_value>}
			gman_timerfunc goal = <goal_id> tool = <tool> func = start
			KillSpawnedScript id = <tool>
			SpawnScriptNow c_whammy_time_main_stale_timeout params = {Player = <Player> goal_id = <goal_id>} id = <tool>
			return
		endif
	endif
	gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = 0}
endscript

script c_whammy_time_main_stale_timeout 
	printf \{channel = career_challenge
		'c_whammy_time::Stale_Timeout'}
	gman_getdata goal = <goal_id> Name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	Wait \{0.1
		Second}
	formatText checksumName = tool 'whammy_timer_%t' t = <Player>
	gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	gman_setdata goal = <goal_id> Player = <Player> params = {old_whammy_pos = 0}
endscript

script c_whammy_time_song_complete 
	printf \{'c_whammy_time::Song_Complete'
		channel = career_challenge}
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

script c_whammy_time_meter_target_reached 
	printf \{channel = career_challenge
		'c_whammy_time::Target_Reached'}
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> Player = <Player>
endscript

script c_whammy_time_main_exit 
	printf \{channel = career_challenge
		'c_whammy_time::Main_Exit'}
	KillSpawnedScript id = <goal_id>
endscript
