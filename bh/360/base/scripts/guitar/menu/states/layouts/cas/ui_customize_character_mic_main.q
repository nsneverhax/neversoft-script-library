
script ui_create_customize_character_mic_main 
	make_generic_car_menu {
		vmenu_id = create_customize_character_mic_vmenu
		Title = qs(0x3490b188)
		show_history
		hist_tex = icon_customize
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_customize_character_mic_vmenu camera_list = ['customize_character_mic' 'customize_character_mic_R' 'customize_character_mic_B' 'customize_character_mic_L'] zoom_camera = 'customize_mic_Zoom' controller = <state_device>
	add_car_menu_text_item \{icon = icon_mic
		text = qs(0xc0b34c9f)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0xc0b34c9f)
			part = CAS_Mic
			hist_tex = icon_mic
			is_popup
			cam_name = 'customize_microphone'
			camera_list = [
				'customize_microphone_F'
				'customize_microphone_R'
				'customize_microphone_B'
				'customize_microphone_L'
			]
			zoom_camera = 'customize_mic_Zoom'
			stance = Stance_Select_Microphone
			return_stance = Stance_Select_Mic
		}}
	generic_menu :SE_SetProps \{abstract_01_alpha = 0}
	generic_menu :SE_SetProps \{generic_menu_title_bg_alpha = 0}
	generic_menu :SE_SetProps \{border_elements_alpha = 1}
	mic_stand_props = {
		text = qs(0xafbbc27e)
		part = CAS_Mic_Stand
		hist_tex = icon_mic_stand
		is_popup
		cam_name = 'customize_character_mic'
		camera_list = ['customize_character_mic' 'customize_character_mic_R' 'customize_character_mic_B' 'customize_character_mic_L']
		zoom_camera = 'customize_mic_Zoom'
		stance = Stance_Select_Mic
		return_stance = Stance_Select_Mic
	}
	add_car_menu_text_item {
		icon = icon_mic_stand
		text = qs(0xafbbc27e)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			<mic_stand_props>
		}
	}
	menu_finish car_helper_text controller = <state_device>
	printf \{qs(0xcb0dee4f)}
	if GetCurrentCASObject
		bandmanager_changestance name = <cas_object> stance = Stance_Select_Mic no_wait
	endif
	LaunchEvent type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_mic_main 
	destroy_generic_menu
endscript

script ui_return_customize_character_mic_main 
	menu_finish car_helper_text controller = <state_device>
endscript
