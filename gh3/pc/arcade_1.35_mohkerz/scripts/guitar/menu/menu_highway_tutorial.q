menu_highway_tutorial_font = text_a4

script create_highway_tutorial_menu 
	create_menu_backdrop \{texture = boot_usingGuitar_BG}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ht_container
		Pos = (0.0, 0.0)}
	displaySprite \{parent = ht_container
		tex = tut_bg
		Pos = (640.0, 406.0)
		just = [
			center
			center
		]
		z = 1}
	displaySprite \{parent = ht_container
		tex = tut_leftborder
		Pos = (416.0, 194.0)
		Scale = (0.4, 0.4)
		just = [
			center
			center
		]
		z = 2}
	displaySprite \{parent = ht_container
		tex = tut_rightborder
		Pos = (876.0, 196.0)
		Scale = (0.4, 0.4)
		just = [
			center
			center
		]
		z = 2}
	displaySprite \{parent = ht_container
		tex = tut_guitar
		Pos = (578.0, 196.0)
		Scale = (0.4, 0.4)
		just = [
			center
			center
		]
		z = 4}
	displayText \{parent = ht_container
		text = "TUTORIAL"
		Pos = (128.0, 48.0)
		z = 10
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			100
			110
			145
			255
		]
		font = text_a11_Large
		rot = -10
		noshadow}
	displayText \{parent = ht_container
		text = "TUTORIAL"
		Pos = (132.0, 52.0)
		z = 10
		Scale = 1.25
		just = [
			center
			center
		]
		rgba = [
			0
			0
			0
			255
		]
		font = text_a11_Large
		rot = -9
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text1
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text2
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text3
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text4
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text5
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text6
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text7
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text8
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text9
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text10
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text11
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text12
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	displayText \{parent = ht_container
		id = tut_help_text13
		font = text_a4
		rgba = [
			0
			0
			0
			255
		]
		Scale = 0.75
		just = [
			left
			top
		]
		z = 100
		noshadow}
	menu_highway_tutorial_create_fret_finger_sprites
	menu_highway_tutorial_create_strum_sprites
	menu_highway_tutorial_create_gem_sprites
	SpawnScriptNow \{menu_highway_tutorial_sequence}
	return \{play_sound = 0}
endscript

script destroy_highway_tutorial_menu 
	destroy_menu \{menu_id = ht_container}
	destroy_menu_backdrop
	KillSpawnedScript \{id = menu_highway_tutorial_spawned_script}
	KillSpawnedScript \{Name = menu_highway_tutorial_sequence}
endscript

script menu_highway_tutorial_create_gem_sprites 
	green_pos = (568.0, 388.0)
	red_pos = (604.0, 388.0)
	yellow_pos = (640.0, 388.0)
	gem_scale = (0.35000002, 0.35000002)
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = gem_greennote
		just = [center center]
		texture = tut_greennote
		Pos = <green_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = <gem_scale>
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = gem_rednote
		just = [center center]
		texture = tut_rednote
		Pos = <red_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = <gem_scale>
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = gem_yellownote
		just = [center center]
		texture = tut_yellownote
		Pos = <yellow_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = <gem_scale>
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = gem_yellowhold
		just = [center bottom]
		texture = tut_yellowhold
		Pos = <yellow_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = <gem_scale>
		z_priority = 5
	}
endscript

script menu_highway_tutorial_create_fret_finger_sprites 
	wrist_pos = (425.0, 162.0)
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = hand_wrist
		just = [center center]
		texture = training_hand_wrist
		Pos = <wrist_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_pos = (377.0, 230.0)
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_none_sprite
		just = [center center]
		texture = training_hand_button_none
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_green_sprite
		just = [center center]
		texture = training_hand_button_g
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_red_sprite
		just = [center center]
		texture = training_hand_button_r
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_yellow_sprite
		just = [center center]
		texture = training_hand_button_y
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_green_red_sprite
		just = [center center]
		texture = training_hand_button_gr
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = fret_green_red_yellow_sprite
		just = [center center]
		texture = training_hand_button_gry
		Pos = <hand_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
endscript

script menu_highway_tutorial_create_strum_sprites 
	strum_pos = (800.0, 198.0)
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = strum_middle_sprite
		just = [center center]
		texture = training_guitar_strum
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = strum_up_sprite
		just = [center center]
		texture = training_guitar_strum_up
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = strum_down_sprite
		just = [center center]
		texture = training_guitar_strum_down
		Pos = <strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 5
	}
	hand_strum_pos = (895.0, 158.0)
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = hand_strum_middle_sprite
		just = [center center]
		texture = training_hand_strum
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = hand_strum_up_sprite
		just = [center center]
		texture = training_hand_strum_up
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		id = hand_strum_down_sprite
		just = [center center]
		texture = training_hand_strum_down
		Pos = <hand_strum_pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		Scale = (0.4, 0.4)
		z_priority = 6
	}
endscript

script menu_highway_tutorial_animate_fret_fingers 
	begin
	pose_fret_fingers \{Color = green}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_fret_fingers \{Color = red}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_fret_fingers \{Color = yellow}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_fret_fingers \{Color = red}
	Wait \{0.5
		Seconds
		ignoreslomo}
	repeat 2
	pose_fret_fingers \{Color = green}
endscript

script menu_highway_tutorial_animate_strum_fingers 
	begin
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = up}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds
		ignoreslomo}
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds
		ignoreslomo}
	repeat 2
	pose_strum_fingers \{Pos = middle}
endscript

script menu_highway_tutorial_add_arrow \{Pos = (640.0, 360.0)
		rot = 0
		z = 5
		Scale = 1.0}
	if NOT GotParam \{life}
		life = 5
	endif
	SetSearchAllAssetContexts
	CreateScreenElement {
		parent = ht_container
		Type = SpriteElement
		just = [center bottom]
		texture = training_arrow_blue
		Pos = <Pos>
		rot_angle = <rot>
		Scale = <Scale>
		rgba = [255 255 255 255]
		z_priority = 1000
	}
	arrow_id = <id>
	SetSearchAllAssetContexts \{OFF}
	<arrow_id> :SetTags phase = 0.0
	<arrow_id> :SetTags phase_change = 1
	cos <rot>
	sin <rot>
	<arrow_id> :SetTags phase_direction = ((1.0, 0.0) * <sin> + (0.0, -1.0) * <cos>)
	<arrow_id> :SetTags alive = 0.0
	<arrow_id> :SetTags initial_pos = <Pos>
	SpawnScriptNow menu_highway_tutorial_make_pointer_point_now params = {id = <arrow_id> life = <life>} id = menu_highway_tutorial_spawned_script
endscript

script menu_highway_tutorial_make_pointer_point_now 
	if NOT GotParam \{id}
		ScriptAssert \{"Need id!"}
	endif
	begin
	GetDeltaTime \{ignore_slomo}
	<id> :GetTags
	arrow_age = (<alive> + <delta_time>)
	if (<arrow_age> > <life>)
		break
	endif
	<phase> = (<phase> + <delta_time> * <phase_change> * 2.75)
	if (<phase> > 1)
		<phase> = 1
		<phase_change> = -1
	elseif (<phase> < 0)
		<phase> = 0
		<phase_change> = 1
	endif
	new_pos = (<initial_pos> + <phase_direction> * 30 * <phase>)
	SetScreenElementProps id = <id> Pos = (<new_pos>)
	<id> :SetTags alive = (<arrow_age>)
	<id> :SetTags phase = (<phase>)
	<id> :SetTags phase_change = (<phase_change>)
	Wait \{1
		gameframe}
	repeat
	DestroyScreenElement id = <id>
endscript

script menu_highway_tutorial_sequence 
	green_pos_far = (568.0, 388.0)
	red_pos_far = (604.0, 388.0)
	yellow_pos_far = (640.0, 388.0)
	gem_scale_far = (0.35000002, 0.35000002)
	green_pos_lessfar = (548.0, 424.0)
	red_pos_lessfar = (594.0, 424.0)
	yellow_pos_lessfar = (640.0, 424.0)
	gem_scale_lessfar = (0.41, 0.41)
	green_pos_lessnear = (522.0, 480.0)
	red_pos_lessnear = (581.0, 480.0)
	yellow_pos_lessnear = (640.0, 480.0)
	gem_scale_lessnear = (0.51, 0.51)
	green_pos_near = (475.0, 570.0)
	red_pos_near = (558.0, 570.0)
	yellow_pos_near = (640.0, 570.0)
	gem_scale_near = (0.62, 0.62)
	hold_scale_far = (0.575, 0.25)
	hold_scale_lessfar = (0.6, 0.45000002)
	hold_scale_lessnear = (0.7, 0.75)
	hold_scale_near = (1.0, 1.24)
	hold_scale_one = (1.0, 1.1)
	hold_scale_two = (1.0, 0.84000003)
	hold_scale_three = (1.0, 0.5)
	pose_fret_fingers \{Color = None}
	pose_strum_fingers \{Pos = middle}
	safe_hide \{id = gem_greennote}
	safe_hide \{id = gem_rednote}
	safe_hide \{id = gem_yellownote}
	safe_hide \{id = gem_yellowhold}
	if ScreenElementExists \{id = tut_help_text1}
		SetScreenElementProps \{id = tut_help_text1
			Pos = (20.0, 360.0)
			text = "HOLD fret button"}
	endif
	if ScreenElementExists \{id = tut_help_text2}
		SetScreenElementProps \{id = tut_help_text2
			Pos = (20.0, 390.0)
			text = "to CHOOSE note"}
	endif
	SpawnScriptNow \{menu_highway_tutorial_animate_fret_fingers
		id = menu_highway_tutorial_spawned_script}
	menu_highway_tutorial_add_arrow \{id = menu_highway_tutorial_arrow
		life = 4
		Pos = (375.0, 160.0)
		Scale = 0.5}
	Wait \{4
		Seconds}
	if ScreenElementExists \{id = tut_help_text3}
		SetScreenElementProps \{id = tut_help_text3
			Pos = (20.0, 450.0)
			text = "PRESS strum bar up"}
	endif
	if ScreenElementExists \{id = tut_help_text4}
		SetScreenElementProps \{id = tut_help_text4
			Pos = (20.0, 480.0)
			text = "or down to PLAY note"}
	endif
	SpawnScriptNow \{menu_highway_tutorial_animate_strum_fingers
		id = menu_highway_tutorial_spawned_script}
	menu_highway_tutorial_add_arrow \{id = menu_highway_tutorial_arrow
		life = 4
		Pos = (975.0, 200.0)
		Scale = 0.5
		rot = 90}
	Wait \{4
		Seconds}
	if ScreenElementExists \{id = tut_help_text5}
		SetScreenElementProps \{id = tut_help_text5
			Pos = (20.0, 540.0)
			text = "Match note colors to"}
	endif
	if ScreenElementExists \{id = tut_help_text6}
		SetScreenElementProps \{id = tut_help_text6
			Pos = (20.0, 570.0)
			text = "play different notes"}
	endif
	safe_show \{id = gem_greennote}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_greennote}
	pose_strum_fingers \{Pos = middle}
	safe_show \{id = gem_rednote}
	pose_fret_fingers \{Color = red}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_rednote}
	pose_strum_fingers \{Pos = middle}
	if ScreenElementExists \{id = tut_help_text7}
		SetScreenElementProps \{id = tut_help_text7
			Pos = (980.0, 360.0)
			text = "Hold multiple notes"}
	endif
	if ScreenElementExists \{id = tut_help_text8}
		SetScreenElementProps \{id = tut_help_text8
			Pos = (980.0, 390.0)
			text = "at once for chords"}
	endif
	safe_show \{id = gem_greennote}
	safe_show \{id = gem_rednote}
	pose_fret_fingers \{Color = green_red}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_far> Scale = <gem_scale_far>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessfar> Scale = <gem_scale_lessfar>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessnear> Scale = <gem_scale_lessnear>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_near> Scale = <gem_scale_near>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	pose_strum_fingers \{Pos = middle}
	safe_show \{id = gem_yellownote}
	pose_fret_fingers \{Color = green_red_yellow}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_far> Scale = <gem_scale_far>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_far> Scale = <gem_scale_far>
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessfar> Scale = <gem_scale_lessfar>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessfar> Scale = <gem_scale_lessfar>
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessnear> Scale = <gem_scale_lessnear>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessnear> Scale = <gem_scale_lessnear>
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_near> Scale = <gem_scale_near>
	SetScreenElementProps id = gem_rednote Pos = <red_pos_near> Scale = <gem_scale_near>
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_greennote}
	safe_hide \{id = gem_rednote}
	safe_hide \{id = gem_yellownote}
	pose_strum_fingers \{Pos = middle}
	pose_fret_fingers \{Color = None}
	if ScreenElementExists \{id = tut_help_text9}
		SetScreenElementProps \{id = tut_help_text9
			Pos = (980.0, 450.0)
			text = "For longer notes"}
	endif
	if ScreenElementExists \{id = tut_help_text10}
		SetScreenElementProps \{id = tut_help_text10
			Pos = (980.0, 480.0)
			text = "hold fret until"}
	endif
	if ScreenElementExists \{id = tut_help_text11}
		SetScreenElementProps \{id = tut_help_text11
			Pos = (980.0, 510.0)
			text = "whole note is played"}
	endif
	safe_show \{id = gem_yellownote}
	safe_show \{id = gem_yellowhold}
	pose_fret_fingers \{Color = yellow}
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_far> Scale = <gem_scale_far>
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_far> Scale = <hold_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_lessfar> Scale = <gem_scale_lessfar>
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_lessfar> Scale = <hold_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_lessnear> Scale = <gem_scale_lessnear>
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_lessnear> Scale = <hold_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_yellownote Pos = <yellow_pos_near> Scale = <gem_scale_near>
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_near> Scale = <hold_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_yellownote}
	pose_strum_fingers \{Pos = middle}
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_near> Scale = <hold_scale_one>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_near> Scale = <hold_scale_two>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_yellowhold Pos = <yellow_pos_near> Scale = <hold_scale_three>
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_yellowhold}
	pose_fret_fingers \{Color = None}
	Wait \{0.5
		Seconds}
	if ScreenElementExists \{id = tut_help_text12}
		SetScreenElementProps \{id = tut_help_text12
			Pos = (980.0, 570.0)
			text = "In Beginner Mode"}
	endif
	if ScreenElementExists \{id = tut_help_text13}
		SetScreenElementProps \{id = tut_help_text13
			Pos = (980.0, 600.0)
			text = "just strum in time"}
	endif
	safe_show \{id = gem_greennote}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_greennote Pos = <green_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_greennote}
	pose_strum_fingers \{Pos = middle}
	safe_show \{id = gem_rednote}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_far> Scale = <gem_scale_far>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessfar> Scale = <gem_scale_lessfar>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_lessnear> Scale = <gem_scale_lessnear>
	Wait \{0.5
		Seconds}
	SetScreenElementProps id = gem_rednote Pos = <red_pos_near> Scale = <gem_scale_near>
	pose_strum_fingers \{Pos = down}
	Wait \{0.5
		Seconds}
	safe_hide \{id = gem_rednote}
	pose_strum_fingers \{Pos = middle}
	Wait \{0.5
		Seconds}
endscript
