band_moment_temp_mult_time = 0
band_moment_temp_mult_increase = 0

script band_moment_failed 
	array = []
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> band_moment_failed
		if (<band_moment_failed> = 1)
			addarrayelement array = <array> element = <player>
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	notification = qs(0xc2044f6b)
	hud_create_message {text = <notification> band style_script = hud_message_band_streak_style style_script_params = {players = <array> broken_icons}}
endscript

script band_moment_passed 
	kill_all_band_moment_fx_scripts
	soundevent \{event = band_moment_sfx}
	soundevent \{event = band_moment_back}
	spawnscriptnow \{create_star_meter_glow}
	getnumplayersingame
	band_players = <num_players>
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> part
		if (<part> != vocals)
			spawnscriptnow create_highway_band_moment_effect params = {player = <player>}
		else
			spawnscriptnow create_vocals_band_moment_effect params = {player = <player>}
		endif
		getnextplayer player = <player>
		repeat <num_players>
	endif
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		get_savegame_from_player player = <player>
		getglobaltags achievement_info savegame = <savegame> param = band_moments_completed
		<band_moments_completed> = (<band_moments_completed> + 1)
		setglobaltags achievement_info savegame = <savegame> params = {band_moments_completed = <band_moments_completed>}
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	getfirstplayer
	getplayerinfo <player> playline_song_measure_time
	change band_moment_temp_mult_time = (8 * <playline_song_measure_time>)
	change band_moment_temp_mult_increase = (<band_players> - 1)
	spawnscriptnow \{bm_wait_for_death}
endscript

script bm_wait_for_death 
	begin
	if (($band_moment_temp_mult_time) > 0)
		wait \{10
			gameframe}
	else
		spawnscriptnow \{kill_star_meter_glow}
		play_end_band_moment_sfx
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> part
			if (<part> != vocals)
				spawnscriptnow kill_highway_band_moment_effect params = {player = <player>}
			else
				spawnscriptnow kill_vocals_band_moment_effect params = {player = <player>}
			endif
			getnextplayer player = <player>
			repeat <num_players>
		endif
		break
	endif
	repeat
endscript

script play_end_band_moment_sfx 
endscript

script kill_all_band_moment_fx_scripts 
	killspawnedscript \{name = create_highway_band_moment_effect}
	killspawnedscript \{name = create_vocals_band_moment_effect}
	killspawnedscript \{name = create_star_meter_glow}
	killspawnedscript \{name = bm_wait_for_death}
	killspawnedscript \{name = kill_highway_band_moment_effect}
	killspawnedscript \{name = kill_vocals_band_moment_effect}
	killspawnedscript \{name = kill_star_meter_glow}
endscript

script create_vocals_band_moment_effect 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	if (<part> != vocals)
		return
	endif
	vocalshighway_getid player = <player>
	<vocals_highway_id> :desc_resolvealias name = alias_rush_container_bottom param = bot_rush_cont
	<vocals_highway_id> :desc_resolvealias name = alias_rush_container_top param = top_rush_cont
	<vocals_highway_id> :desc_resolvealias name = alias_visible_highway param = visible_highway
	<visible_highway> :se_setprops alpha = 1 time = 0.2
	formattext checksumname = namevb1 'Vocals_Bottom_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb1>
	createscreenelement {
		type = spriteelement
		id = <namevb1>
		parent = <bot_rush_cont>
		material = sp_glow_rush01
		rgba = [255 128 0 255]
		pos = (0.0, 18.0)
		scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	formattext checksumname = namevb2 'Vocals_Bottom_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb2>
	createscreenelement {
		type = spriteelement
		id = <namevb2>
		parent = <bot_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 128 0 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formattext checksumname = namevt1 'Vocals_Top_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt1>
	createscreenelement {
		type = spriteelement
		id = <namevt1>
		parent = <top_rush_cont>
		material = sp_glow_rush01
		rgba = [255 128 0 255]
		pos = (0.0, 18.0)
		scale = (2.5, 1.0)
		rot_angle = 5
		just = [center center]
		z_priority = 14
	}
	formattext checksumname = namevt2 'Vocals_Top_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt2>
	createscreenelement {
		type = spriteelement
		id = <namevt2>
		parent = <top_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 128 0 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formattext checksumname = fxt1 'Vocals_Top_BMFXp%p' p = <player> addtostringlookup = true
	destroy2dparticlesystem id = <fxt1>
	create2dparticlesystem {
		id = <fxt1>
		pos = (0.0, 0.0)
		z_priority = 12
		material = sys_particle_spark01_sys_particle_spark01
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
		emit_rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 360.0
		velocity = 1.1
		friction = (-12.0, 12.0)
		time = 0.25
	}
	formattext checksumname = fxb1 'Vocals_Bottom_BMFXp%p' p = <player> addtostringlookup = true
	destroy2dparticlesystem id = <fxb1>
	create2dparticlesystem {
		id = <fxb1>
		pos = (0.0, 0.0)
		z_priority = 12
		material = sys_particle_spark01_sys_particle_spark01
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
		emit_rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 360.0
		velocity = 1.1
		friction = (-12.0, 12.0)
		time = 0.25
	}
	<namevb1> :se_setprops pos = {(1500.0, 0.0) relative} time = 0.5
	<namevb2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<namevt1> :se_setprops pos = {(1500.0, 0.0) relative} time = 0.5
	<namevt2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	wait \{0.5
		seconds}
	destroy2dparticlesystem kill_when_empty id = <fxt1>
	destroy2dparticlesystem kill_when_empty id = <fxb1>
endscript

script kill_vocals_band_moment_effect 
	vocals_get_highway_view player = <player>
	if (<highway_view> = karaoke)
		vocalshighway_getid player = <player>
		<vocals_highway_id> :desc_resolvealias name = alias_visible_highway param = visible_highway
		<visible_highway> :se_setprops alpha = 0 time = 0.2
	endif
	formattext checksumname = namevt1 'Vocals_Top_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt1>
	formattext checksumname = namevb1 'Vocals_Bottom_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb1>
	formattext checksumname = namevt2 'Vocals_Top_BMGlowp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formattext checksumname = namevb2 'Vocals_bottom_BMGlowp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	wait \{1
		seconds}
	formattext checksumname = namevb2 'Vocals_Top_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb2>
	formattext checksumname = namevt2 'Vocals_Top_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt2>
endscript

script create_star_meter_glow 
	if NOT hud_root :desc_resolvealias \{name = alias_hud_meter_star
			param = id}
		return
	endif
	<id> :desc_resolvealias name = alias_band_multiplier_glow param = band_multiplier_glow_cont
	destroyscreenelement \{id = star_meter_blub_glow01}
	wait \{1
		frame}
	formattext \{checksumname = smbfx1
		'Star_Meter_Bulb_FX'
		addtostringlookup = true}
	destroy2dparticlesystem id = <smbfx1>
	create2dparticlesystem {
		id = <smbfx1>
		pos = (26.0, 36.0)
		z_priority = -1.1
		material = sys_particle_lnzflare02_sys_particle_lnzflare02
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
		emit_rate = 0.0050999997
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 12.1
		friction = (0.0, 24.0)
		time = 0.25
	}
	createscreenelement {
		type = spriteelement
		id = star_meter_blub_glow01
		parent = <band_multiplier_glow_cont>
		material = mat_meter_wibble_glow
		rgba = [255 128 0 0]
		dims = (128.0, 128.0)
		pos = (26.0, 36.0)
		scale = (1.0, 1.0)
		rot_angle = 0
		just = [center center]
		z_priority = -1.1
	}
	if screenelementexists \{id = star_meter_blub_glow01}
		star_meter_blub_glow01 :se_setprops \{rgba = [
				255
				128
				0
				255
			]
			time = 0.05}
	endif
	if screenelementexists id = <band_multiplier_glow_cont>
		<band_multiplier_glow_cont> :se_setprops rgba = [255 128 0 255] time = 0.05
	endif
	wait \{0.11
		second}
	destroy2dparticlesystem kill_when_empty id = <smbfx1>
endscript

script kill_star_meter_glow 
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	hud_root :desc_resolvealias \{name = alias_hud_meter_star
		param = id}
	<id> :desc_resolvealias name = alias_band_multiplier_glow param = band_multiplier_glow_cont
	if screenelementexists id = <band_multiplier_glow_cont>
		<band_multiplier_glow_cont> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	if screenelementexists \{id = star_meter_blub_glow01}
		star_meter_blub_glow01 :se_setprops \{rgba = [
				255
				128
				0
				0
			]
			time = 1}
	endif
	wait \{1.1
		seconds}
	destroyscreenelement \{id = star_meter_blub_glow01}
endscript

script create_highway_band_moment_effect 
	pos_index = (<player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	formattext checksumname = cont 'sidebar_container_leftp%p' p = <player> addtostringlookup = true
	formattext checksumname = namel2 'sidebar_Left_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namel2>
	createscreenelement {
		type = spriteelement
		id = <namel2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		pos = <pos>
		scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = cont 'sidebar_container_rightp%p' p = <player> addtostringlookup = true
	formattext checksumname = namer2 'sidebar_Right_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namer2>
	createscreenelement {
		type = spriteelement
		id = <namer2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		pos = <pos>
		scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = container_id 'fretbar_containerp%p' p = <player> addtostringlookup = true
	formattext checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec>
	createscreenelement {
		type = spriteelement
		id = <namec>
		parent = <container_id>
		material = mat_sidebar_glow_02
		rgba = [255 128 0 0]
		pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	formattext checksumname = namec2 'sidebar_Center_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec2>
	createscreenelement {
		type = spriteelement
		id = <namec2>
		parent = <container_id>
		material = mat_meter_wibble_glow
		rgba = [255 200 128 0]
		pos = <pos3>
		rot_angle = 0
		scale = (4.0, 0.0)
		just = [center center]
		z_priority = 12.1
	}
	<namel2> :se_setprops rgba = [255 128 0 255] scale = (1.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 128 0 255] scale = (-1.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 128 0 128] scale = (8.0, 2.5) time = 0.5
	<namec2> :se_setprops rgba = [255 128 0 255] scale = (4.0, 3.5) time = 0.25
	wait \{0.25
		seconds}
	<namec2> :se_setprops rgba = [255 128 0 0] scale = (4.0, 0.0) time = 0.25
	formattext checksumname = container_id 'Highway_containerp%p' p = <player> addtostringlookup = true
	formattext checksumname = namec1 'Center_BMp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec1>
	createscreenelement {
		type = spriteelement
		id = <namec1>
		parent = <container_id>
		material = mat_combo_nuke_xplosion
		rgba = [255 255 255 255]
		pos = (0.0, 460.0)
		rot_angle = 0
		scale = (3.0, 3.0)
		just = [center bottom]
		z_priority = 0.0
	}
	formattext checksumname = bmcfx1 'Center_Particle_BMp%p' p = <player> addtostringlookup = true
	destroy2dparticlesystem kill_when_empty id = <bmcfx1>
	create2dparticlesystem {
		id = <bmcfx1>
		pos = (0.0, 460.0)
		z_priority = 12
		material = sys_particle_spark01_sys_particle_spark01
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
		emit_rate = 0.035
		emit_dir = 0.0
		emit_spread = 90.0
		velocity = 30.0
		friction = (0.0, 128.0)
		time = 0.51
	}
	wait \{0.25
		seconds}
	destroy2dparticlesystem kill_when_empty id = <bmcfx1>
	if screenelementexists id = <namec>
		<namec> :se_setprops rgba = [255 128 0 64] time = 0.5
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namec1>
	destroyscreenelement id = <namec2>
endscript

script kill_highway_band_moment_effect 
	formattext checksumname = namel2 'sidebar_Right_BMGlowp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <namel2>
		<namel2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formattext checksumname = namer2 'sidebar_Left_BMGlowp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <namer2>
		<namer2> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	formattext checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> addtostringlookup = true
	if screenelementexists id = <namec>
		<namec> :se_setprops rgba = [255 128 0 0] time = 1
	endif
	wait \{1
		seconds}
	formattext checksumname = namec 'sidebar_Center_BMRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec>
	formattext checksumname = namel2 'sidebar_Left_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namel2>
	formattext checksumname = namer2 'sidebar_Right_BMGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namer2>
endscript
