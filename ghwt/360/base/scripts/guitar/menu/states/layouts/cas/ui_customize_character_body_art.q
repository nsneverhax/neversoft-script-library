
script ui_create_customize_character_body_art 
	make_generic_menu \{vmenu_id = create_customize_character_body_art_vmenu
		title = qs(0xea5928be)
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_body_art_vmenu
		camera_list = [
			'customize_tat_torso'
			'customize_tat_torso_R'
			'customize_tat_torso_B'
			'customize_tat_torso_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_generic_menu_icon_item {
		icon = bodyart_chest
		text = qs(0x7844d77c)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0x96383f0a)
			cam_name = 'customize_tat_torso'
			camera_list = ['customize_tat_torso' 'customize_tat_torso_R' 'customize_tat_torso_B' 'customize_tat_torso_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = Body
			hist_tex = bodyart_chest
			stance = stance_select_tat_chest
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	add_generic_menu_icon_item {
		icon = bodyart_rightarm
		text = qs(0xf9df288f)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0xf9df288f)
			cam_name = 'customize_tat_right_arm'
			camera_list = ['customize_tat_right_arm' 'customize_tat_right_arm_R' 'customize_tat_right_arm_B' 'customize_tat_right_arm_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = `right	arm`
			hist_tex = bodyart_rightarm
			stance = stance_select_tat_arm_r
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	add_generic_menu_icon_item {
		icon = bodyart_leftarm
		text = qs(0x86bc5ab4)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0x86bc5ab4)
			cam_name = 'customize_tat_left_arm'
			camera_list = ['customize_tat_left_arm' 'customize_tat_left_arm_R' 'customize_tat_left_arm_B' 'customize_tat_left_arm_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = `left	arm`
			hist_tex = bodyart_leftarm
			stance = stance_select_tat_arm_l
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	menu_finish \{car_helper_text}
	LaunchEvent Type = focus target = create_customize_character_body_art_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_body_art 
	destroy_generic_menu
endscript

script hide_torso_parts_for_body_art 
	pushtemporarycasappearance
	setcasappearancepartinstance \{part = cas_acc_left
		part_instance = {
			desc_id = None
		}}
	setcasappearancepartinstance \{part = cas_acc_right
		part_instance = {
			desc_id = None
		}}
	if is_female_char
		setcasappearancepartinstance \{part = cas_torso
			part_instance = {
				desc_id = f_fun_torso_bra
			}}
	else
		setcasappearancepartinstance \{part = cas_torso
			part_instance = {
				desc_id = shirtless
			}}
	endif
	rebuildcurrentcasmodel
endscript

script unhide_torso_parts_for_body_art 
	mergepartintotemporarycasappearance \{part_list = [
			cas_body
		]}
endscript
