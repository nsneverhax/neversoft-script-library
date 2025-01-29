gh3_button_font = buttons_x360
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
	GH5_gold_md = [
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
	255
	0
	0
	255
]
menu_unfocus_color = [
	0
	0
	0
	255
]
menu_focus_font = fontgrid_title_a1
menu_unfocus_font = fontgrid_text_A1

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
				<id> :SE_GetProps
				<id> :SetTags old_font = <font>
			endif
			<id> :SE_SetProps rgba = ($menu_focus_color)
			if GotParam \{fire_font}
				SetScreenElementProps id = <id> font = fontgrid_text_A1 material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
			endif
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			SE_GetProps
			SetTags old_font = <font>
		endif
		SetProps rgba = ($menu_focus_color)
		if GotParam \{fire_font}
			SetProps \{font = fontgrid_text_A1
				material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire}
		endif
	endif
endscript

script retail_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :SE_GetProps
				<id> :SetTags old_font = <font>
				<id> :GetSingleTag old_font
			endif
			<id> :SE_SetProps rgba = ($menu_unfocus_color) font = <old_font> material = null
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			SE_GetProps
			SetTags old_font = <font>
			GetSingleTag \{old_font}
		endif
		SetProps rgba = ($menu_unfocus_color) font = <old_font> material = null
	endif
endscript

script new_menu {
		menu_pos = $menu_pos
		event_handlers = $default_event_handlers
		use_backdrop = 0
		z = 1
		dims = (400.0, 480.0)
		font = fontgrid_text_A1
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
		type = vscrollingmenu
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
	if GotParam \{name}
		CreateScreenElement {
			type = TextElement
			parent = <scrollid>
			font = fontgrid_text_A1
			Pos = (0.0, -45.0)
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
		type = vmenu
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
		FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<Tier>)
		FormatText checksumname = tier_checksum 'tier%s' s = (<Tier>)
		<unlocked> = 1
		if ((<unlocked> = 1) || ($is_network_game))
			GetArraySize (<tierlist>.<tier_checksum>.songs)
			song_count = 0
			if (<array_size> > 0)
				begin
				format_globaltag_song_checksum part = (<tierlist>.part) song = (<tierlist>.<tier_checksum>.songs [<song_count>])
				for_bonus = 0
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
							{pad_choose <on_choose> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_left <on_left> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_right <on_right> params = {Tier = <Tier> song_count = <song_count>}}
							{pad_L3 <on_l3> params = {Tier = <Tier> song_count = <song_count>}}
						]
					}
				endif
				song_count = (<song_count> + 1)
				repeat <array_size>
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
	if GotParam \{menu_id}
		if ScreenElementExists id = <menu_id>
			DestroyScreenElement id = <menu_id>
		endif
		destroy_generic_backdrop
	endif
endscript

script isSinglePlayerGame 
	GameMode_GetProperty \{prop = singleplayer}
	return <singleplayer>
endscript

script options_change_tilt_star_power 
	GetPlayerInfo <player> use_tilt_for_starpower
	get_savegame_from_player player = <player>
	if (<use_tilt_for_starpower> = 1)
		SetPlayerInfo <player> use_tilt_for_starpower = 0
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = Box_UnCheck_SFX}
	else
		SetPlayerInfo <player> use_tilt_for_starpower = 1
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
	endif
	Obj_GetID
	<objID> :SetProps menurow_ico_item_texture = <new_texture>
endscript

script options_change_touch_strip_option 
	GetPlayerInfo <player> enable_touch_strip
	get_savegame_from_player player = <player>
	if (<enable_touch_strip> = 1)
		SetPlayerInfo <player> enable_touch_strip = 0
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = Options_Controller_X
		SoundEvent \{event = Box_UnCheck_SFX}
	else
		SetPlayerInfo <player> enable_touch_strip = 1
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = Options_Controller_Check
		SoundEvent \{event = Box_Check_SFX}
	endif
	Obj_GetID
	<objID> :SetProps menurow_ico_item_texture = <new_texture>
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
		Pos = (0.0, 0.0)
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
		ScriptAssert \{qs(0xd9eec8c8)}
	endif
	fit_text_convert_legacy_params <...>
	<id> :SE_FitToDims {
		dims = <dims>
		factor_start_scale = <factor_start_scale>
		preserve_aspect_ratio = <preserve_aspect_ratio>
		only_if_larger_x = <only_if_larger_x>
		only_if_larger_y = false
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
		Bg_rgba = [
			180
			180
			180
			255
		]}
	Change user_control_pill_color = <Bg_rgba>
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
	if IsXenonOrWinDX
		RemoveParameter \{all_buttons}
	endif
	GetEnterButtonAssignment
	if GotParam \{button}
		switch (<button>)
			case green
			buttonchar = qs(0xac29f74c)
			if GotParam \{force_pad_button}
				buttonchar = qs(0xdf67b4d9)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xcc4ce1aa)
				if (<assignment> = circle)
					buttonchar = qs(0x84f23103)
				endif
			endif
			case red
			buttonchar = qs(0xb532c60d)
			if GotParam \{force_pad_button}
				buttonchar = qs(0xc67c8598)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x84f23103)
				if (<assignment> = circle)
					buttonchar = qs(0xcc4ce1aa)
				endif
			endif
			case yellow
			buttonchar = qs(0x9e1f95ce)
			if GotParam \{force_pad_button}
				buttonchar = qs(0xf44ae71a)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xbd4955cb)
			endif
			case blue
			buttonchar = qs(0x8704a48f)
			if GotParam \{force_pad_button}
				buttonchar = qs(0xed51d65b)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xf5f78562)
			endif
			case orange
			buttonchar = qs(0xc8453248)
			if GotParam \{force_pad_button}
				buttonchar = qs(0x3c936d12)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x667a6f93)
			endif
			case strumbar
			buttonchar = qs(0x72fe6f1c)
			case back
			buttonchar = qs(0x0f899b59)
			if GotParam \{force_pad_button}
				buttonchar = qs(0xc969a681)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0x163cc2b3)
			endif
			case start
			buttonchar = qs(0x24a4c89a)
			if GotParam \{force_pad_button}
				buttonchar = qs(0x0433a81f)
			endif
			if GotParam \{all_buttons}
				buttonchar = qs(0xc1c53668)
			endif
			case LB
			buttonchar = qs(0x9f330107)
			case RB
			buttonchar = qs(0xb41e52c4)
			case LT
			buttonchar = qs(0xad056385)
			case RT
			buttonchar = qs(0xe244f542)
			case LBRB
			buttonchar = qs(0x41c5c5a3)
			case pad_left
			buttonchar = qs(0x33864e0b)
		endswitch
	else
		buttonchar = qs(0x03ac90f0)
	endif
	return {buttonchar = <buttonchar>}
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
	RequireParams \{[
			id
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	wait \{1
		seconds
		ignoreslomo}
	begin
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			alpha = 0.5
			time = <time>
		}
		wait <time> seconds ignoreslomo
		if ScreenElementExists id = <id>
			<id> :SE_SetProps {
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

script add_gamertag_helper \{z = 100000}
	if NOT GotParam \{exclusive_device}
		return
	endif
	if NOT IsArray <exclusive_device>
		if NOT IsChecksum <exclusive_device>
			if NOT ((<exclusive_device> < 0) || (<exclusive_device> > 3))
				FormatText TextName = caption qs(0xedc03e4e) d = (<exclusive_device> + 1)
				if IsXenonOrWinDX
					if GetLocalGamerTag controller = <exclusive_device>
						if NOT (<GamerTag> = qs(0x03ac90f0))
							caption = <GamerTag>
						endif
					endif
				endif
				get_local_in_game_player_num_from_controller controller_index = <exclusive_device>
				if NOT (<player_num> = -1)
					GetPlayerInfo <player_num> part
					switch <part>
						case bass
						icon_texture = mixer_icon_bass
						case Drum
						icon_texture = mixer_icon_drums
						case vocals
						icon_texture = mixer_icon_vox
						default
						icon_texture = mixer_icon_guitar
					endswitch
				else
					if isguitarcontroller controller = <exclusive_device>
						icon_texture = mixer_icon_guitar
					elseif isdrumcontroller controller = <exclusive_device>
						icon_texture = mixer_icon_drums
					else
						GetActiveControllers
						if (<active_controllers> [<exclusive_device>] = 1)
							icon_texture = mixer_icon_vox
						else
							icon_texture = null
						endif
					endif
				endif
				if (<icon_texture> != null)
					add_user_control_helper GamerTag = <caption> icon_texture = <icon_texture> z = <z>
					<helper_pill_id> :Obj_SpawnScript gamertag_helper_update params = {caption = <caption> exclusive_device = <exclusive_device>}
				endif
			endif
		endif
	endif
endscript

script gamertag_helper_update 
	old_caption = <caption>
	FormatText TextName = ps3_caption qs(0xedc03e4e) d = (<exclusive_device> + 1)
	begin
	caption = <ps3_caption>
	if IsXenonOrWinDX
		if GetLocalGamerTag controller = <exclusive_device>
			if NOT (<GamerTag> = qs(0x03ac90f0))
				caption = <GamerTag>
			endif
		endif
	endif
	if NOT (<caption> = <old_caption>)
		spawnscriptnow add_gamertag_helper params = {exclusive_device = <exclusive_device> z = 100000}
		return
	endif
	wait \{60
		gameframe}
	repeat
endscript

script add_user_control_helper \{z = 10
		generate_helper_pill_id = true}
	if IsXenonOrWinDX
		RemoveParameter \{all_buttons}
	endif
	if NOT ScreenElementExists \{id = user_control_container}
		CreateScreenElement {
			id = user_control_container
			parent = root_window
			type = MenuElement
			dims = (1024.0, 36.0)
			Pos = (0.0, -36.0)
			pos_anchor = [center bottom]
			just = [center bottom]
			internal_just = [center center]
			isVertical = false
			position_children = true
			fit_major = `fit	content	if	larger`
			fit_minor = `keep	dims`
			spacing_between = 10
			z_priority = <z>
		}
	else
		user_control_container :SE_SetProps z_priority = <z>
	endif
	params_struct = {
		helper_pill_rgba = $user_control_pill_color
		helper_description_rgba = $user_control_pill_text_color
	}
	if GotParam \{GamerTag}
		DestroyScreenElement \{id = gamertag_helper_pill_ID}
		CreateScreenElement {
			parent = user_control_container
			id = gamertag_helper_pill_ID
			type = DescInterface
			desc = 'helper_gamertag_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_texture = <icon_texture>
			helper_description_text = <GamerTag>
			<params_struct>
		}
		user_control_container :Menu_SetItemIndex \{id = gamertag_helper_pill_ID
			newIndex = 0}
	else
		if (<generate_helper_pill_id> = true)
			ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
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
					FormatText TextName = buttonchar qs(0x28c4c672) a = <buttonchar1> b = <buttonchar2>
				endif
			endif
			AddParam structure_name = params_struct name = helper_button_text value = <buttonchar>
		endif
		parent = user_control_container
		if GotParam \{override_parent}
			parent = <override_parent>
		endif
		if GotParam \{controller}
			if (<controller> >= 4 || <controller> < 0)
				RemoveParameter \{controller}
			endif
		endif
		CreateScreenElement {
			parent = <parent>
			id = <helper_pill_id>
			type = DescInterface
			desc = 'helper_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			Pos = <Pos>
			pos_anchor = <pos_anchor>
			just = <just>
			scale = <scale>
			helper_description_text = <text>
			<params_struct>
			metaRemapDeviceToUse = <controller>
		}
		if (<button> != None)
			if GotParam \{all_buttons}
				if <id> :Desc_ResolveAlias name = alias_helper_button
					<resolved_id> :SE_SetProps {
						metaRemapEnable = false
						text = <buttonchar>
					}
				endif
			else
				if GotParam \{controller}
					if NOT (<controller> = $primary_controller)
						if <id> :Desc_ResolveAlias name = alias_helper_button
							<resolved_id> :SE_SetProps {
								metaRemapEnableAuto = false
								metaRemapDeviceToUse = <controller>
								text = <buttonchar>
							}
						endif
					endif
				endif
			endif
		endif
	endif
	<id> :SE_GetProps
	<id> :SE_SetProps {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
	return helper_pill_id = <id>
endscript

script show_user_control_helpers 
	user_control_container :SE_SetProps \{alpha = 1.0}
endscript

script hide_user_control_helpers 
	user_control_container :SE_SetProps \{alpha = 0.0}
endscript

script user_control_helper_change_text 
	RequireParams \{[
			button
			text
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		<helper_pill_id> :SE_SetProps {
			helper_description_text = <text>
		}
		<helper_pill_id> :SE_GetProps
		<helper_pill_id> :SE_SetProps {
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
		return \{false}
	endif
endscript

script user_control_helper_get_index 
	RequireParams \{[
			button
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		GetScreenElementChildren \{id = user_control_container}
		GetArraySize <children>
		if (<array_size> > 0)
			<i> = 0
			begin
			if (<children> [<i>] = <helper_pill_id>)
				return index = <i>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	else
		ScriptAssert \{qs(0xe9420fad)}
	endif
endscript

script user_control_helper_reorder 
	RequireParams \{[
			button
			new_index
		]
		all}
	ExtendCrc <button> '_helper_pill_ID' out = helper_pill_id
	if ScreenElementExists id = <helper_pill_id>
		user_control_helper_get_index button = <button>
		if GotParam \{index}
			user_control_container :Menu_SetItemIndex index = <index> newIndex = <new_index>
		else
			ScriptAssert \{qs(0xa2043430)}
		endif
	else
		ScriptAssert \{qs(0xa2043430)}
	endif
endscript

script displaySprite \{just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		dims = {
		}
		BlendMode = {
		}
		internal_just = {
		}
		scale = {
		}
		alpha = 1}
	if GotParam \{rot_angle}
		rot_struct = {rot_angle = <rot_angle>}
	else
		rot_struct = {}
	endif
	CreateScreenElement {
		type = SpriteElement
		id = <id>
		parent = <parent>
		texture = <tex>
		dims = <dims>
		rgba = <rgba>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		z_priority = <z>
		scale = <scale>
		<rot_struct>
		blend = <BlendMode>
		alpha = <alpha>
	}
	if GotParam \{flip_v}
		<id> :SE_SetProps flip_v
	endif
	if GotParam \{flip_h}
		<id> :SE_SetProps flip_h
	endif
	return id = <id>
endscript

script displayText \{id = {
		}
		just = [
			left
			top
		]
		rgba = [
			210
			130
			0
			250
		]
		font = fontgrid_text_A1
		rot = 0}
	CreateScreenElement {
		type = TextElement
		parent = <parent>
		font = <font>
		scale = <scale>
		rgba = <rgba>
		text = <text>
		id = <id>
		Pos = <Pos>
		just = <just>
		rot_angle = <rot>
		z_priority = <z>
		font_spacing = <font_spacing>
	}
	if GotParam \{noshadow}
		<id> :SE_SetProps noshadow
	else
		<id> :SE_SetProps shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
	endif
	return id = <id>
endscript
g_num_scrolling_texts = 0

script scroll_ticker_text {
		ticker_text = qs(0x73dbd1ae)
		ticker_space = qs(0x713755f7)
		ticker_pos = (128.0, 598.0)
		ticker_just = [left top]
		ticker_parent = root_window
		ticker_x_scale = 0.6
		ticker_y_scale = 0.6
		ticker_font = fontgrid_text_A1
		ticker_rgba1 = (($g_menu_colors).white230)
		ticker_rgba2 = (($g_menu_colors).white230)
		ticker_alpha = 1.0
		ticker_z_priority = -1
		use_shadow = 0
		ticker_shadow_rgba = [0 0 0 255]
		time = 5
	}
	FormatText \{checksumname = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		type = TextElement
		just = <ticker_just>
		id = <ticker_text_id_1>
		parent = <ticker_parent>
		Pos = <ticker_pos>
		scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <ticker_text>
		rgba = <ticker_rgba1>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
		tags = {
			ticker_text = <ticker_text>
		}
	}
	if (<use_shadow> = 1)
		<id> :SE_SetProps {
			shadow
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
	<ticker_text_id_1> :SE_SetProps text = <long_band_text>
	GetScreenElementDims id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	<ticker_text_id_1> :SE_SetProps text = <long_ticker_text> Pos = <ticker_pos>
	FormatText \{checksumname = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		i = $g_num_scrolling_texts}
	CreateScreenElement {
		id = <ticker_text_id_2>
		type = TextElement
		just = <ticker_just>
		parent = <ticker_parent>
		scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <long_ticker_text>
		rgba = <ticker_rgba2>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	if (<use_shadow> = 1)
		<id> :SE_SetProps {
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = <ticker_shadow_rgba>
		}
	endif
	GetScreenElementDims id = <ticker_text_id_1>
	<ticker_text_id_2> :SE_SetProps Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	Change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	<first> = 1
	begin
	<ticker_x> = (<ticker_pos>.(1.0, 0.0))
	<ticker_y> = (<ticker_pos>.(0.0, 1.0))
	<pos1> = (((-1.0, 0.0) * <width>) + ((0.0, 1.0) * <ticker_y>))
	<pos2> = <ticker_pos>
	if (<first>)
		<ticker_text_id_1> :SE_SetProps Pos = <pos1> time = <time>
		<ticker_text_id_2> :SE_SetProps Pos = <pos2> time = <time>
	else
		<ticker_text_id_2> :SE_SetProps Pos = <pos1> time = <time>
		<ticker_text_id_1> :SE_SetProps Pos = <pos2> time = <time>
	endif
	wait <time> seconds
	if ((ScreenElementExists id = <ticker_text_id_1>) && (ScreenElementExists id = <ticker_text_id_2>))
		if (<first>)
			<ticker_text_id_1> :SE_SetProps Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_2> :SE_SetProps Pos = <ticker_pos>
			<first> = 0
		else
			<ticker_text_id_2> :SE_SetProps Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_1> :SE_SetProps Pos = <ticker_pos>
			<first> = 1
		endif
	else
		return
	endif
	repeat
endscript

script ui_reflect_anim_in 
	SE_SetProps \{Pos = (-465.0, 545.0)}
	wait \{0.35000002
		seconds}
	SE_SetProps \{Pos = (-465.0, 435.0)
		time = 0.35000002}
	wait \{0.35000002
		seconds}
	SE_SetProps \{Pos = (-465.0, 445.0)
		time = 0.35000002
		motion = ease_in}
	wait \{0.35000002
		seconds}
endscript

script ui_reflect_anim_in_02 
	SE_SetProps \{Pos = (-555.0, 545.0)}
	wait \{0.35000002
		seconds}
	SE_SetProps \{Pos = (-555.0, 435.0)
		time = 0.35000002}
	wait \{0.35000002
		seconds}
	SE_SetProps \{Pos = (-555.0, 445.0)
		time = 0.35000002
		motion = ease_in}
	wait \{0.35000002
		seconds}
endscript

script ui_jiggle 
	finalpos = (0.0, -10.0)
	begin
	alpha = Random (@ 0.8 @ 0.6 @ 0.35000002 )
	time = Random (@ 0.2 @ 0.1 @ 0.0 )
	Pos = Random (@ (<finalpos> + (0.0, 1.0)) @ (<finalpos> + (1.0, 0.0)) @ (<finalpos> + (1.0, 1.0)) @ (<finalpos> + (0.0, -1.0)) @ (<finalpos> + (-1.0, 0.0)) @ (<finalpos> + (-1.0, -1.0)) @*8 (0.0, 10.0) )
	SE_SetProps alpha = <alpha> time = <time> Pos = <Pos>
	SE_WaitProps
	repeat
endscript

script ui_frazz_something 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.1, 0.3) @ (0.9, 1.0) )
	SE_SetProps scale = <scale> rgba = [255 255 255 255] time = 0.2
	SE_WaitProps
	SE_SetProps \{scale = (1.0, 1.0)
		rgba = [
			200
			220
			255
			255
		]}
	SE_WaitProps
	repeat
endscript

script ui_frazzmatazz 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@ (1) @ (0.3) @ (0.4) @ (0.5) @ (0.6) @ (0.8) )
	SE_SetProps alpha = <alpha> scale = <scale> time = 1
	SE_WaitProps
	SE_SetProps \{scale = (1.0, 1.0)}
	SE_WaitProps
	wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_02 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.05, 1.05) @ (1.1, 1.1) @ (1.05, 1.05) @ (1.03, 1.03) )
	alpha = Random (@ (0.25) @ (0.1) @ (0.2) @ (0.15) @ (0.2) @ (0.1) )
	SE_SetProps alpha = <alpha> scale = <scale> time = 1
	SE_WaitProps
	SE_SetProps \{scale = (1.0, 1.0)}
	SE_WaitProps
	wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_03 
	begin
	alpha = Random (@ (0.9) @ (0.8) @ (0.7) @*5 (1.0) )
	SE_SetProps alpha = <alpha> time = 0.1
	SE_WaitProps
	wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_04 
	begin
	SE_SetProps \{alpha = 1
		scale = 1
		time = 0}
	wait \{0.05
		seconds}
	SE_SetProps \{alpha = 0.8
		scale = 1.01
		Pos = (75.0, 100.0)
		time = 0.05}
	wait \{0.05
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1
		time = 0.05}
	wait \{0.05
		seconds}
	repeat
endscript

script ui_failflicker 
	begin
	SE_SetProps \{alpha = 0.5
		scale = 1
		time = 0.5
		motion = ease_in}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1
		time = 0.5
		motion = ease_out}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_alphaflight 
	begin
	alpha = Random (@*10 (1) @ (0.4) @ (0.5) @ (0.6) @ (0.7) @ (0.8) @ (0.9) )
	SE_SetProps alpha = <alpha> time = 1
	SE_WaitProps
	repeat
endscript

script ui_blink 
	begin
	SE_SetProps \{alpha = 0.65000004
		time = 0.75}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		time = 0.75}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_blink_more 
	SetSpawnInstanceLimits \{Max = 3
		management = ignore_spawn_request}
	begin
	SE_SetProps \{alpha = 0.25
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_scaleout 
	begin
	SE_SetProps \{alpha = 0
		scale = 1
		time = 0}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1.25
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 0
		scale = 1.5
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_scaleout_fast 
	begin
	SE_SetProps \{alpha = 0
		scale = 1
		time = 0}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 0
		scale = 1.25
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_alphablink 
	begin
	SE_SetProps \{alpha = 0.5
		scale = 0.97999996
		time = 0.5
		motion = ease_in}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1.01
		time = 0.5
		motion = ease_out}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_alphablink_02 
	begin
	SE_SetProps \{alpha = 0.25
		scale = 0.97999996
		time = 0.8}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 0.5
		scale = 1.01
		time = 0.8}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_alphablink_03 
	begin
	SE_SetProps \{alpha = 0.3
		scale = (1.0, 1.0)
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = (1.01, 1.0)
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_badge_blink 
	begin
	SE_SetProps \{alpha = 0.85
		scale = 0.8
		time = 0.45000002}
	wait \{0.45000002
		seconds}
	SE_SetProps \{alpha = 1
		scale = 0.85
		time = 0.45000002}
	wait \{0.45000002
		seconds}
	repeat
endscript

script ui_badge_blink_big 
	begin
	SE_SetProps \{alpha = 0.85
		scale = 1
		time = 0.45000002}
	wait \{0.45000002
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1.25
		time = 0.45000002}
	wait \{0.45000002
		seconds}
	repeat
endscript

script ui_pulse 
	begin
	SE_SetProps \{alpha = 1
		scale = 0.8
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 0.85
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_pulse2 
	begin
	SE_SetProps \{alpha = 1
		scale = 1.001
		time = 0.3}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 0.7
		scale = 1
		time = 0.3}
	wait \{0.5
		seconds}
	wait \{0.5
		seconds}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_band_lobby_pulse 
	SE_SetProps \{alpha = 0.7
		scale = 1}
	begin
	SE_SetProps \{alpha = 1
		scale = 1.03
		time = 0.2}
	wait \{0.2
		seconds}
	SE_SetProps \{alpha = 0.0
		scale = 0.96999997
		time = 0.2}
	wait \{0.2
		seconds}
	repeat
endscript

script ui_rotate_scale 
	begin
	SE_SetProps \{alpha = 0
		scale = 0.1
		rot_angle = 0
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1.01
		rot_angle = 180
		time = 0.5}
	wait \{0.5
		seconds}
	SE_SetProps \{alpha = 0
		scale = 0.1
		rot_angle = 360
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_rotate_scale_02 
	begin
	SE_SetProps \{alpha = 0
		scale = 2.0
		rot_angle = 0
		time = 0.8}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 1
		scale = 3.0
		rot_angle = 180
		time = 0.8}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 0
		scale = 2.0
		rot_angle = 360
		time = 0.8}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_rotate_scale_03 
	begin
	SE_SetProps \{alpha = 0.5
		scale = 1.02
		rot_angle = 180
		time = 1.2}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1
		rot_angle = 360
		time = 1.2}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 0.5
		scale = 1
		rot_angle = 540
		time = 1.2}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 1
		scale = 1
		rot_angle = 720
		time = 1.2}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 0.5
		scale = 1
		rot_angle = 900
		time = 1.2}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_rotate_scale_04 
	begin
	SE_SetProps \{alpha = 0.1
		scale = 1.2
		rot_angle = 180
		time = 1.5}
	wait \{0.8
		seconds}
	SE_SetProps \{alpha = 0.0
		scale = 1
		rot_angle = 360
		time = 1.5}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_rotate 
	begin
	SE_SetProps \{alpha = 0
		scale = 2.8
		rot_angle = 0
		time = 0}
	SE_SetProps \{alpha = 0.7
		scale = 3.0
		rot_angle = 180
		time = 1}
	wait \{1
		seconds}
	SE_SetProps \{alpha = 0
		scale = 2.8
		rot_angle = 360
		time = 1}
	wait \{1
		seconds}
	repeat
endscript

script ui_alphablast 
	begin
	alpha = Random (@ (1) @ (0.5) @ (0.25) @ (0.75) @ (0.0) )
	scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.2) @ (1.0, 1.05) )
	SE_SetProps alpha = <alpha> time = 0.35000002
	SE_WaitProps
	repeat
endscript

script ui_alphablast_lite 
	begin
	alpha = Random (@ (1) @ (0.8) @ (0.9) @ (0.75) )
	scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.2) @ (1.0, 1.05) )
	SE_SetProps alpha = <alpha> time = 0.35000002
	SE_WaitProps
	repeat
endscript

script ui_herkyjerky 
	begin
	Pos = Random (@ (0.0, 0.0) @ (-10.0, -10.0) @ (-30.0, -30.0) @ (-20.0, -20.0) @ (20.0, 20.0) @ (25.0, 25.0) @ (50.0, 50.0) @ (10.0, 10.0) )
	scale = Random (@ (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@*100 (1) @ (0.5) @ (0.6) @ (0.7) @ (0.8) @ (0.9) )
	SE_SetProps Pos = <Pos> scale = <scale> alpha = <alpha> time = 0.08
	SE_WaitProps
	SE_SetProps \{Pos = (0.0, 0.0)
		scale = (1.0, 1.0)}
	r = Random (@ 1 @ 4 @ 5 @ 3 @ 3 )
	wait <r> seconds
	repeat
endscript

script ui_shakey 
endscript

script ui_shakey_bh 
	begin
	Pos = Random (@ (0.0, 0.0) @ (-2.0, -2.0) @ (-3.0, -3.0) @ (-1.0, -1.0) @ (2.5, 2.5) @ (1.0, 1.0) @ (2.0, 1.0) )
	SE_SetProps Pos = <Pos> time = 0.08
	SE_WaitProps
	wait \{0.08
		seconds}
	repeat
endscript

script ui_shakey_02 
endscript

script ui_shakeytime \{time = 0.08
		Pos = (0.0, 0.0)}
endscript

script ui_flash_scroll_arrow 
	RequireParams \{[
			desc_id
		]
		all}
	if GotParam \{up}
		if NOT <desc_id> :Desc_ResolveAlias name = alias_menu_up_arrow
			softassert \{qs(0x7d9960ea)}
			return
		endif
	else
		if NOT <desc_id> :Desc_ResolveAlias name = alias_menu_down_arrow
			softassert \{qs(0xeea833a9)}
			return
		endif
	endif
	if NOT GotParam \{resolved_id}
		softassert \{qs(0x692b905a)}
		return
	endif
	<resolved_id> :Obj_SpawnScript menu_do_scroll_glow
	<resolved_id> :Obj_SpawnScript menu_do_arrow_pulse
endscript

script create_dummy_menu_items 
	RequireParams \{[
			menu_id
		]
		all}
	if ScreenElementExists id = <menu_id>
		<menu_id> :GetSingleTag create_dummy_items
		if GotParam \{create_dummy_items}
			<menu_id> :GetSingleTag smoothed
			if NOT GotParam \{smoothed}
				GetScreenElementProps id = <menu_id> force_update
				create_dummy_menu_items_worker menu_id = <menu_id>
				<menu_id> :SetTags smoothed = 1
			endif
		endif
	endif
endscript

script create_dummy_menu_items_worker 
	RequireParams \{[
			menu_id
		]
		all}
	if NOT ScreenElementExists id = <menu_id>
		ScriptAssert \{qs(0xe3978812)}
	endif
	<menu_id> :SE_GetProps
	if (<loop_view> = false)
		return
	endif
	if ScreenElementExists \{id = dummy_menu_item_bottom}
		DestroyScreenElement \{id = dummy_menu_item_bottom}
	endif
	if ScreenElementExists \{id = dummy_menu_item_top}
		DestroyScreenElement \{id = dummy_menu_item_top}
	endif
	GetScreenElementChildren id = <menu_id>
	smoothmenu_get_end_children children = <children>
	<Menu_just> = <internal_just>
	<top_child> :SE_GetProps
	Pos = (<dims>.(0.0, 1.0) * (0.0, 1.0) + (<spacing_between> * (0.0, 1.0)))
	CreateScreenElement {
		type = DescInterface
		id = dummy_menu_item_top
		parent = <bottom_child>
		desc = <desc>
		autoSizeDims = true
		Pos = <Pos>
		menurow_ico_item_texture = <menurow_ico_item_texture>
		menurow_ico_item_dims = <menurow_ico_item_dims>
		menurow_txt_item_text = <menurow_txt_item_text>
		menurow_txt_item_font = fontgrid_text_A1
		menurow_txt_item_rgba = <menurow_txt_item_rgba>
		menurow_just = <menurow_just>
		menurow_internal_just = <menurow_internal_just>
		just = <just>
		pos_anchor = <Menu_just>
		menurow_txt_item_char_spacing = <menurow_txt_item_char_spacing>
	}
	<bottom_child> :SE_GetProps
	Pos = (<dims>.(0.0, 1.0) * (0.0, -1.0) - (<spacing_between> * (0.0, 1.0)))
	CreateScreenElement {
		type = DescInterface
		id = dummy_menu_item_bottom
		parent = <top_child>
		desc = <desc>
		autoSizeDims = true
		Pos = <Pos>
		menurow_ico_item_texture = <menurow_ico_item_texture>
		menurow_ico_item_dims = <menurow_ico_item_dims>
		menurow_txt_item_text = <menurow_txt_item_text>
		menurow_txt_item_font = fontgrid_text_A1
		menurow_txt_item_rgba = <menurow_txt_item_rgba>
		menurow_just = <menurow_just>
		menurow_internal_just = <menurow_internal_just>
		just = <just>
		pos_anchor = <Menu_just>
		menurow_txt_item_char_spacing = <menurow_txt_item_char_spacing>
	}
endscript

script menu_do_arrow_pulse 
	SE_SetProps \{scale = 1.3
		time = 0.01}
	SE_WaitProps
	SE_SetProps \{scale = 1.0
		time = 0.1}
	SE_WaitProps
endscript

script menu_do_scroll_glow 
	Obj_GetID
	<objID> :SE_GetProps
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (0.0, 0.0)
		rgba = [255 215 0 255]
		pos_anchor = [center center]
		just = [center center]
		z_priority = (<z_priority> - 1)
		alpha = 0.3
		blend = add
	}
	<id> :SE_SetProps scale = 1.2 relative_scale
	<id> :SE_SetProps scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	wait \{0.2
		seconds}
	DestroyScreenElement id = <id>
endscript

script menu_set_item_alpha \{menu_id = current_menu}
	<menu_id> :GetTags
	GetScreenElementChildren id = <menu_id>
	if NOT GotParam \{children}
		return
	endif
	GetArraySize <children>
	if (<index> < 0)
		<index> = (<index> + <array_size>)
	elseif (<index> = (<array_size> * 2))
		<index> = (<index> - (<array_size> * 2))
	elseif (<index> > <array_size> || <index> = <array_size>)
		<index> = (<index> - <array_size>)
	endif
	if GotParam \{instant}
		if (<instant> = 1)
			<smooth_morph_time> = 0
		endif
	endif
	if (<index> < 0 || <index> >= <array_size>)
		softassert \{qs(0x39e542c6)}
		return
	endif
	<item_id> = (<children> [<index>])
	time = <smooth_morph_time>
	<item_id> :GetTags
	if GotParam \{not_focusable}
		return
	endif
	<item_id> :SE_SetProps alpha = <alpha> time = <time>
endscript

script menu_set_alpha_values \{menu_id = current_menu}
	if GotParam \{delay_frames}
		wait <delay_frames> gameframes
	endif
	if NOT ScreenElementExists id = <menu_id>
		softassert \{qs(0xebcc4572)}
		return
	endif
	CountScreenElementChildren id = <menu_id>
	if (<num_children> < 7)
		return
	endif
	<menu_id> :Menu_GetSelectedIndex
	if NOT GotParam \{selected_index}
		softassert \{qs(0x3ec5ba18)}
		return
	endif
	if GotParam \{up}
		index = (<selected_index> - 4)
	elseif GotParam \{down}
		index = (<selected_index> - 2)
	else
		index = (<selected_index> - 3)
	endif
	menu_set_item_alpha menu_id = <menu_id> index = <index> alpha = 0 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 1) alpha = 0.5 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 2) alpha = 1 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 3) alpha = 1 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 4) alpha = 1 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 5) alpha = 0.5 instant = <instant>
	menu_set_item_alpha menu_id = <menu_id> index = (<index> + 6) alpha = 0 instant = <instant>
endscript

script ui_roto 
	begin
	scale = Random (@*2 (1.0, 1.0) @ (1.05, 1.01) @ (1.03, 1.08) @ (1.03, 1.05) @ (1.09, 1.07) )
	rot_angle = Random (@ 1 @ 2 @ -1 @ -2 )
	SE_SetProps scale = <scale> rot_angle = <rot_angle> time = 0.05
	SE_WaitProps
	wait \{0.05
		seconds}
	repeat
endscript

script anim_bling_small \{minradius = 20
		maxradius = 50
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minradius> b = <maxradius>
	GetRandomValue name = blingY integer a = <minradius> b = <maxradius>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 1.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 1.0) * <blingY>)
		case 3
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, -1.0) * <blingY>)
		default
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, -1.0) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.6 scale = 0.6 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_horizontal \{minwidth = 100
		maxwidth = 500
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minwidth> b = <minwidth>
	GetRandomValue name = blingY integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 0.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
		case 3
		blingPos = ((3.0, 0.0) * <blingX> + (0.0, 0.45000002) * <blingY>)
		default
		blingPos = ((-2.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.6 scale = 1.5 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_horizontal_02 \{minwidth = 100
		maxwidth = 300
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minwidth> b = <minwidth>
	GetRandomValue name = blingY integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 0.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
		case 3
		blingPos = ((2.0, 0.0) * <blingX> + (0.0, 0.45000002) * <blingY>)
		default
		blingPos = ((-2.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.6 scale = 1.5 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_horizontal_sm \{minwidth = 100
		maxwidth = 200
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minwidth> b = <minwidth>
	GetRandomValue name = blingY integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 0.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 0.15) * <blingY>)
		case 3
		blingPos = ((2.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
		default
		blingPos = ((-2.0, 0.0) * <blingX> + (0.0, 0.2) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.6 scale = 0.9 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_horizontal_sm_crown \{minwidth = 90
		maxwidth = 250
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minwidth> b = <minwidth>
	GetRandomValue name = blingY integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 0.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 0.1) * <blingY>)
		case 3
		blingPos = ((2.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
		default
		blingPos = ((-2.0, 0.0) * <blingX> + (0.0, 0.15) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.4 scale = 0.8 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_horizontal_crown \{minwidth = 10
		maxwidth = 250
		maxtime = 0.5}
	begin
	GetRandomValue name = blingX integer a = <minwidth> b = <minwidth>
	GetRandomValue name = blingY integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingPos = ((1.0, 0.0) * <blingX> + (0.0, 0.0) * <blingY>)
		case 2
		blingPos = ((-1.0, 0.0) * <blingX> + (0.0, 0.2) * <blingY>)
		case 3
		blingPos = ((2.0, 0.0) * <blingX> + (0.0, 0.22) * <blingY>)
		default
		blingPos = ((-2.0, 0.0) * <blingX> + (0.0, 0.25) * <blingY>)
	endswitch
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	GetRandomValue name = randtime a = 0.2 b = <maxtime>
	SE_SetProps alpha = 0 scale = 0 Pos = <blingPos> rot_angle = <randrotA> time = 0
	SE_WaitProps
	SE_SetProps alpha = 0.4 scale = 0.8 rot_angle = <randrotB> time = <randtime> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = 0 rot_angle = <randrotC> time = <randtime> motion = ease_out
	SE_WaitProps
	repeat
endscript

script anim_bling_box \{max_interval = 0.5
		float_time = 1.0
		start_dims = (32.0, 32.0)
		Color = [
			255
			255
			255
			100
		]}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	GetRandomValue name = my_X integer a = 1 b = <element_width>
	GetRandomValue name = my_Y integer a = 1 b = <element_height>
	my_pos = (((1.0, 0.0) * <my_X>) + ((0.0, 1.0) * <my_Y>))
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = diamondBling
		rgba = <Color>
		dims = <start_dims>
		just = [center center]
		alpha = 0
		Pos = <my_pos>
		blend = add
	}
	<id> :Obj_SpawnScript anim_bling_box_element params = {float_time = <float_time>}
	GetRandomValue name = r a = 0 b = <max_interval>
	wait <r> seconds
	repeat
endscript

script anim_bling_box_element 
	Obj_GetID
	SE_GetProps
	float_time = (<float_time> / 2.0)
	randrotA = RandomInteger (0.0, 180.0)
	randrotC = (<randrotA> + (RandomInteger (0.0, 179.0)))
	randrotB = ((<randrotC> / 2) + (<randrotA> / 2))
	SE_SetProps alpha = 0 scale = (0.0, 0.0) rot_angle = <randrotA>
	SE_SetProps alpha = 1 scale = (2.0, 2.0) time = <float_time> rot_angle = <randrotB> motion = ease_in
	SE_WaitProps
	SE_SetProps alpha = 0 scale = (0.0, 0.0) time = <float_time> rot_angle = <randrotC> motion = ease_out
	SE_WaitProps
	DestroyScreenElement id = <objID>
endscript

script ui_anim_carbonate \{max_interval = 2.0
		float_time = 2
		start_dims = (20.0, 20.0)
		Color = [
			200
			100
			185
			255
		]}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	GetRandomValue name = my_X integer a = 1 b = <element_width>
	GetRandomValue name = my_Y integer a = 1 b = <element_height>
	my_pos = (((1.0, 0.0) * <my_X>) + ((0.0, 1.0) * <my_Y>))
	CreateScreenElement {
		type = ContainerElement
		parent = <objID>
		just = [center center]
		Pos = <my_pos>
		dims = <start_dims>
		alpha = 0
	}
	<id> :Obj_SpawnScript ui_anim_carbonate_element params = {Color = <Color> float_time = <float_time> start_dims = <start_dims>}
	GetRandomValue name = r a = 0 b = <max_interval>
	wait <r> seconds
	repeat
endscript

script ui_anim_carbonate_element 
	Obj_GetID
	SE_GetProps
	startpos = <Pos>
	endpos = (<startpos> + (0.0, -100.0))
	midpos = (<startpos> + (0.0, -50.0))
	time = (<float_time> * 0.5)
	pos_offset = Random (@ (0.0, 20.0) @ (5.0, 5.0) @ (-20.0, 0.0) @ (-5.0, -5.0) )
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = <Color>
		dims = <start_dims>
		just = (0.0, 0.0)
		alpha = 1
		Pos = <pos_offset>
		blend = add
	}
	rand_rot = Random (@ qs(0xa2e01ca3) @ qs(0xbbaa1ade) )
	switch <rand_rot>
		case qs(0xa2e01ca3)
		SE_SetProps Pos = <midpos> alpha = 1 scale = (0.2, 0.2) rot_angle = 180 time = <time> motion = ease_in
		wait <time> seconds
		SE_SetProps Pos = <endpos> alpha = 0 scale = (1.5, 1.5) rot_angle = 359 time = <time> motion = ease_out
		wait <time> seconds
		default
		SE_SetProps Pos = <midpos> alpha = 1 scale = (0.2, 0.2) rot_angle = -180 time = <time> motion = ease_in
		wait <time> seconds
		SE_SetProps Pos = <endpos> alpha = 0 scale = (1.5, 1.5) rot_angle = -359 time = <time> motion = ease_out
		wait <time> seconds
	endswitch
	DestroyScreenElement id = <objID>
endscript

script ui_anim_glitter \{max_interval = 0.5
		float_time = 0.3
		start_dims = (10.0, 10.0)
		Color = [
			200
			100
			185
			255
		]}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	GetRandomValue name = my_X integer a = 1 b = <element_width>
	GetRandomValue name = my_Y integer a = 1 b = <element_height>
	my_pos = (((1.0, 0.0) * <my_X>) + ((0.0, 1.0) * <my_Y>))
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = <Color>
		dims = <start_dims>
		just = [center center]
		alpha = 1.0
		Pos = <my_pos>
		blend = add
	}
	<id> :Obj_SpawnScript ui_anim_glitter_element params = {float_time = <float_time>}
	GetRandomValue name = r a = 0 b = <max_interval>
	wait <r> seconds
	repeat
endscript

script ui_anim_glitter_element 
	Obj_GetID
	SE_GetProps
	startpos = <Pos>
	endpos = (<startpos> + (0.0, -4.0))
	SE_SetProps Pos = <endpos> alpha = 0 scale = (0.3, 0.3) time = <float_time> motion = ease_out
	wait <float_time> seconds
	DestroyScreenElement id = <objID>
endscript

script ui_anim_glitter2 \{max_interval = 0.5
		float_time = 0.3
		start_dims = (10.0, 10.0)
		Color = [
			200
			100
			185
			255
		]}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	begin
	GetRandomValue name = my_X integer a = 1 b = <element_width>
	GetRandomValue name = my_Y integer a = 1 b = <element_height>
	my_pos = (((1.0, 0.0) * <my_X>) + ((0.0, 1.0) * <my_Y>))
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = <Color>
		dims = <start_dims>
		just = [center center]
		alpha = 1.0
		Pos = <my_pos>
		blend = blend
	}
	<id> :Obj_SpawnScript ui_anim_glitter_element2 params = {float_time = <float_time>}
	GetRandomValue name = r a = 0 b = <max_interval>
	wait <r> seconds
	repeat
endscript

script ui_anim_glitter_element2 
	Obj_GetID
	SE_GetProps
	startpos = <Pos>
	endpos = (<startpos> + (0.0, -4.0))
	SE_SetProps Pos = <endpos> alpha = 0 scale = (0.3, 0.3) time = <float_time> motion = ease_out
	wait <float_time> seconds
	DestroyScreenElement id = <objID>
endscript

script ui_sheen \{Color = GH51_purple_lt}
	SE_GetProps
	Obj_GetID
	element_pos = <Pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	CastToInteger \{element_width}
	CastToInteger \{element_height}
	printstruct channel = zdebug <...>
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		rgba = <Color>
		dims = (25.0, 50.0)
		Color = <Color>
		just = [center center]
		alpha = 0
		blend = add
		Pos = (40.0, 15.0)
		scale = (0.5, 0.8)
		rot_angle = 0
		z_priority = 4
	}
	starting_pos = (40.0, 15.0)
	middle_pos = (160.0, 15.0)
	end_pos = (260.0, 15.0)
	begin
	<id> :SE_SetProps Pos = <starting_pos> alpha = 0 scale = (0.2, 0.8) rot_angle = 40
	<id> :SE_WaitProps
	<id> :SE_SetProps Pos = <middle_pos> alpha = 0.4 scale = (1.1, 1.3) rot_angle = 45 time = 0.8 motion = ease_in
	<id> :SE_WaitProps
	<id> :SE_SetProps Pos = <end_pos> alpha = 0 scale = (0.2, 0.8) rot_angle = 45 time = 0.8 motion = ease_out
	<id> :SE_WaitProps
	wait \{2.7
		seconds}
	repeat
endscript

script sheen_highlight 
	Obj_GetID
	SE_GetProps
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (10.0, 10.0)
		Color = GH51_purple_lt
		just = [center center]
		alpha = 0.3
		blend = add
		Pos = (50.0, 10.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 3
	}
	p1 = (50.0, 20.0)
	p2 = (((<x_dim> - 25) * (1.0, 0.0)) + (0.0, 20.0))
	p3 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 20.0))
	p4 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 10.0))
	p5 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 10.0))
	p6 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 0.0))
	p7 = (((<x_dim> - 175) * (1.0, 0.0)) + (0.0, 0.0))
	p8 = (20.0, 0.0)
	p9 = (10.0, 5.0)
	begin
	wait \{1
		seconds}
	<id> :SE_SetProps alpha = 0 scale = (0.8, 7.0) Pos = <p1> rot_angle = 20 time = 0.5
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.4 scale = (0.8, 5.0) Pos = <p2> rot_angle = 30 time = 0.8
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.1 scale = (0.5, 1.2) Pos = <p3> rot_angle = 20 time = 0.3
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.1 scale = (1.0, 1.0) Pos = <p4> rot_angle = 10 time = 0.01
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.0 scale = (0.0, 0.0) Pos = <p5> rot_angle = 10 time = 0.01
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.1 scale = (1.0, 1.0) Pos = <p6> rot_angle = 0 time = 0.2
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.4 scale = (1.08, 1.1) Pos = <p7> time = 0.8
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.2 scale = (1.0, 1.0) Pos = <p8> rot_angle = 0 time = 0.4
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.0 scale = (1.0, 1.0) Pos = <p9> rot_angle = 0 time = 0.4
	<id> :SE_WaitProps
	wait \{1
		seconds}
	repeat
endscript

script sheen_highlight_bottom 
	Obj_GetID
	SE_GetProps
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	CreateScreenElement {
		type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (10.0, 10.0)
		Color = GH51_purple_lt
		just = [center center]
		alpha = 0.3
		blend = add
		Pos = (280.0, 15.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 3
	}
	p1 = (((<x_dim> + 5) * (1.0, 0.0)) + (0.0, 32.0))
	p2 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 32.0))
	p3 = (((<x_dim> - 175) * (1.0, 0.0)) + (0.0, 32.0))
	p4 = (20.0, 32.0)
	p5 = (10.0, 20.0)
	begin
	wait \{2.62
		seconds}
	<id> :SE_SetProps alpha = 0.0 scale = (0.0, 0.0) Pos = <p1> rot_angle = 10 time = 0.01
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.1 scale = (0.0, 0.0) Pos = <p1> time = 0.01
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.1 scale = (1.0, 1.0) Pos = <p2> time = 0.2
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.4 scale = (1.08, 1.1) Pos = <p3> time = 0.8
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.2 scale = (1.0, 1.0) Pos = <p4> time = 0.4
	<id> :SE_WaitProps
	<id> :SE_SetProps alpha = 0.0 scale = (1.0, 1.0) Pos = <p5> time = 0.4
	<id> :SE_WaitProps
	wait \{1
		seconds}
	repeat
endscript
