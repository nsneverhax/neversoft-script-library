
script ui_create_customize_character_body_art 
	make_generic_car_menu {
		vmenu_id = create_customize_character_body_art_vmenu
		title = qs(0x76591c6a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_customize_character_body_art_vmenu camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = bodyart_chest
		text = qs(0xb3283b80)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0xca13d1a3)
			cam_name = 'customize_tat_torso'
			camera_list = ['customize_tat_torso' 'customize_tat_torso_R' 'customize_tat_torso_B' 'customize_tat_torso_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = body
			hist_tex = bodyart_chest
			stance = stance_select_tat_chest
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	add_car_menu_text_item {
		icon = bodyart_rightarm
		text = qs(0x415e789e)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0x415e789e)
			cam_name = 'customize_tat_right_arm'
			camera_list = ['customize_tat_right_arm' 'customize_tat_right_arm_R' 'customize_tat_right_arm_B' 'customize_tat_right_arm_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = `right arm`
			hist_tex = bodyart_rightarm
			stance = stance_select_tat_arm_r
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	add_car_menu_text_item {
		icon = bodyart_leftarm
		text = qs(0x290271d8)
		choose_state = uistate_cap_main
		choose_state_data = {
			savegame = ($cas_current_savegame)
			part = cas_body
			text = qs(0x290271d8)
			cam_name = 'customize_tat_left_arm'
			camera_list = ['customize_tat_left_arm' 'customize_tat_left_arm_R' 'customize_tat_left_arm_B' 'customize_tat_left_arm_L']
			zoom_camera = 'customize_character_Zoom'
			div_id = `left arm`
			hist_tex = bodyart_leftarm
			stance = stance_select_tat_arm_l
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}
	}
	menu_finish car_helper_text controller = <state_device>
	launchevent type = focus target = create_customize_character_body_art_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_body_art 
	destroy_generic_menu
endscript

script hide_torso_parts_for_body_art 
	pushtemporarycasappearance
	setcasappearancepartinstance \{part = cas_acc_left
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_acc_right
		part_instance = {
			desc_id = none
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
	if NOT is_accepting_invite_or_sigining_out
		mergepartintotemporarycasappearance \{part_list = [
				cas_body
			]}
	endif
endscript
