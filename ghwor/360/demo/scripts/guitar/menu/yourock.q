
script handofgod_sparkle 
	destroyscreenelement \{id = hog_sparkle}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_sparkle
		texture = ph_radialglow_01
		alpha = 1
		scale = (1.0, 1.0)
		dims = (200.0, 200.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 1050
		rgba = [
			255
			255
			255
			255
		]}
	handofgod_sparkle_anim
endscript

script handofgod_electriccenter_glow 
	destroyscreenelement \{id = hog_electriccenter_glow}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
endscript

script handofgod_electriccenter_glow_02 
	destroyscreenelement \{id = hog_electriccenter_glow_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_02
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_02
endscript

script handofgod_electriccenter_glow_03 
	destroyscreenelement \{id = hog_electriccenter_glow_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_glow_03
		texture = ph_radialglow_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 4
		rgba = [
			140
			200
			255
			255
		]}
	handofgod_electriccenter_glow_anim_03
endscript

script handofgod_electriccenter_flare 
	destroyscreenelement \{id = hog_electriccenter_flare}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		rot_angle = 45
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	wait \{1.0
		second}
	destroyscreenelement \{id = hog_electriccenter_flare}
endscript

script handofgod_electriccenter_flare_02 
	destroyscreenelement \{id = hog_electriccenter_flare_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare_02
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (20.0, 20.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		z_priority = 3
		rgba = [
			220
			240
			255
			255
		]}
	handofgod_electriccenter_flare_02_anim
endscript

script handofgod_electriccenter_flare_03 
	destroyscreenelement \{id = hog_electriccenter_flare_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_flare_03
		texture = jow_flare02
		alpha = 1
		scale = (1.0, 1.0)
		dims = (1800.0, 800.0)
		just = [
			center
			center
		]
		pos = (640.0, 220.0)
		blend = add
		rot_angle = 0
		z_priority = 3
		rgba = [
			120
			200
			255
			255
		]}
	handofgod_electriccenter_flare_03_anim
endscript

script handofgod_electriccenter 
	destroyscreenelement \{id = hog_electriccenter}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		blend = add
		z_priority = 2000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale}
endscript

script handofgod_electriccenter_02 
	destroyscreenelement \{id = hog_electriccenter_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_02
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 210.0)
		rot_angle = 45
		blend = add
		z_priority = 2000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	handofgod_electriccenter_anim_scale_02
endscript

script handofgod_electriccenter_03 
	destroyscreenelement \{id = hog_electriccenter_03}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_03
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (640.0, 110.0)
		blend = add
		z_priority = 2
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_03}
endscript

script handofgod_electriccenter_04 
	destroyscreenelement \{id = hog_electriccenter_04}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_04
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (420.0, 230.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_04}
endscript

script handofgod_electriccenter_05 
	destroyscreenelement \{id = hog_electriccenter_05}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_electriccenter_05
		texture = ph_electricity_01
		alpha = 1
		scale = (2.0, 2.0)
		dims = (300.0, 300.0)
		just = [
			center
			center
		]
		pos = (910.0, 200.0)
		blend = add
		z_priority = 5000
		rgba = [
			146
			200
			255
			255
		]}
	wait \{1
		frame}
	spawnscriptnow \{handofgod_electriccenter_anim_scale_05}
endscript

script handofgod_sparkle_anim 
	hog_sparkle :se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 0
		time = 0}
	hog_sparkle :se_setprops \{alpha = 1
		scale = 6.0
		rot_angle = 180
		time = 0.1}
	hog_sparkle :se_setprops \{alpha = 0
		scale = 0.1
		rot_angle = 360
		time = 0.15}
endscript

script handofgod_electriccenter_glow_anim 
	handofgod_electriccenter_glow
	begin
	hog_electriccenter_glow :se_setprops scale = (0.1, 0.1) alpha = 0.4 time = 0 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	hog_electriccenter_glow :se_setprops scale = (2.0, 2.0) alpha = 0.6 time = 0.5 motion = Random (@ ease_in @ ease_out )
	hog_electriccenter_glow :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_glow}
endscript

script handofgod_electriccenter_glow_anim_02 
	begin
	hog_electriccenter_glow_02 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.5}
	hog_electriccenter_glow_02 :se_setprops \{scale = (3.0, 3.0)
		alpha = 0
		time = 0.2}
	hog_electriccenter_glow_02 :se_waitprops
	repeat 7
	destroyscreenelement \{id = hog_electriccenter_glow_02}
endscript

script handofgod_electriccenter_glow_anim_03 
	hog_electriccenter_glow_03 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.4}
	hog_electriccenter_glow_03 :se_setprops \{scale = (1.0, 1.0)
		alpha = 0
		time = 1}
	hog_electriccenter_glow_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_glow_03}
endscript

script handofgod_electriccenter_anim_scale 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.05}
	hog_electriccenter :se_waitprops
	hog_electriccenter :se_setprops \{scale = (2.0, 2.0)
		alpha = 1
		time = 0.1}
	hog_electriccenter :se_waitprops
	repeat 7
	destroyscreenelement \{id = hog_electriccenter}
endscript

script handofgod_electriccenter_anim_scale_03 
	hog_electriccenter_03 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		time = 0}
	hog_electriccenter_03 :se_waitprops
	hog_electriccenter_03 :se_setprops \{scale = (2.5, 2.5)
		alpha = 1
		time = 0.05}
	hog_electriccenter_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_03}
endscript

script handofgod_electriccenter_anim_scale_02 
	<rot> = 0
	begin
	<rot> = (<rot> + 10)
	hog_electriccenter_02 :se_setprops rot_angle = <rot>
	hog_electriccenter_02 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0}
	hog_electriccenter_02 :se_waitprops
	hog_electriccenter_02 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0
		time = 0.1}
	hog_electriccenter_02 :se_waitprops
	repeat 6
	destroyscreenelement \{id = hog_electriccenter_02}
endscript

script handofgod_electriccenter_anim_scale_04 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_04 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_04 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_04 :se_waitprops
	hog_electriccenter_04 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_04 :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_04}
endscript

script handofgod_electriccenter_anim_scale_05 
	<rot> = 0
	begin
	<rot> = (<rot> + 45)
	hog_electriccenter_05 :se_setprops rot_angle = <rot> alpha = 0
	hog_electriccenter_05 :se_setprops \{scale = (0.4, 0.4)
		alpha = 0.3
		time = 0.1}
	hog_electriccenter_05 :se_waitprops
	hog_electriccenter_05 :se_setprops \{scale = (1.0, 1.0)
		alpha = 1
		time = 0.2}
	hog_electriccenter_05 :se_waitprops
	repeat 3
	destroyscreenelement \{id = hog_electriccenter_05}
endscript

script handofgod_electriccenter_flare_02_anim 
	hog_electriccenter_flare_02 :se_setprops \{scale = (200.0, 200.0)
		rot_angle = -360
		alpha = 0.8
		time = 0.1}
	hog_electriccenter_flare_02 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_flare_02}
endscript

script handofgod_electriccenter_flare_03_anim 
	hog_electriccenter_flare_03 :se_setprops \{scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0.5
		time = 0}
	hog_electriccenter_flare_03 :se_setprops \{scale = (800.0, 200.0)
		rot_angle = 0
		alpha = 2
		time = 4}
	hog_electriccenter_flare_03 :se_setprops \{scale = (1.0, 1.0)
		rot_angle = 0
		alpha = 0
		time = 4.5}
	hog_electriccenter_flare_03 :se_waitprops
	destroyscreenelement \{id = hog_electriccenter_flare_03}
endscript

script handofgod_lightning_god 
	source_01_pos = (0.0, 0.0)
	source_02_pos = (1280.0, 0.0)
	source_03_pos = (0.0, 512.0)
	source_04_pos = (1280.0, 650.0)
	source_05_pos = (0.0, 212.0)
	source_06_pos = (1280.0, 320.0)
	target_01_pos = (640.0, 240.0)
	target_02_pos = (1280.0, 0.0)
	rgba1 = [180 180 255 255]
	rgba2 = [100 255 255 255]
	p2p_lightning_create source_pos = <source_06_pos> target_pos = <target_01_pos> rgba = <rgba1>
	wait \{5
		frames}
	p2p_lightning_create source_pos = <source_05_pos> target_pos = <target_01_pos> rgba = <rgba2>
	wait \{3
		frames}
	p2p_lightning_create source_pos = <source_04_pos> target_pos = <target_01_pos> rgba = <rgba2>
	wait \{12
		frames}
	p2p_lightning_create source_pos = <source_03_pos> target_pos = <target_01_pos> rgba = <rgba1>
	wait \{14
		frames}
	p2p_lightning_create source_pos = <source_02_pos> target_pos = <target_01_pos> rgba = <rgba2>
	wait \{4
		frames}
	p2p_lightning_create source_pos = <source_01_pos> target_pos = <target_01_pos> rgba = <rgba2>
endscript

script handofgod_lighting_devil 
	destroyscreenelement \{id = hog_lighting_devil}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lighting_devil
		alpha = 0.2
		scale = (1.1, 1.1)
		just = [
			center
			center
		]
		pos = (210.0, 280.0)
		rot_angle = 260
		material = sys_big_bolt01_sys_big_bolt01
		z_priority = 1
		rgba = [
			200
			200
			200
			255
		]}
	wait \{1.0
		second}
	destroyscreenelement \{id = hog_lighting_devil}
endscript

script handofgod_lighting_devil_02 
	destroyscreenelement \{id = hog_lighting_devil_02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = hog_lighting_devil_02
		alpha = 1
		scale = (1.1, 1.3)
		just = [
			center
			center
		]
		pos = (295.0, 160.0)
		rot_angle = 285
		material = sys_big_bolt01_sys_big_bolt01
		z_priority = 0.5}
	wait \{1.5
		second}
	destroyscreenelement \{id = hog_lighting_devil_02}
endscript

script handofgod_lightning_combo 
	spawnscriptnow \{handofgod_lightning_god}
endscript

script handofgod_fx_kill 
	destroyscreenelement \{id = hog_electriccenter_glow}
	destroyscreenelement \{id = hog_electriccenter_flare}
	destroyscreenelement \{id = hog_electriccenter}
	destroyscreenelement \{id = hog_lightning_god}
	destroyscreenelement \{id = hog_lighting_devil}
	destroyscreenelement \{id = hog_lighting_devil_02}
endscript

script handofgod_electriccenter_sparks_01 
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_01
		pos = (640.0, 310.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = alive_root_particle_container
		start_color = [
			100
			200
			255
			255
		]
		end_color = [
			100
			200
			255
			0
		]
		start_scale = (1.2, 1.2)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.03
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{1.0
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_01}
endscript

script handofgod_electriccenter_sparks_02 
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
	wait \{1
		frame}
	create2dparticlesystem \{id = electriccenter_sparks_02
		pos = (640.0, 310.0)
		z_priority = 2
		material = sys_particle_spark01_sys_particle_spark01
		parent = alive_root_particle_container
		start_color = [
			100
			0
			0
			255
		]
		end_color = [
			100
			0
			100
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (0.6, 0.5)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 20
		friction = (0.0, 20.0)
		time = 0.5}
	wait \{1.0
		second}
	destroy2dparticlesystem \{id = electriccenter_sparks_02}
endscript

script handofgod_smoke_01 
	destroy2dparticlesystem \{id = hog_smoke_01}
	create2dparticlesystem \{id = hog_smoke_01
		pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			140
			200
			255
			175
		]
		end_color = [
			140
			200
			255
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (2.0, 2.0)
		start_angle_spread = 360.0
		min_rotation = -500.0
		max_rotation = 500.0
		emit_start_radius = 0.0
		emit_radius = 1.0
		emit_rate = 0.5
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 4
		friction = (0.0, 0.0)
		time = 0.25}
	wait \{1
		second}
	destroy2dparticlesystem \{id = hog_smoke_01}
endscript

script handofgod_smoke_02 
	destroy2dparticlesystem \{id = hog_smoke_02}
	create2dparticlesystem \{id = hog_smoke_02
		pos = (640.0, 310.0)
		z_priority = 20.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			180
			200
			250
			80
		]
		end_color = [
			180
			180
			180
			0
		]
		start_scale = (2.0, 2.0)
		end_scale = (6.0, 6.0)
		start_angle_spread = 360.0
		min_rotation = -1000.0
		max_rotation = 900.0
		emit_start_radius = 2.0
		emit_radius = 3.0
		emit_rate = 0.09
		emit_dir = 0.0
		emit_spread = 355.0
		velocity = 10
		friction = (0.0, 0.0)
		time = 0.25}
	wait \{1
		second}
	destroy2dparticlesystem \{id = hog_smoke_02
		kill_when_empty}
endscript

script handofgod_fx_01 
	you_rock_lightning_01
	wait \{1.5
		second}
	wait \{0.2
		second}
endscript

script handofgod_fx_02 
	wait \{1.5
		second}
	wait \{0.2
		second}
endscript

script hogcombo 
	wait \{3.5
		seconds}
	spawnscript \{you_rock_lightning_01}
endscript

script you_rock_gh6_fx 
	wait \{1.5
		seconds}
	spawnscriptnow \{you_rock_lightning_01}
endscript

script you_rock_lightning_01 
	wait \{0.25
		second}
	source_01_pos = (0.0, 200.0)
	source_02_pos = (1280.0, 0.0)
	source_03_pos = (0.0, 512.0)
	source_04_pos = (1280.0, 650.0)
	source_05_pos = (0.0, 650.0)
	source_06_pos = (1280.0, 320.0)
	source_07_pos = (0.0, 650.0)
	source_08_pos = (300.0, 720.0)
	source_09_pos = (1024.0, 720.0)
	target_01_pos = (740.0, 240.0)
	target_02_pos = (550.0, 200.0)
	target_03_pos = (880.0, 280.0)
	target_04_pos = (480.0, 220.0)
	target_05_pos = (680.0, 300.0)
	target_06_pos = (380.0, 270.0)
	target_07_pos = (0.0, 0.0)
	target_08_pos = (1280.0, 720.0)
	target_09_pos = (0.0, 120.0)
	rgba1 = [180 180 255 255]
	rgba2 = [128 200 255 255]
	p2p_lightning_create source_pos = <source_06_pos> target_pos = <target_01_pos> rgba = <rgba1>
	wait \{5
		frames}
	p2p_lightning_create source_pos = <source_05_pos> target_pos = <target_02_pos> rgba = <rgba2>
	wait \{3
		frames}
	p2p_lightning_create source_pos = <source_04_pos> target_pos = <target_03_pos> rgba = <rgba2>
	p2p_lightning_create source_pos = <source_01_pos> target_pos = <target_08_pos> rgba = <rgba2>
	wait \{12
		frames}
	p2p_lightning_create source_pos = <source_03_pos> target_pos = <target_04_pos> rgba = <rgba1>
	wait \{14
		frames}
	p2p_lightning_create source_pos = <source_02_pos> target_pos = <target_05_pos> rgba = <rgba2>
	wait \{4
		frames}
	p2p_lightning_create source_pos = <source_01_pos> target_pos = <target_06_pos> rgba = <rgba2>
	wait \{22
		frames}
	p2p_lightning_create source_pos = <source_09_pos> target_pos = <target_01_pos> rgba = <rgba1>
	wait \{5
		frames}
	p2p_lightning_create source_pos = <source_08_pos> target_pos = <target_02_pos> rgba = <rgba2>
	wait \{3
		frames}
	p2p_lightning_create source_pos = <source_07_pos> target_pos = <target_03_pos> rgba = <rgba2>
	p2p_lightning_create source_pos = <source_04_pos> target_pos = <target_09_pos> rgba = <rgba2>
	wait \{12
		frames}
	p2p_lightning_create source_pos = <source_03_pos> target_pos = <target_04_pos> rgba = <rgba1>
endscript

script you_rock_text_glow 
	wait \{0.25
		second}
	if NOT screenelementexists id = <parent>
		return
	endif
	rgba_start = [123 123 123 255]
	rgba_end = [0 64 255 255]
	emit_rate = 0.01
	z_priority = 23
	create2dparticlesystem {
		parent = <parent>
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		material = mat_lightning_ball_anim01
		start_color = <rgba_start>
		end_color = <rgba_end>
		start_scale = (4.5, 4.5)
		end_scale = (2.5, 2.1499999)
		start_angle_spread = 360.0
		min_rotation = -200
		max_rotation = 200
		emit_start_radius = 0
		emit_radius = 50
		emit_rate = <emit_rate>
		emit_dir = 0.0
		emit_spread = 0.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.05
	}
	<urok_fx01> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (300.0, 0.0)
		z_priority = <z_priority>
		material = mat_lightning_ball_anim02
		start_color = <rgba_start>
		end_color = <rgba_end>
		start_scale = (2.5, 2.5)
		end_scale = (3.5, 3.1499999)
		start_angle_spread = 360.0
		min_rotation = -350
		max_rotation = 255
		emit_start_radius = 0
		emit_radius = 50
		emit_rate = <emit_rate>
		emit_dir = 0.0
		emit_spread = 0.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.05
	}
	<urok_fx02> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (-300.0, 0.0)
		z_priority = <z_priority>
		material = mat_lightning_ball_anim02
		start_color = <rgba_start>
		end_color = <rgba_end>
		start_scale = (2.5, 2.5)
		end_scale = (3.5, 3.1499999)
		start_angle_spread = 360.0
		min_rotation = 360
		max_rotation = -360
		emit_start_radius = 12
		emit_radius = 500
		emit_rate = <emit_rate>
		emit_dir = 90.0
		emit_spread = 0.0
		velocity = 2
		friction = (0.0, 0.0)
		time = 0.05
	}
	<urok_fx03> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (150.0, 0.0)
		z_priority = <z_priority>
		material = mat_lightning_ball_anim02
		start_color = <rgba_start>
		end_color = <rgba_end>
		start_scale = (2.5, 2.5)
		end_scale = (3.5, 3.1499999)
		start_angle_spread = 360.0
		min_rotation = -350
		max_rotation = 255
		emit_start_radius = 0
		emit_radius = 50
		emit_rate = <emit_rate>
		emit_dir = 0.0
		emit_spread = 0.0
		velocity = 0
		friction = (0.0, 0.0)
		time = 0.05
	}
	<urok_fx04> = <id>
	create2dparticlesystem {
		parent = <parent>
		pos = (-150.0, 0.0)
		z_priority = <z_priority>
		material = mat_lightning_ball_anim02
		start_color = <rgba_start>
		end_color = <rgba_end>
		start_scale = (2.5, 2.5)
		end_scale = (3.5, 3.1499999)
		start_angle_spread = 360.0
		min_rotation = 360
		max_rotation = -360
		emit_start_radius = 12
		emit_radius = 500
		emit_rate = <emit_rate>
		emit_dir = 90.0
		emit_spread = 0.0
		velocity = 2
		friction = (0.0, 0.0)
		time = 0.05
	}
	<urok_fx05> = <id>
endscript

script you_rock_text_glow_cleanup 
	destroyscreenelement id = <name>
endscript

script urok_fx_xplosion01 
	rgba = [128 128 255 255]
	z_priority = 22
	you_rock_text_glow_cleanup
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = (10.0, 10.0)
		alpha = 1
		scale = (2.0, 2.0)
		just = [center center]
		pos_anchor = [center center]
		pos = <pos>
		z_priority = 0
		rot_angle = <z_priority>
	}
	<urok_xplosion_fx_cont> = <id>
	createscreenelement {
		type = spriteelement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 0
		material = mat_urok_xplosion1
		rgba = <rgba>
	}
	<urok_xplosion01> = <id>
	createscreenelement {
		type = spriteelement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 90
		material = mat_urok_xplosion1
		rgba = <rgba>
	}
	<urok_xplosion02> = <id>
	createscreenelement {
		type = spriteelement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 180
		material = mat_urok_xplosion1
		rgba = <rgba>
	}
	<urok_xplosion03> = <id>
	createscreenelement {
		type = spriteelement
		parent = <urok_xplosion_fx_cont>
		dims = (500.0, 550.0)
		alpha = 1
		scale = (1.0, 1.0)
		just = [center bottom]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rot_angle = 270
		material = mat_urok_xplosion1
		rgba = <rgba>
	}
	<urok_xplosion04> = <id>
	wait \{1
		second}
	urok_fx_xplosion01_cleanup
	you_rock_text_glow_cleanup name = <parent>
endscript

script urok_fx_xplosion01_cleanup 
	destroyscreenelement id = <urok_xplosion_fx_cont>
endscript
