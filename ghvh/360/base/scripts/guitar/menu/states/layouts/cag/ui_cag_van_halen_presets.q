
script ui_create_cag_van_halen_presets \{stance = stance_select_guitar}
	SpawnScriptNow ui_create_cag_van_halen_presets_spawned params = {<...>}
endscript

script ui_create_cag_van_halen_presets_spawned 
	make_list_menu {
		vmenu_id = create_cag_van_halen_vmenu
		pad_back_script = list_exit_restore
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_van_halen_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	<current_part> = 0
	<num_parts_added> = 0
	if (<part> = cas_guitar_body)
		<cas_presets> = cas_vh_preset_guitars
	elseif (<part> = cas_bass_body)
		<cas_presets> = cas_vh_preset_basses
	else
		printf \{channel = bort
			'No <cas_presets> SET'}
	endif
	GetArraySize ($<cas_presets>)
	<num_presets> = <array_Size>
	printf channel = bort 'PRESETS %d (%x)' d = <num_presets> X = <part>
	<i> = 0
	begin
	<desc_id> = ($<cas_presets> [<i>].desc_id)
	if (<desc_id> = <current_desc_id>)
		<current_part> = <num_parts_added>
	endif
	GetArraySize ($<part>)
	<num_bodies> = <array_Size>
	<add_item> = 1
	<j> = 0
	begin
	if ($<part> [<j>].desc_id = <desc_id>)
		if is_part_unlocked part = (<part>) desc_id = <desc_id> savegame = ($cas_current_savegame)
			if NOT is_part_purchased part = (<part>) desc_id = <desc_id> savegame = ($cas_current_savegame)
				price = (($<part> [<j>].price))
				formatText TextName = pad_choose_dialogue qs(0x50618374) s = ((($<part>) [<j>]).frontend_desc)
				show_purchasable = 1
				pad_back_script = generic_event_back
			endif
			<item_text> = ($<part> [<j>].frontend_desc)
		else
			<add_item> = 0
		endif
		if StructureContains structure = ($<part> [<j>]) exclusive
			<add_item> = 0
		endif
		break
	endif
	<j> = (<j> + 1)
	repeat <num_bodies>
	if (<add_item> = 1)
		add_list_item {
			text = <item_text>
			pad_choose_script = cag_van_halen_presets_choose
			pad_choose_params = {part = <part>}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			additional_focus_script = cag_van_halen_presets_update
			additional_focus_params = {cas_presets = <cas_presets> part = <part> index = <i> disable_rotation_zoom = <disable_rotation_zoom>
				show_purchasable = <show_purchasable> show_editable = <show_editable>}
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
	LaunchEvent Type = focus target = create_cag_van_halen_vmenu data = {child_index = <current_part>}
endscript

script cag_van_halen_presets_update 
	<preset> = ($<cas_presets> [<index>])
	if (<part> = cas_guitar_body)
		cag_van_halen_presets_update_guitar preset = <preset>
	elseif (<part> = cas_bass_body)
		cag_van_halen_presets_update_bass preset = <preset>
	endif
	rebuildcurrentcasmodel
endscript

script ui_destroy_cag_van_halen_presets 
	generic_list_destroy
endscript

script ui_init_cag_van_halen_presets 
	pushtemporarycasappearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_van_halen_presets 
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_van_halen_presets_update_guitar 
	update_vh_part_cap preset = <preset> part = cas_guitar_body
	update_vh_part_cap preset = <preset> part = cas_guitar_neck
	update_vh_part_cap preset = <preset> part = cas_guitar_head
	update_vh_part_cap preset = <preset> part = cas_guitar_pickguards
	update_vh_part_cap preset = <preset> part = cas_guitar_bridges
	update_vh_part_cap preset = <preset> part = cas_guitar_knobs
	update_vh_part_cap preset = <preset> part = cas_guitar_pickups
endscript

script cag_van_halen_presets_update_bass 
	update_vh_part_cap preset = <preset> part = cas_bass_body
	update_vh_part_cap preset = <preset> part = cas_bass_neck
	update_vh_part_cap preset = <preset> part = cas_bass_head
	update_vh_part_cap preset = <preset> part = cas_bass_pickguards
	update_vh_part_cap preset = <preset> part = cas_bass_bridges
	update_vh_part_cap preset = <preset> part = cas_bass_knobs
	update_vh_part_cap preset = <preset> part = cas_bass_pickups
endscript

script update_vh_part_cap 
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

script cag_van_halen_presets_choose 
	if (<part> = cas_guitar_body)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = van_halen}
	elseif (<part> = cas_bass_body)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = van_halen}
	endif
	generic_event_back
endscript
