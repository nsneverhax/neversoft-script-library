
script create_rotate_menu {
		parent = root_window
		focus_script = nullscript
		unfocus_script = nullscript
		array_script = nullscript
		choose_script = nullscript
		back_script = nullscript
		pos = (0.0, 0.0)
		ignore_analog = 1
	}
	if NOT gotparam container_id
		scriptassert "Send in a container_id"
	endif
	if NOT gotparam array
		scriptassert "Send in the array"
	endif
	if NOT gotparam array_size
		getarraysize <array>
	endif
	<item_count> = <array_size>
	begin
	if (<item_count> < 7)
		<item_count> = (<item_count> + <array_size>)
	else
		break
	endif
	repeat
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = <parent>
		pos = <pos>
		tags = {
			item_count = <item_count>
			array_size = <array_size>
			focus_script = <focus_script>
			unfocus_script = <unfocus_script>
			choose_script = <choose_script>
			array = <array>
			ignore_analog = <ignore_analog>
		}
		event_handlers = [
			{pad_up rotate_wheel params = {time = 0.2}}
			{pad_down rotate_wheel params = {reverse time = 0.2}}
			{pad_choose wheel_choose params = {select_script = <select_script>}}
			{pad_back <back_script>}
			{focus wheel_refocus}
			{unfocus wheel_unfocus}
		]
	}
	<i> = 0
	<index> = 0
	begin
	if (<i> = <array_size>)
		<i> = 0
	endif
	createscreenelement {
		type = containerelement
		parent = <container_id>
		dims = (0.0, 0.0)
		tags = {
			index = <index>
			array_index = <i>
		}
	}
	createscreenelement {
		type = containerelement
		parent = <id>
		local_id = container
		just = [center bottom]
		pos = (0.0, -200.0)
		dims = (0.0, 0.0)
	}
	<array_script> id = <id> (<array> [<i>])
	<i> = (<i> + 1)
	<index> = (<index> + 1)
	repeat <item_count>
	<i> = 0
	<index> = 0
	begin
	assignalias alias = curr_elem id = {<container_id> child = <i>}
	curr_elem :getsingletag index
	switch <index>
		case (<item_count> - 2)
		<new_rot> = 20
		case (<item_count> - 1)
		<new_rot> = 50
		case 0
		<new_rot> = 90
		case 1
		<new_rot> = 130
		case 2
		<new_rot> = 160
		case 3
		<new_rot> = 205
		case (<item_count> - 3)
		<new_rot> = 335
		default
		<new_rot> = 270
	endswitch
	doscreenelementmorph {
		id = curr_elem
		rot_angle = <new_rot>
		time = 0.0
	}
	resolvescreenelementid id = {curr_elem child = container}
	doscreenelementmorph {
		id = <resolved_id>
		rot_angle = (<new_rot> * -1.0)
		relative_rot_angle
		time = 0.0
	}
	curr_elem :getsingletag array_index
	if (<i> = 0)
		<focus_script> id = <resolved_id> (<array> [<array_index>]) init
	else
		<unfocus_script> id = <resolved_id> (<array> [<array_index>]) init
	endif
	<i> = (<i> + 1)
	repeat <item_count>
endscript

script rotate_wheel time = 0.1
	if NOT gotparam id
		setspawninstancelimits max = 1 management = ignore_spawn_request
		gettags
	else
		<id> :gettags
	endif
	if (<ignore_analog> = 1)
		getanalogueinfo
		if NOT (<lefty> = 0.0)
			return
		endif
	endif
	soundevent event = CAP_SFX_cat_scroll
	<change> = 1
	if gotparam reverse
		<change> = -1
	endif
	if gotparam nowait
		<time> = 0.0
	endif
	<i> = 0
	begin
	assignalias alias = curr_elem id = {<id> child = <i>}
	curr_elem :getsingletag index
	<index> = (<index> + <change>)
	if (<index> = <item_count>)
		<index> = 0
	endif
	if (<index> < 0)
		<index> = (<item_count> - 1)
	endif
	curr_elem :settags index = <index>
	resolvescreenelementid id = {curr_elem child = container}
	switch <index>
		case (<item_count> - 2)
		<new_rot> = 20
		if NOT gotparam reverse
			doscreenelementmorph {
				id = curr_elem
				rot_angle = -25
				time = 0.0
			}
			doscreenelementmorph {
				id = <resolved_id>
				rot_angle = 25
				time = 0.0
			}
		endif
		case (<item_count> - 1)
		<new_rot> = 50
		case 0
		<new_rot> = 90
		case 1
		<new_rot> = 130
		case 2
		<new_rot> = 160
		case 3
		<new_rot> = 205
		case (<item_count> - 3)
		<new_rot> = 335
		if gotparam reverse
			doscreenelementmorph {
				id = curr_elem
				rot_angle = 380
				time = 0.0
			}
			doscreenelementmorph {
				id = <resolved_id>
				rot_angle = -380
				time = 0.0
			}
		endif
		default
		<new_rot> = 270
	endswitch
	curr_elem :getsingletag array_index
	if (<index> = 0)
		<focus_script> id = <resolved_id> (<array> [<array_index>]) time = <time>
	endif
	if ((<index> = 1) || (<index> = (<item_count> - 1)))
		<unfocus_script> id = <resolved_id> (<array> [<array_index>]) time = <time>
	endif
	doscreenelementmorph {
		id = curr_elem
		rot_angle = <new_rot>
		time = <time>
	}
	doscreenelementmorph {
		id = <resolved_id>
		rot_angle = (<new_rot> * -1.0)
		time = <time>
	}
	<i> = (<i> + 1)
	repeat <item_count>
	wait <time> seconds
endscript

script rotate_to_index index = 0
	setspawninstancelimits max = 1 management = ignore_spawn_request
	<temp> = <index>
	gettags
	if ((<temp> < 0) || (<temp> > <array_size>))
		return
	endif
	<params> = {}
	if gotparam reverse
		<params> = {reverse}
	endif
	if gotparam nowait
		<params> = {<params> nowait}
	endif
	<i> = 0
	begin
	if (<i> = <array_size>)
		break
	endif
	<j> = 0
	begin
	assignalias alias = curr_elem id = {<id> child = <j>}
	curr_elem :getsingletag index
	if (<index> = 0)
		break
	endif
	<j> = (<j> + 1)
	repeat <item_count>
	curr_elem :getsingletag array_index
	if (<array_index> = <temp>)
		break
	endif
	rotate_wheel id = <id> <params>
	<i> = (<i> + 1)
	repeat
	if gotparam nowait
	endif
endscript

script wheel_choose 
	gettags
	if (<choose_script> = nullscript)
		return
	endif
	<id> :getsingletag item_count
	<i> = 0
	begin
	assignalias alias = curr_elem id = {<id> child = <i>}
	curr_elem :getsingletag index
	if (<index> = 0)
		break
	endif
	<i> = (<i> + 1)
	repeat <item_count>
	if (<i> = <item_count>)
		return
	endif
	<id> :getsingletag array
	curr_elem :getsingletag array_index
	resolvescreenelementid id = {curr_elem child = container}
	<choose_script> id = <resolved_id> (<array> [<array_index>])
	soundevent event = generic_menu_pad_choose_sfx
endscript

script wheel_refocus 
	if NOT gotparam id
		gettags
	else
		<id> :gettags
	endif
	<i> = 0
	begin
	assignalias alias = curr_elem id = {<id> child = <i>}
	curr_elem :getsingletag index
	if (<index> = 0)
		curr_elem :getsingletag array_index
		resolvescreenelementid id = {curr_elem child = container}
		<focus_script> id = <resolved_id> (<array> [<array_index>])
		return
	endif
	<i> = (<i> + 1)
	repeat <item_count>
endscript

script wheel_unfocus 
	if NOT gotparam id
		gettags
	else
		<id> :gettags
	endif
	<i> = 0
	begin
	assignalias alias = curr_elem id = {<id> child = <i>}
	curr_elem :getsingletag index
	if (<index> = 0)
		curr_elem :getsingletag array_index
		resolvescreenelementid id = {curr_elem child = container}
		<unfocus_script> id = <resolved_id> (<array> [<array_index>])
		return
	endif
	<i> = (<i> + 1)
	repeat <item_count>
endscript
