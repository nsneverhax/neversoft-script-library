gbh_first_time_in = 1
battle_explanation_bullet_materials = [
	mat_battle_green
	mat_battle_red
	mat_battle_yellow
	mat_battle_blue
	mat_battle_orange
]
battle_explanation_text = {
	bosszakk = {
		image = battle_help_boss_bg_zakk
		title = qs(0xed85f5af)
		gem_texture = icon_gig_wylde
		bullets = [
			{
				text = qs(0x3e8d7a28)
			}
			{
				text = qs(0x461f8ed5)
			}
			{
				text = qs(0x07b3efe7)
			}
			{
				text = qs(0xb5b8fcb3)
			}
		]
		prompt = qs(0x816ad59e)
	}
	bossted = {
		image = battle_help_boss_bg_nugent
		title = qs(0xed85f5af)
		gem_texture = icon_gig_nugent
		bullets = [
			{
				text = qs(0x5112f6e1)
			}
			{
				text = qs(0xc8dd473f)
			}
			{
				text = qs(0x25fbdd8d)
			}
			{
				text = qs(0xed0fdc1f)
			}
		]
		prompt = qs(0x816ad59e)
	}
	generic = {
		title = qs(0x01f891e7)
		gem_texture = battle_material
		bullets = [
			{
				text = qs(0x56014da8)
			}
			{
				text = qs(0xc059dc09)
			}
			{
				text = qs(0x50291e58)
			}
			{
				text = qs(0x2d76adbc)
			}
		]
		prompt = qs(0x816ad59e)
	}
}

script create_battle_helper_menu \{device_num = 0
		popup = 0}
	if gameispaused
		unpausegame
	endif
	<bg_texture> = battle_mode_bg
	if gotparam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.generic)
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
			<bg_texture> = ($battle_explanation_text.<boss>.image)
		endif
	else
		getglobaltags \{progression}
		<boss_structure> = ($battle_explanation_text.generic)
	endif
	menu_z = 10
	createscreenelement \{type = containerelement
		parent = root_window
		id = battle_explanation_container}
	createscreenelement \{parent = battle_explanation_container
		type = vmenu
		id = bullet_spacer
		pos = (685.0, 205.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]}
	getarraysize \{$battle_explanation_bullet_materials}
	<num_materials> = <array_size>
	getarraysize (<boss_structure>.bullets)
	<num_bullets> = <array_size>
	<i> = 0
	begin
	createscreenelement \{parent = bullet_spacer
		type = containerelement
		dims = (100.0, 100.0)
		just = [
			left
			top
		]}
	<container_id> = <id>
	createscreenelement {
		parent = <container_id>
		type = textblockelement
		text = (<boss_structure>.bullets [<i>].text)
		local_id = text
		dims = (480.0, 0.0)
		pos = (0.0, 0.0)
		allow_expansion
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 50
		line_spacing = 0.9
		font = fontgrid_text_a8
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.625
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		alpha = 0
	}
	getscreenelementdims id = <id>
	<container_id> :se_setprops dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (0.0, 20.0))
	if (<boss_structure>.gem_texture = battle_material)
		mod a = <i> b = <num_materials>
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			pos = (-10.0, 7.0)
			scale = 0.5
			material = (($battle_explanation_bullet_materials) [<mod>])
			alpha = 0
			materialprops = [
				{
					name = m_startfade
					property = 1.0
				}
				{
					name = m_endfade
					property = 1.0
				}
				{
					name = m_playerindex
					property = 1.0
				}
			]
		}
	else
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			texture = (<boss_structure>.gem_texture)
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			pos = (-10.0, 0.0)
			relative_scale
			scale = 1.6
			alpha = 0
		}
	endif
	runscriptonscreenelement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
	if isps3
		setprojectspecificspriteparams \{highwaystartfade = 1.0
			highwayendfade = 1.0}
	endif
	if structurecontains \{structure = boss_structure
			image}
		createscreenelement {
			type = spriteelement
			id = who_wants_to_battle_image
			parent = battle_explanation_container
			rgba = [255 255 255 255]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			texture = (<boss_structure>.image)
			just = [center center]
			z_priority = 5
			alpha = 1
		}
	endif
	<title_offset> = (-10.0, -20.0)
	createscreenelement {
		type = spriteelement
		parent = battle_explanation_container
		pos = ((910.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		texture = battle_help_flourish
		just = [center bottom]
		z_priority = 50
		alpha = 0.5
	}
	createscreenelement {
		type = spriteelement
		parent = battle_explanation_container
		pos = ((910.0, 145.0) + <title_offset>)
		dims = (384.0, 96.0)
		texture = battle_help_flourish
		just = [center top]
		z_priority = 50
		alpha = 0.5
		flip_h
	}
	if ($game_mode = p2_faceoff ||
			$game_mode = p2_pro_faceoff ||
			$game_mode = p2_battle ||
			$game_mode = p2_quickplay)
		exclusive_mp_controllers = [0 , 0]
		setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
		setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
		exclusive_device = <exclusive_mp_controllers>
	else
		exclusive_device = ($primary_controller)
	endif
	createscreenelement {
		type = textelement
		parent = battle_explanation_container
		id = who_wants_to_battle_text
		text = (<boss_structure>.title)
		font = fontgrid_text_a10
		scale = 0.5
		pos = ((910.0, 100.0) + <title_offset>)
		rgba = [80 200 140 255]
		just = [center top]
		z_priority = 51
		font_spacing = 5
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue params = {device_num = <device_num>}}
			{pad_back battle_helper_back}
		]
		exclusive_device = <exclusive_device>
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((530.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	createscreenelement {
		type = textelement
		parent = bullet_spacer
		text = (<boss_structure>.prompt)
		font = fontgrid_text_a8
		scale = 0.7
		pos = (715.0, 580.0)
		rgba = [80 200 140 255]
		just = [left top]
		z_priority = 50
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).black)
		alpha = 0
	}
	runscriptonscreenelement id = <id> wait_and_show_ready
	if ($gbh_first_time_in = 0)
		launchevent \{type = focus
			target = who_wants_to_battle_text}
		set_user_control_color \{text_rgba = [
				200
				200
				200
				255
			]
			bg_rgba = [
				0
				0
				0
				200
			]}
		add_user_control_helper \{text = qs(0x33b59779)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x0bbc9ad9)
			button = red
			z = 100}
	endif
endscript

script battle_helper_continue 
	playsound \{guitar_select_affirmation_1
		vol = -5
		buss = front_end}
	spawnscriptnow \{crowd_sustain_boss_battle}
	se_setprops \{block_events}
	change \{is_changing_levels = 1}
	restart_song
	change \{is_changing_levels = 0}
	generic_event_back \{state = uistate_gameplay}
endscript

script battle_helper_back 
	soundevent \{event = menu_warning_sfx_softer}
	soundevent \{event = crowd_fail_song_sfx_softer}
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend_menu_music}
	if ($game_mode = p1_career)
		writeachievements \{achievement = wuss_out}
	endif
	generic_event_back \{state = uistate_gig_posters}
endscript

script destroy_battle_helper_menu 
	if ($gbh_first_time_in = 1)
		change \{gbh_first_time_in = 0}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = battle_explanation_container}
endscript

script battle_fly_in_anim 
	resolvescreenelementid id = {<container_id> child = text}
	<text_id> = <resolved_id>
	resolvescreenelementid id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	wait \{0.15
		seconds}
	wait (<idx> * 2.25) seconds
	<gem_id> :se_getprops
	<gem_final_pos> = <pos>
	<gem_id> :se_setprops pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :se_setprops pos = <gem_final_pos> time = 0.35000002 motion = ease_in
	<text_id> :se_setprops time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :se_waitprops
	<text_id> :se_setprops time = 0.1 motion = ease_out rgba = (($g_menu_colors).lt_violet_grey)
	spawnscriptnow \{boss_battle_whoosh_sound}
endscript

script wait_and_show_ready 
	<time> = 9.8
	if ($gbh_first_time_in = 1)
		se_setprops \{alpha = 0}
		wait \{4
			seconds}
		launchevent \{type = focus
			target = who_wants_to_battle_text}
		wait (<time> - 4.0) seconds
		soundevent \{event = boss_battle_press_sound}
		se_setprops \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		se_waitprops
		se_setprops \{time = 0.1
			motion = ease_in
			rgba = [
				80
				200
				140
				255
			]}
		set_user_control_color \{text_rgba = [
				0
				0
				0
				255
			]
			bg_rgba = [
				180
				180
				180
				255
			]}
		add_user_control_helper \{text = qs(0x33b59779)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x0bbc9ad9)
			button = red
			z = 100}
	else
		wait <time> seconds
		soundevent \{event = boss_battle_press_sound}
		se_setprops \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		se_waitprops
		se_setprops \{time = 0.1
			motion = ease_in
			rgba = [
				80
				200
				140
				255
			]}
	endif
endscript
