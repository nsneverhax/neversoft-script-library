
script ui_create_popout_select_part 
	SpawnScriptNow ui_create_popout_select_part_spawned params = {<...>}
endscript

script ui_create_popout_select_part_spawned 
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_popout_select_part_vmenu
		pad_back_script = list_exit_restore
		pad_back_sound = nullsound
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
	}
	if NOT GotParam \{disable_rotation_zoom}
		setup_cas_menu_handlers vmenu_id = create_popout_select_part_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance>
	endif
	resolvebodyspecificpartinappearance part = <part>
	current_part = 0
	get_part_current_desc_id part = <part>
	GetArraySize ($<part>)
	num_parts_added = 0
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
				if GotParam \{purchase_menu}
					price = ((($<part>) [<i>]).price)
					formatText TextName = pad_choose_dialogue qs(0x30e8eb93) s = ((($<part>) [<i>]).frontend_desc)
					show_purchasable = 1
				endif
				if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
					editable = {editable}
				endif
			elseif is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
				if GotParam \{choose_script}
					pad_option2_script = <choose_script>
				else
					pad_option2_script = popout_select_part_decide_action
					show_editable = 1
					editable = {editable}
				endif
				logo_edit = 1
				if StructureContains structure = (($<part>) [<i>]) no_logo_edit
					<logo_edit> = 0
				endif
				pad_option2_params = {part = <part> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> cam_name = <cam_name> camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> stance = <stance> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> logo_edit = <logo_edit>}
			endif
			add_list_item {
				text = ((($<part>) [<i>]).frontend_desc)
				pad_choose_script = ui_popout_rebuild_and_exit
				pad_choose_params = {part = <part> nosound}
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				additional_focus_script = select_part_focus_change
				additional_focus_params = {part = <part> index = <i> play_current_anim = <play_current_anim> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable>}
				price = <price>
				pad_choose_dialogue = <pad_choose_dialogue>
				pad_option2_script = <pad_option2_script>
				pad_option2_params = <pad_option2_params>
				<editable>
			}
			num_parts_added = (<num_parts_added> + 1)
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
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	clean_up_user_control_helpers
	LaunchEvent Type = focus target = create_popout_select_part_vmenu data = {child_index = <current_part>}
	if GotParam \{stance}
		getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
	endif
	if GotParam \{cam_name}
		generic_list_menu :se_setprops \{block_events}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
		generic_list_menu :se_setprops \{unblock_events}
	endif
endscript

script ui_destroy_popout_select_part 
	generic_list_destroy
	destroy_popup_warning_menu
endscript

script ui_init_popout_select_part 
	RequireParams \{[
			part
		]
		all}
	ui_load_cas_rawpak part = <part>
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{bonemenu_popup}
		cas_bonemenu_exit part = <bonemenu_popup>
	endif
	pushtemporarycasappearance
endscript

script ui_deinit_popout_select_part 
	flushallcompositetextures
	castemporariesflush
	poptemporarycasappearance
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		getcurrentcasobject
		if GotParam \{return_stance}
			bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
		else
			bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
		endif
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
	if GotParam \{bonemenu_popup}
		cas_bonemenu_begin part = <bonemenu_popup>
	endif
endscript

script popout_select_part_decide_action 
	if ScriptIsRunning \{select_part_focus_change_spawned}
		KillSpawnedScript \{Name = select_part_focus_change_spawned}
	endif
	RequireParams \{[
			part
		]
		all}
	if GotParam \{purchase_menu}
	endif
	ui_event_add_params \{skip_deinit_script = 1}
	if is_part_capable part = <part>
		if getcaspartmaterials part = <part>
			generic_event_replace data = {
				state = uistate_cas_select_part_options
				part = <part>
				part_materials = <part_materials>
				num_states = 1
				num_icons = <num_icons>
				hist_tex = <icon>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
				logo_edit = <logo_edit>
			}
			return
		endif
		get_section_index_from_desc_id part = <part> target_desc_id = finishes
		if GotParam \{section_index}
			generic_event_replace data = {
				state = uistate_cap_artist_layer
				part = <part> text = qs(0x6e23fd31)
				section_index = <section_index>
				back_steps = 2
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
				logo_edit = <logo_edit>
			}
			return
		else
			generic_event_replace data = {
				state = uistate_cap_main
				savegame = ($cas_current_savegame)
				part = <part> text = qs(0xd02a3b59)
				back_steps = 1
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
				logo_edit = <logo_edit>
			}
			return
		endif
	elseif getcaspartmaterials part = <part>
		GetArraySize <part_materials>
		if (<array_Size> > 1)
			ui_event event = menu_replace data = {
				state = uistate_cas_select_part_color_options
				part = <part>
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
				logo_edit = <logo_edit>
			}
		elseif (<array_Size> = 1)
			ui_event event = menu_replace data = {
				state = uistate_cas_color_edit
				part = <part>
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
				logo_edit = <logo_edit>
			}
		endif
		return
	endif
endscript

script select_part_focus_change 
	RequireParams \{[
			part
		]
		all}
	killallcompositetextures
	get_part_current_desc_id part = <part>
	printf qs(0x1e9f665e) c = <current_desc_id> donotresolve
	if (((($<part>) [<index>]).desc_id) != <current_desc_id>)
		cas_add_item_to_appearance {
			part = <part>
			desc_id = (($<part>) [<index>].desc_id)
		}
		if NOT getcasappearancepart part = <part>
			ScriptAssert '%s not found' s = <part> donotresolve donotresolve
		endif
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id> donotresolve
		endif
	endif
	if GotParam \{play_current_anim}
		if GotParam \{frontend_anim_name}
			getcurrentcasobject
			Band_PlaySimpleAnim Name = <cas_object> anim = <frontend_anim_name>
		endif
	endif
	clean_up_user_control_helpers
	if GotParam \{disable_rotation_zoom}
		no_rotate_zoom_text = {no_rotate_zoom_text}
	endif
	if GotParam \{show_editable}
		car_helper_text = {car_helper_text_alt}
	elseif GotParam \{show_purchasable}
		car_helper_text = {car_helper_text_purchase}
	else
		car_helper_text = {car_helper_text_cancel}
	endif
	menu_finish <car_helper_text> <no_rotate_zoom_text>
endscript

script ui_popout_rebuild_and_exit 
	rebuildcurrentcasmodel
	generic_event_back
endscript
