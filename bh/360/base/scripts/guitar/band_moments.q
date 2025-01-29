band_moment_temp_mult_time = 0
band_moment_temp_mult_increase = 0

script band_moment_failed 
	array = []
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> band_moment_failed
		if (<band_moment_failed> = 1)
			AddArrayElement array = <array> element = <player>
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	notification = qs(0xc2044f6b)
	hud_create_message {text = <notification> Band style_script = hud_message_band_streak_style style_script_params = {players = <array> broken_icons}}
endscript

script band_moment_passed 
	Kill_all_band_moment_FX_Scripts
	SoundEvent \{event = Band_Moment_SFX}
	SoundEvent \{event = Band_Moment_Back}
	spawnscriptnow \{Create_Star_Meter_glow}
	GetNumPlayersInGame
	band_players = <num_players>
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> part
		if (<part> != vocals)
			spawnscriptnow Create_Highway_Band_Moment_Effect params = {player = <player>}
		else
			spawnscriptnow Create_Vocals_Band_Moment_Effect params = {player = <player>}
		endif
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	if NOT IsBandCheating
		GetNumPlayersInGame \{local}
		if (<num_players> > 0)
			GetFirstPlayer \{local}
			begin
			GetPlayerInfo <player> controller
			fire_achievement name = Achievement_IntheMoment controller = <controller>
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
	endif
	GetFirstPlayer
	GetPlayerInfo <player> playline_song_measure_time
	Change band_moment_temp_mult_time = (8 * <playline_song_measure_time>)
	Change band_moment_temp_mult_increase = (<band_players> - 1)
	spawnscriptnow \{BM_Wait_For_Death}
endscript

script BM_Wait_For_Death 
	begin
	if (($band_moment_temp_mult_time) > 0)
		wait \{10
			gameframe}
	else
		spawnscriptnow \{Kill_Star_Meter_glow}
		play_end_band_moment_sfx
		GetNumPlayersInGame
		if (<num_players> > 0)
			GetFirstPlayer
			begin
			GetPlayerInfo <player> part
			if (<part> != vocals)
				spawnscriptnow Kill_Highway_Band_Moment_Effect params = {player = <player>}
			else
				spawnscriptnow Kill_Vocals_Band_Moment_Effect params = {player = <player>}
			endif
			GetNextPlayer player = <player>
			repeat <num_players>
		endif
		break
	endif
	repeat
endscript

script play_end_band_moment_sfx 
endscript

script Kill_all_band_moment_FX_Scripts 
	killspawnedscript \{name = Create_Highway_Band_Moment_Effect}
	killspawnedscript \{name = Create_Vocals_Band_Moment_Effect}
	killspawnedscript \{name = Create_Star_Meter_glow}
	killspawnedscript \{name = BM_Wait_For_Death}
	killspawnedscript \{name = Kill_Highway_Band_Moment_Effect}
	killspawnedscript \{name = Kill_Vocals_Band_Moment_Effect}
	killspawnedscript \{name = Kill_Star_Meter_glow}
endscript

script Create_Vocals_Band_Moment_Effect 
	RequireParams \{[
			player
		]}
	GetPlayerInfo <player> part
	if (<part> != vocals)
		return
	endif
	if (($highwayvisible) = off)
		return
	endif
	VocalsHighway_GetId player = <player>
	<vocals_highway_id> :Desc_ResolveAlias name = alias_Rush_Container_Bottom param = bot_rush_cont
	<vocals_highway_id> :Desc_ResolveAlias name = alias_Rush_Container_Top param = top_rush_cont
	<vocals_highway_id> :Desc_ResolveAlias name = alias_visible_highway param = visible_highway
	<visible_highway> :SE_SetProps alpha = 1 time = 0.2
	FormatText checksumname = nameVb1 'Vocals_Bottom_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <nameVb1>
	CreateScreenElement {
		type = SpriteElement
		id = <nameVb1>
		parent = <bot_rush_cont>
		material = SP_Glow_Rush01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	FormatText checksumname = NameVb2 'Vocals_Bottom_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVb2>
	CreateScreenElement {
		type = SpriteElement
		id = <NameVb2>
		parent = <bot_rush_cont>
		material = Mat_sidebar_GLOW_01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	FormatText checksumname = nameVt1 'Vocals_Top_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <nameVt1>
	CreateScreenElement {
		type = SpriteElement
		id = <nameVt1>
		parent = <top_rush_cont>
		material = SP_Glow_Rush01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	FormatText checksumname = NameVt2 'Vocals_Top_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVt2>
	CreateScreenElement {
		type = SpriteElement
		id = <NameVt2>
		parent = <top_rush_cont>
		material = Mat_sidebar_GLOW_01
		rgba = [255 128 0 255]
		Pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	FormatText checksumname = fxt1 'Vocals_Top_BMFXp%p' p = <player> AddToStringLookup = true
	Destroy2DParticleSystem id = <fxt1>
	Create2DParticleSystem {
		id = <fxt1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <nameVt1>
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
	FormatText checksumname = fxb1 'Vocals_Bottom_BMFXp%p' p = <player> AddToStringLookup = true
	Destroy2DParticleSystem id = <fxb1>
	Create2DParticleSystem {
		id = <fxb1>
		Pos = (0.0, 0.0)
		z_priority = 12
		material = sys_Particle_Spark01_sys_Particle_Spark01
		parent = <nameVb1>
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
	<nameVb1> :SE_SetProps Pos = {(1500.0, 0.0) relative} time = 0.5
	<NameVb2> :SE_SetProps Pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<nameVt1> :SE_SetProps Pos = {(1500.0, 0.0) relative} time = 0.5
	<NameVt2> :SE_SetProps Pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	wait \{0.5
		seconds}
	Destroy2DParticleSystem kill_when_empty id = <fxt1>
	Destroy2DParticleSystem kill_when_empty id = <fxb1>
endscript

script Kill_Vocals_Band_Moment_Effect 
	vocals_get_highway_view player = <player>
	if (<highway_view> = karaoke)
		VocalsHighway_GetId player = <player>
		<vocals_highway_id> :Desc_ResolveAlias name = alias_visible_highway param = visible_highway
		<visible_highway> :SE_SetProps alpha = 0 time = 0.2
	endif
	FormatText checksumname = nameVt1 'Vocals_Top_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <nameVt1>
	FormatText checksumname = nameVb1 'Vocals_Bottom_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <nameVb1>
	FormatText checksumname = NameVt2 'Vocals_Top_BMGlowp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <NameVt2>
		<NameVt2> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	FormatText checksumname = NameVb2 'Vocals_bottom_BMGlowp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <NameVb2>
		<NameVb2> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	wait \{1
		seconds}
	FormatText checksumname = NameVb2 'Vocals_Top_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVb2>
	FormatText checksumname = NameVt2 'Vocals_Top_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <NameVt2>
endscript

script Create_Star_Meter_glow 
	if NOT hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
			param = id}
		return
	endif
	<id> :Desc_ResolveAlias name = alias_band_multiplier_Glow param = Band_Multiplier_Glow_Cont
	DestroyScreenElement \{id = Star_Meter_Blub_Glow01}
	wait \{1
		frame}
	FormatText \{checksumname = SMBfx1
		'Star_Meter_Bulb_FX'
		AddToStringLookup = true}
	Destroy2DParticleSystem id = <SMBfx1>
	Create2DParticleSystem {
		id = <SMBfx1>
		Pos = (26.0, 36.0)
		z_priority = -1.1
		material = sys_Particle_lnzflare02_sys_Particle_lnzflare02
		parent = <Band_Multiplier_Glow_Cont>
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
		type = SpriteElement
		id = Star_Meter_Blub_Glow01
		parent = <Band_Multiplier_Glow_Cont>
		material = Mat_Meter_Wibble_Glow
		rgba = [255 128 0 0]
		dims = (128.0, 128.0)
		Pos = (26.0, 36.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = -1.1
	}
	if ScreenElementExists \{id = Star_Meter_Blub_Glow01}
		Star_Meter_Blub_Glow01 :SE_SetProps \{rgba = [
				255
				128
				0
				255
			]
			time = 0.05}
	endif
	if ScreenElementExists id = <Band_Multiplier_Glow_Cont>
		<Band_Multiplier_Glow_Cont> :SE_SetProps rgba = [255 128 0 255] time = 0.05
	endif
	wait \{0.11
		second}
	Destroy2DParticleSystem kill_when_empty id = <SMBfx1>
endscript

script Kill_Star_Meter_glow 
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	hud_root :Desc_ResolveAlias \{name = alias_HUD_meter_star
		param = id}
	<id> :Desc_ResolveAlias name = alias_band_multiplier_Glow param = Band_Multiplier_Glow_Cont
	if ScreenElementExists id = <Band_Multiplier_Glow_Cont>
		<Band_Multiplier_Glow_Cont> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	if ScreenElementExists \{id = Star_Meter_Blub_Glow01}
		Star_Meter_Blub_Glow01 :SE_SetProps \{rgba = [
				255
				128
				0
				0
			]
			time = 1}
	endif
	wait \{1.1
		seconds}
	DestroyScreenElement \{id = Star_Meter_Blub_Glow01}
endscript

script Create_Highway_Band_Moment_Effect 
	pos_index = (<player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	Pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	FormatText checksumname = cont 'sidebar_container_leftp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namel2 'sidebar_Left_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	CreateScreenElement {
		type = SpriteElement
		id = <namel2>
		parent = <cont>
		material = Mat_sidebar_GLOW_02
		rgba = [255 128 0 0]
		Pos = <Pos>
		scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	FormatText checksumname = cont 'sidebar_container_rightp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namer2 'sidebar_Right_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
	CreateScreenElement {
		type = SpriteElement
		id = <namer2>
		parent = <cont>
		material = Mat_sidebar_GLOW_02
		rgba = [255 128 0 0]
		Pos = <Pos>
		scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	FormatText checksumname = container_id 'fretbar_containerp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	CreateScreenElement {
		type = SpriteElement
		id = <namec>
		parent = <container_id>
		material = Mat_sidebar_GLOW_02
		rgba = [255 128 0 0]
		Pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	FormatText checksumname = namec2 'sidebar_Center_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namec2>
	CreateScreenElement {
		type = SpriteElement
		id = <namec2>
		parent = <container_id>
		material = Mat_Meter_Wibble_Glow
		rgba = [255 200 128 0]
		Pos = <pos3>
		rot_angle = 0
		scale = (4.0, 0.0)
		just = [center center]
		z_priority = 12.1
	}
	<namel2> :SE_SetProps rgba = [255 128 0 255] scale = (1.0, 4.5) time = 0.25
	<namer2> :SE_SetProps rgba = [255 128 0 255] scale = (-1.0, 4.5) time = 0.25
	<namec> :SE_SetProps rgba = [255 128 0 128] scale = (8.0, 2.5) time = 0.5
	<namec2> :SE_SetProps rgba = [255 128 0 255] scale = (4.0, 3.5) time = 0.25
	wait \{0.25
		seconds}
	<namec2> :SE_SetProps rgba = [255 128 0 0] scale = (4.0, 0.0) time = 0.25
	FormatText checksumname = container_id 'Highway_containerp%p' p = <player> AddToStringLookup = true
	FormatText checksumname = nameC1 'Center_BMp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <nameC1>
	CreateScreenElement {
		type = SpriteElement
		id = <nameC1>
		parent = <container_id>
		material = Mat_combo_nuke_xplosion
		rgba = [255 255 255 255]
		Pos = (0.0, 460.0)
		rot_angle = 0
		scale = (3.0, 3.0)
		just = [center bottom]
		z_priority = 0.0
	}
	FormatText checksumname = BMcfx1 'Center_Particle_BMp%p' p = <player> AddToStringLookup = true
	Destroy2DParticleSystem kill_when_empty id = <BMcfx1>
	Create2DParticleSystem {
		id = <BMcfx1>
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
	wait \{0.25
		seconds}
	Destroy2DParticleSystem kill_when_empty id = <BMcfx1>
	if ScreenElementExists id = <namec>
		<namec> :SE_SetProps rgba = [255 128 0 64] time = 0.5
	endif
	wait \{0.5
		seconds}
	DestroyScreenElement id = <nameC1>
	DestroyScreenElement id = <namec2>
endscript

script Kill_Highway_Band_Moment_Effect 
	FormatText checksumname = namel2 'sidebar_Right_BMGlowp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <namel2>
		<namel2> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	FormatText checksumname = namer2 'sidebar_Left_BMGlowp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <namer2>
		<namer2> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	FormatText checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> AddToStringLookup = true
	if ScreenElementExists id = <namec>
		<namec> :SE_SetProps rgba = [255 128 0 0] time = 1
	endif
	wait \{1
		seconds}
	FormatText checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namec>
	FormatText checksumname = namel2 'sidebar_Left_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namel2>
	FormatText checksumname = namer2 'sidebar_Right_BMGlowp%p' p = <player> AddToStringLookup = true
	DestroyScreenElement id = <namer2>
endscript
