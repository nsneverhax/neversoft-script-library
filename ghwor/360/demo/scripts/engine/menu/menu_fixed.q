
script make_fixed_menu \{shown_rows = 5
		child_dims = (300.0, 50.0)
		scroll_time = 0.1
		pos = (1024.0, 360.0)
		just = [
			right
			center
		]
		pad_back_script = generic_event_back
		current_menu = current_menu
		parent = root_window}
	createscreenelement {
		type = containerelement
		parent = <parent>
		pos = <pos>
		dims = (((1.0, 0.0) * (<child_dims> [0])) + ((0.0, 1.0) * <shown_rows> * (<child_dims> [1])))
		just = <just>
		child_anchor = <just>
	}
	<fixed_menu> = <id>
	createscreenelement {
		type = spriteelement
		parent = <fixed_menu>
		just = <just>
		dims = <child_dims>
		texture = white
		rgba = [84 64 164 255]
	}
	createscreenelement {
		type = containerelement
		parent = <fixed_menu>
		id = <current_menu>
		pos = (0.0, 0.0)
		dims = (((1.0, 0.0) * (<child_dims> [0])) + ((0.0, 1.0) * <shown_rows> * (<child_dims> [1])))
		just = <just>
		child_anchor = [center center]
		exclusive_device = <exclusive_device>
		event_handlers = [
			{pad_up fixed_menu_scroll params = {current_menu = <current_menu> up}}
			{pad_down fixed_menu_scroll params = {current_menu = <current_menu> down}}
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = generic uitype = back}}
		]
		tags = {
			fixed_menu = <fixed_menu>
			current_index = 0
			total_items = 0
			shown_rows = <shown_rows>
			child_dims = <child_dims>
			child_height = (<child_dims> [1])
			scroll_time = <scroll_time>
		}
	}
endscript

script destroy_fixed_menu \{current_menu = current_menu}
	if screenelementexists id = <current_menu>
		<current_menu> :gettags
		if gotparam \{fixed_menu}
			if screenelementexists id = <fixed_menu>
				<fixed_menu> :die
			endif
		endif
	endif
endscript

script fixed_menu_reset_tags \{current_menu = current_menu}
	<current_menu> :settags {
		current_index = 0
		total_items = 0
	}
endscript

script add_fixed_menu_item \{focusable = 1
		just = [
			center
			center
		]
		text_pos = (0.0, 7.0)
		icon_pos = (0.0, 0.0)
		font = fontgrid_text_a1
		focus_script = fixed_menu_item_focus
		unfocus_script = fixed_menu_item_unfocus
		pad_choose_script = nullscript
		current_menu = current_menu}
	<current_menu> :gettags
	createscreenelement {
		type = containerelement
		parent = <current_menu>
		dims = <child_dims>
		just = [center center]
		child_anchor = <just>
		event_handlers = [
			{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
		alpha = 0.0
		tags = {
			show = 0
			focusable = <focusable>
		}
	}
	container_id = <id>
	if gotparam \{text}
		createscreenelement {
			type = textelement
			parent = <container_id>
			local_id = text
			font = <font>
			text = <text>
			rgba = ($menu_unfocus_color)
			just = <just>
			pos = <text_pos>
		}
	endif
	if gotparam \{icon}
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			local_id = icon
			texture = <icon>
			just = <just>
			pos = <icon_pos>
			scale = 1.0
		}
	endif
	launchevent type = focus target = <current_menu>
	<current_menu> :settags {total_items = (<total_items> + 1)}
	return {container_id = <container_id>}
endscript

script fixed_menu_item_focus 
	gettags
	if screenelementexists id = {<id> child = text}
		setscreenelementprops id = {<id> child = text} rgba = ($menu_focus_color)
	endif
	if screenelementexists id = {<id> child = icon}
		setscreenelementprops id = {<id> child = icon} scale = (1.0, 1.0) time = 0.1
	endif
endscript

script fixed_menu_item_unfocus 
	gettags
	if screenelementexists id = {<id> child = text}
		setscreenelementprops id = {<id> child = text} rgba = ($menu_unfocus_color)
	endif
	if screenelementexists id = {<id> child = icon}
		setscreenelementprops id = {<id> child = icon} scale = 1.0 time = 0.1
	endif
endscript

script finish_fixed_menu \{index = 0
		current_menu = current_menu}
	<current_menu> :gettags
	if (<index> >= <total_items>)
		index = (<total_items> - 1)
	endif
	<current_menu> :settags {current_index = <index>}
	fixed_menu_reposition current_menu = <current_menu>
	i = 0
	begin
	resolvescreenelementid id = {<current_menu> child = <i>}
	<resolved_id> :gettags
	if NOT (<show> = 0)
		alpha_mod = (1.0 / <shown_rows>)
		alpha = (1.0 - (<show> * <alpha_mod>))
		<resolved_id> :setprops alpha = <alpha>
	endif
	i = (<i> + 1)
	repeat <total_items>
	launchevent type = focus target = {<current_menu> child = <index>}
endscript

script fixed_menu_scroll \{current_menu = current_menu}
	<current_menu> :gettags
	launchevent type = unfocus target = {<current_menu> child = <current_index>}
	if gotparam \{down}
		dir = 1
	else
		dir = -1
	endif
	current_index = (<current_index> + <dir>)
	if (<current_index> < 0)
		current_index = (<total_items> - 1)
	endif
	if (<current_index> >= <total_items>)
		current_index = 0
	endif
	<current_menu> :settags {current_index = <current_index>}
	fixed_menu_reposition current_menu = <current_menu> dir = <dir>
	fixed_menu_morph current_menu = <current_menu> dir = <dir>
	wait <scroll_time> seconds
	resolvescreenelementid id = {<current_menu> child = <current_index>}
	<resolved_id> :gettags
	if (<focusable> = 0)
		fixed_menu_scroll <...>
		return
	endif
	launchevent type = focus target = {<current_menu> child = <current_index>}
endscript

script fixed_menu_reposition \{current_menu = current_menu}
	<current_menu> :gettags
	pos_mod = (0.0, 0.0)
	if gotparam \{dir}
		if (<dir> = 1)
			pos_mod = ((0.0, 1.0) * <child_height>)
		else
			pos_mod = ((0.0, -1.0) * <child_height>)
		endif
	endif
	resolvescreenelementid id = {<current_menu> child = <current_index>}
	<resolved_id> :setprops pos = ((0.0, 0.0) + <pos_mod>) alpha = 1.0
	loop = ((<total_items> - 1) / 2)
	shown = (<shown_rows> - 1)
	i = 1
	begin
	prev_show = 0
	next_show = 0
	if ((<i> * 2) <= <shown>)
		prev_show = <i>
		next_show = <i>
	elseif ((<i> * 2) = (<shown> + 1))
		if gotparam \{dir}
			if (<dir> = 1)
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
	resolvescreenelementid id = {<current_menu> child = <prev_index>}
	<resolved_id> :setprops pos = (((0.0, -1.0) * <i> * <child_height>) + <pos_mod>)
	<resolved_id> :settags {show = <prev_show>}
	resolvescreenelementid id = {<current_menu> child = <next_index>}
	<resolved_id> :setprops pos = (((0.0, 1.0) * <i> * <child_height>) + <pos_mod>)
	<resolved_id> :settags {show = <next_show>}
	i = (<i> + 1)
	repeat <loop>
endscript

script fixed_menu_morph \{current_menu = current_menu}
	requireparams \{[
			dir
		]
		all}
	<current_menu> :gettags
	i = 0
	begin
	resolvescreenelementid id = {<current_menu> child = <i>}
	runscriptonscreenelement fixed_menu_item_morph id = <resolved_id> params = {dir = <dir> current_menu = <current_menu>}
	i = (<i> + 1)
	repeat <total_items>
endscript

script fixed_menu_item_morph \{current_menu = current_menu}
	requireparams \{[
			dir
		]
		all}
	gettags
	<current_menu> :gettags
	alpha = 0.0
	if NOT (<show> = 0)
		alpha_mod = (1.0 / <shown_rows>)
		alpha = (1.0 - (<show> * <alpha_mod>))
	endif
	setprops pos = {((0.0, -1.0) * <dir> * <child_height>) relative} alpha = <alpha> time = <scroll_time>
endscript
