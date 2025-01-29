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
	sys_BattleGEM_Green01_sys_BattleGEM_Green01
	sys_BattleGEM_RED01_sys_BattleGEM_RED01
	sys_BattleGEM_Yellow01_sys_BattleGEM_Yellow01
	sys_BattleGEM_Blue01_sys_BattleGEM_Blue01
	sys_BattleGEM_Orange01_sys_BattleGEM_Orange01
]
battle_explanation_text = {
	bossjoe = {
		image = battle_help_boss_bg_jperry
		title = 'JOE PERRY WANTS TO BATTLE!'
		bullets = [
			{
				text = 'Hit each series of BATTLE GEMS to collect ATTACKS'
			}
			{
				text = 'Once you have collected an ATTACK, Tilt your guitar upward to disrupt Joe and make him miss'
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
	Generic = {
		title = 'BATTLE MODE!'
		bullets = [
			{
				text = 'Hit each series of BATTLE GEMS to collect ATTACKS'
			}
			{
				text = 'Once you have collected an ATTACK, Tilt your guitar upward to disrupt your opponent and make them miss'
			}
			{
				text = 'You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH'
			}
			{
				text = 'In SUDDEN DEATH all the ATTACKS become the devastating DEATH DRAIN'
			}
		]
		prompt = 'Ready to Rock?'
	}
}
0x4ec0e934 = 0

script create_battle_helper_menu \{device_num = 0
		popup = 0}
	Change \{0x4ec0e934 = 0}
	if GameIsPaused
		UnPauseGame
	endif
	<bg_texture> = battle_help_boss_bg_jperry
	if GotParam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.Generic)
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
		endif
	else
		GetGlobalTags \{Progression}
		<boss_structure> = ($battle_explanation_text.<boss_song>)
	endif
	menu_z = 10
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = battle_explanation_container}
	CreateScreenElement {
		Type = SpriteElement
		parent = battle_explanation_container
		id = battle_explanation_screen
		Pos = (640.0, 360.0)
		texture = <bg_texture>
		rgba = [223 223 223 255]
		just = [center center]
		dims = (1280.0, 720.0)
		z_priority = 0
	}
	0xfd47a8b2 = (480.0, 0.0)
	if ($game_mode = p2_battle)
		CreateScreenElement \{parent = battle_explanation_container
			Type = VMenu
			id = bullet_spacer
			Pos = (345.0, 205.0)
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
		CreateScreenElement \{parent = battle_explanation_container
			Type = VMenu
			id = bullet_spacer
			Pos = (545.0, 205.0)
			just = [
				left
				top
			]
			internal_just = [
				left
				top
			]}
	endif
	Wait \{0.5
		Seconds}
	GetArraySize \{$battle_explanation_bullet_materials}
	<num_materials> = <array_Size>
	GetArraySize (<boss_structure>.bullets)
	<num_bullets> = <array_Size>
	<i> = 0
	begin
	CreateScreenElement \{parent = bullet_spacer
		Type = ContainerElement
		dims = (100.0, 100.0)
		just = [
			left
			top
		]}
	<container_id> = <id>
	CreateScreenElement {
		parent = <container_id>
		Type = TextBlockElement
		text = (<boss_structure>.bullets [<i>].text)
		local_id = text
		dims = <0xfd47a8b2>
		Pos = (0.0, 0.0)
		allow_expansion
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 50
		line_spacing = 0.9
		font = text_a4
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.8
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		alpha = 0
	}
	GetScreenElementDims id = <id>
	<container_id> :SetProps dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (0.0, 20.0))
	Mod a = <i> b = <num_materials>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		rgba = [255 255 255 255]
		just = [right top]
		z_priority = 40
		local_id = gem
		Pos = (0.0, 0.0)
		Scale = (0.27, 0.27)
		material = ($battle_explanation_bullet_materials [<Mod>])
		alpha = 0
		MaterialProps = [
			{
				Name = m_startFade
				property = 1.0
			}
			{
				Name = m_endFade
				property = 1.0
			}
			{
				Name = m_playerIndex
				property = 1.0
			}
		]
		use_animated_uvs = true
		num_uv_frames = (2.0, 4.0)
		frame_length = 0.0
	}
	RunScriptOnScreenElement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
	if isps3
		Change \{gHighwayStartFade = 1.0}
		Change \{gHighwayEndFade = 1.0}
	endif
	if StructureContains \{structure = boss_structure
			image}
		CreateScreenElement {
			Type = SpriteElement
			id = who_wants_to_battle_image
			parent = battle_explanation_container
			rgba = [255 255 255 255]
			Pos = (640.0, 360.0)
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
	displaySprite {
		parent = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		just = [center bottom]
		z = 50
	}
	<id> :DoMorph alpha = 0.5
	displaySprite {
		parent = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 145.0) + <title_offset>)
		just = [center top]
		dims = (384.0, 96.0)
		z = 50
		flip_h
	}
	<id> :DoMorph alpha = 0.5
	if ($game_mode = p2_faceoff ||
			$game_mode = p2_pro_faceoff ||
			$game_mode = p2_battle ||
			$game_mode = p2_quickplay)
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
		exclusive_device = <exclusive_mp_controllers>
	else
		exclusive_device = ($primary_controller)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = battle_explanation_container
		id = who_wants_to_battle_text
		text = (<boss_structure>.title)
		font = text_a10
		Scale = 1
		Pos = ((775.0, 130.0) + <title_offset>)
		rgba = (($g_menu_colors).pink)
		just = [center top]
		z_priority = 51
		font_spacing = 5
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue params = {device_num = <device_num>}}
			{pad_back battle_helper_back}
		]
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		Type = TextElement
		parent = bullet_spacer
		text = (<boss_structure>.prompt)
		font = text_a4
		Scale = 1.1
		Pos = (575.0, 580.0)
		rgba = (($g_menu_colors).black)
		just = [left top]
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).lt_violet_grey)
		alpha = 0
	}
	RunScriptOnScreenElement id = <id> wait_and_show_ready
	LaunchEvent \{Type = focus
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
		Change \{0x4ec0e934 = 1}
		WaitOneGameFrame
		ui_flow_manager_respond_to_action action = continue device_num = <device_num>
	endif
endscript

script battle_helper_back 
	if ($0x4ec0e934 = 0)
		Change \{0x4ec0e934 = 1}
		WaitOneGameFrame
		if ($game_mode = p1_career)
			WriteAchievements \{achievement = wuss_out}
		endif
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script destroy_battle_helper_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = battle_explanation_container}
endscript

script battle_fly_in_anim 
	ResolveScreenElementID id = {<container_id> child = text}
	<text_id> = <resolved_id>
	ResolveScreenElementID id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	Wait \{0.15
		Seconds}
	Wait (<idx> * 0.6) Seconds
	<gem_id> :GetProps
	<gem_final_pos> = <Pos>
	SoundEvent \{event = GH3_Star_FlyIn}
	<gem_id> :DoMorph Pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :DoMorph Pos = <gem_final_pos> time = 0.55 motion = ease_in
	<text_id> :DoMorph time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :DoMorph time = 0.1 motion = ease_out rgba = $battle_explanation_color_white
endscript

script wait_and_show_ready 
	DoMorph \{alpha = 0}
	Wait \{3.8
		Seconds}
	DoMorph \{time = 0.2
		motion = ease_in
		rgba = [
			255
			255
			255
			255
		]
		alpha = 1}
	DoMorph \{time = 0.1
		motion = ease_in
		rgba = $battle_explanation_color_yellow}
endscript
