unplugged_controller = -1
controller_unplugged_frame_count = 30
control_dis_paused = 0
unknown_drum_type = 0

script ui_init_controller_disconnect 
	if ($is_network_game)
		EnableAllInput \{off}
	endif
endscript

script ui_create_controller_disconnect 
	disable_pause
	GetNumPlayersInGame
	device_array = []
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> controller
		AddArrayElement array = <device_array> element = <controller>
		<device_array> = <array>
		GetNextPlayer player = <player>
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
		if ScreenElementExists \{id = tutorial_main}
			LaunchEvent \{type = unfocus
				target = tutorial_main}
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		if ($calibrate_highway_state = Menu)
			LaunchEvent \{type = unfocus
				target = generic_barrel_vmenu}
		else
			LaunchEvent \{type = unfocus
				target = calibrate_highway_events_container}
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
	if ($in_band_lobby = 1)
		text = qs(0xa171c713)
		template = standard
		<options_array> = [
			{
				func = ui_controller_disconnect_continue
				text = qs(0x0e41fe46)
				sound_func = nullscript
			}
		]
		use_all_controllers = 1
	else
		text = qs(0x00000000)
		template = extended
	endif
	if ($calibrate_lag_enabled = 0)
		use_all_controllers = 1
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
	if ($in_band_lobby != 1)
		if ScreenElementExists \{id = dialog_box_vmenu}
			dialog_box_vmenu :Obj_SpawnScript \{ui_controller_disconnect_pause}
		endif
		if ScreenElementExists \{id = dialog_box_desc_id}
			dialog_box_desc_id :Obj_SpawnScript \{ui_controller_disconnect_update}
		endif
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1000000
		all_buttons
		all_buttons}
	StartRendering
endscript

script ui_destroy_controller_disconnect 
	destroy_dialog_box
endscript

script ui_deinit_controller_disconnect 
	if ($is_network_game)
		EnableAllInput
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
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
	endif
	if ScreenElementExists \{id = calibrate_highway_events_container}
		LaunchEvent \{type = unfocus
			target = calibrate_highway_events_container}
	endif
endscript

script ui_controller_disconnect_update 
	SetScriptCannotPause
	ui_controller_disconnect_unfocus_menus
	old_text = qs(0x03ac90f0)
	begin
	RemoveParameter \{array_size}
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		if NOT GotParam \{no_text}
			GetSingleTag \{connected}
			if GotParam \{connected}
				SetTags \{connected = 0}
			endif
		endif
		text = qs(0xfbc815c6)
		i = 0
		begin
		RemoveParameter \{part}
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer \{local}
			begin
			RemoveParameter \{controller}
			GetPlayerInfo <player> controller
			if (<controller> = ($sysnotify_paused_controllers [<i>]))
				GetPlayerInfo <player> part
				break
			endif
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
		<j> = <player>
		if GotParam \{part}
			if ((<part> = guitar) || (<part> = bass))
				if ($calibrate_lag_enabled = 0)
					FormatText TextName = text qs(0x2e301f7d) t = <text> j = <j>
				else
					if IsPS3
						FormatText TextName = text qs(0x766cf4b1) t = <text> j = <j>
					else
						FormatText TextName = text qs(0x046f071b) t = <text> j = <j>
					endif
				endif
			endif
			if (<part> = Drum)
				if (($unknown_drum_type) = 1)
					FormatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
					UseFourLaneHighway player = <j> reset
				else
					GetPlayerInfo <j> four_lane_highway
					if (<four_lane_highway> = 1)
						FormatText TextName = text qs(0x43606ed7) t = <text> j = <j>
					elseif (<four_lane_highway> = 0)
						FormatText TextName = text qs(0x35c306d4) t = <text> j = <j>
					else
						FormatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
						Change \{unknown_drum_type = 1}
						UseFourLaneHighway player = <j> reset
					endif
				endif
			endif
			if (<part> = vocals)
				GetPlayerInfo <j> mic_connected
				if IsXenonOrWinDX
					GetPlayerInfo <j> mic_type
					switch <mic_connected>
						case mic_disconnected
						if (<mic_type> = headset)
							FormatText TextName = text qs(0x27139544) t = <text> j = <j>
						else
							FormatText TextName = text qs(0xa8485a04) t = <text> j = <j>
						endif
						case both_disconnected
						if (<mic_type> = headset)
							FormatText TextName = text qs(0x21036be5) t = <text> j = <j>
						else
							FormatText TextName = text qs(0x0a21e4b1) t = <text> j = <j>
						endif
						case controller_disconnected
						default
						FormatText TextName = text qs(0x773068f3) t = <text> j = <j>
					endswitch
				else
					switch <mic_connected>
						case mic_disconnected
						FormatText TextName = text qs(0xa8485a04) t = <text> j = <j>
						case both_disconnected
						FormatText TextName = text qs(0xf730fcaf) t = <text> j = <j>
						case controller_disconnected
						default
						FormatText TextName = text qs(0xafdb2bc9) t = <text> j = <j>
					endswitch
				endif
			endif
		endif
		if IsPS3
			FormatText TextName = text qs(0x09536fe2) t = <text> d = (<controller> + 1)
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		if NOT GotParam \{no_text}
			GetSingleTag \{connected}
			if GotParam \{connected}
				if (<connected> = 0)
					SetTags \{connected = 1}
					if ScreenElementExists \{id = dialog_box_vmenu}
						LaunchEvent \{type = unfocus
							target = dialog_box_vmenu}
						LaunchEvent \{type = focus
							target = dialog_box_vmenu}
					endif
				endif
			endif
		endif
		text = qs(0x6c92395c)
	endif
	if NOT GotParam \{no_text}
		if NOT (<old_text> = <text>)
			SE_SetProps {dlog_body_text = <text>}
			old_text = <text>
		endif
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_controller_disconnect_continue 
	if ($in_band_lobby = 0)
		if ($allow_controller_for_all_instruments = 0)
			if ($vocal_mic_invalid_dist = 0)
				GetArraySize \{$sysnotify_paused_controllers}
				if NOT (<array_size> = 0)
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
		GetFirstPlayer \{local}
		begin
		if (<player> = -1)
			return
		endif
		GetPlayerInfo <player> controller out = player_controller
		if (<player_controller> = <device_num>)
			break
		endif
		GetNextPlayer player = <player> local
		repeat
	endif
	Change \{check_for_unplugged_controllers = 1}
	vocals_set_mics_to_user_volumes
	if ($g_in_tutorial = 1)
		generic_event_replace state = UIstate_pausemenu_restart_warning data = {
			cancel_func = ui_controller_disconnect_return_to_menu
			is_popup
			dlg_z_priority = ($ps3_fade_overlay_z + 100)
			player_device = <device_num>
		}
	elseif ($calibrate_lag_enabled = 1)
		do_gh3_unpause
		ResumeControllerChecking
		Change \{sysnotify_paused_controllers = [
			]}
		generic_event_back
	else
		if ($control_dis_paused = 1)
			if ($playing_song = 0)
				do_gh3_unpause
			endif
			Change \{control_dis_paused = 0}
		endif
		if ($playing_song = 1)
			in_musicstudio = false
			if musicstudio_mainobj :MusicStudio_IsInMusicStudio
				in_musicstudio = true
			endif
			if ($vocal_mic_invalid_dist > 0 && <in_musicstudio> = false)
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					generic_event_replace {
						state = UIstate_pausemenu_restart_warning
						data = {
							is_popup
							cancel_func = generic_event_replace
							cancel_func_params = {state = UIstate_controller_disconnect data = {is_popup}}
							dlg_z_priority = ($ps3_fade_overlay_z + 100)
						}
					}
				endif
			elseif ($unknown_drum_type = 1)
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					GameMode_GetType
					if (<type> = competitive)
						ui_controller_disconnect_return_to_main_menu device_num = <device_num>
					else
						generic_event_replace {
							state = UIstate_pausemenu_restart_warning
							data = {
								is_popup
								cancel_func = generic_event_replace
								cancel_func_params = {state = UIstate_controller_disconnect data = {is_popup}}
								dlg_z_priority = ($ps3_fade_overlay_z + 100)
							}
						}
					endif
				endif
			elseif ui_event_exists_in_stack \{above = 'gameplay'
					name = 'pausemenu'}
				generic_event_back
			else
				GetGlobalTags \{user_options
					param = unpause_count}
				if (<unpause_count> = 0)
					restart_song_state = uistate_gameplay
					do_gh3_unpause
				else
					restart_song_state = UIstate_song_unpause
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
	killspawnedscript \{name = Loading_Screen_Crowd_Swell}
	killspawnedscript \{name = Crowd_Loading_Whistle}
	killspawnedscript \{name = OneShotsBetweenSongs}
	killspawnedscript \{name = SurgeBetweenSongs}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	StopSoundsByBuss \{Crowd_One_Shots}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	kill_intro_celeb_ui
	SE_SetProps \{block_events}
	Change last_start_pressed_device = <device_num>
	if ($g_in_tutorial = 1)
		generic_event_replace state = UIstate_pausemenu_quit_warning data = {
			option1_func = ui_controller_disconnect_return_to_menu
			option2_func = quit_warning_select_quit
			is_popup
			dlg_z_priority = ($ps3_fade_overlay_z + 100)
		}
	else
		generic_event_replace state = UIstate_pausemenu_quit_warning data = {
			option1_func = ui_controller_disconnect_return_to_menu
			option2_func = song_ended_menu_select_quit
			option2_func_params = {use_quit_early = 1}
			is_popup
			dlg_z_priority = ($ps3_fade_overlay_z + 100)
		}
	endif
endscript

script ui_controller_disconnect_return_to_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	generic_event_replace \{state = UIstate_controller_disconnect
		data = {
			is_popup
		}}
endscript
