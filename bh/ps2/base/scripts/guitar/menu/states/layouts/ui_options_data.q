
script ui_create_options_data 
	Change \{ui_options_from_submenu = 1}
	0x2ea532a9 \{pad_back_script = ui_options_check_settings
		pad_back_params = {
			no_loading_screen
		}}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x5d22cc45)
		0x656de5f8
		pad_choose_script = generic_event_replace
		pad_choose_params = {
			state = uistate_memcard
			data = {
				Type = save
			}
		}}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x3da6185d)
		0x656de5f8
		pad_choose_script = generic_event_replace
		pad_choose_params = {
			state = uistate_memcard
			data = {
				Type = load
			}
		}}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x75792198)
		0x656de5f8
		pad_choose_script = generic_event_replace
		pad_choose_params = {
			state = uistate_options_data_delete
		}}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x1cf38dbd)
		0xc1f386b6
		pad_choose_script = ui_options_data_toggle_autosave
		pad_choose_params = {
			state = uistate_options_data_delete
		}}
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	0x7f9ab085
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	Obj_GetID
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		SoundEvent \{event = box_uncheck_sfx}
		<autosave> = 0
		<objID> :se_setprops check_alpha = 0
		<objID> :se_setprops cross_alpha = 1
	else
		SoundEvent \{event = Box_Check_SFX}
		<autosave> = 1
		<objID> :se_setprops check_alpha = 1
		<objID> :se_setprops cross_alpha = 0
	endif
	SetGlobalTags user_options params = {autosave = <autosave>}
endscript
