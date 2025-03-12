
script find_unlocked_guitar_info_by_id 
	getarraysize ($secret_guitars)
	i = 0
	begin
	if (<id> = ($secret_guitars [<i>].id))
		return icon_texture = ($secret_guitars [<i>].icon_texture)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script create_unlock_menu 
	createscreenelement \{type = containerelement
		parent = root_window
		id = unlock_container
		pos = (0.0, 0.0)}
	find_unlocked_guitar_info_by_id id = ($progression_unlocked_guitar)
	get_instrument_brand_and_finish id = ($progression_unlocked_guitar)
	change progression_unlocked_guitar = ($progression_unlocked_guitar2)
	change \{progression_unlocked_guitar2 = -1}
	unlock_item_tex = <icon_texture>
	getuppercasestring <instrument_name2>
	unlock_item_name = <uppercasestring>
	unlock_font = text_a4
	padlock_pos_start = (850.0, 430.0)
	padlock_pos_end = (850.0, 412.0)
	create_menu_backdrop \{texture = unlock_bg}
	createscreenelement \{type = spriteelement
		id = unlock_velvet_backdrop
		parent = unlock_container
		texture = unlock_velvet
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 320.0)
		dims = (865.0, 420.0)
		just = [
			center
			center
		]
		z_priority = -0.1}
	createscreenelement {
		type = spriteelement
		id = unlock_item
		parent = unlock_container
		texture = <unlock_item_tex>
		rgba = [255 255 255 255]
		pos = (640.0, 310.0)
		dims = (650.0, 325.0)
		just = [center center]
		rot_angle = -10
		scale = 1.5
	}
	runscriptonscreenelement \{id = unlock_item
		unlock_guitar_hover}
	createscreenelement \{type = spriteelement
		id = unlock_dialog_backdrop
		parent = unlock_container
		texture = unlock_dialog_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (850.0, 550.0)
		just = [
			center
			center
		]}
	createscreenelement {
		type = spriteelement
		id = unlock_dialog_padlock
		parent = unlock_container
		texture = unlock_padlock
		rgba = [255 255 255 255]
		pos = <padlock_pos_start>
		just = [center center]
	}
	createscreenelement {
		type = textelement
		id = unlock_text_congrats
		parent = unlock_container
		scale = (1.0, 1.0)
		text = "CONGRATULATIONS!"
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_congrats
		dims = (350.0, 32.0)
		pos = (680.0, 483.0)}
	createscreenelement {
		type = textelement
		id = unlock_text_buyitinthestore
		parent = unlock_container
		scale = (1.0, 1.0)
		text = "VISIT THE VAULT"
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 128 128 255]
		just = [left top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_buyitinthestore
		dims = (350.0, 32.0)
		pos = (680.0, 555.0)}
	createscreenelement {
		type = textelement
		id = unlock_text_name
		parent = unlock_container
		scale = (1.0, 1.0)
		text = <unlock_item_name>
		pos = (850.0, 505.0)
		font_spacing = 0
		font = <unlock_font>
		rgba = [128 32 32 255]
		just = [center top]
		z_priority = 3
	}
	fit_text_in_rectangle \{id = unlock_text_name
		only_if_larger_x = 1
		dims = (345.0, 64.0)
		pos = (850.0, 497.0)}
	createscreenelement {
		type = textelement
		parent = unlock_container
		id = continue_button
		scale = 0.8
		pos = (400.0, 590.0)
		font = <unlock_font>
		rgba = [223 223 223 255]
		just = [left top]
		z_priority = 3
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	spawnscriptnow wait_and_animate_padlock params = {padlock_pos_end = <padlock_pos_end>}
endscript

script wait_and_animate_padlock 
	wait \{2
		seconds}
	doscreenelementmorph id = unlock_dialog_padlock pos = <padlock_pos_end> time = 0.1 motion = ease_in
	createscreenelement {
		type = spriteelement
		id = unlock_dialog_starburst
		parent = unlock_container
		texture = unlock_starburst
		rgba = [255 255 255 255]
		pos = <padlock_pos_end>
		just = [center center]
		z_priority = 3.1
		scale = 0.1
		alpha = 1
	}
	rot = 180
	scale = 5
	alpha = 0.0
	doscreenelementmorph id = unlock_dialog_starburst rot_angle = <rot> scale = <scale> alpha = <alpha> pos = <padlock_pos_end> time = 0.7 motion = ease_out
	launchevent \{type = focus
		target = continue_button}
	createscreenelement \{type = spriteelement
		id = unlock_twinkle_1
		parent = unlock_container
		texture = unlock_starburst
		rgba = [
			255
			255
			255
			255
		]
		pos = (350.0, 350.0)
		just = [
			center
			center
		]
		z_priority = 0
		scale = 0.5
		alpha = 0}
	runscriptonscreenelement \{id = unlock_twinkle_1
		unlock_twinkle_anim}
	add_user_control_helper \{text = "CONTINUE"
		button = green
		z = 10000}
endscript

script unlock_guitar_hover 
	if NOT screenelementexists \{id = unlock_item}
		return
	endif
	begin
	unlock_item :domorph \{pos = {
			(0.0, -10.0)
			relative
		}
		rot_angle = -12
		motion = ease_out
		time = 1}
	unlock_item :domorph \{pos = {
			(0.0, 10.0)
			relative
		}
		rot_angle = -10
		motion = ease_in
		time = 1}
	unlock_item :domorph \{pos = {
			(0.0, -15.0)
			relative
		}
		rot_angle = -12
		motion = ease_out
		time = 1}
	unlock_item :domorph \{pos = {
			(0.0, 15.0)
			relative
		}
		rot_angle = -8
		motion = ease_in
		time = 1}
	repeat
endscript

script unlock_twinkle_anim 
	if NOT screenelementexists \{id = unlock_twinkle_1}
		return
	endif
	twinkle_time = 0.3
	printf \{"twinkling!"}
	begin
	unlock_twinkle_1 :domorph \{pos = (350.0, 400.0)
		scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :domorph rot_angle = -180 scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	unlock_twinkle_1 :domorph \{pos = (600.0, 200.0)
		scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :domorph rot_angle = -180 scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	unlock_twinkle_1 :domorph \{pos = (900.0, 250.0)
		scale = 0
		alpha = 0.5
		rot_angle = 0}
	unlock_twinkle_1 :domorph rot_angle = -180 scale = 1 alpha = 0 motion = ease_out time = <twinkle_time>
	wait \{3
		seconds}
	repeat
endscript

script destroy_unlock_menu 
	clean_up_user_control_helpers
	killspawnedscript \{name = wait_and_animate_padlock}
	destroy_menu \{menu_id = unlock_container}
	destroy_menu_backdrop
endscript
