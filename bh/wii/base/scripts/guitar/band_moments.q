band_moment_temp_mult_time = 0
band_moment_temp_mult_increase = 0

script band_moment_start 
endscript

script band_moment_failed 
	array = []
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> band_moment_failed
		if (<band_moment_failed> = 1)
			AddArrayElement array = <array> element = <Player>
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	notification = qs(0xc2044f6b)
	hud_create_message {text = <notification> Band style_script = hud_message_band_streak_style style_script_params = {players = <array> broken_icons}}
endscript

script band_moment_passed 
	SoundEvent \{event = band_moment_sfx}
	SoundEvent \{event = band_moment_back}
	Change \{wii_gem_flame_array = [
		]}
	SpawnScriptNow \{star_meter_glow}
	getnumplayersingame
	band_players = <num_players>
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> != vocals)
			SpawnScriptNow create_highway_band_moment_effect params = {Player = <Player>}
		else
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	getfirstplayer
	getplayerinfo <Player> playline_song_measure_time
	Change band_moment_temp_mult_time = (8 * <playline_song_measure_time>)
	Change band_moment_temp_mult_increase = (<band_players> - 1)
	SpawnScriptNow \{bm_wait_for_death}
endscript

script bm_wait_for_death 
	begin
	if (($band_moment_temp_mult_time) > 0)
		Wait \{10
			gameframe}
	else
		SpawnScriptNow \{kill_star_meter_glow}
		play_end_band_moment_sfx
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> part
			if (<part> != vocals)
				SpawnScriptNow kill_highway_band_moment_effect params = {Player = <Player>}
			else
				SpawnScriptNow kill_vocals_band_moment_effect params = {Player = <Player>}
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		break
	endif
	repeat
endscript

script play_end_band_moment_sfx 
endscript

script create_highway_band_moment_effect 
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 1.4) * <height>)
	pos3 = ((0.0, 1.4) * <height>)
	formatText checksumName = cont 'sidebar_container_leftp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namel2 'sidebar_Left_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namel2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		Pos = <Pos>
		Scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formatText checksumName = cont 'sidebar_container_rightp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namer2 'sidebar_Right_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namer2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		Pos = <Pos>
		Scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formatText checksumName = container_id 'fretbar_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namec 'sidebar_Center_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec>
		parent = <container_id>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		Pos = <pos2>
		rot_angle = 0
		Scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	formatText checksumName = namec2 'sidebar_Center_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec2>
		parent = <container_id>
		material = mat_meter_wibble_glow
		blend = add
		rgba = [255 200 128 0]
		Pos = <pos3>
		rot_angle = 0
		Scale = (4.0, 0.0)
		just = [center center]
		z_priority = 12.1
	}
	<namel2> :se_setprops rgba = [255 128 0 128] Scale = (1.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 128 0 128] Scale = (-1.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 128 0 128] Scale = (8.0, 2.5) time = 0.5
	<namec2> :se_setprops rgba = [255 128 0 128] Scale = (4.0, 3.5) time = 0.25
	Wait \{0.25
		Seconds}
	<namec2> :se_setprops rgba = [255 128 0 0] Scale = (4.0, 0.0) time = 0.25
	formatText checksumName = container_id 'Highway_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namec1 'Center_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec1>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec1>
		parent = <container_id>
		material = mat_combo_nuke_xplosion
		rgba = [255 255 255 255]
		Pos = (0.0, 460.0)
		rot_angle = 0
		Scale = (3.0, 3.0)
		just = [center bottom]
		z_priority = 0.0
	}
	formatText checksumName = bmcfx1 'Center_Particle_BMp%p' p = <Player> AddToStringLookup = true
	Destroy2DParticleSystem kill_when_empty id = <bmcfx1>
	Create2DParticleSystem {
		id = <bmcfx1>
		Pos = (0.0, 460.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 128 128 255]
		end_color = [255 128 0 0]
		start_scale = (1.55, 1.55)
		end_scale = (0.35000002, 0.35000002)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 166
		emit_radius = 166
		Emit_Rate = 0.035
		emit_dir = 0.0
		emit_spread = 90.0
		velocity = 30.0
		friction = (0.0, 128.0)
		time = 0.51
	}
	Wait \{0.25
		Seconds}
	Destroy2DParticleSystem kill_when_empty id = <bmcfx1>
	if ScreenElementExists id = <namec>
		<namec> :se_setprops rgba = [255 128 0 64] time = 0.5
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <namec1>
	DestroyScreenElement id = <namec2>
endscript

script kill_highway_band_moment_effect 
	formatText checksumName = namel2 'sidebar_Right_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namel2>
		<namel2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formatText checksumName = namer2 'sidebar_Left_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namer2>
		<namer2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formatText checksumName = namec 'sidebar_Center_BMRushp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namec>
		<namec> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	Wait \{1
		Seconds}
	formatText checksumName = namec 'sidebar_Center_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	formatText checksumName = namel2 'sidebar_Left_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	formatText checksumName = namer2 'sidebar_Right_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
endscript
wii_gem_flame_array = [
]

script wii_kill_band_moment_gem_flames 
	GetArraySize ($wii_gem_flame_array)
	if (<array_Size> > 0)
		index = 0
		begin
		id = (($wii_gem_flame_array) [<index>].id)
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
		index = (<index> + 1)
		repeat <array_Size>
	endif
	Change \{wii_gem_flame_array = [
		]}
endscript

script wii_make_band_moment_gem_flame 
	RequireParams \{[
			parent
			gem_index
			Player
			is_open_note
			is_beginner
			is_white_gem
		]
		all}
	if ((<is_beginner> = 0) && (<is_open_note> = 0) && (<is_white_gem> = 0))
		CreateScreenElement {
			Type = SpriteElement
			parent = <parent>
			texture = bandmoment_gemflame
			Pos = (0.0, -20.0)
			just = [center , center]
			pos_anchor = [center , center]
			use_animated_uvs = true
			frame_length = 0.041699998
			num_uv_frames = (4.0, 2.0)
			Scale = 0.5
			blend = add
			z_priority = 2.0
			alpha = 0.7
			loop_animated_uvs = true
		}
		AddArrayElement array = ($wii_gem_flame_array) element = {parent = <parent> gem_index = <gem_index> id = <id>}
		Change wii_gem_flame_array = <array>
	else
		if (<is_white_gem> = 1)
			CreateScreenElement {
				Type = SpriteElement
				parent = <parent>
				texture = bandmoment_barflame
				Pos = (0.0, -16.0)
				just = [center , center]
				pos_anchor = [center , center]
				use_animated_uvs = true
				frame_length = 0.041699998
				num_uv_frames = (1.0, 7.0)
				Scale = (0.3, 0.21875)
				blend = add
				z_priority = 2.0
				alpha = 0.7
				loop_animated_uvs = true
			}
			AddArrayElement array = ($wii_gem_flame_array) element = {parent = <parent> gem_index = <gem_index> id = <id>}
			Change wii_gem_flame_array = <array>
		else
			CreateScreenElement {
				Type = SpriteElement
				parent = <parent>
				texture = bandmoment_barflame
				Pos = (0.0, -8.0)
				just = [center , center]
				pos_anchor = [center , center]
				use_animated_uvs = true
				frame_length = 0.041699998
				num_uv_frames = (1.0, 7.0)
				Scale = (0.25, 0.21875)
				blend = add
				z_priority = 2.0
				alpha = 0.7
				loop_animated_uvs = true
			}
			AddArrayElement array = ($wii_gem_flame_array) element = {parent = <parent> gem_index = <gem_index> id = <id>}
			Change wii_gem_flame_array = <array>
		endif
	endif
endscript

script 0xe7807919 
	formatText checksumName = cont 'sidebar_container_leftp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = 0xc7576c0f 'sidebar_left_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <0xc7576c0f>
	CreateScreenElement {
		Type = SpriteElement
		id = <0xc7576c0f>
		parent = <cont>
		material = 0xc65e783e
		rgba = [255 192 0 128]
		Pos = (-20.0, 20.0)
		Scale = (3.0, 0.8)
		rot_angle = 4
		just = [center bottom]
		z_priority = -1
	}
	formatText checksumName = namel2 'sidebar_left2_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namel2>
		parent = <cont>
		material = 0xc65e783e
		rgba = [255 255 255 64]
		Pos = (-20.0, 20.0)
		Scale = (2.0, 0.75)
		rot_angle = 4
		just = [center bottom]
		z_priority = 12.2
	}
	formatText checksumName = cont 'sidebar_container_Rightp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = 0x131653d0 'sidebar_Right_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <0x131653d0>
	CreateScreenElement {
		Type = SpriteElement
		id = <0x131653d0>
		parent = <cont>
		material = 0xc65e783e
		rgba = [255 192 0 64]
		Pos = (20.0, 20.0)
		rot_angle = -4
		Scale = (-3.0, 0.8)
		just = [center bottom]
		z_priority = -1
	}
	formatText checksumName = namer2 'sidebar_Right2_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namer2>
		parent = <cont>
		material = 0xc65e783e
		rgba = [255 255 255 128]
		Pos = (20.0, 20.0)
		rot_angle = -4
		Scale = (-2.0, 0.75)
		just = [center bottom]
		z_priority = 12.2
	}
	Wait \{24
		frames}
	formatText checksumName = container_id 'Highway_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namec1 'Center_BMp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec1>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec1>
		parent = <container_id>
		material = mat_combo_nuke_xplosion
		rgba = [255 255 255 255]
		Pos = (0.0, 460.0)
		rot_angle = 0
		Scale = (3.0, 3.0)
		just = [center bottom]
		z_priority = 0.0
	}
	formatText checksumName = Name 'Center_Particle_BMp%p' p = <Player> AddToStringLookup = true
	Create2DParticleSystem {
		id = <Name>
		Pos = (0.0, 460.0)
		z_priority = 0
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <container_id>
		start_color = [255 255 128 255]
		end_color = [255 128 0 0]
		start_scale = (0.55, 0.55)
		end_scale = (0.35000002, 0.35000002)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 166
		emit_radius = 166
		Emit_Rate = 0.035
		emit_dir = 0.0
		emit_spread = 44.0
		velocity = 44.0
		friction = (0.0, 128.0)
		time = 0.51
	}
	Wait \{0.2
		Second}
	Destroy2DParticleSystem kill_when_empty id = <Name>
	Wait \{0.7
		Second}
	DestroyScreenElement id = <0xc7576c0f>
	DestroyScreenElement id = <namel2>
	DestroyScreenElement id = <0x131653d0>
	DestroyScreenElement id = <namer2>
	DestroyScreenElement id = <namec1>
endscript

script 0xd25f6aa8 \{viewport = bg_viewport}
	ScreenFX_AddFXInstance {
		viewport = <viewport>
		Name = avfx01
		scefName = avfx01
		Type = audiovisualize
		On = 1
		primitives = $og_band_moment
		clearcolor = [0 , 0 , 0 , 255]
		audio_params = $default_visualizer_audio_params
		BlendMode = blend
		alphafromgrayscale = 3
	}
	Wait \{10
		Seconds}
	if screenFX_FXInstanceExists viewport = <viewport> Name = avfx01 Type = audiovisualize
		ScreenFX_RemoveFXInstance viewport = <viewport> Name = avfx01 Type = audiovisualize
	endif
endscript

script create_vocals_band_moment_effect 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	if (<part> != vocals)
		return
	endif
	vocalshighway_getid Player = <Player>
	<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_bottom param = bot_rush_cont
	<vocals_highway_id> :desc_resolvealias Name = alias_rush_container_top param = top_rush_cont
	formatText checksumName = namevb1 'Vocals_Bottom_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb1>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevb1>
		parent = <bot_rush_cont>
		material = sp_glow_rush01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		Scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	formatText checksumName = namevb2 'Vocals_Bottom_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevb2>
		parent = <bot_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		Scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formatText checksumName = namevt1 'Vocals_Top_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt1>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevt1>
		parent = <top_rush_cont>
		material = sp_glow_rush01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		Scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	formatText checksumName = namevt2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevt2>
		parent = <top_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		Scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formatText checksumName = fxt1 'Vocals_Top_BMFXp%p' p = <Player> AddToStringLookup = true
	Destroy2DParticleSystem id = <fxt1>
	Create2DParticleSystem {
		id = <fxt1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <namevt1>
		start_color = [255 255 255 255]
		end_color = [255 255 128 0]
		start_scale = (1.25, 1.25)
		end_scale = (0.75, 0.75)
		start_angle_spread = 0.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 360.0
		velocity = 1.1
		friction = (-12.0, 12.0)
		time = 0.25
	}
	formatText checksumName = fxb1 'Vocals_Bottom_BMFXp%p' p = <Player> AddToStringLookup = true
	Destroy2DParticleSystem id = <fxb1>
	Create2DParticleSystem {
		id = <fxb1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <namevb1>
		start_color = [255 255 255 255]
		end_color = [255 255 128 0]
		start_scale = (1.25, 1.25)
		end_scale = (0.75, 0.75)
		start_angle_spread = 0.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 360.0
		velocity = 1.1
		friction = (-12.0, 12.0)
		time = 0.25
	}
	<namevb1> :se_setprops Pos = {(1500.0, 0.0) relative} time = 0.5
	<namevb2> :se_setprops Pos = {(200.0, 0.0) relative} Scale = (1.0, 9.0) time = 0.5
	<namevt1> :se_setprops Pos = {(1500.0, 0.0) relative} time = 0.5
	<namevt2> :se_setprops Pos = {(200.0, 0.0) relative} Scale = (1.0, 9.0) time = 0.5
	Wait \{0.5
		Seconds}
	Destroy2DParticleSystem kill_when_empty id = <fxt1>
	Destroy2DParticleSystem kill_when_empty id = <fxb1>
	formatText checksumName = namevt1 'Vocals_Top_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt1>
	formatText checksumName = namevb1 'Vocals_Bottom_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb1>
	formatText checksumName = namevt2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 5.5
	endif
	formatText checksumName = namevb2 'Vocals_bottom_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 5.5
	endif
	Wait \{5.5
		Seconds}
	formatText checksumName = namevb2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb2>
	formatText checksumName = namevt2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt2>
endscript

script star_meter_glow 
	hud_root :desc_resolvealias \{Name = alias_hud_meter_star
		param = id}
	<id> :desc_resolvealias Name = alias_score_bg_glow param = score_bg_glow01
	<id> :desc_resolvealias Name = alias_band_multiplier_glow param = band_multiplier_glow_cont
	DestroyScreenElement \{id = star_meter_glow01}
	DestroyScreenElement \{id = star_meter_blub_glow01}
	Wait \{1
		Frame}
	formatText \{checksumName = smbfx1
		'Star_Meter_Bulb_FX'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <smbfx1>
	Create2DParticleSystem {
		id = <smbfx1>
		Pos = (26.0, 36.0)
		z_priority = -1
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <band_multiplier_glow_cont>
		start_color = [255 255 128 255]
		end_color = [255 128 0 0]
		start_scale = (0.5, 0.5)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.25
	}
	CreateScreenElement {
		Type = SpriteElement
		id = star_meter_blub_glow01
		parent = <band_multiplier_glow_cont>
		material = mat_meter_wibble_glow
		rgba = [255 128 0 0]
		dims = (128.0, 128.0)
		Pos = (26.0, 36.0)
		Scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = -2
	}
	if ScreenElementExists \{id = star_meter_blub_glow01}
		star_meter_blub_glow01 :se_setprops \{rgba = [
				255
				128
				0
				255
			]
			time = 0.05}
	endif
	if ScreenElementExists id = <band_multiplier_glow_cont>
		<band_multiplier_glow_cont> :se_setprops rgba = [255 128 0 255] time = 0.05
	endif
	Wait \{0.11
		Second}
	Destroy2DParticleSystem kill_when_empty id = <smbfx1>
	if ScreenElementExists id = <band_multiplier_glow_cont>
		<band_multiplier_glow_cont> :se_setprops rgba = [255 128 0 0] time = 4.9
	endif
	if ScreenElementExists \{id = star_meter_blub_glow01}
		star_meter_blub_glow01 :se_setprops \{rgba = [
				255
				128
				0
				0
			]
			time = 4.9}
	endif
	Wait \{5
		Seconds}
	DestroyScreenElement \{id = star_meter_blub_glow01}
endscript
