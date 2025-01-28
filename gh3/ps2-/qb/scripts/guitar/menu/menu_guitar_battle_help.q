battle_explanation_color_white = [
	245
	220
	200
	255
]
battle_explanation_color_yellow = [
	237
	169
	0
	255
]
battle_explanation_bullet_materials = [
	sys_battlegem_green01_sys_battlegem_green01
	sys_battlegem_red01_sys_battlegem_red01
	sys_battlegem_yellow01_sys_battlegem_yellow01
	sys_battlegem_blue01_sys_battlegem_blue01
	sys_battlegem_orange01_sys_battlegem_orange01
]
battle_explanation_text = {
	bossslash = {
		image = battle_help_boss_bg_slash
		title = 'SLASH WANTS TO BATTLE!'
		bullets = [
			{
				text = 'Instead of Star Power, you get BATTLE POWER'
			}
			{
				text = 'Hit the BATTLE GEMS to get a POWER-UP'
			}
			{
				text = 'Tilt your guitar upward to attack Slash and make him miss'
			}
			{
				text = 'You HAVE to make him FAIL before the end or else YOU LOSE'
			}
			{
				text = 'Be careful, he can battle back'
			}
		]
		prompt = 'Ready to Rock?'
	}
	bosstom = {
		image = battle_help_boss_bg_morello
		title = 'MORELLO CHALLENGES YOU!'
		bullets = [
			{
				text = 'Instead of Star Power, you get BATTLE POWER'
			}
			{
				text = 'Hit the BATTLE GEMS to get a POWER-UP'
			}
			{
				text = 'Tilt your guitar upward to attack Tom and make him miss'
			}
			{
				text = 'You HAVE to make him FAIL before the end or else YOU LOSE'
			}
			{
				text = 'Be careful, he can battle back'
			}
		]
		prompt = 'Ready to Rock?'
	}
	bossdevil = {
		image = battle_help_boss_bg_satan
		title = 'ALL RIGHT, THIS IS IT!'
		bullets = [
			{
				text = 'Instead of Star Power, you get BATTLE POWER'
			}
			{
				text = 'Hit the BATTLE GEMS to get a POWER-UP'
			}
			{
				text = 'Tilt your guitar upward to attack Lou and make him miss'
			}
			{
				text = 'You HAVE to make him FAIL before the end or else YOU LOSE'
			}
			{
				text = 'Be careful, he can battle back'
			}
		]
		prompt = 'Ready to Rock?'
	}
	generic = {
		title = 'BATTLE MODE!'
		bullets = [
			{
				text = 'Instead of Star Power, you get BATTLE POWER'
			}
			{
				text = 'Hit the BATTLE GEMS to get a POWER-UP'
			}
			{
				text = 'Tilt your guitar upward to attack the other player and make them miss'
			}
			{
				text = 'You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH'
			}
			{
				text = 'In SUDDEN DEATH all the power-ups become the devastating DEATH DRAIN'
			}
		]
		prompt = 'Ready to Rock?'
	}
}
0x4ec0e934 = 0

script create_battle_helper_menu \{device_num = 0
		popup = 0}
	change \{0x4ec0e934 = 0}
	if gameispaused
		unpausegame
	endif
	if gotparam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.generic)
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
	createscreenelement \{type = spriteelement
		parent = battle_explanation_container
		id = battle_explanation_screen
		pos = (640.0, 360.0)
		texture = battle_help_bg
		rgba = [
			223
			223
			223
			255
		]
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = 0}
	0xfd47a8b2 = (480.0, 0.0)
	if ($game_mode = p2_battle)
		createscreenelement \{parent = battle_explanation_container
			type = vmenu
			id = bullet_spacer
			pos = (345.0, 205.0)
			just = [
				left
				top
			]
			internal_just = [
				left
				top
			]}
		0xfd47a8b2 = (680.0, 0.0)
	else
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
	endif
	wait \{0.5
		seconds}
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
		dims = <0xfd47a8b2>
		pos = (0.0, 0.0)
		allow_expansion
		rgba = $battle_explanation_color_white
		z_priority = 50
		line_spacing = 0.9
		font = text_a4
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.8
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
		pos = (0.0, 0.0)
		scale = (0.27, 0.27)
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
		use_animated_uvs = true
		num_uv_frames = (2.0, 4.0)
		frame_length = 0.0
	}
	runscriptonscreenelement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
	if isps3
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
	if ($game_mode = p2_battle)
		<title_offset> = (-130.0, -30.0)
	else
		<title_offset> = (-10.0, -30.0)
	endif
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
	createscreenelement {
		type = textelement
		parent = battle_explanation_container
		id = who_wants_to_battle_text
		text = (<boss_structure>.title)
		font = text_a10
		scale = 1
		pos = ((775.0, 130.0) + <title_offset>)
		rgba = [237 169 0 255]
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
		exclusive_device = ($primary_controller)
	}
	displaytext {
		parent = bullet_spacer
		text = (<boss_structure>.prompt)
		font = text_a4
		scale = 1.1
		pos = (575.0, 580.0)
		rgba = [237 169 0 255]
		just = [left top]
		z = 50
	}
	runscriptonscreenelement id = <id> wait_and_show_ready
	launchevent \{type = focus
		target = who_wants_to_battle_text}
	add_user_control_helper \{text = 'BATTLE'
		button = green
		z = 100}
	add_user_control_helper \{text = 'DECLINE'
		button = red
		z = 100}
endscript

script battle_helper_continue 
	if ($0x4ec0e934 = 0)
		change \{0x4ec0e934 = 1}
		waitonegameframe
		ui_flow_manager_respond_to_action action = continue device_num = <device_num>
	endif
endscript

script battle_helper_back 
	if ($0x4ec0e934 = 0)
		change \{0x4ec0e934 = 1}
		waitonegameframe
		if ($game_mode = p1_career)
			writeachievements \{achievement = wuss_out}
		endif
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script destroy_battle_helper_menu 
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
	wait (<idx> * 0.6) seconds
	<gem_id> :getprops
	<gem_final_pos> = <pos>
	soundevent \{event = gh3_star_flyin}
	<gem_id> :domorph pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :domorph pos = <gem_final_pos> time = 0.55 motion = ease_in
	<text_id> :domorph time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :domorph time = 0.1 motion = ease_out rgba = $battle_explanation_color_white
endscript

script wait_and_show_ready 
	domorph \{alpha = 0}
	wait \{3.8
		seconds}
	domorph \{time = 0.2
		motion = ease_in
		rgba = [
			255
			255
			255
			255
		]
		alpha = 1}
	domorph \{time = 0.1
		motion = ease_in
		rgba = $battle_explanation_color_yellow}
endscript
