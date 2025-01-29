
script ui_create_cag_custom_body_types 
	start_cas_rebuild_loop
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_custom_body_types_vmenu
		pad_back_script = generic_exit_restore
		icon = <hist_tex>
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_types_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	if GotParam \{download}
		ScriptAssert \{'download flag not supported'}
	else
		part_list = ($<part>)
	endif
	GetArraySize <part_list>
	if (<array_Size> > 0)
		i = 0
		begin
		if cas_item_is_visible part = <part> desc_id = ((<part_list> [<i>]).desc_id)
			if is_part_unlocked part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
				if StructureContains structure = (<part_list> [<i>]) locked
					price = 100
				else
					RemoveParameter \{price}
				endif
				if (((<part_list> [<i>]).desc_id) = <current_desc_id>)
					current_part = <num_parts_added>
				endif
				add_list_item {
					text = ((<part_list> [<i>]).frontend_desc)
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part>}
					price = <price>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = add_cag_body_part
					additional_focus_params = {part = <part> index = <i> desc_id = ((<part_list> [<i>]).desc_id)}
				}
				if GotParam \{pad_back_dialogue}
					RemoveParameter \{pad_back_dialogue}
				endif
				num_parts_added = (<num_parts_added> + 1)
			endif
		endif
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
	LaunchEvent Type = focus target = create_cag_custom_body_types_vmenu data = {child_index = <current_part>}
endscript

script ui_destroy_cag_custom_body_types 
	if ScreenElementExists \{id = sponsor_logo}
		DestroyScreenElement \{id = sponsor_logo}
	endif
	generic_list_destroy
	stop_cas_rebuild_loop
endscript

script ui_init_cag_custom_body_types 
	pushtemporarycasappearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_custom_body_types 
	flushallcompositetextures
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script add_cag_body_part 
	RequireParams \{[
			part
			desc_id
			index
		]
		all}
	killallcompositetextures
	dumpcompositescratchtextures
	get_part_current_desc_id part = <part>
	if NOT (<desc_id> = <current_desc_id>)
		if getactualcasoptionstruct part = <part> desc_id = ($<part> [<index>].desc_id)
			if GotParam \{randomizefinish}
				GetArraySize (<inclusion>)
				loop_size = (<array_Size>)
				i = 0
				valid_array = None
				begin
				filter = (<inclusion> [<i>])
				if (<filter>.part = <randomizefinish>)
					valid_array = (<filter>.valid)
					break
				endif
				i = (<i> + 1)
				repeat (<loop_size>)
				if (<valid_array> = None)
					ScriptAssert \{qs(0x9413ac76)}
				endif
				GetArraySize (<valid_array>)
				GetRandomValue Name = rand_val a = 0 b = (<array_Size> - 1) integer
				new_desc_id = (<valid_array> [<rand_val>])
				editcasappearance target = setpart targetparams = {part = <randomizefinish> desc_id = <new_desc_id>}
			endif
			if NOT GotParam \{finishable}
				if (<part> = cas_guitar_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_guitar_finish
							desc_id = None
						}}
				elseif (<part> = cas_bass_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_bass_finish
							desc_id = None
						}}
				endif
			endif
			if NOT GotParam \{detailable}
				if (<part> = cas_guitar_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_guitar_body_detail
							desc_id = None
						}}
				elseif (<part> = cas_bass_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_bass_body_detail
							desc_id = None
						}}
				endif
			endif
			if NOT GotParam \{logoable}
				if (<part> = cas_guitar_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_guitar_logo
							desc_id = None
						}}
				elseif (<part> = cas_bass_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_bass_logo
							desc_id = None
						}}
				endif
			endif
			if NOT GotParam \{fadeable}
				if (<part> = cas_guitar_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_guitar_body_fade
							desc_id = None
						}}
				elseif (<part> = cas_bass_body)
					editcasappearance \{target = setpart
						targetparams = {
							part = cas_bass_head_fade
							desc_id = None
						}}
				endif
			endif
		endif
		fix_cag_include_part part = <part> desc_id = <desc_id> force_first_include_part = 1
		cas_add_item_to_appearance part = <part> desc_id = <desc_id> incremental no_rebuild
		trigger_cas_rebuild_loop
	endif
	if get_cas_sponsor_texture_and_title part = <part>
		sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
	else
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
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
	ScriptAssert \{'add_cag_part_spin_guitar: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
