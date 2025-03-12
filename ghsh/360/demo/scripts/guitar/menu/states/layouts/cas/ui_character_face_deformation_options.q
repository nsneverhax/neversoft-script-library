
script ui_create_character_face_deformation_options 
	ui_event_add_params hist_tex = <hist_tex>
	if NOT getcasappearancepart \{part = cas_body}
		scriptassert \{'%s not found'
			s = cas_body}
	endif
	if NOT getactualcasoptionstruct part = cas_body desc_id = <desc_id>
		scriptassert '%s %t not found' s = cas_body t = <desc_id>
	endif
	make_generic_menu {
		vmenu_id = create_character_face_deformation_options_vmenu
		title = <text>
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
	getarraysize \{option_array}
	i = 0
	begin
	if structurecontains structure = (<option_array> [<i>]) bonemenu
		if find_bone_deform_info deform_bones = (<deform_bones>) group_name = ((<option_array> [<i>]).group_name)
			removeparameter \{invert}
			if structurecontains structure = (<option_array> [<i>]) invert
				invert = {invert}
			endif
			if structurecontains structure = (<option_array> [<i>]) icon_rot
				icon_rot = ((<option_array> [<i>]).icon_rot)
			else
				removeparameter \{icon_rot}
			endif
			if structurecontains structure = (<option_array> [<i>]) icon
				cas_get_bone_slider_value part = cas_body group_name = ((<option_array> [<i>]).group_name)
				formattext checksumname = widget_id 'widget_%i' i = <i>
				<set_up_down> = true
				if structurecontains structure = (<option_array> [<i>]) pad_direction
					if (((<option_array> [<i>]).pad_direction) = horiz)
						<set_up_down> = false
						<pad_left_script> = update_bone_deformation
						<pad_left_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
						<pad_right_script> = update_bone_deformation
						<pad_right_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
						removeparameter \{pad_up_script}
						removeparameter \{pad_up_params}
						removeparameter \{pad_down_script}
						removeparameter \{pad_down_params}
					endif
				endif
				if (<set_up_down> = true)
					<pad_up_script> = update_bone_deformation
					<pad_up_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
					<pad_down_script> = update_bone_deformation
					<pad_down_params> = {part = cas_body group_name = ((<option_array> [<i>]).group_name)}
					removeparameter \{pad_left_script}
					removeparameter \{pad_left_params}
					removeparameter \{pad_right_script}
					removeparameter \{pad_right_params}
				endif
				button_widget_add_item {
					widget_id = <widget_id>
					text = ((<option_array> [<i>]).text)
					button_icon = ((<option_array> [<i>]).icon)
					min = <min_slider>
					max = <max_slider>
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
	if structurecontains structure = (<option_array> [<i>]) capmenu
		if is_part_capable \{part = cas_body}
			get_section_index_from_desc_id part = cas_body target_desc_id = ((<option_array> [<i>]).desc_id)
			if gotparam \{section_index}
				add_generic_menu_icon_item {
					icon = ((<option_array> [<i>]).hist_tex)
					text = ((<option_array> [<i>]).text)
					choose_state = uistate_cap_artist_layer_popout
					choose_state_data = {part = cas_body text = ((<option_array> [<i>]).text) section_index = <section_index> hist_tex = ((<option_array> [<i>]).hist_tex) is_popup camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L'] zoom_camera = 'customize_character_Zoom'}
				}
			endif
		endif
	endif
	if structurecontains structure = (<option_array> [<i>]) replacemenu
		if structurecontains structure = (<option_array> [<i>]) stance
			stance = ((<option_array> [<i>]).stance)
		endif
		if structurecontains structure = (<option_array> [<i>]) return_stance
			return_stance = ((<option_array> [<i>]).return_stance)
		endif
		add_generic_menu_icon_item {
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
	i = (<i> + 1)
	repeat <array_size>
	add_generic_menu_icon_item {
		icon = widget_default
		text = qs(0xfb546d37)
		pad_choose_script = restore_group_defaults
		pad_choose_params = {option_array = <option_array> deform_bones = <deform_bones> part = cas_body}
		pad_choose_sound = nullsound
		text_dims = (250.0, 45.0)
	}
	bx_refreshmenuitemsindexes \{vmenu_id = create_character_face_deformation_options_vmenu}
	bx_genericmenu_setupscrollbar num_items = <num_items>
	menu_finish \{car_helper_text_back}
endscript

script ui_return_character_face_deformation_options 
	menu_finish \{car_helper_text_back}
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
	requireparams \{[
			part
			option_array
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve donotresolve
	endif
	cas_bonemenu_exit \{part = cas_body}
	if gotparam \{bones}
		soundevent \{event = character_reset}
		getarraysize \{option_array}
		i = 0
		begin
		if structurecontains structure = (<option_array> [<i>]) group_name
			if structurecontains structure = bones name = ((<option_array> [<i>]).group_name)
				removecomponent structure_name = bones name = ((<option_array> [<i>]).group_name)
			endif
		elseif structurecontains structure = (<option_array> [<i>]) part
			if checksumequals a = ((<option_array> [<i>]).part) b = cas_eyes
				cas_add_item_to_appearance \{part = cas_eyes
					desc_id = car_blue_eyes}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	cas_bonemenu_begin \{part = cas_body}
	setcasappearancebones part = <part> bones = <bones>
	cas_bonemenu_apply_changes
	getarraysize \{option_array}
	i = 0
	begin
	if structurecontains structure = ((<option_array>) [<i>]) bonemenu
		formattext checksumname = widget_id 'widget_%i' i = <i>
		cas_get_bone_slider_value part = cas_body group_name = ((<option_array> [<i>]).group_name)
		button_widget_set_value widget_id = <widget_id> new_value = <slider>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script update_bone_deformation 
	requireparams \{[
			part
			group_name
		]
		all}
	getcasappearancepart part = <part>
	if NOT gotparam \{bones}
		bones = {}
	endif
	updatestructelement struct = <bones> element = <group_name> value = <value>
	setcasappearancebones part = <part> bones = <newstruct>
	updatecurrentcasmodel buildscript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
endscript
