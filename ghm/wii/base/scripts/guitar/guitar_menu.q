gh3_button_font = buttons_x360
gh3_disable_homebutton = 0
0x10e387b4 = 0

script get_home_button_allowed 
	return \{disabled = $gh3_disable_homebutton}
endscript

script set_home_button_notallowed 
	printf \{qs(0xd664bc61)}
	Change \{gh3_disable_homebutton = 1}
endscript

script set_home_button_allowed 
	if ($0x10e387b4 = 1)
		return
	endif
	printf \{qs(0x60b22995)}
	Change \{gh3_disable_homebutton = 0}
endscript

script 0x092527c9 
	if ScreenElementExists \{id = 0xcf03740d}
		return \{showing = true}
	else
		return \{showing = FALSE}
	endif
	return \{showing = FALSE}
endscript

script 0xf5e0780a 
	printf \{qs(0x66d542ec)}
	KillSpawnedScript \{Name = 0xc2491c68}
	if ScreenElementExists \{id = 0xcf03740d}
		DestroyScreenElement \{id = 0xcf03740d}
	endif
endscript

script 0xc2491c68 
	0x18f26303
	if ScreenElementExists \{id = 0xcf03740d}
		return
	endif
	0x61406d12
	CreateScreenElement {
		Type = SpriteElement
		id = 0xcf03740d
		parent = root_window
		texture = no_home_menu_icon
		dims = <0x889c768f>
		rgba = [255 255 255 255]
		Pos = <0x2356f8e2>
		just = [center center]
		Scale = 1.0
		z_priority = 10000.0
		alpha = 0
		no_squishy = true
	}
	legacydoscreenelementmorph \{id = 0xcf03740d
		alpha = 1
		time = 0.25}
	Wait \{1.25
		Seconds}
	legacydoscreenelementmorph \{id = 0xcf03740d
		alpha = 0
		time = 0.25}
	Wait \{0.25
		Seconds}
	if ScreenElementExists \{id = 0xcf03740d}
		DestroyScreenElement \{id = 0xcf03740d}
	endif
endscript
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

script menu_flow_go_back \{Player = 1
		create_params = {
		}
		destroy_params = {
		}}
	ui_flow_manager_respond_to_action action = go_back Player = <Player> create_params = <create_params> destroy_params = <destroy_params>
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
	if ScreenElementExists id = <scrollid>
		printf qs(0x362d7a89) s = <scrollid>
		return
	endif
	if ScreenElementExists id = <vmenuid>
		printf qs(0x928ba034) s = <vmenuid>
		return
	endif
	CreateScreenElement {
		Type = VScrollingMenu
		parent = <menu_parent>
		id = <scrollid>
		just = <just>
		dims = <dims>
		Pos = <menu_pos>
		z_priority = <z>
	}
	if (<use_backdrop> = 1)
		create_generic_backdrop
	endif
	if GotParam \{Name}
		CreateScreenElement {
			Type = TextElement
			parent = <scrollid>
			font = fontgrid_text_a6
			Pos = (0.0, -45.0)
			font_size = 0.2
			rgba = [175 175 175 255]
			text = <Name>
			just = <just>
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
		}
	endif
	CreateScreenElement {
		Type = VMenu
		parent = <scrollid>
		id = <vmenuid>
		Pos = (0.0, 0.0)
		just = <just>
		internal_just = <internal_just>
		event_handlers = <event_handlers>
		position_children
		rot_angle = <rot_angle>
		spacing_between = <spacing>
		position_children = <position_children>
	}
	if GotParam \{no_wrap}
		SetScreenElementProps id = <vmenuid> allow_wrap = FALSE
	endif
	if GotParam \{text_left}
		SetScreenElementProps id = <vmenuid> internal_just = [left top]
	endif
	if GotParam \{text_right}
		SetScreenElementProps id = <vmenuid> internal_just = [right top]
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	if NOT (<exclusive_device> = None)
		SetScreenElementProps {
			id = <scrollid>
			exclusive_device = <exclusive_device>
		}
		SetScreenElementProps {
			id = <vmenuid>
			exclusive_device = <exclusive_device>
		}
	endif
	if GotParam \{tierlist}
		Tier = 0
		begin
		<Tier> = (<Tier> + 1)
		setlist_prefix = (<tierlist>.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<Tier>)
		formatText checksumName = tier_checksum 'tier%s' s = (<Tier>)
		<unlocked> = 1
		if ((<unlocked> = 1) || ($is_network_game))
			GetArraySize (<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_Size> > 0)
				begin
				format_globaltag_song_checksum part = (<tierlist>.part) song = (<tierlist>.<tier_checksum>.songs [<song_count>])
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> song = (<tierlist>.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title song = (<tierlist>.<tier_checksum>.songs [<song_count>])
					CreateScreenElement {
						Type = TextElement
						parent = <vmenuid>
						font = <font>
						Scale = <font_size>
						rgba = [210 210 210 250]
						text = <song_title>
						just = [left top]
						event_handlers = [
							{focus menu_focus}
							{unfocus menu_unfocus}
							{pad_choose <on_choose> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_left <on_left> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_select <on_select> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_right <on_right> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_L3 <on_l3> params = {Tier = <Tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_Size>
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
	viwaitforretrace
	if GotParam \{menu_id}
		if ScreenElementExists id = <menu_id>
			DestroyScreenElement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script add_new_menu_item \{parent = current_menu
		focus_script = retail_menu_focus
		unfocus_script = retail_menu_unfocus}
	if GlobalExists \{Name = massive_build}
		if NOT ($massive_build = 0)
			if GotParam \{massive_secret_item}
				return
			endif
		endif
	endif
	if NOT ScreenElementExists id = <parent>
		printf qs(0xe8f14d9c) p = <parent>
	endif
	CreateScreenElement {
		Type = TextElement
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

script guitar_menu_highlighter \{zPri = 50}
	if GotParam \{text_id}
		GetScreenElementDims id = <text_id>
		hilite_dims = (<width> * (1.0, 0.0) + <height> * (0.0, 0.7) + (20.0, -1.0))
		bookend_dims = (<height> * (0.5, 0.5))
		hilite_pos = ((<hlInfoList> [<hlIndex>]).posH + (-2.0, 2.0))
		SetScreenElementProps {
			id = <wthlID>
			Pos = <hilite_pos>
			dims = <hilite_dims>
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be1ID>
			Pos = (<hilite_pos> - <bookend_dims>.(1.0, 0.0) * (0.6, 0.0) + <height> * (0.0, 0.1))
			dims = <bookend_dims>
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be2ID>
			Pos = (<hilite_pos> + (<hilite_dims>.(1.0, 0.0) * (1.0, 0.0)) + <height> * (0.0, 0.1) - (<bookend_dims>.(1.0, 0.0) * (0.1, 0.0)))
			dims = <bookend_dims>
			z_priority = <zPri>
			flip_h
		}
	else
		SetScreenElementProps {
			id = <be1ID>
			Pos = ((<hlInfoList> [<hlIndex>]).posL)
			dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be2ID>
			Pos = ((<hlInfoList> [<hlIndex>]).posR)
			dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <wthlID>
			Pos = ((<hlInfoList> [<hlIndex>]).posH)
			dims = ((<hlInfoList> [<hlIndex>]).hDims)
			z_priority = <zPri>
		}
	endif
endscript

script glow_menu_element \{time = 1}
	if NOT ScreenElementExists id = <id>
		return
	endif
	Wait RandomInteger (0.0, 2.0) Seconds
	begin
	<id> :legacydomorph alpha = 1 time = <time> motion = smooth
	<id> :legacydomorph alpha = 0 time = <time> motion = smooth
	repeat
endscript

script create_play_song_menu 
	show_highway
endscript

script destroy_play_song_menu 
	hide_highway
endscript

script isSinglePlayerGame 
	gamemode_getproperty \{prop = singleplayer}
	return <singleplayer>
endscript

script create_pause_menu \{Player = 1
		for_options = 0
		for_practice = 0}
	player_device = ($last_start_pressed_device)
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		Player = <i>
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
	Change \{bunny_flame_index = 1}
	pause_z = 10000
	spacing = -65
	if (<for_options> = 0)
		menu_pos = (730.0, 220.0)
		if (<for_practice> = 1)
			<menu_pos> = (640.0, 190.0)
			<spacing> = -65
		elseif ($is_network_game = 1)
			<menu_pos> = (640.0, 250.0)
			<spacing> = -62
			<rot_angle> = 0
		endif
	else
		<spacing> = -65
		if IsGuitarController controller = <player_device>
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
		CreateScreenElement {
			Type = SpriteElement
			parent = pause_menu_frame_container
			texture = menu_pause_frame_banner
			Pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<pause_z> + 100)
		}
		if GotParam \{banner_text}
			pause_player_text = <banner_text>
			if GotParam \{banner_scale}
				pause_player_scale = <banner_scale>
			else
				pause_player_scale = (1.0, 1.0)
			endif
		else
			if (<for_options> = 0)
				if (<for_practice> = 1)
					<pause_player_text> = qs(0x662aaaf7)
				else
					if NOT isSinglePlayerGame
						formatText TextName = pause_player_text qs(0x5ebc9c29) d = <Player>
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
	CreateScreenElement {
		Type = TextElement
		parent = <id>
		text = <pause_player_text>
		font = fontgrid_text_a6
		Pos = (125.0, 53.0)
		Scale = <pause_player_scale>
		rgba = [170 90 30 255]
		Scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0 && <for_practice> = 0 && $is_network_game = 0)
		CreateScreenElement {
			Type = ContainerElement
			parent = pause_menu_frame_container
			id = bunny_container
			Pos = (380.0, 170.0)
			just = [left top]
			z_priority = <pause_z>
		}
		i = 1
		begin
		formatText checksumName = bunny_id 'pause_bunny_flame_%d' d = <i>
		formatText checksumName = bunny_tex 'Menu_Pause_Bunny_Flame0%d' d = <i>
		CreateScreenElement {
			Type = SpriteElement
			id = <bunny_id>
			parent = bunny_container
			Pos = (160.0, 170.0)
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
		CreateScreenElement {
			Type = SpriteElement
			id = pause_bunny_shadow
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [0 0 0 128]
			Pos = (20.0, -110.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 4)
		}
		CreateScreenElement {
			Type = SpriteElement
			id = pause_bunny
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [255 255 255 255]
			Pos = (0.0, -130.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 5)
		}
		RunScriptOnScreenElement \{id = bunny_container
			bunny_hover
			params = {
				hover_origin = (380.0, 170.0)
			}}
	endif
	container_params = {Type = ContainerElement parent = current_menu dims = (0.0, 100.0)}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			text_scale = (1.0, 1.0)
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_start_again}}
					{unfocus retail_menu_unfocus params = {id = pause_start_again}}
					{pad_choose paused_special_event_start_again}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_start_again
				text = qs(0xb4b6d5d4)
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_segment}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_segment}}
					{pad_choose paused_special_event_quit_segment}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_segment
				text = qs(0x2ebc4f15)
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_challenge}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_challenge}}
					{pad_choose paused_special_event_quit_challenge}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_challenge
				text = qs(0x44d65516)
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		elseif ($current_special_event_num = 2)
			text_scale = (1.0, 1.0)
			CreateScreenElement {
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
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_continue_practicing
				text = <continue_practicing_text>
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($special_event_stage = 1)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_take_test}}
						{unfocus retail_menu_unfocus params = {id = pause_take_test}}
						{pad_choose practice_restart_song}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					id = pause_take_test
					text = qs(0xba34e48f)
					just = [center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit}}
					{unfocus retail_menu_unfocus params = {id = pause_quit}}
					{pad_choose generic_event_choose params = {state = uistate_pausemenu_quit_warning}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit
				text = qs(0x67d9c56d)
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
	elseif (<for_options> = 0)
		if (<for_practice> = 1)
			if English
			else
				text_scale = (0.5, 0.5)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose handle_pause_event}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_resume
				text = qs(0x4f636726)
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_restart}}
					{unfocus retail_menu_unfocus params = {id = pause_restart}}
					{pad_choose generic_event_choose params = {state = uistate_pausemenu_restart_warning}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0xb8790f2f)
				id = pause_restart
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_options}}
					{unfocus retail_menu_unfocus params = {id = pause_options}}
					{pad_choose generic_event_choose params = {data = {state = Uistate_pausemenu for_options = 1}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x976cf9e7)
				id = pause_options
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_speed}}
					{unfocus retail_menu_unfocus params = {id = pause_change_speed}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0xcc2da18b) option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = uistate_practice_select_speed}}}}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0xcc2da18b)
				id = pause_change_speed
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_section}}
					{unfocus retail_menu_unfocus params = {id = pause_change_section}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x68bd3039) option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = uistate_practice_select_part}}}}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x68bd3039)
				id = pause_change_section
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_new_song}}
						{unfocus retail_menu_unfocus params = {id = pause_new_song}}
						{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs(0x3e482764) option2_func = {quit_warning_select_quit params = {callback = song_ended_menu_select_new_song}}}}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs(0x3e482764)
					id = pause_new_song
					just = [center top]
					Shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if NOT ($is_in_debug)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_choose params = {state = uistate_pausemenu_quit_warning}}
					]
				}
			else
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_back params = {state = uistate_debug}}
					]
				}
			endif
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x67d9c56d)
				id = pause_quit
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		else
			if English
			else
				container_params = {Type = ContainerElement parent = current_menu dims = (0.0, 105.0)}
				text_scale = (0.8, 0.8)
			endif
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_resume}}
					{unfocus retail_menu_unfocus params = {id = pause_resume}}
					{pad_choose handle_pause_event}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x4f636726)
				id = pause_resume
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			if ($is_network_game = 0)
				fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			else
				fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if ($is_network_game = 0)
				if NOT ($end_credits = 1)
					CreateScreenElement {
						<container_params>
						event_handlers = [
							{focus retail_menu_focus params = {id = pause_restart}}
							{unfocus retail_menu_unfocus params = {id = pause_restart}}
							{pad_choose generic_event_choose params = {state = uistate_pausemenu_restart_warning}}
						]
					}
					CreateScreenElement {
						Type = TextElement
						parent = <id>
						font = fontgrid_title_a1
						Scale = <text_scale>
						rgba = ($menu_unfocus_color)
						text = qs(0xb8790f2f)
						id = pause_restart
						just = [center top]
						Shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					if ($is_demo_mode = 1)
						demo_mode_disable = {rgba = [80 80 80 255] not_focusable}
					else
						demo_mode_disable = {}
					endif
					if NOT ($current_song = jamsession)
						if (($game_mode = p1_career && $boss_battle = 0) || ($game_mode = p1_quickplay) || ($game_mode = p2_quickplay))
							CreateScreenElement {
								<container_params>
								event_handlers = [
									{focus retail_menu_focus params = {id = pause_practice}}
									{unfocus retail_menu_unfocus params = {id = pause_practice}}
									{pad_choose generic_event_choose params = {state = uistate_practice_warning}}
								]
							}
							CreateScreenElement {
								Type = TextElement
								parent = <id>
								font = fontgrid_title_a1
								Scale = <text_scale>
								rgba = ($menu_unfocus_color)
								text = qs(0x3ea7dec9)
								id = pause_practice
								just = [center top]
								Shadow
								shadow_offs = (3.0, 3.0)
								shadow_rgba [0 0 0 255]
								z_priority = <pause_z>
								exclusive_device = <player_device>
							}
							GetScreenElementDims id = <id>
							fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
						endif
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus params = {id = pause_options}}
								{unfocus retail_menu_unfocus params = {id = pause_options}}
								{pad_choose generic_event_choose params = {data = {state = Uistate_pausemenu for_options = 1}}}
							]
						}
						CreateScreenElement {
							Type = TextElement
							parent = <id>
							font = fontgrid_title_a1
							Scale = <text_scale>
							rgba = ($menu_unfocus_color)
							text = qs(0x976cf9e7)
							id = pause_options
							just = [center top]
							Shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <player_device>
						}
						GetScreenElementDims id = <id>
						fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
				endif
			endif
			quit_script = generic_event_choose
			quit_script_params = {state = uistate_pausemenu_quit_warning}
			if ($is_network_game = 1)
				quit_script = select_quit_network_game
				quit_script = 0x35bb06c0
			endif
			if NOT ($is_in_debug)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose <quit_script> params = <quit_script_params>}
					]
				}
			else
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_quit}}
						{unfocus retail_menu_unfocus params = {id = pause_quit}}
						{pad_choose generic_event_back params = {state = uistate_debug}}
					]
				}
			endif
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x67d9c56d)
				id = pause_quit
				just = [center top]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			if ($is_network_game = 0)
				fit_text_in_rectangle id = <id> dims = ((270.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			else
				fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			endif
			if ($enable_button_cheats = 1)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_debug_menu}}
						{unfocus retail_menu_unfocus params = {id = pause_debug_menu}}
						{pad_choose generic_event_choose params = {state = uistate_debug data = {from_gameplay = 1}}}
					]
				}
				CreateScreenElement {
					Type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					Scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs(0xe4963f83)
					id = pause_debug_menu
					just = [center top]
					Shadow
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
		CreateScreenElement \{Type = ContainerElement
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
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			font = fontgrid_title_a1
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs(0xfd77e801)
			id = options_audio
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		CreateScreenElement {
			Type = ContainerElement
			parent = current_menu
			dims = (0.0, 100.0)
			event_handlers = [
				{focus retail_menu_focus params = {id = options_calibrate_lag}}
				{focus generic_menu_up_or_down_sound}
				{unfocus retail_menu_unfocus params = {id = options_calibrate_lag}}
				{pad_choose generic_event_choose params = {data = {state = uistate_options_calibrate_lag_warning controller = <player_device>}}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = <id>
			font = fontgrid_title_a1
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs(0x550b8c8e)
			id = options_calibrate_lag
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if IsGuitarController controller = <player_device>
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				Type = ContainerElement
				parent = current_menu
				dims = (0.0, 100.0)
				event_handlers = [
					{focus retail_menu_focus params = {id = options_calibrate_guitar_sensors}}
					{focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus params = {id = options_calibrate_guitar_sensors}}
					{pad_choose generic_event_choose params = {state = uistate_options_controller_sensors data = {Player = <Player> controller = <player_device> popup = 1}}}
				]
			}
			CreateScreenElement {
				Type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				Scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs(0x717ce181)
				id = options_calibrate_guitar_sensors
				just = [center center]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if isSinglePlayerGame
			lefty_flip_text = qs(0x749825c8)
		else
			if (<Player> = 1)
				lefty_flip_text = qs(0x16adc675)
			else
				lefty_flip_text = qs(0xe4fa2b8d)
			endif
		endif
		CreateScreenElement \{Type = ContainerElement
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
		CreateScreenElement {
			Type = TextElement
			parent = <lefty_container>
			id = pause_options_lefty
			font = fontgrid_title_a1
			Scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = <lefty_flip_text>
			just = [center center]
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		GetGlobalTags \{user_options}
		if (<Player> = 1)
			if (<lefty_flip_p1> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		else
			if (<lefty_flip_p2> = 1)
				lefty_tex = Options_Controller_Check
			else
				lefty_tex = Options_Controller_X
			endif
		endif
		displaySprite {
			parent = <lefty_container>
			tex = <lefty_tex>
			just = [center center]
			z = (<pause_z> + 10)
		}
		GetScreenElementDims \{id = pause_options_lefty}
		<id> :se_setprops Pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT isSinglePlayerGame
			if (<for_practice> = 0)
				formatText TextName = player_paused_text qs(0x392c86d2) d = <Player>
				displaySprite {
					parent = pause_menu_frame_container
					id = pause_helper_text_bg
					tex = helper_pill_body
					Pos = (640.0, 600.0)
					just = [center center]
					rgba = [96 0 0 255]
					z = (<pause_z> + 10)
				}
				displayText {
					parent = pause_menu_frame_container
					Pos = (640.0, 604.0)
					just = [center center]
					text = <player_paused_text>
					rgba = [186 105 0 255]
					Scale = (0.45000002, 0.6)
					z = (<pause_z> + 11)
					font = fontgrid_text_a6
				}
				GetScreenElementDims id = <id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :se_setprops dims = <bg_dims>
				displaySprite {
					parent = pause_menu_frame_container
					tex = helper_pill_end
					Pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [right center]
					flip_v
					z = (<pause_z> + 10)
				}
				displaySprite {
					parent = pause_menu_frame_container
					tex = helper_pill_end
					Pos = ((640.0, 601.0) + <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [left center]
					z = (<pause_z> + 10)
				}
			endif
		endif
	endif
	if (<for_options> = 0 && <for_practice> = 0 && $is_network_game = 0)
		SpawnScriptNow \{animate_bunny_flame}
	endif
endscript

script options_change_vocals_highway_view 
	RequireParams \{[
			Player
		]
		all}
	resetscoreupdateready
	vocals_get_highway_view Player = <Player>
	<vocals_highway_view> = <highway_view>
	if (<vocals_highway_view> = static)
		<vocals_highway_view> = scrolling
	else
		<vocals_highway_view> = static
	endif
	vocals_set_highway_view Player = <Player> view = <vocals_highway_view> controller = <device_num>
	i = 1
	begin
	vocals_set_highway_view Player = <i> view = <vocals_highway_view> controller = <device_num>
	i = (<i> + 1)
	repeat 4
	if IsObjectScript
		Obj_GetID
		if (<vocals_highway_view> = static)
			SoundEvent \{event = Checkbox_SFX}
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 1
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
		endif
	endif
	if NOT GotParam \{no_restart}
		GH3_SFX_fail_song_stop_sounds
		if ($game_mode = training)
			SpawnScriptNow \{practice_restart_song}
		else
			SpawnScriptNow \{career_restart_song}
		endif
		generic_event_back \{state = Uistate_gameplay}
	endif
endscript

script options_change_vocals_sp_clap \{x_tex = data_settings_xmark
		check_tex = data_settings_checkmark}
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo Player = <Player> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		<vocals_sp_clap> = 0
	else
		<vocals_sp_clap> = 1
	endif
	vocals_set_star_power_clap Player = <Player> clap = <vocals_sp_clap> controller = <device_num>
	if IsObjectScript
		Obj_GetID
		if GotParam \{checkbox_child}
			child = <checkbox_child>
		else
			child = check
		endif
		if (<vocals_sp_clap> = 0)
			SoundEvent \{event = Checkbox_SFX}
			<objID> :se_setprops check_alpha = 0
			<objID> :se_setprops cross_alpha = 1
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<objID> :se_setprops check_alpha = 1
			<objID> :se_setprops cross_alpha = 0
		endif
	endif
endscript

script options_change_tilt_star_power 
	getplayerinfo <Player> use_tilt_for_starpower
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	if (<use_tilt_for_starpower> = 1)
		SoundEvent \{event = Checkbox_SFX}
		setplayerinfo <Player> use_tilt_for_starpower = 0
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = Options_Controller_X
	else
		SoundEvent \{event = CheckBox_Check_SFX}
		setplayerinfo <Player> use_tilt_for_starpower = 1
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = Options_Controller_Check
	endif
	if IsObjectScript
		Obj_GetID
		if ResolveScreenElementID id = {<objID> child = tilt_check}
			<resolved_id> :SetProps texture = <new_texture>
		else
			if (<use_tilt_for_starpower> = 1)
				<use_tilt_for_starpower> = 0
				SoundEvent \{event = Checkbox_SFX}
				if GotParam \{popup}
					<objID> :se_setprops check_alpha = 0
					<objID> :se_setprops cross_alpha = 1
				else
					<objID> :se_setprops check_alpha = 0
					<objID> :se_setprops cross_alpha = 1
				endif
			else
				<use_tilt_for_starpower> = 1
				SoundEvent \{event = CheckBox_Check_SFX}
				if GotParam \{popup}
					<objID> :se_setprops check_alpha = 1
					<objID> :se_setprops cross_alpha = 0
				else
					<objID> :se_setprops check_alpha = 1
					<objID> :se_setprops cross_alpha = 0
				endif
			endif
		endif
	endif
endscript

script options_change_touch_strip_option 
	getplayerinfo <Player> enable_touch_strip
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	if (<enable_touch_strip> = 1)
		SoundEvent \{event = Checkbox_SFX}
		setplayerinfo <Player> enable_touch_strip = 0
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = Options_Controller_X
	else
		SoundEvent \{event = CheckBox_Check_SFX}
		setplayerinfo <Player> enable_touch_strip = 1
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = Options_Controller_Check
	endif
	if IsObjectScript
		Obj_GetID
		if ResolveScreenElementID id = {<objID> child = touch_check}
			<resolved_id> :SetProps texture = <new_texture>
		else
			if (<enable_touch_strip> = 1)
				<enable_touch_strip> = 0
				SoundEvent \{event = Checkbox_SFX}
				if GotParam \{popup}
					<objID> :se_setprops check_alpha = 0
					<objID> :se_setprops cross_alpha = 1
				else
					<objID> :se_setprops check_alpha = 0
					<objID> :se_setprops cross_alpha = 1
				endif
			else
				<enable_touch_strip> = 1
				SoundEvent \{event = CheckBox_Check_SFX}
				if GotParam \{popup}
					<objID> :se_setprops check_alpha = 1
					<objID> :se_setprops cross_alpha = 0
				else
					<objID> :se_setprops check_alpha = 1
					<objID> :se_setprops cross_alpha = 0
				endif
			endif
		endif
	endif
endscript

script 0xb6b2e36c 
	GetGlobalTags <bandname_id> param = auto_dwc_login
	if (<auto_dwc_login> = 1)
		<auto_dwc_login> = 0
	else
		<auto_dwc_login> = 1
	endif
	SetGlobalTags <bandname_id> params = {auto_dwc_login = <auto_dwc_login>}
	if IsObjectScript
		Obj_GetID
		if (<auto_dwc_login> = 0)
			SoundEvent \{event = Checkbox_SFX}
			if GotParam \{popup}
				<objID> :se_setprops check_alpha = 0
				<objID> :se_setprops cross_alpha = 1
			else
				<objID> :se_setprops check_alpha = 0
				<objID> :se_setprops cross_alpha = 1
			endif
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			if GotParam \{popup}
				<objID> :se_setprops check_alpha = 1
				<objID> :se_setprops cross_alpha = 0
			else
				<objID> :se_setprops check_alpha = 1
				<objID> :se_setprops cross_alpha = 0
			endif
		endif
	endif
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	Wait \{0.1
		Second}
	repeat
endscript

script bunny_hover 
	if NOT ScreenElementExists \{id = bunny_container}
		return
	endif
	i = 1
	begin
	formatText checksumName = bunnyid 'pause_bunny_flame_%d' d = <i>
	if NOT ScreenElementExists id = <bunnyid>
		return
	else
		SetScreenElementProps id = <bunnyid> Pos = <flame_origin>
	endif
	<i> = (<i> + 1)
	repeat 7
	begin
	bunny_container :legacydomorph \{Pos = (360.0, 130.0)
		time = 1
		rot_angle = -25
		Scale = 1.05
		motion = ease_out}
	bunny_container :legacydomorph \{Pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		Scale = 0.95
		motion = ease_in}
	bunny_container :legacydomorph \{Pos = (360.0, 130.0)
		time = 1
		rot_angle = -15
		Scale = 1.05
		motion = ease_out}
	bunny_container :legacydomorph \{Pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		Scale = 0.95
		motion = ease_in}
	repeat
endscript

script destroy_pause_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu \{menu_id = scrolling_pause}
	destroy_menu \{menu_id = pause_menu_frame_container}
	KillSpawnedScript \{Name = animate_bunny_flame}
	if ScreenElementExists \{id = warning_message_container}
		DestroyScreenElement \{id = warning_message_container}
	endif
	if ScreenElementExists \{id = leaving_lobby_dialog_menu}
		DestroyScreenElement \{id = leaving_lobby_dialog_menu}
	endif
	destroy_pause_menu_frame \{container_id = net_quit_warning}
endscript

script swap_bunny_flame 
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
		Change \{g_anim_flame = -1}
	elseif GotParam \{down}
		generic_menu_up_or_down_sound \{down}
		Change \{g_anim_flame = 1}
	endif
	Change bunny_flame_index = ($bunny_flame_index + $g_anim_flame)
	if ($bunny_flame_index > 7)
		Change \{bunny_flame_index = 1}
	endif
	if ($bunny_flame_index < 1)
		Change \{bunny_flame_index = 7}
	endif
	reset_bunny_alpha
	formatText \{checksumName = bunnyid
		'pause_bunny_flame_%d'
		d = $bunny_flame_index}
	if ScreenElementExists id = <bunnyid>
		legacydoscreenelementmorph id = <bunnyid> alpha = 1
	endif
endscript

script reset_bunny_alpha 
	i = 1
	begin
	formatText checksumName = bunnyid 'pause_bunny_flame_%d' d = <i>
	if ScreenElementExists id = <bunnyid>
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
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = menu_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if GotParam \{BlendMode}
		CreateScreenElement {
			Type = SpriteElement
			parent = menu_backdrop_container
			id = menu_backdrop
			texture = <texture>
			rgba = <rgba>
			blend = <BlendMode>
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = 0
		}
		CreateScreenElement \{Type = SpriteElement
			parent = menu_backdrop_container
			id = blackout
			texture = white
			rgba = [
				0
				0
				0
				255
			]
			blend = diffuse
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = -2}
	else
		CreateScreenElement {
			Type = SpriteElement
			parent = menu_backdrop_container
			id = menu_backdrop
			texture = <texture>
			rgba = <rgba>
			blend = diffuse
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = <z_priority>
		}
	endif
endscript

script destroy_menu_backdrop 
	viwaitforretrace
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
endscript

script create_pause_menu_frame \{x_scale = 1
		y_scale = 1
		tile_sprite = 1
		container_id = pause_menu_frame_container
		z = 0
		gradient = 1
		parent = root_window}
	tile_sprite = 1
	if ($guitar_motion_enable_test = 1)
		<alpha> = 0
	else
		<alpha> = 1
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <container_id>
		Pos = (0.0, 0.0)
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
		CreateScreenElement {
			Type = SpriteElement
			id = pause_gradient
			parent = <container_id>
			texture = gradient_128
			rgba = [0 0 0 180]
			Pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			just = [left top]
			z_priority = (<z> + 1)
		}
	endif
	if (<tile_sprite> = 1)
		CreateScreenElement {
			Type = WindowElement
			parent = <container_id>
			id = pause_menu_scrolling_bg_01
			Pos = (642.0, 360.0)
			dims = ((508.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			just = [center center]
			z_priority = (<z> - 1)
		}
		RunScriptOnScreenElement TileSpriteLoop id = <id> params = {move_x = -2 move_y = -2}
	else
		CreateScreenElement {
			Type = SpriteElement
			id = frame_background
			parent = <container_id>
			rgba = [0 0 0 255]
			Pos = (640.0, 360.0)
			just = [center center]
			dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			z_priority = (<z> - 1)
		}
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_3>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_4>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_4>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_4>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		Pos = (<center_pos>)
		Scale = <scale_4>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		Pos = (<center_pos>)
		Scale = <scale_5>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		Pos = (<center_pos>)
		Scale = <scale_5>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		Pos = (<center_pos>)
		Scale = <scale_5>
		just = [top left]
		z_priority = (<z> + 2)
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		Pos = (<center_pos>)
		Scale = <scale_5>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
endscript

script destroy_pause_menu_frame \{container_id = pause_menu_frame_container}
	destroy_menu menu_id = <container_id>
endscript
default_menu_focus_color = [
	255
	255
	255
	255
]
default_menu_unfocus_color = [
	100
	88
	71
	255
]
menu_focus_color = [
	255
	255
	255
	255
]
menu_unfocus_color = [
	100
	88
	71
	255
]

script set_focus_color \{rgba = $default_menu_focus_color}
	Change menu_focus_color = <rgba>
endscript

script set_unfocus_color \{rgba = $default_menu_unfocus_color}
	Change menu_unfocus_color = <rgba>
endscript

script retail_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($menu_focus_color)
		endif
	else
		SetProps rgba = ($menu_focus_color)
	endif
endscript

script retail_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($menu_unfocus_color)
		endif
	else
		SetProps rgba = ($menu_unfocus_color)
	endif
endscript

script fit_text_convert_legacy_params_props 
	GetScreenElementProps id = <id>
	return {Scale = <Scale>}
endscript

script fit_text_convert_legacy_params 
	if (<keep_ar> = 1)
		<preserve_aspect_ratio> = true
	else
		<preserve_aspect_ratio> = FALSE
	endif
	if (<only_if_larger_x> = 1)
		RemoveParameter \{only_if_larger_x}
		<only_if_larger_x> = true
	else
		RemoveParameter \{only_if_larger_x}
		<only_if_larger_x> = FALSE
	endif
	if GotParam \{start_x_scale}
		<factor_start_scale> = true
	elseif GotParam \{start_y_scale}
		<factor_start_scale> = true
	else
		fit_text_convert_legacy_params_props <...>
		<x_dim> = (<dims>.(1.0, 0.0))
		<y_dim> = (<dims>.(0.0, 1.0))
		<x_scale> = (<Scale>.(1.0, 0.0))
		<y_scale> = (<Scale>.(0.0, 1.0))
		<dims> = ((1.0, 0.0) * <x_dim> / <x_scale> + (0.0, 1.0) * <y_dim> / <y_scale>)
		<factor_start_scale> = FALSE
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
	if NOT GotParam \{id}
		ScriptAssert \{qs(0xd9eec8c8)}
	endif
	fit_text_convert_legacy_params <...>
	<id> :se_fittodims {
		dims = <dims>
		factor_start_scale = <factor_start_scale>
		preserve_aspect_ratio = <preserve_aspect_ratio>
		only_if_larger_x = <only_if_larger_x>
		only_if_larger_y = FALSE
	}
	if GotParam \{Pos}
		SetScreenElementProps id = <id> Pos = <Pos>
	endif
endscript
num_user_control_helpers = 0
user_control_text_font = text_a4
user_control_pill_color = [
	0
	0
	0
	255
]
user_control_pill_text_color = [
	255
	255
	255
	255
]
user_control_auto_center = 1
user_control_super_pill = 0
user_control_pill_y_position = 650
user_control_pill_scale = 0.6
user_control_pill_end_width = 50
user_control_pill_gap = 80
user_control_super_pill_gap = 0.4
pill_helper_max_width = 170

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
	Change user_control_pill_color = <bg_rgba>
	Change user_control_pill_text_color = <text_rgba>
endscript

script 0x65330e0b 
	if NOT GotParam \{controller}
		controller = ($primary_controller)
	endif
	<0xa0ac0221> = 0
	begin
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [(<controller>)])
	if ((<0xa0ac0221> = 0) && (<is_active_controller> = 1))
		0x356839b2 controller = <controller>
		<0xa0ac0221> = <0x39646908>
	endif
	if NOT (<is_active_controller> = 1)
		0xaf72357f controller = <controller>
		SetScreenElementProps \{id = user_control_container
			alpha = 1}
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script 0xaf72357f 
	if (<controller> < 0)
		return
	endif
	begin
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [(<controller>)])
	if (<is_active_controller> = 1)
		0x356839b2 controller = <controller>
		return
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script 0x356839b2 \{controller = $primary_controller}
	<0x39646908> = 0
	if NOT ScreenElementExists \{id = user_control_container}
		return 0x39646908 = <0x39646908>
	endif
	if user_control_container :desc_resolvealias \{Name = alias_helper_pill_menu}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> > 0)
				<index> = 0
				begin
				<child> = (<children> [<index>])
				<child> :GetTags
				if (GotParam button)
					<child> :SetTags {watch_controller = <controller>}
					user_control_helper_get_buttonchar button = <button> controller = <controller>
					SetScreenElementProps {
						id = <child>
						helper_button_text = <0x510ca03a>
					}
					<child> :desc_resolvealias Name = alias_helper_button
					<resolved_id> :se_setprops {
						metaremapenableauto = FALSE
						metaremapdevicetouse = <controller>
					}
				endif
				<index> = (<index> + 1)
				repeat <array_Size>
				<0x39646908> = 1
			endif
		endif
	endif
	return 0x39646908 = <0x39646908>
endscript

script clean_up_user_control_helpers 
	if ScriptIsRunning \{0x65330e0b}
		KillSpawnedScript \{Name = 0x65330e0b}
	endif
	if ScriptIsRunning \{0xaf72357f}
		KillSpawnedScript \{Name = 0xaf72357f}
	endif
	if ScreenElementExists \{id = user_control_container}
		DestroyScreenElement \{id = user_control_container}
	endif
	if ScreenElementExists \{id = custom_setlist_continue_helper}
		DestroyScreenElement \{id = custom_setlist_continue_helper}
	endif
	if ScreenElementExists \{id = 0xb0b1d617}
		DestroyScreenElement \{id = 0xb0b1d617}
	endif
	if ScreenElementExists \{id = custom_setlist_continue_pill}
		DestroyScreenElement \{id = custom_setlist_continue_pill}
	endif
	Change \{user_control_pill_gap = 80}
	Change \{pill_helper_max_width = 170}
	Change \{num_user_control_helpers = 0}
	Change \{user_control_pill_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_text_color = [
			255
			255
			255
			255
		]}
	Change \{user_control_auto_center = 1}
	Change \{user_control_super_pill = 0}
	Change \{user_control_pill_y_position = 650}
	Change \{user_control_pill_scale = 0.6}
	set_user_control_color
endscript

script user_control_helper_get_buttonchar 
	if NOT GotParam \{controller}
		controller = $primary_controller
	endif
	if (<controller> < 0)
		0x93d8d5cf 'illegal controller id ~ %i < 0' i = <controller>
	endif
	buttonchar = None
	switch (<button>)
		case green
		buttonchar = qs(0xac29f74c)
		case red
		buttonchar = qs(0xb532c60d)
		case yellow
		buttonchar = qs(0x9e1f95ce)
		case blue
		buttonchar = qs(0x8704a48f)
		case orange
		buttonchar = qs(0xc8453248)
		case select
		buttonchar = qs(0xd15e0309)
		case back
		buttonchar = qs(0xfa7350ca)
		case start
		buttonchar = qs(0x7deb4c05)
		case select
		buttonchar = qs(0x0f899b59)
		case strumbar
		buttonchar = qs(0x72fe6f1c)
		case lb
		buttonchar = qs(0xb41e52c4)
		case rb
		buttonchar = qs(0xb41e52c4)
		case lt
		buttonchar = qs(0xad056385)
		case rt
		buttonchar = qs(0xe244f542)
		case lbrb
		buttonchar = qs(0xb41e52c4)
		case pad_left
		buttonchar = qs(0x33864e0b)
		case drum_green
		buttonchar = qs(0x0433a81f)
		case 0x99d195c9
		buttonchar = qs(0x3c936d12)
	endswitch
	if (<buttonchar> = None)
		0x93d8d5cf \{'illegal buttonchar'}
		buttonchar = qs(0x03ac90f0)
	endif
	return buttonchar = <buttonchar> controller_used = <controller>
endscript

script pulsate_helper_pill \{time = 1
		delay_time = 1}
	RequireParams \{[
			id
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait <delay_time> Seconds ignoreslomo
	begin
	if ScreenElementExists id = <id>
		<id> :se_setprops {
			alpha = 0.5
			time = <time>
		}
		Wait <time> Seconds ignoreslomo
		if ScreenElementExists id = <id>
			<id> :se_setprops {
				alpha = 1
				time = <time>
			}
			Wait <time> Seconds ignoreslomo
		else
			return
		endif
	else
		return
	endif
	repeat
endscript

script user_control_helpers_change_controller 
	if NOT GotParam \{controller}
		<controller> = ($primary_controller)
	endif
	if NOT ScreenElementExists \{id = user_control_container}
		return
	endif
	if GetScreenElementChildren \{id = user_control_container}
		GetArraySize <children>
		if (<array_Size> > 0)
			<index> = 0
			begin
			<child> = (<children> [<index>])
			<child> :SetTags {watch_controller = <controller>}
			<child> :desc_resolvealias Name = alias_helper_button
			<resolved_id> :se_setprops {
				metaremapenableauto = FALSE
				metaremapdevicetouse = <controller>
			}
			<child> :se_getprops
			<child> :se_setprops {
				helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
				dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
			}
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
endscript
user_control_helper_update_delay = 30

script user_control_helper_update_button_prompts 
	Obj_GetID
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait ($user_control_helper_update_delay) gameframes
	if GetScreenElementChildren id = <objID>
		GetArraySize <children>
		if (<array_Size> > 0)
			<index> = 0
			begin
			<child> = (<children> [<index>])
			<watch_controller> = -1
			<child> :GetTags
			if (<controller_port> = <watch_controller>)
				<child> :desc_resolvealias Name = alias_helper_button
				<resolved_id> :se_setprops {
					metaremapenableauto = FALSE
					metaremapdevicetouse = <watch_controller>
				}
				<child> :se_getprops
				<child> :se_setprops {
					helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
					dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
				}
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script add_user_control_helper \{z = 10
		pill = 1
		fit_to_rectangle = 1}
	0x9b2729dd = FALSE
	if NOT ScreenElementExists \{id = user_control_container}
		<0x9b2729dd> = true
		CreateScreenElement {
			id = user_control_container
			parent = root_window
			Type = descinterface
			desc = 'helper_pills'
			dims = (1024.0, 36.0)
			Pos = (0.0, -54.0)
			pos_anchor = [center bottom]
			just = [center center]
			internal_just = [center center]
			isvertical = FALSE
			position_children = true
			fit_major = `fit	content	if	larger`
			fit_minor = `keep	dims`
			spacing_between = 10
			z_priority = <z>
			event_handlers = [
				{controller_acquired user_control_helper_update_button_prompts}
			]
		}
		if <id> :desc_resolvealias Name = alias_helper_pill_menu
			AssignAlias id = <resolved_id> alias = helper_pills_menu
		endif
	endif
	user_control_helper_get_buttonchar <...> button = <button>
	if (<0x9b2729dd> = true)
		if NOT ((ScriptIsRunning 0x65330e0b) || (ScriptIsRunning 0xaf72357f))
			if NOT GotParam \{controller_used}
				controller_used = ($primary_controller)
			endif
			SpawnScriptNow 0x65330e0b params = {controller = (<controller_used>)}
		endif
	endif
	CreateScreenElement {
		parent = helper_pills_menu
		Type = descinterface
		desc = 'helper_pill'
		auto_dims = FALSE
		dims = (0.0, 36.0)
		helper_button_text = <buttonchar>
		helper_description_text = <text>
		helper_pill_rgba = [200 200 200 255]
		helper_description_rgba = [200 200 200 255]
		tags = {
			watch_controller = <controller_used>
			button = <button>
		}
	}
	ngc_getwide
	if (<widescreen> = true)
		Scale = (1.4, 1.4)
	else
		Scale = (1.6, 1.4)
	endif
	<id> :desc_resolvealias Name = alias_helper_button
	<resolved_id> :se_setprops {
		metaremapenableauto = FALSE
		metaremapdevicetouse = <controller_used>
		Scale = <Scale>
	}
	<id> :se_getprops
	<id> :se_setprops {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 52.0))
	}
	user_control_container :se_getprops
	user_control_container :se_setprops {
		helper_pill_body_dims = (((1.0, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 50.0))
	}
	if (<helper_pill_menu_dims> [0] > 950)
		user_control_container :se_setprops Scale = (950.0 / <helper_pill_menu_dims> [0])
	endif
	return helper_pill_id = <id>
endscript

script user_control_cleanup_pills 
	destroy_menu \{menu_id = user_control_super_pill_object_main}
	destroy_menu \{menu_id = user_control_super_pill_object_l}
	destroy_menu \{menu_id = user_control_super_pill_object_r}
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText checksumName = pill_id 'uc_pill_%d' d = <index>
		if ScreenElementExists id = <pill_id>
			DestroyScreenElement id = <pill_id>
		endif
		formatText checksumName = pill_l_id 'uc_pill_l_%d' d = <index>
		if ScreenElementExists id = <pill_l_id>
			DestroyScreenElement id = <pill_l_id>
		endif
		formatText checksumName = pill_r_id 'uc_pill_r_%d' d = <index>
		if ScreenElementExists id = <pill_r_id>
			DestroyScreenElement id = <pill_r_id>
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript
action_safe_width_for_helpers = 1152

script align_user_control_with_pill 
	formatText checksumName = pill_id 'uc_pill_%d' d = <pill_index>
	fastscreenelementpos id = <pill_id> absolute
	GetScreenElementDims id = <pill_id>
	pill_midpoint_x = (<screenelementpos>.(1.0, 0.0) + 0.5 * <width>)
	align_user_control_with_x X = <pill_midpoint_x> pill_index = <pill_index>
endscript

script align_user_control_with_x 
	formatText checksumName = textid 'uc_text_%d' d = <pill_index>
	formatText checksumName = buttonid 'uc_button_%d' d = <pill_index>
	fastscreenelementpos id = <buttonid> absolute
	top_left = <screenelementpos>
	button_pos = <screenelementpos>
	fastscreenelementpos id = <textid> absolute
	bottom_right = <screenelementpos>
	text_pos = <screenelementpos>
	GetScreenElementDims id = <textid>
	bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
	pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
	text_button_midpoint = (<top_left>.(1.0, 0.0) + 0.5 * <pill_width>)
	midpoint_diff = (<text_button_midpoint> - <X>)
	new_button_pos = (<button_pos> - (1.0, 0.0) * <midpoint_diff>)
	new_text_pos = (<text_pos> - (1.0, 0.0) * <midpoint_diff>)
	SetScreenElementProps id = <textid> Pos = <new_text_pos>
	SetScreenElementProps id = <buttonid> Pos = <new_button_pos>
endscript

script fastscreenelementpos 
	GetScreenElementProps id = <id>
	return screenelementpos = <Pos>
endscript

script istextstrumbar 
	<id> :GetTags
	if GotParam \{is_strumbar}
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
	GetArraySize ($difficulty_list)
	diff_size = <array_Size>
	begin
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	songs_score = 0
	num_songs = 0
	tier_num = 1
	begin
	formatText checksumName = Tier 'tier%d' d = <tier_num>
	GetArraySize ($<tier_global>.<Tier>.songs)
	songlist_size = <array_Size>
	song_count = 0
	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<Tier>.songs [<song_count>]) difficulty_index = <difficulty_index>
	GetGlobalTags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<songs_completed> = (<songs_completed> + 1)
		<songs_score> = (<songs_score> + <score>)
	endif
	<num_songs> = (<num_songs> + 1)
	<song_count> = (<song_count> + 1)
	repeat <songlist_size>
	tier_num = (<tier_num> + 1)
	repeat ($<tier_global>.num_tiers)
	formatText TextName = diff_completion_string qs(0x18a8b83c) a = <songs_completed> b = <num_songs>
	SetArrayElement ArrayName = diff_completion_text index = (<difficulty_index>) NewValue = (<diff_completion_string>)
	<percentage_complete> = (<percentage_complete> + (100 * <songs_completed>) / <num_songs>)
	SetArrayElement ArrayName = diff_completion_percentage index = (<difficulty_index>) NewValue = ((100 * <songs_completed>) / <num_songs>)
	SetArrayElement ArrayName = diff_completion_score index = (<difficulty_index>) NewValue = <songs_score>
	<difficulty_index> = (<difficulty_index> + 1)
	repeat <diff_size>
	if GotParam \{for_get_diff_completion_percentage}
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
	GetSongTimeMs
	songtime = <time>
	get_song_section_array
	GetArraySize ($<song_section_array>)
	if (<songtime> < ($<song_section_array> [0].time))
		return \{time_wasted = 0}
	endif
	total_time_taken = 0
	entry = ($practice_start_index)
	begin
	if ((<entry> + 1) < <array_Size>)
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
	spawnscript \{practice_restart_song}
endscript

script paused_special_event_quit_segment 
	kill_gem_scroller
	reset_score \{player_status = player1_status}
	generic_event_choose \{state = uistate_special_event_win
		no_sound
		data = {
			quit_segment = 1
		}}
	Change game_mode = ($special_event_previous_game_mode)
endscript

script paused_special_event_quit_challenge 
	kill_gem_scroller
	generic_event_back \{state = uistate_special_events
		no_sound}
	Change game_mode = ($special_event_previous_game_mode)
endscript

script ui_get_instrument_text 
	RequireParams \{[
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
	SoftAssert 'uknown part %p' p = <part>
	return \{instrument_text = qs(0x9504b94a)}
endscript

script dim_screen 
	if ScreenElementExists \{id = dim_screen}
		DestroyScreenElement \{id = dim_screen}
	endif
	if NOT GotParam \{undim}
		CreateScreenElement \{Type = SpriteElement
			id = dim_screen
			parent = root_window
			Pos = (640.0, 360.0)
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

script 0x346be212 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
endscript
