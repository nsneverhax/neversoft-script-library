
script ui_create_cag_select_part_inclusion \{stance = stance_select_guitar}
	SpawnScriptNow ui_create_cag_select_part_inclusion_spawned params = {<...>}
endscript

script ui_create_cag_select_part_inclusion_spawned 
	RequireParams \{[
			part
			body_part
			text
		]
		all}
	make_list_menu {
		title = <text>
		vmenu_id = create_cag_select_part_inclusion_vmenu
		pad_back_script = generic_exit_restore
		icon = <hist_tex>
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_select_part_inclusion_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> controller = <state_device>
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
		get_inclusion_list body_part = <body_part>
		if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = (<part_list> [<i>].desc_id)
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
					if NOT GotParam \{no_edit}
						if is_part_editable part = <part> desc_id = ((<part_list> [<i>]).desc_id)
							pad_option2_script = cag_select_part_inclusion_decide_action
							pad_option2_params = {part = <part> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> stance = <stance>}
							show_editable = 1
							editable = {editable}
						endif
					endif
					<cannot_choose> = 0
					if is_part_unlockable part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
						if is_part_unlocked part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
							locked = {
								is_unlocked_item
							}
						else
							locked = {
								is_locked_item
								pad_choose_script = nullscript
								pad_option2_script = nullscript
							}
							<cannot_choose> = 1
							RemoveParameter \{show_purchasable}
							RemoveParameter \{show_editable}
							RemoveParameter \{show_swatches}
						endif
					endif
					add_list_item {
						text = ((<part_list> [<i>]).frontend_desc)
						pad_choose_script = generic_event_back
						pad_choose_params = {part = <part>}
						camera_list = <camera_list>
						zoom_camera = <zoom_camera>
						additional_focus_script = select_part_focus_change
						additional_focus_params = {
							state_device = <state_device>
							part = <part>
							desc_id = ((<part_list> [<i>]).desc_id)
							disable_rotation_zoom = <disable_rotation_zoom>
							show_purchasable = <show_purchasable>
							show_editable = <show_editable>
							cannot_choose = <cannot_choose>
						}
						index = <num_parts_added>
						price = <price>
						pad_choose_dialogue = <pad_choose_dialogue>
						pad_option2_script = <pad_option2_script>
						pad_option2_params = <pad_option2_params>
						<editable>
						<locked>
					}
					RemoveParameter \{price}
					RemoveParameter \{pad_choose_dialogue}
					RemoveParameter \{pad_back_dialogue}
					RemoveParameter \{show_purchasable}
					RemoveParameter \{show_editable}
					RemoveParameter \{pad_option2_script}
					RemoveParameter \{editable}
					RemoveParameter \{locked}
					num_parts_added = (<num_parts_added> + 1)
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
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
	clean_up_user_control_helpers
	menu_finish car_helper_text_extra controller = <state_device>
	LaunchEvent Type = focus target = create_cag_select_part_inclusion_vmenu data = {child_index = <current_part>}
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_cag_select_part_inclusion 
	if ScreenElementExists \{id = sponsor_logo}
		DestroyScreenElement \{id = sponsor_logo}
	endif
	generic_list_destroy
endscript

script ui_init_cag_select_part_inclusion 
	pushtemporarycasappearance
	ui_cas_precache part = <part>
endscript

script ui_deinit_cag_select_part_inclusion 
	poptemporarycasappearance
	cleanup_cas_menu_handlers
endscript

script cag_select_part_inclusion_decide_action 
	RequireParams \{[
			part
		]
		all}
	if getcaspartmaterials part = <part>
		ui_event event = menu_replace data = {state = uistate_cas_color_edit part_materials = <part_materials> part = <part> num_states = 1 color_wheel = <color_wheel> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> return_stance = <stance>}
	else
		ui_sfx \{menustate = car
			uitype = back}
		generic_event_back
	endif
endscript

script get_inclusion_list 
	RequireParams \{[
			body_part
		]
		all}
	if NOT getcasappearancepart part = <body_part>
		ScriptAssert '%s not found' s = <body_part>
	endif
	if NOT getactualcasoptionstruct part = <body_part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <body_part> t = <desc_id>
	endif
	return inclusion = <inclusion>
endscript
