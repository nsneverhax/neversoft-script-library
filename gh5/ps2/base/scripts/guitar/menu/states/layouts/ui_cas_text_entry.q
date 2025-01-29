
script ui_create_cas_text_entry 
	Change \{num_name_size = 14}
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
	make_generic_menu {
		title = qs(0x17f49e18)
		num_icons = <num_icons>
		hist_tex = <hist_tex>
		<show_history>
	}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'generic_menu_name'
		parent = root_window
		id = name_entry
		exclusive_device = ($primary_controller)
	}
	<id> :desc_resolvealias Name = alias_vmenu_entry
	AssignAlias id = <resolved_id> alias = current_menu
	focus_color = [255 255 255 255]
	unfocus_color = [0 0 0 255]
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
		font = fontgrid_text_a11
		dims = (400.0, 55.0)
		text_focus_color = <focus_color>
		0xb90ddda6 = <focus_color>
		text_unfocus_color = <unfocus_color>
		0xbcd8ee4c = <unfocus_color>
		Pos = (45.0, 15.0)
		marker_offset = (-7.0, -10.0)
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
		z = 100000
		all_buttons}
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

script ui_return_cas_text_entry 
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_cas_text_entry 
	SoundEvent \{event = enter_band_name_finish}
	if ScreenElementExists \{id = generic_menu}
		DestroyScreenElement \{id = generic_menu}
	endif
	generic_ui_destroy
	if ScreenElementExists \{id = name_entry}
		DestroyScreenElement \{id = name_entry}
	endif
endscript

script lock_to_text_entry 
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	LaunchEvent \{Type = pad_choose}
endscript
