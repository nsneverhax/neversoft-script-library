
script ui_create_customize_character_body 
	make_generic_car_menu {
		vmenu_id = customize_body_vmenu
		back_state = uistate_customize_character_appearance
		title = qs(0x706474c8)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
	}
	ui_cas_precache \{part = cas_body}
	setup_cas_menu_handlers vmenu_id = customize_body_vmenu camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item {
		text = qs(0x32aea2ab)
		choose_state = uistate_cas_color_edit
		choose_state_data = {
			text = qs(0x32aea2ab)
			part = cas_body
			camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
			zoom_camera = 'customize_character_Zoom'
			part_materials = [{desc_id = skin frontend_desc = qs(0xc2def45c)}]
			num_states = 1
			num_icons = 1
			hist_tex = skintone
			color_wheel = ($skin_colorwheel)
		}
		icon = skintone
	}
	resolvebodyspecificpartinappearance \{part = cas_physique}
	add_car_menu_text_item {
		icon = icon_size
		text = qs(0xfa27a70a)
		choose_state = uistate_customize_character_proportions
		choose_state_data = {
			part = <part>
		}
	}
	add_car_menu_text_item {
		text = qs(0x4a170c05)
		choose_state = uistate_cas_color_edit
		choose_state_data = {
			text = qs(0x4a170c05)
			part = cas_body
			cam_name = 'customize_character_FingerNails'
			camera_list = ['customize_character_FingerNails' 'customize_character_FingerNails_R' 'customize_character_FingerNails_B' 'customize_character_FingerNails_L']
			zoom_camera = 'customize_character_Zoom'
			part_materials = [{desc_id = nails frontend_desc = qs(0x4bf6d34f)}]
			num_states = 1
			num_icons = 1
			hist_tex = fingernails
			color_wheel = ($fingernail_colorwheel)
			stance = stance_select_fingernails
			hide_parts = [cas_acc_left cas_acc_right]
		}
		icon = fingernails
	}
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_body 
	destroy_generic_menu
endscript
