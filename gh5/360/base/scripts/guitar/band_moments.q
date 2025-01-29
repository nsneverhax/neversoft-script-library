band_moment_temp_mult_time = 0
band_moment_temp_mult_increase = 0

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
	kill_all_band_moment_fx_scripts
	SoundEvent \{event = band_moment_sfx}
	SoundEvent \{event = band_moment_back}
	SpawnScriptNow \{create_star_meter_glow}
	getnumplayersingame
	band_players = <num_players>
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> part
		if (<part> != vocals)
			SpawnScriptNow create_highway_band_moment_effect params = {Player = <Player>}
		else
			SpawnScriptNow create_vocals_band_moment_effect params = {Player = <Player>}
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		get_savegame_from_player Player = <Player>
		GetGlobalTags achievement_info savegame = <savegame> param = band_moments_completed
		<band_moments_completed> = (<band_moments_completed> + 1)
		SetGlobalTags achievement_info savegame = <savegame> params = {band_moments_completed = <band_moments_completed>}
		getnextplayer Player = <Player> local
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

script kill_all_band_moment_fx_scripts 
	KillSpawnedScript \{Name = create_highway_band_moment_effect}
	KillSpawnedScript \{Name = create_vocals_band_moment_effect}
	KillSpawnedScript \{Name = create_star_meter_glow}
	KillSpawnedScript \{Name = bm_wait_for_death}
	KillSpawnedScript \{Name = kill_highway_band_moment_effect}
	KillSpawnedScript \{Name = kill_vocals_band_moment_effect}
	KillSpawnedScript \{Name = kill_star_meter_glow}
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
	<vocals_highway_id> :desc_resolvealias Name = alias_visible_highway param = visible_highway
	<visible_highway> :se_setprops alpha = 1 time = 0.2
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
endscript

script kill_vocals_band_moment_effect 
	vocals_get_highway_view Player = <Player>
	if (<highway_view> = karaoke)
		vocalshighway_getid Player = <Player>
		<vocals_highway_id> :desc_resolvealias Name = alias_visible_highway param = visible_highway
		<visible_highway> :se_setprops alpha = 0 time = 0.2
	endif
	formatText checksumName = namevt1 'Vocals_Top_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt1>
	formatText checksumName = namevb1 'Vocals_Bottom_BMRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb1>
	formatText checksumName = namevt2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formatText checksumName = namevb2 'Vocals_bottom_BMGlowp%p' p = <Player> AddToStringLookup = true
	if ScreenElementExists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	Wait \{1
		Seconds}
	formatText checksumName = namevb2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb2>
	formatText checksumName = namevt2 'Vocals_Top_BMGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt2>
endscript

script create_star_meter_glow 
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_meter_star
			param = id}
		return
	endif
	<id> :desc_resolvealias Name = alias_band_multiplier_glow param = band_multiplier_glow_cont
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
		z_priority = -1.1
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
		z_priority = -1.1
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
endscript

script kill_star_meter_glow 
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	hud_root :desc_resolvealias \{Name = alias_hud_meter_star
		param = id}
	<id> :desc_resolvealias Name = alias_band_multiplier_glow param = band_multiplier_glow_cont
	if ScreenElementExists id = <band_multiplier_glow_cont>
		<band_multiplier_glow_cont> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	if ScreenElementExists \{id = star_meter_blub_glow01}
		star_meter_blub_glow01 :se_setprops \{rgba = [
				255
				128
				0
				0
			]
			time = 1}
	endif
	Wait \{1.1
		Seconds}
	DestroyScreenElement \{id = star_meter_blub_glow01}
endscript

script create_highway_band_moment_effect 
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
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
		rgba = [255 200 128 0]
		Pos = <pos3>
		rot_angle = 0
		Scale = (4.0, 0.0)
		just = [center center]
		z_priority = 12.1
	}
	<namel2> :se_setprops rgba = [255 128 0 255] Scale = (1.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 128 0 255] Scale = (-1.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 128 0 128] Scale = (8.0, 2.5) time = 0.5
	<namec2> :se_setprops rgba = [255 128 0 255] Scale = (4.0, 3.5) time = 0.25
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
