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
		difficulty_check = null
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
			name = 'main'
			enter = c_whammy_time_main_enter
			exit = c_whammy_time_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'listener'
					type = event_listener
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
					name = 'whammy_timer_1'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'whammy_timer_2'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'whammy_timer_3'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'whammy_timer_4'
					type = timer
					start_time = 0
					end_time = 600
					dont_start_on_enter
					dont_show_on_enter
					dont_show_expire_message
					tic = c_whammy_time_main_whammy_timer_tic
					tic_interval_ms = 100
				}
				{
					name = 'watcher'
					var_updated = c_whammy_time_main_watcher_varupdated
					type = var_watcher
					vars = [
						{
							source = playerinfo
							var = whammy_control
							type = float
						}
					]
				}
				{
					name = 'time'
					var_updated = c_whammy_time_main_time_varupdated
					type = var_watcher
					vars = [
						{
							source = goalplayerdata
							var = whammy_time
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
	goal_set_player_data_all_players goal = <goal_id> params = {hitting_sustain_note = 0}
	challenge_init_meter goal_id = <goal_id>
	c_whammy_timer_setup goal_id = <goal_id>
endscript

script c_whammy_time_song_started 
	printf \{channel = career_challenge
		'c_whammy_time::Song_Started'}
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

script c_whammy_timer_setup 
	printf \{channel = career_challenge
		'c_whammy_time::Timer_Setup'}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			formattext checksumname = tool 'whammy_timer_%t' t = <player>
			gman_getdata goal = <goal_id> player = <player> name = banked_progress
			<precise_time> = (<banked_progress> * 1000)
			casttointeger \{precise_time}
			gman_timerfunc goal = <goal_id> tool = <tool> func = set_precise_time params = {precise_time = <precise_time>}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
endscript

script c_whammy_time_main_whammy_timer_tic 
	printf \{channel = career_challenge
		'c_whammy_time::Timer_Tic'}
	switch <tool_id>
		case whammy_timer_1
		<player> = 1
		case whammy_timer_2
		<player> = 2
		case whammy_timer_3
		<player> = 3
		case whammy_timer_4
		<player> = 4
	endswitch
	<precise_time> = (<time_ms> / 1000.0)
	gman_setdata goal = <goal_id> player = <player> params = {whammy_time = <precise_time>}
endscript

script c_whammy_time_main_time_varupdated 
	printf \{channel = career_challenge
		'c_whammy_time::Time_VarUpdated'}
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	getarraysize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<total_progress> = 0
		getnumplayersingame
		if (<num_players> > 0)
			<meter_player> = band
			getfirstplayer
			begin
			gman_getdata goal = <goal_id> player = <player> name = banked_progress
			gman_getdata goal = <goal_id> player = <player> name = whammy_time
			<total_progress> = (<total_progress> + <banked_progress> + <whammy_time>)
			getnextplayer player = <player>
			repeat <num_players>
		endif
	else
		gman_getdata goal = <goal_id> player = <player> name = banked_progress
		<total_progress> = (<banked_progress> + <current_value>)
		<meter_player> = <player>
	endif
	challenge_update_meter goal_id = <goal_id> player = <meter_player> current_progress = <total_progress>
endscript

script c_whammy_time_main_listener_gotevent 
	printf \{channel = career_challenge
		'c_whammy_time::Listener_gotEvent'}
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 0}
		formattext checksumname = tool 'whammy_timer_%t' t = <player>
		killspawnedscript id = <tool>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	<player> = (<event_data>.player)
	formattext checksumname = whammy_off 'whammy_offp%t' t = <player>
	formattext checksumname = whammy_on 'whammy_onp%t' t = <player>
	switch <event>
		case (<whammy_on>)
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 1}
		case (<whammy_off>)
		gman_setdata goal = <goal_id> player = <player> params = {hitting_sustain_note = 0}
		formattext checksumname = tool 'whammy_timer_%t' t = <player>
		killspawnedscript id = <tool>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	endswitch
endscript

script c_whammy_time_main_watcher_varupdated 
	printf channel = career_challenge 'c_whammy_time::Watcher_VarUpdated whammy_control=%c' c = <current_value>
	if NOT gotparam \{goal_id}
		challenge_get_goal_id
	endif
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	formattext checksumname = tool 'whammy_timer_%t' t = <player>
	if NOT challenge_section_valid goal_id = <goal_id>
		gman_timerfunc goal = <goal_id> tool = <tool> func = stop
		return
	endif
	getplayerinfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
	gman_getdata goal = <goal_id> player = <player> name = hitting_sustain_note
	if ((<hitting_sustain_note> = 1) && (<current_value> > 0.1))
		gman_getdata goal = <goal_id> player = <player> name = old_whammy_pos
		if ((<current_value> > (<old_whammy_pos> + 0.1)) || (<current_value> < (<old_whammy_pos> - 0.1)))
			gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = <current_value>}
			gman_timerfunc goal = <goal_id> tool = <tool> func = start
			killspawnedscript id = <tool>
			spawnscriptnow c_whammy_time_main_stale_timeout params = {player = <player> goal_id = <goal_id>} id = <tool>
			return
		endif
	endif
	gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = 0}
endscript

script c_whammy_time_main_stale_timeout 
	printf \{channel = career_challenge
		'c_whammy_time::Stale_Timeout'}
	gman_getdata goal = <goal_id> name = band_setup
	if NOT (<band_setup> = valid)
		return
	endif
	wait \{0.1
		second}
	formattext checksumname = tool 'whammy_timer_%t' t = <player>
	gman_timerfunc goal = <goal_id> tool = <tool> func = stop
	gman_setdata goal = <goal_id> player = <player> params = {old_whammy_pos = 0}
endscript

script c_whammy_time_song_complete 
	printf \{'c_whammy_time::Song_Complete'
		channel = career_challenge}
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

script c_whammy_time_meter_target_reached 
	printf \{channel = career_challenge
		'c_whammy_time::Target_Reached'}
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_whammy_time_main_exit 
	printf \{channel = career_challenge
		'c_whammy_time::Main_Exit'}
	killspawnedscript id = <goal_id>
endscript
