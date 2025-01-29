num_exploding_particles = 99
g_ui_exploding_text_top_pos = (640.0, 240.0)
g_ui_exploding_text_bottom_pos = (640.0, 380.0)
g_ui_ps2_exploding_text_tut_top_pos = (640.0, 140.0)
g_ui_ps2_exploding_text_tut_bottom_pos = (640.0, 280.0)
g_ui_exploding_text_top_height = 380

script create_exploding_text \{parent = 'you_rock_physics'
		text = qs(0x6f6d143d)
		placement = top
		just = [
			center
			bottom
		]
		text_physics = 1}
	formatText checksumName = cont_id '%p' p = <parent>
	if ScreenElementExists id = <cont_id>
		return
	endif
	cont_scale = 1.0
	if (<placement> = top)
		cont_pos = $g_ui_exploding_text_top_pos
	elseif (<placement> = ps2_tut_top)
		placement = top
		cont_pos = $g_ui_ps2_exploding_text_tut_top_pos
	elseif (<placement> = ps2_tut_bottom)
		cont_pos = g_ui_ps2_exploding_text_tut_bottom_pos
	else
		cont_pos = $g_ui_exploding_text_bottom_pos
	endif
	StringLength string = <text>
	if (<str_len> >= 20)
		<cont_scale> = (0.94 - 0.05 * (<str_len> - 20))
	endif
	check_screen_for_physics
	if NOT ScreenElementExists \{id = exploding_particle_container}
		create_exploding_particles
		<explode> = 1
	else
		<explode> = 0
	endif
	font = fontgrid_title_a1
	fit_dims = (1000.0, 120.0)
	if (($g_in_tutorial = 1) || ($jam_tutorial_status = Active))
		<explode> = 0
		font = fontgrid_title_a1
		fit_dims = (640.0, 120.0)
	endif
	split_text_into_physics_array_elements {
		id = yourock_text
		parent = <parent>
		text = <text>
		text_pos = (0.0, 0.0)
		cont_pos = <cont_pos>
		space_between = (40.0, 0.0)
		fit_dims = <fit_dims>
		just = <just>
		placement = <placement>
		flags = {
			Scale = <cont_scale>
			z_priority = 95
			font = <font>
			rgba = [156 235 243 255]
			alpha = 1
		}
		centered
	}
	if GotParam \{debug}
		do_text_slam {
			parent = <parent>
			explode = <explode>
			text_physics = <text_physics>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
			debug
		}
	elseif ($g_in_tutorial = 1)
		0x1d8ab795 {
			parent = <parent>
			explode = <explode>
			text_physics = <text_physics>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
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
	formatText checksumName = cont_id '%p' p = <parent>
	if ScreenElementExists id = <cont_id>
		DestroyScreenElement id = <cont_id>
	endif
	if ScreenElementExists \{id = exploding_particle_container}
		DestroyScreenElement \{id = exploding_particle_container}
	endif
endscript

script destroy_all_exploding_text 
	formatText \{checksumName = cont_id_1
		'you_rock_physics'}
	formatText \{checksumName = cont_id_2
		'you_rock_2_physics'}
	formatText \{checksumName = cont_id_3
		'you_rock_legend_physics'}
	formatText \{checksumName = cont_id_4
		'lesson_complete'}
	formatText \{checksumName = cont_id_5
		'complete_text'}
	if ScreenElementExists id = <cont_id_1>
		DestroyScreenElement id = <cont_id_1>
	endif
	if ScreenElementExists id = <cont_id_2>
		DestroyScreenElement id = <cont_id_2>
	endif
	if ScreenElementExists id = <cont_id_3>
		DestroyScreenElement id = <cont_id_3>
	endif
	if ScreenElementExists id = <cont_id_4>
		DestroyScreenElement id = <cont_id_4>
	endif
	if ScreenElementExists id = <cont_id_5>
		DestroyScreenElement id = <cont_id_5>
	endif
	if ScreenElementExists \{id = exploding_particle_container}
		DestroyScreenElement \{id = exploding_particle_container}
	endif
endscript

script create_exploding_particles 
	CreateScreenElement \{Type = ContainerElement
		id = exploding_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	<i> = 0
	begin
	formatText checksumName = particle_id 'particle_%i' i = <i>
	GetRandomValue \{a = 280.0
		b = 980.0
		Name = rand_x}
	GetRandomValue \{a = 200.0
		b = 400.0
		Name = rand_y}
	<new_pos> = ((<rand_x> * (1.0, 0.0)) + (<rand_y> * (0.0, 1.0)))
	CreateScreenElement {
		Type = physicselement
		id = <particle_id>
		parent = exploding_particle_container
		alpha = 0
		Pos = <new_pos>
		mass = 500.0
		center = (2.0, 2.0)
		radius = 2.83
		elasticity = 0.75
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <particle_id>
		texture = JOW_Spark02
		rgba = [100 200 255 120]
		dims = (5.0, 5.0)
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = 30
		blend = add
	}
	<i> = (<i> + 1)
	repeat $num_exploding_particles
endscript

script do_text_slam \{time = 1.5}
	<zoom_time_1> = 0.5
	<zoom_time_2> = 0.1
	<zoom_time_3> = 0.1
	<zoom_time_4> = 0.1
	<zoom_time_5> = 0.01
	<zoom_time_6> = 0.05
	<zoom_time_7> = 0.01
	<zoom_time_8> = 0.05
	<zoom_time_9> = 0.15
	<zoom_time_10> = 0.1
	<zoom_time_11> = 0.1
	<zoom_time_12> = 0.08
	<zoom_time_13> = 0.15
	<zoom_time_12> = 0.1
	<zoom_time_13> = 0.1
	<zoom_time_13> = 0.1
	<zoom_time_14> = 0.05
	<hiccup_time> = 0.03
	<scale_2> = 1.0
	<scale_3> = 1.1
	<scale_4> = 1.0
	<scale_5> = 1.15
	<scale_6> = 1.1
	<scale_7> = 1.0
	<scale_8> = 1.15
	<scale_9> = 1.02
	<scale_10> = 1.0
	<scale_11> = 1.05
	<scale_12> = 1.0
	<scale_13> = 1.03
	<scale_14> = 1.0
	<scale_15> = 1.1
	<hiccup_scale> = 1.025
	<pos_2> = <orig_pos>
	<pos_3> = (640.0, 240.0)
	<pos_4> = (640.0, 240.0)
	<pos_5> = (640.0, 240.0)
	<pos_6> = (640.0, 240.0)
	<pos_7> = (640.0, 240.0)
	<pos_8> = (640.0, 240.0)
	<pos_9> = (640.0, 240.0)
	<pos_10> = (640.0, 240.0)
	<pos_11> = (640.0, 240.0)
	<pos_12> = (640.0, 240.0)
	<pos_13> = (640.0, 240.0)
	<pos_14> = (650.0, 240.0)
	<pos_15> = (630.0, 240.0)
	<hiccup_pos> = (640.0, 240.0)
	<orig_pos> = <cont_pos>
	<orig_alpha> = 0
	<orig_scale> = 2.5
	formatText checksumName = cont_id '%p' p = <parent>
	GetScreenElementProps id = <cont_id>
	<final_pos> = <Pos>
	<final_alpha> = 1
	<cont_id> :se_setprops {
		Pos = <orig_pos>
		alpha = <orig_alpha>
		Scale = <orig_scale>
		relative_scale
	}
	<cont_id> :se_setprops {
		Pos = <final_pos>
		alpha = <final_alpha>
		Scale = <scale_2>
		time = <zoom_time_1>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_3>
		Scale = <scale_3>
		time = <zoom_time_2>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_4>
		Scale = <scale_4>
		time = <zoom_time_3>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_5>
		Scale = <scale_5>
		time = <zoom_time_4>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_6>
		Scale = <scale_6>
		time = <zoom_time_5>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_7>
		Scale = <scale_7>
		time = <zoom_time_6>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_8>
		Scale = <scale_8>
		time = <zoom_time_7>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_9>
		Scale = <scale_9>
		time = <zoom_time_8>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_10>
		Scale = <scale_10>
		time = <zoom_time_9>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_11>
		Scale = <scale_11>
		time = <zoom_time_10>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_12>
		Scale = <scale_12>
		time = <zoom_time_11>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_13>
		Scale = <scale_13>
		time = <zoom_time_12>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_14>
		Scale = <scale_14>
		time = <zoom_time_13>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <pos_15>
		Scale = <scale_15>
		time = <zoom_time_14>
		alpha = 1
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Pos = <hiccup_pos>
		Scale = <hiccup_scale>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_7>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	if (<explode> = 1)
		DestroyScreenElement \{id = et_white_frame}
		CreateScreenElement \{Type = SpriteElement
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
			Pos = (640.0, 300.0)
			just = [
				center
				center
			]
			z_priority = 1000}
		if NOT GotParam \{debug}
			SpawnScriptNow \{do_extra_exploding_particles}
		endif
		RunScriptOnScreenElement id = <id> explode_white_screens
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
		Pos = (640.0, 200.0)
		parent = exploding_particle_container}
	if ScreenElementExists \{id = extra_particles}
		Destroy2DParticleSystem \{id = extra_particles}
	endif
	Create2DParticleSystem {
		id = extra_particles
		Pos = <Pos>
		parent = <parent>
		z_priority = <z_priority>
		material = sys_Particle_Spark01_sys_Particle_Spark01
		start_color = [100 200 255 100]
		end_color = [100 200 255 0]
		start_scale = (2.0, 2.0)
		end_scale = (0.5, 0.5)
		start_angle_spread = 0.0
		min_rotation = 0.0
		max_rotation = 0.0
		emit_start_radius = 20.0
		emit_radius = 20.0
		Emit_Rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		velocity = 16.0
		friction = (0.0, 20.0)
		time = 1.5
	}
	if NOT ($in_tutorial_mode = 1)
	endif
	if NOT IsSoundEventPlaying \{Crowd_Fail_Song_SFX}
		SpawnScriptNow \{surge_after_explosion}
	endif
	Wait \{1.5
		Seconds}
	Destroy2DParticleSystem \{id = extra_particles
		kill_when_empty}
	return
endscript

script explode_white_screens 
	et_white_frame :se_setprops \{alpha = 0
		time = 0.1}
	if ScreenElementExists \{id = et_excite_frame}
		et_excite_frame :se_setprops \{alpha = 0
			time = 0.4
			Scale = 1.5
			motion = ease_out}
	endif
	Wait \{0.5
		Seconds}
	DestroyScreenElement \{id = et_white_frame}
	if ScreenElementExists \{id = et_excite_frame}
		DestroyScreenElement \{id = et_excite_frame}
	endif
endscript

script do_exploding_text_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 9000000
	<i> = 0
	begin
	formatText checksumName = physics_container '%p_%i' p = <parent> i = <i>
	GetScreenElementProps id = <physics_container>
	SetScreenElementProps id = <physics_container> apply_gravity = true apply_drag = true
	<Force> = (<Pos> + <cont_pos> - <force_pos> + (RandomFloat (-300.0, 300.0) * (1.0, 0.0)))
	normalize_vector vect = <Force>
	<physics_container> :applyforce Force = (<vect> * <explode_const>)
	if ((<vect>.(1.0, 0.0)) < 0)
		<rot> = -280.0
	else
		<rot> = 280.0
	endif
	<rot> = (<rot> * RandomFloat (0.5, 3.0))
	GetRandomValue \{a = 3
		b = 7
		Name = rand_time}
	SetScreenElementProps id = <physics_container> rot_angle = <rot> time = <rand_time> motion = ease_out
	RunScriptOnScreenElement id = <physics_container> check_screen_collisions params = {id = <physics_container> top_offset = -100 bottom_offset = 300}
	<i> = (<i> + 1)
	repeat <exploding_text_array_size>
endscript

script do_exploding_text_particle_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 7000000
	<i> = 0
	begin
	formatText checksumName = particle_id 'particle_%i' i = <i>
	SetScreenElementProps id = <particle_id> alpha = 1.0 time = 0.5
	SetScreenElementProps id = <particle_id> Scale = 3.0 relative_scale time = 1.0
	GetScreenElementProps id = <particle_id>
	SetScreenElementProps id = <particle_id> apply_gravity = true
	<Force> = (<Pos> - <force_pos>)
	normalize_vector vect = <Force>
	<particle_id> :applyforce Force = (<vect> * <explode_const>)
	RunScriptOnScreenElement id = <particle_id> check_screen_collisions params = {id = <particle_id> top_offset = -100 bottom_offset = 200}
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
	Wait \{1.0
		Seconds}
	<i> = 0
	begin
	formatText checksumName = particle_id 'particle_%i' i = <i>
	GetRandomValue \{a = 0.1
		b = 3.0
		Name = rand_time}
	SetScreenElementProps id = <particle_id> alpha = 0 time = <rand_time>
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
endscript

script split_text_into_physics_array_elements \{text = qs(0x6f6d143d)
		text_pos = (0.0, 0.0)
		space_between = (0.0, 0.0)
		flags = {
		}}
	StringToCharArray string = <text>
	GetArraySize <char_array>
	<fit_scale> = 1.0
	if GotParam \{fit_dims}
		CreateScreenElement {
			Type = TextElement
			parent = root_window
			text = <text>
			font = (<flags>.font)
			Scale = (<flags>.Scale * (2.0, 2.0))
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
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
			Change g_ui_exploding_text_top_height = <height>
		elseif (<placement> = ps2_tut_bottom)
			<cont_pos_x> = ($g_ui_ps2_exploding_text_tut_top_pos.(1.0, 0.0))
			<cont_pos_y> = (($g_ui_ps2_exploding_text_tut_top_pos.(0.0, 1.0)) + (($g_ui_exploding_text_top_height + <height>) / 2))
			<cont_pos> = ((<cont_pos_x> * (1.0, 0.0)) + (<cont_pos_y> * (0.0, 1.0)))
		else
			<cont_pos_x> = ($g_ui_exploding_text_top_pos.(1.0, 0.0))
			<cont_pos_y> = (($g_ui_exploding_text_top_pos.(0.0, 1.0)) + (($g_ui_exploding_text_top_height + <height>) / 2))
			<cont_pos> = ((<cont_pos_x> * (1.0, 0.0)) + (<cont_pos_y> * (0.0, 1.0)))
		endif
		<space_between> = ((<avg_width> * <fit_scale>) * (1.0, 0.0))
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_Size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	formatText checksumName = cont_id '%p' p = <parent>
	CreateScreenElement {
		Type = ContainerElement
		id = <cont_id>
		parent = root_window
		Pos = <cont_pos>
	}
	i = 0
	begin
	formatText checksumName = physics_container '%p_%i' p = <parent> i = <i>
	CreateScreenElement {
		Type = physicselement
		id = <physics_container>
		parent = <cont_id>
		Pos = <text_pos>
		center = (640.0, 290.0)
		radius = 85.5
		elasticity = 0.3
		just = <just>
	}
	if ((<i> + 1) < <array_Size>)
		if ((<char_array> [<i>] = qs(0xf2bd630d)) && (<char_array> [<i> + 1] = qs(0xd99030ce)))
			<i> = (<i> + 1)
			SetArrayElement ArrayName = char_array index = <i> NewValue = qs(0x713755f7)
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <physics_container>
		Pos = (0.0, 0.0)
		text = (<char_array> [<i>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
		internal_scale = (2.0, 2.0)
		alpha = (<flags>.alpha)
	}
	GetScreenElementDims id = <id>
	if (<width> > 50)
		<mass> = (<width> * 2.0)
	else
		<mass> = 100.0
	endif
	SetScreenElementProps id = <physics_container> mass = <mass>
	CreateScreenElement {
		Type = TextElement
		parent = <physics_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 1)
		rgba = [255 255 255 255]
		just = [center center]
		Pos = (0.0, 0.0)
		alpha = (<flags>.alpha)
		internal_scale = (<flags>.Scale * (2.3, 2.2) * <fit_scale>)
	}
	CreateScreenElement {
		Type = TextElement
		parent = <physics_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 2)
		rgba = [0 0 0 255]
		just = [center center]
		Pos = (0.0, 0.0)
		alpha = (<flags>.alpha)
		internal_scale = (<flags>.Scale * (2.6, 2.4) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	if (<i> >= <array_Size>)
		break
	endif
	repeat <array_Size>
	return exploding_text_array_size = <array_Size>
endscript

script 0x1d8ab795 \{time = 1.5}
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
	formatText checksumName = cont_id '%p' p = <parent>
	GetScreenElementProps id = <cont_id>
	<final_pos> = <Pos>
	<final_alpha> = 0.575
	SetScreenElementProps {
		id = <cont_id>
		Pos = <orig_pos>
		alpha = <orig_alpha>
		Scale = <orig_scale>
		relative_scale
	}
	<cont_id> :se_setprops {
		Pos = <final_pos>
		alpha = <final_alpha>
		Scale = <scale_2>
		time = <zoom_time_1>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_3>
		time = <zoom_time_2>
		motion = ease_out
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_4>
		time = <zoom_time_3>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_5>
		time = <zoom_time_4>
		motion = ease_out
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_6>
		time = <zoom_time_5>
		motion = ease_in
	}
	<cont_id> :se_waitprops
	Wait \{0.5
		Seconds}
	<cont_id> :se_setprops {
		Scale = <scale_7>
		time = <zoom_time_6>
		motion = smooth
		alpha = 1.0
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <hiccup_scale>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	<cont_id> :se_setprops {
		Scale = <scale_7>
		time = <hiccup_time>
	}
	<cont_id> :se_waitprops
	if (<explode> = 1)
		DestroyScreenElement \{id = et_white_frame}
		CreateScreenElement \{Type = SpriteElement
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
			Pos = (640.0, 360.0)
			just = [
				center
				center
			]
			z_priority = 1000}
		if NOT GotParam \{debug}
			SpawnScriptNow \{do_extra_exploding_particles}
		endif
		RunScriptOnScreenElement id = <id> explode_white_screens
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
