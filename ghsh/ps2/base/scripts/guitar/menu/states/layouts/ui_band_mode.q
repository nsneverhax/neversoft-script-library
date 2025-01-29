
script ui_init_band_mode 
	SpawnScriptNow \{menu_music_on}
endscript

script ui_create_band_mode 
	gamemode_gettype
	if (<Type> = career)
		register_new_progression_atoms \{career_band}
	endif
	SpawnScriptNow \{0xf2d3e5f3
		params = {
			mode = band_mode
		}}
endscript

script ui_destroy_band_mode 
	0x981ef6bf
endscript

script ui_deinit_band_mode 
endscript
band_mode_menu_tags = None
band_mode_mode = None

script sanity_check_fix_deleted_characters 
	fix_deleted_character_player_status \{Player = 1}
	fix_deleted_character_player_status \{Player = 2}
	fix_deleted_character_player_status \{Player = 3}
	fix_deleted_character_player_status \{Player = 4}
endscript

script fix_deleted_character_player_status 
	<player_status> = ($0x2994109a [<Player>])
	get_savegame_from_player_status player_status = <player_status>
	if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
		Change structurename = <player_status> character_id = Judy
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

script get_controller_part 

	if IsGuitarController controller = <controller>
		return \{controller_part = guitar}
	elseif isdrumcontroller controller = <controller>
		return \{controller_part = drum}
	else
		return \{controller_part = vocals}
	endif
endscript

script ui_band_mode_highlight_motion 
	if desc_resolvealias \{Name = alias_highlight}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = FALSE
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = FALSE
			endif
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript

script ui_band_mode_focus \{offset = (0.0, 34.0)
		start_pos = (0.0, -120.0)}
	retail_menu_focus
	Obj_GetID
	<objID> :se_getparentid
	<parent_id> :GetTags
	myinterfaceelement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		if <current_desc> :desc_resolvealias Name = alias_highlight
			GetScreenElementDims id = <objID>
			Scale = (((0.9, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.0))
			screenelementpos = (<start_pos> + (<offset> * <tag_selected_index>))
			<resolved_id> :se_setprops Pos = <screenelementpos> Scale = <Scale>
			<resolved_id> :se_waitprops
			<resolved_id> :se_setprops Pos = (<screenelementpos> + (0.0, -10.0)) time = 0.05
			<resolved_id> :se_waitprops
			<resolved_id> :se_setprops Pos = <screenelementpos> Scale = <Scale> time = 0.05
			<resolved_id> :se_waitprops
		endif
	endif
endscript

script band_mode_remap_controllers_1_to_4 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_create_band_mode_spawned 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_signin_changed 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_return_band_mode 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script is_band_character_select_up 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_kill_character_select_menus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_choose_leader 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_update_name 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_mode_has_player_joined 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_menu_occlude_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_update_menu 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_show_arrows 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_hide_arrows 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_quit 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_host_quit_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_client_quit_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script correct_allowed_parts 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script filter_allowed_parts_by_character_type 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_instrument 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_lefty 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_mic_check 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_difficulty 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_ready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_animate_ready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_animate_unready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_ready_motion 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_root 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_save_tags 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_edit_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_select_focus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_rename 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_name_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_gamertag_rename 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_gamertag_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_select_unfocus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_resolve_guest_characters 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_select_choose 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script band_character_select_back_out 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_join 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_net_remote_open 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_net_remote_root 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_net_local_join 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_net_local_root 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_friends_list 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_invite 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_choose 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_blink_arrow 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_move_poster 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_focus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_gigs_unfocus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_create_menu_gamer_cards 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_show_gamertag 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_choose 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script spawn_net_ui_band_mode_choose 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_choose 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_back 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script spawn_net_ui_band_mode_back 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_back 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_continue 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_continue 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_invite_continue_to_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script spawn_net_ui_band_mode_countdown_to_gig 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_countdown_to_gig 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_wait_to_proceed_to_online_play 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_show_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script random_band_mode_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_random_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_kill_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_check_menus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_check_disconnect 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_warning 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_signin 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_helper_text 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script isanycontrollersignedin 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_scroll_sound 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_choose_sound \{ready = 0
		controller = 0}
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_choose_sound_spawned \{ready = 0
		controller = 0}
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_choose_sound_ready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script proceed_to_band_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script add_gamertag_to_band_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_add_player_to_career_ui 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_goto_band_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_goto_gig_board 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script is_current_state_band_mode 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_setup_band_lobby_ticker 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ticker_msg_loop 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ticker_update_msg 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ticker_vert_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ticker_horiz_scroll \{scroll_time = 6}
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script scroll_ticker_each_line 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script update_network_ticker 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_get_root_menu_tags 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_get_invite_menu_tags 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_update_party_data 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_poll_party_data 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_poll_party_for_joiners 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_add_party_joiner 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_remove_party_joiner 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script find_party_member_menu 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script get_party_member_status 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script is_new_player 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script is_quitter 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_get_invite_controller_by_user_id 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script cancel_career_search_early 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_proceed_with_current_reservations 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script check_num_matchmaking_players_loop 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_update_remote_menu_text 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_change_menu_focus_all 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_ui_band_mode_create_searching_menu 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xd5a9af74 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_friendslist_callback 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_friendslist_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script career_friendslist_stop_scroll 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_move_invite_player_to_open_menu 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_memcard_drop_player 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script wait_for_net_career_drop_player 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_memcard_end_game 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script wait_for_net_career_end_game 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_drop_player 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_end_game 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script hacky_fix_band_celebrity_character 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_get_band_leader_difficulty 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_wait_until_menu_update_is_done 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_asign_band_leader_icon 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_check_instruments 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_set_instruments 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_ps3_invite_received 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_host_finalize_menu_ui 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_send_to_host_msg_uistate_ready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script mark_client_as_in_lobby 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_wait_for_clients_uistate_ready 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script net_career_shift_invite_player_status_structs 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script is_party_member_local 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x3a1a73f7 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x1e726842 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x91d0e379 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xaef4c8a9 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x57b90bdf 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xc45a8c18 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x21e10d73 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x6369894b 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xb6cfc951 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script change_controller_disconnect_scripts_on_all_menus 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x6edb3460 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ready_up_players_invite_client 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x218ab6bf 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x1c9ae4e8 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xb8ee8dd9 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x9d476ee8 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x635c84dd 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0xd7bbd0fa 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x64b60f18 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x9ebb4ac7 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script ui_band_mode_friends_match 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x5e91879b 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x49a010db 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript

script 0x2634324b 
	0x93d8d5cf \{qs(0x9f538ee9)}
endscript
