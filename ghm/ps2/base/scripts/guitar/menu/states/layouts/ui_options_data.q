
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
		Pos = (1200.0, 0.0)
		Scale = 1.2
		just = [center center]
	}
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
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {Type = save}}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [1]) :se_setprops {
			text_text = qs(0x3da6185d)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {Type = load}}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [2]) :se_setprops {
			text_text = qs(0x75792198)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_options_data_delete}}
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
		current_submenu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = settings_submenu
			}}
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	if ScreenElementExists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out}
	endif
	clean_up_user_control_helpers
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
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
	if settings_submenu :desc_resolvealias \{Name = alias_highlight}
		AssignAlias id = <resolved_id> alias = highlight
		Wait \{2
			gameframe}
		if <objID> :desc_resolvealias Name = alias_text
			GetScreenElementChildren id = <resolved_id>
			GetScreenElementDims id = (<children> [0])
			Scale = (((1.0, 0.0) * (((<width> + 80.0) / 256.0))) + (0.0, 1.5))
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (-36.0, -2.0))} Scale = <Scale>
			highlight :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (-36.0, -12.0))} time = 0.05
			highlight :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (-36.0, -2.0))} Scale = <Scale> time = 0.05
			highlight :se_waitprops
		endif
	endif
endscript

script ui_options_data_unfocus 
endscript
