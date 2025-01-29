
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
	resolvebodyspecificpartinappearance \{part = cas_physique}
	add_car_menu_text_item {
		icon = icon_size
		text = qs(0xfa27a70a)
		choose_state = uistate_customize_character_proportions
		choose_state_data = {
			part = <part>
		}
	}
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_body 
	destroy_generic_menu
endscript
