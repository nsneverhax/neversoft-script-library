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
	disable_pause
	menu_font = fontgrid_title_a1
	menu_pos = (640.0, 480.0)
	ec_eh = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
	]
	new_menu scrollid = ec_scroll vmenuid = ec_vmenu menu_pos = <menu_pos> event_handlers = <ec_eh> spacing = -45
	launchevent \{type = unfocus
		target = ec_vmenu}
	createscreenelement \{type = containerelement
		id = ec_container
		parent = root_window
		pos = (0.0, 0.0)}
	offwhite = [223 223 223 255]
	menu_z = 100
	createscreenelement \{type = spriteelement
		id = encore_gradient
		parent = ec_container
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
		z_priority = -1}
	get_song_struct song = ($current_song)
	if (<song_struct>.checksum = bosstom)
		bosstext = qs(0x81c18dd7)
		bossdims = (800.0, 0.0)
	elseif (<song_struct>.checksum = bossslash)
		bosstext = qs(0x33b8ef01)
		bossdims = (800.0, 0.0)
	endif
	if gotparam \{bosstext}
		displaytext {
			parent = ec_container
			pos = (640.0, 165.0)
			just = [center center]
			font = fontgrid_title_a1
			rgba = [130 170 200 255]
			scale = 1
			text = <bosstext>
			z = <menu_z>
		}
		fit_text_in_rectangle id = <id> dims = <bossdims> keep_ar = 1
	else
		encore_text = qs(0xd62f03b8)
		stringlength string = <encore_text>
		stringtochararray string = <encore_text>
		space_between = (50.0, 0.0)
		i = 0
		begin
		formattext checksumname = encore_id 'ec_encore_text_%d' d = (<i> + 1)
		displaytext {
			id = <encore_id>
			parent = ec_container
			pos = <pos>
			scale = 2.25
			text = (<char_array> [<i>])
			just = [center center]
			rgba = [130 170 200 255]
			font = fontgrid_title_a1
			noshadow
			z = <menu_z>
		}
		getscreenelementdims id = <id>
		if (<i> = 0)
			<pos> = ((660.0, 165.0) - (((<str_len> - 1) * <width>) * (0.5, 0.0)))
			setscreenelementprops id = <id> pos = <pos>
		endif
		<pos> = (<pos> + <space_between>)
		<i> = (<i> + 1)
		repeat <str_len>
		spawnscriptnow ec_raise_headline params = {str_len = <str_len>}
	endif
	displaysprite \{id = ec_flash
		parent = ec_container
		tex = encore_flash
		alpha = 0
		dims = (128.0, 128.0)
		just = [
			center
			center
		]}
	arm_pos = (270.0, 300.0)
	arm_add = (80.0, 0.0)
	arm_z = [1 3 5 7 8 6 4 2]
	arm_index = 0
	begin
	formattext checksumname = arm_id 'ec_arm_0%d' d = <arm_index>
	rand_arm = Random (@ 1 @ 2 @ 3 @ 4 @ 5 @ 6 @ 7 @ 8 )
	formattext checksumname = arm_tex 'Encore_Arm_0%d' d = <rand_arm>
	displaysprite id = <arm_id> parent = ec_container tex = <arm_tex> pos = <arm_pos> dims = (180.0, 340.0) z = (<menu_z> + 10 + (<arm_z> [<arm_index>]))
	if (<rand_arm> = 4 || <rand_arm> = 8)
		<arm_id> :settags higher = 1
	else
		<arm_id> :settags higher = 0
	endif
	<arm_pos> = (<arm_pos> + <arm_add>)
	<arm_index> = (<arm_index> + 1)
	repeat 8
	spawnscriptnow \{ec_raise_fists}
	spawnscriptnow \{ec_flashes}
	get_song_struct song = ($current_song)
	if NOT structurecontains structure = <song_struct> boss
		stars = ($player1_status.stars)
		cash = ($player1_status.new_cash)
		change \{structurename = player1_status
			new_cash = 0}
		if ($game_mode = p2_career)
			score = ($player1_status.score + $player2_status.score)
		else
			score = ($player1_status.score)
		endif
		if (<stars> < 3)
			<stars> = 3
		endif
		casttointeger \{score}
		formattext textname = scoretext qs(0x76b3fda7) d = <score> usecommas
		formattext textname = moneytext qs(0xcb2f9062) d = <cash> usecommas
		textscale = 0.8
		starscale = 0.125
		displaytext {
			id = ec_scoretext
			font = fontgrid_text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 10
			text = <scoretext>
			just = [right center]
			z = (<menu_z> + 20)
		}
		i = 0
		begin
		formattext checksumname = starchecksum 'star_id0%d' d = <i>
		getrandomvalue \{a = 0
			b = 360
			name = rot}
		displaysprite {
			parent = ec_container
			id = <starchecksum>
			pos = (20000.0, 20000.0)
			tex = encore_star_outline
			just = [center center]
			scale = 10
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
			scale = 10
			rgba = [110 30 20 255]
			rot_angle = <rot>
			z = (<menu_z> + 21)
			relative_scale
		}
		<i> = (<i> + 1)
		repeat <stars>
		displaytext {
			id = ec_moneytext
			font = fontgrid_text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 10
			text = <moneytext>
			just = [left center]
			z = (<menu_z> + 20)
		}
		setscreenelementprops \{id = ec_scoretext
			pos = (520.0, 220.0)
			alpha = 0}
		legacydoscreenelementmorph id = ec_scoretext scale = <textscale> time = 0.5 alpha = 1
		soundevent \{event = gh3_score_flyin}
		setscreenelementprops \{id = ec_moneytext
			pos = (760.0, 220.0)
			alpha = 0}
		legacydoscreenelementmorph id = ec_moneytext scale = <textscale> time = 0.5 alpha = 1
		soundevent \{event = gh3_cash_flyin}
		soundevent \{event = gh3_cash_flyin_hit}
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
		soundevent \{event = gh3_star_flyin}
		formattext checksumname = starchecksum 'star_id0%d' d = <i>
		setscreenelementprops id = <starchecksum> pos = <star_pos>
		legacydoscreenelementmorph id = <starchecksum> scale = <starscale> time = 0.25 relative_scale
		formattext checksumname = starchecksum 'star_id0%d_2' d = <i>
		setscreenelementprops id = <starchecksum> pos = <star_pos>
		legacydoscreenelementmorph id = <starchecksum> scale = (<starscale> - 0.025) time = 0.25 relative_scale
		<star_pos> = (<star_pos> + <star_add>)
		<i> = (<i> + 1)
		repeat <stars>
	else
		cash = ($player1_status.new_cash)
		change \{structurename = player1_status
			new_cash = 0}
		formattext textname = moneytext qs(0xcb2f9062) d = <cash> usecommas
		displaytext {
			id = ec_moneytext
			font = fontgrid_text_a6
			parent = ec_container
			rgba = [223 223 223 255]
			pos = (20000.0, 20000.0)
			scale = 200
			text = <moneytext>
			just = [center center]
			noshadow
			z = (<menu_z> + 20)
		}
		setscreenelementprops \{id = ec_moneytext
			pos = (640.0, 220.0)
			alpha = 0}
		legacydoscreenelementmorph \{id = ec_moneytext
			scale = 1
			time = 0.5
			alpha = 1}
	endif
	displaysprite parent = ec_container id = ec_crowd_1 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_2 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_3 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaysprite parent = ec_container id = ec_crowd_4 pos = (-2000.0, -2000.0) tex = encore_balloon just = [center center] scale = 2 z = (<menu_z> + 50)
	displaytext id = ec_crowd_text_1 parent = ec_crowd_1 text = qs(0x70c28c27) pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_2 parent = ec_crowd_2 text = qs(0x70c28c27) pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_3 parent = ec_crowd_3 text = qs(0x70c28c27) pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	displaytext id = ec_crowd_text_4 parent = ec_crowd_4 text = qs(0x70c28c27) pos = (60.0, 35.0) rgba = [0 0 0 255] z = (<menu_z> + 51) just = [center center] scale = 0.8 noshadow
	spawnscriptnow \{encore_crowd_shout}
	change \{g_encore_ready = 1}
	displaysprite parent = ec_container id = options_bg_1 tex = encore_menu_bg pos = (640.0, 550.0) dims = (384.0, 192.0) just = [center center] z = (<menu_z> + 50)
	set_focus_color \{rgba = [
			110
			30
			20
			255
		]}
	set_unfocus_color \{rgba = [
			135
			170
			200
			255
		]}
	if NOT gotparam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	largest_width = 0
	createscreenelement \{type = containerelement
		parent = ec_vmenu
		dims = (0.0, 100.0)
		event_handlers = [
			{
				focus
				ec_yes_highlight_focus
				params = {
					id = ec_play_encore
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = ec_play_encore
				}
			}
			{
				pad_choose
				encore_play
			}
		]}
	createscreenelement {
		type = textelement
		id = ec_play_encore
		parent = <id>
		font = fontgrid_title_a1
		text = qs(0xc29d34aa)
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		z_priority = (<menu_z> + 51)
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	getscreenelementdims id = <id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	createscreenelement \{type = containerelement
		parent = ec_vmenu
		dims = (0.0, 100.0)
		event_handlers = [
			{
				focus
				ec_no_highlight_focus
				params = {
					id = ec_leave_encore
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = ec_leave_encore
				}
			}
			{
				pad_choose
				encore_leave
			}
		]}
	createscreenelement {
		type = textelement
		id = ec_leave_encore
		parent = <id>
		font = fontgrid_title_a1
		text = qs(0x5ee28ed9)
		scale = (0.9, 1.0)
		rgba = [135 170 200 255]
		just = [center center]
		z_priority = (<menu_z> + 51)
	}
	setscreenelementprops {
		id = <id>
		exclusive_device = <exclusive_device>
	}
	getscreenelementdims id = <id>
	if (<width> > <largest_width>)
		<largest_width> = <width>
	endif
	getscreenelementdims \{id = options_bg_1}
	setscreenelementprops id = options_bg_1 dims = (<largest_width> * (1.0, 0.0) + (150.0, 0.0) + (0.0, 192.0))
	get_song_struct song = ($current_song)
	if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
		set_current_battle_first_play
	endif
	displaysprite id = ec_hi_left parent = ec_container tex = encore_menu_bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	displaysprite id = ec_hi_right parent = ec_container tex = encore_menu_bookend rgba = [110 30 20 255] z = (<menu_z> + 51)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	ec_yes_highlight_focus \{id = ec_play_encore}
	if ((($is_network_game = 1) && (ishost)) || ($is_network_game = 0))
		launchevent \{type = focus
			target = ec_vmenu}
	endif
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	setglobaltags <gig_name> params = {started = 1 encore_unlocked = 1}
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<menu_z> + 100)
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
endscript

script ec_yes_highlight_focus 
	retail_menu_focus <...>
	getscreenelementdims id = <id>
	setscreenelementprops id = ec_hi_left pos = ((630.0, 500.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
	setscreenelementprops id = ec_hi_right pos = ((650.0, 500.0) + (<width> * (0.5, 0.0))) just = [left top]
endscript

script ec_no_highlight_focus 
	retail_menu_focus <...>
	getscreenelementdims id = <id>
	setscreenelementprops id = ec_hi_left pos = ((630.0, 560.0) - (<width> * (0.5, 0.0))) flip_v just = [right top]
	setscreenelementprops id = ec_hi_right pos = ((650.0, 560.0) + (<width> * (0.5, 0.0))) just = [left top]
endscript

script encore_play 
	printf \{qs(0x045d21cc)}
	start_encore
	change \{gameplay_loading_transition = 1}
	change \{gameplay_restart_song = 1}
	generic_menu_pad_choose_sound
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script encore_leave 
	if ($g_encore_ready)
		kill_gem_scroller
		if ($is_network_game = 0)
			spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
		elseif (($is_network_game = 1) && (ishost))
			sendstructure \{callback = net_career_goto_band_lobby
				data_to_send = {
					from_encore = 1
				}}
			net_career_goto_band_lobby
			return
		endif
		ui_event \{event = menu_change
			data = {
				state = uistate_song_breakdown
				gig_complete = 1
				leave_encore = 1
			}}
	endif
endscript

script encore_crowd_shout 
	shout_text = [
		qs(0x3f8781f4)
		qs(0x09da682e)
		qs(0x603a6d9a)
		qs(0x1d96fd5f)
		qs(0x70c28c27)
		qs(0xf72a1446)
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
			setscreenelementprops id = <balloon_text> text = (<shout_text> [<rand_text>]) scale = 1
			fit_text_in_rectangle id = <balloon_text> only_if_larger_x = 1 dims = (90.0, 50.0) keep_ar = 1
		endif
		legacydoscreenelementmorph id = <balloon_id> alpha = 1 time = 0.125
		wait \{0.5
			seconds}
		legacydoscreenelementmorph id = <balloon_id> alpha = 0 time = 0.5
		wait \{0.5
			seconds}
	endif
	mod a = <i> b = 2
	if (<mod> = 0)
		wait \{1
			second}
	endif
	<i> = (<i> + 1)
	repeat 4
	repeat
endscript

script ec_raise_fists 
	begin
	i = 0
	begin
	getrandomvalue \{a = 0.1
		b = 0.3
		name = wait_time}
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
		legacydoscreenelementmorph id = <arm_id> pos = <up_pos> time = <wait_time> motion = ease_in
	endif
	<i> = (<i> + 1)
	repeat 8
	wait \{0.3
		seconds}
	<i> = 0
	begin
	getrandomvalue \{a = 0.1
		b = 0.3
		name = wait_time}
	formattext checksumname = arm_id 'ec_arm_0%d' d = <i>
	if screenelementexists id = <arm_id>
		<arm_id> :gettags
		legacydoscreenelementmorph id = <arm_id> pos = (<pos>) time = (<wait_time> * 2.0) motion = ease_out
	endif
	<i> = (<i> + 1)
	repeat 8
	wait \{0.3
		seconds}
	repeat
endscript

script ec_raise_headline 
	begin
	i = 0
	begin
	getrandomvalue \{a = 0.05
		b = 0.15
		name = wait_time}
	formattext checksumname = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if screenelementexists id = <text_id>
		getscreenelementprops id = <text_id>
		<text_id> :gettags
		<text_id> :settags pos = <pos>
		legacydoscreenelementmorph id = <text_id> pos = (<pos> - (0.0, 22.0)) time = <wait_time>
	endif
	<i> = (<i> + 1)
	repeat <str_len>
	wait \{0.15
		seconds}
	<i> = 0
	begin
	getrandomvalue \{a = 0.05
		b = 0.15
		name = wait_time}
	formattext checksumname = text_id 'ec_encore_text_%d' d = (<i> + 1)
	if screenelementexists id = <text_id>
		<text_id> :gettags
		legacydoscreenelementmorph id = <text_id> pos = <pos> time = (<wait_time> * 2.0)
	endif
	<i> = (<i> + 1)
	repeat <str_len>
	wait \{0.15
		seconds}
	repeat
endscript

script ec_flashes 
	begin
	getrandomvalue \{a = 400
		b = 900
		name = x_pos}
	getrandomvalue \{a = 400
		b = 500
		name = y_pos}
	getrandomvalue \{a = 96
		b = 256
		name = rand_dim}
	getrandomvalue \{a = 0
		b = 360
		name = rand_rot}
	pos = (<x_pos> * (1.0, 0.0) + <y_pos> * (0.0, 1.0))
	dims = (<rand_dim> * (1.0, 0.0) + <rand_dim> * (0.0, 1.0))
	if screenelementexists \{id = ec_flash}
		setscreenelementprops id = ec_flash pos = <pos> dims = <dims> rot_angle = <rand_rot> alpha = 1
		ec_flash :legacydomorph alpha = 0 dims = (<dims> * 0.5) time = 0.2
		ec_flash :legacydomorph dims = <dims>
	endif
	repeat
endscript
