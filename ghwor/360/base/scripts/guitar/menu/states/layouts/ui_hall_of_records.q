
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
		elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
			<age_restricted> = 1
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
	if NOT retailbuild
		mainmenu_setup_option \{choose_script = hall_of_records_select_award_leaderboard
			choose_params = {
				leaderboard_id = lb_debug_friends
			}
			back_script = hall_of_records_back
			menu_item_text = qs(0xf61a63ce)
			screen_id = hor_menu_id
			helper_text = qs(0x03ac90f0)}
	endif
	<achievements_text> = qs(0x2be0ec23)
	if isps3
		<achievements_text> = qs(0xddd9b5d4)
	endif
	mainmenu_setup_option {
		back_script = hall_of_records_back
		menu_item_text = <achievements_text>
		screen_id = hor_menu_id
		helper_text = qs(0x03ac90f0)
		not_focusable
	}
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
endscript

script ui_destroy_hall_of_records 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = hor_menu_id}
		DestroyScreenElement \{id = hor_menu_id}
	endif
endscript

script ui_return_hall_of_records 
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
	mainmenu_animate \{id = hor_menu_id}
	destroy_friend_feed
	hide_glitch \{num_frames = 4}
	Change \{rich_presence_context = presence_leaderboards}
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
		generic_event_replace state = uistate_award_case data = {is_popup no_targeting device_num = <device_num> leaderboard_id = <leaderboard_id>}
	else
		generic_event_choose state = uistate_award_case data = {is_popup no_targeting device_num = <device_num> leaderboard_id = <leaderboard_id>}
	endif
endscript

script ui_hall_anim_in 
	mainmenu_animate \{id = hor_menu_id}
endscript

script ui_hall_anim_out 
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
	hide_glitch \{num_frames = 20}
	display_rock_record net_id = <net_id> device_num = <device_num> unfocus_id = <unfocus_id>
endscript
