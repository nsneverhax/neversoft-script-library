
script ui_create_mainmenu_create 
	destroy_loading_screen
	killspawnedscript \{name = mainmenu_freeplay_timer_pause}
	killspawnedscript \{name = mainmenu_freeplay_timer}
	spawnscriptnow \{audio_ui_menu_music_on
		params = {
			unpause
		}}
	change \{respond_to_signin_changed = 1}
	uistack_createboundscreenelement {
		parent = root_window
		id = mainmenu_create_id
		type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{pad_back mainmenu_create_back}
		]
		exclusive_device = ($primary_controller)
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0x122e3c10)
	}
	attempt_to_add_friend_feed \{parent_id = mainmenu_create_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_create_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = mainmenu_create_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = mainmenu_create_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = mainmenu_create_id
		}}
	if mainmenu_create_id :desc_resolvealias \{name = alias_mainmenu_up_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	if mainmenu_create_id :desc_resolvealias \{name = alias_mainmenu_down_arrow}
		<resolved_id> :se_setprops {
			hide
		}
	endif
	mainmenu_setup_option {
		choose_script = main_menu_select_cas
		back_script = mainmenu_create_back
		menu_item_text = ($g_mainmenu_text.creator.menu_item_text)
	}
	mainmenu_setup_option {
		choose_script = music_central_select_music_studio
		back_script = mainmenu_create_back
		menu_item_text = ($g_mainmenu_text.music_central.menu_item_text)
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
	launchevent type = focus target = current_menu data = {child_index = <selected_index>}
	startrendering
	spawnscriptnow \{reset_mainmenu_camera}
	lightshow_notingameplay_setmood \{mood = band_lobby}
endscript

script ui_destroy_mainmenu_create 
	clean_up_user_control_helpers
	if screenelementexists \{id = mainmenu_create_id}
		destroyscreenelement \{id = mainmenu_create_id}
	endif
endscript

script mainmenu_create_back 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script ui_mainmenu_create_anim_out 
	mainmenu_animate \{id = mainmenu_create_id}
endscript
