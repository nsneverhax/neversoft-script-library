gbh_first_time_in = 1
battle_explanation_bullet_materials = [
	sys_battlegem_green01_sys_battlegem_green01
	sys_battlegem_red01_sys_battlegem_red01
	sys_battlegem_yellow01_sys_battlegem_yellow01
	sys_battlegem_blue01_sys_battlegem_blue01
	sys_battlegem_orange01_sys_battlegem_orange01
]
battle_explanation_text = {
	bossjoe = {
		image = battle_help_boss_bg_jperry
		title = "JOE PERRY WANTS TO BATTLE!"
		bullets = [
			{
				text = "Hit each series of BATTLE GEMS to collect ATTACKS"
			}
			{
				text = "Once you have collected an ATTACK, Tilt your guitar upward to disrupt Joe and make him miss"
			}
			{
				text = "You HAVE to make him FAIL before the end or else YOU LOSE"
			}
			{
				text = "Be careful, he can battle back"
			}
		]
		prompt = "Ready to Rock?"
	}
	generic = {
		title = "BATTLE MODE!"
		bullets = [
			{
				text = "Hit each series of BATTLE GEMS to collect ATTACKS"
			}
			{
				text = "Once you have collected an ATTACK, Tilt your guitar upward to disrupt your opponent and make them miss"
			}
			{
				text = "You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH"
			}
			{
				text = "In SUDDEN DEATH all the ATTACKS become the devastating DEATH DRAIN"
			}
		]
		prompt = "Ready to Rock?"
	}
}

script create_battle_helper_menu \{device_num = 0
		popup = 0}
	if gameispaused
		unpausegame
	endif
	<bg_texture> = battle_help_boss_bg_jperry
	if gotparam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.generic)
			<bg_texture> = battle_mode_bg
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
		endif
	else
		getglobaltags \{progression}
		<boss_structure> = ($battle_explanation_text.<boss_song>)
	endif
	menu_z = 10
	createscreenelement \{type = containerelement
		parent = root_window
		id = battle_explanation_container}
	createscreenelement {
		type = spriteelement
		parent = battle_explanation_container
		id = battle_explanation_screen
		pos = (640.0, 360.0)
		texture = <bg_texture>
		rgba = [223 223 223 255]
		just = [center center]
		dims = (1280.0, 720.0)
		z_priority = 0
	}
	createscreenelement \{parent = battle_explanation_container
		type = vmenu
		id = bullet_spacer
		pos = (545.0, 205.0)
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
		font = text_a4
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.625
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		alpha = 0
	}
	getscreenelementdims id = <id>
	<container_id> :setprops dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (0.0, 20.0))
	mod a = <i> b = <num_materials>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		rgba = [255 255 255 255]
		just = [right top]
		z_priority = 40
		local_id = gem
		pos = (12.0, 7.0)
		scale = 0.5
		material = ($battle_explanation_bullet_materials [<mod>])
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
	runscriptonscreenelement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
	if isps3
		change \{ghighwaystartfade = 1.0}
		change \{ghighwayendfade = 1.0}
	endif
	if iswinport
		change \{ghighwaystartfade = 1.0}
		change \{ghighwayendfade = 1.0}
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
	displaysprite {
		parent = battle_explanation_container
		tex = battle_help_flourish
		pos = ((770.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		just = [center bottom]
		z = 50
	}
	<id> :domorph alpha = 0.5
	displaysprite {
		parent = battle_explanation_container
		tex = battle_help_flourish
		pos = ((770.0, 145.0) + <title_offset>)
		just = [center top]
		dims = (384.0, 96.0)
		z = 50
		flip_h
	}
	<id> :domorph alpha = 0.5
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
		font = text_a10
		scale = 1
		pos = ((770.0, 120.0) + <title_offset>)
		rgba = (($g_menu_colors).pink)
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
		font = text_a4
		scale = 0.7
		pos = (575.0, 580.0)
		rgba = (($g_menu_colors).black)
		just = [left top]
		z_priority = 50
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
		alpha = 0
	}
	runscriptonscreenelement id = <id> wait_and_show_ready
	if ($gbh_first_time_in = 0)
		launchevent \{type = focus
			target = who_wants_to_battle_text}
		change \{user_control_pill_text_color = [
				0
				0
				0
				255
			]}
		change \{user_control_pill_color = [
				180
				180
				180
				255
			]}
		add_user_control_helper \{text = "BATTLE"
			button = green
			z = 100}
		add_user_control_helper \{text = "DECLINE"
			button = red
			z = 100}
	endif
endscript

script battle_helper_continue 
	ui_flow_manager_respond_to_action action = continue device_num = <device_num>
endscript

script battle_helper_back 
	if ($game_mode = p1_career)
		writeachievements \{achievement = wuss_out}
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
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
	<gem_id> :getprops
	<gem_final_pos> = <pos>
	soundevent \{event = gh3_star_flyin}
	<gem_id> :domorph pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :domorph pos = <gem_final_pos> time = 0.35000002 motion = ease_in
	<text_id> :domorph time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :domorph time = 0.1 motion = ease_out rgba = (($g_menu_colors).lt_violet_grey)
endscript

script wait_and_show_ready 
	<time> = 9.8
	if ($gbh_first_time_in = 1)
		domorph \{alpha = 0}
		wait \{4
			seconds}
		launchevent \{type = focus
			target = who_wants_to_battle_text}
		wait (<time> - 4.0) seconds
		domorph \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		domorph time = 0.1 motion = ease_in rgba = (($g_menu_colors).black)
		change \{user_control_pill_text_color = [
				0
				0
				0
				255
			]}
		change \{user_control_pill_color = [
				180
				180
				180
				255
			]}
		add_user_control_helper \{text = "BATTLE"
			button = green
			z = 100}
		add_user_control_helper \{text = "DECLINE"
			button = red
			z = 100}
	else
		wait <time> seconds
		domorph \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		domorph time = 0.1 motion = ease_in rgba = (($g_menu_colors).black)
	endif
endscript
