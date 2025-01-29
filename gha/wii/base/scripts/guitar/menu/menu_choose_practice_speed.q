menu_choose_practice_destroy_previous_menu = 1
menu_choose_practice_speed_font = text_a5
0xed332211 = 0
0xc42f4139 = 0

script create_choose_practice_speed_menu 
	Change \{0xed332211 = 0}
	disable_pause
	if ScreenElementExists \{id = cps_menu}
		LaunchEvent \{Type = unfocus
			target = cps_menu}
	endif
	if ScreenElementExists \{id = newspaper_vmenu}
		LaunchEvent \{Type = unfocus
			target = newspaper_vmenu}
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back practice_speed_go_back}
	]
	new_menu {
		scrollid = cps_scroll
		vmenuid = cps_vmenu
		menu_pos = (640.0, 260.0)
		spacing = -60
		event_handlers = <event_handlers>
		focus_color = cream
		unfocus_color = cream
	}
	text_params = {
		parent = cps_vmenu
		Type = TextElement
		font = ($menu_choose_practice_speed_font)
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 700
		Scale = 1.1
		just = [center center]
	}
	menu_z = 500
	CreateScreenElement \{Type = ContainerElement
		id = cps_speed_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{parent = cps_speed_container
		Pos = (640.0, 360.0)
		just = [
			right
			bottom
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600
		flip_v}
	displaySprite \{parent = cps_speed_container
		Pos = (640.0, 360.0)
		just = [
			left
			bottom
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600}
	displaySprite \{parent = cps_speed_container
		Pos = (640.0, 360.0)
		just = [
			left
			top
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600
		flip_h}
	CreateScreenElement \{Type = SpriteElement
		parent = cps_speed_container
		Pos = (640.0, 360.0)
		just = [
			right
			top
		]
		texture = practice_speed_bg
		dims = (320.0, 320.0)
		z_priority = 600
		flip_v
		flip_h}
	displaySprite \{parent = cps_speed_container
		id = cps_hilite
		tex = hilite_bar_01
		z = 550
		rgba = [
			120
			90
			140
			255
		]
		just = [
			center
			center
		]
		z = 699}
	displaySprite \{parent = cps_speed_container
		id = cps_hilite_be1
		tex = character_hub_hilite_bookend
		z = 550
		dims = (50.0, 55.0)
		rgba = [
			120
			90
			140
			255
		]
		just = [
			right
			center
		]
		z = 699
		flip_v}
	displaySprite \{parent = cps_speed_container
		id = cps_hilite_be2
		tex = character_hub_hilite_bookend
		z = 550
		dims = (50.0, 55.0)
		rgba = [
			120
			90
			140
			255
		]
		just = [
			left
			center
		]
		z = 699}
	CreateScreenElement \{Type = SpriteElement
		parent = cps_speed_container
		texture = gradient_128
		rgba = [
			0
			0
			0
			180
		]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 500}
	CreateScreenElement \{Type = TextElement
		parent = cps_speed_container
		text = 'Select Speed'
		font = text_a10
		rgba = [
			200
			90
			130
			255
		]
		Scale = 1.5
		Pos = (640.0, 240.0)
		just = [
			center
			center
		]
		z_priority = 700}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_fullspeed Pos = (640.0, 320.0)}}
			{unfocus practice_speed_menu_unfocus params = {id = ps_fullspeed}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = full}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_fullspeed
		text = 'FULL SPEED'
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slow Pos = (640.0, 370.0)}}
			{unfocus practice_speed_menu_unfocus params = {id = ps_slow}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slow}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slow
		text = 'SLOW'
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slower Pos = (640.0, 420.0)}}
			{unfocus practice_speed_menu_unfocus params = {id = ps_slower}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slower}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slower
		text = 'SLOWER'
	}
	CreateScreenElement {
		<text_params>
		Type = ContainerElement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slowest Pos = (640.0, 470.0)}}
			{unfocus practice_speed_menu_unfocus params = {id = ps_slowest}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slowest}}
		]
	}
	CreateScreenElement {
		<text_params>
		parent = <id>
		id = ps_slowest
		text = 'SLOWEST'
	}
	if NOT (ScreenElementExists id = cps_menu)
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 1000}
		add_user_control_helper \{text = 'BACK'
			button = red
			z = 1000}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 1000}
		Change \{0xc42f4139 = 1}
	endif
	Change \{menu_choose_practice_destroy_previous_menu = 0}
endscript

script practice_speed_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = (($g_menu_colors).lt_violet_grey)
		endif
	else
		GetTags
		SetScreenElementProps id = <id> rgba = (($g_menu_colors).lt_violet_grey)
	endif
endscript

script destroy_choose_practice_speed_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		Change \{menu_choose_practice_destroy_previous_menu = 1}
	endif
	if ($0xc42f4139)
		Change \{0xc42f4139 = 0}
		clean_up_user_control_helpers
	endif
	destroy_choose_practice_section_menu
	destroy_newspaper_menu
	destroy_menu \{menu_id = cps_speed_container}
	destroy_menu \{menu_id = cps_scroll}
endscript

script practice_speed_go_back 
	if ($0xed332211 = 0)
		Change \{0xed332211 = 1}
		WaitOneGameFrame
		Change \{menu_choose_practice_destroy_previous_menu = 0}
		menu_flow_go_back
	endif
endscript

script practice_choose_speed_hilite 
	GetScreenElementDims id = <id>
	new_dims = (<width> * (1.5, 0.0) + (0.0, 55.0))
	SetScreenElementProps id = cps_hilite Pos = <Pos> dims = <new_dims>
	SetScreenElementProps id = cps_hilite_be1 Pos = (<Pos> - (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) + (0.0, 0.0)) preserve_flip
	SetScreenElementProps id = cps_hilite_be2 Pos = (<Pos> + (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) + (0.0, 0.0))
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	if ($0xed332211 = 0)
		Change \{0xed332211 = 1}
		WaitOneGameFrame
		switch <speed>
			case full
			Change \{current_speedfactor = 1.0}
			Change \{structurename = PitchShiftSlow1
				pitch = 1.0}
			if (isngc)
				Change \{structurename = 0x39ae1d8e
					pitch = 1.0}
			endif
			case slow
			Change \{current_speedfactor = 0.79899997}
			Change \{structurename = PitchShiftSlow1
				pitch = 1.25}
			if (isngc)
				Change \{structurename = 0x39ae1d8e
					pitch = 1.25}
			endif
			case slower
			if isps2
				Change \{current_speedfactor = 0.6667}
			else
				Change \{current_speedfactor = 0.666}
				Change \{structurename = PitchShiftSlow1
					pitch = 1.5}
				if (isngc)
					Change \{structurename = 0x39ae1d8e
						pitch = 1.5}
				endif
			endif
			case slowest
			Change \{current_speedfactor = 0.5}
			Change \{structurename = PitchShiftSlow1
				pitch = 2.0}
			if (isngc)
				Change \{structurename = 0x39ae1d8e
					pitch = 2.0}
			endif
		endswitch
		Change \{menu_choose_practice_destroy_previous_menu = 1}
		ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
	endif
endscript
