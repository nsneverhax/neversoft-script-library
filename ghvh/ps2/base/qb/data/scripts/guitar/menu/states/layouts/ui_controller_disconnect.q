unplugged_controller = -1
controller_unplugged_frame_count = 30
control_dis_paused = 0
unknown_drum_type = 0
band_mode_added_vocalist = 0
player_has_no_controller = [
	0
	0
	0
	0
]

script 0x55214850 
	Player = 0
	begin
	SetArrayElement ArrayName = player_has_no_controller globalarray index = <Player> NewValue = 0
	Player = (<Player> + 1)
	repeat 4
	0xe752bb84
endscript

script 0xe752bb84 
	Player = 0
	begin
	Player = (<Player> + 1)
	repeat 4
endscript

script ui_init_controller_disconnect 
	SpawnScriptNow \{0x226ec8f8}
endscript
0xf8507843 = 0

script 0x226ec8f8 
	setscriptcannotpause
	Change \{0xf8507843 = 1}
	LoadPak \{'pak/ui/controller_disconnect.pak'
		Heap = BottomUpHeap}
	do_gh3_pause
	begin
	if ispakloaded \{'pak/ui/controller_disconnect.pak'
			Heap = BottomUpHeap}
		Change \{0xf8507843 = 0}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	do_gh3_unpause
endscript

script 0x79c6d425 
	Player = 0
	begin
	if ($player_has_no_controller [<Player>])
		return 0x3e8a7a4d = <Player>
	endif
	Player = (<Player> + 1)
	repeat ($current_num_players)
	return \{0x3e8a7a4d = -1}
endscript

script ui_create_controller_disconnect 
	SpawnScriptNow \{0xcbdb5862}
endscript

script 0xcbdb5862 
	begin
	if ($0xf8507843 = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	disable_pause
	device_array = []
	i = 1
	begin
	getplayerinfo <i> controller
	AddArrayElement array = <device_array> element = <controller>
	<device_array> = <array>
	i = (<i> + 1)
	repeat ($current_num_players)
	<continue_text> = qs(0x182f0173)
	if ($g_in_tutorial = 1)
		<continue_text> = qs(0x9c8bd769)
	endif
	continue_enabled = 1
	if ($is_network_game = 1)
		ui_controller_disconnect_update \{no_text}
		if ($unknown_drum_type = 1)
			<continue_enabled> = 0
		endif
	endif
	if (<continue_enabled> = 1)
		<options_array> = [
			{
				func = ui_controller_disconnect_continue
				text = <continue_text>
				sound_func = nullscript
			}
		]
	else
		<options_array> = []
	endif
	if ($g_in_tutorial = 1)
		if ScreenElementExists \{id = popup_warning_container}
			destroy_popup_warning_menu
		endif
	endif
	if ($end_credits = 0)
		<element> = {
			func = ui_controller_disconnect_return_to_main_menu
			text = qs(0x67d9c56d)
			sound_func = nullscript
		}
		AddArrayElement array = <options_array> element = <element>
		<options_array> = <array>
	endif
	text = qs(0x00000000)
	create_popup_warning_menu {
		no_background
		title = qs(0xaa163738)
		textblock = {
			text = <text>
		}
		options = <options_array>
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		player_device = <device_array>
		long
	}
	pu_warning_vmenu :obj_spawnscript \{ui_controller_disconnect_pause}
	popupelement :obj_spawnscript \{ui_controller_disconnect_update}
	clean_up_user_control_helpers
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1000000
		all_buttons}
endscript

script ui_destroy_controller_disconnect 
	destroy_popup_warning_menu
	UnLoadPak \{'pak/ui/controller_disconnect.pak'
		Heap = BottomUpHeap}
endscript

script ui_deinit_controller_disconnect 
	if ($is_network_game)
		enableallinput
	endif
endscript

script ui_controller_disconnect_pause 
	ui_event_wait_for_safe
	if NOT GameIsPaused
		if NOT ($is_network_game)
			do_gh3_pause
		endif
		Change \{control_dis_paused = 1}
	endif
endscript

script ui_controller_disconnect_update 
	setscriptcannotpause
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
	endif
	old_text = qs(0x03ac90f0)
	begin
	RemoveParameter \{array_Size}
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_Size> > 0)
		text = qs(0xfbc815c6)
		i = 0
		begin
		RemoveParameter \{part}
		j = 1
		begin
		RemoveParameter \{controller}
		getplayerinfo <j> controller
		if (<controller> = ($sysnotify_paused_controllers [<i>]))
			getplayerinfo <j> part
			break
		endif
		j = (<j> + 1)
		repeat ($current_num_players)
		if GotParam \{part}
			if ($vocal_mic_invalid_dist = 0)
				if ((<part> = guitar) || (<part> = bass))
					formatText TextName = text qs(0x2e301f7d) t = <text> j = <j>
				endif
				if (<part> = drum)
					if (($unknown_drum_type) = 1)
						formatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
						usefourlanehighway Player = <j> reset
					else
						getplayerinfo <j> four_lane_highway
						if (<four_lane_highway> = 1)
							formatText TextName = text qs(0x43606ed7) t = <text> j = <j>
						elseif (<four_lane_highway> = 0)
							formatText TextName = text qs(0x35c306d4) t = <text> j = <j>
						else
							formatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
							Change \{unknown_drum_type = 1}
							usefourlanehighway Player = <j> reset
						endif
					endif
				endif
			endif
			if (<part> = vocals)
				getplayerinfo <j> mic_connected
				if isXenon
					getplayerinfo <j> mic_type
					switch <mic_connected>
						case mic_disconnected
						if (<mic_type> = headset)
							formatText TextName = text qs(0x27139544) t = <text> j = <j>
						else
							formatText TextName = text qs(0xa8485a04) t = <text> j = <j>
						endif
						case both_disconnected
						if (<mic_type> = headset)
							formatText TextName = text qs(0x21036be5) t = <text> j = <j>
						else
							formatText TextName = text qs(0x0a21e4b1) t = <text> j = <j>
						endif
						case controller_disconnected
						default
						formatText TextName = text qs(0x773068f3) t = <text> j = <j>
					endswitch
				else
					switch <mic_connected>
						case mic_disconnected
						formatText TextName = text qs(0xa8485a04) t = <text> j = <j>
						case both_disconnected
						formatText TextName = text $0xbf4a7e61 t = <text> j = <j>
						case controller_disconnected
						default
						formatText TextName = text $0xbeceae2f t = <text> j = <j>
					endswitch
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		text = qs(0x6c92395c)
	endif
	if NOT GotParam \{no_text}
		if NOT (<old_text> = <text>)
			clean_up_user_control_helpers
			set_user_control_color \{text_rgba = [
					200
					200
					200
					255
				]
				bg_rgba = [
					0
					0
					0
					200
				]}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 1000000
				all_buttons}
			se_setprops {popupbody_text = <text>}
			old_text = <text>
		endif
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_controller_disconnect_continue 
	if ($vocal_mic_invalid_dist = 0)
		GetArraySize \{$sysnotify_paused_controllers}
		if NOT (<array_Size> = 0)
			menu_scroll_end_sound
			return
		endif
	else
		vocals_distribute_mics
		Change \{vocal_mic_invalid_dist = 1}
		if NOT vocals_mic_distribution_is_valid
			menu_scroll_end_sound
			return
		endif
	endif
	Change \{check_for_unplugged_controllers = 1}
	vocals_set_mics_to_user_volumes
	if ($g_in_tutorial = 1)
		do_gh3_unpause
		if ScreenElementExists \{id = training_container}
			DestroyScreenElement \{id = training_container}
		endif
		if ScreenElementExists \{id = jam_band_container}
			DestroyScreenElement \{id = jam_band_container}
		endif
		generic_event_back
		tutorial_restart \{0xd4617269 = 1}
	else
		if ($control_dis_paused = 1)
			if ($playing_song = 0)
				do_gh3_unpause
			endif
			Change \{control_dis_paused = 0}
		endif
		if ($playing_song = 1)
			if ($vocal_mic_invalid_dist > 0)
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					generic_event_replace \{state = uistate_pausemenu_restart_warning
						data = {
							is_popup
							cancel_func = generic_event_replace
							cancel_func_params = {
								state = uistate_controller_disconnect
								data = {
									is_popup
								}
							}
						}}
				endif
			elseif ($unknown_drum_type = 1)
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					generic_event_replace \{state = uistate_pausemenu_restart_warning
						data = {
							is_popup
							cancel_func = generic_event_replace
							cancel_func_params = {
								state = uistate_controller_disconnect
								data = {
									is_popup
								}
							}
						}}
				endif
			elseif ui_event_exists_in_stack \{above = 'gameplay'
					Name = 'pausemenu'}
				generic_event_back
			else
				GetGlobalTags \{user_options
					param = unpause_count}
				if (<unpause_count> = 0)
					Wait \{3
						gameframe}
					restart_song_state = Uistate_gameplay
					do_gh3_unpause
				else
					restart_song_state = uistate_song_unpause
				endif
				generic_event_replace state = <restart_song_state>
			endif
		else
			generic_event_back
		endif
	endif
endscript

script ui_controller_disconnect_return_to_main_menu 

	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	StopSoundsByBuss \{Crowd_One_Shots}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	kill_intro_celeb_ui
	se_setprops \{block_events}
	Change last_start_pressed_device = <device_num>
	if ($g_in_tutorial = 1)
		tutorial_quit \{state = uistate_select_tutorial}
		StartRendering
	else
		generic_event_replace \{state = uistate_pausemenu_quit_warning
			data = {
				option1_func = ui_controller_disconnect_return_to_menu
				option2_func = song_ended_menu_select_quit
				is_popup
			}}
	endif
endscript

script ui_controller_disconnect_return_to_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	generic_event_replace \{state = uistate_controller_disconnect
		data = {
			is_popup
		}}
endscript
