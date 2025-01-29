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
	Generic = {
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
	if GameIsPaused
		UnPauseGame
	endif
	<bg_texture> = battle_mode_bg
	if GotParam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.Generic)
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
			<bg_texture> = ($battle_explanation_text.<boss>.image)
		endif
	else
		GetGlobalTags \{Progression}
		<boss_structure> = ($battle_explanation_text.Generic)
	endif
	menu_z = 10
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = battle_explanation_container}
	CreateScreenElement \{parent = battle_explanation_container
		Type = VMenu
		id = bullet_spacer
		Pos = (685.0, 205.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]}
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
		dims = (480.0, 0.0)
		Pos = (0.0, 0.0)
		allow_expansion
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 50
		line_spacing = 0.9
		font = fontgrid_text_a3
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.625
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		alpha = 0
	}
	GetScreenElementDims id = <id>
	<container_id> :se_setprops dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (0.0, 20.0))
	if (<boss_structure>.gem_texture = battle_material)
		Mod a = <i> b = <num_materials>
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			Pos = (-10.0, 7.0)
			Scale = 0.5
			material = (($battle_explanation_bullet_materials) [<Mod>])
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
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			texture = (<boss_structure>.gem_texture)
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			Pos = (-10.0, 0.0)
			relative_scale
			Scale = 1.6
			alpha = 0
		}
	endif
	RunScriptOnScreenElement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
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
	<title_offset> = (-10.0, -20.0)
	CreateScreenElement {
		Type = SpriteElement
		parent = battle_explanation_container
		Pos = ((910.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		texture = battle_help_flourish
		just = [center bottom]
		z_priority = 50
		alpha = 0.5
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = battle_explanation_container
		Pos = ((910.0, 145.0) + <title_offset>)
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
		font = fontgrid_text_a10
		Scale = 0.5
		Pos = ((910.0, 100.0) + <title_offset>)
		rgba = [80 200 140 255]
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
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((530.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	CreateScreenElement {
		Type = TextElement
		parent = bullet_spacer
		text = (<boss_structure>.prompt)
		font = fontgrid_text_a3
		Scale = 0.7
		Pos = (715.0, 580.0)
		rgba = [80 200 140 255]
		just = [left top]
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).black)
		alpha = 0
	}
	RunScriptOnScreenElement id = <id> wait_and_show_ready
	if ($gbh_first_time_in = 0)
		LaunchEvent \{Type = focus
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
	PlaySound \{guitar_select_affirmation_1
		vol = -5
		buss = Front_End}
	SpawnScriptNow \{crowd_sustain_boss_battle}
	se_setprops \{block_events}
	Change \{is_changing_levels = 1}
	restart_song
	Change \{is_changing_levels = 0}
	generic_event_back \{state = Uistate_gameplay}
endscript

script battle_helper_back 
	SoundEvent \{event = menu_warning_sfx_softer}
	SoundEvent \{event = crowd_fail_song_sfx_softer}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = frontend_menu_music}
	generic_event_back \{state = uistate_gig_posters}
endscript

script destroy_battle_helper_menu 
	if ($gbh_first_time_in = 1)
		Change \{gbh_first_time_in = 0}
	endif
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
	Wait (<idx> * 2.25) Seconds
	<gem_id> :se_getprops
	<gem_final_pos> = <Pos>
	<gem_id> :se_setprops Pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :se_setprops Pos = <gem_final_pos> time = 0.35000002 motion = ease_in
	<text_id> :se_setprops time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :se_waitprops
	<text_id> :se_setprops time = 0.1 motion = ease_out rgba = (($g_menu_colors).lt_violet_grey)
	SpawnScriptNow \{boss_battle_whoosh_sound}
endscript

script wait_and_show_ready 
	<time> = 9.8
	if ($gbh_first_time_in = 1)
		se_setprops \{alpha = 0}
		Wait \{4
			Seconds}
		LaunchEvent \{Type = focus
			target = who_wants_to_battle_text}
		Wait (<time> - 4.0) Seconds
		SoundEvent \{event = boss_battle_press_sound}
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
		Wait <time> Seconds
		SoundEvent \{event = boss_battle_press_sound}
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
