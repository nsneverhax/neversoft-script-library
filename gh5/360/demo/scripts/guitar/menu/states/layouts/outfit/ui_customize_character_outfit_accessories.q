
script ui_create_customize_character_outfit_accessories 
	make_generic_car_menu {
		back_state = uistate_cas
		vmenu_id = create_customize_character_outfit_accessories_vmenu
		title = qs(0x69fb513a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	ui_cas_precache \{part = cas_acc_face}
	setup_cas_menu_handlers vmenu_id = create_customize_character_outfit_accessories_vmenu camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_face_acc
		text = qs(0xb5847ea6)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xab9965ec)
			cam_name = 'customize_face'
			camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_acc_face
			stance = stance_select_head
			is_popup
			hist_tex = icon_face_acc
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = stance_select_glasses
		}
	}
	add_car_menu_text_item {
		icon = accessorieshat
		text = qs(0x50497155)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0xa46a8c42)
			cam_name = 'customize_hat'
			camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_hat
			hist_tex = accessorieshat
			stance = stance_select_head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = stance_select_hat
		}
	}
	add_car_menu_text_item {
		icon = accessoriesleftarm
		text = qs(0x290271d8)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x792507d5)
			cam_name = 'customize_left_arm'
			camera_list = ['customize_left_arm' 'customize_left_arm_R' 'customize_left_arm_B' 'customize_left_arm_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_acc_left
			hist_tex = accessoriesleftarm
			stance = stance_select_arm_l
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = stance_select_arm_l
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
		}
	}
	add_car_menu_text_item {
		icon = accessoriesrightarm
		text = qs(0x415e789e)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			text = qs(0x328a5e9c)
			cam_name = 'customize_right_arm'
			camera_list = ['customize_right_arm' 'customize_right_arm_R' 'customize_right_arm_B' 'customize_right_arm_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_acc_right
			hist_tex = accessoriesrightarm
			stance = stance_select_arm_r
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = stance_select_arm_r
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
		}
	}
	add_car_menu_text_item {
		icon = icon_face_piercing
		text = qs(0x0bcdd98b)
		choose_state = uistate_popout_select_part
		choose_state_data = {
			hist_tex = icon_face_piercing
			cam_name = 'customize_piercings'
			camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
			zoom_camera = 'customize_character_Zoom'
			part = cas_acc_ears
			stance = stance_select_head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = stance_select_head
			additional_init_script = hide_car_parts_piercings
			additional_deinit_script = unhide_car_parts_piercings
		}
	}
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_customize_character_outfit_accessories 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_outfit_accessories 
	destroy_generic_menu
endscript

script hide_car_parts_accessories 
	pushtemporarycasappearance
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

script unhide_car_parts_accessories 
	if NOT is_accepting_invite_or_sigining_out
		mergepartintotemporarycasappearance \{part_list = [
				cas_acc_left
				cas_acc_right
			]}
	endif
endscript

script hide_car_parts_piercings 
	pushtemporarycasappearance
	setcasappearancepartinstance \{part = cas_hair
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_hat_hair
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_hat
		part_instance = {
			desc_id = none
		}}
	setcasappearancepartinstance \{part = cas_acc_face
		part_instance = {
			desc_id = none
		}}
	rebuildcurrentcasmodel
endscript

script unhide_car_parts_piercings 
	if NOT is_accepting_invite_or_sigining_out
		mergepartintotemporarycasappearance \{part_list = [
				cas_acc_ears
			]}
	endif
endscript
