
script ui_create_cag_custom_strings 
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_custom_strings_vmenu
		pad_back_script = generic_exit_restore
		icon = <hist_tex>
		exclusive_device = <state_device>
	}
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	if GotParam \{download}
		ScriptAssert \{'download flag not supported'}
	else
		part_list = ($<part>)
	endif
	GetArraySize <part_list>
	if (<array_size> > 0)
		i = 0
		begin
		if cas_item_is_visible part = <part> desc_id = ((<part_list> [<i>]).desc_id)
			if is_part_unlocked part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
				if (((<part_list> [<i>]).desc_id) = <current_desc_id>)
					current_part = <num_parts_added>
				endif
				add_list_item {
					text = ((<part_list> [<i>]).frontend_desc)
					pad_choose_script = generic_event_back
					additional_focus_script = select_strings_focus_change
					additional_focus_params = {part = <part> desc_id = ((<part_list> [<i>]).desc_id)}
				}
				num_parts_added = (<num_parts_added> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	clean_up_user_control_helpers
	menu_finish car_helper_text_cancel no_rotate_zoom_text controller = <state_device>
	LaunchEvent type = focus target = create_cag_custom_strings_vmenu data = {child_index = <current_part>}
endscript

script ui_destroy_cag_custom_strings 
	generic_list_destroy
	if ScreenElementExists \{id = string_preview}
		DestroyScreenElement \{id = string_preview}
	endif
endscript

script ui_init_cag_custom_strings 
	PushTemporaryCASAppearance
endscript

script ui_deinit_cag_custom_strings 
	PopTemporaryCASAppearance
endscript

script select_strings_focus_change 
	if ScreenElementExists \{id = string_preview}
		DestroyScreenElement \{id = string_preview}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	CreateScreenElement {
		id = string_preview
		type = SpriteElement
		parent = root_window
		texture = <preview_texture>
		Pos = (750.0, 200.0)
		just = [-1.0 -1.0]
		dims = (256.0, 256.0)
	}
	EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
endscript
