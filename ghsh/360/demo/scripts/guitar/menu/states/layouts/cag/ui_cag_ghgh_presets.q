
script ui_create_cag_ghgh_presets \{stance = stance_select_guitar}
	spawnscriptnow ui_create_cag_ghgh_presets_spawned params = {<...>}
endscript

script ui_create_cag_ghgh_presets_spawned 
	make_list_menu {
		vmenu_id = create_cag_ghgh_vmenu
		pad_back_script = generic_exit_restore
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_ghgh_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	<current_part> = 0
	<num_parts_added> = 0
	<guit_prs> = <prs>
	<cas_presets> = cas_preset_guitars
	<guitinhand> = <guit_name>
	<num_presets> = 5
	<sc_245_unlocked> = 0
	<ultraiii_unlocked> = 0
	<devil_unlocked> = 0
	get_current_band_info
	getglobaltags <band_info> savegame = <savegame>
	printf channel = tesssssst qs(0x6eeae377) p = <sc_245_unlocked>
	printf channel = tesssssst qs(0x5be62b04) p = <ultraiii_unlocked>
	printf channel = tesssssst qs(0x9f25c5ac) p = <devil_unlocked>
	if gotparam \{unlock_purchased}
		if NOT structurecontains structure = <unlock_purchased> cas_guitar_body
			printf \{channel = tesssssst
				qs(0xb3ea858a)}
			scriptassert qs(0x8ecf4b3a) p = <part>
		endif
		unlock_purchased_struct = (<unlock_purchased>.cas_guitar_body)
		getarraysize \{unlock_purchased_struct}
		if (<array_size> > 0)
			i = 0
			begin
			if (((<unlock_purchased_struct> [<i>]).desc_id) = prs_sc_250_body)
				printf \{channel = tesssssst
					qs(0xca1ae30a)}
				<sc_245_unlocked> = 1
			elseif (((<unlock_purchased_struct> [<i>]).desc_id) = schecter_ultra_iii_body)
				printf \{channel = tesssssst
					qs(0xf5de07e5)}
				<ultraiii_unlocked> = 1
			elseif (((<unlock_purchased_struct> [<i>]).desc_id) = schecter_devil_spine_body)
				printf \{channel = tesssssst
					qs(0xed02781a)}
				<devil_unlocked> = 1
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	else
		<sc_245_unlocked> = 0
		<ultraiii_unlocked> = 0
		<devil_unlocked> = 0
	endif
	printf channel = tesssssst qs(0xcfdb348a) p = <sc_245_unlocked>
	printf channel = tesssssst qs(0xc0a05207) p = <ultraiii_unlocked>
	printf channel = tesssssst qs(0x0e4f7aa6) p = <devil_unlocked>
	if (<guitinhand> = qs(0x803b11bf))
		<i> = 0
		begin
		<guit_add> = 0
		if structurecontains structure = ($<cas_presets> [<i>]) is_prs
			<guit_add> = ($<cas_presets> [<i>].is_prs)
		endif
		if (<guit_add> = 1)
			<desc_id> = ($<cas_presets> [<i>].<part>.desc_id)
			if (<desc_id> = prs_sc_250_body)
				if (<sc_245_unlocked> = 0)
					break
				endif
			endif
			if (<desc_id> = <current_desc_id>)
				<current_part> = <num_parts_added>
			endif
			getarraysize ($<cas_presets>)
			<num_bodies> = <array_size>
			<add_item> = 0
			<j> = 0
			begin
			if ($<part> [<j>].desc_id = <desc_id>)
				<add_item> = 1
				<item_text> = ($<part> [<j>].frontend_desc)
				break
			endif
			<j> = (<j> + 1)
			repeat <num_bodies>
			if (<add_item> = 1)
				add_list_item {
					text = <item_text>
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part>}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = cag_ghgh_presets_update
					additional_focus_params = {cas_presets = <cas_presets> part = <part> index = <i> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable>}
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
					pad_option2_script = <pad_option2_script>
					pad_option2_params = <pad_option2_params>
					<editable>
				}
				<num_parts_added> = (<num_parts_added> + 1)
			endif
		endif
		<i> = (<i> + 1)
		repeat <num_presets>
	else
		<i> = 0
		begin
		<guit_add> = 0
		if structurecontains structure = ($<cas_presets> [<i>]) is_sch
			<guit_add> = ($<cas_presets> [<i>].is_sch)
		endif
		if (<guit_add> = 1)
			<desc_id> = ($<cas_presets> [<i>].<part>.desc_id)
			if (<desc_id> = schecter_ultra_iii_body)
				if (<ultraiii_unlocked> = 0)
					break
				endif
			endif
			if (<desc_id> = schecter_devil_spine_body)
				if (<devil_unlocked> = 0)
					break
				endif
			endif
			if (<desc_id> = <current_desc_id>)
				<current_part> = <num_parts_added>
			endif
			getarraysize ($<cas_presets>)
			<num_bodies> = <array_size>
			<add_item> = 0
			<j> = 0
			begin
			if ($<part> [<j>].desc_id = <desc_id>)
				<add_item> = 1
				<item_text> = ($<part> [<j>].frontend_desc)
				break
			endif
			<j> = (<j> + 1)
			repeat <num_bodies>
			if (<add_item> = 1)
				add_list_item {
					text = <item_text>
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part>}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = cag_ghgh_presets_update
					additional_focus_params = {cas_presets = <cas_presets> part = <part> index = <i> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable>}
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
					pad_option2_script = <pad_option2_script>
					pad_option2_params = <pad_option2_params>
					<editable>
				}
				<num_parts_added> = (<num_parts_added> + 1)
			endif
		endif
		<i> = (<i> + 1)
		repeat <num_presets>
	endif
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel}
	launchevent type = focus target = create_cag_ghgh_vmenu data = {child_index = <current_part>}
endscript

script cag_ghgh_presets_update 
	<preset> = ($<cas_presets> [<index>])
	printstruct <preset> channel = prs_schecter
	cag_ghgh_presets_update_guitar preset = <preset>
	rebuildcurrentcasmodel
endscript

script ui_destroy_cag_ghgh_presets 
	generic_list_destroy
endscript

script ui_init_cag_ghgh_presets 
	pushtemporarycasappearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_ghgh_presets 
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_ghgh_presets_update_guitar 
	update_part_cap_ghgh preset = <preset> part = cas_guitar_body
	update_part_cap_ghgh preset = <preset> part = cas_guitar_neck
	update_part_cap_ghgh preset = <preset> part = cas_guitar_head
	update_part_cap_ghgh preset = <preset> part = cas_guitar_pickguards
	update_part_cap_ghgh preset = <preset> part = cas_guitar_bridges
	update_part_cap_ghgh preset = <preset> part = cas_guitar_knobs
	update_part_cap_ghgh preset = <preset> part = cas_guitar_pickups
endscript

script update_part_cap_ghgh 
	editcasappearance target = setpart targetparams = {part = <part> desc_id = (<preset>.<part>.desc_id)}
	if structurecontains structure = (<preset>.<part>) cap
		<cap_array> = (<preset>.<part>.cap)
		setcasappearancecap part = <part> cap = <cap_array>
	endif
	if structurecontains structure = (<preset>.<part>) chosen_materials
		<chosen_materials> = (<preset>.<part>.chosen_materials)
		setcasappearancematerial part = <part> material = material1 value = (<chosen_materials>.material1)
	endif
endscript
