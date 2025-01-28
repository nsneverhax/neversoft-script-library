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
	bossslash = {
		image = battle_help_boss_bg_slash
		Title = "SLASH WANTS TO BATTLE!"
		bullets = [
			{
				Text = "Instead of Star Power, you get BATTLE POWER"
			}
			{
				Text = "Hit the BATTLE GEMS to get a POWER-UP"
			}
			{
				Text = "Tilt your guitar upward to attack Slash and make him miss"
			}
			{
				Text = "You HAVE to make him FAIL before the end or else YOU LOSE"
			}
			{
				Text = "Be careful, he can battle back"
			}
		]
		prompt = "Ready to Rock?"
	}
	bosstom = {
		image = battle_help_boss_bg_morello
		Title = "MORELLO CHALLENGES YOU!"
		bullets = [
			{
				Text = "Instead of Star Power, you get BATTLE POWER"
			}
			{
				Text = "Hit the BATTLE GEMS to get a POWER-UP"
			}
			{
				Text = "Tilt your guitar upward to attack Tom and make him miss"
			}
			{
				Text = "You HAVE to make him FAIL before the end or else YOU LOSE"
			}
			{
				Text = "Be careful, he can battle back"
			}
		]
		prompt = "Ready to Rock?"
	}
	bossdevil = {
		image = battle_help_boss_bg_satan
		Title = "ALL RIGHT, THIS IS IT!"
		bullets = [
			{
				Text = "Instead of Star Power, you get BATTLE POWER"
			}
			{
				Text = "Hit the BATTLE GEMS to get a POWER-UP"
			}
			{
				Text = "Tilt your guitar upward to attack Lou and make him miss"
			}
			{
				Text = "You HAVE to make him FAIL before the end or else YOU LOSE"
			}
			{
				Text = "Be careful, he can battle back"
			}
		]
		prompt = "Ready to Rock?"
	}
	Generic = {
		Title = "BATTLE MODE!"
		bullets = [
			{
				Text = "Instead of Star Power, you get BATTLE POWER"
			}
			{
				Text = "Hit the BATTLE GEMS to get a POWER-UP"
			}
			{
				Text = "Tilt your guitar upward to attack the other player and make them miss"
			}
			{
				Text = "You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH"
			}
			{
				Text = "In SUDDEN DEATH all the power-ups become the devastating DEATH DRAIN"
			}
		]
		prompt = "Ready to Rock?"
	}
}

script create_battle_helper_menu \{device_num = 0
		Popup = 0}
	if GameIsPaused
		UnPauseGame
	endif
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
		PARENT = root_window
		Id = battle_explanation_container}
	CreateScreenElement \{Type = SpriteElement
		PARENT = battle_explanation_container
		Id = battle_explanation_screen
		Pos = (640.0, 360.0)
		texture = battle_help_bg
		rgba = [
			223
			223
			223
			255
		]
		just = [
			Center
			Center
		]
		Dims = (1280.0, 720.0)
		z_priority = 0}
	CreateScreenElement \{PARENT = battle_explanation_container
		Type = VMenu
		Id = bullet_spacer
		Pos = (545.0, 205.0)
		just = [
			LEFT
			Top
		]
		internal_just = [
			LEFT
			Top
		]}
	GetArraySize \{$battle_explanation_bullet_materials}
	<num_materials> = <array_Size>
	GetArraySize (<boss_structure>.bullets)
	<num_bullets> = <array_Size>
	<I> = 0
	begin
	CreateScreenElement \{PARENT = bullet_spacer
		Type = ContainerElement
		Dims = (100.0, 100.0)
		just = [
			LEFT
			Top
		]}
	<container_id> = <Id>
	CreateScreenElement {
		PARENT = <container_id>
		Type = TextBlockElement
		Text = (<boss_structure>.bullets [<I>].Text)
		local_id = Text
		Dims = (480.0, 0.0)
		Pos = (0.0, 0.0)
		allow_expansion
		rgba = $battle_explanation_color_white
		z_priority = 50
		line_spacing = 0.9
		font = text_a4
		just = [LEFT Top]
		internal_just = [LEFT Top]
		internal_scale = 0.625
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		Alpha = 0
	}
	GetScreenElementDims Id = <Id>
	<container_id> :SetProps Dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height> + (0.0, 20.0))
	Mod A = <I> B = <num_materials>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <container_id>
		rgba = [255 255 255 255]
		just = [RIGHT Top]
		z_priority = 40
		local_id = gem
		Pos = (12.0, 7.0)
		Scale = 0.5
		Material = ($battle_explanation_bullet_materials [<Mod>])
		Alpha = 0
		MaterialProps = [
			{
				Name = m_startFade
				Property = 1.0
			}
			{
				Name = m_endFade
				Property = 1.0
			}
			{
				Name = m_playerIndex
				Property = 1.0
			}
		]
	}
	RunScriptOnScreenElement Id = <container_id> battle_fly_in_anim Params = {idx = <I> container_id = <container_id>}
	<I> = (<I> + 1)
	repeat <num_bullets>
	if ISPS3
		Change \{gHighwayStartFade = 1.0}
		Change \{gHighwayEndFade = 1.0}
	endif
	if StructureContains \{Structure = boss_structure
			image}
		CreateScreenElement {
			Type = SpriteElement
			Id = who_wants_to_battle_image
			PARENT = battle_explanation_container
			rgba = [255 255 255 255]
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			texture = (<boss_structure>.image)
			just = [Center Center]
			z_priority = 5
			Alpha = 1
		}
	endif
	<title_offset> = (-10.0, -20.0)
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 165.0) + <title_offset>)
		Dims = (384.0, 96.0)
		just = [Center Bottom]
		Z = 50
	}
	<Id> :DoMorph Alpha = 0.5
	displaySprite {
		PARENT = battle_explanation_container
		tex = battle_help_flourish
		Pos = ((770.0, 145.0) + <title_offset>)
		just = [Center Top]
		Dims = (384.0, 96.0)
		Z = 50
		flip_h
	}
	<Id> :DoMorph Alpha = 0.5
	CreateScreenElement {
		Type = TextElement
		PARENT = battle_explanation_container
		Id = who_wants_to_battle_text
		Text = (<boss_structure>.Title)
		font = text_a10
		Scale = 1
		Pos = ((770.0, 120.0) + <title_offset>)
		rgba = [237 169 0 255]
		just = [Center Top]
		z_priority = 51
		font_spacing = 5
		Shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue Params = {device_num = <device_num>}}
			{pad_back battle_helper_back}
		]
		exclusive_device = ($primary_controller)
	}
	displayText {
		PARENT = bullet_spacer
		Text = (<boss_structure>.prompt)
		font = text_a4
		Scale = 0.7
		Pos = (575.0, 580.0)
		rgba = [237 169 0 255]
		just = [LEFT Top]
		Z = 50
	}
	RunScriptOnScreenElement Id = <Id> wait_and_show_ready
	LaunchEvent \{Type = Focus
		Target = who_wants_to_battle_text}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{Text = "BATTLE"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "DECLINE"
		button = RED
		Z = 100}
endscript

script battle_helper_continue 
	ui_flow_manager_respond_to_action action = Continue device_num = <device_num>
endscript

script battle_helper_back 
	if ($game_mode = p1_career)
		WriteAchievements \{Achievement = WUSS_OUT}
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script destroy_battle_helper_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = battle_explanation_container}
endscript

script battle_fly_in_anim 
	ResolveScreenElementID Id = {<container_id> child = Text}
	<text_id> = <resolved_id>
	ResolveScreenElementID Id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	Wait \{0.15
		Seconds}
	Wait (<idx> * 0.4) Seconds
	<gem_id> :GetProps
	<gem_final_pos> = <Pos>
	SoundEvent \{Event = GH3_Star_FlyIn}
	<gem_id> :DoMorph Pos = (<gem_final_pos> + (-600.0, 0.0)) Alpha = 1
	<gem_id> :DoMorph Pos = <gem_final_pos> Time = 0.35000002 Motion = ease_in
	<text_id> :DoMorph Time = 0.2 Motion = ease_in rgba = [255 255 255 255] Alpha = 1
	<text_id> :DoMorph Time = 0.1 Motion = ease_out rgba = $battle_explanation_color_white
endscript

script wait_and_show_ready 
	DoMorph \{Alpha = 0}
	Wait \{2.8
		Seconds}
	DoMorph \{Time = 0.2
		Motion = ease_in
		rgba = [
			255
			255
			255
			255
		]
		Alpha = 1}
	DoMorph \{Time = 0.1
		Motion = ease_in
		rgba = $battle_explanation_color_yellow}
endscript
