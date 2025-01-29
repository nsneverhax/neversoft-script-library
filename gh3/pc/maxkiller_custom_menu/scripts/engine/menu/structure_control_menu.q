
script create_vmenu_with_title \{parent = root_window
		text = "Default Title"
		vmenu_id = structure_control_vmenu
		scale = 1.8
		padding_scale = 0.8
		internal_scale = 0.5
		pos = (50.0, 180.0)
		dims = (200.0, 100.0)
		internal_just = [
			left
			top
		]
		just = [
			left
			top
		]
		title_color = [
			240
			90
			8
			255
		]
		title_scale = 0.7}
	setscreenelementlock id = <parent> off
	createscreenelement {
		type = vmenu
		parent = <parent>
		id = <vmenu_id>
		font = text_a1
		just = [left top]
		pos = <pos>
		scale = <scale>
		padding_scale = <padding_scale>
		internal_scale = <internal_scale>
		internal_just = <internal_just>
	}
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = text_a1
		text = <text>
		scale = <title_scale>
		rgba = <title_color>
		not_focusable
	}
	assignalias id = <vmenu_id> alias = current_menu
endscript

script structure_control_menu_create \{title_color = [
			240
			90
			8
			255
		]
		label_color = [
			176
			210
			224
			255
		]
		value_color = [
			255
			255
			255
			255
		]
		run_callback_on_create = 0}
	create_vmenu_with_title <...>
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_back <pad_back_script> params = <pad_back_params>}
			{pad_square structure_control_menu_toggle_link}
			{pad_choose structure_control_menu_toggle_step_speed}
		]
		replace_handlers
	}
	current_menu :settags label_color = <label_color> value_color = <value_color>
	structure_control_menu_toggle_link
	structure_control_menu_toggle_step_speed
	if NOT globalexists name = <structure> type = structure
		scriptassert "global structure '%s' does not exist!" s = <structure>
	endif
	getarraysize \{control_items}
	i = 0
	begin
	structure_control_menu_add_item {
		menu_callback = <callback>
		menu_structure = <structure>
		index_item_labels = <index_item_labels>
		(<control_items> [<i>])
	}
	i = (<i> + 1)
	repeat <array_size>
	if gotparam \{choose_items}
		foreachin <choose_items> do = structure_control_menu_add_choose_item
	endif
	if (<run_callback_on_create> = 1)
		<callback> <structure>
	endif
	launchevent \{type = focus
		target = current_menu}
endscript

script structure_control_menu_refresh \{id = current_menu}
	if NOT screenelementexists id = <id>
		return
	endif
	getscreenelementchildren id = <id>
	getarraysize \{children}
	i = 0
	begin
	runscriptonscreenelement id = (<children> [<i>]) structure_control_menu_control_item_refresh
	i = (<i> + 1)
	repeat <array_size>
endscript

script structure_control_menu_toggle_link 
	values_linked = 1
	current_menu :getsingletag \{values_linked}
	if (<values_linked> = 0)
		current_menu :settags \{values_linked = 1}
	else
		current_menu :settags \{values_linked = 0}
	endif
endscript

script structure_control_menu_toggle_step_speed 
	if current_menu :getsingletag \{choose_action_override}
		<choose_action_override> :structure_control_menu_choose_item_action
	else
		step_speed = 1
		current_menu :getsingletag \{step_speed}
		if (<step_speed> = 10)
			current_menu :settags \{step_speed = 1}
		else
			current_menu :settags \{step_speed = 10}
		endif
	endif
endscript

script structure_control_menu_verify_presence 
	if NOT structurecontains structure = (<structure>) <param>
		scriptassert \{"param does not exist in given structure! look above for details"}
	endif
	if globalexists name = <param>
		scriptassert \{"you can't have a param name that conflicts with a global. this causes script interpreter errors"}
	endif
endscript

script structure_control_menu_add_item \{text = "Default Param Name"
		min = 1
		max = 10
		range_loop = 0
		step = 1}
	if gotparam \{separator}
		createscreenelement \{type = textelement
			parent = current_menu
			text = " "
			font = text_a1
			scale = 0.4
			not_focusable}
		return
	endif
	if NOT gotparam \{callback}
		callback = <menu_callback>
	endif
	if NOT gotparam \{structure}
		structure = <menu_structure>
	endif
	structure_control_menu_verify_presence structure = <structure> param = <param>
	if isarray (<structure>.<param>)
		getarraysize (<structure>.<param>)
		i = 0
		begin
		if gotparam \{index_item_labels}
			sub = (<index_item_labels> [<i>])
		else
			sub = <i>
		endif
		formattext textname = new_text "%s(%i)" s = <text> i = <sub>
		manglechecksums a = <param> b = <i>
		structure_control_menu_add_control_item {
			<...>
			array_param_index = <i>
			array_param_size = <array_size>
			text = <new_text>
			id = <mangled_id>
		}
		i = (<i> + 1)
		repeat <array_size>
	else
		structure_control_menu_add_control_item {
			<...>
			text = <text>
			id = <param>
		}
	endif
endscript

script structure_control_menu_add_choose_item \{text = "Default Text"}
	current_menu :getsingletag \{label_color}
	createscreenelement {
		type = textelement
		parent = current_menu
		local_id = <id>
		text = <text>
		font = text_a1
		scale = 0.4
		rgba = <label_color>
		<focusable>
		event_handlers = [
			{focus structure_control_menu_choose_item_focus}
			{unfocus structure_control_menu_choose_item_unfocus}
		]
	}
	<id> :settags {
		action = {
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
		}
	}
endscript

script structure_control_menu_add_control_item 
	control_params = <...>
	current_menu :getsingletag \{label_color}
	createscreenelement {
		type = textelement
		parent = current_menu
		local_id = <id>
		text = <text>
		font = text_a1
		scale = 0.4
		rgba = <label_color>
		event_handlers = [
			{focus structure_control_menu_control_item_focus}
			{unfocus structure_control_menu_control_item_unfocus}
		]
	}
	parent = <id>
	<parent> :settags control_params = <control_params>
	current_menu :getsingletag \{value_color}
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = value_display
		font = text_a1
		just = [center top]
		pos = (450.0, 0.0)
		text = " "
		rgba = <value_color>
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = left_arrow
		texture = left_arrow
		rgba = <label_color>
		pos = (375.0, 5.0)
		just = [right top]
		scale = 0.75
		alpha = 0
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		local_id = right_arrow
		texture = right_arrow
		rgba = <label_color>
		pos = (525.0, 5.0)
		just = [left top]
		scale = 0.75
		alpha = 0
	}
	setscreenelementprops {
		id = <parent>
		event_handlers = [{pad_left structure_control_menu_control_item_change params = {left}}
			{pad_right structure_control_menu_control_item_change params = {right}}
		]
		replace_handlers
	}
	<parent> :structure_control_menu_control_item_refresh
endscript

script structure_control_menu_find_existing_value_index 
	if gotparam \{values}
		getarraysize \{values}
		num_values = <array_size>
		getarraysize \{value_labels}
		if NOT (<num_values> = <array_size>)
			scriptassert \{"Mismatch in size of values and value_labels!"}
		endif
		selection_index = -1
		i = 0
		begin
		if ((<values> [<i>]) = <value>)
			selection_index = <i>
		endif
		i = (<i> + 1)
		repeat <num_values>
		if (<selection_index> < 0)
			scriptassert \{"current param value not found in item options"}
		endif
		settags selection_index = <selection_index>
	endif
endscript

script structure_control_menu_control_item_change 
	obj_getid
	getsingletag \{control_params}
	current_menu :getsingletag \{step_speed}
	if gotparam \{left}
		doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1
		doscreenelementmorph id = {<objid> child = left_arrow} alpha = 0
		if structurecontains \{structure = control_params
				values}
			getsingletag \{selection_index}
			selection_index = (<selection_index> -1)
			getarraysize (<control_params>.values)
			if (<selection_index> < 0)
				if ((<control_params>.range_loop) = 1)
					selection_index = (<array_size> -1)
					doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1 time = 0.3
				else
					selection_index = 0
				endif
			else
				if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
					doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1 time = 0.3
				endif
			endif
			new_value = (<control_params>.values [<selection_index>])
			settags selection_index = <selection_index>
		else
			new_value = ((<control_params>.value) - ((<control_params>.step) * <step_speed>))
			if NOT (<new_value> > (<control_params>.min))
				if ((<control_params>.range_loop) = 1)
					new_value = ((<control_params>.max) + <new_value>)
					doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1 time = 0.3
				else
					new_value = (<control_params>.min)
				endif
			else
				doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1 time = 0.3
			endif
		endif
	endif
	if gotparam \{right}
		doscreenelementmorph id = {<objid> child = right_arrow} alpha = 0
		doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1
		if structurecontains \{structure = control_params
				values}
			getsingletag \{selection_index}
			selection_index = (<selection_index> + 1)
			getarraysize (<control_params>.values)
			if NOT (<selection_index> < <array_size>)
				if ((<control_params>.range_loop) = 1)
					selection_index = 0
					doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1 time = 0.3
				else
					selection_index = (<array_size> -1)
				endif
			else
				if ((<selection_index> < (<array_size> -1)) || ((<control_params>.range_loop) = 1))
					doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1 time = 0.3
				endif
			endif
			new_value = (<control_params>.values [<selection_index>])
			settags selection_index = <selection_index>
		else
			new_value = ((<control_params>.value) + ((<control_params>.step) * <step_speed>))
			if NOT (<new_value> < (<control_params>.max))
				if ((<control_params>.range_loop) = 1)
					new_value = (<new_value> - (<control_params>.max))
					doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1 time = 0.3
				else
					new_value = (<control_params>.max)
				endif
			else
				doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1 time = 0.3
			endif
		endif
	endif
	structure_control_menu_change_structure new_value = <new_value>
endscript

script structure_control_menu_change_structure 
	getsingletag \{control_params}
	structure = (<control_params>.structure)
	param = (<control_params>.param)
	param_links = (<control_params>.param_links)
	value = <new_value>
	index = (<control_params>.array_param_index)
	structure_control_menu_apply_param_change param {
		structure = <structure>
		param = <param>
		new_value = <value>
		index = <index>
	}
	current_menu :getsingletag \{values_linked}
	if (<values_linked> = 1)
		if gotparam \{index}
			i = 0
			begin
			if NOT (<i> = <index>)
				structure_control_menu_apply_param_change param {
					structure = <structure>
					param = <param>
					new_value = <value>
					index = <i>
				}
			endif
			i = (<i> + 1)
			repeat (<control_params>.array_param_size)
		endif
		if gotparam \{param_links}
			i = 0
			getarraysize \{param_links}
			begin
			structure_control_menu_apply_param_change param {
				structure = <structure>
				param = (<param_links> [<i>])
				new_value = <value>
				index = <index>
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	(<control_params>.callback) (<structure>)
endscript

script structure_control_menu_apply_param_change 
	structure_control_menu_verify_presence structure = <structure> param = <param>
	id = <param>
	if gotparam \{index}
		array_value = (<structure>.<param>)
		setarrayelement arrayname = array_value index = <index> newvalue = <new_value>
		addparam name = <param> structure_name = new_params value = <array_value>
		manglechecksums a = <param> b = <index>
		id = <mangled_id>
	else
		addparam name = <param> structure_name = new_params value = <new_value>
	endif
	change globalname = <structure> newvalue = {(<structure>) <new_params>}
	runscriptonscreenelement id = {current_menu child = <id>} structure_control_menu_control_item_refresh
endscript

script structure_control_menu_control_item_refresh 
	obj_getid
	if NOT getsingletag \{control_params}
		return
	endif
	structure = (<control_params>.structure)
	param = (<control_params>.param)
	index = (<control_params>.array_param_index)
	values = (<control_params>.values)
	structure_control_menu_verify_presence structure = <structure> param = <param>
	if gotparam \{index}
		array_value = (<structure>.<param>)
		new_value = (<array_value> [<index>])
	else
		new_value = (<structure>.<param>)
		if gotparam \{values}
			structure_control_menu_find_existing_value_index <control_params> value = <new_value>
		endif
	endif
	new_params = {<control_params> value = <new_value>}
	settags control_params = <new_params>
	control_params = <new_params>
	if gotparam \{values}
		getsingletag \{selection_index}
		display_value = (<control_params>.value_labels [<selection_index>])
	else
		formattext textname = display_value "%v" v = (<control_params>.value) decimalplaces = 2
	endif
	setscreenelementprops {
		id = {<objid> child = value_display}
		text = <display_value>
	}
endscript

script structure_control_menu_control_item_focus 
	obj_getid
	getsingletag \{control_params}
	if structurecontains \{structure = control_params
			values}
		getsingletag \{selection_index}
		getarraysize (<control_params>.values)
		if ((<selection_index> > 0) || ((<control_params>.range_loop) = 1))
			doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1
		endif
		if ((<selection_index> < (<array_size> -1)) || ((<control_params>.range_loop) = 1))
			doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1
		endif
	else
		if (((<control_params>.value) > (<control_params>.min)) || ((<control_params>.range_loop) = 1))
			doscreenelementmorph id = {<objid> child = left_arrow} alpha = 1
		endif
		if (((<control_params>.value) < (<control_params>.max)) || ((<control_params>.range_loop) = 1))
			doscreenelementmorph id = {<objid> child = right_arrow} alpha = 1
		endif
	endif
endscript

script structure_control_menu_control_item_unfocus 
	obj_getid
	doscreenelementmorph id = {<objid> child = right_arrow} alpha = 0
	doscreenelementmorph id = {<objid> child = left_arrow} alpha = 0
endscript

script structure_control_menu_choose_item_focus 
	getprops
	settags old_rgba = <rgba>
	setprops \{rgba = [
			255
			208
			0
			200
		]}
	obj_getid
	current_menu :settags choose_action_override = <objid>
endscript

script structure_control_menu_choose_item_unfocus \{old_rgba = [
			176
			210
			244
			255
		]}
	getsingletag \{old_rgba}
	setprops rgba = <old_rgba>
	current_menu :removetags \{[
			choose_action_override
		]}
endscript

script structure_control_menu_choose_item_action 
	getsingletag \{action}
	(<action>.pad_choose_script) (<action>.pad_choose_params)
endscript
