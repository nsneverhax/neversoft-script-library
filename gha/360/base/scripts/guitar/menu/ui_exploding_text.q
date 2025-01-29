num_exploding_particles = 100
g_ui_exploding_text_top_pos = (640.0, 240.0)
g_ui_exploding_text_bottom_pos = (640.0, 380.0)
g_ui_exploding_text_top_height = 380

script create_exploding_text \{parent = 'you_rock_physics'
		text = "You Rock!"
		placement = top
		just = [
			center
			bottom
		]}
	formatText checksumName = cont_id '%p' p = <parent>
	if ScreenElementExists id = <cont_id>
		return
	endif
	if (<placement> = top)
		cont_pos = $g_ui_exploding_text_top_pos
	else
		cont_pos = $g_ui_exploding_text_bottom_pos
	endif
	check_screen_for_physics
	if NOT ScreenElementExists \{id = exploding_particle_container}
		create_exploding_particles
		<explode> = 1
	else
		<explode> = 0
	endif
	split_text_into_physics_array_elements {
		id = yourock_text
		parent = <parent>
		text = <text>
		text_pos = (0.0, 0.0)
		cont_pos = <cont_pos>
		space_between = (40.0, 0.0)
		fit_dims = (640.0, 120.0)
		just = <just>
		placement = <placement>
		flags = {
			Scale = 1.0
			z_priority = 95
			font = text_a10_Large
			rgba = [250 240 220 255]
			alpha = 1
		}
		centered
	}
	do_text_slam {
		parent = <parent>
		explode = <explode>
		text_physics = 1
		exploding_text_array_size = <exploding_text_array_size>
		cont_pos = <cont_pos>
	}
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
	if ScreenElementExists id = <cont_id_1>
		DestroyScreenElement id = <cont_id_1>
	endif
	if ScreenElementExists id = <cont_id_2>
		DestroyScreenElement id = <cont_id_2>
	endif
	if ScreenElementExists id = <cont_id_3>
		DestroyScreenElement id = <cont_id_3>
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
	<random_color> = Random (@ [255 255 255 255] @ [200 100 100 255] @ [255 215 100 255] @ [255 250 200 255] @ [255 165 75 255] )
	<new_pos> = ((<rand_x> * (1.0, 0.0)) + (<rand_y> * (0.0, 1.0)))
	CreateScreenElement {
		Type = physicselement
		id = <particle_id>
		parent = exploding_particle_container
		alpha = 0
		Pos = <new_pos>
		mass = 125.0
		center = (2.0, 2.0)
		radius = 2.83
		elasticity = 0.75
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <particle_id>
		texture = particle_red_32
		rgba = <random_color>
		dims = (5.0, 5.0)
		Pos = (0.0, 0.0)
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
	<cont_id> :DoMorph {
		Pos = <final_pos>
		alpha = <final_alpha>
		Scale = <scale_2>
		time = <zoom_time_1>
		motion = ease_in
	}
	<cont_id> :DoMorph {
		Scale = <scale_3>
		time = <zoom_time_2>
		motion = ease_out
	}
	<cont_id> :DoMorph {
		Scale = <scale_4>
		time = <zoom_time_3>
		motion = ease_in
	}
	<cont_id> :DoMorph {
		Scale = <scale_5>
		time = <zoom_time_4>
		motion = ease_out
	}
	<cont_id> :DoMorph {
		Scale = <scale_6>
		time = <zoom_time_5>
		motion = ease_in
	}
	Wait \{0.5
		Seconds}
	<cont_id> :DoMorph {
		Scale = <scale_7>
		time = <zoom_time_6>
		motion = smooth
		alpha = 1.0
	}
	<cont_id> :DoMorph {
		Scale = <hiccup_scale>
		time = <hiccup_time>
	}
	<cont_id> :DoMorph {
		Scale = <scale_7>
		time = <hiccup_time>
	}
	if (<explode> = 1)
		CreateScreenElement \{Type = SpriteElement
			parent = root_window
			texture = white
			rgba = [
				255
				255
				255
				255
			]
			dims = (1280.0, 720.0)
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]
			z_priority = 1000}
		SpawnScriptNow \{do_extra_exploding_particles}
		RunScriptOnScreenElement id = <id> explode_white_screen params = {id = <id>}
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
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
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
	SoundEvent \{event = you_rock_explosion}
	Wait \{1.5
		Seconds}
	Destroy2DParticleSystem \{id = extra_particles
		kill_when_empty}
	return
endscript

script explode_white_screen 
	DoScreenElementMorph id = <id> alpha = 0 time = 0.1
	Wait \{0.1
		Seconds}
	DestroyScreenElement id = <id>
endscript

script do_exploding_text_physics 
	<force_pos> = (640.0, 680.0)
	<explode_const> = 5000000
	<i> = 0
	begin
	formatText checksumName = physics_container '%p_%i' p = <parent> i = <i>
	GetScreenElementProps id = <physics_container>
	SetScreenElementProps id = <physics_container> apply_gravity apply_drag
	<Force> = (<Pos> + <cont_pos> - <force_pos> + (RandomRange (-300.0, 300.0) * (1.0, 0.0)))
	normalize_vector vect = <Force>
	<physics_container> :applyforce Force = (<vect> * <explode_const>)
	if ((<vect>.(1.0, 0.0)) < 0)
		<rot> = -720.0
	else
		<rot> = 720.0
	endif
	<rot> = (<rot> * RandomRange (0.5, 2.0))
	GetRandomValue \{a = 3
		b = 7
		Name = rand_time}
	DoScreenElementMorph id = <physics_container> rot_angle = <rot> time = <rand_time> motion = ease_out
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
	DoScreenElementMorph id = <particle_id> alpha = 1.0 time = 0.5
	DoScreenElementMorph id = <particle_id> Scale = 3.0 relative_scale time = 1.0
	GetScreenElementProps id = <particle_id>
	SetScreenElementProps id = <particle_id> apply_gravity
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
	DoScreenElementMorph id = <particle_id> alpha = 0 time = <rand_time>
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
endscript

script split_text_into_physics_array_elements \{text = "You Rock!"
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
			Scale = (<flags>.Scale)
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
	CreateScreenElement {
		Type = TextElement
		parent = <physics_container>
		Pos = (0.0, 0.0)
		text = (<char_array> [<i>])
		<flags>
		Scale = (<flags>.Scale * <fit_scale>)
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
		rgba = [184 134 11 255]
		just = [center center]
		Pos = (0.0, 0.0)
		alpha = (<flags>.alpha)
		Scale = (<flags>.Scale * (1.15, 1.1) * <fit_scale>)
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
		Scale = (<flags>.Scale * (1.3, 1.2) * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_Size>
	return exploding_text_array_size = <array_Size>
endscript
