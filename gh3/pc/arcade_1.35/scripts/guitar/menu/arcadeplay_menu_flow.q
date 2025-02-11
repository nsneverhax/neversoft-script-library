arcadeplay_startup_fs = {
	create = arcadeplay_setup
	actions = [
		{
			action = continue
			flow_state = arcadeplay_multiplayer_wait_fs
		}
	]
}
arcadeplay_select_difficulty_fs = {
	create = create_select_difficulty_menu
	Destroy = destroy_select_difficulty_menu
	Name = "arcadeplay_select_difficulty_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_select_character_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
	]
}
arcadeplay_select_character_fs = {
	create = create_character_select_menu
	Destroy = destroy_character_select_menu
	Name = "arcadeplay_select_character_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_character_hub_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			func = progression_push_current
			flow_state = arcadeplay_select_difficulty_fs
		}
	]
}
arcadeplay_character_hub_fs = {
	create = create_character_hub_menu
	Destroy = destroy_character_hub_menu
	Name = "arcadeplay_character_hub_fs"
	actions = [
		{
			action = select_play_show
			flow_state = arcadeplay_select_venue_fs
		}
		{
			action = select_change_outfit
			flow_state = arcadeplay_select_outfit_fs
		}
		{
			action = select_change_guitar
			flow_state = arcadeplay_select_guitar_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_select_character_fs
		}
	]
}
arcadeplay_select_outfit_fs = {
	create = create_select_outfit_menu
	Destroy = destroy_select_outfit_menu
	Name = "arcadeplay_select_outfit_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = arcadeplay_character_hub_fs
		}
		{
			action = select_select_style
			flow_state = arcadeplay_select_style_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_character_hub_fs
		}
	]
}
arcade_select_style_fs = {
	create = create_select_style_menu
	Destroy = destroy_select_style_menu
	Name = "arcade_select_style_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = arcadeplay_character_hub_fs
		}
		{
			action = select_select_outfit
			flow_state = arcadeplay_select_outfit_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_select_outfit_fs
		}
	]
}
arcadeplay_select_guitar_fs = {
	create = create_select_guitar_menu
	Destroy = destroy_select_guitar_menu
	Name = "arcadeplay_select_guitar_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = arcadeplay_character_hub_fs
		}
		{
			action = select_guitar_finish
			flow_state = arcadeplay_select_guitar_finish_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_character_hub_fs
		}
	]
}
arcadeplay_select_guitar_finish_fs = {
	create = create_select_guitar_finish_menu
	Destroy = destroy_select_guitar_finish_menu
	Name = "arcadeplay_select_guitar_finish_fs"
	actions = [
		{
			action = select_character_hub
			flow_state = arcadeplay_character_hub_fs
		}
		{
			action = select_select_guitar
			flow_state = arcadeplay_select_guitar_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_select_guitar_fs
		}
	]
}
arcadeplay_select_venue_fs = {
	create = create_select_venue_menu
	Destroy = destroy_select_venue_menu
	Name = "arcadeplay_select_venue_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_setlist_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			func = set_character_hub_dirty
			flow_state = arcadeplay_character_hub_fs
		}
	]
}
arcadeplay_setlist_fs = {
	create = create_setlist_menu
	Destroy = destroy_setlist_menu
	Name = "arcadeplay_setlist_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_using_guitar_controller_fs
		}
		{
			action = add_player
			flow_state = mp_select_mode_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_select_venue_fs
		}
	]
}
arcadeplay_play_song_fs = {
	create = create_play_song_menu
	Destroy = destroy_play_song_menu
	Name = "arcadeplay_play_song_fs"
	actions = [
		{
			action = win_song
			func = arcadeplay_song_over
			func_params = {
				win = 1
			}
			flow_state = arcadeplay_win_song_fs
		}
		{
			action = fail_song
			func = arcadeplay_song_over
			func_params = {
				win = 0
			}
			flow_state = arcadeplay_fail_song_fs
		}
		{
			action = controller_disconnect
			flow_state = controller_disconnect_fs
		}
		{
			action = temp_options
			func = arcadeplay_head_to_options
			flow_state = options_select_option_fs
		}
	]
}

script arcadeplay_head_to_options 
	GetGlobalTags \{arcade_audits}
	<arcade_total_test_in_game> = (<arcade_total_test_in_game> + 1)
	SetGlobalTags arcade_audits params = {arcade_total_test_in_game = <arcade_total_test_in_game>}
	arcadeplay_song_select_quit
	head_to_options
endscript
controller_settings_fs = {
	create = create_controller_settings_menu
	create_params = {
		popup = 1
	}
	Destroy = destroy_controller_settings_menu
	actions = [
		{
			action = select_lefty_flip
			flow_state = arcadeplay_lefty_flip_warning
		}
		{
			action = select_calibrate_whammy_bar
			flow_state = calibrate_whammy_bar_fs
		}
		{
			action = select_calibrate_star_power_trigger
			flow_state = calibrate_star_power_trigger_fs
		}
		{
			action = go_back
			flow_state = arcadeplay_pause_fs
		}
	]
}
arcadeplay_lefty_flip_warning = {
	create = create_lefty_flip_warning_menu
	Destroy = destroy_lefty_flip_warning_menu
	actions = [
		{
			action = continue
			func = lefty_flip_func
			flow_state = arcadeplay_play_song_fs
		}
		{
			action = go_back
			use_last_flow_state
		}
	]
}

script arcadeplay_song_select_quit 
	printf \{"arcadeplay_song_select_quit: start"}
	GH3_SFX_fail_song_stop_sounds
	exit_arcadeplay \{kill_gem = 1}
endscript
arcadeplay_win_song_fs = {
	create = create_newspaper_menu
	Destroy = destroy_newspaper_menu
	Name = "arcadeplay_win_song_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_toprockers_fs
		}
		{
			action = select_detailed_stats
			flow_state = arcadeplay_detailed_stats_fs
		}
		{
			action = quit
			func = exit_arcadeplay
			func_params = {
				kill_gem = 0
			}
			flow_state = attract_sequence_start_fs
		}
	]
}
arcadeplay_fail_song_fs = {
	create = create_fail_song_menu
	Destroy = destroy_fail_song_menu
	Name = "arcadeplay_fail_song_fs"
	actions = [
		{
			action = select_quit
			func = exit_arcadeplay
			func_params = {
				kill_gem = 1
			}
			flow_state = arcadeplay_autosave_fs
		}
	]
}
arcadeplay_detailed_stats_fs = {
	create = create_detailed_stats_menu
	Destroy = destroy_detailed_stats_menu
	Name = "arcadeplay_detailed_stats_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_toprockers_fs
		}
	]
}
arcadeplay_toprockers_fs = {
	create = create_top_rockers_menu
	Destroy = destroy_top_rockers_menu
	Name = "arcadeplay_toprockers_fs"
	actions = [
		{
			action = continue
			func = arcadeplay_cleanup_timer
			flow_state = arcadeplay_autosave_fs
		}
	]
}
arcadeplay_preautosave_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			func = arcadeplay_start_song
			transition_screen = default_loading_screen
			flow_state = arcadeplay_play_song_fs
		}
		{
			action = memcard_sequence_save_failed
			func = arcadeplay_start_song
			transition_screen = default_loading_screen
			flow_state = arcadeplay_play_song_fs
		}
	]
}
arcadeplay_autosave_fs = {
	create = arcadeplay_begin_autosave
	Destroy = arcadeplay_cleanup_autosave
	Name = "arcadeplay_autosave_fs"
	actions = [
		{
			action = continue
			func = exit_arcadeplay
			func_params = {
				kill_gem = 0
			}
			flow_state = arcadeplay_continue_fs
		}
	]
}

script arcadeplay_begin_autosave 
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script arcadeplay_cleanup_autosave 
endscript
arcadeplay_continue_fs = {
	create = create_continue_menu
	Destroy = destroy_continue_menu
	Name = "arcadeplay_continue_fs"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_startup_fs
		}
		{
			action = quit
			flow_state = attract_sequence_start_fs
		}
	]
}
arcadeplay_multiplayer_wait_fs = {
	create = create_multiplayer_wait_menu
	Destroy = destroy_multiplayer_wait_menu
	Name = "arcadeplay_multiplayer_wait_fs"
	actions = [
		{
			action = start_singleplayer_game
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = start_singleplayer_game_coinup
			flow_state = arcadeplay_select_mode_fs
		}
		{
			action = start_multiplayer_game
			func = arcadeplay_multiplayer_game_start
			flow_state = mp_select_mode_fs
		}
	]
}
arcadeplay_select_mode_fs = {
	create = create_select_mode_menu
	Destroy = destroy_select_mode_menu
	Name = "arcadeplay_select_mode_fs"
	actions = [
		{
			action = select_local
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = select_axeclub
			flow_state = arcadeplay_login_fs
		}
	]
}
arcadeplay_login_fs = {
	create = create_login_menu
	Destroy = destroy_login_menu
	Name = "arcadeplay_login_fs"
	actions = [
		{
			action = select_login
			flow_state = arcadeplay_login_pin_fs
		}
		{
			action = select_new
			flow_state = arcadeplay_login_firstname_fs
		}
	]
}
arcadeplay_login_firstname_fs = {
	create = create_login_firstname_menu
	Destroy = destroy_login_firstname_menu
	Name = "arcadeplay_login_firstname_fs"
	actions = [
		{
			action = select_accept
			flow_state = arcadeplay_login_lastname_fs
		}
	]
}
arcadeplay_login_lastname_fs = {
	create = create_login_lastname_menu
	Destroy = destroy_login_lastname_menu
	Name = "arcadeplay_login_lastname_fs"
	actions = [
		{
			action = select_accept
			flow_state = arcadeplay_login_pin_fs
		}
	]
}
arcadeplay_login_pin_fs = {
	create = create_login_pin_menu
	Destroy = destroy_login_pin_menu
	Name = "arcadeplay_login_pin_fs"
	actions = [
		{
			action = select_confirm
			flow_state = arcadeplay_login_pin_fs
		}
		{
			action = select_accept
			flow_state = arcadeplay_login_birthday_fs
		}
		{
			action = select_restart
			flow_state = arcadeplay_login_pin_fs
		}
		{
			action = select_invalid
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = select_invalid_login
			flow_state = arcadeplay_login_fs
		}
	]
}
arcadeplay_login_birthday_fs = {
	create = create_login_birthday_menu
	Destroy = destroy_login_birthday_menu
	Name = "arcadeplay_login_birthday_fs"
	actions = [
		{
			action = select_create
			flow_state = arcadeplay_login_create_fs
		}
		{
			action = select_load
			flow_state = arcadeplay_login_load_fs
		}
		{
			action = select_invalid
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = select_invalid_login
			flow_state = arcadeplay_login_fs
		}
	]
}
arcadeplay_login_create_fs = {
	create = create_login_create_menu
	Destroy = destroy_login_create_menu
	Name = "arcadeplay_login_create_fs"
	actions = [
		{
			action = create_success
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = create_failure
			flow_state = arcadeplay_login_fs
		}
	]
}
arcadeplay_login_load_fs = {
	create = create_login_load_menu
	Destroy = destroy_login_load_menu
	Name = "arcadeplay_login_load_fs"
	actions = [
		{
			action = load_success
			flow_state = arcadeplay_select_difficulty_fs
		}
		{
			action = load_failure
			flow_state = arcadeplay_login_fs
		}
	]
}
arcadeplay_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	Name = "arcadeplay_using_guitar_controller_fs"
	actions = [
		{
			action = continue
			func = arcadeplay_start_song
			transition_screen = top_rockers_loading_screen
			flow_state = arcadeplay_play_song_fs
		}
	]
}
arcadeplay_cheat_top_rockers_finish = {
	create = create_cheat_top_rockers
	Name = "arcadeplay_cheat_top_rockers_finish"
	actions = [
		{
			action = continue
			flow_state = arcadeplay_toprockers_fs
		}
	]
}
top_rockers_loading_screen = {
	create = create_top_rockers_loading_screen
	Destroy = destroy_top_rockers_loading_screen
}

script exit_arcadeplay 
	printf \{"exit_arcadeplay: start"}
	GetGlobalTags \{user_options}
	SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1> lefty_flip_p2 = <lefty_flip_p2>}
	arcadeplay_cleanup_timer
	Change \{active_player = 0}
	Change \{primary_controller_assigned = 0}
	Change \{arcade_in_menu = 0}
	if (<kill_gem> = 0)
		kill_gem_scroller
	endif
	Change \{arcade_not_ok_to_accept_start_switches = 0}
	printf \{"exit_arcadeplay: arcade_in_menu = %d"
		d = $arcade_in_menu}
endscript

script arcadeplay_reset_vars_for_attract 
	GetGlobalTags \{user_options}
	SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1> lefty_flip_p2 = <lefty_flip_p2>}
	Change \{active_player = 0}
	Change \{arcade_not_ok_to_accept_start_switches = 0}
	Change \{primary_controller_assigned = 0}
	arcadeplay_cleanup_timer
	Change \{arcade_in_menu = 0}
	Change \{current_num_players = 1}
endscript

script menu_timeouts \{wait_time = 30}
	begin
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = next_mode
		}}
endscript

script arcadeplay_setup 
	if ($active_player = 1)
		rt_lefty_change_status \{p1_status = 1}
	else
		rt_lefty_change_status \{p2_status = 1}
	endif
	Change \{in_continue_screen = 0}
	Change \{arcade_in_menu = 1}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	Change \{structurename = player1_status
		controller = $player1_device}
	Change \{structurename = player2_status
		controller = $player2_device}
	SpawnScriptNow \{update_countdown_timer}
	printf \{"arcadeplay_setup: part=guitar"}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script ap_get_total_num_venues 
	printf \{"ap_get_total_num_venues"}
	array_entry = 0
	begin
	if NOT get_valid_venue_index venue_index = <array_entry>
		break
	endif
	get_LevelZoneArray_checksum index = <index>
	printf ($LevelZones.<level_checksum>.Name)
	<array_entry> = (<array_entry> + 1)
	repeat
	return num_venues = <array_entry>
endscript

script ap_get_valid_venue_index 
	get_LevelZoneArray_size
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	valid = 1
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum>
	if NOT (<unlocked> = 1)
		valid = 0
	endif
	if (<valid> = 1)
		if (<venue_index> = 0)
			return index = <index> true
		endif
		venue_index = (<venue_index> - 1)
	endif
	index = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script arcadeplay_song_over 
	Change \{arcade_in_game = 0}
	printf "arcadeplay_song_over: song %s done, win = %d" s = $current_song d = <win>
	GetGlobalTags \{arcade_audits}
	formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.$current_song.Name)
	GetGlobalTags <song_stats>
	printf "arcadeplay_song_over: e/m/h/x = %d/%e/%f/%g" d = <easy_passed> e = <medium_passed> f = <hard_passed> g = <expert_passed>
	if (<win> = 1)
		Increment \{arcade_total_wins}
		Increment \{passed}
		switch ($current_difficulty)
			case beginner
			printf \{"arcadeplay_song_over: Incrementing beginner"}
			Increment \{beginner_passed}
			Increment \{arcade_total_beginner_passed}
			case easy
			printf \{"arcadeplay_song_over: Incrementing easy"}
			Increment \{easy_passed}
			Increment \{arcade_total_easy_passed}
			case medium
			printf \{"arcadeplay_song_over: Incrementing medium"}
			Increment \{medium_passed}
			Increment \{arcade_total_medium_passed}
			case hard
			printf \{"arcadeplay_song_over: Incrementing hard"}
			Increment \{hard_passed}
			Increment \{arcade_total_hard_passed}
			case expert
			printf \{"arcadeplay_song_over: Incrementing expert"}
			Increment \{expert_passed}
			Increment \{arcade_total_expert_passed}
		endswitch
		printf "arcadeplay_song_over: b/e/m/h/x = %c%d/%e/%f/%g" c = <beginner_passed> d = <easy_passed> e = <medium_passed> f = <hard_passed> g = <expert_passed>
		SetGlobalTags <song_stats> params = {
			passed = <passed>
			beginner_passed = <beginner_passed>
			easy_passed = <easy_passed>
			medium_passed = <medium_passed>
			hard_passed = <hard_passed>
			expert_passed = <expert_passed>
		}
	else
		Increment \{arcade_total_fails}
		arcadeplay_cleanup_timer
	endif
	SetGlobalTags <song_stats> params = {
		beginner_played = <beginner_played>
		easy_played = <easy_played>
		medium_played = <medium_played>
		hard_played = <hard_played>
		expert_played = <expert_played>
	}
	SetGlobalTags arcade_audits params = {
		arcade_total_wins = <arcade_total_wins> ,
		arcade_total_fails = <arcade_total_fails>
		arcade_total_beginner_passed = <arcade_total_beginner_passed>
		arcade_total_easy_passed = <arcade_total_easy_passed>
		arcade_total_medium_passed = <arcade_total_medium_passed>
		arcade_total_hard_passed = <arcade_total_hard_passed>
		arcade_total_expert_passed = <arcade_total_expert_passed>
	}
	if ($is_attract_mode = 0)
		<arcade_total_finished> = (<arcade_total_finished> + 1)
		SetGlobalTags arcade_audits params = {arcade_total_finished = <arcade_total_finished>}
	endif
	if (<win> = 1)
		printf \{"arcadeplay_song_over: setting back to menu"}
		Change \{arcade_in_menu = 1}
	endif
	rt_write_play_info players = 1 device_num = <device_num> info_type = "end"
	if (<win> = 1)
		kill_gem_scroller
	endif
endscript
lamp_song_over = 0

script arcadeplay_start_song 
	rt_lefty_change_status \{p1_status = 0
		p2_status = 0}
	KillSpawnedScript \{Name = update_countdown_timer}
	disable_debug_state_warning_1
	disable_debug_state_warning_2
	disable_debug_state_warning_3
	if ($active_player = 2)
		device_num = $player2_device
	else
		device_num = $player1_device
	endif
	printf "arcadeplay_start_song device_num = %d" d = <device_num>
	GetGlobalTags \{arcade_audits}
	printf "arcadeplay_start_song: arcade_num_credits_in=%d" d = <arcade_num_credits_in>
	GetGlobalTags \{user_options}
	if (<lefty_flip_p1> = 1)
		<arcade_lefty_p1_plays> = (<arcade_lefty_p1_plays> + 1)
	endif
	if (<lefty_flip_p2> = 1)
		<arcade_lefty_p2_plays> = (<arcade_lefty_p2_plays> + 1)
	endif
	SetGlobalTags arcade_audits params = {arcade_lefty_p1_plays = <arcade_lefty_p1_plays> arcade_lefty_p2_plays = <arcade_lefty_p2_plays>}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	increment_difficulty_audit song = ($current_song) diff = $current_difficulty
	Change \{arcade_not_ok_to_accept_start_switches = 1}
	Change \{arcade_in_game = 1}
	Change \{arcade_in_menu = 0}
	rt_write_play_info players = 1 device_num = <device_num> local_song = ($current_song) info_type = "begin"
	start_song device_num = <device_num>
endscript

script arcadeplay_cleanup_timer 
	KillSpawnedScript \{Name = newspaper_watch_timer}
	KillSpawnedScript \{Name = ds_watch_timer}
	KillSpawnedScript \{Name = update_countdown_timer}
	hide_countdown_timer
endscript

script arcadeplay_multiplayer_game_start 
	rt_lefty_change_status \{p1_status = 1
		p2_status = 1}
endscript

script create_cheat_top_rockers 
	Change \{structurename = player1_status
		score = 999999}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
	return
endscript
