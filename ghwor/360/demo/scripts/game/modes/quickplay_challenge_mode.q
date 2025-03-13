g_quickplay_challenge_mode_disabled = 0
g_quickplay_allow_dlc = 1
quickplay_info = {
	name = 'quickplay'
	goal_type = game_mode
	data = {
		targeted_challenge = null
		targeted_challenge_inst_config = null
		targeted_challenge_friend_scores = [
		]
		targeted_challenge_friend_index = -1
		band_outro_challenge_stats = [
		]
		previous_song_stars = -1
	}
	player_data = {
		player_outro_challenge_stats = [
		]
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
					debug
				}
				{
					name = 'challenge_meter'
					type = meter
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
							quit
						}
						custom_options = [
							{
								text = qs(0xea4574ef)
								func = ui_event
								func_params = {
									event = menu_change
									data = {
										state = uistate_pausemenu_quit_warning
										option2_text = qs(0xea4574ef)
										option2_func = quickplay_skip_song
										body_text = qs(0x7ef90e84)
									}
								}
								inclusion_checks = [
									quickplay_pause_tool_not_internet_mode_check
									quickplay_pause_tool_songs_remaining_check
								]
							}
						]
					}
				}
			]
		}
	]
}
g_qp_challenge_ids = [
	qp_alt_strum
	qp_down_strum
	qp_drum_accents
	qp_hit_chords
	qp_hit_hopos
	qp_hit_notes
	qp_hit_notes_band
	qp_green_notes
	qp_open_notes
	qp_spoken_notes
	qp_hit_taps
	qp_sustain_hits
	qp_tap_strum
	qp_up_strum
	qp_multiplier_time
	qp_multiplier_time_band
	qp_rockout_time
	qp_score_points
	qp_score_points_band
	qp_score_points_stdband
	qp_score_spower
	qp_score_spower_band
	qp_spower_banked
	qp_spower_banked_band
	qp_spower_time
	qp_spower_time_band
	qp_streak_notes
	qp_streak_notes_band
	qp_sustain_time
	qp_whammy_time
	qp_trigger_spower_test
	qp_section_accuracy_test
	qp_red_notes
	qp_yellow_notes
	qp_blue_notes
	qp_orange_notes
	qp_streak_phrases
	qp_kick_notes
	qp_power_score_points
]
g_qp_required_challenge_props_order = [
	guitar
	bass
	drum
	vocals
	band
	traditional_band
]
g_qp_challenge_instrument_strings = [
	qs(0x9504b94a)
	qs(0x7d4f9214)
	qs(0x388cd3db)
	qs(0x1b9f6f84)
	qs(0xdabf99c0)
	qs(0xc617defb)
]
g_default_challenge_props = {
	guitar = [
		{
			goal_name = qp_score_points
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_streak_notes
			custom_score_targets = [
				20
				24
				28
			]
		}
		{
			goal_name = qp_score_spower
			custom_score_targets = [
				40
				45
				50
			]
		}
	]
	bass = [
		{
			goal_name = qp_score_points
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_streak_notes
			custom_score_targets = [
				25
				30
				35
			]
		}
	]
	drum = [
		{
			goal_name = qp_score_points
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_hit_notes
			custom_score_targets = [
				70
				75
				80
			]
		}
	]
	vocals = [
		{
			goal_name = qp_score_points
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_spower_banked
			custom_score_targets = [
				50
				60
				70
			]
		}
	]
	band = [
		{
			goal_name = qp_score_points_stdband
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_score_points_band
			custom_score_targets = [
				55
				60
				65
			]
		}
		{
			goal_name = qp_multiplier_time_band
			custom_score_targets = [
				5000
				10000
				20000
			]
		}
	]
}

script quickplay_load_challenges 
	playlist_getcurrentsong
	if ($g_quickplay_allow_dlc = 0)
		if is_song_downloaded song_checksum = <current_song>
			if (<download> = 1)
				return
			endif
		endif
	endif
	gman_challengemanagerfunc {
		goal = quickplay
		tool = challenges
		func = start_quickplay_challenges_for_song
		params = {
			song = <current_song>
		}
	}
endscript

script quickplay_unload_challenges \{reset_targets = 0}
	if gman_goalisactive \{goal = quickplay}
		if (<reset_targets> = 1)
			quickplay_reset_target_data
		endif
	endif
	gman_shutdownallgoals \{except = quickplay}
endscript

script quickplay_reset_target_data 
	if gman_goalisactive \{goal = quickplay}
		gman_setdata \{goal = quickplay
			params = {
				targeted_challenge = null
				targeted_challenge_inst_config = null
				targeted_challenge_friend_scores = [
				]
				targeted_challenge_friend_index = -1
			}}
	endif
endscript

script quickplay_main_enter 
endscript

script quickplay_song_init 
	printf \{'Quickplay::Song_Init'
		channel = quickplay_goal}
	if ($calibrate_lag_enabled = 1)
		return
	endif
	if NOT (gman_goalisactive goal = quickplay)
		return
	endif
	gman_setdata \{goal = quickplay
		params = {
			band_outro_challenge_stats = [
			]
			previous_song_stars = -1
		}}
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	gman_setdata goal = quickplay player = <player> params = {player_outro_challenge_stats = []}
	getnextplayer player = <player> local
	repeat <num_players>
	gamemode_gettype
	if (<type> = quickplay)
		quickplay_load_challenges
		gman_meterfunc \{goal = quickplay
			tool = challenge_meter
			func = reset_friend_target_progress
			params = {
			}}
	endif
	change \{career_rewards_just_unlocked = [
		]}
	change \{g_quickplay_rewards_just_unlocked = [
		]}
endscript

script quickplay_song_started 
	printf \{'Quickplay::Song_Started'
		channel = quickplay_goal}
	gman_getdata \{goal = quickplay
		name = targeted_challenge}
	if (<targeted_challenge> != null)
		quickplay_display_target_meters targeted_challenge = <targeted_challenge>
	else
		gman_setdata \{goal = quickplay
			params = {
				targeted_challenge_friend_scores = [
				]
			}}
	endif
	gman_setdata \{goal = quickplay
		params = {
			band_outro_challenge_stats = [
			]
			previous_song_stars = -1
		}}
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	gman_setdata goal = quickplay player = <player> params = {player_outro_challenge_stats = []}
	getnextplayer player = <player> local
	repeat <num_players>
	change \{career_rewards_just_unlocked = [
		]}
	change \{g_quickplay_rewards_just_unlocked = [
		]}
endscript

script quickplay_song_complete 
	printf 'Quickplay::Song_Complete event = %a' a = <event> channel = quickplay_goal
	if (song_won = <event> && ($autotest_on = 0))
		progression_quickplay_clear_rewards_just_unlocked
		update_song_star_rating
		playlist_getcurrentsong
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		getsavegamefromcontroller controller = <controller>
		get_current_progression_award_points savegame = <savegame>
		<starting_award_points> = <total_award_points>
		if isbandcheating
			quickplay_check_and_save_scores song = <current_song> player = <player> savegame = <savegame> do_save = 0
		else
			quickplay_check_and_save_scores song = <current_song> player = <player> savegame = <savegame>
		endif
		quickplay_save_song_stats player = <player> savegame = <savegame> current_song = <current_song>
		quickplay_save_song_stats player = <player> savegame = <savegame> current_song = <current_song> band_challenge = 1
		get_current_progression_award_points savegame = <savegame>
		setplayerinfo <player> recent_award_points = (<total_award_points> - <starting_award_points>)
		setplayerinfo <player> total_award_points = (<total_award_points>)
		getnextplayer player = <player> local
		repeat <num_players>
		update_active_players_atoms
		song_breakdown_qp_check_for_rewards
		if (<has_unlocked_rewards> = 1)
			if ishost
				net_quickplay_set_rewards_unlocked
			else
				sendstructure \{callback = net_quickplay_set_rewards_unlocked
					data_to_send = {
					}}
			endif
		endif
		gman_setdata \{goal = quickplay
			params = {
				band_outro_challenge_stats = [
				]
			}}
		quickplay_calc_challenge_outro_stats \{player = 0}
	elseif (song_quit = <event>)
		quickplay_unload_challenges
	elseif (song_retry = <event> || song_failed = <event>)
		quickplay_unload_challenges \{reset_targets = 0}
	endif
endscript

script net_quickplay_set_rewards_unlocked 
	if ishost
		change \{g_net_quickplay_show_unlock_screen = 1}
		sendstructure \{callback = net_quickplay_set_rewards_unlocked
			data_to_send = {
			}}
	else
		change \{g_net_quickplay_show_unlock_screen = 1}
	endif
endscript

script quickplay_display_target_meters \{targeted_challenge = !q1768515945}
	gman_getinstancesofgoal goal_name = <targeted_challenge>
	if (<goal_instances_size> > 0)
		gman_getdata \{goal = quickplay
			name = targeted_challenge_inst_config}
		i = 0
		begin
		challenge_id = (<goal_instances> [<i>])
		if gman_goalisactive goal = <challenge_id>
			gman_getassignedplayer goal_name = <challenge_id>
			if (<assigned_player> = 0)
				getfirstplayer \{local}
				getplayerinfo <player> band
				gman_meterfunc {
					goal = quickplay
					tool = challenge_meter
					func = create_targeted_challenge_meter
					params = {band_meter band_index = <band> targeted_challenge = <challenge_id>}
				}
			else
				getplayerinfo <assigned_player> part
				if (<part> = <targeted_challenge_inst_config>)
					gman_meterfunc {
						goal = quickplay
						tool = challenge_meter
						func = create_targeted_challenge_meter
						params = {player_meter player_index = <assigned_player> targeted_challenge = <challenge_id>}
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <goal_instances_size>
	endif
endscript

script quickplay_set_new_song_in_gig_list 
	if ($g_songlist_infinite_playlist = 1)
		playlist_removefirstsong \{populate_list = 1}
	else
		if playlist_isfinished
			return \{false}
		endif
		playlist_switchtonextsong
	endif
	gamemode_gettype
	if (quickplay = <type>)
		quickplay_unload_challenges
	endif
	return \{true}
endscript

script quickplay_check_and_save_scores \{song = !q1768515945
		player = !i1768515945
		savegame = !i1768515945
		do_save = 1}
	if song_is_jamsession song = <song>
		return
	endif
	gman_setdata goal = quickplay player = <player> params = {player_outro_challenge_stats = []}
	gman_getgoalsbyplayer player = <player>
	if (0 != <goals_by_player_size>)
		index = 0
		begin
		quickplay_do_challenge_score_update {
			challenge_instance_id = (<goals_by_player> [<index>])
			goal_name = (<goal_strings_by_player> [<index>])
			song = <song>
			player = <player>
			savegame = <savegame>
			save = <do_save>
		}
		index = (<index> + 1)
		repeat <goals_by_player_size>
	elseif playerinfoequals <player> difficulty = beginner
		if NOT song_is_jamsession song = <song>
			if NOT gman_ispowerscoreenabled
				getplayerinfo <player> band
				band_stats = ($song_stats_backup_band [(<band> - 1)])
				song_stars = (<band_stats>.stars)
				getglobaltags savegame = <savegame> <song>
				if (<song_stars> > <qp_performance_stars>)
					if (<do_save> = 1)
						addparam structure_name = save_value_params name = qp_performance_stars value = <song_stars>
						get_current_progression_award_points savegame = <savegame>
						new_song_stars = (<song_stars> - <qp_performance_stars>)
						set_progression_award_points savegame = <savegame> new_total_award_points = (<total_award_points> + <new_song_stars>)
						setglobaltags savegame = <savegame> <song> params = <save_value_params>
					endif
				endif
			endif
		endif
	endif
	gman_getgoalsbyplayer \{player = 0}
	if (0 != <goals_by_player_size>)
		index = 0
		begin
		quickplay_do_challenge_score_update {
			challenge_instance_id = (<goals_by_player> [<index>])
			goal_name = (<goal_strings_by_player> [<index>])
			song = <song>
			player = <player>
			savegame = <savegame>
			band_challenge = 1
			save = <do_save>
		}
		index = (<index> + 1)
		repeat <goals_by_player_size>
	endif
endscript

script quickplay_do_challenge_score_update \{challenge_instance_id = !q1768515945
		goal_name = !q1768515945
		song = !q1768515945
		player = !i1768515945
		savegame = !i1768515945
		save = 1
		band_challenge = 0}
	getglobaltags savegame = <savegame> <song>
	gman_getassignedplayer goal_name = <challenge_instance_id>
	if NOT gman_getqpsavechecksums song = <song> goal_name = <goal_name> assigned_player = <assigned_player>
		return
	endif
	previous_saved_grade = (<...>.<grade_checksum>)
	gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_score params = {challenge_id = <challenge_instance_id>}
	casttointeger \{score_value}
	if (<score_value> > (<...>.<score_checksum>))
		addparam structure_name = save_value_params name = <score_checksum> value = <score_value>
		getplayerinfo <player> difficulty
		diff_as_int = 0
		if (<difficulty> = easy)
			diff_as_int = 0
		elseif (<difficulty> = medium)
			diff_as_int = 1
		elseif (<difficulty> = hard)
			diff_as_int = 2
		elseif (<difficulty> = expert)
			if expert_plus_is_enabled player = <player> current_song = <song>
				diff_as_int = 4
			else
				diff_as_int = 3
			endif
		endif
		addparam structure_name = save_value_params name = <diff_checksum> value = <diff_as_int>
		if (<goal_name> = qp_power_score_points)
			getplayerinfo <player> part
			<part_as_int> = 0
			switch (<part>)
				case guitar
				<part_as_int> = 4
				case bass
				<part_as_int> = 3
				case drum
				<part_as_int> = 2
				case vocals
				<part_as_int> = 1
			endswitch
			addparam structure_name = save_value_params name = qp_power_best_instrument value = <part_as_int>
		endif
	endif
	song_stars = 0
	gman_getdata \{goal = quickplay
		name = previous_song_stars}
	if (<previous_song_stars> = -1 && <save> = 1)
		gman_setdata goal = quickplay params = {previous_song_stars = <qp_performance_stars>}
	endif
	if NOT gman_ispowerscoreenabled
		getplayerinfo <player> band
		band_stats = ($song_stats_backup_band [(<band> - 1)])
		song_stars = (<band_stats>.stars)
		if (<song_stars> > <qp_performance_stars>)
			addparam structure_name = save_value_params name = qp_performance_stars value = <song_stars>
			get_current_progression_award_points savegame = <savegame>
			if (<save> = 1)
				new_song_stars = (<song_stars> - <qp_performance_stars>)
				set_progression_award_points savegame = <savegame> new_total_award_points = (<total_award_points> + <new_song_stars>)
			endif
		endif
	endif
	quickplay_get_grade goal_id = <challenge_instance_id>
	if (<pending_grade> > (<...>.<grade_checksum>))
		addparam structure_name = save_value_params name = <grade_checksum> value = <pending_grade>
		if (<save> = 1)
			quickplay_challenge_give_award_points player = <player> savegame = <savegame> new_grade = <pending_grade> old_grade = (<...>.<grade_checksum>)
		endif
	endif
	if (<save> = 1)
		if gotparam \{save_value_params}
			setglobaltags savegame = <savegame> <song> params = <save_value_params>
		endif
		<add_goal_data> = 1
		if gman_ispowerscoreenabled
			<add_goal_data> = 0
			gman_getdata \{goal = quickplay
				name = targeted_challenge_friend_index}
			gman_setdata goal = <challenge_instance_id> params = {previous_grade = <previous_saved_grade>}
			if (<targeted_challenge_friend_index> >= 0)
				<add_goal_data> = 1
			endif
		endif
		if (<add_goal_data> = 1)
			gman_getdata goal = quickplay player = <player> name = player_outro_challenge_stats
			gman_meterfunc {
				goal = quickplay
				tool = challenge_meter
				func = get_fill_percent
				params = {player_index = <player>}
			}
			current_progress = 0
			calculated_targets = [0 0 0]
			if gman_goalisactive goal = <challenge_instance_id>
				gman_getassignedplayer goal_name = <challenge_instance_id>
				gman_getdata goal = <challenge_instance_id> name = calculated_targets
				if (<assigned_player> = 0)
					gman_getdata goal = <challenge_instance_id> name = current_progress
				else
					gman_getdata goal = <challenge_instance_id> player = <player> name = current_progress
				endif
			endif
			new_stat_entry = {
				goal_name = <goal_name>
				instance_name = <challenge_instance_id>
				challenge_icon = <goal_name>
				challenge_grade = <pending_grade>
				progress_to_next_grade = <meter_fill>
				previous_grade = <previous_saved_grade>
				current_progress = <current_progress>
				calculated_targets = <calculated_targets>
			}
			addarrayelement array = <player_outro_challenge_stats> element = <new_stat_entry>
			outro_challenge_stats = <array>
			if (<band_challenge> = 1)
				gman_setdata goal = quickplay params = {band_outro_challenge_stats = <outro_challenge_stats>}
			else
				gman_setdata goal = quickplay player = <player> params = {player_outro_challenge_stats = <outro_challenge_stats>}
			endif
		endif
	else
		quickplay_get_overall_awards_progress player = <player>
		if gman_ispowerscoreenabled
			<challenge_stars_earned_this_try> = <pending_grade>
			<new_challenge_stars_earned_this_try> = (<pending_grade> - (<...>.<grade_checksum>))
			if (<new_challenge_stars_earned_this_try> < 0)
				<new_challenge_stars_earned_this_try> = 0
			endif
		else
			get_quickplay_challenge_award_points_change new_grade = <pending_grade> old_grade = 0
			<challenge_stars_earned_this_try> = <challenge_award_points>
			get_quickplay_challenge_award_points_change new_grade = <pending_grade> old_grade = (<...>.<grade_checksum>)
			<new_challenge_stars_earned_this_try> = <challenge_award_points>
		endif
		<new_stars> = (<song_stars> - <qp_performance_stars>)
		if (<new_stars> < 0)
			<new_stars> = 0
		endif
		return {
			total_award_points = <current_award_points_total>
			song_stars_earned_this_try = <song_stars>
			new_song_stars_earned_this_try = <new_stars>
			challenge_stars_earned_this_try = <challenge_stars_earned_this_try>
			new_challenge_stars_earned_this_try = <new_challenge_stars_earned_this_try>
		}
	endif
endscript

script quickplay_save_song_stats \{player = !i1768515945
		savegame = !i1768515945
		current_song = !q1768515945
		band_challenge = 0}
	if song_is_jamsession song = <current_song>
		return
	endif
	gamemode_gettype
	if (<type> = quickplay)
		if gman_ispowerscoreenabled
			return
		endif
	endif
	if isbandcheating
		return
	endif
	if (<band_challenge> = 1)
		part = band
	else
		getplayerinfo <player> part
	endif
	getplayerinfo <player> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	part = ($instrument_list.<part>.text_nl)
	formattext checksumname = beststars 'setlist_beststars_%p_%d' p = <part> d = <difficulty_text_nl> addtostringlookup = true
	formattext checksumname = bestscore 'setlist_bestscore_%p_%d' p = <part> d = <difficulty_text_nl> addtostringlookup = true
	formattext checksumname = bestpercentage 'setlist_bestpercentage_%p_%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> addtostringlookup = true
	gamemode_gettype
	getplayerinfo <player> band
	if (<band_challenge> = 0 || <type> = competitive)
		song_stats = ($song_stats_backup [<player> - 1])
		ui_song_breakdown_get_basic_player_data player_index = <player>
	else
		song_stats = ($song_stats_backup_band [(<band> - 1)])
		backup_player = <player>
		getnumplayersingame \{local}
		getfirstplayer \{local}
		avg_percent_notes_hit = 0
		begin
		ui_song_breakdown_get_basic_player_data player_index = <player>
		avg_percent_notes_hit = (<avg_percent_notes_hit> + <percent_notes_hit>)
		getnextplayer player = <player> local
		repeat <num_players>
		avg_percent_notes_hit = (<avg_percent_notes_hit> / <num_players>)
		casttointeger \{avg_percent_notes_hit}
		percent_notes_hit = <avg_percent_notes_hit>
		player = <backup_player>
	endif
	getglobaltags savegame = <savegame> <current_song>
	if (<type> = competitive)
		song_stars = -1
		if ((<...>.<beststars>) = 0)
			addparam structure_name = save_value_params name = <beststars> value = <song_stars>
		endif
	else
		song_stars = (<song_stats>.stars)
	endif
	if (<song_stars> > (<...>.<beststars>))
		addparam structure_name = save_value_params name = <beststars> value = <song_stars>
	endif
	song_score = (<song_stats>.score)
	if (<song_score> > (<...>.<bestscore>))
		casttointeger \{song_score}
		addparam structure_name = save_value_params name = <bestscore> value = <song_score>
	endif
	if (<percent_notes_hit> > 100)
		percent_notes_hit = 100
	endif
	if (<percent_notes_hit> > (<...>.<bestpercentage>))
		addparam structure_name = save_value_params name = <bestpercentage> value = <percent_notes_hit>
	endif
	if gotparam \{save_value_params}
		setglobaltags savegame = <savegame> <current_song> params = <save_value_params>
	endif
endscript

script quickplay_determine_grade_based_on_score \{challenge_id = !q1768515945
		goal_name = !q1768515945
		score = !i1768515945
		instrument = !q1768515945
		song = !q1768515945}
	if gman_goalisactive goal = <challenge_id>
		gman_getdata goal = <challenge_id> name = calculated_targets
		calculated_scores = <calculated_targets>
	else
		extendcrc <goal_name> '_info' out = goal_struct
		if NOT structurecontains structure = (($<goal_struct>).constants) name = target_value
			softassert 'quickplay_determine_grade_based_on_score: target_value not found in constants for goal %a' a = <challenge_id>
			return \{best_grade = 0}
		endif
		if NOT structurecontains structure = (($<goal_struct>).data) name = percent_targets
			softassert 'quickplay_determine_grade_based_on_score: percent_targets not found in goal data for goal %a' a = <challenge_id>
			return \{best_grade = 0}
		endif
		<round_direction> = up
		<round_to_nearest> = 0
		if structurecontains structure = (($<goal_struct>).data) name = round_direction
			<round_direction> = (($<goal_struct>).data.round_direction)
		endif
		if structurecontains structure = (($<goal_struct>).data) name = round_to_nearest
			<round_to_nearest> = (($<goal_struct>).data.round_to_nearest)
		endif
		gman_calculatequickplayscoretargets {
			target_mechanic = ((($<goal_struct>).constants).target_value)
			percent_targets = ((($<goal_struct>).data).percent_targets)
			song_name = <song>
			instrument = <instrument>
			round_direction = <round_direction>
			round_to_nearest = <round_to_nearest>
		}
	endif
	if NOT gotparam \{calculated_scores}
		softassert 'quickplay_determine_grade_based_on_score: Unable to calculate the scores for %a' a = <challenge_id>
		return \{best_grade = 0}
	endif
	i = 2
	begin
	if (<score> >= (<calculated_scores> [<i>]))
		return best_grade = (<i> + 1)
	endif
	i = (<i> - 1)
	repeat 3
	return \{best_grade = 0}
endscript

script quickplay_determine_grade_based_on_saved_score \{challenge_id = !q1768515945
		goal_name = !q1768515945
		song = !q1768515945
		instrument = !q1768515945
		savegame = !i1768515945}
	gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_save_checksum params = {song = <song> goal_name = <goal_name>}
	getglobaltags savegame = <savegame> <song>
	best_score = (<...>.<save_checksum>)
	quickplay_determine_grade_based_on_score challenge_id = <challenge_id> score = <best_score> instrument = <instrument> song = <song>
	return best_grade = <best_grade>
endscript

script get_quickplay_challenge_award_points_change \{new_grade = !i1768515945
		old_grade = !i1768515945}
	<grade_change> = (<new_grade> - <old_grade>)
	if (<grade_change> > 0)
		return challenge_award_points = <grade_change>
	else
		return \{challenge_award_points = 0}
	endif
endscript

script quickplay_challenge_give_award_points \{new_grade = !i1768515945
		old_grade = !i1768515945
		player = !i1768515945
		savegame = !i1768515945}
	get_quickplay_challenge_award_points_change new_grade = <new_grade> old_grade = <old_grade>
	get_current_progression_award_points savegame = <savegame>
	set_progression_award_points savegame = <savegame> new_total_award_points = (<total_award_points> + <challenge_award_points>)
endscript

script quickplay_songlist_update_awards \{song_checksum = !q1768515945
		objid = songlist_detail
		song_is_locked = 0}
	if NOT screenelementexists id = <objid>
		return
	endif
	if song_is_jamsession song = <song_checksum>
		<objid> :se_setprops {
			songlist_detail_stars_cont_alpha = 0.0
			stars_bar_qp_alpha = 0.0
			songlist_detail_info_pill_cont_alpha = 1.0
			songlist_detail_info_pill_text_text = ($content_source_ghtunes_artist_string)
			career_gold_star_alpha = 0.0
		}
		return
	endif
	gamemode_gettype
	if (<type> != quickplay)
		if (<type> = competitive)
			<objid> :se_setprops {
				songlist_detail_stars_cont_alpha = 0.0
				stars_bar_qp_alpha = 0.0
				career_gold_star_alpha = 0.0
			}
			if (<song_is_locked> = 1)
				<objid> :se_setprops {
					songlist_detail_info_pill_cont_alpha = 0.0
				}
			else
				rules = ($competitive_rules)
				rules_struct = ($<rules>)
				rules_str = (<rules_struct>.text)
				if ($game_mode = fest_mode)
					<rules_str> = ($solo_fest_mode.text)
				elseif ($game_mode = fest_mode_team)
					<rules_str> = ($team_fest_mode.text)
				endif
				<objid> :se_setprops {
					songlist_detail_info_pill_cont_alpha = 1.0
					songlist_detail_info_pill_text_text = <rules_str>
				}
			endif
		else
			<objid> :se_setprops {
				songlist_detail_stars_cont_alpha = 0.0
				stars_bar_qp_alpha = 0.0
				songlist_detail_info_pill_cont_alpha = 0.0
				career_gold_star_alpha = 0.0
			}
		endif
		return
	endif
	if (<song_is_locked> = 1)
		<objid> :se_setprops {
			songlist_detail_stars_cont_alpha = 0.0
			stars_bar_qp_alpha = 0.0
			songlist_detail_info_pill_cont_alpha = 0.0
			career_gold_star_alpha = 0.0
		}
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	quickplay_get_awards_for_song song_name = <song_checksum> savegame = <savegame>
	quickplay_get_best_stars_for_song song = <song_checksum>
	formattext textname = challenge_stars_text qs(0x953baf82) a = <challenge_awards> b = <challenge_awards_total>
	formattext textname = power_star_text qs(0x73307931) s = <qp_power_stars>
	formattext textname = best_stars_text qs(0x7766f6e8) c = <best_stars>
	formattext textname = total_stars_text qs(0x3c71eff6) t = (<awards_earned> + <qp_power_stars>)
	bar_fill = 0.0
	if (<awards_earned> > 0)
		bar_fill = ((<awards_earned> + 0.0) / (<awards_total> + 0.0))
		bar_fill = ((<bar_fill> * (1.0, 0.0)) + (1 * (0.0, 1.0)))
	endif
	<objid> :se_setprops {
		stars_bar_alpha = 1.0
		songlist_detail_stars_cont_alpha = 1.0
		stars_bar_qp_alpha = 1.0
		songlist_detail_info_pill_cont_alpha = 0.0
		songlist_detail_awards_num_text = <challenge_stars_text>
		songlist_detail_awards_fill_scale = <bar_fill>
		career_gold_star_alpha = 1.0
		career_star_number_text = <power_star_text>
		best_run_stars_text = <best_stars_text>
		star_total_text = <total_stars_text>
	}
endscript

script quickplay_calc_challenge_outro_stats \{player = !i1768515945}
	gman_getgoalsbyplayer player = <player>
	array = []
	orig_player = <player>
	if (<player> = 0)
		player = (<player> + 1)
	endif
	if (<goals_by_player_size> > 0)
		index = 0
		begin
		goal_id = (<goals_by_player> [<index>])
		goal_string = (<goal_strings_by_player> [<index>])
		<add_goal_data> = 1
		if checksumequals a = <goal_string> b = qp_power_score_points
			<add_goal_data> = 0
			gman_getdata \{goal = quickplay
				name = targeted_challenge_friend_index}
			if (<targeted_challenge_friend_index> >= 0)
				<add_goal_data> = 1
			endif
		endif
		if (<add_goal_data> = 1)
			quickplay_get_grade goal_id = <goal_id>
			quickplay_get_challenge_name_string_from_checksum goal_name = <goal_string> player = <player>
			current_progress = 0
			calculated_targets = [0 0 0]
			gman_getdata goal = <goal_id> name = calculated_targets
			if (<orig_player> = 0)
				gman_getdata goal = <goal_id> name = current_progress
			else
				gman_getdata goal = <goal_id> player = <player> name = current_progress
			endif
			new_stat_entry = {
				goal_name = <goal_string>
				instance_name = <goal_id>
				challenge_icon = <goal_string>
				challenge_grade = <pending_grade>
				previous_grade = 0
				challenge_name_string = <challenge_name_string>
				current_progress = <current_progress>
				calculated_targets = <calculated_targets>
			}
			addarrayelement array = <array> element = <new_stat_entry>
			removeparameter \{new_stat_entry}
		endif
		index = (<index> + 1)
		repeat <goals_by_player_size>
		if (<orig_player> = 0)
			gman_setdata goal = quickplay params = {band_outro_challenge_stats = <array>}
		endif
	endif
	return player_challenge_stats = <array>
endscript

script quickplay_get_challenge_outro_stats \{player = !i1768515945}
	if NOT gman_goalisactive \{goal = quickplay}
		return \{player_challenge_stats = [
			]
			previous_song_stars = 0}
	endif
	if (<player> = 0)
		gman_getdata \{goal = quickplay
			name = band_outro_challenge_stats}
		player_challenge_stats = <band_outro_challenge_stats>
	else
		gman_getdata goal = quickplay player = <player> name = player_outro_challenge_stats
		player_challenge_stats = <player_outro_challenge_stats>
	endif
	getarraysize <player_challenge_stats>
	if (<array_size> = 0)
		quickplay_calc_challenge_outro_stats player = <player>
	endif
	gman_getdata \{goal = quickplay
		name = previous_song_stars}
	return player_challenge_stats = <player_challenge_stats> previous_song_stars = <previous_song_stars>
endscript

script quickplay_save_friend_scores \{instrument_index = !i1768515945}
	awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index>
	gman_setdata goal = quickplay params = {targeted_challenge_friend_scores = <display_rows>}
endscript

script quickplay_save_friend_stats \{challenge_id = !i1768515945}
	awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
	gman_setdata goal = quickplay params = {targeted_challenge_friend_scores = <display_rows>}
endscript

script quickplay_save_specific_friend_stat \{friend_scores = !a1768515945
		target_index = !i1768515945}
	target_scores = []
	getarraysize <friend_scores>
	if (<array_size> > 0)
		i = 0
		begin
		addarrayelement array = <target_scores> element = (<friend_scores> [<i>])
		target_scores = <array>
		i = (<i> + 1)
		repeat (<target_index> + 1)
	endif
	gman_setdata goal = quickplay params = {targeted_challenge_friend_scores = <target_scores> targeted_challenge_friend_index = <target_index>}
endscript

script quickplay_start_targeted_challenge \{song_name = !q1768515945
		challenge_name = !q1768515945
		instrument = !q1768515945
		event = menu_replace}
	gamemode_gettype
	if (<type> != quickplay)
		return
	endif
	if NOT gman_goalisactive \{goal = quickplay}
		return
	endif
	if (<challenge_name> = qp_power_score_points)
		gman_challengemanagerfunc \{goal = quickplay
			tool = challenges
			func = enable_power_score_challenge}
	else
		gman_challengemanagerfunc \{goal = quickplay
			tool = challenges
			func = disable_power_score_challenge}
	endif
	ui_sfx \{menustate = generic
		uitype = select}
	songlist_update_song_preview \{song = none}
	gman_setdata goal = quickplay params = {targeted_challenge = <challenge_name> targeted_challenge_inst_config = <instrument>}
	gman_venuefunc {goal = quickplay tool = venue_handler func = set_venue params = {venue_name = ($g_band_lobby_current_level)}}
	<array> = []
	addarrayelement array = <array> element = <song_name>
	change current_playlist = <array>
	playlist_setcurrentsong song = <song_name>
	venue = ($g_band_lobby_current_level)
	if structurecontains structure = ($levelzones.<venue>) name = loading_movie
		create_venue_loading_screen movie_params = ($levelzones.<venue>)
	else
		create_loading_screen
	endif
	gman_meterfunc \{goal = quickplay
		tool = challenge_meter
		func = init_friend_target_score
		params = {
		}}
	ui_event_wait event = <event> state = uistate_play_song data = {reset_target_data = 0}
endscript

script quickplay_pause_tool_not_internet_mode_check 
	if NOT ininternetmode
		return \{true}
	endif
	return \{false}
endscript

script quickplay_pause_tool_songs_remaining_check 
	playlist_getsize
	playlist_getcurrentsongindex
	if ((<playlist_size> > 1) && (<current_song_index> < <playlist_size>))
		return \{true}
	endif
	if ($g_songlist_infinite_playlist = 1)
		return \{true}
	endif
	return \{false}
endscript

script quickplay_pause_tool_no_songs_remaining_check 
	playlist_getsize
	playlist_getcurrentsongindex
	if ((<playlist_size> <= 1) || (<current_song_index> >= <playlist_size>))
		return \{true}
	endif
	return \{false}
endscript

script quickplay_pause_tool_not_demobuild_check 
	if NOT demobuild
		return \{true}
	endif
	return \{false}
endscript

script quickplay_get_challenge_icon \{base_name = !q1768515945}
	icon_name = <base_name>
	if (<base_name> = qp_green_notes || <base_name> = qp_red_notes || <base_name> = qp_yellow_notes || <base_name> = qp_blue_notes || <base_name> = qp_orange_notes || <base_name> = qp_kick_notes)
		icon_name = qp_color_notes
	endif
	if (<base_name> = qp_hit_notes_band)
		icon_name = qp_hit_notes
	endif
	if (<base_name> = qp_streak_phrases)
		icon_name = qp_streak_notes
	endif
	if (<base_name> = qp_score_power_band)
		icon_name = qp_score_power
	endif
	if (<base_name> = qp_score_points_band || <base_name> = qp_score_points_std_band)
		icon_name = qp_score_points
	endif
	return icon_name = <icon_name>
endscript

script quickplay_get_challenge_name_string_from_checksum \{goal_name = !q1768515945}
	challenge_name_string = qs(0xf7ce2fcb)
	challenge_desc_string = qs(0xf7ce2fcb)
	extendcrc <goal_name> '_info' out = goal_struct
	if NOT globalexists name = <goal_struct>
		return challenge_name_string = <challenge_name_string> challenge_desc_string = <challenge_desc_string>
	endif
	if structurecontains structure = ($<goal_struct>) title_string
		challenge_name_string = ($<goal_struct>.title_string)
		challenge_desc_string = ($<goal_struct>.constants.desc_txt)
	endif
	if gotparam \{player}
		if (<player> > 0)
			getplayerinfo <player> lefty_flip
			getplayerinfo <player> part
			if (<part> = drum && <lefty_flip> = 1)
				if structurecontains structure = ($<goal_struct>) drum_lefty_string
					challenge_name_string = ($<goal_struct>.drum_lefty_string)
					challenge_desc_string = ($<goal_struct>.constants.drum_lefty_desc_text)
				endif
			endif
		endif
	endif
	return challenge_name_string = <challenge_name_string> challenge_desc_string = <challenge_desc_string>
endscript

script autotest_quickplay_build_bot_settings \{player = !i1768515945
		challenge_props = 0x69696969
		force_accuracy = 1.0}
	new_rules = [
		{bot_hit_percent = <force_accuracy>}
		{bot_whammy = 1}
		{star_power_debug_mode = 2}
	]
	getplayerinfo <player> part
	<instrument_props> = (<challenge_props>.<part>)
	if NOT gotparam \{instrument_props}
		return \{player_bot_rules = [
			]}
	endif
	getarraysize <instrument_props>
	if (<array_size> < 0)
		return \{player_bot_rules = [
			]}
	endif
	i = 0
	begin
	goal_name = ((<instrument_props> [<i>]).goal_name)
	new_setting = {}
	switch (<goal_name>)
		case qp_alt_strum
		addparam \{structure_name = new_setting
			name = bot_strum_type
			value = alternate}
		addarrayelement array = <new_rules> element = <new_setting>
		new_rules = <array>
		case qp_up_strum
		addparam \{structure_name = new_setting
			name = bot_strum_type
			value = up}
		addarrayelement array = <new_rules> element = <new_setting>
		new_rules = <array>
		case qp_down_strum
		addparam \{structure_name = new_setting
			name = bot_strum_type
			value = down}
		addarrayelement array = <new_rules> element = <new_setting>
		new_rules = <array>
		case qp_tap_strum
		addparam \{structure_name = new_setting
			name = bot_strum_type
			value = touch}
		addarrayelement array = <new_rules> element = <new_setting>
		new_rules = <array>
		case qp_rockout_time
		addparam \{structure_name = new_setting
			name = bot_rockout
			value = 1}
		addarrayelement array = <new_rules> element = <new_setting>
		new_rules = <array>
		case qp_spower_time_band
		getplayerinfo <player> band
		setbandinfo <band> use_bot_coordinated_starpower = 1
		case qp_multiplier_time_band
		getplayerinfo <player> band
		setbandinfo <band> use_bot_coordinated_starpower = 1
		case qp_score_spower_band
		getplayerinfo <player> band
		setbandinfo <band> use_bot_coordinated_starpower = 1
	endswitch
	i = (<i> + 1)
	repeat <array_size>
	return player_bot_rules = <new_rules>
endscript

script quickplay_autotest_start 
	blockforscript \{guitar_startup}
	gman_quickstartgoal \{goal_struct = quickplay_info
		goal_name = quickplay}
	if ($autotest_targeted_challenge != none)
		gman_setdata goal = quickplay params = {
			targeted_challenge = ($autotest_targeted_challenge)
			targeted_challenge_inst_config = ($autotest_targetd_challenge_part)
		}
	endif
endscript

script quickplay_targeting_player_get_result \{player = -1}
	if (<player> = -1)
		player = ($g_leader_player_num)
	endif
	gamemode_gettype
	if NOT (<type> = quickplay)
		return \{result = not_targeting_player}
	endif
	if NOT gman_goalisactive \{goal = quickplay}
		return \{result = not_targeting_player}
	endif
	gman_getdata \{goal = quickplay
		name = targeted_challenge_friend_index}
	if (<targeted_challenge_friend_index> >= 0)
		gman_getdata \{goal = quickplay
			name = targeted_challenge_friend_scores}
		gman_getdata \{goal = quickplay
			name = targeted_challenge}
		gman_getdata \{goal = quickplay
			name = targeted_challenge_inst_config}
		extendcrc <targeted_challenge> '_info' out = targeted_challenge_info
		if ((<targeted_challenge_inst_config> = band) || (<targeted_challenge_inst_config> = traditional_band))
			formattext checksumname = player_challenge_id '%n' n = ($<targeted_challenge_info>.name)
		elseif (<player> > 0)
			formattext checksumname = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.name) p = <player>
		else
			return \{result = not_targeting_player
				target_instance_name = none}
		endif
		if NOT gman_goalisactive goal = <player_challenge_id>
			quickplay_reset_target_data
			return \{result = not_targeting_player
				target_instance_name = none}
		endif
		if challenge_is_band_subtype goal_id = <player_challenge_id>
			gman_getdata goal = <player_challenge_id> name = current_progress
		else
			gman_getdata goal = <player_challenge_id> player = <player> name = current_progress
		endif
		if (<current_progress> > (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
			return result = success target_instance_name = <player_challenge_id>
		elseif (<current_progress> < (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
			return result = fail target_instance_name = <player_challenge_id>
		else
			return result = tie target_instance_name = <player_challenge_id>
		endif
	else
		return \{result = not_targeting_player
			target_instance_name = none}
	endif
endscript

script quickplay_targeting_player_get_opponent_gamertag 
	gamemode_gettype
	if NOT (<type> = quickplay)
		return \{gamertag = null}
	endif
	if NOT gman_goalisactive \{goal = quickplay}
		return \{gamertag = null}
	endif
	gman_getdata \{goal = quickplay
		name = targeted_challenge_friend_index}
	if (<targeted_challenge_friend_index> >= 0)
		gman_getdata \{goal = quickplay
			name = targeted_challenge_friend_scores}
		return gamertag = (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].gamer_tag)
	else
		return \{gamertag = null}
	endif
endscript
