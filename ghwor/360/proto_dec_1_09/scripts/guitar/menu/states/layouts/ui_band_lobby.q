
script ui_init_band_lobby 
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	KillSpawnedScript \{Name = switch_to_no_band_camera}
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
		Change \{g_lobby_enter_from_main_menu = 0}
		if CheckForSignIn controller_index = <device_num> dont_set_primary
			band_lobby_get_is_guest device_num = <device_num>
			if (<is_guest> = 1)
				Change \{g_lobby_net_state = local}
			else
				Change \{g_lobby_net_state = net_public}
			endif
		else
			Change \{g_lobby_net_state = local}
		endif
		NetSessionFunc \{func = removeallcontrollers}
		if ($g_lobby_state != vs)
			persistent_band_force_traditional_band
		endif
		band_lobby_attempt_to_join submenu_index = <device_num> device_num = <device_num> from_main_menu
		if GotParam \{error}
			Change g_band_lobby_error_msg = <error>
			Change g_leader_player_num = (<device_num> + 1)
		else
			NetSessionFunc \{func = live_settings_init}
			NetSessionFunc \{Obj = live_settings
				func = get_settings}
		endif
	endif
endscript

script ui_deinit_band_lobby 
	gman_shutdownallgoals
	Change \{g_leader_player_num = -1}
	Change \{g_net_leader_player_num = -1}
	Change \{g_career_search = NULL}
	Change \{g_lobby_invite_flag = 0}
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
	Change \{leaving_lobby_for_mc_error = None}
	getmaxlocalplayers
	controller_index = 0
	begin
	playerinfo = (<controller_index> + 1)
	setplayerinfo <playerinfo> controller = <controller_index>
	controller_index = (<controller_index> + 1)
	repeat <max_players>
	persistent_band_force_unique_musicians
endscript

script ui_create_band_lobby 
	disable_pause
	hide_glitch \{num_frames = 2}
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	get_savegame_from_controller controller = ($primary_controller)
	GetPakManCurrent \{map = zones}
	ExtendCrc <pak> '_TRG_Waypoint_' out = node_prefix
	ExtendCrc <node_prefix> 'Vocalist_Start' out = node
	Change cas_node_name = <node>
	PlayIGCCam \{id = modelview_view_cam_id
		Name = modelview_view_cam
		viewport = bg_viewport
		LockTo = World
		Pos = (3.561758, 4.0928774, 12.285821)
		Quat = (0.029093998, -0.97165793, 0.132579)
		FOV = 72.0
		play_hold = 1
		interrupt_current}
	set_cas_loading_setup \{setup = lobby}
	if NOT ininternetmode
		NetSessionFunc \{func = match_init}
		NetSessionFunc \{func = friends_init}
	endif
	LightShow_InitEventMappings
	lightshow_notingameplay_setmood \{mood = band_lobby}
	StartRendering
	band_lobby_set_gamemode_by_state lobby = ($g_lobby_state)
	band_lobby_add_local_players_to_submenus
	band_lobby_add_remote_players_to_submenus
	band_lobby_make_visible_players_mutually_exclusive
	persistent_band_play_all_default_anims
	NetSessionFunc \{Obj = party
		func = set_party_joinable
		params = {
			joinable = 1
		}}
	mainmenu_kill_song_and_characters
	if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
		KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
	endif
	if IsSoundEventPlaying \{surge_during_stats_screen}
		StopSoundEvent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	if ($g_lobby_storageselect_return_savegame != -1)
		continue_after_storage_selector_savegame = ($g_lobby_storageselect_return_savegame)
		continue_after_storage_selector_confirm = ($g_lobby_storageselect_return_confirm)
	endif
	Change \{g_lobby_storageselect_return_savegame = -1}
	Change \{g_lobby_storageselect_return_confirm = FALSE}
	SpawnScriptNow \{sfx_backgrounds_new_area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 2
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	savegame_async_init
	band_lobby_setup_cameras
	if InNetGame
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_all_players = 1}
	else
		Change \{respond_to_signin_changed = 0}
		Change \{respond_to_signin_changed_all_players = 0}
	endif
	Change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
		end_game_script = band_lobby_end_game}
	CreateScreenElement \{parent = root_window
		id = band_lobby_desc_id
		Type = descinterface
		desc = 'band_lobby'
		z_priority = 0.0}
	ScreenFX_AddFXInstance {
		viewport = bg_viewport
		($dof_pausemenublur_tod_manager.screen_FX [0])
	}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		band_lobby_create_viewport_and_menus {
			viewport_vmenu = <resolved_id>
		}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_remote_players_menu}
		band_lobby_create_submenus_remote {
			remote_players_menu = <resolved_id>
		}
	endif
	band_lobby_desc_id :Obj_SpawnScriptLater \{attempt_to_add_friend_feed
		params = {
			menu = band_lobby
			parent_id = band_lobby_desc_id
		}}
	if InNetGame
		if ScreenElementExists \{id = band_lobby_desc_id}
			RunScriptOnScreenElement \{id = band_lobby_desc_id
				band_lobby_watchdog_all_player_appearance_change}
		endif
	endif
	band_lobby_update_lobby_title
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_update_button_helpers
	gman_shutdownallgoals
	session_stats_reset
	Change \{in_band_lobby = 1}
	Change \{check_for_unplugged_controllers = 1}
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
	formatText checksumName = viewport 'band_viewport_%i' i = <i>
	formatText checksumName = viewport_cam 'band_viewport_cam_%i' i = <i>
	ScreenFX_ClearFXInstances viewport = <viewport>
	KillCamAnim Name = <viewport_cam>
	if ScreenElementExists id = <viewport>
		DestroyScreenElement id = <viewport>
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	if ($leaving_lobby_for_mc_error = mc_error_step_1)
		Change \{leaving_lobby_for_mc_error = mc_error_step_2}
		band_lobby_reset_all_chosen_characters \{not_silhouettes}
	else
		band_lobby_reset_all_chosen_characters
	endif
	set_all_character_viewports_on
	DestroyScreenElement \{id = band_lobby_desc_id}
	ScreenFX_ClearFXInstances \{viewport = bg_viewport}
	clean_up_user_control_helpers
	vocals_deinit_all_mics
	Change \{in_band_lobby = 0}
	Change \{check_for_unplugged_controllers = 0}
	Change \{g_suppress_anim_in = 0}
endscript

script ui_return_band_lobby 
	band_lobby_desc_id :Obj_KillSpawnedScript \{Name = band_lobby_update_mics}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	printf \{channel = vocals
		qs(0xd3c80918)}
	band_lobby_change_focus_submenu_all \{focus_type = focus}
	vocals_reinit_mics noise_gate = ($band_lobby_noise_gate)
	if ScreenElementExists \{id = band_lobby_popup_menu}
		band_lobby_popup_menu :GetTags
		if ((GotParam menu) && (GotParam Player))
			getplayerinfo <Player> controller
			band_lobby_update_button_helpers controller = <controller> menu = <menu> Player = <Player>
		else
			band_lobby_update_button_helpers
		endif
	else
		band_lobby_update_button_helpers
	endif
endscript

script ui_band_lobby_anim_in 
	printf \{channel = band_lobby
		qs(0xf1e10cb5)}
	if ($g_suppress_anim_in = 0)
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			if NOT ininternetmode
				if NOT band_lobby_net_setup
					Change \{g_lobby_net_state = local}
				endif
				band_lobby_update_lobby_title
				band_lobby_update_button_helpers
				band_lobby_update_ticker \{msg_checksum = current_state}
			else
				band_lobby_poll_party_object
			endif
		else
			Wait \{3
				gameframes}
		endif
		bl_submenus_anim_in
		if isps3
			if NOT NetSessionFunc \{Obj = voice
					func = voice_allowed}
				band_lobby_update_ticker \{msg_checksum = ps3_chat_warning_message}
			endif
		endif
		if NOT ($g_band_lobby_error_msg = NULL)
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
				band_lobby_create_popup_menu {
					menu = error_msg
					Player = ($g_leader_player_num)
					container = <resolved_id>
				}
			endif
		endif
	endif
	Change \{g_suppress_anim_in = 0}
endscript

script ui_band_lobby_anim_out 
endscript

script ui_band_lobby_start_all_anims 
	i = 0
	begin
	Name = ($g_persistent_band_data [<i>].object)
	if ObjectExists id = <Name>
		<Name> :ui_band_lobby_start_anims
	endif
	i = (<i> + 1)
	repeat 4
endscript

script ui_band_lobby_start_anims 
	Obj_GetID
	persistent_band_get_index_from_object_id object = <objID>
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
	<objID> :persistent_band_play_looping_anim anim = <anim>
endscript
