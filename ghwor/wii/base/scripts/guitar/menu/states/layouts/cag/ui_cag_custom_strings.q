
script ui_create_cag_custom_strings 
	RequireParams \{[
			part
			text
		]
		all}
	make_list_menu {
		title = <text>
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
	if (<array_Size> > 0)
		i = 0
		begin
		if cas_item_is_visible part = <part> desc_id = ((<part_list> [<i>]).desc_id)
			if is_part_unlockable part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
				if is_part_unlocked part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
					locked = {
						is_unlocked_item
					}
				else
					locked = {
						is_locked_item
					}
				endif
			endif
			if (((<part_list> [<i>]).desc_id) = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			add_list_item {
				text = ((<part_list> [<i>]).frontend_desc)
				pad_choose_script = generic_event_back
				additional_focus_script = select_strings_focus_change
				additional_focus_params = {part = <part> desc_id = ((<part_list> [<i>]).desc_id)}
				index = <num_parts_added>
			}
			num_parts_added = (<num_parts_added> + 1)
			RemoveParameter \{locked}
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
	clean_up_user_control_helpers
	menu_finish car_helper_text_cancel no_rotate_zoom_text controller = <state_device>
	LaunchEvent Type = focus target = create_cag_custom_strings_vmenu data = {child_index = <current_part>}
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
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	CreateScreenElement {
		id = string_preview
		Type = SpriteElement
		parent = root_window
		texture = <preview_texture>
		Pos = (750.0, 200.0)
		just = [-1.0 -1.0]
		dims = (256.0, 256.0)
	}
	editcasappearance target = setpart targetparams = {part = <part> desc_id = <desc_id>}
endscript
hack_block_ui_back_for_a_bit = 0
