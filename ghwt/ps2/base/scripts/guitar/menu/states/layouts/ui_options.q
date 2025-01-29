
script ui_create_options 
	Change \{rich_presence_context = presence_menus}
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{top_rockers_enabled = 0}
	Change \{memcard_after_func = None}
	make_menu_frontend \{screen = GUITARIST
		title = qs(0x976cf9e7)
		item_scale = 1.3499999}
	add_menu_frontend_item \{text = qs(0x2c98ca28)
		choose_state = uistate_options_settings}
	add_menu_frontend_item \{text = qs(0x88572463)
		pad_choose_script = setup_top_rockers_single}
	add_menu_frontend_item \{text = qs(0x550b8c8e)
		choose_state = uistate_options_calibrate_lag}
	add_menu_frontend_item \{text = qs(0x9baf87e5)
		choose_state = uistate_band_logo_choose
		choose_state_data = {
			from_band_info = 1
		}}
	if NOT current_band_has_band_name
		<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
	elseif NOT CheckForSignIn local controller_index = ($primary_controller)
		<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
	endif
	add_menu_frontend_item \{text = qs(0x4ce04f5b)
		choose_state = uistate_options_data}
	add_menu_frontend_item \{text = qs(0x9560fb22)
		choose_state = uistate_bonus_videos}
	add_menu_frontend_item \{text = qs(0x3e3a98e6)
		choose_state = uistate_options_cheats}
	menu_finish
endscript

script ui_destroy_options 
	generic_ui_destroy
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	Type = guitar
	text = qs(0x9504b94a)
	if NOT IsGuitarController controller = <controller>
		Type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			Type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {Type = <Type> text = <text>}
endscript

script ui_options_set_settings 
	if ScreenElementExists \{id = current_menu}
		GetGlobalTags \{user_options}
		current_menu :SetTags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if CheckForSignIn local controller_index = <device_num>
			RemoveParameter \{device_num}
			if ScreenElementExists \{id = current_menu}
				GetGlobalTags \{user_options}
				new_user_options = <...>
				current_menu :GetSingleTag \{user_options}
				if GotParam \{user_options}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						generic_menu_pad_back_sound
						SpawnScriptNow \{ui_memcard_autosave_replace}
						return
					endif
				endif
			endif
		endif
	endif
	generic_event_back
endscript
