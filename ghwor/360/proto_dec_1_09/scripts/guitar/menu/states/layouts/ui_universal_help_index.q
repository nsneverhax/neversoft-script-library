
script ui_create_universal_help_index 
	uistack_createboundscreenelement \{parent = root_window
		id = help_index_menu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
		}
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
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
	GetArraySize ($g_universal_help_popups)
	if (<array_Size> > 0)
		<i> = 0
		begin
		mainmenu_setup_option {
			choose_state = uistate_universal_help
			choose_params = {
				next_state_script = generic_event_back
				device_num = ($primary_controller)
				help_global_index = <i>
			}
			back_script = generic_event_back
			menu_item_text = ($g_universal_help_popups [<i>].help_context_title)
			screen_id = help_index_menu_id
			helper_text = qs(0x03ac90f0)
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
endscript

script ui_destroy_universal_help_index 
	clean_up_user_control_helpers
endscript
