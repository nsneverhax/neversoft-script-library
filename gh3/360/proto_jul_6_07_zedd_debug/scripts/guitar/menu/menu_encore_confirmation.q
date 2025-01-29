g_ec_balloons_pos_left = [
	(315.0, 325.0)
	(465.0, 405.0)
	(590.0, 340.0)
	(360.0, 440.0)
]
g_ec_balloons_pos_right = [
	(960.0, 340.0)
	(790.0, 400.0)
	(690.0, 360.0)
	(915.0, 440.0)
]
g_encore_ready = 0

script create_encore_confirmation_menu 
	menu_font = fontgrid_title_gh3
	menu_pos = (525.0, 470.0)
	new_menu scrollid = ec_scroll vmenuid = ec_vmenu menu_pos = <menu_pos> event_handlers = <ec_eh> spacing = -10
	createscreenelement {
		type = containerelement
		id = ec_container
		parent = root_window
		pos = (0.0, 0.0)
	}
	offwhite = [223 223 223 255]
	menu_z = 100
	displaytext id = 0x8ac9af33 parent = ec_container pos = (500.0, 165.0) scale = 2.25 text = "E" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0x13c0fe89 parent = ec_container pos = (550.0, 165.0) scale = 2.25 text = "N" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0x64c7ce1f parent = ec_container pos = (600.0, 165.0) scale = 2.25 text = "C" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0xfaa35bbc parent = ec_container pos = (650.0, 165.0) scale = 2.25 text = "O" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0x8da46b2a parent = ec_container pos = (700.0, 165.0) scale = 2.25 text = "R" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0x14ad3a90 parent = ec_container pos = (750.0, 165.0) scale = 2.25 text = "E" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaytext id = 0x63aa0a06 parent = ec_container pos = (800.0, 165.0) scale = 2.25 text = "!" just = [center center] rgba = [130 170 200 255] font = fontgrid_title_gh3 noshadow z = <menu_z>
	displaysprite id = ec_flash parent = ec_container tex = encore_flash alpha = 0 dims = (128.0, 128.0)
	arm_pos = (270.0, 300.0)
	arm_add = (80.0, 0.0)
	arm_z = [1 3 5 7 8 6 4 2]
	arm_index = 0
	begin
	formattext checksumname = arm_id 'ec_arm_0%d' d = <arm_index>
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formattext checksumname = arm_tex 'Encore_Arm_%d' d = <rand_arm>
	displaysprite id = <arm_id> parent = ec_container tex = <arm_tex> pos = <arm_pos> dims = (180.0, 340.0) z = (<menu_z> + 10 + (<arm_z> [<arm_index>]))
	if (<rand_arm> = 4 || <rand_arm> = 8)
		<arm_id> :settags higher = 1
	else
		<arm_id> :settags higher = 0
	endif
	<arm_pos> = (<arm_pos> + <arm_add>)
	<arm_index> = (<arm_index> + 1)
	repeat 8
	spawnscriptnow ec_raise_fists
	spawnscriptnow ec_flashes
	spawnscriptnow ec_raise_headline
	get_song_struct song = ($current_song)
	if NOT structurecontains structure = <song_struct> boss
		stars = ($player1_status.stars)
		cash = ($player1_status.new_cash)
		change structurename = player1_status new_cash = 0
		if ($game_mode = p2_career)
			score = ($player1_status.score + $player2_status.score)
		else
			score = ($player1_status.score)
		endif
		if (<stars> < 3)
			<stars> = 3
		endif
		casttointeger score
		formattext textname = scoretext "%d" d = <score> usecommas
		formattext textname = moneytext "$%d" d = <cash> usecommas
		textscale = 0.8
		starscale = 0.0075000003
		displaytext {
			id = ec_scoretext
			font = text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 200
			text = <scoretext>
			just = [right center]
			noshadow
			z = (<menu_z> + 20)
		}
		i = 0
		begin
		formattext checksumname = starchecksum 'star_id0%d' d = <i>
		rot = Random (@ 10 @ 30 @ 80 @ 120 @ 160 @ 200 @ 250 @ 270 @ 320 )
		displaysprite {
			parent = ec_container
			id = <starchecksum>
			pos = (20000.0, 20000.0)
			tex = encore_star_outline
			just = [center center]
			scale = 200
			rgba = [223 223 223 255]
			rot_angle = <rot>
			z = (<menu_z> + 20)
			relative_scale
		}
		formattext checksumname = starchecksum 'star_id0%d_2' d = <i>
		displaysprite {
			parent = ec_container
			id = <starchecksum>
			pos = (20000.0, 20000.0)
			tex = encore_star_outline
			just = [center center]
			scale = 200
			rgba = [110 30 20 255]
			rot_angle = <rot>
			z = (<menu_z> + 21)
			relative_scale
		}
		<i> = (<i> + 1)
		repeat <stars>
		displaytext {
			id = ec_moneytext
			font = text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 200
			text = <moneytext>
			just = [left center]
			noshadow
			z = (<menu_z> + 20)
		}
		wait 1 seconds
		setscreenelementprops id = ec_scoretext pos = (520.0, 220.0) alpha = 0
		doscreenelementmorph id = ec_scoretext scale = <textscale> time = 0.5 alpha = 1
		wait 1 seconds
		setscreenelementprops id = ec_moneytext pos = (760.0, 220.0) alpha = 0
		doscreenelementmorph id = ec_moneytext scale = <textscale> time = 0.5 alpha = 1
		wait 1 seconds
		star_add = (40.0, 0.0)
		star_pos = (600.0, 220.0)
		switch <stars>
			case 4
			<star_pos> = (580.0, 220.0)
			case 5
			<star_pos> = (560.0, 220.0)
		endswitch
		<i> = 0
		begin
		formattext checksumname = starchecksum 'star_id0%d' d = <i>
		setscreenelementprops id = <starchecksum> pos = <star_pos>
		doscreenelementmorph id = <starchecksum> scale = <starscale> time = 0.25 relative_scale
		formattext checksumname = starchecksum 'star_id0%d_2' d = <i>
		setscreenelementprops id = <starchecksum> pos = <star_pos>
		doscreenelementmorph id = <starchecksum> scale = (<starscale> - 0.0012500001) time = 0.25 relative_scale
		wait 0.25 seconds
		<star_pos> = (<star_pos> + <star_add>)
		<i> = (<i> + 1)
		repeat <stars>
	else
		cash = ($player1_status.new_cash)
		change structurename = player1_status new_cash = 0
		formattext textname = moneytext "$%d" d = <cash> usecommas
		displaytext {
			id = ec_moneytext
			font = text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 200
			text = <moneytext>
			just = [center center]
			noshadow
			z = (<menu_z> + 20)
		}
		wait 1 seconds
		setscreenelementprops id = ec_moneytext pos = (640.0, 220.0) alpha = 0
		doscreenelementmorph id = ec_moneytext scale = 1 time = 0.5 alpha = 1
		wait 1 seconds
	endif
	displaysprite parent = ec_container id = ec_crowd_1 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_2 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_3 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_4 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaytext id = ec_crowd_text_1 parent = ec_crowd_1 text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_2 parent = ec_crowd_2 text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_3 parent = ec_crowd_3 text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_4 parent = ec_crowd_4 text = "yay!" pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	spawnscriptnow encore_crowd_shout
	wait 1 second
	change g_encore_ready = 1
	displaysprite parent = ec_container tex = encore_menu_bg pos = (640.0, 550.0) dims = (384.0, 192.0) just = [center center] z = (<menu_z> + 50)
	set_focus_color rgba = [110 30 20 255]
	set_unfocus_color rgba = [135 170 200 255]
	if NOT gotparam exclusive_device
		exclusive_device = ($primary_controller)
	endif
	createscreenelement {
		type = textelement
		id = ec_play_encore
		parent = ec_vmenu
		font = fontgrid_title_gh3
		text = "PLAY ENCORE"
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		event_handlers = [
			{focus ec_yes_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose encore_play}
		]
		z_priority = (<menu_z> + 51)
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = textelement
		id = ec_leave_encore
		parent = ec_vmenu
		font = fontgrid_title_gh3
		text = "LEAVE"
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		event_handlers = [
			{focus ec_no_highlight_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose encore_leave}
		]
		z_priority = (<menu_z> + 51)
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	get_song_struct song = ($current_song)
	if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
		set_current_battle_first_play
	endif
	displaysprite id = ec_hi_left parent = ec_container tex = encore_menu_bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	displaysprite id = ec_hi_right parent = ec_container tex = encore_menu_bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	add_user_control_helper text = "SELECT" button = green z = (<menu_z> + 100)
	add_user_control_helper text = "BACK" button = red z = (<menu_z> + 100)
	add_user_control_helper text = "UP/DOWN" button = strumbar z = (<menu_z> + 100)
endscript

script destroy_encore_confirmation_menu 
	clean_up_user_control_helpers
	killspawnedscript \{name = ec_flashes}
	killspawnedscript \{name = ec_raise_fists}
	change \{g_encore_ready = 0}
	destroy_menu \{menu_id = ec_scroll}
	destroy_menu \{menu_id = ec_container}
	destroy_pause_menu_frame
	killspawnedscript \{name = encore_crowd_shout}
	preencore_crowd_build_sfx_stop
endscript

script ec_yes_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = ec_hi_left}
		if screenelementexists \{id = ec_hi_right}
			setscreenelementprops \{id = ec_hi_left
				pos = (455.0, 505.0)
				flip_v}
			setscreenelementprops \{id = ec_hi_right
				pos = (765.0, 505.0)}
		endif
	endif
endscript

script ec_no_highlight_focus 
	retail_menu_focus
	if screenelementexists \{id = ec_hi_left}
		if screenelementexists \{id = ec_hi_right}
			setscreenelementprops \{id = ec_hi_left
				pos = (520.0, 555.0)
				flip_v}
			setscreenelementprops \{id = ec_hi_right
				pos = (695.0, 555.0)}
		endif
	endif
endscript

script encore_play 
	if ($g_encore_ready)
		ui_flow_manager_respond_to_action \{action = continue}
	endif
endscript

script encore_leave 
	if ($g_encore_ready)
		ui_flow_manager_respond_to_action \{action = quit}
	endif
endscript

script encore_crowd_shout 
	shout_text = [
		"yeah!"
		"rock!"
		"again!"
		"whoo!"
		"yay!"
		"more!"
	]
	getarraysize <shout_text>
	begin
	i = 0
	begin
	formattext checksumname = balloon_id 'ec_crowd_%d' d = <i>
	formattext checksumname = balloon_text 'ec_crowd_text_%d' d = <i>
	side = Random (@ 1 @ 2 )
	rand = Random (@ 0 @ 1 @ 2 @ 3 )
	if (<side> = 1)
		balloon_array = g_ec_balloons_pos_left
	else
		balloon_array = g_ec_balloons_pos_right
	endif
	getrandomvalue a = 0 b = (<array_size> - 1) name = rand_text integer
	if screenelementexists id = <balloon_id>
		setscreenelementprops id = <balloon_id> pos = ($<balloon_array> [<rand>])
		if screenelementexists id = <balloon_text>
			setscreenelementprops id = <balloon_text> text = (<shout_text> [<rand_text>])
		endif
		doscreenelementmorph id = <balloon_id> alpha = 1 time = 0.125
		wait 0.5 seconds
		doscreenelementmorph id = <balloon_id> alpha = 0 time = 0.5
		wait 0.5 seconds
	endif
	mod a = <i> b = 2
	if (<mod> = 0)
		wait 1 second
	endif
	<i> = (<i> + 1)
	repeat 4
	repeat
endscript

script ec_raise_fists 
	begin
	i = 0
	begin
	getrandomvalue a = 0.1 b = 0.3 name = wait_time
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formattext checksumname = arm_id 'ec_arm_0%d' d = <i>
	getscreenelementprops id = <arm_id>
	if screenelementexists id = <arm_id>
		<arm_id> :gettags
		<arm_id> :settags pos = <pos> chance = <rand_arm>
		if (<higher> = 1)
			up_pos = (<pos> - (0.0, 80.0))
		else
			up_pos = (<pos> - (0.0, 50.0))
		endif
		doscreenelementmorph id = <arm_id> pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	<i> = (<i> + 1)
	repeat 8
	wait 0.3 seconds
	<i> = 0
	begin
	getrandomvalue a = 0.1 b = 0.3 name = wait_time
	formattext checksumname = arm_id 'ec_arm_0%d' d = <i>
	if screenelementexists id = <arm_id>
		<arm_id> :gettags
		doscreenelementmorph id = <arm_id> pos = (<pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	<i> = (<i> + 1)
	repeat 8
	wait 0.3 seconds
	repeat
endscript

script ec_raise_headline 
	begin
	i = 0
	begin
	getrandomvalue a = 0.05 b = 0.15 name = wait_time
	formattext checksumname = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if screenelementexists id = <text_id>
		getscreenelementprops id = <text_id>
		<text_id> :gettags
		<text_id> :settags pos = <pos>
		doscreenelementmorph id = <text_id> pos = (<pos> - (0.0, 20.0)) time = <wait_time>
	endif
	<i> = (<i> + 1)
	repeat 8
	wait 0.15 seconds
	<i> = 0
	begin
	getrandomvalue a = 0.05 b = 0.15 name = wait_time
	formattext checksumname = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if screenelementexists id = <text_id>
		<text_id> :gettags
		doscreenelementmorph id = <text_id> pos = <pos> time = (<wait_time> * 2.0)
	endif
	<i> = (<i> + 1)
	repeat 8
	wait 0.15 seconds
	repeat
endscript

script ec_flashes 
	begin
	getrandomvalue a = 400 b = 900 name = x_pos
	getrandomvalue a = 400 b = 500 name = y_pos
	getrandomvalue a = 96 b = 256 name = rand_dim
	getrandomvalue a = 0 b = 360 name = rand_rot
	pos = (<x_pos> * (1.0, 0.0) + <y_pos> * (0.0, 1.0))
	dims = (<rand_dim> * (1.0, 0.0) + <rand_dim> * (0.0, 1.0))
	if screenelementexists id = ec_flash
		setscreenelementprops id = ec_flash pos = <pos> dims = <dims> rot_angle = <rand_rot> alpha = 1
		wait 0.2 seconds
		setscreenelementprops id = ec_flash alpha = 0
	endif
	repeat
endscript
