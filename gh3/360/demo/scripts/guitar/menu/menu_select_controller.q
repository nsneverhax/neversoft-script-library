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
	Change \{in_controller_select_menu = 1}
	Change \{p1_ready = 0}
	Change \{p2_ready = 0}
	Change \{menu_select_controller_p1_controller_id = -1}
	Change \{menu_select_controller_p2_controller_id = -1}
	Change \{player_controls_valid = 0}
	menu_font = text_a5
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = msc_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Controller_2p_BG}
	displayText \{parent = msc_container
		text = "Select Controller"
		Pos = (690.0, 140.0)
		Scale = 1.4
		just = [
			center
			center
		]
		rgba = [
			90
			25
			20
			255
		]
		font = text_a10
		z = 100
		noshadow}
	CreateScreenElement \{Type = TextElement
		parent = msc_container
		text = "Move the desired controller"
		Pos = (620.0, 570.0)
		Scale = 0.7
		just = [
			center
			center
		]
		rgba = [
			90
			25
			20
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	CreateScreenElement \{Type = TextElement
		parent = msc_container
		text = "to your side of the screen."
		Pos = (620.0, 610.0)
		Scale = 0.7
		just = [
			center
			center
		]
		rgba = [
			90
			25
			20
			255
		]
		font = text_a11
		z = 100
		Shadow
		shadow_rgba = [
			185
			180
			135
			255
		]
		shadow_offs = (2.0, 2.0)}
	displaySprite \{parent = msc_container
		id = peasant_01
		tex = controller_2p_LittleMan_01
		rgba = [
			220
			145
			100
			255
		]
		dims = (192.0, 192.0)
		Pos = (60.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_02
		tex = controller_2p_LittleMan_02
		rgba = [
			220
			145
			100
			255
		]
		dims = (192.0, 192.0)
		Pos = (160.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_03
		tex = controller_2p_LittleMan_04
		rgba = [
			220
			145
			100
			255
		]
		dims = (192.0, 192.0)
		Pos = (240.0, 620.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_04
		tex = controller_2p_LittleMan_03
		rgba = [
			220
			145
			100
			255
		]
		dims = (192.0, 192.0)
		Pos = (320.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_05
		tex = controller_2p_LittleMan_01
		rgba = [
			170
			180
			215
			255
		]
		dims = (192.0, 192.0)
		Pos = (760.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_06
		tex = controller_2p_LittleMan_02
		rgba = [
			170
			180
			215
			255
		]
		dims = (192.0, 192.0)
		Pos = (860.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_07
		tex = controller_2p_LittleMan_03
		rgba = [
			170
			180
			215
			255
		]
		dims = (192.0, 192.0)
		Pos = (940.0, 570.0)
		z = 10}
	displaySprite \{parent = msc_container
		id = peasant_08
		tex = controller_2p_LittleMan_04
		rgba = [
			170
			180
			215
			255
		]
		dims = (192.0, 192.0)
		Pos = (1020.0, 570.0)
		z = 10}
	CreateScreenElement \{Type = SpriteElement
		parent = msc_container
		id = arrow1
		texture = controller_2p_arrow
		rgba = [
			240
			140
			80
			255
		]
		dims = (64.0, 128.0)
		Pos = (450.0, 270.0)
		just = [
			left
			top
		]
		rot_angle = -20}
	<id> :SetTags old_pos = (450.0, 270.0)
	CreateScreenElement \{Type = SpriteElement
		parent = msc_container
		id = arrow2
		texture = controller_2p_arrow
		rgba = [
			130
			90
			205
			255
		]
		dims = (64.0, 128.0)
		Pos = (705.0, 445.0)
		just = [
			left
			top
		]
		flip_v
		flip_h
		rot_angle = -20}
	<id> :SetTags old_pos = (680.0, 420.0)
	SpawnScriptNow \{cs_bounce_arrows}
	SpawnScriptNow \{jump_up_and_down_peasants}
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
	GetRandomValue \{a = -10
		b = 10
		Name = rand_rot}
	SetArrayElement ArrayName = menu_select_controller_icon_rotations globalarray index = <i> NewValue = <rand_rot>
	<i> = (<i> + 1)
	repeat 7
	SpawnScriptNow \{menu_select_controller_poll_for_controllers
		params = {
			wait_to_drop_controller = 1
		}}
endscript

script destroy_select_controller_menu 
	destroy_ready_icons
	Change \{menu_select_num_controllers = 0}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = cs_bounce_arrows}
	KillSpawnedScript \{Name = jump_up_and_down_peasants}
	KillSpawnedScript \{Name = menu_select_controller_poll_for_controllers}
	destroy_menu \{menu_id = msc_container}
	destroy_menu_backdrop
	Change \{in_controller_select_menu = 0}
endscript

script cs_bounce_arrows 
	begin
	if ScreenElementExists \{id = arrow1}
		arrow1 :GetTags
		DoScreenElementMorph id = arrow1 Pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_out
	endif
	if ScreenElementExists \{id = arrow2}
		arrow2 :GetTags
		DoScreenElementMorph id = arrow2 Pos = (<old_pos>) time = 0.5 motion = ease_out
	endif
	Wait \{0.5
		Seconds}
	if ScreenElementExists \{id = arrow1}
		arrow1 :GetTags
		DoScreenElementMorph id = arrow1 Pos = (<old_pos>) time = 0.5 motion = ease_in
	endif
	if ScreenElementExists \{id = arrow2}
		arrow2 :GetTags
		DoScreenElementMorph id = arrow2 Pos = (<old_pos> + (15.0, 25.0)) time = 0.5 motion = ease_in
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript

script jump_up_and_down_peasants 
	i = 1
	begin
	formatText checksumName = peasant_id 'peasant_0%d' d = <i>
	if ScreenElementExists id = <peasant_id>
		GetScreenElementProps id = <peasant_id>
		GetRandomValue \{a = 0.05
			b = 0.15
			Name = rand_time}
		<peasant_id> :SetTags old_pos = <Pos> rand_time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	begin
	<i> = 1
	begin
	formatText checksumName = peasant_id 'peasant_0%d' d = <i>
	if ScreenElementExists id = <peasant_id>
		GetRandomValue \{a = 0
			b = 42
			Name = pos_off_y
			integer}
		<peasant_id> :GetTags
		new_pos = (<old_pos> - (<pos_off_y> * (0.0, 1.0)))
		DoScreenElementMorph id = <peasant_id> Pos = <new_pos> time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	GetRandomValue \{a = 0.1
		b = 0.2
		Name = rand_wait_time}
	Wait <rand_wait_time> Seconds
	<i> = 1
	begin
	formatText checksumName = peasant_id 'peasant_0%d' d = <i>
	if ScreenElementExists id = <peasant_id>
		<peasant_id> :GetTags
		DoScreenElementMorph id = <peasant_id> Pos = <old_pos> time = <rand_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	GetRandomValue \{a = 0.1
		b = 0.2
		Name = rand_wait_time}
	Wait <rand_wait_time> Seconds
	repeat
endscript

script menu_select_controller_poll_for_controllers \{wait_to_drop_controller = 0}
	begin
	active_controllers = [0 0 0 0 0 0 0]
	GetActiveControllers
	GetInputHandlerBotIndex \{Player = 1}
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
	Wait \{1
		gameframe}
	repeat
endscript

script menu_select_controller_add_controllable_icon \{controller_index = 0
		wait_to_drop_controller = 0}
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	if NOT ScreenElementExists id = <controller_icon_id>
		if IsGuitarController controller = <controller_index>
			c_texture = controller_2p_LesPaul
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].g)
		else
			GetPlatform
			switch <Platform>
				case Xenon
				c_texture = controller_2p_controller_XBOX
				case PS3
				c_texture = controller_2p_controller_PS3
				default
				ScriptAssert \{"Unrecognized platform for controller select"}
			endswitch
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].c)
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = msc_container
			id = <controller_icon_id>
			texture = <c_texture>
			rgba = [220 220 220 250]
			Pos = <c_pos>
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
		<id> :SetProps Scale = 0.5 relative_scale
		grey_out_controller controller_index = <controller_index>
		<controller_icon_id> :SetTags ready = no location = p0 port = <controller_index>
		Change menu_select_num_controllers = ($menu_select_num_controllers + 1)
		SetScreenElementProps id = <id> alpha = 0
		SpawnScriptNow fall_controller params = {id = <id> Wait = <wait_to_drop_controller>}
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script fall_controller \{Wait = 0}
	if (<Wait> = 1)
		Wait \{0.25
			Seconds}
	endif
	if ScreenElementExists id = <id>
		GetScreenElementProps id = <id>
		hipos = (<Pos> - (0.0, 720.0))
		SetScreenElementProps id = <id> Pos = <hipos> alpha = 1
		<id> :DoMorph Pos = (<Pos> + (0.0, 50.0)) motion = ease_in time = 0.5
		if ScreenElementExists id = <id>
			<id> :DoMorph Pos = (<Pos> - (0.0, 25.0)) motion = ease_out time = 0.1 rot_angle = RandomRange (-10.0, 10.0)
		endif
		if ScreenElementExists id = <id>
			<id> :DoMorph Pos = <Pos> motion = ease_in time = 0.1 rot_angle = RandomRange (-5.0, 5.0)
		endif
		if ScreenElementExists id = <id>
			LaunchEvent Type = focus target = <id>
		endif
	endif
endscript

script menu_select_controller_leave_spot \{controller_index = 0}
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	i = 1
	begin
	formatText checksumName = controller_id 'menu_select_controller_p%d_controller_id' d = <i>
	if ($<controller_id> = <controller_index>)
		Change GlobalName = <controller_id> NewValue = -1
		<controller_icon_id> :SetTags ready = no location = p0
		grey_out_controller controller_index = <controller_index>
		generic_menu_up_or_down_sound \{down}
		return
	endif
	<i> = (<i> + 1)
	repeat 2
endscript

script menu_select_controller_get_spot \{controller_index = 0
		Spot = p1}
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :GetTags
	if (<Spot> = p1)
		if ($menu_select_controller_p1_controller_id = -1)
			Change menu_select_controller_p1_controller_id = <controller_index>
			<controller_icon_id> :SetTags ready = yes location = p1
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{up}
		endif
	elseif (<Spot> = p2)
		if ($menu_select_controller_p2_controller_id = -1)
			Change menu_select_controller_p2_controller_id = <controller_index>
			<controller_icon_id> :SetTags ready = yes location = p2
			light_up_controller controller_index = <controller_index>
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script menu_select_controller_move_up \{controller_index = 0}
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :GetTags
	if (<location> = p2)
		if ($p2_ready)
			return
		endif
		menu_select_controller_leave_spot controller_index = <controller_index>
	elseif (<location> = p0)
		menu_select_controller_get_spot controller_index = <controller_index> Spot = p1
	endif
endscript

script menu_select_controller_move_down \{controller_index = 0}
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :GetTags
	if (<location> = p1)
		if NOT ($p1_ready = 0)
			return
		endif
		menu_select_controller_leave_spot controller_index = <controller_index>
	elseif (<location> = p0)
		menu_select_controller_get_spot controller_index = <controller_index> Spot = p2
	endif
endscript

script menu_select_controller_remove_controller_icon 
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	if ScreenElementExists id = <controller_icon_id>
		if ($menu_select_controller_p1_controller_id = <controller_index>)
			Change \{menu_select_controller_p1_controller_id = -1}
		elseif ($menu_select_controller_p2_controller_id = <controller_index>)
			Change \{menu_select_controller_p2_controller_id = -1}
		endif
		<controller_icon_id> :GetTags
		if (<location> = p1 && $p1_ready = 2)
			drop_out_ready_sign \{Player = 1}
			Change \{p1_ready = 0}
		endif
		if (<location> = p2 && $p2_ready = 2)
			drop_out_ready_sign \{Player = 2}
			Change \{p2_ready = 0}
		endif
		DestroyScreenElement id = <controller_icon_id>
		Change menu_select_num_controllers = ($menu_select_num_controllers - 1)
		return \{changed = 1}
	endif
	return \{changed = 0}
endscript

script unfocus_all_controllers 
	i = 0
	begin
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <i>
	if ScreenElementExists id = <controller_icon_id>
		LaunchEvent Type = unfocus target = <controller_icon_id>
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script focus_all_controllers 
	i = 0
	begin
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <i>
	if ScreenElementExists id = <controller_icon_id>
		LaunchEvent Type = focus target = <controller_icon_id>
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script menu_select_controller_try_to_continue 
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	unfocus_all_controllers
	<controller_icon_id> :GetTags
	if (<location> = p1)
		if (<ready> = yes)
			if ($p1_ready = 0)
				Change \{p1_ready = 1}
				drop_in_ready_sign \{Player = 1}
				Change \{p1_ready = 2}
			endif
			Change player1_device = <controller_index>
		endif
	elseif (<location> = p2)
		if (<ready> = yes)
			if ($p2_ready = 0)
				Change \{p2_ready = 1}
				drop_in_ready_sign \{Player = 2}
				Change \{p2_ready = 2}
			endif
			Change player2_device = <controller_index>
		endif
	endif
	if (($p1_ready = 2) && ($p2_ready = 2))
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
		Change structurename = player1_status controller = ($player1_device)
		Change structurename = player2_status controller = ($player2_device)
		Change \{player_controls_valid = 1}
		ui_flow_manager_respond_to_action \{action = continue}
	else
		focus_all_controllers
	endif
endscript

script menu_select_controller_go_back 
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	<controller_icon_id> :GetTags
	if (<location> = p1)
		if ($p1_ready = 2)
			Change \{p1_ready = 0}
			drop_out_ready_sign \{Player = 1}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	elseif (<location> = p2)
		if ($p2_ready = 2)
			Change \{p2_ready = 0}
			drop_out_ready_sign \{Player = 2}
		else
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script grey_out_controller 
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	grey = [150 150 150 255]
	if ScreenElementExists id = <controller_icon_id>
		<controller_icon_id> :GetTags
		if IsGuitarController controller = <port>
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].g)
		else
			c_pos = ($menu_select_controller_icon_positions [(<controller_index> + 2)].c)
		endif
		DoScreenElementMorph id = <controller_icon_id> Pos = <c_pos> Scale = 0.5 alpha = 0.75 time = 0.25 relative_scale motion = ease_in
		RunScriptOnScreenElement id = <controller_icon_id> controller_jiggle params = {<...>}
		SetScreenElementProps id = <controller_icon_id> rgba = <grey>
	endif
endscript

script light_up_controller 
	formatText checksumName = controller_icon_id 'controller%d_icon' d = <controller_index>
	printf \{"Light up controller"}
	white = [255 255 255 255]
	if ScreenElementExists id = <controller_icon_id>
		<controller_icon_id> :GetTags
		<controller_icon_id> :SetTags old_pos = <Pos>
		<controller_icon_id> :GetTags
		index = 0
		if (<location> = p2)
			index = 1
		endif
		if IsGuitarController controller = <port>
			new_pos = ($menu_select_controller_icon_positions [<index>].g)
		else
			new_pos = ($menu_select_controller_icon_positions [<index>].c)
		endif
		DoScreenElementMorph id = <controller_icon_id> Pos = <new_pos> Scale = 1.5 alpha = 1 time = 0.25 relative_scale motion = ease_in
		RunScriptOnScreenElement id = <controller_icon_id> controller_jiggle params = {<...>}
		SetScreenElementProps id = <controller_icon_id> rgba = <white>
	endif
endscript

script controller_jiggle 
	if NOT ScreenElementExists id = <controller_icon_id>
		return
	endif
	<controller_icon_id> :DoMorph Pos = {(5.0, 0.0) relative} time = 0.1 motion = ease_in
	<controller_icon_id> :DoMorph Pos = {(-10.0, 0.0) relative} time = 0.05
	<controller_icon_id> :DoMorph Pos = {(5.0, 0.0) relative} time = 0.1 motion = ease_out
endscript
