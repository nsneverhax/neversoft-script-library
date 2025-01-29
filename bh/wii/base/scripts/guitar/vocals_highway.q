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
vocal_paint_outline_color_hit_ngc = [
	255
	163
	60
	255
]
vocal_paint_fill_color_hit_ngc = [
	255
	255
	0
	255
]
vocal_paint_outline_color_sing_ngc = [
	185
	89
	19
	255
]
vocal_paint_fill_color_sing_ngc = [
	0
	0
	0
	255
]
vocal_paint_outline_color_default_ngc = [
	101
	60
	45
	255
]
vocal_paint_fill_color_default_ngc = [
	0
	0
	0
	255
]
vocal_paint_outline_color_hit_sp_ngc = [
	0
	174
	255
	255
]
vocal_paint_fill_color_hit_sp_ngc = [
	0
	102
	158
	255
]
vocal_paint_outline_color_sing_sp_ngc = [
	2
	168
	168
	255
]
vocal_paint_fill_color_sing_sp_ngc = [
	0
	0
	0
	255
]
vocal_paint_outline_color_default_sp_ngc = [
	0
	100
	100
	255
]
vocal_paint_fill_color_default_sp_ngc = [
	0
	0
	0
	255
]
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
	230
	230
	230
	255
]
vocal_scrolling_spoken_lyric_rgba = [
	230
	230
	230
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
	240
	240
	240
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
0xce905e66 = {
	0xb43ba091 = {
		font = fontgrid_title_a1
		Scale = (0.27, 0.27)
		offset = (0.0, -44.0)
		0x324481fa = (0.38000003, 0.4)
		0x902c541d = 40
	}
	dlc = {
		font = fontgrid_text_a1
		Scale = (0.45000002, 0.45000002)
		offset = (0.0, -44.0)
		0x324481fa = (0.65000004, 0.65000004)
		0x902c541d = 40
	}
}
vocal_lyric_font = NULL
vocal_lyric_font_scale = (0.0, 0.0)
vocal_lyric_karaoke_font_scale = (0.0, 0.0)
vocal_highway_karaoke_text_height = 0
vocal_lyric_font_offset = (0.0, 0.0)
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
vocal_enable_material_paint = 0
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

script 0xed767877 
	list_array = ($on_disc_list)
	if ArrayContains array = ($<list_array>) contains = <song_name>
		<props_struct> = ($0xce905e66.0xb43ba091)
	else
		<props_struct> = ($0xce905e66.dlc)
	endif
	Change vocal_lyric_font = (<props_struct>.font)
	Change vocal_lyric_font_scale = (<props_struct>.Scale)
	Change vocal_lyric_font_offset = (<props_struct>.offset)
	Change vocal_lyric_karaoke_font_scale = (<props_struct>.0x324481fa)
	Change vocal_highway_karaoke_text_height = (<props_struct>.0x902c541d)
endscript

script vocals_setup_comet_locations 
	<index> = 1
	begin
	vocals_setplayerhighwayindex Player = <index> highway = 0
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
	if playerinfoequals <Player> part = vocals
		vocals_setplayerhighwayindex Player = <Player> highway = (<highways> [<vocalist_num>])
		if (<highways> [<vocalist_num>] > <highway_index>)
			vocals_setactivehighwayplayerindex highway = (<highways> [<vocalist_num>]) Player = <Player>
			highway_index = (<highway_index> + 1)
		endif
		<vocalist_num> = (<vocalist_num> + 1)
	endif
	getnextplayer Player = <Player>
	repeat <num_players_shown>
endscript

script vocals_get_highway_pos 
	RequireParams \{[
			highway_index
		]
		all}
	gamemode_gettype
	if (<Type> = freeplay)
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
	RequireParams \{[
			Player
			vocals_highway_view
		]
		all}
	if NOT ScreenElementExists id = <parent>
		CreateScreenElement {
			id = <parent>
			parent = root_window
			Type = ContainerElement
		}
	endif
	printf channel = vocals 'vocals_create_highway - player %p' p = <Player>
	vocals_setup_comet_locations
	vocalshighway_getid Player = <Player>
	DestroyScreenElement id = <vocals_highway_id>
	gamemode_gettype
	vocals_getvocalistnum Player = <Player>
	vocals_getactivehighway Player = <Player>
	vocals_getactivehighwayindex Player = <Player>
	highway_index = <active_highway_index>
	vocals_get_highway_pos highway_index = <highway_index>
	setplayerinfo <Player> highway_position = <highway_pos>
	switch <highway_pos>
		case vocal1
		Pos = (0.0, 0.0)
		setplayerinfo <Player> hud_parent = alias_v1
		case vocal2
		if (<vocals_highway_view> = static && <Type> = competitive)
			Pos = (0.0, 414.0)
		else
			Pos = (0.0, 430.0)
		endif
		setplayerinfo <Player> hud_parent = alias_v2
		default
		SoftAssert \{qs(0xd12b34e0)}
		Pos = (0.0, 0.0)
		setplayerinfo <Player> hud_parent = alias_v2
	endswitch
	CreateScreenElement {
		parent = <parent>
		id = <vocals_highway_id>
		Type = descinterface
		desc = 'vocals_highway'
		Pos = <Pos>
		z_priority = 0
		just = [left top]
		internal_just = [left top]
	}
	ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
	if ScreenElementExists id = <root>
		<root> :se_setprops alpha = 0
	endif
	SpawnScriptLater vocals_create_highway_bg params = {Player = <Player>}
	<vocals_highway_id> :desc_resolvealias Name = alias_note_scale param = lyrics_container
	CreateScreenElement {
		local_id = vocals_current_phrase_lyrics
		parent = <lyrics_container>
		Type = ContainerElement
		Pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	CreateScreenElement {
		local_id = vocals_next_phrase_lyrics
		parent = <lyrics_container>
		Type = ContainerElement
		Pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	if ($vocal_debug_hud = 1)
		CreateScreenElement {
			local_id = vocalist_hud_debug_pitch
			Type = TextBlockElement
			parent = <vocals_highway_id>
			font = fontgrid_text_a1
			Pos = (200.0, 0.0)
			dims = (300.0, 0.0)
			text = qs(0x03ac90f0)
			internal_scale = 0.4
			just = [left top]
			z_priority = 15
			allow_expansion
		}
	endif
	if ScreenElementExists id = <vocal_fireball>
		DestroyScreenElement id = <vocal_fireball>
	endif
	vocals_get_highway_view Player = <Player>
	if (<highway_view> = karaoke)
		vocals_karaoke_hide_highway vocals_highway_id = <vocals_highway_id> Player = <Player>
	endif
	<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
	formatText checksumName = the_now_bar 'now_bar_p%i' i = <Player>
	if NOT (<highway_view> = karaoke)
		CreateScreenElement {
			Type = SpriteElement
			local_id = <the_now_bar>
			id = <the_now_bar>
			parent = <now_bar>
			texture = nowbar
			use_animated_uvs = true
			left_right_u
			frame_length = 0.1
			num_uv_frames = (8.0, 1.0)
			rgba = [255 255 255 255]
			Pos = (8.0, -18.0)
			just = [center , center]
			Scale = 0.2
			z_priority = 18.0
			pos_anchor = [center , center]
		}
		<now_bar> :se_setprops unhide
		<the_now_bar> :se_setprops unhide
	endif
	vocals_getvocalistnum Player = <Player>
	printf channel = vocals qs(0x17066829) a = <Player>
	vocalshighway_getid Player = <Player>
	gamemode_gettype
	if (<Type> != freeplay)
		vocals_getactivehighway Player = <Player>
		printf channel = vocals qs(0xcdf610f8) a = <Player> b = <active_highway>
		if (<active_highway> = <Player>)
		else
			<vocals_highway_id> :se_setprops alpha = 0
		endif
	else
		<vocals_highway_id> :se_setprops alpha = 1
	endif
	setup_individual_highway_hud Player = <Player>
	formatText checksumName = indicator 'alias_pitch_indicator_%i' i = <Player>
	<vocals_highway_id> :desc_resolvealias Name = <indicator> param = pitch_indicator
	if (<highway_view> = karaoke)
		<pitch_indicator> :se_getparentid
		<parent_id> :se_setprops alpha = 0.0 Hide
	endif
endscript

script vocals_destroy_highway 
	gamemode_gettype
	if (<Type> != freeplay)
		vocals_mute_all_mics \{mute = true}
	endif
	if (<Type> != freeplay)
		destroy_vocals_visualizer Player = <Player>
	endif
	if ScreenElementExists id = <vocals_flamer_id>
		DestroyScreenElement id = <vocals_flamer_id>
	endif
	if ScreenElementExists id = <vocals_flamer_sp_id>
		DestroyScreenElement id = <vocals_flamer_sp_id>
	endif
	vocalshighway_getid Player = <Player>
	DestroyScreenElement id = <vocals_highway_id>
endscript

script vocals_highway_slide_in \{play_vocal_highway_sfx = 0}
	RequireParams \{[
			Player
		]
		all}
	vocalshighway_getid Player = <Player>
	if ScreenElementExists id = <vocals_highway_id>
		if GotParam \{delay}
			Wait <delay> frames
		endif
		if ScreenElementExists id = <vocals_highway_id>
			ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
			if ScreenElementExists id = <root>
				if (<play_vocal_highway_sfx> = 1)
					if NOT IsSoundEventPlaying \{vocal_highway_appear}
						SpawnScriptNow \{song_intro_highway_up_vocals_sfx_waiting}
					endif
				endif
				<root> :se_setprops alpha = 1 motion = ease_out time = 0.5
			endif
		endif
	endif
	if NOT ($is_attract_mode = 1)
		vocals_mute_all_mics \{mute = FALSE}
	endif
endscript

script vocals_create_highway_bg 
	RequireParams \{[
			Player
		]
		all}
	vocalshighway_getid Player = <Player>
	vocals_get_highway_view Player = <Player>
	if ($voclas_proto = 1)
		<vocals_highway_id> :se_setprops fireball_bg_rgba = ($voclas_proto_adjustments [(<Player> -1)].rgba_fireball)
		<vocals_highway_id> :se_setprops fireball_bg_scale = ($voclas_proto_adjustments [(<Player> -1)].scale_fireball)
	else
		<vocals_highway_id> :se_setprops fireball_bg_rgba = $vocal_fireball_color
	endif
	if (<highway_view> = scrolling)
		<vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 0
		<vocals_highway_id> :se_setprops curr_phrase_bg_static_alpha = 0
		<vocals_highway_id> :se_setprops curr_phrase_bg_scrolling_alpha = 1
		<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_start param = phrase_start
		<phrase_start> :se_setprops alpha = 0
		<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_end param = phrase_end
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
		if <vocals_highway_id> :desc_resolvealias Name = alias_bg_container param = bg_container
			<bg_container> :se_setprops Hide
		endif
	endif
endscript

script vocals_create_moment_section 
	RequireParams \{[
			Pos
			dims
			Player
		]
		all}
	<texture_to_hwy_ratio> = (100.0 / 64.0)
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_note_scale param = note_scale
	CreateScreenElement {
		parent = <note_scale>
		Type = WindowElement
		Pos = <Pos>
		dims = <dims>
		just = [left top]
		internal_just = [left top]
		z_priority = 2
	}
	<container_id> = <id>
	<mat_dims> = ((64.0, 48.0) * <texture_to_hwy_ratio>)
	<step> = ((128.0, 0.0) * <texture_to_hwy_ratio>)
	<curr_pos> = (0.0, 40.0)
	begin
	CreateScreenElement {
		parent = <container_id>
		Type = SpriteElement
		Pos = <curr_pos>
		dims = <mat_dims>
		texture = bandmoment_vocalflame
		just = [left top]
		rgba = [255 255 255 255]
		Scale = (1.0, 0.75)
		blend = add
		z_priority = -10
		use_animated_uvs = true
		frame_length = 0.041699998
		num_uv_frames = (2.0, 5.0)
		loop_animated_uvs = true
	}
	<curr_pos> = (<curr_pos> + <step>)
	if (<curr_pos> [0] >= <dims> [0])
		break
	endif
	repeat
	return id = <container_id>
endscript

script vocals_create_freeform_section \{Type = melodic}
	RequireParams \{[
			Pos
			dims
			Player
		]
		all}
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_note_scale param = note_scale
	<Pos> = (((<Pos>.(1.0, 0.0)) * (1.0, 0.0)) + ((<Pos>.(0.0, 1.0) + 15) * (0.0, 1.0)))
	CreateScreenElement {
		parent = <note_scale>
		Type = WindowElement
		Pos = <Pos>
		dims = <dims>
		just = [left top]
		internal_just = [left top]
		z_priority = 2
	}
	<container_id> = <id>
	<child_pos> = (((<Pos>.(1.0, 0.0)) * (-1.0, 0.0)) + (<Pos>.(0.0, 1.0) * (0.0, 1.0)))
	CreateScreenElement {
		parent = <container_id>
		Type = SpriteElement
		dims = (256.0, 100.0)
		texture = vh_freeform01
		Pos = <child_pos>
		just = [left top]
		blend = add
		z_priority = -10
		use_animated_uvs = true
		top_down_v
		frame_length = 0.1
		num_uv_frames = (1.0, 8.0)
	}
	CreateScreenElement {
		parent = <container_id>
		Type = SpriteElement
		Pos = (0.0, 0.0)
		dims = (128.0, 100.0)
		texture = vh_freeform_bg
		Pos = <child_pos>
		just = [left top]
		z_priority = -11
	}
	return id = <container_id>
endscript

script vocals_create_paint 
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_note_scale param = note_scale
	<rgba> = ($vocal_paint_colors.<hit>)
	CreateScreenElement {
		parent = <note_scale>
		Type = ContainerElement
		just = [left center]
		Pos = <Pos>
		z_priority = 6
	}
	<container_id> = <id>
	if vocals_highway_has_player_in_starpower Player = <Player>
		CreateScreenElement {
			parent = <container_id>
			local_id = note_middle
			Type = SpriteElement
			just = [left center]
			texture = lyric_star_blip_middle
			rgba = <rgba>
		}
		<middle_id> = <id>
	else
		CreateScreenElement {
			parent = <container_id>
			local_id = note_middle
			Type = SpriteElement
			just = [left center]
			texture = lyric_blip_middle
			rgba = <rgba>
		}
		<middle_id> = <id>
	endif
	return id = <container_id> stretch_id = <middle_id>
endscript

script vocals_create_phrase_marker 
	RequireParams \{[
			Player
		]
		all}
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_note_scale param = note_scale
	GetScreenElementDims id = <note_scale>
	CreateScreenElement {
		parent = <note_scale>
		Type = SpriteElement
		just = [center top]
		dims = ((7.0, 30.0) + (0.0, 1.0) * <height>)
		Pos = (0.0, 0.0)
		texture = white
		rgba = [110 110 110 160]
		z_priority = 2
	}
	return id = <id>
endscript

script vocals_get_highway_view 
	RequireParams \{[
			Player
		]
		all}
	gman_songtool_getcurrentsong
	song = <current_song>
	getplayerinfo <Player> vocals_highway_view
	if NOT notetracker_is_using_stream
		if is_current_song_a_jam_session
			vocals_highway_view = scrolling
		endif
	endif
	get_song_difficulty_ratings song = <song>
	if (<vocals_difficulty_rating> = 0)
		vocals_highway_view = scrolling
	endif
	return highway_view = <vocals_highway_view>
endscript

script vocals_set_highway_view 
	RequireParams \{[
			Player
			view
		]
		all}
	setplayerinfo <Player> vocals_highway_view = <view>
	if NOT GotParam \{controller}
		controller = (<Player> - 1)
	endif
	save_progression_instrument_user_option part = vocals controller = <controller> option = 'highway_view' new_value = <view>
endscript

script vocals_get_highway_view_text 
	ScriptAssert \{'vocals_get_highway_view_text: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script vocals_freeform_melodic_message 
	formatText TextName = text qs(0x2e7f32bb) b = <base_score> m = <multiplier>
	vocals_message Player = <Player> text = <text> rgba = [220 220 0 255]
endscript

script vocals_message 
	vocalshighway_getid Player = <Player>
	getplayerinfo <Player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		SoftAssert \{qs(0x3d5c174f)}
		return
	endif
	if ScreenElementExists id = {<combo_meter_id> child = vocalist_phrase_status}
		DestroyScreenElement id = {<combo_meter_id> child = vocalist_phrase_status}
	endif
	CreateScreenElement {
		local_id = vocalist_phrase_status
		parent = <combo_meter_id>
		Type = TextBlockElement
		Pos = (0.0, 30.0)
		dims = (350.0, 160.0)
		just = [left top]
		internal_just = [left top]
		rgba = <rgba>
		text = <text>
		Scale = (1.0, 1.0)
		font = fontgrid_title_a1
		z_priority = 16
		internal_scale = 0.3
		alpha = 1.0
		Shadow
		shadow_offs = (1.0, 1.0)
	}
	RunScriptOnScreenElement id = <id> vocals_message_wait_and_die
endscript

script vocals_message_wait_and_die 
	Wait \{1
		Second}
	se_setprops \{alpha = 0.0
		time = 0.4}
	se_waitprops
	Die
endscript

script vocals_message_delayed 
	SpawnScriptLater vocals_message_delayed_spawn params = <...>
endscript

script vocals_message_delayed_spawn 
	Wait \{1
		Second}
	vocals_message <...>
endscript

script vocals_freeform_score_message 
	quality_struct = ($vocal_freeform_qualities [<index>])
	vocals_message {
		Player = <Player>
		text = (<quality_struct>.text)
		rgba = (<quality_struct>.rgba)
	}
endscript

script vocals_lightning_alert 
	vocalshighway_getid Player = <Player>
	if <vocals_highway_id> :desc_resolvealias Name = alias_top_lightning param = parent
		RunScriptOnScreenElement id = <parent> vocals_lightning_alert_spawned
	endif
endscript

script vocals_lightning_alert_spawned 
	Obj_GetID
	lightning_time = 0.2
	ResolveScreenElementID id = {<objID> child = lightning0} param = streak_lightning_01
	ResolveScreenElementID id = {<objID> child = lightning1} param = streak_lightning_03
	ResolveScreenElementID id = {<objID> child = lightning2} param = streak_lightning_05
	ResolveScreenElementID id = {<objID> child = lightning3} param = streak_lightning_07
	vocals_lightning_hide
	SetScreenElementProps id = <streak_lightning_01> alpha = 1 time = <lightning_time>
	Wait <lightning_time> Seconds
	SetScreenElementProps id = <streak_lightning_01> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_03> alpha = 1 time = <lightning_time>
	Wait <lightning_time> Seconds
	SetScreenElementProps id = <streak_lightning_03> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_05> alpha = 1 time = <lightning_time>
	Wait <lightning_time> Seconds
	SetScreenElementProps id = <streak_lightning_05> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_07> alpha = 1 time = <lightning_time>
	Wait <lightning_time> Seconds
	SetScreenElementProps id = <streak_lightning_07> alpha = 0 time = <lightning_time>
	Wait <lightning_time> Seconds
endscript

script vocals_lightning_hide 
	Obj_GetID
	if GetScreenElementChildren id = <objID>
		GetArraySize <children>
		<i> = 0
		begin
		SetScreenElementProps id = (<children> [<i>]) alpha = 0
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script spin_ui_element \{time = 1}
	begin
	se_setprops rot_angle = 360 time = <time>
	se_waitprops
	se_setprops \{rot_angle = 0}
	repeat
endscript

script vocals_star_power_changed 
	formatText checksumName = vocals_flamer_sp_id 'vocals_flamer_sp_id_%i' i = <Player>
	vocals_get_highway_view Player = <Player>
	gamemode_gettype
	if (<Type> != freeplay)
		vocals_getactivehighway Player = <Player>
		vocalshighway_getid Player = <active_highway>
	else
		if (($freeplay_primary_vocalist) > -1)
			vocalshighway_getid Player = ($freeplay_primary_vocalist)
		else
			vocalshighway_getid Player = <Player>
		endif
	endif
	formatText checksumName = indicator 'alias_pitch_indicator_%i' i = <Player>
	<vocals_highway_id> :desc_resolvealias Name = <indicator> param = pitch_indicator
	ResolveScreenElementID id = {<pitch_indicator> child = 2} param = vocals_flamer_sp_id
	if (<enable> = 1)
		if NOT (<highway_view> = karaoke)
			<vocals_flamer_sp_id> :se_setprops alpha = 1.0
			RunScriptOnScreenElement id = <vocals_flamer_sp_id> spin_ui_element Max = 1 management = kill_oldest
		endif
	else
		if NOT (<highway_view> = karaoke)
			<vocals_flamer_sp_id> :se_setprops alpha = 0.0
			KillSpawnedScript id = <vocals_flamer_sp_id> Name = spin_ui_element
		endif
	endif
endscript

script vocals_lightning_starpower_spawned 
	ScriptAssert \{'vocals_lightning_starpower_spawned: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script vocals_lightning_starpower_spawned_b 
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = lightning0b} param = lightning0
	ResolveScreenElementID id = {<objID> child = lightning1b} param = lightning1
	ResolveScreenElementID id = {<objID> child = lightning2b} param = lightning2
	ResolveScreenElementID id = {<objID> child = lightning3b} param = lightning3
	<alpha> = 0.7
	begin
	<lightning_time> = RandomFloat (0.05, 0.09)
	SetScreenElementProps id = <lightning0> alpha = <alpha> time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = 0 time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	SetScreenElementProps id = <lightning0> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning1>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning2>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = <alpha> time = <lightning_time>
	waitscreenelementprops id = <lightning3>
	repeat
endscript

script vocals_lightning_starpower_spawned_c 
	ScriptAssert \{'vocals_lightning_starpower_spawned_c: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script vocals_highway_border_flash \{rgba = [
			255
			255
			255
			255
		]}
	ScriptAssert \{'vocals_highway_border_flash: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script vocals_highway_border_flash_spawned 
	se_setprops border_rgba = <rgba> time = 0.1
	se_waitprops
	se_setprops \{border_rgba = [
			255
			255
			255
			255
		]
		time = 0.35000002}
	se_waitprops
endscript

script vocals_karaoke_hide_highway 
	RequireParams \{[
			vocals_highway_id
			Player
		]
		all}
	<vocals_highway_id> :desc_resolvealias Name = alias_visible_highway param = visible_highway
	<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
	<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_start param = phrase_start
	<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_end param = phrase_end
	<vocals_highway_id> :desc_resolvealias Name = alias_pitch_indicator param = pitch_indicator
	safe_hide id = <visible_highway>
	safe_hide id = <visible_highway>
	safe_hide id = <phrase_start>
	safe_hide id = <phrase_end>
	safe_hide id = <pitch_indicator>
endscript

script vocals_lyrics_move_and_die 
	<id> :obj_spawnscript vocals_lyrics_move_and_die_spawned params = {id = <id> y_pos = <y_pos> alpha = <alpha>}
endscript

script vocals_lyrics_move_and_die_spawned 
	vocals_lyrics_move id = <id> y_pos = <y_pos> alpha = <alpha>
	Wait \{0.3
		Seconds}
	Die
endscript

script vocals_lyrics_move 
	GetScreenElementPosition id = <id> local
	<id> :se_setprops Pos = ((<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0))) time = 0.2 alpha = <alpha>
endscript

script vocals_hud_amplitude_glow 
	rgba = ($vocals_hud_rgba [(<Player> -1)])
	glow_rgba = ($vocals_hud_glow_rgba [(<Player> -1)])
	gamemode_gettype
	if (<Type> = competitive || <Type> = pro_faceoff)
		if gamemode_isteamgame
			getplayerinfo <Player> Band
			rgba = ($vocals_hud_rgba [(<Band> -1)])
			glow_rgba = ($vocals_hud_glow_rgba [(<Band> -1)])
		endif
	endif
	se_setprops {
		vocal_meter_color_stripe_rgba = <rgba>
		vocal_meter_color_stripe_on_rgba = <glow_rgba>
	}
	begin
	vocals_getcuramplitude Player = <Player>
	alpha = ($vocals_hud_amp_glow_scale * <current_amplitude>)
	if (<alpha> > 1.0)
		alpha = 1.0
	endif
	se_setprops vocal_meter_color_stripe_on_alpha = <alpha>
	Wait \{1
		gameframe}
	repeat
endscript

script vocals_is_last_player_in_starpower_on_highway 
	RequireParams \{[
			Player
		]
		all}
	vocals_getactivehighway Player = <Player>
	this_active_highway = <active_highway>
	this_player = <Player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if NOT (<Player> = <this_player>)
		if playerinfoequals <Player> part = vocals
			vocals_getactivehighway Player = <Player>
			if (<active_highway> = <this_active_highway>)
				if playerinfoequals <Player> star_power_used = 1
					return \{FALSE}
				endif
			endif
		endif
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players_shown>
	return \{true}
endscript

script vocals_highway_has_player_in_starpower 
	RequireParams \{[
			Player
		]
		all}
	vocals_getactivehighway Player = <Player>
	this_active_highway = <active_highway>
	this_player = <Player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> part = vocals
		vocals_getactivehighway Player = <Player>
		if (<active_highway> = <this_active_highway>)
			if playerinfoequals <Player> star_power_used = 1
				return \{true}
			endif
		endif
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players_shown>
	return \{FALSE}
endscript

script vocals_activate_star_power 
	RequireParams \{[
			Player
		]
		all}
	vocals_getactivehighway Player = <Player>
	SpawnScriptNow create_vocals_star_power_effect params = {Player = <active_highway>}
endscript

script vocals_deactivate_star_power 
	RequireParams \{[
			Player
		]
		all}
	if vocals_is_last_player_in_starpower_on_highway Player = <Player>
		vocals_getactivehighway Player = <Player>
		SpawnScriptNow kill_vocals_star_power_effect params = {Player = <active_highway>}
	endif
endscript

script vocals_should_hide_highway 
	if ($hide_hud_elements = 1 || $Cheat_PerformanceMode = 1)
		return \{true}
	endif
	return \{FALSE}
endscript
