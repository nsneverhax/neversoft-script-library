
script ui_create_cap_shape_list_subset 
	RequireParams \{[
			part
			section_index
		]
		all}
	make_list_menu {
		vmenu_id = create_cap_shape_list_subset_vmenu
		title = <title>
		pad_back_script = shape_list_back
		pad_back_params = {part = <part>}
		text_case = Original
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
	if generic_list_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <num_elements_added>
	endif
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
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		mask = ((<sections> [<section_index>]).mask)
		GetArraySize (<mask>)
		i = 0
		begin
		if StructureContains structure = (<mask> [<i>]) locked
			if check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<mask> [<i>].pattern)
				locked = {
					is_unlocked_item
				}
			else
				locked = {
					is_locked_item
					pad_choose_script = nullscript
				}
			endif
		endif
		add_list_item {
			text = (((<mask>) [<i>]).frontend_desc)
			font = <font>
			index = <i>
			pad_choose_script = shape_list_accept
			pad_choose_params = {part = <part> section_index = <section_index> mask_index = <i> camera_list = <camera_list> zoom_camera = <zoom_camera> cam_name = <cam_name>}
			additional_focus_script = shape_list_preview_selection
			additional_focus_params = {section = (<sections> [<section_index>]) mask = ((<mask>) [<i>]) part = <part>}
			<locked>
		}
		if NOT GotParam \{first_mask_index}
			first_mask_index = <i>
		endif
		RemoveParameter \{locked}
		i = (<i> + 1)
		repeat <array_Size>
		if NOT GotParam \{first_mask_index}
			ScriptAssert \{'first_mask_index not set!'}
			first_mask_index = 0
		endif
		add_layer_to_profile part = <part> section = (<sections> [<section_index>]) mask = ((<mask>) [<first_mask_index>])
		ui_event_add_params cap_index = <cap_index> layer_index = <layer_index>
		return num_elements_added = <i>
	endif
	return \{num_elements_added = 0}
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
	ui_sfx \{menustate = car
		uitype = back}
	KillSpawnedScript \{Name = shape_list_preview_selection_spawned}
	shape_list_cancel_preview part = <part>
	generic_event_back
endscript

script shape_list_accept 
	ui_sfx \{menustate = Generic
		uitype = select}
	if NOT getcapsectionsarray appearance = $cas_current_appearance part = <part>
		ScriptAssert \{'GetCAPSectionsArray failed'}
	endif
	ui_event_get_top
	section = (<sections> [<section_index>])
	masks = (<section>.mask)
	mask = ((<masks>) [<mask_index>])
	generic_event_replace state = uistate_cap_shape_edit data = {part = <part> mask = <mask> layer_index = <layer_index> cap_index = <cap_index> part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}
endscript
