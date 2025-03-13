
script ui_create_singleplayer_character_hub 
	printf \{'ui_create_singleplayer_character_hub'}
	if ($signin_change_happening = 1)
		return
	endif
	set_cas_loading_setup \{setup = single}
	spawnscriptnow ui_create_singleplayer_character_hub_spawned params = <...>
endscript

script ui_create_singleplayer_character_hub_spawned 
	if NOT ($practice_enabled)
		frontend_load_soundcheck \{loadingscreen
			async = 0}
	endif
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	cas_free_resources_camera_fix \{base_name = 'singleplayer_character_hub'}
	destroy_loading_screen \{force = 1}
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
			title = qs(0x9b342eaf)
			show_history
			num_icons = 0
			hist_tex = <hist_tex>
			vmenu_id = create_singleplayer_character_hub_vmenu
			pad_back_script = generic_event_back_block
		}
		cas_set_object_node_pos player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_select
		add_generic_menu_text_item \{text = qs(0xb980b3ee)
			pad_choose_script = singleplayer_player_show}
		add_generic_menu_text_item {
			text = qs(0xebd11692)
			choose_state = uistate_character_selection
			choose_state_data = {object = <player>}
		}
		get_savegame_from_player_status player_status = <player_status>
		if NOT profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
			focusable_flags = {not_focusable}
		endif
		add_generic_menu_text_item \{text = qs(0x67bd7527)
			pad_choose_script = single_player_character_hub_edit_character
			not_focusable}
		<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [110 100 90 175]
		add_generic_menu_text_item \{text = qs(0x9560fb22)
			choose_state = uistate_bonus_videos}
		add_generic_menu_text_item \{text = qs(0x9baf87e5)
			choose_state = uistate_band_name_logo
			choose_state_data = {
				override_base_name = 'none'
			}}
		add_generic_menu_text_item \{text = qs(0x21bfb03f)
			choose_state = uistate_cash_milestones}
		if isdrumcontroller controller = ($primary_controller)
			focusable_flags = {not_focusable}
		endif
		menu_finish
		launchevent type = focus target = create_singleplayer_character_hub_vmenu data = {child_index = <selected_index>}
		create_band_money_display savegame = <savegame>
	endif
	startrendering
	setbuttoneventmappings \{block_menu_input}
	cas_queue_wait
	setbuttoneventmappings \{unblock_menu_input}
endscript

script single_player_character_hub_edit_character 
	hide_glitch \{num_frames = 20}
	external_edit_character
endscript

script ui_destroy_singleplayer_character_hub 
	destroy_generic_menu
	destroy_band_money_display
	change \{menu_over_ride_exclusive_device = -1}
endscript

script ui_deinit_singleplayer_character_hub 
	cas_fix_cameras_for_game
endscript
first_character_hub_enter = 0

script init_singleplayer_character_hub \{player = 1}
	formattext checksumname = player_status 'player%d_status' d = <player>
	get_savegame_from_player_status player_status = <player_status>
	getglobaltags savegame = <savegame> last_singleplayer_character
	if NOT (<last_singleplayer_character> = none)
		change \{first_character_hub_enter = 0}
		change structurename = <player_status> character_id = <last_singleplayer_character>
	endif
	if gotparam \{pass_to_gigboard}
		spawnscriptnow cleanup_singleplayer_hub_return_tutorials params = {player = <player> progression = <progression> ent_player_status = <ent_player_status>}
		return \{false}
	else
		if ($first_character_hub_enter = 0)
			if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
				stars
				printf \{'eek, this is bad!'}
				stars
				change structurename = <player_status> character_id = judy
			endif
			cas_queue_new_character_profile id = ($<player_status>.character_id) player = <player> savegame = <savegame> hide_old_character = 1
		endif
	endif
	if NOT ($game_mode = training)
		bandname_id = band_info
		getglobaltags <bandname_id> param = first_venue_movie_played
		if (<first_venue_movie_played> = 0)
			get_progression_globals game_mode = ($game_mode)
			setglobaltags <bandname_id> params = {first_venue_movie_played = 1}
		endif
	endif
	if ($first_character_hub_enter = 1)
		spawnscriptnow \{character_hub_continue_to_selection}
		return \{false}
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
	killcamanim \{name = ch_view_cam}
	killcamanim \{name = gs_view_cam}
	destroy_bg_viewport
	disable_pause
endscript

script cleanup_singleplayer_hub_return_tutorials 
	player_status = player1_status
	change globalname = <player_status> newvalue = <ent_player_status>
	switch (<ent_player_status>.part)
		case guitar
		change \{current_progression_flag = career_guitar}
		setplayerinfo \{1
			part = guitar}
		case bass
		change \{current_progression_flag = career_bass}
		setplayerinfo \{1
			part = bass}
		case drum
		change \{current_progression_flag = career_drum}
		setplayerinfo \{1
			part = drum}
		case vocals
		change \{current_progression_flag = career_vocals}
		setplayerinfo \{1
			part = vocals}
	endswitch
	ui_event_remove_params \{param = ent_player_status}
	change \{game_mode = p1_career}
	change \{current_num_players = 1}
	gamemode_updatenumplayers \{num_players = 1}
	create_loading_screen
	destroy_bandname_viewport
	destroy_band
	frontend_load_soundcheck
	formattext checksumname = player_status 'player%d_status' d = <player>
	get_savegame_from_player_status player_status = <player_status>
	cas_fix_cameras_for_game
	destroy_loading_screen
	ui_event_remove_params \{param = pass_to_gigboard}
	singleplayer_player_show \{continue_to_gigs}
endscript
