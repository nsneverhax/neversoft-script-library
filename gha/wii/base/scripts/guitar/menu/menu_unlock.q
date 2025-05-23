
script find_unlocked_guitar_info_by_id 
	GetArraySize ($Secret_Guitars)
	i = 0
	begin
	if (<id> = ($Secret_Guitars [<i>].id))
		return icon_texture = ($Secret_Guitars [<i>].icon_texture)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script create_unlock_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = unlock_container
		Pos = (0.0, 0.0)}
	find_unlocked_guitar_info_by_id id = ($progression_unlocked_guitar)
	get_instrument_brand_and_finish id = ($progression_unlocked_guitar)
	Change progression_unlocked_guitar = ($progression_unlocked_guitar2)
	Change \{progression_unlocked_guitar2 = -1}
	unlock_item_tex = <icon_texture>
	GetUpperCaseString <instrument_name2>
	unlock_item_name = <UppercaseString>
	unlock_font = text_a4
	padlock_pos_start = (850.0, 430.0)
	padlock_pos_end = (850.0, 412.0)
	create_menu_backdrop \{texture = Unlock_BG}
	CreateScreenElement \{Type = SpriteElement
		id = unlock_velvet_backdrop
		parent = unlock_container
		texture = Unlock_Velvet
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 320.0)
		dims = (865.0, 420.0)
		just = [
			center
			center
		]
		z_priority = -0.1}
	CreateScreenElement {
		Type = SpriteElement
		id = unlock_item
		parent = unlock_container
		texture = <unlock_item_tex>
		rgba = [255 255 255 255]
		Pos = (640.0, 310.0)
		dims = (650.0, 325.0)
		just = [center center]
		rot_angle = -10
		Scale = 1.5
	}
	RunScriptOnScreenElement \{id = unlock_item
		unlock_guitar_hover}
	CreateScreenElement \{Type = SpriteElement
		id = unlock_dialog_backdrop
		parent = unlock_container
		texture = Unlock_Dialog_BG
		rgba = [
			255
			255
			255
			255
		]
		Pos = (850.0, 550.0)
		dims = (512.0, 256.0)
		just = [
			center
			center
		]}
	CreateScreenElement {
		Type = SpriteElement
		id = unlock_dialog_padlock
		parent = unlock_container
		texture = Unlock_Padlock
		rgba = [255 255 255 255]
		Pos = <padlock_pos_start>
		Scale = 1.0
		just = [center center]
	}
	CreateScreenElement {
		Type = TextElement
		id = unlock_text_congrats
		parent = unlock_container
		Scale = (1.0, 1.0)
		text = 'CONGRATULATIONS!'
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_congrats
		dims = (350.0, 32.0)
		Pos = (680.0, 483.0)}
	CreateScreenElement {
		Type = TextElement
		id = unlock_text_buyitinthestore
		parent = unlock_container
		Scale = (1.0, 1.0)
		text = 'VISIT THE VAULT'
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_buyitinthestore
		dims = (350.0, 32.0)
		Pos = (680.0, 565.0)}
	CreateScreenElement {
		Type = TextElement
		id = unlock_text_name
		parent = unlock_container
		Scale = (1.2, 1.2)
		text = <unlock_item_name>
		Pos = (845.0, 515.0)
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 32 32 255]
		just = [center top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_name
		only_if_larger_x = 1
		dims = (345.0, 64.0)
		Pos = (845.0, 512.0)}
	CreateScreenElement {
		Type = TextElement
		parent = unlock_container
		id = continue_button
		Scale = 0.8
		Pos = (400.0, 590.0)
		font = <unlock_font>
		rgba = [223 223 223 255]
		just = [left top]
		z_priority = 3
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	SpawnScriptNow wait_and_animate_padlock params = {padlock_pos_end = <padlock_pos_end>}
endscript

script wait_and_animate_padlock 
	Wait \{2
		Seconds}
	DoScreenElementMorph id = unlock_dialog_padlock Pos = <padlock_pos_end> time = 0.1 motion = ease_in
	CreateScreenElement {
		Type = SpriteElement
		id = unlock_dialog_starburst
		parent = unlock_container
		texture = Unlock_Starburst
		rgba = [255 255 255 255]
		Pos = <padlock_pos_end>
		just = [center center]
		z_priority = 3.1
		Scale = 0.1
		alpha = 1
	}
	rot = 180
	Scale = 5
	alpha = 0.0
	DoScreenElementMorph id = unlock_dialog_starburst rot_angle = <rot> Scale = <Scale> alpha = <alpha> Pos = <padlock_pos_end> time = 0.7 motion = ease_out
	LaunchEvent \{Type = focus
		target = continue_button}
	CreateScreenElement \{Type = SpriteElement
		id = unlock_twinkle_1
		parent = unlock_container
		texture = Unlock_Starburst
		rgba = [
			255
			255
			255
			255
		]
		Pos = (350.0, 350.0)
		just = [
			center
			center
		]
		z_priority = 0
		Scale = 0.5
		alpha = 0}
	RunScriptOnScreenElement \{id = unlock_twinkle_1
		unlock_twinkle_anim}
	add_user_control_helper \{text = 'CONTINUE'
		button = green
		z = 10000}
endscript

script unlock_guitar_hover 
	if NOT ScreenElementExists \{id = unlock_item}
		return
	endif
	begin
	unlock_item :DoMorph \{Pos = {
			(0.0, -5.0)
			relative
		}
		rot_angle = 0
		motion = ease_out
		time = 1}
	unlock_item :DoMorph \{Pos = {
			(0.0, 5.0)
			relative
		}
		rot_angle = 1
		motion = ease_in
		time = 1}
	unlock_item :DoMorph \{Pos = {
			(0.0, -5.0)
			relative
		}
		rot_angle = 2
		motion = ease_out
		time = 1}
	unlock_item :DoMorph \{Pos = {
			(0.0, 5.0)
			relative
		}
		rot_angle = 1
		motion = ease_in
		time = 1}
	repeat
endscript

script unlock_twinkle_anim 
	if NOT ScreenElementExists \{id = unlock_twinkle_1}
		return
	endif
	twinkle_time = 0.3

	begin
	unlock_twinkle_1 :DoMorph \{Pos = (350.0, 400.0)
		Scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :DoMorph rot_angle = -180 Scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	unlock_twinkle_1 :DoMorph \{Pos = (600.0, 200.0)
		Scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :DoMorph rot_angle = -180 Scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	unlock_twinkle_1 :DoMorph \{Pos = (900.0, 250.0)
		Scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :DoMorph rot_angle = -180 Scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	Wait \{3
		Seconds}
	repeat
endscript

script destroy_unlock_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = unlock_container}
	destroy_menu_backdrop
endscript
