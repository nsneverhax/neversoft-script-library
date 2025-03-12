
script ui_init_band_lobby 
	killspawnedscript \{name = persistent_band_cancel_lobby}
	killspawnedscript \{name = switch_to_no_band_camera}
	stop_venue_effects
	gman_shutdownallgoals
	band_lobby_clear_all_submenu_data
	band_lobby_setup_strings
	getmaxlocalplayers
	controller_index = 0
	begin
	playerinfo = (<controller_index> + 1)
	setplayerinfo <playerinfo> controller = <controller_index>
	controller_index = (<controller_index> + 1)
	repeat <max_players>
	if ($g_lobby_enter_from_main_menu = 1)
		change \{g_lobby_enter_from_main_menu = 0}
		change \{g_online_quit_refresh_band_lobby_hack = 0}
		change \{g_lobby_net_state = local}
		netsessionfunc \{func = removeallcontrollers}
		if ($g_lobby_state != vs)
			persistent_band_force_traditional_band
		endif
		persistent_band_hide_nonvocalist_mics
		band_lobby_attempt_to_join submenu_index = <device_num> device_num = <device_num> from_main_menu
		if gotparam \{error}
			change g_band_lobby_error_msg = <error>
			change g_leader_player_num = (<device_num> + 1)
		else
			netsessionfunc \{func = live_settings_init}
			netsessionfunc \{obj = live_settings
				func = get_settings}
		endif
	endif
endscript

script ui_deinit_band_lobby 
	start_venue_effects
	popdisablerendering \{context = going_into_songlist
		type = unchecked}
	gman_shutdownallgoals
	change \{g_career_search = null}
	changeglobalinteger \{global_name = g_band_lobby_kill_switch
		new_value = 0}
	changeglobalinteger \{global_name = g_leader_player_num
		new_value = -1}
	changeglobalinteger \{global_name = g_net_leader_player_num
		new_value = -1}
	changeglobalinteger \{global_name = g_lobby_invite_flag
		new_value = 0}
	reset_all_player_in_game_status
	reset_all_players_local_client_status
	band_lobby_clear_all_submenu_data
	if ininternetmode
		if NOT ($invite_controller > -1)
			band_lobby_net_cleanup
		endif
	endif
	if ($leaving_lobby_for_mc_error = mc_error_step_2)
		band_lobby_reset_all_chosen_characters \{not_silhouettes}
	else
		band_lobby_reset_all_chosen_characters
	endif
	change \{leaving_lobby_for_mc_error = none}
	change \{g_online_quit_refresh_band_lobby_hack = 0}
	getmaxlocalplayers
	controller_index = 0
	begin
	playerinfo = (<controller_index> + 1)
	setplayerinfo <playerinfo> controller = <controller_index>
	controller_index = (<controller_index> + 1)
	repeat <max_players>
	change \{g_shortcut_data = {
			valid = 0
			shortcut = none
		}}
	persistent_band_force_unique_musicians
endscript

script ui_create_band_lobby 
	disable_pause
	fadetoblack \{off}
	stop_venue_effects
	safe_update_band_characters
	change \{rich_presence_context = presence_menus}
	hide_glitch \{num_frames = 2}
	killcamanim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	scene_swap_do \{name = main}
	get_savegame_from_controller controller = ($primary_controller)
	getpakmancurrent \{map = zones}
	extendcrc <pak> '_TRG_Waypoint_' out = node_prefix
	extendcrc <node_prefix> 'Vocalist_Start' out = node
	change cas_node_name = <node>
	playigccam \{id = modelview_view_cam_id
		name = modelview_view_cam
		viewport = bg_viewport
		lockto = world
		pos = (3.561758, 4.0928774, 12.285821)
		quat = (0.029093998, -0.97165793, 0.132579)
		fov = 72.0
		play_hold = 1
		interrupt_current}
	set_cas_loading_setup \{setup = lobby}
	if NOT ininternetmode
		netsessionfunc \{func = match_init}
		netsessionfunc \{func = friends_init}
	endif
	lightshow_initeventmappings
	lightshow_notingameplay_setmood \{mood = band_lobby}
	startrendering
	band_lobby_set_gamemode_by_state lobby = ($g_lobby_state)
	band_lobby_add_local_players_to_submenus
	band_lobby_add_remote_players_to_submenus
	band_lobby_make_visible_players_mutually_exclusive
	persistent_band_play_all_default_anims
	netsessionfunc \{obj = party
		func = set_party_joinable
		params = {
			joinable = 1
		}}
	mainmenu_kill_song_and_characters
	if scriptexists \{audio_crowd_play_swells_during_stats_screen}
		killspawnedscript \{name = audio_crowd_play_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ($g_lobby_storageselect_return_savegame != -1)
		continue_after_storage_selector_savegame = ($g_lobby_storageselect_return_savegame)
		continue_after_storage_selector_confirm = ($g_lobby_storageselect_return_confirm)
	endif
	change \{g_lobby_storageselect_return_savegame = -1}
	change \{g_lobby_storageselect_return_confirm = false}
	spawnscriptnow \{sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
			fadeintime = 2
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	savegame_async_init
	band_lobby_setup_cameras
	bandmanager_unhideallmusicians
	bandmanager_unhideallinstruments \{force_unhide = 1}
	hide_mic_if_not_vocalist \{name = musician1}
	hide_mic_if_not_vocalist \{name = musician2}
	hide_mic_if_not_vocalist \{name = musician3}
	hide_mic_if_not_vocalist \{name = musician4}
	unhide_mic_if_vocalist \{name = musician1}
	unhide_mic_if_vocalist \{name = musician2}
	unhide_mic_if_vocalist \{name = musician3}
	unhide_mic_if_vocalist \{name = musician4}
	if innetgame
		change \{respond_to_signin_changed = 1}
		change \{respond_to_signin_changed_all_players = 1}
	else
		change \{respond_to_signin_changed = 0}
		change \{respond_to_signin_changed_all_players = 0}
	endif
	change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	if NOT scriptisrunning \{song_breakdown_end_game}
		if NOT scriptisrunning \{song_breakdown_end_game_spawned}
			spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
				end_game_script = band_lobby_end_game}
		endif
	endif
	createscreenelement \{parent = root_window
		id = band_lobby_desc_id
		type = descinterface
		desc = 'band_lobby'
		z_priority = 0.0
		band_lobby_viewport1_pos = (233.0, -625.0)
		band_lobby_viewport2_pos = (504.0, -625.0)
		band_lobby_viewport3_pos = (773.0, -625.0)
		band_lobby_viewport4_pos = (1043.0, -625.0)
		paper_bg_fade_alpha = 1.0
		ticker_alpha = 0.0}
	screenfx_addfxinstance {
		viewport = bg_viewport
		($dof_pausemenublur_tod_manager.screen_fx [0])
	}
	if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
		band_lobby_create_viewport_and_menus {
			viewport_vmenu = <resolved_id>
		}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_remote_players_menu}
		band_lobby_create_submenus_remote {
			remote_players_menu = <resolved_id>
		}
	endif
	band_lobby_desc_id :obj_spawnscriptlater \{attempt_to_add_friend_feed
		params = {
			menu = band_lobby
			parent_id = band_lobby_desc_id
			alpha = 0.0
		}}
	if innetgame
		if screenelementexists \{id = band_lobby_desc_id}
			runscriptonscreenelement \{id = band_lobby_desc_id
				band_lobby_watchdog_all_player_appearance_change}
		endif
	endif
	band_lobby_update_lobby_title
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_update_button_helpers
	gman_shutdownallgoals
	session_stats_reset
	change \{in_band_lobby = 1}
	change \{check_for_unplugged_controllers = 1}
	clear_paused_controllers
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
	restore_idle_faces
	set_cas_loading_setup \{setup = lobby}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
endscript

script ui_destroy_band_lobby 
	set_cas_loading_setup \{setup = hidden}
	savegame_async_deinit
	<i> = 0
	begin
	formattext checksumname = viewport 'band_viewport_%i' i = <i>
	formattext checksumname = viewport_cam 'band_viewport_cam_%i' i = <i>
	screenfx_clearfxinstances viewport = <viewport>
	killcamanim name = <viewport_cam>
	if screenelementexists id = <viewport>
		destroyscreenelement id = <viewport>
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if ($leaving_lobby_for_mc_error = mc_error_step_1)
		change \{leaving_lobby_for_mc_error = mc_error_step_2}
		band_lobby_reset_all_chosen_characters \{not_silhouettes}
	else
		band_lobby_reset_all_chosen_characters
	endif
	if scriptexists \{z_credits_ampzilla_animate}
		z_credits_ampzilla_animate
	endif
	set_all_character_viewports_on
	destroyscreenelement \{id = band_lobby_desc_id}
	screenfx_clearfxinstances \{viewport = bg_viewport}
	tod_proxim_update_lightfx_viewport \{fxparam = $default_tod_manager
		viewport = bg_viewport
		time = 0}
	refresh_venue
	clean_up_user_control_helpers
	vocals_deinit_all_mics
	change \{in_band_lobby = 0}
	change \{check_for_unplugged_controllers = 0}
	change \{g_suppress_anim_in = 0}
endscript

script ui_return_band_lobby 
	band_lobby_desc_id :obj_killspawnedscript \{name = band_lobby_update_mics}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	printf \{qs(0xd3c80918)}
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	vocals_reinit_mics noise_gate = ($band_lobby_noise_gate)
	if screenelementexists \{id = band_lobby_popup_menu}
		band_lobby_popup_menu :gettags
		if ((gotparam menu) && (gotparam player))
			getplayerinfo <player> controller
			band_lobby_update_button_helpers controller = <controller> menu = <menu> player = <player>
		else
			band_lobby_update_button_helpers
		endif
	else
		band_lobby_update_button_helpers
	endif
	if ($g_online_quit_refresh_band_lobby_hack = 1)
		change \{g_online_quit_refresh_band_lobby_hack = 0}
		change \{g_suppress_anim_in = 1}
		ui_event_wait \{event = menu_refresh}
	endif
endscript

script ui_band_lobby_anim_in 
	printf \{channel = band_lobby
		qs(0xf1e10cb5)}
	if ($g_suppress_anim_in = 0)
		if screenelementexists \{id = band_lobby_desc_id}
			band_lobby_desc_id :bl_menu_layout_anim_in
		endif
		wait \{3
			gameframes}
		bl_submenus_anim_in
		if isps3
			if screenelementexists \{id = band_lobby_desc_id}
				band_lobby_desc_id :obj_spawnscriptlater \{bl_wait_and_update_chat_restrictions_message}
			endif
		endif
		if NOT ($g_band_lobby_error_msg = null)
			if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
				band_lobby_create_popup_menu {
					menu = error_msg
					player = ($g_leader_player_num)
					container = <resolved_id>
				}
			endif
		endif
	endif
	change \{g_suppress_anim_in = 0}
endscript

script ui_band_lobby_anim_out 
endscript

script ui_band_lobby_start_all_anims 
	i = 0
	begin
	name = ($g_persistent_band_data [<i>].object)
	if objectexists id = <name>
		<name> :ui_band_lobby_start_anims
	endif
	i = (<i> + 1)
	repeat 4
endscript

script ui_band_lobby_start_anims 
	obj_getid
	persistent_band_get_index_from_object_id object = <objid>
	instrument = ($g_persistent_band_data [<index>].instrument)
	switch <instrument>
		case guitar
		anim = guit_adam_lowkey_100
		case bass
		anim = guit_jeff_lowkey_100_01
		case vocals
		anim = sing_jeff_lowkey_100_01
		default
		return
	endswitch
	<objid> :persistent_band_play_looping_anim anim = <anim>
endscript
