
script ui_create_character_face_deformation 
	make_generic_car_menu {
		vmenu_id = face_deformation_vmenu
		Title = qs(0x8c4aaf6a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = face_deformation_vmenu camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item \{icon = Head_Age
		text = qs(0x01f45c51)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0x01f45c51)
			part = CAS_Age
			num_icons = 2
			is_popup
			hist_tex = Head_Age
			return_stance = Stance_Select_Head
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
	add_car_menu_text_item {
		text = qs(0x36291eb1)
		icon = icon_head_scale
		choose_state = UIstate_character_face_deformation_options
		choose_state_data = {text = qs(0x36291eb1) option_array = ($cas_head_bone_options) hist_tex = icon_head_scale}
	}
	add_car_menu_text_item {
		icon = Head_Nose
		text = qs(0x0c7253fc)
		choose_state = UIstate_character_face_deformation_options
		choose_state_data = {text = qs(0x0c7253fc) option_array = ($cas_nose_bone_options) hist_tex = Head_Nose stance = Stance_Select_Profile}
	}
	add_car_menu_text_item {
		icon = Head_Mouth
		text = qs(0xa7000f64)
		choose_state = UIstate_character_face_deformation_options
		choose_state_data = {text = qs(0xa7000f64) option_array = ($cas_mouth_bone_options) hist_tex = Head_Mouth}
	}
	add_car_menu_text_item \{icon = Head_Teeth
		text = qs(0xeeadbb15)
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs(0xeeadbb15)
			part = CAS_Teeth
			num_icons = 2
			is_popup
			hist_tex = Head_Teeth
			return_stance = Stance_Select_Head
			face_anim = '_teeth'
			return_face_anim = '_rocker'
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
		}}
	add_car_menu_text_item {
		icon = Head_Eye
		text = qs(0xed7d13b8)
		choose_state = UIstate_character_face_deformation_options
		choose_state_data = {text = qs(0xed7d13b8) option_array = ($cas_eye_bone_options) hist_tex = Head_Eye return_stance = Stance_Select_Head}
	}
	add_car_menu_text_item {
		icon = Head_Eyebrow
		text = qs(0xd2f0c968)
		choose_state = UIstate_character_face_deformation_options
		choose_state_data = {text = qs(0xd2f0c968) option_array = ($cas_brow_bone_options) hist_tex = Head_Eyebrow}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_deformation
	if (<visit_deformation> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_deformation = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xbd2a1598)
			}}
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_character_face_deformation 
	clean_up_user_control_helpers
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_character_face_deformation 
	destroy_generic_menu
endscript

script ui_init_character_face_deformation 
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
	SetCASAppearancePartInstance \{part = CAS_Acc_Ears
		part_instance = {
			desc_id = None
		}}
	RebuildCurrentCASModel
endscript

script ui_deinit_character_face_deformation 
	if NOT is_accepting_invite_or_sigining_out
		MergePartIntoTemporaryCASAppearance \{part_list = [
				CAS_Body
				CAS_Age
				CAS_Eyes
				CAS_Eyebrows
				CAS_Teeth
			]}
	endif
endscript
