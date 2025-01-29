
script ui_create_options_manage_band_logo 
	formatText checksumName = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id>
	formatText TextName = the_bands_name qs(0xb213c4fe) n = <Name>
	SpawnScriptNow \{menu_manage_band_edit_logo_focus}
	make_generic_menu \{title = $wii_band_info
		pad_back_script = band_logo_backout
		vmenu_id = create_options_manage_band_vmenu}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_options_manage_band_vmenu}
	add_generic_menu_text_item {
		text = <the_bands_name>
		text_just = [center center]
		child_anchor = [center center]
		text_offset = (0.0, 0.0)
		heading
	}
	add_generic_menu_text_item \{text = $wii_edit_logo_lc
		choose_state = uistate_cap_main
		choose_state_data = {
			text = qs(0x9a6bb96f)
			part = cas_band_logo
			cam_name = 'options_manage_band_logo'
			num_icons = 0
		}}
	add_generic_menu_text_item \{text = $wii_rename_band_lc
		choose_state = uistate_band_name_enter
		choose_state_data = {
			from_band_logo = from_band_logo
		}}
	menu_finish
endscript

script ui_destroy_options_manage_band_logo 
	destroy_generic_menu
endscript

script ui_init_options_manage_band_logo 
	return
	init_band_logo
	bandlogoobject :Obj_SetPosition \{position = (-33.45, -1.42, 21.9)}
	bandlogoobject :Obj_SetOrientation \{Dir = (0.0, 0.0, -1.0)}
	bandlogoobject :SwitchOnAtomic \{cas_band_logo}
	bandlogoobject :Obj_ApplyScaling \{Scale = 1.0}
endscript

script ui_deinit_options_manage_band_logo 
	Change \{cas_override_object = None}
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script band_logo_backout 
	if NOT getcasappearance
		ScriptAssert \{qs(0xd09a342c)}
	endif
	if StructureContains structure = (<appearance>.cas_band_logo) cap
		GetGlobalTags \{progression_band_info}
		if GotParam \{band_logo}
			generatechecksumfromarray \{ArrayName = band_logo}
			old_save_checksum = <array_checksum>
			new_cap = ((<appearance>.cas_band_logo).cap)
			generatechecksumfromarray \{ArrayName = new_cap}
			if checksumequals a = <old_save_checksum> b = <array_checksum>
				generic_event_back
			else
				SetGlobalTags progression_band_info params = {band_logo = ((<appearance>.cas_band_logo).cap)}
				ui_memcard_autosave \{event = menu_back
					data = {
						num_states = 2
					}}
			endif
		else
			SetGlobalTags progression_band_info params = {band_logo = ((<appearance>.cas_band_logo).cap)}
			ui_memcard_autosave \{event = menu_back
				data = {
					num_states = 2
				}}
		endif
	else
		generic_event_back
	endif
endscript
