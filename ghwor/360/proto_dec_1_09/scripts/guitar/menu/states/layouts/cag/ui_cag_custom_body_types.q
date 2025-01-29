
script ui_create_cag_custom_body_types \{show_all = FALSE}
	RequireParams \{[
			part
			old_instrument
		]
		all}
	title_text = qs(0xbec94c0a)
	if (<old_instrument> = bass)
		title_text = qs(0x13e8282b)
	endif
	make_generic_car_menu {
		title = <title_text>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	make_list_menu {
		vmenu_id = create_cag_custom_body_types_vmenu
		icon = <hist_tex>
		exclusive_device = <state_device>
		pad_back_script = generic_exit_restore
		pad_back_params = {old_instrument = <old_instrument>}
	}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_types_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> controller = <state_device>
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	if GotParam \{download}
		ScriptAssert \{'download flag not supported'}
	endif
	get_savegame_from_controller controller = ($primary_controller)
	if (<old_instrument> = bass)
		GetGlobalTags savegame = <savegame> cab_presets
		<part_list> = <cab_presets>
		<focus_script> = load_cab_preset
	else
		GetGlobalTags savegame = <savegame> cag_presets
		<part_list> = <cag_presets>
		<focus_script> = load_cag_preset
	endif
	if (<show_all> = true)
		<part_list> = ($<part>)
		<focus_script> = add_cag_body_part
	endif
	GetArraySize <part_list>
	if (<array_Size> > 0)
		i = 0
		begin
		<focus_params> = {index = <num_parts_added>}
		<pad_choose_script> = cag_custom_body_types_choose
		if (<show_all> = true)
			<part_struct> = (<part_list> [<i>])
			<focus_params> = {<focus_params> part = <part> desc_id = ((<part_list> [<i>]).desc_id)}
		else
			<preset_struct> = (<part_list> [<i>])
			<part_struct> = (<preset_struct>.<part>)
		endif
		<desc_id> = (<part_struct>.desc_id)
		RemoveParameter \{0xb52bd14a}
		RemoveParameter \{is_unlocked}
		if is_part_unlockable part = <part> desc_id = <desc_id> savegame = ($cas_current_savegame)
			<0xb52bd14a> = 1
			if check_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
				<is_unlocked> = 1
			else
				<pad_choose_script> = nullscript
			endif
		endif
		add_list_item {
			text = ((<part_list> [<i>]).frontend_desc)
			pad_choose_script = <pad_choose_script>
			pad_choose_params = {old_instrument = <old_instrument>}
			is_locked_item = <0xb52bd14a>
			is_unlocked = <is_unlocked>
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			additional_focus_script = <focus_script>
			additional_focus_params = <focus_params>
		}
		num_parts_added = (<num_parts_added> + 1)
		i = (<i> + 1)
		repeat <array_Size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = sponsor_logo
		desc = 'Axesmith_menu_item'
		not_focusable}
	clean_up_user_control_helpers
	menu_finish car_helper_text_cancel controller = <state_device>
	<current_index> = 0
	if StructureContains structure = ($cas_current_appearance) cag_preset_index
		<current_index> = ($cas_current_appearance.cag_preset_index)
	endif
	LaunchEvent Type = focus target = create_cag_custom_body_types_vmenu data = {child_index = <current_index>}
endscript

script ui_destroy_cag_custom_body_types 
	if ScreenElementExists \{id = sponsor_logo}
		DestroyScreenElement \{id = sponsor_logo}
	endif
	destroy_generic_menu
	generic_list_destroy
endscript

script ui_init_cag_custom_body_types 
	pushtemporarycasappearance
	ui_cas_precache part = <part>
endscript

script ui_deinit_cag_custom_body_types 
	flushallcompositetexturesfromui
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_custom_body_types_choose 
	if ui_event_exists_in_stack \{Name = 'cag_main'}
		ui_event_wait \{event = menu_back
			state = uistate_cag_main}
	else
		ui_event_wait event = menu_replace data = {
			state = uistate_cag_main
			old_instrument = <old_instrument>
			instrument = ($cas_default_instrument)
			instrument_info = ($cag_instruments [$cag_instrument_idxs.<old_instrument>])
		}
	endif
endscript

script add_cag_body_part 
	RequireParams \{[
			part
			desc_id
		]
		all}
	killallcompositetextures
	dumpcompositescratchtextures
	get_part_current_desc_id part = <part>
	if NOT (<desc_id> = <current_desc_id>)
		fix_cag_include_part part = <part> desc_id = <desc_id> force_first_include_part = 1
		cas_add_item_to_appearance part = <part> desc_id = <desc_id> incremental
	endif
	if get_cas_sponsor_texture_and_title part = <part>
		sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
	else
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	endif
endscript

script get_instrument_preset_from_current_appearance \{part_array = !a1768515945}
	<new_struct> = {}
	GetArraySize <part_array>
	<i> = 0
	begin
	part = (<part_array> [<i>])
	if getcasappearancepartinstance part = <part>
		updatestructelement struct = <new_struct> element = <part> value = <part_instance>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return new_struct = <new_struct>
endscript

script set_instrument_preset_into_current_appearance \{part_array = !a1768515945
		preset = 0x69696969}
	GetArraySize <part_array>
	<i> = 0
	begin
	part = (<part_array> [<i>])
	if StructureContains structure = <preset> <part>
		setcasappearancepartinstance part = <part> part_instance = (<preset>.<part>)
	else
		editcasappearance {
			target = clearpart
			targetparams = {part = <part>}
		}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script load_cag_preset \{index = !i1768515945}
	GetGlobalTags savegame = ($cas_current_savegame) cag_presets
	<preset> = (<cag_presets> [<index>])
	set_instrument_preset_into_current_appearance part_array = ($instrument_part_sets.guitar) preset = <preset>
	sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	if StructureContains structure = <preset> sponsor_id
		if get_cas_sponsor_texture_and_title sponsor_id = (<preset>.sponsor_id)
			sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
			sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
		endif
	endif
	printcurrentappearance
	rebuildcurrentcasmodel
	Change cas_current_appearance = {($cas_current_appearance) cag_preset_index = <index>}
endscript

script 0x8c9fecc8 \{index = !i1768515945}
	get_instrument_preset_from_current_appearance part_array = ($instrument_part_sets.guitar)
	GetGlobalTags savegame = ($cas_current_savegame) cag_presets
	<preset> = (<cag_presets> [<index>])
	<new_struct> = {<new_struct> frontend_desc = (<preset>.frontend_desc)}
	if StructureContains structure = <preset> sponsor_id
		<new_struct> = {<new_struct> sponsor_id = (<preset>.sponsor_id)}
	endif
	SetArrayElement ArrayName = cag_presets index = <index> NewValue = <new_struct>
	lockglobaltags \{OFF}
	SetGlobalTags savegame = ($cas_current_savegame) cag_presets params = {cag_presets = <cag_presets>}
	lockglobaltags
endscript

script load_cab_preset \{index = !i1768515945}
	GetGlobalTags savegame = ($cas_current_savegame) cab_presets
	<preset> = (<cab_presets> [<index>])
	set_instrument_preset_into_current_appearance part_array = ($instrument_part_sets.bass) preset = <preset>
	sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	if StructureContains structure = <preset> sponsor_id
		if get_cas_sponsor_texture_and_title sponsor_id = (<preset>.sponsor_id)
			sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
			sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
		endif
	endif
	printcurrentappearance
	rebuildcurrentcasmodel
	Change cas_current_appearance = {($cas_current_appearance) 0xfc00902f = <index>}
endscript

script 0xc47fe2ac \{index = !i1768515945}
	get_instrument_preset_from_current_appearance part_array = ($instrument_part_sets.bass)
	GetGlobalTags savegame = ($cas_current_savegame) cab_presets
	<preset> = (<cab_presets> [<index>])
	<new_struct> = {<new_struct> frontend_desc = (<preset>.frontend_desc)}
	if StructureContains structure = <preset> sponsor_id
		<new_struct> = {<new_struct> sponsor_id = (<preset>.sponsor_id)}
	endif
	SetArrayElement ArrayName = cab_presets index = <index> NewValue = <new_struct>
	lockglobaltags \{OFF}
	SetGlobalTags savegame = ($cas_current_savegame) cab_presets params = {cab_presets = <cab_presets>}
	lockglobaltags
endscript

script fix_cag_include_part 
	RequireParams \{[
			part
			desc_id
		]
		all}
	cas_part_will_conflict part_name = <part> part_desc_id = <desc_id> force_first_include_part = <force_first_include_part>
	if GotParam \{change_parts}
		printf \{qs(0xb3a58f0c)}
		GetArraySize \{change_parts}
		if (<array_Size> > 0)
			i = 0
			begin
			skip_item = 0
			if GotParam \{node_parts_only}
				if NOT is_node_mesh_part part = (<change_parts> [<i>].part)
					skip_item = 1
				endif
			endif
			if (<skip_item> = 0)
				printf 'Changing %a to %b' a = (<change_parts> [<i>].part) b = (<change_parts> [<i>].desc_id)
				cas_add_item_to_appearance part = (<change_parts> [<i>].part) desc_id = (<change_parts> [<i>].desc_id) no_rebuild
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script is_node_mesh_part 
	RequireParams \{[
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		return \{FALSE}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{FALSE}
	endif
	if GotParam \{node_meshes}
		return \{true}
	endif
	return \{FALSE}
endscript

script add_cag_part_spin_guitar 
	getcurrentcasobject
	if is_female_char
		Band_PlaySimpleAnim Name = <cas_object> anim = car_female_select_guitar_turn_flip BlendDuration = 1.0
	else
		Band_PlaySimpleAnim Name = <cas_object> anim = car_male_select_guitar_turn_flip BlendDuration = 1.0
	endif
endscript
