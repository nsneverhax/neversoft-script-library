
script ui_create_universal_help_index 
	uistack_createboundscreenelement {
		parent = root_window
		id = help_index_menu_id
		type = descinterface
		desc = 'mainmenu'
		exclusive_device = ($primary_controller)
		tags = {
		}
		event_handlers = [
			{pad_back universal_help_index_back}
		]
		menu_header_cont_alpha = 1.0
		menu_header_text_text = qs(0xa4c1fd9a)
	}
	attempt_to_add_friend_feed \{parent_id = help_index_menu_id
		menu = main_generic}
	mainmenu_setup_physics_elements \{screen_id = help_index_menu_id}
	uistack_spawnboundscriptnow \{fg_objects_1
		params = {
			desc_id = help_index_menu_id
		}}
	uistack_spawnboundscriptnow \{ampzilla_anim
		params = {
			desc_id = help_index_menu_id
		}}
	uistack_spawnboundscriptnow \{anim_clouds
		params = {
			desc_id = help_index_menu_id
		}}
	getarraysize ($g_universal_help_popups)
	if (<array_size> > 0)
		<i> = 0
		begin
		if NOT structurecontains structure = ($g_universal_help_popups [<i>]) hide_in_index
			mainmenu_setup_option {
				choose_state = uistate_universal_help
				choose_params = {
					do_not_play_popup_sfx = 1
					next_state_script = generic_event_back
					device_num = ($primary_controller)
					help_global_index = <i>
					viewing_from_help_index = 1
					show_mainmenu_bg = 1
				}
				back_script = universal_help_index_back
				menu_item_text = ($g_universal_help_popups [<i>].help_context_title)
				screen_id = help_index_menu_id
				helper_text = qs(0x03ac90f0)
			}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
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
endscript

script ui_destroy_universal_help_index 
	clean_up_user_control_helpers
endscript

script universal_help_index_back 
	ui_sfx \{menustate = generic
		uitype = back}
	generic_event_back
endscript

script ui_universal_help_index_anim_in 
	mainmenu_animate \{id = help_index_menu_id}
endscript

script ui_universal_help_index_anim_out 
	mainmenu_animate \{id = help_index_menu_id}
endscript
