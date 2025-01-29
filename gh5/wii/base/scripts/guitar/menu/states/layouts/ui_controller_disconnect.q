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

script ui_init_controller_disconnect 
	if ($is_network_game)
		enableallinput \{OFF}
	endif
endscript

script ui_create_controller_disconnect 
	formatText \{checksumName = dialog_box_container
		'dialog_box_container'}
	if ScreenElementExists id = <dialog_box_container>
		return
	endif
	disable_pause
	getnumplayersingame
	device_array = []
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> controller
		AddArrayElement array = <device_array> element = <controller>
		<device_array> = <array>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
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
	if GotParam \{from_roadie_battle_choose_sides}
		<continue_enabled> = 0
	endif
	if (<continue_enabled> = 1)
		<options_array> = [
			{
				func = ui_controller_disconnect_continue
				text = <continue_text>
				sound_func = nullscript
				not_focusable_hack
			}
		]
	else
		<options_array> = []
	endif
	if ($g_in_tutorial = 1)
		if ScreenElementExists \{id = tutorial_main}
			LaunchEvent \{Type = unfocus
				target = tutorial_main}
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		if ($calibrate_highway_state = menu)
			LaunchEvent \{Type = unfocus
				target = generic_barrel_vmenu}
		else
			LaunchEvent \{Type = unfocus
				target = calibrate_highway_events_container}
		endif
	endif
	if ($end_credits = 0)
		if is_roadie_battle_mode
			<quit_func> = song_ended_menu_select_quit
		else
			<quit_func> = ui_controller_disconnect_return_to_main_menu
		endif
		<element> = {
			func = <quit_func>
			text = qs(0x67d9c56d)
			sound_func = nullscript
		}
		AddArrayElement array = <options_array> element = <element>
		<options_array> = <array>
	endif
	if ($in_band_lobby = 1)
		text = qs(0xa171c713)
		template = standard
		if GotParam \{from_roadie_battle_choose_sides}
			<options_array> = [
				{
					func = song_ended_menu_select_quit
					text = qs(0x67d9c56d)
					sound_func = nullscript
				}
			]
			use_all_controllers = 1
		else
			<options_array> = [
				{
					func = ui_controller_disconnect_continue
					text = qs(0x0e41fe46)
					sound_func = nullscript
				}
			]
			use_all_controllers = 1
		endif
	else
		text = qs(0x00000000)
		template = extended
	endif
	create_dialog_box {
		template = <template>
		no_background
		heading_text = qs(0xaa163738)
		body_text = <text>
		options = <options_array>
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		player_device = <device_array>
		use_all_controllers = <use_all_controllers>
	}
	dialog_box_desc_id :SetTags \{connected = 0}
	if GotParam \{from_roadie_battle_choose_sides}
		dialog_box_vmenu :obj_spawnscript \{ui_controller_disconnect_pause}
		dialog_box_desc_id :obj_spawnscript \{ui_roadie_battle_choose_sides_controller_disconnect_update}
	elseif ($in_band_lobby != 1)
		dialog_box_vmenu :obj_spawnscript \{ui_controller_disconnect_pause}
		dialog_box_desc_id :obj_spawnscript \{ui_controller_disconnect_update}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1000000}
endscript

script ui_destroy_controller_disconnect 
	destroy_dialog_box
	if GotParam \{from_roadie_battle_choose_sides}
		LaunchEvent \{Type = focus
			target = ds_event_listener}
	endif
	Change \{roadie_battle_in_controller_disconnected_popup = 0}
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

script ui_controller_disconnect_unfocus_menus 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
	endif
	if ScreenElementExists \{id = calibrate_highway_events_container}
		LaunchEvent \{Type = unfocus
			target = calibrate_highway_events_container}
	endif
endscript

script ui_controller_disconnect_update 
	setscriptcannotpause
	SetButtonEventMappings \{unblock_menu_input}
	ui_controller_disconnect_unfocus_menus
	old_text = qs(0x03ac90f0)
	begin
	if ($is_network_game)
		enableallinput \{OFF}
	endif
	RemoveParameter \{array_Size}
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_Size> > 0)
		if NOT GotParam \{no_text}
			GetSingleTag \{connected}
			if GotParam \{connected}
				if (<connected> = 1)
					if ScreenElementExists \{id = dialog_box_vmenu}
						ui_controller_disconnect_disable_continue
						LaunchEvent \{Type = unfocus
							target = dialog_box_vmenu}
						LaunchEvent \{Type = focus
							target = dialog_box_vmenu}
					endif
				endif
				SetTags \{connected = 0}
			endif
		endif
		text = qs(0xfbc815c6)
		i = 0
		begin
		RemoveParameter \{part}
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			RemoveParameter \{controller}
			getplayerinfo <Player> controller
			if (<controller> = ($sysnotify_paused_controllers [<i>]))
				getplayerinfo <Player> part
				break
			endif
			getnextplayer Player = <Player> local
			repeat <num_players>
		endif
		if is_roadie_battle_mode
			<j> = (<controller> + 1)
		else
			<j> = <Player>
		endif
		if GotParam \{part}
			if ((<part> = guitar) || (<part> = bass))
				if ($calibrate_lag_enabled = 0)
					formatText TextName = text qs(0x2e301f7d) t = <text> j = <j>
				else
					if isps3
						formatText TextName = text qs(0x766cf4b1) t = <text> j = <j>
					elseif isngc
						formatText TextName = text qs(0xc0f6bdb6) t = <text> j = <j>
					else
						formatText TextName = text qs(0x046f071b) t = <text> j = <j>
					endif
				endif
			endif
			if (<part> = drum)
				if ($calibrate_lag_enabled = 1)
					formatText TextName = text qs(0xc0f6bdb6) t = <text> j = <j>
				else
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
				if ($calibrate_lag_enabled = 1)
					formatText TextName = text qs(0xc0f6bdb6) t = <text> j = <j>
				else
					if isxenonorwindx
						getplayerinfo <j> mic_type
						switch <mic_connected>
							case mic_disconnected
							if (<mic_type> = headset)
								formatText TextName = text qs(0x27139544) t = <text> j = <j>
							else
								formatText TextName = text qs(0x069db0b9) t = <text> j = <j>
							endif
							case both_disconnected
							if (<mic_type> = headset)
								formatText TextName = text qs(0x21036be5) t = <text> j = <j>
							else
								formatText TextName = text qs(0x80c86672) t = <text> j = <j>
							endif
							case controller_disconnected
							default
							formatText TextName = text qs(0x773068f3) t = <text> j = <j>
						endswitch
					else
						switch <mic_connected>
							case mic_disconnected
							formatText TextName = text qs(0x069db0b9) t = <text> j = <j>
							case both_disconnected
							formatText TextName = text qs(0xb787511b) t = <text> j = <j>
							case controller_disconnected
							default
							formatText TextName = text qs(0x0bf470d1) t = <text> j = <j>
						endswitch
					endif
				endif
			endif
		endif
		if isps3
			formatText TextName = text qs(0x09536fe2) t = <text> d = (<controller> + 1)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		if NOT GotParam \{no_text}
			GetSingleTag \{connected}
			if GotParam \{connected}
				if (<connected> = 0)
					SetTags \{connected = 1}
					if ScreenElementExists \{id = dialog_box_vmenu}
						LaunchEvent \{Type = unfocus
							target = dialog_box_vmenu}
						LaunchEvent \{Type = focus
							target = dialog_box_vmenu}
						ui_controller_disconnect_enable_continue
					endif
				endif
			endif
		endif
		text = qs(0x6c92395c)
	endif
	if NOT GotParam \{no_text}
		if NOT (<old_text> = <text>)
			clean_up_user_control_helpers
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 1000000
				all_buttons}
			se_setprops {dlog_body_text = <text>}
			old_text = <text>
		endif
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_controller_disconnect_disable_continue 
	printf \{qs(0x7bc5d386)}
	GetScreenElementChildren \{id = dialog_box_vmenu}
	GetArraySize <children>
	if (<array_Size> > 0)
		(<children> [0]) :se_getprops menurow_txt_item_text
		if GotParam \{menurow_txt_item_text}
			if (<menurow_txt_item_text> = qs(0x182f0173) || <menurow_txt_item_text> = qs(0x9c8bd769))
				LaunchEvent \{Type = unfocus
					target = {
						dialog_box_vmenu
						child = 0
					}}
				LaunchEvent \{Type = focus
					target = {
						dialog_box_vmenu
						child = 1
					}}
				(<children> [0]) :se_setprops {
					not_focusable
				}
			endif
		endif
	endif
endscript

script ui_controller_disconnect_enable_continue 
	printf \{qs(0x247cc594)}
	GetScreenElementChildren \{id = dialog_box_vmenu}
	GetArraySize <children>
	if (<array_Size> > 0)
		(<children> [0]) :se_getprops menurow_txt_item_text
		if GotParam \{menurow_txt_item_text}
			if (<menurow_txt_item_text> = qs(0x182f0173) || <menurow_txt_item_text> = qs(0x9c8bd769))
				(<children> [0]) :se_setprops {
					focusable
				}
				LaunchEvent \{Type = unfocus
					target = {
						dialog_box_vmenu
						child = 1
					}}
				LaunchEvent \{Type = focus
					target = {
						dialog_box_vmenu
						child = 0
					}}
			endif
		endif
	endif
endscript

script ui_controller_disconnect_continue 
	if ($in_band_lobby = 0)
		if ($allow_controller_for_all_instruments = 0)
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
		endif
	endif
	Change \{check_for_unplugged_controllers = 1}
	vocals_set_mics_to_user_volumes
	if ($g_in_tutorial = 1)
		generic_event_replace \{state = uistate_pausemenu_restart_warning
			data = {
				cancel_func = ui_controller_disconnect_return_to_menu
				is_popup
			}}
	elseif ($calibrate_lag_enabled = 1)
		do_gh3_unpause
		generic_event_back
	else
		if ($control_dis_paused = 1)
			if ($playing_song = 0)
				do_gh3_unpause
			endif
			Change \{control_dis_paused = 0}
		endif
		if ($playing_song = 1)
			in_musicstudio = FALSE
			if musicstudio_mainobj :musicstudio_isinmusicstudio
				in_musicstudio = true
			endif
			if ($vocal_mic_invalid_dist > 0 && <in_musicstudio> = FALSE)
				if ($is_network_game)
					generic_event_back
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
					generic_event_back
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
	RequireParams \{[
			device_num
		]
		all}
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
		generic_event_replace \{state = uistate_pausemenu_quit_warning
			data = {
				option1_func = ui_controller_disconnect_return_to_menu
				option2_func = quit_warning_select_quit
				is_popup
			}}
		StartRendering
	else
		generic_event_replace \{state = uistate_pausemenu_quit_warning
			data = {
				option1_func = ui_controller_disconnect_return_to_menu
				option2_func = song_ended_menu_select_quit
				option2_func_params = {
					use_quit_early = 1
				}
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
