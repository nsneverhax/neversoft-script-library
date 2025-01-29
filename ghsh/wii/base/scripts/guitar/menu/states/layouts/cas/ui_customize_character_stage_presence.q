
script ui_create_customize_character_stage_presence 
	make_generic_menu \{vmenu_id = stage_presence_vmenu
		title = qs(0xe67f295f)
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = stage_presence_vmenu
		camera_list = [
			'customize_character_stage_presence'
			'customize_character_stage_presence_R'
			'customize_character_stage_presence_B'
			'customize_character_stage_presence_L'
		]
		zoom_camera = 'customize_Presence_Zoom'}
	add_generic_menu_text_item \{text = qs(0xef697ef2)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xef697ef2)
			part = cas_intro_anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = presence_intro
			hist_name = qs(0x7c308eb8)
			is_popup
			play_current_anim = true
			norebuildloop
			disable_rotation_zoom = 1
		}}
	add_generic_menu_text_item \{text = qs(0x352e2ede)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x352e2ede)
			part = cas_win_anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = presence_wins
			hist_name = qs(0x962ec77b)
			is_popup
			play_current_anim = true
			norebuildloop
			disable_rotation_zoom = 1
		}}
	add_generic_menu_text_item \{text = qs(0x362c5804)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x362c5804)
			part = cas_lose_anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = presence_loses
			hist_name = qs(0xa575a84e)
			is_popup
			play_current_anim = true
			norebuildloop
			disable_rotation_zoom = 1
		}}
	menu_finish \{car_helper_text}
endscript

script ui_return_customize_character_stage_presence 
	menu_finish \{car_helper_text}
endscript

script ui_destroy_customize_character_stage_presence 
	destroy_generic_menu
endscript
