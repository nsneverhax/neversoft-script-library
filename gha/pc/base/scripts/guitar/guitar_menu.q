gh3_button_font = buttonsxenon
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
		generic_menu_pad_back
		params = {
			callback = menu_flow_go_back
		}
	}
]
g_menu_colors = {
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
		50
		25
		40
		230
	]
	frame_rgba = [
		255
		153
		205
		255
	]
	online_fill_rgba = [
		10
		0
		30
		170
	]
}
default_menu_focus_color = pink
default_menu_unfocus_color = brown
menu_focus_color = [
	170
	80
	115
	255
]
menu_unfocus_color = [
	135
	100
	60
	255
]

script set_focus_color 
	if gotparam \{color}
		if structurecontains structure = ($g_menu_colors) <color>
			if NOT ($menu_focus_color = (($g_menu_colors).<color>))
				change menu_focus_color = (($g_menu_colors).<color>)
			endif
			return
		else
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_focus_color."}
		endif
	endif
	if gotparam \{rgba}
		if NOT ($menu_focus_color = <rgba>)
			change menu_focus_color = <rgba>
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_focus_color."}
		endif
		return
	endif
	if NOT ($menu_focus_color = (($g_menu_colors).($default_menu_focus_color)))
		change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
		printf \{"No color specified.  Defaulting to $default_menu_focus_color."}
	endif
endscript

script set_unfocus_color 
	if gotparam \{color}
		if structurecontains structure = ($g_menu_colors) <color>
			if NOT ($menu_unfocus_color = (($g_menu_colors).<color>))
				change menu_unfocus_color = (($g_menu_colors).<color>)
			endif
			return
		else
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_unfocus_color."}
		endif
	endif
	if gotparam \{rgba}
		if NOT ($menu_unfocus_color = <rgba>)
			change menu_unfocus_color = <rgba>
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_unfocus_color."}
		endif
		return
	endif
	if NOT ($menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color)))
		change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
		printf \{"No color specified.  Defaulting to $default_menu_unfocus_color."}
	endif
endscript

script reset_focus_colors 
	change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
	change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
endscript

script retail_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($menu_focus_color)
		endif
	else
		gettags
		printstruct <...>
		setscreenelementprops id = <id> rgba = ($menu_focus_color)
	endif
endscript

script retail_menu_unfocus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($menu_unfocus_color)
		endif
	else
		gettags
		setscreenelementprops id = <id> rgba = ($menu_unfocus_color)
	endif
endscript

script menu_flow_go_back \{player = 1
		create_params = {
		}
		destroy_params = {
		}}
	ui_flow_manager_respond_to_action action = go_back player = <player> create_params = <create_params> destroy_params = <destroy_params>
endscript

script new_menu \{menu_pos = $menu_pos
		event_handlers = $default_event_handlers
		use_backdrop = 0
		z = 1
		dims = (400.0, 480.0)
		font = text_a1
		font_size = 0.75
		default_colors = 1
		just = [
			left
			top
		]
		no_focus = 0
		internal_just = [
			center
			top
		]}
	if screenelementexists id = <scrollid>
		printf "script new_menu - %s Already exists." s = <scrollid>
		return
	endif
	if screenelementexists id = <vmenuid>
		printf "script new_menu - %s Already exists." s = <vmenuid>
		return
	endif
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = <scrollid>
		just = <just>
		dims = <dims>
		pos = <menu_pos>
		z_priority = <z>
	}
	if (<use_backdrop>)
		create_generic_backdrop
	endif
	if gotparam \{name}
		createscreenelement {
			type = textelement
			parent = <scrollid>
			font = <font>
			pos = (0.0, -45.0)
			scale = <font_size>
			rgba = [210 210 210 250]
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
		padding_scale = <padding_scale>
	}
	if gotparam \{rot_angle}
		setscreenelementprops id = <vmenuid> rot_angle = <rot_angle>
	endif
	if gotparam \{no_wrap}
		setscreenelementprops id = <vmenuid> dont_allow_wrap
	endif
	if gotparam \{spacing}
		setscreenelementprops id = <vmenuid> spacing_between = <spacing>
	endif
	if gotparam \{text_left}
		setscreenelementprops id = <vmenuid> internal_just = [left top]
	endif
	if gotparam \{text_right}
		setscreenelementprops id = <vmenuid> internal_just = [right top]
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
		setlist_prefix = ($<tierlist>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<tier>)
		formattext checksumname = tier_checksum 'tier%s' s = (<tier>)
		<unlocked> = 1
		getglobaltags <tiername> param = unlocked
		if ((<unlocked> = 1) || ($is_network_game))
			getarraysize ($<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_size> > 0)
				begin
				formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<tier>) addtostringlookup = true
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if issongavailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title song = ($<tierlist>.<tier_checksum>.songs [<song_count>])
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
		repeat ($<tierlist>.num_tiers)
	endif
	if gotparam \{focus_color}
		set_focus_color color = <focus_color>
		<default_colors> = 0
	endif
	if gotparam \{unfocus_color}
		set_unfocus_color color = <unfocus_color>
		<default_colors> = 0
	endif
	if (<default_colors>)
		set_focus_color color = ($default_menu_focus_color)
		set_unfocus_color color = ($default_menu_unfocus_color)
	endif
	if (<no_focus> = 0)
		launchevent type = focus target = <vmenuid>
	endif
endscript

script destroy_menu 
	if gotparam \{menu_id}
		if screenelementexists id = <menu_id>
			destroyscreenelement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script issingleplayergame 
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = training)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_menu_backdrop \{texture = venue_bg
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 0}
	if screenelementexists \{id = menu_backdrop_container}
		destroyscreenelement \{id = menu_backdrop_container}
		wait \{1
			gameframes}
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

script fit_text_in_rectangle \{dims = (100.0, 100.0)
		just = center
		keep_ar = 0
		only_if_larger_x = 0
		only_if_larger_y = 0
		start_x_scale = 1.0
		start_y_scale = 1.0}
	if NOT gotparam \{id}
		scriptassert \{"No id passed to fit_text_in_rectangle!"}
	endif
	getscreenelementdims id = <id>
	if ((<width> = 0) || (<height> = 0))
		return
	endif
	x_dim = (<dims>.(1.0, 0.0))
	y_dim = (<dims>.(0.0, 1.0))
	x_scale = (<x_dim> / <width>)
	if (<keep_ar> = 1)
		y_scale = <x_scale>
	else
		y_scale = (<y_dim> / <height>)
	endif
	if gotparam \{debug_me}
		printstruct <...>
	endif
	if (<only_if_larger_x> = 1)
		if (<x_scale> > 1)
			return
		endif
	elseif (<only_if_larger_y> = 1)
		if (<y_scale> > 1)
			return
		endif
	endif
	if (<just> = center)
		if gotparam \{pos}
		endif
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> * <start_x_scale> + (0.0, 1.0) * <y_scale> * <start_y_scale>)
	setscreenelementprops {
		id = <id>
		scale = <scale_pair>
	}
	if gotparam \{pos}
		setscreenelementprops id = <id> pos = <pos>
	endif
endscript
num_user_control_helpers = 0
user_control_text_font = fontgrid_title_gh3
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

script clean_up_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		destroyscreenelement \{id = user_control_container}
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
endscript

script add_user_control_helper \{z = 10
		pill = 1
		fit_to_rectangle = 1}
	scale = ($user_control_pill_scale)
	pos = ((0.0, 1.0) * ($user_control_pill_y_position))
	buttonoff = (0.0, 0.0)
	if NOT screenelementexists \{id = user_control_container}
		createscreenelement \{id = user_control_container
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)}
	endif
	if gotparam \{button}
		switch (<button>)
			case green
			buttonchar = "\\m0"
			case red
			buttonchar = "\\m1"
			case yellow
			buttonchar = "\\b6"
			case blue
			buttonchar = "\\b7"
			case orange
			buttonchar = "\\b8"
			case strumbar
			buttonchar = "\\bb"
			offset_for_strumbar = 1
			case start
			buttonchar = "\\ba"
			offset_for_strumbar = 1
		endswitch
	else
		buttonchar = ""
	endif
	if (<pill> = 0)
		createscreenelement {
			type = textelement
			parent = user_control_container
			text = <buttonchar>
			pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
			scale = (1 * <scale>)
			rgba = [255 255 255 255]
			font = ($gh3_button_font)
			just = [left top]
			z_priority = (<z> + 0.1)
		}
		createscreenelement {
			type = textelement
			parent = user_control_container
			text = <text>
			rgba = $user_control_pill_text_color
			scale = (1.1 * <scale>)
			pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
			font = ($user_control_text_font)
			z_priority = (<z> + 0.1)
			just = [left top]
		}
		if (<fit_to_rectangle> = 1)
			setscreenelementprops id = <id> scale = (1.1 * <scale>)
			getscreenelementdims id = <id>
			if (<width> > $pill_helper_max_width)
				fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
			endif
		endif
	else
		if (($user_control_super_pill = 0) && ($user_control_auto_center = 0))
			createscreenelement {
				type = textelement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			textid = <id>
			if (<fit_to_rectangle> = 1)
				setscreenelementprops id = <id> scale = (1.1 * <scale>)
				getscreenelementdims id = <id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			createscreenelement {
				type = textelement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
				scale = (1 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			buttonid = <id>
			if gotparam \{offset_for_strumbar}
				<textid> :settags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				setscreenelementprops id = <textid> pos = (<screenelementpos> + (50.0, 0.0) * <scale>)
			else
			endif
			fastscreenelementpos id = <buttonid> absolute
			top_left = <screenelementpos>
			fastscreenelementpos id = <textid> absolute
			bottom_right = <screenelementpos>
			getscreenelementdims id = <textid>
			bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
			pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
			pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
			pill_y_offset = (<pill_height> * 0.2)
			pill_height = (<pill_height> + <pill_y_offset>)
			<pos> = (<pos> + (0.0, 1.0) * (<scale> * 3))
			createscreenelement {
				type = spriteelement
				parent = user_control_container
				texture = control_pill_body
				dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
			createscreenelement {
				type = spriteelement
				parent = user_control_container
				texture = control_pill_end
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
				texture = control_pill_end
				dims = ((1.0, 0.0) * (<scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				pos = (<pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <pill_width>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
		else
			formattext checksumname = textid 'uc_text_%d' d = ($num_user_control_helpers)
			createscreenelement {
				type = textelement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				scale = (1.1 * <scale>)
				pos = (<pos> + (50.0, 0.0) * <scale> + (0.0, 20.0) * <scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			if (<fit_to_rectangle> = 1)
				setscreenelementprops id = <id> scale = (1.1 * <scale>)
				getscreenelementdims id = <id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			formattext checksumname = buttonid 'uc_button_%d' d = ($num_user_control_helpers)
			createscreenelement {
				type = textelement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				pos = (<pos> + (-10.0, 8.0) * <scale> + <buttonoff>)
				scale = (1.2 * <scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			if gotparam \{offset_for_strumbar}
				<textid> :settags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				setscreenelementprops id = <textid> pos = (<screenelementpos> + (50.0, 0.0) * <scale>)
			endif
			change num_user_control_helpers = ($num_user_control_helpers + 1)
		endif
	endif
	if ($user_control_super_pill = 1)
		user_control_build_super_pill z = <z>
	elseif ($user_control_auto_center = 1)
		user_control_build_pills z = <z>
	endif
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
			texture = control_pill_body
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
			texture = control_pill_end
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
			texture = control_pill_end
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
		texture = control_pill_body
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
		texture = control_pill_end
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
		texture = control_pill_end
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
	pop_progression = 0
	if ($progression_pop_count = 1)
		progression_push_current
		pop_progression = 1
	endif
	diff_completion_text = ["" "" "" ""]
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	num_tiers = ($g_gh3_setlist.num_tiers)
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{updateatoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formattext checksumname = tier_checksum 'tier%s' s = <tier_index>
	getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> addtostringlookup = true
	getglobaltags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	formattext textname = diff_completion_string "%a OF %b SONGS" a = <diff_songs_completed> b = <diff_num_songs>
	setarrayelement arrayname = diff_completion_text index = (<diff_index>) newvalue = (<diff_completion_string>)
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	change current_difficulty = <stored_difficulty>
	if (<pop_progression> = 1)
		progression_pop_current \{updateatoms = 0}
	endif
	return diff_completion_text = <diff_completion_text>
endscript

script get_diff_completion_percentage 
	pop_progression = 0
	if ($progression_pop_count = 1)
		progression_push_current
		pop_progression = 1
	endif
	diff_completion_percentage = [0 0 0 0]
	diff_completion_score = [0 0 0 0]
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	num_tiers = ($g_gh3_setlist.num_tiers)
	percentage_complete = 0
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	diff_songs_score = 0
	change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{updateatoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formattext checksumname = tier_checksum 'tier%s' s = <tier_index>
	getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> addtostringlookup = true
	getglobaltags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
		<diff_songs_score> = (<diff_songs_score> + <score>)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	percentage_complete = (<percentage_complete> + (100 * <diff_songs_completed>) / <diff_num_songs>)
	setarrayelement arrayname = diff_completion_percentage index = (<diff_index>) newvalue = ((100 * <diff_songs_completed>) / <diff_num_songs>)
	setarrayelement arrayname = diff_completion_score index = (<diff_index>) newvalue = <diff_songs_score>
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	change current_difficulty = <stored_difficulty>
	if (<pop_progression> = 1)
		progression_pop_current \{updateatoms = 0}
	endif
	return diff_completion_percentage = <diff_completion_percentage> total_percentage_complete = (<percentage_complete> / 4) diff_completion_score = <diff_completion_score>
endscript

script truncatetext \{text = "default text"
		max_chars = 8}
	stringtochararray string = <text>
	getarraysize <char_array>
	if (<array_size> >= <max_chars>)
		trunc_text = ""
		char_index = 0
		begin
		<trunc_text> = (<trunc_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <max_chars>)
			break
		endif
		if gotparam \{wordbreak}
			if (((<char_array> [<char_index>]) = " ") && (<char_index> >= (<max_chars> - 5)))
				break
			endif
		endif
		repeat
		<trunc_text> = (<trunc_text> + "...")
	endif
	return trunc_text = <trunc_text>
endscript

script match_rgba \{rgba1 = [
			0
			0
			0
			255
		]
		rgba2 = [
			255
			255
			255
			255
		]}
	getarraysize (<rgba1>)
	<size1> = <array_size>
	getarraysize (<rgba2>)
	if NOT (<size1> = <array_size>)
		printf \{"match_rgba called with differently sized arrays!"}
		return
	endif
	<i> = 0
	begin
	if (((<rgba1>) [<i>]) != ((<rgba2>) [<i>]))
		return \{rgba_match = 0
			false}
	endif
	<i> = (<i> + 1)
	repeat <size1>
	return \{rgba_match = 1
		true}
endscript
