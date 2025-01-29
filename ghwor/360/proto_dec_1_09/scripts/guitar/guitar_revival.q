revival_meter_needle_max_rot = 64
revival_meter_needle_min_rot = -64

script kill_band_player 
	RequireParams \{[
			Player
		]
		all}
	printf qs(0xd00d09bc) p = <Player> channel = zdebug
	getplayerinfo <Player> Band
	getbandinfo <Band> num_dead_members
	if (<num_dead_members> = 1)
		setup_band_revival_meter band_idx = <Band>
		band_failing_vignette_on
	endif
	getplayerinfo <Player> part
	if (<part> = vocals)
		audio_gameplay_play_revive_or_kill_player_sfx Player = <Player> vocalist = 1 cheer = 0
		hud_vocal_dead_script Player = <Player>
	else
		LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <Player>
		WhammyFXOffAll Player = <Player>
		audio_gameplay_play_revive_or_kill_player_sfx Player = <Player> vocalist = 0 cheer = 0
		if playerinfoequals <Player> is_onscreen = 1
			get_highway_hud_root_id Player = <Player>
			if ScreenElementExists id = <highway_hud_root>
				SetScreenElementProps id = <highway_hud_root> skull_alpha = 1.0
			endif
		endif
	endif
endscript

script setup_band_revival_meter \{band_idx = 1}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert 'hud root not found' p = <Player>
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band revival meter not found'}
	endif
	hud_create_message \{Band
		text = qs(0xbe52e274)}
	<revival_meter_id> :se_setprops alpha = 1.0
	getbandinfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($max_num_death_ticks))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :se_setprops hud_revive_meter_needle_rot_angle = <rot_value>
endscript

script clear_band_death_meter \{band_idx = 1}
	setbandinfo <band_idx> current_revival = 0
endscript

script update_band_revival_meter 
	RequireParams \{[
			band_idx
		]}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band death meter not found in their highway hud root'}
	endif
	getbandinfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($max_num_death_ticks))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :se_setprops hud_revive_meter_needle_rot_angle = <rot_value>
endscript

script hide_band_death_meter 
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		return
		ScriptAssert 'player %p death meter not found in their highway hud root' p = <Player>
	endif
	<revival_meter_id> :se_setprops alpha = 0.0
endscript

script revive_band_player 
	printf \{channel = sfx
		qs(0xf12da3bc)}
	SoundEvent \{event = endofsong_camera_cheer_softer}
	RequireParams \{[
			Player
		]
		all}
	printf \{qs(0x798ce3e8)
		channel = zdebug}
	SpawnScriptNow \{create_revival_meter_glow}
	getplayerinfo <Player> part
	if (<part> = vocals)
		audio_gameplay_play_revive_or_kill_player_sfx Player = <Player> vocalist = 1 cheer = 1
		hud_vocal_revive Player = <Player>
		SpawnScriptNow create_revival_vocal_highway_glow params = {Player = <Player>}
	else
		audio_gameplay_play_revive_or_kill_player_sfx Player = <Player> vocalist = 0 cheer = 1
		if playerinfoequals <Player> is_onscreen = 1
			get_highway_hud_root_id Player = <Player>
			if ScreenElementExists id = <highway_hud_root>
				SetScreenElementProps id = <highway_hud_root> skull_alpha = 0.0
				SpawnScriptNow create_revival_highway_glow params = {Player = <Player>}
			endif
		endif
	endif
	hide_band_death_meter
	band_failing_vignette_off
endscript

script create_revival_meter_glow 
	if NOT hud_root :desc_resolvealias \{Name = alias_hud_revive_band_meter
			param = revival_meter_id}
		return
	endif
	GetScreenElementPosition id = <revival_meter_id> absolute
	Pos = (<screenelementpos> + (164.0, 100.0))
	formatText \{checksumName = rmfx1
		'Revival_Meter_FX1'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <rmfx1>
	Create2DParticleSystem {
		id = <rmfx1>
		Pos = <Pos>
		z_priority = 14
		material = mat_spark02
		parent = hud_root
		start_color = [255 255 255 255]
		end_color = [255 255 200 0]
		start_scale = (0.5, 0.5)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = 90.0
		emit_spread = 12.0
		velocity = 33.1
		friction = (0.0, 0.0)
		time = 0.2
	}
	formatText \{checksumName = rmfx2
		'Revival_Meter_FX2'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <rmfx2>
	Create2DParticleSystem {
		id = <rmfx2>
		Pos = <Pos>
		z_priority = 12
		material = mat_spark02
		parent = hud_root
		start_color = [255 255 255 255]
		end_color = [255 255 200 0]
		start_scale = (0.5, 0.5)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = -180
		max_rotation = 360
		emit_start_radius = 6
		emit_radius = 6
		Emit_Rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 12.0
		velocity = 33.1
		friction = (0.0, 0.0)
		time = 0.2
	}
	formatText \{checksumName = rmg1
		'Revival_Meter_Glowp'
		AddToStringLookup = true}
	DestroyScreenElement id = <rmg1>
	CreateScreenElement {
		Type = SpriteElement
		id = <rmg1>
		parent = hud_root
		material = mat_meter_wibble_glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		Pos = <Pos>
		Scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 12
	}
	formatText \{checksumName = rmg2
		'Revival_Meter_Glowp'
		AddToStringLookup = true}
	DestroyScreenElement id = <rmg2>
	CreateScreenElement {
		Type = SpriteElement
		id = <rmg2>
		parent = hud_root
		material = mat_meter_wibble_glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		Pos = <Pos>
		Scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 13
	}
	if ScreenElementExists id = <rmg1>
		<rmg1> :se_setprops rgba = [255 255 200 255] Scale = (2.0, 1.0) time = 0.05
		<rmg2> :se_setprops rgba = [255 255 255 255] Scale = (2.0, 1.0) time = 0.05
	endif
	Wait \{0.11
		Second}
	Destroy2DParticleSystem kill_when_empty id = <rmfx1>
	Destroy2DParticleSystem kill_when_empty id = <rmfx2>
	if ScreenElementExists id = <rmg1>
		<rmg1> :se_setprops rgba = [255 128 0 0] Scale = (12.0, 1.0) time = 0.3
		<rmg2> :se_setprops rgba = [255 128 0 0] Scale = (12.0, 1.0) time = 0.3
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <namermg2>
	DestroyScreenElement id = <namermg1>
endscript

script create_revival_highway_glow 
	pos_index = (<Player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	formatText checksumName = cont 'sidebar_container_leftp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namel2 'sidebar_Left_RVGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namel2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		Pos = <Pos>
		Scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formatText checksumName = cont 'sidebar_container_rightp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namer2 'sidebar_Right_RVGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namer2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		Pos = <Pos>
		Scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formatText checksumName = container_id 'fretbar_containerp%p' p = <Player> AddToStringLookup = true
	formatText checksumName = namec 'sidebar_Center_RVRushp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	CreateScreenElement {
		Type = SpriteElement
		id = <namec>
		parent = <container_id>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		Pos = <pos2>
		rot_angle = 0
		Scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	<namel2> :se_setprops rgba = [255 255 255 255] Scale = (2.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 255 255 255] Scale = (-2.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 255 255 255] Scale = (8.0, 2.5) time = 0.5
	Wait \{0.25
		Seconds}
	if ScreenElementExists id = <namel2>
		<namel2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namer2>
		<namer2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namec>
		<namec> :se_setprops rgba = [255 128 255 0] time = 0.5
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <namec>
	DestroyScreenElement id = <namel2>
	DestroyScreenElement id = <namer2>
endscript

script create_revival_vocal_highway_glow 
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
	formatText checksumName = namevb2 'Vocals_Bottom_RVGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevb2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevb2>
		parent = <bot_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		Pos = (0.0, 18.0)
		Scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formatText checksumName = namevt2 'Vocals_Top_RVGlowp%p' p = <Player> AddToStringLookup = true
	DestroyScreenElement id = <namevt2>
	CreateScreenElement {
		Type = SpriteElement
		id = <namevt2>
		parent = <top_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		Pos = (0.0, 18.0)
		Scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	<namevb2> :se_setprops Pos = {(200.0, 0.0) relative} Scale = (1.0, 9.0) time = 0.5
	<namevt2> :se_setprops Pos = {(200.0, 0.0) relative} Scale = (1.0, 9.0) time = 0.5
	Wait \{0.5
		Seconds}
	if ScreenElementExists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	if ScreenElementExists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement id = <namevb2>
	DestroyScreenElement id = <namevt2>
endscript
