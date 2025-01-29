
script ui_create_options_data 
	make_menu_frontend \{screen = guitarist
		title = qs(0x4ce04f5b)
		pad_back_script = ui_options_check_settings}
	add_menu_frontend_item \{text = qs(0x5d22cc45)
		pad_choose_script = ui_memcard_save
		pad_choose_params = {
			event = menu_back
		}}
	add_menu_frontend_item \{text = qs(0x3da6185d)
		pad_choose_script = ui_memcard_load
		pad_choose_params = {
			event = menu_back
		}}
	add_menu_frontend_item \{text = qs(0x75792198)
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_options_data_delete
		}}
	add_menu_frontend_item \{text = qs(0x1cf38dbd)
		pos = (20.0, 0.0)
		pad_choose_script = ui_options_data_toggle_autosave}
	texture = data_settings_xmark
	getglobaltags \{user_options}
	if (<autosave> = 1)
		<texture> = data_settings_checkmark
	endif
	createscreenelement {
		type = spriteelement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 20.0)
		just = [center center]
		texture = <texture>
	}
	menu_finish
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	generic_ui_destroy
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	obj_getid
	<id> = <objid>
	if resolvescreenelementid id = {<id> child = {0 child = check}}
		getglobaltags \{user_options}
		if (<autosave> = 1)
			soundevent \{event = checkbox_sfx}
			<autosave> = 0
			if screenelementexists id = <resolved_id>
				<resolved_id> :legacydomorph alpha = 0 time = <time>
				setscreenelementprops id = <resolved_id> texture = data_settings_xmark
				<resolved_id> :legacydomorph alpha = 1 time = <time>
			endif
		else
			soundevent \{event = checkbox_check_sfx}
			<autosave> = 1
			if screenelementexists id = <resolved_id>
				<resolved_id> :legacydomorph alpha = 0 time = <time>
				setscreenelementprops id = <resolved_id> texture = data_settings_checkmark
				<resolved_id> :legacydomorph alpha = 1 time = <time>
			endif
		endif
		setglobaltags user_options params = {autosave = <autosave>}
	endif
endscript
