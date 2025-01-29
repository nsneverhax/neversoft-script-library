g_quickplay_challenge_mode_disabled = 0
0x084270c2 = [
	1
	2
	3
]
quickplay_info = {
	Name = 'quickplay'
	goal_type = game_mode
	data = {
		targeted_challenge = NULL
		targeted_challenge_inst_config = NULL
		targeted_challenge_friend_scores = [
		]
		targeted_challenge_friend_index = -1
	}
	constants = {
	}
	checkpoints = [
		{
			Name = 'main'
			tools = [
				{
					Name = 'venue_handler'
					Type = venue
				}
				{
					Name = 'challenges'
					Type = challenge_manager
					debug
				}
				{
					Name = 'challenge_meter'
					Type = meter
				}
				{
					Name = 'pause'
					Type = Pause
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
									}
								}
								inclusion_checks = [
									quickplay_pause_tool_not_internet_mode_check
									quickplay_pause_tool_songs_remaining_check
								]
							}
							{
								text = qs(0xae6cf896)
								func = ui_event
								func_params = {
									event = menu_change
									data = {
										state = uistate_pausemenu_quit_warning
										option2_text = qs(0xae6cf896)
										option2_func = quickplay_select_edit_playlist
									}
								}
								inclusion_checks = [
									quickplay_pause_tool_not_internet_mode_check
									quickplay_pause_tool_not_demobuild_check
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
]
g_qp_required_challenge_props_order = [
	guitar
	bass
	drum
	vocals
	Band
	traditional_band
]
g_qp_challenge_instrument_strings = [
	qs(0x9504b94a)
	qs(0x7d4f9214)
	qs(0x388cd3db)
	qs(0x1b9f6f84)
	qs(0xdabf99c0)
	qs(0x4e6db4af)
]
g_default_challenge_props = {
	guitar = [
		{
			goal_name = qp_score_points
		}
		{
			goal_name = qp_streak_notes
		}
		{
			goal_name = qp_score_spower
		}
	]
	bass = [
		{
			goal_name = qp_score_points
		}
		{
			goal_name = qp_streak_notes
		}
	]
	drum = [
		{
			goal_name = qp_score_points
		}
		{
			goal_name = qp_streak_notes
		}
	]
	vocals = [
		{
			goal_name = qp_score_points
		}
		{
			goal_name = qp_spower_banked
		}
	]
	Band = [
		{
			goal_name = qp_score_points_band
		}
		{
			goal_name = qp_score_points_stdband
		}
		{
			goal_name = qp_multiplier_time_band
		}
	]
}

script quickplay_load_challenges 
	playlist_getcurrentsong
	if is_song_downloaded song_checksum = <current_song>
		if (<download> = 1)
			return
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

script quickplay_unload_challenges \{reset_targets = 1}
	if GMan_GoalIsActive \{goal = quickplay}
		if (<reset_targets> = 1)
			gman_setdata \{goal = quickplay
				params = {
					targeted_challenge = NULL
					targeted_challenge_inst_config = NULL
					targeted_challenge_friend_scores = [
					]
					targeted_challenge_friend_index = -1
				}}
		endif
	endif
	gman_shutdownallgoals \{except = quickplay}
endscript

script quickplay_main_enter 
endscript

script quickplay_song_started 
	quickplay_load_challenges
	gman_getdata \{goal = quickplay
		Name = targeted_challenge}
	if (<targeted_challenge> != NULL)
		quickplay_display_target_meters targeted_challenge = <targeted_challenge>
	else
		gman_setdata \{goal = quickplay
			params = {
				targeted_challenge_friend_scores = [
				]
			}}
	endif
endscript

script quickplay_song_complete 
	printf 'Quickplay::Song_Complete event = %a' a = <event> channel = quickplay_goal
	if (song_won = <event>)
		progression_quickplay_clear_rewards_just_unlocked
		playlist_getcurrentsong
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <Player> controller
		getsavegamefromcontroller controller = <controller>
		get_current_progression_award_points savegame = <savegame>
		<starting_award_points> = <total_award_points>
		quickplay_check_and_save_scores song = <current_song> Player = <Player> savegame = <savegame>
		get_current_progression_award_points savegame = <savegame>
		setplayerinfo <Player> recent_award_points = (<total_award_points> - <starting_award_points>)
		update_song_star_rating
		update_active_players_atoms
		getnextplayer Player = <Player> local
		repeat <num_players>
	elseif (song_quit = <event>)
		quickplay_unload_challenges
	elseif (song_retry = <event> || song_failed = <event>)
		quickplay_unload_challenges \{reset_targets = 0}
	endif
endscript

script quickplay_display_target_meters \{targeted_challenge = !q1768515945}
	gman_getinstancesofgoal goal_name = <targeted_challenge>
	if (<goal_instances_size> > 0)
		gman_getdata \{goal = quickplay
			Name = targeted_challenge_inst_config}
		i = 0
		begin
		challenge_id = (<goal_instances> [<i>])
		if GMan_GoalIsActive goal = <challenge_id>
			gman_getassignedplayer goal_name = <challenge_id>
			if (<assigned_player> = 0)
				getfirstplayer \{local}
				getplayerinfo <Player> Band
				gman_meterfunc {
					goal = quickplay
					tool = challenge_meter
					func = create_targeted_challenge_meter
					params = {band_meter band_index = <Band> targeted_challenge = <challenge_id>}
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
	if playlist_isfinished
		return \{FALSE}
	endif
	playlist_switchtonextsong
	gamemode_gettype
	if (quickplay = <Type>)
		gman_shutdownallgoals \{except = quickplay}
	endif
	return \{true}
endscript

script quickplay_check_and_save_scores \{song = !q1768515945
		Player = !i1768515945
		savegame = !i1768515945}
	gman_getgoalsbyplayer Player = <Player>
	if (0 = <goals_by_player_size>)
		return
	endif
	index = 0
	begin
	0x6f8efd52 {
		challenge_instance_id = (<goals_by_player> [<index>])
		goal_name = (<goal_strings_by_player> [<index>])
		song = <song>
		Player = <Player>
		savegame = <savegame>
	}
	index = (<index> + 1)
	repeat <goals_by_player_size>
endscript

script 0x6f8efd52 \{challenge_instance_id = !q1768515945
		goal_name = !q1768515945
		song = !q1768515945
		Player = !i1768515945
		savegame = !i1768515945}
	GetGlobalTags savegame = <savegame> <song>
	gman_getassignedplayer goal_name = <challenge_instance_id>
	gman_getqpsavechecksums song = <song> goal_name = <goal_name> assigned_player = <assigned_player>
	gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_score params = {challenge_id = <challenge_instance_id>}
	CastToInteger \{score_value}
	if (<score_value> > (<...>.<score_checksum>))
		AddParam structure_name = save_value_params Name = <score_checksum> value = <score_value>
	endif
	gman_getgrade goal = <challenge_instance_id>
	if (<pending_grade> > (<...>.<grade_checksum>))
		AddParam structure_name = save_value_params Name = <grade_checksum> value = <pending_grade>
		quickplay_challenge_give_award_points Player = <Player> savegame = <savegame> new_grade = <pending_grade> old_grade = (<...>.<grade_checksum>)
	endif
	if GotParam \{save_value_params}
		SetGlobalTags savegame = <savegame> <song> params = <save_value_params>
	endif
endscript

script quickplay_determine_grade_based_on_score \{challenge_id = !q1768515945
		goal_name = !q1768515945
		score = !i1768515945
		instrument = !q1768515945
		song = !q1768515945}
	if GMan_GoalIsActive goal = <challenge_id>
		gman_getdata goal = <challenge_id> Name = calculated_targets
		calculated_scores = <calculated_targets>
	else
		ExtendCrc <goal_name> '_info' out = goal_struct
		if NOT StructureContains structure = (($<goal_struct>).constants) Name = target_value
			SoftAssert 'quickplay_determine_grade_based_on_score: target_value not found in constants for goal %a' a = <challenge_id>
			return \{best_grade = 0}
		endif
		if NOT StructureContains structure = (($<goal_struct>).data) Name = percent_targets
			SoftAssert 'quickplay_determine_grade_based_on_score: percent_targets not found in goal data for goal %a' a = <challenge_id>
			return \{best_grade = 0}
		endif
		<round_direction> = up
		<round_to_nearest> = 0
		if StructureContains structure = (($<goal_struct>).data) Name = round_direction
			<round_direction> = (($<goal_struct>).data.round_direction)
		endif
		if StructureContains structure = (($<goal_struct>).data) Name = round_to_nearest
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
	if NOT GotParam \{calculated_scores}
		SoftAssert 'quickplay_determine_grade_based_on_score: Unable to calculate the scores for %a' a = <challenge_id>
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
	GetGlobalTags savegame = <savegame> <song>
	best_score = (<...>.<save_checksum>)
	quickplay_determine_grade_based_on_score challenge_id = <challenge_id> score = <best_score> instrument = <instrument> song = <song>
	return best_grade = <best_grade>
endscript

script get_quickplay_challenge_award_points_change \{new_grade = !i1768515945
		old_grade = !i1768515945}
	<grade_change> = (<new_grade> - <old_grade>)
	if (<grade_change> > 0)
		if (<old_grade> > 0)
			<0x51f8dcd1> = ($0x084270c2 [<old_grade> -1])
		else
			<0x51f8dcd1> = 0
		endif
		<0x35909e7a> = ($0x084270c2 [<new_grade> - 1])
		return challenge_award_points = (<0x35909e7a> - <0x51f8dcd1>)
	else
		return \{challenge_award_points = 0}
	endif
endscript

script quickplay_challenge_give_award_points \{new_grade = !i1768515945
		old_grade = !i1768515945
		Player = !i1768515945
		savegame = !i1768515945}
	get_quickplay_challenge_award_points_change new_grade = <new_grade> old_grade = <old_grade>
	get_current_progression_award_points savegame = <savegame>
	set_progression_award_points savegame = <savegame> new_total_award_points = (<total_award_points> + <challenge_award_points>)
endscript

script quickplay_songlist_update_awards \{song_checksum = !q1768515945}
	if NOT ScreenElementExists \{id = songlist_detail}
		return
	endif
	if song_is_jamsession song = <song_checksum>
		songlist_detail :se_setprops \{0x322c061a = 0.0}
		return
	endif
	gamemode_gettype
	if (<Type> != quickplay)
		songlist_detail :se_setprops \{0x322c061a = 0.0}
		return
	endif
	get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
	quickplay_get_awards_for_song song_name = <song_checksum> Player = <player_num>
	formatText TextName = 0xc96b020f qs(0x953baf82) a = <awards_earned> b = <awards_total>
	bar_fill = 0.0
	if (<awards_earned> > 0)
		bar_fill = ((<awards_earned> + 0.0) / (<awards_total> + 0.0))
		bar_fill = ((<bar_fill> * (1.0, 0.0)) + (1 * (0.0, 1.0)))
	endif
	songlist_detail :se_setprops {
		0x322c061a = 1.0
		songlist_detail_awards_num_text = <0xc96b020f>
		songlist_detail_awards_fill_scale = <bar_fill>
	}
endscript

script quickplay_get_challenge_outro_stats \{Player = !i1768515945}
	gman_getgoalsbyplayer Player = <Player>
	player_challenge_stats = []
	if (<Player> = 0)
		Player = (<Player> + 1)
	endif
	if (<goals_by_player_size> > 0)
		index = 0
		begin
		goal_id = (<goals_by_player> [<index>])
		challenge_icon = (<goal_strings_by_player> [<index>])
		gman_getgrade goal = <goal_id>
		gman_meterfunc {
			goal = quickplay
			tool = challenge_meter
			func = get_fill_percent
			params = {player_index = <Player>}
		}
		new_stat_entry = {
			goal_name = (<goal_strings_by_player> [<index>])
			instance_name = (<goals_by_player> [<index>])
			challenge_icon = <challenge_icon>
			challenge_grade = <pending_grade>
			progress_to_next_grade = <meter_fill>
		}
		AddArrayElement array = <player_challenge_stats> element = <new_stat_entry>
		player_challenge_stats = <array>
		index = (<index> + 1)
		repeat <goals_by_player_size>
	endif
	return player_challenge_stats = <player_challenge_stats>
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
	i = 0
	begin
	AddArrayElement array = <target_scores> element = (<friend_scores> [<i>])
	target_scores = <array>
	i = (<i> + 1)
	repeat (<target_index> + 1)
	gman_setdata goal = quickplay params = {targeted_challenge_friend_scores = <target_scores> targeted_challenge_friend_index = <target_index>}
endscript

script quickplay_start_targeted_challenge \{song_name = !q1768515945
		challenge_name = !q1768515945
		instrument = !q1768515945}
	gamemode_gettype
	if (<Type> != quickplay)
		return
	endif
	if NOT GMan_GoalIsActive \{goal = quickplay}
		return
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	gman_setdata goal = quickplay params = {targeted_challenge = <challenge_name> targeted_challenge_inst_config = <instrument>}
	gman_venuefunc {goal = quickplay tool = venue_handler func = set_venue params = {venue_name = ($g_band_lobby_current_level)}}
	playlist_setcurrentsong song = <song_name>
	venue = ($g_band_lobby_current_level)
	if StructureContains structure = ($LevelZones.<venue>) Name = loading_movie
		create_venue_loading_screen movie_params = ($LevelZones.<venue>)
	else
		create_loading_screen
	endif
	gman_meterfunc \{goal = quickplay
		tool = challenge_meter
		func = init_friend_target_score
		params = {
		}}
	generic_event_back
	ui_event_wait \{event = menu_replace
		state = uistate_play_song}
endscript

script quickplay_pause_tool_not_internet_mode_check 
	if NOT ininternetmode
		return \{true}
	endif
	return \{FALSE}
endscript

script quickplay_pause_tool_songs_remaining_check 
	GetArraySize ($current_playlist)
	if (<array_Size> > 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quickplay_pause_tool_no_songs_remaining_check 
	GetArraySize ($current_playlist)
	if (<array_Size> <= 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script quickplay_pause_tool_not_demobuild_check 
	if NOT demobuild
		return \{true}
	endif
	return \{FALSE}
endscript

script quickplay_get_challenge_icon \{base_name = !q1768515945}
	icon_name = <base_name>
	if (<base_name> = qp_green_notes || <base_name> = qp_red_notes || <base_name> = qp_yellow_notes || <base_name> = qp_blue_notes || <base_name> = qp_orange_notes)
		icon_name = qp_color_notes
	endif
	return icon_name = <icon_name>
endscript
