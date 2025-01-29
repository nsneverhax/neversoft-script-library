gh3_button_font = buttons_x360
bunny_flame_index = 1
g_anim_flame = 1
default_event_handlers = [
	{
		pad_up
		generic_menu_up_or_down_sound
		params = {
			up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		params = {
			down
		}
	}
	{
		pad_back
		generic_event_back
	}
]
g_menu_colors = {
	menu_subhead = [
		143
		90
		34
		255
	]
	light_brown = [
		240
		225
		200
		255
	]
	brown = [
		172
		124
		112
		255
	]
	pink = [
		170
		80
		115
		255
	]
	lt_violet_grey = [
		230
		220
		240
		255
	]
	md_violet_grey = [
		190
		180
		200
		255
	]
	dk_violet_grey = [
		110
		100
		120
		255
	]
	dk_violet_red = [
		100
		31
		53
		255
	]
	lt_plum = [
		240
		200
		250
		255
	]
	brick = [
		128
		32
		32
		255
	]
	grey50 = [
		50
		50
		50
		255
	]
	grey100 = [
		100
		100
		100
		255
	]
	grey150 = [
		150
		150
		150
		255
	]
	lt_violet_bar = [
		180
		150
		175
		255
	]
	violet_focus = [
		70
		0
		80
		255
	]
	dk_violet_bar = [
		45
		40
		50
		255
	]
	brown_unfocus = [
		145
		120
		75
		255
	]
	red = [
		130
		0
		0
		250
	]
	black = [
		0
		0
		0
		255
	]
	white = [
		230
		230
		230
		255
	]
	reddish_grey = [
		180
		50
		50
		255
	]
	gold = [
		254
		204
		55
		255
	]
	grey182 = [
		182
		182
		182
		255
	]
	gold2 = [
		230
		190
		70
		255
	]
	grey150 = [
		150
		150
		150
		255
	]
	cream = [
		250
		245
		195
		255
	]
	cream2 = [
		235
		240
		200
		255
	]
	khaki = [
		60
		60
		30
		255
	]
	burnt_orange = [
		180
		100
		60
		255
	]
	dark_red = [
		115
		10
		10
		255
	]
	blueish_grey = [
		150
		170
		215
		255
	]
	light_grey = [
		240
		235
		240
		255
	]
	pink2 = [
		235
		120
		135
		255
	]
	white230 = [
		230
		230
		230
		255
	]
	flesh = [
		255
		220
		140
		255
	]
	dark_red2 = [
		90
		25
		5
		255
	]
	creamy_grey = [
		190
		185
		165
		255
	]
	chocolate = [
		60
		45
		30
		255
	]
	dark_red3 = [
		110
		30
		20
		255
	]
	blueish_grey2 = [
		135
		170
		200
		255
	]
	pinkish_red = [
		195
		50
		55
		250
	]
	dark_red4 = [
		130
		40
		40
		250
	]
	setlist_orange = [
		200
		120
		0
		250
	]
	dark_orange = [
		50
		30
		10
		255
	]
	white220 = [
		220
		220
		220
		255
	]
	fill_rgba = [
		70
		70
		70
		230
	]
	frame_rgba = [
		175
		65
		70
		255
	]
	online_fill_rgba = [
		10
		0
		30
		170
	]
	p1_orangey = [
		250
		225
		200
		255
	]
	p2_purpley = [
		240
		220
		255
		255
	]
	alert_red = [
		195
		70
		75
		255
	]
}
menu_text_color = [
	215
	160
	110
	255
]

script menu_flow_go_back \{player = 1
		create_params = {
		}
		destroy_params = {
		}}
	ui_flow_manager_respond_to_action action = go_back player = <player> create_params = <create_params> destroy_params = <destroy_params>
endscript

script new_menu {
		menu_pos = $menu_pos
		event_handlers = $default_event_handlers
		use_backdrop = 0
		z = 1
		dims = (400.0, 480.0)
		font = fontgrid_text_a6
		font_size = <font_size>
		default_colors = 1
		just = [left top]
		internal_just = [center top]
		menu_parent = root_window
		scrollid = current_scrollmenu
		vmenuid = current_menu
	}
	if screenelementexists id = <scrollid>
		printf qs(0x362d7a89) s = <scrollid>
		return
	endif
	if screenelementexists id = <vmenuid>
		printf qs(0x928ba034) s = <vmenuid>
		return
	endif
	createscreenelement {
		type = vscrollingmenu
		parent = <menu_parent>
		id = <scrollid>
		just = <just>
		dims = <dims>
		pos = <menu_pos>
		z_priority = <z>
	}
	if (<use_backdrop> = 1)
		create_generic_backdrop
	endif
	if gotparam \{name}
		createscreenelement {
			type = textelement
			parent = <scrollid>
			font = fontgrid_text_a6
			pos = (0.0, -45.0)
			font_size = 0.2
			rgba = [175 175 175 255]
			text = <name>
			just = <just>
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
	endif
	createscreenelement {
		type = vmenu
		parent = <scrollid>
		id = <vmenuid>
		pos = (0.0, 0.0)
		just = <just>
		internal_just = <internal_just>
		event_handlers = <event_handlers>
		position_children
		rot_angle = <rot_angle>
		spacing_between = <spacing>
		position_children = <position_children>
	}
	if gotparam \{no_wrap}
		setscreenelementprops id = <vmenuid> allow_wrap = false
	endif
	if gotparam \{text_left}
		setscreenelementprops id = <vmenuid> internal_just = [left top]
	endif
	if gotparam \{text_right}
		setscreenelementprops id = <vmenuid> internal_just = [right top]
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT gotparam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	if NOT (<exclusive_device> = none)
		setscreenelementprops {
			id = <scrollid>
			exclusive_device = <exclusive_device>
		}
		setscreenelementprops {
			id = <vmenuid>
			exclusive_device = <exclusive_device>
		}
	endif
	if gotparam \{tierlist}
		tier = 0
		begin
		<tier> = (<tier> + 1)
		setlist_prefix = (<tierlist>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<tier>)
		formattext checksumname = tier_checksum 'tier%s' s = (<tier>)
		<unlocked> = 1
		if ((<unlocked> = 1) || ($is_network_game))
			getarraysize (<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_size> > 0)
				begin
				format_globaltag_song_checksum part = (<tierlist>.part) song = (<tierlist>.<tier_checksum>.songs [<song_count>])
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if issongavailable song_checksum = <song_checksum> song = (<tierlist>.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title song = (<tierlist>.<tier_checksum>.songs [<song_count>])
					createscreenelement {
						type = textelement
						parent = <vmenuid>
						font = <font>
						scale = <font_size>
						rgba = [210 210 210 250]
						text = <song_title>
						just = [left top]
						event_handlers = [
							{focus menu_focus}
							{unfocus menu_unfocus}
							{pad_choose <on_choose> params = {tier = <tier> song_count = <song_count>}}
							{pad_left <on_left> params = {tier = <tier> song_count = <song_count>}}
							{pad_right <on_right> params = {tier = <tier> song_count = <song_count>}}
							{pad_l3 <on_l3> params = {tier = <tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_size>
			endif
		endif
		repeat (<tierlist>.num_tiers)
	endif
	if (<default_colors>)
		set_focus_color rgba = ($default_menu_focus_color)
		set_unfocus_color rgba = ($default_menu_unfocus_color)
	endif
endscript

script destroy_menu \{menu_id = current_scrollmenu}
	if gotparam \{menu_id}
		if screenelementexists id = <menu_id>
			destroyscreenelement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script add_new_menu_item \{parent = current_menu
		focus_script = retail_menu_focus
		unfocus_script = retail_menu_unfocus}
	if globalexists \{name = massive_build}
		if NOT ($massive_build = 0)
			if gotparam \{massive_secret_item}
				return
			endif
		endif
	endif
	if NOT screenelementexists id = <parent>
		printf qs(0xe8f14d9c) p = <parent>
	endif
	createscreenelement {
		type = textelement
		parent = <parent>
		local_id = text
		font = fontgrid_title_a1
		rgba = ($menu_unfocus_color)
		<...>
		event_handlers = [
			{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose <choose_script> params = <choose_params>}
		]
	}
	return {id = <id>}
endscript

script guitar_menu_highlighter \{zpri = 50}
	if gotparam \{text_id}
		getscreenelementdims id = <text_id>
		hilite_dims = (<width> * (1.0, 0.0) + <height> * (0.0, 0.7) + (20.0, -1.0))
		bookend_dims = (<height> * (0.5, 0.5))
		hilite_pos = ((<hlinfolist> [<hlindex>]).posh - (5.0, 0.0))
		setscreenelementprops {
			id = <wthlid>
			pos = <hilite_pos>
			dims = <hilite_dims>
			z_priority = <zpri>
		}
		setscreenelementprops {
			id = <be1id>
			pos = (<hilite_pos> - <bookend_dims>.(1.0, 0.0) * (0.6, 0.0) + <height> * (0.0, 0.1))
			dims = <bookend_dims>
			z_priority = <zpri>
		}
		setscreenelementprops {
			id = <be2id>
			pos = (<hilite_pos> + (<hilite_dims>.(1.0, 0.0) * (1.0, 0.0)) + <height> * (0.0, 0.1) - (<bookend_dims>.(1.0, 0.0) * (0.1, 0.0)))
			dims = <bookend_dims>
			z_priority = <zpri>
			flip_h
		}
	else
		setscreenelementprops {
			id = <be1id>
			pos = ((<hlinfolist> [<hlindex>]).posl)
			dims = ((<hlinfolist> [<hlindex>]).bedims)
			z_priority = <zpri>
		}
		setscreenelementprops {
			id = <be2id>
			pos = ((<hlinfolist> [<hlindex>]).posr)
			dims = ((<hlinfolist> [<hlindex>]).bedims)
			z_priority = <zpri>
		}
		setscreenelementprops {
			id = <wthlid>
			pos = ((<hlinfolist> [<hlindex>]).posh)
			dims = ((<hlinfolist> [<hlindex>]).hdims)
			z_priority = <zpri>
		}
	endif
endscript

script glow_menu_element \{time = 1}
	if NOT screenelementexists id = <id>
		return
	endif
	wait RandomInteger (0.0, 2.0) seconds
	begin
	<id> :legacydomorph alpha = 1 time = <time> motion = smooth
	<id> :legacydomorph alpha = 0 time = <time> motion = smooth
	repeat
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script issingleplayergame 
	gamemode_getproperty \{prop = singleplayer}
	return <singleplayer>
endscript

script create_pause_menu \{player = 1
		for_options = 0
		for_practice = 0}
	player_device = ($last_start_pressed_device)
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
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
	if (<for_options> = 0)
		if ($view_mode)
			return
		endif
		enable_pause
	else
		disable_pause
	endif
	if NOT (<for_options>)
		flame_handlers = [
			{pad_back handle_pause_event}
		]
	else
		flame_handlers = [
			{pad_back generic_event_back}
		]
	endif
	change \{bunny_flame_index = 1}
	pause_z = 10000
	spacing = -65
	if (<for_options> = 0)
		menu_pos = (730.0, 220.0)
		if (<for_practice> = 1)
			<menu_pos> = (640.0, 190.0)
			<spacing> = -65
		endif
	else
		<spacing> = -65
		if isguitarcontroller controller = <player_device>
			menu_pos = (640.0, 265.0)
		else
			menu_pos = (640.0, 300.0)
		endif
	endif
	if ($guitar_motion_enable_test = 1)
		menu_pos = (940.0, 220.0)
	endif
	new_menu {
		scrollid = scrolling_pause
		vmenuid = current_menu
		menu_pos = <menu_pos>
		rot_angle = 2
		event_handlers = <flame_handlers>
		spacing = <spacing>
		use_backdrop = (0)
		exclusive_device = <player_device>
		no_focus
	}
	create_pause_menu_frame z = (<pause_z> - 10)
	if ($is_network_game = 0)
		createscreenelement {
			type = spriteelement
			parent = pause_menu_frame_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<pause_z> + 100)
		}
		if gotparam \{banner_text}
			pause_player_text = <banner_text>
			if gotparam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = qs(0x662aaaf7)
				else
					if NOT issingleplayergame
						formattext textname = pause_player_text qs(0x5ebc9c29) d = <player>
					else
						<pause_player_text> = qs(0x662aaaf7)
					endif
				endif
				pause_player_scale = (0.6, 0.75)
			else
				pause_player_text = qs(0x976cf9e7)
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif
	createscreenelement {
		type = textelement
		parent = <id>
		text = <pause_player_text>
		font = fontgrid_text_a6
		pos = (125.0, 53.0)
		scale = <pause_player_scale>
		rgba = [170 90 30 255]
		scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0 && <for_practice> = 0)
		createscreenelement {
			type = containerelement
			parent = pause_menu_frame_container
			id = bunny_container
			pos = (380.0, 170.0)
			just = [left top]
			z_priority = <pause_z>
		}
		i = 1
		begin
		formattext checksumname = bunny_id 'pause_bunny_flame_%d' d = <i>
		formattext checksumname = bunny_tex 'Menu_Pause_Bunny_Flame0%d' d = <i>
		createscreenelement {
			type = spriteelement
			id = <bunny_id>
			parent = bunny_container
			pos = (160.0, 170.0)
			texture = <bunny_tex>
			rgba = [255 255 255 255]
			dims = (300.0, 300.0)
			just = [right bottom]
			z_priority = (<pause_z> + 3)
			rot_angle = 5
		}
		if (<i> > 1)
			legacydoscreenelementmorph id = <bunny_id> alpha = 0
		endif
		<i> = (<i> + 1)
		repeat 7
		createscreenelement {
			type = spriteelement
			id = pause_bunny_shadow
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [0 0 0 128]
			pos = (20.0, -110.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 4)
		}
		createscreenelement {
			type = spriteelement
			id = pause_bunny
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [255 255 255 255]
			pos = (0.0, -130.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 5)
		}
		runscriptonscreenelement \{id = bunny_container
			bunny_hover
			params = {
				hover_origin = (380.0, 170.0)
			}}
	endif
	container_params = {type = containerelement parent = current_menu dims = (0.0, 100.0)}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			text_scale = (1.0, 1.0)
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_start_again}}
					{unfocus retail_menu_unfocus params = {id = pause_start_again}}
					{pad_choose paused_special_event_start_again}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_start_again
				text = qs(0xb4b6d5d4)
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_segment}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_segment}}
					{pad_choose paused_special_event_quit_segment}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_segment
				text = qs(0x2ebc4f15)
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_challenge}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_challenge}}
					{pad_choose paused_special_event_quit_challenge}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_challenge
				text = qs(0x44d65516)
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		elseif ($current_special_event_num = 2)
			text_scale = (1.0, 1.0)
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_continue_practicing}}
					{unfocus retail_menu_unfocus params = {id = pause_continue_practicing}}
					{pad_choose handle_pause_event}
				]
			}
			continue_practicing_text = qs(0x56f59d0b)
			if ($special_event_stage = 2)
				<continue_practicing_text> = qs(0x50ad601d)
			endif
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_continue_practicing
				text = <continue_practicing_text>
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($special_event_stage = 1)
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_take_test}}
						{unfocus retail_menu_unfocus params = {id = pause_take_test}}
						{pad_choose practice_restart_song}
					]
				}
				createscreenelement {
					type = textelement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					id = pause_take_test
					text = qs(0xba34e48f)
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				getscreenelementdims id = <id>
				fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit}}
					{unfocus retail_menu_unfocus params = {id = pause_quit}}
					{pad_choose generic_event_choose params = {state = uistate_pausemenu_quit_warning}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit
				text = qs(0x67d9c56d)
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
	elseif (<for_options> = 0)
		if (<for_practice> = 1)
			if english
			else
				text_scale = (0.5, 0.5)
			endif
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose handle_pause_event}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_resume
				text = qs(0x4f636726)
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_restart}}
					{unfocus retail_menu_unfocus params = {id = pause_restart}}
					{pad_choose generic_event_choose params = {state = uistate_pausemenu_restart_warning}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0xb8790f2f)
				id = pause_restart
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_options}}
					{unfocus retail_menu_unfocus params = {id = pause_options}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu for_options = 1}}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x976cf9e7)
				id = pause_options
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_speed}}
					{unfocus retail_menu_unfocus params = {id = pause_change_speed}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xcc2da18b) option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = uistate_practice_select_speed}}}}}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0xcc2da18b)
				id = pause_change_speed
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_section}}
					{unfocus retail_menu_unfocus params = {id = pause_change_section}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x68bd3039) option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = uistate_practice_select_part}}}}}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x68bd3039)
				id = pause_change_section
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_new_song}}
						{unfocus retail_menu_unfocus params = {id = pause_new_song}}
						{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = {quit_warning_select_quit params = {callback = song_ended_menu_select_new_song}}}}}
					]
				}
				createscreenelement {
					type = textelement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs(0x3e482764)
					id = pause_new_song
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				getscreenelementdims id = <id>
				fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if NOT ($is_in_debug)
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_choose params = {state = uistate_pausemenu_quit_warning}}
					]
				}
			else
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_back params = {state = uistate_debug}}
					]
				}
			endif
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x67d9c56d)
				id = pause_quit
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		else
			if english
			else
				container_params = {type = containerelement parent = current_menu dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			createscreenelement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose handle_pause_event}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x4f636726)
				id = pause_resume
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					createscreenelement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus params = {id = pause_restart}}
							{unfocus retail_menu_unfocus params = {id = pause_restart}}
							{pad_choose generic_event_choose params = {state = uistate_pausemenu_restart_warning}}
						]
					}
					createscreenelement {
						type = textelement
						parent = <id>
						font = fontgrid_title_a1
						scale = <text_scale>
						rgba = ($menu_unfocus_color)
						text = qs(0xb8790f2f)
						id = pause_restart
						just = [center top]
						shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					getscreenelementdims id = <id>
					fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
					else
						demo_mode_disable = {}
					endif
					if NOT ($current_song = jamsession)
						if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay) || ($game_mode = p2_quickplay))
							createscreenelement {
								<container_params>
								event_handlers = [
									{focus retail_menu_focus params = {id = pause_practice}}
									{unfocus retail_menu_unfocus params = {id = pause_practice}}
									{pad_choose generic_event_choose params = {state = uistate_practice_warning}}
								]
							}
							createscreenelement {
								type = textelement
								parent = <id>
								font = fontgrid_title_a1
								scale = <text_scale>
								rgba = ($menu_unfocus_color)
								text = qs(0x3ea7dec9)
								id = pause_practice
								just = [center top]
								shadow
								shadow_offs = (3.0, 3.0)
								shadow_rgba [0 0 0 255]
								z_priority = <pause_z>
								exclusive_device = <player_device>
							}
							getscreenelementdims id = <id>
							fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
						endif
						createscreenelement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus params = {id = pause_options}}
								{unfocus retail_menu_unfocus params = {id = pause_options}}
								{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu for_options = 1}}}
							]
						}
						createscreenelement {
							type = textelement
							parent = <id>
							font = fontgrid_title_a1
							scale = <text_scale>
							rgba = ($menu_unfocus_color)
							text = qs(0x976cf9e7)
							id = pause_options
							just = [center top]
							shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <player_device>
						}
						getscreenelementdims id = <id>
						fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
				endif
			endif
			quit_script = generic_event_choose
			quit_script_params = {state = uistate_pausemenu_quit_warning}
			if ($is_network_game = 1)
				quit_script = select_quit_network_game
			endif
			if NOT ($is_in_debug)
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose <quit_script> params = <quit_script_params>}
					]
				}
			else
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_back params = {state = uistate_debug}}
					]
				}
			endif
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x67d9c56d)
				id = pause_quit
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = ((270.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($enable_button_cheats = 1)
				createscreenelement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_debug_menu}}
						{unfocus retail_menu_unfocus params = {id = pause_debug_menu}}
						{pad_choose generic_event_choose params = {state = uistate_debug data = {from_gameplay = 1}}}
					]
				}
				createscreenelement {
					type = textelement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs(0xe4963f83)
					id = pause_debug_menu
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
			endif
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		endif
	else
		<fit_dims> = (400.0, 0.0)
		createscreenelement \{type = containerelement
			parent = current_menu
			dims = (0.0, 100.0)
			event_handlers = [
				{
					focus
					retail_menu_focus
					params = {
						id = options_audio
					}
				}
				{
					focus
					generic_menu_up_or_down_sound
				}
				{
					unfocus
					retail_menu_unfocus
					params = {
						id = options_audio
					}
				}
				{
					pad_choose
					generic_event_choose
					params = {
						data = {
							state = uistate_options_audio
							popup = 1
						}
					}
				}
			]}
		createscreenelement {
			type = textelement
			parent = <id>
			font = fontgrid_title_a1
			scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs(0xfd77e801)
			id = options_audio
			just = [center center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		createscreenelement {
			type = containerelement
			parent = current_menu
			dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus params = {id = options_calibrate_lag}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus params = {id = options_calibrate_lag}}
				{pad_choose generic_event_choose params = {data = {state = uistate_options_calibrate_lag_warning controller = <player_device>}}}
			]
		}
		createscreenelement {
			type = textelement
			parent = <id>
			font = fontgrid_title_a1
			scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs(0x550b8c8e)
			id = options_calibrate_lag
			just = [center center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if isguitarcontroller controller = <player_device>
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			createscreenelement {
				type = containerelement
				parent = current_menu
				dims = (0.0, 100.0)
				event_handlers = [
					{focus retail_menu_focus params = {id = options_calibrate_guitar_sensors}}
					{focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus params = {id = options_calibrate_guitar_sensors}}
					{pad_choose generic_event_choose params = {state = uistate_options_controller_sensors data = {player = <player> controller = <player_device> popup = 1}}}
				]
			}
			createscreenelement {
				type = textelement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x717ce181)
				id = options_calibrate_guitar_sensors
				just = [center center]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			getscreenelementdims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if issingleplayergame
			lefty_flip_text = qs(0x749825c8)
		else
			if (<player> = 1)
				lefty_flip_text = qs(0x16adc675)
			else
				lefty_flip_text = qs(0xe4fa2b8d)
			endif
		endif
		createscreenelement \{type = containerelement
			parent = current_menu
			dims = (0.0, 100.0)
			event_handlers = [
				{
					focus
					retail_menu_focus
					params = {
						id = pause_options_lefty
					}
				}
				{
					focus
					generic_menu_up_or_down_sound
				}
				{
					unfocus
					retail_menu_unfocus
					params = {
						id = pause_options_lefty
					}
				}
				{
					pad_choose
					generic_event_choose
					params = {
						data = {
							state = uistate_pausemenu_lefty_flip_warning
						}
					}
				}
			]}
		<lefty_container> = <id>
		createscreenelement {
			type = textelement
			parent = <lefty_container>
			id = pause_options_lefty
			font = fontgrid_title_a1
			scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = <lefty_flip_text>
			just = [center center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		getglobaltags \{user_options}
		if (<player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_x
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = options_controller_check
			else
				lefty_tex = options_controller_x
			endif
		endif
		displaysprite {
			parent = <lefty_container>
			tex = <lefty_tex>
			just = [center center]
			z = (<pause_z> + 10)
		}
		getscreenelementdims \{id = pause_options_lefty}
		<id> :se_setprops pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT issingleplayergame
			if (<for_practice> = 0)
				formattext textname = player_paused_text qs(0x392c86d2) d = <player>
				displaysprite {
					parent = pause_menu_frame_container
					id = pause_helper_text_bg
					tex = helper_pill_body
					pos = (640.0, 600.0)
					just = [center center]
					rgba = [96 0 0 255]
					z = (<pause_z> + 10)
				}
				displaytext {
					parent = pause_menu_frame_container
					pos = (640.0, 604.0)
					just = [center center]
					text = <player_paused_text>
					rgba = [186 105 0 255]
					scale = (0.45000002, 0.6)
					z = (<pause_z> + 11)
					font = fontgrid_text_a6
				}
				getscreenelementdims id = <id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :se_setprops dims = <bg_dims>
				displaysprite {
					parent = pause_menu_frame_container
					tex = helper_pill_end
					pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [right center]
					flip_v
					z = (<pause_z> + 10)
				}
				displaysprite {
					parent = pause_menu_frame_container
					tex = helper_pill_end
					pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [left center]
					z = (<pause_z> + 10)
				}
			endif
		endif
	endif
	if (<for_options> = 0 && <for_practice> = 0)
		spawnscriptnow \{animate_bunny_flame}
	endif
endscript

script options_change_vocals_highway_view 
	requireparams \{[
			player
		]
		all}
	resetscoreupdateready
	vocals_get_highway_view player = <player>
	<vocals_highway_view> = <highway_view>
	if (<vocals_highway_view> = static)
		<vocals_highway_view> = scrolling
	else
		<vocals_highway_view> = static
	endif
	vocals_set_highway_view player = <player> view = <vocals_highway_view> controller = <device_num>
	if isps3
		i = 1
		begin
		vocals_set_highway_view player = <i> view = <vocals_highway_view> controller = <device_num>
		i = (<i> + 1)
		repeat 4
	endif
	if isobjectscript
		obj_getid
		if resolvescreenelementid id = {<objid> child = {0 child = check}}
			if (<vocals_highway_view> = static)
				soundevent \{event = checkbox_sfx}
				<resolved_id> :setprops texture = data_settings_xmark
			else
				soundevent \{event = checkbox_check_sfx}
				<resolved_id> :setprops texture = data_settings_checkmark
			endif
		endif
	endif
	if NOT gotparam \{no_restart}
		gh3_sfx_fail_song_stop_sounds
		if ($game_mode = training)
			spawnscriptnow \{practice_restart_song}
		else
			spawnscriptnow \{career_restart_song}
		endif
		generic_event_back \{state = uistate_gameplay}
	endif
endscript

script options_change_vocals_sp_clap \{x_tex = data_settings_xmark
		check_tex = data_settings_checkmark}
	requireparams \{[
			player
		]
		all}
	getplayerinfo player = <player> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		<vocals_sp_clap> = 0
	else
		<vocals_sp_clap> = 1
	endif
	vocals_set_star_power_clap player = <player> clap = <vocals_sp_clap> controller = <device_num>
	if isps3
		i = 1
		begin
		vocals_set_star_power_clap player = <i> clap = <vocals_sp_clap> controller = <device_num>
		i = (<i> + 1)
		repeat 4
	endif
	if isobjectscript
		obj_getid
		if gotparam \{checkbox_child}
			child = <checkbox_child>
		else
			child = {0 child = check}
		endif
		if resolvescreenelementid id = {<objid> child = <child>}
			if (<vocals_sp_clap> = 0)
				soundevent \{event = checkbox_sfx}
				<resolved_id> :setprops texture = <x_tex>
			else
				soundevent \{event = checkbox_check_sfx}
				<resolved_id> :setprops texture = <check_tex>
			endif
		endif
	endif
endscript

script options_change_tilt_star_power 
	getplayerinfo <player> use_tilt_for_starpower
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	if (<use_tilt_for_starpower> = 1)
		setplayerinfo <player> use_tilt_for_starpower = 0
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = options_controller_x
	else
		setplayerinfo <player> use_tilt_for_starpower = 1
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = options_controller_check
	endif
	if isobjectscript
		obj_getid
		if resolvescreenelementid id = {<objid> child = tilt_check}
			<resolved_id> :setprops texture = <new_texture>
		endif
	endif
endscript

script options_change_touch_strip_option 
	getplayerinfo <player> enable_touch_strip
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	if (<enable_touch_strip> = 1)
		setplayerinfo <player> enable_touch_strip = 0
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = options_controller_x
	else
		setplayerinfo <player> enable_touch_strip = 1
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = options_controller_check
	endif
	if isobjectscript
		obj_getid
		if resolvescreenelementid id = {<objid> child = touch_check}
			<resolved_id> :setprops texture = <new_texture>
		endif
	endif
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	wait \{0.1
		second}
	repeat
endscript

script bunny_hover 
	if NOT screenelementexists \{id = bunny_container}
		return
	endif
	i = 1
	begin
	formattext checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	if NOT screenelementexists id = <bunnyid>
		return
	else
		setscreenelementprops id = <bunnyid> pos = <flame_origin>
	endif
	<i> = (<i> + 1)
	repeat 7
	begin
	bunny_container :legacydomorph \{pos = (360.0, 130.0)
		time = 1
		rot_angle = -25
		scale = 1.05
		motion = ease_out}
	bunny_container :legacydomorph \{pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		scale = 0.95
		motion = ease_in}
	bunny_container :legacydomorph \{pos = (360.0, 130.0)
		time = 1
		rot_angle = -15
		scale = 1.05
		motion = ease_out}
	bunny_container :legacydomorph \{pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		scale = 0.95
		motion = ease_in}
	repeat
endscript

script destroy_pause_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	killspawnedscript \{name = animate_bunny_flame}
	if screenelementexists \{id = warning_message_container}
		destroyscreenelement \{id = warning_message_container}
	endif
	if screenelementexists \{id = leaving_lobby_dialog_menu}
		destroyscreenelement \{id = leaving_lobby_dialog_menu}
	endif
	destroy_pause_menu_frame \{container_id = net_quit_warning}
endscript

script swap_bunny_flame 
	if gotparam \{up}
		generic_menu_up_or_down_sound \{up}
		change \{g_anim_flame = -1}
	elseif gotparam \{down}
		generic_menu_up_or_down_sound \{down}
		change \{g_anim_flame = 1}
	endif
	change bunny_flame_index = ($bunny_flame_index + $g_anim_flame)
	if ($bunny_flame_index > 7)
		change \{bunny_flame_index = 1}
	endif
	if ($bunny_flame_index < 1)
		change \{bunny_flame_index = 7}
	endif
	reset_bunny_alpha
	formattext \{checksumname = bunnyid
		'pause_bunny_flame_%d'
		d = $bunny_flame_index}
	if screenelementexists id = <bunnyid>
		legacydoscreenelementmorph id = <bunnyid> alpha = 1
	endif
endscript

script reset_bunny_alpha 
	i = 1
	begin
	formattext checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	if screenelementexists id = <bunnyid>
		legacydoscreenelementmorph id = <bunnyid> alpha = 0
	endif
	<i> = (<i> + 1)
	repeat 7
endscript

script create_menu_backdrop \{texture = menu_venue_bg
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 0}
	if screenelementexists \{id = menu_backdrop_container}
		destroyscreenelement \{id = menu_backdrop_container}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = menu_backdrop_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = spriteelement
		parent = menu_backdrop_container
		id = menu_backdrop
		texture = <texture>
		rgba = <rgba>
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = <z_priority>
	}
endscript

script destroy_menu_backdrop 
	if screenelementexists \{id = menu_backdrop_container}
		destroyscreenelement \{id = menu_backdrop_container}
	endif
endscript

script create_pause_menu_frame \{x_scale = 1
		y_scale = 1
		tile_sprite = 1
		container_id = pause_menu_frame_container
		z = 0
		gradient = 1
		parent = root_window}
	if ($guitar_motion_enable_test = 1)
		<alpha> = 0
	else
		<alpha> = 1
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <container_id>
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z>
		alpha = <alpha>
	}
	<center_pos> = (640.0, 360.0)
	pos_scale_2 = ((0.0, -5.0) * <y_scale>)
	scale_1 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_2 = ((1.4, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	scale_3 = ((1.4, 0.0) * <x_scale> + (0.0, 1.3499999) * <y_scale>)
	scale_4 = ((1.575, 0.0) * <x_scale> + (0.0, 1.5) * <y_scale>)
	scale_5 = ((1.5, 0.0) * <x_scale> + (0.0, 1.4) * <y_scale>)
	if (<gradient> = 1)
		createscreenelement {
			type = spriteelement
			id = pause_gradient
			parent = <container_id>
			texture = gradient_128
			rgba = [0 0 0 180]
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			just = [left top]
			z_priority = (<z> + 1)
		}
	endif
	if (<tile_sprite> = 1)
		createscreenelement {
			type = windowelement
			parent = <container_id>
			id = pause_menu_scrolling_bg_01
			pos = (642.0, 360.0)
			dims = ((508.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			just = [center center]
			z_priority = (<z> - 1)
		}
		tilesprite \{parent = pause_menu_scrolling_bg_01
			tile_dims = (980.0, 910.0)
			pos = (0.0, 0.0)
			texture = menu_pause_bg_tile}
		runscriptonscreenelement tilespriteloop id = <id> params = {move_x = -2 move_y = -2}
	else
		createscreenelement {
			type = spriteelement
			id = frame_background
			parent = <container_id>
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			just = [center center]
			dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			z_priority = (<z> - 1)
		}
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
default_menu_focus_color = [
	173
	88
	5
	255
]
default_menu_unfocus_color = [
	100
	88
	71
	255
]
menu_focus_color = [
	173
	88
	5
	255
]
menu_unfocus_color = [
	100
	88
	71
	255
]

script set_focus_color \{rgba = $default_menu_focus_color}
	change menu_focus_color = <rgba>
endscript

script set_unfocus_color \{rgba = $default_menu_unfocus_color}
	change menu_unfocus_color = <rgba>
endscript

script retail_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
			endif
			setscreenelementprops id = <id> font = fontgrid_text_a6_fire material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
		endif
		setprops \{font = fontgrid_text_a6_fire
			material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire}
	endif
endscript

script retail_menu_unfocus 
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
				<id> :getsingletag old_font
			endif
			setscreenelementprops id = <id> rgba = ($menu_unfocus_color) font = <old_font> material = null
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
			getsingletag \{old_font}
		endif
		setprops rgba = ($menu_unfocus_color) font = <old_font> material = null
	endif
endscript

script fit_text_convert_legacy_params_props 
	getscreenelementprops id = <id>
	return {scale = <scale>}
endscript

script fit_text_convert_legacy_params 
	if (<keep_ar> = 1)
		<preserve_aspect_ratio> = true
	else
		<preserve_aspect_ratio> = false
	endif
	if (<only_if_larger_x> = 1)
		removeparameter \{only_if_larger_x}
		<only_if_larger_x> = true
	else
		removeparameter \{only_if_larger_x}
		<only_if_larger_x> = false
	endif
	if gotparam \{start_x_scale}
		<factor_start_scale> = true
	elseif gotparam \{start_y_scale}
		<factor_start_scale> = true
	else
		fit_text_convert_legacy_params_props <...>
		<x_dim> = (<dims>.(1.0, 0.0))
		<y_dim> = (<dims>.(0.0, 1.0))
		<x_scale> = (<scale>.(1.0, 0.0))
		<y_scale> = (<scale>.(0.0, 1.0))
		<dims> = ((1.0, 0.0) * <x_dim> / <x_scale> + (0.0, 1.0) * <y_dim> / <y_scale>)
		<factor_start_scale> = false
	endif
	return {
		dims = <dims>
		factor_start_scale = <factor_start_scale>
		preserve_aspect_ratio = <preserve_aspect_ratio>
		only_if_larger_x = <only_if_larger_x>
	}
endscript

script fit_text_in_rectangle \{dims = (100.0, 100.0)
		keep_ar = 0
		only_if_larger_x = 0}
	if NOT gotparam \{id}
		scriptassert \{qs(0xd9eec8c8)}
	endif
	fit_text_convert_legacy_params <...>
	<id> :se_fittodims {
		dims = <dims>
		factor_start_scale = <factor_start_scale>
		preserve_aspect_ratio = <preserve_aspect_ratio>
		only_if_larger_x = <only_if_larger_x>
		only_if_larger_y = false
	}
	if gotparam \{pos}
		setscreenelementprops id = <id> pos = <pos>
	endif
endscript
num_user_control_helpers = 0
user_control_text_font = fontgrid_title_a1
user_control_pill_color = [
	20
	20
	20
	155
]
user_control_pill_text_color = [
	180
	180
	180
	255
]
user_control_auto_center = 1
user_control_super_pill = 0
user_control_pill_y_position = 650
user_control_pill_scale = 0.4
user_control_pill_end_width = 50
user_control_pill_gap = 150
user_control_super_pill_gap = 0.4
pill_helper_max_width = 100

script set_user_control_color \{text_rgba = [
			64
			64
			64
			255
		]
		bg_rgba = [
			180
			180
			180
			255
		]}
	change user_control_pill_color = <bg_rgba>
	change user_control_pill_text_color = <text_rgba>
endscript

script clean_up_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		destroyscreenelement \{id = user_control_container}
	endif
	if screenelementexists \{id = custom_setlist_continue_helper}
		destroyscreenelement \{id = custom_setlist_continue_helper}
	endif
	change \{user_control_pill_gap = 150}
	change \{pill_helper_max_width = 100}
	change \{num_user_control_helpers = 0}
	change \{user_control_pill_color = [
			20
			20
			20
			155
		]}
	change \{user_control_pill_text_color = [
			180
			180
			180
			255
		]}
	change \{user_control_auto_center = 1}
	change \{user_control_super_pill = 0}
	change \{user_control_pill_y_position = 650}
	change \{user_control_pill_scale = 0.4}
	set_user_control_color
endscript

script user_control_helper_get_buttonchar 
	if gotparam \{controller}
		if (<controller> < 0)
			removeparameter \{controller}
		endif
	endif
	if NOT gotparam \{controller}
		controller = $primary_controller
		if NOT (<controller> = $last_start_pressed_device)
			controller = $last_start_pressed_device
		endif
	endif
	if NOT (<controller> < 0)
		if NOT ((isguitarcontroller controller = <controller>) || (isdrumcontroller controller = <controller>))
			getactivecontrollers
			getarraysize <active_controllers>
			if (<controller> < <array_size>)
				if (<active_controllers> [<controller>] = 1)
					standard = 1
				endif
			endif
		elseif isdrumcontroller controller = <controller>
			drum = 1
		endif
	endif
	if isxenon
		if gotparam \{all_buttons}
			removeparameter \{all_buttons}
			removeparameter \{drum}
			removeparameter \{standard}
		endif
	endif
	getenterbuttonassignment
	if gotparam \{button}
		switch (<button>)
			case green
			buttonchar = qs(0xac29f74c)
			if gotparam \{standard}
				buttonchar = qs(0xd15e0309)
			endif
			if isps3
				if gotparam \{drum}
					buttonchar = qs(0xd15e0309)
				endif
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xa11b5a77)
				if (<assignment> = circle)
					buttonchar = qs(0x74aa6ba8)
				endif
			endif
			case red
			buttonchar = qs(0xb532c60d)
			if gotparam \{standard}
				buttonchar = qs(0xfa7350ca)
			endif
			if isps3
				if gotparam \{drum}
					buttonchar = qs(0xfa7350ca)
				endif
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x74aa6ba8)
				if (<assignment> = circle)
					buttonchar = qs(0xa11b5a77)
				endif
			endif
			case yellow
			buttonchar = qs(0xa210409c)
			if gotparam \{standard}
				buttonchar = qs(0xf44ae71a)
			endif
			if isps3
				if gotparam \{drum}
					buttonchar = qs(0xf44ae71a)
				endif
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x1da23f16)
			endif
			case blue
			buttonchar = qs(0xbb0b71dd)
			if gotparam \{standard}
				buttonchar = qs(0xed51d65b)
			endif
			if isps3
				if gotparam \{drum}
					buttonchar = qs(0xed51d65b)
				endif
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xc8130ec9)
			endif
			case orange
			buttonchar = qs(0x3c936d12)
			if gotparam \{standard}
				buttonchar = qs(0x9f330107)
			elseif gotparam \{drum}
				buttonchar = qs(0x1d28995e)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x667a6f93)
			endif
			case strumbar
			buttonchar = qs(0x72fe6f1c)
			case back
			buttonchar = qs(0x25885c53)
			if gotparam \{standard}
				buttonchar = qs(0xc969a681)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xc969a681)
			endif
			case start
			buttonchar = qs(0x57ea8b0f)
			if gotparam \{standard}
				buttonchar = qs(0x0433a81f)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x0433a81f)
			endif
			case lb
			buttonchar = qs(0x9f330107)
			case rb
			buttonchar = qs(0xb41e52c4)
			case lt
			buttonchar = qs(0xad056385)
			case rt
			buttonchar = qs(0xe244f542)
			case lbrb
			buttonchar = qs(0x41c5c5a3)
			case pad_left
			buttonchar = qs(0x33864e0b)
			case drum_green
			buttonchar = qs(0x3605ca9d)
		endswitch
	else
		buttonchar = qs(0x03ac90f0)
	endif
	if iswinport
		if gotparam \{standard}
			buttonchar = qs(0x0433a81f)
			0x8d7c4fcd = true
		else
			0x8d7c4fcd = false
		endif
	endif
	return {buttonchar = <buttonchar> 0x8d7c4fcd = <0x8d7c4fcd>}
endscript

script should_use_all_buttons 
	get_all_exclusive_devices
	if NOT gotparam \{exclusive_device}
		return \{false}
	endif
	<standard_buttons> = false
	<guitar_buttons> = false
	<i> = 0
	begin
	if isguitarcontroller controller = (<exclusive_device> [<i>])
		<guitar_buttons> = true
	else
		<standard_buttons> = true
	endif
	<i> = (<i> + 1)
	repeat $num_exclusive_mp_controllers
	if (<guitar_buttons> = true && <standard_buttons> = true)
		return \{true}
	endif
	return \{false}
endscript

script pulsate_helper_pill \{time = 1}
	requireparams \{[
			id
		]
		all}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait \{1
		seconds
		ignoreslomo}
	begin
	if screenelementexists id = <id>
		<id> :se_setprops {
			alpha = 0.5
			time = <time>
		}
		wait <time> seconds ignoreslomo
		if screenelementexists id = <id>
			<id> :se_setprops {
				alpha = 1
				time = <time>
			}
			wait <time> seconds ignoreslomo
		else
			return
		endif
	else
		return
	endif
	repeat
endscript

script add_gamertag_helper 
	if NOT gotparam \{exclusive_device}
		return
	endif
	if NOT isarray <exclusive_device>
		if NOT ischecksum <exclusive_device>
			if NOT ((<exclusive_device> < 0) || (<exclusive_device> > 3))
				formattext textname = caption qs(0xedc03e4e) d = (<exclusive_device> + 1)
				if isxenon
					if getlocalgamertag controller = <exclusive_device>
						if NOT (<gamertag> = qs(0x03ac90f0))
							caption = <gamertag>
						endif
					endif
				endif
				if isguitarcontroller controller = <exclusive_device>
					icon_texture = mixer_icon_guitar
					get_player_num_from_controller controller_index = <exclusive_device>
					if NOT (<player_num> = -1)
						getplayerinfo <player_num> part
						if (<part> = bass)
							icon_texture = mixer_icon_bass
						endif
					endif
				elseif isdrumcontroller controller = <exclusive_device>
					icon_texture = mixer_icon_drums
				elseif 0x1c708d82 controller = <exclusive_device>
					icon_texture = 0xe974c02c
				else
					icon_texture = mixer_icon_vox
				endif
				clean_up_user_control_helpers
				add_user_control_helper gamertag = <caption> icon_texture = <icon_texture> z = 100000
			endif
		endif
	endif
endscript

script add_user_control_helper \{z = 10}
	if NOT screenelementexists \{id = user_control_container}
		createscreenelement {
			id = user_control_container
			parent = root_window
			type = menuelement
			dims = (1024.0, 36.0)
			pos = (640.0, 684.0)
			just = [center bottom]
			internal_just = [center center]
			isvertical = false
			position_children = true
			fit_major = `fit content if larger`
			fit_minor = `keep dims`
			spacing_between = 10
			z_priority = <z>
		}
	endif
	if gotparam \{gamertag}
		createscreenelement {
			parent = user_control_container
			type = descinterface
			desc = 'helper_gamertag_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_texture = <icon_texture>
			helper_description_text = <gamertag>
			helper_pill_rgba = [120 180 150 255]
			helper_description_rgba = [64 64 64 255]
		}
		helper_pill_id = <id>
	else
		if ((0x1c708d82 controller = $primary_controller) || (gotparam 0xa6a6d2b9))
			buttonchar = qs(0x0433a81f)
		else
			user_control_helper_get_buttonchar <...> button = <button>
		endif
		createscreenelement {
			parent = user_control_container
			type = descinterface
			desc = 'helper_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_text = <buttonchar>
			helper_description_text = <text>
			helper_pill_rgba = $user_control_pill_color
			helper_description_rgba = $user_control_pill_text_color
		}
		helper_pill_id = <id>
		if gotparam \{all_buttons}
			if <helper_pill_id> :desc_resolvealias name = alias_helper_button
				<resolved_id> :se_setprops {
					metaremapenable = false
					text = <buttonchar>
				}
			endif
		endif
		if (iswinport)
			if <helper_pill_id> :desc_resolvealias name = alias_helper_button
				getscreenelementdims id = <resolved_id>
				0xadc4815e = (<width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				0x5d165c12 = qs(0x00000000)
				0xb609f307 = fontgrid_text_a8
				0x5765a514 = 0
				0xc89b71a9 = 0
				0x3a15b5b9 = (0.0, 0.0)
				if ((0x1c708d82 controller = $primary_controller) || (gotparam 0xa6a6d2b9))
					switch (<button>)
						case green
						0xeb08ac72 \{actionnum = 0}
						case red
						0x5d165c12 = qs(0x26f2f295)
						0xb609f307 = fontgrid_text_a11
						0x5765a514 = 0
						0xc89b71a9 = 0.4
						0x3a15b5b9 = (-1.0, 0.4)
						case 0x2b3590c1
						0xeb08ac72 \{actionnum = 1}
						case yellow
						if gotparam \{0xba6511ff}
							0x5d165c12 = qs(0x00ed1e1a)
							0xb609f307 = fontgrid_text_a11
							0x5765a514 = 2
							0xc89b71a9 = 0.4
							0x3a15b5b9 = (-1.0, 0.4)
						else
							0xeb08ac72 \{actionnum = 2}
						endif
						case blue
						if gotparam \{0xba6511ff}
							0x5d165c12 = qs(0x19f62f5b)
							0xb609f307 = fontgrid_text_a11
							0x5765a514 = 2
							0xc89b71a9 = 0.4
							0x3a15b5b9 = (0.1, 0.4)
						else
							0xeb08ac72 \{actionnum = 3}
						endif
						case orange
						case lb
						0xeb08ac72 \{actionnum = 4}
						case start
						0xeb08ac72 \{actionnum = 7}
						case back
						0xeb08ac72 \{actionnum = 8}
						case strumbar
						createscreenelement {
							type = spriteelement
							parent = <resolved_id>
							texture = 0x34b3dfa0
							dims = (20.0, 20.0)
							pos = (19.0, 19.0)
							just = [left , top]
							z_priority = 55
						}
					endswitch
				elseif (<0x8d7c4fcd> = true)
					switch (<button>)
						case green
						0xeb08ac72 \{actionnum = 0}
						case red
						0x5d165c12 = qs(0x26f2f295)
						0xb609f307 = fontgrid_text_a11
						0x5765a514 = 0
						0xc89b71a9 = 0.4
						0x3a15b5b9 = (-1.0, 0.4)
						case 0x2b3590c1
						0xeb08ac72 \{actionnum = 1}
						case yellow
						if gotparam \{0xba6511ff}
							0x5d165c12 = qs(0x00ed1e1a)
							0xb609f307 = fontgrid_text_a11
							0x5765a514 = 2
							0xc89b71a9 = 0.4
							0x3a15b5b9 = (-1.0, 0.4)
						else
							0xeb08ac72 \{actionnum = 2}
						endif
						case blue
						if gotparam \{0xba6511ff}
							0x5d165c12 = qs(0x19f62f5b)
							0xb609f307 = fontgrid_text_a11
							0x5765a514 = 2
							0xc89b71a9 = 0.4
							0x3a15b5b9 = (0.1, 0.4)
						else
							0xeb08ac72 \{actionnum = 3}
						endif
						case orange
						case lb
						0xeb08ac72 \{actionnum = 4}
						case start
						0xeb08ac72 \{actionnum = 7}
						case back
						0xeb08ac72 \{actionnum = 8}
					endswitch
				endif
				printf qs(0xb9c99c80) b = <button>
				createscreenelement {
					parent = <resolved_id>
					type = textblockelement
					text = <0x5d165c12>
					font = <0xb609f307>
					font_spacing = <0x5765a514>
					internal_scale = <0xc89b71a9>
					pos = ((19.0, 13.5) + <0x3a15b5b9>)
					dims = <0xadc4815e>
					single_line = true
					rgba = [20 20 20 180]
					just = [left , top]
					pos_anchor = [left , center]
					z_priority = 50
				}
			endif
		endif
	endif
	<helper_pill_id> :se_getprops
	<helper_pill_id> :se_setprops {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
	return helper_pill_id = <helper_pill_id>
endscript

script user_control_cleanup_pills 
	destroy_menu \{menu_id = user_control_super_pill_object_main}
	destroy_menu \{menu_id = user_control_super_pill_object_l}
	destroy_menu \{menu_id = user_control_super_pill_object_r}
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = pill_id 'uc_pill_%d' d = <index>
		if screenelementexists id = <pill_id>
			destroyscreenelement id = <pill_id>
		endif
		formattext checksumname = pill_l_id 'uc_pill_l_%d' d = <index>
		if screenelementexists id = <pill_l_id>
			destroyscreenelement id = <pill_l_id>
		endif
		formattext checksumname = pill_r_id 'uc_pill_r_%d' d = <index>
		if screenelementexists id = <pill_r_id>
			destroyscreenelement id = <pill_r_id>
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript
action_safe_width_for_helpers = 925

script user_control_build_pills 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	index = 0
	max_pill_width = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		if (<pill_width> > <max_pill_width>)
			<max_pill_width> = (<pill_width>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	<total_width> = (((<max_pill_width> + (<scale> * $user_control_pill_end_width * 2)) * ($num_user_control_helpers)) + (($user_control_pill_gap * <scale>) * ($num_user_control_helpers - 1)))
	if (<total_width> > $action_safe_width_for_helpers)
		<max_pill_width> = ((($action_safe_width_for_helpers - (($user_control_pill_gap * <scale>) * ($num_user_control_helpers - 1))) / ($num_user_control_helpers)) - (<scale> * $user_control_pill_end_width * 2))
	endif
	index = 0
	initial_pill_x = (640 + -1 * (($num_user_control_helpers / 2.0) * <max_pill_width>) - ((0.5 * $user_control_pill_gap * <scale>) * ($num_user_control_helpers -1)))
	pos = ((1.0, 0.0) * <initial_pill_x> + (0.0, 1.0) * ($user_control_pill_y_position) + (0.0, 0.8) * (<scale>))
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = pill_id 'uc_pill_%d' d = <index>
		formattext checksumname = pill_l_id 'uc_pill_l_%d' d = <index>
		formattext checksumname = pill_r_id 'uc_pill_r_%d' d = <index>
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = (<max_pill_width>)
		pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
		pill_y_offset = (<pill_height> * 0.2)
		pill_height = (<pill_height> + <pill_y_offset>)
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_id>
			texture = helper_pill_body
			dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_l_id>
			texture = helper_pill_end
			dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [right top]
			z_priority = <z>
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = user_control_container
			id = <pill_r_id>
			texture = helper_pill_end
			dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <max_pill_width>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		<index> = (<index> + 1)
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> + <max_pill_width>))
		repeat ($num_user_control_helpers)
	endif
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		align_user_control_with_pill pill_index = <index>
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript

script align_user_control_with_pill 
	formattext checksumname = pill_id 'uc_pill_%d' d = <pill_index>
	fastscreenelementpos id = <pill_id> absolute
	getscreenelementdims id = <pill_id>
	pill_midpoint_x = (<screenelementpos>.(1.0, 0.0) + 0.5 * <width>)
	align_user_control_with_x x = <pill_midpoint_x> pill_index = <pill_index>
endscript

script align_user_control_with_x 
	formattext checksumname = textid 'uc_text_%d' d = <pill_index>
	formattext checksumname = buttonid 'uc_button_%d' d = <pill_index>
	fastscreenelementpos id = <buttonid> absolute
	top_left = <screenelementpos>
	button_pos = <screenelementpos>
	fastscreenelementpos id = <textid> absolute
	bottom_right = <screenelementpos>
	text_pos = <screenelementpos>
	getscreenelementdims id = <textid>
	bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
	pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
	text_button_midpoint = (<top_left>.(1.0, 0.0) + 0.5 * <pill_width>)
	midpoint_diff = (<text_button_midpoint> - <x>)
	new_button_pos = (<button_pos> - (1.0, 0.0) * <midpoint_diff>)
	new_text_pos = (<text_pos> - (1.0, 0.0) * <midpoint_diff>)
	setscreenelementprops id = <textid> pos = <new_text_pos>
	setscreenelementprops id = <buttonid> pos = <new_button_pos>
endscript

script user_control_build_super_pill 
	user_control_cleanup_pills
	scale = ($user_control_pill_scale)
	index = 0
	pos = ((0.0, 1.0) * $user_control_pill_y_position)
	leftmost = 9999.0
	rightmost = -9999.0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		getscreenelementdims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		button_text_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		left_x = ((1.0, 0.0).<pos>)
		right_x = ((1.0, 0.0).<pos> + <button_text_width>)
		if (<left_x> < <leftmost>)
			<leftmost> = (<left_x>)
		endif
		if (<right_x> > <rightmost>)
			<rightmost> = (<right_x>)
		endif
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		<buttonid> :settags calc_width = <pill_width>
		<buttonid> :settags calc_pos = <pos>
		pos = (<pos> + (1.0, 0.0) * ($user_control_pill_gap * <scale> * $user_control_super_pill_gap + <pill_width>))
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	whole_pill_width = (<rightmost> - <leftmost>)
	holy_midpoint_batman = (<leftmost> + 0.5 * <whole_pill_width>)
	midpoint_diff = (<holy_midpoint_batman> - 640)
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formattext checksumname = textid 'uc_text_%d' d = <index>
		formattext checksumname = buttonid 'uc_button_%d' d = <index>
		<buttonid> :gettags
		<calc_pos> = (<calc_pos> - (1.0, 0.0) * <midpoint_diff>)
		setscreenelementprops id = <buttonid> pos = (<calc_pos>)
		istextstrumbar id = <textid>
		if (<is_strumbar> = 0)
			setscreenelementprops id = <textid> pos = (<calc_pos> + (50.0, 7.0) * <scale>)
		else
			setscreenelementprops id = <textid> pos = (<calc_pos> + (100.0, 7.0) * <scale>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
	pill_y_offset = (<pill_height> * 0.2)
	pill_height = (<pill_height> + <pill_y_offset>)
	pos = ((1.0, 0.0) * (<leftmost> - <midpoint_diff>) + (0.0, 1.0) * $user_control_pill_y_position)
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_main
		texture = helper_pill_body
		dims = ((1.0, 0.0) * <whole_pill_width> + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_l
		texture = helper_pill_end
		dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [right top]
		z_priority = <z>
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = user_control_container
		id = user_control_super_pill_object_r
		texture = helper_pill_end
		dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <whole_pill_width>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
endscript

script fastscreenelementpos 
	getscreenelementprops id = <id>
	return screenelementpos = <pos>
endscript

script istextstrumbar 
	<id> :gettags
	if gotparam \{is_strumbar}
		return \{is_strumbar = 1}
	else
		return \{is_strumbar = 0}
	endif
endscript

script get_diff_completion_text 
	diff_completion_percentage = [0 0 0 0 0]
	diff_completion_score = [0 0 0 0 0]
	diff_completion_text = [qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0) qs(0x03ac90f0)]
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	percentage_complete = 0
	difficulty_index = 0
	getarraysize ($difficulty_list)
	diff_size = <array_size>
	begin
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	songs_score = 0
	num_songs = 0
	tier_num = 1
	begin
	formattext checksumname = tier 'tier%d' d = <tier_num>
	getarraysize ($<tier_global>.<tier>.songs)
	songlist_size = <array_size>
	song_count = 0
	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier>.songs [<song_count>]) difficulty_index = <difficulty_index>
	getglobaltags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<songs_completed> = (<songs_completed> + 1)
		<songs_score> = (<songs_score> + <score>)
	endif
	<num_songs> = (<num_songs> + 1)
	<song_count> = (<song_count> + 1)
	repeat <songlist_size>
	tier_num = (<tier_num> + 1)
	repeat ($<tier_global>.num_tiers)
	formattext textname = diff_completion_string qs(0x18a8b83c) a = <songs_completed> b = <num_songs>
	setarrayelement arrayname = diff_completion_text index = (<difficulty_index>) newvalue = (<diff_completion_string>)
	<percentage_complete> = (<percentage_complete> + (100 * <songs_completed>) / <num_songs>)
	setarrayelement arrayname = diff_completion_percentage index = (<difficulty_index>) newvalue = ((100 * <songs_completed>) / <num_songs>)
	setarrayelement arrayname = diff_completion_score index = (<difficulty_index>) newvalue = <songs_score>
	<difficulty_index> = (<difficulty_index> + 1)
	repeat <diff_size>
	if gotparam \{for_get_diff_completion_percentage}
		return diff_completion_percentage = <diff_completion_percentage> percentage_complete = <percentage_complete> diff_completion_score = <diff_completion_score>
	else
		return diff_completion_text = <diff_completion_text>
	endif
endscript

script get_diff_completion_percentage 
	get_diff_completion_text <...> for_get_diff_completion_percentage
	return diff_completion_percentage = <diff_completion_percentage> total_percentage_complete = (<percentage_complete> / 4) diff_completion_score = <diff_completion_score>
endscript

script special_event_get_time_wasted 
	getsongtimems
	songtime = <time>
	get_song_section_array
	getarraysize ($<song_section_array>)
	if (<songtime> < ($<song_section_array> [0].time))
		return \{time_wasted = 0}
	endif
	total_time_taken = 0
	entry = ($practice_start_index)
	begin
	if ((<entry> + 1) < <array_size>)
		next_time = ($<song_section_array> [(<entry> + 1)].time)
	else
		get_song_end_time \{song = $current_song}
		next_time = <total_end_time>
	endif
	last_time = ($<song_section_array> [<entry>].time)
	time_diff = (<next_time> - <last_time>)
	<total_time_taken> = (<total_time_taken> + <time_diff>)
	if (<songtime> >= ($<song_section_array> [<entry>].time))
		break
	endif
	<entry> = (<entry> + 1)
	repeat ($practice_end_index - $practice_start_index)
	<total_time_taken> = (<total_time_taken> / 1000)
	return time_wasted = <total_time_taken>
endscript

script paused_special_event_start_again 
	special_event_get_time_wasted
	getspecialeventtimer
	<time> = (<time> - <time_wasted>)
	if (<time> < 0)
		<time> = 0
	endif
	setspecialeventtimer time = <time>
	reset_current_special_event_miss_notes
	practice_restart_song
endscript

script paused_special_event_quit_segment 
	kill_gem_scroller
	reset_score \{player_status = player1_status}
	generic_event_choose \{state = uistate_special_event_win
		no_sound
		data = {
			quit_segment = 1
		}}
	change game_mode = ($special_event_previous_game_mode)
endscript

script paused_special_event_quit_challenge 
	kill_gem_scroller
	generic_event_back \{state = uistate_special_events
		no_sound}
	change game_mode = ($special_event_previous_game_mode)
endscript

script ui_get_instrument_text 
	requireparams \{[
			part
		]
		all}
	switch <part>
		case guitar
		return \{instrument_text = qs(0x9504b94a)}
		case bass
		return \{instrument_text = qs(0x7d4f9214)}
		case drum
		return \{instrument_text = qs(0x388cd3db)}
		case vocals
		return \{instrument_text = qs(0x1b9f6f84)}
	endswitch
	softassert 'uknown part %p' p = <part>
	return \{instrument_text = qs(0x9504b94a)}
endscript

script dim_screen 
	if screenelementexists \{id = dim_screen}
		destroyscreenelement \{id = dim_screen}
	endif
	if NOT gotparam \{undim}
		createscreenelement \{type = spriteelement
			id = dim_screen
			parent = root_window
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			rgba = [
				0
				0
				0
				128
			]
			z_priority = -1000}
	endif
endscript
