
script ui_create_customize_character_head 
	make_generic_car_menu {
		vmenu_id = customize_head_vmenu
		back_state = UIstate_cas
		Title = qs(0x888dd748)
		num_icons = 1
		show_history
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = customize_head_vmenu camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	add_car_menu_text_item \{icon = icon_face
		text = qs(0xb5847ea6)
		choose_state = UIstate_character_face_deformation}
	if NOT (is_female_char)
		add_car_menu_text_item \{icon = icon_facial_hair
			text = qs(0xea973ef8)
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = qs(0xb8dbc11d)
				part = CAS_Male_Facial_Hair
				num_icons = 2
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				hist_tex = icon_facial_hair
				return_stance = Stance_Select_Head
				camera_list = [
					'customize_character_head'
					'customize_character_head_R'
					'customize_character_head_B'
					'customize_character_head_L'
				]
				zoom_camera = 'customize_character_Zoom'
			}}
	endif
	get_section_index_from_desc_id \{part = CAS_Body
		target_desc_id = `Eyeliner	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0xc5bfa956)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = CAS_Body
				text = qs(0xc5bfa956)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = Stance_Select_Head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = CAS_Body
		target_desc_id = `Eyeshadow1	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0x8d5be4ce)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = CAS_Body
				text = qs(0x8d5be4ce)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = Stance_Select_Head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = CAS_Body
		target_desc_id = `Eyeshadow2	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0xa676b70d)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = CAS_Body
				text = qs(0xa676b70d)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = Stance_Select_Head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = CAS_Body
		target_desc_id = `Blush	makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_makeup
			text = qs(0x45536bb3)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = CAS_Body
				text = qs(0x45536bb3)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_makeup
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				return_stance = Stance_Select_Head
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	get_section_index_from_desc_id \{part = CAS_Body
		target_desc_id = `Lip	Makeup`}
	if GotParam \{section_index}
		add_car_menu_text_item {
			icon = icon_lips
			text = qs(0x78b839eb)
			choose_state = UIstate_cap_artist_layer_popout
			choose_state_data = {
				part = CAS_Body
				text = qs(0x78b839eb)
				section_index = <section_index>
				num_icons = 2
				hist_tex = icon_lips
				is_popup
				return_stance = Stance_Select_Head
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
				zoom_camera = 'customize_character_Zoom'
				color_wheel = ($makeup_lip_colorwheel)
			}
		}
		RemoveParameter \{section_index}
	endif
	add_car_menu_text_item \{icon = icon_graphics
		text = qs(0x1fdb379d)
		choose_state = UIstate_cap_main
		choose_state_data = {
			part = CAS_Body
			text = qs(0x1fdb379d)
			div_id = Head
			num_icons = 2
			hist_tex = icon_graphics
			additional_deinit_script = unhide_car_parts_for_face_paint
			additional_init_script = hide_car_parts_for_face_paint
			return_stance = Stance_Select_Head
			camera_list = [
				'customize_character_head'
				'customize_character_head_R'
				'customize_character_head_B'
				'customize_character_head_L'
			]
			zoom_camera = 'customize_character_Zoom'
			cam_name = 'customize_character_head'
		}}
	if GetCurrentCASObject
		bandmanager_changestance name = <cas_object> stance = Stance_Select_Head no_wait
	endif
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_return_customize_character_head 
	menu_finish car_helper_text controller = <state_device>
endscript

script ui_destroy_customize_character_head 
	destroy_generic_menu
endscript

script ui_init_customize_character_head 
	ui_cas_precache \{part = CAS_Body}
endscript

script hide_car_parts_for_face_paint 
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

script unhide_car_parts_for_face_paint 
	if NOT is_accepting_invite_or_sigining_out
		MergePartIntoTemporaryCASAppearance \{part_list = [
				CAS_Body
				cas_facial_hair
			]}
	endif
endscript
