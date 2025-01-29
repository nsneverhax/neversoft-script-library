
script ui_create_options_data 
	make_menu_frontend \{screen = GUITARIST
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
		Pos = (20.0, 0.0)
		pad_choose_script = ui_options_data_toggle_autosave}
	texture = data_settings_xmark
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		<texture> = data_settings_checkmark
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <item_container_id>
		local_id = check
		Pos = (-15.0, 35.0)
		just = [center center]
		texture = <texture>
		Scale = 0.65000004
	}
	menu_finish
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	generic_ui_destroy
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	Obj_GetID
	<id> = <objID>
	if ResolveScreenElementID id = {<id> child = {0 child = check}}
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			SoundEvent \{event = Checkbox_SFX}
			<autosave> = 0
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :legacydomorph alpha = 0 time = <time>
				SetScreenElementProps id = <resolved_id> texture = data_settings_xmark
				<resolved_id> :legacydomorph alpha = 1 time = <time>
			endif
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<autosave> = 1
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :legacydomorph alpha = 0 time = <time>
				SetScreenElementProps id = <resolved_id> texture = data_settings_checkmark
				<resolved_id> :legacydomorph alpha = 1 time = <time>
			endif
		endif
		SetGlobalTags user_options params = {autosave = <autosave>}
	endif
endscript
