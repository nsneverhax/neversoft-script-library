band_mode_mode = None
band_mode_actual_devices = [
	0
	0
	0
	0
]
band_mode_menu_tags = None
band_mode_last_num_ready = 0
band_mode_current_leader = -1
band_mode_can_choose_leader = 0
band_mode_previous_leader = -1
net_matchmaking_search_window = cancel_only
net_band_mode_menu = None
num_players_in_band = 0
net_band_members = [
]
net_num_joiners = 0
career_matchmaking_complete = 0
signin_glitch_protect = 0
0xf8aac4ed = -1
0xa53d906e = 0
0x81bfdc7e = -1
0xdb92eeef = 0

script ui_init_band_mode 
	sanity_check_fix_deleted_characters
	Change \{band_mode_last_num_ready = 0}
	if ($band_mode_menu_tags = None)
		Change \{band_mode_previous_leader = -1}
	endif
endscript

script ui_create_band_mode 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{band_mode_current_leader = -1}
	Change \{menu_over_ride_exclusive_device = -1}
	set_cas_loading_setup \{setup = Band}
	Change \{ui_band_mode_hit_force_completion = 0}
	SpawnScriptLater \{menu_music_on}
	if NOT ($band_mode_menu_tags = None)
		band_mode_remap_controllers_1_to_4
	else
		Change \{band_mode_menu_tags = None}
	endif
	if ($band_mode_menu_tags = None)
		Change \{0xf8aac4ed = -1}
		Change \{0x81bfdc7e = -1}
	endif
	Change \{band_mode_added_vocalist = 0}
	0x55214850
	spawn_player_drop_listeners \{drop_player_script = net_career_drop_player
		end_game_script = net_career_end_game}
	if ($is_network_game = 0)
		update_ingame_controllers
	endif
	fadetoblack \{OFF
		no_wait}
	SpawnScriptNow \{ui_create_band_mode_spawned}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script band_mode_remap_controllers_1_to_4 
	character_id_controller = [None None None None None None None None]
	num_players = ($current_num_players)
	if ($band_mode_added_vocalist = 1)
		getplayerinfo ($current_num_players) character_id
		0x51ef0dbc = <character_id>
		num_players = (<num_players> - 1)
	endif
	getmaxplayers
	i = 0
	begin
	iplayer = (<i> + 1)
	getplayerinfo (<iplayer>) controller
	getplayerinfo (<iplayer>) character_id
	if ((<controller> >= 0) && (<controller> < 8))
		SetArrayElement ArrayName = character_id_controller index = <controller> NewValue = <character_id>

	endif
	i = (<i> + 1)
	repeat <num_players>
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	i = 0
	begin
	controller = ($band_mode_menu_tags [<i>].controller)
	if ((<controller> >= 0) && (<controller> < 8))

	else

	endif
	if ((<controller> >= 0) && (<controller> < 8))
		setplayerinfo (<i> + 1) character_id = (<character_id_controller> [<controller>])
	endif
	i = (<i> + 1)
	repeat 4
	if ($band_mode_added_vocalist = 1)
		setplayerinfo 4 character_id = <0x51ef0dbc>
	endif
	sanity_check_fix_deleted_characters
endscript

script ui_create_band_mode_spawned 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	disable_pause
	frontend_load_soundcheck \{loadingscreen}
	Change band_mode_current_leader = ($band_mode_previous_leader)
	cas_free_resources_camera_fix \{base_name = 'band_hub'
		alwaysfix}
	new_leader = ($band_mode_previous_leader)
	if ($is_network_game = 1)
		Change \{respond_to_signin_changed = 1}
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			Change \{respond_to_signin_changed_all_players = 1}
		elseif (($net_band_mode_menu = HOST) || ($net_band_mode_menu = join))
			Change \{respond_to_signin_changed = 0}
			Change \{respond_to_signin_changed_all_players = 0}
		else
			Change \{respond_to_signin_changed_all_players = 0}
		endif
	else
		Change \{respond_to_signin_changed = 0}
		Change \{respond_to_signin_changed_all_players = 0}
	endif
	Change \{respond_to_signin_changed_func = ui_band_mode_signin_changed}
	band_builder_clear_random_appearances \{cpu_only}
	band_builder_clear_setup
	cas_set_object_node_pos \{Player = 1
		node = z_soundcheck_trg_waypoint_player1_start}
	cas_set_object_node_pos \{Player = 2
		node = z_soundcheck_trg_waypoint_player2_start}
	cas_set_object_node_pos \{Player = 3
		node = z_soundcheck_trg_waypoint_player3_start}
	cas_set_object_node_pos \{Player = 4
		node = z_soundcheck_trg_waypoint_player4_start}
	reset_band_mode
	set_focus_color
	set_unfocus_color
	GetActiveControllers
	controller_num = 0
	CreateScreenElement \{parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'band_play'
		passive_events = true
		event_handlers = [
			{
				pad_choose
				0x3a1a73f7
			}
			{
				pad_back
				0x91d0e379
			}
		]}
	myinterfaceelement :se_getprops
	array = [
		{pad_option2 0x57b90bdf}
	]
	if (($is_network_game = 0))
	elseif ($is_network_game = 1)
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			array = []
			if IsHost
				AddArrayElement array = <array> element = {pad_start net_ui_band_mode_continue}
			endif
		endif
		if isps3
			AddArrayElement array = <array> element = {pad_option2 ui_band_mode_ps3_invite_received}
		endif
	endif
	myinterfaceelement :SetProps event_handlers = <array>
	menu_array = []
	desc_array = []
	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	total_guitar = 2
	total_drum = 1
	total_mic = 1
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		total_guitar = 2
		total_drum = 2
		total_mic = 2
	elseif ($game_mode = p2_battle)
		total_guitar = 2
		total_drum = 2
		total_mic = 0
	endif
	myinterfaceelement :SetTags {
		total_guitar = <total_guitar>
		total_drum = <total_drum>
		total_mic = <total_mic>
		current_guitar = 0
		current_drum = 0
		current_mic = 0
		net_gig_ready = 0
		net_vocals_ready = 0
		net_instruments_ready = 0
		net_lobby_ready = 0
	}
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	current_desc_item = <resolved_id>
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	if <resolved_id> :desc_resolvealias Name = alias_menu
		if ($is_network_game = 1)
			switch ($net_band_mode_menu)
				case invite
				net_get_invite_menu_tags index = <i> desc_id = <current_desc_item> init
				add_gamertag_to_band_lobby index = <i> Name = <Name> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = <part>
					difficulty = None
					controller = <controller>
					allowed = <allowed>
					user_id = <user_id>
					band_leader = <band_leader>
					index = <i>
				}
				case lobby
				net_get_root_menu_tags index = <i> desc_id = <current_desc_item>
				add_gamertag_to_band_lobby index = <i> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = <part>
					difficulty = <difficulty>
					controller = <controller>
					allowed = <allowed>
					band_leader = <band_leader>
					index = <i>
				}
				case HOST
				if ($primary_controller = <i>)
					menu = net_local_join
				else
					if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
						menu = net_local_join
					else
						menu = join
					endif
				endif
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = None
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					marked_in = 0
					index = <i>
				}
				if NOT ($primary_controller = <i>)
					<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
				endif
				case join
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :SetTags {
					menu = join
					instrument = None
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					index = <i>
				}
				<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
				default

			endswitch
		else
			switch <i>
				case 0
				allowed = {guitar bass}
				case 1
				allowed = {guitar bass}
				case 2
				allowed = {drum}
				case 3
				allowed = {vocals}
				default

			endswitch
			<resolved_id> :SetTags {
				menu = join
				instrument = None
				difficulty = easy
				controller = -1
				allowed = <allowed>
				index = <i>
			}
			<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
		endif
		get_player_num_from_controller controller_index = <i>
		if NOT ($band_mode_menu_tags = None)
			<resolved_id> :SetTags {
				($band_mode_menu_tags [<i>])
			}
			<resolved_id> :GetSingleTag menu
			if (<player_num> >= 0)
				if (<menu> = join)
					cas_queue_kill_player Player = <player_num>
				elseif (<menu> = net_remote_root)
					<resolved_id> :Obj_KillSpawnedScript Name = ui_band_mode_check_disconnect
				else
					ui_band_mode_show_character Player = <player_num> use_existing
				endif
			endif
		else
			if (<player_num> >= 0)
				cas_queue_kill_player Player = <player_num>
				<resolved_id> :GetSingleTag menu
				if (<menu> = net_local_join)
					ui_band_mode_show_character Player = <player_num>
				endif
			endif
		endif
		<resolved_id> :SetProps event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		<resolved_id> :SetProps event_handlers = [
			{pad_option ui_band_mode_choose_leader}
			{pad_start ui_band_mode_continue}
		]
		if <resolved_id> :GetSingleTag menu
			AddArrayElement array = <menu_array> element = <resolved_id>
			menu_array = <array>
		else

		endif
		if (($is_network_game = 1) && ($net_band_leader_player_num > -1) && ($net_band_leader_player_num = (<i> + 1)))
			<current_desc_item> :se_setprops leader_indicator_alpha = 1.0
		endif
	endif
	i = (<i> + 1)
	repeat 4
	myinterfaceelement :SetTags {
		menus = <menu_array>
		descs = <desc_array>
	}
	GetArraySize \{menu_array}
	if (<array_Size> > 0)
		i = 0
		begin
		curr_id = (<menu_array> [<i>])
		SpawnScriptNow ui_band_difficulty_delay_input params = {resolved_id = <curr_id>}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if NOT ($band_mode_menu_tags = None)
		myinterfaceelement :SetTags {
			($band_mode_menu_tags [4])
		}
	endif
	net_setup_band_lobby_ticker
	if ($is_network_game = 1)
		if ($net_band_mode_menu = HOST)
			update_network_ticker \{msg_checksum = menu_host}
		endif
		if ($net_band_mode_menu = join)
			update_network_ticker \{msg_checksum = menu_join}
		endif
		if ($net_band_mode_menu = invite)
			update_network_ticker \{msg_checksum = menu_invite}
		endif
		if (($net_band_mode_menu = HOST) || ($net_band_mode_menu = invite))
			myinterfaceelement :Obj_SpawnScriptLater \{career_poll_party_for_joiners}
		endif
		if (($net_band_mode_menu = lobby) && ($career_matchmaking_complete = 0))
			Change \{net_matchmaking_search_window = cancel_only}
			if ($net_career_invite_flag = 1)
				Change \{net_matchmaking_search_window = invites}
			endif
			net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			if ScreenElementExists \{id = myinterfaceelement}
				myinterfaceelement :Obj_SpawnScriptNow \{check_num_matchmaking_players_loop}
			endif
		endif
	endif
	AssignAlias \{id = myinterfaceelement
		alias = band_mode_menu}
	ui_band_mode_helper_text
	Change \{band_mode_menu_tags = None}
	Change \{band_mode_previous_leader = -1}
	ui_band_mode_choose_leader device_num = <new_leader>
	LaunchEvent \{Type = focus
		target = band_mode_menu}
	if ($0xf8aac4ed > -1 && $0x81bfdc7e > -1)
		Change \{0xf8aac4ed = -1}
		myinterfaceelement :GetTags
		menu_id = (<menus> [$0x81bfdc7e])
		RemoveParameter \{controller}
		<menu_id> :GetSingleTag controller
		0x57b90bdf device_num = <controller> 0xd88ae4d0
	endif
	myinterfaceelement :obj_spawnscript \{0x61cd76c3}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_mode_signin_changed 

	if (($primary_controller = <controller>) && ($is_network_game = 1))
		handle_signin_changed
		return
	endif
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
	get_player_num_from_controller controller_index = <controller>
	ui_band_mode_kill_character Player = <player_num>
	myinterfaceelement :GetTags
	controller_signin = <controller>
	index = 0
	GetArraySize <menus>
	begin
	current_menu = (<menus> [<index>])
	<current_menu> :GetSingleTag controller
	if (<controller> = <controller_signin>)
		break
	endif
	index = (<index> + 1)
	repeat <array_Size>
	<current_menu> :GetSingleTag menu
	if (($is_network_game = 1) && (<menu> = net_remote_root))
		menu = net_remote_root
	else
		menu = join
	endif
	<current_menu> :SetTags {menu = <menu> instrument = None difficulty = None marked_in = 0}
	ui_band_mode_helper_text
	<current_menu> :Obj_SpawnScriptNow ui_band_mode_update_menu
	<current_menu> :GetSingleTag controller_instrument
	switch <controller_instrument>
		case guitar
		myinterfaceelement :SetTags {current_guitar = (<current_guitar> - 1)}
		case drum
		myinterfaceelement :SetTags {current_drum = (<current_drum> - 1)}
		case mic
		if (($allow_controller_for_all_instruments) = 0)
			myinterfaceelement :SetTags {current_mic = (<current_mic> - 1)}
		endif
	endswitch
	<current_menu> :SetTags controller_instrument = None
	myinterfaceelement :GetSingleTag \{descs}
	current_desc = (<descs> [<index>])
	<current_desc> :se_setprops reposition_pos = (0.0, 0.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
endscript

script ui_destroy_band_mode 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	caswaitforloading
	begin
	if NOT ScriptIsRunning \{trigger_cas_rebuild_loop}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :Die
	endif
	clean_up_user_control_helpers
	setup_bg_viewport
	restore_dummy_bg_camera
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	destroy_popup_warning_menu
	cleanup_all_photo_assets
	caswaitforloading
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_deinit_band_mode 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{disallow_band_edit_char_spam = 0}
	if ($signin_glitch_protect = 0)
		cancel_all_cas_loads
	else
		Change \{signin_glitch_protect = 0}
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_return_band_mode 
	frontend_load_soundcheck
	if ($is_network_game = 1)
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
		destroy_loading_screen
		StartRendering
		if ScreenElementExists \{id = myinterfaceelement}
			myinterfaceelement :se_setprops \{alpha = 1.0}
			band_mode_menu :GetSingleTag \{menus}
			i = 0
			GetArraySize <menus>
			begin
			if ScreenElementExists id = (<menus> [<i>])
				(<menus> [<i>]) :GetSingleTag menu
				if (<menu> = ready)
					get_savegame_from_controller controller = ($primary_controller)
					getplayerinfo (<i> + 1) character_id
					get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
					cas_queue_add_request appearance = (<profile_struct>.appearance) Player = (<i> + 1)
				endif
				(<menus> [<i>]) :obj_spawnscript ui_band_mode_update_menu
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if ($net_band_mode_menu = join)
				Change \{num_players_in_band = 0}
			endif
		endif
	endif
	ui_band_mode_helper_text
endscript

script is_band_character_select_up 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_Size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_Size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = character)
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return \{FALSE}
endscript

script band_kill_character_select_menus 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_Size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_Size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		if <curr_id> :GetSingleTag menu
			if (<menu> = character)
				<curr_id> :Obj_SpawnScriptNow ui_band_mode_back
				RemoveParameter \{menu}
				killed_something = 1
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{killed_something}
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_band_mode_choose_leader 

	if is_band_character_select_up
		return \{FALSE}
	elseif ($band_mode_can_choose_leader = 0)
		return \{FALSE}
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
		return \{FALSE}
	endif
	myinterfaceelement :GetTags
	0x81e141f4 = <device_num>
	GetTags
	if GotParam \{controller}
		if NOT (<menu> = join)
			0x81e141f4 = <controller>
		endif
	endif
	<i> = 0
	begin
	current_desc = (<descs> [<i>])
	leader = 1
	current_menu = (<menus> [<i>])
	<current_menu> :GetTags
	if (<menu> = join)
		leader = 0
	endif
	if (<controller> = -1)
		leader = 0
	endif
	if (<0x81e141f4> = -1 && <leader> = 1)
		0x81e141f4 = <controller>
	endif
	if NOT (<controller> = <0x81e141f4>)
		leader = 0
	endif
	if (<leader> = 1)
		<current_desc> :se_setprops leader_indicator_alpha = 1
		Change band_mode_current_leader = <controller>
		if NOT ($band_mode_previous_leader = <controller>)
			SoundEvent \{event = select_band_leader}
			Change band_mode_previous_leader = <controller>
		endif
	else
		<current_desc> :se_setprops leader_indicator_alpha = 0
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_band_mode_helper_text device_num = <device_num>
endscript

script ui_band_mode_create_menu 
	GetTags
	Obj_GetID
	<objID> :SetProps exclusive_device = <controller> event_handlers = [{pad_back ui_band_mode_back}]
	if (<controller> = -1)
		<objID> :se_setprops block_events
	endif
	if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite) || (<menu> = net_remote_root))
		if GotParam \{player_index}
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller> player_index = <player_index>}
		else
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller>}
		endif
	endif
	ui_band_mode_update_menu \{init}
endscript

script ui_band_mode_update_name 
	myinterfaceelement :GetTags
	GetSingleTag \{index}
	current_desc = (<descs> [<index>])
endscript

script band_mode_has_player_joined 
	screenelement_get_tags \{id = myinterfaceelement}
	if StructureContains structure = <tags> menus
		menu_id = (<tags>.menus [<Player>])
		if GotParam \{menu_id}
			if ScreenElementExists id = <menu_id>
				<menu_id> :GetTags
				if (<menu> = join)
					return \{FALSE}
				endif
			else
				return \{FALSE}
			endif
		else
			return \{FALSE}
		endif
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ui_band_menu_occlude_character 
	myinterfaceelement :GetTags
	if GotParam \{descs}

		current_desc = (<descs> [<index>])
		if GotParam \{revert}
			<current_desc> :se_setprops menu_player_bg_alpha = 0.8 scrollbar_alpha = 0.0 scrolling_menu_dims = (200.0, 200.0) name_arrow_up_pos = (-3.685994, -14.62645)
			<current_desc> :se_setprops reposition_pos = (0.0, 0.0) ready_banner_pos = (0.0, 500.0) time = 0.2 motion = ease_in
			if <current_desc> :desc_resolvealias Name = alias_scrolling_menu param = band_play_smenu
				SetScreenElementProps id = <band_play_smenu> top_selection = FALSE
			else

			endif
		else
			<current_desc> :se_setprops menu_player_bg_alpha = 1.0 scrollbar_alpha = 1.0 scrolling_menu_dims = (200.0, 500.0) name_arrow_up_pos = (-3.685994, 285.0)
			<current_desc> :se_setprops reposition_pos = (0.0, -275.0) time = 0.2 motion = ease_out
			if <current_desc> :desc_resolvealias Name = alias_scrolling_menu param = band_play_smenu
				SetScreenElementProps id = <band_play_smenu> top_selection = true
			else

			endif
		endif
	endif
endscript

script ui_band_mode_update_menu 
	destroy_loading_screen
	StartRendering
	GetTags
	Obj_GetID
	LaunchEvent Type = unfocus target = <objID>
	DestroyScreenElement id = <objID> preserve_parent
	se_getparentid
	<parent_id> :se_setprops reset_window_top
	child_index = 0
	<objID> :SetProps {
		replace_handlers event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		alpha = 0.0
	}
	ui_band_menu_occlude_character revert index = <index>

	switch <menu>
		case instrument
		ui_band_mode_create_menu_instrument
		case lefty
		ui_band_mode_create_menu_lefty
		<objID> :GetSingleTag instrument
		get_savegame_from_controller controller = <controller>
		focus_index = 0
		if (<instrument> = vocals)
			GetGlobalTags savegame = <savegame> user_options param = vocals_highway_view_save
			if (<vocals_highway_view_save> = scrolling)
				focus_index = 1
			endif
		else
			GetGlobalTags savegame = <savegame> user_options param = lefty_flip_save
			if (<lefty_flip_save> = 1)
				focus_index = 1
			endif
		endif
		given_focus = <focus_index>
		case difficulty
		ui_band_mode_create_menu_difficulty
		if ($is_network_game = 0)
			if (<controller> >= 0 && <controller> < 8)
				difficulty = ($default_difficulty [<controller>])
			endif
		endif
		focus_index = 0
		if GotParam \{difficulty}
			switch (<difficulty>)
				case easy
				focus_index = 1
				case medium
				focus_index = 2
				case hard
				focus_index = 3
				case expert
				focus_index = 4
			endswitch
		endif
		given_focus = <focus_index>
		case character
		case p2_character
		ui_band_mode_create_menu_character
		case root
		case p2_root
		ui_band_mode_create_menu_root menu = <menu>
		if GetScreenElementChildren id = <objID>
			GetArraySize <children>
			child_index = (<array_Size> - 1)
		endif
		case ready
		case ready2
		case p2_ready
		if ($is_network_game = 1)
			ui_event_get_stack
			if ((<stack> [0].base_name) = 'band_mode')
				ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
			endif
		else
			if NOT GotParam \{no_sfx}
				ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
			endif
		endif
		ui_band_mode_create_menu_ready
		<objID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case join
		ui_band_mode_create_menu_join <...>
		<objID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_open
		ui_band_mode_create_menu_net_remote_open
		<objID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_root
		ui_band_mode_create_menu_net_remote_root
		<objID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_local_join
		ui_band_mode_create_menu_net_local_join
		if GetScreenElementChildren id = <objID>
			GetArraySize <children>
			child_index = (<array_Size> - 1)
		endif
		case net_local_root
		ui_band_mode_create_menu_net_local_root
		myinterfaceelement :GetSingleTag \{net_gig_ready}
		if ((<net_gig_ready> = 0) && (IsHost) && ($primary_controller = <controller>))
			child_index = 0
		elseif (<instrument> = None)
			if isXenon
				child_index = 2
			else
				child_index = 1
			endif
		else
			if GetScreenElementChildren id = <objID>
				GetArraySize <children>
				child_index = (<array_Size> - 1)
			endif
		endif
		case friends
		ui_band_mode_create_friends_list
		case gigs
		ui_band_mode_create_gigs
		case gamer_cards
		ui_band_mode_create_menu_gamer_cards
		case invites
		ui_band_mode_create_invite
	endswitch
	if NOT GotParam \{skip_update_wait}
		Wait \{5
			gameframes}
	endif
	if NOT GotParam \{init}
		ui_band_mode_check_menus
	endif
	<objID> :SetProps alpha = 1.0
	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		if NOT (<menu> = gigs)
			ui_band_mode_show_arrows id = <current_desc>
		endif
		if (<menu> = join)
			ui_band_mode_hide_arrows id = <current_desc>
		endif
		switch <instrument>
			case guitar
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = logo_guitar
			case bass
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = logo_bass
			case drum
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = logo_drum
			case vocals
			<current_desc> :se_setprops instrument_alpha = 1.0 instrument_texture = logo_vocal
			default
			<current_desc> :se_setprops instrument_alpha = 0.0 instrument_texture = logo_guitar
		endswitch
		curr_index = <index>
		if (<menu> = join)
			band_character_rename index = <index>
		else
			GetArraySize <menus>
			i = 0
			begin
			curr_menu = (<menus> [<i>])
			<curr_menu> :GetSingleTag index
			if (<index> = <curr_index>)
				break
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if NOT (<i> = <array_Size>)
				band_character_rename index = <index> Player = (<i> + 1)
			endif
		endif
		if ($is_network_game = 1)
			getplayerinfo (<curr_index> + 1) net_obj_id
			getplayerinfo (<curr_index> + 1) is_local_client
			if ($net_band_mode_menu = lobby)
				if (<is_local_client> = 1)
					band_character_rename index = <curr_index> Player = (<curr_index> + 1)
				elseif (<net_obj_id> >= 0)
					net_get_character_name Player = (<curr_index> + 1)
					band_character_rename index = <curr_index> character_name = <display_name>
				else
					band_character_rename index = <index>
				endif
				if (($career_matchmaking_complete = 1) && (<net_obj_id> < 0) && (<menu> = net_remote_open))
					(<descs> [<index>]) :se_setprops reposition_pos = (0.0, 220.0) time = 0.1 motion = ease_out
					(<descs> [<index>]) :se_waitprops
					(<descs> [<index>]) :se_setprops reposition_pos = (0.0, 450.0) time = 0.1 alpha = 0
				endif
			endif
		endif
	endif
	if ((<menu> = net_remote_open) || (<menu> = net_remote_root) || ($net_career_data_sync_done = 0))
		if ((<menu> = net_remote_root) && ($net_band_mode_menu = HOST))

		else
			return
		endif
	endif
	if GotParam \{given_focus}

		LaunchEvent Type = focus target = <objID> data = {child_index = <given_focus>}
	else
		LaunchEvent Type = focus target = <objID> data = {child_index = <child_index>}
	endif
endscript

script ui_band_mode_show_arrows 

	if ScreenElementExists id = <id>
		<id> :se_setprops scroll_arrow_alpha = 1.0
	endif
endscript

script ui_band_mode_hide_arrows 

	if ScreenElementExists id = <id>
		<id> :se_setprops scroll_arrow_alpha = 0.0
	endif
endscript

script correct_allowed_parts 
	if NOT ArrayContains array = <allowed_parts> contains = <part>
		if StructureContains structure = <allowed> <part>
			RemoveParameter <part> struct_name = allowed
		endif
	endif
	return allowed = <allowed>
endscript

script filter_allowed_parts_by_character_type 

	get_player_num_from_controller controller_index = <controller>

	if (<player_num> < 0)
		return allowed = <allowed>
	endif
	<player_status> = ($0x2994109a [<player_num>])
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	allowed_parts = (<profile_struct>.allowed_parts)
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = drum
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = bass
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = vocals
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = guitar
	return allowed = <allowed>
endscript

script ui_band_mode_create_menu_instrument 
	Obj_GetID
	GetTags
	fit_width = `scale	each	line	if	larger`
	fit_height = `scale	down	if	larger`

	gamemode_gettype
	if (<Type> = faceoff)
		0x0e53d8a9 = 0
		if StructureContains structure = <allowed> Name = vocals
			0x0e53d8a9 = 1
		elseif comparestructs struct1 = {} struct2 = <allowed>
			0x0e53d8a9 = 1
		endif
		if (<0x0e53d8a9> = 1)
			CreateScreenElement {
				Type = TextBlockElement
				fit_width = wrap
				fit_height = `expand	dims`
				dims = (200.0, 80.0)
				parent = <objID>
				text = ($0x346464b3)
				font = fontgrid_text_a6
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
			return
		endif
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0x9504b94a)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = guitar}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains structure = <allowed> Name = guitar
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0x7d4f9214)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = bass}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains structure = <allowed> Name = bass
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0x388cd3db)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = drum}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains structure = <allowed> Name = drum
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	gamemode_gettype
	if (<Type> != faceoff)
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0x1b9f6f84)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {instrument = vocals}}
			]
			tags = {has_mic = 1}
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		if is_regular_controller controller = <controller>
			<id> :SetProps tags = {has_mic = 0}
		elseif NOT StructureContains structure = <allowed> Name = vocals
			<id> :SetProps not_focusable rgba = [64 64 64 255]
		endif
		RunScriptOnScreenElement id = <id> ui_band_mode_mic_check params = {controller = <controller>}
	endif
endscript

script ui_band_mode_create_menu_lefty 
	Obj_GetID
	GetTags
	fit_width = `scale	each	line	if	larger`
	fit_height = `scale	down	if	larger`
	if (<instrument> = vocals)
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0x305014bd)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = static}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0x737839f5)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = scrolling}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0x7b0518c0)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = standard}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0x2e9b1b43)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
endscript

script ui_band_mode_mic_check 

	if NOT is_regular_controller controller = <controller>
		return
	endif
	if (($allow_controller_for_all_instruments) = 1)
		SetProps \{tags = {
				has_mic = 1
			}}
		return
	endif
	gamemode_getproperty \{prop = faceoff}
	if (<faceoff> = true)
		get_player_num_from_controller controller_index = <controller>
		if (<player_num> = -1)

		endif
	endif
	Obj_GetID
	begin
	<has_mic> = 0
	if (<faceoff> = true)
		if vocals_player_has_mic Player = <player_num>
			<has_mic> = 1
		endif
	else
		if controller_has_headset controller = <controller>
			<has_mic> = 1
		elseif ismicrophonepluggedin
			<has_mic> = 1
		endif
	endif
	SetProps tags = {has_mic = <has_mic>}
	Wait \{1
		gameframe}
	repeat
endscript

script ui_band_mode_create_menu_difficulty 
	Obj_GetID
	if ($game_mode != p2_battle)
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 35.0)
			parent = <objID>
			text = qs(0x74d6a0a0)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {difficulty = easy_rhythm}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 35.0)
			parent = <objID>
			text = qs(0x74d6a0a0)
			font = fontgrid_text_a6
			rgba = [64 64 64 255]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			not_focusable
		}
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 35.0)
		parent = <objID>
		text = qs(0x8d657387)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = easy}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 35.0)
		parent = <objID>
		text = qs(0x6ef11a01)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = medium}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 35.0)
		parent = <objID>
		text = qs(0x51b06d2f)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = hard}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 35.0)
		parent = <objID>
		text = qs(0x334908ac)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = expert}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
endscript

script ui_band_mode_create_menu_ready 
	Obj_GetID
	se_getparentid
	<parent_id> :se_getparentid
	GetTags
	myinterfaceelement :GetSingleTag \{descs}
	current_desc = (<descs> [<index>])
	if French
		<current_desc> :se_setprops ready_banner_texture = ready_banner_french
	elseif German
		<current_desc> :se_setprops ready_banner_texture = ready_banner_german
	elseif Italian
		<current_desc> :se_setprops ready_banner_texture = ready_banner_italian
	elseif Spanish
		<current_desc> :se_setprops ready_banner_texture = ready_banner_spanish
	endif
	ui_band_mode_animate_ready current_desc = <current_desc>
endscript

script ui_band_mode_animate_ready 

	<current_desc> :se_setprops reposition_pos = (0.0, 220.0) ready_banner_pos = (0.0, -130.0) time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops reposition_pos = (0.0, 210.0) time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.8 time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.4 time = 0.1 motion = ease_in
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.6 time = 0.1 motion = ease_out
	<current_desc> :se_waitprops
	<current_desc> :se_setprops ready_banner_scale = 1.5 time = 0.1 motion = ease_in
endscript

script ui_band_mode_animate_unready 

	<current_desc> :se_setprops reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	<current_desc> :se_waitprops
	<current_desc> :se_setprops reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
endscript

script ui_band_mode_create_menu_root 
	Obj_GetID
	se_getparentid
	<parent_id> :se_getparentid
	GetTags
	get_savegame_from_controller controller = <controller>
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	gamemode_gettype
	if (<Type> = career)
		CreateScreenElement {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			dims = (200.0, 40.0)
			parent = <objID>
			text = qs(0xaf4d8fe7)
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = gigs}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	get_player_num_from_controller controller_index = <controller>
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0x095895d6)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_random_character params = {Player = <player_num> index = <index>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	root = character
	if (<menu> = p2_root)
		root = p2_character
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0xebd11692)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = <root>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	<parent_id> :GetSingleTag index
	player_num = (<index> + 1)
	<player_status> = ($0x2994109a [<player_num>])
	if (<player_num> > 0)
		if profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
			<show_edit_hero> = 1
			if NOT ($is_network_game)
				if isXenon
					if NOT CheckForSignIn local controller_index = <controller>
						<show_edit_hero> = 0
					endif
				endif
				if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle) || ($game_mode = p1_quickplay) || ($game_mode = p2_quickplay) || ($game_mode = p3_quickplay) || ($game_mode = p4_quickplay))
					<show_edit_hero> = 0
				endif
			endif
			if (<show_edit_hero>)
				CreateScreenElement {
					Type = TextBlockElement
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					dims = (200.0, 40.0)
					parent = <objID>
					text = qs(0x67bd7527)
					font = fontgrid_text_a6
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose_sound params = {controller = <controller>}}
						{pad_choose ui_band_mode_save_tags}
						{pad_choose ui_band_mode_choose params = {edit_hero Player = (<index> + 1) controller = <controller> 0x3d48d15c = <controller>}}
					]
					internal_scale = 0.4
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	endif
	not_signed_in = 0
	if isXenon
		if NOT islocallysignedin controller = <controller>
			not_signed_in = 1
		endif
	endif
	if (<controller> = ($primary_controller) && <index> != ($0xf8aac4ed))
		if (<not_signed_in> = 0)
			if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
				if current_band_has_band_name controller = <controller>
					CreateScreenElement {
						Type = TextBlockElement
						fit_width = `scale	each	line	if	larger`
						fit_height = `scale	down	if	larger`
						dims = (200.0, 40.0)
						parent = <objID>
						text = qs(0x9baf87e5)
						font = fontgrid_text_a6
						rgba = ($menu_unfocus_color)
						event_handlers = [
							{focus retail_menu_focus}
							{unfocus retail_menu_unfocus}
							{pad_choose ui_band_mode_choose_sound params = {controller = <controller>}}
							{pad_choose ui_band_mode_save_tags}
							{pad_choose menu_choose_band_make_selection params = {from_band_ui = 1 from_options = 1}}
						]
						internal_scale = 0.4
						just = [center bottom]
						internal_just = [center center]
					}
				endif
			endif
		endif
	endif
	if isXenon
		if (<not_signed_in> = 0)
			if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
				CreateScreenElement {
					Type = TextBlockElement
					fit_width = `scale	each	line	if	larger`
					fit_height = `scale	down	if	larger`
					dims = (200.0, 40.0)
					parent = <objID>
					text = qs(0x05dd2fa3)
					font = fontgrid_text_a6
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {root = gamer_cards}}
					]
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	endif
	ready = ready
	if (<menu> = p2_root)
		ready = p2_ready
	endif
	CreateScreenElement {
		Type = TextBlockElement
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		dims = (200.0, 40.0)
		parent = <objID>
		text = qs(0x7be2fdcb)
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = <ready>}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT ($is_network_game)
		if isXenon
			if ($band_mode_current_leader != -1)
				if CheckForSignIn local controller_index = ($band_mode_current_leader)
					return
				endif
			endif
			if CheckForSignIn local controller_index = <controller>
				Change \{band_mode_can_choose_leader = 1}
				ui_band_mode_choose_leader device_num = <controller>
				Change \{band_mode_can_choose_leader = 0}
			endif
		else
			if ($band_mode_current_leader = -1)
				Change \{band_mode_can_choose_leader = 1}
				ui_band_mode_choose_leader device_num = <controller>
				Change \{band_mode_can_choose_leader = 0}
			endif
		endif
	endif
endscript

script ui_band_mode_save_tags 
	myinterfaceelement :GetSingleTag \{menus}
	Change \{band_mode_menu_tags = None}
	GetArraySize <menus>
	array = []
	i = 0
	begin
	curr_id = (<menus> [<i>])
	screenelement_get_tags id = <curr_id>
	RemoveParameter \{struct_name = tags
		tag_selected_id}
	RemoveParameter \{struct_name = tags
		tag_selected_index}
	RemoveParameter \{struct_name = tags
		tag_selected_childs_grid_index}
	if StructureContains structure = <tags> menu
		if (<tags>.menu = character)
			tags = {<tags> menu = root}
		endif
		if (<tags>.menu = invites)
			if isps3
				tags = {<tags> menu = net_local_root}
			else
				tags = {<tags> menu = friends}
			endif
		endif
	endif
	AddArrayElement array = <array> index = <i> element = <tags>
	i = (<i> + 1)
	repeat <array_Size>
	if (<array_Size> < 4)
		begin
		AddArrayElement array = <array> index = <i> element = {}
		i = (<i> + 1)
		repeat (4 - <array_Size>)
	endif
	screenelement_get_tags \{id = myinterfaceelement}
	RemoveParameter \{struct_name = tags
		menus}
	RemoveParameter \{struct_name = tags
		descs}
	AddArrayElement array = <array> index = <i> element = <tags>
	Change band_mode_menu_tags = <array>
endscript
disallow_band_edit_char_spam = 0

script band_edit_character 
	if ($disallow_band_edit_char_spam = 0)
		Change \{disallow_band_edit_char_spam = 1}
		hide_glitch \{num_frames = 10}
		external_edit_character Player = <Player> 0x3d48d15c = <0x3d48d15c>
	endif
endscript

script ui_band_mode_create_menu_character 
	Obj_GetID
	<objID> :GetTags
	ui_band_menu_occlude_character index = <index>
	get_player_num_from_controller controller_index = <controller>
	Player = (<index> + 1)
	<player_status> = ($0x2994109a [<Player>])
	current_character_id = ($<player_status>.character_id)
	if band_builder_is_finalized_random character_id = <current_character_id>
		current_character_id = ($<player_status>.original_character_id)
	endif
	get_savegame_from_controller band_character_select controller = <controller>
	get_musician_profile_size savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	i = 0
	menu_index = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.Name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			if (<current_character_id> = <character_id>)
				focus_index = <menu_index>
			endif
			CreateScreenElement {
				Type = descinterface
				desc = 'band_play_menu_char'
				parent = <objID>
				band_play_menu_char_icon_texture = <icon>
				event_handlers = [
					{pad_choose band_character_select_choose params = {price = <price> Player = <Player> player_num = <player_num> character_id = <character_id> menu = <menu> savegame = <character_savegame> borrowed_from_band_leader = <borrowed_from_band_leader>}}
				]
				just = [center bottom]
				dims = (80.0, 80.0)
			}
			SetScreenElementProps {
				id = <id>
				event_handlers = [
					{focus band_character_select_focus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index> Player = <player_num>}}
					{unfocus band_character_select_unfocus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index>}}
				]
			}
			menu_index = (<menu_index> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.Name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			CreateScreenElement {
				Type = descinterface
				desc = 'band_play_menu_char'
				parent = <objID>
				band_play_menu_char_icon_texture = <icon>
				just = [center bottom]
				dims = (80.0, 80.0)
				not_focusable
			}
		endif
	endif
	i = (<i> + 1)
	repeat 6
	return given_focus = <focus_index>
endscript

script band_character_select_focus 
	if GotParam \{character_name}
		band_character_rename index = <index> character_name = <character_name>
	endif
	<id> :se_setprops Scale = 1.2 Pos = {relative (0.0, -10.0)} band_play_menu_char_highlight_alpha = 1.0
endscript

script band_character_rename 

	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :se_getprops
		if NOT GotParam \{character_name}
			character_name = qs(0x03ac90f0)
			if GotParam \{Player}
				<player_status> = ($0x2994109a [<Player>])
				get_savegame_from_player_status player_status = <player_status>
				character_id = ($<player_status>.character_id)
				get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
				character_name = <fullname>
			endif
		endif
		Name = qs(0x03ac90f0)
		if NOT (<character_name> = qs(0x03ac90f0))
			StringLength string = <character_name>
			Mod a = <str_len> b = (2)
			if (<Mod> = 1)
				character_name = (<character_name> + qs(0x713755f7))
				str_len = (<str_len> + 1)
			endif
			total = 0
			i = 0
			begin
			total = (<total> + <str_len> + 5)
			if (<total> > 128)
				break
			endif
			if (<i> = 0)
				temp_total = (<total> + <str_len> + 5)
				if (<temp_total> > 128)
					break
				endif
			endif
			formatText TextName = Name qs(0x2ad20d67) n = <Name> c = <character_name>
			i = (<i> + 1)
			if (<i> = 2)
				i = 0
			endif
			repeat
		endif
		if (<name_text> = <Name>)
			return
		endif
		<current_desc> :0x8e6af868 child = Name fit_width = `expand	dims`
		<current_desc> :0x8e6af868 child = Name just = [0.0 , 0.0]
		<current_desc> :Obj_KillSpawnedScript Name = band_character_name_scroll
		<current_desc> :se_setprops name_text = <character_name> name_dims = (0.0, 39.0) name_pos = (0.0, -19.28137)
		<current_desc> :se_getprops
		<current_desc> :0x8e6af868 child = Name fit_width = `scale	each	line	if	larger`
		<current_desc> :se_setprops name_pos = (125.0, 19.28137) name_dims = (250.0, 39.0)
		return
		<current_desc> :se_setprops name_text = qs(0x03ac90f0) name_dims = (0.0, 39.0) name_pos = (0.0, 19.28137)
		<current_desc> :se_setprops name_text = <Name>
		<current_desc> :se_getprops
		<current_desc> :Obj_SpawnScriptNow band_character_name_scroll params = {width = (<name_dims> [0])}
	endif
endscript

script band_character_name_scroll 

	time = (4.0 * (<width> / 500.0))
	se_setprops name_pos = {((-0.125, 0.0) * <width>) relative}
	begin
	se_setprops name_pos = {((-0.5, 0.0) * <width>) relative} time = <time>
	Wait <time> Seconds ignoreslomo
	se_setprops name_pos = {((0.5, 0.0) * <width>) relative}
	repeat
endscript

script band_gamertag_rename 

	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
	elseif GotParam \{desc_item}
		current_desc = <desc_item>
	endif
	if ((GotParam descs) || (GotParam desc_item))
		Name = qs(0x03ac90f0)
		if NOT (<gamertag> = qs(0x03ac90f0))
			StringLength string = <gamertag>
			Mod a = <str_len> b = (2)
			if (<Mod> = 1)
				gamertag = (<gamertag> + qs(0x713755f7))
				str_len = (<str_len> + 1)
			endif
			total = 0
			i = 0
			begin
			total = (<total> + <str_len> + 5)
			if (<total> > 128)
				break
			endif
			if (<i> = 0)
				temp_total = (<total> + <str_len> + 5)
				if (<temp_total> > 128)
					break
				endif
			endif
			formatText TextName = Name qs(0x2ad20d67) n = <Name> c = <gamertag>
			i = (<i> + 1)
			if (<i> = 2)
				i = 0
			endif
			repeat
		endif
		<current_desc> :se_getprops
		if (<gamertag_text> = <Name>)
			return
		endif
		<current_desc> :Obj_KillSpawnedScript Name = band_gamertag_scroll
		<current_desc> :se_setprops gamertag_text = <gamertag> gamertag_dims = (0.0, 39.0) gamertag_pos = (0.0, -19.28137)
		<current_desc> :se_getprops
		if ((<gamertag_dims> [0]) < 240)
			X = ((248 - (<gamertag_dims> [0])) / 2)
			<current_desc> :se_setprops gamertag_pos = ((0.0, -19.28137) + ((1.0, 0.0) * <X>))
			return
		endif
		<current_desc> :se_setprops gamertag_text = qs(0x03ac90f0) gamertag_dims = (0.0, 39.0) gamertag_pos = (0.0, -19.28137)
		<current_desc> :se_setprops gamertag_text = <Name>
		<current_desc> :se_getprops
		<current_desc> :Obj_SpawnScriptNow band_gamertag_scroll params = {width = (<gamertag_dims> [0])}
	endif
endscript

script band_gamertag_scroll 

	time = (5.0 * (<width> / 500.0))
	se_setprops gamertag_pos = {((-0.125, 0.0) * <width>) relative}
	begin
	se_setprops gamertag_pos = {((-0.5, 0.0) * <width>) relative} time = <time>
	Wait <time> Seconds ignoreslomo
	se_setprops gamertag_pos = {((0.5, 0.0) * <width>) relative}
	repeat
endscript

script band_character_select_unfocus 
	<id> :se_setprops Scale = 1.0 Pos = (0.0, 0.0) band_play_menu_char_highlight_alpha = 0.0
endscript

script band_resolve_guest_characters 

	if profile_can_be_modified id = <character_id> savegame = <savegame>
		if NOT is_completely_custom_musician id = <character_id> savegame = <savegame>
			if NOT searchmusicianprofilearray array_name = preset_musician_profiles_modifiable id = <character_id>

			endif
			if globaltag_check_preset_musician_modified index = <index> savegame = <borrowed_from_band_leader>
				savegame = <borrowed_from_band_leader>

			else

			endif
		endif
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		force_set_random_appearance Player = <Player> appearance = (<profile_struct>.appearance)
		updatestructelement struct = $guest_character_fullnames element = <new_character_id> value = (<profile_struct>.fullname)
		Change guest_character_fullnames = <newstruct>
		updatestructelement struct = $guest_character_names element = <new_character_id> value = (<profile_struct>.Name)
		Change guest_character_names = <newstruct>
		<player_status> = ($0x2994109a [<Player>])
		Change structurename = <player_status> original_character_id = <character_id>
		character_id = <new_character_id>
	endif
	return character_id = <character_id>
endscript

script band_character_select_choose 
	<player_status> = ($0x2994109a [<Player>])
	if (<player_num> < 4)
		SetArrayElement ArrayName = band_builder_random_preset_used globalarray index = (<player_num>) NewValue = <character_id>
	endif
	if GotParam \{borrowed_from_band_leader}
		if NOT (<borrowed_from_band_leader> = <savegame>)
			set_band_character_id_globaltag savegame = <savegame> controller = <Player> character_id = <character_id> Player = <player_num>
		endif
		ui_band_mode_choose_sound instrument = Default controller = <player_num>
		band_resolve_guest_characters Player = <Player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
		Change structurename = <player_status> character_id = <character_id>
	else
		ui_band_mode_choose_sound instrument = Default controller = <player_num>
		Change structurename = <player_status> character_id = <character_id>
		set_band_character_id_globaltag savegame = <savegame> controller = <Player> character_id = <character_id> Player = <player_num>
	endif
	cas_queue_new_character_profile Player = <Player> id = <character_id> savegame = <savegame>
	character = character
	if (<menu> = p2_character)
		character = p2_character
	endif
	ui_band_mode_choose character = <character>
endscript

script band_character_select_back_out 

	<player_status> = ($0x2994109a [<Player>])
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	cas_queue_new_character_profile Player = <Player> id = <character_id> savegame = <savegame>
endscript

script ui_band_mode_create_menu_join 
	Obj_GetID
	GetTags

	Change \{rich_presence_context = presence_gigboard_and_setlist}
	array = [
		{unfocus retail_menu_unfocus}
		{pad_choose ui_band_mode_choose params = {join}}
	]
	user_control_helper_get_buttonchar button = green controller = <controller>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <objID>
		text = (<buttonchar> + qs(0x3bf1e078))
		font = fontgrid_text_a6
		dims = (200.0, 0.0)
		allow_expansion
		rgba = ($menu_unfocus_color)
		event_handlers = <array>
		internal_scale = 0.6
		just = [center bottom]
		internal_just = [center center]
		not_focusable
	}
	<objID> :se_setprops Pos = (0.0, 0.0)
endscript

script ui_band_mode_create_gigs 
	Obj_GetID
	se_getparentid
	<parent_id> :se_getparentid
	GetTags
	event_handlers = [
		{focus ui_band_mode_create_gigs_focus}
		{unfocus ui_band_mode_create_gigs_unfocus}
	]
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = name_arrow_up
		just = [center bottom]
		pos_anchor = [center bottom]
		Pos = (0.0, 0.0)
		Scale = 1.15
	}
	i = ($current_gig_number)
	if ((<i> < 1) || (<i> > (($gh4_career_band_songs.num_tiers) -2)))
		i = 1
	endif
	formatText checksumName = Tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($gh4_career_band_songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<i> < 10)
		formatText checksumName = texture 'gig_poster_small_0%i' i = <i>
	else
		formatText checksumName = texture 'gig_poster_small_%i' i = <i>
	endif
	if NOT GotParam \{first_texture}
		first_texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			first_complete = 1
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		dims = (100.0, 125.0)
		event_handlers = <event_handlers>
		just = [center center]
		tags = {
			index = <i>
			controller = <controller>
		}
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = <texture>
		dims = (100.0, 125.0)
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
	}
	diff_alpha = 0
	if (<completed> = 1 || <completed> = 2)
		diff_alpha = 1
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = gig_poster_checkmark_128
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, 0.0)
		alpha = <diff_alpha>
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = name_arrow_dn
		just = [center top]
		pos_anchor = [center top]
		Scale = 1.15
		Pos = (0.0, 0.0)
	}
	<objID> :SetProps event_handlers = [
		{pad_up ui_band_mode_create_gigs_scroll}
		{pad_down ui_band_mode_create_gigs_scroll params = {down}}
	]
	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_hide_arrows id = <current_desc>
	endif
endscript

script ui_band_mode_create_gigs_scroll 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = {1 child = 0}}
	<resolved_id> :GetTags
	if (<index> < 1)
		index = 1
	elseif (<index> > (($gh4_career_band_songs.num_tiers) -2))
		index = (($gh4_career_band_songs.num_tiers) -2)
	endif
	if GotParam \{down}
		i = (<index> + 1)
		RunScriptOnScreenElement id = {<objID> child = {2 child = 0}} ui_band_mode_create_gigs_blink_arrow
	else
		i = (<index> - 1)
		RunScriptOnScreenElement id = {<objID> child = {0 child = 0}} ui_band_mode_create_gigs_blink_arrow
	endif
	begin
	if (<i> < 1)
		i = (($gh4_career_band_songs.num_tiers) -2)
	elseif (<i> > (($gh4_career_band_songs.num_tiers) -2))
		i = 1
	endif
	if (<i> = <index>)
		break
	endif
	formatText checksumName = Tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($gh4_career_band_songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		if (<i> < 10)
			formatText checksumName = texture 'gig_poster_small_0%i' i = <i>
		else
			formatText checksumName = texture 'gig_poster_small_%i' i = <i>
		endif
		<resolved_id> :se_setprops texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			SetScreenElementProps id = {<resolved_id> child = 0} alpha = 1.0
		else
			SetScreenElementProps id = {<resolved_id> child = 0} alpha = 0.0
		endif
		break
	endif
	if GotParam \{down}
		i = (<i> + 1)
	else
		i = (<i> - 1)
	endif
	repeat
	<resolved_id> :SetTags index = <i>
	if GotParam \{down}
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster params = {down}
	else
		i = (<index> + 1)
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster
	endif
endscript

script ui_band_mode_create_gigs_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	band_mode_menu :SetTags \{net_gig_ready = 1}
	generic_menu_pad_choose_sound
	Change \{current_progression_flag = career_band}
	Change current_gig_number = <index>
	ui_band_mode_choose \{gigs}
endscript

script ui_band_mode_create_gigs_blink_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	se_setprops \{Scale = 1.3499999
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{Scale = 1.15
		time = 0.1
		motion = ease_out}
endscript

script ui_band_mode_create_gigs_move_poster 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	se_setprops \{alpha = 0.0}
	if GotParam \{down}
		se_setprops \{Pos = (0.0, -10.0)}
		se_setprops \{alpha = 1.0
			Pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	else
		se_setprops \{Pos = (0.0, 10.0)}
		se_setprops \{alpha = 1.0
			Pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	endif
endscript

script ui_band_mode_create_gigs_focus 
endscript

script ui_band_mode_create_gigs_unfocus 
endscript

script ui_band_mode_create_menu_gamer_cards 
	Obj_GetID
	if ($is_network_game = 1)
		if NOT ($net_band_mode_menu = lobby)
			NetSessionFunc \{Obj = party
				func = get_party_members}
			GetArraySize <connections>
			i = 0
			begin
			CreateScreenElement {
				Type = ContainerElement
				parent = <objID>
				dims = (200.0, 40.0)
				just = [center bottom]
			}
			container_id = <id>
			CreateScreenElement {
				Type = TextBlockElement
				fit_width = `expand	dims`
				fit_height = `scale	down	if	larger`
				parent = <id>
				text = (<connections> [<i>].gamertag)
				font = fontgrid_text_a6
				dims = (0.0, 40.0)
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{focus career_friendslist_scroll}
					{unfocus career_friendslist_stop_scroll}
				]
				internal_scale = 0.75
				just = [left bottom]
				internal_just = [left center]
				pos_anchor = [left bottom]
				Pos = (0.0, 0.0)
			}
			GetScreenElementDims id = <id>
			if NOT (<width> > 200)
				<id> :se_setprops {
					just = [center bottom]
					internal_just = [center center]
					pos_anchor = [center bottom]
					Pos = (0.0, 0.0)
				}
			endif
			<container_id> :se_setprops {
				focusable_child = <id>
				event_handlers = [
					{pad_choose menu_show_gamercard_from_netid params = {net_id = (<connections> [<i>].user_id)}}
					{pad_choose generic_menu_pad_choose_sound}
				]
			}
			i = (<i> + 1)
			repeat <array_Size>
		else
			i = 0
			begin
			net_id = [0 0]
			getplayerinfo (<i> + 1) net_id_first
			getplayerinfo (<i> + 1) net_id_second
			SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
			getplayerinfo (<i> + 1) gamertag
			Name = $<gamertag>
			CreateScreenElement {
				Type = TextBlockElement
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				parent = <objID>
				text = <Name>
				font = fontgrid_text_a6
				dims = (200.0, 40.0)
				allow_expansion
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <net_id>}}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
			i = (<i> + 1)
			repeat ($current_num_players)
		endif
	else

		myinterfaceelement :GetTags
		GetArraySize \{menus}
		i = 0
		begin
		curr_menu = (<menus> [<i>])
		<curr_menu> :GetTags
		if NOT (<menu> = join)
			NetSessionFunc Obj = match func = get_gamertag params = {controller = <controller>}
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			if (<Name> = qs(0x03ac90f0))
				formatText TextName = Name qs(0x260b41e9) n = (<controller> + 1)
			endif
			CreateScreenElement {
				Type = TextBlockElement
				parent = <objID>
				text = <Name>
				font = fontgrid_text_a6
				dims = (200.0, 40.0)
				allow_expansion
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_band_mode_show_gamertag params = {net_id = <user_id> device_num = <controller>}}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
		else
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script ui_band_mode_show_gamertag 
	if NOT GotParam \{device_num}
		return
	endif
	if islocallysignedin controller = <device_num>
		if GotParam \{net_id}
			NetSessionFunc func = showGamerCard params = {player_xuid = <net_id> controller_index = <device_num>}
		endif
	endif
endscript

script ui_band_mode_choose 
	se_getparentid
	if GotParam \{direct}
		Obj_GetID
		<parent_id> = <objID>
	endif
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		myinterfaceelement :GetSingleTag \{menus}
		if NOT isscreenelementinfocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	if GotParam \{instrument}
		SetSpawnInstanceLimits \{Max = 1
			management = ignore_spawn_request}
		if ($is_network_game = 1)
			<parent_id> :GetSingleTag controller
		else
			get_player_num_from_controller controller_index = <device_num>
			if (<player_num> < 0)
				return
			endif
			getplayerinfo <player_num> controller
		endif
		if ($0xa53d906e = 1)
			myinterfaceelement :GetTags
			menu_id = (<menus> [$0xdb92eeef])
			0x5db302d9 = <controller>
			<menu_id> :GetSingleTag controller
			if (<controller> = <0x5db302d9> && <instrument> = vocals)
				controller = ($0xf8aac4ed)
			else
				controller = <0x5db302d9>
			endif
		endif
		ui_get_controller_parts_allowed controller = <controller>
		if NOT StructureContains structure = <allowed> <instrument>
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
			return
		elseif GetSingleTag \{has_mic}
			if ((<instrument> = vocals) && (<has_mic> = 0))
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
				return
			endif
		endif
		temp_instrument = <instrument>
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize <menus>
		<parent_id> :GetSingleTag index
		i = 0
		begin
		if NOT (<i> = <index>)
			curr_menu = (<menus> [<i>])
			<curr_menu> :GetSingleTag instrument
			if NOT (<instrument> = None)
				if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
					if NOT (<instrument> = <temp_instrument>)
						return
					endif
				else
					if (<instrument> = <temp_instrument>)
						return
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		instrument = <temp_instrument>
		switch <instrument>
			case guitar
			anim = guitar
			ui_band_mode_choose_sound controller = <controller>
			case bass
			anim = bass
			ui_band_mode_choose_sound controller = <controller>
			case drum
			anim = drums
			ui_band_mode_choose_sound controller = <controller>
			case vocals
			anim = vocals
			ui_band_mode_choose_sound controller = <controller>
		endswitch
		if ($is_network_game = 0)
			hacky_fix_band_celebrity_character Player = <player_num>
		endif
		<parent_id> :GetSingleTag index
		if cas_player_has_character_object Player = (<index> + 1)
			Band_PlayAnim Name = <character_object> anim = <anim> no_wait
		endif
		<parent_id> :SetTags {instrument = <instrument>}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = <instrument> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :SetTags {menu = lefty}
		endif
	elseif GotParam \{lefty}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
		else
			<parent_id> :SetTags {menu = difficulty}
		endif
		get_player_num_from_controller controller_index = <device_num>
		ui_band_mode_choose_sound instrument = Default controller = <controller>
		switch (<lefty>)
			case standard
			setplayerinfo <player_num> lefty_flip = 0
			setplayerinfo <player_num> lefthanded_gems = 0
			setplayerinfo <player_num> lefthanded_button_ups = 0
			setplayerinfo <player_num> lefthanded_button_ups_flip_save = 0
			setplayerinfo <player_num> lefthanded_gems_flip_save = 0
			case lefty
			setplayerinfo <player_num> lefty_flip = 1
			setplayerinfo <player_num> lefthanded_gems = 1
			setplayerinfo <player_num> lefthanded_button_ups = 1
			setplayerinfo <player_num> lefthanded_button_ups_flip_save = 1
			setplayerinfo <player_num> lefthanded_gems_flip_save = 1
			default
			<has_mic> = 0
			if controller_has_headset controller = <device_num>
				<has_mic> = 1
			elseif ismicrophonepluggedin
				<has_mic> = 1
			endif
			if (<has_mic> = 0)
				if ($0xa53d906e)
					0x57b90bdf \{0x894809f0}
				endif
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <device_num>}
				return
			endif
			setplayerinfo <player_num> vocals_highway_view = <lefty>
		endswitch
	elseif GotParam \{difficulty}
		if <parent_id> :GetSingleTag instrument
			if (<instrument> = vocals)
				<has_mic> = 0
				if controller_has_headset controller = <device_num>
					<has_mic> = 1
				elseif ismicrophonepluggedin
					<has_mic> = 1
				endif
				if (<has_mic> = 0)
					generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <device_num>}
					return
				endif
			endif
		endif
		<parent_id> :SetTags {difficulty = <difficulty>}
		ui_band_mode_choose_sound instrument = Default controller = <controller>
		SetArrayElement ArrayName = default_difficulty globalarray index = <device_num> NewValue = <difficulty>
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {difficulty = <difficulty> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :SetTags {menu = ready2}
			myinterfaceelement :obj_spawnscript \{ui_band_difficulty_continue}
		endif
	elseif GotParam \{root}
		if (<root> = instrument)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = instrument}
			if ($is_network_game = 1)
				<parent_id> :SetTags {instrument = None}
				myinterfaceelement :SetTags \{net_instruments_ready = 0}
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = None player_num = <player_num> spawn_script_now}
			endif
		elseif (<root> = lefty)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = lefty}
		elseif (<root> = difficulty)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = difficulty}
		elseif (<root> = character)
			<parent_id> :SetTags {menu = character}
			ui_band_mode_choose_sound instrument = Default controller = <controller>
		elseif (<root> = p2_character)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = p2_character}
		elseif (<root> = friends)
			<parent_id> :SetTags {menu = friends}
		elseif (<root> = gigs)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = gigs}
		elseif (<root> = gamer_cards)
			ui_band_mode_choose_sound instrument = Default controller = <controller>
			<parent_id> :SetTags {menu = gamer_cards}
		endif
	elseif GotParam \{ready}
		if (<ready> = ready)
			<parent_id> :SetTags {menu = ready}
			if ($net_band_mode_menu = lobby)
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {ready = ready player_num = <player_num> spawn_script_now}
			elseif (($net_band_mode_menu = invite) || ($net_band_mode_menu = HOST))
				<parent_id> :GetSingleTag user_id
				career_update_party_data user_id = <user_id> menu = ready
			endif
		elseif (<ready> = p2_ready)
			<parent_id> :SetTags {menu = p2_ready}
			myinterfaceelement :obj_spawnscript \{ui_character_hub_continue}
		endif
	elseif GotParam \{join}
		ui_band_mode_choose_sound controller = <device_num>
		if ($is_network_game = 1)
			if (($net_band_mode_menu = HOST) || ($net_band_mode_menu = join))
				if isXenon
					if NOT (CheckForSignIn controller_index = <device_num>)
						ui_band_mode_signin device_num = <device_num>
						net_career_wait_until_menu_update_is_done
						<parent_id> :obj_spawnscript ui_band_mode_update_menu
						return
					endif
				else

				endif
			endif
			if ($net_band_mode_menu = HOST)
				NetSessionFunc \{Obj = party
					func = get_party_members}
				GetArraySize <connections>
				if (<array_Size> > 3)
					update_network_ticker \{msg_checksum = full}
					return
				endif
			endif
		else
			if GotParam \{change_profile}
				if NOT isanycontrollersignedin
					ui_band_mode_signin device_num = <device_num>
					return
				endif
			endif
		endif
		0x270bf1b0 = 0
		if GotParam \{0xca2ab2b6}
			<0x270bf1b0> = 1
		endif
		<parent_id> :GetTags
		myinterfaceelement :GetTags
		if ((IsGuitarController controller = <device_num>) && (<0x270bf1b0> = 0))
			if (<current_guitar> = <total_guitar>)
				update_network_ticker \{msg_checksum = max_guitars}
				return
			endif
			<parent_id> :SetTags controller_instrument = guitar
			myinterfaceelement :SetTags {current_guitar = (<current_guitar> + 1)}
		elseif ((isdrumcontroller controller = <device_num>) && (<0x270bf1b0> = 0))
			if (<current_drum> = <total_drum>)
				update_network_ticker \{msg_checksum = max_drum}
				return
			endif
			<parent_id> :SetTags controller_instrument = drum
			myinterfaceelement :SetTags {current_drum = (<current_drum> + 1)}
		elseif (($allow_controller_for_all_instruments) = 0)
			if ($is_network_game = 1)
				mic = 0
				if ismicrophonepluggedin
					mic = 1
				endif
				if is_regular_controller controller = <controller>
					if controller_has_headset controller = <controller>
						mic = 1
					endif
				endif
				if (0 = <mic>)
					update_network_ticker \{msg_checksum = no_mic}
					return
				endif
			endif
			if (<current_mic> = <total_mic>)
				update_network_ticker \{msg_checksum = max_vocals}
				return
			endif
			<parent_id> :SetTags controller_instrument = mic
			myinterfaceelement :SetTags {current_mic = (<current_mic> + 1)}
		endif
		menu = root
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_show_character Player = (<index> + 1)
		<parent_id> :SetTags {menu = <menu>}
		isguest = FALSE
		if isXenon
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				isguest = true
			endif
		endif
		ui_band_mode_save_tags controller = <device_num>
	elseif GotParam \{character}
		if (<character> = character)
			<parent_id> :SetTags {menu = root}
		elseif (<character> = p2_character)
			if ($is_network_game = 1)
				<parent_id> :SetTags {menu = net_local_join}
			else
				<parent_id> :SetTags {menu = p2_root}
			endif
		endif
	elseif GotParam \{gigs}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
		else
			<parent_id> :SetTags {menu = root}
		endif
	elseif GotParam \{net_local_join}
		ui_band_mode_choose_sound instrument = Default controller = <controller>
		<parent_id> :SetTags {menu = gamer_cards}
	elseif GotParam \{friends}
		ui_band_mode_choose_sound back controller = <controller>
		<parent_id> :SetTags {
			menu = invites
			friend_name = <Name>
			friend_id = <id>
			friend_sentfriendrequest = <sentfriendrequest>
			friend_sentinvite = <sentinvite>
			friend_friendstate = <friendstate>
			cant_invite = <cant_invite>
		}
	elseif GotParam \{invites}
		if NOT isps3
			<parent_id> :SetTags {menu = friends}
		else
			<parent_id> :SetTags {menu = invites}
		endif
		invite_to_game net_id = <net_id> Name = <Name> instrument = <instrument_type> menu_index = <index>
	elseif GotParam \{edit_hero}
		if cas_queue_is_busy
			return
		endif
		ui_band_mode_choose_sound instrument = Default controller = <controller>
		band_edit_character Player = <Player> 0x3d48d15c = <0x3d48d15c>
	elseif GotParam \{band_info}
		ui_band_mode_choose_sound instrument = Default controller = <controller>
		menu_choose_band_make_selection band_index = <band_index> from_options = <from_options>
	endif
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<parent_id> :obj_spawnscript ui_band_mode_update_menu
	if ($is_network_game = 1)
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'band_mode')
			ui_band_mode_helper_text <...>
		endif
	else
		ui_band_mode_helper_text <...>
	endif
endscript

script ui_band_mode_back 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ScriptIsRunning \{trigger_cas_rebuild_loop}
		return
	endif
	if ($ps2_changing_appearance_paks = 1 || $ps2_loading_appearance_paks = 1)
		return
	endif
	if cas_queue_is_busy in_queue_too <...>
		return
	endif
	cas_queue_wait
	GetTags
	se_getparentid
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		myinterfaceelement :GetSingleTag \{menus}
		if NOT isscreenelementinfocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	switch <menu>
		case instrument
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			if (<index> = $0xf8aac4ed && $0xa53d906e = 1)
				0x57b90bdf \{0x894809f0}
				return
			endif
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		if ($0xa53d906e = 1)
			0x57b90bdf \{0x894809f0}
		endif
		case lefty
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
		else
			SetTags \{menu = instrument
				instrument = None}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case difficulty
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			SetTags \{menu = lefty}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case character
		get_player_num_from_controller controller_index = <controller>
		band_character_select_back_out Player = <player_num> controller = <controller>
		SetTags \{menu = root}
		ui_band_mode_choose_sound back controller = <controller>
		case p2_character
		if ($is_network_game = 1)
			ui_band_mode_choose_sound back controller = <controller>
			get_player_num_from_controller controller_index = <controller>
			band_character_select_back_out Player = <player_num> controller = <controller>
			SetTags \{menu = net_local_join}
		else
			SetTags \{menu = p2_root}
		endif
		case root
		get_player_num_from_controller controller_index = <controller>
		if (<index> = $0xf8aac4ed && $0xa53d906e = 1)
			0x57b90bdf \{0x894809f0}
			Change \{0xf8aac4ed = -1}
			Change \{0x81bfdc7e = -1}
		endif
		if ($band_mode_current_leader = <index>)
			Change \{band_mode_current_leader = -1}
		endif
		ui_band_mode_kill_character Player = (<index> + 1)
		myinterfaceelement :GetTags
		ui_band_mode_choose_sound back controller = <controller>
		GetSingleTag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			myinterfaceelement :SetTags {current_guitar = (<current_guitar> - 1)}
			case drum
			myinterfaceelement :SetTags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				myinterfaceelement :SetTags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		SetTags \{controller_instrument = None}
		SetTags \{menu = join
			instrument = None
			difficulty = None}
		SetTags \{controller = -1
			allowed = {
			}}
		se_setprops \{block_events
			exclusive_device = -1}
		case p2_root
		generic_event_back \{nosound}
		ui_band_mode_choose_sound back controller = <controller>
		case join
		if ($is_network_game = 1)
			if ($primary_controller = <controller>)
				if NOT (($net_band_mode_menu = HOST))
					ui_band_mode_choose_sound back controller = <controller>
				endif
				cas_destroy_all_characters
				ui_event \{event = menu_back
					data = {
						state = uistate_group_play
					}}
			else
				return
			endif
		else
			if ($0xa53d906e = 1)
				0x57b90bdf \{0x894809f0}
			endif
			cas_destroy_all_characters
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case ready
		if ($is_network_game = 1)
			if ($net_band_mode_menu = lobby)
				SetTags \{menu = net_local_root}
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_back data_to_send = {player_num = <player_num> spawn_script_now}
			else
				<parent_id> :GetSingleTag user_id
				career_update_party_data user_id = <user_id> menu = net_local_join
				SetTags \{menu = net_local_join}
			endif
		else
			SetTags \{menu = root}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		myinterfaceelement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_animate_unready current_desc = <current_desc>
		case net_local_root
		if ($net_popup_active = 0)
			if NOT ScriptIsRunning \{net_ui_band_mode_countdown_to_gig}
				ui_event_get_top
				if (<base_name> = 'band_mode')
					generic_blocking_execute_script pad_script = generic_event_choose pad_params = {data = {state = uistate_online_quit_warning is_popup player_device = <device_num>}}
				endif
			endif
		endif
		return
		case net_local_join
		if ((($net_band_mode_menu = HOST) && ($primary_controller = <controller>)) || ($net_band_mode_menu = invite))
			if NetSessionFunc \{Obj = party
					func = is_host}
				confirm_script = net_career_host_disband_party
			else
				confirm_script = net_career_leave_party_confirm
			endif
			if ($net_popup_active = 0)
				generic_event_choose state = uistate_online_quit_warning data = {is_popup confirm_script = <confirm_script> player_device = <device_num>}
			endif
			return
		endif
		ui_band_mode_choose_sound back controller = <controller>
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_kill_character Player = <player_num>
		myinterfaceelement :GetTags
		GetSingleTag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			myinterfaceelement :SetTags {current_guitar = (<current_guitar> - 1)}
			case drum
			myinterfaceelement :SetTags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				myinterfaceelement :SetTags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		SetTags \{controller_instrument = None}
		if isXenon
			(<descs> [<index>]) :Obj_KillSpawnedScript Name = update_headset_status
		endif
		(<descs> [<index>]) :se_setprops headset_icon_alpha = (0.0)
		NetSessionFunc func = removecontroller params = {controller = <controller>}
		SetTags \{menu = join
			instrument = None
			difficulty = None
			marked_in = 0}
		update_network_ticker \{msg_checksum = signin_change}
		case friends
		ui_band_mode_choose_sound back controller = <controller>
		SetTags \{menu = net_local_join}
		case invites
		ui_band_mode_choose_sound back controller = <controller>
		if NOT isps3
			SetTags \{menu = friends}
		else
			SetTags \{menu = net_local_join}
		endif
		case gigs
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
		else
			SetTags \{menu = root}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case ready2
		ui_band_mode_choose_sound back controller = <controller>
		SetTags \{menu = difficulty}
		myinterfaceelement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :se_setprops reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :se_waitprops
		<current_desc> :se_setprops reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
		case p2_ready
		SetTags \{menu = p2_root}
		ui_band_mode_choose_sound back controller = <controller>
		myinterfaceelement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :se_setprops reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :se_waitprops
		<current_desc> :se_setprops reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
		case gamer_cards
		ui_band_mode_choose_sound back controller = <controller>
		if ($is_network_game = 1)
			if NOT ($net_band_mode_menu = lobby)
				SetTags \{menu = net_local_join}
			else
				SetTags \{menu = net_local_root}
			endif
		else
			SetTags \{menu = root}
		endif
	endswitch
	ui_band_mode_helper_text
	ui_band_mode_update_menu
endscript

script ui_band_mode_continue 
	if is_ui_event_running
		return
	endif
	begin
	if NOT ScriptIsRunning \{trigger_cas_rebuild_loop}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait
	GetTags
	if NOT GotParam \{controller}
		controller = <device_num>
	endif
	if (($is_network_game = 1) && ($net_band_mode_menu = HOST))
		if NOT (<device_num> = ($primary_controller))
			SoundEvent \{event = ui_sfx_negative_select}
			update_network_ticker \{msg_checksum = non_primary_post}
			return
		endif
	endif
	if ($is_network_game = 0)
		if (<controller> != $band_mode_current_leader)
			SoundEvent \{event = ui_sfx_negative_select}
			SpawnScriptNow \{ui_band_mode_warning
				params = {
					text = $0xe51bf3a8
				}}
			return
		endif
	endif
	myinterfaceelement :GetTags
	0xa8ad9992 = 0
	0xdf179283 = 0
	GetArraySize <menus>
	i = 0
	begin
	menu_id = (<menus> [<i>])
	<menu_id> :GetTags
	if (<menu> = ready)
		0xa8ad9992 = (<0xa8ad9992> + 1)
	endif
	if NOT (<menu> = join)
		0xdf179283 = (<0xdf179283> + 1)
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if (<0xa8ad9992> = 0)
		0xdf179283 = 0
	endif
	if NOT (<0xa8ad9992> = <0xdf179283>)
		SpawnScriptNow \{ui_band_mode_warning
			params = {
				text = $0x5a422832
			}}
		return
	endif
	0xe8aaa0fa = 0
	if ($0xa53d906e = 1)
		Change \{band_mode_added_vocalist = 1}
		0x57b90bdf \{0x894809f0}
		0xe8aaa0fa = 1
		ui_event_wait_for_safe
	endif
	num_ready = 0
	Player = 1
	real_player = 1
	temp_devices = [-1 , -1 , -1 , -1]
	temp_devices_remove = [-1 , -1 , -1 , -1]
	array = []
	temp_characters = [arse arse arse arse]
	band_controller_types = [0 0 0 0]
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	add_player = 0
	if (<menu> = ready)
		add_player = 1
	endif
	if (<add_player> = 1)
		<num_ready> = (<num_ready> + 1)
		SetArrayElement ArrayName = temp_devices index = (<real_player> - 1) NewValue = <controller>
		if ($is_network_game)
			<check_cont> = ($primary_controller)
		else
			<check_cont> = $band_mode_current_leader
		endif
		if (<controller> = <check_cont>)
			primary_controller_ready = 1
		endif
		getplayerinfo (<i> + 1) character_id
		SetArrayElement ArrayName = temp_characters index = (<real_player> - 1) NewValue = <character_id>
		Name = qs(0x03ac90f0)
		AddArrayElement array = <array> element = <Name>
		if IsGuitarController controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) NewValue = 1
		elseif isdrumcontroller controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) NewValue = 2
		else
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) NewValue = 3
		endif
		<real_player> = (<real_player> + 1)
	else
		SetArrayElement ArrayName = temp_devices_remove index = <i> NewValue = <controller>
	endif
	i = (<i> + 1)
	repeat <array_Size>


	if ($is_network_game = 1)
		GetArraySize <temp_devices>
		controller_index = 0
		begin
		if ((<temp_devices> [<controller_index>]) = <device_num>)
			ok_to_start_search = 1
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_Size>
		if NOT GotParam \{ok_to_start_search}
			return
		endif
		if isXenon
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				SoundEvent \{event = ui_sfx_negative_select}
				SpawnScriptNow \{update_network_ticker
					params = {
						msg_checksum = guest_continue
					}}
				return
			endif
		endif
		if NOT GotParam \{primary_controller_ready}
			SpawnScriptNow \{update_network_ticker
				params = {
					msg_checksum = band_leader
				}}
			return
		endif
		if (<num_ready> > 0)
			Change \{current_progression_flag = career_band}
		else
			return
		endif
	elseif (<num_ready> < 2)
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		else
			SpawnScriptNow \{ui_band_mode_warning
				params = {
					text = qs(0xf5f5bb37)
				}}
		endif
		if (<0xe8aaa0fa> = 1)
			0xc45a8c18
		endif
		return
	elseif NOT GotParam \{primary_controller_ready}
		if NOT isXenon
			<text> = qs(0x6143626e)
		else
			<text> = qs(0x5bed4924)
		endif
		SpawnScriptNow ui_band_mode_warning params = {text = <text>}
		if (<0xe8aaa0fa> = 1)
			0xc45a8c18
		endif
		return
	else
		Change \{current_progression_flag = career_band}
	endif
	<Player> = 1
	begin
	if ((<temp_devices> [(<Player> - 1)]) < 0)
	endif
	if ((<temp_characters> [(<Player> - 1)]) = arse)

	endif
	formatText checksumName = player_device 'player%d_device' d = <Player>
	Change GlobalName = <player_device> NewValue = (<temp_devices> [(<Player> - 1)])
	setplayerinfo <Player> controller = (<temp_devices> [(<Player> - 1)])
	setplayerinfo <Player> character_id = (<temp_characters> [(<Player> - 1)])
	setplayerinfo <Player> is_local_client = 1
	if (<temp_devices> [(<Player> - 1)] = -1)
		setplayerinfo <Player> difficulty = ($default_difficulty [(<Player> - 1)])
	else
		setplayerinfo <Player> difficulty = ($default_difficulty [(<temp_devices> [(<Player> - 1)])])
	endif
	if ($is_network_game = 1)
		GetNetID controller_index = (<temp_devices> [(<Player> - 1)])
		NetSessionFunc func = get_gamertag params = {controller = (<temp_devices> [(<Player> - 1)])}
		SetArrayElement ArrayName = temp_net_id globalarray index = (<temp_devices> [(<Player> - 1)]) NewValue = {net_id_first = <net_id_first> net_id_second = <net_id_second> Name = <Name>}
	endif
	<Player> = (<Player> + 1)
	repeat (<real_player> - 1)
	if (($is_network_game = 1) && ($net_band_mode_menu = HOST))
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<array_Size> > 0)
			c = 0
			begin
			if ((<connections> [<c>].is_local) = 0)
				switch (<connections> [<c>].instrument)
					case eguitar
					part = guitar
					case edrums
					part = drum
					case emicrophone
					part = vocals
				endswitch
				setplayerinfo <Player> is_local_client = 0
				setplayerinfo <Player> part = <part>
				setplayerinfo <Player> difficulty = easy
				formatText checksumName = gamertag 'gamertag_%d' d = (<Player> - 1)
				Change GlobalName = <gamertag> NewValue = (<connections> [<c>].gamertag)
				setplayerinfo <Player> gamertag = <gamertag>
				Player = (<Player> + 1)
				num_ready = (<num_ready> + 1)
			endif
			c = (<c> + 1)
			repeat <array_Size>
		endif
	endif
	GetArraySize <temp_devices_remove>
	i = 0
	begin
	if NOT ((<temp_devices_remove> [<i>]) = -1)
		NetSessionFunc func = removecontroller params = {controller = (<temp_devices_remove> [<i>])}
		cas_queue_kill_player Player = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if (($is_network_game = 1) && (<num_ready> < 4))
		remote_player = (<num_ready> + 1)
		begin
		setplayerinfo <remote_player> is_local_client = 0
		remote_player = (<remote_player> + 1)
		repeat (4 - <num_ready>)
	endif
	if ($band_mode_mode = quickplay || $band_mode_mode = None)
		formatText checksumName = mode 'p%d_quickplay' d = <num_ready>
	elseif ($is_network_game = 1)
		mode = p4_career
		netoptions :pref_choose \{Name = game_modes
			checksum = p4_career}
		netoptions :pref_choose \{Name = Ranked
			checksum = Player}
		Change num_players_in_band = <num_ready>
		set_network_preferences
	else
		formatText checksumName = mode 'p%d_career' d = <num_ready>
	endif
	Change game_mode = <mode>
	Change current_num_players = <num_ready>
	Change \{band_mode_active = 1}
	Change \{in_join_band_screens = 0}
	Change band_mode_actual_devices = <temp_devices>
	cancel_all_cas_loads
	clear_exclusive_devices
	i = 0
	begin
	if NOT (<temp_devices> [<i>] = -1)
		add_exclusive_device device = (<temp_devices> [<i>])
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if ($band_mode_mode = quickplay)
		Change primary_controller = ($band_mode_current_leader)
		Change last_start_pressed_device = ($band_mode_current_leader)
		generic_event_choose no_sound state = uistate_setlist data = {use_all_controllers num_band_players = <num_ready> band_controller_types = <band_controller_types>}
		SoundEvent \{event = band_mode_career_ready}
	elseif ($is_network_game = 1)
		Change \{respond_to_signin_changed_all_players = 1}
		SoundEvent \{event = band_mode_career_ready}
		if ($net_band_mode_menu = join)

			ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
			ui_create_net_career_join_popup device_num = <device_num>
		elseif ($net_band_mode_menu = HOST)

			NetSessionFunc \{Obj = party
				func = set_party_joinable
				params = {
					joinable = 0
				}}
			NetSessionFunc \{Obj = match
				func = set_server_list_mode
				params = {
					host_only
				}}
			NetSessionFunc Obj = match func = start_server_list params = {controller = <device_num>}
			SetServerMode
			StartServer
			SetJoinMode \{$JOIN_MODE_PLAY}
			JoinServer
			Change \{net_band_mode_menu = lobby}
			generic_event_choose \{no_sound
				state = uistate_band_mode}
		endif
	else
		Change primary_controller = ($band_mode_current_leader)
		Change last_start_pressed_device = ($band_mode_current_leader)
		generic_event_choose \{state = uistate_band_difficulty
			no_sound
			data = {
				continue_data = {
					state = uistate_gig_posters
				}
			}}
		SoundEvent \{event = band_mode_career_ready}
	endif
	ui_band_mode_save_tags
endscript

script ui_band_mode_show_character 

	if (<Player> = -1)

		return
	endif
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	if NOT GotParam \{use_existing}
		if (($band_mode_mode = career) || ($is_network_game = 1) || (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
			get_controller_part controller = <controller>
			get_last_band_character_recorded Player = <Player> part = <controller_part>
			if NOT (<character_id> = None)
				if (<controller> < 4)
					SetArrayElement ArrayName = band_builder_random_preset_used globalarray index = <controller> NewValue = <character_id>
				endif
				if GotParam \{borrowed_from_band_leader}
					band_resolve_guest_characters Player = <Player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
				endif
				Change structurename = <player_status> character_id = <character_id>
				got_from_globaltags = 1
			endif
		endif
		if NOT GotParam \{got_from_globaltags}
			random_band_mode_character Player = <Player>
			set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> Player = <Player>
		endif
	endif
	cas_queue_new_character_profile Player = <Player> id = ($<player_status>.character_id) savegame = <savegame>
endscript

script random_band_mode_character 


	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	get_controller_part controller = <controller>
	if (<controller_part> = guitar)
		if (Random (@ 0 @ 1 )= 0)
			controller_part = bass
		endif
	endif
	if (Random (@ 0 @ 1 @ 2 )= 0)
		if NOT cas_get_random_car savegame = <savegame> controller = <controller>
			cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
		endif
	else
		cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
	endif
	set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> Player = <Player>
	if GotParam \{borrowed_from_band_leader}
		get_player_num_from_controller controller_index = <controller>
		band_resolve_guest_characters Player = <player_num> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	endif
	Change structurename = <player_status> character_id = <character_id>
	return character_id = <character_id>
endscript

script ui_band_mode_random_character 

	GetTags
	Player = (<index> + 1)
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	controller = ($<player_status>.controller)
	ui_band_mode_choose_sound instrument = Default controller = <controller>
	random_band_mode_character Player = <Player>
	cas_queue_new_character_profile Player = <Player> id = ($<player_status>.character_id) savegame = <savegame>
	se_getparentid
	band_character_rename index = <index> Player = <Player>
	if ($net_band_mode_menu = None)
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			given_focus = 0
		elseif ($band_mode_mode = quickplay)
			given_focus = 0
		else
			given_focus = 1
		endif
	else
		given_focus = 2
	endif
	<parent_id> :Obj_SpawnScriptNow ui_band_mode_update_menu params = {given_focus = <given_focus> skip_update_wait}
endscript

script ui_band_mode_kill_character 

	switch <Player>
		case 1
		if cas_player_has_character_object \{Player = 2}
			Band_PlayAnim Name = <character_object> anim = backoutr no_wait
		endif
		case 2
		if cas_player_has_character_object \{Player = 1}
			Band_PlayAnim Name = <character_object> anim = backoutl no_wait
		endif
		if cas_player_has_character_object \{Player = 3}
			Band_PlayAnim Name = <character_object> anim = backoutr no_wait
		endif
		case 3
		if cas_player_has_character_object \{Player = 2}
			Band_PlayAnim Name = <character_object> anim = backoutl no_wait
		endif
		if cas_player_has_character_object \{Player = 4}
			Band_PlayAnim Name = <character_object> anim = backoutr no_wait
		endif
		case 4
		if cas_player_has_character_object \{Player = 3}
			Band_PlayAnim Name = <character_object> anim = backoutl no_wait
		endif
	endswitch
	cas_queue_kill_player Player = <Player>
endscript

script ui_band_mode_check_menus 
	myinterfaceelement :GetTags
	GetArraySize <menus>
	Obj_GetID
	count = <array_Size>

	i = 0
	begin
	if ScreenElementExists id = (<menus> [<i>])
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = instrument)
			if NOT (<objID> = (<menus> [<i>]))
			endif
			GetScreenElementChildren id = (<menus> [<i>])
			if NOT GotParam \{children}
				return
			endif
			GetArraySize <children>
			j = 0
			begin
			if ScreenElementExists id = {(<menus> [<i>]) child = <j>}
				switch <j>
					case 0
					if StructureContains structure = <allowed> Name = guitar
						if NOT isscreenelementinfocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 1
					if StructureContains structure = <allowed> Name = bass
						if NOT isscreenelementinfocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 2
					if StructureContains structure = <allowed> Name = drum
						if NOT isscreenelementinfocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 3
					if StructureContains structure = <allowed> Name = vocals
						if NOT isscreenelementinfocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
				endswitch
			endif
			j = (<j> + 1)
			repeat <array_Size>
		endif
	endif
	i = (<i> + 1)
	repeat <count>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		i = 0
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		check_instrument = <instrument>
		j = 0
		begin
		curr_id_2 = (<menus> [<j>])
		if NOT (<curr_id> = <curr_id_2>)
			<curr_id_2> :GetTags
			index = -1
			if (<menu> = instrument)
				switch <check_instrument>
					case guitar
					index = 0
					case bass
					index = 1
					case drum
					index = 2
					case vocals
					index = 3
					default
				endswitch
				if (<index> != -1)
					k = 0
					begin
					if NOT (<k> = <index>)
						if ScreenElementExists id = {<curr_id_2> child = <k>}
							SetScreenElementProps id = {<curr_id_2> child = <k>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = NULL not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
					if NOT (<curr_id_2> = <objID>)
						if NOT <curr_id_2> :Menu_SelectedIndexIs <index>
							<curr_id_2> :menu_changeselection
						endif
					endif
					k = 0
					begin
					if NOT (<k> = <index>)
						if ScreenElementExists id = {<curr_id_2> child = <k>}
							SetScreenElementProps id = {<curr_id_2> child = <k>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = NULL not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
				endif
				RemoveParameter \{index}
				RemoveParameter \{menu}
			endif
		endif
		j = (<j> + 1)
		repeat <count>
		i = (<i> + 1)
		repeat <count>
		return
	endif
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	check_instrument = <instrument>
	j = 0
	begin
	curr_id_2 = (<menus> [<j>])
	if NOT (<curr_id> = <curr_id_2>)
		<curr_id_2> :GetTags
		index = -1
		if (<menu> = instrument)
			switch <check_instrument>
				case guitar
				index = 0
				case bass
				index = 1
				case drum
				index = 2
				case vocals
				index = 3
				default
			endswitch
			if (<index> != -1)
				if ScreenElementExists id = {<curr_id_2> child = <index>}
					SetScreenElementProps id = {<curr_id_2> child = <index>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = NULL not_focusable
				endif
				if <curr_id_2> :Menu_SelectedIndexIs <index>
					<curr_id_2> :menu_changeselection
				endif
				if ScreenElementExists id = {<curr_id_2> child = <index>}
					SetScreenElementProps id = {<curr_id_2> child = <index>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = NULL not_focusable
				endif
			endif
			RemoveParameter \{index}
			RemoveParameter \{menu}
		endif
	endif
	j = (<j> + 1)
	repeat <count>
	i = (<i> + 1)
	repeat <count>
	i = 0
	begin
	i = (<i> + 1)
	repeat <count>
endscript

script ui_band_mode_check_disconnect 
	myinterfaceelement :GetSingleTag \{menus}
	GetTags
	if (<index> = 3)
		if ismicrophonepluggedin
			0xb045b600 = connected
		else
			0xb045b600 = disconnected
		endif
	endif
	begin
	GetActiveControllers
	begin
	if NOT ScriptIsRunning \{ui_band_mode_check_menus}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	curr_menu = (<menus> [<index>])
	<curr_menu> :GetSingleTag controller
	if (<controller> != -1)
		if (<active_controllers> [<controller>] = 0)
			<curr_menu> :GetSingleTag menu
			if NOT (<menu> = join)
				cas_queue_wait
				if ($0xa53d906e = 1 && <index> = $0xdb92eeef)
					0xbc6a73b6 = (<menus> [$0x81bfdc7e])
				endif
				<curr_menu> :SetTags {menu = root controller = -1 allowed = {}}
				<curr_menu> :obj_spawnscript ui_band_mode_back
				<curr_menu> :se_setprops {block_events exclusive_device = -1}
				if GotParam \{0xbc6a73b6}
					ui_event_wait_for_safe
					curr_menu = <0xbc6a73b6>
					<curr_menu> :SetTags {menu = root controller = -1 allowed = {}}
					<curr_menu> :obj_spawnscript ui_band_mode_back
					<curr_menu> :se_setprops {block_events exclusive_device = -1}
				endif
			endif
		endif
	elseif (<index> = 3)
		if NOT ismicrophonepluggedin
			if (<0xb045b600> != disconnected)
				if ($0xa53d906e = 1)
					cas_queue_wait
					Obj_GetID
					<objID> :SetTags {menu = root}
					<objID> :obj_spawnscript ui_band_mode_back
					0x57b90bdf \{0x894809f0}
					ui_event_wait_for_safe
				endif
				ui_band_mode_helper_text
			endif
			0xb045b600 = disconnected
		else
			if (<0xb045b600> != connected)
				ui_band_mode_helper_text
			endif
			0xb045b600 = connected
		endif
	endif
	RemoveParameter \{curr_menu}
	RemoveParameter \{menu}
	Wait \{1
		gameframes}
	repeat
endscript

script ui_band_mode_warning \{text_scale = 1.4
		time = 3}
	if ($is_network_game = 1)
		if GotParam \{press_start_to_proceed}
			update_network_ticker \{msg_checksum = press_start_to_proceed}
		else
			if GotParam \{text}
				update_network_ticker msg = <text> no_checksum
			else
				SoundEvent \{event = ui_sfx_negative_select}
				update_network_ticker \{msg_checksum = more_players_needed}
			endif
		endif
	else
		SetSpawnInstanceLimits \{Max = 1
			management = kill_oldest}
		destroy_menu \{menu_id = 0xf0106221}
		CreateScreenElement {
			Type = TextBlockElement
			parent = myinterfaceelement
			id = 0xf0106221
			font = fontgrid_text_a6
			text = <text>
			rgba = [200 200 200 255]
			Scale = <text_scale>
			Pos = (640.0, 290.0)
			just = [center center]
			z_priority = 9999
			dims = (768.0, 0.0)
			fit_width = `scale	each	line	if	larger`
			fit_height = `expand	dims`
			internal_just = [center top]
			internal_scale = (0.6, 0.6)
		}
		Wait <time> Seconds ignoreslomo
		destroy_menu \{menu_id = 0xf0106221}
		net_ticker_update_msg msg_type = vert msg = <text>
	endif
endscript

script ui_band_mode_signin 

	Change \{respond_to_signin_changed_func = None}
	myinterfaceelement :se_setprops \{block_events}
	if isXenon
		if ($band_mode_show_signin = 1)
			call_blade = 0
			if ($is_network_game = 1)
				if (CheckForSignIn local controller_index = <device_num>)
					if NOT (CheckForSignIn controller_index = <device_num>)
						NetSessionFunc \{func = showsigninui
							params = {
								convert_offline_to_guest
							}}
						call_blade = 1
					endif
				else
					NetSessionFunc \{func = showsigninui4pane
						params = {
							online_only
						}}
					call_blade = 1
				endif
			else
				NetSessionFunc \{func = showsigninui4pane}
				call_blade = 1
			endif
			if (<call_blade> = 1)
				wait_for_blade_complete
			endif
			if ($is_network_game = 1)
				update_network_ticker \{msg_checksum = signin_change}
			endif
		endif
	endif
	Change \{respond_to_signin_changed_func = ui_band_mode_signin_changed}
	myinterfaceelement :se_setprops \{unblock_events}
endscript

script ui_band_mode_helper_text 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_Size = 0
	endif
	num = 0
	0x1a4a3db6 = 0
	0xb8409a0a = 0
	num_joined = 0
	i = 0
	if (<array_Size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = ready)
			num = (<num> + 1)
		endif
		if (<menu> = ready2)
			0x1a4a3db6 = (<0x1a4a3db6> + 1)
		endif
		if (<menu> = instrument && StructureContains structure = <allowed> vocals)
			0xb8409a0a = 1
		endif
		if (<menu> = join)
			if ($band_mode_current_leader = <controller>)
				if isXenon
					band_kill_character_select_menus
				endif
				Change \{band_mode_current_leader = -1}
				if GotParam \{device_num}
					if (<device_num> != -1)
						ui_band_mode_choose_leader \{device_num = -1}
					endif
				else
					ui_band_mode_choose_leader \{device_num = -1}
				endif
			endif
		else
			num_joined = (<num_joined> + 1)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	clean_up_user_control_helpers
	if ($is_network_game = 1)
		if ($net_career_invite_flag = 0)
			add_user_control_helper \{all_buttons
				text = qs(0xc18d5e76)
				button = green
				z = 100000
				all_buttons}
		endif
		if ($num_players_in_band = 0)
			if (<num> >= 1)
				if ($net_band_mode_menu = HOST)
					add_user_control_helper \{text = qs(0xc776b8b9)
						button = start
						z = 100000}
				elseif ($net_band_mode_menu = join)
					add_user_control_helper \{text = qs(0x6968900b)
						button = start
						z = 100000}
				endif
			endif
			if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
				if isXenon
					add_user_control_helper \{all_buttons
						text = qs(0x17df5913)
						button = yellow
						z = 100000}
				endif
			endif
			if isps3
				add_user_control_helper \{all_buttons
					text = qs(0x306229d7)
					button = yellow
					z = 100000}
			endif
			add_user_control_helper \{all_buttons
				text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		else
			if NOT (ScriptIsRunning check_num_matchmaking_players_loop)
				if IsHost
					add_user_control_helper \{text = qs(0x182f0173)
						button = start
						z = 100000}
				endif
				if isps3
					add_user_control_helper \{all_buttons
						text = qs(0x306229d7)
						button = yellow
						z = 100000}
				endif
				add_user_control_helper \{all_buttons
					text = qs(0xaf4d5dd2)
					button = red
					z = 100000}
			else
				if isps3
					add_user_control_helper \{all_buttons
						text = qs(0x306229d7)
						button = yellow
						z = 100000}
				endif
			endif
		endif
	else
		if GotParam \{root}
			if (<root> = gigs)
				add_user_control_helper \{all_buttons
					text = qs(0xc18d5e76)
					button = green
					z = 100000
					all_buttons}
			else
				add_user_control_helper \{all_buttons
					text = qs(0xc18d5e76)
					button = green
					z = 100000
					all_buttons}
			endif
		else
			add_user_control_helper \{all_buttons
				text = qs(0xc18d5e76)
				button = green
				z = 100000
				all_buttons}
		endif
		0xaef4c8a9
		if (<num> > 0 && $0xa53d906e = 0 && <0x5218ed0b> = 0 && ismicrophonepluggedin)
			add_user_control_helper \{text = $0xf637d043
				button = yellow
				z = 100000}
		endif
		if (<0x1a4a3db6> > 0 && $0xa53d906e = 0 && $band_mode_added_vocalist = 1 && <0xb8409a0a> = 1)
			add_user_control_helper \{text = $0xdaa2dc25
				button = yellow
				z = 100000}
		endif
		if (<num> >= 2)
			add_user_control_helper \{text = qs(0x182f0173)
				button = start
				controller = $band_mode_current_leader
				z = 100000}
			if (<num> = 2 && $band_mode_last_num_ready < 2)
				if ($band_mode_current_leader = -1)
				elseif (<num> = <num_joined>)
					user_control_helper_get_buttonchar \{button = start
						controller = $band_mode_current_leader}
					formatText TextName = button_text qs(0x72f9ae62) b = <buttonchar>
					SpawnScriptNow ui_band_mode_warning params = {press_start_to_proceed text = <button_text> time = 5}
				endif
			endif
			try_leader = 1
		else
			if (<num_joined> >= 1)
				try_leader = 1
			endif
		endif
		ui_event_get_stack
		if NOT ((<stack> [0].base_name) = 'band_mode')
			RemoveParameter \{try_leader}
		endif
		Change \{band_mode_can_choose_leader = 0}
		if GotParam \{try_leader}
			if NOT is_band_character_select_up
				add_user_control_helper \{all_buttons
					text = qs(0x6f9fb401)
					button = blue
					z = 100000}
				Change \{band_mode_can_choose_leader = 1}
			endif
		endif
		if isXenon
			if NOT isanycontrollersignedin
			endif
		endif
		add_user_control_helper \{all_buttons
			text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	Change band_mode_last_num_ready = <num>
endscript

script isanycontrollersignedin 
	getmaxcontrollersignins
	i = 0
	begin
	if islocallysignedin controller = <i>
		return \{true}
	endif
	i = (<i> + 1)
	repeat <max_signins>
	return \{FALSE}
endscript

script ui_band_mode_scroll_sound 
	GetTags
	get_player_num_from_controller controller_index = <controller>
	SpawnScriptNow band_screen_ui_sound params = {sound_type = scroll <...> controller = <player_num>}
endscript

script ui_band_mode_choose_sound \{ready = 0
		controller = 0}
	GetTags
	get_player_num_from_controller controller_index = <controller>
	if (<player_num> < 0)
		player_num = 1
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	else
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = -0.15
			<pan1y> = 1
			<pan2x> = -0.15
			<pan2y> = 1
		elseif (<player_num> = 3)
			<pan1x> = 0.15
			<pan1y> = 1
			<pan2x> = 0.15
			<pan2y> = 1
		elseif (<player_num> = 4)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	endif
	if NOT GotParam \{back}
		if (<ready> = 1)
			switch <instrument>
				case drum
				PlaySound drum_select_affirmation_01 vol = -2 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case guitar
				PlaySound guitar_select_affirmation_1 vol = -13 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case vocals
				PlaySound mic_select_affirmation_01 vol = 15 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case bass
				PlaySound bass_select_affirmation_02 vol = -1 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				default
				PlaySound CheckBox_Check_SFX vol = 2 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endswitch
		else
			switch <instrument>
				case drum
				PlaySound UI_Sound_05 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case guitar
				PlaySound UI_Sound_05 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case vocals
				PlaySound UI_Sound_05 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case bass
				PlaySound UI_Sound_05 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				default
				PlaySound UI_Sound_05 vol = -6 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endswitch
		endif
	else GotParam \{back}
		PlaySound UI_Sound_09 vol = -7.5 buss = Front_End pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script ui_get_controller_parts_allowed 

	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {vocals}
		endif
	else
		allowed = {guitar bass drum vocals}
		if IsGuitarController controller = <controller>
			allowed = {guitar bass}
		elseif isdrumcontroller controller = <controller>
			allowed = {drum}
		elseif ismicrophonepluggedin
			allowed = {guitar bass drum vocals}
		endif
	endif
	if is_regular_controller controller = <controller>
		if controller_has_headset controller = <controller>
			allowed = {<allowed> vocals}
		endif
	endif
	gamemode_gettype
	if (<Type> = battle)
		RemoveParameter \{vocals
			struct_name = allowed}
	endif
	if GotParam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript

script proceed_to_band_lobby 

	Change \{net_band_mode_menu = lobby}
	ui_destroy_net_career_join_popup
	ui_event \{event = menu_change
		data = {
			state = uistate_band_mode
		}}
endscript

script add_gamertag_to_band_lobby 

	band_leader = 0
	if NOT GotParam \{Name}
		getplayerinfo (<index> + 1) controller
		getplayerinfo (<index> + 1) gamertag
		Name = $<gamertag>
		if (<Name> = qs(0x00000000))
			Name = qs(0x03ac90f0)
		endif
	else
		controller = -1
	endif
	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		ResolveScreenElementID id = [
			{id = <resolved_id>}
			{index = <index>}
		]
		if GotParam \{Name}
			band_gamertag_rename gamertag = <Name> index = <index> desc_item = <desc_item>
		endif
		if ((<controller> = $primary_controller) && (IsHost) && (<menu> = net_local_root))
			band_leader = 1
			<resolved_id> :se_setprops leader_indicator_alpha = 1
		endif
	endif
	return band_leader = <band_leader>
endscript

script scroll_ticker_each_line 
	if ScreenElementExists id = <id>
		<id> :se_setprops Pos = <start_pos>
		<id> :se_setprops Pos = <end_pos> time = <scroll_time>
		<id> :se_waitprops
	endif
endscript

script update_network_ticker 

	if NOT GotParam \{no_checksum}
		if NOT (GotParam msg_checksum)
			return
		endif
	else
		msg_type = vert
		replace = 1
	endif
	switch <msg_checksum>
		case waiting_for_data
		msg_type = horiz
		msg = qs(0x3cc23f45)
		replace = 1
		case menu_invite
		msg_type = horiz
		msg = qs(0x54c0d409)
		append = 1
		case max_guitars
		msg_type = vert
		msg = qs(0x715f83ca)
		replace = 1
		case max_vocals
		msg_type = vert
		if isXenon
			msg = qs(0x1ffdf92f)
		else
			msg = qs(0xe4ecd396)
		endif
		replace = 1
		case max_drum
		msg_type = vert
		msg = qs(0x8cda971e)
		replace = 1
		case no_mic
		msg_type = vert
		if isXenon
			msg = qs(0xc81bf63c)
		else
			msg = qs(0xa0a4ab6b)
		endif
		replace = 1
		case band_leader
		msg_type = vert
		msg = qs(0x9f054016)
		replace = 1
		case menu_host
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = start}
		formatText TextName = msg qs(0x9115c4fd) d = <buttonchar>
		append = 1
		case menu_join
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = green}
		green = <buttonchar>
		user_control_helper_get_buttonchar \{button = start}
		formatText TextName = msg qs(0xf55e812a) d = <green> e = <buttonchar>
		append = 1
		case guitarist_roles
		msg_type = vert
		msg = qs(0xecb5e393)
		replace = 1
		case ps3_chat
		msg_type = horiz
		msg = qs(0x925535f4)
		append = 1
		case full
		msg_type = horiz
		msg = qs(0xe5668284)
		replace = 1
		case non_primary_post
		msg_type = vert
		if NOT ($net_band_mode_menu = None)
			msg = qs(0xbbe54193)
		else
			msg = qs(0xce4db331)
		endif
		replace = 1
		case guest_continue
		msg_type = vert
		if ($net_band_mode_menu = HOST)
			msg = qs(0xff17a488)
		elseif ($net_band_mode_menu = join)
			msg = qs(0x17a405da)
		endif
		replace = 1
		case matchmaking_complete
		msg_type = vert
		msg = qs(0x9efc7426)
		replace = 1
		case host_ready_up
		msg_type = vert
		msg = qs(0x98bf8dc2)
		replace = 1
		case count_down
		msg_type = vert
		get_progression_globals \{career_band}
		formatText \{checksumName = tiername
			'tier%d'
			d = $current_gig_number}
		level_checksum = ($<tier_global>.<tiername>.level)
		if StructureContains structure = $LevelZones <level_checksum>
			if (<level_checksum> = load_z_tool)
				formatText TextName = msg qs(0x5a26279f) v = ($LevelZones.<level_checksum>.title) d = <index>
			elseif (<level_checksum> = load_z_newyork || <level_checksum> = load_z_ballpark || <level_checksum> = load_z_scifi || <level_checksum> = load_z_metalfest)
				formatText TextName = msg qs(0x57eca7a3) v = ($LevelZones.<level_checksum>.title) d = <index>
			else
				formatText TextName = msg qs(0x39d1ec9b) v = ($LevelZones.<level_checksum>.title) d = <index>
			endif
		else
			formatText TextName = msg qs(0xe175cbb7) d = <index>
		endif
		replace = 1
		case count_down_no_quit
		msg_type = vert
		msg = qs(0x60c100ac)
		replace = 1
		case gig_selected
		msg_type = horiz
		msg = qs(0xd893031e)
		replace = 1
		case no_gig_selected
		msg_type = vert
		replace = 1
		msg = qs(0xac8fa306)
		case signin_request
		msg_type = vert
		replace = 1
		formatText TextName = msg qs(0x194c3652) d = (<device_num> + 1)
		case more_players_needed
		msg_type = vert
		replace = 1
		msg = qs(0xf5f5bb37)
		case press_start_to_proceed
		msg_type = vert
		replace = 1
		user_control_helper_get_buttonchar \{button = start
			controller = $band_mode_current_leader}
		formatText TextName = msg qs(0x72f9ae62) b = <buttonchar>
		case join
		msg_type = horiz
		append = 1
		if (isXenon)
			if NOT (CheckForSignIn controller_index = <controller>)
				msg = qs(0xa7e21434)
			endif
		endif
		case signin_change
		msg_type = horiz
		replace = 1
		if (isXenon)
			myinterfaceelement :GetSingleTag \{menus}
			GetArraySize <menus>
			count = 0
			i = 0
			begin
			(<menus> [<i>]) :GetSingleTag menu
			if NOT (<menu> = join)
				if NOT (CheckForSignIn controller_index = <i>)
					count = (<count> + 1)
					msg = qs(0xa7e21434)
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if (<count> = 0)
				msg = qs(0x00000000)
			endif
		endif
	endswitch
	if (GotParam msg)
		if (<msg_type> = vert)
			msg_text_id = online_ticker_vert_text
		elseif (<msg_type> = horiz)
			msg_text_id = online_ticker_horiz_text
		else
			msg_text_id = online_ticker_vert_text
		endif
		ResolveScreenElementID id = [
			{id = myinterfaceelement}
			{local_id = band_menu_container}
			{local_id = online_ticker_window_element}
			{local_id = <msg_text_id>}
		]
		if ScreenElementExists id = <resolved_id>
			if (GotParam append)
				<resolved_id> :se_getprops
				formatText TextName = new_msg qs(0x307c5a2f) d = <text> t = <msg>
			elseif (GotParam replace)
				formatText TextName = new_msg qs(0x0204c31d) t = <msg>
			elseif (GotParam CLEAR)
				new_msg = qs(0x00000000)
			endif
			net_ticker_update_msg msg_type = <msg_type> msg = <new_msg>
		endif
	endif
endscript

script career_update_party_data 
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	i = 0
	num_players = 0
	begin
	formatText checksumName = Player 'player_%d' d = <i>
	if StructureContains structure = <party_shared_data> <Player>
		if (((<party_shared_data>.<Player>.user_id [0]) = (<user_id> [0])) &&
				((<party_shared_data>.<Player>.user_id [1]) = (<user_id> [1])))

			break
		endif
		num_players = (<num_players> + 1)
	endif
	i = (<i> + 1)
	repeat 4
	if (<num_players> < 4)
		switch <num_players>
			case 0
			data = {
				player_0 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 1
			data = {
				player_1 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 2
			data = {
				player_2 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 3
			data = {
				player_3 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
		endswitch
		NetSessionFunc Obj = party func = append_shared_data params = {data = <data>}
	endif
endscript

script career_poll_party_data 
	begin
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	i = 0
	begin
	formatText checksumName = Player 'player_%d' d = <i>
	if StructureContains structure = <party_shared_data> <Player>
		get_party_member_status member_id = (<party_shared_data>.<Player>.user_id)
		if (<is_party_member> = 1)
			if (<is_local> = 0)
				find_party_member_menu member_id = (<party_shared_data>.<Player>.user_id)
				if GotParam \{party_member_menu_index}
					GetSingleTag \{menus}
					(<menus> [<party_member_menu_index>]) :GetSingleTag menu
					if (<menu> = net_local_join)
						menu = net_remote_root
					endif
					if NOT (<menu> = (<party_shared_data>.<Player>.menu))
						(<menus> [<party_member_menu_index>]) :SetTags {
							menu = (<party_shared_data>.<Player>.menu)
						}
						(<menus> [<party_member_menu_index>]) :obj_spawnscript ui_band_mode_update_menu
					endif
				endif
			endif
		else
		endif
	endif
	i = (<i> + 1)
	repeat 4
	Wait \{1
		Second}
	repeat
endscript

script career_poll_party_for_joiners 
	GetSingleTag \{menus}
	begin
	if ((isXenon) && ($wait_for_sysnotify_unpause_flag = 0))
		wait_for_sysnotify_unpause
	endif
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> > ($net_num_joiners))
		joiner = 1
	elseif (<array_Size> < ($net_num_joiners))
		quitter = 1
	endif
	Change net_num_joiners = <array_Size>
	if GotParam \{joiner}
		net_add_party_joiner menus = <menus>
		RemoveParameter \{joiner}
	endif
	if GotParam \{quitter}
		net_remove_party_joiner menus = <menus>
		RemoveParameter \{quitter}
	endif
	Wait \{1
		Second}
	repeat
endscript

script find_party_member_menu 
	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize \{menus}
		i = 0
		begin
		(<menus> [<i>]) :GetSingleTag user_id
		if ((<member_id> [0]) = (<user_id> [0]) &&
				(<member_id> [1]) = (<user_id> [1]))
			return party_member_menu_index = <i> part_member_menu_checksum = (<menus> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script get_party_member_status 
	if ((GotParam net_id_first) && (GotParam net_id_second))
		array = []
		AddArrayElement array = <array> element = <net_id_first>
		AddArrayElement array = <array> element = <net_id_second>
		member_id = <array>
	endif
	is_local = 0
	is_party_member = 0
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> > 0)
		i = 0
		begin
		if (((<connections> [<i>].user_id [0]) = (<member_id> [0]))
				&& ((<connections> [<i>].user_id [1]) = (<member_id> [1])))
			is_party_member = 1
			if ((<connections> [<i>].is_local) = 1)
				is_local = 1
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return is_local = <is_local> is_party_member = <is_party_member>
endscript

script is_new_player 

	GetArraySize ($net_band_members)
	new_player = 1
	if (<array_Size> > 0)
		i = 0
		begin
		if (($net_band_members [<i>].user_id [0]) = (<user_id> [0]) &&
				($net_band_members [<i>].user_id [1]) = (<user_id> [1]))
			if isps3
				if (($net_band_members [<i>].controller_index) = <controller_index>)
					new_player = 0
					break
				endif
			else
				new_player = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return new_player = <new_player>
endscript

script is_quitter 

	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	quitter = 1
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) &&
				(<connections> [<i>].user_id [1]) = (<user_id> [1]))
			if isps3
				if ((<connections> [<i>].controller_index) = <controller_index>)
					quitter = 0
					break
				endif
			else
				quitter = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return quitter = <quitter>
endscript

script net_get_invite_controller_by_user_id 

	GetArraySize ($temp_net_id)
	controller = 0
	if (<array_Size> > 0)
		begin
		if (($temp_net_id [<controller>].net_id_first) = (<user_id> [0])
				&& ($temp_net_id [<controller>].net_id_second) = (<user_id> [1]))
			break
		endif
		controller = (<controller> + 1)
		repeat <array_Size>
	endif
	return controller = <controller>
endscript

script cancel_career_search_early 
	if NetSessionFunc \{Obj = match
			func = cancel_join_server}
		OnExitRun \{destroy_flaming_wait}
		LaunchEvent \{Type = unfocus
			target = band_mode_searching_menu}
		create_flaming_wait
		Wait \{5
			gameframes}
		Change \{num_players_in_band = 0}
		Change \{net_band_members = [
			]}
		Change \{net_num_joiners = 0}
		Change \{career_matchmaking_complete = 0}
		if GotParam \{menu_mode}
			Change net_band_mode_menu = <menu_mode>
		else
			Change \{net_band_mode_menu = HOST}
		endif
		if ($net_band_mode_menu = HOST)
			NetSessionFunc \{Obj = party
				func = set_party_joinable
				params = {
					joinable = 1
				}}
		endif
		generic_event_back
	endif
endscript
ui_band_mode_hit_force_completion = 0

script career_proceed_with_current_reservations 
	NetSessionFunc \{Obj = match
		func = get_num_matchmaking_players}
	if (<num_matchmaking_players> > 1)
		Change \{ui_band_mode_hit_force_completion = 1}
		NetSessionFunc \{Obj = match
			func = force_completion}
	endif
	ui_band_mode_helper_text
endscript

script check_num_matchmaking_players_loop 
	GetSingleTag \{menus}
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	current_players = ($num_players_in_band)
	GetActiveControllers
	GetArraySize <active_controllers>
	starting_controllers = <active_controllers>
	begin
	if ($career_matchmaking_complete = 1)
		destroy_popup_warning_menu
		Change \{net_career_invite_flag = 0}
		ui_band_mode_helper_text
		break
	endif
	NetSessionFunc \{Obj = match
		func = get_num_matchmaking_players}
	GetActiveControllers
	if GotParam \{num_matchmaking_players}
		if ($net_career_invite_flag = 0)
			if ((<num_matchmaking_players> > 1) && ($net_matchmaking_search_window = cancel_only))
				Change \{net_matchmaking_search_window = both_options}
				net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			endif
			if ((<num_matchmaking_players> = 1) && ($net_matchmaking_search_window = both_options))
				Change \{net_matchmaking_search_window = cancel_only}
				net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			endif
		endif
		net_update_remote_menu_text current_players = <current_players>
		current_players = <num_matchmaking_players>
	endif
	controller_index = 0
	begin
	if NOT ((<active_controllers> [<controller_index>]) = (<starting_controllers> [<controller_index>]))
		if ($net_career_invite_flag = 0)
			NetSessionFunc \{Obj = party
				func = disband_party_session}
			cancel_career_search_early \{menu_mode = HOST}
		else
			NetSessionFunc \{Obj = party
				func = leave_party}
			cancel_career_search_early \{menu_mode = join}
		endif
	endif
	controller_index = (<controller_index> + 1)
	repeat <array_Size>
	Wait \{1
		Second}
	repeat
endscript

script ui_band_mode_change_menu_focus_all 

	if ScreenElementExists \{id = myinterfaceelement}
		myinterfaceelement :GetSingleTag \{menus}
		GetArraySize <menus>
		i = 0
		begin
		if GotParam \{local_only}
			(<menus> [<i>]) :GetSingleTag menu
			if ((<menu> = net_local_root) || (<menu> = net_local_join))
				LaunchEvent target = (<menus> [<i>]) Type = <focus_type>
			endif
		else
			LaunchEvent target = (<menus> [<i>]) Type = <focus_type>
		endif
		i = (<i> + 1)
		repeat <array_Size>
		LaunchEvent target = myinterfaceelement Type = <focus_type>
	endif
endscript

script get_controller_part 

	if IsGuitarController controller = <controller>
		return \{controller_part = guitar}
	elseif isdrumcontroller controller = <controller>
		return \{controller_part = drum}
	else
		return \{controller_part = vocals}
	endif
endscript

script career_friendslist_callback 


	if GotParam \{friendlist}
		if ScreenElementExists \{id = myinterfaceelement}
			myinterfaceelement :GetSingleTag \{menus}
			if ScreenElementExists id = (<menus> [(<params>.menu_index)])
				(<menus> [(<params>.menu_index)]) :GetSingleTag menu
				if (<menu> = friends)
					GetArraySize <friendlist>
					if (<array_Size> > 0)
						i = 0
						begin
						if (0 != <friendlist> [<i>].localplayer)
							cant_invite = 1
						elseif (0 != <friendlist> [<i>].alreadyingame)
							cant_invite = 1
						else
							cant_invite = 0
						endif
						CreateScreenElement {
							Type = ContainerElement
							parent = (<menus> [(<params>.menu_index)])
							dims = (200.0, 40.0)
							just = [center bottom]
						}
						container_id = <id>
						CreateScreenElement {
							Type = TextBlockElement
							fit_width = `expand	dims`
							fit_height = `scale	down	if	larger`
							parent = <id>
							text = (<friendlist> [<i>].Name)
							font = fontgrid_text_a6
							dims = (0.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus retail_menu_focus}
								{unfocus retail_menu_unfocus}
								{focus career_friendslist_scroll}
								{unfocus career_friendslist_stop_scroll}
							]
							internal_scale = 0.75
							just = [left bottom]
							internal_just = [left center]
							pos_anchor = [left bottom]
							Pos = (0.0, 0.0)
						}
						GetScreenElementDims id = <id>
						if NOT (<width> > 200)
							<id> :se_setprops {
								just = [center bottom]
								internal_just = [center center]
								pos_anchor = [center bottom]
								Pos = (0.0, 0.0)
							}
						endif
						<container_id> :se_setprops {
							focusable_child = <id>
							event_handlers = [
								{pad_choose ui_band_mode_choose params = {
										friends = invite
										Name = (<friendlist> [<i>].Name)
										id = (<friendlist> [<i>].id)
										sentfriendrequest = (<friendlist> [<i>].sentfriendrequest)
										sentinvite = (<friendlist> [<i>].sentinvite)
										friendstate = (<friendlist> [<i>].friendstate)
										cant_invite = <cant_invite>
									}
								}
							]
						}
						<i> = (<i> + 1)
						repeat <array_Size>
					else
						CreateScreenElement {
							Type = TextBlockElement
							fit_width = `scale	each	line	if	larger`
							fit_height = `scale	down	if	larger`
							parent = (<menus> [(<params>.menu_index)])
							text = qs(0xf5e6fa4e)
							font = fontgrid_text_a6
							dims = (170.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus retail_menu_focus}
								{unfocus retail_menu_unfocus}
							]
							internal_scale = 0.75
							just = [center bottom]
							internal_just = [center center]
						}
					endif
				endif
			endif
		endif
	endif
endscript

script career_friendslist_scroll 
	Obj_GetID
	GetScreenElementDims id = <objID>
	if (<width> <= 200)
		return
	endif
	X = (<width> - 200)
	begin
	Wait \{0.5
		Seconds}
	se_setprops Pos = ((-1.0, 0.0) * <X>) time = (10 * <X> / 200)
	se_waitprops
	Wait \{0.5
		Seconds}
	se_setprops Pos = (0.0, 0.0) time = (10 * <X> / 200)
	se_waitprops
	repeat
endscript

script career_friendslist_stop_scroll 
	Obj_KillSpawnedScript \{Name = career_friendslist_scroll}
	se_setprops \{Pos = (0.0, 0.0)}
endscript

script fix_deleted_character_player_status 
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
		Change structurename = <player_status> character_id = Judy
	endif
endscript

script sanity_check_fix_deleted_characters 
	fix_deleted_character_player_status \{Player = 1}
	fix_deleted_character_player_status \{Player = 2}
	fix_deleted_character_player_status \{Player = 3}
	fix_deleted_character_player_status \{Player = 4}
endscript

script hacky_fix_band_celebrity_character 


	getplayerinfo <Player> character_id
	getplayerinfo <Player> controller
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 1)
		get_savegame_from_controller band_character_select controller = <controller>
		get_controller_part controller = <controller>
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <savegame> part = <controller_part>

			setplayerinfo <Player> character_id = <character_id>
			if (<controller> <= 4)
				cas_queue_new_character_profile id = <character_id> Player = (<controller> + 1) savegame = <savegame>
				band_character_rename index = (<Player> -1) Player = <Player>
			endif
		endif
	endif
endscript

script 0x3a1a73f7 
	0x1e726842 device_num = <device_num>
	if (<0xe95e2ebc> = 1)
		return
	endif
	num_guitars = 0
	num_drums = 0
	num_mics = 0
	GetTags
	GetArraySize <menus>
	i = 0
	begin
	menu_id = (<menus> [<i>])
	<menu_id> :GetTags
	if (<controller> != -1)
		if IsGuitarController controller = <controller>
			num_guitars = (<num_guitars> + 1)
		elseif isdrumcontroller controller = <controller>
			num_drums = (<num_drums> + 1)
		else
			num_mics = (<num_mics> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if IsGuitarController controller = <device_num>
		allowed = {guitar bass}
		if (<num_guitars> < 2)
			0xb6cfc951 menus = <menus>
		else
			SpawnScriptNow \{ui_band_mode_warning
				params = {
					text = $0x6dae1a17
				}}
			return
		endif
	elseif isdrumcontroller controller = <device_num>
		allowed = {drum}
		if (<num_drums> = 0)
			menu_index = 2
		else
			SpawnScriptNow \{ui_band_mode_warning
				params = {
					text = $0x851825d8
				}}
			return
		endif
	else
		allowed = {vocals}
		if (<num_mics> = 0)
			menu_index = 3
		else
			SpawnScriptNow \{ui_band_mode_warning
				params = {
					text = $0xa49d2fae
				}}
			return
		endif
	endif
	if NOT GotParam \{menu_index}

	endif
	menu_id = (<menus> [<menu_index>])
	<menu_id> :SetTags {controller = <device_num> allowed = <allowed>}
	<menu_id> :se_setprops {unblock_events exclusive_device = <device_num>}
	<menu_id> :obj_spawnscript ui_band_mode_choose params = {join device_num = <device_num> direct}
endscript

script 0x1e726842 
	myinterfaceelement :GetTags
	GetArraySize <menus>
	i = 0
	begin
	menu_id = (<menus> [<i>])
	<menu_id> :GetTags
	if (<controller> = <device_num>)
		return \{0xe95e2ebc = 1}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return \{0xe95e2ebc = 0}
endscript

script 0x91d0e379 
	0x1e726842 device_num = <device_num>
	if (<0xe95e2ebc> = 0)
		if ($transitions_locked = 0 && $menu_flow_locked = 0)
			if NOT ScriptIsRunning \{trigger_cas_rebuild_loop}
				if ($ps2_changing_appearance_paks = 0 && $ps2_loading_appearance_paks = 0)
					if NOT cas_queue_is_busy in_queue_too <...>
						if ($0xa53d906e = 1)
							0x57b90bdf \{0x894809f0}
						endif
						cas_destroy_all_characters
						generic_event_back \{nosound}
						ui_band_mode_choose_sound back controller = <device_num>
					endif
				endif
			endif
		endif
	endif
endscript

script 0xaef4c8a9 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller = 0
	begin
	if (<active_controllers> [<controller>] = 1)
		0xed8cb12d = (IsGuitarController controller = <controller>)
		is_drums = (isdrumcontroller controller = <controller>)
		if NOT (<0xed8cb12d> || <is_drums>)
			return \{0x5218ed0b = 1}
		endif
	endif
	controller = (<controller> + 1)
	repeat <array_Size>
	return \{0x5218ed0b = 0}
endscript

script 0x57b90bdf 
	if GotParam \{device_num}
		0x1e726842 device_num = <device_num>
		if (<0xe95e2ebc> = 0)
			return
		endif
	endif

	if NOT GotParam \{0x894809f0}
		if NOT GotParam \{0xd88ae4d0}
			if NOT ismicrophonepluggedin
				return
			endif
		endif
		0xaef4c8a9
		if (<0x5218ed0b> = 1)
			return
		endif
	endif
	if ($0xf8aac4ed < 0)
		Change \{0xf8aac4ed = 3}
		Change \{0xdb92eeef = 3}
	endif
	myinterfaceelement :GetTags
	if NOT GotParam \{0x894809f0}
		if ($0xa53d906e = 1)
			return
		endif
		0x6369894b controller = <device_num>
		<menu_id> :GetTags
		if NOT (<menu> = ready || <menu> = ready2 || <menu> = p2_ready)
			return
		endif
		Change \{0xa53d906e = 1}
		Change 0x81bfdc7e = <menu_index>
	else
		if ($0xa53d906e = 0)
			return
		endif
		Change \{0xa53d906e = 0}
	endif
	0x21e10d73 index = ($0x81bfdc7e)
	0x3b3626e5 = <menu_id>
	0xa23f775f = (<menus> [$0xdb92eeef])
	<0x3b3626e5> :GetSingleTag controller
	0x9dc0537c = <controller>
	<0xa23f775f> :GetSingleTag controller
	0x04c902c6 = <controller>
	if GotParam \{0x894809f0}
		0xd3073b9e = {unblock_events}
		0xe2ef2103 = {block_events}
	else
		0xd3073b9e = {block_events}
		0xe2ef2103 = {unblock_events exclusive_device = <0x9dc0537c>}


	endif
	<0x3b3626e5> :se_setprops <0xd3073b9e>
	<0x3b3626e5> :SetTags controller = <0x04c902c6>
	<0x3b3626e5> :obj_spawnscript ui_band_mode_update_menu params = {no_sfx}
	<0xa23f775f> :se_setprops <0xe2ef2103>
	<0xa23f775f> :SetTags controller = <0x9dc0537c>
	<0xa23f775f> :obj_spawnscript ui_band_mode_update_menu params = {no_sfx}
	if NOT GotParam \{0x894809f0}
		<0xa23f775f> :GetSingleTag menu
		if (<menu> = join)
			<0xa23f775f> :obj_spawnscript ui_band_mode_choose params = {device_num = $0xf8aac4ed controller = $0xf8aac4ed join direct 0xca2ab2b6}
		endif
	else
		if ($band_mode_current_leader = $0x81bfdc7e)
			ui_band_mode_choose_leader \{device_num = $0x81bfdc7e}
			Change \{band_mode_previous_leader = $0x81bfdc7e}
		endif
	endif
	ui_band_mode_helper_text
endscript

script 0xc45a8c18 

	Change \{band_mode_added_vocalist = 0}
	if ($0xa53d906e = 0 && $0x81bfdc7e > -1)
		myinterfaceelement :GetTags
		menu_id = (<menus> [$0x81bfdc7e])
		<menu_id> :GetTags
		if (<controller> != -1)
			0x57b90bdf device_num = <controller>
		endif
	endif
endscript

script 0x21e10d73 

	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
		if ResolveScreenElementID id = [{id = <band_hmenu>} {index = <index>}]
			if <resolved_id> :desc_resolvealias Name = alias_menu
				return menu_id = <resolved_id>
			endif
		endif
	endif

	return \{menu_id = -1}
endscript

script 0x6369894b 

	0xf11cbbf7 = <controller>
	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
		i = 0
		begin
		if ResolveScreenElementID id = [{id = <band_hmenu>} {index = <i>}]
			if <resolved_id> :desc_resolvealias Name = alias_menu
				RemoveParameter \{controller}
				RemoveParameter \{index}
				<resolved_id> :GetTags
				if GotParam \{controller}
					if GotParam \{index}
						if (<controller> = <0xf11cbbf7>)
							return menu_id = <resolved_id> menu_index = <index>
						endif
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat
	endif

	return \{menu_id = -1
		menu_index = 0}
endscript

script 0xb6cfc951 

	i = 0
	begin
	RemoveParameter \{controller}
	menu_id = (<menus> [<i>])
	<menu_id> :GetTags
	if (<controller> = -1)
		if ($0xa53d906e = 1)
			if (<i> != $0x81bfdc7e)
				return menu_index = <i>
			endif
		else
			return menu_index = <i>
		endif
	endif
	i = (<i> + 1)
	repeat 2

	return \{menu_index = 0}
endscript
