autotest_max_suites = 1000
autotest_on = 0
autotest_turbo_mode = 0
autotest_transition = intro
autotest_next_test_screen_time = 5
autotest_next_suite_screen_time = 5
autotest_suite_list_index = 0
autotest_suite_index = 0
autotest_suite_name = none
autotest_test_index = 0
autotest_initial_time = 0
autotest_total_time = 0
autotest_ingame = 0
autotest_starttime = 0
autotest_endtime = 999999999
autotest_has_starttime = 0
autotest_has_endtime = 0
autotest_suite_list = [
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
	-1
]
autotest_num_suites = 0
autotest_total_frames = 0
autotest_average_fps = 0
autotest_highest_fps = 0
autotest_highest_fps_time = 0
autotest_highest_fps_test = -1
autotest_lowest_fps = 120
autotest_lowest_fps_time = 0
autotest_lowest_fps_test = -1
autotest_log_gpu = 0
autotest_gpu_total_frames = 0
autotest_gpu_under_15ms = 0
autotest_gpu_15ms_to_16ms = 0
autotest_gpu_16ms_to_18ms = 0
autotest_gpu_18ms_to_20ms = 0
autotest_gpu_over_20ms = 0
autotest_gpu_spike = 0
autotest_gpu_spike_time = 0
autotest_num_worst_cams = 5
autotest_worst_cam_strings = [
	qs(0x1feb8bd8)
	qs(0x1feb8bd8)
	qs(0x1feb8bd8)
	qs(0x1feb8bd8)
	qs(0x1feb8bd8)
]
autotest_worst_cam_ms = [
	0.0
	0.0
	0.0
	0.0
	0.0
]
autotest_worst_cam_times = [
	0.0
	0.0
	0.0
	0.0
	0.0
]
autotest_least_worst_cam_index = 0

script autotest_start 
	if ($autotest_turbo_mode = 1)
		change \{autotest_next_test_screen_time = 1}
		change \{autotest_transition = none}
	endif
	if (($autotest_num_suites) = 0 && autolaunch = 0)
		return
	endif
	destroy_autotest_menu \{still_testing = 1}
	if ($autotest_suite_name = none)
		getarraysize ($autotest_suite_list)
		<suite_list_size> = <array_size>
	else
		<suite_list_size> = 1
	endif
	<suite_index> = 0
	begin
	if (($autotest_suite_list [<suite_index>]) = -1 && ($autotest_suite_name = none))
		break
	endif
	autotest_get_suite suite_num = <suite_index> fromsuitelist
	getarraysize (<suite_struct>.tests)
	<i> = 0
	begin
	autotest_get_test suite_num = <suite_index> test_num = <i>
	autotest_set_test_params test_struct = <test_struct>
	autotest_check_test_params suite_num = <suite_index> test_num = <i>
	if (<check_passed> = 0)
		if NOT gotparam \{autolaunch}
			back_to_autotest_menu
		endif
		return \{started = 0}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<suite_index> = (<suite_index> + 1)
	repeat <suite_list_size>
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_set_test_params test_struct = <test_struct>
	autotest_show_next_test_screen length = ($autotest_next_test_screen_time) test_struct = <test_struct>
	gettruestarttime
	change autotest_initial_time = <starttime>
	generic_event_choose \{data = {
			state = uistate_play_song
			starttime = $autotest_starttime
		}}
	spawnscriptnow \{autotest_update_fps_info}
	if ($autotest_log_gpu = 1)
		spawnscriptnow \{autotest_update_gpu_info}
	endif
	if ($autotest_has_endtime)
		spawnscriptnow \{autotest_check_end_time}
	endif
	if ($autotest_hud_on = 1)
		spawnscriptnow \{autotest_create_hud}
	endif
	change \{autotest_ingame = 1}
endscript

script autotest_set_test_params 
	change current_song = (<test_struct>.song)
	change \{num_quickplay_song_list = 1}
	change \{quickplay_song_list_current = 0}
	change current_level = (<test_struct>.venue)
	<diff_array> = []
	<num_players> = 0
	if NOT (<test_struct>.p1_part = none)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p1_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p1_difficulty))
	endif
	if NOT (<test_struct>.p2_part = none)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p2_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p2_difficulty))
	endif
	if NOT (<test_struct>.p3_part = none)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p3_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p3_difficulty))
	endif
	if NOT (<test_struct>.p4_part = none)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p4_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p4_difficulty))
	endif
	change current_num_players = <num_players>
	change structurename = player1_status difficulty = (<diff_array> [0])
	if (<num_players> > 1)
		change structurename = player2_status difficulty = (<diff_array> [1])
	endif
	if (<num_players> > 2)
		change structurename = player3_status difficulty = (<diff_array> [2])
	endif
	if (<num_players> > 3)
		change structurename = player4_status difficulty = (<diff_array> [3])
	endif
	<player> = 1
	begin
	setplayerinfo <player> star_power_debug_mode = (<test_struct>.star_power_always_on)
	<player> = (<player> + 1)
	repeat 4
	change game_mode = (<test_struct>.game_mode)
	change use_worst_band = (<test_struct>.worst_case_band)
	change \{current_starttime = 0}
	if structurecontains structure = <test_struct> start_time
		change current_starttime = (<test_struct>.start_time)
		change \{autotest_has_starttime = 1}
	else
		change \{autotest_starttime = 0}
		change \{autotest_has_starttime = 0}
	endif
	if structurecontains structure = <test_struct> end_time
		change autotest_endtime = (<test_struct>.end_time)
		change \{autotest_has_endtime = 1}
	else
		change \{autotest_endtime = 999999999}
		change \{autotest_has_endtime = 0}
	endif
	if structurecontains structure = <test_struct> speed_factor
		change current_speedfactor = (<test_struct>.speed_factor)
		setslomo \{$current_speedfactor}
	else
		change \{current_speedfactor = 1.0}
		setslomo \{$current_speedfactor}
	endif
	if structurecontains structure = <test_struct> force_score
		change debug_forcescore = (<test_struct>.force_score)
		spawnscriptlater \{autotest_force_crowd}
	else
		change \{debug_forcescore = off}
	endif
endscript

script autotest_force_crowd 
	begin
	if ($debug_forcescore = medium)
		break
	endif
	if ($debug_forcescore = good)
		crowdincrease \{player_status = player1_status}
		crowdincrease \{player_status = player2_status}
		crowdincrease \{player_status = player3_status}
		crowdincrease \{player_status = player4_status}
	elseif ($debug_forcescore = poor)
		crowddecrease \{player_status = player1_status}
		crowddecrease \{player_status = player2_status}
		crowddecrease \{player_status = player3_status}
		crowddecrease \{player_status = player4_status}
	endif
	wait \{1
		seconds}
	repeat 10
endscript

script autotest_next_test 
	change \{autotest_ingame = 0}
	killspawnedscript \{name = autotest_update_gpu_info}
	ui_event_wait \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	autotest_write_song_data_to_file
	autotest_reset_gpu_info
	autotest_reset_worst_cam_info
	change autotest_test_index = ($autotest_test_index + 1)
	autotest_get_suite \{suite_num = $autotest_suite_index
		fromsuitelist}
	getarraysize (<suite_struct>.tests)
	<end_of_tests> = 0
	if ($autotest_test_index = <array_size>)
		<end_of_tests> = 1
		autotest_show_next_suite_screen length = ($autotest_next_suite_screen_time) suite_struct = <suite_struct>
	endif
	<end_of_suites> = 0
	if (<end_of_tests> = 1)
		change autotest_suite_index = ($autotest_suite_index + 1)
		change \{autotest_test_index = 0}
		<next_index> = ($autotest_suite_list [($autotest_suite_index)])
		if (<next_index> = -1)
			<end_of_suites> = 1
		endif
	endif
	if (<end_of_suites> = 0)
		autotest_get_test \{suite_num = $autotest_suite_index
			test_num = $autotest_test_index}
		autotest_set_test_params test_struct = <test_struct>
		autotest_show_next_test_screen length = ($autotest_next_test_screen_time) test_struct = <test_struct>
		restart_song
		killspawnedscript \{name = autotest_check_end_time}
		if ($autotest_has_endtime)
			spawnscriptnow \{autotest_check_end_time}
		endif
		change \{autotest_ingame = 1}
		return
	endif
	createscreenelement \{parent = root_window
		id = autotest_complete
		type = descinterface
		desc = 'autotest_complete'}
	if autotest_complete :desc_resolvealias \{name = continue_menu}
		createscreenelement {
			type = textelement
			parent = <resolved_id>
			font = fontgrid_title_a2
			scale = 1.0
			rgba = [250 250 250 250]
			text = qs(0xec3e1b52)
			just = [center center]
			z_priority = 100.0
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose autotest_finished}
			]
		}
		launchevent type = focus target = <resolved_id>
	endif
	autotest_write_end_file
	killspawnedscript \{name = autotest_update_fps_info}
	killspawnedscript \{name = autotest_check_end_time}
	killspawnedscript \{name = autotest_update_gpu_info}
endscript

script autotest_get_suite \{suite_num = 0}
	if ($autotest_suite_name != none)
		<suite_name> = ($autotest_suite_name)
	else
		if gotparam \{fromsuitelist}
			<suite_num> = ($autotest_suite_list [<suite_num>])
		endif
		formattext checksumname = suite_name 'autotest_suite%n' n = <suite_num>
	endif
	if NOT globalexists name = <suite_name> type = structure
		formattext textname = text qs(0xed1b72a8) s = <suite_name> dontassertforchecksums
		scriptassert <text>
	endif
	return suite_struct = $<suite_name> suite_name = <suite_name> resolved_suite_num = <suite_num>
endscript

script autotest_get_test 
	autotest_get_suite suite_num = <suite_num> fromsuitelist
	getarraysize (<suite_struct>.tests)
	if ($autotest_suite_name = none)
		if (<array_size> < 1)
			scriptassert qs(0xcfcf94ba) n = <resolved_suite_num>
		endif
		if (<test_num> >= <array_size>)
			scriptassert qs(0x99ec3137) n = <resolved_suite_num> i = <test_num> a = <array_size>
		endif
		if (<test_num> < 0)
			scriptassert qs(0x8d2c7597) n = <resolved_suite_num> i = <test_num>
		endif
	endif
	return test_struct = (<suite_struct>.tests [<test_num>])
endscript

script autotest_finished 
	change \{autotest_on = 0}
	autotest_destroy_hud
	destroy_autotest_complete
	generic_event_back \{state = uistate_mainmenu}
endscript

script autotest_update_fps_info 
	autotest_reset_fps_info
	begin
	if ($autotest_on = 0)
		break
	endif
	if NOT screenelementexists \{id = loading_screen_container}
		getsongtimems
		if ($autotest_ingame = 1 && $transition_playing = false)
			change autotest_total_frames = ($autotest_total_frames + 1)
			change autotest_average_fps = ($autotest_average_fps + $framerate_value)
			if (($framerate_value) < ($autotest_lowest_fps))
				change autotest_lowest_fps = ($framerate_value)
				change autotest_lowest_fps_time = <time>
				change autotest_lowest_fps_test = ($autotest_test_index)
			endif
			if (($framerate_value) > ($autotest_highest_fps))
				change autotest_highest_fps = ($framerate_value)
				change autotest_highest_fps_time = <time>
				change autotest_highest_fps_test = ($autotest_test_index)
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script autotest_reset_fps_info 
	change \{autotest_total_frames = 0}
	change \{autotest_average_fps = 0}
	change \{autotest_highest_fps = 0}
	change \{autotest_highest_fps_time = 0}
	change \{autotest_highest_fps_test = -1}
	change \{autotest_lowest_fps = 120}
	change \{autotest_lowest_fps_time = 0}
	change \{autotest_lowest_fps_time = -1}
endscript

script autotest_check_end_time 
	wait \{5
		seconds}
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	begin
	if ($autotest_on = 0)
		break
	endif
	getsongtimems
	if ((<time> > (<test_struct>.end_time)) && ($transition_playing = false))
		guitarevent_songwon
		wait \{10
			seconds}
		autotest_get_test \{suite_num = $autotest_suite_index
			test_num = $autotest_test_index}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script autotest_update_gpu_info 
	begin
	getprofiledata \{cpu = 6
		name = gpu}
	<ms> = (<microseconds> / 1000.0)
	getsongtimems
	if (<ms> < 15.0)
		change autotest_gpu_under_15ms = ($autotest_gpu_under_15ms + 1)
	elseif (<ms> <= 16.67)
		change autotest_gpu_15ms_to_16ms = ($autotest_gpu_15ms_to_16ms + 1)
	elseif (<ms> <= 18.0)
		change autotest_gpu_16ms_to_18ms = ($autotest_gpu_16ms_to_18ms + 1)
	elseif (<ms> <= 20.0)
		change autotest_gpu_18ms_to_20ms = ($autotest_gpu_18ms_to_20ms + 1)
	else
		change autotest_gpu_over_20ms = ($autotest_gpu_over_20ms + 1)
	endif
	if (<ms> > ($autotest_gpu_spike))
		change autotest_gpu_spike = <ms>
		change autotest_gpu_spike_time = <time>
	endif
	autotest_update_worst_cam_info ms = <ms> time = <time>
	change autotest_gpu_total_frames = ($autotest_gpu_total_frames + 1)
	wait \{1
		gameframes}
	repeat
endscript

script autotest_reset_gpu_info 
	change \{autotest_gpu_total_frames = 0}
	change \{autotest_gpu_under_15ms = 0}
	change \{autotest_gpu_15ms_to_16ms = 0}
	change \{autotest_gpu_16ms_to_18ms = 0}
	change \{autotest_gpu_18ms_to_20ms = 0}
	change \{autotest_gpu_over_20ms = 0}
	change \{autotest_gpu_spike = 0}
	change \{autotest_gpu_spike_time = 0}
endscript

script autotest_update_worst_cam_info 
	<index> = $autotest_least_worst_cam_index
	if (<ms> < ($autotest_worst_cam_ms [<index>]))
		return
	endif
	getarraysize \{$cameracuts_lastarray}
	<new_cam_name> = qs(0xe3f67499)
	if (<array_size> > ($cameracuts_lastindex))
		if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) name
			formattext textname = new_cam_name qs(0x39f26b60) c = ($cameracuts_lastarray [$cameracuts_lastindex].name) dontassertforchecksums
		elseif structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex]) params
			if structurecontains structure = (($cameracuts_lastarray) [$cameracuts_lastindex].params) name
				formattext textname = new_cam_name qs(0x39f26b60) c = ($cameracuts_lastarray [$cameracuts_lastindex].params.name) dontassertforchecksums
			endif
		endif
	endif
	<new_cam_ms> = <ms>
	<new_cam_time> = <time>
	<match_found> = 0
	<i> = 0
	begin
	if (($autotest_worst_cam_strings [<i>]) = <new_cam_name>)
		<match_found> = 1
		if (($autotest_worst_cam_ms [<i>]) < <new_cam_ms>)
			<index> = <i>
			break
		endif
	endif
	<i> = (<i> + 1)
	repeat $autotest_num_worst_cams
	<new_worst_cam> = 0
	if (<match_found> = 0)
		<temp_array> = $autotest_worst_cam_strings
		setarrayelement {
			arrayname = temp_array
			index = <index>
			newvalue = <new_cam_name>
		}
		change autotest_worst_cam_strings = <temp_array>
		<temp_array> = $autotest_worst_cam_ms
		setarrayelement {
			arrayname = temp_array
			index = <index>
			newvalue = <new_cam_ms>
		}
		change autotest_worst_cam_ms = <temp_array>
		<temp_array> = $autotest_worst_cam_times
		setarrayelement {
			arrayname = temp_array
			index = <index>
			newvalue = <new_cam_time>
		}
		change autotest_worst_cam_times = <temp_array>
		<new_worst_cam> = 1
	endif
	if (<new_worst_cam> = 1)
		<new_cam_index> = 0
		<i> = 1
		begin
		if (($autotest_worst_cam_ms [<i>]) < ($autotest_worst_cam_ms [<new_cam_index>]))
			<new_cam_index> = <i>
		endif
		<i> = (<i> + 1)
		repeat ($autotest_num_worst_cams - 1)
		change autotest_least_worst_cam_index = <new_cam_index>
	endif
endscript

script autotest_reset_worst_cam_info 
	change \{autotest_worst_cam_strings = [
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
		]}
	change \{autotest_worst_cam_ms = [
			0.0
			0.0
			0.0
			0.0
			0.0
		]}
	change \{autotest_worst_cam_times = [
			0.0
			0.0
			0.0
			0.0
			0.0
		]}
	change \{autotest_least_worst_cam_index = 0}
endscript

script autotest_toggle_hud 
	change autotest_hud_on = (1 - $autotest_hud_on)
	if ($autotest_hud_on = 0)
		formattext \{textname = hud_text
			qs(0x507fe429)}
	else
		formattext \{textname = hud_text
			qs(0x379652e5)}
	endif
	hud_toggle :se_setprops text = <hud_text>
endscript

script autotest_update_in_game_hud 
	if ($autotest_hud_on)
		autotest_get_suite \{suite_num = $autotest_suite_index
			fromsuitelist}
		autotest_get_test \{suite_num = $autotest_suite_index
			test_num = $autotest_test_index}
		autotest_hud :se_setprops test_suite_text = (<suite_struct>.name)
		formattext \{textname = test_number
			qs(0x3c71eff6)
			t = $autotest_test_index}
		autotest_hud :se_setprops test_text = <test_number>
		begin
		if ($autotest_on = 0)
			break
		endif
		if NOT screenelementexists \{id = loading_screen_container}
			if ($autotest_ingame = 1)
				getsongtimems
				autotest_format_time time = <time> mode = minutes_seconds_ms
				autotest_hud :se_setprops song_time_text = <formatted_time>
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script autotest_toggle_turbo_mode 
	change autotest_turbo_mode = (1 - $autotest_turbo_mode)
	if ($autotest_turbo_mode = 0)
		formattext \{textname = turbo_mode_text
			qs(0xa6fddccd)}
	else
		formattext \{textname = turbo_mode_text
			qs(0x47094fc5)}
	endif
	turbo_mode_toggle :se_setprops text = <turbo_mode_text>
endscript

script autotest_push_test_suite 
	getarraysize ($autotest_suite_list)
	if (($autotest_num_suites) = <array_size>)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	setarrayelement {arrayname = temp_array index = ($autotest_num_suites) newvalue = <suite_num>}
	change autotest_suite_list = <temp_array>
	autotest_get_suite suite_num = <suite_num>
	formattext checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	createscreenelement {
		type = textelement
		id = <suite_id>
		parent = test_suite_list
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = (<suite_struct>.name)
		just = [left top]
		z_priority = 100.0
	}
	formattext textname = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
	change autotest_num_suites = ($autotest_num_suites + 1)
endscript

script autotest_pop_test_suite 
	if (($autotest_num_suites) = 0)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	<index> = ($autotest_num_suites - 1)
	<suite_num> = ($autotest_suite_list [<index>])
	setarrayelement {arrayname = temp_array index = <index> newvalue = -1}
	change autotest_suite_list = <temp_array>
	change autotest_num_suites = ($autotest_num_suites - 1)
	formattext checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	if screenelementexists id = <suite_id>
		destroyscreenelement id = <suite_id>
	endif
	formattext textname = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
	if screenelementexists \{id = test_suite_list}
		destroyscreenelement \{id = test_suite_list}
	endif
	autotest_create_suite_list
endscript

script autotest_populate_test_suite_list 
	getarraysize ($autotest_suite_list)
	<i> = 0
	begin
	if (($autotest_suite_list [<i>]) = -1)
		break
	endif
	autotest_get_suite suite_num = <i> fromsuitelist
	formattext checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = <i>
	createscreenelement {
		type = textelement
		id = <suite_id>
		parent = test_suite_list
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = (<suite_struct>.name)
		just = [left top]
		z_priority = 100.0
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script autotest_show_next_test_screen \{length = 5}
	if (<length> <= 0)
		return
	endif
	<save_speed> = ($current_speedfactor)
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	createscreenelement \{parent = root_window
		id = autotest_transition
		type = descinterface
		desc = 'autotest_transition'}
	autotest_transition_set_props test_struct = <test_struct> autotest_transition = <autotest_transition> speed = <save_speed>
	if ($autotest_turbo_mode = 1)
		<wait_time> = 0.5
	else
		<wait_time> = 1.0
	endif
	<cur_count> = <length>
	begin
	formattext textname = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_transition :se_setprops countdown_text = <countdown_text>
	wait \{1
		seconds}
	<cur_count> = (<cur_count> - 1)
	repeat <length>
	if screenelementexists \{id = autotest_transition}
		destroyscreenelement \{id = autotest_transition}
	endif
	change current_speedfactor = <save_speed>
	setslomo \{$current_speedfactor}
endscript

script autotest_show_next_suite_screen \{length = 5}
	if (<length> <= 0)
		return
	endif
	<save_speed> = ($current_speedfactor)
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	createscreenelement \{parent = root_window
		id = autotest_suite_transition
		type = descinterface
		desc = 'autotest_suite_transition'}
	autotest_suite_transition_set_props suite_struct = <suite_struct>
	<cur_count> = <length>
	begin
	formattext textname = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_suite_transition :se_setprops countdown_text = <countdown_text>
	wait \{1
		seconds}
	<cur_count> = (<cur_count> - 1)
	repeat <length>
	if screenelementexists \{id = autotest_suite_transition}
		destroyscreenelement \{id = autotest_suite_transition}
	endif
	change current_speedfactor = <save_speed>
	setslomo \{$current_speedfactor}
endscript

script autotest_format_time \{mode = minutes_seconds_ms}
	<sign> = qs(0x03ac90f0)
	if (<time> < 0)
		<time> = (<time> * -1)
		<sign> = qs(0xc4992bba)
	endif
	<pure_seconds> = (<time> / 1000)
	casttointeger \{pure_seconds}
	mod a = <pure_seconds> b = 60
	<seconds> = <mod>
	<pure_minutes> = (<pure_seconds> / 60)
	mod a = <pure_minutes> b = 60
	<minutes> = <mod>
	<hours> = ((<pure_seconds> / 60) / 60)
	<pure_ms> = <time>
	casttointeger \{pure_ms}
	mod a = <pure_ms> b = 1000
	<ms> = <mod>
	if (<ms> < 10)
		formattext textname = ms_text qs(0xffd5d705) m = <ms>
	elseif (<ms> < 100)
		formattext textname = ms_text qs(0x82aa6ba6) m = <ms>
	else
		formattext textname = ms_text qs(0xa77146ee) m = <ms>
	endif
	if (<seconds> < 10)
		formattext textname = seconds_text qs(0x56eb5479) s = <seconds>
	else
		formattext textname = seconds_text qs(0x73307931) s = <seconds>
	endif
	if (<minutes> < 10)
		formattext textname = minutes_text qs(0x82aa6ba6) m = <minutes>
	else
		formattext textname = minutes_text qs(0xa77146ee) m = <minutes>
	endif
	if (<hours> < 10)
		formattext textname = hours_text qs(0xffdd9fe3) h = <hours>
	else
		formattext textname = hours_text qs(0xda06b2ab) h = <hours>
	endif
	switch (<mode>)
		case minutes_seconds_ms
		formattext textname = formatted_time qs(0xe4a7f04c) n = <sign> m = <minutes_text> s = <seconds_text> f = <ms_text>
		case hours_minutes_seconds
		formattext textname = formatted_time qs(0xa6c71ba1) n = <sign> h = <hours_text> m = <minutes_text> s = <seconds_text>
		case hours_minutes_seconds_ms
		formattext textname = formatted_time qs(0x6af264de) n = <sign> h = <hours_text> m = <minutes_text> s = <seconds_text> f = <ms_text>
		default
		formattext \{textname = formatted_time
			qs(0x03ac90f0)}
	endswitch
	return formatted_time = <formatted_time>
endscript

script autotest_write_song_data_to_file 
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_get_suite \{suite_num = $autotest_suite_index
		fromsuitelist}
	formattext textname = filename '%s_test%t_stats' s = <suite_name> t = ($autotest_test_index) donotresolve dontassertforchecksums
	textoutputstart
	if ($autotest_log_gpu = 1)
		<gpu_under_15ms> = (($autotest_gpu_under_15ms) * 1.0)
		<gpu_15ms16mss> = (($autotest_gpu_15ms_to_16ms) * 1.0)
		<gpu_16ms18ms> = (($autotest_gpu_16ms_to_18ms) * 1.0)
		<gpu_18ms20ms> = (($autotest_gpu_18ms_to_20ms) * 1.0)
		<gpu_over_20ms> = (($autotest_gpu_over_20ms) * 1.0)
		<percent_under_15ms> = ((<gpu_under_15ms> / ($autotest_gpu_total_frames)) * 100)
		<percent_15ms16ms> = ((<gpu_15ms16mss> / ($autotest_gpu_total_frames)) * 100)
		<percent_16ms18ms> = ((<gpu_16ms18ms> / ($autotest_gpu_total_frames)) * 100)
		<percent_18ms20ms> = ((<gpu_18ms20ms> / ($autotest_gpu_total_frames)) * 100)
		<percent_over_20ms> = ((<gpu_over_20ms> / ($autotest_gpu_total_frames)) * 100)
		formattext textname = text qs(0x7ae4314a) p = <percent_under_15ms> f = ($autotest_gpu_under_15ms) t = ($autotest_gpu_total_frames)
		textoutput text = <text>
		formattext textname = text qs(0x29f6586b) p = <percent_15ms16ms> f = ($autotest_gpu_15ms_to_16ms) t = ($autotest_gpu_total_frames)
		textoutput text = <text>
		formattext textname = text qs(0x8315ca36) p = <percent_16ms18ms> f = ($autotest_gpu_16ms_to_18ms) t = ($autotest_gpu_total_frames)
		textoutput text = <text>
		formattext textname = text qs(0x7a922000) p = <percent_18ms20ms> f = ($autotest_gpu_18ms_to_20ms) t = ($autotest_gpu_total_frames)
		textoutput text = <text>
		formattext textname = text qs(0x0b4b04b9) p = <percent_over_20ms> f = ($autotest_gpu_over_20ms) t = ($autotest_gpu_total_frames)
		textoutput text = <text>
		autotest_format_time time = ($autotest_gpu_spike_time) mode = minutes_seconds_ms
		formattext textname = text qs(0x74b58814) g = ($autotest_gpu_spike) t = <formatted_time>
		textoutput text = <text>
		textoutput \{text = qs(0x03ac90f0)}
		<i> = 0
		begin
		autotest_format_time time = ($autotest_worst_cam_times [<i>]) mode = minutes_seconds_ms
		formattext textname = text qs(0x299b069d) c = ($autotest_worst_cam_strings [<i>]) m = ($autotest_worst_cam_ms [<i>]) t = <formatted_time>
		textoutput text = <text>
		<i> = (<i> + 1)
		repeat $autotest_num_worst_cams
		textoutput \{text = qs(0x03ac90f0)}
	endif
	<song_struct> = ($permanent_songlist_props.(<test_struct>.song))
	<song_string> = (<song_struct>.title)
	formattext textname = text qs(0x73307931) s = <song_string>
	textoutput text = <text>
	<venue_struct> = ($levelzones.(<test_struct>.venue))
	<venue_string> = (<venue_struct>.title)
	formattext textname = text qs(0x0e478d74) v = <venue_string>
	textoutput text = <text>
	<player> = 1
	begin
	formattext checksumname = player_part 'p%n_part' n = <player>
	<part_string> = ($autotest_part_strings.(<test_struct>.<player_part>))
	textoutput text = <part_string>
	<player> = (<player> + 1)
	repeat 4
	<player> = 1
	begin
	formattext checksumname = player_diff 'p%n_difficulty' n = <player>
	<diff_string> = ($autotest_difficulty_strings.(<test_struct>.<player_diff>))
	textoutput text = <diff_string>
	<player> = (<player> + 1)
	repeat 4
	formattext textname = text qs(0x73307931) s = (<test_struct>.start_power_always_on)
	textoutput text = <text>
	<mode_string> = ($autotest_game_mode_names.(<test_struct>.game_mode))
	textoutput text = <mode_string>
	formattext textname = text qs(0x175cbc35) w = (<test_struct>.worst_case_band)
	textoutput text = <text>
	if structurecontains structure = <test_struct> start_time
		formattext textname = text qs(0x73307931) s = (<test_struct>.start_time)
	else
		formattext \{textname = text
			qs(0x73307931)
			s = qs(0x431892ee)}
	endif
	textoutput text = <text>
	if structurecontains structure = <test_struct> end_time
		formattext textname = text qs(0x6fa8cce6) e = (<test_struct>.end_time)
	else
		formattext \{textname = text
			qs(0x6fa8cce6)
			e = qs(0x449293a1)}
	endif
	textoutput text = <text>
	if structurecontains structure = <test_struct> speed_factor
		formattext textname = text qs(0x73307931) s = (<test_struct>.speed_factor)
	else
		formattext \{textname = text
			qs(0x73307931)
			s = 1.0}
	endif
	textoutput text = <text>
	textoutputend output_text filename = <filename>
endscript

script autotest_write_end_file 
	autotest_get_suite \{suite_num = $autotest_suite_index}
	formattext \{textname = filename
		'autotest_complete'}
	textoutputstart
	textoutput \{text = qs(0xd81e006a)}
	textoutput \{text = qs(0x03ac90f0)}
	if ($autotest_suite_name = none)
		getarraysize ($autotest_suite_list)
		<i> = 0
		begin
		if (($autotest_suite_list [<i>]) = -1)
			break
		endif
		autotest_get_suite suite_num = <i> fromsuitelist
		formattext textname = text qs(0x73307931) s = <suite_name> donotresolve dontassertforchecksums
		textoutput text = <text>
		<i> = (<i> + 1)
		repeat <array_size>
	else
		autotest_get_suite
		formattext textname = text qs(0x73307931) s = <suite_name> donotresolve dontassertforchecksums
		textoutput text = <text>
	endif
	output_camera_sync_warnings
	textoutputend output_text filename = <filename>
endscript

script autotest_autolaunch \{suite_index = -1
		suite_name = none
		hud_on = 0
		log_gpu = 0}
	change autotest_log_gpu = <log_gpu>
	if ((<suite_index> < 0) && (suite_name = none))
		scriptassert \{qs(0x2fc0ebd2)}
	endif
	spawnscriptnow autotest_autolaunch_delay params = {suite_index = <suite_index> suite_name = <suite_name> hud_on = <hud_on>}
endscript

script autotest_autolaunch_delay 
	change \{show_gpu_time = 1}
	change \{skip_signin = 1}
	change \{autotest_on = 1}
	change autotest_suite_index = <suite_index>
	change autotest_suite_name = <suite_name>
	change \{autotest_test_index = 0}
	change autotest_hud_on = <hud_on>
	change \{autolaunch_startnow = 0}
	change \{autotest_restore_globals = 1}
	begin
	if screenelementexists \{id = current_menu}
		break
	endif
	wait \{1
		gameframe}
	repeat
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if screenelementexists \{id = motdinterface}
		launchevent \{type = unfocus
			target = motdinterface}
	endif
	autotest_start \{autolaunch = 1}
endscript
