gh3_arcade_songs_alphabetical = [
	almosteasy
	anarchyintheuk
	avalancha
	barracuda
	bellyofashark
	blackmagicwoman
	blacksunshine
	bullsonparade
	cherubrock
	citiesonflame
	cliffsofdover
	closer
	cultofpersonality
	dontholdback
	fortheloveofgod
	helicopter
	hitmewithyourbestshot
	holeintheearth
	holidayincambodia
	jukeboxhero
	knightsofcydonia
	lagrange
	laydown
	mississippiqueen
	monsters
	motorhead
	nomoresorrow
	paintitblack
	paranoid
	peaceofmind
	prettyhandsomeawkward
	pridenjoy
	reptilia
	rocknrollallnite
	rockulikeahurricane
	sabotage
	sameoldsonganddance
	schoolsout
	shebangsadrum
	sleepinggiant
	slowride
	stricken
	sunshineofyourlove
	surfingwiththealien
	takethislife
	TalkDirtyToMe
	thearsonist
	themetal
	thisisacall
	yellow
]
gh3_arcade_tier_songs = [
	slowride
	TalkDirtyToMe
	hitmewithyourbestshot
	rocknrollallnite
	sabotage
	yellow
	jukeboxhero
	sunshineofyourlove
	mississippiqueen
	schoolsout
	closer
	bullsonparade
	holeintheearth
	prettyhandsomeawkward
	barracuda
	helicopter
	paranoid
	avalancha
	laydown
	nomoresorrow
	paintitblack
	shebangsadrum
	anarchyintheuk
	reptilia
	cherubrock
	thisisacall
	rockulikeahurricane
	lagrange
	blackmagicwoman
	sameoldsonganddance
	pridenjoy
	thearsonist
	citiesonflame
	monsters
	peaceofmind
	bellyofashark
	holidayincambodia
	almosteasy
	blacksunshine
	dontholdback
	stricken
	knightsofcydonia
	motorhead
	sleepinggiant
	themetal
	cultofpersonality
	cliffsofdover
	takethislife
	fortheloveofgod
	surfingwiththealien
]
active_player = 0
active_continue_player = 0
multiplayer_continue_flag = 0
attract_start_thread_id = 0
top_rocker_current_song = 0
is_game_running = 0
left_player_continue = 0
right_player_continue = 0
attract_sequence_start_fs = {
	create = start_attract_sequence
	Destroy = end_attract_sequence
	Name = "attract_sequence_start_fs"
	actions = [
		{
			action = start_attract_mode
			func = attract_start_demo_mode
			flow_state = attract_demo_mode_fs
		}
		{
			action = next_mode
			func = attract_get_random_toprockers
			flow_state = attract_konami_logo_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_konami_logo_fs = {
	create = create_konami_logo_screen
	Destroy = destroy_konami_logo_screen
	Name = "attract_konami_logo_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_raw_logo_mode
			flow_state = attract_act_logo_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_act_logo_fs = {
	create = create_act_logo_screen
	Destroy = destroy_act_logo_screen
	Name = "attract_act_logo_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_raw_logo_mode
			flow_state = attract_raw_logo_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_raw_logo_fs = {
	create = create_raw_logo_screen
	Destroy = destroy_raw_logo_screen
	Name = "attract_raw_logo_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_periodic_save_fs = {
	create = memcard_sequence_begin_autosave
	Destroy = memcard_sequence_cleanup_generic
	Name = "attract_periodic_save_fs"
	actions = [
		{
			action = memcard_sequence_save_success
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
		{
			action = memcard_sequence_save_failed
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
	]
}
attract_demo_mode_fs = {
	create = create_attract_mode
	Destroy = destroy_attract_mode
	Name = "attract_demo_mode_fs"
	actions = [
		{
			action = next_mode
			func = attract_get_random_toprockers
			flow_state = attract_toprockers_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
		{
			action = goto_toprockers
			func = attract_get_random_toprockers
			flow_state = attract_toprockers_fs
		}
		{
			action = goto_credits
			func = attract_start_credits
			flow_state = attract_credits_fs
		}
	]
}
attract_credits_fs = {
	create = create_attract_credits
	Destroy = destroy_attract_credits
	Name = "attract_credits_fs"
	actions = [
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
		{
			action = next_mode
			flow_state = attract_sequence_start_fs
		}
	]
}
attract_toprockers_fs = {
	create = create_top_rockers_attract_menu
	Destroy = destroy_top_rockers_attract_menu
	Name = "attract_toprockers_fs"
	actions = [
		{
			action = next_mode
			func = attract_setup_highway_tutorial
			flow_state = attract_highway_tutorial_fs
		}
		{
			action = next_mode_coinup
			func = attract_setup_keypad
			flow_state = attract_keypad_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
		{
			action = next_table
			func = attract_get_random_toprockers_next_table
			flow_state = attract_toprockers_fs
		}
		{
			action = prev_table
			func = attract_get_random_toprockers_prev_table
			flow_state = attract_toprockers_fs
		}
	]
}
attract_keypad_fs = {
	create = create_attract_keypad_menu
	Destroy = destroy_attract_keypad_menu
	Name = "attract_keypad_fs"
	actions = [
		{
			action = next_mode
			func = attract_get_random_toprockers
			flow_state = attract_toprockers_world_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_toprockers_world_fs = {
	create = create_top_rockers_attract_menu
	create_params = {
		coinup = 1
	}
	Destroy = destroy_top_rockers_attract_menu
	Name = "attract_toprockers_world_fs"
	actions = [
		{
			action = next_mode
			func = attract_setup_highway_tutorial
			flow_state = attract_highway_tutorial_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
		{
			action = next_table
			func = attract_get_random_toprockers_next_table
			flow_state = attract_toprockers_world_fs
		}
		{
			action = prev_table
			func = attract_get_random_toprockers_prev_table
			flow_state = attract_toprockers_world_fs
		}
	]
}
attract_using_guitar_controller_fs = {
	create = create_using_guitar_controller_menu
	Destroy = destroy_using_guitar_controller_menu
	Name = "attract_using_guitar_controller_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
		{
			action = epilepsy_mode
			func = attract_start_epilepsy_mode
			flow_state = attract_epilepsy_fs
		}
		{
			action = logo_mode
			func = attract_start_konami_logo_mode
			flow_state = attract_konami_logo_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_highway_tutorial_fs = {
	create = create_highway_tutorial_menu
	Destroy = destroy_highway_tutorial_menu
	Name = "attract_highway_tutorial_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
		{
			action = epilepsy_mode
			func = attract_start_epilepsy_mode
			flow_state = attract_epilepsy_fs
		}
		{
			action = logo_mode
			func = attract_start_konami_logo_mode
			flow_state = attract_konami_logo_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_epilepsy_fs = {
	create = create_epilepsy_screen
	Destroy = destroy_epilepsy_screen
	Name = "attract_epilepsy_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_title_mode
			flow_state = attract_title_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}
attract_title_fs = {
	create = create_main_menu_backdrop
	Destroy = destroy_main_menu
	Name = "attract_title_fs"
	actions = [
		{
			action = next_mode
			func = attract_start_demo_mode
			flow_state = attract_demo_mode_fs
		}
		{
			action = exit_attract_mode
			func = leave_attract_mode
			flow_state = arcadeplay_startup_fs
		}
		{
			action = temp_options
			func = head_to_options
			flow_state = options_select_option_fs
		}
	]
}

script start_attract_sequence 
	printf \{"start_attract_sequence: start"}
	GetGlobalTags \{user_options}
	<lefty_flip_p1> = 0
	<lefty_flip_p2> = 0
	SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1> lefty_flip_p2 = <lefty_flip_p2>}
	enable_coin_display
	disable_debug_state_warning_3
	Change \{menu_flow_play_sound = 0}
	Change \{is_attract_mode = 1}
	Change \{is_game_running = 1}
	rt_lefty_change_status \{p1_status = 0
		p2_status = 0}
	Change \{coop_dlc_active = 0}
	Change \{login_active = 0}
	Change \{arcade_not_ok_to_accept_start_switches = 0}
	SpawnScriptLater \{ui_flow_manager_respond_to_action
		params = {
			action = start_attract_mode
		}}
	GetGlobalTags \{arcade_audits}
	if ($rt_debug_last_num_unfinished != (<arcade_total_plays> - <arcade_total_finished>))
		if ($rt_file_output_incomplete_games)
			formatText TextName = rt_unfinished_text 'Unfinished game found: %d played, %e finished ' d = <arcade_total_plays> e = <arcade_total_finished>
			write_rt_debug_info output_text = <rt_unfinished_text>
		endif
		Change rt_debug_last_num_unfinished = (<arcade_total_plays> - <arcade_total_finished>)
	endif
endscript

script end_attract_sequence 
endscript

script leave_attract_mode 
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	printf \{"leave_attract_mode: start"}
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	Change \{is_attract_mode = 0}
	Change \{menu_flow_play_sound = 1}
	disable_coin_display
	restore_attract_sounds
	Change \{leave_attract_skip_fade = 0}
endscript

script head_to_options 
	Change \{arcade_not_ok_to_accept_start_switches = 1}
	Change \{leave_attract_skip_fade = 0}
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	leave_attract_mode
endscript

script mute_attract_sounds 
	printf \{"mute_attract_sounds: killing them all"}
	GetGlobalTags \{user_options}
	SoundBussUnlock \{Master}
	setsoundbussparams \{Master = {
			vol = -100.0
		}
		time = 0}
	SoundBussLock \{Master}
endscript

script restore_attract_sounds 
	GetGlobalTags \{arcade_hardware_adjustments}
	printf "Setting game volume to %d + %e" d = <master_game_volume> e = $volume_adjustment
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = (<master_game_volume> + $volume_adjustment)}} time = 0
	SoundBussLock \{Master}
endscript

script attract_fade_mode \{fadetime = 0.5
		holdtime = 2.0}
	KillSpawnedScript \{id = attract_to_black}
	SpawnScriptLater call_attract_fade_mode id = attract_to_black params = {<...>}
endscript

script call_attract_fade_mode 
	igc_fadeout_fast
	menu_backdrop :SetProps \{unhide}
	Wait <fadetime> Seconds
	igc_fadein params = {time = <fadetime>}
	Wait <holdtime> Seconds
	igc_fadeout params = {time = <fadetime>}
	Wait <fadetime> Seconds
	menu_backdrop :SetProps \{Hide}
	Wait <fadetime> Seconds
	igc_fadein_fast
endscript

script attract_start_demo_mode 
	if ($attract_input_last_checkin != $attract_input_last_checkin2)
		Change \{attract_input_last_checkin2 = $attract_input_last_checkin}
	else
		if ($attract_input_first_check = 1)
			printf \{"attract_start_demo_mode: Restarting attract_check_for_input"}
			write_rt_debug_info \{output_text = 'Restarting attract_check_for_input'}
			KillSpawnedScript \{Name = attract_check_for_input}
			SpawnScriptNow \{attract_check_for_input}
		else
			Change \{attract_input_first_check = 1}
		endif
	endif
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 60
			fade_music = 1
		}}
endscript

script attract_start_title_mode 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script attract_start_epilepsy_mode 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script attract_start_act_logo_mode 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 4
		}}
	attract_fade_mode
endscript

script attract_start_konami_logo_mode 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 4
		}}
	attract_fade_mode
endscript

script attract_start_raw_logo_mode 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 4
		}}
	attract_fade_mode
endscript

script attract_start_credits 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 335
		}}
endscript

script attract_get_random_toprockers 
	rnd_diff_num = 0
	random_song_index = 0
	GetArraySize ($gh3_arcade_tier_songs)
	num_playable_songs = <array_Size>
	begin
	GetRandomValue a = 0 b = (<num_playable_songs> -1) Name = random_song_index integer
	top_rocker_song_name = ($gh3_arcade_tier_songs [<random_song_index>])
	Progression_IsSongRestricted tier_global = GH3_General_Songs song = <top_rocker_song_name>
	if (<restricted> = 0)
		break
	endif
	repeat
	Change current_song = <top_rocker_song_name>
	Change top_rocker_current_song = <random_song_index>
	GetRandomValue \{Name = rnd_diff_num
		integer
		a = 0
		b = 3}
	switch (<rnd_diff_num>)
		case 0
		diffStr = easy
		case 1
		diffStr = medium
		case 2
		diffStr = hard
		case 3
		diffStr = expert
		default
		diffStr = easy
	endswitch
	Change current_difficulty = <diffStr>
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script attract_get_random_toprockers_next_table 
	rnd_diff_num = 0
	random_song_index = 0
	GetArraySize ($gh3_arcade_tier_songs)
	num_playable_songs = <array_Size>
	begin
	Change top_rocker_current_song = ($top_rocker_current_song + 1)
	if ($top_rocker_current_song > (<num_playable_songs> -1))
		Change \{top_rocker_current_song = 0}
	endif
	top_rocker_song_name = ($gh3_arcade_tier_songs [$top_rocker_current_song])
	Change current_song = <top_rocker_song_name>
	Progression_IsSongRestricted tier_global = GH3_General_Songs song = <top_rocker_song_name>
	if (<restricted> = 0)
		break
	endif
	repeat
	GetRandomValue \{Name = rnd_diff_num
		integer
		a = 0
		b = 3}
	switch (<rnd_diff_num>)
		case 0
		diffStr = easy
		case 1
		diffStr = medium
		case 2
		diffStr = hard
		case 3
		diffStr = expert
		default
		diffStr = easy
	endswitch
	Change current_difficulty = <diffStr>
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script attract_get_random_toprockers_prev_table 
	rnd_diff_num = 0
	random_song_index = 0
	GetArraySize ($gh3_arcade_tier_songs)
	num_playable_songs = <array_Size>
	begin
	Change top_rocker_current_song = ($top_rocker_current_song - 1)
	if ($top_rocker_current_song < 0)
		Change top_rocker_current_song = (<num_playable_songs> -1)
	endif
	top_rocker_song_name = ($gh3_arcade_tier_songs [$top_rocker_current_song])
	Change current_song = <top_rocker_song_name>
	Progression_IsSongRestricted tier_global = GH3_General_Songs song = <top_rocker_song_name>
	if (<restricted> = 0)
		break
	endif
	repeat
	GetRandomValue \{Name = rnd_diff_num
		integer
		a = 0
		b = 3}
	switch (<rnd_diff_num>)
		case 0
		diffStr = easy
		case 1
		diffStr = medium
		case 2
		diffStr = hard
		case 3
		diffStr = expert
		default
		diffStr = easy
	endswitch
	Change current_difficulty = <diffStr>
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script create_konami_logo_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = konami_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = konami_logo}
	menu_backdrop :SetProps \{Hide}
	GetGlobalTags \{user_options}
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_attract_audio_on> = 1)
		printf "Setting attract volume to %d" d = <master_attract_volume>
		SoundBussUnlock \{Master}
		setsoundbussparams {Master = {vol = (<master_attract_volume>)}} time = 0
		SoundBussLock \{Master}
	else
		mute_attract_sounds
	endif
	SoundEvent \{event = Konami}
endscript

script destroy_konami_logo_screen 
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_attract_audio_on> = 1)
		SoundBussUnlock \{Master}
		setsoundbussparams \{Master = {
				vol = -100.0
			}
			time = 0}
		SoundBussLock \{Master}
	endif
	destroy_menu_backdrop
	DestroyScreenElement \{id = konami_container}
	KillSpawnedScript \{id = attract_to_black}
	igc_fadein_fast
endscript

script create_act_logo_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = act_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = act_logo}
	menu_backdrop :SetProps \{Hide}
endscript

script destroy_act_logo_screen 
	destroy_menu_backdrop
	DestroyScreenElement \{id = act_container}
	KillSpawnedScript \{id = attract_to_black}
	igc_fadein_fast
endscript

script create_raw_logo_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = raw_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = raw_logo}
	menu_backdrop :SetProps \{Hide}
endscript

script destroy_raw_logo_screen 
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	destroy_menu_backdrop
	DestroyScreenElement \{id = raw_container}
	KillSpawnedScript \{id = attract_to_black}
	igc_fadein_fast
endscript

script create_epilepsy_screen 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = epilepsy_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = SpriteElement
		id = epilepsy_light_overlay
		parent = epilepsy_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = epilepsy_container
		tex = Online_Frame_Large
		Pos = (640.0, 360.0)
		Scale = (1.25, 1.25)
		just = [
			center
			center
		]
		z = 1
		rot_angle = -2}
	displayText \{parent = epilepsy_container
		text = "EPILEPSY WARNING"
		Pos = (640.0, 70.0)
		just = [
			center
			top
		]
		z = 101
		rgba = [
			255
			255
			255
			255
		]
		Scale = 1.0
		font = text_a4
		rot_angle = -2}
	epilepsy_array = ["A very small portion of the population has a condition that may cause"
		"them to experience epileptic seizures or have momentary loss of"
		"consciousness when viewing certain kinds of flashing lights or patterns"
		"that are present in our daily environment. These persons may"
		"experience seizures while watching some kinds of television pictures"
		"or playing certain video games. People who have not had any previous"
		"seizures may nonetheless have an undetected epileptic condition."
		""
		"If you or anyone in your family has experienced symptoms linked to an"
		"epileptic condition (e.g. seizures or loss of awareness), consult your"
		"physician before using any video games."
		""
		"We recommend that parents observe their children while they play"
		"video games. If you or your child experience the following symptoms:"
		"dizziness, altered vision, eye or muscle twitching, involuntary"
		"movements, loss of awareness, disorientation, or convulsions,"
		"DISCONTINUE USE IMMEDIATELY and consult your physician."
	]
	epilepsy_pos = (255.0, 190.0)
	pos_offset = (0.0, 25.0)
	i = 0
	begin
	displayText parent = epilepsy_container text = (<epilepsy_array> [<i>]) Pos = <epilepsy_pos> just = [left top] z = 101 rgba = [255 255 255 255] Scale = 0.6 font = text_a4 rot_angle = -2
	<epilepsy_pos> = (<epilepsy_pos> + <pos_offset>)
	<i> = (<i> + 1)
	repeat 17
endscript

script destroy_epilepsy_screen 
	DestroyScreenElement \{id = epilepsy_container}
	destroy_menu_backdrop
endscript

script attract_setup_guitar_instruct 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 12
		}}
endscript

script attract_setup_highway_tutorial 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 26
		}}
endscript

script attract_setup_keypad 
	KillSpawnedScript \{Name = attract_timer_to_next_mode}
	SpawnScriptNow \{attract_timer_to_next_mode
		params = {
			wait_time = 10
		}}
endscript

script attract_get_ready_for_multiplayer 
	printf \{"attract_get_ready_for_multiplayer: start"}
	Change \{arcade_not_ok_to_accept_start_switches = 1}
	Change \{game_mode = p2_faceoff}
	Change \{current_num_players = 2}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	Change \{menu_select_controller_p1_controller_id = $player1_device}
	Change \{menu_select_controller_p2_controller_id = $player2_device}
	Change \{player_controls_valid = 1}
	GetGlobalTags \{arcade_audits}
	<arcade_total_multiplayer_plays> = (<arcade_total_multiplayer_plays> + 2)
	SetGlobalTags arcade_audits params = {arcade_total_multiplayer_plays = <arcade_total_multiplayer_plays>}
endscript
attract_guitar_start_p1 = 0
attract_guitar_start_p2 = 0
attract_guitar_orange_p1 = 0
attract_guitar_orange_p2 = 0
attract_guitar_blue_p1 = 0
attract_guitar_blue_p2 = 0
in_credits = 0
in_hst = 0
attract_input_temp_counter = 0
attract_input_last_checkin = 0
attract_input_last_checkin2 = 0
attract_input_first_check = 0

script attract_check_for_input 
	top_rocker_delay = 0
	Change \{attract_guitar_start_p1 = 0}
	Change \{attract_guitar_start_p2 = 0}
	Change \{attract_guitar_orange_p1 = 0}
	Change \{attract_guitar_orange_p2 = 0}
	Change \{attract_guitar_blue_p1 = 0}
	Change \{attract_guitar_blue_p2 = 0}
	if ($debug_start_check_enable = 1)
		printf \{"attract_check_for_input: start as id %d"
			d = $attract_start_thread_id}
		Change attract_start_thread_id = ($attract_start_thread_id + 1)
		Change \{debug_start_check_count = $debug_start_check_interval}
	endif
	next_mode = 0
	begin
	Change attract_input_last_checkin = ($attract_input_last_checkin + 1)
	Change \{attract_guitar_start_p1 = 0}
	Change \{attract_guitar_start_p2 = 0}
	Change \{attract_guitar_orange_p1 = 0}
	Change \{attract_guitar_orange_p2 = 0}
	Change \{attract_guitar_blue_p1 = 0}
	Change \{attract_guitar_blue_p2 = 0}
	if ($is_test_mode = 0)
		current_flow_state_name = ($ui_flow_manager_state [0])
		current_flow_state = (<current_flow_state_name>)
		which_guitar = $player1_device
		begin
		if (<which_guitar> = $player1_device)
			if ($rt_guitar_left_enabled = 1)
				GetHeldPattern controller = <which_guitar> nobrokenstring
			else
				hold_pattern = 0
			endif
		else
			if ($rt_guitar_right_enabled = 1)
				GetHeldPattern controller = <which_guitar> nobrokenstring
			else
				hold_pattern = 0
			endif
		endif
		check_button = 65536
		array_count = 0
		begin
		if (<hold_pattern> && <check_button>)
			if (<array_count> = 0)
				if (<which_guitar> = $player1_device)
					Change \{attract_guitar_start_p1 = 1}
				elseif (<which_guitar> = $player2_device)
					Change \{attract_guitar_start_p2 = 1}
				endif
			elseif (<array_count> = 4)
				if (<which_guitar> = $player1_device)
					Change \{attract_guitar_orange_p1 = 1}
				elseif (<which_guitar> = $player2_device)
					Change \{attract_guitar_orange_p2 = 1}
				endif
				if ($is_attract_mode = 1 && attract_guitar_orange_p1 = 1 && attract_guitar_orange_p2 = 1)
					if ($dongle_info_message_visible = 0)
						KillSpawnedScript \{Name = dongle_info_message}
						SpawnScriptNow \{dongle_info_message}
						KillSpawnedScript \{Name = debug_info_message}
						SpawnScriptNow \{debug_info_message}
					endif
				endif
			elseif (<array_count> = 3)
				if (<which_guitar> = $player1_device)
					Change \{attract_guitar_blue_p1 = 1}
				elseif (<which_guitar> = $player2_device)
					Change \{attract_guitar_blue_p2 = 1}
				endif
				if ($is_attract_mode = 1 && attract_guitar_blue_p1 = 1 && attract_guitar_blue_p2 = 1)
					if ($volume_adjust_message_visible = 0)
						KillSpawnedScript \{Name = volume_adjust_message}
						SpawnScriptNow \{volume_adjust_message}
					endif
				endif
			endif
		endif
		<check_button> = (<check_button> / 16)
		array_count = (<array_count> + 1)
		repeat 5
		<which_guitar> = $player2_device
		repeat $num_guitars
	endif
	if (<top_rocker_delay> > 0)
		top_rocker_delay = (<top_rocker_delay> - 1)
	endif
	if ($debug_start_check_enable = 1)
		Change debug_start_check_count = ($debug_start_check_count - 1)
		if (debug_start_check_count = 0)
			Change debug_start_status = ($debug_start_status + 1)
			if (debug_start_status = $debug_start_check_max_count)
				Change \{debug_start_status = 0}
			endif
			formatText \{TextName = start_status
				"%e"
				e = $debug_start_status}
			debug_thread_status :SetProps text = <start_status>
			Change \{debug_start_check_count = $debug_start_check_interval}
		endif
	endif
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	CheckStartWaitingCount
	if ($arcade_not_ok_to_accept_start_switches = 0)
		disable_debug_state_warning_1
		if (<anything_waiting> = 1 || $attract_guitar_start_p1 = 1 || $attract_guitar_start_p2 = 1)
			if ($active_player = 0)
				if ($in_continue_screen = 1)
					if (<arcade_num_credits_in> >= <arcade_credits_for_continue>)
						if (($active_continue_player = 0 || $active_continue_player = 1) && (<start1_waiting> || $attract_guitar_start_p1 = 1))
							if ($rt_guitar_left_enabled = 1)
								if ($active_continue_player = 0)
									Change \{multiplayer_continue_flag = 1}
								endif
								Change \{active_player = 1}
								Change \{active_continue_player = 1}
								Change \{left_player_continue = 1}
								Change \{primary_controller = $player1_device}
								Change \{primary_controller_assigned = 1}
								Increment \{arcade_left_continues}
								SetGlobalTags arcade_audits params = {arcade_left_continues = <arcade_left_continues>}
								printf \{"attract_check_for_input: START1 - ready to rokk (pc = %d, p1d = %e)"
									d = $primary_controller
									e = $player1_device}
								Change \{current_num_players = 1}
								remove_credit \{continue = 1}
								wait_for_safe_shutdown
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = continue
									}}
							endif
						elseif (($active_continue_player = 0 || $active_continue_player = 2) && (<start2_waiting> || $attract_guitar_start_p2 = 1))
							if ($rt_guitar_right_enabled = 1)
								if ($active_continue_player = 0)
									Change \{multiplayer_continue_flag = 1}
								endif
								Change \{active_player = 2}
								Change \{active_continue_player = 2}
								Change \{right_player_continue = 1}
								Change \{primary_controller = $player2_device}
								Change \{primary_controller_assigned = 1}
								Increment \{arcade_right_continues}
								SetGlobalTags arcade_audits params = {arcade_right_continues = <arcade_right_continues>}
								printf \{"attract_check_for_input: START2 - ready to rokk (pc = %d, p2d = %e)"
									d = $primary_controller
									e = $player2_device}
								Change \{current_num_players = 1}
								remove_credit \{continue = 1}
								wait_for_safe_shutdown
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = continue
									}}
							endif
						endif
						ClearStartWaitingCount
					else
						if (<start1_waiting> || $attract_guitar_start_p1 = 1)
							printf \{"attract_check_for_input: START1 - not enough credits to continue"}
						endif
						if (<start2_waiting> || $attract_guitar_start_p2 = 1)
							printf \{"attract_check_for_input: START2 - not enough credits to continue"}
						endif
						ClearStartWaitingCount
					endif
				else
					if (<arcade_num_credits_in> >= <arcade_credits_for_standard>)
						if (<start1_waiting> || $attract_guitar_start_p1 = 1)
							ClearStartWaitingCount
							if ($rt_guitar_left_enabled = 1)
								Change \{active_player = 1}
								Change \{active_continue_player = 1}
								Change \{primary_controller = $player1_device}
								Change \{primary_controller_assigned = 1}
								<lefty_flip_p1> = 0
								Increment \{arcade_left_starts}
								SetGlobalTags arcade_audits params = {arcade_left_starts = <arcade_left_starts>}
								printf \{"attract_check_for_input: START1 - ready to rokk (pc = %d, p1d = %e)"
									d = $primary_controller
									e = $player1_device}
								Change \{current_num_players = 1}
								remove_credit
								wait_for_safe_shutdown
								Change \{leave_attract_skip_fade = 1}
								KillSpawnedScript \{Name = attract_timer_to_next_mode}
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = exit_attract_mode
									}}
							endif
						elseif (<start2_waiting> || $attract_guitar_start_p2 = 1)
							ClearStartWaitingCount
							if ($rt_guitar_right_enabled = 1)
								Change \{active_player = 2}
								Change \{active_continue_player = 2}
								Change \{primary_controller = $player2_device}
								Change \{primary_controller_assigned = 1}
								<lefty_flip_p2> = 0
								Increment \{arcade_right_starts}
								SetGlobalTags arcade_audits params = {arcade_right_starts = <arcade_right_starts>}
								printf \{"attract_check_for_input: START2 - ready to rokk (pc = %d, p2d = %e)"
									d = $primary_controller
									e = $player2_device}
								Change \{current_num_players = 1}
								remove_credit
								wait_for_safe_shutdown
								Change \{leave_attract_skip_fade = 1}
								KillSpawnedScript \{Name = attract_timer_to_next_mode}
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = exit_attract_mode
									}}
							endif
						endif
						if (<arcade_num_credits_in> < <arcade_credits_for_standard>)
						endif
					else
						if (<start1_waiting> || $attract_guitar_start_p1 = 1)
							printf \{"attract_check_for_input: START1 - not enough credits to start"}
						endif
						if (<start2_waiting> || $attract_guitar_start_p2 = 1)
							printf \{"attract_check_for_input: START2 - not enough credits to start"}
						endif
						if ($arcade_not_ok_to_accept_start_switches = 0 && $is_changing_levels = 0 && <start1_waiting> && <start2_waiting> && (<current_flow_state>.Name) = "attract_demo_mode_fs" && $in_credits = 0)
							printf "CREDIT CHECK GOTO CREDITS %a %b %c %d" a = <start1_waiting> b = <start2_waiting> c = $in_credits d = (<current_flow_state>.Name)
							Change \{in_credits = 1}
							ClearStartWaitingCount
							KillSpawnedScript \{Name = attract_timer_to_next_mode}
							SpawnScriptNow \{ui_flow_manager_respond_to_action
								params = {
									action = goto_credits
								}}
						elseif (((<current_flow_state>.Name) = "attract_credits_fs") && $in_credits = 1 && (<start1_waiting> || $attract_guitar_start_p1 = 1 || <start2_waiting> || $attract_guitar_start_p2 = 1))
							printf "CREDIT CHECK LEAVE CREDITS %a %b %c %d" a = <start1_waiting> b = <start2_waiting> c = $in_credits d = (<current_flow_state>.Name)
							ClearStartWaitingCount
							KillSpawnedScript \{Name = attract_timer_to_next_mode}
							SpawnScriptNow \{ui_flow_manager_respond_to_action
								params = {
									action = next_mode
								}}
						elseif (<top_rocker_delay> = 0 && ((<current_flow_state>.Name) = "attract_toprockers_fs" || (<current_flow_state>.Name) = "attract_toprockers_world_fs"))
							if (<start1_waiting> > 0 && <start2_waiting> = 0)
								KillSpawnedScript \{Name = attract_timer_to_next_mode}
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = prev_table
									}}
								<top_rocker_delay> = 30
							elseif (<start1_waiting> = 0 && <start2_waiting> > 0)
								KillSpawnedScript \{Name = attract_timer_to_next_mode}
								SpawnScriptNow \{ui_flow_manager_respond_to_action
									params = {
										action = next_table
									}}
								<top_rocker_delay> = 30
							endif
						else
							next_mode = 1
							ClearStartWaitingCount
						endif
					endif
				endif
			else
				if ($in_multiplayer_wait_screen = 1)
					if ($active_player = 1)
						if (<start2_waiting> || $attract_guitar_start_p2 = 1)
							if (<arcade_num_credits_in> >= <arcade_credits_for_standard>)
								ClearStartWaitingCount
								if ($rt_guitar_right_enabled = 1)
									Change \{active_continue_player = 0}
									if ($multiplayer_continue_flag = 1)
										Change \{right_player_continue = 1}
										Increment \{arcade_right_continues}
										SetGlobalTags arcade_audits params = {arcade_right_continues = <arcade_right_continues>}
									else
										<lefty_flip_p2> = 0
										Increment \{arcade_right_starts}
										SetGlobalTags arcade_audits params = {arcade_right_starts = <arcade_right_starts>}
									endif
									remove_credit
									attract_get_ready_for_multiplayer
									SpawnScriptNow \{ui_flow_manager_respond_to_action
										params = {
											action = start_multiplayer_game
										}}
								endif
							endif
						endif
					else
						if (<start1_waiting> || $attract_guitar_start_p1 = 1)
							if (<arcade_num_credits_in> >= <arcade_credits_for_standard>)
								ClearStartWaitingCount
								if ($rt_guitar_left_enabled = 1)
									Change \{active_continue_player = 0}
									if ($multiplayer_continue_flag = 1)
										Change \{left_player_continue = 1}
										Increment \{arcade_left_continues}
										SetGlobalTags arcade_audits params = {arcade_left_continues = <arcade_left_continues>}
									else
										<lefty_flip_p1> = 0
										Increment \{arcade_left_starts}
										SetGlobalTags arcade_audits params = {arcade_left_starts = <arcade_left_starts>}
									endif
									remove_credit
									attract_get_ready_for_multiplayer
									SpawnScriptNow \{ui_flow_manager_respond_to_action
										params = {
											action = start_multiplayer_game
										}}
								endif
							endif
						endif
					endif
				else
					enable_debug_state_warning_3
				endif
				ClearStartWaitingCount
			endif
		endif
		Wait \{1
			gameframe}
	else
		Wait \{1
			Second}
		ClearStartWaitingCount
		enable_debug_state_warning_1
	endif
	repeat
	printf \{"attract_check_for_input: waiting for safe shutdown"}
	printf \{"attract_check_for_input: done"}
endscript

script attract_mode_failsafe 
	begin
	if ($playing_song = 1 && $is_attract_mode = 1 && $is_changing_levels = 0 && $coin_handling_enabled = 1)
		if ($arcade_not_ok_to_accept_start_switches = 1)
			write_rt_debug_info \{output_text = 'FAILSAFE: setting arcade_not_ok_to_accept_start_switches = 0'}
			Change \{arcade_not_ok_to_accept_start_switches = 0}
		endif
		if ($active_player != 0)
			write_rt_debug_info \{output_text = 'FAILSAFE: setting active_player = 0'}
			Change \{active_player = 0}
		endif
		if ($in_continue_screen != 0)
			write_rt_debug_info \{output_text = 'FAILSAFE: setting in_continue_screen = 0'}
			Change \{in_continue_screen = 0}
		endif
		if ($in_multiplayer_wait_screen != 0)
			write_rt_debug_info \{output_text = 'FAILSAFE: setting in_multiplayer_wait_screen = 0'}
			Change \{in_multiplayer_wait_screen = 0}
		endif
		if ($is_test_mode != 0)
			write_rt_debug_info \{output_text = 'FAILSAFE: setting is_test_mode = 0'}
			Change \{is_test_mode = 0}
		endif
	endif
	printf \{"attract_mode_failsafe: checked flags"}
	Wait \{10
		Seconds}
	repeat
endscript
epilepsy_count = 2
logo_count = 4

script attract_timer_to_next_mode \{wait_time = 30
		fade_music = 0}
	printf "attract_timer_to_next_mode wait_time = %d" d = <wait_time>
	begin
	if (<fade_music> = 1)
		if (<wait_time> = 2)
			GetGlobalTags \{arcade_audits}
			GetGlobalTags \{arcade_hardware_adjustments}
			if (<arcade_attract_audio_on> = 1)
				SoundBussUnlock \{Master}
				setsoundbussparams \{Master = {
						vol = -100.0
					}
					time = 1.5}
				SoundBussLock \{Master}
			endif
		endif
	endif
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	wait_for_safe_shutdown
	current_flow_state_name = ($ui_flow_manager_state [0])
	current_flow_state = (<current_flow_state_name>)
	if ((<current_flow_state>.Name) = "attract_highway_tutorial_fs")
		Change epilepsy_count = ($epilepsy_count -1)
		Change logo_count = ($logo_count -1)
		if ($epilepsy_count = 0)
			Change \{epilepsy_count = 4}
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = epilepsy_mode
				}}
		elseif ($logo_count = 0)
			Change \{logo_count = 4}
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = logo_mode
				}}
		else
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = next_mode
				}}
		endif
	elseif ((<current_flow_state>.Name) = "attract_toprockers_fs")
		if ($coinup_enabled = 1)
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = next_mode_coinup
				}}
		else
			SpawnScriptNow \{ui_flow_manager_respond_to_action
				params = {
					action = next_mode
				}}
		endif
	else
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = next_mode
			}}
	endif
endscript

script create_attract_credits 
	printf \{"CREDIT CHECK ENTERING CREDITS %c"
		c = $in_credits}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = credits_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = SpriteElement
		id = credits_light_overlay
		parent = credits_container
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 100}
	displaySprite \{parent = credits_container
		tex = Online_Frame_Large
		Pos = (640.0, 360.0)
		Scale = (1.4, 1.4)
		just = [
			center
			center
		]
		z = 1}
	displayText \{parent = credits_container
		text = "CREDITS"
		Pos = (640.0, 45.0)
		just = [
			center
			top
		]
		z = 101
		rgba = [
			255
			255
			255
			255
		]
		Scale = 1.5
		font = text_a6
		rot = 2}
	text_params = {parent = mc_vmenu Type = TextElement font = ($credits_menu_font) rgba = ($menu_unfocus_color)}
	SpawnScriptNow \{scrolling_list_begin}
	displaySprite \{id = ec_flash
		parent = credits_container
		tex = Encore_Flash
		alpha = 0
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z = 200}
	arm_pos = (0.0, 485.0)
	arm_add = (80.0, 0.0)
	arm_z = [1 3 5 7 8 6 4 2]
	arm_index = 0
	begin
	formatText checksumName = arm_id 'ec_arm_0%d' d = <arm_index>
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_tex 'Encore_Arm_%d' d = <rand_arm>
	displaySprite id = <arm_id> parent = credits_container tex = <arm_tex> Pos = <arm_pos> dims = (180.0, 340.0) z = (100 + 10 + (<arm_z> [<arm_index>]))
	if (<rand_arm> = 4 || <rand_arm> = 8)
		<arm_id> :SetTags higher = 1
	else
		<arm_id> :SetTags higher = 0
	endif
	<arm_pos> = (<arm_pos> + <arm_add>)
	if (<arm_index> = 3)
		<arm_pos> = (<arm_pos> + (535.0, 0.0))
	endif
	<arm_index> = (<arm_index> + 1)
	repeat 8
	SpawnScriptNow \{credits_raise_fists}
	SpawnScriptNow \{credits_flashes}
endscript

script destroy_attract_credits 
	KillSpawnedScript \{Name = credits_raise_fists}
	KillSpawnedScript \{Name = credits_flashes}
	destroy_menu \{menu_id = credits_list_container}
	DestroyScreenElement \{id = credits_container}
	destroy_menu_backdrop
	printf \{"CREDIT CHECK EXITING CREDITS %c"
		c = $in_credits}
	Change \{in_credits = 0}
endscript

script credits_raise_fists 
	begin
	i = 0
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formatText checksumName = arm_id 'ec_arm_0%d' d = <i>
	GetScreenElementProps id = <arm_id>
	if ScreenElementExists id = <arm_id>
		<arm_id> :GetTags
		<arm_id> :SetTags Pos = <Pos> chance = <rand_arm>
		if (<higher> = 1)
			up_pos = (<Pos> - (0.0, 80.0))
		else
			up_pos = (<Pos> - (0.0, 50.0))
		endif
		DoScreenElementMorph id = <arm_id> Pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	<i> = (<i> + 1)
	repeat 8
	Wait \{0.3
		Seconds}
	<i> = 0
	begin
	GetRandomValue \{a = 0.1
		b = 0.3
		Name = wait_time}
	formatText checksumName = arm_id 'ec_arm_0%d' d = <i>
	if ScreenElementExists id = <arm_id>
		<arm_id> :GetTags
		DoScreenElementMorph id = <arm_id> Pos = (<Pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	<i> = (<i> + 1)
	repeat 8
	Wait \{0.3
		Seconds}
	repeat
endscript

script credits_flashes 
	begin
	rand_side = Random (@ 1 @ 2 )
	if (<rand_side> = 1)
		GetRandomValue \{a = 100
			b = 400
			Name = x_pos}
	else
		GetRandomValue \{a = 880
			b = 1180
			Name = x_pos}
	endif
	GetRandomValue \{a = 585
		b = 685
		Name = y_pos}
	GetRandomValue \{a = 96
		b = 256
		Name = rand_dim}
	GetRandomValue \{a = 0
		b = 360
		Name = rand_rot}
	Pos = (<x_pos> * (1.0, 0.0) + <y_pos> * (0.0, 1.0))
	dims = (<rand_dim> * (1.0, 0.0) + <rand_dim> * (0.0, 1.0))
	if ScreenElementExists \{id = ec_flash}
		SetScreenElementProps id = ec_flash Pos = <Pos> dims = <dims> rot_angle = <rand_rot> alpha = 1
		ec_flash :DoMorph alpha = 0 dims = (<dims> * 0.5) time = 0.2
		ec_flash :DoMorph dims = <dims>
	endif
	repeat
endscript
