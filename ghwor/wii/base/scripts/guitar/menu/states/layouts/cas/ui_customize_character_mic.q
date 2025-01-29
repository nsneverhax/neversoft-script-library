
script ui_create_customize_character_mic 
	ScriptAssert \{'No longer used'}
endscript

script ui_return_customize_character_mic 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_mic 
	destroy_generic_menu
endscript

script ui_init_customize_character_mic 
endscript

script ui_deinit_customize_character_mic 
endscript
