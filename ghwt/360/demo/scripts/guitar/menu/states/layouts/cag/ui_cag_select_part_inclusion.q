
script ui_create_cag_select_part_inclusion \{stance = stance_select_guitar}
	spawnscriptnow ui_create_cag_select_part_inclusion_spawned params = {<...>}
endscript

script ui_create_cag_select_part_inclusion_spawned 
	requireparams \{[
			part
			body_part
			text
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_select_part_inclusion_vmenu
		pad_back_script = generic_exit_restore
		parent = <container_id>
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_select_part_inclusion_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	getarraysize ($<part>)
	i = 0
	begin
	get_inclusion_list body_part = <body_part>
	if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = ($<part> [<i>].desc_id)
		if cas_item_is_visible part = <part> part_index = <i>
			if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
				if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
					current_part = <num_parts_added>
				endif
				if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
					price = ((($<part>) [<i>]).price)
					formattext textname = pad_choose_dialogue qs(0x30e8eb93) s = ((($<part>) [<i>]).frontend_desc)
					show_purchasable = 1
					pad_back_script = generic_event_back
					if NOT gotparam \{no_edit}
						if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
							editable = {editable}
							show_editable = 1
						endif
					endif
				elseif NOT gotparam \{no_edit}
					if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
						pad_option2_script = cag_select_part_inclusion_decide_action
						pad_option2_params = {part = <part> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> stance = <stance>}
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
				if gotparam \{price}
					removeparameter \{price}
				endif
				if gotparam \{pad_choose_dialogue}
					removeparameter \{pad_choose_dialogue}
				endif
				if gotparam \{pad_back_dialogue}
					removeparameter \{pad_back_dialogue}
				endif
				if gotparam \{show_purchasable}
					removeparameter \{show_purchasable}
				endif
				if gotparam \{show_editable}
					removeparameter \{show_editable}
				endif
				if gotparam \{pad_option2_script}
					removeparameter \{pad_option2_script}
				endif
				if gotparam \{editable}
					removeparameter \{editable}
				endif
				num_parts_added = (<num_parts_added> + 1)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_extra}
	launchevent type = focus target = create_cag_select_part_inclusion_vmenu data = {child_index = <current_part>}
	if gotparam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
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
	requireparams \{[
			part
		]
		all}
	if getcaspartmaterials part = <part>
		ui_event event = menu_replace data = {state = uistate_cas_color_edit part_materials = <part_materials> part = <part> num_states = 1 color_wheel = <color_wheel> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> return_stance = <stance>}
	else
		generic_event_back
	endif
endscript

script get_inclusion_list 
	requireparams \{[
			body_part
		]
		all}
	if NOT getcasappearancepart part = <body_part>
		scriptassert '%s not found' s = <body_part>
	endif
	if NOT getactualcasoptionstruct part = <body_part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <body_part> t = <desc_id>
	endif
	return inclusion = <inclusion>
endscript
