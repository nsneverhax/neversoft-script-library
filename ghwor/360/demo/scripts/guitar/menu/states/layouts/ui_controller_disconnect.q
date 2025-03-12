g_controller_unplugged_dialog_up = 0
controller_unplugged_frame_count = 30
control_dis_paused = 0
unknown_drum_type = 0
g_enable_pause_for_drum_type_missmatch = 0

script ui_init_controller_disconnect 
	if ($is_network_game)
		enableallinput \{off}
	endif
	change \{g_controller_unplugged_dialog_up = 1}
endscript

script ui_create_controller_disconnect 
	change \{g_enable_pause_for_drum_type_missmatch = 0}
	disable_pause
	getnumplayersingame
	device_array = []
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> controller
		addarrayelement array = <device_array> element = <controller>
		<device_array> = <array>
		getnextplayer player = <player>
		repeat <num_players>
	endif
	<continue_text> = qs(0x182f0173)
	if ($g_in_tutorial = 1)
		<continue_text> = qs(0x9c8bd769)
	endif
	continue_enabled = 1
	if ($is_network_game = 1)
		ui_controller_disconnect_update \{no_text}
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
		if screenelementexists \{id = tutorial_main}
			launchevent \{type = unfocus
				target = tutorial_main}
		endif
	endif
	if ($calibrate_lag_enabled = 1)
		if ($calibrate_highway_state = menu)
			if screenelementexists \{id = generic_barrel_vmenu}
				launchevent \{type = unfocus
					target = generic_barrel_vmenu}
			endif
		else
			if screenelementexists \{id = calibrate_highway_events_container}
				launchevent \{type = unfocus
					target = calibrate_highway_events_container}
			endif
		endif
	endif
	if ($end_credits = 0)
		<element> = {
			func = ui_controller_disconnect_return_to_main_menu
			text = qs(0x67d9c56d)
			sound_func = nullscript
		}
		addarrayelement array = <options_array> element = <element>
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
		template = standard
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
		dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
		player_device = <device_array>
		use_all_controllers = <use_all_controllers>
		update_net_controllers = 0
	}
	dialog_box_desc_id :settags \{connected = 0}
	if ($in_band_lobby != 1)
		if screenelementexists \{id = dialog_box_vmenu}
			dialog_box_vmenu :obj_spawnscript \{ui_controller_disconnect_pause}
		endif
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :obj_spawnscript \{ui_controller_disconnect_update}
		endif
	endif
	clean_up_user_control_helpers
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (($sys_fade_overlay_z_priority) + 1000) all_buttons
	startrendering
endscript

script ui_destroy_controller_disconnect 
	destroy_dialog_box
endscript

script ui_deinit_controller_disconnect 
	if ($is_network_game)
		enableallinput
	endif
	change \{g_controller_unplugged_dialog_up = 0}
endscript

script ui_controller_disconnect_pause 
	ui_event_wait_for_safe
	if NOT gameispaused
		if NOT ($is_network_game)
			gh_pause_game
			generic_barrel_menu_unpause_all_items
		endif
		change \{control_dis_paused = 1}
	elseif ($paused_for_hardware = 1)
		change \{control_dis_paused = 1}
	endif
endscript

script ui_controller_disconnect_unfocus_menus 
	if screenelementexists \{id = menu_tutorial}
		launchevent \{type = unfocus
			target = menu_tutorial}
	endif
	if screenelementexists \{id = calibrate_highway_events_container}
		launchevent \{type = unfocus
			target = calibrate_highway_events_container}
	endif
endscript

script ui_controller_disconnect_update 
	setscriptcannotpause
	ui_controller_disconnect_unfocus_menus
	old_text = qs(0x03ac90f0)
	begin
	removeparameter \{array_size}
	getarraysize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		if NOT gotparam \{no_text}
			getsingletag \{connected}
			if gotparam \{connected}
				settags \{connected = 0}
			endif
		endif
		text = qs(0xfbc815c6)
		i = 0
		begin
		removeparameter \{part}
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			removeparameter \{controller}
			getplayerinfo <player> controller
			if (<controller> = ($sysnotify_paused_controllers [<i>]))
				getplayerinfo <player> part
				break
			endif
			getnextplayer player = <player> local
			repeat <num_players>
		endif
		<j> = <player>
		if gotparam \{part}
			if ((<part> = guitar) || (<part> = bass))
				if ($calibrate_lag_enabled = 0)
					formattext textname = text qs(0x2e301f7d) t = <text> j = <j>
				else
					if isps3
						formattext textname = text qs(0x766cf4b1) t = <text> j = <j>
					else
						formattext textname = text qs(0x046f071b) t = <text> j = <j>
					endif
				endif
			endif
			if (<part> = drum)
				getplayerinfo <j> four_lane_highway
				if (<four_lane_highway> = 1)
					formattext textname = text qs(0x43606ed7) t = <text> j = <j>
				elseif (<four_lane_highway> = 0)
					formattext textname = text qs(0xb2af53e5) t = <text> j = <j> g = $guitar_hero_registered_string
				endif
			endif
			if (<part> = vocals)
				getplayerinfo <j> mic_connected
				if isxenonorwindx
					getplayerinfo <j> mic_type
					switch <mic_connected>
						case mic_disconnected
						if (<mic_type> = headset)
							formattext textname = text qs(0x27139544) t = <text> j = <j>
						else
							formattext textname = text qs(0xa8485a04) t = <text> j = <j>
						endif
						case both_disconnected
						if (<mic_type> = headset)
							formattext textname = text qs(0x4ce06e3a) t = <text> j = <j>
						else
							formattext textname = text qs(0xe6d2b7f0) t = <text> j = <j>
						endif
						case controller_disconnected
						default
						formattext textname = text qs(0x773068f3) t = <text> j = <j>
					endswitch
				else
					switch <mic_connected>
						case mic_disconnected
						formattext textname = text qs(0xa8485a04) t = <text> j = <j>
						case both_disconnected
						formattext textname = text qs(0xcac47d52) t = <text> j = <j>
						case controller_disconnected
						default
						formattext textname = text qs(0xafdb2bc9) t = <text> j = <j>
					endswitch
				endif
			endif
		endif
		if isps3
			formattext textname = text qs(0x09536fe2) t = <text> d = (<controller> + 1)
		endif
		i = (<i> + 1)
		repeat <array_size>
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :se_setprops \{dlog_body_internal_scale = (0.45000002, 0.45000002)}
		endif
	else
		if NOT gotparam \{no_text}
			getsingletag \{connected}
			if gotparam \{connected}
				if (<connected> = 0)
					settags \{connected = 1}
					if screenelementexists \{id = dialog_box_vmenu}
						launchevent \{type = unfocus
							target = dialog_box_vmenu}
						launchevent \{type = focus
							target = dialog_box_vmenu}
					endif
				endif
			endif
		endif
		if screenelementexists \{id = dialog_box_desc_id}
			dialog_box_desc_id :se_setprops \{dlog_body_internal_scale = (0.55, 0.55)}
		endif
		text = qs(0x6c92395c)
	endif
	if NOT gotparam \{no_text}
		if NOT (<old_text> = <text>)
			se_setprops {dlog_body_text = <text>}
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
				getarraysize \{$sysnotify_paused_controllers}
				if NOT (<array_size> = 0)
					ui_sfx \{menustate = generic
						uitype = scrollendwarning}
					return
				endif
			else
				vocals_distribute_mics
				change \{vocal_mic_invalid_dist = 1}
				if NOT vocals_mic_distribution_is_valid
					ui_sfx \{menustate = generic
						uitype = scrollendwarning}
					return
				endif
			endif
		endif
		getfirstplayer \{local}
		begin
		if (<player> = -1)
			return
		endif
		getplayerinfo <player> controller out = player_controller
		if (<player_controller> = <device_num>)
			break
		endif
		getnextplayer player = <player> local
		repeat
	endif
	change \{check_for_unplugged_controllers = 1}
	vocals_set_mics_to_user_volumes
	if ($g_in_tutorial = 1)
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_replace state = uistate_pausemenu_restart_warning data = {
			cancel_func = ui_controller_disconnect_return_to_menu
			is_popup
			dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
			player_device = <device_num>
		}
	elseif ($calibrate_lag_enabled = 1)
		gh_unpause_game
		change \{pause_grace_period = -1.0}
		resumecontrollerchecking
		change \{sysnotify_paused_controllers = [
			]}
		generic_event_back
	else
		if ($control_dis_paused = 1)
			if ($playing_song = 0)
				gh_unpause_game
				change \{pause_grace_period = -1.0}
			endif
			change \{control_dis_paused = 0}
		endif
		if ($playing_song = 1)
			in_musicstudio = false
			if musicstudio_mainobj :musicstudio_isinmusicstudio
				in_musicstudio = true
			endif
			if ($vocal_mic_invalid_dist > 0 && <in_musicstudio> = false)
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					ui_sfx \{menustate = generic
						uitype = select}
					generic_event_replace {
						state = uistate_pausemenu_restart_warning
						data = {
							is_popup
							cancel_func = generic_event_replace
							cancel_func_params = {state = uistate_controller_disconnect data = {is_popup}}
							dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
						}
					}
				endif
			elseif NOT verify_connected_in_game_drum_controllers
				printf \{channel = zdebug
					qs(0x7f760478)}
				if ($is_network_game)
					ui_controller_disconnect_return_to_main_menu device_num = <device_num>
				else
					gamemode_gettype
					if (<type> = competitive)
						ui_controller_disconnect_return_to_main_menu device_num = <device_num>
					else
						change \{g_enable_pause_for_drum_type_missmatch = 1}
						ui_sfx \{menustate = generic
							uitype = select}
						generic_event_replace {
							state = uistate_pausemenu_restart_warning
							data = {
								is_popup
								cancel_func = generic_event_replace
								cancel_func_params = {state = uistate_controller_disconnect data = {is_popup}}
								dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
							}
						}
					endif
				endif
			elseif ui_event_exists_in_stack \{above = 'gameplay'
					name = 'pausemenu'}
				ui_sfx \{menustate = generic
					uitype = back}
				generic_event_back
			else
				getglobaltags \{user_options
					param = unpause_count}
				restart_song_state = uistate_song_unpause
				ui_sfx \{menustate = generic
					uitype = select}
				generic_event_replace state = <restart_song_state>
			endif
		else
			if ($in_band_lobby = 1)
				change \{g_suppress_anim_in = 1}
			endif
			ui_sfx \{menustate = generic
				uitype = back}
			generic_event_back
		endif
	endif
	change \{control_dis_paused = 0}
endscript

script controller_discon_cleanup_stuff 
	killspawnedscript \{name = audio_crowd_play_loading_screen_swell}
	killspawnedscript \{name = audio_crowd_loading_whistle}
	killspawnedscript \{name = audio_crowd_play_one_shots_between_songs}
	killspawnedscript \{name = audio_crowd_play_surge_between_songs}
	killspawnedscript \{name = create_exploding_text}
	destroy_all_exploding_text
	stopsoundsbybuss \{crowd_one_shots}
	stopsoundsbybuss \{encore_events}
	kill_intro_celeb_ui
	change \{control_dis_paused = 0}
endscript

script controller_discon_selected_quit 
	controller_discon_cleanup_stuff
	if demobuild
		if compositeobjectexists \{calibrationinterface}
			calibrate_highway_shutdown
		endif
		ui_sfx \{menustate = generic
			uitype = select}
		kill_gem_scroller
		ui_event_wait_for_safe
		ui_event \{event = menu_replace
			data = {
				state = uistate_mainmenu
				clear_previous_stack
				signin_change
			}}
	elseif ($g_in_tutorial = 1)
		quit_warning_select_quit
	else
		song_ended_menu_select_quit \{use_quit_early = 1}
	endif
endscript

script ui_controller_disconnect_return_to_main_menu 
	requireparams \{[
			device_num
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	change last_start_pressed_device = <device_num>
	if ($g_in_tutorial = 1)
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_replace state = uistate_pausemenu_quit_warning data = {
			option1_func = ui_controller_disconnect_return_to_menu
			option2_func = controller_discon_selected_quit
			is_popup
			dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
			disconnect_dialog = 1
		}
	else
		generic_event_replace state = uistate_pausemenu_quit_warning data = {
			option1_func = ui_controller_disconnect_return_to_menu
			option2_func = controller_discon_selected_quit
			is_popup
			dlg_z_priority = (($sys_fade_overlay_z_priority) + 100)
			disconnect_dialog = 1
		}
	endif
endscript

script ui_controller_disconnect_return_to_menu 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	ui_sfx \{menustate = generic
		uitype = select}
	se_setprops \{block_events}
	generic_event_replace \{state = uistate_controller_disconnect
		data = {
			is_popup
		}}
endscript

script verify_connected_in_game_drum_controllers 
	<return_val> = 1
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <player> part = drum
			getplayerinfo <player> controller
			if playerinfoequals <player> four_lane_highway = 0
				if isrbdrum controller = <controller>
					<return_val> = 0
					change \{unknown_drum_type = 1}
				endif
			else
				if NOT isrbdrum controller = <controller>
					<return_val> = 0
					change \{unknown_drum_type = 1}
				endif
			endif
		endif
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	if (<return_val> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript
