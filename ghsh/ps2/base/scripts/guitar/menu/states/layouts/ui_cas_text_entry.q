
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
		title = qs(0xbac270df)
		num_icons = <num_icons>
		hist_tex = <hist_tex>
		<show_history>
	}
	CreateScreenElement {
		Type = descinterface
		desc = 'generic_menu_name'
		parent = root_window
		id = name_entry
		Pos = (20.0, 30.0)
		exclusive_device = ($primary_controller)
	}
	<id> :desc_resolvealias Name = alias_vmenu_entry
	AssignAlias id = <resolved_id> alias = current_menu
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
		font = fontgrid_denim_title
		dims = (400.0, 55.0)
		rgba = (($g_menu_colors).menu_title)
	}
	ui_cas_text_entry_helper_text
	lock_to_text_entry
	ui_event_add_params \{hist_tex = icon_name}
	if GotParam \{cam_name}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	if GotParam \{choose_params}
		if StructureContains structure = <choose_params> 0x0148370f
			CreateScreenElement \{Type = SpriteElement
				id = 0xa1a90ba5
				parent = root_window
				texture = pushead_frame
				rgba = [
					255
					255
					255
					255
				]
				Pos = (925.0, 340.0)
				dims = (512.0, 512.0)
				z_priority = 0.5}
		endif
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
	if ScreenElementExists \{id = 0xa1a90ba5}
		DestroyScreenElement \{id = 0xa1a90ba5}
	endif
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
