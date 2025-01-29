
script ui_create_cap_shape_list_subset 
	RequireParams \{[
			part
			section_index
		]
		all}
	make_list_menu {
		vmenu_id = create_cap_shape_list_subset_vmenu
		pad_back_script = shape_list_back
		pad_back_params = {part = <part>}
		text_case = Original
		icon = <hist_tex>
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		setup_cas_menu_handlers vmenu_id = create_cap_shape_list_subset_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
	add_shape_list_subset_to_menu part = <part> section_index = <section_index> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>
	LaunchEvent Type = focus target = create_cap_shape_list_subset_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cap_shape_list_subset 
	generic_list_destroy
endscript

script add_shape_list_subset_to_menu 
	RequireParams \{[
			part
			section_index
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	mask = ((<sections> [<section_index>]).mask)
	add_layer_to_profile part = <part> section = (<sections> [<section_index>]) mask = ((<mask>) [0])
	ui_event_add_params cap_index = <cap_index> layer_index = <layer_index>
	GetArraySize (<mask>)
	i = 0
	begin
	if StructureContains structure = ((<mask>) [<i>]) font
		font = (((<mask>) [<i>]).font)
		if (<font> = fontgrid_text_a10)
			bigger_text = {text_size = (291.0, 45.0) internal_scale = (1.5, 1.0)}
		endif
	endif
	add_list_item {
		text = (((<mask>) [<i>]).frontend_desc)
		font = <font>
		<bigger_text>
		pad_choose_script = shape_list_accept
		pad_choose_params = {part = <part> section_index = <section_index> mask_index = <i> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>}
		additional_focus_script = shape_list_preview_selection
		additional_focus_params = {section = (<sections> [<section_index>]) mask = ((<mask>) [<i>]) part = <part>}
	}
	i = (<i> + 1)
	repeat <array_Size>
endscript

script shape_list_preview_selection 
	KillSpawnedScript \{Name = shape_list_preview_selection_spawned}
	SpawnScriptNow shape_list_preview_selection_spawned params = <...>
endscript

script shape_list_preview_selection_spawned 
	ui_event_get_top
	if ((GotParam layer_index) && (GotParam cap_index))
		caswaitforcomposite
		delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index> skip_build
		add_layer_to_profile part = <part> section = <section> mask = <mask>
		ui_event_add_params cap_index = <cap_index> layer_index = <layer_index>
	endif
endscript

script shape_list_cancel_preview 
	ui_event_get_top
	if ((GotParam layer_index) && (GotParam cap_index) && (GotParam part))
		delete_layer part = <part> cap_index = <cap_index> layer_index = <layer_index>
	endif
endscript

script shape_list_back 
	se_setprops \{block_events}
	KillSpawnedScript \{Name = shape_list_preview_selection_spawned}
	shape_list_cancel_preview part = <part>
	generic_event_back
endscript

script shape_list_accept 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	ui_event_get_top
	section = (<sections> [<section_index>])
	masks = (<section>.mask)
	mask = ((<masks>) [<mask_index>])
	menu_start_transition
	generic_event_replace state = uistate_cap_shape_edit data = {part = <part> mask = <mask> layer_index = <layer_index> cap_index = <cap_index> part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}
endscript
