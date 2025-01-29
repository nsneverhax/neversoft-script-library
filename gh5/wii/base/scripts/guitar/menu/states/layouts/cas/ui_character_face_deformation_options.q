
script ui_create_character_face_deformation_options 
	printstruct <...>
	ui_event_add_params hist_tex = <hist_tex>
	if NOT getcasappearancepart \{part = cas_body}
		ScriptAssert \{'%s not found'
			s = cas_body}
	endif
	if NOT getactualcasoptionstruct part = cas_body desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_body t = <desc_id>
	endif
	make_generic_car_menu {
		vmenu_id = create_character_face_deformation_options_vmenu
		title = <text>
		exclusive_device = <state_device>
		show_history
	}
	setup_cas_menu_handlers \{vmenu_id = create_character_face_deformation_options_vmenu
		camera_list = [
			'customize_character_head'
			'customize_character_head_R'
			'customize_character_head_B'
			'customize_character_head_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains structure = (<option_array> [<i>]) bonemenu
		if find_bone_deform_info deform_bones = (<deform_bones>) group_name = ((<option_array> [<i>]).group_name)
			RemoveParameter \{invert}
			if StructureContains structure = (<option_array> [<i>]) invert
				invert = {invert}
			endif
			if StructureContains structure = (<option_array> [<i>]) icon_rot
				icon_rot = ((<option_array> [<i>]).icon_rot)
			else
				RemoveParameter \{icon_rot}
			endif
			if StructureContains structure = (<option_array> [<i>]) icon
				cas_get_bone_slider_value part = cas_body group_name = ((<option_array> [<i>]).group_name)
				formatText checksumName = widget_id 'widget_%i' i = <i>
				<set_up_down> = true
				if StructureContains structure = (<option_array> [<i>]) pad_direction
					if (((<option_array> [<i>]).pad_direction) = horiz)
						<set_up_down> = FALSE
						<pad_left_script> = update_bone_deformation
						<pad_left_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
						<pad_right_script> = update_bone_deformation
						<pad_right_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
						RemoveParameter \{pad_up_script}
						RemoveParameter \{pad_up_params}
						RemoveParameter \{pad_down_script}
						RemoveParameter \{pad_down_params}
					endif
				endif
				if (<set_up_down> = true)
					<pad_up_script> = update_bone_deformation
					<pad_up_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
					<pad_down_script> = update_bone_deformation
					<pad_down_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
					RemoveParameter \{pad_left_script}
					RemoveParameter \{pad_left_params}
					RemoveParameter \{pad_right_script}
					RemoveParameter \{pad_right_params}
				endif
				button_widget_add_item {
					widget_id = <widget_id>
					text = ((<option_array> [<i>]).text)
					button_icon = ((<option_array> [<i>]).icon)
					min = <min_slider>
					Max = <max_slider>
					start_value = <slider>
					step = ((<option_array> [<i>]).step)
					pad_up_script = <pad_up_script>
					pad_up_params = <pad_up_params>
					pad_down_script = <pad_down_script>
					pad_down_params = <pad_down_params>
					pad_left_script = <pad_left_script>
					pad_left_params = <pad_left_params>
					pad_right_script = <pad_right_script>
					pad_right_params = <pad_right_params>
					fill_type = ((<option_array> [<i>]).fill_type)
					icon_rot = <icon_rot>
					<invert>
					init_helper_text = {car_helper_text}
					deinit_helper_text = {car_helper_text_extra}
					deinit_script = widget_restore_cap
					accept_script = widget_accept_cap
					init_script = widget_init_cap
					camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
					zoom_camera = 'customize_character_Zoom'
				}
			else
				cas_create_bonemenu_slider {
					deform_info = <bone_deform_info>
					part = cas_body
					pad_back_script = ui_event
					pad_back_params = {event = menu_back}
				}
			endif
		endif
	endif
	if StructureContains structure = (<option_array> [<i>]) replacemenu
		if StructureContains structure = (<option_array> [<i>]) stance
			stance = ((<option_array> [<i>]).stance)
		endif
		if StructureContains structure = (<option_array> [<i>]) return_stance
			return_stance = ((<option_array> [<i>]).return_stance)
		endif
		add_car_menu_icon_item {
			icon = ((<option_array> [<i>]).hist_tex)
			text = ((<option_array> [<i>]).text)
			choose_state = uistate_popout_select_part
			choose_state_data = {
				text = ((<option_array> [<i>]).text)
				part = ((<option_array> [<i>]).part)
				is_popup
				bonemenu_popup = cas_body
				hist_tex = ((<option_array> [<i>]).hist_tex)
				stance = <stance>
				return_stance = <return_stance>
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom'
			}
		}
	endif
	if StructureContains structure = (<option_array> [<i>]) materialmenu
		add_car_menu_icon_item {
			icon = ((<option_array> [<i>]).hist_tex)
			text = ((<option_array> [<i>]).text)
			choose_state = uistate_cas_color_edit
			choose_state_data = {
				text = ((<option_array> [<i>]).text)
				part = ((<option_array> [<i>]).part)
				camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom'
				part_materials = [{desc_id = ((<option_array> [<i>]).desc_id) frontend_desc = ((<option_array> [<i>]).text)}]
				num_states = 1
				num_icons = 1
				hist_tex = fingernails
				color_wheel = ($hair_colorwheel)
				stance = ((<option_array> [<i>]).stance)
				return_stance = ((<option_array> [<i>]).return_stance)
			}
		}
	endif
	i = (<i> + 1)
	repeat <array_Size>
	add_car_menu_icon_item {
		icon = widget_default
		text = qs(0xfb546d37)
		pad_choose_script = restore_group_defaults
		pad_choose_params = {option_array = <option_array> deform_bones = <deform_bones> part = cas_body}
		pad_choose_sound = nullsound
	}
	menu_finish car_helper_text_back controller = <state_device>
endscript

script ui_return_character_face_deformation_options 
	menu_finish car_helper_text_back controller = <state_device>
endscript

script ui_destroy_character_face_deformation_options 
	destroy_generic_menu
endscript

script ui_init_character_face_deformation_options 
	cas_bonemenu_begin \{part = cas_body}
	pushtemporarycasappearance
endscript

script ui_deinit_character_face_deformation_options 
	cas_bonemenu_exit \{part = cas_body}
	poptemporarycasappearance
endscript

script restore_group_defaults 
	RequireParams \{[
			part
			option_array
		]
		all}
	push_unsafe_for_shutdown \{reason = restore_group_defaults}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if StructureContains structure = ($cas_current_appearance) body_preset_index
		random_preset_index = (($cas_current_appearance).body_preset_index)
	endif
	if (<desc_id> = gh4_car_male)
		default_preset_profile = {
			cas_eyes = {desc_id = car_blue_eyes}
			cas_male_eyebrows = {desc_id = car_default_brow}
		}
		if GotParam \{random_preset_index}
			default_preset_profile = {<default_preset_profile> ($cas_preset_body_male [<random_preset_index>])}
		endif
	else
		default_preset_profile = {
			cas_eyes = {desc_id = car_blue_eyes}
			cas_female_eyebrows = {desc_id = car_default_brow}
		}
		if GotParam \{random_preset_index}
			default_preset_profile = {<default_preset_profile> ($cas_preset_body_female [<random_preset_index>])}
		endif
	endif
	preset_body_bones = {}
	if StructureContains structure = <default_preset_profile> cas_body
		if StructureContains structure = (<default_preset_profile>.cas_body) bones
			preset_body_bones = ((<default_preset_profile>.cas_body).bones)
		endif
	endif
	cas_bonemenu_exit \{part = cas_body}
	if NOT GotParam \{bones}
		bones = {}
	endif
	SoundEvent \{event = character_reset}
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains structure = (<option_array> [<i>]) group_name
		this_group_name = ((<option_array> [<i>]).group_name)
		if StructureContains structure = bones Name = <this_group_name>
			RemoveComponent structure_name = bones Name = <this_group_name>
		endif
		if StructureContains structure = <preset_body_bones> <this_group_name>
			AddParam structure_name = bones Name = <this_group_name> value = (<preset_body_bones>.<this_group_name>)
		endif
	elseif StructureContains structure = (<option_array> [<i>]) part
		this_part_name = ((<option_array> [<i>]).part)
		if checksumequals a = <this_part_name> b = cas_eyes
			set_preset_default_part part = cas_eyes default_preset_profile = <default_preset_profile> remove_material_color = eyes
			rebuild_model = 1
		elseif checksumequals a = <this_part_name> b = cas_eyebrows
			set_preset_default_part part = cas_eyebrows default_preset_profile = <default_preset_profile> remove_material_color = eyebrows
			rebuild_model = 1
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if GotParam \{rebuild_model}
		rebuildcurrentcasmodel
	endif
	cas_bonemenu_begin \{part = cas_body}
	setcasappearancebones part = <part> bones = <bones>
	cas_bonemenu_apply_changes
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains structure = ((<option_array>) [<i>]) bonemenu
		formatText checksumName = widget_id 'widget_%i' i = <i>
		cas_get_bone_slider_value part = cas_body group_name = ((<option_array> [<i>]).group_name)
		button_widget_set_value widget_id = <widget_id> new_value = <slider>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	pop_unsafe_for_shutdown \{reason = restore_group_defaults}
endscript

script set_preset_default_part 
	RequireParams \{[
			part
			default_preset_profile
		]
		all}
	resolvebodyspecificpartinappearance part = <part>
	if StructureContains structure = <default_preset_profile> <part>
		editcasappearance {
			target = setpart
			targetparams = {part = <part> (<default_preset_profile>.<part>)}
		}
	endif
	if GotParam \{remove_material_color}
		chosen_materials = {}
		if StructureContains structure = (($cas_current_appearance).cas_body) chosen_materials
			chosen_materials = {<chosen_materials> ((($cas_current_appearance).cas_body).chosen_materials)}
		endif
		RemoveComponent structure_name = chosen_materials Name = <remove_material_color>
		<str> = (($cas_current_appearance).cas_body)
		appendstruct struct = cas_current_appearance Field = cas_body params = {<str> chosen_materials = <chosen_materials>} globalstruct
	endif
endscript

script update_bone_deformation 
	RequireParams \{[
			part
			group_name
		]
		all}
	getcasappearancepart part = <part>
	if NOT GotParam \{bones}
		bones = {}
	endif
	updatestructelement struct = <bones> element = <group_name> value = <value>
	setcasappearancebones part = <part> bones = <newstruct>
	if GotParam \{rebuild}
		rebuildcurrentcasmodel
	else
		updatecurrentcasmodel buildscript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
	endif
endscript
