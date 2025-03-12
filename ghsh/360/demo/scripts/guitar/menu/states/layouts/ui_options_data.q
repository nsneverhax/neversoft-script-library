
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
		scale = 1.0
		just = [center center]
	}
	change \{bx_highlightstars_focuswaittime = 12}
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
		(<children> [1]) :se_setprops {
			text_text = qs(0x3da6185d)
			checkbox_container_alpha = 0
			event_handlers = [
				{pad_choose generic_event_replace params = {state = uistate_memcard data = {type = load}}}
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
		getarraysize <children>
		child = 0
		begin
		if (<children> [<child>]) :desc_resolvealias name = alias_text
			bx_resizetextfield {
				id = <resolved_id>
				dims = (395.0, 50.0)
				fit_width = `scale each line if larger`
			}
			(<children> [<child>]) :settags {text_id = <resolved_id>}
			setscreenelementprops id = <resolved_id> rgba = (($g_menu_colors).menu_gold)
		endif
		increment \{child}
		repeat <array_size>
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in
		params = {
			pos = (-40.0, 0.0)
		}}
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	if screenelementexists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out
			params = {
				pos = (1200.0, 0.0)
			}}
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
	se_setprops text_rgba = (($g_menu_colors).menu_title)
	bx_focushighlightstarson objid = <text_id>
endscript

script ui_options_data_unfocus 
	obj_getid
	se_setprops text_rgba = (($g_menu_colors).menu_gold)
endscript
