menu_select_controller_icon_positions = [
	{
		c = (370.0, 350.0)
		g = (370.0, 350.0)
		n = (616.0, 475.0)
	}
	{
		c = (900.0, 420.0)
		g = (900.0, 420.0)
		n = (926.0, 475.0)
	}
	{
		c = (510.0, 420.0)
		g = (510.0, 420.0)
	}
	{
		c = (590.0, 390.0)
		g = (590.0, 390.0)
	}
	{
		c = (670.0, 360.0)
		g = (670.0, 360.0)
	}
	{
		c = (750.0, 320.0)
		g = (750.0, 320.0)
	}
]
menu_select_num_controllers = 0
menu_select_controller_p1_controller_id = -1
menu_select_controller_p2_controller_id = -1
menu_select_controller_light = [
	180
	180
	180
	255
]
menu_select_controller_dark = [
	100
	100
	100
	255
]
menu_select_controller_sticks_big = (192.0, 192.0)
menu_select_controller_sticks_small = (160.0, 160.0)
menu_select_controller_guitar_big = (384.0, 192.0)
menu_select_controller_guitar_small = (320.0, 160.0)

script create_select_controller_menu 
	change p1_ready = 0
	change p2_ready = 0
	change menu_select_controller_p1_controller_id = -1
	change menu_select_controller_p2_controller_id = -1
	menu_font = text_a5
	createscreenelement {
		type = containerelement
		parent = root_window
		id = msc_container
		pos = (0.0, 0.0)
	}
	create_menu_backdrop texture = controller_2p_bg
	displaytext {
		parent = msc_container
		text = "Select Controller"
		pos = (690.0, 140.0)
		scale = 1.4
		just = [center center]
		rgba = [90 25 20 255]
		font = text_a10
		z = 100
		noshadow
	}
	createscreenelement {
		type = textelement
		parent = msc_container
		text = "Move the desired controller"
		pos = (620.0, 570.0)
		scale = 0.7
		just = [center center]
		rgba = [90 25 20 255]
		font = text_a11
		z = 100
		shadow
		shadow_rgba = [225 220 175 255]
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = msc_container
		text = "to your side of the screen."
		pos = (620.0, 610.0)
		scale = 0.7
		just = [center center]
		rgba = [90 25 20 255]
		font = text_a11
		z = 100
		shadow
		shadow_rgba = [225 220 175 255]
		shadow_offs = (2.0, 2.0)
	}
	displaysprite parent = msc_container id = peasant_01 tex = controller_2p_littleman_01 rgba = [220 145 100 255] dims = (192.0, 192.0) pos = (60.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_02 tex = controller_2p_littleman_02 rgba = [220 145 100 255] dims = (192.0, 192.0) pos = (160.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_03 tex = controller_2p_littleman_04 rgba = [220 145 100 255] dims = (192.0, 192.0) pos = (240.0, 620.0) z = 10
	displaysprite parent = msc_container id = peasant_04 tex = controller_2p_littleman_03 rgba = [220 145 100 255] dims = (192.0, 192.0) pos = (320.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_05 tex = controller_2p_littleman_01 rgba = [170 180 215 255] dims = (192.0, 192.0) pos = (760.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_06 tex = controller_2p_littleman_02 rgba = [170 180 215 255] dims = (192.0, 192.0) pos = (860.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_07 tex = controller_2p_littleman_03 rgba = [170 180 215 255] dims = (192.0, 192.0) pos = (940.0, 570.0) z = 10
	displaysprite parent = msc_container id = peasant_08 tex = controller_2p_littleman_04 rgba = [170 180 215 255] dims = (192.0, 192.0) pos = (1020.0, 570.0) z = 10
	createscreenelement {
		type = spriteelement
		parent = msc_container
		id = arrow1
		texture = controller_2p_arrow
		rgba = [240 140 80 255]
		dims = (64.0, 128.0)
		pos = (450.0, 270.0)
		just = [left top]
		rot_angle = -20
	}
	<id> :settags old_pos = (450.0, 270.0)
	createscreenelement {
		type = spriteelement
		parent = msc_container
		id = arrow2
		texture = controller_2p_arrow
		rgba = [130 90 205 255]
		dims = (64.0, 128.0)
		pos = (705.0, 445.0)
		just = [left top]
		flip_v
		flip_h
		rot_angle = -20
	}
	<id> :settags old_pos = (680.0, 420.0)
	spawnscriptnow cs_bounce_arrows
	spawnscriptnow jump_up_and_down_peasants
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "BACK" button = red z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
	create_ready_icons pos1 = (300.0, 450.0) pos2 = (835.0, 510.0)
	spawnscriptnow menu_select_controller_poll_for_controllers
endscript

script destroy_select_controller_menu 
	destroy_ready_icons
	change \{menu_select_num_controllers = 0}
	clean_up_user_control_helpers
	killspawnedscript \{name = cs_bounce_arrows}
	killspawnedscript \{name = jump_up_and_down_peasants}
	killspawnedscript \{name = menu_select_controller_poll_for_controllers}
	destroy_menu \{menu_id = msc_container}
	destroy_menu_backdrop
endscript

script cs_bounce_arrows 
	begin
	if screenelementexists id = arrow1
		arrow1 :gettags
		doscreenelementmorph id = arrow1 pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_out
	endif
	if screenelementexists id = arrow2
		arrow2 :gettags
		doscreenelementmorph id = arrow2 pos = (<old_pos>) time = 0.5 motion = ease_out
	endif
	wait 0.5 seconds
	if screenelementexists id = arrow1
		arrow1 :gettags
		doscreenelementmorph id = arrow1 pos = (<old_pos>) time = 0.5 motion = ease_in
	endif
	if screenelementexists id = arrow2
		arrow2 :gettags
		doscreenelementmorph id = arrow2 pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_in
	endif
	wait 0.5 seconds
	repeat
endscript

script jump_up_and_down_peasants 
	i = 1
	begin
	formattext checksumname = peasant_id 'peasant_0%d' d = <i>
	if screenelementexists id = <peasant_id>
		getscreenelementprops id = <peasant_id>
		getrandomvalue a = 0.05 b = 0.15 name = rand_time
		<peasant_id> :settags old_pos = <pos> rand_time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	begin
	<i> = 1
	begin
	formattext checksumname = peasant_id 'peasant_0%d' d = <i>
	if screenelementexists id = <peasant_id>
		getrandomvalue a = 0 b = 42 name = pos_off_y integer
		<peasant_id> :gettags
		new_pos = (<old_pos> - (<pos_off_y> * (0.0, 1.0)))
		doscreenelementmorph id = <peasant_id> pos = <new_pos> time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	getrandomvalue a = 0.1 b = 0.2 name = rand_wait_time
	wait <rand_wait_time> seconds
	<i> = 1
	begin
	formattext checksumname = peasant_id 'peasant_0%d' d = <i>
	if screenelementexists id = <peasant_id>
		<peasant_id> :gettags
		doscreenelementmorph id = <peasant_id> pos = <old_pos> time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	getrandomvalue a = 0.1 b = 0.2 name = rand_wait_time
	wait <rand_wait_time> seconds
	repeat
endscript

script menu_select_controller_poll_for_controllers 
	begin
	active_controllers = [0 0 0 0]
	getactivecontrollers
	total_change = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		menu_select_controller_add_controllable_icon controller_index = <controller_index>
		<total_change> = (<total_change> + <changed>)
	else
		menu_select_controller_remove_controller_icon controller_index = <controller_index>
		<total_change> = (<total_change> + <changed>)
	endif
	<controller_index> = (<controller_index> + 1)
	repeat 4
	wait 1 gameframe
	repeat
endscript

script menu_select_controller_add_controllable_icon controller_index = 0
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	if NOT screenelementexists id = <controller_icon_id>
		if isguitarcontroller controller = <controller_index>
			c_texture = controller_2p_lespaul
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].g)
		else
			getplatform
			switch <platform>
				case xenon
				c_texture = controller_2p_controller_xbox
				case ps3
				c_texture = controller_2p_controller_ps3
				default
				scriptassert "Unrecognized platform for controller select"
			endswitch
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].c)
		endif
		createscreenelement {
			type = spriteelement
			parent = msc_container
			id = <controller_icon_id>
			texture = <c_texture>
			rgba = [220 220 220 250]
			pos = <c_pos>
			dims = (128.0, 256.0)
			just = [center center]
			z_priority = 10
			rgba = <grey>
			event_handlers = [
				{pad_up menu_select_controller_move_up params = {controller_index = <controller_index>}}
				{pad_down menu_select_controller_move_down params = {controller_index = <controller_index>}}
				{pad_choose menu_select_controller_try_to_continue params = {controller_index = <controller_index>}}
				{pad_back menu_select_controller_go_back params = {controller_index = <controller_index>}}
			]
			exclusive_device = <controller_index>
		}
		<id> :setprops scale = 0.5 relative_scale
		launchevent type = focus target = <controller_icon_id>
		grey_out_controller controller_index = <controller_index>
		<controller_icon_id> :settags ready = no location = p0 port = <controller_index>
		change menu_select_num_controllers = ($menu_select_num_controllers + 1)
		return changed = 1
	endif
	return changed = 0
endscript

script menu_select_controller_leave_spot controller_index = 0
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	i = 1
	begin
	formattext checksumname = controller_id 'menu_select_controller_p%d_controller_id' d = <i>
	if ($<controller_id> = <controller_index>)
		change globalname = <controller_id> newvalue = -1
		<controller_icon_id> :settags ready = no location = p0
		grey_out_controller controller_index = <controller_index>
		generic_menu_up_or_down_sound down
		return
	endif
	<i> = (<i> + 1)
	repeat 2
endscript

script menu_select_controller_get_spot controller_index = 0 spot = p1
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<spot> = p1)
		if ($menu_select_controller_p1_controller_id = -1)
			change menu_select_controller_p1_controller_id = <controller_index>
			<controller_icon_id> :settags ready = yes location = p1
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound up
		endif
	elseif (<spot> = p2)
		if ($menu_select_controller_p2_controller_id = -1)
			change menu_select_controller_p2_controller_id = <controller_index>
			<controller_icon_id> :settags ready = yes location = p2
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound down
		endif
	endif
endscript

script menu_select_controller_move_up \{controller_index = 0}
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<location> = p2)
		if ($p2_ready)
			return
		endif
		menu_select_controller_leave_spot controller_index = <controller_index>
	elseif (<location> = p0)
		menu_select_controller_get_spot controller_index = <controller_index> spot = p1
	endif
endscript

script menu_select_controller_move_down \{controller_index = 0}
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<location> = p1)
		if NOT ($p1_ready = 0)
			return
		endif
		menu_select_controller_leave_spot controller_index = <controller_index>
	elseif (<location> = p0)
		menu_select_controller_get_spot controller_index = <controller_index> spot = p2
	endif
endscript

script menu_select_controller_remove_controller_icon 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	if screenelementexists id = <controller_icon_id>
		if ($menu_select_controller_p1_controller_id = <controller_index>)
			change \{menu_select_controller_p1_controller_id = -1}
		elseif ($menu_select_controller_p2_controller_id = <controller_index>)
			change \{menu_select_controller_p2_controller_id = -1}
		endif
		destroyscreenelement id = <controller_icon_id>
		change menu_select_num_controllers = ($menu_select_num_controllers - 1)
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script menu_select_controller_try_to_continue 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<location> = p1)
		if (<ready> = yes)
			if ($p1_ready = 0)
				change p1_ready = 1
				soundevent event = ui_sfx_select
				drop_in_ready_sign player = 1
				change p1_ready = 2
			endif
			change player1_device = <controller_index>
		endif
	elseif (<location> = p2)
		if (<ready> = yes)
			if ($p2_ready = 0)
				change p2_ready = 1
				soundevent event = ui_sfx_select
				drop_in_ready_sign player = 2
				change p2_ready = 2
			endif
			change player2_device = <controller_index>
		endif
	endif
	if (($p1_ready = 2) && ($p2_ready = 2))
		change p1_ready = 0
		change p2_ready = 0
		change structurename = player1_status controller = ($player1_device)
		change structurename = player2_status controller = ($player2_device)
		ui_flow_manager_respond_to_action action = continue
	endif
endscript

script menu_select_controller_go_back 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<location> = p1)
		if ($p1_ready = 2)
			change p1_ready = 0
			soundevent event = ui_sfx_select
			drop_out_ready_sign player = 1
		else
			ui_flow_manager_respond_to_action action = go_back
		endif
	elseif (<location> = p2)
		if ($p2_ready = 2)
			change p2_ready = 0
			soundevent event = generic_menu_back_sfx
			drop_out_ready_sign player = 2
		else
			ui_flow_manager_respond_to_action action = go_back
		endif
	else
		ui_flow_manager_respond_to_action action = go_back
	endif
endscript

script grey_out_controller 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	grey = [150 150 150 255]
	if screenelementexists id = <controller_icon_id>
		if isguitarcontroller controller = <port>
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].g)
		else
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].c)
		endif
		doscreenelementmorph id = <controller_icon_id> pos = <c_pos> scale = 0.5 alpha = 0.75 time = 0.25 relative_scale motion = ease_in
		runscriptonscreenelement id = <controller_icon_id> controller_jiggle params = {<...>}
		setscreenelementprops id = <controller_icon_id> rgba = <grey>
	endif
endscript

script light_up_controller 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	printf "Light up controller"
	white = [255 255 255 255]
	if screenelementexists id = <controller_icon_id>
		<controller_icon_id> :gettags
		<controller_icon_id> :settags old_pos = <pos>
		<controller_icon_id> :gettags
		index = 0
		if (<location> = p2)
			index = 1
		endif
		if isguitarcontroller controller = <port>
			new_pos = ($menu_select_controller_icon_positions [<index>].g)
		else
			new_pos = ($menu_select_controller_icon_positions [<index>].c)
		endif
		doscreenelementmorph id = <controller_icon_id> pos = <new_pos> scale = 1.5 alpha = 1 time = 0.25 relative_scale motion = ease_in
		runscriptonscreenelement id = <controller_icon_id> controller_jiggle params = {<...>}
		setscreenelementprops id = <controller_icon_id> rgba = <white>
	endif
endscript

script controller_jiggle 
	if NOT screenelementexists id = <controller_icon_id>
		return
	endif
	<controller_icon_id> :domorph pos = {(5.0, 0.0) relative} time = 0.1 motion = ease_in
	<controller_icon_id> :domorph pos = {(-10.0, 0.0) relative} time = 0.05
	<controller_icon_id> :domorph pos = {(5.0, 0.0) relative} time = 0.1 motion = ease_out
endscript
