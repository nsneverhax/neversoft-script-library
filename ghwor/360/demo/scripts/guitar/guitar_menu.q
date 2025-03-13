user_control_pill_color = [
	180
	180
	180
	255
]
user_control_pill_text_color = [
	230
	230
	230
	255
]
default_event_handlers = [
	{
		pad_up
		ui_sfx
		params = {
			menustate = generic
			uitype = scrollup
		}
	}
	{
		pad_down
		ui_sfx
		params = {
			menustate = generic
			uitype = scrolldown
		}
	}
	{
		pad_back
		ui_sfx
		params = {
			menustate = generic
			uitype = back
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
	burnt_red = [
		90
		30
		30
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
	if gotparam \{color}
		if structurecontains structure = ($g_menu_colors) <color>
			if NOT ($menu_focus_color = (($g_menu_colors).<color>))
				change menu_focus_color = (($g_menu_colors).<color>)
			endif
			return
		else
			printf \{qs(0x184960bb)}
		endif
	endif
	if gotparam \{rgba}
		if NOT ($menu_focus_color = <rgba>)
			change menu_focus_color = <rgba>
			printf \{qs(0x184960bb)}
		endif
		return
	endif
	if NOT ($menu_focus_color = (($g_menu_colors).($default_menu_focus_color)))
		change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
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
			printf \{qs(0x6f4ce852)}
		endif
	endif
	if gotparam \{rgba}
		if NOT ($menu_unfocus_color = <rgba>)
			change menu_unfocus_color = <rgba>
			printf \{qs(0x6f4ce852)}
		endif
		return
	endif
	if NOT ($menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color)))
		change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
	endif
endscript

script reset_focus_colors 
	change menu_focus_color = (($g_menu_colors).($default_menu_focus_color))
	change menu_unfocus_color = (($g_menu_colors).($default_menu_unfocus_color))
endscript

script retail_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
			endif
			<id> :se_setprops rgba = ($menu_focus_color)
			if gotparam \{fire_font}
				setscreenelementprops id = <id> font = fontgrid_text_a1 material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
			endif
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
		endif
		setprops rgba = ($menu_focus_color)
		if gotparam \{fire_font}
			setprops \{font = fontgrid_text_a1
				material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire}
		endif
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
			<id> :se_setprops rgba = ($menu_unfocus_color) font = <old_font> material = null
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
			font = fontgrid_text_a1
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
		get_savegame_from_controller controller = ($primary_controller)
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
				if issongavailable song_checksum = <song_checksum> song = (<tierlist>.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus> savegame = <savegame>
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
	if gotparam \{focus_color}
		set_focus_color color = <focus_color>
		<default_colors> = 0
	endif
	if gotparam \{unfocus_color}
		set_unfocus_color color = <unfocus_color>
		<default_colors> = 0
	endif
	if (<default_colors>)
		reset_focus_colors
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

script options_change_tilt_star_power 
	getplayerinfo <player> use_tilt_for_starpower
	get_savegame_from_player player = <player>
	if (<use_tilt_for_starpower> = 1)
		setplayerinfo <player> use_tilt_for_starpower = 0
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 0}
		<new_texture> = options_controller_x
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleoff
		else
			ui_sfx \{menustate = generic
				uitype = toggleoff}
		endif
	else
		setplayerinfo <player> use_tilt_for_starpower = 1
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = 1}
		<new_texture> = options_controller_check
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleon
		else
			ui_sfx \{menustate = generic
				uitype = toggleon}
		endif
	endif
	if gotparam \{icon_id}
		<icon_id> :setprops texture = <new_texture>
	else
		if isobjectscript
			obj_getid
			if resolvescreenelementid id = {<objid> child = tilt_check}
				<resolved_id> :setprops texture = <new_texture>
			endif
		endif
	endif
endscript

script options_change_touch_strip_option 
	getplayerinfo <player> enable_touch_strip
	get_savegame_from_player player = <player>
	if (<enable_touch_strip> = 1)
		setplayerinfo <player> enable_touch_strip = 0
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = 0}
		<new_texture> = options_controller_x
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleoff
		else
			ui_sfx \{menustate = generic
				uitype = toggleoff}
		endif
	else
		setplayerinfo <player> enable_touch_strip = 1
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = 1}
		<new_texture> = options_controller_check
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleon
		else
			ui_sfx \{menustate = generic
				uitype = toggleon}
		endif
	endif
	if gotparam \{icon_id}
		<icon_id> :setprops texture = <new_texture>
	else
		if isobjectscript
			obj_getid
			if resolvescreenelementid id = {<objid> child = touch_check}
				<resolved_id> :setprops texture = <new_texture>
			endif
		endif
	endif
endscript

script options_change_vocal_star_power_tap 
	getplayerinfo <player> vocal_star_power_tap
	get_savegame_from_player player = <player>
	if (<vocal_star_power_tap> = 1)
		setplayerinfo <player> vocal_star_power_tap = 0
		setglobaltags savegame = <savegame> user_options params = {vocal_star_power_tap_save = 0}
		<new_texture> = options_controller_x
		ui_sfx \{menustate = generic
			uitype = toggleoff}
	else
		setplayerinfo <player> vocal_star_power_tap = 1
		setglobaltags savegame = <savegame> user_options params = {vocal_star_power_tap_save = 1}
		<new_texture> = options_controller_check
		ui_sfx \{menustate = generic
			uitype = toggleon}
	endif
	if gotparam \{icon_id}
		<icon_id> :setprops texture = <new_texture>
	else
		if isobjectscript
			obj_getid
			if resolvescreenelementid id = {<objid> child = touch_check}
				<resolved_id> :setprops texture = <new_texture>
			endif
		endif
	endif
endscript

script options_change_vocals_mic_enhancement \{savegame = !i1768515945}
	getglobaltags savegame = <savegame> user_options param = vocals_mic_enhancement_save
	<mic_enhancement> = <vocals_mic_enhancement_save>
	if (<mic_enhancement> = 1)
		setglobaltags savegame = <savegame> user_options params = {vocals_mic_enhancement_save = 0}
		<new_texture> = options_controller_x
		audio_set_microphone_eq \{effect = off}
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleoff
		else
			ui_sfx \{menustate = audio_options
				uitype = toggleoff}
		endif
	else
		setglobaltags savegame = <savegame> user_options params = {vocals_mic_enhancement_save = 1}
		<new_texture> = options_controller_check
		audio_set_microphone_eq \{effect = on}
		if gotparam \{in_band_lobby}
			audio_ui_band_lobby_sfx_logic player = <player> toggleon
		else
			ui_sfx \{menustate = audio_options
				uitype = toggleon}
		endif
	endif
	if gotparam \{icon_id}
		<icon_id> :setprops texture = <new_texture>
	else
		if isobjectscript
			obj_getid
			if resolvescreenelementid id = {<objid> child = check}
				<resolved_id> :setprops texture = <new_texture>
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
	change user_control_pill_color = <bg_rgba>
	change \{user_control_pill_text_color = [
			230
			230
			230
			255
		]}
endscript

script clean_up_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		destroyscreenelement \{id = user_control_container}
	endif
	if screenelementexists \{id = custom_setlist_continue_helper}
		destroyscreenelement \{id = custom_setlist_continue_helper}
	endif
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	change \{user_control_pill_text_color = [
			230
			230
			230
			255
		]}
	set_user_control_color
endscript

script user_control_helper_get_buttonchar {
		0x52 controller = ($primary_controller)
	}
	if isxenonorwindx
		removeparameter \{all_buttons}
	endif
	getenterbuttonassignment
	if isps3
		if isdrumcontroller controller = <controller>
			force_pad_button = 1
			ps3_override_buttons = 1
		endif
	endif
	if gotparam \{button}
		switch (<button>)
			case green
			buttonchar = qs(0xac29f74c)
			if gotparam \{force_pad_button}
				buttonchar = qs(0xdf67b4d9)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xa11b5a77)
				if (<assignment> = circle)
					buttonchar = qs(0x74aa6ba8)
				endif
			endif
			case red
			buttonchar = qs(0xb532c60d)
			if gotparam \{force_pad_button}
				buttonchar = qs(0xc67c8598)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x74aa6ba8)
				if (<assignment> = circle)
					buttonchar = qs(0xa11b5a77)
				endif
			endif
			case yellow
			buttonchar = qs(0x9e1f95ce)
			if gotparam \{force_pad_button}
				buttonchar = qs(0xf44ae71a)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x1da23f16)
			endif
			case blue
			buttonchar = qs(0x8704a48f)
			if gotparam \{force_pad_button}
				buttonchar = qs(0xed51d65b)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xc8130ec9)
			endif
			case orange
			buttonchar = qs(0xc8453248)
			if gotparam \{ps3_override_buttons}
				buttonchar = qs(0x1d28995e)
			elseif gotparam \{force_pad_button}
				buttonchar = qs(0x9f330107)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x45f2b620)
			endif
			case strumbar
			buttonchar = qs(0x72fe6f1c)
			case back
			buttonchar = qs(0x0f899b59)
			if gotparam \{ps3_override_buttons}
				buttonchar = qs(0x25885c53)
			elseif gotparam \{force_pad_button}
				buttonchar = qs(0xc969a681)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0x163cc2b3)
			endif
			case start
			buttonchar = qs(0x24a4c89a)
			if gotparam \{ps3_override_buttons}
				buttonchar = qs(0x57ea8b0f)
			elseif gotparam \{force_pad_button}
				buttonchar = qs(0x0433a81f)
			endif
			if gotparam \{all_buttons}
				buttonchar = qs(0xc1c53668)
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
			case pad_right
			buttonchar = qs(0x2a9d7f4a)
			case pad_left_right
			buttonchar = qs(0x86283046)
		endswitch
	else
		buttonchar = qs(0x03ac90f0)
	endif
	return {buttonchar = <buttonchar>}
endscript

script should_use_all_buttons 
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

script get_controller_or_gamertag_text_name \{controller = !i1768515945}
	formattext textname = caption qs(0xedc03e4e) d = (<controller> + 1)
	if isxenonorwindx
		if getlocalgamertag controller = <controller>
			if NOT (<gamertag> = qs(0x03ac90f0))
				caption = <gamertag>
			endif
		endif
	else
		netsessionfunc \{func = update_gamertag}
		if netsessionfunc obj = match func = get_gamertag params = {controller = <controller>}
			if (<controller> = ($primary_controller))
				formattext textname = caption qs(0x9436b93a) s = <name> d = (<controller> + 1)
			else
				caption = <name>
			endif
		endif
	endif
	return controller_text = <caption>
endscript

script add_gamertag_helper \{z = 100000}
	if NOT gotparam \{exclusive_device}
		return
	endif
	if NOT isarray <exclusive_device>
		if NOT ischecksum <exclusive_device>
			if NOT ((<exclusive_device> < 0) || (<exclusive_device> > 3))
				get_controller_or_gamertag_text_name controller = <exclusive_device>
				caption = <controller_text>
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
					if isguitarcontroller controller = <exclusive_device>
						icon_texture = mixer_icon_guitar
					elseif isdrumcontroller controller = <exclusive_device>
						icon_texture = mixer_icon_drums
					else
						getactivecontrollers
						if (<active_controllers> [<exclusive_device>] = 1)
							icon_texture = mixer_icon_vox
						else
							icon_texture = null
						endif
					endif
				endif
				if (<icon_texture> != null)
					add_user_control_helper gamertag = <caption> icon_texture = <icon_texture> z = <z>
					<helper_pill_id> :obj_spawnscript gamertag_helper_update params = {caption = <caption> exclusive_device = <exclusive_device>}
				endif
			endif
		endif
	endif
endscript

script gamertag_helper_update 
	old_caption = <caption>
	formattext textname = ps3_caption qs(0xedc03e4e) d = (<exclusive_device> + 1)
	begin
	caption = <ps3_caption>
	if isxenonorwindx
		if getlocalgamertag controller = <exclusive_device>
			if NOT (<gamertag> = qs(0x03ac90f0))
				caption = <gamertag>
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
		generate_helper_pill_id = true
		override_parent = null}
	if isxenonorwindx
		removeparameter \{all_buttons}
	endif
	if NOT screenelementexists \{id = user_control_container}
		createscreenelement {
			id = user_control_container
			parent = root_window
			type = menuelement
			dims = (1124.0, 40.0)
			scale = (0.7, 0.7)
			pos = (0.0, -48.0)
			pos_anchor = [center bottom]
			just = [center bottom]
			internal_just = [center center]
			isvertical = false
			position_children = true
			fit_major = `fit content if larger`
			fit_minor = `keep dims`
			spacing_between = 10
			z_priority = <z>
		}
	else
		user_control_container :se_setprops z_priority = <z>
	endif
	if gotparam \{override_struct}
		params_struct = {
			helper_pill_rgba = (<override_struct>.pill_rgba)
			helper_description_rgba = (<override_struct>.pill_text_rgba)
			helper_pill_end_l_texture = (<override_struct>.texture_end)
			helper_pill_body_texture = (<override_struct>.texture_body)
			helper_pill_end_r_texture = (<override_struct>.texture_end)
		}
	else
		params_struct = {
			helper_pill_rgba = $user_control_pill_color
			helper_description_rgba = $user_control_pill_text_color
		}
	endif
	if gotparam \{gamertag}
		destroyscreenelement \{id = gamertag_helper_pill_id}
		createscreenelement {
			parent = user_control_container
			id = gamertag_helper_pill_id
			type = descinterface
			desc = 'helper_gamertag_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			helper_button_texture = <icon_texture>
			helper_description_text = <gamertag>
			<params_struct>
		}
		user_control_container :menu_setitemindex \{id = gamertag_helper_pill_id
			newindex = 0}
	else
		if (<generate_helper_pill_id> = true)
			if (<override_parent> != null)
				extendcrc <button> '_alternate_helper_pill_ID' out = helper_pill_id
			else
				extendcrc <button> '_helper_pill_ID' out = helper_pill_id
			endif
		endif
		if (<button> != none)
			user_control_helper_get_buttonchar <...> button = <button>
			if gotparam \{another_button}
				<buttonchar1> = <buttonchar>
				removeparameter \{buttonchar}
				if (<another_button> != none)
					user_control_helper_get_buttonchar <...> button = <another_button>
					<buttonchar2> = <buttonchar>
					removeparameter \{buttonchar}
					formattext textname = buttonchar qs(0x28c4c672) a = <buttonchar1> b = <buttonchar2>
				endif
			endif
			addparam structure_name = params_struct name = helper_button_text value = <buttonchar>
		endif
		<parent> = user_control_container
		if (<override_parent> != null)
			<parent> = <override_parent>
		endif
		if gotparam \{controller}
			if (<controller> >= 4 || <controller> < 0)
				removeparameter \{controller}
			endif
		endif
		createscreenelement {
			parent = <parent>
			id = <helper_pill_id>
			type = descinterface
			desc = 'helper_pill'
			auto_dims = false
			dims = (0.0, 36.0)
			pos = <pos>
			pos_anchor = <pos_anchor>
			just = <just>
			scale = <scale>
			helper_description_text = <text>
			<params_struct>
			metaremapdevicetouse = <controller>
		}
		if (<button> != none)
			if gotparam \{all_buttons}
				if <id> :desc_resolvealias name = alias_helper_button
					<resolved_id> :se_setprops {
						metaremapenable = false
						text = <buttonchar>
					}
				endif
			else
				if gotparam \{controller}
					if NOT (<controller> = $primary_controller)
						if <id> :desc_resolvealias name = alias_helper_button
							<resolved_id> :se_setprops {
								metaremapenableauto = false
								metaremapdevicetouse = <controller>
								text = <buttonchar>
							}
						endif
					endif
				endif
			endif
		endif
	endif
	<id> :se_getprops
	if gotparam \{override_struct}
		<id> :se_setprops {
			helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 49.0))
			helper_pill_end_dims = (46.0, 49.0)
			dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (92.0, 49.0))
		}
	else
		<id> :se_setprops {
			helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
			dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
		}
	endif
	if (<override_parent> != null)
		<id> :obj_spawnscriptnow helper_pill_overriden_parent_watcher_script
	endif
	return helper_pill_id = <id>
endscript

script add_super_user_control_helper \{text = 0x69696969
		button = orange
		reorder_index = -1
		z = 100000
		rgba = [
			255
			255
			255
			255
		]}
	if gotparam \{all_buttons}
		<all_buttons> = 1
	endif
	add_user_control_helper {
		text = <text>
		button = <button>
		z = <z>
		controller = <controller>
		all_buttons = <all_buttons>
		override_struct = {
			texture_end = helper_pill_super_end
			texture_body = helper_pill_super_body
			pill_rgba = <rgba>
			pill_text_rgba = gh6_gold
		}
	}
	<helper_pill_id> :obj_spawnscriptnow ui_anim_sheen_pill_simple
	if (-1 < <reorder_index>)
		user_control_helper_reorder button = <button> new_index = <reorder_index>
	endif
endscript

script helper_pill_overriden_parent_watcher_script 
	setscriptcannotpause
	begin
	if (($g_controller_unplugged_dialog_up = 1) || ($g_disconnect_quit_warning_shown = 1) || ($g_memcard_state_active = 1))
		se_setprops \{alpha = 0.0}
	else
		se_setprops \{alpha = 1.0}
	endif
	wait \{1
		gameframe}
	repeat
endscript

script show_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		user_control_container :se_setprops \{alpha = 1.0}
	endif
endscript

script hide_user_control_helpers 
	if screenelementexists \{id = user_control_container}
		user_control_container :se_setprops \{alpha = 0.0}
	endif
endscript

script user_control_helper_change_text 
	requireparams \{[
			button
			text
		]
		all}
	extendcrc <button> '_helper_pill_ID' out = helper_pill_id
	if screenelementexists id = <helper_pill_id>
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
	requireparams \{[
			button
		]
		all}
	extendcrc <button> '_helper_pill_ID' out = helper_pill_id
	if screenelementexists id = <helper_pill_id>
		destroyscreenelement id = <helper_pill_id>
	endif
endscript

script user_control_helper_exists 
	requireparams \{[
			button
		]
		all}
	extendcrc <button> '_helper_pill_ID' out = helper_pill_id
	if screenelementexists id = <helper_pill_id>
		return \{true}
	else
		return \{false}
	endif
endscript

script user_control_helper_get_index 
	requireparams \{[
			button
		]
		all}
	extendcrc <button> '_helper_pill_ID' out = helper_pill_id
	if screenelementexists id = <helper_pill_id>
		getscreenelementchildren \{id = user_control_container}
		getarraysize <children>
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
		scriptassert \{qs(0xe9420fad)}
	endif
endscript

script user_control_helper_reorder 
	requireparams \{[
			button
			new_index
		]
		all}
	extendcrc <button> '_helper_pill_ID' out = helper_pill_id
	if screenelementexists id = <helper_pill_id>
		user_control_helper_get_index button = <button>
		if gotparam \{index}
			user_control_container :menu_setitemindex index = <index> newindex = <new_index>
		else
			scriptassert \{qs(0xa2043430)}
		endif
	else
		scriptassert \{qs(0xa2043430)}
	endif
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
		ticker_font = fontgrid_text_a1
		ticker_rgba1 = (($g_menu_colors).white230)
		ticker_rgba2 = (($g_menu_colors).white230)
		ticker_alpha = 1.0
		ticker_z_priority = -1
		use_shadow = 0
		ticker_shadow_rgba = [0 0 0 255]
		time = 5
	}
	formattext \{checksumname = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		i = $g_num_scrolling_texts}
	createscreenelement {
		type = textelement
		just = <ticker_just>
		id = <ticker_text_id_1>
		parent = <ticker_parent>
		pos = <ticker_pos>
		scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <ticker_text>
		rgba = <ticker_rgba1>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	if (<use_shadow> = 1)
		<id> :se_setprops {
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = <ticker_shadow_rgba>
		}
	endif
	getscreenelementdims id = <ticker_text_id_1>
	if (<width> > 0)
		multi = (1280 / <width>)
	else
		scriptassert \{qs(0xa5684ae5)}
	endif
	ticker_text_with_space = (<ticker_text> + <ticker_space>)
	long_ticker_text = <ticker_text_with_space>
	stringlength string = <ticker_text_with_space>
	<ticker_text_with_space_length> = <str_len>
	begin
	stringlength string = <long_ticker_text>
	<long_ticker_text_length> = <str_len>
	if NOT (<long_ticker_text_length> < (127 - <ticker_text_with_space_length>))
		break
	endif
	<long_ticker_text> = (<long_ticker_text> + <ticker_text_with_space>)
	<ticker_text_id_1> :se_setprops text = <long_band_text>
	getscreenelementdims id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	<ticker_text_id_1> :se_setprops text = <long_ticker_text> pos = <ticker_pos>
	formattext \{checksumname = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		i = $g_num_scrolling_texts}
	createscreenelement {
		id = <ticker_text_id_2>
		type = textelement
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
		<id> :se_setprops {
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = <ticker_shadow_rgba>
		}
	endif
	getscreenelementdims id = <ticker_text_id_1>
	<ticker_text_id_2> :se_setprops pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	<first> = 1
	begin
	<ticker_x> = (<ticker_pos>.(1.0, 0.0))
	<ticker_y> = (<ticker_pos>.(0.0, 1.0))
	<pos1> = (((-1.0, 0.0) * <width>) + ((0.0, 1.0) * <ticker_y>))
	<pos2> = <ticker_pos>
	if (<first>)
		<ticker_text_id_1> :se_setprops pos = <pos1> time = <time>
		<ticker_text_id_2> :se_setprops pos = <pos2> time = <time>
	else
		<ticker_text_id_2> :se_setprops pos = <pos1> time = <time>
		<ticker_text_id_1> :se_setprops pos = <pos2> time = <time>
	endif
	wait <time> seconds
	if ((screenelementexists id = <ticker_text_id_1>) && (screenelementexists id = <ticker_text_id_2>))
		if (<first>)
			<ticker_text_id_1> :se_setprops pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_2> :se_setprops pos = <ticker_pos>
			<first> = 0
		else
			<ticker_text_id_2> :se_setprops pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
			<ticker_text_id_1> :se_setprops pos = <ticker_pos>
			<first> = 1
		endif
	else
		return
	endif
	repeat
endscript

script ui_frazz_something 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.1, 0.3) @ (0.9, 1.0) )
	se_setprops scale = <scale> rgba = [255 255 255 255] time = 0.2
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)
		rgba = [
			200
			220
			255
			255
		]}
	se_waitprops
	repeat
endscript

script ui_frazzmatazz 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@ (1) @ (0.3) @ (0.4) @ (0.5) @ (0.6) @ (0.8) )
	se_setprops alpha = <alpha> scale = <scale> time = 1
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)}
	se_waitprops
	wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_02 
	begin
	scale = Random (@*10 (1.0, 1.0) @ (1.05, 1.05) @ (1.1, 1.1) @ (1.05, 1.05) @ (1.03, 1.03) )
	alpha = Random (@ (0.25) @ (0.1) @ (0.2) @ (0.15) @ (0.2) @ (0.1) )
	se_setprops alpha = <alpha> scale = <scale> time = 1
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)}
	se_waitprops
	wait \{1
		gameframe}
	repeat
endscript

script ui_frazzmatazz_03 
	begin
	alpha = Random (@ (0.9) @ (0.8) @ (0.7) @*5 (1.0) )
	se_setprops alpha = <alpha> time = 0.1
	se_waitprops
	wait \{1
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
	se_setprops \{alpha = 0.25
		scale = 0.97999996
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 1.01
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_alphablink_02 
	begin
	se_setprops \{alpha = 0.25
		scale = 0.97999996
		time = 0.8}
	wait \{0.8
		seconds}
	se_setprops \{alpha = 0.5
		scale = 1.01
		time = 0.8}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_pulse 
	begin
	se_setprops \{alpha = 1
		scale = 0.7
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 0.81
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_pulse2 
	begin
	se_setprops \{alpha = 1
		scale = 1.001
		time = 0.3}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.7
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

script ui_pulse3 
	begin
	se_setprops \{alpha = 1
		scale = 1
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.6
		scale = 1
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_pulse4 
	begin
	se_setprops \{alpha = 1
		scale = 1
		time = 0.3}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.7
		scale = 1.2
		time = 0.3}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_pulse5 
	begin
	se_setprops \{alpha = 1
		scale = 0.9
		time = 0.3}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.7
		scale = 1
		time = 0.3}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_pulse6 
	begin
	se_setprops \{alpha = 1
		scale = 1.0
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 0.89
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_ff_loading_pulse 
	begin
	se_setprops \{alpha = 1
		scale = 0.9
		time = 0.35000002}
	wait \{0.35000002
		seconds}
	se_setprops \{alpha = 0.7
		scale = 1.1
		time = 0.35000002}
	wait \{0.35000002
		seconds}
	repeat
endscript

script ui_meter_pulse 
	begin
	se_setprops \{alpha = 1
		scale = 1
		time = 0.3}
	wait \{0.35000002
		seconds}
	se_setprops \{alpha = 0.6
		scale = 1
		time = 0.3}
	wait \{0.3
		seconds}
	repeat
endscript

script ui_band_lobby_pulse 
	se_setprops \{alpha = 0.7}
	begin
	se_setprops \{alpha = 1
		time = 0.2}
	wait \{0.2
		seconds}
	se_setprops \{alpha = 0.35000002
		time = 0.2}
	wait \{0.2
		seconds}
	repeat
endscript

script ui_band_lobby_leader_pulse 
	se_setprops \{alpha = 0.7}
	begin
	se_setprops \{alpha = 0.7
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.35000002
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_song_stars_earned_pulse \{time = 0.0}
	if (<time> <= 0.0)
		<time> = 0.35000002
	endif
	se_setprops alpha = 1 scale = 1 time = (<time> / 6)
	wait (<time> / 6) seconds
	se_setprops alpha = 1 scale = 2 time = (<time> / 6)
	wait (<time> / 6) seconds
	se_setprops alpha = 0 scale = 3 time = (<time> / 6)
	wait (<time> / 6) seconds
	se_setprops \{alpha = 0
		scale = 1}
endscript

script ui_jerky 
	se_setprops \{pos = (-114.0, -30.0)
		time = 0.5}
	se_waitprops
	se_setprops \{pos = (-114.0, 20.0)
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (-114.0, -1.0)
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1.02
		rot_angle = -1.5
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 0.96
		rot_angle = -2
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1
		rot_angle = 0
		time = 0.03}
	se_waitprops
endscript

script ui_jerky2 
	se_setprops \{scale = 0.97999996
		rot_angle = -2
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1.01
		rot_angle = -1.5
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1
		rot_angle = 0
		time = 0.03}
	se_waitprops
	se_setprops \{scale = 0.98999995
		rot_angle = -1
		time = 0.01}
	se_waitprops
	se_setprops \{scale = 1.02
		rot_angle = 1.2
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1
		rot_angle = 0
		time = 0.01}
	se_waitprops
endscript

script ui_winnericon 
	wait \{0.7
		seconds}
	se_setprops \{pos = (-209.0, 32.0)
		rot_angle = -0.9
		scale = 0.9
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (-211.0, 29.0)
		rot_angle = 1.02
		scale = 0.62
		time = 0.06}
	se_waitprops
	se_setprops \{pos = (-209.0, 29.0)
		rot_angle = -0.86
		scale = 0.85
		time = 0.07}
	se_waitprops
	se_setprops \{pos = (-211.0, 29.0)
		rot_angle = 0.95
		scale = 0.68
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (-210.0, 30.0)
		rot_angle = 0
		scale = 0.7
		time = 0.05}
	se_waitprops
endscript

script ui_winnericon_team 
	wait \{1.2
		seconds}
	se_setprops \{pos = (1.0, -800.0)
		alpha = 0
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (1.0, -2.0)
		rot_angle = 1.02
		scale = 0.62
		time = 0.06}
	se_setprops \{pos = (0.0, 2.0)
		rot_angle = -0.86
		scale = 0.85
		alpha = 1
		time = 0.07}
	se_waitprops
	se_setprops \{pos = (-1.0, -1.0)
		rot_angle = 0.95
		scale = 0.68
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (-3.0, 5.0)
		rot_angle = 0
		scale = 0.8
		time = 0.05}
	se_waitprops
endscript

script ui_winnericon_team_session 
	wait \{1.2
		seconds}
	se_setprops \{pos = (-188.0, -170.0)
		rot_angle = -0.9
		scale = 0.9
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (-188.0, -172.0)
		rot_angle = 1.02
		scale = 0.62
		time = 0.06}
	se_waitprops
	se_setprops \{pos = (-190.0, -169.0)
		rot_angle = -0.86
		scale = 0.85
		time = 0.07}
	se_waitprops
	se_setprops \{pos = (-186.0, -171.0)
		rot_angle = 0.95
		scale = 0.68
		time = 0.08}
	se_waitprops
	se_setprops \{pos = (-188.0, -170.0)
		rot_angle = 0
		scale = 0.8
		time = 0.05}
	se_waitprops
endscript

script ui_jerky_team1 
	se_setprops \{alpha = 0}
	se_setprops \{pos = (23.0, -800.0)
		alpha = 0
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (23.0, -590.0)
		time = 1}
	wait \{0.7
		seconds}
	se_setprops \{pos = (23.0, 57.0)
		alpha = 1
		time = 0.25}
	se_waitprops
	se_setprops \{pos = (23.0, 60.0)
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (23.0, 85.0)
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1.02
		rot_angle = -1.5
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 0.96
		rot_angle = -2
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1
		rot_angle = 0
		time = 0.03}
	se_waitprops
endscript

script ui_jerky_team2 
	se_setprops \{alpha = 0}
	se_setprops \{pos = (23.0, 800.0)
		alpha = 0
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (23.0, 590.0)
		time = 1}
	wait \{0.7
		seconds}
	se_setprops \{pos = (23.0, 57.0)
		alpha = 1
		time = 0.25}
	se_waitprops
	se_setprops \{pos = (23.0, 60.0)
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (23.0, 85.0)
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1.02
		rot_angle = -1.5
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 0.96
		rot_angle = -2
		time = 0.02}
	se_waitprops
	se_setprops \{scale = 1
		rot_angle = 0
		time = 0.03}
	se_waitprops
endscript

script ui_jerky_team_session1 
	se_setprops \{alpha = 0}
	se_setprops \{pos = (-1000.0, 160.0)
		alpha = 0
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (-807.0, 160.0)
		time = 0.3}
	wait \{0.7
		seconds}
	se_setprops \{pos = (468.0, 160.0)
		alpha = 1
		time = 0.25}
	se_waitprops
	se_setprops \{pos = (473.0, 160.0)
		scale = 1.02
		rot_angle = -1.5
		time = 0.01}
	se_waitprops
	se_setprops \{pos = (471.0, 160.0)
		scale = 0.96
		rot_angle = -2
		time = 0.01}
	se_waitprops
	se_setprops \{pos = (460.0, 160.0)
		scale = 1
		rot_angle = 0
		time = 0.015}
	se_waitprops
endscript

script ui_jerky_team_session2 
	se_setprops \{alpha = 0}
	se_setprops \{pos = (1500.0, 160.0)
		alpha = 0
		time = 0.02}
	se_waitprops
	se_setprops \{pos = (1000.0, 160.0)
		time = 0.3}
	wait \{0.8
		seconds}
	se_setprops \{pos = (464.0, 160.0)
		alpha = 1
		time = 0.3}
	se_waitprops
	se_setprops \{pos = (459.0, 160.0)
		scale = 0.97999996
		rot_angle = -0.5
		time = 0.01}
	se_waitprops
	se_setprops \{pos = (463.0, 160.0)
		scale = 1.01
		rot_angle = 0.8
		time = 0.01}
	se_waitprops
	se_setprops \{pos = (472.0, 160.0)
		scale = 1
		rot_angle = 0
		time = 0.015}
	se_waitprops
endscript

script ui_flicker1 
	begin
	se_setprops \{alpha = 0
		time = 0.2}
	se_waitprops
	se_setprops \{alpha = 0.4
		time = 0.16}
	se_waitprops
	repeat
endscript

script ui_flicker2 
	begin
	se_setprops \{alpha = 0
		time = 0.16}
	se_waitprops
	se_setprops \{alpha = 0.4
		time = 0.120000005}
	se_waitprops
	repeat
endscript

script ui_flicker3 
	begin
	se_setprops \{alpha = 0
		time = 0.18}
	se_waitprops
	se_setprops \{alpha = 0.3
		time = 0.120000005}
	se_waitprops
	repeat
endscript

script ui_flicker4 
	begin
	se_setprops \{alpha = 0
		time = 0.2}
	se_waitprops
	se_setprops \{alpha = 0.2
		time = 0.120000005}
	se_waitprops
	repeat
endscript

script ui_scale_transform_meter 
	se_setprops \{scale = (1.0, 1.0)
		time = 0.05
		relative_scale}
	wait \{0.1
		seconds}
	se_setprops \{scale = (0.0, 1.0)
		time = 0.05
		relative_scale}
	wait \{0.15
		seconds}
	se_setprops \{scale = (1.0, 1.0)
		time = 0.05
		relative_scale}
	wait \{0.1
		seconds}
endscript

script ui_rotate_scale 
	begin
	se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 0
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 1.01
		rot_angle = 180
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 360
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_rotate_scale_02 
	begin
	se_setprops \{alpha = 0
		scale = 2.0
		rot_angle = 0
		time = 0.8}
	wait \{0.8
		seconds}
	se_setprops \{alpha = 1
		scale = 3.0
		rot_angle = 180
		time = 0.8}
	wait \{0.8
		seconds}
	se_setprops \{alpha = 0
		scale = 2.0
		rot_angle = 360
		time = 0.8}
	wait \{0.8
		seconds}
	repeat
endscript

script ui_rotate_scale_03 
	begin
	se_setprops \{alpha = 1
		scale = 1
		rot_angle = 0
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 0.5
		scale = 1.15
		rot_angle = 180
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 1
		rot_angle = 360
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_song_stars_total 
	se_setprops \{alpha = 0}
	begin
	se_setprops \{alpha = 1
		scale = 1.0
		pos = (352.0, -151.0)
		rot_angle = 0
		time = 0}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.75
		pos = (342.0, -145.0)
		rot_angle = 180
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.5
		pos = (336.0, -125.0)
		rot_angle = 360
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.25
		pos = (332.0, -125.0)
		rot_angle = 360
		time = 0.1}
	wait \{0.1
		seconds}
	repeat
endscript

script ui_song_stars_total_02 
	se_setprops \{alpha = 0}
	wait \{0.1
		seconds}
	begin
	se_setprops \{alpha = 1
		scale = 1.0
		pos = (352.0, -151.0)
		rot_angle = 0
		time = 0}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.75
		pos = (342.0, -145.0)
		rot_angle = 180
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.5
		pos = (336.0, -125.0)
		rot_angle = 360
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = 0.25
		pos = (332.0, -125.0)
		rot_angle = 360
		time = 0.1}
	wait \{0.1
		seconds}
	repeat
endscript

script ui_rotate 
	begin
	se_setprops \{alpha = 0
		scale = 2.0
		rot_angle = 0}
	se_setprops \{alpha = 0.35000002
		scale = 2.2
		rot_angle = 180
		time = 1}
	wait \{1
		seconds}
	se_setprops \{alpha = 0
		scale = 2.0
		rot_angle = 360
		time = 1}
	wait \{1
		seconds}
	repeat
endscript

script rock_power_challenge_anim 
	begin
	e_setprops \{scale = (1.1, 1.1)}
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (1.15, 1.15)
		time = 0.15
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (0.95, 0.95)
		time = 0.25
		motion = ease_out}
	se_waitprops
	se_setprops \{scale = (1.0, 1.0)
		time = 0.2
		motion = smooth}
	se_waitprops
	wait \{0.5
		seconds}
	repeat
endscript

script ui_alphablast 
	begin
	alpha = Random (@ (1) @ (0.5) @ (0.25) @ (0.75) @ (0.0) )
	scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.2) @ (1.0, 1.05) )
	se_setprops alpha = <alpha> time = 0.35000002
	se_waitprops
	repeat
endscript

script ui_alphablast_02 
	begin
	alpha = Random (@ (1) @ (0.5) @ (0.25) @ (0.75) @ (0.35000002) )
	scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.1800001) @ (1.0, 1.05) )
	se_setprops alpha = <alpha> time = 0.45000002
	se_waitprops
	repeat
endscript

script ui_alphablast_03 
	begin
	alpha = Random (@ (0.5) @ (0.3) @ (0.25) @ (0.65000004) @ (0.0) )
	scale = Random (@ (1.0, 1.0) @ (1.0, 1.1) @ (1.0, 1.15) @ (1.0, 1.2) @ (1.0, 1.05) )
	se_setprops alpha = <alpha> time = 0.25
	se_waitprops
	repeat
endscript

script ui_herkyjerky 
	begin
	pos = Random (@ (0.0, 0.0) @ (-10.0, -10.0) @ (-30.0, -30.0) @ (-20.0, -20.0) @ (20.0, 20.0) @ (25.0, 25.0) @ (50.0, 50.0) @ (10.0, 10.0) )
	scale = Random (@ (1.0, 1.0) @ (1.2, 1.2) @ (1.1, 1.1) @ (1.15, 1.15) @ (1.05, 1.05) )
	alpha = Random (@*100 (1) @ (0.5) @ (0.6) @ (0.7) @ (0.8) @ (0.9) )
	se_setprops pos = <pos> scale = <scale> alpha = <alpha> time = 0.08
	se_waitprops
	se_setprops \{pos = (0.0, 0.0)
		scale = (1.0, 1.0)}
	r = Random (@ 1 @ 4 @ 5 @ 3 @ 3 )
	wait <r> seconds
	repeat
endscript

script ui_shakey 
	begin
	pos = Random (@ (0.0, 0.0) @ (-2.0, -2.0) @ (-3.0, -3.0) @ (-1.0, -1.0) @ (2.5, 2.5) @ (1.0, 1.0) @ (2.0, 1.0) )
	se_setprops pos = <pos> time = 0.08
	se_waitprops
	wait \{0.08
		seconds}
	repeat
endscript

script ui_shakey_02 
	begin
	pos = Random (@ (0.0, 0.0) @ (-1.0, -1.0) @ (-3.0, -3.0) @ (-1.0, -1.0) @ (2.5, 2.5) @ (-3.0, 1.0) @ (2.0, 1.0) )
	se_setprops pos = <pos> time = 0.15
	se_waitprops
	wait \{0.15
		seconds}
	repeat
endscript

script ui_shakeytime \{time = 0.08
		pos = (0.0, 0.0)}
	begin
	pos1 = Random (@ {(0.0, 0.0) relative} @ {(-1.0, -1.0) relative} @ {(1.0, 1.0) relative} @ {(-1.0, 0.0) relative} @ {(0.0, 1.0) relative} )
	alpha = Random (@ 1.0 @ 0.9 @ 0.8 @ 0.7 )
	se_setprops pos = <pos1> alpha = <alpha> time = <time>
	se_waitprops
	wait <time> seconds
	se_setprops pos = <pos> time = 0
	se_waitprops
	repeat
endscript

script ui_roto 
	begin
	scale = Random (@*2 (1.0, 1.0) @ (1.05, 1.01) @ (1.03, 1.08) @ (1.03, 1.05) @ (1.09, 1.07) )
	rot_angle = Random (@ 1 @ 2 @ -1 @ -2 )
	se_setprops scale = <scale> rot_angle = <rot_angle> time = 0.05
	se_waitprops
	wait \{0.05
		seconds}
	repeat
endscript

script ui_sheen \{color = gh51_purple_lt}
	se_getprops
	obj_getid
	element_pos = <pos>
	element_dims = <dims>
	<element_width> = (<element_dims>.(1.0, 0.0))
	<element_height> = (<element_dims>.(0.0, 1.0))
	casttointeger \{element_width}
	casttointeger \{element_height}
	printstruct channel = zdebug <...>
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		rgba = <color>
		dims = (25.0, 50.0)
		color = <color>
		just = [center center]
		alpha = 0
		blend = add
		pos = (40.0, 15.0)
		scale = (0.5, 0.8)
		rot_angle = 0
		z_priority = 4
	}
	starting_pos = (40.0, 15.0)
	middle_pos = (160.0, 15.0)
	end_pos = (260.0, 15.0)
	begin
	<id> :se_setprops pos = <starting_pos> alpha = 0 scale = (0.2, 0.8) rot_angle = 40
	<id> :se_waitprops
	<id> :se_setprops pos = <middle_pos> alpha = 0.4 scale = (1.1, 1.3) rot_angle = 45 time = 0.8 motion = ease_in
	<id> :se_waitprops
	<id> :se_setprops pos = <end_pos> alpha = 0 scale = (0.2, 0.8) rot_angle = 45 time = 0.8 motion = ease_out
	<id> :se_waitprops
	wait \{2.7
		seconds}
	repeat
endscript

script ui_anim_sheen_pill_simple 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = starburst_32
		dims = (10.0, 10.0)
		just = [center center]
		pos_anchor = [left top]
		alpha = 1
		blend = add
		pos = (0.0, 0.0)
		rot_angle = 0
		z_priority = 3
	}
	pos_rt = ((<x_dim> * (1.0, 0.0)) + (-30.0, 8.0))
	pos_mt = ((<x_dim> * (0.5, 0.0)) + (0.0, 8.0))
	pos_lt = (30.0, 8.0)
	pos_rb = ((<x_dim> * (1.0, 0.0)) + (<y_dim> * (0.0, 1.0)) + (-30.0, -8.0))
	pos_mb = ((<x_dim> * (0.5, 0.0)) + (<y_dim> * (0.0, 1.0)) + (0.0, -8.0))
	pos_lb = ((<y_dim> * (0.0, 1.0)) + (30.0, -8.0))
	alpha_off = 0
	alpha_on = 0.5
	sheen_time = 3.0
	begin
	<id> :se_setprops alpha = <alpha_off> rot_angle = 0 color = white pos = <pos_rt>
	<id> :se_waitprops
	<id> :se_setprops pos = <pos_lt> rot_angle = -270 time = <sheen_time> motion = ease_in
	<id> :se_setprops alpha = <alpha_on> scale = 2 color = yellow_lt time = (<sheen_time> / 2.0)
	<id> :se_waitprops alpha
	<id> :se_waitprops scale
	<id> :se_setprops alpha = <alpha_off> scale = 1 time = (<sheen_time> / 2.0)
	<id> :se_waitprops
	<id> :se_setprops alpha = <alpha_off> rot_angle = 0 color = white pos = <pos_lb>
	<id> :se_waitprops
	<id> :se_setprops pos = <pos_rb> rot_angle = 270 time = <sheen_time> motion = ease_out
	<id> :se_setprops alpha = <alpha_on> scale = 2 color = yellow_lt time = (<sheen_time> / 2.0)
	<id> :se_waitprops alpha
	<id> :se_waitprops scale
	<id> :se_setprops alpha = <alpha_off> scale = 1 time = (<sheen_time> / 2.0)
	<id> :se_waitprops
	time = RandomFloat (0.0, 3.0)
	wait <time> seconds
	repeat
endscript

script sheen_highlight 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		dims = (10.0, 10.0)
		color = gh51_purple_lt
		just = [center center]
		alpha = 0.3
		blend = add
		pos = (50.0, 10.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 3
	}
	p1 = (50.0, 24.0)
	p2 = (((<x_dim> - 25) * (1.0, 0.0)) + (0.0, 24.0))
	p3 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 24.0))
	p4 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 18.0))
	p5 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 18.0))
	p6 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 8.0))
	p7 = (((<x_dim> - 175) * (1.0, 0.0)) + (0.0, 8.0))
	p8 = (20.0, 8.0)
	p9 = (23.0, 20.0)
	begin
	wait \{1
		seconds}
	<id> :se_setprops alpha = 0 scale = (0.8, 7.0) pos = <p1> rot_angle = 20 time = 0.5
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (0.8, 5.0) pos = <p2> rot_angle = 30 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (0.5, 1.2) pos = <p3> rot_angle = 20 time = 0.3
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (1.0, 1.0) pos = <p4> rot_angle = 10 time = 0.01
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 scale = (0.0, 0.0) pos = <p5> rot_angle = 10 time = 0.01
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (1.0, 1.0) pos = <p6> rot_angle = 0 time = 0.2
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (1.08, 1.1) pos = <p7> time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.2 scale = (1.0, 1.0) pos = <p8> rot_angle = 0 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 scale = (1.0, 1.0) pos = <p9> rot_angle = 0 time = 0.4
	<id> :se_waitprops
	wait \{1
		seconds}
	repeat
endscript

script sheen_highlight_bottom 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		dims = (10.0, 10.0)
		color = gh6_gold
		just = [right center]
		pos_anchor = [right center]
		alpha = 0.3
		blend = add
		pos = (0.0, 0.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 3
	}
	p1 = (-23.0, 0.0)
	p2 = (-23.0, 20.0)
	p3 = (((46 - <x_dim>) * (1.0, 0.0)) + (0.0, 20.0))
	p4 = (<p3> + (-10.0, 0.0))
	begin
	wait \{3
		seconds}
	<id> :se_setprops alpha = 0.1 scale = (0.0, 0.0) pos = <p1> time = 0.02
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.2 scale = (1.0, 1.0) pos = <p2> time = 0.4
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (1.08, 1.1) pos = <p3> time = 1.2
	<id> :se_waitprops
	<id> :se_setprops alpha = 0 scale = (1.0, 1.0) pos = <p4> time = 0.2
	<id> :se_waitprops
	wait \{1
		seconds}
	repeat
endscript

script ui_translate_left 
	begin
	se_setprops \{pos = (1084.0, -550.0)
		alpha = 0.25
		scale = (1.0, 0.5)
		time = 0}
	se_setprops \{pos = (-100.0, -550.0)
		alpha = 1
		scale = (1.0, 1.0)
		time = 5
		motion = ease_in}
	se_waitprops
	se_setprops \{pos = (-1284.0, -550.0)
		alpha = 0.25
		scale = (1.0, 0.7)
		time = 5
		motion = ease_out}
	se_waitprops
	repeat
endscript

script ui_translate_right 
	begin
	se_setprops \{pos = (-1284.0, 350.0)
		alpha = 0.25
		scale = (1.0, 0.5)
		time = 0}
	se_setprops \{pos = (100.0, 350.0)
		alpha = 1
		scale = (1.0, 1.0)
		time = 5
		motion = ease_in}
	se_waitprops
	se_setprops \{pos = (1084.0, 350.0)
		alpha = 0.25
		scale = (1.0, 0.5)
		time = 5
		motion = ease_out}
	se_waitprops
	wait \{1
		seconds}
	repeat
endscript

script anim_bling_horizontal_02 \{minwidth = 0.2
		maxwidth = 0.2
		maxtime = 0.5}
	begin
	getrandomvalue name = blingx integer a = <minwidth> b = <minwidth>
	getrandomvalue name = blingy integer a = <minwidth> b = <minwidth>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, 0.0) * <blingy>)
		case 2
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, 0.02) * <blingy>)
		case 3
		blingpos = ((2.0, 0.0) * <blingx> + (0.0, 0.05) * <blingy>)
		default
		blingpos = ((-2.0, 0.0) * <blingx> + (0.0, 0.02) * <blingy>)
	endswitch
	randrota = RandomInteger (0.0, 180.0)
	randrotc = (<randrota> + (RandomInteger (0.0, 179.0)))
	randrotb = ((<randrotc> / 2) + (<randrota> / 2))
	getrandomvalue name = randtime a = 0.2 b = <maxtime>
	se_setprops alpha = 0 scale = 0 pos = <blingpos> rot_angle = <randrota> time = 0
	se_waitprops
	se_setprops alpha = 0.2 scale = 1.5 rot_angle = <randrotb> time = <randtime> motion = ease_in
	se_waitprops
	se_setprops alpha = 0 scale = 0 rot_angle = <randrotc> time = <randtime> motion = ease_out
	se_waitprops
	repeat
endscript

script anim_bling_small \{minradius = 16
		maxradius = 19
		maxtime = 0.5}
	begin
	getrandomvalue name = blingx integer a = <minradius> b = <maxradius>
	getrandomvalue name = blingy integer a = <minradius> b = <maxradius>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 2
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 3
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
		default
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
	endswitch
	randrota = RandomInteger (0.0, 180.0)
	randrotc = (<randrota> + (RandomInteger (0.0, 179.0)))
	randrotb = ((<randrotc> / 2) + (<randrota> / 2))
	getrandomvalue name = randtime a = 0.2 b = <maxtime>
	se_setprops alpha = 0 scale = 0 pos = <blingpos> rot_angle = <randrota> time = 0
	se_waitprops
	se_setprops alpha = 0.6 scale = 0.6 rot_angle = <randrotb> time = <randtime> motion = ease_in
	se_waitprops
	se_setprops alpha = 0 scale = 0 rot_angle = <randrotc> time = <randtime> motion = ease_out
	se_waitprops
	repeat
endscript

script anim_bling_small_002 \{minradius = 20
		maxradius = 23
		mintime = 0.8
		maxtime = 1}
	begin
	getrandomvalue name = blingx integer a = <minradius> b = <maxradius>
	getrandomvalue name = blingy integer a = <minradius> b = <maxradius>
	r = RandomInteger (1.0, 4.0)
	switch <r>
		case 1
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 2
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, 1.0) * <blingy>)
		case 3
		blingpos = ((1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
		default
		blingpos = ((-1.0, 0.0) * <blingx> + (0.0, -1.0) * <blingy>)
	endswitch
	randrota = RandomInteger (0.0, 180.0)
	randrotc = (<randrota> + (RandomInteger (0.0, 179.0)))
	randrotb = ((<randrotc> / 2) + (<randrota> / 2))
	getrandomvalue name = randtime a = 0.2 b = <maxtime>
	se_setprops alpha = 0 scale = 0 pos = <blingpos> rot_angle = <randrota> time = 0
	se_waitprops
	se_setprops alpha = 0.8 scale = 0.8 rot_angle = <randrotb> time = <randtime> motion = ease_in
	se_waitprops
	se_setprops alpha = 0 scale = 0 rot_angle = <randrotc> time = <randtime> motion = ease_out
	se_waitprops
	repeat
endscript

script ac_threshold_glints_b 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = starburst_32
		dims = (10.0, 10.0)
		color = gh6_gold
		just = [right center]
		pos_anchor = [right center]
		alpha = 0.3
		blend = add
		pos = (0.0, 0.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 19
	}
	p1 = (-23.0, 0.0)
	p2 = (-23.0, 20.0)
	p3 = (((46 - <x_dim>) * (1.0, 0.0)) + (0.0, 20.0))
	p4 = (<p3> + (-10.0, 0.0))
	begin
	wait \{4
		seconds}
	<id> :se_setprops alpha = 0.1 scale = (0.0, 0.0) pos = <p1> time = 0.02
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.2 scale = (0.8, 0.8) pos = <p2> time = 0.4
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (1.0, 1.0) pos = <p3> time = 1.2
	<id> :se_waitprops
	<id> :se_setprops alpha = 0 scale = (0.8, 0.8) pos = <p4> time = 0.2
	<id> :se_waitprops
	wait \{1
		seconds}
	repeat
endscript

script ac_threshold_glints_a 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = starburst_32
		dims = (10.0, 10.0)
		color = gh51_purple_lt
		just = [center center]
		alpha = 0.3
		blend = add
		pos = (50.0, 10.0)
		scale = (0.0, 0.0)
		rot_angle = 30
		z_priority = 19
	}
	p1 = (50.0, 0.0)
	p2 = (((<x_dim> - 25) * (1.0, 0.0)) + (0.0, 0.0))
	p3 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 0.0))
	p4 = (((<x_dim> - 5) * (1.0, 0.0)) + (0.0, 0.0))
	p5 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 0.0))
	p6 = (((<x_dim> - 15) * (1.0, 0.0)) + (0.0, 0.0))
	p7 = (((<x_dim> - 9) * (1.0, 0.0)) + (0.0, 0.0))
	p8 = (0.0, 0.0)
	p9 = (0.0, 0.0)
	begin
	wait \{1
		seconds}
	<id> :se_setprops alpha = 0 scale = (0.5, 1.0) pos = <p1> rot_angle = 20 time = 0.5
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (0.5, 0.5) pos = <p2> rot_angle = 30 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (0.5, 0.9) pos = <p3> rot_angle = 20 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (1.0, 1.0) pos = <p4> rot_angle = 10 time = 0.1
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 scale = (0.0, 0.0) pos = <p5> rot_angle = 10 time = 0.1
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.1 scale = (0.8, 0.8) pos = <p6> rot_angle = 0 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.4 scale = (1.0, 1.0) pos = <p7> time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 scale = (0.8, 0.8) pos = <p8> rot_angle = 0 time = 0.8
	<id> :se_waitprops
	<id> :se_setprops alpha = 0.0 scale = (0.8, 0.8) pos = <p9> rot_angle = 0 time = 0.8
	<id> :se_waitprops
	wait \{1
		seconds}
	repeat
endscript

script ui_anim_sheen_ac 
	obj_getid
	se_getprops
	x_dim = (<dims> [0])
	y_dim = (<dims> [1])
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = starburst_32
		dims = (10.0, 10.0)
		just = [center center]
		pos_anchor = [left top]
		alpha = 1
		blend = add
		pos = (0.0, 0.0)
		rot_angle = 0
		z_priority = 20
	}
	pos_rt = ((<x_dim> * (1.0, 0.0)) + (0.0, 0.0))
	pos_mt = ((<x_dim> * (0.5, 0.0)) + (0.0, 0.0))
	pos_lt = (0.0, 0.0)
	pos_rb = ((<x_dim> * (1.0, 0.0)) + (<y_dim> * (0.0, 1.0)) + (0.0, 0.0))
	pos_mb = ((<x_dim> * (0.5, 0.0)) + (<y_dim> * (0.0, 1.0)) + (0.0, 0.0))
	pos_lb = ((<y_dim> * (0.0, 1.0)) + (0.0, 0.0))
	alpha_off = 0
	alpha_on = 0.5
	sheen_time = 3.0
	begin
	<id> :se_setprops alpha = <alpha_off> rot_angle = 0 color = white pos = <pos_rt>
	<id> :se_waitprops
	<id> :se_setprops pos = <pos_lt> rot_angle = -270 time = <sheen_time> motion = ease_in
	<id> :se_setprops alpha = <alpha_on> scale = 1.5 color = yellow_lt time = (<sheen_time> / 2.0)
	<id> :se_waitprops alpha
	<id> :se_waitprops scale
	<id> :se_setprops alpha = <alpha_off> scale = 0.5 time = (<sheen_time> / 2.0)
	<id> :se_waitprops
	<id> :se_setprops alpha = <alpha_off> rot_angle = 0 color = white pos = <pos_lb>
	<id> :se_waitprops
	<id> :se_setprops pos = <pos_rb> rot_angle = 270 time = <sheen_time> motion = ease_out
	<id> :se_setprops alpha = <alpha_on> scale = 1.5 color = yellow_lt time = (<sheen_time> / 2.0)
	<id> :se_waitprops alpha
	<id> :se_waitprops scale
	<id> :se_setprops alpha = <alpha_off> scale = 0.5 time = (<sheen_time> / 2.0)
	<id> :se_waitprops
	time = RandomFloat (0.0, 3.0)
	wait <time> seconds
	repeat
endscript
