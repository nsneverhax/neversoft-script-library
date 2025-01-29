
script 0x15010b8a 
	ui_flow_manager_respond_to_action {action = 0x00715d22}
endscript
0x303ae628 = {
	create = 0x24f86642
	destroy = 0x88b2c2e1
	actions = [
		{
			action = go_back
			flow_state_func = 0x5d4b2b40
		}
		{
			action = 0x3f76ac4d
			flow_state = 0xa060c819
			transition_right
		}
		{
			action = 0x893ea182
			flow_state = 0x1411d6ea
			transition_right
		}
		{
			action = 0x6952dc52
			flow_state = 0x9febfd68
		}
		{
			action = 0x93e5a2c8
			func = 0x12d0169b
			flow_state = 0xe2d08a33
			transition_right
		}
	]
}

script 0x24f86642 
	change 0xd4e9be3f = 0
	create_generic_backdrop
	createscreenelement {
		type = vscrollingmenu
		parent = pause_menu
		id = 0xbc997668
		just = [left top]
		dims = (400.0, 480.0)
		pos = (550.0, 100.0)
	}
	createscreenelement {
		type = vmenu
		parent = 0xbc997668
		id = 0xd003006b
		pos = (0.0, 0.0)
		just = [left top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
		]
	}
	disable_pause
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0xea9d6c64
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "GFX Options"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = 0x3f76ac4d}}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0x92de6475
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Setlist Switcher"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = 0x893ea182}}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0x6b1802d1
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Cutoff Viewer"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = 0x93e5a2c8}}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0x23da90c5
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Gem Scale: Unknown"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_left 0xa5b44dce}
			{pad_right 0x24f275df}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0xb44a0b9b
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Display FPS: Unknown"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0xa4508bf0}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0x0b94e3df
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Toogle Bot: Unknown"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x2382a3a4}
		]
	}
	createscreenelement {
		type = textelement
		parent = 0xd003006b
		id = 0x75afe05b
		font = fontgrid_title_gh3
		scale = 0.8
		rgba = [210 210 210 250]
		text = "Credits"
		just = [left top]
		z_priority = 100
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{focus menu_focus}
			{unfocus menu_unfocus}
			{pad_choose 0x9f8c9843}
		]
	}
	0x8bfffed1
	launchevent {type = focus target = 0xd003006b}
endscript

script 0x88b2c2e1 
	if screenelementexists {id = 0xbc997668}
		destroyscreenelement {id = 0xbc997668}
	endif
	destroy_generic_backdrop
	enable_pause
endscript

script 0x8bfffed1 
	0x5314e01c
	formattext textname = 0x6b89d4a4 "Gem Scale: %a" a = <gem_scale>
	setscreenelementprops id = 0x23da90c5 text = <0x6b89d4a4>
	0x0bd2a2ae
	if (<0x7e826355> = 0)
		formattext textname = 0x0b076348 "Display FPS: Off"
	else
		formattext textname = 0x0b076348 "Display FPS: On"
	endif
	setscreenelementprops id = 0xb44a0b9b text = <0x0b076348>
	if (($player1_status.bot_play = 0) && ($player2_status.bot_play = 0))
		formattext textname = 0xf5447633 "Toogle Bot: Disabled"
	elseif (($player1_status.bot_play != 0) && ($player2_status.bot_play = 0))
		formattext textname = 0xf5447633 "Toogle Bot: P1"
	elseif (($player1_status.bot_play = 0) && ($player2_status.bot_play != 0))
		formattext textname = 0xf5447633 "Toogle Bot: P2"
	elseif (($player1_status.bot_play != 0) && ($player2_status.bot_play != 0))
		formattext textname = 0xf5447633 "Toogle Bot: P1 + P2"
	endif
	setscreenelementprops id = 0x0b94e3df text = <0xf5447633>
endscript
0x3b1abe4a = 0

script 0xa4508bf0 
	ui_menu_select_sfx
	0x0bd2a2ae
	0x34e762be 0x7e826355 = (1 - <0x7e826355>)
	0x1e7cdcc8
	0x8bfffed1
endscript

script 0x4511087e 
	begin
	formattext textname = 0x0b076348 "%a FPS" a = ($framerate_value)
	setscreenelementprops id = 0xeb440d42 text = <0x0b076348>
	wait 0.4 second
	repeat
endscript

script 0x2382a3a4 
	ui_menu_select_sfx
	if (($player1_status.bot_play = 0) && ($player2_status.bot_play = 0))
		change structurename = player1_status bot_play = 1
		change structurename = player2_status bot_play = 0
	elseif (($player1_status.bot_play != 0) && ($player2_status.bot_play = 0))
		change structurename = player1_status bot_play = 0
		change structurename = player2_status bot_play = 1
	elseif (($player1_status.bot_play = 0) && ($player2_status.bot_play != 0))
		change structurename = player1_status bot_play = 1
		change structurename = player2_status bot_play = 1
	elseif (($player1_status.bot_play != 0) && ($player2_status.bot_play != 0))
		change structurename = player1_status bot_play = 0
		change structurename = player2_status bot_play = 0
	endif
	0x8bfffed1
endscript

script 0x70598c88 
	begin
	if (($player1_status.bot_play != 0) || ($player2_status.bot_play != 0))
		change structurename = player1_status score = 0
		change structurename = player2_status score = 0
	endif
	wait 1 second
	repeat
endscript

script 0x96d3e8e1 
	if (scriptexists toggle_show_2d_particles)
		return true
	else
		return false
	endif
endscript

script 0x0bd2a2ae 
	0x7e826355 = 0
	getglobaltags $0xaebf2394 noassert = 1
	return 0x7e826355 = <0x7e826355>
endscript

script 0x34e762be 
	0x1e5afd34 $0xaebf2394 params = {0x7e826355 = <0x7e826355>}
endscript
0xaebf2394 = 0x838c0d91

script 0x1e7cdcc8 
	0x0bd2a2ae
	if (<0x7e826355> = 1)
		if NOT objectexists id = 0x419bc9e7
			setscreenelementlock id = root_window off
			createscreenelement {
				type = containerelement
				parent = root_window
				id = 0x419bc9e7
				pos = (80.0, 35.0)
				just = [left center]
			}
			createscreenelement {
				type = textelement
				parent = 0x419bc9e7
				id = 0xeb440d42
				pos = (4.0, 6.0)
				text = "??? FPS"
				font = fontgrid_title_gh3
				rgba = [255 255 255 255]
				just = [left center]
				scale = 0.65
				z_priority = 100
			}
			createscreenelement {
				type = spriteelement
				parent = 0x419bc9e7
				pos = (0.0, 0.0)
				texture = white2
				rgba = [0 0 0 255]
				just = [left center]
				scale = (2.5, 0.5)
				z_priority = 99
			}
			setscreenelementlock id = root_window on
		endif
		if NOT scriptisrunning 0x4511087e
			spawnscriptlater 0x4511087e
		endif
	else
		if scriptisrunning 0x4511087e
			killspawnedscript name = 0x4511087e
		endif
		if objectexists id = 0x419bc9e7
			destroyscreenelement id = 0x419bc9e7
		endif
	endif
endscript
0x0d5735db = {
	create = memcard_sequence_begin_autosave
	destroy = memcard_sequence_cleanup_generic
	actions = [
		{
			action = memcard_sequence_save_success
			flow_state = main_menu_fs
		}
		{
			action = memcard_sequence_save_failed
			flow_state = main_menu_fs
		}
	]
}

script 0x5d4b2b40 
	getglobaltags user_options
	if (<autosave> = 1 && ($0xea423734 = 1))
		change 0xea423734 = 0
		return flow_state = 0x0d5735db
	else
		return flow_state = main_menu_fs
	endif
endscript
0xea423734 = 0

script 0x1e5afd34 
	change 0xea423734 = 1
	setglobaltags <...>
endscript
