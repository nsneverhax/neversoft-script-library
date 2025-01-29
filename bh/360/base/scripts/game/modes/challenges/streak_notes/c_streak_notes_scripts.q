C_STREAK_NOTES_GLOBAL_REF = {
	goal_type = challenge
	initial_data = {
	}
	results_screen_goal_data = {
		column_title = qs(0x83b2be80)
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
		temp_banked_progress = 0
		difficulty_check = null
	}
	constants = {
		pre_activate = c_streak_notes_pre_activate
		song_started = c_streak_notes_song_started
		song_complete = c_streak_notes_song_complete
		challenge_metric = streak
	}
	checkpoints = [
		{
			name = 'main'
			enter = c_streak_notes_main_enter
			exit = c_streak_notes_main_exit
			tools = [
				{
					$goal_debug_bot_struct
				}
				{
					name = 'watcher'
					var_updated = c_streak_notes_main_watcher_varUpdated
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
					target_reached = c_streak_notes_meter_target_reached
					type = meter
				}
				{
					name = 'extra_listener'
					type = event_listener
					callback_mode = any
					got_event = c_streak_notes_missed_note
					events = [
						unnecessary_notep1
						unnecessary_notep2
						unnecessary_notep3
						unnecessary_notep4
					]
					dont_start_on_enter
				}
				{
					name = 'miss_listener'
					type = event_listener
					callback_mode = any
					got_event = c_streak_notes_missed_note
					events = [
						missed_notep1
						missed_notep2
						missed_notep3
						missed_notep4
						vocals_note_miss_eventp1
						vocals_note_miss_eventp2
						vocals_note_miss_eventp3
						vocals_note_miss_eventp4
					]
					dont_start_on_enter
				}
				{
					name = 'streaker_flags'
					type = flags
					flags = [
						player_1
						player_2
						player_3
						player_4
					]
				}
				{
					name = 'banked_value_flag'
					type = flags
					flags = [
						player_1
						player_2
						player_3
						player_4
					]
				}
			]
		}
	]
}

script c_streak_notes_pre_activate 
	challenge_validate_band_setup goal_id = <goal_id>
	GMan_SetData goal = <goal_id> params = {band_setup = <band_setup> valid_players = <valid_players>}
endscript

script c_streak_notes_main_enter 
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
	c_streak_notes_miss_watchers_setup goal_id = <goal_id>
endscript

script c_streak_notes_miss_watchers_setup 
	<start_watchers> = 0
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			GetPlayerInfo <player> is_local_client
			if (<is_local_client> = 1)
				GMan_GetData goal = <goal_id> player = <player> name = banked_progress
				if (<banked_progress> > 0)
					GMan_SetData goal = <goal_id> player = <player> params = {temp_banked_progress = <banked_progress>}
					<start_watchers> = 1
				endif
			endif
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	if (<start_watchers> = 1)
		GMan_EventListenerFunc goal = <goal_id> tool = miss_listener checkpoint = main func = start params = {}
		GMan_EventListenerFunc goal = <goal_id> tool = extra_listener checkpoint = main func = start params = {}
	endif
endscript

script c_streak_notes_missed_note 
	if GotParam \{player}
		GetPlayerInfo <player> is_local_client
		if (<is_local_client> = 0)
			return
		endif
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			GMan_SetData goal = <goal_id> player = <player> params = {temp_banked_progress = 0 valid_sections_progress = 0 section_starting_value = 0}
		endif
	endif
endscript

script c_streak_notes_song_started 
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

script c_streak_notes_main_watcher_varUpdated 
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		return
	endif
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
	GMan_GetData goal = <goal_id> player = <player> name = <meter_high>
	if (<meter_high> > ($<goal_id>.diamond_descrip))
		return
	endif
	GMan_GetData goal = <goal_id> player = <player> name = temp_banked_progress
	if StructureContains structure = ($<goal_id>) song_sections
		challenge_update_current_section_progress goal_id = <goal_id> player = <player> current_value = <current_value>
	endif
	GetArraySize ($<goal_id>.required_band)
	if (<array_size> > 1)
		<player> = Band
	endif
	c_streak_notes_calculate_total_progress player = <player> goal_id = <goal_id>
	if ArrayContains array = ($<goal_id>.required_band) contains = vocal
		<total_progress> = (<total_progress> / 10)
	endif
	GetSongTimeMs
	if (<time> > 250)
		challenge_update_meter goal_id = <goal_id> player = <player> current_progress = <total_progress>
	endif
endscript

script c_streak_notes_calculate_total_progress 
	<total_progress> = 0
	if (<player> = Band)
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			<player_instrument> = valid
			challenge_validate_player_instrument goal_id = <goal_id> player = <player>
			if (<player_instrument> = valid)
				GMan_GetData goal = <goal_id> player = <player>
				if StructureContains structure = ($<goal_id>) song_sections
					<current_progress> = (<current_section_progress>)
				else
					GetPlayerInfo <player> current_run
					<current_progress> = (<current_run>)
				endif
				<total_progress> = (<total_progress> + <current_progress> + <temp_banked_progress> + <valid_sections_progress>)
			endif
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
	else
		<player_instrument> = valid
		challenge_validate_player_instrument goal_id = <goal_id> player = <player>
		if (<player_instrument> = valid)
			GMan_GetData goal = <goal_id> player = <player>
			if StructureContains structure = ($<goal_id>) song_sections
				<current_progress> = (<current_section_progress>)
			else
				GetPlayerInfo <player> current_run
				<current_progress> = (<current_run>)
			endif
			<total_progress> = (<current_progress> + <temp_banked_progress> + <valid_sections_progress>)
		endif
	endif
	return total_progress = <total_progress>
endscript

script c_streak_notes_song_complete 
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

script c_streak_notes_meter_target_reached 
	level = (<level> + 1)
	challenge_set_pending_grade level = <level> goal_id = <goal_id> player = <player>
endscript

script c_streak_notes_main_exit 
	killspawnedscript id = <goal_id>
endscript
