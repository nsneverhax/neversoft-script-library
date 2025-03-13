num_exploding_particles = 99
g_ui_exploding_text_top_pos = (640.0, 240.0)
g_ui_exploding_text_bottom_pos = (640.0, 380.0)
g_ui_exploding_text_top_height = 380

script create_exploding_text \{parent = 'you_rock_physics'
		text = qs(0x6f6d143d)
		placement = top
		just = [
			center
			bottom
		]
		text_physics = 1}
	formattext checksumname = cont_id '%p' p = <parent>
	if screenelementexists id = <cont_id>
		return
	endif
	if (<placement> = top)
		cont_pos = $g_ui_exploding_text_top_pos
	else
		cont_pos = $g_ui_exploding_text_bottom_pos
	endif
	check_screen_for_physics
	if NOT screenelementexists \{id = exploding_particle_container}
		create_exploding_particles
		<explode> = 1
	else
		<explode> = 0
	endif
	if (($g_in_tutorial = 1) || ($jam_tutorial_status = active))
		<explode> = 0
	endif
	split_text_into_physics_array_elements {
		id = yourock_text
		parent = <parent>
		text = <text>
		text_pos = (0.0, 0.0)
		cont_pos = <cont_pos>
		space_between = (40.0, 0.0)
		fit_dims = (1000.0, 120.0)
		just = <just>
		placement = <placement>
		flags = {
			scale = 1.0
			z_priority = 95
			font = fontgrid_text_a6
			rgba = [250 240 220 255]
			alpha = 1
		}
		centered
	}
	if gotparam \{debug}
		do_text_slam {
			parent = <parent>
			explode = <explode>
			text_physics = <text_physics>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
			debug
		}
	else
		do_text_slam {
			parent = <parent>
			explode = <explode>
			text_physics = <text_physics>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
		}
	endif
endscript

script destroy_exploding_text \{parent = 'you_rock_physics'}
	formattext checksumname = cont_id '%p' p = <parent>
	if screenelementexists id = <cont_id>
		destroyscreenelement id = <cont_id>
	endif
	if screenelementexists \{id = exploding_particle_container}
		destroyscreenelement \{id = exploding_particle_container}
	endif
endscript

script destroy_all_exploding_text 
	formattext \{checksumname = cont_id_1
		'you_rock_physics'}
	formattext \{checksumname = cont_id_2
		'you_rock_2_physics'}
	formattext \{checksumname = cont_id_3
		'you_rock_legend_physics'}
	formattext \{checksumname = cont_id_4
		'lesson_complete'}
	formattext \{checksumname = cont_id_5
		'complete_text'}
	if screenelementexists id = <cont_id_1>
		destroyscreenelement id = <cont_id_1>
	endif
	if screenelementexists id = <cont_id_2>
		destroyscreenelement id = <cont_id_2>
	endif
	if screenelementexists id = <cont_id_3>
		destroyscreenelement id = <cont_id_3>
	endif
	if screenelementexists id = <cont_id_4>
		destroyscreenelement id = <cont_id_4>
	endif
	if screenelementexists id = <cont_id_5>
		destroyscreenelement id = <cont_id_5>
	endif
	if screenelementexists \{id = exploding_particle_container}
		destroyscreenelement \{id = exploding_particle_container}
	endif
endscript

script create_exploding_particles 
	createscreenelement \{type = containerelement
		id = exploding_particle_container
		parent = root_window
		pos = (0.0, 0.0)}
	<i> = 0
	begin
	formattext checksumname = particle_id 'particle_%i' i = <i>
	getrandomvalue \{a = 280.0
		b = 980.0
		name = rand_x}
	getrandomvalue \{a = 200.0
		b = 400.0
		name = rand_y}
	<new_pos> = ((<rand_x> * (1.0, 0.0)) + (<rand_y> * (0.0, 1.0)))
	createscreenelement {
		type = physicselement
		id = <particle_id>
		parent = exploding_particle_container
		alpha = 0
		pos = <new_pos>
		mass = 125.0
		center = (2.0, 2.0)
		radius = 2.83
		elasticity = 0.75
	}
	createscreenelement {
		type = spriteelement
		parent = <particle_id>
		texture = jow_spark02
		rgba = [100 200 255 120]
		dims = (5.0, 5.0)
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = 30
		blend = add
	}
	<i> = (<i> + 1)
	repeat $num_exploding_particles
endscript

script do_text_slam \{time = 1.0}
	<zoom_time_1> = 0.3
	<zoom_time_2> = 0.2
	<zoom_time_3> = 0.15
	<zoom_time_4> = 0.15
	<zoom_time_5> = 0.1
	<zoom_time_6> = 2.0
	<hiccup_time> = 0.1
	<scale_2> = 0.6
	<scale_3> = 0.9
	<scale_4> = 0.825
	<scale_5> = 0.85
	<scale_6> = 0.825
	<scale_7> = 1.0
	<hiccup_scale> = 1.025
	<orig_pos> = <cont_pos>
	<orig_alpha> = 0.25
	<orig_scale> = 2
	formattext checksumname = cont_id '%p' p = <parent>
	getscreenelementprops id = <cont_id>
	<final_pos> = <pos>
	<final_alpha> = 0.575
	setscreenelementprops {
		id = <cont_id>
		pos = <orig_pos>
		alpha = <orig_alpha>
		scale = <orig_scale>
		relative_scale
	}
	<cont_id> :se_setprops {
		pos = <final_pos>
		alpha = <final_alpha>
		scale = <scale_2>
		time = <zoom_time_1>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <scale_3>
		time = <zoom_time_2>
		motion = ease_out
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <scale_4>
		time = <zoom_time_3>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <scale_5>
		time = <zoom_time_4>
		motion = ease_out
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <scale_6>
		time = <zoom_time_5>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	wait \{0.5
		seconds}
	<cont_id> :se_setprops {
		scale = <scale_7>
		time = <zoom_time_6>
		motion = smooth
		alpha = 1.0
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <hiccup_scale>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		scale = <scale_7>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	if (<explode> = 1)
		destroyscreenelement \{id = et_white_frame}
		createscreenelement \{type = spriteelement
			id = et_white_frame
			parent = root_window
			texture = white
			rgba = [
				255
				255
				255
				255
			]
			dims = (1280.0, 720.0)
			pos = (640.0, 360.0)
			just = [
				center
				center
			]
			z_priority = 1000}
		if (<text_physics> = 1)
			destroyscreenelement \{id = et_excite_frame}
			createscreenelement \{type = spriteelement
				id = et_excite_frame
				parent = root_window
				texture = excite_frame
				rgba = [
					255
					255
					255
					175
				]
				dims = (1280.0, 720.0)
				pos = (640.0, 360.0)
				just = [
					center
					center
				]
				z_priority = 1000}
		endif
		if NOT gotparam \{debug}
			spawnscriptnow \{do_extra_exploding_particles}
		endif
		runscriptonscreenelement id = <id> explode_white_screens
		if (<text_physics> = 1)
			do_exploding_text_physics {
				parent = <parent>
				time = <time>
				exploding_text_array_size = <exploding_text_array_size>
				cont_pos = <cont_pos>
			}
		endif
		do_exploding_text_particle_physics
	elseif (<text_physics> = 1)
		do_exploding_text_physics {
			parent = <parent>
			time = <time>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
		}
	endif
endscript

script do_extra_exploding_particles \{z_priority = 8.0
		pos = (640.0, 200.0)
		parent = exploding_particle_container}
	if screenelementexists \{id = extra_particles}
		destroy2dparticlesystem \{id = extra_particles}
	endif
	create2dparticlesystem {
		id = extra_particles
		pos = <pos>
		parent = <parent>
		z_priority = <z_priority>
		material = sys_particle_spark01_sys_particle_spark01
		start_color = [100 200 255 100]
		end_color = [100 200 255 0]
		start_scale = (2.0, 2.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 0.0
		min_rotation = 0.0
		max_rotation = 0.0
		emit_start_radius = 20.0
		emit_radius = 20.0
		emit_rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		velocity = 16.0
		friction = (0.0, 20.0)
		time = 1.5
	}
	if NOT ($in_tutorial_mode = 1)
	endif
	if NOT issoundeventplaying \{crowd_fail_song_sfx}
		spawnscriptnow \{surge_after_explosion}
	endif
	wait \{1.5
		seconds}
	destroy2dparticlesystem \{id = extra_particles
		kill_when_empty}
	return
endscript

script explode_white_screens 
	et_white_frame :se_setprops \{alpha = 0
		time = 0.1}
	if screenelementexists \{id = et_excite_frame}
		et_excite_frame :se_setprops \{alpha = 0
			time = 0.4
			scale = 1.5
			motion = ease_out}
	endif
	wait \{0.5
		seconds}
	destroyscreenelement \{id = et_white_frame}
	if screenelementexists \{id = et_excite_frame}
		destroyscreenelement \{id = et_excite_frame}
	endif
endscript

script do_exploding_text_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 5000000
	<i> = 0
	begin
	formattext checksumname = physics_container '%p_%i' p = <parent> i = <i>
	getscreenelementprops id = <physics_container>
	setscreenelementprops id = <physics_container> apply_gravity apply_drag
	<force> = (<pos> + <cont_pos> - <force_pos> + (RandomFloat (-300.0, 300.0) * (1.0, 0.0)))
	normalize_vector vect = <force>
	<physics_container> :applyforce force = (<vect> * <explode_const>)
	if ((<vect>.(1.0, 0.0)) < 0)
		<rot> = -720.0
	else
		<rot> = 720.0
	endif
	<rot> = (<rot> * RandomFloat (0.5, 2.0))
	getrandomvalue \{a = 3
		b = 7
		name = rand_time}
	setscreenelementprops id = <physics_container> rot_angle = <rot> time = <rand_time> motion = ease_out
	runscriptonscreenelement id = <physics_container> check_screen_collisions params = {id = <physics_container> top_offset = -100 bottom_offset = 300}
	<i> = (<i> + 1)
	repeat <exploding_text_array_size>
endscript

script do_exploding_text_particle_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 7000000
	<i> = 0
	begin
	formattext checksumname = particle_id 'particle_%i' i = <i>
	setscreenelementprops id = <particle_id> alpha = 1.0 time = 0.5
	setscreenelementprops id = <particle_id> scale = 3.0 relative_scale time = 1.0
	getscreenelementprops id = <particle_id>
	setscreenelementprops id = <particle_id> apply_gravity
	<force> = (<pos> - <force_pos>)
	normalize_vector vect = <force>
	<particle_id> :applyforce force = (<vect> * <explode_const>)
	runscriptonscreenelement id = <particle_id> check_screen_collisions params = {id = <particle_id> top_offset = -100 bottom_offset = 200}
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
	wait \{1.0
		seconds}
	<i> = 0
	begin
	formattext checksumname = particle_id 'particle_%i' i = <i>
	getrandomvalue \{a = 0.1
		b = 3.0
		name = rand_time}
	setscreenelementprops id = <particle_id> alpha = 0 time = <rand_time>
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
endscript

script split_text_into_physics_array_elements \{text = qs(0x6f6d143d)
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	stringtochararray string = <text>
	getarraysize <char_array>
	<fit_scale> = 1.0
	if gotparam \{fit_dims}
		createscreenelement {
			type = textelement
			parent = root_window
			text = <text>
			font = (<flags>.font)
			scale = (<flags>.scale)
		}
		getscreenelementdims id = <id>
		stringlength string = <text>
		avg_width = (<width> / <str_len>)
		<fudge_factor> = 10
		avg_width = (<avg_width> + <fudge_factor>)
		fit_scale = ((<fit_dims>.(1.0, 0.0)) / (<str_len> * <avg_width>))
		if (<fit_scale> > 1.6)
			<fit_scale> = 1.6
		elseif (<fit_scale> < 0.625)
			<fit_scale> = 0.625
		endif
		<y_offset> = 0
		if (<fit_scale> < 1.0)
			<y_offset> = ((<height> - (<height> * <fit_scale>)) / 2)
			<text_pos> = (<text_pos> + (<y_offset> * (0.0, 1.0)))
		endif
		<height> = (<height> * <fit_scale>)
		if (<placement> = top)
			change g_ui_exploding_text_top_height = <height>
		else
			<cont_pos_x> = ($g_ui_exploding_text_top_pos.(1.0, 0.0))
			<cont_pos_y> = (($g_ui_exploding_text_top_pos.(0.0, 1.0)) + (($g_ui_exploding_text_top_height + <height>) / 2))
			<cont_pos> = ((<cont_pos_x> * (1.0, 0.0)) + (<cont_pos_y> * (0.0, 1.0)))
		endif
		<space_between> = ((<avg_width> * <fit_scale>) * (1.0, 0.0))
		destroy_menu menu_id = <id>
	endif
	if gotparam \{centered}
		half_width = ((<array_size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	formattext checksumname = cont_id '%p' p = <parent>
	createscreenelement {
		type = containerelement
		id = <cont_id>
		parent = root_window
		pos = <cont_pos>
	}
	i = 0
	begin
	formattext checksumname = physics_container '%p_%i' p = <parent> i = <i>
	createscreenelement {
		type = physicselement
		id = <physics_container>
		parent = <cont_id>
		pos = <text_pos>
		center = (640.0, 290.0)
		radius = 85.5
		elasticity = 0.3
		just = <just>
	}
	createscreenelement {
		type = textelement
		parent = <physics_container>
		pos = (0.0, 0.0)
		text = (<char_array> [<i>])
		<flags>
		scale = (<flags>.scale * <fit_scale>)
		alpha = (<flags>.alpha)
	}
	getscreenelementdims id = <id>
	if (<width> > 50)
		<mass> = (<width> * 2.0)
	else
		<mass> = 100.0
	endif
	setscreenelementprops id = <physics_container> mass = <mass>
	createscreenelement {
		type = textelement
		parent = <physics_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [230 100 50 255]
		just = [center center]
		pos = (0.0, 0.0)
		alpha = (<flags>.alpha)
		internal_scale = (<flags>.scale * (1.15, 1.1) * <fit_scale>)
	}
	createscreenelement {
		type = textelement
		parent = <physics_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 2)
		rgba = [0 0 0 255]
		just = [center center]
		pos = (0.0, 0.0)
		alpha = (<flags>.alpha)
		internal_scale = (<flags>.scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_size>
	return exploding_text_array_size = <array_size>
endscript
