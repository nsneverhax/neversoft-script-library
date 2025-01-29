
script ui_create_cag_metallica_presets \{stance = stance_select_guitar}
	SpawnScriptNow ui_create_cag_metallica_presets_spawned params = {<...>}
endscript

script ui_create_cag_metallica_presets_spawned 
	make_list_menu {
		vmenu_id = create_cag_metallica_vmenu
		pad_back_script = list_exit_restore
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_metallica_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	0xce9067fe = <current_desc_id>
	<current_part> = 0
	<num_parts_added> = 0
	if (<part> = cas_guitar_body)
		<cas_presets> = cas_preset_metallica_guitars
		finish_part = cas_guitar_finish
		detail_part = cas_guitar_body_detail
		get_part_current_desc_id \{part = cas_guitar_finish}
		0x0f9f29b8 = <current_desc_id>
		get_part_current_desc_id \{part = cas_guitar_body_detail}
		0xfc094de8 = <current_desc_id>
	elseif (<part> = cas_bass_body)
		<cas_presets> = cas_preset_metallica_basses
		finish_part = cas_bass_finish
		detail_part = cas_bass_body_detail
		get_part_current_desc_id \{part = cas_bass_finish}
		0x0f9f29b8 = <current_desc_id>
		get_part_current_desc_id \{part = cas_bass_body_detail}
		0xfc094de8 = <current_desc_id>
	endif
	GetArraySize ($<cas_presets>)
	<num_presets> = <array_Size>
	<i> = 0
	begin
	<desc_id> = ($<cas_presets> [<i>].<part>.desc_id)
	0xd4b99814 = None
	if StructureContains structure = ($<cas_presets> [<i>]) (<finish_part>)
		0xd4b99814 = ($<cas_presets> [<i>].<finish_part>.desc_id)
	endif
	detail_id = None
	if StructureContains structure = ($<cas_presets> [<i>]) (<detail_part>)
		detail_id = ($<cas_presets> [<i>].<detail_part>.desc_id)
	endif
	if (<desc_id> = <0xce9067fe>)
		if (<0xd4b99814> = <0x0f9f29b8>)
			if (<detail_id> = <0xfc094de8>)
				<current_part> = <num_parts_added>
			endif
		endif
	endif
	item_text = qs(0x3f1bbbb1)
	if StructureContains structure = ($<cas_presets> [<i>]) preset_name
		item_text = ($<cas_presets> [<i>].preset_name)
	endif
	add_item = 1
	if StructureContains structure = ($<cas_presets> [<i>]) 0x87cd730b
		GetArraySize ($0x87cd730b)
		<num_bodies> = <array_Size>
		<j> = 0
		begin
		0x6254e4aa = ($<cas_presets> [<i>].0x87cd730b.desc_id)
		if ($0x87cd730b [<j>].desc_id = <0x6254e4aa>)
			if is_part_unlocked part = 0x87cd730b desc_id = <0x6254e4aa> savegame = ($cas_current_savegame)
				if NOT is_part_purchased part = 0x87cd730b desc_id = <0x6254e4aa> savegame = ($cas_current_savegame)
					price = (($0x87cd730b [<j>].price))
					formatText TextName = pad_choose_dialogue qs(0x50618374) s = (<item_text>)
					show_purchasable = 1
					pad_back_script = generic_event_back
				endif
			else
				add_item = 0
			endif
			if StructureContains structure = ($0x87cd730b [<j>]) exclusive
				add_item = 0
			endif
			break
		endif
		<j> = (<j> + 1)
		repeat <num_bodies>
	endif
	if (<add_item> = 1)
		add_list_item {
			text = <item_text>
			pad_choose_script = cag_metallica_presets_choose
			pad_choose_params = {part = {desc_id = <0x6254e4aa>} is_preset = 1 presets = 0x87cd730b}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			additional_focus_script = cag_metallica_presets_update
			additional_focus_params = {cas_presets = <cas_presets> part = <part> index = <i> disable_rotation_zoom = <disable_rotation_zoom>
				show_purchasable = <show_purchasable>}
			price = <price>
			pad_choose_dialogue = <pad_choose_dialogue>
		}
		<num_parts_added> = (<num_parts_added> + 1)
	endif
	if GotParam \{price}
		RemoveParameter \{price}
	endif
	if GotParam \{pad_choose_dialogue}
		RemoveParameter \{pad_choose_dialogue}
	endif
	if GotParam \{show_purchasable}
		RemoveParameter \{show_purchasable}
	endif
	<i> = (<i> + 1)
	repeat <num_presets>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text}
	LaunchEvent Type = focus target = create_cag_metallica_vmenu data = {child_index = <current_part>}
endscript

script cag_metallica_presets_update 
	<preset> = ($<cas_presets> [<index>])
	if (<part> = cas_guitar_body)
		cag_metallica_presets_update_guitar preset = <preset>
	elseif (<part> = cas_bass_body)
		cag_metallica_presets_update_bass preset = <preset>
	endif
	SpawnScriptNow \{trigger_cas_rebuild_loop}
endscript

script ui_destroy_cag_metallica_presets 
	generic_list_destroy
	menu_finish \{car_helper_text}
endscript

script ui_init_cag_metallica_presets 
	pushtemporarycasappearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_metallica_presets 
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_metallica_presets_update_guitar 
	0xe2247423 = ($instrument_part_sets.guitar)
	i = 0
	GetArraySize (<0xe2247423>)
	begin
	part_slot = (<0xe2247423> [(<i>)])
	if StructureContains structure = <preset> <part_slot>
		update_part_cap preset = <preset> part = <part_slot>
	else
		editcasappearance target = clearpart targetparams = {part = <part_slot>}
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script cag_metallica_presets_update_bass 
	0xe2247423 = ($instrument_part_sets.bass)
	i = 0
	GetArraySize (<0xe2247423>)
	begin
	part_slot = (<0xe2247423> [(<i>)])
	if StructureContains structure = <preset> <part_slot>
		update_part_cap preset = <preset> part = <part_slot>
	else
		editcasappearance target = clearpart targetparams = {part = <part_slot>}
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script update_part_cap 
	editcasappearance target = setpart targetparams = {part = <part> desc_id = (<preset>.<part>.desc_id)}
	if StructureContains structure = (<preset>.<part>) cap
		<cap_array> = (<preset>.<part>.cap)
		setcasappearancecap part = <part> cap = <cap_array>
	endif
	if StructureContains structure = (<preset>.<part>) chosen_materials
		<chosen_materials> = (<preset>.<part>.chosen_materials)
		setcasappearancematerial part = <part> material = material1 value = (<chosen_materials>.material1)
	endif
endscript

script cag_metallica_presets_choose 
	if ($cag_instrument_type = guitar)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = metallica}
	elseif ($cag_instrument_type = bass)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = metallica}
	endif
	generic_event_back
endscript
