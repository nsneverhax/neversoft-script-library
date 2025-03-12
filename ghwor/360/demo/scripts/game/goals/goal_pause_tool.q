
script goal_pause_tool_begin_handler 
	printf \{qs(0x46e030c1)}
	enable_pause
endscript

script goal_pause_tool_stop_handler 
	printf \{qs(0xaea8e794)}
	disable_pause
endscript

script goal_pause_tool_get_settings 
	gamemode_gettype
	switch <type>
		case quickplay
		gman_pausefunc goal = <type> tool = pause func = get_menu_template_settings
		case career
		gman_pausefunc goal = <type> tool = pause func = get_menu_template_settings
		case competitive
		if gman_goalisactive \{goal = competitive}
			<goal> = competitive
		elseif gman_goalisactive \{goal = shreddfest}
			<goal> = shreddfest
		elseif gman_goalisactive \{goal = shreddfest_timed_elimination}
			<goal> = shreddfest_timed_elimination
		endif
		gman_pausefunc goal = <goal> tool = pause func = get_menu_template_settings
	endswitch
	return settings = <settings>
endscript

script goal_pause_tool_get_default_options 
	goal_pause_tool_get_settings
	if NOT gotparam \{settings}
		scriptassert \{qs(0x6d1fe4de)}
	endif
	if structurecontains structure = <settings> default_options
		return default_options = (<settings>.default_options)
	else
		scriptassert \{qs(0x6d1fe4de)}
	endif
endscript

script goal_pause_tool_get_custom_options 
	goal_pause_tool_get_settings
	if structurecontains structure = <settings> custom_options
		return custom_options = (<settings>.custom_options)
	else
		scriptassert \{qs(0xbdf6ba20)}
	endif
endscript
