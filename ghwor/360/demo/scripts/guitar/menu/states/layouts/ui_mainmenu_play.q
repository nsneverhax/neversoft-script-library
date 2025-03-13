
script ui_create_mainmenu_play 
	killspawnedscript \{name = mainmenu_freeplay_timer_pause}
	killspawnedscript \{name = mainmenu_freeplay_timer}
	spawnscriptnow \{audio_ui_menu_music_on
		params = {
			unpause
		}}
	change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement \{parent = root_window
		id = mainmenu_play_id
		type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				mainmenu_play_back
			}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xffb0c002)}
	attempt_to_add_friend_feed \{parent_id = mainmenu_play_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_play_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = mainmenu_play_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = mainmenu_play_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = mainmenu_play_id
		}}
	<career_text> = qs(0x84e59cef)
	if quest_progression_check_domination_unlocked savegame = ($primary_controller)
		<career_text> = qs(0x8eb60e8f)
	elseif has_completed_forced_career_flow device_num = ($primary_controller)
		<career_text> = qs(0x30cf5c1f)
	endif
	<career_helper_text> = ($g_mainmenu_text.career.helper_text)
	<local_mainmenu_text> = ($g_mainmenu_text)
	appendstruct {
		struct = local_mainmenu_text
		field = career
		params = {
			menu_item_text = <career_text>
			helper_text = <career_helper_text>
		}
	}
	change g_mainmenu_text = <local_mainmenu_text>
	mainmenu_setup_option {
		choose_script = main_menu_select_career
		choose_params = {
			lobby_mode = career
		}
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.career.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_quickplay
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.quickplay.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_freeplay
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.party_play.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = vs
		}
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.competitive.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = main_menu_select_training
		back_script = mainmenu_play_back
		menu_item_text = ($g_mainmenu_text.training.menu_item_text)
	}
	main_menu_finalize
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
	if gotparam \{focus_training}
		selected_index = 4
	endif
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
	startrendering
	spawnscriptnow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript

script ui_destroy_mainmenu_play 
	clean_up_user_control_helpers
	if screenelementexists \{id = mainmenu_play_id}
		destroyscreenelement \{id = mainmenu_play_id}
	endif
endscript

script main_menu_select_quickplay \{device_num = !i1768515945}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	launchevent \{type = unfocus
		target = current_menu}
	mainmenu_animate \{id = mainmenu_play_id
		block_events = 1}
	ui_event_add_params \{play_anim_out = 0}
	get_savegame_from_controller controller = <device_num>
	getglobaltags savegame = <savegame> user_options param = quickplay_did_first_time_in
	if (<quickplay_did_first_time_in> = 1)
		main_menu_select_band_lobby {lobby_mode = quickplay device_num = <device_num> animate_ui = 0}
	else
		set_primary_controller device_num = <device_num> state = uistate_character_selection optional_signin = 1 data = {device_num = <device_num>}
	endif
endscript

script mainmenu_play_back 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script ui_mainmenu_play_anim_out \{play_anim_out = 1}
	if (<play_anim_out> = 0)
		ui_event_add_params \{play_anim_out = 1}
	else
		mainmenu_animate \{id = mainmenu_play_id}
	endif
endscript
