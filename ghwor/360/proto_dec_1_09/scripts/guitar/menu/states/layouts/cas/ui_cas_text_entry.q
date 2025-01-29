
script ui_create_cas_text_entry 
	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	if English
		hist_tex = icon_name
	elseif German
		hist_tex = icon_name_german
	elseif French
		hist_tex = icon_name_french
	elseif Italian
		hist_tex = icon_name_italian
	elseif Spanish
		hist_tex = icon_name_spanish
	endif
	make_generic_car_menu {
		vmenu_id = text_entry_vmenu
		title = qs(0x17f49e18)
		num_icons = <num_icons>
		hist_tex = <hist_tex>
		<show_history>
		exclusive_device = <state_device>
	}
	add_car_menu_text_item \{text = qs(0xcb1f4164)
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
	}
	ui_cas_text_entry_helper_text
	lock_to_text_entry
	ui_event_add_params \{hist_tex = icon_name}
	if GotParam \{cam_name}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
endscript

script ui_cas_text_entry_helper_text 
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x09758c70)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0x1c2cd639)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xa3503d64)
		button = orange
		z = 100000}
endscript

script musicsudio_text_entry_helper_text_linear_flow 
	add_user_control_helper \{text = qs(0x43f2255e)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xa3503d64)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xe3576d13)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_number_entry_helper_text 
	add_user_control_helper \{text = qs(0xe0cae434)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xe3576d13)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0x3fc1c076)
		button = start
		z = 100000}
endscript

script ui_return_cas_text_entry 
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_cas_text_entry 
	SoundEvent \{event = audio_ui_text_entry_finish}
	generic_ui_destroy
endscript

script lock_to_text_entry 
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{Type = pad_choose}
endscript
