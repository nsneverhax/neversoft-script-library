
script ui_init_band_lobby 
	set_cas_loading_setup \{setup = lobby}
	disable_pause
	if NOT ininternetmode
		netsessionfunc \{func = match_init}
		netsessionfunc \{func = friends_init}
	endif
	lightshow_initeventmappings
	lightshow_notingameplay_setmood \{mood = band_lobby}
	if ($g_lobby_enter_from_main_menu = 1)
		change \{g_lobby_enter_from_main_menu = 0}
		if checkforsignin controller_index = <device_num> dont_set_primary
			band_lobby_get_is_guest device_num = <device_num>
			if (<is_guest> = 1)
				change \{g_lobby_net_state = local}
			else
				change \{g_lobby_net_state = net_public}
			endif
		else
			change \{g_lobby_net_state = local}
		endif
		netsessionfunc \{func = removeallcontrollers}
		if ($g_lobby_state != vs)
			persistent_band_force_traditional_band
		endif
		band_lobby_attempt_to_join viewport_index = <device_num> device_num = <device_num> from_main_menu
		if gotparam \{error}
			change g_band_lobby_error_msg = <error>
			change g_leader_player_num = (<device_num> + 1)
		endif
		if ($g_lobby_state != career)
			quick_remove_goal \{goal_name = career}
		endif
	endif
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
	startrendering
endscript

script ui_band_lobby_start_all_anims 
	i = 0
	begin
	name = ($persistent_band_data [<i>].object)
	if objectexists id = <name>
		<name> :ui_band_lobby_start_anims
	endif
	i = (<i> + 1)
	repeat 4
endscript

script ui_band_lobby_start_anims 
	obj_getid
	persistent_band_get_index_from_object_id object = <objid>
	instrument = ($persistent_band_data [<index>].instrument)
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

script ui_deinit_band_lobby 
	quick_remove_goal \{goal_name = career}
	if ($leaving_lobby_for_mc_error = mc_error_step_2)
		band_lobby_reset_all_chosen_characters \{not_silhouettes}
	else
		band_lobby_reset_all_chosen_characters
	endif
	change \{leaving_lobby_for_mc_error = none}
endscript

script ui_create_band_lobby 
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
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
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend
			fadeintime = 2
			fadeintype = linear
			fadeouttime = 2
			fadeouttype = linear
		}}
	savegame_async_init
	band_lobby_setup_cameras
	if innetgame
		change \{respond_to_signin_changed = 1}
		change \{respond_to_signin_changed_all_players = 1}
	else
		change \{respond_to_signin_changed = 0}
		change \{respond_to_signin_changed_all_players = 0}
	endif
	change \{respond_to_signin_changed_func = band_lobby_signin_changed}
	spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
		end_game_script = band_lobby_end_game}
	createscreenelement \{parent = root_window
		id = band_lobby_desc_id
		type = descinterface
		desc = 'band_lobby'
		z_priority = 0.0}
	if band_lobby_desc_id :desc_resolvealias \{name = 0x10aeb4b2}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xa02563d1}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x5f448112}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x219b1158}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x89a7e508}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x392c326b}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xc64dd0a8}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xb89240e2}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xfea0d59e}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (15.0, 15.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x4e2b02fd}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xb14ae03e}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xcf957074}
		if screenelementexists \{id = band_lobby_desc_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (15.0, 15.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x60c4403d}
		if screenelementexists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0xd04f975e}
		if screenelementexists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x2f2e759d}
		if screenelementexists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x51f1e5d7}
		if screenelementexists id = <resolved_id>
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (10.0, 10.0)}
		endif
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_diamondbling3
			param = diamondbling3_id}
		<diamondbling3_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_diamondbling6
			param = diamondbling6_id}
		<diamondbling6_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_diamondbling9
			param = diamondbling9_id}
		<diamondbling9_id> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = 0x4da245e6
			param = 0x2b32616d}
		<0x2b32616d> :obj_spawnscript 0x976144e6 params = {minwidth = 4 maxwidth = 8 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
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
	if innetgame
		if screenelementexists \{id = band_lobby_desc_id}
			runscriptonscreenelement \{id = band_lobby_desc_id
				band_lobby_watchdog_all_player_appearance_change}
		endif
	endif
	<id> :obj_spawnscriptnow band_lobby_ui_animations
	band_lobby_update_lobby_title
	band_lobby_update_ticker \{msg_checksum = current_state}
	band_lobby_update_button_helpers
	gman_shutdownallgoals \{preserve_career}
	session_stats_reset
	change \{in_band_lobby = 1}
	change \{check_for_unplugged_controllers = 1}
	clear_paused_controllers
	band_lobby_refresh_band_leader_characters \{no_refresh}
	persistent_band_refresh_changed_characters
	restore_idle_faces
	set_cas_loading_setup \{setup = lobby}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	band_lobby_desc_id :obj_spawnscript \{0x1550adfb}
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
	set_all_character_viewports_on
	destroyscreenelement \{id = band_lobby_desc_id}
	screenfx_clearfxinstances \{viewport = bg_viewport}
	clean_up_user_control_helpers
	vocals_deinit_all_mics
	change \{in_band_lobby = 0}
	change \{check_for_unplugged_controllers = 0}
	change \{g_suppress_anim_in = 0}
endscript

script ui_return_band_lobby 
	band_lobby_desc_id :obj_killspawnedscript \{name = band_lobby_update_mics}
	band_lobby_desc_id :obj_spawnscript \{band_lobby_update_mics}
	printf \{channel = vocals
		qs(0xd3c80918)}
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
endscript

script band_lobby_ui_animations 
	printf \{channel = band_lobby
		qs(0x449b532a)}
	obj_getid
endscript
