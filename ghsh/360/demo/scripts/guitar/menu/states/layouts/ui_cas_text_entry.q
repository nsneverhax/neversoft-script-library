
script ui_create_cas_text_entry 
	if NOT gotparam \{no_show_history}
		show_history = {show_history}
	endif
	if english
		hist_tex = icon_name
	elseif german
		hist_tex = icon_name_german
	elseif french
		hist_tex = icon_name_french
	elseif italian
		hist_tex = icon_name_italian
	elseif spanish
		hist_tex = icon_name_spanish
	endif
	make_generic_menu {
		title = qs(0xbac270df)
		num_icons = <num_icons>
		hist_tex = <hist_tex>
		<show_history>
	}
	createscreenelement {
		type = descinterface
		desc = 'generic_menu_name'
		parent = root_window
		id = name_entry
		pos = (20.0, 30.0)
		exclusive_device = ($primary_controller)
	}
	<id> :desc_resolvealias name = alias_vmenu_entry
	assignalias id = <resolved_id> alias = current_menu
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
		font = fontgrid_bordello
		dims = (400.0, 55.0)
		rgba = (($g_menu_colors).menu_title)
	}
	ui_cas_text_entry_helper_text
	lock_to_text_entry
	ui_event_add_params \{hist_tex = icon_name}
	if gotparam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
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

script ui_return_cas_text_entry 
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_cas_text_entry 
	soundevent \{event = enter_band_name_finish}
	generic_ui_destroy
	if screenelementexists \{id = name_entry}
		destroyscreenelement \{id = name_entry}
	endif
endscript

script lock_to_text_entry 
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	launchevent \{type = pad_choose}
endscript
