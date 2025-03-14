
script add_highway_menu_item \{pad_back_script = generic_exit_restore
		pad_back_sound = ui_menu_select_sfx}
	createscreenelement \{parent = current_menu
		type = descinterface
		desc = 'highway_menu'
		dims = (375.0, 420.0)
		id = highway_menu_anchor}
	if <id> :desc_resolvealias name = alias_highway_menu_item_vmenu param = generic_menu
		if screenelementexists \{id = current_menu}
			launchevent \{type = unfocus
				target = current_menu}
		endif
		assignalias id = <generic_menu> alias = highway_menu
	else
		scriptassert \{qs(0x9f6d2aad)}
	endif
	setscreenelementprops {
		id = <generic_menu>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = <generic_menu>
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}
			]
			replace_handlers
		}
	endif
endscript
