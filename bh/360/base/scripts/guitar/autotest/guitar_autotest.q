autotest_max_suites = 1000
autotest_on = 0
autotest_turbo_mode = 0
autotest_transition = intro
autotest_next_test_screen_time = 5
autotest_next_suite_screen_time = 5
autotest_suite_list_index = 0
autotest_suite_index = 0
autotest_suite_name = None
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
autotest_first_test = true
autotest_autolaunched = false
autotest_fully_complete = 0

script autotest_start \{autolaunch = 0}
	if ($autotest_turbo_mode = 1)
		Change \{autotest_next_test_screen_time = 1}
		Change \{autotest_transition = None}
	endif
	if (($autotest_num_suites) = 0 && <autolaunch> = 0)
		return
	endif
	if (<autolaunch> = 1)
		Change \{autotest_autolaunched = true}
	else
		Change \{autotest_autolaunched = false}
	endif
	destroy_autotest_menu \{still_testing = 1}
	if ($autotest_suite_name = None)
		GetArraySize ($autotest_suite_list)
		<suite_list_size> = <array_size>
	else
		<suite_list_size> = 1
	endif
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_set_test_params test_struct = <test_struct>
	if ($autotest_first_test = true && $autotest_autolaunched = true)
		autolaunch song = (<test_struct>.song) level = (<test_struct>.level) part = (<test_struct>.p1_part) part2 = (<test_struct>.p2_part) part3 = (<test_struct>.p3_part) part4 = (<test_struct>.p4_part) difficulty = (<test_struct>.p1_difficulty) difficulty2 = (<test_struct>.p2_difficulty) difficulty3 = (<test_struct>.p3_difficulty) difficulty4 = (<test_struct>.p4_difficulty) game_mode = (<test_struct>.game_mode)
	else
		autotest_show_next_test_screen length = ($autotest_next_test_screen_time) test_struct = <test_struct>
	endif
	GetTrueStartTime
	Change autotest_initial_time = <starttime>
	if ($autotest_first_test = false || $autotest_autolaunched = false)
		generic_event_choose \{data = {
				state = uistate_play_song
				starttime = $autotest_starttime
			}}
	endif
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
	Change \{autotest_ingame = 1}
	Change \{autotest_first_test = false}
endscript

script autotest_set_test_params 
	GMan_SongFunc \{func = clear_play_list}
	GMan_SongTool_SetCurrentSong song = (<test_struct>.song)
	Change current_level = (<test_struct>.level)
	<diff_array> = []
	<num_players> = 0
	if NOT (<test_struct>.p1_part = None)
		SetPlayerInfo (<num_players> + 1) part = (<test_struct>.p1_part)
		SetPlayerInfo (<num_players> + 1) in_game = 1
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p1_difficulty))
	endif
	if NOT (<test_struct>.p2_part = None)
		SetPlayerInfo (<num_players> + 1) part = (<test_struct>.p2_part)
		SetPlayerInfo (<num_players> + 1) in_game = 1
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p2_difficulty))
	endif
	if NOT (<test_struct>.p3_part = None)
		SetPlayerInfo (<num_players> + 1) part = (<test_struct>.p3_part)
		SetPlayerInfo (<num_players> + 1) in_game = 1
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p3_difficulty))
	endif
	if NOT (<test_struct>.p4_part = None)
		SetPlayerInfo (<num_players> + 1) part = (<test_struct>.p4_part)
		SetPlayerInfo (<num_players> + 1) in_game = 1
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p4_difficulty))
	endif
	SetPlayerInfo 1 difficulty = (<diff_array> [0])
	if (<num_players> > 1)
		SetPlayerInfo 2 difficulty = (<diff_array> [1])
	endif
	if (<num_players> > 2)
		SetPlayerInfo 3 difficulty = (<diff_array> [2])
	endif
	if (<num_players> > 3)
		SetPlayerInfo 4 difficulty = (<diff_array> [3])
	endif
	<player> = 1
	begin
	SetPlayerInfo <player> star_power_debug_mode = (<test_struct>.star_power_always_on)
	<player> = (<player> + 1)
	repeat 4
	Change game_mode = (<test_struct>.game_mode)
	Change use_worst_band = (<test_struct>.worst_case_band)
	Change \{current_starttime = 0}
	if StructureContains structure = <test_struct> start_time
		Change current_starttime = (<test_struct>.start_time)
		Change \{autotest_has_starttime = 1}
	else
		Change \{autotest_starttime = 0}
		Change \{autotest_has_starttime = 0}
	endif
	if StructureContains structure = <test_struct> end_time
		Change autotest_endtime = (<test_struct>.end_time)
		Change \{autotest_has_endtime = 1}
	else
		Change \{autotest_endtime = 999999999}
		Change \{autotest_has_endtime = 0}
	endif
	if StructureContains structure = <test_struct> speed_factor
		Change current_speedfactor = (<test_struct>.speed_factor)
		setslomo \{$current_speedfactor}
	else
		Change \{current_speedfactor = 1.0}
		setslomo \{$current_speedfactor}
	endif
	if StructureContains structure = <test_struct> force_score
		Change debug_forcescore = (<test_struct>.force_score)
		spawnscriptlater \{autotest_force_crowd}
	else
		Change \{debug_forcescore = off}
	endif
endscript

script autotest_force_crowd 
	begin
	if ($debug_forcescore = medium)
		break
	endif
	if ($debug_forcescore = good)
		CrowdIncrease \{player = 1}
		CrowdIncrease \{player = 2}
		CrowdIncrease \{player = 3}
		CrowdIncrease \{player = 4}
	elseif ($debug_forcescore = poor)
		CrowdDecrease \{player = 1}
		CrowdDecrease \{player = 2}
		CrowdDecrease \{player = 3}
		CrowdDecrease \{player = 4}
	endif
	wait \{1
		seconds}
	repeat 10
endscript

script autotest_next_test 
	Change \{autotest_ingame = 0}
	killspawnedscript \{name = autotest_update_gpu_info}
	if ($autotest_autolaunched = false)
		ui_event_wait \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	autotest_write_song_data_to_file
	autotest_write_accuracy_to_file
	autotest_reset_gpu_info
	autotest_reset_worst_cam_info
	Change autotest_test_index = ($autotest_test_index + 1)
	autotest_get_suite \{suite_num = $autotest_suite_index
		FromSuiteList}
	GetArraySize (<suite_struct>.tests)
	<end_of_tests> = 0
	if ($autotest_test_index = <array_size>)
		<end_of_tests> = 1
		autotest_show_next_suite_screen length = ($autotest_next_suite_screen_time) suite_struct = <suite_struct>
	endif
	<end_of_suites> = 0
	if (<end_of_tests> = 1)
		Change autotest_suite_index = ($autotest_suite_index + 1)
		Change \{autotest_test_index = 0}
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
		Change \{autotest_ingame = 1}
		return
	endif
	CreateScreenElement \{parent = root_window
		id = autotest_complete
		type = DescInterface
		desc = 'autotest_complete'}
	if autotest_complete :Desc_ResolveAlias \{name = continue_menu}
		CreateScreenElement {
			type = TextElement
			parent = <resolved_id>
			font = fontgrid_text_A1
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
		LaunchEvent type = focus target = <resolved_id>
	endif
	autotest_write_end_file
	killspawnedscript \{name = autotest_update_fps_info}
	killspawnedscript \{name = autotest_check_end_time}
	killspawnedscript \{name = autotest_update_gpu_info}
endscript

script autotest_get_suite \{suite_num = 0}
	if ($autotest_suite_name != None)
		<suite_name> = ($autotest_suite_name)
	else
		if GotParam \{FromSuiteList}
			<suite_num> = ($autotest_suite_list [<suite_num>])
		endif
		FormatText checksumname = suite_name 'autotest_suite%n' n = <suite_num>
	endif
	if NOT GlobalExists name = <suite_name> type = structure
		FormatText TextName = text qs(0xed1b72a8) s = <suite_name> DontAssertForChecksums
		ScriptAssert <text>
	endif
	return suite_struct = $<suite_name> suite_name = <suite_name> resolved_suite_num = <suite_num>
endscript

script autotest_get_test 
	autotest_get_suite suite_num = <suite_num> FromSuiteList
	GetArraySize (<suite_struct>.tests)
	if ($autotest_suite_name = None)
		if (<array_size> < 1)
			ScriptAssert qs(0xcfcf94ba) n = <resolved_suite_num>
		endif
		if (<test_num> >= <array_size>)
			ScriptAssert qs(0x99ec3137) n = <resolved_suite_num> i = <test_num> a = <array_size>
		endif
		if (<test_num> < 0)
			ScriptAssert qs(0x8d2c7597) n = <resolved_suite_num> i = <test_num>
		endif
	endif
	return test_struct = (<suite_struct>.tests [<test_num>])
endscript

script autotest_finished 
	Change \{autotest_on = 0}
	autotest_destroy_hud
	destroy_autotest_complete
	ui_event \{event = menu_change
		state = uistate_mainmenu}
endscript

script autotest_update_fps_info 
	autotest_reset_fps_info
	begin
	if ($autotest_on = 0)
		break
	endif
	if NOT ScreenElementExists \{id = loading_screen_container}
		GetSongTimeMs
		if ($autotest_ingame = 1 && $transition_playing = false)
			Change autotest_total_frames = ($autotest_total_frames + 1)
			Change autotest_average_fps = ($autotest_average_fps + $framerate_value)
			if (($framerate_value) < ($autotest_lowest_fps))
				Change autotest_lowest_fps = ($framerate_value)
				Change autotest_lowest_fps_time = <time>
				Change autotest_lowest_fps_test = ($autotest_test_index)
			endif
			if (($framerate_value) > ($autotest_highest_fps))
				Change autotest_highest_fps = ($framerate_value)
				Change autotest_highest_fps_time = <time>
				Change autotest_highest_fps_test = ($autotest_test_index)
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script autotest_reset_fps_info 
	Change \{autotest_total_frames = 0}
	Change \{autotest_average_fps = 0}
	Change \{autotest_highest_fps = 0}
	Change \{autotest_highest_fps_time = 0}
	Change \{autotest_highest_fps_test = -1}
	Change \{autotest_lowest_fps = 120}
	Change \{autotest_lowest_fps_time = 0}
	Change \{autotest_lowest_fps_time = -1}
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
	GetSongTimeMs
	if ((<time> > (<test_struct>.end_time)) && ($transition_playing = false))
		GuitarEvent_SongWon
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
	GetProfileData \{cpu = 6
		name = gpu}
	<ms> = (<microseconds> / 1000.0)
	GetSongTimeMs
	if (<ms> < 15.0)
		Change autotest_gpu_under_15ms = ($autotest_gpu_under_15ms + 1)
	elseif (<ms> <= 16.67)
		Change autotest_gpu_15ms_to_16ms = ($autotest_gpu_15ms_to_16ms + 1)
	elseif (<ms> <= 18.0)
		Change autotest_gpu_16ms_to_18ms = ($autotest_gpu_16ms_to_18ms + 1)
	elseif (<ms> <= 20.0)
		Change autotest_gpu_18ms_to_20ms = ($autotest_gpu_18ms_to_20ms + 1)
	else
		Change autotest_gpu_over_20ms = ($autotest_gpu_over_20ms + 1)
	endif
	if (<ms> > ($autotest_gpu_spike))
		Change autotest_gpu_spike = <ms>
		Change autotest_gpu_spike_time = <time>
	endif
	autotest_update_worst_cam_info ms = <ms> time = <time>
	Change autotest_gpu_total_frames = ($autotest_gpu_total_frames + 1)
	wait \{1
		gameframes}
	repeat
endscript

script autotest_reset_gpu_info 
	Change \{autotest_gpu_total_frames = 0}
	Change \{autotest_gpu_under_15ms = 0}
	Change \{autotest_gpu_15ms_to_16ms = 0}
	Change \{autotest_gpu_16ms_to_18ms = 0}
	Change \{autotest_gpu_18ms_to_20ms = 0}
	Change \{autotest_gpu_over_20ms = 0}
	Change \{autotest_gpu_spike = 0}
	Change \{autotest_gpu_spike_time = 0}
endscript

script autotest_update_worst_cam_info 
	<index> = $autotest_least_worst_cam_index
	if (<ms> < ($autotest_worst_cam_ms [<index>]))
		return
	endif
	GetArraySize \{$CameraCuts_LastArray}
	<new_cam_name> = qs(0xe3f67499)
	if (<array_size> > ($CameraCuts_LastIndex))
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) name
			FormatText TextName = new_cam_name qs(0x39f26b60) c = ($CameraCuts_LastArray [$CameraCuts_LastIndex].name) DontAssertForChecksums
		elseif StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) name
				FormatText TextName = new_cam_name qs(0x39f26b60) c = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.name) DontAssertForChecksums
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
		SetArrayElement {
			arrayName = temp_array
			index = <index>
			newValue = <new_cam_name>
		}
		Change autotest_worst_cam_strings = <temp_array>
		<temp_array> = $autotest_worst_cam_ms
		SetArrayElement {
			arrayName = temp_array
			index = <index>
			newValue = <new_cam_ms>
		}
		Change autotest_worst_cam_ms = <temp_array>
		<temp_array> = $autotest_worst_cam_times
		SetArrayElement {
			arrayName = temp_array
			index = <index>
			newValue = <new_cam_time>
		}
		Change autotest_worst_cam_times = <temp_array>
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
		Change autotest_least_worst_cam_index = <new_cam_index>
	endif
endscript

script autotest_reset_worst_cam_info 
	Change \{autotest_worst_cam_strings = [
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
			qs(0x1feb8bd8)
		]}
	Change \{autotest_worst_cam_ms = [
			0.0
			0.0
			0.0
			0.0
			0.0
		]}
	Change \{autotest_worst_cam_times = [
			0.0
			0.0
			0.0
			0.0
			0.0
		]}
	Change \{autotest_least_worst_cam_index = 0}
endscript
toggle_hud_menuitem = 0

script autotest_toggle_hud 
	Change autotest_hud_on = (1 - $autotest_hud_on)
	if ($autotest_hud_on = 0)
		FormatText \{TextName = hud_text
			qs(0x507fe429)}
	else
		FormatText \{TextName = hud_text
			qs(0x379652e5)}
	endif
	($toggle_hud_menuitem) :SE_SetProps generic_menu_smenu_textitem_text_text = <hud_text>
endscript

script autotest_update_in_game_hud 
	if ($autotest_hud_on)
		autotest_get_suite \{suite_num = $autotest_suite_index
			FromSuiteList}
		autotest_get_test \{suite_num = $autotest_suite_index
			test_num = $autotest_test_index}
		autotest_hud :SE_SetProps test_suite_text = (<suite_struct>.name)
		FormatText \{TextName = test_number
			qs(0x3c71eff6)
			t = $autotest_test_index}
		autotest_hud :SE_SetProps test_text = <test_number>
		begin
		if ($autotest_on = 0)
			break
		endif
		if NOT ScreenElementExists \{id = loading_screen_container}
			if ($autotest_ingame = 1)
				GetSongTimeMs
				autotest_format_time time = <time> mode = minutes_seconds_ms
				autotest_hud :SE_SetProps song_time_text = <formatted_time>
			endif
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript
toggle_turbo_mode_menuitem = 0

script autotest_toggle_turbo_mode 
	Change autotest_turbo_mode = (1 - $autotest_turbo_mode)
	if ($autotest_turbo_mode = 0)
		FormatText \{TextName = turbo_mode_text
			qs(0xa6fddccd)}
	else
		FormatText \{TextName = turbo_mode_text
			qs(0x47094fc5)}
	endif
	($toggle_turbo_mode_menuitem) :SE_SetProps generic_menu_smenu_textitem_text_text = <turbo_mode_text>
endscript

script autotest_push_test_suite 
	GetArraySize ($autotest_suite_list)
	if (($autotest_num_suites) = <array_size>)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	SetArrayElement {arrayName = temp_array index = ($autotest_num_suites) newValue = <suite_num>}
	Change autotest_suite_list = <temp_array>
	autotest_get_suite suite_num = <suite_num>
	FormatText checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	CreateScreenElement {
		type = TextElement
		id = <suite_id>
		parent = test_suite_list
		font = debug
		scale = 0.75
		rgba = [210 210 210 250]
		text = (<suite_struct>.name)
		just = [left top]
		z_priority = 100.0
	}
	FormatText TextName = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
	Change autotest_num_suites = ($autotest_num_suites + 1)
endscript

script autotest_pop_test_suite 
	if (($autotest_num_suites) = 0)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	<index> = ($autotest_num_suites - 1)
	<suite_num> = ($autotest_suite_list [<index>])
	SetArrayElement {arrayName = temp_array index = <index> newValue = -1}
	Change autotest_suite_list = <temp_array>
	Change autotest_num_suites = ($autotest_num_suites - 1)
	FormatText checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	if ScreenElementExists id = <suite_id>
		DestroyScreenElement id = <suite_id>
	endif
	FormatText TextName = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
	if ScreenElementExists \{id = test_suite_list}
		DestroyScreenElement \{id = test_suite_list}
	endif
	autotest_create_suite_list
endscript

script autotest_populate_test_suite_list 
	GetArraySize ($autotest_suite_list)
	<i> = 0
	begin
	if (($autotest_suite_list [<i>]) = -1)
		break
	endif
	autotest_get_suite suite_num = <i> FromSuiteList
	FormatText checksumname = suite_id 'suite_%s_at_%i' s = <suite_num> i = <i>
	CreateScreenElement {
		type = TextElement
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
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	CreateScreenElement \{parent = root_window
		id = autotest_transition
		type = DescInterface
		desc = 'autotest_transition'}
	autotest_transition_set_props test_struct = <test_struct> autotest_transition = <autotest_transition> speed = <save_speed>
	if ($autotest_turbo_mode = 1)
		<wait_time> = 0.5
	else
		<wait_time> = 1.0
	endif
	<cur_count> = <length>
	begin
	FormatText TextName = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_transition :SE_SetProps countdown_text = <countdown_text>
	wait \{1
		seconds}
	<cur_count> = (<cur_count> - 1)
	repeat <length>
	if ScreenElementExists \{id = autotest_transition}
		DestroyScreenElement \{id = autotest_transition}
	endif
	Change current_speedfactor = <save_speed>
	setslomo \{$current_speedfactor}
endscript

script autotest_show_next_suite_screen \{length = 5}
	if (<length> <= 0)
		return
	endif
	<save_speed> = ($current_speedfactor)
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	CreateScreenElement \{parent = root_window
		id = autotest_suite_transition
		type = DescInterface
		desc = 'autotest_suite_transition'}
	autotest_suite_transition_set_props suite_struct = <suite_struct>
	<cur_count> = <length>
	begin
	FormatText TextName = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_suite_transition :SE_SetProps countdown_text = <countdown_text>
	wait \{1
		seconds}
	<cur_count> = (<cur_count> - 1)
	repeat <length>
	if ScreenElementExists \{id = autotest_suite_transition}
		DestroyScreenElement \{id = autotest_suite_transition}
	endif
	Change current_speedfactor = <save_speed>
	setslomo \{$current_speedfactor}
endscript

script autotest_format_time \{mode = minutes_seconds_ms}
	<sign> = qs(0x03ac90f0)
	if (<time> < 0)
		<time> = (<time> * -1)
		<sign> = qs(0xc4992bba)
	endif
	<pure_seconds> = (<time> / 1000)
	CastToInteger \{pure_seconds}
	Mod a = <pure_seconds> b = 60
	<seconds> = <Mod>
	<pure_minutes> = (<pure_seconds> / 60)
	Mod a = <pure_minutes> b = 60
	<minutes> = <Mod>
	<hours> = ((<pure_seconds> / 60) / 60)
	<pure_ms> = <time>
	CastToInteger \{pure_ms}
	Mod a = <pure_ms> b = 1000
	<ms> = <Mod>
	if (<ms> < 10)
		FormatText TextName = ms_text qs(0xffd5d705) m = <ms>
	elseif (<ms> < 100)
		FormatText TextName = ms_text qs(0x82aa6ba6) m = <ms>
	else
		FormatText TextName = ms_text qs(0xa77146ee) m = <ms>
	endif
	if (<seconds> < 10)
		FormatText TextName = seconds_text qs(0x56eb5479) s = <seconds>
	else
		FormatText TextName = seconds_text qs(0x73307931) s = <seconds>
	endif
	if (<minutes> < 10)
		FormatText TextName = minutes_text qs(0x82aa6ba6) m = <minutes>
	else
		FormatText TextName = minutes_text qs(0xa77146ee) m = <minutes>
	endif
	if (<hours> < 10)
		FormatText TextName = hours_text qs(0xffdd9fe3) H = <hours>
	else
		FormatText TextName = hours_text qs(0xda06b2ab) H = <hours>
	endif
	switch (<mode>)
		case minutes_seconds_ms
		FormatText TextName = formatted_time qs(0xe4a7f04c) n = <sign> m = <minutes_text> s = <seconds_text> f = <ms_text>
		case hours_minutes_seconds
		FormatText TextName = formatted_time qs(0xa6c71ba1) n = <sign> H = <hours_text> m = <minutes_text> s = <seconds_text>
		case hours_minutes_seconds_ms
		FormatText TextName = formatted_time qs(0x6af264de) n = <sign> H = <hours_text> m = <minutes_text> s = <seconds_text> f = <ms_text>
		default
		FormatText \{TextName = formatted_time
			qs(0x03ac90f0)}
	endswitch
	return formatted_time = <formatted_time>
endscript

script autotest_write_song_data_to_file 
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_get_suite \{suite_num = $autotest_suite_index
		FromSuiteList}
	FormatText TextName = FileName '%s_test%t_stats' s = <suite_name> t = ($autotest_test_index) DoNotResolve DontAssertForChecksums
	TextOutputStart
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
		FormatText TextName = text qs(0x7ae4314a) p = <percent_under_15ms> f = ($autotest_gpu_under_15ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		FormatText TextName = text qs(0x29f6586b) p = <percent_15ms16ms> f = ($autotest_gpu_15ms_to_16ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		FormatText TextName = text qs(0x8315ca36) p = <percent_16ms18ms> f = ($autotest_gpu_16ms_to_18ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		FormatText TextName = text qs(0x7a922000) p = <percent_18ms20ms> f = ($autotest_gpu_18ms_to_20ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		FormatText TextName = text qs(0x0b4b04b9) p = <percent_over_20ms> f = ($autotest_gpu_over_20ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		autotest_format_time time = ($autotest_gpu_spike_time) mode = minutes_seconds_ms
		FormatText TextName = text qs(0x74b58814) g = ($autotest_gpu_spike) t = <formatted_time>
		TextOutput text = <text>
		TextOutput \{text = qs(0x03ac90f0)}
		<i> = 0
		begin
		autotest_format_time time = ($autotest_worst_cam_times [<i>]) mode = minutes_seconds_ms
		FormatText TextName = text qs(0x299b069d) c = ($autotest_worst_cam_strings [<i>]) m = ($autotest_worst_cam_ms [<i>]) t = <formatted_time>
		TextOutput text = <text>
		<i> = (<i> + 1)
		repeat $autotest_num_worst_cams
		TextOutput \{text = qs(0x03ac90f0)}
	endif
	autotest_output_test_info
	TextOutputEnd output_text FileName = <FileName>
endscript

script autotest_output_test_info 
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_get_suite \{suite_num = $autotest_suite_index
		FromSuiteList}
	props_struct = ($gh_songlist_props)
	<song_struct> = ((<props_struct>).(<test_struct>.song))
	<song_string> = (<song_struct>.Title)
	FormatText TextName = text qs(0x200b7e9e) s = <song_string>
	TextOutput text = <text>
	<venue_struct> = ($LevelZones.(<test_struct>.level))
	<venue_string> = (<venue_struct>.Title)
	FormatText TextName = text qs(0x65b06b3d) v = <venue_string>
	TextOutput text = <text>
	GetNumPlayersInGame \{on_screen}
	<player> = 1
	begin
	FormatText checksumname = player_part 'p%n_part' n = <player>
	<part_string> = ($autotest_part_strings.(<test_struct>.<player_part>))
	FormatText TextName = text qs(0x064820a5) p = <player> s = <part_string>
	TextOutput text = <text>
	<player> = (<player> + 1)
	repeat <num_players_shown>
	<player> = 1
	begin
	FormatText checksumname = player_diff 'p%n_difficulty' n = <player>
	<diff_string> = ($autotest_difficulty_strings.(<test_struct>.<player_diff>))
	FormatText TextName = text qs(0x05b060f7) p = <player> d = <diff_string>
	TextOutput text = <text>
	<player> = (<player> + 1)
	repeat <num_players_shown>
	FormatText TextName = text qs(0x54bf2f1e) s = (<test_struct>.star_power_always_on)
	TextOutput text = <text>
	<mode_string> = ($autotest_game_mode_names.(<test_struct>.game_mode))
	FormatText TextName = text qs(0x330c6169) m = <mode_string>
	TextOutput text = <text>
	FormatText TextName = text qs(0x6ffeab32) w = (<test_struct>.worst_case_band)
	TextOutput text = <text>
	if StructureContains structure = <test_struct> start_time
		FormatText TextName = text qs(0xa72bcb96) s = (<test_struct>.start_time)
	else
		<text> = qs(0x6d8100ac)
	endif
	TextOutput text = <text>
	if StructureContains structure = <test_struct> end_time
		FormatText TextName = text qs(0xa6f49151) e = (<test_struct>.end_time)
	else
		<text> = qs(0xfacc4fcb)
	endif
	TextOutput text = <text>
	if StructureContains structure = <test_struct> speed_factor
		FormatText TextName = text qs(0x87248511) s = (<test_struct>.speed_factor)
	else
		FormatText \{TextName = text
			qs(0x87248511)
			s = 1.0}
	endif
	TextOutput text = <text>
endscript

script autotest_write_accuracy_to_file 
	FileName = 'autotest_100_percent_complete'
	TextOutputStart
	GetNumPlayersInGame \{on_screen}
	player = 1
	begin
	GetPlayerInfo <player> part
	if (<part> = guitar ||
			<part> = bass ||
			<part> = Drum)
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> part
		<part_string> = ($autotest_part_strings.<part>)
		FormatText TextName = notes_hit_text qs(0x31a218f7) p = <player> i = <part_string> n = <notes_hit>
		FormatText TextName = max_notes_text qs(0x45ccf5a9) p = <player> i = <part_string> m = <max_notes>
		TextOutput text = <notes_hit_text>
		TextOutput text = <max_notes_text>
		if (<notes_hit> < <max_notes>)
			<FileName> = 'autotest_100_percent_failed'
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	TextOutput \{text = qs(0x03ac90f0)}
	autotest_output_test_info
	TextOutputEnd output_text FileName = <FileName>
endscript

script autotest_write_end_file 
	autotest_get_suite \{suite_num = $autotest_suite_index}
	FormatText \{TextName = FileName
		'autotest_complete'}
	TextOutputStart
	TextOutput \{text = qs(0xd81e006a)}
	TextOutput \{text = qs(0x03ac90f0)}
	if ($autotest_suite_name = None)
		GetArraySize ($autotest_suite_list)
		<i> = 0
		begin
		if (($autotest_suite_list [<i>]) = -1)
			break
		endif
		autotest_get_suite suite_num = <i> FromSuiteList
		FormatText TextName = text qs(0x73307931) s = <suite_name> DoNotResolve DontAssertForChecksums
		TextOutput text = <text>
		<i> = (<i> + 1)
		repeat <array_size>
	else
		autotest_get_suite
		FormatText TextName = text qs(0x73307931) s = <suite_name> DoNotResolve DontAssertForChecksums
		TextOutput text = <text>
	endif
	Output_Camera_Sync_Warnings
	TextOutputEnd output_text FileName = <FileName>
endscript

script autotest_autolaunch \{suite_index = -1
		suite_name = None
		hud_on = 0
		log_gpu = 0
		fully_complete = 0}
	Change autotest_log_gpu = <log_gpu>
	if ((<suite_index> < 0) && (suite_name = None))
		ScriptAssert \{qs(0x2fc0ebd2)}
	endif
	Change \{show_gpu_time = 1}
	Change \{autotest_on = 1}
	Change autotest_suite_index = <suite_index>
	Change autotest_suite_name = <suite_name>
	Change \{autotest_test_index = 0}
	Change autotest_hud_on = <hud_on>
	Change \{autolaunch_startnow = 0}
	Change \{autotest_restore_globals = 1}
	Change \{skip_signin = 1}
	Change \{autolaunch_showstorageselector = 0}
	Change \{primary_controller = 0}
	Change \{primary_controller_assigned = 1}
	Change autotest_fully_complete = <fully_complete>
	SetPlayerInfo \{1
		bot_play = 1}
	SetPlayerInfo \{2
		bot_play = 1}
	SetPlayerInfo \{3
		bot_play = 1}
	SetPlayerInfo \{4
		bot_play = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = MotdInterface}
		LaunchEvent \{type = unfocus
			target = MotdInterface}
	endif
	autotest_start \{autolaunch = 1}
endscript

script startup_generate_profile_reports 
	if GotParam \{song}
		if (<song> = InABigCountry)
			Change \{debug_encore = 1}
		endif
	endif
	Change \{output_gpu_log = 1}
	Change \{use_worst_band = 1}
	Change \{autolaunch_showstorageselector = 0}
	Change \{GPULog_OutputFilename = 'output_gpu'}
	SetPlayerInfo \{1
		star_power_debug_mode = 2}
	SetPlayerInfo \{2
		star_power_debug_mode = 2}
	SetPlayerInfo \{3
		star_power_debug_mode = 2}
	SetPlayerInfo \{4
		star_power_debug_mode = 2}
	setup_4_player_bot
endscript
