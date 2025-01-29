
script ui_create_jam_publish_text_entry 
	Change \{num_name_size = 17}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs(0xeecb2665)}
	add_generic_menu_text_item \{text = qs(0xb60636a4)
		heading
		not_focusable}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		pad_back_script = generic_event_back
		text = <text>
		validity_message = qs(0x686e1115)
		dims = (410.0, 100.0)
		Pos = (0.0, 0.0)
		rgba = (($g_menu_colors).menu_gold)
	}
	menu_finish \{no_helper_text}
	ui_cas_text_entry_helper_text
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{Type = pad_choose}
	StartRendering
endscript

script ui_return_jam_publish_text_entry 
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_jam_publish_text_entry 
	Change \{num_name_size = 17}
	if ($invite_controller = -1)
		StopRendering
	endif
	destroy_generic_menu
endscript
