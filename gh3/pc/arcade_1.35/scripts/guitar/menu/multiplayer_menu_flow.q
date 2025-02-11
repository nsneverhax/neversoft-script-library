mp_select_mode_fs = {
	create = create_mp_select_mode_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_mp_select_mode_menu
	Name = "mp_select_mode_fs"
	actions = [
		{
			action = select_faceoff
			func = set_character_hub_dirty
			flow_state = mp_faceoff_character_select_fs
		}
		{
			action = select_coop
			flow_state = mp_faceoff_select_venue_fs
			transition_right
		}
	]
}
mp_faceoff_character_select_fs = {
	create = create_2p_character_select_menu
	Destroy = destroy_2p_character_select_menu
	Name = "mp_faceoff_character_select_fs"
	actions = [
		{
			action = continue
			flow_state = mp_faceoff_split_off_flow_for_character_hub_fs
		}
	]
}
mp_faceoff_split_off_flow_for_character_hub_fs = {
	create = create_mp_split_off_flow_for_character_hub
	actions = [
		{
			action = continue
			flow_state = mp_faceoff_character_hub_fs
		}
	]
}

script create_mp_split_off_flow_for_character_hub 
	ui_flow_manager_respond_to_action \{action = continue
		create_params = {
			Player = 1
		}}
	if ($current_num_players = 2)
		start_flow_manager \{flow_state = mp_faceoff_character_hub_fs
			Player = 2
			create_params = {
				Player = 2
			}}
	endif
endscript
mp_faceoff_character_hub_fs = {
	create = create_character_hub_menu
	Destroy = destroy_character_hub_menu
	Name = "mp_faceoff_character_hub_fs"
	actions = [
		{
			action = select_play_show
			flow_state = mp_faceoff_select_venue_fs
		}
		{
			action = select_change_outfit
			flow_state = mp_faceoff_select_outfit_fs
		}
		{
			action = select_change_guitar
			flow_state = mp_faceoff_select_guitar_fs
		}
		{
			action = select_change_bass
			flow_state = mp_faceoff_select_bass_fs
		}
		{
			action = go_back
			flow_state = mp_faceoff_character_select_fs
		}
	]
}
mp_faceoff_select_outfit_fs = {
	create = create_select_outfit_menu
	Destroy = destroy_select_outfit_menu
	Name = "mp_faceoff_select_outfit_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = select_select_style
			flow_state = mp_faceoff_select_style_fs
		}
		{
			action = go_back
			flow_state = mp_faceoff_character_hub_fs
		}
	]
}
mp_faceoff_select_style_fs = {
	create = create_select_style_menu
	Destroy = destroy_select_style_menu
	Name = "mp_faceoff_select_style_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = select_select_outfit
			flow_state = mp_faceoff_select_outfit_fs
		}
		{
			action = go_back
			flow_state = mp_faceoff_select_outfit_fs
		}
	]
}
mp_faceoff_select_guitar_fs = {
	create = create_select_guitar_menu
	Destroy = destroy_select_guitar_menu
	Name = "mp_faceoff_select_guitar_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = continue
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = mp_faceoff_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = mp_faceoff_character_hub_fs
		}
	]
}
mp_faceoff_select_guitar_finish_fs = {
	create = create_select_guitar_finish_menu
	Destroy = destroy_select_guitar_finish_menu
	Name = "mp_faceoff_select_guitar_finish_fs"
	actions = [
		{
			action = continue
			flow_state = mp_faceoff_select_guitar
		}
		{
			action = go_back
			flow_state = mp_faceoff_select_guitar
		}
	]
}
mp_faceoff_select_bass_fs = {
	create = create_select_bass_menu
	Destroy = destroy_select_guitar_menu
	Name = "mp_faceoff_select_bass_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = continue
			flow_state = mp_faceoff_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = mp_faceoff_select_guitar_finish_fs
		}
		{
			action = go_back
			flow_state = mp_faceoff_character_hub_fs
		}
	]
}
mp_faceoff_select_venue_fs = {
	create = create_select_venue_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_select_venue_menu
	Name = "mp_faceoff_select_venue_fs"
	actions = [
		{
			action = continue
			flow_state = mp_faceoff_setlist_fs
			transition_right
		}
	]
}
mp_faceoff_setlist_fs = {
	create = create_setlist_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_setlist_menu
	Name = "mp_faceoff_setlist_fs"
	actions = [
		{
			action = continue
			flow_state = mp_faceoff_select_difficulty_fs
			transition_right
		}
	]
}
mp_faceoff_select_difficulty_fs = {
	create = create_select_difficulty_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_select_difficulty_menu
	Name = "mp_faceoff_select_difficulty_fs"
	actions = [
		{
			action = continue
			flow_state = mp_using_guitar_controller_fs
		}
		{
			action = continue_coop
			flow_state = mp_faceoff_select_part_fs
		}
	]
}
mp_faceoff_select_part_fs = {
	create = create_choose_part_menu
	Destroy = destroy_choose_part_menu
	Name = "mp_faceoff_select_part_fs"
	actions = [
		{
			action = continue
			flow_state = mp_using_guitar_controller_fs
		}
	]
}
mp_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	Name = "mp_using_guitar_controller_fs"
	actions = [
		{
			action = continue
			func = multiplayer_head_to_song
			transition_screen = default_loading_screen
			flow_state = mp_faceoff_play_song_fs
		}
	]
}
mp_faceoff_play_song_fs = {
	create = create_play_song_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_play_song_menu
	Name = "mp_faceoff_play_song_fs"
	actions = [
		{
			action = win_song
			func = multiplayer_song_over
			func_params = {
				win = 1
			}
			flow_state = mp_faceoff_newspaper_fs
		}
		{
			action = fail_song
			func = multiplayer_lose_song
			flow_state = mp_faceoff_fail_song_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
	]
}
mp_faceoff_fail_song_fs = {
	create = create_fail_song_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_fail_song_menu
	Name = "mp_faceoff_fail_song_fs"
	actions = [
		{
			action = select_quit
			func = mp_faceoff_song_select_quit
			func_params = {
				kill_gem = 1
			}
			flow_state = arcadeplay_autosave_fs
		}
	]
}

script mp_faceoff_song_select_quit 
	GH3_SFX_fail_song_stop_sounds
	arcadeplay_cleanup_timer
	Change \{active_player = 0}
	Change \{primary_controller = 0}
	Change \{primary_controller_assigned = 0}
	Change \{current_num_players = 1}
	if (<kill_gem> = 1)
		kill_gem_scroller
	endif
	Change \{arcade_not_ok_to_accept_start_switches = 0}
endscript
mp_faceoff_newspaper_fs = {
	create = create_newspaper_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_newspaper_menu
	Name = "mp_faceoff_newspaper_fs"
	actions = [
		{
			action = continue
			func = mp_faceoff_song_select_quit
			func_params = {
				kill_gem = 1
			}
			flow_state = arcadeplay_autosave_fs
		}
		{
			action = select_detailed_stats
			flow_state = mp_faceoff_detailed_stats_fs
			transition_right
		}
		{
			action = quit
			func = mp_faceoff_song_select_quit
			func_params = {
				kill_gem = 1
			}
			flow_state = arcadeplay_autosave_fs
		}
	]
}
mp_faceoff_detailed_stats_fs = {
	create = create_detailed_stats_menu
	create_params = {
		Player = 2
	}
	Destroy = destroy_detailed_stats_menu
	Name = "mp_faceoff_detailed_stats_fs"
	actions = [
		{
			action = continue
			func = mp_faceoff_song_select_quit
			func_params = {
				kill_gem = 1
			}
			flow_state = arcadeplay_autosave_fs
		}
	]
}

script mp_faceoff_change_mode_if_coop_dlc 
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_faceoff}
	endif
endscript

script multiplayer_presave_stuff 
	printf \{"multiplayer_presave_stuff: start"}
	rt_lefty_change_status \{p1_status = 0
		p2_status = 0}
	KillSpawnedScript \{Name = update_countdown_timer}
	hide_countdown_timer
	Change \{arcade_not_ok_to_accept_start_switches = 1}
	Change \{arcade_in_game = 1}
	Change \{arcade_in_menu = 0}
endscript

script multiplayer_head_to_song 
	multiplayer_presave_stuff
	increment_difficulty_audit \{song = $current_song
		diff = $current_difficulty}
	increment_difficulty_audit \{song = $current_song
		diff = $current_difficulty2}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 1)
		<arcade_lefty_p1_plays> = (<arcade_lefty_p1_plays> + 1)
	endif
	if (<lefty_flip_p2> = 1)
		<arcade_lefty_p2_plays> = (<arcade_lefty_p2_plays> + 1)
	endif
	SetGlobalTags arcade_audits params = {arcade_lefty_p1_plays = <arcade_lefty_p1_plays> arcade_lefty_p2_plays = <arcade_lefty_p2_plays>}
	rt_write_play_info players = 2 local_song = ($current_song) info_type = "begin"
	start_song
endscript

script multiplayer_lose_song 
	multiplayer_song_over \{win = 0}
	mp_faceoff_song_select_quit \{kill_gem = 0}
endscript

script multiplayer_song_over 
	printf "multiplayer_song_over: song %s done, win = %d" s = $current_song d = <win>
	GetGlobalTags \{arcade_audits}
	formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.$current_song.Name)
	GetGlobalTags <song_stats>
	printf "arcadeplay_song_over: b/e/m/h/x = %j/%d/%e/%f/%g" j = <beginner_passed> d = <easy_passed> e = <medium_passed> f = <hard_passed> g = <expert_passed>
	Change \{arcade_in_game = 0}
	Change \{arcade_in_menu = 0}
	if (<win> = 1)
		Increment \{passed}
		switch ($current_difficulty)
			case beginner
			printf \{"multiplayer_song_over: Incrementing beginner"}
			Increment \{beginner_passed}
			Increment \{arcade_total_beginner_passed}
			case easy
			printf \{"multiplayer_song_over: Incrementing easy"}
			Increment \{easy_passed}
			Increment \{arcade_total_easy_passed}
			case medium
			printf \{"multiplayer_song_over: Incrementing medium"}
			Increment \{medium_passed}
			Increment \{arcade_total_medium_passed}
			case hard
			printf \{"multiplayer_song_over: Incrementing hard"}
			Increment \{hard_passed}
			Increment \{arcade_total_hard_passed}
			case expert
			printf \{"multiplayer_song_over: Incrementing expert"}
			Increment \{expert_passed}
			Increment \{arcade_total_expert_passed}
		endswitch
		Increment \{passed}
		switch ($current_difficulty2)
			case beginner
			printf \{"multiplayer_song_over: Incrementing beginner"}
			Increment \{beginner_passed}
			Increment \{arcade_total_beginner_passed}
			case easy
			printf \{"multiplayer_song_over: Incrementing easy"}
			Increment \{easy_passed}
			Increment \{arcade_total_easy_passed}
			case medium
			printf \{"multiplayer_song_over: Incrementing medium"}
			Increment \{medium_passed}
			Increment \{arcade_total_medium_passed}
			case hard
			printf \{"multiplayer_song_over: Incrementing hard"}
			Increment \{hard_passed}
			Increment \{arcade_total_hard_passed}
			case expert
			printf \{"multiplayer_song_over: Incrementing expert"}
			Increment \{expert_passed}
			Increment \{arcade_total_expert_passed}
		endswitch
		SetGlobalTags <song_stats> params = {
			passed = <passed>
			beginner_passed = <beginner_passed>
			easy_passed = <easy_passed>
			medium_passed = <medium_passed>
			hard_passed = <hard_passed>
			expert_passed = <expert_passed>
		}
		SetGlobalTags arcade_audits params = {
			arcade_total_beginner_passed = <arcade_total_beginner_passed>
			arcade_total_easy_passed = <arcade_total_easy_passed>
			arcade_total_medium_passed = <arcade_total_medium_passed>
			arcade_total_hard_passed = <arcade_total_hard_passed>
			arcade_total_expert_passed = <arcade_total_expert_passed>
		}
	endif
	arcadeplay_cleanup_timer
	if ($is_attract_mode = 0)
		<arcade_total_finished> = (<arcade_total_finished> + 2)
		SetGlobalTags arcade_audits params = {arcade_total_finished = <arcade_total_finished>}
	endif
	if (<win> = 1)
		Change \{arcade_in_menu = 0}
	endif
	rt_write_play_info players = 2 device_num = <device_num> info_type = "end"
	if (<win> = 1)
		kill_gem_scroller
	endif
endscript
