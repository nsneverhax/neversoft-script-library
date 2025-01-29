
script ui_create_options_data 
	CreateScreenElement \{parent = root_window
		id = 0x15c6aab3
		Type = descinterface
		desc = 'options_menu'
		title_text = qs(0xd14975ca)
		0xf75cb82a = FALSE
		arrows_alpha = 0}
	if NOT 0x15c6aab3 :desc_resolvealias \{Name = 0xa39f6109
			param = 0xd27b45a1}
		SoftAssert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <0xd27b45a1> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1}
	current_menu :se_setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}
		]
		exclusive_device = ($primary_controller)
	}
	add_generic_barrel_menu_text_item \{text = qs(0x5d22cc45)
		pad_choose_script = ui_options_data_save_game
		parent = current_menu}
	add_generic_barrel_menu_text_item \{text = qs(0x3da6185d)
		pad_choose_script = ui_options_data_load_game
		parent = current_menu}
	add_generic_barrel_menu_text_item \{choose_state = uistate_options_progression
		text = qs(0xeb003ba8)
		parent = current_menu}
	ui_options_set_settings
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_options_data 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = 0x15c6aab3}
endscript

script 0xeb09ca13 
	current_menu :obj_spawnscript
endscript

script 0x2ff5f6ec 
	current_menu :obj_spawnscript \{0x0c5f870a
		params = {
			desc_id = 0x15c6aab3
			down
		}}
endscript

script ui_options_data_save_game 
	destroy_generic_barrel_menu
	ui_memcard_save \{event = menu_back}
endscript

script ui_options_data_load_game 
	destroy_generic_barrel_menu
	ui_memcard_load \{event = menu_back
		show_confirm_dialog = 1}
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	memcard_check_for_existing_save
	if (<found> = 0)
		wii_memcard_check_for_space
		if (<nospace> = 1)
			if isngc
				generic_event_choose \{event = menu_change
					data = {
						state = uistate_wii_handle_trc
						event_params = {
							memcard_status = insufficient_space_ingame
							Type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		elseif (<noinode> = 1)
			if isngc
				generic_event_choose \{event = menu_change
					data = {
						state = uistate_wii_handle_trc
						event_params = {
							memcard_status = insufficient_inode_ingame
							Type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		endif
	endif
	if (<found> = 1)
		SetSaveFileName filetype = progress Name = ($memcard_file_types [$progressfiletypeindex].file_name)
		if issavecorrupt \{filetype = progress}
			if isngc
				generic_event_choose \{event = menu_change
					data = {
						state = uistate_wii_handle_trc
						event_params = {
							memcard_status = load_corrupt_ingame
							Type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		endif
	endif
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

script option_data_save_and_load_confirm 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	if GotParam \{save}
		confirmfunc = option_data_save_yes
		text = $option_data_save_confirm
	elseif GotParam \{load}
		confirmfunc = option_data_load_yes
		text = $option_data_load_confirm
	endif
	create_dialog_box {
		body_text = <text>
		options = [
			{
				func = option_data_save_load_cancel
				text = $wii_popup_cancel
			}
			{
				func = <confirmfunc>
				func_params = {data = {event = menu_back state = uistate_options_data}}
				text = $wii_popup_sure
			}
		]
	}
endscript

script option_data_save_yes 
	Change \{memcard_after_func = option_data_save_load_after_func}
	ui_memcard_save \{event = menu_back
		data = {
			state = uistate_options_data
		}}
endscript

script option_data_load_yes 
	Change \{memcard_after_func = option_data_save_load_after_func}
	ui_memcard_load \{event = menu_back
		data = {
			state = uistate_options_data
		}}
endscript

script option_data_save_load_cancel 
	destroy_dialog_box
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script option_data_save_load_after_func 
	destroy_dialog_box
endscript
