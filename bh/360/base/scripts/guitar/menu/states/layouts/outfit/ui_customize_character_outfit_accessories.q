
script ui_create_customize_character_outfit_accessories 
	make_generic_car_menu {
		back_state = UIstate_cas
		vmenu_id = create_customize_character_outfit_accessories_vmenu
		Title = qs(0x69fb513a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	ui_cas_precache \{part = CAS_Acc_Face}
	setup_cas_menu_handlers vmenu_id = create_customize_character_outfit_accessories_vmenu camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_face_acc
		text = qs(0xb5847ea6)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0xab9965ec)
			cam_name = 'customize_face'
			camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
			zoom_camera = 'customize_character_Zoom'
			part = CAS_Acc_Face
			stance = Stance_Select_Head
			is_popup
			hist_tex = icon_face_acc
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Glasses
		}
	}
	add_car_menu_text_item {
		icon = AccessoriesHat
		text = qs(0x50497155)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0xa46a8c42)
			cam_name = 'customize_hat'
			camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
			zoom_camera = 'customize_character_Zoom'
			part = CAS_Hat
			hist_tex = AccessoriesHat
			stance = Stance_Select_Head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Hat
		}
	}
	add_car_menu_text_item {
		icon = AccessoriesLeftArm
		text = qs(0x290271d8)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0x792507d5)
			cam_name = 'customize_left_arm'
			camera_list = ['customize_left_arm' 'customize_left_arm_R' 'customize_left_arm_B' 'customize_left_arm_L']
			zoom_camera = 'customize_character_Zoom'
			part = CAS_Acc_Left
			hist_tex = AccessoriesLeftArm
			stance = Stance_Select_Arm_L
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Arm_L
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
		}
	}
	add_car_menu_text_item {
		icon = AccessoriesRightArm
		text = qs(0x415e789e)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0x328a5e9c)
			cam_name = 'customize_right_arm'
			camera_list = ['customize_right_arm' 'customize_right_arm_R' 'customize_right_arm_B' 'customize_right_arm_L']
			zoom_camera = 'customize_character_Zoom'
			part = CAS_Acc_Right
			hist_tex = AccessoriesRightArm
			stance = Stance_Select_Arm_R
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Arm_R
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
		}
	}
	add_car_menu_text_item {
		icon = icon_face_piercing
		text = qs(0x0bcdd98b)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			hist_tex = icon_face_piercing
			cam_name = 'customize_piercings'
			camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
			zoom_camera = 'customize_character_Zoom'
			part = CAS_Acc_Ears
			stance = Stance_Select_Head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Head
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
	PushTemporaryCASAppearance
	if is_female_char
		SetCASAppearancePartInstance \{part = CAS_Torso
			part_instance = {
				desc_id = F_Fun_Torso_Bra
			}}
	else
		SetCASAppearancePartInstance \{part = CAS_Torso
			part_instance = {
				desc_id = Shirtless
			}}
	endif
	RebuildCurrentCASModel
endscript

script unhide_car_parts_accessories 
	if NOT is_accepting_invite_or_sigining_out
		MergePartIntoTemporaryCASAppearance \{part_list = [
				CAS_Acc_Left
				CAS_Acc_Right
			]}
	endif
endscript

script hide_car_parts_piercings 
	PushTemporaryCASAppearance
	SetCASAppearancePartInstance \{part = CAS_Hair
		part_instance = {
			desc_id = None
		}}
	SetCASAppearancePartInstance \{part = CAS_Hat_Hair
		part_instance = {
			desc_id = None
		}}
	SetCASAppearancePartInstance \{part = CAS_Hat
		part_instance = {
			desc_id = None
		}}
	SetCASAppearancePartInstance \{part = CAS_Acc_Face
		part_instance = {
			desc_id = None
		}}
	RebuildCurrentCASModel
endscript

script unhide_car_parts_piercings 
	if NOT is_accepting_invite_or_sigining_out
		MergePartIntoTemporaryCASAppearance \{part_list = [
				CAS_Acc_Ears
			]}
	endif
endscript
