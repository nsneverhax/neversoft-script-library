hall_of_records_go_to_awards = 0

script ui_create_hall_of_records 
	KillSpawnedScript \{Name = mainmenu_freeplay_timer_pause}
	KillSpawnedScript \{Name = mainmenu_freeplay_timer}
	SpawnScriptNow \{audio_ui_menu_music_on
		params = {
			Unpause
		}}
	Change \{respond_to_signin_changed = 1}
	Change \{rich_presence_context = presence_menus}
	uistack_createboundscreenelement {
		parent = root_window
		id = hor_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back hall_of_records_back}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x624c597d)
	}
	attempt_to_add_friend_feed \{parent_id = hor_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = hor_menu_id}
	current_menu :se_setprops \{loop_view = FALSE
		loop_center = FALSE}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = hor_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = hor_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = hor_menu_id
		}}
	<achievements_text> = qs(0x2be0ec23)
	if isps3
		<achievements_text> = qs(0xddd9b5d4)
	elseif isngc
		<achievements_text> = qs(0x55b5f54c)
	endif
	mainmenu_setup_option {
		choose_script = hall_of_records_select_achievements_ui_or_help
		back_script = hall_of_records_back
		menu_item_text = <achievements_text>
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
	}
	mainmenu_setup_option \{choose_state = uistate_unlock_tracker
		back_script = hall_of_records_back
		menu_item_text = qs(0xb2867e0a)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)}
	mainmenu_setup_option \{choose_state = uistate_art_gallery_menu
		back_script = hall_of_records_back
		menu_item_text = qs(0x67ef7413)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)}
	if CheckForSignIn controller_index = ($primary_controller) dont_set_primary network_platform_only
		<age_restricted> = 0
		if isps3
			if NOT NetSessionFunc \{func = isoldenoughforonline}
				<age_restricted> = 1
			endif
		elseif isXenon
			if NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
				<age_restricted> = 1
			endif
		endif
		if (<age_restricted> = 1)
			mainmenu_setup_option \{back_script = hall_of_records_back
				menu_item_text = qs(0xd3cd2799)
				screen_id = hor_menu_id
				helper_text = qs(0x03ac90f0)
				not_focusable}
		else
			GetNetID controller_index = ($primary_controller)
			<array> = [0 0]
			SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
			mainmenu_setup_option {
				choose_script = hall_of_records_select_my_rock_record
				choose_params = {
					net_id = <array>
					unfocus_id = current_menu
					device_num = ($primary_controller)
				}
				back_script = hall_of_records_back
				menu_item_text = qs(0xd3cd2799)
				screen_id = hor_menu_id
				helper_text = qs(0x03ac90f0)
			}
		endif
	else
		mainmenu_setup_option \{back_script = hall_of_records_back
			menu_item_text = qs(0xd3cd2799)
			screen_id = hor_menu_id
			helper_text = qs(0x03ac90f0)
			not_focusable}
	endif
	mainmenu_setup_option {
		choose_script = main_menu_select_award_case
		back_script = hall_of_records_back
		menu_item_text = ($g_mainmenu_text.award_case.menu_item_text)
	}
	mainmenu_setup_option \{choose_script = hall_of_records_select_award_leaderboard
		choose_params = {
			leaderboard_id = lb_rock_record_2
		}
		back_script = hall_of_records_back
		menu_item_text = qs(0xe75556d8)
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)}
	main_menu_finalize
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	StartRendering
	SpawnScriptNow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
	if ($hall_of_records_go_to_awards = 1)
		Change \{hall_of_records_go_to_awards = 0}
		spawnscript {
			hall_of_records_select_achievements_ui
			params = {
				friends_uid = <friends_uid>
				friends_name = <friends_name>
			}
		}
	else
		spawnscript \{hall_of_records_follow_awards_shortcut}
	endif
endscript

script hall_of_records_follow_awards_shortcut 
	if (1 = $g_shortcut_data.valid)
		if (wiiwards_menu = $g_shortcut_data.shortcut)
			hall_of_records_select_achievements_ui {
				friends_uid = ($g_shortcut_data.friend_id)
				friends_name = ($g_shortcut_data.friend_name)
			}
			Change g_shortcut_data = (($g_shortcut_data) + {valid = 0})
		endif
	endif
endscript

script hall_of_records_select_achievements_ui_or_help \{friends_uid = [
			0
			0
		]
		friends_name = qs(0x00000000)}
	Change g_net_leader_player_num = ($primary_controller + 1)
	universal_help_display_help_check help_context = awards_to_gameplay device_num = ($primary_controller)
	if (<show_help_page> = 1)
		Change \{hall_of_records_go_to_awards = 1}
		generic_event_replace {
			state = uistate_universal_help
			band_lobby_continue_sfx
			data = {
				next_state_name = uistate_hall_of_records
				next_state_params = {
					go_to_awards = 1
				}
				device_num = ($primary_controller)
				help_global_index = <help_index>
			}
		}
	else
		hall_of_records_select_achievements_ui friends_uid = <friends_uid> friends_name = <friends_name>
	endif
endscript

script hall_of_records_select_achievements_ui \{friends_uid = [
			0
			0
		]
		friends_name = qs(0x00000000)}
	create_achievements_ui {
		friends_name = <friends_name>
		friends_uid = <friends_uid>
		exit_Script = hall_of_records_back_from_achievements_ui
	}
	LaunchEvent \{Type = unfocus
		target = current_menu}
endscript

script hall_of_records_back_from_achievements_ui 
	ui_event \{event = menu_refresh}
endscript

script ui_destroy_hall_of_records 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = hor_menu_id}
		DestroyScreenElement \{id = hor_menu_id}
	endif
endscript

script ui_return_hall_of_records \{return_script = None
		return_params = {
		}}
	if ScreenElementExists \{id = wii_achievements_popup}
		spawnscript \{achievements_unfocus_hall_of_records}
		if NOT (<return_script> = None)
			spawnscript <return_script> params = {<return_params>}
		endif
	else
		add_gamertag_helper exclusive_device = ($primary_controller)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000
			all_buttons}
		attempt_to_add_friend_feed \{parent_id = hor_menu_id
			menu = main_generic}
	endif
endscript

script achievements_unfocus_hall_of_records 
	ui_event_wait_for_safe
	if ScreenElementExists \{id = hor_menu_id}
		LaunchEvent \{Type = unfocus
			target = hor_menu_id}
	endif
endscript

script hall_of_records_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	generic_event_back
endscript

script hall_of_records_select_award_leaderboard 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	hide_glitch \{num_frames = 4}
	Change \{rich_presence_context = presence_leaderboards}
	destroy_friend_feed
	if isps3
		if NOT GotParam \{no_restricted_check}
			if NOT NetSessionFunc \{func = isoldenoughforonline}
				ui_sfx \{menustate = leaderboard
					uitype = negativeselect}
				ui_leaderboard_get_error_text \{reason = content_restricted}
				generic_event_choose {
					state = uistate_generic_dialog_box
					data = {
						is_popup
						confirm_text = qs(0xaec82a2f)
						confirm_func = hall_of_records_select_award_leaderboard
						confirm_func_params = {<...> no_restricted_check}
						heading_text = qs(0xaa163738)
						body_text = <error_text>
						cancel_text = qs(0xf7723015)
						cancel_func = generic_event_back
					}
				}
				return
			endif
		endif
	endif
	if GotParam \{no_restricted_check}
		generic_event_replace state = uistate_award_case data = {no_targeting device_num = <device_num> leaderboard_id = <leaderboard_id>}
	else
		generic_event_choose state = uistate_award_case data = {no_targeting device_num = <device_num> leaderboard_id = <leaderboard_id>}
	endif
endscript

script ui_hall_anim_in 
	mainmenu_animate \{id = hor_menu_id}
endscript

script hall_of_records_select_my_rock_record \{net_id = !a1768515945
		device_num = !i1768515945
		unfocus_id = !q1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	mainmenu_animate \{id = hor_menu_id
		block_events = 1}
	destroy_friend_feed
	hide_glitch \{num_frames = 4}
	hide_glitch \{num_frames = 20}
	display_rock_record net_id = <net_id> device_num = <device_num> unfocus_id = <unfocus_id>
endscript
