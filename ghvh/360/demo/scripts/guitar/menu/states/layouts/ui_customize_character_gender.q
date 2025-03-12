
script ui_create_customize_character_gender 
	make_generic_menu \{title = qs(0xa0e6ab60)
		vmenu_id = create_customize_character_gender_vmenu}
	create_ui_history_header \{text = qs(0xa0e6ab60)
		num_icons = 1}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_customize_character_gender_vmenu}
	menu_finish \{car_helper_text}
endscript

script ui_destroy_customize_character_gender 
	generic_ui_destroy
endscript
