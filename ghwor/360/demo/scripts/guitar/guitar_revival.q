revival_meter_needle_max_rot = 64
revival_meter_needle_min_rot = -64

script kill_band_player 
	requireparams \{[
			player
		]
		all}
	printf qs(0xd00d09bc) p = <player> channel = zdebug
	getplayerinfo <player> band
	getbandinfo <band> num_dead_members
	if (<num_dead_members> = 1)
		setup_band_revival_meter band_idx = <band>
		band_failing_vignette_on
	endif
	getplayerinfo <player> part
	if (<part> = vocals)
		audio_gameplay_play_revive_or_kill_player_sfx player = <player> vocalist = 1 cheer = 0
		if playerinfoequals <player> is_onscreen = 1
			hud_vocal_dead_script player = <player>
		endif
	else
		launchgemevent event = kill_objects_and_switch_player_non_interactive player = <player>
		reset_player_touch_glow player = <player>
		audio_gameplay_play_revive_or_kill_player_sfx player = <player> vocalist = 0 cheer = 0
		if playerinfoequals <player> is_onscreen = 1
			whammyfxoffall player = <player>
			get_highway_hud_root_id player = <player>
			if screenelementexists id = <highway_hud_root>
				setscreenelementprops id = <highway_hud_root> skull_alpha = 1.0
			endif
		endif
	endif
endscript

script setup_band_revival_meter \{band_idx = 1}
	if NOT screenelementexists \{id = hud_root}
		scriptassert 'hud root not found' p = <player>
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_revive_band_meter
			param = revival_meter_id}
		scriptassert \{'band revival meter not found'}
	endif
	hud_create_message \{band
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
	requireparams \{[
			band_idx
		]}
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_revive_band_meter
			param = revival_meter_id}
		scriptassert \{'band death meter not found in their highway hud root'}
	endif
	getbandinfo <band_idx> current_revival
	percent_full = ((<current_revival> * 1.0) / ($max_num_death_ticks))
	rot_value = (($revival_meter_needle_min_rot) + ((($revival_meter_needle_max_rot) - ($revival_meter_needle_min_rot)) * <percent_full>))
	<revival_meter_id> :se_setprops hud_revive_meter_needle_rot_angle = <rot_value>
endscript

script hide_band_death_meter 
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_hud_revive_band_meter
			param = revival_meter_id}
		return
		scriptassert 'player %p death meter not found in their highway hud root' p = <player>
	endif
	<revival_meter_id> :se_setprops alpha = 0.0
endscript

script revive_band_player 
	printf \{channel = sfx
		qs(0xf12da3bc)}
	soundevent \{event = endofsong_camera_cheer_softer}
	requireparams \{[
			player
		]
		all}
	printf \{qs(0x798ce3e8)
		channel = zdebug}
	spawnscriptnow \{create_revival_meter_glow}
	getplayerinfo <player> part
	if (<part> = vocals)
		audio_gameplay_play_revive_or_kill_player_sfx player = <player> vocalist = 1 cheer = 1
		if playerinfoequals <player> is_onscreen = 1
			hud_vocal_revive player = <player>
			spawnscriptnow create_revival_vocal_highway_glow params = {player = <player>}
		endif
	else
		audio_gameplay_play_revive_or_kill_player_sfx player = <player> vocalist = 0 cheer = 1
		if playerinfoequals <player> is_onscreen = 1
			get_highway_hud_root_id player = <player>
			if screenelementexists id = <highway_hud_root>
				setscreenelementprops id = <highway_hud_root> skull_alpha = 0.0
				spawnscriptnow create_revival_highway_glow params = {player = <player>}
			endif
		endif
	endif
	hide_band_death_meter
	band_failing_vignette_off
endscript

script create_revival_meter_glow 
	if NOT hud_root :desc_resolvealias \{name = alias_hud_revive_band_meter
			param = revival_meter_id}
		return
	endif
	getscreenelementposition id = <revival_meter_id> absolute
	pos = (<screenelementpos> + (164.0, 100.0))
	formattext \{checksumname = rmfx1
		'Revival_Meter_FX1'
		addtostringlookup = true}
	destroy2dparticlesystem id = <rmfx1>
	create2dparticlesystem {
		id = <rmfx1>
		pos = <pos>
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
		emit_rate = 0.0050999997
		emit_dir = 90.0
		emit_spread = 12.0
		velocity = 33.1
		friction = (0.0, 0.0)
		time = 0.2
	}
	formattext \{checksumname = rmfx2
		'Revival_Meter_FX2'
		addtostringlookup = true}
	destroy2dparticlesystem id = <rmfx2>
	create2dparticlesystem {
		id = <rmfx2>
		pos = <pos>
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
		emit_rate = 0.0050999997
		emit_dir = -90.0
		emit_spread = 12.0
		velocity = 33.1
		friction = (0.0, 0.0)
		time = 0.2
	}
	formattext \{checksumname = rmg1
		'Revival_Meter_Glowp'
		addtostringlookup = true}
	destroyscreenelement id = <rmg1>
	createscreenelement {
		type = spriteelement
		id = <rmg1>
		parent = hud_root
		material = mat_meter_wibble_glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		pos = <pos>
		scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 12
	}
	formattext \{checksumname = rmg2
		'Revival_Meter_Glowp'
		addtostringlookup = true}
	destroyscreenelement id = <rmg2>
	createscreenelement {
		type = spriteelement
		id = <rmg2>
		parent = hud_root
		material = mat_meter_wibble_glow
		rgba = [255 255 200 200]
		dims = (100.0, 100.0)
		pos = <pos>
		scale = (2.0, 0.1)
		rot_angle = 0
		just = [center center]
		z_priority = 13
	}
	if screenelementexists id = <rmg1>
		<rmg1> :se_setprops rgba = [255 255 200 255] scale = (2.0, 1.0) time = 0.05
		<rmg2> :se_setprops rgba = [255 255 255 255] scale = (2.0, 1.0) time = 0.05
	endif
	wait \{0.11
		second}
	destroy2dparticlesystem kill_when_empty id = <rmfx1>
	destroy2dparticlesystem kill_when_empty id = <rmfx2>
	if screenelementexists id = <rmg1>
		<rmg1> :se_setprops rgba = [255 128 0 0] scale = (12.0, 1.0) time = 0.3
		<rmg2> :se_setprops rgba = [255 128 0 0] scale = (12.0, 1.0) time = 0.3
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namermg2>
	destroyscreenelement id = <namermg1>
endscript

script create_revival_highway_glow 
	pos_index = (<player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	formattext checksumname = cont 'sidebar_container_leftp%p' p = <player> addtostringlookup = true
	formattext checksumname = namel2 'sidebar_Left_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namel2>
	createscreenelement {
		type = spriteelement
		id = <namel2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		pos = <pos>
		scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = cont 'sidebar_container_rightp%p' p = <player> addtostringlookup = true
	formattext checksumname = namer2 'sidebar_Right_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namer2>
	createscreenelement {
		type = spriteelement
		id = <namer2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		pos = <pos>
		scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = container_id 'fretbar_containerp%p' p = <player> addtostringlookup = true
	formattext checksumname = namec 'sidebar_Center_RVRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec>
	createscreenelement {
		type = spriteelement
		id = <namec>
		parent = <container_id>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	<namel2> :se_setprops rgba = [255 255 255 255] scale = (2.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 255 255 255] scale = (-2.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 255 255 255] scale = (8.0, 2.5) time = 0.5
	wait \{0.25
		seconds}
	if screenelementexists id = <namel2>
		<namel2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if screenelementexists id = <namer2>
		<namer2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if screenelementexists id = <namec>
		<namec> :se_setprops rgba = [255 128 255 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namec>
	destroyscreenelement id = <namel2>
	destroyscreenelement id = <namer2>
endscript

script create_revival_vocal_highway_glow 
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
	formattext checksumname = namevb2 'Vocals_Bottom_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb2>
	createscreenelement {
		type = spriteelement
		id = <namevb2>
		parent = <bot_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formattext checksumname = namevt2 'Vocals_Top_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt2>
	createscreenelement {
		type = spriteelement
		id = <namevt2>
		parent = <top_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	<namevb2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<namevt2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	wait \{0.5
		seconds}
	if screenelementexists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	if screenelementexists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namevb2>
	destroyscreenelement id = <namevt2>
endscript

script create_revival_highway_glow_ankh01 
	pos_index = (<player> - 1)
	pos_table = ($highway_pos_table [<pos_index>])
	height = (<pos_table>.highway_height)
	pos = ((0.0, -1.4) * <height>)
	pos2 = ((0.0, 0.9) * <height>)
	pos3 = ((0.0, 0.9) * <height>)
	formattext checksumname = cont 'sidebar_container_leftp%p' p = <player> addtostringlookup = true
	formattext checksumname = namel2 'sidebar_Left_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namel2>
	createscreenelement {
		type = spriteelement
		id = <namel2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		pos = <pos>
		scale = (1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = cont 'sidebar_container_rightp%p' p = <player> addtostringlookup = true
	formattext checksumname = namer2 'sidebar_Right_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namer2>
	createscreenelement {
		type = spriteelement
		id = <namer2>
		parent = <cont>
		material = mat_sidebar_glow_02
		rgba = [255 255 255 0]
		pos = <pos>
		scale = (-1.5, 4.0)
		rot_angle = 0
		just = [center top]
		z_priority = 12.2
	}
	formattext checksumname = container_id 'fretbar_containerp%p' p = <player> addtostringlookup = true
	formattext checksumname = namec 'sidebar_Center_RVRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec>
	createscreenelement {
		type = spriteelement
		id = <namec>
		parent = <container_id>
		texture = pr_axel_ankh_01
		rgba = [255 255 255 0]
		pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 3.1
	}
	formattext checksumname = namec2 'sidebar_Center_RVRushp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namec2>
	createscreenelement {
		type = spriteelement
		id = <namec2>
		parent = <container_id>
		texture = pr_axel_ankh_01
		blend = add
		rgba = [255 255 255 0]
		pos = <pos2>
		rot_angle = 0
		scale = (8.0, 3.5)
		just = [center top]
		z_priority = 4.1
	}
	<namel2> :se_setprops rgba = [255 255 255 255] scale = (2.0, 4.5) time = 0.25
	<namer2> :se_setprops rgba = [255 255 255 255] scale = (-2.0, 4.5) time = 0.25
	<namec> :se_setprops rgba = [255 255 255 255] scale = (2.5, 2.5) time = 0.25
	<namec2> :se_setprops rgba = [255 255 255 255] scale = (2.5, 2.5) time = 0.25
	wait \{0.25
		seconds}
	if screenelementexists id = <namel2>
		<namel2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if screenelementexists id = <namer2>
		<namer2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	if screenelementexists id = <namec>
		<namec> :se_setprops rgba = [255 255 255 0] time = 0.5
		<namec2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namec>
	destroyscreenelement id = <namec2>
	destroyscreenelement id = <namel2>
	destroyscreenelement id = <namer2>
endscript

script create_revival_vocal_highway_glow_ankh01 
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
	formattext checksumname = namevb2 'Vocals_Bottom_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevb2>
	createscreenelement {
		type = spriteelement
		id = <namevb2>
		parent = <bot_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formattext checksumname = namevt2 'Vocals_Top_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <namevt2>
	createscreenelement {
		type = spriteelement
		id = <namevt2>
		parent = <top_rush_cont>
		material = mat_sidebar_glow_01
		rgba = [255 255 255 255]
		pos = (0.0, 18.0)
		scale = (1.5, 0.0)
		rot_angle = 90
		just = [center bottom]
		z_priority = 12.2
	}
	formattext checksumname = nameva2 'Vocals_Center_Ankh_RVGlowp%p' p = <player> addtostringlookup = true
	destroyscreenelement id = <nameva2>
	createscreenelement {
		type = spriteelement
		id = <nameva2>
		parent = <bot_rush_cont>
		texture = pr_axel_ankh_01
		rgba = [255 255 255 255]
		pos = (740.0, 0.0)
		scale = (0.5, 0.5)
		rot_angle = 0
		just = [center center]
		z_priority = 12.2
	}
	<namevb2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<namevt2> :se_setprops pos = {(200.0, 0.0) relative} scale = (1.0, 9.0) time = 0.5
	<nameva2> :se_setprops scale = (2.0, 1.9) time = 0.5 rgba = [255 255 255 0] pos = {(0.0, -32.0) relative}
	wait \{0.5
		seconds}
	if screenelementexists id = <namevt2>
		<namevt2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	if screenelementexists id = <namevb2>
		<namevb2> :se_setprops rgba = [255 128 0 0] time = 0.5
	endif
	if screenelementexists id = <nameva2>
		<namevb2> :se_setprops rgba = [255 255 255 0] time = 0.5
	endif
	wait \{0.5
		seconds}
	destroyscreenelement id = <namevb2>
	destroyscreenelement id = <namevt2>
	destroyscreenelement id = <nameva2>
endscript
