autotest_max_suites = 1000
autotest_on = 0
autotest_turbo_mode = 0
autotest_transition = Intro
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

script autotest_start 
	if ($autotest_turbo_mode = 1)
		Change \{autotest_next_test_screen_time = 1}
		Change \{autotest_transition = None}
	endif
	if (($autotest_num_suites) = 0 && autolaunch = 0)
		return
	endif
	destroy_autotest_menu \{still_testing = 1}
	if ($autotest_suite_name = None)
		GetArraySize ($autotest_suite_list)
		<suite_list_size> = <array_Size>
	else
		<suite_list_size> = 1
	endif
	<suite_index> = 0
	begin
	if (($autotest_suite_list [<suite_index>]) = -1 && ($autotest_suite_name = None))
		break
	endif
	autotest_get_suite suite_num = <suite_index> fromsuitelist
	GetArraySize (<suite_struct>.tests)
	<i> = 0
	begin
	autotest_get_test suite_num = <suite_index> test_num = <i>
	autotest_set_test_params test_struct = <test_struct>
	autotest_check_test_params suite_num = <suite_index> test_num = <i>
	if (<check_passed> = 0)
		if NOT GotParam \{autolaunch}
			back_to_autotest_menu
		endif
		return \{started = 0}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	<suite_index> = (<suite_index> + 1)
	repeat <suite_list_size>
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_set_test_params test_struct = <test_struct>
	autotest_show_next_test_screen length = ($autotest_next_test_screen_time) test_struct = <test_struct>
	GetTrueStartTime
	Change autotest_initial_time = <starttime>
	generic_event_choose \{data = {
			state = uistate_play_song
			starttime = $autotest_starttime
		}}
	SpawnScriptNow \{autotest_update_fps_info}
	if ($autotest_log_gpu = 1)
		SpawnScriptNow \{autotest_update_gpu_info}
	endif
	if ($autotest_has_endtime)
		SpawnScriptNow \{autotest_check_end_time}
	endif
	if ($autotest_hud_on = 1)
		SpawnScriptNow \{autotest_create_hud}
	endif
	Change \{autotest_ingame = 1}
endscript

script autotest_set_test_params 
	Change current_song = (<test_struct>.song)
	Change \{num_quickplay_song_list = 1}
	Change \{quickplay_song_list_current = 0}
	Change current_level = (<test_struct>.venue)
	<diff_array> = []
	<num_players> = 0
	if NOT (<test_struct>.p1_part = None)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p1_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p1_difficulty))
	endif
	if NOT (<test_struct>.p2_part = None)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p2_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p2_difficulty))
	endif
	if NOT (<test_struct>.p3_part = None)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p3_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p3_difficulty))
	endif
	if NOT (<test_struct>.p4_part = None)
		setplayerinfo (<num_players> + 1) part = (<test_struct>.p4_part)
		<num_players> = (<num_players> + 1)
		<diff_array> = (<diff_array> + (<test_struct>.p4_difficulty))
	endif
	Change current_num_players = <num_players>
	Change structurename = player1_status difficulty = (<diff_array> [0])
	if (<num_players> > 1)
		Change structurename = player2_status difficulty = (<diff_array> [1])
	endif
	if (<num_players> > 2)
		Change structurename = player3_status difficulty = (<diff_array> [2])
	endif
	if (<num_players> > 3)
		Change structurename = player4_status difficulty = (<diff_array> [3])
	endif
	<Player> = 1
	begin
	setplayerinfo <Player> star_power_debug_mode = (<test_struct>.star_power_always_on)
	<Player> = (<Player> + 1)
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
		SpawnScriptLater \{autotest_force_crowd}
	else
		Change \{debug_forcescore = OFF}
	endif
endscript

script autotest_force_crowd 
	begin
	if ($debug_forcescore = medium)
		break
	endif
	if ($debug_forcescore = good)
		CrowdIncrease \{player_status = player1_status}
		CrowdIncrease \{player_status = player2_status}
		CrowdIncrease \{player_status = player3_status}
		CrowdIncrease \{player_status = player4_status}
	elseif ($debug_forcescore = poor)
		CrowdDecrease \{player_status = player1_status}
		CrowdDecrease \{player_status = player2_status}
		CrowdDecrease \{player_status = player3_status}
		CrowdDecrease \{player_status = player4_status}
	endif
	Wait \{1
		Seconds}
	repeat 10
endscript

script autotest_next_test 
	Change \{autotest_ingame = 0}
	KillSpawnedScript \{Name = autotest_update_gpu_info}
	ui_event_wait \{event = menu_back
		data = {
			state = Uistate_gameplay
		}}
	Change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	autotest_write_song_data_to_file
	autotest_reset_gpu_info
	autotest_reset_worst_cam_info
	Change autotest_test_index = ($autotest_test_index + 1)
	autotest_get_suite \{suite_num = $autotest_suite_index
		fromsuitelist}
	GetArraySize (<suite_struct>.tests)
	<end_of_tests> = 0
	if ($autotest_test_index = <array_Size>)
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
		KillSpawnedScript \{Name = autotest_check_end_time}
		if ($autotest_has_endtime)
			SpawnScriptNow \{autotest_check_end_time}
		endif
		Change \{autotest_ingame = 1}
		return
	endif
	CreateScreenElement \{parent = root_window
		id = autotest_complete
		Type = descinterface
		desc = 'autotest_complete'}
	if autotest_complete :desc_resolvealias \{Name = continue_menu}
		CreateScreenElement {
			Type = TextElement
			parent = <resolved_id>
			font = fontgrid_title_a2
			Scale = 1.0
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
		LaunchEvent Type = focus target = <resolved_id>
	endif
	autotest_write_end_file
	KillSpawnedScript \{Name = autotest_update_fps_info}
	KillSpawnedScript \{Name = autotest_check_end_time}
	KillSpawnedScript \{Name = autotest_update_gpu_info}
endscript

script autotest_get_suite \{suite_num = 0}
	if ($autotest_suite_name != None)
		<suite_name> = ($autotest_suite_name)
	else
		if GotParam \{fromsuitelist}
			<suite_num> = ($autotest_suite_list [<suite_num>])
		endif
		formatText checksumName = suite_name 'autotest_suite%n' n = <suite_num>
	endif
	if NOT GlobalExists Name = <suite_name> Type = structure
		formatText TextName = text qs(0xed1b72a8) s = <suite_name> DontAssertForChecksums
		ScriptAssert <text>
	endif
	return suite_struct = $<suite_name> suite_name = <suite_name> resolved_suite_num = <suite_num>
endscript

script autotest_get_test 
	autotest_get_suite suite_num = <suite_num> fromsuitelist
	GetArraySize (<suite_struct>.tests)
	if ($autotest_suite_name = None)
		if (<array_Size> < 1)
			ScriptAssert qs(0xcfcf94ba) n = <resolved_suite_num>
		endif
		if (<test_num> >= <array_Size>)
			ScriptAssert qs(0x99ec3137) n = <resolved_suite_num> i = <test_num> a = <array_Size>
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
	generic_event_back \{state = uistate_mainmenu}
endscript

script autotest_update_fps_info 
	autotest_reset_fps_info
	begin
	if ($autotest_on = 0)
		break
	endif
	if NOT ScreenElementExists \{id = loading_screen_container}
		GetSongTimeMs
		if ($autotest_ingame = 1 && $transition_playing = FALSE)
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
	Wait \{1
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
	Wait \{5
		Seconds}
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	begin
	if ($autotest_on = 0)
		break
	endif
	GetSongTimeMs
	if ((<time> > (<test_struct>.end_time)) && ($transition_playing = FALSE))
		GuitarEvent_SongWon
		Wait \{10
			Seconds}
		autotest_get_test \{suite_num = $autotest_suite_index
			test_num = $autotest_test_index}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script autotest_update_gpu_info 
	begin
	GetProfileData \{cpu = 6
		Name = gpu}
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
	Wait \{1
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
	if (<array_Size> > ($CameraCuts_LastIndex))
		if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
			formatText TextName = new_cam_name qs(0x39f26b60) c = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name) DontAssertForChecksums
		elseif StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) params
			if StructureContains structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].params) Name
				formatText TextName = new_cam_name qs(0x39f26b60) c = ($CameraCuts_LastArray [$CameraCuts_LastIndex].params.Name) DontAssertForChecksums
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
			ArrayName = temp_array
			index = <index>
			NewValue = <new_cam_name>
		}
		Change autotest_worst_cam_strings = <temp_array>
		<temp_array> = $autotest_worst_cam_ms
		SetArrayElement {
			ArrayName = temp_array
			index = <index>
			NewValue = <new_cam_ms>
		}
		Change autotest_worst_cam_ms = <temp_array>
		<temp_array> = $autotest_worst_cam_times
		SetArrayElement {
			ArrayName = temp_array
			index = <index>
			NewValue = <new_cam_time>
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

script autotest_toggle_hud 
	Change autotest_hud_on = (1 - $autotest_hud_on)
	if ($autotest_hud_on = 0)
		formatText \{TextName = hud_text
			qs(0x507fe429)}
	else
		formatText \{TextName = hud_text
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
		autotest_hud :se_setprops test_suite_text = (<suite_struct>.Name)
		formatText \{TextName = test_number
			qs(0x3c71eff6)
			t = $autotest_test_index}
		autotest_hud :se_setprops test_text = <test_number>
		begin
		if ($autotest_on = 0)
			break
		endif
		if NOT ScreenElementExists \{id = loading_screen_container}
			if ($autotest_ingame = 1)
				GetSongTimeMs
				autotest_format_time time = <time> mode = minutes_seconds_ms
				autotest_hud :se_setprops song_time_text = <formatted_time>
			endif
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script autotest_toggle_turbo_mode 
	Change autotest_turbo_mode = (1 - $autotest_turbo_mode)
	if ($autotest_turbo_mode = 0)
		formatText \{TextName = turbo_mode_text
			qs(0xa6fddccd)}
	else
		formatText \{TextName = turbo_mode_text
			qs(0x47094fc5)}
	endif
	turbo_mode_toggle :se_setprops text = <turbo_mode_text>
endscript

script autotest_push_test_suite 
	GetArraySize ($autotest_suite_list)
	if (($autotest_num_suites) = <array_Size>)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	SetArrayElement {ArrayName = temp_array index = ($autotest_num_suites) NewValue = <suite_num>}
	Change autotest_suite_list = <temp_array>
	autotest_get_suite suite_num = <suite_num>
	formatText checksumName = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	CreateScreenElement {
		Type = TextElement
		id = <suite_id>
		parent = test_suite_list
		font = debug
		Scale = 0.75
		rgba = [210 210 210 250]
		text = (<suite_struct>.Name)
		just = [left top]
		z_priority = 100.0
	}
	formatText TextName = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
	Change autotest_num_suites = ($autotest_num_suites + 1)
endscript

script autotest_pop_test_suite 
	if (($autotest_num_suites) = 0)
		return
	endif
	<temp_array> = ($autotest_suite_list)
	<index> = ($autotest_num_suites - 1)
	<suite_num> = ($autotest_suite_list [<index>])
	SetArrayElement {ArrayName = temp_array index = <index> NewValue = -1}
	Change autotest_suite_list = <temp_array>
	Change autotest_num_suites = ($autotest_num_suites - 1)
	formatText checksumName = suite_id 'suite_%s_at_%i' s = <suite_num> i = ($autotest_num_suites)
	if ScreenElementExists id = <suite_id>
		DestroyScreenElement id = <suite_id>
	endif
	formatText TextName = text qs(0x843f16d0) s = <suite_num> i = ($autotest_num_suites)
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
	autotest_get_suite suite_num = <i> fromsuitelist
	formatText checksumName = suite_id 'suite_%s_at_%i' s = <suite_num> i = <i>
	CreateScreenElement {
		Type = TextElement
		id = <suite_id>
		parent = test_suite_list
		font = debug
		Scale = 0.75
		rgba = [210 210 210 250]
		text = (<suite_struct>.Name)
		just = [left top]
		z_priority = 100.0
	}
	<i> = (<i> + 1)
	repeat <array_Size>
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
		Type = descinterface
		desc = 'autotest_transition'}
	autotest_transition_set_props test_struct = <test_struct> autotest_transition = <autotest_transition> speed = <save_speed>
	if ($autotest_turbo_mode = 1)
		<wait_time> = 0.5
	else
		<wait_time> = 1.0
	endif
	<cur_count> = <length>
	begin
	formatText TextName = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_transition :se_setprops countdown_text = <countdown_text>
	Wait \{1
		Seconds}
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
		Type = descinterface
		desc = 'autotest_suite_transition'}
	autotest_suite_transition_set_props suite_struct = <suite_struct>
	<cur_count> = <length>
	begin
	formatText TextName = countdown_text qs(0x39f26b60) c = <cur_count>
	autotest_suite_transition :se_setprops countdown_text = <countdown_text>
	Wait \{1
		Seconds}
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
	<Seconds> = <Mod>
	<pure_minutes> = (<pure_seconds> / 60)
	Mod a = <pure_minutes> b = 60
	<minutes> = <Mod>
	<hours> = ((<pure_seconds> / 60) / 60)
	<pure_ms> = <time>
	CastToInteger \{pure_ms}
	Mod a = <pure_ms> b = 1000
	<ms> = <Mod>
	if (<ms> < 10)
		formatText TextName = ms_text qs(0xffd5d705) m = <ms>
	elseif (<ms> < 100)
		formatText TextName = ms_text qs(0x82aa6ba6) m = <ms>
	else
		formatText TextName = ms_text qs(0xa77146ee) m = <ms>
	endif
	if (<Seconds> < 10)
		formatText TextName = seconds_text qs(0x56eb5479) s = <Seconds>
	else
		formatText TextName = seconds_text qs(0x73307931) s = <Seconds>
	endif
	if (<minutes> < 10)
		formatText TextName = minutes_text qs(0x82aa6ba6) m = <minutes>
	else
		formatText TextName = minutes_text qs(0xa77146ee) m = <minutes>
	endif
	if (<hours> < 10)
		formatText TextName = hours_text qs(0xffdd9fe3) h = <hours>
	else
		formatText TextName = hours_text qs(0xda06b2ab) h = <hours>
	endif
	switch (<mode>)
		case minutes_seconds_ms
		formatText TextName = formatted_time qs(0xe4a7f04c) n = <sign> m = <minutes_text> s = <seconds_text> f = <ms_text>
		case hours_minutes_seconds
		formatText TextName = formatted_time qs(0xa6c71ba1) n = <sign> h = <hours_text> m = <minutes_text> s = <seconds_text>
		case hours_minutes_seconds_ms
		formatText TextName = formatted_time qs(0x6af264de) n = <sign> h = <hours_text> m = <minutes_text> s = <seconds_text> f = <ms_text>
		default
		formatText \{TextName = formatted_time
			qs(0x03ac90f0)}
	endswitch
	return formatted_time = <formatted_time>
endscript

script autotest_write_song_data_to_file 
	autotest_get_test \{suite_num = $autotest_suite_index
		test_num = $autotest_test_index}
	autotest_get_suite \{suite_num = $autotest_suite_index
		fromsuitelist}
	formatText TextName = FileName '%s_test%t_stats' s = <suite_name> t = ($autotest_test_index) donotresolve DontAssertForChecksums
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
		formatText TextName = text qs(0x7ae4314a) p = <percent_under_15ms> f = ($autotest_gpu_under_15ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		formatText TextName = text qs(0x29f6586b) p = <percent_15ms16ms> f = ($autotest_gpu_15ms_to_16ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		formatText TextName = text qs(0x8315ca36) p = <percent_16ms18ms> f = ($autotest_gpu_16ms_to_18ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		formatText TextName = text qs(0x7a922000) p = <percent_18ms20ms> f = ($autotest_gpu_18ms_to_20ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		formatText TextName = text qs(0x0b4b04b9) p = <percent_over_20ms> f = ($autotest_gpu_over_20ms) t = ($autotest_gpu_total_frames)
		TextOutput text = <text>
		autotest_format_time time = ($autotest_gpu_spike_time) mode = minutes_seconds_ms
		formatText TextName = text qs(0x74b58814) g = ($autotest_gpu_spike) t = <formatted_time>
		TextOutput text = <text>
		TextOutput \{text = qs(0x03ac90f0)}
		<i> = 0
		begin
		autotest_format_time time = ($autotest_worst_cam_times [<i>]) mode = minutes_seconds_ms
		formatText TextName = text qs(0x299b069d) c = ($autotest_worst_cam_strings [<i>]) m = ($autotest_worst_cam_ms [<i>]) t = <formatted_time>
		TextOutput text = <text>
		<i> = (<i> + 1)
		repeat $autotest_num_worst_cams
		TextOutput \{text = qs(0x03ac90f0)}
	endif
	<song_struct> = ($permanent_songlist_props.(<test_struct>.song))
	<song_string> = (<song_struct>.title)
	formatText TextName = text qs(0x73307931) s = <song_string>
	TextOutput text = <text>
	<venue_struct> = ($LevelZones.(<test_struct>.venue))
	<venue_string> = (<venue_struct>.title)
	formatText TextName = text qs(0x0e478d74) v = <venue_string>
	TextOutput text = <text>
	<Player> = 1
	begin
	formatText checksumName = player_part 'p%n_part' n = <Player>
	<part_string> = ($autotest_part_strings.(<test_struct>.<player_part>))
	TextOutput text = <part_string>
	<Player> = (<Player> + 1)
	repeat 4
	<Player> = 1
	begin
	formatText checksumName = player_diff 'p%n_difficulty' n = <Player>
	<diff_string> = ($autotest_difficulty_strings.(<test_struct>.<player_diff>))
	TextOutput text = <diff_string>
	<Player> = (<Player> + 1)
	repeat 4
	formatText TextName = text qs(0x73307931) s = (<test_struct>.start_power_always_on)
	TextOutput text = <text>
	<mode_string> = ($autotest_game_mode_names.(<test_struct>.game_mode))
	TextOutput text = <mode_string>
	formatText TextName = text qs(0x175cbc35) w = (<test_struct>.worst_case_band)
	TextOutput text = <text>
	if StructureContains structure = <test_struct> start_time
		formatText TextName = text qs(0x73307931) s = (<test_struct>.start_time)
	else
		formatText \{TextName = text
			qs(0x73307931)
			s = qs(0x431892ee)}
	endif
	TextOutput text = <text>
	if StructureContains structure = <test_struct> end_time
		formatText TextName = text qs(0x6fa8cce6) e = (<test_struct>.end_time)
	else
		formatText \{TextName = text
			qs(0x6fa8cce6)
			e = qs(0x449293a1)}
	endif
	TextOutput text = <text>
	if StructureContains structure = <test_struct> speed_factor
		formatText TextName = text qs(0x73307931) s = (<test_struct>.speed_factor)
	else
		formatText \{TextName = text
			qs(0x73307931)
			s = 1.0}
	endif
	TextOutput text = <text>
	TextOutputEnd output_text FileName = <FileName>
endscript

script autotest_write_end_file 
	autotest_get_suite \{suite_num = $autotest_suite_index}
	formatText \{TextName = FileName
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
		autotest_get_suite suite_num = <i> fromsuitelist
		formatText TextName = text qs(0x73307931) s = <suite_name> donotresolve DontAssertForChecksums
		TextOutput text = <text>
		<i> = (<i> + 1)
		repeat <array_Size>
	else
		autotest_get_suite
		formatText TextName = text qs(0x73307931) s = <suite_name> donotresolve DontAssertForChecksums
		TextOutput text = <text>
	endif
	output_camera_sync_warnings
	TextOutputEnd output_text FileName = <FileName>
endscript

script autotest_autolaunch \{suite_index = -1
		suite_name = None
		hud_on = 0
		log_gpu = 0}
	Change autotest_log_gpu = <log_gpu>
	if ((<suite_index> < 0) && (suite_name = None))
		ScriptAssert \{qs(0x2fc0ebd2)}
	endif
	SpawnScriptNow autotest_autolaunch_delay params = {suite_index = <suite_index> suite_name = <suite_name> hud_on = <hud_on>}
endscript

script autotest_autolaunch_delay 
	Change \{show_gpu_time = 1}
	Change \{skip_signin = 1}
	Change \{autotest_on = 1}
	Change autotest_suite_index = <suite_index>
	Change autotest_suite_name = <suite_name>
	Change \{autotest_test_index = 0}
	Change autotest_hud_on = <hud_on>
	Change \{autolaunch_startnow = 0}
	Change \{autotest_restore_globals = 1}
	begin
	if ScreenElementExists \{id = current_menu}
		break
	endif
	Wait \{1
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
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = motdinterface}
		LaunchEvent \{Type = unfocus
			target = motdinterface}
	endif
	autotest_start \{autolaunch = 1}
endscript
