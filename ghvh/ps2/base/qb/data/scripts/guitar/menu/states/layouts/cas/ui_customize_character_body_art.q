
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
	add_generic_menu_text_item \{text = qs(0xb3283b80)
		choose_state = uistate_customize_character_sub_sections
		choose_state_data = {
			text = qs(0x96383f0a)
			cam_name = 'customize_tat_torso'
			part = cas_torso_art
			stance = stance_select_tat_chest
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			camera_list = [
				'customize_tat_torso'
				'customize_tat_torso_R'
				'customize_tat_torso_B'
				'customize_tat_torso_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
	add_generic_menu_text_item \{text = qs(0x415e789e)
		choose_state = uistate_customize_character_sub_sections
		choose_state_data = {
			text = qs(0xf9df288f)
			cam_name = 'customize_tat_right_arm'
			part = cas_right_arm_art
			stance = stance_select_tat_arm_r
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			camera_list = [
				'customize_tat_right_arm'
				'customize_tat_right_arm_R'
				'customize_tat_right_arm_B'
				'customize_tat_right_arm_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
	add_generic_menu_text_item \{text = qs(0x290271d8)
		choose_state = uistate_customize_character_sub_sections
		choose_state_data = {
			text = qs(0x86bc5ab4)
			cam_name = 'customize_tat_left_arm'
			part = cas_left_arm_art
			stance = stance_select_tat_arm_l
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			camera_list = [
				'customize_tat_left_arm'
				'customize_tat_left_arm_R'
				'customize_tat_left_arm_B'
				'customize_tat_left_arm_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
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
				desc_id = f_fun_torso_bikinitop
			}}
	else
		setcasappearancepartinstance \{part = cas_torso
			part_instance = {
				desc_id = None
			}}
	endif
	rebuildcurrentcasmodel
endscript

script unhide_torso_parts_for_body_art 
	mergepartintotemporarycasappearance \{part_list = [
			cas_body
			cas_right_arm_art
			cas_left_arm_art
			cas_torso_art
		]}
endscript

script 0xc905458a 
	SpawnScriptNow \{hide_torso_parts_for_body_art}
endscript

script 0x551df1c1 
	0xf204d5ae
	SpawnScriptNow \{unhide_torso_parts_for_body_art}
endscript
