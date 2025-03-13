g_vocal_spoken_pos_offset_y = 83.5
g_vocal_spoken_paint_pos_offset_y = 85.5
g_spoken_mask_padding_px = 8
g_vocal_note_z_priority = 0.5
g_vocal_note_cap_z_priority = 1
g_vocal_spoken_z_priority = 6
g_vocal_spoken_cap_z_priority = 5
g_vocal_spoken_mask_z_priority = 3
g_vocal_spoken_mask_height_px = 8
g_vocal_spoken_mask_offset_y_px = 4
g_vocal_spoken_min_gap_px = 8
vocal_spoken_color = [
	100
	192
	255
	255
]
vocal_paint_colors = {
	paint_hit = [
		255
		220
		220
		255
	]
	paint_miss = [
		160
		128
		128
		0
	]
	paint_default = [
		160
		128
		128
		0
	]
}
g_vocal_paint_z_priority = 2
vocals_paint_note_max_length = 50.0
vocals_hud_rgba = [
	[
		77
		95
		153
		255
	]
	[
		165
		85
		50
		255
	]
	[
		130
		70
		110
		255
	]
	[
		130
		120
		40
		255
	]
]
vocals_hud_glow_rgba = [
	[
		87
		105
		173
		255
	]
	[
		185
		95
		60
		255
	]
	[
		150
		80
		120
		255
	]
	[
		150
		135
		50
		255
	]
]
vocals_hud_amp_glow_scale = 2.0
vocal_sung_note_height = 15.0
vocal_space_height = 8.0
vocal_fireball_color = [
	255
	255
	255
	0
]
vocal_sung_note_lerp_value = 1.0
vocals_health_ring_scale = 0.6
vocals_health_alpha_scale = 1.75
vocal_scrolling_lyric_rgba = [
	255
	242
	213
	255
]
vocal_scrolling_spoken_lyric_rgba = [
	255
	242
	213
	255
]
vocal_scrolling_word_highlight = [
	254
	233
	53
	255
]
vocal_scrolling_lyric_after = [
	64
	64
	64
	255
]
vocal_scrolling_highway_timespan = 3000
vocal_static_lyric_color_upcoming = [
	210
	210
	210
	255
]
vocal_static_lyric_color_after = [
	0
	102
	255
	255
]
vocal_static_lyric_color_moment_upcoming = [
	255
	150
	0
	255
]
vocal_static_lyric_color_moment_after = [
	0
	102
	255
	255
]
vocal_static_lyric_color_star_upcoming = [
	30
	250
	250
	200
]
vocal_static_lyric_color_star_after = [
	0
	102
	255
	255
]
vocal_space_width = 18
vocal_highway_text_offset = 4
vocal_highway_text_height = 30
vocal_lyric_font = fontgrid_lyric_a1
vocal_lyric_font_scale = (0.4, 0.4)
vocal_lyric_karaoke_font_scale = (0.45000002, 0.55)
vocal_highway_karaoke_text_height = 40
vocal_lyric_font_offset = (0.0, -44.0)
vocal_note_alpha_width = 0
vocal_slide_length_tweak_px = 6.0
vocal_pitch_indicator_hide_time = 32
vocal_enable_static_view = 1
vocal_highway_no_background = 0
vocals_static_fade_start = 500.0
vocals_static_fade_end = 675.0
vocals_static_fade_alpha = 1.0
vocals_scrolling_fade_start = 500.0
vocals_scrolling_fade_end = 675.0
vocals_scrolling_fade_alpha = 1.0
vocal_enable_material_paint = 1
vocals_highway_assignment = [
	[
		1
		0
		0
		0
	]
	[
		1
		1
		0
		0
	]
	[
		1
		1
		1
		0
	]
	[
		1
		1
		2
		2
	]
]
vocals_highway_assignment_vocalists = [
	[
		1
		0
		0
		0
	]
	[
		1
		2
		0
		0
	]
	[
		1
		1
		2
		0
	]
	[
		1
		1
		2
		2
	]
]

script vocals_setup_comet_locations 
	<index> = 1
	begin
	vocals_setplayerhighwayindex player = <index> highway = 0
	<index> = (<index> + 1)
	repeat 4
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> < 1)
		return
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> = <num_vocalists_shown>)
		assignment_array = ($vocals_highway_assignment_vocalists)
	else
		assignment_array = ($vocals_highway_assignment)
	endif
	highways = (<assignment_array> [<num_vocalists_shown> -1])
	<vocalist_num> = 0
	<highway_index> = 0
	getnumplayersingame \{on_screen}
	getfirstplayer
	begin
	if playerinfoequals <player> part = vocals
		vocals_setplayerhighwayindex player = <player> highway = (<highways> [<vocalist_num>])
		if (<highways> [<vocalist_num>] > <highway_index>)
			vocals_setactivehighwayplayerindex highway = (<highways> [<vocalist_num>]) player = <player>
			highway_index = (<highway_index> + 1)
		endif
		printstruct channel = trchen <...>
		<vocalist_num> = (<vocalist_num> + 1)
	endif
	getnextplayer player = <player>
	repeat <num_players_shown>
endscript

script vocals_get_highway_pos 
	requireparams \{[
			highway_index
		]
		all}
	gamemode_gettype
	if (<type> = freeplay)
		highway_pos = vocal1
	else
		if (<highway_index> = 1)
			getnumplayersingame \{on_screen}
			if (<num_players_shown> = 1)
				highway_pos = vocal2
			else
				highway_pos = vocal1
			endif
		else
			highway_pos = vocal2
		endif
	endif
	return highway_pos = <highway_pos>
endscript

script vocals_create_highway \{parent = vocals_highway_root}
	requireparams \{[
			player
			vocals_highway_view
		]
		all}
	if NOT screenelementexists id = <parent>
		createscreenelement {
			id = <parent>
			parent = root_window
			type = containerelement
		}
	endif
	printf channel = vocals 'vocals_create_highway - player %p' p = <player>
	vocals_setup_comet_locations
	vocalshighway_getid player = <player>
	destroyscreenelement id = <vocals_highway_id>
	gamemode_gettype
	vocals_getvocalistnum player = <player>
	vocals_getactivehighway player = <player>
	vocals_getactivehighwayindex player = <player>
	highway_index = <active_highway_index>
	vocals_get_highway_pos highway_index = <highway_index>
	setplayerinfo <player> highway_position = <highway_pos>
	switch <highway_pos>
		case vocal1
		pos = (0.0, 0.0)
		setplayerinfo <player> hud_parent = alias_v1
		case vocal2
		if (<vocals_highway_view> = static && <type> = competitive)
			pos = (0.0, 414.0)
		else
			pos = (0.0, 430.0)
		endif
		setplayerinfo <player> hud_parent = alias_v2
		default
		softassert \{qs(0xd12b34e0)}
		pos = (0.0, 0.0)
		setplayerinfo <player> hud_parent = alias_v2
	endswitch
	createscreenelement {
		parent = <parent>
		id = <vocals_highway_id>
		type = descinterface
		desc = 'vocals_highway'
		pos = <pos>
		z_priority = 0
		just = [left top]
		internal_just = [left top]
	}
	resolvescreenelementid id = {<vocals_highway_id> child = 0} param = root
	if screenelementexists id = <root>
		<root> :se_setprops alpha = 0
	endif
	spawnscriptlater vocals_create_highway_bg params = {player = <player>}
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = lyrics_container
	createscreenelement {
		local_id = vocals_current_phrase_lyrics
		parent = <lyrics_container>
		type = containerelement
		pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	createscreenelement {
		local_id = vocals_next_phrase_lyrics
		parent = <lyrics_container>
		type = containerelement
		pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	if ($vocal_debug_hud = 1)
		createscreenelement {
			local_id = vocalist_hud_debug_pitch
			type = textblockelement
			parent = <vocals_highway_id>
			font = fontgrid_text_a1
			pos = (200.0, 0.0)
			dims = (350.0, 0.0)
			text = qs(0x03ac90f0)
			internal_scale = 0.4
			just = [left top]
			z_priority = 100
			allow_expansion
		}
	endif
	vocals_get_highway_view player = <player>
	if (<highway_view> = karaoke)
		vocals_karaoke_hide_highway vocals_highway_id = <vocals_highway_id> player = <player>
	endif
	create_vocal_visualizer vocals_highway_id = <vocals_highway_id> player = <player>
	create_vocals_spoken_word_mask_element player = <player>
	setup_individual_highway_hud player = <player>
endscript
g_vocals_highway_notes_hide_time = 0.2

script vocals_highway_hide_notes 
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	<note_scale> :se_setprops alpha = 0 time = ($g_vocals_highway_notes_hide_time)
endscript

script vocals_highway_show_notes 
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	<note_scale> :se_setprops alpha = 1 time = ($g_vocals_highway_notes_hide_time)
endscript

script vocals_destroy_highway 
	gamemode_gettype
	if (<type> != freeplay)
		vocals_mute_all_mics \{mute = true}
	endif
	if (<type> != freeplay)
		destroy_vocals_visualizer player = <player>
	endif
	vocalshighway_getid player = <player>
	destroyscreenelement id = <vocals_highway_id>
endscript
g_backup_vocals_highway_offset = (0.0, 140.0)

script backup_vocals_create_highway \{parent = vocals_highway_root}
	if NOT screenelementexists id = <parent>
		createscreenelement {
			id = <parent>
			parent = root_window
			type = containerelement
		}
	endif
	createscreenelement {
		parent = <parent>
		id = <backup_vocals_highway_id>
		type = descinterface
		desc = 'vocals_highway'
		pos = ($g_backup_vocals_highway_offset)
		z_priority = 0
		just = [left top]
		internal_just = [left top]
	}
	<backup_vocals_highway_id> :desc_resolvealias name = alias_note_scale param = lyrics_container
	createscreenelement {
		local_id = vocals_current_phrase_lyrics
		parent = <lyrics_container>
		type = containerelement
		pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	createscreenelement {
		local_id = vocals_next_phrase_lyrics
		parent = <lyrics_container>
		type = containerelement
		pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	vocals_karaoke_hide_highway vocals_highway_id = <backup_vocals_highway_id>
	<backup_vocals_highway_id> :se_setprops curr_phrase_bg_static_alpha = 0
	<backup_vocals_highway_id> :se_setprops curr_phrase_bg_scrolling_alpha = 0
	<backup_vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 0
	<backup_vocals_highway_id> :se_setprops vocal_health_meter_needle_1_alpha = 0
	<backup_vocals_highway_id> :se_setprops vocal_health_meter_needle_2_alpha = 0
endscript

script backup_vocals_destroy_highway 
	if screenelementexists \{id = backup_vocals_highway}
		destroyscreenelement \{id = backup_vocals_highway}
	endif
endscript

script create_vocals_spoken_word_mask_material 
	creatematerial \{name = vocals_spoken_word_mask_material
		template = immediatemode
		technique = _2d_col_tex
		blendmode = multiply
		alphacutoff = 0
		materialprops = [
			{
				name = m_samp0
				textureproperty = white_col_black
			}
		]}
	creatematerial \{name = vocals_spoken_word_mask_bar_material
		template = immediatemode
		technique = _2d_col_tex
		blendmode = multiply
		alphacutoff = 0
		materialprops = [
			{
				name = m_samp0
				textureproperty = outline_mask
			}
		]}
endscript

script destroy_vocals_spoken_word_mask_material 
	destroymaterial \{name = vocals_spoken_word_mask_material}
	destroymaterial \{name = vocals_spoken_word_mask_bar_material}
endscript

script create_vocals_spoken_word_mask_element 
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_visible_highway param = visible_highway
	createscreenelement {
		parent = <visible_highway>
		type = spriteelement
		pos = (-803.0, -28.0)
		dims = (1280.0, 16.0)
		just = [left top]
		pos_anchor = [left top]
		scale = 1.0
		texture = outline_mask
		blend = multiply
		z_priority = 2
		material = vocals_spoken_word_mask_bar_material
	}
endscript

script vocals_highway_slide_in \{play_vocal_highway_sfx = 0}
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	if screenelementexists id = <vocals_highway_id>
		if gotparam \{delay}
			wait <delay> frames
		endif
		if screenelementexists id = <vocals_highway_id>
			resolvescreenelementid id = {<vocals_highway_id> child = 0} param = root
			if screenelementexists id = <root>
				if (<play_vocal_highway_sfx> = 1)
					if NOT issoundeventplaying \{audio_ui_gameplay_vocal_highway_appear}
						spawnscriptnow \{audio_gameplay_intro_vocal_highway_up_sfx_waiting}
					endif
				endif
				<root> :se_setprops alpha = 1 motion = ease_out time = 0.5
			endif
		endif
	endif
	vocals_mute_all_mics \{mute = false}
endscript

script vocals_create_highway_bg 
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	vocals_get_highway_view player = <player>
	if ($voclas_proto = 1)
		<vocals_highway_id> :se_setprops fireball_bg_rgba = ($voclas_proto_adjustments [(<player> -1)].rgba_fireball)
		<vocals_highway_id> :se_setprops fireball_bg_scale = ($voclas_proto_adjustments [(<player> -1)].scale_fireball)
	else
		<vocals_highway_id> :se_setprops fireball_bg_rgba = $vocal_fireball_color
	endif
	if (<highway_view> = scrolling)
		<vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 0
		<vocals_highway_id> :se_setprops curr_phrase_bg_static_alpha = 0
		<vocals_highway_id> :se_setprops curr_phrase_bg_scrolling_alpha = 1
		<vocals_highway_id> :desc_resolvealias name = alias_static_phrase_start param = phrase_start
		<phrase_start> :se_setprops alpha = 0
		<vocals_highway_id> :desc_resolvealias name = alias_static_phrase_end param = phrase_end
		<phrase_end> :se_setprops alpha = 0
	elseif (<highway_view> = static)
		<vocals_highway_id> :se_setprops curr_phrase_bg_static_alpha = 1
		<vocals_highway_id> :se_setprops curr_phrase_bg_scrolling_alpha = 0
		<vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 1
		<vocals_highway_id> :se_setprops vocal_health_meter_needle_1_alpha = 0
		<vocals_highway_id> :se_setprops vocal_health_meter_needle_2_alpha = 0
	else
		<vocals_highway_id> :se_setprops curr_phrase_bg_static_alpha = 0
		<vocals_highway_id> :se_setprops curr_phrase_bg_scrolling_alpha = 0
		<vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 0
		<vocals_highway_id> :se_setprops vocal_health_meter_needle_1_alpha = 0
		<vocals_highway_id> :se_setprops vocal_health_meter_needle_2_alpha = 0
	endif
	if ($vocal_highway_no_background = 1)
		if <vocals_highway_id> :desc_resolvealias name = alias_bg_container param = bg_container
			<bg_container> :se_setprops hide
		endif
	endif
endscript

script vocals_create_moment_section 
	requireparams \{[
			pos
			dims
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	offset_dims = (<dims> + (0.0, 4.0))
	createscreenelement {
		parent = <note_scale>
		type = windowelement
		pos = <pos>
		dims = <offset_dims>
		just = [left top]
		internal_just = [left top]
		z_priority = 2
	}
	<container_id> = <id>
	<material> = mat_vocal_band_moment_fire
	<texture_to_hwy_ratio> = (100.0 / 64.0)
	<mat_dims> = ((256.0, 64.0) * <texture_to_hwy_ratio>)
	<step> = ((256.0, 0.0) * <texture_to_hwy_ratio>)
	<curr_pos> = (0.0, 5.0)
	begin
	createscreenelement {
		parent = <container_id>
		type = spriteelement
		pos = <curr_pos>
		dims = <mat_dims>
		clonematerial = <material>
		just = [left top]
		rgba = [255 255 255 255]
		blend = add
		z_priority = -10
	}
	<curr_pos> = (<curr_pos> + <step>)
	if (<curr_pos> [0] >= <dims> [0])
		break
	endif
	repeat
	return id = <container_id>
endscript

script vocals_create_freeform_section \{type = melodic}
	printstruct channel = vocals <...>
	requireparams \{[
			pos
			dims
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	createscreenelement {
		parent = <note_scale>
		type = windowelement
		pos = <pos>
		dims = <dims>
		just = [left top]
		internal_just = [left top]
		z_priority = 2
	}
	<container_id> = <id>
	<child_pos> = (((<pos>.(1.0, 0.0)) * (-1.0, 0.0)))
	createscreenelement {
		parent = <container_id>
		type = spriteelement
		dims = (1280.0, 100.0)
		texture = <texture>
		pos = <child_pos>
		just = [left top]
		blend = add
		z_priority = -10
	}
	return id = <container_id>
endscript

script vocals_create_paint 
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	<rgba> = ($vocal_paint_colors.<hit>)
	createscreenelement {
		parent = <note_scale>
		type = containerelement
		just = [left center]
		pos = <pos>
		z_priority = 6
	}
	<container_id> = <id>
	createscreenelement {
		parent = <container_id>
		local_id = note_left
		type = spriteelement
		just = [left center]
		texture = lyric_blip_right
		flip_v
		rgba = <rgba>
	}
	createscreenelement {
		parent = <container_id>
		local_id = note_middle
		type = spriteelement
		just = [left center]
		texture = lyric_blip_middle
		rgba = <rgba>
	}
	<middle_id> = <id>
	createscreenelement {
		parent = <container_id>
		local_id = note_right
		type = spriteelement
		just = [left center]
		texture = lyric_blip_right
		rgba = <rgba>
	}
	return id = <container_id> stretch_id = <middle_id>
endscript

script vocals_create_phrase_marker 
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_note_scale param = note_scale
	getscreenelementdims id = <note_scale>
	createscreenelement {
		parent = <note_scale>
		type = spriteelement
		just = [1.0 -1.0]
		dims = ((7.0, 31.0) + (0.0, 1.0) * <height>)
		pos = (0.0, 0.0)
		blendmode = blend
		texture = white
		rgba = [110 110 110 160]
		z_priority = 1
	}
	return id = <id>
endscript

script vocals_get_highway_view 
	requireparams \{[
			player
		]
		all}
	playlist_getcurrentsong
	song = <current_song>
	getplayerinfo <player> vocals_highway_view
	if is_current_song_a_jam_session
		vocals_highway_view = scrolling
	endif
	get_song_difficulty_ratings song = <song>
	if (<vocals_difficulty_rating> = 0)
		vocals_highway_view = scrolling
	endif
	return highway_view = <vocals_highway_view>
endscript

script vocals_set_highway_view 
	requireparams \{[
			player
			view
		]
		all}
	setplayerinfo <player> vocals_highway_view = <view>
	if NOT gotparam \{controller}
		controller = (<player> - 1)
	endif
	save_progression_instrument_user_option part = vocals controller = <controller> option = 'highway_view' new_value = <view>
endscript

script vocals_get_highway_view_text 
	requireparams \{[
			view
		]
		all}
	if (<view> = static)
		return \{vocals_view_text = qs(0x305014bd)}
	else
		return \{vocals_view_text = qs(0x737839f5)}
	endif
endscript

script vocals_freeform_melodic_message 
	formattext textname = text qs(0x2e7f32bb) b = <base_score> m = <multiplier>
	vocals_message player = <player> text = <text> rgba = [220 220 0 255]
endscript

script vocals_message 
	vocalshighway_getid player = <player>
	getplayerinfo <player> combo_meter_id
	if NOT screenelementexists id = <combo_meter_id>
		softassert \{qs(0x3d5c174f)}
		return
	endif
	if screenelementexists id = {<combo_meter_id> child = vocalist_phrase_status}
		destroyscreenelement id = {<combo_meter_id> child = vocalist_phrase_status}
	endif
	createscreenelement {
		local_id = vocalist_phrase_status
		parent = <combo_meter_id>
		type = textblockelement
		pos = (0.0, 30.0)
		dims = (350.0, 160.0)
		just = [left top]
		internal_just = [left top]
		rgba = <rgba>
		text = <text>
		scale = (1.0, 1.0)
		font = fontgrid_title_a1
		z_priority = 16
		internal_scale = 0.3
		alpha = 1.0
		shadow
		shadow_offs = (1.0, 1.0)
	}
	runscriptonscreenelement id = <id> vocals_message_wait_and_die
endscript

script vocals_message_wait_and_die 
	wait \{1
		second}
	se_setprops \{alpha = 0.0
		time = 0.4}
	se_waitprops
	die
endscript

script vocals_message_delayed 
	spawnscriptlater vocals_message_delayed_spawn params = <...>
endscript

script vocals_message_delayed_spawn 
	wait \{1
		second}
	vocals_message <...>
endscript

script vocals_freeform_score_message 
	quality_struct = ($vocal_freeform_qualities [<index>])
	vocals_message {
		player = <player>
		text = (<quality_struct>.text)
		rgba = (<quality_struct>.rgba)
	}
endscript

script vocals_lightning_alert 
	vocalshighway_getid player = <player>
	if <vocals_highway_id> :desc_resolvealias name = alias_top_lightning param = parent
		runscriptonscreenelement id = <parent> vocals_lightning_alert_spawned
	endif
endscript

script vocals_lightning_alert_spawned 
	obj_getid
	lightning_time = 0.2
	resolvescreenelementid id = {<objid> child = lightning0} param = streak_lightning_01
	resolvescreenelementid id = {<objid> child = lightning1} param = streak_lightning_03
	resolvescreenelementid id = {<objid> child = lightning2} param = streak_lightning_05
	resolvescreenelementid id = {<objid> child = lightning3} param = streak_lightning_07
	vocals_lightning_hide
	setscreenelementprops id = <streak_lightning_01> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	setscreenelementprops id = <streak_lightning_01> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <streak_lightning_03> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	setscreenelementprops id = <streak_lightning_03> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <streak_lightning_05> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	setscreenelementprops id = <streak_lightning_05> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <streak_lightning_07> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	setscreenelementprops id = <streak_lightning_07> alpha = 0 time = <lightning_time>
	wait <lightning_time> seconds
endscript

script vocals_lightning_hide 
	obj_getid
	if getscreenelementchildren id = <objid>
		getarraysize <children>
		<i> = 0
		begin
		setscreenelementprops id = (<children> [<i>]) alpha = 0
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script vocals_star_power_changed 
	if (<enable> = 1)
		vocals_paint_star_power_on player = <player>
	else
		vocals_paint_star_power_off player = <player>
	endif
endscript

script vocals_lightning_starpower_spawned 
	obj_spawnscriptnow \{vocals_lightning_starpower_spawned_b}
	obj_getid
	resolvescreenelementid id = {<objid> child = lightning0} param = lightning0
	resolvescreenelementid id = {<objid> child = lightning1} param = lightning1
	resolvescreenelementid id = {<objid> child = lightning2} param = lightning2
	resolvescreenelementid id = {<objid> child = lightning3} param = lightning3
	<alpha> = 0.7
	begin
	<lightning_time> = RandomFloat (0.02, 0.07)
	setscreenelementprops id = <lightning0> alpha = <alpha> time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = 0 time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	setscreenelementprops id = <lightning0> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning1>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning2>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	repeat
endscript

script vocals_lightning_starpower_spawned_b 
	obj_getid
	resolvescreenelementid id = {<objid> child = lightning0b} param = lightning0
	resolvescreenelementid id = {<objid> child = lightning1b} param = lightning1
	resolvescreenelementid id = {<objid> child = lightning2b} param = lightning2
	resolvescreenelementid id = {<objid> child = lightning3b} param = lightning3
	<alpha> = 0.7
	begin
	<lightning_time> = RandomFloat (0.05, 0.09)
	setscreenelementprops id = <lightning0> alpha = <alpha> time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = 0 time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	setscreenelementprops id = <lightning0> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning1>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning2>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	repeat
endscript

script vocals_lightning_starpower_spawned_c 
	obj_getid
	resolvescreenelementid id = {<objid> child = star_001} param = lightning0
	resolvescreenelementid id = {<objid> child = star_002} param = lightning1
	resolvescreenelementid id = {<objid> child = star_003} param = lightning2
	resolvescreenelementid id = {<objid> child = star_004} param = lightning3
	<alpha> = 0.7
	<lightning_time> = 0.07
	begin
	setscreenelementprops id = <lightning0> alpha = <alpha> time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = 0 time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	setscreenelementprops id = <lightning0> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning1>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning2>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	repeat 1
	setscreenelementprops id = <lightning0> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning1> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning2> alpha = 0 time = <lightning_time>
	setscreenelementprops id = <lightning3> alpha = 0 time = <lightning_time>
endscript

script vocals_highway_border_flash \{rgba = [
			255
			255
			255
			255
		]}
	requireparams \{[
			player
		]
		all}
	vocalshighway_getid player = <player>
	runscriptonscreenelement id = <vocals_highway_id> vocals_highway_border_flash_spawned params = {rgba = <rgba>}
endscript

script vocals_highway_border_flash_spawned 
endscript

script vocals_karaoke_hide_highway 
	requireparams \{[
			vocals_highway_id
		]
		all}
	<vocals_highway_id> :desc_resolvealias name = alias_visible_highway param = visible_highway
	<vocals_highway_id> :desc_resolvealias name = alias_now_bar param = now_bar
	<vocals_highway_id> :desc_resolvealias name = alias_static_phrase_start param = phrase_start
	<vocals_highway_id> :desc_resolvealias name = alias_static_phrase_end param = phrase_end
	<vocals_highway_id> :desc_resolvealias name = alias_pitch_indicator param = pitch_indicator
	safe_hide id = <visible_highway>
	safe_hide id = <now_bar>
	safe_hide id = <phrase_start>
	safe_hide id = <phrase_end>
	safe_hide id = <pitch_indicator>
endscript

script vocals_lyrics_move_and_die 
	<id> :obj_spawnscript vocals_lyrics_move_and_die_spawned params = {id = <id> y_pos = <y_pos> alpha = <alpha>}
endscript

script vocals_lyrics_move_and_die_spawned 
	vocals_lyrics_move id = <id> y_pos = <y_pos> alpha = <alpha>
	wait \{0.3
		seconds}
	die
endscript

script vocals_lyrics_move 
	getscreenelementposition id = <id> local
	<id> :se_setprops pos = ((<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0))) time = 0.2 alpha = <alpha>
endscript

script vocals_hud_amplitude_glow 
	rgba = ($vocals_hud_rgba [(<player> -1)])
	glow_rgba = ($vocals_hud_glow_rgba [(<player> -1)])
	gamemode_gettype
	if (<type> = competitive || <type> = pro_faceoff)
		if teammodeequals \{team_mode = two_teams}
			getplayerinfo <player> band
			rgba = ($vocals_hud_rgba [(<band> -1)])
			glow_rgba = ($vocals_hud_glow_rgba [(<band> -1)])
		endif
	endif
	se_setprops {
		vocal_meter_color_stripe_rgba = <rgba>
		vocal_meter_color_stripe_on_rgba = <glow_rgba>
	}
	begin
	vocals_getcuramplitude player = <player>
	alpha = ($vocals_hud_amp_glow_scale * <current_amplitude>)
	if (<alpha> > 1.0)
		alpha = 1.0
	endif
	se_setprops vocal_meter_color_stripe_on_alpha = <alpha>
	wait \{1
		gameframe}
	repeat
endscript

script vocals_is_last_player_in_starpower_on_highway 
	requireparams \{[
			player
		]
		all}
	vocals_getactivehighway player = <player>
	this_active_highway = <active_highway>
	this_player = <player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if NOT (<player> = <this_player>)
		if playerinfoequals <player> part = vocals
			vocals_getactivehighway player = <player>
			if (<active_highway> = <this_active_highway>)
				if playerinfoequals <player> star_power_used = 1
					return \{false}
				endif
			endif
		endif
	endif
	getnextplayer player = <player> on_screen
	repeat <num_players_shown>
	return \{true}
endscript

script vocals_activate_star_power 
	requireparams \{[
			player
		]
		all}
	vocals_getactivehighway player = <player>
	spawnscriptnow create_vocals_star_power_effect params = {player = <active_highway>}
endscript

script vocals_deactivate_star_power 
	requireparams \{[
			player
		]
		all}
	if vocals_is_last_player_in_starpower_on_highway player = <player>
		vocals_getactivehighway player = <player>
		spawnscriptnow kill_vocals_star_power_effect params = {player = <active_highway>}
	endif
endscript

script vocals_should_hide_highway 
	if ($cheat_performancemode = 1)
		return \{true}
	endif
	gamemode_gettype
	if (<type> != freeplay)
		vocals_getactivehighway player = <player>
		printstruct channel = trchen <...>
		if NOT (<active_highway> = <player>)
			return \{true}
		endif
	endif
	return \{false}
endscript
