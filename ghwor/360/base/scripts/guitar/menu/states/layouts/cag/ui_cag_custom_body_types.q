
script ui_create_cag_custom_body_types \{show_all = FALSE}
	RequireParams \{[
			part
			old_instrument
		]
		all}
	<instrument_text> = ($cag_instruments [$cag_instrument_idxs.<old_instrument>].text)
	<full_body_part> = ($cag_instruments [$cag_instrument_idxs.<old_instrument>].full_body_part)
	formatText TextName = title_text qs(0xf1798733) i = <instrument_text>
	make_generic_car_menu {
		title = <instrument_text>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	make_list_menu {
		title = <title_text>
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
		<focus_script> = load_cab_preset
		<preset_name> = cab_factory_presets
	else
		<focus_script> = load_cag_preset
		<preset_name> = cag_factory_presets
	endif
	if (<show_all> = true)
		<part_list> = ($<part>)
		<focus_script> = add_cag_body_part
		GetArraySize <part_list>
	else
		GetArraySize <preset_name> globalarray
	endif
	<current_index> = -1
	if (<array_Size> > 0)
		i = 0
		begin
		<focus_params> = {index = <i> restore_car = 0 state_device = <state_device>}
		<pad_choose_script> = cag_custom_body_types_choose
		if (<show_all> = true)
			<part_struct> = (<part_list> [<i>])
			<cur_part> = <part>
			<focus_params> = {<focus_params> part = <part> desc_id = ((<part_list> [<i>]).desc_id)}
			<text> = ((<part_list> [<i>]).frontend_desc)
		else
			<preset_struct> = ($<preset_name> [<i>])
			<text> = (<preset_struct>.frontend_desc)
			if StructureContains structure = <preset_struct> <part>
				<part_struct> = (<preset_struct>.<part>)
				<cur_part> = <part>
			elseif StructureContains structure = <preset_struct> <full_body_part>
				<part_struct> = (<preset_struct>.<full_body_part>)
				<cur_part> = <full_body_part>
			else
				ScriptAssert \{qs(0xf9b37f08)}
			endif
		endif
		<desc_id> = (<part_struct>.desc_id)
		<add_item> = true
		focus_params = {<focus_params> cannot_choose = 0}
		if is_part_unlockable part = <cur_part> desc_id = <desc_id> savegame = ($cas_current_savegame)
			if is_part_unlocked part = <cur_part> desc_id = <desc_id> savegame = <savegame>
				locked = {
					is_unlocked_item
				}
			else
				locked = {
					is_locked_item
				}
				focus_params = {<focus_params> cannot_choose = 1}
				RemoveParameter \{pad_choose_script}
			endif
		endif
		if (<add_item> = true)
			if cag_current_part_matches part = <cur_part> desc_id = <desc_id>
				<focus_params> = {<focus_params> restore_car = 1}
				current_index = <num_parts_added>
			endif
			add_list_item {
				text = <text>
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {old_instrument = <old_instrument> cag_preset_index = <i>}
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				additional_focus_script = <focus_script>
				additional_focus_params = <focus_params>
				index = <num_parts_added>
				<locked>
			}
			num_parts_added = (<num_parts_added> + 1)
		endif
		RemoveParameter \{locked}
		i = (<i> + 1)
		repeat <array_Size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	if (<current_index> = -1)
		ScriptAssert 'Guitar %s not found!' s = <desc_id>
		<current_index> = 0
	endif
	if generic_list_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <num_parts_added>
	endif
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = sponsor_logo
		desc = 'Axesmith_menu_item'
		not_focusable}
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

script cag_current_part_matches \{part = !q1768515945
		desc_id = !q1768515945}
	<desc_id_checking> = <desc_id>
	if getcasappearancepartdescid part = <part>
		if (<desc_id_checking> = <desc_id>)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script cag_custom_body_types_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	ui_event_wait_for_safe
	if ui_event_exists_in_stack \{Name = 'cag_main'}
		ui_event_block event = menu_back state = uistate_cag_main data = {selected_index = 1 cag_preset_index = <cag_preset_index>}
	elseif ui_event_exists_in_stack \{Name = 'cag_custom_body_types'}
		ui_event_block event = menu_replace data = {
			state = uistate_cag_main
			old_instrument = <old_instrument>
			instrument = ($cas_default_instrument)
			instrument_info = ($cag_instruments [$cag_instrument_idxs.<old_instrument>])
			selected_index = 1
			cag_preset_index = <cag_preset_index>
		}
	endif
endscript

script add_cag_body_part 
	RequireParams \{[
			part
			desc_id
			cannot_choose
			state_device
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
	clean_up_user_control_helpers
	if (<cannot_choose> = 1)
		menu_finish car_helper_text_cancel_only controller = <state_device>
	else
		menu_finish car_helper_text_cancel controller = <state_device>
	endif
endscript

script get_instrument_preset_from_current_appearance \{part_array = !a1768515945}
	<newstruct> = {}
	GetArraySize <part_array>
	<i> = 0
	begin
	part = (<part_array> [<i>])
	if getcasappearancepartinstance part = <part>
		updatestructelement struct = <newstruct> element = <part> value = <part_instance>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return new_struct = <newstruct>
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

script load_cag_preset \{index = !i1768515945
		restore_car = !i1768515945
		cannot_choose = !i1768515945
		state_device = !i1768515945}
	<preset> = ($cag_factory_presets [<index>])
	if (<restore_car> = 1)
		restoretoptemporarycasappearance \{no_rebuild}
	else
		set_instrument_preset_into_current_appearance part_array = ($instrument_part_sets.guitar) preset = <preset>
	endif
	sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	if StructureContains structure = <preset> sponsor_id
		if get_cas_sponsor_texture_and_title sponsor_id = (<preset>.sponsor_id)
			sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
			sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
		endif
	endif
	printcurrentappearance
	rebuildcurrentcasmodel
	clean_up_user_control_helpers
	if (<cannot_choose> = 1)
		menu_finish car_helper_text_cancel_only controller = <state_device>
	else
		menu_finish car_helper_text_cancel controller = <state_device>
	endif
	if GotParam \{locked}
		user_control_destroy_helper \{button = green}
		Obj_GetID
		SetScreenElementProps {
			id = <objID>
			event_handlers = [
				{pad_choose nullscript}
			]
			replace_handlers
		}
	endif
endscript

script load_cab_preset \{index = !i1768515945
		restore_car = !i1768515945
		cannot_choose = !i1768515945
		state_device = !i1768515945}
	<preset> = ($cab_factory_presets [<index>])
	if (<restore_car> = 1)
		restoretoptemporarycasappearance \{no_rebuild}
	else
		set_instrument_preset_into_current_appearance part_array = ($instrument_part_sets.bass) preset = <preset>
	endif
	sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	if StructureContains structure = <preset> sponsor_id
		if get_cas_sponsor_texture_and_title sponsor_id = (<preset>.sponsor_id)
			sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
			sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
		endif
	endif
	printcurrentappearance
	rebuildcurrentcasmodel
	clean_up_user_control_helpers
	if (<cannot_choose> = 1)
		menu_finish car_helper_text_cancel_only controller = <state_device>
	else
		menu_finish car_helper_text_cancel controller = <state_device>
	endif
	if GotParam \{locked}
		user_control_destroy_helper \{button = green}
		Obj_GetID
		SetScreenElementProps {
			id = <objID>
			event_handlers = [
				{pad_choose nullscript}
			]
			replace_handlers
		}
	endif
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
