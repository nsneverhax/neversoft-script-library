max_song_stars = 5
career_info = {
	name = 'career'
	goal_type = game_mode
	data = {
		results_text = qs(0x00000000)
	}
	constants = {
	}
	checkpoints = [
		{
			name = 'main'
			tools = [
				{
					name = 'venue_handler'
					type = venue
				}
				{
					name = 'challenges'
					type = challenge_manager
				}
				{
					name = 'pause'
					type = Pause
					dont_start_on_enter
					settings = {
						default_options = {
							resume
							restart
							options
							difficulty
							gig_info
							quit
						}
						custom_options = [
							{
								text = qs(0xe561ef6f)
								func = ui_event
								func_params = {
									event = menu_change
									data = {
										state = UIstate_pausemenu_quit_warning
										option2_func_params = {
											NewGig
										}
									}
								}
								local_only = 1
							}
						]
					}
				}
			]
		}
	]
}

script career_main_enter 
	printf \{'Career::Main_Enter'}
	Change \{end_credits = 0}
endscript

script career_begin_main_gameplay 
endscript

script career_song_started 
	printf \{'Career::Song_Started'
		channel = career_challenge}
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if ($end_credits > 0 || <current_challenge> = None)
		return
	endif
	if NOT GMan_GoalIsActive goal = <current_challenge>
		progression_clear_rewards_just_unlocked
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		get_savegame_from_controller controller = ($primary_controller)
		SetGlobalTags savegame = <savegame> <current_challenge> params = {has_been_played = 1} Progression = true
		GMan_ChallengeManagerFunc \{goal = career
			tool = challenges
			func = start_challenge}
		GMan_PauseFunc \{goal = career
			tool = Pause
			func = start}
		if GMan_GetConstant goal = <current_challenge> name = song_started return_name = custom_callback
			if ScriptExists <custom_callback>
				<custom_callback>
			endif
		endif
	else
		GMan_UnPauseGoal goal = <current_challenge>
		goal_retry_current_goal
	endif
	spawnscriptnow \{GuitarEvent_GigStarted}
endscript

script career_song_complete 
	printf 'Career::Song_Complete event = %a' a = <event> channel = career_challenge
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if NOT GMan_GoalIsActive goal = <current_challenge>
		return
	endif
	challenge_output_debug_info goal_id = <current_challenge>
	if (<event> = song_won)
		GMan_GetGrade goal = <current_challenge>
		if (<pending_grade> = 0)
			GMan_SetPendingGrade goal = <current_challenge> grade = 1
		endif
		GameEvent_SongWon
		GameEvent_GigWon
	elseif (<event> = song_retry)
		GameEvent_SongRetry
		GameEvent_GigRetry
	elseif (<event> = song_failed)
		GMan_SetPendingGrade goal = <current_challenge> grade = 0
		GameEvent_SongFailed
		GameEvent_GigFailed
	elseif (<event> = song_quit)
		GMan_SetPendingGrade goal = <current_challenge> grade = 0
		GameEvent_SongAborted
		GameEvent_GigAborted
	endif
	challenge_reset_debug_info
	GMan_PauseGoal goal = <current_challenge>
endscript

script career_continue_next_song 
	printf \{'Career::Continue_Next_Song'
		channel = career_challenge}
	GMan_SongFunc \{func = switch_to_next_song_in_play_list}
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	Change \{gameplay_restart_song = 1}
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script career_complete_challenge 
	if NOT GMan_GoalIsActive \{goal = career}
		return
	endif
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if (GMan_GoalIsActive goal = <current_challenge>)
		GMan_ClearNextCheckpoint goal = <current_challenge>
		GMan_PassCheckpoint goal = <current_challenge>
	endif
	GMan_SongFunc \{func = clear_play_list}
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = set_current_challenge
		params = {
			challenge_id = None
		}}
	progression_clear_rewards_just_unlocked
	update_active_players_atoms
endscript

script career_pause_quit 
	Stop_All_Paused_Sounds
	career_end_challenge
	killspawnedscript \{name = scrolling_list_begin_credits}
	destroy_credits_menu
	printstruct <...> channel = goal
	if GotParam \{NewGig}
		generic_event_back \{nosound
			state = UIstate_career_venue_select}
	else
		generic_event_back \{nosound
			state = uistate_mainmenu}
	endif
endscript

script career_end_challenge 
	GMan_SendCallbackToAllGoals \{suffix = 'song_complete'
		callback_data = {
			event = song_quit
		}}
	career_complete_challenge
endscript

script GMan_GetResultsData 
	GMan_GetData goal = <goal> name = <results_screen_goal_data>
	if NOT GotParam \{results_screen_goal_data}
		ScriptAssert qs(0x8b1b399f) a = <goal>
		return
	endif
	column_title = (<results_screen_goal_data>.column_title)
	goal_var_source = (<results_screen_goal_data>.data_source)
	goal_var_name = (<results_screen_goal_data>.var_name)
	is_band_data = 0
	column_data = []
	if (<goal_var_source> = player_goal_data)
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			GMan_GetData goal = <goal> player = <player> name = <goal_var_name> return_name = recieved_data
			if NOT GotParam \{recieved_data}
				ScriptAssert qs(0xaa773e13) v = <goal_var_name> s = <goal_var_source>
				return
			endif
			<column_data> = (<column_data> + (<recieved_data>))
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_info_data)
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			GetPlayerInfo <player> (<goal_var_name>) out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_goal_data_array)
		GMan_GetData goal = <goal> name = <goal_var_name> return_name = column_data
	elseif (<goal_var_source> = band_info_data)
		is_band_data = 1
		GetBandsStatus
		GetArraySize <bands>
		i = 0
		begin
		if (<bands> [<i>].in_game)
			GetBandInfo (<i> + 1) score out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return goal_results_column_title = <column_title> goal_results_column_data = <column_data> is_band_data = <is_band_data>
endscript

script career_get_progress_for_venue 
	RequireParams \{[
			venue_list
			index
		]
		all}
	GMan_ChallengeManagerFunc goal = career tool = challenges func = get_challenges_for_venue params = {venue = (<venue_list> [<index>].venue)}
	if NOT GotParam \{challenge_list}
		ScriptAssert 'No career gigs found for venue %a' a = <loaded_venue>
	endif
	GetArraySize <challenge_list>
	num_gigs = <array_size>
	total_stars = 0
	current_stars = 0
	if (<num_gigs> > 0)
		gig_index = 0
		begin
		gig_name = (<challenge_list> [<gig_index>])
		GetGlobalTags savegame = ($primary_controller) <gig_name>
		progression_get_gig_star_rewards gig_name = <gig_name>
		gold_stars = (<gig_star_rewards>.gold)
		platinum_stars = (<gig_star_rewards>.platinum)
		diamond_stars = (<gig_star_rewards>.diamond)
		progression_get_gig_song_stars_possible gig_name = <gig_name>
		gig_total_stars = (<gold_stars> + <platinum_stars> + <diamond_stars> + <song_stars>)
		total_stars = (<total_stars> + <gig_total_stars>)
		gig_cur_stars = (<song1_stars_earned>)
		if (<completed_gold> = 1)
			gig_cur_stars = (<gig_cur_stars> + (<gig_star_rewards>.gold))
		endif
		if (<completed_platinum> = 1)
			gig_cur_stars = (<gig_cur_stars> + (<gig_star_rewards>.platinum))
		endif
		if (<completed_diamond> = 1)
			gig_cur_stars = (<gig_cur_stars> + (<gig_star_rewards>.diamond))
		endif
		current_stars = (<current_stars> + <gig_cur_stars>)
		gig_index = (<gig_index> + 1)
		repeat <num_gigs>
	endif
	return {
		current_stars = <current_stars>
		total_stars = <total_stars>
	}
endscript

script career_win_challenge \{grade = 4}
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	GMan_SetPendingGrade goal = <current_challenge> grade = <grade>
endscript
