menu_choose_practice_destroy_previous_menu = 1
menu_choose_practice_speed_font = text_a3
0xed332211 = 0

script create_choose_practice_speed_menu 
	change \{0xed332211 = 0}
	disable_pause
	if screenelementexists \{id = cps_menu}
		launchevent \{type = unfocus
			target = cps_menu}
	endif
	if screenelementexists \{id = newspaper_vmenu}
		launchevent \{type = unfocus
			target = newspaper_vmenu}
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back practice_speed_go_back}
	]
	new_menu scrollid = cps_scroll vmenuid = cps_vmenu menu_pos = (640.0, 260.0) spacing = -60 event_handlers = <event_handlers>
	change \{menu_unfocus_color = [
			250
			245
			195
			255
		]}
	change \{menu_focus_color = [
			250
			245
			195
			255
		]}
	text_params = {
		parent = cps_vmenu
		type = textelement
		font = ($menu_choose_practice_speed_font)
		rgba = ($menu_unfocus_color)
		z_priority = 700
		scale = 1.1
		just = [center center]
	}
	menu_z = 500
	createscreenelement \{type = containerelement
		id = cps_speed_container
		parent = root_window
		pos = (0.0, 0.0)}
	displaysprite \{parent = cps_speed_container
		pos = (640.0, 360.0)
		just = [
			right
			bottom
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600
		flip_v}
	displaysprite \{parent = cps_speed_container
		pos = (640.0, 360.0)
		just = [
			left
			bottom
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600}
	displaysprite \{parent = cps_speed_container
		pos = (640.0, 360.0)
		just = [
			left
			top
		]
		tex = practice_speed_bg
		dims = (320.0, 320.0)
		z = 600
		flip_h}
	createscreenelement \{type = spriteelement
		parent = cps_speed_container
		pos = (640.0, 360.0)
		just = [
			right
			top
		]
		texture = practice_speed_bg
		dims = (320.0, 320.0)
		z_priority = 600
		flip_v
		flip_h}
	displaysprite \{parent = cps_speed_container
		id = cps_hilite
		tex = white
		z = 550
		rgba = [
			215
			120
			40
			255
		]
		just = [
			center
			center
		]
		z = 699}
	displaysprite \{parent = cps_speed_container
		id = cps_hilite_be1
		tex = character_hub_hilite_bookend
		z = 550
		rgba = [
			215
			120
			40
			255
		]
		just = [
			right
			center
		]
		z = 699}
	displaysprite \{parent = cps_speed_container
		id = cps_hilite_be2
		tex = character_hub_hilite_bookend
		z = 550
		rgba = [
			215
			120
			40
			255
		]
		just = [
			left
			center
		]
		z = 699}
	createscreenelement \{type = spriteelement
		parent = cps_speed_container
		texture = gradient_128
		rgba = [
			0
			0
			0
			180
		]
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 500}
	createscreenelement \{type = textelement
		parent = cps_speed_container
		text = 'Select Speed'
		font = text_a10
		rgba = [
			215
			120
			40
			255
		]
		scale = 1.5
		pos = (640.0, 240.0)
		just = [
			center
			center
		]
		z_priority = 700}
	createscreenelement {
		<text_params>
		type = containerelement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_fullspeed pos = (640.0, 317.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_fullspeed}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = full}}
		]
	}
	createscreenelement {
		<text_params>
		parent = <id>
		id = ps_fullspeed
		text = 'Full Speed'
	}
	createscreenelement {
		<text_params>
		type = containerelement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slow pos = (640.0, 369.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slow}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slow}}
		]
	}
	createscreenelement {
		<text_params>
		parent = <id>
		id = ps_slow
		text = 'Slow'
	}
	createscreenelement {
		<text_params>
		type = containerelement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slower pos = (640.0, 420.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slower}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slower}}
		]
	}
	createscreenelement {
		<text_params>
		parent = <id>
		id = ps_slower
		text = 'Slower'
	}
	createscreenelement {
		<text_params>
		type = containerelement
		dims = (0.0, 100.0)
		event_handlers = [
			{focus practice_choose_speed_hilite params = {id = ps_slowest pos = (640.0, 469.0)}}
			{unfocus retail_menu_unfocus params = {id = ps_slowest}}
			{pad_choose menu_choose_practice_speed_set_speed params = {speed = slowest}}
		]
	}
	createscreenelement {
		<text_params>
		parent = <id>
		id = ps_slowest
		text = 'Slowest'
	}
	change \{menu_choose_practice_destroy_previous_menu = 0}
endscript

script destroy_choose_practice_speed_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		change \{menu_choose_practice_destroy_previous_menu = 1}
	endif
	destroy_choose_practice_section_menu
	destroy_newspaper_menu
	destroy_menu \{menu_id = cps_speed_container}
	destroy_menu \{menu_id = cps_scroll}
endscript

script practice_speed_go_back 
	if ($0xed332211 = 0)
		change \{0xed332211 = 1}
		waitonegameframe
		change \{menu_choose_practice_destroy_previous_menu = 0}
		menu_flow_go_back
	endif
endscript

script practice_choose_speed_hilite 
	getscreenelementdims id = <id>
	new_dims = (<width> * (1.5, 0.0) + (0.0, 45.0))
	setscreenelementprops id = cps_hilite pos = <pos> dims = <new_dims>
	setscreenelementprops id = cps_hilite_be1 pos = (<pos> - (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) + (12.0, 0.0))
	setscreenelementprops id = cps_hilite_be2 pos = (<pos> + (<new_dims>.(0.5, 0.0) * (1.0, 0.0)) - (4.0, 0.0))
endscript

script menu_choose_practice_speed_set_speed \{speed = full}
	if ($0xed332211 = 0)
		change \{0xed332211 = 1}
		waitonegameframe
		switch <speed>
			case full
			change \{current_speedfactor = 1.0}
			change \{structurename = pitchshiftslow1
				pitch = 1.0}
			if (isngc)
				change \{structurename = 0x5f96fb31
					pitch = 1.0}
			endif
			case slow
			change \{current_speedfactor = 0.79899997}
			change \{structurename = pitchshiftslow1
				pitch = 1.25}
			if (isngc)
				change \{structurename = 0x5f96fb31
					pitch = 1.25}
			endif
			case slower
			if isps2
				change \{current_speedfactor = 0.6667}
			else
				change \{current_speedfactor = 0.666}
				change \{structurename = pitchshiftslow1
					pitch = 1.5}
				if (isngc)
					change \{structurename = 0x5f96fb31
						pitch = 1.5}
				endif
			endif
			case slowest
			change \{current_speedfactor = 0.5}
			change \{structurename = pitchshiftslow1
				pitch = 2.0}
			if (isngc)
				change \{structurename = 0x5f96fb31
					pitch = 2.0}
			endif
		endswitch
		change \{menu_choose_practice_destroy_previous_menu = 1}
		ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
	endif
endscript
