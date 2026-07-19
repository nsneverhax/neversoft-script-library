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
	GameBox_greyed_out = [
		128
		128
		128
		255
	]
	GameBox_focussed = [
		255
		255
		255
		255
	]
	menu_gold = [
		203
		151
		51
		255
	]
	menu_white = [
		230
		230
		230
		255
	]
	menu_title = [
		206
		197
		161
		255
	]
	menu_shadow = [
		20
		20
		20
		255
	]
	menu_highlight = [
		190
		185
		165
		235
	]
	menu_highlight2 = [
		225
		225
		165
		205
	]
	menu_sober_green = [
		10
		109
		19
		255
	]
	menu_greyed_out = [
		110
		100
		90
		175
	]
	menu_calibrate_arrow_focus = [
		224
		224
		224
		255
	]
	menu_calibrate_arrow_unfocus = [
		200
		100
		0
		255
	]
	menu_online_player_slot_team1 = [
		206
		43
		43
		255
	]
	menu_online_player_slot_team2 = [
		17
		65
		132
		255
	]
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
		206
		197
		161
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
		150
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
		235
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
		149
		48
		48
		255
	]
}

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
		font = fontgrid_text_a3
		font_size = <font_size>
		default_colors = 1
		just = [left top]
		internal_just = [center top]
		menu_parent = root_window
		scrollid = current_scrollmenu
		vmenuid = current_menu
	}
	if ScreenElementExists id = <scrollid>
		printf qs("\Lscript new_menu vscrollingmenu - %s Already exists.") s = <scrollid>
		return
	endif
	if ScreenElementExists id = <vmenuid>
		printf qs("\Lscript new_menu vmenu - %s Already exists.") s = <vmenuid>
		return
	endif
	CreateScreenElement {
		type = VScrollingMenu
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
	if GotParam \{name}
		CreateScreenElement {
			type = TextElement
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
	CreateScreenElement {
		type = VMenu
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
	if GotParam \{no_wrap}
		SetScreenElementProps id = <vmenuid> allow_wrap = false
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
	if NOT (<exclusive_device> = none)
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
		tier = 0
		begin
		<tier> = (<tier> + 1)
		setlist_prefix = (<tierlist>.prefix)
		FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<tier>)
		FormatText checksumname = tier_checksum 'tier%s' s = (<tier>)
		<unlocked> = 1
		if ((<unlocked> = 1) || ($is_network_game))
			GetArraySize (<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_size> > 0)
				begin
				format_globaltag_song_checksum part = (<tierlist>.part) song = (<tierlist>.<tier_checksum>.songs [<song_count>])
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> song = (<tierlist>.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title song = (<tierlist>.<tier_checksum>.songs [<song_count>])
					CreateScreenElement {
						type = TextElement
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
	if GlobalExists \{name = massive_build}
		if NOT ($massive_build = 0)
			if GotParam \{massive_secret_item}
				return
			endif
		endif
	endif
	if NOT ScreenElementExists id = <parent>
		printf qs("\Lparent %p does not extst") p = <parent>
	endif
	CreateScreenElement {
		type = TextElement
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
		hilite_dims = (<width> * (1.0, 0.0) + <Height> * (0.0, 0.7) + (20.0, -1.0))
		bookend_dims = (<Height> * (0.5, 0.5))
		hilite_pos = ((<hlInfoList> [<hlIndex>]).posH - (5.0, 0.0))
		SetScreenElementProps {
			id = <wthlID>
			pos = <hilite_pos>
			dims = <hilite_dims>
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be1ID>
			pos = (<hilite_pos> - <bookend_dims>.(1.0, 0.0) * (0.6, 0.0) + <Height> * (0.0, 0.1))
			dims = <bookend_dims>
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be2ID>
			pos = (<hilite_pos> + (<hilite_dims>.(1.0, 0.0) * (1.0, 0.0)) + <Height> * (0.0, 0.1) - (<bookend_dims>.(1.0, 0.0) * (0.1, 0.0)))
			dims = <bookend_dims>
			z_priority = <zPri>
			flip_h
		}
	else
		SetScreenElementProps {
			id = <be1ID>
			pos = ((<hlInfoList> [<hlIndex>]).posL)
			dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <be2ID>
			pos = ((<hlInfoList> [<hlIndex>]).posR)
			dims = ((<hlInfoList> [<hlIndex>]).beDims)
			z_priority = <zPri>
		}
		SetScreenElementProps {
			id = <wthlID>
			pos = ((<hlInfoList> [<hlIndex>]).posH)
			dims = ((<hlInfoList> [<hlIndex>]).hdims)
			z_priority = <zPri>
		}
	endif
endscript

script glow_menu_element \{time = 1}
	if NOT ScreenElementExists id = <id>
		return
	endif
	Wait RandomInteger (0.0, 2.0) seconds
	begin
	<id> :LegacyDoMorph alpha = 1 time = <time> motion = smooth
	<id> :LegacyDoMorph alpha = 0 time = <time> motion = smooth
	repeat
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script isSinglePlayerGame 
	GameMode_GetProperty \{prop = singleplayer}
	return <singleplayer>
endscript

script create_pause_menu \{player = 1
		for_options = 0
		for_practice = 0}
	player_device = ($last_start_pressed_device)
	i = 1
	begin
	GetPlayerInfo <i> controller
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
			type = SpriteElement
			parent = pause_menu_frame_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
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
					<pause_player_text> = qs("PAUSED")
				else
					if NOT isSinglePlayerGame
						FormatText TextName = pause_player_text qs("P%d PAUSED") d = <player>
					else
						<pause_player_text> = qs("PAUSED")
					endif
				endif
				pause_player_scale = (0.6, 0.75)
			else
				pause_player_text = qs("OPTIONS")
				pause_player_scale = (0.75, 0.75)
			endif
		endif
	endif
	CreateScreenElement {
		type = TextElement
		parent = <id>
		text = <pause_player_text>
		font = fontgrid_text_a3
		pos = (125.0, 53.0)
		scale = <pause_player_scale>
		rgba = [170 90 30 255]
		scale = 0.8
	}
	text_scale = (0.9, 0.9)
	if (<for_options> = 0 && <for_practice> = 0)
		CreateScreenElement {
			type = ContainerElement
			parent = pause_menu_frame_container
			id = bunny_container
			pos = (380.0, 170.0)
			just = [left top]
			z_priority = <pause_z>
		}
		i = 1
		begin
		FormatText checksumname = bunny_id 'pause_bunny_flame_%d' d = <i>
		FormatText checksumname = bunny_tex 'Menu_Pause_Bunny_Flame0%d' d = <i>
		CreateScreenElement {
			type = SpriteElement
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
			LegacyDoScreenElementMorph id = <bunny_id> alpha = 0
		endif
		<i> = (<i> + 1)
		repeat 7
		CreateScreenElement {
			type = SpriteElement
			id = pause_bunny_shadow
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [0 0 0 128]
			pos = (20.0, -110.0)
			dims = (550.0, 550.0)
			just = [center top]
			z_priority = (<pause_z> + 4)
		}
		CreateScreenElement {
			type = SpriteElement
			id = pause_bunny
			parent = bunny_container
			texture = menu_pause_bunny
			rgba = [255 255 255 255]
			pos = (0.0, -130.0)
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
	container_params = {type = ContainerElement parent = current_menu dims = (0.0, 100.0)}
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_start_again
				text = qs("START AGAIN")
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_segment}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_segment}}
					{pad_choose paused_special_event_quit_segment}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_segment
				text = qs("QUIT SEGMENT")
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_quit_challenge}}
					{unfocus retail_menu_unfocus params = {id = pause_quit_challenge}}
					{pad_choose paused_special_event_quit_challenge}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit_challenge
				text = qs("QUIT CHALLENGE")
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
			continue_practicing_text = qs("CONTINUE PRACTICING")
			if ($special_event_stage = 2)
				<continue_practicing_text> = qs("RESUME TEST")
			endif
			CreateScreenElement {
				type = TextElement
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
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
					type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					id = pause_take_test
					text = qs("TAKE THE TEST")
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_quit
				text = qs("QUIT")
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((400.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				id = pause_resume
				text = qs("RESUME")
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_restart}}
					{unfocus retail_menu_unfocus params = {id = pause_restart}}
					{pad_choose generic_event_choose params = {state = uistate_pausemenu_restart_warning}}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("RESTART")
				id = pause_restart
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_options}}
					{unfocus retail_menu_unfocus params = {id = pause_options}}
					{pad_choose generic_event_choose params = {data = {state = UIstate_pausemenu for_options = 1}}}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("OPTIONS")
				id = pause_options
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_speed}}
					{unfocus retail_menu_unfocus params = {id = pause_change_speed}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs("CHANGE SPEED") option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = uistate_practice_select_speed}}}}}}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("CHANGE SPEED")
				id = pause_change_speed
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				<container_params>
				event_handlers = [
					{focus retail_menu_focus params = {id = pause_change_section}}
					{unfocus retail_menu_unfocus params = {id = pause_change_section}}
					{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs("CHANGE SECTION") option2_func = {quit_warning_select_quit params = {callback = generic_event_back data = {state = UIstate_practice_select_part}}}}}}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("CHANGE SECTION")
				id = pause_change_section
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			if ($came_to_practice_from = main_menu)
				CreateScreenElement {
					<container_params>
					event_handlers = [
						{focus retail_menu_focus params = {id = pause_new_song}}
						{unfocus retail_menu_unfocus params = {id = pause_new_song}}
						{pad_choose generic_event_choose params = {data = {state = uistate_pausemenu_quit_warning option2_text = qs("NEW SONG") option2_func = {quit_warning_select_quit params = {callback = song_ended_menu_select_new_song}}}}}
					]
				}
				CreateScreenElement {
					type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs("NEW SONG")
					id = pause_new_song
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
				GetScreenElementDims id = <id>
				fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("QUIT")
				id = pause_quit
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((300.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			add_user_control_helper \{text = qs("SELECT")
				button = green
				z = 100000}
		else
			if English
			else
				container_params = {type = ContainerElement parent = current_menu dims = (0.0, 105.0)}
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("RESUME")
				id = pause_resume
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
						type = TextElement
						parent = <id>
						font = fontgrid_title_a1
						scale = <text_scale>
						rgba = ($menu_unfocus_color)
						text = qs("RESTART")
						id = pause_restart
						just = [center top]
						shadow
						shadow_offs = (3.0, 3.0)
						shadow_rgba [0 0 0 255]
						z_priority = <pause_z>
						exclusive_device = <player_device>
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> dims = ((250.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
								type = TextElement
								parent = <id>
								font = fontgrid_title_a1
								scale = <text_scale>
								rgba = ($menu_unfocus_color)
								text = qs("PRACTICE")
								id = pause_practice
								just = [center top]
								shadow
								shadow_offs = (3.0, 3.0)
								shadow_rgba [0 0 0 255]
								z_priority = <pause_z>
								exclusive_device = <player_device>
							}
							GetScreenElementDims id = <id>
							fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
						endif
						CreateScreenElement {
							<container_params>
							event_handlers = [
								{focus retail_menu_focus params = {id = pause_options}}
								{unfocus retail_menu_unfocus params = {id = pause_options}}
								{pad_choose generic_event_choose params = {data = {state = UIstate_pausemenu for_options = 1}}}
							]
						}
						CreateScreenElement {
							type = TextElement
							parent = <id>
							font = fontgrid_title_a1
							scale = <text_scale>
							rgba = ($menu_unfocus_color)
							text = qs("OPTIONS")
							id = pause_options
							just = [center top]
							shadow
							shadow_offs = (3.0, 3.0)
							shadow_rgba [0 0 0 255]
							z_priority = <pause_z>
							exclusive_device = <player_device>
						}
						GetScreenElementDims id = <id>
						fit_text_in_rectangle id = <id> dims = ((260.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
					endif
				endif
			endif
			quit_script = generic_event_choose
			quit_script_params = {state = uistate_pausemenu_quit_warning}
			if ($is_network_game = 1)
				quit_script = select_quit_network_game
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
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("QUIT")
				id = pause_quit
				just = [center top]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = ((270.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
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
					type = TextElement
					parent = <id>
					font = fontgrid_title_a1
					scale = <text_scale>
					rgba = ($menu_unfocus_color)
					text = qs("\LDEBUG MENU")
					id = pause_debug_menu
					just = [center top]
					shadow
					shadow_offs = (3.0, 3.0)
					shadow_rgba [0 0 0 255]
					z_priority = <pause_z>
					exclusive_device = <player_device>
				}
			endif
			add_user_control_helper \{text = qs("SELECT")
				button = green
				z = 100000}
		endif
	else
		<fit_dims> = (400.0, 0.0)
		CreateScreenElement \{type = ContainerElement
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
			type = TextElement
			parent = <id>
			font = fontgrid_title_a1
			scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs("SET AUDIO")
			id = options_audio
			just = [center center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		CreateScreenElement {
			type = ContainerElement
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
			type = TextElement
			parent = <id>
			font = fontgrid_title_a1
			scale = <text_scale>
			rgba = ($menu_unfocus_color)
			text = qs("CALIBRATE LAG")
			id = options_calibrate_lag
			just = [center center]
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba [0 0 0 255]
			z_priority = <pause_z>
			exclusive_device = <player_device>
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		if IsGuitarController controller = <player_device>
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
			CreateScreenElement {
				type = ContainerElement
				parent = current_menu
				dims = (0.0, 100.0)
				event_handlers = [
					{focus retail_menu_focus params = {id = options_calibrate_guitar_sensors}}
					{focus generic_menu_up_or_down_sound}
					{unfocus retail_menu_unfocus params = {id = options_calibrate_guitar_sensors}}
					{pad_choose generic_event_choose params = {state = uistate_options_controller_sensors data = {player = <player> controller = <player_device> popup = 1}}}
				]
			}
			CreateScreenElement {
				type = TextElement
				parent = <id>
				font = fontgrid_title_a1
				scale = <text_scale>
				rgba = ($menu_unfocus_color)
				text = qs("CALIBRATE GUITAR SENSORS")
				id = options_calibrate_guitar_sensors
				just = [center center]
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba [0 0 0 255]
				z_priority = <pause_z>
				exclusive_device = <player_device>
			}
			GetScreenElementDims id = <id>
			fit_text_in_rectangle id = <id> dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		endif
		if isSinglePlayerGame
			lefty_flip_text = qs("LEFTY FLIP:")
		else
			if (<player> = 1)
				lefty_flip_text = qs("P1 LEFTY FLIP:")
			else
				lefty_flip_text = qs("P2 LEFTY FLIP:")
			endif
		endif
		CreateScreenElement \{type = ContainerElement
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
			type = TextElement
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
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (<fit_dims> + <Height> * (0.0, 1.0)) only_if_larger_x = 1 start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
		GetGlobalTags \{user_options}
		if (<player> = 1)
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
		<id> :SE_SetProps pos = (<width> * (0.5, 0.0) + (22.0, 0.0))
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100000}
	endif
	if ($is_network_game = 0)
		if NOT isSinglePlayerGame
			if (<for_practice> = 0)
				FormatText TextName = player_paused_text qs("PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE.") d = <player>
				displaySprite {
					parent = pause_menu_frame_container
					id = pause_helper_text_bg
					tex = helper_pill_body
					pos = (640.0, 600.0)
					just = [center center]
					rgba = [96 0 0 255]
					z = (<pause_z> + 10)
				}
				displayText {
					parent = pause_menu_frame_container
					pos = (640.0, 604.0)
					just = [center center]
					text = <player_paused_text>
					rgba = [186 105 0 255]
					scale = (0.45000002, 0.6)
					z = (<pause_z> + 11)
					font = fontgrid_text_a3
				}
				GetScreenElementDims id = <id>
				bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
				pause_helper_text_bg :SE_SetProps dims = <bg_dims>
				displaySprite {
					parent = pause_menu_frame_container
					tex = helper_pill_end
					pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
					rgba = [96 0 0 255]
					just = [right center]
					flip_v
					z = (<pause_z> + 10)
				}
				displaySprite {
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
	RequireParams \{[
			player
		]
		all}
	ResetScoreUpdateReady
	vocals_get_highway_view player = <player>
	<vocals_highway_view> = <highway_view>
	if (<vocals_highway_view> = static)
		<vocals_highway_view> = scrolling
	else
		<vocals_highway_view> = static
	endif
	vocals_set_highway_view player = <player> view = <vocals_highway_view> controller = <device_num>
	if IsPs3
		i = 1
		begin
		vocals_set_highway_view player = <i> view = <vocals_highway_view> controller = <device_num>
		i = (<i> + 1)
		repeat 4
	endif
	if IsObjectScript
		Obj_GetID
		if (<vocals_highway_view> = static)
			SoundEvent \{event = checkbox_sfx}
			<ObjID> :SE_SetProps check_alpha = 0
			<ObjID> :SE_SetProps cross_alpha = 0
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<ObjID> :SE_SetProps check_alpha = 1
			<ObjID> :SE_SetProps cross_alpha = 0
		endif
	endif
	if NOT GotParam \{no_restart}
		GH3_SFX_fail_song_stop_sounds
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
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo player = <player> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		<vocals_sp_clap> = 0
	else
		<vocals_sp_clap> = 1
	endif
	vocals_set_star_power_clap player = <player> clap = <vocals_sp_clap> controller = <device_num>
	if IsPs3
		i = 1
		begin
		vocals_set_star_power_clap player = <i> clap = <vocals_sp_clap> controller = <device_num>
		i = (<i> + 1)
		repeat 4
	endif
	if IsObjectScript
		Obj_GetID
		if GotParam \{checkbox_child}
			child = <checkbox_child>
		else
			child = check
		endif
		if (<vocals_sp_clap> = 0)
			SoundEvent \{event = checkbox_sfx}
			<ObjID> :SE_SetProps check_alpha = 0
			<ObjID> :SE_SetProps cross_alpha = 0
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<ObjID> :SE_SetProps check_alpha = 1
			<ObjID> :SE_SetProps cross_alpha = 0
		endif
	endif
endscript

script options_change_tilt_star_power 
	GetPlayerInfo <player> use_tilt_for_starpower
	GetPlayerInfo <player> checksum
	if (<use_tilt_for_starpower> = 1)
		SoundEvent \{event = checkbox_sfx}
		SetPlayerInfo <player> use_tilt_for_starpower = 0
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = Options_Controller_X
	else
		SoundEvent \{event = CheckBox_Check_SFX}
		SetPlayerInfo <player> use_tilt_for_starpower = 1
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = Options_Controller_Check
	endif
	if IsObjectScript
		Obj_GetID
		if ResolveScreenElementId id = {<ObjID> child = tilt_check}
			<resolved_id> :SetProps texture = <new_texture>
		else
			if (<use_tilt_for_starpower> = 1)
				<use_tilt_for_starpower> = 0
				SoundEvent \{event = checkbox_sfx}
				if GotParam \{popup}
					<ObjID> :SE_SetProps check_alpha = 0
					<ObjID> :SE_SetProps cross_alpha = 0
				else
					<ObjID> :SE_SetProps check_alpha = 0
					<ObjID> :SE_SetProps cross_alpha = 0
				endif
			else
				<use_tilt_for_starpower> = 1
				SoundEvent \{event = CheckBox_Check_SFX}
				if GotParam \{popup}
					<ObjID> :SE_SetProps check_alpha = 1
					<ObjID> :SE_SetProps cross_alpha = 0
				else
					<ObjID> :SE_SetProps check_alpha = 1
					<ObjID> :SE_SetProps cross_alpha = 0
				endif
			endif
		endif
	endif
endscript

script options_change_touch_strip_option 
	GetPlayerInfo <player> enable_touch_strip
	GetPlayerInfo <player> checksum
	if (<enable_touch_strip> = 1)
		SoundEvent \{event = checkbox_sfx}
		SetPlayerInfo <player> enable_touch_strip = 0
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = Options_Controller_X
	else
		SoundEvent \{event = CheckBox_Check_SFX}
		SetPlayerInfo <player> enable_touch_strip = 1
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = Options_Controller_Check
	endif
	if IsObjectScript
		Obj_GetID
		if ResolveScreenElementId id = {<ObjID> child = touch_check}
			<resolved_id> :SetProps texture = <new_texture>
		else
			if (<enable_touch_strip> = 1)
				<enable_touch_strip> = 0
				SoundEvent \{event = checkbox_sfx}
				if GotParam \{popup}
					<ObjID> :SE_SetProps check_alpha = 0
					<ObjID> :SE_SetProps cross_alpha = 0
				else
					<ObjID> :SE_SetProps check_alpha = 0
					<ObjID> :SE_SetProps cross_alpha = 0
				endif
			else
				<enable_touch_strip> = 1
				SoundEvent \{event = CheckBox_Check_SFX}
				if GotParam \{popup}
					<ObjID> :SE_SetProps check_alpha = 1
					<ObjID> :SE_SetProps cross_alpha = 0
				else
					<ObjID> :SE_SetProps check_alpha = 1
					<ObjID> :SE_SetProps cross_alpha = 0
				endif
			endif
		endif
	endif
endscript

script animate_bunny_flame 
	begin
	swap_bunny_flame
	Wait \{0.1
		second}
	repeat
endscript

script bunny_hover 
	if NOT ScreenElementExists \{id = bunny_container}
		return
	endif
	i = 1
	begin
	FormatText checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	if NOT ScreenElementExists id = <bunnyid>
		return
	else
		SetScreenElementProps id = <bunnyid> pos = <flame_origin>
	endif
	<i> = (<i> + 1)
	repeat 7
	begin
	bunny_container :LegacyDoMorph \{pos = (360.0, 130.0)
		time = 1
		rot_angle = -25
		scale = 1.05
		motion = ease_out}
	bunny_container :LegacyDoMorph \{pos = (390.0, 170.0)
		time = 1
		rot_angle = -20
		scale = 0.95
		motion = ease_in}
	bunny_container :LegacyDoMorph \{pos = (360.0, 130.0)
		time = 1
		rot_angle = -15
		scale = 1.05
		motion = ease_out}
	bunny_container :LegacyDoMorph \{pos = (390.0, 170.0)
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
	KillSpawnedScript \{name = animate_bunny_flame}
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
		change \{g_anim_flame = -1}
	elseif GotParam \{down}
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
	FormatText \{checksumname = bunnyid
		'pause_bunny_flame_%d'
		d = $bunny_flame_index}
	if ScreenElementExists id = <bunnyid>
		LegacyDoScreenElementMorph id = <bunnyid> alpha = 1
	endif
endscript

script reset_bunny_alpha 
	i = 1
	begin
	FormatText checksumname = bunnyid 'pause_bunny_flame_%d' d = <i>
	if ScreenElementExists id = <bunnyid>
		LegacyDoScreenElementMorph id = <bunnyid> alpha = 0
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
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = menu_backdrop_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement {
		type = SpriteElement
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
	if ($guitar_motion_enable_test = 1)
		<alpha> = 0
	else
		<alpha> = 1
	endif
	CreateScreenElement {
		type = ContainerElement
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
		CreateScreenElement {
			type = SpriteElement
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
		CreateScreenElement {
			type = WindowElement
			parent = <container_id>
			id = pause_menu_scrolling_bg_01
			pos = (642.0, 360.0)
			dims = ((508.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			just = [center center]
			z_priority = (<z> - 1)
		}
		TileSprite \{parent = pause_menu_scrolling_bg_01
			tile_dims = (980.0, 910.0)
			pos = (0.0, 0.0)
			texture = menu_pause_bg_tile}
		RunScriptOnScreenElement TileSpriteLoop id = <id> params = {move_x = -2 move_y = -2}
	else
		CreateScreenElement {
			type = SpriteElement
			id = frame_background
			parent = <container_id>
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			just = [center center]
			dims = ((520.0, 0.0) * <x_scale> + (0.0, 340.0) * <y_scale>)
			z_priority = (<z> - 1)
		}
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
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
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_2
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_3>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
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
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [255 255 255 255]
		pos = (<center_pos>)
		scale = <scale_4>
		just = [bottom left]
		z_priority = (<z> + 2)
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [bottom right]
		z_priority = (<z> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = menu_pause_frame_1
		rgba = [0 0 0 255]
		pos = (<center_pos>)
		scale = <scale_5>
		just = [top right]
		z_priority = (<z> + 2)
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
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
	CreateScreenElement {
		type = SpriteElement
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
	200
	200
	200
	255
]
default_menu_unfocus_color = [
	100
	100
	100
	255
]
menu_focus_color = [
	200
	200
	200
	255
]
menu_unfocus_color = [
	100
	100
	100
	255
]

script set_focus_color \{rgba = $default_menu_focus_color}
	change menu_focus_color = <rgba>
endscript

script set_unfocus_color \{rgba = $default_menu_unfocus_color}
	change menu_unfocus_color = <rgba>
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
	return {scale = <scale>}
endscript

script fit_text_convert_legacy_params 
	if (<keep_ar> = 1)
		<preserve_aspect_ratio> = true
	else
		<preserve_aspect_ratio> = false
	endif
	if (<only_if_larger_x> = 1)
		RemoveParameter \{only_if_larger_x}
		<only_if_larger_x> = true
	else
		RemoveParameter \{only_if_larger_x}
		<only_if_larger_x> = false
	endif
	if GotParam \{start_x_scale}
		<factor_start_scale> = true
	elseif GotParam \{start_y_scale}
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
	if NOT GotParam \{id}
		ScriptAssert \{qs("\LNo id passed to fit_text_in_rectangle!")}
	endif
	fit_text_convert_legacy_params <...>
	<id> :SE_FitToDims {
		dims = <dims>
		factor_start_scale = <factor_start_scale>
		preserve_aspect_ratio = <preserve_aspect_ratio>
		only_if_larger_x = <only_if_larger_x>
		only_if_larger_y = false
	}
	if GotParam \{pos}
		SetScreenElementProps id = <id> pos = <pos>
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
	if ScreenElementExists \{id = user_control_container}
		DestroyScreenElement \{id = user_control_container}
	endif
	if ScreenElementExists \{id = custom_setlist_continue_helper}
		DestroyScreenElement \{id = custom_setlist_continue_helper}
	endif
	if ScreenElementExists \{id = custom_setlist_continue_pill}
		DestroyScreenElement \{id = custom_setlist_continue_pill}
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
	if GotParam \{controller}
		if (<controller> < 0)
			RemoveParameter \{controller}
		endif
	endif
	if NOT GotParam \{controller}
		controller = $primary_controller
		if NOT (<controller> = $last_start_pressed_device)
			controller = $last_start_pressed_device
		endif
	endif
	if NOT (<controller> < 0)
		if NOT ((IsGuitarController controller = <controller>) || (IsDrumController controller = <controller>))
			GetActiveControllers
			GetArraySize <active_controllers>
			if (<controller> < <array_size>)
				if (<active_controllers> [<controller>] = 1)
					standard = 1
				endif
			endif
		elseif IsDrumController controller = <controller>
			drum = 1
		endif
	endif
	GetEnterButtonAssignment
	button_size = 1.0
	if GotParam \{button}
		switch (<button>)
			case green
			buttonchar = qs("\L\m0")
			if GotParam \{standard}
				buttonchar = qs("\L\m5")
			endif
			if IsPs3
				if GotParam \{drum}
					buttonchar = qs("\L\m5")
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\b3\b4")
				if (<assignment> = circle)
					buttonchar = qs("\L\b2\b5")
				endif
			endif
			case red
			buttonchar = qs("\L\m1")
			if GotParam \{standard}
				buttonchar = qs("\L\m6")
			endif
			if IsPs3
				if GotParam \{drum}
					buttonchar = qs("\L\m6")
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\b2\b5")
				if (<assignment> = circle)
					buttonchar = qs("\L\b3\b4")
				endif
			endif
			case Yellow
			buttonchar = qs("\L\b6")
			if GotParam \{standard}
				buttonchar = qs("\L\b0")
			endif
			if IsPs3
				if GotParam \{drum}
					buttonchar = qs("\L\b0")
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\b0\b6")
			endif
			case Blue
			buttonchar = qs("\L\b7")
			if GotParam \{standard}
				buttonchar = qs("\L\b1")
			endif
			if IsPs3
				if GotParam \{drum}
					buttonchar = qs("\L\b1")
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\b1\b7")
			endif
			case Orange
			buttonchar = qs("\L\b8")
			if GotParam \{standard}
				buttonchar = qs("\L\bi")
			elseif GotParam \{drum}
				buttonchar = qs("\L\bq")
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\b8\bi\bq")
			endif
			case strumbar
			buttonchar = qs("\L\md")
			case back
			buttonchar = qs("\L\b9")
			if GotParam \{standard}
				buttonchar = qs("\L\bo")
				if IsPs3
					button_size = 1.5
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\bo")
			endif
			case start
			buttonchar = qs("\L\ba")
			if GotParam \{standard}
				buttonchar = qs("\L\bp")
				if IsPs3
					button_size = 1.5
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs("\L\bp")
			endif
			case LB
			buttonchar = qs("\L\bi")
			case RB
			buttonchar = qs("\L\bj")
			case LT
			buttonchar = qs("\L\bk")
			case RT
			buttonchar = qs("\L\bl")
			case LBRB
			buttonchar = qs("\L\bi\bj")
			case pad_left
			buttonchar = qs("\L\be")
			case DRUM_GREEN
			buttonchar = qs("\L\br")
		endswitch
	else
		buttonchar = qs("\L")
	endif
	return {buttonchar = <buttonchar> button_size = <button_size>}
endscript

script should_use_all_buttons 
	get_all_exclusive_devices
	if NOT GotParam \{exclusive_device}
		return \{false}
	endif
	<standard_buttons> = false
	<guitar_buttons> = false
	<i> = 0
	begin
	if IsGuitarController controller = (<exclusive_device> [<i>])
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

script pulsate_helper_pill \{time = 1
		delay_time = 1}
	RequireParams \{[
			id
		]
		all}
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	Wait <delay_time> seconds ignoreslomo
	begin
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			alpha = 0.5
			time = <time>
		}
		Wait <time> seconds ignoreslomo
		if ScreenElementExists id = <id>
			<id> :SE_SetProps {
				alpha = 1
				time = <time>
			}
			Wait <time> seconds ignoreslomo
		else
			return
		endif
	else
		return
	endif
	repeat
endscript

script add_gamertag_helper 
	if NOT GotParam \{exclusive_device}
		return
	endif
	if NOT IsArray <exclusive_device>
		if NOT IsChecksum <exclusive_device>
			if NOT ((<exclusive_device> < 0) || (<exclusive_device> > 3))
				FormatText TextName = caption qs("Controller %d") d = (<exclusive_device> + 1)
				if isXenon
					if GetLocalGamerTag controller = <exclusive_device>
						if NOT (<gamertag> = qs("\L"))
							caption = <gamertag>
						endif
					endif
				endif
				if IsGuitarController controller = <exclusive_device>
					icon_texture = mixer_icon_guitar
					get_player_num_from_controller controller_index = <exclusive_device>
					if NOT (<player_num> = -1)
						GetPlayerInfo <player_num> part
						if (<part> = Bass)
							icon_texture = mixer_icon_bass
						endif
					endif
				elseif IsDrumController controller = <exclusive_device>
					icon_texture = mixer_icon_drums
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
	pos = (825.0, -77.0)
	anchor = [left bottom]
	alpha = 1
	body_alpha = 1
	justify = [left center]
	if GotParam \{override_pos_to}
		pos = <override_pos_to>
	endif
	if GotParam \{override_anchor_to}
		anchor = <override_anchor_to>
	endif
	if GotParam \{override_alpha_to}
		alpha = <override_alpha_to>
	endif
	if GotParam \{override_body_alpha_to}
		body_alpha = <override_body_alpha_to>
	endif
	if GotParam \{override_justify_to}
		justify = <override_justify_to>
	endif
	if NOT ScreenElementExists \{id = user_control_container}
		CreateScreenElement {
			id = user_control_container
			parent = root_window
			type = DescInterface
			desc = 'helper_pills'
			dims = (512.0, 36.0)
			pos = <pos>
			pos_anchor = <anchor>
			alpha = <alpha>
			just = <justify>
			internal_just = <justify>
			isVertical = false
			fit_major = `fit content if larger`
			fit_minor = `keep dims`
			spacing_between = 10
			z_priority = <z>
		}
		if <id> :Desc_ResolveAlias name = alias_helper_pill_menu
			AssignAlias id = <resolved_id> alias = helper_pills_menu
		endif
	endif
	if GotParam \{gamertag}
		CreateScreenElement {
			parent = helper_pills_menu
			type = DescInterface
			desc = 'helper_gamertag_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_texture = <icon_texture>
			helper_description_text = <gamertag>
			helper_pill_rgba = [200 200 200 255]
			helper_description_rgba = [120 180 150 255]
		}
	else
		user_control_helper_get_buttonchar <...> button = <button>
		CreateScreenElement {
			parent = helper_pills_menu
			type = DescInterface
			desc = 'helper_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_text = <buttonchar>
			helper_description_text = <text>
			helper_pill_rgba = [200 200 200 255]
			helper_description_rgba = [200 200 200 255]
		}
		<id> :button_pill_apply_relative_scale extra_button_scale = <button_size>
		if GotParam \{all_buttons}
			if <id> :Desc_ResolveAlias name = alias_helper_button
				<resolved_id> :SE_SetProps {
					metaRemapEnable = false
					text = <buttonchar>
				}
			endif
		endif
	endif
	<id> :SE_GetProps
	<id> :SE_SetProps {
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
	user_control_container :SE_GetProps
	user_control_container :SE_SetProps {
		helper_pill_body_alpha = <body_alpha>
		helper_pill_body_dims = (((1.0, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 50.0))
	}
	if (<helper_pill_menu_dims> [0] > 950)
		user_control_container :SE_SetProps scale = (950.0 / <helper_pill_menu_dims> [0])
	endif
	return helper_pill_ID = <id>
endscript

script button_pill_apply_relative_scale 
	SE_GetProps
	SE_SetProps helper_button_scale = (<helper_button_scale> * <extra_button_scale>)
endscript

script user_control_cleanup_pills 
	destroy_menu \{menu_id = user_control_super_pill_object_main}
	destroy_menu \{menu_id = user_control_super_pill_object_l}
	destroy_menu \{menu_id = user_control_super_pill_object_r}
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		FormatText checksumname = pill_id 'uc_pill_%d' d = <index>
		if ScreenElementExists id = <pill_id>
			DestroyScreenElement id = <pill_id>
		endif
		FormatText checksumname = pill_l_id 'uc_pill_l_%d' d = <index>
		if ScreenElementExists id = <pill_l_id>
			DestroyScreenElement id = <pill_l_id>
		endif
		FormatText checksumname = pill_r_id 'uc_pill_r_%d' d = <index>
		if ScreenElementExists id = <pill_r_id>
			DestroyScreenElement id = <pill_r_id>
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
endscript
action_safe_width_for_helpers = 925

script align_user_control_with_pill 
	FormatText checksumname = pill_id 'uc_pill_%d' d = <pill_index>
	fastscreenelementpos id = <pill_id> absolute
	GetScreenElementDims id = <pill_id>
	pill_midpoint_x = (<screenelementpos>.(1.0, 0.0) + 0.5 * <width>)
	align_user_control_with_x x = <pill_midpoint_x> pill_index = <pill_index>
endscript

script align_user_control_with_x 
	FormatText checksumname = textid 'uc_text_%d' d = <pill_index>
	FormatText checksumname = buttonid 'uc_button_%d' d = <pill_index>
	fastscreenelementpos id = <buttonid> absolute
	top_left = <screenelementpos>
	button_pos = <screenelementpos>
	fastscreenelementpos id = <textid> absolute
	bottom_right = <screenelementpos>
	text_pos = <screenelementpos>
	GetScreenElementDims id = <textid>
	bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <Height>)
	pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
	text_button_midpoint = (<top_left>.(1.0, 0.0) + 0.5 * <pill_width>)
	midpoint_diff = (<text_button_midpoint> - <x>)
	new_button_pos = (<button_pos> - (1.0, 0.0) * <midpoint_diff>)
	new_text_pos = (<text_pos> - (1.0, 0.0) * <midpoint_diff>)
	SetScreenElementProps id = <textid> pos = <new_text_pos>
	SetScreenElementProps id = <buttonid> pos = <new_button_pos>
endscript

script fastscreenelementpos 
	GetScreenElementProps id = <id>
	return screenelementpos = <pos>
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
	diff_completion_text = [qs("\L") qs("\L") qs("\L") qs("\L") qs("\L")]
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	percentage_complete = 0
	difficulty_index = 0
	GetArraySize ($difficulty_list)
	diff_size = <array_size>
	begin
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	songs_score = 0
	num_songs = 0
	tier_num = 1
	begin
	FormatText checksumname = tier 'tier%d' d = <tier_num>
	GetArraySize ($<tier_global>.<tier>.songs)
	songlist_size = <array_size>
	song_count = 0
	begin
	format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier>.songs [<song_count>]) difficulty_index = <difficulty_index>
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
	FormatText TextName = diff_completion_string qs("%a of %b songs completed") a = <songs_completed> b = <num_songs>
	SetArrayElement ArrayName = diff_completion_text index = (<difficulty_index>) newvalue = (<diff_completion_string>)
	<percentage_complete> = (<percentage_complete> + (100 * <songs_completed>) / <num_songs>)
	SetArrayElement ArrayName = diff_completion_percentage index = (<difficulty_index>) newvalue = ((100 * <songs_completed>) / <num_songs>)
	SetArrayElement ArrayName = diff_completion_score index = (<difficulty_index>) newvalue = <songs_score>
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
	GetSpecialEventTimer
	<time> = (<time> - <time_wasted>)
	if (<time> < 0)
		<time> = 0
	endif
	SetSpecialEventTimer time = <time>
	reset_current_special_event_miss_notes
	practice_restart_song
endscript

script paused_special_event_quit_segment 
	kill_gem_scroller
	reset_score \{player_status = player1_status}
	generic_event_choose \{state = UIstate_special_event_win
		no_sound
		data = {
			quit_segment = 1
		}}
	change game_mode = ($special_event_previous_game_mode)
endscript

script paused_special_event_quit_challenge 
	kill_gem_scroller
	generic_event_back \{state = UIstate_special_events
		no_sound}
	change game_mode = ($special_event_previous_game_mode)
endscript

script ui_get_instrument_text 
	RequireParams \{[
			part
		]
		all}
	switch <part>
		case guitar
		return \{instrument_text = qs("GUITAR")}
		case Bass
		return \{instrument_text = qs("BASS")}
		case drum
		return \{instrument_text = qs("DRUMS")}
		case Vocals
		return \{instrument_text = qs("VOCALS")}
	endswitch
	SoftAssert 'uknown part %p' p = <part>
	return \{instrument_text = qs("GUITAR")}
endscript

script dim_screen 
	if ScreenElementExists \{id = dim_screen}
		DestroyScreenElement \{id = dim_screen}
	endif
	if NOT GotParam \{undim}
		CreateScreenElement \{type = SpriteElement
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
