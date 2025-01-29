
script ui_create_options_data 
	Change \{ui_options_from_submenu = 1}
	if ScreenElementExists \{id = settings_submenu}
		DestroyScreenElement \{id = settings_submenu}
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'settings_submenu'
		parent = <container_id>
		id = settings_submenu
		Pos = (1200.0, -155.0)
		Scale = 1.0
		just = [center center]
	}
	Change \{bx_highlightstars_focuswaittime = 22}
	if <id> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_submenu
		current_submenu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_back
					ui_options_check_settings
					params = {
						no_loading_screen
					}
				}
			]}
		GetScreenElementChildren \{id = current_submenu}
		(<children> [0]) :se_setprops {
			text_text = qs(0x5d22cc45)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose 0xa7c71a55}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [1]) :se_setprops {
			text_text = qs(0x3da6185d)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose 0xa811f422}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [2]) :se_setprops {
			text_text = qs(0x75792198)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose 0xb48a0570}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [3]) :se_setprops {
			text_text = qs(0x1cf38dbd)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose ui_options_data_toggle_autosave}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		GetArraySize <children>
		child = 0
		begin
		if (<children> [<child>]) :desc_resolvealias Name = alias_text
			bx_resizetextfield {
				id = <resolved_id>
				dims = (395.0, 50.0)
				fit_width = `scale	each	line	if	larger`
			}
			(<children> [<child>]) :SetTags {text_id = <resolved_id>}
			SetScreenElementProps id = <resolved_id> rgba = (($g_menu_colors).menu_gold)
		endif
		Increment \{child}
		repeat <array_Size>
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in
		params = {
			Pos = (-350.0, -155.0)
		}}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	if ScreenElementExists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out
			params = {
				Pos = (1200.0, -155.0)
			}}
	endif
	clean_up_user_control_helpers
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
		SetSaveFileName filetype = progress Name = ($memcard_file_types.progress.file_name)
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
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		SoundEvent \{event = Checkbox_SFX}
		<autosave> = 0
		<objID> :se_setprops check_alpha = 0
		<objID> :se_setprops cross_alpha = 1
	else
		SoundEvent \{event = CheckBox_Check_SFX}
		<autosave> = 1
		<objID> :se_setprops check_alpha = 1
		<objID> :se_setprops cross_alpha = 0
	endif
	SetGlobalTags user_options params = {autosave = <autosave>}
endscript

script ui_options_data_focus 
	Obj_GetID
	GetTags
	se_setprops text_rgba = (($g_menu_colors).menu_title)
	bx_focushighlightstarson objID = <text_id>
endscript

script ui_options_data_unfocus 
	Obj_GetID
	se_setprops text_rgba = (($g_menu_colors).menu_gold)
endscript

script 0xa7c71a55 
	if NOT ($0x8e314709)
		create_loading_screen
	endif
	generic_event_replace \{state = uistate_memcard
		data = {
			Type = save
			0x6d221ff1
		}}
endscript

script 0xa811f422 
	if NOT ($0x8e314709)
		create_loading_screen
	endif
	generic_event_replace \{state = uistate_memcard
		data = {
			Type = load
			0x6d221ff1
		}}
endscript

script 0xb48a0570 
	if NOT ($0x8e314709)
		create_loading_screen
	endif
	generic_event_replace \{state = uistate_options_data_delete}
endscript
