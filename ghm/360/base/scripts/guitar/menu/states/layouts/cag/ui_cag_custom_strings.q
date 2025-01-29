
script ui_create_cag_custom_strings 
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_custom_strings_vmenu
		pad_back_script = list_exit_restore
		icon = <hist_tex>
	}
	generic_list_menu :se_setprops \{alpha = 0}
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	GetArraySize ($<part>)
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			add_list_item {
				text = ((($<part>) [<i>]).frontend_desc)
				pad_choose_script = generic_event_back
				additional_focus_script = select_strings_focus_change
				additional_focus_params = {part = <part> index = <i>}
			}
			num_parts_added = (<num_parts_added> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
	LaunchEvent Type = focus target = create_cag_custom_strings_vmenu data = {child_index = <current_part>}
	generic_list_menu :Obj_SpawnScriptNow \{select_strings_wait_and_show_list}
endscript

script select_strings_wait_and_show_list 
	Wait \{3
		gameframes}
	begin
	if is_menu_camera_finished
		se_setprops \{alpha = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_destroy_cag_custom_strings 
	generic_list_destroy
	if ScreenElementExists \{id = string_preview}
		DestroyScreenElement \{id = string_preview}
	endif
endscript

script ui_init_cag_custom_strings 
	pushtemporarycasappearance
endscript

script ui_deinit_cag_custom_strings 
	poptemporarycasappearance
endscript

script select_strings_focus_change 
	if ScreenElementExists \{id = string_preview}
		DestroyScreenElement \{id = string_preview}
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = (($<part>) [<index>].desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (($<part>) [<index>].desc_id)
	endif
	PushAssetContext \{context = z_soundcheck}
	CreateScreenElement {
		id = string_preview
		Type = SpriteElement
		parent = root_window
		texture = <preview_texture>
		Pos = (750.0, 200.0)
		just = [-1.0 -1.0]
		dims = (256.0, 256.0)
	}
	PopAssetContext \{context = z_soundcheck}
	editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
endscript
