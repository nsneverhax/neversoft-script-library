
script ui_create_options_data 
	change \{ui_options_from_submenu = 1}
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
	createscreenelement {
		type = descinterface
		desc = 'settings_submenu'
		parent = <container_id>
		id = settings_submenu
		pos = (1200.0, 0.0)
		scale = 1.2
		just = [center center]
	}
	spinner_offset = -25
	if <id> :desc_resolvealias name = alias_menu
		assignalias id = <resolved_id> alias = current_submenu
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
		getscreenelementchildren \{id = current_submenu}
		(<children> [0]) :se_setprops {
			text_text = qs(0x5d22cc45)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {type = save}}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [0]) :settags spinner_offset = <spinner_offset>
		(<children> [1]) :se_setprops {
			text_text = qs(0x3da6185d)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {type = load}}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [1]) :settags spinner_offset = <spinner_offset>
		(<children> [2]) :se_setprops {
			text_text = qs(0x75792198)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_options_data_delete}}
				{focus ui_options_data_focus}
				{unfocus ui_options_data_unfocus}
			]
		}
		(<children> [2]) :settags spinner_offset = <spinner_offset>
		getglobaltags \{user_options}
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
		(<children> [3]) :settags spinner_offset = <spinner_offset>
		current_submenu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = settings_submenu
			}}
	endif
	settings_submenu :obj_spawnscript \{ui_options_data_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	if screenelementexists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_data_animate_out}
	endif
	clean_up_user_control_helpers
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	obj_getid
	getglobaltags \{user_options}
	if (<autosave> = 1)
		soundevent \{event = checkbox_sfx}
		<autosave> = 0
		<objid> :se_setprops check_alpha = 0
		<objid> :se_setprops cross_alpha = 1
	else
		soundevent \{event = checkbox_check_sfx}
		<autosave> = 1
		<objid> :se_setprops check_alpha = 1
		<objid> :se_setprops cross_alpha = 0
	endif
	setglobaltags user_options params = {autosave = <autosave>}
endscript

script ui_options_data_focus 
	obj_getid
	gettags
	<objid> :menu_focus_set_highlight menu = settings_submenu spinner_offset = -25
	if <objid> :desc_resolvealias name = alias_text
		<resolved_id> :se_setprops rgba = ($menu_focus_color)
	endif
endscript

script ui_options_data_unfocus 
	obj_getid
	if <objid> :desc_resolvealias name = alias_text
		<resolved_id> :se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script ui_options_data_animate_in 
	se_setprops \{pos = (810.0, 0.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_data_animate_out 
	se_setprops \{pos = (1200.0, 0.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
endscript
