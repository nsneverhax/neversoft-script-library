
script ui_create_cag_select_part_inclusion \{stance = stance_select_guitar}
	SpawnScriptNow ui_create_cag_select_part_inclusion_spawned params = {<...>}
endscript

script ui_create_cag_select_part_inclusion_spawned 

	make_list_menu {
		vmenu_id = create_cag_select_part_inclusion_vmenu
		pad_back_script = generic_exit_restore
		icon = <hist_tex>
	}
	SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name> do_not_hide}
	setup_cas_menu_handlers vmenu_id = create_cag_select_part_inclusion_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	filter_esp = 1
	if has_inclusion_list body_part = <body_part> part = <part>
		<filter_esp> = 0
	endif
	GetArraySize ($<part>)
	0x3a81d3a7 = <array_Size>
	i = 0
	begin
	<add_item> = 1
	if (<part> = cas_guitar_head || <part> = cas_guitar_neck)
		if (<filter_esp> = 1)
			if StructureContains structure = (($<part>) [<i>]) is_metallica
				if (((($<part>) [<i>]).is_metallica) = 1)

					<add_item> = 0
				endif
			endif
			if GotParam \{is_esp}
				if (<is_esp> = 1)
					if NOT StructureContains structure = (($<part>) [<i>]) is_esp

						<add_item> = 0
					elseif (((($<part>) [<i>]).is_esp) = 0)

						<add_item> = 0
					endif
				else
					if StructureContains structure = (($<part>) [<i>]) is_esp
						if (((($<part>) [<i>]).is_esp) = 1)

							<add_item> = 0
						endif
					endif
				endif
			else
				if StructureContains structure = (($<part>) [<i>]) is_esp
					if (((($<part>) [<i>]).is_esp) = 1)

						<add_item> = 0
					endif
				endif
			endif
		endif
	endif
	if (<add_item> = 1)
		get_inclusion_list body_part = <body_part>
		if NOT cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = ($<part> [<i>].desc_id)
			add_item = 0
		endif
		if (<add_item> = 1)
			if getcasappearancepart part = <body_part>
				ps2_getactualcasoptionstruct_as_struct part = <body_part> desc_id = <desc_id>
				if StructureContains structure = <ps2_part_struct> additional_inclusion_lists
					0x8b2b1b6b = (<ps2_part_struct>.additional_inclusion_lists)
					GetArraySize <0x8b2b1b6b>
					X = 0
					begin
					get_inclusion_list body_part = (<0x8b2b1b6b> [<X>])
					if NOT cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = ($<part> [<i>].desc_id)
						add_item = 0
						break
					endif
					X = (<X> + 1)
					repeat <array_Size>
				endif
			endif
		endif
		if (<add_item> = 1)
			if cas_item_is_visible part = <part> part_index = <i>
				if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
					if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
						current_part = <num_parts_added>
					endif
					if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
						price = ((($<part>) [<i>]).price)
						formatText TextName = pad_choose_dialogue qs(0x7f837e4d) s = ((($<part>) [<i>]).frontend_desc)
						show_purchasable = 1
						pad_back_script = generic_event_back
						if NOT GotParam \{no_edit}
							if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
								editable = {editable}
								show_editable = 1
							endif
						endif
					elseif NOT GotParam \{no_edit}
						if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
							pad_option2_script = cag_select_part_inclusion_decide_action
							pad_option2_params = {part = <part> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> stance = <stance> index = <i>}
							show_editable = 1
							editable = {editable}
						endif
					endif
					add_list_item {
						text = ((($<part>) [<i>]).frontend_desc)
						pad_choose_script = generic_event_back
						pad_choose_params = {part = <part>}
						camera_list = <camera_list>
						zoom_camera = <zoom_camera>
						additional_focus_script = select_part_focus_change
						additional_focus_params = {part = <part> index = <i> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable>}
						price = <price>
						pad_choose_dialogue = <pad_choose_dialogue>
						pad_option2_script = <pad_option2_script>
						pad_option2_params = <pad_option2_params>
						<editable>
					}
					if GotParam \{price}
						RemoveParameter \{price}
					endif
					if GotParam \{pad_choose_dialogue}
						RemoveParameter \{pad_choose_dialogue}
					endif
					if GotParam \{pad_back_dialogue}
						RemoveParameter \{pad_back_dialogue}
					endif
					if GotParam \{show_purchasable}
						RemoveParameter \{show_purchasable}
					endif
					if GotParam \{show_editable}
						RemoveParameter \{show_editable}
					endif
					if GotParam \{pad_option2_script}
						RemoveParameter \{pad_option2_script}
					endif
					if GotParam \{editable}
						RemoveParameter \{editable}
					endif
					num_parts_added = (<num_parts_added> + 1)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <0x3a81d3a7>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_extra}
	LaunchEvent Type = focus target = create_cag_select_part_inclusion_vmenu data = {child_index = <current_part>}
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_cag_select_part_inclusion 
	generic_list_destroy
endscript

script ui_init_cag_select_part_inclusion 
	pushtemporarycasappearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_select_part_inclusion 
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_select_part_inclusion_decide_action 

	LaunchEvent \{Type = unfocus
		target = create_cag_select_part_inclusion_vmenu}
	cas_queue_wait
	if getcaspartmaterials part = <part>
		ui_event event = menu_replace data = {state = uistate_cas_color_edit part_materials = <part_materials> part = <part> num_states = 1 color_wheel = <color_wheel> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> return_stance = <stance>}
	else
		generic_event_back
	endif
endscript

script get_inclusion_list 

	if NOT getcasappearancepart part = <body_part>

	endif
	if NOT getactualcasoptionstruct part = <body_part> desc_id = <desc_id>

	endif
	return inclusion = <inclusion>
endscript

script has_inclusion_list 

	get_inclusion_list body_part = <body_part>
	GetArraySize <inclusion>
	i = 0
	begin
	if ((((<inclusion>) [<i>]).part) = <part>)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript
