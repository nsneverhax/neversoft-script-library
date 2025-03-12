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
					type = pause
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
										state = uistate_pausemenu_quit_warning
										option2_func_params = {
											newgig
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
	change \{end_credits = 0}
endscript

script career_begin_main_gameplay 
endscript

script career_song_started 
	printf \{'Career::Song_Started'
		channel = career_challenge}
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if ($end_credits > 0 || <current_challenge> = none)
		return
	endif
	if NOT gman_goalisactive goal = <current_challenge>
		progression_clear_rewards_just_unlocked
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = get_current_challenge}
		get_savegame_from_controller controller = ($primary_controller)
		setglobaltags savegame = <savegame> <current_challenge> params = {has_been_played = 1} progression = true
		gman_challengemanagerfunc \{goal = career
			tool = challenges
			func = start_challenge}
		gman_pausefunc \{goal = career
			tool = pause
			func = start}
		if gman_getconstant goal = <current_challenge> name = song_started return_name = custom_callback
			if scriptexists <custom_callback>
				<custom_callback>
			endif
		endif
	else
		gman_unpausegoal goal = <current_challenge>
		goal_retry_current_goal
	endif
	spawnscriptnow \{guitarevent_gigstarted}
endscript

script career_song_complete 
	printf 'Career::Song_Complete event = %a' a = <event> channel = career_challenge
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if NOT gman_goalisactive goal = <current_challenge>
		return
	endif
	if (<event> = song_won)
		gman_getgrade goal = <current_challenge>
		if (<pending_grade> = 0)
			gman_setpendinggrade goal = <current_challenge> grade = 1
		endif
		gameevent_songwon
		gameevent_gigwon
	elseif (<event> = song_retry)
		gameevent_songretry
		gameevent_gigretry
	elseif (<event> = song_failed)
		gman_setpendinggrade goal = <current_challenge> grade = 0
		gameevent_songfailed
		gameevent_gigfailed
	elseif (<event> = song_quit)
		gman_setpendinggrade goal = <current_challenge> grade = 0
		gameevent_songaborted
		gameevent_gigaborted
	endif
	gman_pausegoal goal = <current_challenge>
	challenge_output_debug_info goal_id = <current_challenge>
endscript

script career_continue_next_song 
	printf \{'Career::Continue_Next_Song'
		channel = career_challenge}
	gman_songfunc \{func = switch_to_next_song_in_play_list}
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	change \{gameplay_restart_song = 1}
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script career_complete_challenge 
	if NOT gman_goalisactive \{goal = career}
		return
	endif
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if (gman_goalisactive goal = <current_challenge>)
		gman_clearnextcheckpoint goal = <current_challenge>
		gman_passcheckpoint goal = <current_challenge>
	endif
	gman_songfunc \{func = clear_play_list}
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = set_current_challenge
		params = {
			challenge_id = none
		}}
	progression_clear_rewards_just_unlocked
	update_active_players_atoms
endscript

script career_pause_quit 
	stop_all_paused_sounds
	career_end_challenge
	killspawnedscript \{name = scrolling_list_begin_credits}
	destroy_credits_menu
	printstruct <...> channel = goal
	if gotparam \{newgig}
		generic_event_back \{nosound
			state = uistate_career_venue_select}
	else
		generic_event_back \{nosound
			state = uistate_mainmenu}
	endif
endscript

script career_end_challenge 
	gman_sendcallbacktoallgoals \{suffix = 'song_complete'
		callback_data = {
			event = song_quit
		}}
	career_complete_challenge
endscript

script gman_getresultsdata 
	gman_getdata goal = <goal> name = <results_screen_goal_data>
	if NOT gotparam \{results_screen_goal_data}
		scriptassert qs(0x8b1b399f) a = <goal>
		return
	endif
	column_title = (<results_screen_goal_data>.column_title)
	goal_var_source = (<results_screen_goal_data>.data_source)
	goal_var_name = (<results_screen_goal_data>.var_name)
	is_band_data = 0
	column_data = []
	if (<goal_var_source> = player_goal_data)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			gman_getdata goal = <goal> player = <player> name = <goal_var_name> return_name = recieved_data
			if NOT gotparam \{recieved_data}
				scriptassert qs(0xaa773e13) v = <goal_var_name> s = <goal_var_source>
				return
			endif
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_info_data)
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> (<goal_var_name>) out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
			getnextplayer player = <player>
			repeat <num_players>
		endif
	elseif (<goal_var_source> = player_goal_data_array)
		gman_getdata goal = <goal> name = <goal_var_name> return_name = column_data
	elseif (<goal_var_source> = band_info_data)
		is_band_data = 1
		getbandsstatus
		getarraysize <bands>
		i = 0
		begin
		if (<bands> [<i>].in_game)
			getbandinfo (<i> + 1) score out = recieved_data
			<column_data> = (<column_data> + (<recieved_data>))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return goal_results_column_title = <column_title> goal_results_column_data = <column_data> is_band_data = <is_band_data>
endscript

script career_get_progress_for_venue 
	requireparams \{[
			venue_list
			index
		]
		all}
	gman_challengemanagerfunc goal = career tool = challenges func = get_challenges_for_venue params = {venue = (<venue_list> [<index>].venue)}
	if NOT gotparam \{challenge_list}
		scriptassert 'No career gigs found for venue %a' a = <loaded_venue>
	endif
	getarraysize <challenge_list>
	num_gigs = <array_size>
	total_stars = 0
	current_stars = 0
	if (<num_gigs> > 0)
		gig_index = 0
		begin
		gig_name = (<challenge_list> [<gig_index>])
		getglobaltags savegame = ($primary_controller) <gig_name>
		gold_stars = ($gig_star_rewards.<gig_name>.gold)
		platinum_stars = ($gig_star_rewards.<gig_name>.platinum)
		diamond_stars = ($gig_star_rewards.<gig_name>.diamond)
		progression_get_gig_song_stars_possible gig_name = <gig_name>
		gig_total_stars = (<gold_stars> + <platinum_stars> + <diamond_stars> + <song_stars>)
		total_stars = (<total_stars> + <gig_total_stars>)
		gig_cur_stars = (<song1_stars_earned>)
		if (<completed_gold> = 1)
			gig_cur_stars = (<gig_cur_stars> + ($gig_star_rewards.<gig_name>.gold))
		endif
		if (<completed_platinum> = 1)
			gig_cur_stars = (<gig_cur_stars> + ($gig_star_rewards.<gig_name>.platinum))
		endif
		if (<completed_diamond> = 1)
			gig_cur_stars = (<gig_cur_stars> + ($gig_star_rewards.<gig_name>.diamond))
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
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	gman_setpendinggrade goal = <current_challenge> grade = <grade>
endscript
