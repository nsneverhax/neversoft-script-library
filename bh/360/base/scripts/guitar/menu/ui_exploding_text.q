num_exploding_particles = 200
g_ui_exploding_text_top_pos = (640.0, 240.0)
g_ui_exploding_text_bottom_pos = (640.0, 380.0)
g_ui_exploding_text_top_height = 380
g_exploding_text_main_id = null

script create_exploding_text \{parent = 'you_rock_physics'
		text = qs(0x6f6d143d)
		placement = top
		just = [
			center
			bottom
		]
		text_physics = 0}
	FormatText checksumname = cont_id '%p' p = <parent>
	if ScreenElementExists id = <cont_id>
		return
	endif
	if (<placement> = top)
		cont_pos = $g_ui_exploding_text_top_pos
	else
		cont_pos = $g_ui_exploding_text_bottom_pos
	endif
	check_screen_for_physics
	<explode> = 0
	if NOT ScreenElementExists \{id = exploding_particle_container}
		create_exploding_particles
		<explode> = 1
	endif
	if ($jam_tutorial_status = active)
		<explode> = 0
	endif
	scale = 1.0
	if GotParam \{old_scale}
		scale = 2.5
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
			scale = <scale>
			z_priority = 95
			font = fontgrid_title_a1
			rgba = [242 250 254 210]
			alpha = 1
		}
		centered
		old_scale = <old_scale>
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
	else
		do_text_slam {
			parent = <parent>
			explode = <explode>
			text_physics = <text_physics>
			exploding_text_array_size = <exploding_text_array_size>
			cont_pos = <cont_pos>
		}
	endif
	($g_exploding_text_main_id) :SE_SetProps alpha = 0 time = 0.05
	($g_exploding_text_main_id) :SE_WaitProps
	spawnscriptnow \{destroy_all_exploding_text}
endscript

script destroy_exploding_text \{parent = 'you_rock_physics'}
	FormatText checksumname = cont_id '%p' p = <parent>
	if ScreenElementExists id = <cont_id>
		DestroyScreenElement id = <cont_id>
	endif
	if ScreenElementExists \{id = exploding_particle_container}
		DestroyScreenElement \{id = exploding_particle_container}
	endif
endscript

script destroy_all_exploding_text 
	killspawnedscript \{name = create_exploding_text}
	FormatText \{checksumname = cont_id_1
		'you_rock_physics'}
	FormatText \{checksumname = cont_id_2
		'you_rock_2_physics'}
	FormatText \{checksumname = cont_id_3
		'you_rock_legend_physics'}
	FormatText \{checksumname = cont_id_4
		'lesson_complete'}
	FormatText \{checksumname = cont_id_5
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
	DestroyScreenElement \{id = you_rock_effects_root
		preserve_parent}
endscript

script create_exploding_particles 
	CreateScreenElement \{type = ContainerElement
		id = exploding_particle_container
		parent = root_window
		Pos = (0.0, 0.0)}
	<i> = 0
	begin
	FormatText checksumname = particle_id 'particle_%i' i = <i>
	GetRandomValue \{a = 0.0
		b = 1200.0
		name = rand_x}
	GetRandomValue \{a = 0.0
		b = 400.0
		name = rand_y}
	<new_pos> = ((<rand_x> * (1.0, 0.0)) + (<rand_y> * (0.0, 1.0)))
	CreateScreenElement {
		type = PhysicsElement
		id = <particle_id>
		parent = exploding_particle_container
		alpha = 0
		Pos = <new_pos>
		mass = 0.0003
		center = (2.0, 2.0)
		radius = 2.83
		elasticity = 0.75
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <particle_id>
		texture = JOW_Spark02
		rgba = [253 240 220 255]
		dims = (7.0, 7.0)
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = 100
		blend = add
	}
	<i> = (<i> + 1)
	repeat $num_exploding_particles
endscript

script do_text_slam \{time = 2}
	<zoom_time_1> = 0.4
	<zoom_time_2> = 0.03
	<zoom_time_3> = 0.01
	<zoom_time_4> = 0.3
	<zoom_time_5> = 0.01
	<zoom_time_6> = 0.05
	<zoom_time_7> = 0.01
	<zoom_time_8> = 0.05
	<zoom_time_9> = 0.3
	<zoom_time_10> = 0.1
	<zoom_time_11> = 0.2
	<zoom_time_12> = 0.08
	<zoom_time_13> = 0.15
	<zoom_time_12> = 0.3
	<zoom_time_13> = 0.1
	<zoom_time_13> = 0.1
	<zoom_time_14> = 0.05
	<hiccup_time> = 0.03
	<scale_2> = 1
	<scale_3> = 1.1
	<scale_4> = 1.0
	<scale_5> = 1.05
	<scale_6> = 1.0
	<scale_7> = 1.05
	<scale_8> = 1.0
	<scale_9> = 1.03
	<scale_10> = 1.0
	<scale_11> = 1.06
	<scale_12> = 1.0
	<scale_13> = 1.07
	<scale_14> = 1.0
	<scale_15> = 1.1
	<hiccup_scale> = 1.5
	<pos_2> = <orig_pos>
	<pos_3> = <orig_pos>
	<pos_4> = <orig_pos>
	<pos_5> = <orig_pos>
	<pos_6> = <orig_pos>
	<pos_7> = <orig_pos>
	<pos_8> = <orig_pos>
	<pos_9> = <orig_pos>
	<pos_10> = <orig_pos>
	<pos_11> = <orig_pos>
	<pos_12> = <orig_pos>
	<pos_13> = <orig_pos>
	<pos_14> = <orig_pos>
	<pos_15> = <orig_pos>
	<hiccup_pos> = <orig_pos>
	<orig_pos> = <cont_pos>
	<orig_alpha> = 0
	<orig_scale> = 2.5
	FormatText checksumname = cont_id '%p' p = <parent>
	GetScreenElementProps id = <cont_id>
	<final_pos> = <Pos>
	<final_alpha> = 1
	<cont_id> :SE_SetProps {
		Pos = <orig_pos>
		alpha = <orig_alpha>
		scale = <orig_scale>
		relative_scale
	}
	<cont_id> :SE_SetProps {
		Pos = <final_pos>
		alpha = <final_alpha>
		scale = <scale_2>
		time = <zoom_time_1>
		motion = ease_in
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_3>
		scale = <scale_3>
		time = <zoom_time_2>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_4>
		scale = <scale_4>
		time = <zoom_time_3>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_5>
		scale = <scale_5>
		time = <zoom_time_4>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_6>
		scale = <scale_6>
		time = <zoom_time_5>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_7>
		scale = <scale_7>
		time = <zoom_time_6>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_8>
		scale = <scale_8>
		time = <zoom_time_7>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_9>
		scale = <scale_9>
		time = <zoom_time_8>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_10>
		scale = <scale_10>
		time = <zoom_time_9>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_11>
		scale = <scale_11>
		time = <zoom_time_10>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_12>
		scale = <scale_12>
		time = <zoom_time_11>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_13>
		scale = <scale_13>
		time = <zoom_time_12>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_14>
		scale = <scale_14>
		time = <zoom_time_13>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <pos_15>
		scale = <scale_15>
		time = <zoom_time_14>
		alpha = 1
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		Pos = <hiccup_pos>
		scale = <hiccup_scale>
		time = <hiccup_time>
	}
	<cont_id> :SE_WaitProps
	<cont_id> :SE_SetProps {
		scale = <scale_7>
		time = <hiccup_time>
	}
	<cont_id> :SE_WaitProps
	if (<explode> = 1)
		DestroyScreenElement \{id = et_white_frame}
		CreateScreenElement \{type = SpriteElement
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
		if (<text_physics> = 1)
			DestroyScreenElement \{id = et_excite_frame}
			CreateScreenElement \{type = SpriteElement
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
				Pos = (640.0, 300.0)
				just = [
					center
					center
				]
				z_priority = 1000}
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
		SoundEvent \{event = You_Rock_Explosion}
	endif
	if NOT IsSoundEventPlaying \{Crowd_Fail_Song_SFX}
		spawnscriptnow \{Surge_After_Explosion}
	endif
	wait \{1.5
		seconds}
	Destroy2DParticleSystem \{id = extra_particles
		kill_when_empty}
	return
endscript

script explode_white_screens 
	et_white_frame :SE_SetProps \{alpha = 0
		time = 0.1}
	if ScreenElementExists \{id = et_excite_frame}
		et_excite_frame :SE_SetProps \{alpha = 0
			time = 0.4
			scale = 1.5
			motion = ease_out}
	endif
	wait \{0.5
		seconds}
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
	FormatText checksumname = physics_container '%p_%i' p = <parent> i = <i>
	GetScreenElementProps id = <physics_container>
	SetScreenElementProps id = <physics_container> apply_gravity = true apply_drag = true
	<Force> = (<Pos> + <cont_pos> - <force_pos> + (RandomFloat (-300.0, 300.0) * (1.0, 0.0)))
	normalize_vector vect = <Force>
	<physics_container> :ApplyForce Force = (<vect> * <explode_const>)
	if ((<vect>.(1.0, 0.0)) < 0)
		<rot> = -280.0
	else
		<rot> = 280.0
	endif
	<rot> = (<rot> * RandomFloat (0.5, 3.0))
	GetRandomValue \{a = 3
		b = 7
		name = rand_time}
	SetScreenElementProps id = <physics_container> rot_angle = <rot> time = <rand_time> motion = ease_out
	RunScriptOnScreenElement id = <physics_container> check_screen_collisions params = {id = <physics_container> top_offset = -100 bottom_offset = 300}
	<i> = (<i> + 1)
	repeat <exploding_text_array_size>
endscript

script do_exploding_text_particle_physics 
	<force_pos> = (640.0, 320.0)
	<explode_const> = 10
	<i> = 0
	begin
	FormatText checksumname = particle_id 'particle_%i' i = <i>
	SetScreenElementProps id = <particle_id> alpha = 1.0 time = 0.05
	SetScreenElementProps id = <particle_id> scale = 2.0 relative_scale time = 0.1
	GetScreenElementProps id = <particle_id>
	SetScreenElementProps id = <particle_id> apply_gravity = true
	<Force> = (<Pos> - <force_pos>)
	normalize_vector vect = <Force>
	<particle_id> :ApplyForce Force = (<vect> * <explode_const>)
	RunScriptOnScreenElement id = <particle_id> check_screen_collisions params = {id = <particle_id> top_offset = -100 bottom_offset = 200}
	<i> = (<i> + 1)
	repeat ($num_exploding_particles)
	<i> = 0
	begin
	FormatText checksumname = particle_id 'particle_%i' i = <i>
	GetRandomValue \{a = 0.1
		b = 3.0
		name = rand_time}
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
			type = TextElement
			parent = root_window
			text = <text>
			font = (<flags>.font)
			scale = (<flags>.scale)
		}
		GetScreenElementDims id = <id>
		StringLength string = <text>
		avg_width = (<width> / <str_len>)
		<fudge_factor> = 10
		avg_width = (<avg_width> + <fudge_factor>)
		fit_scale = ((<fit_dims>.(1.0, 0.0)) / (<str_len> * <avg_width>))
		if GotParam \{old_scale}
			if (<fit_scale> > 1.6)
				<fit_scale> = 1.0
			elseif (<fit_scale> < 0.625)
				<fit_scale> = 0.625
			endif
		else
			if (<fit_scale> > 2.0)
				<fit_scale> = 2.0
			elseif (<fit_scale> < 0.55)
				<fit_scale> = 0.55
			endif
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
		<space_between> = ((<avg_width> * <fit_scale>) * (0.9, 0.0))
		destroy_menu menu_id = <id>
	endif
	if GotParam \{centered}
		half_width = ((<array_size> - 1) * (<space_between>.(1.0, 0.0)) * 0.5)
		<text_pos> = (<text_pos> - <half_width> * (1.0, 0.0))
	endif
	FormatText checksumname = cont_id '%p' p = <parent>
	CreateScreenElement {
		type = ContainerElement
		id = <cont_id>
		parent = root_window
		Pos = <cont_pos>
	}
	Change g_exploding_text_main_id = <cont_id>
	i = 0
	begin
	FormatText checksumname = physics_container '%p_%i' p = <parent> i = <i>
	CreateScreenElement {
		type = PhysicsElement
		id = <physics_container>
		parent = <cont_id>
		Pos = <text_pos>
		center = (640.0, 290.0)
		radius = 85.5
		elasticity = -0.25
		elasticity = 0.3
		just = <just>
	}
	CreateScreenElement {
		type = TextElement
		parent = <physics_container>
		Pos = (0.0, 0.0)
		text = (<char_array> [<i>])
		<flags>
		scale = (<flags>.scale * <fit_scale>)
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
		type = TextElement
		parent = <physics_container>
		text = (<char_array> [<i>])
		<flags>
		z_priority = (<flags>.z_priority - 2)
		rgba = [10 10 10 150]
		just = [center center]
		Pos = (3.0, 4.0)
		scale = (<flags>.scale * <fit_scale>)
	}
	<text_pos> = (<text_pos> + <space_between>)
	<i> = (<i> + 1)
	repeat <array_size>
	return exploding_text_array_size = <array_size>
endscript
