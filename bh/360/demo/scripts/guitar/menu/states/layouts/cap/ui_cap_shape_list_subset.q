
script ui_create_cap_shape_list_subset 
	requireparams \{[
			part
			section_index
		]
		all}
	make_list_menu {
		vmenu_id = create_cap_shape_list_subset_vmenu
		pad_back_script = shape_list_back
		pad_back_params = {part = <part>}
		text_case = original
		icon = <hist_tex>
		exclusive_device = <state_device>
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_list_subset_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish car_helper_text controller = <state_device>
	endif
	add_shape_list_subset_to_menu exclusive_device = <state_device> part = <part> section_index = <section_index> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>
	launchevent type = focus target = create_cap_shape_list_subset_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cap_shape_list_subset 
	generic_list_destroy
endscript

script add_shape_list_subset_to_menu 
	requireparams \{[
			part
			section_index
		]
		all}
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		0x446383d4 = (<sections> [<section_index>])
		mask = (<0x446383d4>.mask)
		0xa442aaff = 0
		if (<0x446383d4>.desc_id = `font a1`)
			<0xa442aaff> = 1
		endif
		if structurecontains structure = <0x446383d4> 0x84a32342
			current_list_menu :settags 0x654705a4 = (((<mask>) [0]).font)
			current_list_menu :settags 0x4353e067 = (((<mask>) [0]).font)
		endif
		getarraysize (<mask>)
		i = 0
		begin
		add_item = 1
		if (<i> <= 52 && <0xa442aaff> = 1)
			mod a = <i> b = 2
			if (<mod> = 1)
				<add_item> = 0
			endif
		endif
		if (<add_item> = 1)
			if structurecontains structure = ((<mask>) [<i>]) font
				font = (((<mask>) [<i>]).font)
			endif
			if structurecontains structure = (<mask> [<i>]) locked
				price = 100
				if NOT check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<mask> [<i>].pattern)
					is_locked = 1
				endif
			else
				removeparameter \{price}
			endif
			if NOT gotparam \{is_locked}
				add_list_item {
					text = (((<mask>) [<i>]).frontend_desc)
					font = <font>
					price = <price>
					pad_choose_script = shape_list_accept
					pad_choose_params = {part = <part> section_index = <section_index> mask_index = <i> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>}
					additional_focus_script = shape_list_preview_selection
					additional_focus_params = {section = (<sections> [<section_index>]) mask = ((<mask>) [<i>]) part = <part>}
				}
				if NOT gotparam \{first_mask_index}
					first_mask_index = <i>
				endif
			else
				removeparameter \{is_locked}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		if NOT gotparam \{first_mask_index}
			scriptassert \{'first_mask_index not set!'}
			first_mask_index = 0
		endif
		add_layer_to_profile part = <part> section = (<sections> [<section_index>]) mask = ((<mask>) [<first_mask_index>])
		ui_event_add_params cap_index = <cap_index> layer_index = <layer_index>
	endif
endscript

script shape_list_preview_selection 
	killspawnedscript \{name = shape_list_preview_selection_spawned}
	spawnscriptnow shape_list_preview_selection_spawned params = <...>
endscript

script shape_list_preview_selection_spawned 
	ui_event_get_top
	if ((gotparam layer_index) && (gotparam cap_index))
		caswaitforcomposite
		delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index> skip_build
		add_layer_to_profile part = <part> section = <section> mask = <mask>
		ui_event_add_params cap_index = <cap_index> layer_index = <layer_index>
	endif
endscript

script shape_list_cancel_preview 
	ui_event_get_top
	if ((gotparam layer_index) && (gotparam cap_index) && (gotparam part))
		delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	endif
endscript

script shape_list_back 
	shape_list_cancel_preview part = <part>
	generic_event_back
endscript

script shape_list_accept 
	if NOT getcapsectionsarray appearance = $cas_current_appearance part = <part>
		scriptassert \{'GetCAPSectionsArray failed'}
	endif
	ui_event_get_top
	section = (<sections> [<section_index>])
	masks = (<section>.mask)
	mask = ((<masks>) [<mask_index>])
	generic_event_replace state = uistate_cap_shape_edit data = {part = <part> mask = <mask> layer_index = <layer_index> cap_index = <cap_index> part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}
endscript
