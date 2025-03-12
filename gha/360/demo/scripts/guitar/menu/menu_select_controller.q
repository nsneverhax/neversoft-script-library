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
		c = (565.0, 415.0)
		g = (565.0, 405.0)
	}
	{
		c = (670.0, 440.0)
		g = (670.0, 430.0)
	}
	{
		c = (655.0, 335.0)
		g = (655.0, 325.0)
	}
	{
		c = (630.0, 395.0)
		g = (630.0, 385.0)
	}
	{
		c = (610.0, 450.0)
		g = (610.0, 440.0)
	}
	{
		c = (700.0, 370.0)
		g = (700.0, 360.0)
	}
	{
		c = (595.0, 345.0)
		g = (595.0, 335.0)
	}
]
menu_select_controller_icon_rotations = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
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
in_controller_select_menu = 0

script create_select_controller_menu 
	change \{in_controller_select_menu = 1}
	change \{p1_ready = 0}
	change \{p2_ready = 0}
	change \{menu_select_controller_p1_controller_id = -1}
	change \{menu_select_controller_p2_controller_id = -1}
	change \{player_controls_valid = 0}
	menu_font = text_a5
	createscreenelement \{type = containerelement
		parent = root_window
		id = msc_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = controller_2p_bg}
	createscreenelement \{type = spriteelement
		parent = msc_container
		id = msc_light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	if english
		<msc_title_tex> = select_controller_title_e
	elseif french
		<msc_title_tex> = select_controller_title_f
	elseif spanish
		<msc_title_tex> = select_controller_title_s
	elseif german
		<msc_title_tex> = select_controller_title_g
	elseif italian
		<msc_title_tex> = select_controller_title_i
	endif
	createscreenelement {
		type = spriteelement
		parent = msc_container
		id = sc_title
		texture = <msc_title_tex>
		pos = (660.0, 200.0)
	}
	createscreenelement {
		type = textelement
		parent = msc_container
		text = "Move the desired controller"
		pos = (620.0, 570.0)
		scale = 0.7
		just = [center center]
		rgba = (($g_menu_colors).white)
		font = text_a11
		z = 100
		shadow
		shadow_rgba = (($g_menu_colors).black)
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement {
		type = textelement
		parent = msc_container
		text = "to your side of the screen."
		pos = (620.0, 610.0)
		scale = 0.7
		just = [center center]
		rgba = (($g_menu_colors).white)
		font = text_a11
		z = 100
		shadow
		shadow_rgba = (($g_menu_colors).black)
		shadow_offs = (2.0, 2.0)
	}
	createscreenelement \{type = containerelement
		parent = msc_container
		id = arrow1_container
		pos = (450.0, 270.0)
		rot_angle = -20}
	<id> :settags old_pos = (450.0, 270.0)
	createscreenelement \{type = spriteelement
		parent = arrow1_container
		id = arrow1
		texture = controller_2p_arrow
		rgba = [
			180
			80
			20
			255
		]
		dims = (64.0, 128.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = spriteelement
		parent = arrow1_container
		id = arrow1_shadow
		texture = controller_2p_arrow
		rgba = (($g_menu_colors).black)
		alpha = 0.75
		dims = (64.0, 128.0)
		pos = (-4.0, 8.0)
		just = [left top]
	}
	createscreenelement \{type = containerelement
		parent = msc_container
		id = arrow2_container
		pos = (705.0, 445.0)
		rot_angle = -20}
	<id> :settags old_pos = (680.0, 420.0)
	createscreenelement \{type = spriteelement
		parent = arrow2_container
		id = arrow2
		texture = controller_2p_arrow
		rgba = [
			90
			50
			165
			255
		]
		dims = (64.0, 128.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		flip_v
		flip_h}
	createscreenelement {
		type = spriteelement
		parent = arrow2_container
		id = arrow2_shadow
		texture = controller_2p_arrow
		rgba = (($g_menu_colors).black)
		alpha = 0.75
		dims = (64.0, 128.0)
		pos = (-4.0, 4.0)
		just = [left top]
		flip_v
		flip_h
	}
	spawnscriptnow \{cs_bounce_arrows}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	create_ready_icons \{pos1 = (300.0, 450.0)
		pos2 = (835.0, 510.0)}
	i = 0
	begin
	getrandomvalue \{a = -10
		b = 10
		name = rand_rot}
	setarrayelement arrayname = menu_select_controller_icon_rotations globalarray index = <i> newvalue = <rand_rot>
	<i> = (<i> + 1)
	repeat 7
	spawnscriptnow \{menu_select_controller_poll_for_controllers
		params = {
			wait_to_drop_controller = 1
		}}
endscript

script destroy_select_controller_menu 
	destroy_ready_icons
	change \{menu_select_num_controllers = 0}
	clean_up_user_control_helpers
	killspawnedscript \{name = cs_bounce_arrows}
	killspawnedscript \{name = menu_select_controller_poll_for_controllers}
	destroy_menu \{menu_id = msc_container}
	destroy_menu_backdrop
	change \{in_controller_select_menu = 0}
endscript

script cs_bounce_arrows 
	begin
	if screenelementexists \{id = arrow1_container}
		arrow1_container :gettags
		doscreenelementmorph id = arrow1_container pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_out
	endif
	if screenelementexists \{id = arrow2_container}
		arrow2_container :gettags
		doscreenelementmorph id = arrow2_container pos = (<old_pos>) time = 0.5 motion = ease_out
	endif
	wait \{0.5
		seconds}
	if screenelementexists \{id = arrow1_container}
		arrow1_container :gettags
		doscreenelementmorph id = arrow1_container pos = (<old_pos>) time = 0.5 motion = ease_in
	endif
	if screenelementexists \{id = arrow2_container}
		arrow2_container :gettags
		doscreenelementmorph id = arrow2_container pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_in
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script menu_select_controller_poll_for_controllers \{wait_to_drop_controller = 0}
	begin
	active_controllers = [0 0 0 0 0 0 0]
	getactivecontrollers
	getinputhandlerbotindex \{player = 1}
	total_change = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		menu_select_controller_add_controllable_icon controller_index = <controller_index> wait_to_drop_controller = <wait_to_drop_controller>
		<total_change> = (<total_change> + <changed>)
	endif
	if (<active_controllers> [<controller_index>] = 0)
		menu_select_controller_remove_controller_icon controller_index = <controller_index> wait_to_drop_controller = <wait_to_drop_controller>
		<total_change> = (<total_change> + <changed>)
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <controller>
	<wait_to_drop_controller> = 0
	wait \{1
		gameframe}
	repeat
endscript

script menu_select_controller_add_controllable_icon \{controller_index = 0
		wait_to_drop_controller = 0}
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
				scriptassert \{"Unrecognized platform for controller select"}
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
			rot_angle = ($menu_select_controller_icon_rotations [<controller_index>])
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
		grey_out_controller controller_index = <controller_index>
		<controller_icon_id> :settags ready = no location = p0 port = <controller_index>
		change menu_select_num_controllers = ($menu_select_num_controllers + 1)
		setscreenelementprops id = <id> alpha = 0
		spawnscriptnow fall_controller params = {controller_index = <controller_index> id = <id> wait = <wait_to_drop_controller>}
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script fall_controller \{wait = 0}
	if (<wait> = 1)
		wait \{0.25
			seconds}
	endif
	if screenelementexists id = <id>
		getscreenelementprops id = <id>
		hipos = (<pos> - (0.0, 720.0))
		setscreenelementprops id = <id> pos = <hipos> alpha = 1
		<id> :domorph pos = (<pos> + (0.0, 50.0)) motion = ease_in time = 0.5
		if screenelementexists id = <id>
			<id> :domorph pos = (<pos> - (0.0, 25.0)) motion = ease_out time = 0.1 rot_angle = RandomRange (-10.0, 10.0)
		endif
		if screenelementexists id = <id>
			<id> :domorph pos = <pos> motion = ease_in time = 0.1 rot_angle = RandomRange (-5.0, 5.0)
		endif
		if (<controller_index> = $primary_controller)
			menu_select_controller_move_up controller_index = <controller_index> force = 1
		endif
		if screenelementexists id = <id>
			launchevent type = focus target = <id>
		endif
	endif
endscript

script menu_select_controller_leave_spot \{controller_index = 0}
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	i = 1
	begin
	formattext checksumname = controller_id 'menu_select_controller_p%d_controller_id' d = <i>
	formattext checksumname = player_ready 'p%d_ready' d = <i>
	if ($<controller_id> = <controller_index>)
		change globalname = <controller_id> newvalue = -1
		<controller_icon_id> :settags ready = no location = p0
		grey_out_controller controller_index = <controller_index>
		generic_menu_up_or_down_sound \{down}
		if ($<player_ready>)
			drop_out_ready_sign player = <i>
			change globalname = <player_ready> newvalue = 0
		endif
		return
	endif
	<i> = (<i> + 1)
	repeat 2
endscript

script menu_select_controller_get_spot \{controller_index = 0
		spot = p1
		force = 0}
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<spot> = p1)
		if ($menu_select_controller_p1_controller_id = -1 || <force> = 1)
			if (<force> = 1)
				if NOT ($menu_select_controller_p1_controller_id = -1)
					menu_select_controller_leave_spot controller_index = ($menu_select_controller_p1_controller_id)
				endif
			endif
			change menu_select_controller_p1_controller_id = <controller_index>
			<controller_icon_id> :settags ready = yes location = p1
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{up}
		endif
	elseif (<spot> = p2)
		if ($menu_select_controller_p2_controller_id = -1)
			change menu_select_controller_p2_controller_id = <controller_index>
			<controller_icon_id> :settags ready = yes location = p2
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script menu_select_controller_move_up \{controller_index = 0
		force = 0}
	unfocus_all_controllers
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	if screenelementexists id = <controller_icon_id>
		<controller_icon_id> :gettags
		if (<location> = p2)
			if ($p2_ready)
				focus_all_controllers
				return
			endif
			if (<controller_index> = $primary_controller)
				if ($menu_select_controller_p1_controller_id = -1)
					menu_select_controller_leave_spot controller_index = <controller_index>
					menu_select_controller_get_spot controller_index = <controller_index> spot = p1
				endif
			else
				menu_select_controller_leave_spot controller_index = <controller_index>
			endif
		elseif (<location> = p0)
			menu_select_controller_get_spot controller_index = <controller_index> spot = p1 force = <force>
		endif
	endif
	focus_all_controllers
endscript

script menu_select_controller_move_down \{controller_index = 0}
	unfocus_all_controllers
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	if screenelementexists id = <controller_icon_id>
		<controller_icon_id> :gettags
		if (<location> = p1)
			if ($p1_ready)
				focus_all_controllers
				return
			endif
			if (<controller_index> = $primary_controller)
				if ($menu_select_controller_p2_controller_id = -1)
					menu_select_controller_leave_spot controller_index = <controller_index>
					menu_select_controller_get_spot controller_index = <controller_index> spot = p2
				endif
			else
				menu_select_controller_leave_spot controller_index = <controller_index>
			endif
		elseif (<location> = p0)
			menu_select_controller_get_spot controller_index = <controller_index> spot = p2
		endif
	endif
	focus_all_controllers
endscript

script menu_select_controller_remove_controller_icon 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	if screenelementexists id = <controller_icon_id>
		if ($menu_select_controller_p1_controller_id = <controller_index>)
			change \{menu_select_controller_p1_controller_id = -1}
		elseif ($menu_select_controller_p2_controller_id = <controller_index>)
			change \{menu_select_controller_p2_controller_id = -1}
		endif
		<controller_icon_id> :gettags
		if (<location> = p1 && $p1_ready = 2)
			drop_out_ready_sign \{player = 1}
			change \{p1_ready = 0}
		endif
		if (<location> = p2 && $p2_ready = 2)
			drop_out_ready_sign \{player = 2}
			change \{p2_ready = 0}
		endif
		destroyscreenelement id = <controller_icon_id>
		change menu_select_num_controllers = ($menu_select_num_controllers - 1)
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script unfocus_all_controllers 
	i = 0
	begin
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <i>
	if screenelementexists id = <controller_icon_id>
		launchevent type = unfocus target = <controller_icon_id>
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script focus_all_controllers 
	i = 0
	begin
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <i>
	if screenelementexists id = <controller_icon_id>
		launchevent type = focus target = <controller_icon_id>
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script menu_select_controller_try_to_continue 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	unfocus_all_controllers
	<controller_icon_id> :gettags
	if (<location> = p1)
		if (<ready> = yes)
			change player1_device = <controller_index>
			if ($p1_ready = 0)
				if ($p2_ready = 0 || $primary_controller = $player1_device || $primary_controller = $player2_device)
					change \{p1_ready = 1}
					drop_in_ready_sign \{player = 1}
					change \{p1_ready = 2}
				endif
			endif
		endif
	elseif (<location> = p2)
		if (<ready> = yes)
			change player2_device = <controller_index>
			if ($p2_ready = 0)
				if ($p1_ready = 0 || $primary_controller = $player1_device || $primary_controller = $player2_device)
					change \{p2_ready = 1}
					drop_in_ready_sign \{player = 2}
					change \{p2_ready = 2}
				endif
			endif
		endif
	endif
	if (($p1_ready = 2) && ($p2_ready = 2))
		change \{p1_ready = 0}
		change \{p2_ready = 0}
		change structurename = player1_status controller = ($player1_device)
		change structurename = player2_status controller = ($player2_device)
		change \{player_controls_valid = 1}
		ui_flow_manager_respond_to_action \{action = continue}
	else
		focus_all_controllers
	endif
endscript

script menu_select_controller_go_back 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :gettags
	if (<location> = p1)
		if ($p1_ready = 2)
			drop_out_ready_sign \{player = 1}
			change \{p1_ready = 0}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	elseif (<location> = p2)
		if ($p2_ready = 2)
			drop_out_ready_sign \{player = 2}
			change \{p2_ready = 0}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script grey_out_controller 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	grey = [150 150 150 255]
	if screenelementexists id = <controller_icon_id>
		<controller_icon_id> :gettags
		if isguitarcontroller controller = <port>
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].g)
		else
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].c)
		endif
		doscreenelementmorph id = <controller_icon_id> pos = <c_pos> scale = 0.5 alpha = 0.75 time = 0.25 relative_scale motion = ease_in
		setscreenelementprops id = <controller_icon_id> rgba = <grey>
	endif
endscript

script light_up_controller 
	formattext checksumname = controller_icon_id 'controller%d_icon' d = <controller_index>
	printf \{"Light up controller"}
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
		setscreenelementprops id = <controller_icon_id> rgba = <white>
		launchevent type = unfocus target = <controller_icon_id>
		runscriptonscreenelement id = <controller_icon_id> controller_move_and_jiggle params = {pos = <new_pos> scale = 1.5 alpha = 1}
		wait \{0.5
			seconds}
		if screenelementexists id = <controller_icon_id>
			launchevent type = focus target = <controller_icon_id>
		endif
	endif
endscript

script controller_move_and_jiggle \{scale = 0.5
		alpha = 0.75}
	if gotparam \{pos}
		domorph pos = <pos> scale = <scale> alpha = <alpha> relative_scale time = 0.25 motion = ease_in
	endif
	domorph \{pos = {
			(5.0, 0.0)
			relative
		}
		time = 0.1
		motion = ease_in}
	domorph \{pos = {
			(-10.0, 0.0)
			relative
		}
		time = 0.05}
	domorph \{pos = {
			(5.0, 0.0)
			relative
		}
		time = 0.1
		motion = ease_out}
endscript
