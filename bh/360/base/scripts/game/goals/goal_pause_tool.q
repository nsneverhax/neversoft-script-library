
script goal_pause_tool_begin_handler 
	printf \{qs(0x46e030c1)}
	enable_pause
endscript

script goal_pause_tool_stop_handler 
	printf \{qs(0xaea8e794)}
	disable_pause
endscript

script goal_pause_tool_get_settings 
	GameMode_GetType
	switch <type>
		case career
		GMan_PauseFunc \{goal = career
			tool = Pause
			func = get_menu_template_settings}
		case competitive
		if GMan_GoalIsActive \{goal = competitive}
			<goal> = competitive
		elseif GMan_GoalIsActive \{goal = shreddfest}
			<goal> = shreddfest
		elseif GMan_GoalIsActive \{goal = shreddfest_timed_elimination}
			<goal> = shreddfest_timed_elimination
		endif
		GMan_PauseFunc goal = <goal> tool = Pause func = get_menu_template_settings
	endswitch
	return settings = <settings>
endscript

script goal_pause_tool_get_default_options 
	goal_pause_tool_get_settings
	if StructureContains structure = <settings> default_options
		return default_options = (<settings>.default_options)
	else
		ScriptAssert \{qs(0x6d1fe4de)}
	endif
endscript

script goal_pause_tool_get_custom_options 
	goal_pause_tool_get_settings
	if StructureContains structure = <settings> custom_options
		return custom_options = (<settings>.custom_options)
	else
		ScriptAssert \{qs(0xbdf6ba20)}
	endif
endscript
