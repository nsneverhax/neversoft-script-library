
script ui_create_options 
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	make_menu_frontend \{screen = guitarist
		title = qs(0x976cf9e7)
		spacing_between = -15}
	add_menu_frontend_item \{text = qs(0x2c98ca28)
		choose_state = uistate_options_settings}
	if iswinport
		add_menu_frontend_item \{text = qs(0x123c8984)
			choose_state = 0xb5da61a3}
	endif
	add_menu_frontend_item \{text = qs(0xa1ae7e56)
		choose_state = uistate_top_rockers_mode}
	add_menu_frontend_item \{text = qs(0x550b8c8e)
		choose_state = uistate_options_calibrate_lag}
	add_menu_frontend_item \{text = qs(0x9baf87e5)
		pad_choose_script = menu_choose_band_make_selection
		pad_choose_params = {
			from_options = 1
			event_params = {
				event = menu_back
			}
		}}
	if NOT current_band_has_band_name
		<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
	endif
	add_menu_frontend_item \{text = qs(0x4ce04f5b)
		choose_state = uistate_options_data}
	if NOT current_band_has_band_name
		<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
	endif
	add_menu_frontend_item \{text = qs(0x9560fb22)
		choose_state = uistate_bonus_videos}
	add_menu_frontend_item \{text = qs(0x3e3a98e6)
		choose_state = uistate_options_cheats}
	add_menu_frontend_item \{text = qs(0xcee5ca64)
		choose_state = 0xc5b89784}
	if NOT iswinport
		add_menu_frontend_item \{text = qs(0xfa67ac04)
			choose_state = uistate_guitarhero_com}
		signin_params = {local}
		if isps3
			signin_params = {}
		endif
		if NOT checkforsignin <signin_params> controller_index = ($primary_controller)
			<item_id> :se_setprops not_focusable text_rgba = [64 64 64 255]
		endif
	endif
	menu_finish
endscript

script ui_destroy_options 
	generic_ui_destroy
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	type = guitar
	text = qs(0x9504b94a)
	if NOT isguitarcontroller controller = <controller>
		type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {type = <type> text = <text>}
endscript

script ui_options_set_settings 
	if screenelementexists \{id = current_menu}
		getglobaltags \{user_options}
		current_menu :settags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	removeparameter \{event}
	removeparameter \{controller}
	if NOT ($playing_song)
		removeparameter \{device_num}
		if screenelementexists \{id = current_menu}
			getglobaltags \{user_options}
			new_user_options = <...>
			current_menu :getsingletag \{user_options}
			if gotparam \{user_options}
				if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
					generic_menu_pad_back_sound
					spawnscriptnow \{ui_memcard_autosave_replace}
					return
				endif
			endif
		endif
	endif
	generic_event_back
endscript
