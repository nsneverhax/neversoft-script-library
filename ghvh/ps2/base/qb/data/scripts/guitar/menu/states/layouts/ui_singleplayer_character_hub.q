
script ui_create_singleplayer_character_hub 
	fadetoblack \{OFF
		no_wait}

	set_cas_loading_setup \{setup = single}
	SpawnScriptNow ui_create_singleplayer_character_hub_spawned params = <...>
endscript
0x4eec6137 = 0

script ui_create_singleplayer_character_hub_spawned 
	if progression_check_intro_complete
		Change 0x4eec6137 = ($0x4eec6137 + 1)
	endif
	Change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	cas_free_resources_camera_fix \{base_name = 'singleplayer_character_hub'}
	if init_singleplayer_character_hub pass_to_gigboard = <pass_to_gigboard> ent_player_status = <ent_player_status>
		player_status = player1_status
		switch ($<player_status>.part)
			case guitar
			hist_tex = icon_progression_guitar
			case bass
			hist_tex = icon_progression_bass
			case drum
			hist_tex = icon_progression_drums
			case vocals
			hist_tex = icon_progression_vocals
		endswitch
		make_generic_menu {
			title = qs(0x1f05c183)
			show_history
			num_icons = 0
			hist_tex = <hist_tex>
			vmenu_id = create_singleplayer_character_hub_vmenu
			pad_back_script = 0x764ddbf1
		}
		cas_set_object_node_pos Player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_select
		add_generic_menu_text_item \{text = qs(0xb980b3ee)
			pad_choose_script = 0x860b0248}
		add_generic_menu_text_item {
			text = qs(0xebd11692)
			choose_state = uistate_character_selection
			choose_state_data = {object = <Player>}
		}
		get_savegame_from_player_status player_status = <player_status>
		if NOT profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
			focusable_flags = {not_focusable}
		endif
		add_generic_menu_text_item {
			text = qs(0x67bd7527)
			pad_choose_script = single_player_character_hub_edit_character
			<focusable_flags>
		}
		add_generic_menu_text_item \{text = qs(0x9baf87e5)
			choose_state = uistate_band_name_logo
			choose_state_data = {
				override_base_name = 'none'
			}}
		add_generic_menu_text_item \{text = qs(0x0229b698)
			choose_state = uistate_cash_milestones}
		if isdrumcontroller controller = ($primary_controller)
			focusable_flags = {not_focusable}
		endif
		menu_finish
		LaunchEvent \{Type = focus
			target = create_singleplayer_character_hub_vmenu}
		create_band_money_display savegame = <savegame>
	endif
	StartRendering
	destroy_loading_screen
	menu_music_on
endscript

script single_player_character_hub_edit_character 
	hide_glitch \{num_frames = 20}
	external_edit_character
endscript

script ui_destroy_singleplayer_character_hub 
	destroy_generic_menu
	destroy_band_money_display
	Change \{menu_over_ride_exclusive_device = -1}
endscript

script ui_deinit_singleplayer_character_hub 
	hide_glitch \{num_frames = 20}
	cas_fix_cameras_for_game
endscript
first_character_hub_enter = 0

script init_singleplayer_character_hub \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	if GotParam \{pass_to_gigboard}
		SpawnScriptNow cleanup_singleplayer_hub_return_tutorials params = {Player = <Player> Progression = <Progression> ent_player_status = <ent_player_status>}
		return \{FALSE}
	else
		if ($first_character_hub_enter = 0)
			Change \{cas_current_instrument = None}
			cas_queue_new_character_profile id = ($<player_status>.character_id) force_update = 1 Player = <Player> savegame = <savegame> hide_old_character = 1
		endif
	endif
	if NOT ($game_mode = training)
		get_current_band_info
		bandname_id = <band_info>
		GetGlobalTags <bandname_id> param = first_venue_movie_played
		if (<first_venue_movie_played> = 0)
			get_progression_globals game_mode = ($game_mode)
			SetGlobalTags <bandname_id> params = {first_venue_movie_played = 1}
		endif
	endif
	if ($first_character_hub_enter = 1)
		SpawnScriptNow \{character_hub_continue_to_selection}
		return \{FALSE}
	endif
	return \{true}
endscript

script character_hub_continue_to_selection 
	ui_event_wait \{event = menu_change
		data = {
			state = uistate_character_selection
			from_difficulty = {
				from_difficulty
			}
		}}
endscript

script 0x764ddbf1 
	create_loading_screen \{0xdf3c5641
		Wait}
	generic_event_back_block
endscript

script 0x860b0248 
	create_loading_screen \{0xdf3c5641
		Wait}
	singleplayer_player_show
endscript

script singleplayer_player_show 
	cas_destroy_all_characters
	cleanup_singleplayer_hub
	player_status = player1_status
	ui_event_add_params ent_player_status = ($<player_status>)
	ui_event_wait \{event = menu_change
		data = {
			state = uistate_gig_posters
		}}
endscript

script cleanup_singleplayer_hub 
	if ($shutdown_game_for_signin_change_flag = 1)
		Change \{using_guitar_select_camera = 0}
	endif
	KillCamAnim \{Name = ch_view_cam}
	KillCamAnim \{Name = gs_view_cam}
	destroy_bg_viewport
	disable_pause
endscript

script cleanup_singleplayer_hub_return_tutorials 
	player_status = player1_status
	Change GlobalName = <player_status> NewValue = <ent_player_status>
	switch (<ent_player_status>.part)
		case guitar
		Change \{current_progression_flag = career_guitar}
		setplayerinfo \{1
			part = guitar}
		case bass
		Change \{current_progression_flag = career_bass}
		setplayerinfo \{1
			part = bass}
		case drum
		Change \{current_progression_flag = career_drum}
		setplayerinfo \{1
			part = drum}
		case vocals
		Change \{current_progression_flag = career_vocals}
		setplayerinfo \{1
			part = vocals}
	endswitch
	ui_event_remove_params \{param = ent_player_status}
	Change \{game_mode = p1_career}
	Change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	create_loading_screen
	destroy_bandname_viewport
	destroy_band
	frontend_load_soundcheck
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	cas_fix_cameras_for_game
	destroy_loading_screen
	ui_event_remove_params \{param = pass_to_gigboard}
	singleplayer_player_show \{continue_to_gigs}
endscript
