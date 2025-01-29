gh3_button_font = buttons_x360
gh3_disable_homebutton = 0
disable_homebutton_stack_count = 0

script get_home_button_allowed 
	return \{disabled = $gh3_disable_homebutton}
endscript

script set_home_button_notallowed 
	printf \{'Now Blocking Home Button presses'}
	Change \{gh3_disable_homebutton = 1}
endscript

script set_home_button_allowed 
	printf \{'Now Allowing Home Button presses'}
	Change \{gh3_disable_homebutton = 0}
endscript

script push_block_home_button 
	Change disable_homebutton_stack_count = ($disable_homebutton_stack_count + 1)
endscript

script pop_block_home_button 
	Change disable_homebutton_stack_count = ($disable_homebutton_stack_count - 1)
	if ($disable_homebutton_stack_count < 0)
		ScriptAssert \{qs(0x3f997de8)}
		Change \{disable_homebutton_stack_count = 0}
	endif
endscript
user_control_pill_color = [
	180
	180
	180
	255
]
user_control_pill_text_color = [
	0
	0
	0
	255
]
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
	gh4_focus_brownish = [
		173
		88
		5
		255
	]
	gh4_unfocus_greyish = [
		100
		88
		71
		255
	]
	gh4_jam_yellowish = [
		255
		215
		0
		255
	]
	gh4_jam_orangeish = [
		210
		130
		0
		255
	]
	grey64 = [
		64
		64
		64
		255
	]
	gh5_focus_yellowish = [
		255
		215
		0
		255
	]
	gh5_unfocus_peru = [
		205
		133
		63
		255
	]
	tomato = [
		255
		99
		71
		255
	]
	gh5_focus_white = [
		225
		225
		225
		255
	]
	gh5_unfocus_grey = [
		170
		170
		170
		200
	]
	filter_light_on = [
		92
		185
		53
		255
	]
	songlist_focus_orangeish = [
		247
		147
		29
		255
	]
	gh5_gold_md = [
		235
		187
		50
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
	pure_white = [
		255
		255
		255
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
	red175 = [
		175
		0
		0
		250
	]
	white210 = [
		210
		210
		210
		250
	]
	orange = [
		255
		128
		0
		255
	]
	dark_red5 = [
		93
		30
		28
		255
	]
	white200 = [
		200
		200
		200
		255
	]
}
default_menu_focus_color = gh5_focus_white
default_menu_unfocus_color = gh5_unfocus_grey
menu_focus_color = [
	225
	225
	225
	255
]
menu_unfocus_color = [
	170
	170
	170
	200
]

script set_focus_color 
	if GotParam \{Color}
		if StructureContains structure = ($g_menu_colors) <Color>
			if NOT ($menu_focus_color = (($g_menu_colors).<Color>))
				Change menu_focus_color = (($g_menu_colors).<Color>)
			endif
			return
		else
			printf \{qs(0x184960bb)}
		endif
	endif
	if GotParam \{rgba}
		if NOT ($menu_focus_color = <rgba>)
			Change menu_focus_color = <rgba>
			printf \{qs(0x184960bb)}
		endif
		return
	endif
	if NOT ($menu_focus_color = (($g_menu_colors).($default_menu_focus_color)))
		Change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
		printf \{qs(0x283c6323)}
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
			printf \{qs(0x6f4ce852)}
		endif
	endif
	if GotParam \{rgba}
		if NOT ($menu_unfocus_color = <rgba>)
			Change menu_unfocus_color = <rgba>
			printf \{qs(0x6f4ce852)}
		endif
		return
	endif
	if NOT ($menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color)))
		Change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
		printf \{qs(0x616f225f)}
	endif
endscript

script reset_focus_colors 
	Change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
	Change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
endscript

script retail_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :se_getprops
				<id> :SetTags old_font = <font>
			endif
			<id> :se_setprops rgba = ($menu_focus_color)
			if GotParam \{fire_font}
				SetScreenElementProps id = <id> font = fontgrid_text_a1 material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
			endif
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			se_getprops
			SetTags old_font = <font>
		endif
		SetProps rgba = ($menu_focus_color)
		if GotParam \{fire_font}
			SetProps \{font = fontgrid_text_a1
				material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire}
		endif
	endif
endscript

script retail_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :se_getprops
				<id> :SetTags old_font = <font>
				<id> :GetSingleTag old_font
			endif
			<id> :se_setprops rgba = ($menu_unfocus_color) font = <old_font> material = NULL
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			se_getprops
			SetTags old_font = <font>
			GetSingleTag \{old_font}
		endif
		SetProps rgba = ($menu_unfocus_color) font = <old_font> material = NULL
	endif
endscript

script new_menu {
		menu_pos = $menu_pos
		event_handlers = $default_event_handlers
		use_backdrop = 0
		z = 1
		dims = (400.0, 480.0)
		font = fontgrid_text_a1
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
			font = fontgrid_text_a1
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
	if GotParam \{focus_color}
		set_focus_color Color = <focus_color>
		<default_colors> = 0
	endif
	if GotParam \{unfocus_color}
		set_unfocus_color Color = <unfocus_color>
		<default_colors> = 0
	endif
	if (<default_colors>)
		reset_focus_colors
	endif
endscript

script destroy_menu \{menu_id = current_scrollmenu}
	if isngc
		viwaitforretrace
	endif
	if GotParam \{menu_id}
		if ScreenElementExists id = <menu_id>
			DestroyScreenElement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script isSinglePlayerGame 
	gamemode_getproperty \{prop = singleplayer}
	return <singleplayer>
endscript

script options_change_tilt_star_power 
	getplayerinfo <Player> use_tilt_for_starpower
	get_savegame_from_player Player = <Player>
	if (<use_tilt_for_starpower> = 1)
		setplayerinfo <Player> use_tilt_for_starpower = 0
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = box_uncheck_sfx}
	else
		setplayerinfo <Player> use_tilt_for_starpower = 1
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
	endif
	if GotParam \{icon_id}
		<icon_id> :SetProps texture = <new_texture>
	else
		if IsObjectScript
			Obj_GetID
			if ResolveScreenElementID id = {<objID> child = tilt_check}
				<resolved_id> :SetProps texture = <new_texture>
			endif
		endif
	endif
endscript

script options_change_touch_strip_option 
	getplayerinfo <Player> enable_touch_strip
	getplayerinfo <Player> checksum
	get_savegame_from_player Player = <Player>
	if (<enable_touch_strip> = 1)
		setplayerinfo <Player> enable_touch_strip = 0
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = box_uncheck_sfx}
	else
		setplayerinfo <Player> enable_touch_strip = 1
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
	endif
	if GotParam \{icon_id}
		<icon_id> :SetProps texture = <new_texture>
	else
		if IsObjectScript
			Obj_GetID
			if ResolveScreenElementID id = {<objID> child = touch_check}
				<resolved_id> :SetProps texture = <new_texture>
			endif
		endif
	endif
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
	if isngc
		viwaitforretrace
	endif
	printf \{qs(0x90c89dc2)}
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
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

script set_user_control_color \{text_rgba = [
			0
			0
			0
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

script clean_up_user_control_helpers 
	if ScreenElementExists \{id = user_control_container}
		DestroyScreenElement \{id = user_control_container}
	endif
	if ScreenElementExists \{id = custom_setlist_continue_helper}
		DestroyScreenElement \{id = custom_setlist_continue_helper}
	endif
	if ScreenElementExists \{id = calibrate_highway_user_pills_container}
		DestroyScreenElement \{id = calibrate_highway_user_pills_container}
	endif
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	set_user_control_color
endscript

script user_control_helper_get_buttonchar 
	if isxenonorwindx
		if GotParam \{all_buttons}
			RemoveParameter \{all_buttons}
			RemoveParameter \{drum}
			RemoveParameter \{standard}
		endif
	endif
	if isngc
		if GotParam \{all_buttons}
			RemoveParameter \{all_buttons}
			RemoveParameter \{drum}
			RemoveParameter \{standard}
		endif
	endif
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
	GetEnterButtonAssignment
	if GotParam \{button}
		switch (<button>)
			case green
			buttonchar = qs(0xac29f74c)
			if GotParam \{standard}
				buttonchar = qs(0xf44ae71a)
			endif
			if isps3
				if GotParam \{drum}
					buttonchar = qs(0xd15e0309)
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x2f945d94)
				if (<assignment> = circle)
					buttonchar = qs(0x74aa6ba8)
				endif
			endif
			case red
			buttonchar = qs(0xb532c60d)
			if GotParam \{standard}
				buttonchar = qs(0xed51d65b)
			endif
			if isps3
				if GotParam \{drum}
					buttonchar = qs(0xfa7350ca)
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xfa256c4b)
				if (<assignment> = circle)
					buttonchar = qs(0xa11b5a77)
				endif
			endif
			case yellow
			buttonchar = qs(0x9e1f95ce)
			if GotParam \{standard}
				buttonchar = qs(0x2a9d7f4a)
			endif
			if isps3
				if GotParam \{drum}
					buttonchar = qs(0xf44ae71a)
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xcccec22a)
			endif
			case blue
			buttonchar = qs(0x8704a48f)
			if GotParam \{standard}
				buttonchar = qs(0x9f330107)
			endif
			if isps3
				if GotParam \{drum}
					buttonchar = qs(0xed51d65b)
				endif
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x4ed0e6ba)
			endif
			case orange
			buttonchar = qs(0xc8453248)
			if GotParam \{standard}
				buttonchar = qs(0xb41e52c4)
			elseif GotParam \{drum}
				buttonchar = qs(0xc969a681)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x3cb457af)
			endif
			case strumbar
			buttonchar = qs(0x72fe6f1c)
			if GotParam \{standard}
				buttonchar = qs(0x01b02c89)
			elseif GotParam \{drum}
				buttonchar = qs(0xbf195be8)
			endif
			case back
			buttonchar = qs(0x0f899b59)
			if GotParam \{standard}
				buttonchar = qs(0x25885c53)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x42b991e3)
			endif
			case start
			buttonchar = qs(0x7deb4c05)
			if GotParam \{standard}
				buttonchar = qs(0xad056385)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x8b3bef57)
			endif
			case songlist_page
			buttonchar = qs(0x6be55e5d)
			if GotParam \{standard}
				buttonchar = qs(0xe244f542)
			elseif GotParam \{drum}
				buttonchar = qs(0x25885c53)
			endif
			case lb
			buttonchar = qs(0xb41e52c4)
			case rb
			buttonchar = qs(0xb41e52c4)
			case lt
			buttonchar = qs(0xad056385)
			case rt
			buttonchar = qs(0xe244f542)
			case lbrb
			buttonchar = qs(0x36deb537)
			case pad_left
			buttonchar = qs(0x33864e0b)
			case drum_green
			buttonchar = qs(0x0433a81f)
		endswitch
	else
		buttonchar = qs(0x03ac90f0)
	endif
	return {buttonchar = <buttonchar> controller_used = <controller>}
endscript

script should_use_all_buttons 
	get_all_exclusive_devices
	if NOT GotParam \{exclusive_device}
		return \{FALSE}
	endif
	<standard_buttons> = FALSE
	<guitar_buttons> = FALSE
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
	return \{FALSE}
endscript

script pulsate_helper_pill \{time = 1}
	RequireParams \{[
			id
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{1
		Seconds
		ignoreslomo}
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

script add_gamertag_helper 
	if NOT GotParam \{exclusive_device}
		return
	endif
	if NOT IsArray <exclusive_device>
		if NOT ischecksum <exclusive_device>
			if NOT ((<exclusive_device> < 0) || (<exclusive_device> > 3))
				formatText TextName = caption qs(0xedc03e4e) d = (<exclusive_device> + 1)
				if isxenonorwindx
					if getlocalgamertag controller = <exclusive_device>
						if NOT (<gamertag> = qs(0x03ac90f0))
							caption = <gamertag>
						endif
					endif
				endif
				get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
				if NOT (<player_num> = -1)
					getplayerinfo <player_num> part
					switch <part>
						case bass
						icon_texture = mixer_icon_bass
						case drum
						icon_texture = mixer_icon_drums
						case vocals
						icon_texture = mixer_icon_vox
						default
						icon_texture = mixer_icon_guitar
					endswitch
				else
					if IsGuitarController controller = <exclusive_device>
						icon_texture = mixer_icon_guitar
					elseif isdrumcontroller controller = <exclusive_device>
						icon_texture = mixer_icon_drums
					else
						icon_texture = mixer_icon_vox
					endif
				endif
				add_user_control_helper gamertag = <caption> icon_texture = <icon_texture> z = 100000
			endif
		endif
	endif
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
			printstruct <...>
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
		generate_helper_pill_id = true}
	if isxenonorwindx
		RemoveParameter \{all_buttons}
	endif
	if isngc
		RemoveParameter \{all_buttons}
	endif
	if NOT ScreenElementExists \{id = user_control_container}
		CreateScreenElement {
			id = user_control_container
			parent = root_window
			Type = menuelement
			dims = (1024.0, 36.0)
			Pos = (0.0, -36.0)
			pos_anchor = [center bottom]
			just = [center bottom]
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
	endif
	params_struct = {
		helper_pill_rgba = $user_control_pill_color
		helper_description_rgba = $user_control_pill_text_color
	}
	if GotParam \{gamertag}
		DestroyScreenElement \{id = gamertag_helper_pill_id}
		CreateScreenElement {
			parent = user_control_container
			id = gamertag_helper_pill_id
			Type = descinterface
			desc = 'helper_gamertag_pill'
			auto_dims = FALSE
			dims = (0.0, 36.0)
			helper_button_texture = <icon_texture>
			helper_description_text = <gamertag>
			<params_struct>
		}
		user_control_container :menu_setitemindex \{id = gamertag_helper_pill_id
			newindex = 0}
	else
		if (<generate_helper_pill_id> = true)
			ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
		endif
		if ScreenElementExists id = <helper_pill_id>
			DestroyScreenElement id = <helper_pill_id>
		endif
		if (<button> != None)
			user_control_helper_get_buttonchar <...> button = <button>
			if GotParam \{another_button}
				<buttonchar1> = <buttonchar>
				RemoveParameter \{buttonchar}
				if (<another_button> != None)
					user_control_helper_get_buttonchar <...> button = <another_button>
					<buttonchar2> = <buttonchar>
					RemoveParameter \{buttonchar}
					formatText TextName = buttonchar qs(0x28c4c672) a = <buttonchar1> b = <buttonchar2>
				endif
			endif
			AddParam structure_name = params_struct Name = helper_button_text value = <buttonchar>
		endif
		parent = user_control_container
		if GotParam \{override_parent}
			parent = <override_parent>
		endif
		if GotParam \{leader}
			CreateScreenElement {
				parent = <parent>
				id = <helper_pill_id>
				Type = descinterface
				desc = 'helper_pill_leader'
				auto_dims = FALSE
				dims = (0.0, 36.0)
				Pos = <Pos>
				pos_anchor = <pos_anchor>
				just = <just>
				Scale = <Scale>
				<params_struct>
				tags = {
					watch_controller = <controller_used>
				}
			}
		else
			CreateScreenElement {
				parent = <parent>
				id = <helper_pill_id>
				Type = descinterface
				desc = 'helper_pill'
				auto_dims = FALSE
				dims = (0.0, 36.0)
				Pos = <Pos>
				pos_anchor = <pos_anchor>
				just = <just>
				Scale = <Scale>
				helper_description_text = <text>
				<params_struct>
				tags = {
					watch_controller = <controller_used>
				}
			}
		endif
		if (<button> != None)
			if GotParam \{all_buttons}
				if <id> :desc_resolvealias Name = alias_helper_button
					<resolved_id> :se_setprops {
						metaremapenable = FALSE
						text = <buttonchar>
					}
				endif
			else
				if <id> :desc_resolvealias Name = alias_helper_button
					<resolved_id> :SetTags {watch_controller = <controller_used>}
				endif
			endif
		endif
		ngc_getwide
		if (<widescreen> = true)
			Scale = (1.6, 1.6)
		else
			Scale = (1.8, 1.6)
		endif
		printf qs(0x0711562c) d = <controller_used>
		<id> :desc_resolvealias Name = alias_helper_button
		<resolved_id> :se_setprops {
			metaremapenableauto = FALSE
			metaremapdevicetouse = <controller_used>
			Scale = <Scale>
		}
	endif
	<id> :se_getprops
	<id> :se_setprops {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
	return helper_pill_id = <id>
endscript

script show_user_control_helpers 
	user_control_container :se_setprops \{alpha = 1.0}
endscript

script hide_user_control_helpers 
	user_control_container :se_setprops \{alpha = 0.0}
endscript

script user_control_helper_change_text 
	RequireParams \{[
			button
			text
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		<helper_pill_id> :se_setprops {
			helper_description_text = <text>
		}
		<helper_pill_id> :se_getprops
		<helper_pill_id> :se_setprops {
			helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
			dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
		}
	else
		printf \{qs(0x89797703)}
	endif
endscript

script user_control_destroy_helper 
	RequireParams \{[
			button
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		DestroyScreenElement id = <helper_pill_id>
	endif
endscript

script user_control_helper_exists 
	RequireParams \{[
			button
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		return \{true}
	else
		return \{FALSE}
	endif
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
g_num_scrolling_texts = 0

script scroll_ticker_text {
		ticker_text = qs(0x03ac90f0)
		ticker_space = qs(0x713755f7)
		ticker_pos = (128.0, 598.0)
		ticker_just = [left top]
		ticker_parent = root_window
		ticker_x_scale = 0.6
		ticker_y_scale = 0.6
		ticker_font = fontgrid_text_a1
		ticker_rgba1 = (($g_menu_colors).white230)
		ticker_rgba2 = (($g_menu_colors).white230)
		ticker_alpha = 1.0
		ticker_z_priority = -1
		use_shadow = 0
		ticker_shadow_rgba = [0 0 0 255]
		time = 5
	}
	formatText \{checksumName = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		Type = TextElement
		just = <ticker_just>
		id = <ticker_text_id_1>
		parent = <ticker_parent>
		Pos = <ticker_pos>
		Scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <ticker_text>
		rgba = <ticker_rgba1>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	if (<use_shadow> = 1)
		<id> :se_setprops {
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = <ticker_shadow_rgba>
		}
	endif
	GetScreenElementDims id = <ticker_text_id_1>
	if (<width> > 0)
		multi = (1280 / <width>)
	else
		ScriptAssert \{qs(0xa5684ae5)}
	endif
	ticker_text_with_space = (<ticker_text> + <ticker_space>)
	long_ticker_text = <ticker_text_with_space>
	StringLength string = <ticker_text_with_space>
	<ticker_text_with_space_length> = <str_len>
	begin
	StringLength string = <long_ticker_text>
	<long_ticker_text_length> = <str_len>
	if NOT (<long_ticker_text_length> < (127 - <ticker_text_with_space_length>))
		break
	endif
	<long_ticker_text> = (<long_ticker_text> + <ticker_text_with_space>)
	<ticker_text_id_1> :se_setprops text = <long_band_text>
	GetScreenElementDims id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	<ticker_text_id_1> :se_setprops text = <long_ticker_text> Pos = <ticker_pos>
	formatText \{checksumName = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		id = <ticker_text_id_2>
		Type = TextElement
		just = <ticker_just>
		parent = <ticker_parent>
		Scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <long_ticker_text>
		rgba = <ticker_rgba2>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	if (<use_shadow> = 1)
		<id> :se_setprops {
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = <ticker_shadow_rgba>
		}
	endif
	GetScreenElementDims id = <ticker_text_id_1>
	<ticker_text_id_2> :se_setprops Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	Change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	<first> = 1
	begin
	<ticker_x> = (<ticker_pos>.(1.0, 0.0))
	<ticker_y> = (<ticker_pos>.(0.0, 1.0))
	<pos1> = (((-1.0, 0.0) * <width>) + ((0.0, 1.0) * <ticker_y>))
	<pos2> = <ticker_pos>
	if (<first>)
		<ticker_text_id_1> :se_setprops Pos = <pos1> time = <time>
		<ticker_text_id_2> :se_setprops Pos = <pos2> time = <time>
	else
		<ticker_text_id_2> :se_setprops Pos = <pos1> time = <time>
		<ticker_text_id_1> :se_setprops Pos = <pos2> time = <time>
	endif
	Wait <time> Seconds
	if ((ScreenElementExists id = <ticker_text_id_1>) && (ScreenElementExists id = <ticker_text_id_2>))
		if (<first>)
			<ticker_text_id_1> :se_setprops Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_2> :se_setprops Pos = <ticker_pos>
			<first> = 0
		else
			<ticker_text_id_2> :se_setprops Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_1> :se_setprops Pos = <ticker_pos>
			<first> = 1
		endif
	else
		return
	endif
	repeat
endscript

script ui_frazz_something 
	ScriptAssert \{'ui_frazz_something: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script ui_frazzmatazz 
	begin
	Scale = Random (@*10 (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@ (1) @ (0.3) @ (0.4) @ (0.5) @ (0.6) @ (0.8) )
	se_setprops alpha = <alpha> Scale = <Scale> time = 1
	se_waitprops
	se_setprops \{Scale = (1.0, 1.0)}
	se_waitprops
	Wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_02 
	begin
	Scale = Random (@*10 (1.0, 1.0) @ (1.05, 1.05) @ (1.1, 1.1) @ (1.05, 1.05) @ (1.03, 1.03) )
	alpha = Random (@ (0.25) @ (0.1) @ (0.2) @ (0.15) @ (0.2) @ (0.1) )
	se_setprops alpha = <alpha> Scale = <Scale> time = 1
	se_waitprops
	se_setprops \{Scale = (1.0, 1.0)}
	se_waitprops
	Wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_03 
	begin
	alpha = Random (@ (0.9) @ (0.8) @ (0.7) @*5 (1.0) )
	se_setprops alpha = <alpha> time = 0.1
	se_waitprops
	Wait \{1
		gameframe}
	repeat
endscript

script ui_alphaflight 
	begin
	alpha = Random (@*10 (1) @ (0.4) @ (0.5) @ (0.6) @ (0.7) @ (0.8) @ (0.9) )
	se_setprops alpha = <alpha> time = 1
	se_waitprops
	repeat
endscript

script ui_alphablink 
	begin
	se_setprops \{alpha = 0.5
		Scale = 0.97999996
		time = 0.5}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 1
		Scale = 1.01
		time = 0.5}
	Wait \{0.5
		Seconds}
	repeat
endscript

script ui_alphablink_02 
	begin
	se_setprops \{alpha = 0.25
		Scale = 0.97999996
		time = 0.8}
	Wait \{0.8
		Seconds}
	se_setprops \{alpha = 0.5
		Scale = 1.01
		time = 0.8}
	Wait \{0.8
		Seconds}
	repeat
endscript

script ui_pulse 
	begin
	se_setprops \{alpha = 1
		Scale = 0.7
		time = 0.5}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 1
		Scale = 0.81
		time = 0.5}
	Wait \{0.5
		Seconds}
	repeat
endscript

script ui_pulse2 
	begin
	se_setprops \{alpha = 1
		Scale = 1.001
		time = 0.3}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 0.7
		Scale = 1
		time = 0.3}
	Wait \{0.5
		Seconds}
	Wait \{0.5
		Seconds}
	Wait \{0.5
		Seconds}
	repeat
endscript

script ui_band_lobby_pulse 
	se_setprops \{alpha = 0.7
		Scale = 1}
	begin
	se_setprops \{alpha = 1
		Scale = 1.03
		time = 0.2}
	Wait \{0.2
		Seconds}
	se_setprops \{alpha = 0.0
		Scale = 0.96999997
		time = 0.2}
	Wait \{0.2
		Seconds}
	repeat
endscript

script ui_rotate_scale 
	begin
	se_setprops \{alpha = 0
		Scale = 0.1
		rot_angle = 0
		time = 0.5}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 1
		Scale = 1.01
		rot_angle = 180
		time = 0.5}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 0
		Scale = 0.1
		rot_angle = 360
		time = 0.5}
	Wait \{0.5
		Seconds}
	repeat
endscript

script ui_rotate_scale_02 
	begin
	se_setprops \{alpha = 0
		Scale = 2.0
		rot_angle = 0
		time = 0.8}
	Wait \{0.8
		Seconds}
	se_setprops \{alpha = 1
		Scale = 3.0
		rot_angle = 180
		time = 0.8}
	Wait \{0.8
		Seconds}
	se_setprops \{alpha = 0
		Scale = 2.0
		rot_angle = 360
		time = 0.8}
	Wait \{0.8
		Seconds}
	repeat
endscript

script ui_rotate 
	begin
	se_setprops \{alpha = 0
		Scale = 2.8
		rot_angle = 0
		time = 0}
	se_setprops \{alpha = 0.7
		Scale = 3.0
		rot_angle = 180
		time = 1}
	Wait \{1
		Seconds}
	se_setprops \{alpha = 0
		Scale = 2.8
		rot_angle = 360
		time = 1}
	Wait \{1
		Seconds}
	repeat
endscript

script ui_alphablast 
	begin
	alpha = Random (@ (1) @ (0.5) @ (0.25) @ (0.75) @ (0.0) )
	Scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.2) @ (1.0, 1.05) )
	se_setprops alpha = <alpha> time = 0.35000002
	se_waitprops
	repeat
endscript

script ui_herkyjerky 
	begin
	Pos = Random (@ (0.0, 0.0) @ (-10.0, -10.0) @ (-30.0, -30.0) @ (-20.0, -20.0) @ (20.0, 20.0) @ (25.0, 25.0) @ (50.0, 50.0) @ (10.0, 10.0) )
	Scale = Random (@ (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@*100 (1) @ (0.5) @ (0.6) @ (0.7) @ (0.8) @ (0.9) )
	se_setprops Pos = <Pos> Scale = <Scale> alpha = <alpha> time = 0.08
	se_waitprops
	se_setprops \{Pos = (0.0, 0.0)
		Scale = (1.0, 1.0)}
	r = Random (@ 1 @ 4 @ 5 @ 3 @ 3 )
	Wait <r> Seconds
	repeat
endscript

script ui_shakey 
	begin
	Pos = Random (@ (0.0, 0.0) @ (-2.0, -2.0) @ (-3.0, -3.0) @ (-1.0, -1.0) @ (2.5, 2.5) @ (1.0, 1.0) @ (2.0, 1.0) )
	se_setprops Pos = <Pos> time = 0.08
	se_waitprops
	Wait \{0.08
		Seconds}
	repeat
endscript

script ui_shakey_02 
	begin
	Pos = Random (@ (0.0, 0.0) @ (-1.0, -1.0) @ (-3.0, -3.0) @ (-1.0, -1.0) @ (2.5, 2.5) @ (-3.0, 1.0) @ (2.0, 1.0) )
	se_setprops Pos = <Pos> time = 0.15
	se_waitprops
	Wait \{0.15
		Seconds}
	repeat
endscript

script ui_shakeytime \{time = 0.08
		Pos = (0.0, 0.0)}
	begin
	pos1 = Random (@ {(0.0, 0.0) relative} @ {(-1.0, -1.0) relative} @ {(1.0, 1.0) relative} @ {(-1.0, 0.0) relative} @ {(0.0, 1.0) relative} )
	alpha = Random (@ 1.0 @ 0.9 @ 0.8 @ 0.7 )
	se_setprops Pos = <pos1> alpha = <alpha> time = <time>
	se_waitprops
	Wait <time> Seconds
	se_setprops Pos = <Pos> time = 0
	se_waitprops
	repeat
endscript

script ui_roto 
	begin
	Scale = Random (@*2 (1.0, 1.0) @ (1.05, 1.01) @ (1.03, 1.08) @ (1.03, 1.05) @ (1.09, 1.07) )
	rot_angle = Random (@ 1 @ 2 @ -1 @ -2 )
	se_setprops Scale = <Scale> rot_angle = <rot_angle> time = 0.05
	se_waitprops
	Wait \{0.05
		Seconds}
	repeat
endscript
