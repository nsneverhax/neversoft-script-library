revival_meter_needle_max_rot = 64
revival_meter_needle_min_rot = -64

script kill_band_player 
	RequireParams \{[
			player
		]
		all}
	printf qs(0xd00d09bc) p = <player> channel = zdebug
	GetPlayerInfo <player> Band
	GetBandInfo <Band> num_dead_members
	if (<num_dead_members> = 1)
		setup_band_revival_meter band_idx = <Band>
		Band_Failing_Vignette_on
	endif
	GetPlayerInfo <player> part
	if (<part> = vocals)
		revive_or_kill_player_sfx player = <player> Vocalist = 1 cheer = 0
		hud_vocal_dead_script player = <player>
	else
		LaunchGemEvent event = kill_objects_and_switch_player_non_interactive player = <player>
		WhammyFXOffAll player = <player>
		revive_or_kill_player_sfx player = <player> Vocalist = 0 cheer = 0
		get_highway_hud_root_id player = <player>
		if ScreenElementExists id = <highway_hud_root>
			SetScreenElementProps id = <highway_hud_root> skull_alpha = 1.0
		endif
	endif
endscript

script setup_band_revival_meter \{band_idx = 1}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert 'hud root not found' p = <player>
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band revival meter not found'}
	endif
	hud_create_message \{Band
		text = qs(0xbe52e274)}
	<revival_meter_id> :SE_SetProps alpha = 1.0
	GetBandInfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($MAX_NUM_DEATH_TICKS))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :SE_SetProps HUD_revive_meter_needle_rot_angle = <rot_value>
endscript

script clear_band_death_meter \{band_idx = 1}
	SetBandInfo <band_idx> current_revival = 0
endscript

script update_band_revival_meter 
	RequireParams \{[
			band_idx
		]}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_revive_band_meter
			param = revival_meter_id}
		ScriptAssert \{'band death meter not found in their highway hud root'}
	endif
	GetBandInfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($MAX_NUM_DEATH_TICKS))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :SE_SetProps HUD_revive_meter_needle_rot_angle = <rot_value>
endscript

script hide_band_death_meter 
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_revive_band_meter
			param = revival_meter_id}
		return
		ScriptAssert 'player %p death meter not found in their highway hud root' p = <player>
	endif
	<revival_meter_id> :SE_SetProps alpha = 0.0
endscript

script revive_band_player 
	printf \{channel = sfx
		qs(0xf12da3bc)}
	SoundEvent \{event = EndOfSong_Camera_Cheer_Softer}
	RequireParams \{[
			player
		]
		all}
	printf \{qs(0x798ce3e8)
		channel = zdebug}
	spawnscriptnow \{Create_Revival_Meter_glow}
	GetPlayerInfo <player> part
	if (<part> = vocals)
		revive_or_kill_player_sfx player = <player> Vocalist = 1 cheer = 1
		hud_vocal_revive player = <player>
		spawnscriptnow Create_Revival_Vocal_Highway_glow params = {player = <player>}
	else
		revive_or_kill_player_sfx player = <player> Vocalist = 0 cheer = 1
		get_highway_hud_root_id player = <player>
		SetScreenElementProps id = <highway_hud_root> skull_alpha = 0.0
		spawnscriptnow Create_Revival_Highway_glow params = {player = <player>}
	endif
	hide_band_death_meter
	Band_Failing_Vignette_off
endscript

script Create_Revival_Meter_glow 
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_revive_band_meter
			param = revival_meter_id}
		return
	endif
	GetScreenElementPosition id = <revival_meter_id> absolute
	Pos = (<ScreenElementPos> + (164.0, 100.0))
	FormatText \{checksumname = RMfx1
		'Revival_Meter_FX1'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <RMfx1>
	Create2DParticleSystem {
		id = <RMfx1>
		Pos = <Pos>
		z_priority = 14
		material = Mat_spark02
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
	FormatText \{checksumname = RMfx2
		'Revival_Meter_FX2'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <RMfx2>
	Create2DParticleSystem {
		id = <RMfx2>
		Pos = <Pos>
		z_priority = 12
		material = Mat_spark02
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
	FormatText \{checksumname = RMG1
		'Revival_Meter_Glowp'
		AddToStringLookup = true}
	DestroyScreenElement id = <RMG1>
	CreateScreenElement {
		type = SpriteElement
		id = <RMG1>
		parent = hud_root
		material = Mat_Meter_Wibble_Glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		Pos = <Pos>
		scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 12
	}
	FormatText \{checksumname = RMG2
		'Revival_Meter_Glowp'
		AddToStringLookup = true}
	DestroyScreenElement id = <RMG2>
	CreateScreenElement {
		type = SpriteElement
		id = <RMG2>
		parent = hud_root
		material = Mat_Meter_Wibble_Glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		Pos = <Pos>
		scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 13
	}
	if ScreenElementExists id = <RMG1>
		<RMG1> :SE_SetProps rgba = [255 255 200 255] scale = (2.0, 1.0) time = 0.05
		<RMG2> :SE_SetProps rgba = [255 255 255 255] scale = (2.0, 1.0) time = 0.05
	endif
	wait \{0.11
		second}
	Destroy2DParticleSystem kill_when_empty id = <RMfx1>
	Destroy2DParticleSystem kill_when_empty id = <RMfx2>
	if ScreenElementExists id = <RMG1>
		<RMG1> :SE_SetProps rgba = [255 128 0 0] scale = (12.0, 1.0) time = 0.3
		<RMG2> :SE_SetProps rgba = [255 128 0 0] scale = (12.0, 1.0) time = 0.3
	endif
	wait \{0.5
		seconds}
	DestroyScreenElement id = <nameRMG2>
	DestroyScreenElement id = <nameRMG1>
endscript

script Create_Revival_Highway_glow 
	pos_index = (<player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	FormatText checksumname = cont 'sidebar_container_leftp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namel2 'sidebar_Left_RVGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	CreateScreenElement {
		type = SpriteElement
		id = <namel2>
		parent = <cont>
		material = Mat_sidebar_GLOW_02
		rgba = [255 255 255 0]
		Pos = <Pos>
		scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	FormatText checksumname = cont 'sidebar_container_rightp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namer2 'sidebar_Right_RVGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	CreateScreenElement {
		type = SpriteElement
		id = <namer2>
		parent = <cont>
		material = Mat_sidebar_GLOW_02
		rgba = [255 255 255 0]
		Pos = <Pos>
		scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	FormatText checksumname = container_id 'fretbar_containerp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namec 'sidebar_Center_RVRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	CreateScreenElement {
		type = SpriteElement
		id = <namec>
		parent = <container_id>
		material = Mat_sidebar_GLOW_02
		rgba = [255 255 255 0]
		Pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	<namel2> :SE_SetProps rgba = [255 255 255 255] scale = (2.0, 4.5) time = 0.25
	<namer2> :SE_SetProps rgba = [255 255 255 255] scale = (-2.0, 4.5) time = 0.25
	<namec> :SE_SetProps rgba = [255 255 255 255] scale = (8.0, 2.5) time = 0.5
	wait \{0.25
		seconds}
	if ScreenElementExists id = <namel2>
		<namel2> :SE_SetProps rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namer2>
		<namer2> :SE_SetProps rgba = [255 255 255 0] time = 0.5
	endif
	if ScreenElementExists id = <namec>
		<namec> :SE_SetProps rgba = [255 128 255 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	DestroyScreenElement id = <namec>
	DestroyScreenElement id = <namel2>
	DestroyScreenElement id = <namer2>
endscript

script Create_Revival_Vocal_Highway_glow 
	RequireParams \{[
			player
		]}
	GetPlayerInfo <player> part
	if (<part> != vocals)
		return
	endif
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_Rush_Container_Bottom param = bot_rush_cont
	<vocals_highway_id> :Desc_ResolveAlias name = alias_Rush_Container_Top param = top_rush_cont
	FormatText checksumname = NameVb2 'Vocals_Bottom_RVGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVb2>
	CreateScreenElement {
		type = SpriteElement
		id = <NameVb2>
		parent = <bot_rush_cont>
		material = Mat_sidebar_GLOW_01
		rgba = [255 255 255 255]
		Pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	FormatText checksumname = NameVt2 'Vocals_Top_RVGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVt2>
	CreateScreenElement {
		type = SpriteElement
		id = <NameVt2>
		parent = <top_rush_cont>
		material = Mat_sidebar_GLOW_01
		rgba = [255 255 255 255]
		Pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	<NameVb2> :SE_SetProps Pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<NameVt2> :SE_SetProps Pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	wait \{0.5
		seconds}
	if ScreenElementExists id = <NameVt2>
		<NameVt2> :SE_SetProps rgba = [255 128 0 0] time = 0.5
	endif
	if ScreenElementExists id = <NameVb2>
		<NameVb2> :SE_SetProps rgba = [255 128 0 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	DestroyScreenElement id = <NameVb2>
	DestroyScreenElement id = <NameVt2>
endscript
