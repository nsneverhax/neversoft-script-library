
script ui_create_jam_publish_text_entry 
	Change \{num_name_size = 14}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs(0xeecb2665)}
	add_generic_menu_text_item \{text = qs(0xb60636a4)
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		pad_back_script = generic_event_back
		text = <text>
		text_case = title
		validity_message = qs(0x686e1115)
		dims = (450.0, 100.0)
		Pos = (-15.0, 0.0)
	}
	menu_finish \{no_helper_text}
	ui_cas_text_entry_helper_text
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
	StartRendering
	generic_menu :se_setprops \{skull_eye_anim_alpha = 0}
	generic_menu :se_setprops \{studio_skull_anim_alpha = 1}
	generic_menu :Obj_SpawnScriptNow \{studio_skull_anim}
endscript

script ui_return_jam_publish_text_entry 
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_jam_publish_text_entry 
	Change \{num_name_size = 21}
	if ($invite_controller = -1)
		StopRendering
	endif
	destroy_generic_menu
	KillSpawnedScript \{Name = studio_skull_anim}
endscript
