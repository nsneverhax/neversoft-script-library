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
	if GotParam \{Color}
		if StructureContains structure = ($g_menu_colors) <Color>
			if NOT ($menu_focus_color = (($g_menu_colors).<Color>))
				Change menu_focus_color = (($g_menu_colors).<Color>)
			endif
			return
		else
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_focus_color."}
		endif
	endif
	if GotParam \{rgba}
		if NOT ($menu_focus_color = <rgba>)
			Change menu_focus_color = <rgba>
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_focus_color."}
		endif
		return
	endif
	if NOT ($menu_focus_color = (($g_menu_colors).($default_menu_focus_color)))
		Change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
		printf \{"No color specified.  Defaulting to $default_menu_focus_color."}
	endif
endscript

script set_unfocus_color 
	if GotParam \{Color}
		if StructureContains structure = ($g_menu_colors) <Color>
			if NOT ($menu_unfocus_color = (($g_menu_colors).<Color>))
				Change menu_unfocus_color = (($g_menu_colors).<Color>)
			endif
			return
		else
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_unfocus_color."}
		endif
	endif
	if GotParam \{rgba}
		if NOT ($menu_unfocus_color = <rgba>)
			Change menu_unfocus_color = <rgba>
			printf \{"Should use a color from g_menu_colors in guitar_menu.q to change the menu_unfocus_color."}
		endif
		return
	endif
	if NOT ($menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color)))
		Change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
		printf \{"No color specified.  Defaulting to $default_menu_unfocus_color."}
	endif
endscript

script reset_focus_colors 
	Change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
	Change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
endscript

script retail_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($menu_focus_color)
		endif
	else
		GetTags
		printstruct <...>
		SetScreenElementProps id = <id> rgba = ($menu_focus_color)
	endif
endscript

script retail_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($menu_unfocus_color)
		endif
	else
		GetTags
		SetScreenElementProps id = <id> rgba = ($menu_unfocus_color)
	endif
endscript

script menu_flow_go_back \{Player = 1
		create_params = {
		}
		destroy_params = {
		}}
	ui_flow_manager_respond_to_action action = go_back Player = <Player> create_params = <create_params> destroy_params = <destroy_params>
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
	if ScreenElementExists id = <scrollid>
		printf "script new_menu - %s Already exists." s = <scrollid>
		return
	endif
	if ScreenElementExists id = <vmenuid>
		printf "script new_menu - %s Already exists." s = <vmenuid>
		return
	endif
	CreateScreenElement {
		Type = VScrollingMenu
		parent = root_window
		id = <scrollid>
		just = <just>
		dims = <dims>
		Pos = <menu_pos>
		z_priority = <z>
	}
	if (<use_backdrop>)
		create_generic_backdrop
	endif
	if GotParam \{Name}
		CreateScreenElement {
			Type = TextElement
			parent = <scrollid>
			font = <font>
			Pos = (0.0, -45.0)
			Scale = <font_size>
			rgba = [210 210 210 250]
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
		padding_scale = <padding_scale>
	}
	if GotParam \{rot_angle}
		SetScreenElementProps id = <vmenuid> rot_angle = <rot_angle>
	endif
	if GotParam \{no_wrap}
		SetScreenElementProps id = <vmenuid> dont_allow_wrap
	endif
	if GotParam \{spacing}
		SetScreenElementProps id = <vmenuid> spacing_between = <spacing>
	endif
	if GotParam \{text_left}
		SetScreenElementProps id = <vmenuid> internal_just = [left top]
	endif
	if GotParam \{text_right}
		SetScreenElementProps id = <vmenuid> internal_just = [right top]
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
		setlist_prefix = ($<tierlist>.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<Tier>)
		formatText checksumName = tier_checksum 'tier%s' s = (<Tier>)
		<unlocked> = 1
		GetGlobalTags <tiername> param = unlocked
		if ((<unlocked> = 1) || ($is_network_game))
			GetArraySize ($<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_Size> > 0)
				begin
				formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = (<Tier>) AddToStringLookup = true
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					get_song_title song = ($<tierlist>.<tier_checksum>.songs [<song_count>])
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
							{pad_right <on_right> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_L3 <on_l3> params = {Tier = <Tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_Size>
			endif
		endif
		repeat ($<tierlist>.num_tiers)
	endif
	if GotParam \{focus_color}
		set_focus_color Color = <focus_color>
		<default_colors> = 0
	endif
	if GotParam \{unfocus_color}
		set_unfocus_color Color = <unfocus_color>
		<default_colors> = 0
	endif
	if (<default_colors>)
		set_focus_color Color = ($default_menu_focus_color)
		set_unfocus_color Color = ($default_menu_unfocus_color)
	endif
	if (<no_focus> = 0)
		LaunchEvent Type = focus target = <vmenuid>
	endif
endscript

script destroy_menu 
	if GotParam \{menu_id}
		if ScreenElementExists id = <menu_id>
			DestroyScreenElement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script create_play_song_menu 
endscript

script destroy_play_song_menu 
endscript

script isSinglePlayerGame 
	if ($game_mode = p1_career || $game_mode = p1_quickplay || $game_mode = training)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script create_menu_backdrop \{texture = Venue_BG
		rgba = [
			255
			255
			255
			255
		]
		z_priority = 0}
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
		Wait \{1
			gameframes}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = menu_backdrop_container
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement {
		Type = SpriteElement
		parent = menu_backdrop_container
		id = menu_backdrop
		texture = <texture>
		rgba = <rgba>
		Pos = (640.0, 360.0)
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

script fit_text_in_rectangle \{dims = (100.0, 100.0)
		just = center
		keep_ar = 0
		only_if_larger_x = 0
		only_if_larger_y = 0
		start_x_scale = 1.0
		start_y_scale = 1.0}
	if NOT GotParam \{id}
		ScriptAssert \{"No id passed to fit_text_in_rectangle!"}
	endif
	GetScreenElementDims id = <id>
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
	if GotParam \{debug_me}
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
		if GotParam \{Pos}
		endif
	endif
	scale_pair = ((1.0, 0.0) * <x_scale> * <start_x_scale> + (0.0, 1.0) * <y_scale> * <start_y_scale>)
	SetScreenElementProps {
		id = <id>
		Scale = <scale_pair>
	}
	if GotParam \{Pos}
		SetScreenElementProps id = <id> Pos = <Pos>
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
	if ScreenElementExists \{id = user_control_container}
		DestroyScreenElement \{id = user_control_container}
	endif
	Change \{user_control_pill_gap = 150}
	Change \{pill_helper_max_width = 100}
	Change \{num_user_control_helpers = 0}
	Change \{user_control_pill_color = [
			20
			20
			20
			155
		]}
	Change \{user_control_pill_text_color = [
			180
			180
			180
			255
		]}
	Change \{user_control_auto_center = 1}
	Change \{user_control_super_pill = 0}
	Change \{user_control_pill_y_position = 650}
	Change \{user_control_pill_scale = 0.4}
endscript

script add_user_control_helper \{z = 10
		pill = 1
		fit_to_rectangle = 1}
	Scale = ($user_control_pill_scale)
	Pos = ((0.0, 1.0) * ($user_control_pill_y_position))
	buttonoff = (0.0, 0.0)
	if NOT ScreenElementExists \{id = user_control_container}
		CreateScreenElement \{id = user_control_container
			Type = ContainerElement
			parent = root_window
			Pos = (0.0, 0.0)}
	endif
	if GotParam \{button}
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
		CreateScreenElement {
			Type = TextElement
			parent = user_control_container
			text = <buttonchar>
			Pos = (<Pos> + (-10.0, 8.0) * <Scale> + <buttonoff>)
			Scale = (1 * <Scale>)
			rgba = [255 255 255 255]
			font = ($gh3_button_font)
			just = [left top]
			z_priority = (<z> + 0.1)
		}
		CreateScreenElement {
			Type = TextElement
			parent = user_control_container
			text = <text>
			rgba = $user_control_pill_text_color
			Scale = (1.1 * <Scale>)
			Pos = (<Pos> + (50.0, 0.0) * <Scale> + (0.0, 20.0) * <Scale>)
			font = ($user_control_text_font)
			z_priority = (<z> + 0.1)
			just = [left top]
		}
		if (<fit_to_rectangle> = 1)
			SetScreenElementProps id = <id> Scale = (1.1 * <Scale>)
			GetScreenElementDims id = <id>
			if (<width> > $pill_helper_max_width)
				fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
			endif
		endif
	else
		if (($user_control_super_pill = 0) && ($user_control_auto_center = 0))
			CreateScreenElement {
				Type = TextElement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				Scale = (1.1 * <Scale>)
				Pos = (<Pos> + (50.0, 0.0) * <Scale> + (0.0, 20.0) * <Scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			textid = <id>
			if (<fit_to_rectangle> = 1)
				SetScreenElementProps id = <id> Scale = (1.1 * <Scale>)
				GetScreenElementDims id = <id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			CreateScreenElement {
				Type = TextElement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				Pos = (<Pos> + (-10.0, 8.0) * <Scale> + <buttonoff>)
				Scale = (1 * <Scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			buttonid = <id>
			if GotParam \{offset_for_strumbar}
				<textid> :SetTags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				SetScreenElementProps id = <textid> Pos = (<screenelementpos> + (50.0, 0.0) * <Scale>)
			else
			endif
			fastscreenelementpos id = <buttonid> absolute
			top_left = <screenelementpos>
			fastscreenelementpos id = <textid> absolute
			bottom_right = <screenelementpos>
			GetScreenElementDims id = <textid>
			bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
			pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
			pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
			pill_y_offset = (<pill_height> * 0.2)
			pill_height = (<pill_height> + <pill_y_offset>)
			<Pos> = (<Pos> + (0.0, 1.0) * (<Scale> * 3))
			CreateScreenElement {
				Type = SpriteElement
				parent = user_control_container
				texture = Control_pill_body
				dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
				Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
			CreateScreenElement {
				Type = SpriteElement
				parent = user_control_container
				texture = Control_pill_end
				dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
				rgba = ($user_control_pill_color)
				just = [right top]
				z_priority = <z>
				flip_v
			}
			CreateScreenElement {
				Type = SpriteElement
				parent = user_control_container
				texture = Control_pill_end
				dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
				Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <pill_width>)
				rgba = ($user_control_pill_color)
				just = [left top]
				z_priority = <z>
			}
		else
			formatText checksumName = textid 'uc_text_%d' d = ($num_user_control_helpers)
			CreateScreenElement {
				Type = TextElement
				parent = user_control_container
				text = <text>
				id = <textid>
				rgba = $user_control_pill_text_color
				Scale = (1.1 * <Scale>)
				Pos = (<Pos> + (50.0, 0.0) * <Scale> + (0.0, 20.0) * <Scale>)
				font = ($user_control_text_font)
				z_priority = (<z> + 0.1)
				just = [left top]
			}
			if (<fit_to_rectangle> = 1)
				SetScreenElementProps id = <id> Scale = (1.1 * <Scale>)
				GetScreenElementDims id = <id>
				if (<width> > $pill_helper_max_width)
					fit_text_in_rectangle id = <id> dims = ($pill_helper_max_width * (0.5, 0.0) + <height> * (0.0, 1.0) * $user_control_pill_scale)
				endif
			endif
			formatText checksumName = buttonid 'uc_button_%d' d = ($num_user_control_helpers)
			CreateScreenElement {
				Type = TextElement
				parent = user_control_container
				id = <buttonid>
				text = <buttonchar>
				Pos = (<Pos> + (-10.0, 8.0) * <Scale> + <buttonoff>)
				Scale = (1.2 * <Scale>)
				rgba = [255 255 255 255]
				font = ($gh3_button_font)
				just = [left top]
				z_priority = (<z> + 0.1)
			}
			if GotParam \{offset_for_strumbar}
				<textid> :SetTags is_strumbar = 1
				fastscreenelementpos id = <textid> absolute
				SetScreenElementProps id = <textid> Pos = (<screenelementpos> + (50.0, 0.0) * <Scale>)
			endif
			Change num_user_control_helpers = ($num_user_control_helpers + 1)
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
action_safe_width_for_helpers = 925

script user_control_build_pills 
	user_control_cleanup_pills
	Scale = ($user_control_pill_scale)
	index = 0
	max_pill_width = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText checksumName = textid 'uc_text_%d' d = <index>
		formatText checksumName = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		GetScreenElementDims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		if (<pill_width> > <max_pill_width>)
			<max_pill_width> = (<pill_width>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	<total_width> = (((<max_pill_width> + (<Scale> * $user_control_pill_end_width * 2)) * ($num_user_control_helpers)) + (($user_control_pill_gap * <Scale>) * ($num_user_control_helpers - 1)))
	if (<total_width> > $action_safe_width_for_helpers)
		<max_pill_width> = ((($action_safe_width_for_helpers - (($user_control_pill_gap * <Scale>) * ($num_user_control_helpers - 1))) / ($num_user_control_helpers)) - (<Scale> * $user_control_pill_end_width * 2))
	endif
	index = 0
	initial_pill_x = (640 + -1 * (($num_user_control_helpers / 2.0) * <max_pill_width>) - ((0.5 * $user_control_pill_gap * <Scale>) * ($num_user_control_helpers -1)))
	Pos = ((1.0, 0.0) * <initial_pill_x> + (0.0, 1.0) * ($user_control_pill_y_position) + (0.0, 0.8) * (<Scale>))
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText checksumName = pill_id 'uc_pill_%d' d = <index>
		formatText checksumName = pill_l_id 'uc_pill_l_%d' d = <index>
		formatText checksumName = pill_r_id 'uc_pill_r_%d' d = <index>
		formatText checksumName = textid 'uc_text_%d' d = <index>
		formatText checksumName = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		GetScreenElementDims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		pill_width = (<max_pill_width>)
		pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
		pill_y_offset = (<pill_height> * 0.2)
		pill_height = (<pill_height> + <pill_y_offset>)
		CreateScreenElement {
			Type = SpriteElement
			parent = user_control_container
			id = <pill_id>
			texture = Control_pill_body
			dims = ((1.0, 0.0) * <pill_width> + (0.0, 1.0) * <pill_height>)
			Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = user_control_container
			id = <pill_l_id>
			texture = Control_pill_end
			dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
			rgba = ($user_control_pill_color)
			just = [right top]
			z_priority = <z>
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = user_control_container
			id = <pill_r_id>
			texture = Control_pill_end
			dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
			Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <max_pill_width>)
			rgba = ($user_control_pill_color)
			just = [left top]
			z_priority = <z>
		}
		<index> = (<index> + 1)
		Pos = (<Pos> + (1.0, 0.0) * ($user_control_pill_gap * <Scale> + <max_pill_width>))
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

script user_control_build_super_pill 
	user_control_cleanup_pills
	Scale = ($user_control_pill_scale)
	index = 0
	Pos = ((0.0, 1.0) * $user_control_pill_y_position)
	leftmost = 9999.0
	rightmost = -9999.0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText checksumName = textid 'uc_text_%d' d = <index>
		formatText checksumName = buttonid 'uc_button_%d' d = <index>
		fastscreenelementpos id = <buttonid> absolute
		top_left = <screenelementpos>
		fastscreenelementpos id = <textid> absolute
		bottom_right = <screenelementpos>
		GetScreenElementDims id = <textid>
		bottom_right = (<bottom_right> + (1.0, 0.0) * <width> + (0.0, 1.0) * <height>)
		button_text_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		left_x = ((1.0, 0.0).<Pos>)
		right_x = ((1.0, 0.0).<Pos> + <button_text_width>)
		if (<left_x> < <leftmost>)
			<leftmost> = (<left_x>)
		endif
		if (<right_x> > <rightmost>)
			<rightmost> = (<right_x>)
		endif
		pill_width = ((1.0, 0.0).<bottom_right> - (1.0, 0.0).<top_left>)
		<buttonid> :SetTags calc_width = <pill_width>
		<buttonid> :SetTags calc_pos = <Pos>
		Pos = (<Pos> + (1.0, 0.0) * ($user_control_pill_gap * <Scale> * $user_control_super_pill_gap + <pill_width>))
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	whole_pill_width = (<rightmost> - <leftmost>)
	holy_midpoint_batman = (<leftmost> + 0.5 * <whole_pill_width>)
	midpoint_diff = (<holy_midpoint_batman> - 640)
	index = 0
	if NOT ($num_user_control_helpers = 0)
		begin
		formatText checksumName = textid 'uc_text_%d' d = <index>
		formatText checksumName = buttonid 'uc_button_%d' d = <index>
		<buttonid> :GetTags
		<calc_pos> = (<calc_pos> - (1.0, 0.0) * <midpoint_diff>)
		SetScreenElementProps id = <buttonid> Pos = (<calc_pos>)
		istextstrumbar id = <textid>
		if (<is_strumbar> = 0)
			SetScreenElementProps id = <textid> Pos = (<calc_pos> + (50.0, 7.0) * <Scale>)
		else
			SetScreenElementProps id = <textid> Pos = (<calc_pos> + (100.0, 7.0) * <Scale>)
		endif
		<index> = (<index> + 1)
		repeat ($num_user_control_helpers)
	endif
	pill_height = ((0.0, 1.0).<bottom_right> - (0.0, 1.0).<top_left>)
	pill_y_offset = (<pill_height> * 0.2)
	pill_height = (<pill_height> + <pill_y_offset>)
	Pos = ((1.0, 0.0) * (<leftmost> - <midpoint_diff>) + (0.0, 1.0) * $user_control_pill_y_position)
	CreateScreenElement {
		Type = SpriteElement
		parent = user_control_container
		id = user_control_super_pill_object_main
		texture = Control_pill_body
		dims = ((1.0, 0.0) * <whole_pill_width> + (0.0, 1.0) * <pill_height>)
		Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = user_control_container
		id = user_control_super_pill_object_l
		texture = Control_pill_end
		dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset>)
		rgba = ($user_control_pill_color)
		just = [right top]
		z_priority = <z>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = user_control_container
		id = user_control_super_pill_object_r
		texture = Control_pill_end
		dims = ((1.0, 0.0) * (<Scale> * $user_control_pill_end_width) + (0.0, 1.0) * <pill_height>)
		Pos = (<Pos> + (0.0, -0.5) * <pill_y_offset> + (1.0, 0.0) * <whole_pill_width>)
		rgba = ($user_control_pill_color)
		just = [left top]
		z_priority = <z>
	}
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
	pop_progression = 0
	if ($progression_pop_count = 1)
		progression_push_current
		pop_progression = 1
	endif
	diff_completion_text = ["" "" "" ""]
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	num_tiers = ($g_gh3_setlist.num_tiers)
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	Change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{UpdateAtoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formatText checksumName = tier_checksum 'tier%s' s = <tier_index>
	GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_Size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> AddToStringLookup = true
	GetGlobalTags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	formatText TextName = diff_completion_string "%a OF %b SONGS" a = <diff_songs_completed> b = <diff_num_songs>
	SetArrayElement ArrayName = diff_completion_text index = (<diff_index>) NewValue = (<diff_completion_string>)
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	Change current_difficulty = <stored_difficulty>
	if (<pop_progression> = 1)
		progression_pop_current \{UpdateAtoms = 0}
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
	Change g_gh3_setlist = <tier_global>
	difficulty_array = [easy medium hard expert]
	stored_difficulty = ($current_difficulty)
	num_tiers = ($g_gh3_setlist.num_tiers)
	percentage_complete = 0
	diff_index = 0
	begin
	diff_num_songs = 0
	diff_songs_completed = 0
	diff_songs_score = 0
	Change current_difficulty = (<difficulty_array> [<diff_index>])
	progression_pop_current \{UpdateAtoms = 0}
	tier_index = 1
	begin
	setlist_prefix = ($g_gh3_setlist.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <tier_index>
	formatText checksumName = tier_checksum 'tier%s' s = <tier_index>
	GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
	num_songs = <array_Size>
	diff_num_songs = (<diff_num_songs> + <num_songs>)
	song_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier_index> AddToStringLookup = true
	GetGlobalTags <song_checksum> params = {stars score}
	if NOT (<stars> = 0)
		<diff_songs_completed> = (<diff_songs_completed> + 1)
		<diff_songs_score> = (<diff_songs_score> + <score>)
	endif
	song_count = (<song_count> + 1)
	repeat <num_songs>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	percentage_complete = (<percentage_complete> + (100 * <diff_songs_completed>) / <diff_num_songs>)
	SetArrayElement ArrayName = diff_completion_percentage index = (<diff_index>) NewValue = ((100 * <diff_songs_completed>) / <diff_num_songs>)
	SetArrayElement ArrayName = diff_completion_score index = (<diff_index>) NewValue = <diff_songs_score>
	progression_push_current
	<diff_index> = (<diff_index> + 1)
	repeat 4
	Change current_difficulty = <stored_difficulty>
	if (<pop_progression> = 1)
		progression_pop_current \{UpdateAtoms = 0}
	endif
	return diff_completion_percentage = <diff_completion_percentage> total_percentage_complete = (<percentage_complete> / 4) diff_completion_score = <diff_completion_score>
endscript

script truncatetext \{text = "default text"
		max_chars = 8}
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if (<array_Size> >= <max_chars>)
		trunc_text = ""
		char_index = 0
		begin
		<trunc_text> = (<trunc_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <max_chars>)
			break
		endif
		if GotParam \{wordbreak}
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
	GetArraySize (<rgba1>)
	<size1> = <array_Size>
	GetArraySize (<rgba2>)
	if NOT (<size1> = <array_Size>)
		printf \{"match_rgba called with differently sized arrays!"}
		return
	endif
	<i> = 0
	begin
	if (((<rgba1>) [<i>]) != ((<rgba2>) [<i>]))
		return \{rgba_match = 0
			FALSE}
	endif
	<i> = (<i> + 1)
	repeat <size1>
	return \{rgba_match = 1
		true}
endscript
