
script 0xefa229a7 
	wait \{0.75
		seconds}
	spawnscriptlater \{0x1c08fce3}
	spawnscriptlater \{0xb31261d1}
	wait \{0.4
		seconds}
	spawnscriptlater \{0x82fa7b4c}
	spawnscriptlater \{0x8501ad59}
	wait \{0.2
		seconds}
	spawnscriptlater \{0x248d70f8}
	wait \{0.1
		seconds}
	spawnscriptlater \{0xe12a4e76}
	spawnscriptlater \{0x6c62086c}
	spawnscriptlater \{0x76b55f5f}
	wait \{0.2
		seconds}
	spawnscriptlater \{0x475d45c2}
	spawnscriptlater \{0x1b6538fa}
	spawnscriptlater \{0x82fa7b4c}
	wait \{0.2
		seconds}
	spawnscriptlater \{0xb31261d1}
	spawnscriptlater \{0x248d70f8}
	spawnscriptlater \{0xf2069dcf}
	wait \{0.4
		seconds}
	spawnscriptlater \{0x8e651f5e}
endscript

script 0xefda844d 
	destroy2dparticlesystem \{id = 0x15b6abc1}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0x15b6abc1
		pos = (640.0, 300.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			225
			251
			251
			220
		]
		end_color = [
			225
			251
			251
			0
		]
		start_scale = (0.4, 0.4)
		end_scale = (0.3, 0.3)
		start_angle_spread = 0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 100
		emit_radius = 200
		emit_rate = 0.003
		emit_dir = 0
		emit_spread = 180
		velocity = 10
		friction = (0.0, 10.0)
		time = 5}
	wait \{5
		seconds}
	destroy2dparticlesystem \{id = 0x15b6abc1
		kill_when_empty}
endscript

script 0xb31261d1 
	begin
	spawnscript \{0x853f8d0e}
	wait \{0.4
		seconds}
	spawnscript \{0x8873f9cf}
	spawnscript \{0xc44d49ec}
	spawnscript \{0xd6f8e602}
	spawnscript \{0x81a4d013}
	spawnscript \{0x58bdbc12}
	spawnscript \{0x22a58278}
	spawnscript \{0x4da559b7}
	spawnscript \{0xfb64b200}
	wait \{0.05
		seconds}
	repeat 1
endscript

script 0x1c08fce3 
	destroyscreenelement \{id = lightning01}
	wait \{0.03
		seconds}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = lightning01
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		pos = (105.0, 150.0)
		rot_angle = -35
		material = 0x5d6f67fb
		z_priority = 110}
	wait \{0.4
		second}
	destroyscreenelement \{id = lightning01}
endscript

script 0x853f8d0e 
	destroyscreenelement \{id = 0x5746ba36}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x5746ba36
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x5746ba36 :obj_spawnscript \{0x356cfd79}
endscript

script 0x356cfd79 
	if screenelementexists \{id = 0x5746ba36}
		begin
		0x5746ba36 :se_setprops \{scale = (0.5, 0.5)
			alpha = 0}
		0x5746ba36 :se_setprops \{scale = (1.0, 1.0)
			alpha = 0.3
			time = 0.1}
		0x5746ba36 :se_waitprops
		0x5746ba36 :se_setprops \{scale = (1.0, 1.0)
			alpha = 0.0
			time = 0.01}
		0x5746ba36 :se_waitprops
		repeat 2
		wait \{0.01
			seconds}
		begin
		0x5746ba36 :se_setprops \{scale = (0.5, 0.5)
			alpha = 0}
		0x5746ba36 :se_setprops \{scale = (5.0, 5.0)
			alpha = 0.5
			time = 0.05}
		0x5746ba36 :se_waitprops
		0x5746ba36 :se_setprops \{scale = (5.0, 5.0)
			alpha = 0.0
			time = 0.5}
		repeat 1
	endif
endscript

script 0x8873f9cf 
	destroy2dparticlesystem \{id = 0xa0a33866}
	create2dparticlesystem \{id = 0xa0a33866
		pos = (260.0, 320.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.2}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0xa0a33866
		kill_when_empty}
endscript

script 0x22a58278 
	destroyscreenelement \{id = 0xc651215c}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xc651215c
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xc651215c :obj_spawnscript \{0x0a5fef48}
endscript

script 0x0a5fef48 
	0xc651215c :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xc651215c :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xc651215c :se_waitprops
	0xc651215c :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x81a4d013 
	destroyscreenelement \{id = 0x53dde72b}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x53dde72b
		texture = 0xa51a5a40
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (320.0, 450.0)
		rot_angle = 280
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x53dde72b :obj_spawnscript \{0x0151eb20}
endscript

script 0x0151eb20 
	0x53dde72b :se_setprops \{scale = (1.5, 1.5)
		alpha = 0}
	0x53dde72b :se_setprops \{scale = (1.5, 1.5)
		alpha = 0.5
		time = 0.05}
	0x53dde72b :se_waitprops
	wait \{0.1
		seconds}
	0x53dde72b :se_setprops \{scale = (1.5, 1.5)
		alpha = 0.0
		time = 0.3}
endscript

script 0xc44d49ec 
	destroyscreenelement \{id = 0x46d61bf0}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x46d61bf0
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x46d61bf0 :obj_spawnscript \{0x2040d2ed}
endscript

script 0x2040d2ed 
	0x46d61bf0 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x46d61bf0 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x46d61bf0 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x46d61bf0 :se_waitprops
	0x46d61bf0 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xd6f8e602 
	destroyscreenelement \{id = 0x5463b41e}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x5463b41e
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5463b41e :obj_spawnscript \{0x19cdee28}
endscript

script 0x19cdee28 
	0x5463b41e :se_setprops \{scale = (0.3, 0.3)
		alpha = 0}
	0x5463b41e :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.05}
	0x5463b41e :se_waitprops
	0x5463b41e :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x4da559b7 
	destroyscreenelement \{id = flare_01}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = flare_01
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	flare_01 :obj_spawnscript \{0x722ad9b2}
endscript

script 0x722ad9b2 
	flare_01 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	flare_01 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.1}
	flare_01 :se_waitprops
	flare_01 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0xfb64b200 
	destroyscreenelement \{id = 0x1f901124}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x1f901124
		texture = jow_buttonflare01
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (260.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x1f901124 :obj_spawnscript \{0xf3413ec6}
endscript

script 0xf3413ec6 
	0x1f901124 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x1f901124 :se_setprops \{scale = (3.0, 3.0)
		alpha = 1
		time = 0.05}
	0x1f901124 :se_waitprops
	0x1f901124 :se_setprops \{scale = (3.0, 3.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x58bdbc12 
	destroy2dparticlesystem \{id = stars_01}
	wait \{1
		frame}
	create2dparticlesystem \{id = stars_01
		pos = (260.0, 320.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			225
			251
			251
			220
		]
		end_color = [
			225
			251
			251
			0
		]
		start_scale = (0.4, 0.4)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 0
		emit_radius = 5
		emit_rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 60.0)
		time = 0.2}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = stars_01
		kill_when_empty}
endscript

script 0x82fa7b4c 
	begin
	spawnscript \{0x1c36dcb4}
	wait \{0.4
		seconds}
	spawnscript \{0x117aa875}
	spawnscript \{0x5d441856}
	spawnscript \{0x4ff1b7b8}
	spawnscript \{0x18ad81a9}
	spawnscript \{0xc1b4eda8}
	spawnscript \{0xd4ac080d}
	wait \{0.5
		seconds}
	repeat 1
endscript

script 0x8501ad59 
	destroyscreenelement \{id = lightning02}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = lightning02
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		pos = (1075.0, 160.0)
		rot_angle = 35
		material = 0x5d6f67fb
		z_priority = 110}
	wait \{0.4
		second}
	destroyscreenelement \{id = lightning02}
endscript

script 0x117aa875 
	destroy2dparticlesystem \{id = 0x39aa69dc}
	create2dparticlesystem \{id = 0x39aa69dc
		pos = (950.0, 340.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0x39aa69dc
		kill_when_empty}
endscript

script 0x1c36dcb4 
	destroyscreenelement \{id = 0xce4feb8c}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xce4feb8c
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xce4feb8c :obj_spawnscript \{0xb3f88fd7}
endscript

script 0xb3f88fd7 
	begin
	0xce4feb8c :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xce4feb8c :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.4
		time = 0.1}
	0xce4feb8c :se_waitprops
	0xce4feb8c :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xce4feb8c :se_waitprops
	repeat 2
	wait \{0.05
		seconds}
	begin
	0xce4feb8c :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xce4feb8c :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xce4feb8c :se_waitprops
	0xce4feb8c :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xbbacd3c2 
	destroyscreenelement \{id = 0x5f5870e6}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x5f5870e6
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5f5870e6 :obj_spawnscript \{0x8ccb9de6}
endscript

script 0x8ccb9de6 
	0x5f5870e6 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x5f5870e6 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x5f5870e6 :se_waitprops
	0x5f5870e6 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x18ad81a9 
	destroyscreenelement \{id = 0xcad4b691}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xcad4b691
		texture = 0xa51a5a40
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (810.0, 440.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcad4b691 :obj_spawnscript \{0x87c5998e}
endscript

script 0x87c5998e 
	0xcad4b691 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0}
	0xcad4b691 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		rot_angle = 0
		time = 0.05}
	0xcad4b691 :se_waitprops
	wait \{0.1
		seconds}
	0xcad4b691 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		rot_angle = 0
		time = 0.8}
endscript

script 0x5d441856 
	destroyscreenelement \{id = 0xdfdf4a4a}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xdfdf4a4a
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xdfdf4a4a :obj_spawnscript \{0xa6d4a043}
endscript

script 0xa6d4a043 
	0xdfdf4a4a :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xdfdf4a4a :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xdfdf4a4a :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xdfdf4a4a :se_waitprops
	0xdfdf4a4a :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x4ff1b7b8 
	destroyscreenelement \{id = 0xcd6ae5a4}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xcd6ae5a4
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (1000.0, 250.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcd6ae5a4 :obj_spawnscript \{0x9f599c86}
endscript

script 0x9f599c86 
	0xcd6ae5a4 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0xcd6ae5a4 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xcd6ae5a4 :se_waitprops
	0xcd6ae5a4 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xd4ac080d 
	destroyscreenelement \{id = 0xfc7cc9a4}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xfc7cc9a4
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (950.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xfc7cc9a4 :obj_spawnscript \{0xf4beab1c}
endscript

script 0xf4beab1c 
	0xfc7cc9a4 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0xfc7cc9a4 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	0xfc7cc9a4 :se_waitprops
	0xfc7cc9a4 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x6d4c5b2d 
	destroyscreenelement \{id = 0xefd70931}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xefd70931
		texture = ph_smoke_singlepuff_blend_02
		alpha = 0.0
		scale = (1.3, 1.3)
		just = [
			center
			center
		]
		pos = (1105.0, 340.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xefd70931 :obj_spawnscript \{0x7022e105}
endscript

script 0x7022e105 
	0xefd70931 :se_setprops \{scale = (1.0, 1.0)
		alpha = 0}
	0xefd70931 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.3
		rot_angle = 10
		time = 0.1}
	0xefd70931 :se_waitprops
	0xefd70931 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		rot_angle = 10
		time = 1}
endscript

script 0xc1b4eda8 
	destroy2dparticlesystem \{id = 0xe9642c01}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0xe9642c01
		pos = (950.0, 340.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		emit_rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 20
		friction = (0.0, 60.0)
		time = 0.2}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = 0xe9642c01
		kill_when_empty}
endscript

script 0x248d70f8 
	begin
	spawnscript \{0x6b31ec22}
	wait \{0.4
		seconds}
	spawnscript \{0x667d98e3}
	spawnscript \{0x2a4328c0}
	spawnscript \{0x38f6872e}
	spawnscript \{0x6faab13f}
	spawnscript \{0xb6b3dd3e}
	spawnscript \{0xccabe354}
	spawnscript \{0xa3ab389b}
	repeat 1
endscript

script 0x6b31ec22 
	destroyscreenelement \{id = 0xb948db1a}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xb948db1a
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xb948db1a :obj_spawnscript \{0x78a45c72}
endscript

script 0x78a45c72 
	begin
	0xb948db1a :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xb948db1a :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0xb948db1a :se_waitprops
	0xb948db1a :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xb948db1a :se_waitprops
	repeat 2
	wait \{0.05
		seconds}
	begin
	0xb948db1a :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xb948db1a :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xb948db1a :se_waitprops
	0xb948db1a :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xf2069dcf 
	destroyscreenelement \{id = 0x9044b76b}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x9044b76b
		alpha = 0.95
		scale = (0.8, 0.8)
		just = [
			center
			center
		]
		pos = (550.0, 110.0)
		rot_angle = -30
		material = 0x5d6f67fb
		z_priority = 110}
	wait \{0.4
		second}
	destroyscreenelement \{id = 0x9044b76b}
endscript

script 0xccabe354 
	destroyscreenelement \{id = 0x285f4070}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x285f4070
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x285f4070 :obj_spawnscript \{0x47974e43}
endscript

script 0x47974e43 
	0x285f4070 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x285f4070 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x285f4070 :se_waitprops
	0x285f4070 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x667d98e3 
	destroy2dparticlesystem \{id = 0x4ead594a}
	create2dparticlesystem \{id = 0x4ead594a
		pos = (620.0, 260.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0x4ead594a
		kill_when_empty}
endscript

script 0x6faab13f 
	destroyscreenelement \{id = 0xbdd38607}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xbdd38607
		texture = 0xa51a5a40
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (540.0, 110.0)
		rot_angle = 100
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xbdd38607 :obj_spawnscript \{0x4c994a2b}
endscript

script 0x4c994a2b 
	0xbdd38607 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0
		rot_angle = 100}
	0xbdd38607 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0xbdd38607 :se_waitprops
	wait \{0.1
		seconds}
	0xbdd38607 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0x2a4328c0 
	destroyscreenelement \{id = 0xa8d87adc}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xa8d87adc
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xa8d87adc :obj_spawnscript \{0x6d8873e6}
endscript

script 0x6d8873e6 
	0xa8d87adc :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xa8d87adc :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xa8d87adc :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0xa8d87adc :se_waitprops
	0xa8d87adc :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x38f6872e 
	destroyscreenelement \{id = 0xba6dd532}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xba6dd532
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xba6dd532 :obj_spawnscript \{0x54054f23}
endscript

script 0x54054f23 
	0xba6dd532 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0xba6dd532 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xba6dd532 :se_waitprops
	0xba6dd532 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xa3ab389b 
	destroyscreenelement \{id = 0x8b7bf932}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x8b7bf932
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (620.0, 260.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x8b7bf932 :obj_spawnscript \{0x3fe278b9}
endscript

script 0x3fe278b9 
	0x8b7bf932 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x8b7bf932 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.6
		time = 0.1}
	0x8b7bf932 :se_waitprops
	0x8b7bf932 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0xb6b3dd3e 
	destroy2dparticlesystem \{id = 0x9e631c97}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0x9e631c97
		pos = (620.0, 260.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		emit_rate = 0.009
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 20
		friction = (0.0, 60.0)
		time = 0.2}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = 0x9e631c97
		kill_when_empty}
endscript

script 0xe12a4e76 
	begin
	spawnscript \{0xf5557981}
	wait \{0.4
		seconds}
	spawnscript \{0xf8190d40}
	spawnscript \{0xb427bd63}
	spawnscript \{0xa692128d}
	spawnscript \{0xf1ce249c}
	spawnscript \{0x28d7489d}
	spawnscript \{0x52cf76f7}
	spawnscript \{0x3dcfad38}
	repeat 1
endscript

script 0xf5557981 
	destroyscreenelement \{id = 0x272c4eb9}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x272c4eb9
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x272c4eb9 :obj_spawnscript \{0x65a16cca}
endscript

script 0x65a16cca 
	begin
	0x272c4eb9 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x272c4eb9 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0x272c4eb9 :se_waitprops
	0x272c4eb9 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0x272c4eb9 :se_waitprops
	repeat 2
	wait \{0.05
		seconds}
	begin
	0x272c4eb9 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x272c4eb9 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0x272c4eb9 :se_waitprops
	0x272c4eb9 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0x6c62086c 
	destroyscreenelement \{id = 0x0e2022c8}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x0e2022c8
		alpha = 0.95
		scale = (1.0, 1.0)
		just = [
			center
			center
		]
		pos = (240.0, 450.0)
		rot_angle = 240
		material = 0x5d6f67fb
		z_priority = 110}
	wait \{0.4
		second}
	destroyscreenelement \{id = 0x0e2022c8}
endscript

script 0x52cf76f7 
	destroyscreenelement \{id = 0xb63bd5d3}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xb63bd5d3
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xb63bd5d3 :obj_spawnscript \{0x5a927efb}
endscript

script 0x5a927efb 
	0xb63bd5d3 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xb63bd5d3 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xb63bd5d3 :se_waitprops
	0xb63bd5d3 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0xf8190d40 
	destroy2dparticlesystem \{id = 0xd0c9cce9}
	create2dparticlesystem \{id = 0xd0c9cce9
		pos = (465.0, 320.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0xd0c9cce9
		kill_when_empty}
endscript

script 0xf1ce249c 
	destroyscreenelement \{id = 0x23b713a4}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x23b713a4
		texture = 0xa51a5a40
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (340.0, 420.0)
		rot_angle = 2
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x23b713a4 :obj_spawnscript \{0x519c7a93}
endscript

script 0x519c7a93 
	0x23b713a4 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0}
	0x23b713a4 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0x23b713a4 :se_waitprops
	wait \{0.1
		seconds}
	0x23b713a4 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0xb427bd63 
	destroyscreenelement \{id = 0x36bcef7f}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x36bcef7f
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x36bcef7f :obj_spawnscript \{0x708d435e}
endscript

script 0x708d435e 
	0x36bcef7f :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x36bcef7f :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x36bcef7f :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0x36bcef7f :se_waitprops
	0x36bcef7f :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xa692128d 
	destroyscreenelement \{id = 0x24094091}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x24094091
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x24094091 :obj_spawnscript \{0x49007f9b}
endscript

script 0x49007f9b 
	0x24094091 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x24094091 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0x24094091 :se_waitprops
	0x24094091 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x3dcfad38 
	destroyscreenelement \{id = 0x151f6c91}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x151f6c91
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (465.0, 320.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x151f6c91 :obj_spawnscript \{0x22e74801}
endscript

script 0x22e74801 
	0x151f6c91 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x151f6c91 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0x151f6c91 :se_waitprops
	0x151f6c91 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x28d7489d 
	destroy2dparticlesystem \{id = 0x00078934}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0x00078934
		pos = (465.0, 320.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		emit_rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = 0x00078934
		kill_when_empty}
endscript

script 0x475d45c2 
	begin
	spawnscript \{0x82524917}
	wait \{0.4
		seconds}
	spawnscript \{0x8f1e3dd6}
	spawnscript \{0xc3208df5}
	spawnscript \{0xd195221b}
	spawnscript \{0x86c9140a}
	spawnscript \{0x5fd0780b}
	spawnscript \{0x25c84661}
	spawnscript \{0x4ac89dae}
	repeat 1
endscript

script 0x82524917 
	destroyscreenelement \{id = 0x502b7e2f}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x502b7e2f
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0x502b7e2f :obj_spawnscript \{0xaefdbf6f}
endscript

script 0xaefdbf6f 
	begin
	0x502b7e2f :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x502b7e2f :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0x502b7e2f :se_waitprops
	0x502b7e2f :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0x502b7e2f :se_waitprops
	repeat 2
	wait \{0.05
		seconds}
	begin
	0x502b7e2f :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x502b7e2f :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0x502b7e2f :se_waitprops
	0x502b7e2f :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0x1b6538fa 
	destroyscreenelement \{id = 0x7927125e}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x7927125e
		alpha = 0.95
		scale = (1.0, 1.2)
		just = [
			center
			center
		]
		pos = (1050.0, 430.0)
		rot_angle = -240
		material = 0x5d6f67fb
		z_priority = 110}
	wait \{0.4
		second}
	destroyscreenelement \{id = 0x7927125e}
endscript

script 0x25c84661 
	destroyscreenelement \{id = 0xc13ce545}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xc13ce545
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xc13ce545 :obj_spawnscript \{0x91cead5e}
endscript

script 0x91cead5e 
	0xc13ce545 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xc13ce545 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0xc13ce545 :se_waitprops
	0xc13ce545 :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x8f1e3dd6 
	destroy2dparticlesystem \{id = 0xa7cefc7f}
	create2dparticlesystem \{id = 0xa7cefc7f
		pos = (800.0, 280.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0xa7cefc7f
		kill_when_empty}
endscript

script 0x86c9140a 
	destroyscreenelement \{id = 0x54b02332}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x54b02332
		texture = 0xa51a5a40
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (650.0, 420.0)
		rot_angle = 2
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x54b02332 :obj_spawnscript \{0x9ac0a936}
endscript

script 0x9ac0a936 
	0x54b02332 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0}
	0x54b02332 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.05}
	0x54b02332 :se_waitprops
	wait \{0.1
		seconds}
	0x54b02332 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.3}
endscript

script 0xc3208df5 
	destroyscreenelement \{id = 0x41bbdfe9}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x41bbdfe9
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x41bbdfe9 :obj_spawnscript \{0xbbd190fb}
endscript

script 0xbbd190fb 
	0x41bbdfe9 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x41bbdfe9 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0x41bbdfe9 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0x41bbdfe9 :se_waitprops
	0x41bbdfe9 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0xd195221b 
	destroyscreenelement \{id = 0x530e7007}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x530e7007
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x530e7007 :obj_spawnscript \{0x825cac3e}
endscript

script 0x825cac3e 
	0x530e7007 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x530e7007 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0x530e7007 :se_waitprops
	0x530e7007 :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0x4ac89dae 
	destroyscreenelement \{id = 0x62185c07}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x62185c07
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (800.0, 280.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x62185c07 :obj_spawnscript \{0xe9bb9ba4}
endscript

script 0xe9bb9ba4 
	0x62185c07 :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0x62185c07 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0x62185c07 :se_waitprops
	0x62185c07 :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0x5fd0780b 
	destroy2dparticlesystem \{id = 0x7700b9a2}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0x7700b9a2
		pos = (800.0, 280.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		emit_rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = 0x7700b9a2
		kill_when_empty}
endscript

script 0x76b55f5f 
	begin
	spawnscript \{0x1b5b18ad}
	wait \{0.4
		seconds}
	spawnscript \{0x16176c6c}
	spawnscript \{0x5a29dc4f}
	spawnscript \{0x489c73a1}
	spawnscript \{0xc6d929b1}
	spawnscript \{0xbcc117db}
	spawnscript \{0xd3c1cc14}
	repeat 1
endscript

script 0x1b5b18ad 
	destroyscreenelement \{id = 0xc9222f95}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xc9222f95
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (2.0, 2.0)
		just = [
			center
			center
		]
		pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			253
			219
			154
			255
		]
		blend = add}
	0xc9222f95 :obj_spawnscript \{0x2869cdc1}
endscript

script 0x2869cdc1 
	begin
	0xc9222f95 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xc9222f95 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.5
		time = 0.1}
	0xc9222f95 :se_waitprops
	0xc9222f95 :se_setprops \{scale = (2.0, 2.0)
		alpha = 0.0
		time = 0.01}
	0xc9222f95 :se_waitprops
	repeat 2
	wait \{0.05
		seconds}
	begin
	0xc9222f95 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xc9222f95 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.5
		time = 0.05}
	0xc9222f95 :se_waitprops
	0xc9222f95 :se_setprops \{scale = (5.0, 5.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xbcc117db 
	destroyscreenelement \{id = 0x5835b4ff}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x5835b4ff
		texture = 0xf86604e5
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x5835b4ff :obj_spawnscript \{0x175adff0}
endscript

script 0x175adff0 
	0x5835b4ff :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x5835b4ff :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.6
		time = 0.1}
	0x5835b4ff :se_waitprops
	0x5835b4ff :se_setprops \{scale = (2.5, 2.5)
		alpha = 0.0
		time = 0.01}
endscript

script 0x16176c6c 
	destroy2dparticlesystem \{id = 0x3ec7adc5}
	create2dparticlesystem \{id = 0x3ec7adc5
		pos = (370.0, 270.0)
		z_priority = 98.0
		material = mat_hog_smoke
		parent = alive_root_particle_container
		start_color = [
			250
			235
			207
			35
		]
		end_color = [
			250
			235
			207
			0
		]
		start_scale = (1.0, 1.0)
		end_scale = (1.5, 1.5)
		start_angle_spread = 25.0
		min_rotation = -500.0
		max_rotation = 600.0
		emit_start_radius = 1.0
		emit_radius = 3.0
		emit_rate = 0.02
		emit_dir = 0.0
		emit_spread = 300.0
		velocity = 10
		friction = (0.0, -0.5)
		time = 0.3}
	wait \{0.4
		second}
	destroy2dparticlesystem \{id = 0x3ec7adc5
		kill_when_empty}
endscript

script 0x5a29dc4f 
	destroyscreenelement \{id = 0xd8b28e53}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xd8b28e53
		texture = ph_multiconfetti_02
		alpha = 0.0
		scale = (1.5, 1.5)
		just = [
			center
			center
		]
		pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 120
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xd8b28e53 :obj_spawnscript \{0x3d45e255}
endscript

script 0x3d45e255 
	0xd8b28e53 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0xd8b28e53 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.9
		time = 0.05}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0
		rot_angle = 50}
	0xd8b28e53 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.7
		time = 0.05}
	0xd8b28e53 :se_waitprops
	0xd8b28e53 :se_setprops \{scale = (4.3, 4.3)
		alpha = 0.0
		time = 0.001}
endscript

script 0x489c73a1 
	destroyscreenelement \{id = 0xca0721bd}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xca0721bd
		texture = 0xea99e289
		alpha = 0.0
		scale = (0.5, 0.5)
		just = [
			center
			center
		]
		pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xca0721bd :obj_spawnscript \{0x04c8de90}
endscript

script 0x04c8de90 
	0xca0721bd :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0xca0721bd :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.5
		time = 0.1}
	0xca0721bd :se_waitprops
	0xca0721bd :se_setprops \{scale = (1.3, 1.3)
		alpha = 0.0
		time = 0.01}
endscript

script 0xd3c1cc14 
	destroyscreenelement \{id = 0xfb110dbd}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xfb110dbd
		texture = 0x5d3f0efd
		alpha = 0.0
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (370.0, 270.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xfb110dbd :obj_spawnscript \{0x6f2fe90a}
endscript

script 0x6f2fe90a 
	0xfb110dbd :se_setprops \{scale = (0.1, 0.1)
		alpha = 0}
	0xfb110dbd :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0xfb110dbd :se_waitprops
	0xfb110dbd :se_setprops \{scale = (10.0, 10.0)
		alpha = 0.0
		time = 0.01}
endscript

script 0xc6d929b1 
	destroy2dparticlesystem \{id = 0xee09e818}
	wait \{1
		frame}
	create2dparticlesystem \{id = 0xee09e818
		pos = (370.0, 270.0)
		z_priority = 100.0
		material = 0x2c0ccbf0
		parent = alive_root_particle_container
		start_color = [
			215
			251
			251
			220
		]
		end_color = [
			215
			251
			251
			0
		]
		start_scale = (0.3, 0.3)
		end_scale = (0.3, 0.3)
		start_angle_spread = 360.0
		min_rotation = 0
		max_rotation = 0
		emit_start_radius = 2
		emit_radius = 2
		emit_rate = 0.004
		emit_dir = 0.0
		emit_spread = 360.0
		velocity = 35
		friction = (0.0, 80.0)
		time = 0.4}
	wait \{0.3
		seconds}
	destroy2dparticlesystem \{id = 0xee09e818
		kill_when_empty}
endscript

script 0x8e651f5e 
	spawnscript \{0xdcffc2b5}
	wait \{0.1
		seconds}
	spawnscript \{0xa6450ba6}
	spawnscript \{0x96cbfdf1}
endscript

script 0xdcffc2b5 
	destroyscreenelement \{id = 0x62c835b5}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0x62c835b5
		texture = ph_radialglow_01
		alpha = 0.0
		scale = (6.0, 3.0)
		just = [
			center
			center
		]
		pos = (640.0, 310.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0x62c835b5 :obj_spawnscript \{0x6bdafc4a}
endscript

script 0x6bdafc4a 
	begin
	0x62c835b5 :se_setprops \{scale = (3.0, 1.0)
		alpha = 0}
	0x62c835b5 :se_setprops \{scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	0x62c835b5 :se_waitprops
	0x62c835b5 :se_setprops \{scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.01}
	0x62c835b5 :se_waitprops
	repeat 1
	wait \{0.05
		seconds}
	begin
	0x62c835b5 :se_setprops \{scale = (0.5, 0.5)
		alpha = 0}
	0x62c835b5 :se_setprops \{scale = (10.0, 7.0)
		alpha = 0.6
		time = 0.05}
	0x62c835b5 :se_waitprops
	0x62c835b5 :se_setprops \{scale = (10.0, 7.0)
		alpha = 0.0
		time = 0.5}
	repeat 1
endscript

script 0xa6450ba6 
	destroyscreenelement \{id = 0xa6fb3c51}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xa6fb3c51
		texture = 0x5d3f0efd
		alpha = 0.9
		scale = (5.0, 5.0)
		just = [
			center
			center
		]
		pos = (640.0, 310.0)
		rot_angle = 0
		z_priority = 100
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xa6fb3c51 :obj_spawnscript \{0x5ac65a2e}
endscript

script 0x5ac65a2e 
	0xa6fb3c51 :se_setprops \{scale = (7.0, 4.0)
		alpha = 0}
	0xa6fb3c51 :se_setprops \{scale = (15.0, 10.0)
		alpha = 0.6
		time = 0.05}
	0xa6fb3c51 :se_waitprops
	0xa6fb3c51 :se_setprops \{scale = (15.0, 10.0)
		alpha = 0.0
		time = 0.1}
endscript

script 0x96cbfdf1 
	destroyscreenelement \{id = 0xcee362be}
	wait \{1
		frame}
	createscreenelement \{type = spriteelement
		parent = 0x66748607
		id = 0xcee362be
		texture = 0xb506f863
		alpha = 0.0
		scale = (2.5, 2.8)
		just = [
			center
			center
		]
		pos = (640.0, 330.0)
		rot_angle = 0
		z_priority = 150
		rgba = [
			215
			251
			251
			255
		]
		blend = add}
	0xcee362be :obj_spawnscript \{0x471500f7}
endscript

script 0x471500f7 
	0xcee362be :se_setprops \{alpha = 0}
	0xcee362be :se_setprops \{alpha = 0.2
		time = 0.1}
	0xcee362be :se_waitprops
	0xcee362be :se_setprops \{alpha = 0.0
		time = 0.1}
endscript
