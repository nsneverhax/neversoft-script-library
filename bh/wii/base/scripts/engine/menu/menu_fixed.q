
script make_fixed_menu 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_fixed_menu \{current_menu = current_menu}
	ScriptAssert \{'destroy_fixed_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script fixed_menu_reset_tags \{current_menu = current_menu}
	ScriptAssert \{'fixed_menu_reset_tags: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script add_fixed_menu_item 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script fixed_menu_item_focus 
	GetTags
	if ScreenElementExists id = {<id> child = text}
		SetScreenElementProps id = {<id> child = text} rgba = ($menu_focus_color)
	endif
	if ScreenElementExists id = {<id> child = icon}
		SetScreenElementProps id = {<id> child = icon} Scale = (1.0, 1.0) time = 0.1
	endif
endscript

script fixed_menu_item_unfocus 
	GetTags
	if ScreenElementExists id = {<id> child = text}
		SetScreenElementProps id = {<id> child = text} rgba = ($menu_unfocus_color)
	endif
	if ScreenElementExists id = {<id> child = icon}
		SetScreenElementProps id = {<id> child = icon} Scale = 1.0 time = 0.1
	endif
endscript

script finish_fixed_menu \{index = 0
		current_menu = current_menu}
	ScriptAssert \{'finish_fixed_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script fixed_menu_scroll \{current_menu = current_menu}
	<current_menu> :GetTags
	LaunchEvent Type = unfocus target = {<current_menu> child = <current_index>}
	if GotParam \{down}
		Dir = 1
	else
		Dir = -1
	endif
	current_index = (<current_index> + <Dir>)
	if (<current_index> < 0)
		current_index = (<total_items> - 1)
	endif
	if (<current_index> >= <total_items>)
		current_index = 0
	endif
	<current_menu> :SetTags {current_index = <current_index>}
	fixed_menu_reposition current_menu = <current_menu> Dir = <Dir>
	fixed_menu_morph current_menu = <current_menu> Dir = <Dir>
	Wait <scroll_time> Seconds
	ResolveScreenElementID id = {<current_menu> child = <current_index>}
	<resolved_id> :GetTags
	if (<focusable> = 0)
		fixed_menu_scroll <...>
		return
	endif
	LaunchEvent Type = focus target = {<current_menu> child = <current_index>}
endscript

script fixed_menu_reposition \{current_menu = current_menu}
	<current_menu> :GetTags
	pos_mod = (0.0, 0.0)
	if GotParam \{Dir}
		if (<Dir> = 1)
			pos_mod = ((0.0, 1.0) * <child_height>)
		else
			pos_mod = ((0.0, -1.0) * <child_height>)
		endif
	endif
	ResolveScreenElementID id = {<current_menu> child = <current_index>}
	<resolved_id> :SetProps Pos = ((0.0, 0.0) + <pos_mod>) alpha = 1.0
	Loop = ((<total_items> - 1) / 2)
	shown = (<shown_rows> - 1)
	i = 1
	begin
	prev_show = 0
	next_show = 0
	if ((<i> * 2) <= <shown>)
		prev_show = <i>
		next_show = <i>
	elseif ((<i> * 2) = (<shown> + 1))
		if GotParam \{Dir}
			if (<Dir> = 1)
				next_show = <i>
			else
				prev_show = <i>
			endif
		endif
	endif
	prev_index = (<current_index> - <i>)
	if (<prev_index> < 0)
		prev_index = (<prev_index> + <total_items>)
	endif
	next_index = (<current_index> + <i>)
	if (<next_index> >= <total_items>)
		next_index = (<next_index> - <total_items>)
	endif
	ResolveScreenElementID id = {<current_menu> child = <prev_index>}
	<resolved_id> :SetProps Pos = (((0.0, -1.0) * <i> * <child_height>) + <pos_mod>)
	<resolved_id> :SetTags {show = <prev_show>}
	ResolveScreenElementID id = {<current_menu> child = <next_index>}
	<resolved_id> :SetProps Pos = (((0.0, 1.0) * <i> * <child_height>) + <pos_mod>)
	<resolved_id> :SetTags {show = <next_show>}
	i = (<i> + 1)
	repeat <Loop>
endscript

script fixed_menu_morph \{current_menu = current_menu}
	RequireParams \{[
			Dir
		]
		all}
	<current_menu> :GetTags
	i = 0
	begin
	ResolveScreenElementID id = {<current_menu> child = <i>}
	RunScriptOnScreenElement fixed_menu_item_morph id = <resolved_id> params = {Dir = <Dir> current_menu = <current_menu>}
	i = (<i> + 1)
	repeat <total_items>
endscript

script fixed_menu_item_morph \{current_menu = current_menu}
	RequireParams \{[
			Dir
		]
		all}
	GetTags
	<current_menu> :GetTags
	alpha = 0.0
	if NOT (<show> = 0)
		alpha_mod = (1.0 / <shown_rows>)
		alpha = (1.0 - (<show> * <alpha_mod>))
	endif
	SetProps Pos = {((0.0, -1.0) * <Dir> * <child_height>) relative} alpha = <alpha> time = <scroll_time>
endscript
