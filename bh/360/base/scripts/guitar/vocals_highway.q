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
		155
		58
		190
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
		155
		58
		190
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
vocals_font_props = {
	on_disc = {
		font = fontgrid_title_a1
		scale = (0.27, 0.27)
		offset = (0.0, -44.0)
		karaoke_scale = (0.4, 0.4)
		karaoke_height = 40
	}
	dlc = {
		font = fontgrid_thingamajig_gh5
		scale = (0.35000002, 0.35000002)
		offset = (0.0, -44.0)
		karaoke_scale = (0.45000002, 0.55)
		karaoke_height = 40
	}
}
vocal_lyric_font = null
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

script vocals_setappropriatefont 
	list_array = ($on_disc_list)
	if ArrayContains array = ($<list_array>) contains = <song_name>
		<props_struct> = ($vocals_font_props.on_disc)
	else
		<props_struct> = ($vocals_font_props.dlc)
	endif
	Change vocal_lyric_font = (<props_struct>.font)
	Change vocal_lyric_font_scale = (<props_struct>.scale)
	Change vocal_lyric_font_offset = (<props_struct>.offset)
	Change vocal_lyric_karaoke_font_scale = (<props_struct>.karaoke_scale)
	Change vocal_highway_karaoke_text_height = (<props_struct>.karaoke_height)
endscript

script vocals_setup_comet_locations 
	<index> = 1
	begin
	Vocals_SetPlayerHighwayIndex player = <index> highway = 0
	<index> = (<index> + 1)
	repeat 4
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> < 1)
		return
	endif
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> = <num_vocalists_shown>)
		assignment_array = ($vocals_highway_assignment_vocalists)
	else
		assignment_array = ($vocals_highway_assignment)
	endif
	highways = (<assignment_array> [<num_vocalists_shown> -1])
	<vocalist_num> = 0
	<highway_index> = 0
	GetNumPlayersInGame \{on_screen}
	GetFirstPlayer
	begin
	if PlayerInfoEquals <player> part = vocals
		Vocals_SetPlayerHighwayIndex player = <player> highway = (<highways> [<vocalist_num>])
		if (<highways> [<vocalist_num>] > <highway_index>)
			Vocals_SetActiveHighwayPlayerIndex highway = (<highways> [<vocalist_num>]) player = <player>
			highway_index = (<highway_index> + 1)
		endif
		<vocalist_num> = (<vocalist_num> + 1)
	endif
	GetNextPlayer player = <player>
	repeat <num_players_shown>
endscript

script vocals_get_highway_pos 
	RequireParams \{[
			highway_index
		]
		all}
	GameMode_GetType
	if (<type> = freeplay)
		highway_pos = vocal1
	else
		if (<highway_index> = 1)
			GetNumPlayersInGame \{on_screen}
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
			player
			vocals_highway_view
		]
		all}
	if NOT ScreenElementExists id = <parent>
		CreateScreenElement {
			id = <parent>
			parent = root_window
			type = ContainerElement
		}
	endif
	printf channel = vocals 'vocals_create_highway - player %p' p = <player>
	vocals_setup_comet_locations
	VocalsHighway_GetId player = <player>
	DestroyScreenElement id = <vocals_highway_id>
	GameMode_GetType
	Vocals_GetVocalistNum player = <player>
	Vocals_GetActiveHighway player = <player>
	Vocals_GetActiveHighwayIndex player = <player>
	highway_index = <active_highway_index>
	vocals_get_highway_pos highway_index = <highway_index>
	SetPlayerInfo <player> highway_position = <highway_pos>
	switch <highway_pos>
		case vocal1
		Pos = (0.0, 0.0)
		SetPlayerInfo <player> hud_parent = alias_v1
		case vocal2
		if (<vocals_highway_view> = static && <type> = competitive)
			Pos = (0.0, 414.0)
		else
			Pos = (0.0, 430.0)
		endif
		SetPlayerInfo <player> hud_parent = alias_v2
		default
		softassert \{qs(0xd12b34e0)}
		Pos = (0.0, 0.0)
		SetPlayerInfo <player> hud_parent = alias_v2
	endswitch
	CreateScreenElement {
		parent = <parent>
		id = <vocals_highway_id>
		type = DescInterface
		desc = 'vocals_highway'
		Pos = <Pos>
		z_priority = 0
		just = [left top]
		internal_just = [left top]
	}
	ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
	if ScreenElementExists id = <root>
		<root> :SE_SetProps alpha = 0
	endif
	spawnscriptlater vocals_create_highway_bg params = {player = <player>}
	<vocals_highway_id> :Desc_ResolveAlias name = alias_note_scale param = lyrics_container
	CreateScreenElement {
		local_id = vocals_current_phrase_lyrics
		parent = <lyrics_container>
		type = ContainerElement
		Pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	CreateScreenElement {
		local_id = vocals_next_phrase_lyrics
		parent = <lyrics_container>
		type = ContainerElement
		Pos = (0.0, 0.0)
		just = [left center]
		internal_just = [left center]
		z_priority = 10
		allow_expansion
	}
	if ($vocal_debug_hud = 1)
		CreateScreenElement {
			local_id = vocalist_hud_debug_pitch
			type = TextBlockElement
			parent = <vocals_highway_id>
			font = fontgrid_text_A1
			Pos = (200.0, 0.0)
			dims = (300.0, 0.0)
			text = qs(0x03ac90f0)
			internal_scale = 0.4
			just = [left top]
			z_priority = 15
			allow_expansion
		}
	endif
	vocals_get_highway_view player = <player>
	if (<highway_view> = karaoke)
		vocals_karaoke_hide_highway vocals_highway_id = <vocals_highway_id> player = <player>
	endif
	create_vocal_visualizer vocals_highway_id = <vocals_highway_id> player = <player>
	setup_individual_highway_hud player = <player>
endscript

script vocals_destroy_highway 
	GameMode_GetType
	if (<type> != freeplay)
		vocals_mute_all_mics \{mute = true}
	endif
	if (<type> != freeplay)
		destroy_vocals_visualizer player = <player>
	endif
	VocalsHighway_GetId player = <player>
	DestroyScreenElement id = <vocals_highway_id>
endscript

script vocals_highway_slide_in \{play_vocal_highway_sfx = 0}
	RequireParams \{[
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	if ScreenElementExists id = <vocals_highway_id>
		if GotParam \{delay}
			wait <delay> frames
		endif
		if ScreenElementExists id = <vocals_highway_id>
			ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
			if ScreenElementExists id = <root>
				if (<play_vocal_highway_sfx> = 1)
					if NOT IsSoundEventPlaying \{Vocal_Highway_Appear}
						spawnscriptnow \{Song_Intro_Highway_Up_Vocals_SFX_Waiting}
					endif
				endif
				<root> :SE_SetProps alpha = 1 motion = ease_out time = 0.5
			endif
		endif
	endif
	vocals_mute_all_mics \{mute = false}
endscript

script vocals_create_highway_bg 
	RequireParams \{[
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	vocals_get_highway_view player = <player>
	if ($voclas_proto = 1)
		<vocals_highway_id> :SE_SetProps fireball_bg_rgba = ($voclas_proto_adjustments [(<player> -1)].rgba_fireball)
		<vocals_highway_id> :SE_SetProps fireball_bg_scale = ($voclas_proto_adjustments [(<player> -1)].scale_fireball)
	else
		<vocals_highway_id> :SE_SetProps fireball_bg_rgba = $vocal_fireball_color
	endif
	if (<highway_view> = scrolling)
		<vocals_highway_id> :SE_SetProps static_next_phrase_bg_alpha = 0
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_static_alpha = 0
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_scrolling_alpha = 1
		<vocals_highway_id> :Desc_ResolveAlias name = alias_static_phrase_start param = phrase_start
		<phrase_start> :SE_SetProps alpha = 0
		<vocals_highway_id> :Desc_ResolveAlias name = alias_static_phrase_end param = phrase_end
		<phrase_end> :SE_SetProps alpha = 0
	elseif (<highway_view> = static)
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_static_alpha = 1
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_scrolling_alpha = 0
		<vocals_highway_id> :SE_SetProps static_next_phrase_bg_alpha = 1
		<vocals_highway_id> :SE_SetProps vocal_health_meter_needle_1_alpha = 0
		<vocals_highway_id> :SE_SetProps vocal_health_meter_needle_2_alpha = 0
	else
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_static_alpha = 0
		<vocals_highway_id> :SE_SetProps curr_phrase_bg_scrolling_alpha = 0
		<vocals_highway_id> :SE_SetProps static_next_phrase_bg_alpha = 0
		<vocals_highway_id> :SE_SetProps vocal_health_meter_needle_1_alpha = 0
		<vocals_highway_id> :SE_SetProps vocal_health_meter_needle_2_alpha = 0
	endif
	if ($vocal_highway_no_background = 1)
		if <vocals_highway_id> :Desc_ResolveAlias name = alias_bg_container param = BG_container
			<BG_container> :SE_SetProps hide
		endif
	endif
endscript

script vocals_create_moment_section 
	RequireParams \{[
			Pos
			dims
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_note_scale param = note_scale
	CreateScreenElement {
		parent = <note_scale>
		type = WindowElement
		Pos = <Pos>
		dims = <dims>
		just = [left top]
		internal_just = [left top]
		z_priority = 2
	}
	<container_id> = <id>
	<material> = Mat_Vocal_Band_Moment_Fire
	<texture_to_hwy_ratio> = (100.0 / 64.0)
	<mat_dims> = ((256.0, 64.0) * <texture_to_hwy_ratio>)
	<step> = ((256.0, 0.0) * <texture_to_hwy_ratio>)
	<curr_pos> = (0.0, 0.0)
	begin
	CreateScreenElement {
		parent = <container_id>
		type = SpriteElement
		Pos = <curr_pos>
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
	RequireParams \{[
			Pos
			dims
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_note_scale param = note_scale
	CreateScreenElement {
		parent = <note_scale>
		type = WindowElement
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
		type = SpriteElement
		Pos = (0.0, 0.0)
		dims = (1280.0, 100.0)
		texture = <texture>
		Pos = <child_pos>
		just = [left top]
		blend = add
		z_priority = -10
	}
	return id = <container_id>
endscript

script vocals_create_paint 
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_note_scale param = note_scale
	<rgba> = ($vocal_paint_colors.<hit>)
	CreateScreenElement {
		parent = <note_scale>
		type = ContainerElement
		just = [left center]
		Pos = <Pos>
		z_priority = 6
	}
	<container_id> = <id>
	CreateScreenElement {
		parent = <container_id>
		local_id = note_left
		type = SpriteElement
		just = [left center]
		texture = lyric_blip_right
		flip_v
		rgba = <rgba>
	}
	CreateScreenElement {
		parent = <container_id>
		local_id = note_middle
		type = SpriteElement
		just = [left center]
		texture = lyric_blip_middle
		rgba = <rgba>
	}
	<middle_id> = <id>
	CreateScreenElement {
		parent = <container_id>
		local_id = note_right
		type = SpriteElement
		just = [left center]
		texture = lyric_blip_right
		rgba = <rgba>
	}
	return id = <container_id> stretch_id = <middle_id>
endscript

script vocals_create_phrase_marker 
	RequireParams \{[
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_note_scale param = note_scale
	GetScreenElementDims id = <note_scale>
	CreateScreenElement {
		parent = <note_scale>
		type = SpriteElement
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
			player
		]
		all}
	GMan_SongTool_GetCurrentSong
	song = <current_song>
	GetPlayerInfo <player> vocals_highway_view
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
			player
			view
		]
		all}
	SetPlayerInfo <player> vocals_highway_view = <view>
	if NOT GotParam \{controller}
		controller = (<player> - 1)
	endif
	save_progression_instrument_user_option part = vocals controller = <controller> option = 'highway_view' new_value = <view>
endscript

script vocals_get_highway_view_text 
	RequireParams \{[
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
	FormatText TextName = text qs(0x2e7f32bb) b = <base_score> m = <Multiplier>
	vocals_message player = <player> text = <text> rgba = [220 220 0 255]
endscript

script vocals_message 
	VocalsHighway_GetId player = <player>
	GetPlayerInfo <player> combo_meter_id
	if NOT ScreenElementExists id = <combo_meter_id>
		softassert \{qs(0x3d5c174f)}
		return
	endif
	if ScreenElementExists id = {<combo_meter_id> child = vocalist_phrase_status}
		DestroyScreenElement id = {<combo_meter_id> child = vocalist_phrase_status}
	endif
	CreateScreenElement {
		local_id = vocalist_phrase_status
		parent = <combo_meter_id>
		type = TextBlockElement
		Pos = (0.0, 30.0)
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
	RunScriptOnScreenElement id = <id> vocals_message_wait_and_DIE
endscript

script vocals_message_wait_and_DIE 
	wait \{1
		second}
	SE_SetProps \{alpha = 0.0
		time = 0.4}
	SE_WaitProps
	Die
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
	VocalsHighway_GetId player = <player>
	if <vocals_highway_id> :Desc_ResolveAlias name = alias_top_lightning param = parent
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
	wait <lightning_time> seconds
	SetScreenElementProps id = <streak_lightning_01> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_03> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	SetScreenElementProps id = <streak_lightning_03> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_05> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	SetScreenElementProps id = <streak_lightning_05> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <streak_lightning_07> alpha = 1 time = <lightning_time>
	wait <lightning_time> seconds
	SetScreenElementProps id = <streak_lightning_07> alpha = 0 time = <lightning_time>
	wait <lightning_time> seconds
endscript

script vocals_lightning_hide 
	Obj_GetID
	if GetScreenElementChildren id = <objID>
		GetArraySize <children>
		<i> = 0
		begin
		SetScreenElementProps id = (<children> [<i>]) alpha = 0
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
	Obj_SpawnScriptNow \{vocals_lightning_starpower_spawned_b}
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = lightning0} param = lightning0
	ResolveScreenElementID id = {<objID> child = lightning1} param = lightning1
	ResolveScreenElementID id = {<objID> child = lightning2} param = lightning2
	ResolveScreenElementID id = {<objID> child = lightning3} param = lightning3
	<alpha> = 0.7
	begin
	<lightning_time> = RandomFloat (0.02, 0.07)
	SetScreenElementProps id = <lightning0> alpha = <alpha> time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = 0 time = <lightning_time>
	WaitScreenElementprops id = <lightning3>
	SetScreenElementProps id = <lightning0> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning1>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning2>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning3>
	repeat
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
	WaitScreenElementprops id = <lightning3>
	SetScreenElementProps id = <lightning0> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning1>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning2>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning3>
	repeat
endscript

script vocals_lightning_starpower_spawned_c 
	Obj_GetID
	ResolveScreenElementID id = {<objID> child = star_001} param = lightning0
	ResolveScreenElementID id = {<objID> child = star_002} param = lightning1
	ResolveScreenElementID id = {<objID> child = star_003} param = lightning2
	ResolveScreenElementID id = {<objID> child = star_004} param = lightning3
	<alpha> = 0.7
	<lightning_time> = 0.07
	begin
	SetScreenElementProps id = <lightning0> alpha = <alpha> time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = 0 time = <lightning_time>
	WaitScreenElementprops id = <lightning3>
	SetScreenElementProps id = <lightning0> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning1>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning2>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = <alpha> time = <lightning_time>
	WaitScreenElementprops id = <lightning3>
	repeat 1
	SetScreenElementProps id = <lightning0> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning1> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning2> alpha = 0 time = <lightning_time>
	SetScreenElementProps id = <lightning3> alpha = 0 time = <lightning_time>
endscript

script vocals_highway_border_flash \{rgba = [
			255
			255
			255
			255
		]}
	RequireParams \{[
			player
		]
		all}
	VocalsHighway_GetId player = <player>
	RunScriptOnScreenElement id = <vocals_highway_id> vocals_highway_border_flash_spawned params = {rgba = <rgba>}
endscript

script vocals_highway_border_flash_spawned 
	SE_SetProps border_rgba = <rgba> time = 0.1
	SE_WaitProps
	SE_SetProps \{border_rgba = [
			255
			255
			255
			255
		]
		time = 0.35000002}
	SE_WaitProps
endscript

script vocals_karaoke_hide_highway 
	RequireParams \{[
			vocals_highway_id
			player
		]
		all}
	<vocals_highway_id> :Desc_ResolveAlias name = alias_visible_highway param = visible_highway
	<vocals_highway_id> :Desc_ResolveAlias name = alias_now_bar param = now_bar
	<vocals_highway_id> :Desc_ResolveAlias name = alias_static_phrase_start param = phrase_start
	<vocals_highway_id> :Desc_ResolveAlias name = alias_static_phrase_end param = phrase_end
	<vocals_highway_id> :Desc_ResolveAlias name = alias_pitch_indicator param = pitch_indicator
	safe_hide id = <visible_highway>
	safe_hide id = <visible_highway>
	safe_hide id = <phrase_start>
	safe_hide id = <phrase_end>
	safe_hide id = <pitch_indicator>
endscript

script vocals_lyrics_move_and_die 
	<id> :Obj_SpawnScript vocals_lyrics_move_and_die_spawned params = {id = <id> y_pos = <y_pos> alpha = <alpha>}
endscript

script vocals_lyrics_move_and_die_spawned 
	vocals_lyrics_move id = <id> y_pos = <y_pos> alpha = <alpha>
	wait \{0.3
		seconds}
	Die
endscript

script vocals_lyrics_move 
	GetScreenElementPosition id = <id> local
	<id> :SE_SetProps Pos = ((<ScreenElementPos>.(1.0, 0.0) * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0))) time = 0.2 alpha = <alpha>
endscript

script vocals_hud_amplitude_glow 
	rgba = ($vocals_hud_rgba [(<player> -1)])
	glow_rgba = ($vocals_hud_glow_rgba [(<player> -1)])
	GameMode_GetType
	if (<type> = competitive || <type> = pro_faceoff)
		if GameMode_IsTeamGame
			GetPlayerInfo <player> Band
			rgba = ($vocals_hud_rgba [(<Band> -1)])
			glow_rgba = ($vocals_hud_glow_rgba [(<Band> -1)])
		endif
	endif
	SE_SetProps {
		vocal_meter_color_stripe_rgba = <rgba>
		vocal_meter_color_stripe_ON_rgba = <glow_rgba>
	}
	begin
	Vocals_GetCurAmplitude player = <player>
	alpha = ($vocals_hud_amp_glow_scale * <current_amplitude>)
	if (<alpha> > 1.0)
		alpha = 1.0
	endif
	SE_SetProps vocal_meter_color_stripe_ON_alpha = <alpha>
	wait \{1
		gameframe}
	repeat
endscript

script vocals_is_last_player_in_starpower_on_highway 
	RequireParams \{[
			player
		]
		all}
	Vocals_GetActiveHighway player = <player>
	this_active_highway = <active_highway>
	this_player = <player>
	GetNumPlayersInGame \{on_screen}
	GetFirstPlayer \{on_screen}
	begin
	if NOT (<player> = <this_player>)
		if PlayerInfoEquals <player> part = vocals
			Vocals_GetActiveHighway player = <player>
			if (<active_highway> = <this_active_highway>)
				if PlayerInfoEquals <player> star_power_used = 1
					return \{false}
				endif
			endif
		endif
	endif
	GetNextPlayer player = <player> on_screen
	repeat <num_players_shown>
	return \{true}
endscript

script vocals_activate_star_power 
	RequireParams \{[
			player
		]
		all}
	Vocals_GetActiveHighway player = <player>
	spawnscriptnow Create_Vocals_Star_Power_Effect params = {player = <active_highway>}
endscript

script vocals_deactivate_star_power 
	RequireParams \{[
			player
		]
		all}
	if vocals_is_last_player_in_starpower_on_highway player = <player>
		Vocals_GetActiveHighway player = <player>
		spawnscriptnow Kill_Vocals_Star_Power_Effect params = {player = <active_highway>}
	endif
endscript

script vocals_should_hide_highway 
	if ($hide_hud_elements = 1 || $Cheat_PerformanceMode = 1)
		return \{true}
	endif
	return \{false}
endscript
