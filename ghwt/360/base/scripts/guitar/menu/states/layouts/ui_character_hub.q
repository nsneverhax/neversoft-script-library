
script ui_create_character_hub 
	set_cas_loading_setup \{setup = h2h}
	SpawnScriptNow ui_create_character_hub_spawned params = {<...>}
endscript

script ui_create_character_hub_spawned 
	cas_free_resources_camera_fix \{base_name = 'character_hub'}
	cas_set_object_node_pos \{Player = 1
		node = z_soundcheck_trg_waypoint_player1_start}
	cas_set_object_node_pos \{Player = 2
		node = z_soundcheck_trg_waypoint_player4_start}
	Change band_mode_current_leader = ($player1_status.controller)
	ui_band_mode_show_character \{Player = 1}
	ui_band_mode_show_character \{Player = 2}
	CreateScreenElement \{parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'band_play'}
	if NOT ($is_network_game)
		if isXenon
			array = [{pad_start ui_band_mode_continue} {pad_option ui_band_mode_choose_leader}]
		else
			array = [{pad_start ui_band_mode_continue}]
		endif
	else
		array = [{pad_start ui_band_mode_continue}]
	endif
	if (GotParam net_career_lobby)
		array = []
		if (IsHost)
			AddArrayElement array = <array> element = {pad_start net_ui_band_mode_continue}
		endif
	endif
	myinterfaceelement :SetProps event_handlers = <array>
	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	<band_hmenu> :se_setprops spacing_between = 400
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = 2}
	]
	<resolved_id> :Die
	repeat 2
	menu_array = []
	desc_array = []
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	<resolved_id> :desc_resolvealias Name = alias_menu
	getplayerinfo (<i> + 1) controller
	<resolved_id> :SetTags {
		menu = p2_root
		instrument = None
		difficulty = easy
		controller = <controller>
		allowed = <allowed>
		index = <i>
	}
	<resolved_id> :SetProps event_handlers = [
		{pad_up ui_band_mode_scroll_sound params = {up}}
		{pad_down ui_band_mode_scroll_sound params = {down}}
	]
	AddArrayElement array = <menu_array> element = <resolved_id>
	menu_array = <array>
	i = (<i> + 1)
	repeat 2
	myinterfaceelement :SetTags {menus = <menu_array> descs = <desc_array>}
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	<resolved_id> :desc_resolvealias Name = alias_menu
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu params = {player_index = <i>}
	else
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu
	endif
	i = (<i> + 1)
	repeat 2
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		myinterfaceelement :se_setprops \{ticker_alpha = 0.0}
	endif
	LaunchEvent \{Type = focus
		target = myinterfaceelement}
	ui_band_mode_helper_text
endscript

script ui_destroy_character_hub 
	DestroyScreenElement \{id = myinterfaceelement}
	generic_ui_destroy
	cleanup_all_photo_assets
endscript

script ui_init_character_hub 
endscript

script ui_deinit_character_hub 
	cas_destroy_all_characters
endscript

script ui_character_hub_continue 
	GetTags
	num_ready = 0
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	if (<menu> = p2_ready)
		<num_ready> = (<num_ready> + 1)
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if (<num_ready> = 2)
		cancel_all_cas_loads
		if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
			SoundEvent \{event = band_mode_career_ready}
			generic_event_choose \{no_sound
				state = uistate_setlist
				data = {
					no_jamsession
					use_all_controllers
				}}
		else
			generic_event_choose \{state = uistate_gig_posters}
		endif
	endif
endscript
