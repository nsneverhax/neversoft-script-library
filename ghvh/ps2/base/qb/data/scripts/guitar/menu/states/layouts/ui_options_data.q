
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
		Scale = 1.25
		just = [center center]
		z_priority = 120.0
	}
	spinner_offset = -25
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
		(<children> [0]) :SetTags spinner_offset = <spinner_offset>
		(<children> [1]) :se_setprops {
			text_text = qs(0x3da6185d)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {Type = load}}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [1]) :SetTags spinner_offset = <spinner_offset>
		(<children> [2]) :se_setprops {
			text_text = qs(0x75792198)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose 0xdfd1bd34}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [2]) :SetTags spinner_offset = <spinner_offset>
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
		(<children> [3]) :SetTags spinner_offset = <spinner_offset>
		DestroyScreenElement id = (<children> [4])
		DestroyScreenElement id = (<children> [5])
		DestroyScreenElement id = (<children> [6])
		current_submenu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = settings_submenu
			}}
	endif
	settings_submenu :obj_spawnscript \{ui_options_data_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	if ScreenElementExists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_data_animate_out}
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
	<objID> :menu_focus_set_highlight menu = settings_submenu spinner_offset = -25
	if <objID> :desc_resolvealias Name = alias_text
		<resolved_id> :se_setprops rgba = ($menu_focus_color)
	endif
endscript

script ui_options_data_unfocus 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_text
		<resolved_id> :se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script ui_options_data_animate_in 
	se_setprops \{Pos = (450.0, -100.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_data_animate_out 
	se_setprops \{Pos = (1200.0, 0.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if ScreenElementExists \{id = settings_submenu}
		DestroyScreenElement \{id = settings_submenu}
	endif
endscript

script 0xdfd1bd34 
	fadetoblack \{On
		time = 0
		alpha = 1.0
		z_priority = 100011}
	generic_event_replace \{data = {
			state = uistate_options_data_delete
		}}
endscript
