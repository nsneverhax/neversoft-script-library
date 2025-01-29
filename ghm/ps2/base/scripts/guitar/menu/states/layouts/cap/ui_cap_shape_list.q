
script ui_create_cap_shape_list 

	if NOT checksumequals a = <part> b = cas_band_logo
		show_history = {show_history}
	endif
	make_generic_menu {
		vmenu_id = create_cap_shape_list_vmenu
		title = qs(0xd489d6c4)
		<show_history>
	}
	add_shape_list_to_menu part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <override_base_name>
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
	LaunchEvent Type = focus target = create_cap_shape_list_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cap_shape_list 
	destroy_generic_menu
endscript

script add_shape_list_to_menu 

	if NOT getcasappearancepart part = <part>

	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>

	endif
	if GotParam \{sections}
		GetArraySize \{sections}
		i = 0
		begin
		if NOT StructureContains structure = (<sections> [<i>]) pre_userlayer
			if NOT StructureContains structure = (<sections> [<i>]) post_userlayer
				if is_target_in_div part = <part> div_id = <div_id> target = (<sections> [<i>])
					catagory_added = 1
					get_catagory_icon desc_id = ((<sections> [<i>]).desc_id)
					add_generic_menu_text_item {
						text = ((<sections> [<i>]).frontend_desc)
						choose_state = uistate_cap_shape_list_subset
						choose_state_data = {part = <part> section_index = <i> hist_name = ((<sections> [<i>]).frontend_desc) hist_tex = <icon> is_popup camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>}
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if NOT GotParam \{catagory_added}
		if NOT CD
			add_generic_menu_text_item \{text = qs(0x720310b6)
				choose_back}
		endif
	endif
endscript

script ui_return_cap_shape_list 
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
endscript

script get_catagory_icon 

	switch <desc_id>
		case car_metallica
		return \{icon = category_metallica}
		case car_bands
		return \{icon = category_bands}
		case car_primitives
		return \{icon = category_primitives}
		case car_outlines_primitives
		return \{icon = category_outlines}
		case car_tattoo_decal
		return \{icon = category_gradients}
		case car_icon_decals
		return \{icon = category_icons}
		case car_graphics
		return \{icon = category_graphics}
		case car_sponsors
		return \{icon = category_sponsors}
		case `font	a1`
		return \{icon = category_font_harbour}
		case `font	a3`
		return \{icon = category_font_square40}
		case `font	a6`
		return \{icon = category_font_bordello}
		case `font	a8`
		return \{icon = category_font_aaux}
		default
		return \{icon = menu_history_unknown}
	endswitch
endscript
