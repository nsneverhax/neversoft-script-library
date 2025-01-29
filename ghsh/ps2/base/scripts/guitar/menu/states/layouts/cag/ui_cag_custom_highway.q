
script ui_create_cag_custom_highway 
	part = (<instrument_info>.highway_part)
	make_generic_menu \{title = qs(0xb22af2c1)
		pad_back_script = generic_exit_restore}
	add_highway_menu_item \{vmenu_id = highway_vmenu}
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
			add_generic_menu_text_item {
				parent = highway_menu
				text = ((($<part>) [<i>]).frontend_desc)
				pad_choose_script = generic_event_back
				additional_focus_script = focus_change_highway
				additional_focus_params = {part = <part> index = <i>}
			}
			num_parts_added = (<num_parts_added> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	LaunchEvent Type = focus target = highway_menu data = {child_index = <current_part>}
	if GotParam \{image}
		if NOT ScreenElementExists \{id = guitar_sponsor_container}
			bx_create_guitar_sponsor
			bx_refresh_guitar_sponsor image = <image>
		else
			bx_refresh_guitar_sponsor image = <image>
		endif
	endif
endscript

script ui_destroy_cag_custom_highway 
	destroy_generic_menu
endscript

script ui_init_cag_custom_highway 
	pushtemporarycasappearance
	bx_destroy_guitar_sponsor
endscript

script ui_deinit_cag_custom_highway 
	poptemporarycasappearance
	bx_destroy_guitar_sponsor
endscript

script focus_change_highway 
	cas_add_item_to_appearance {
		part = <part>
		desc_id = (($<part>) [<index>].desc_id)
		no_rebuild
	}
	highway_menu_anchor :se_setprops highway_menu_item_highway_texture = ((($<part>) [<index>]).frontend_img)
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
	Obj_GetID
	if ScreenElementExists \{id = highway_menu_anchor}
		GetScreenElementPosition id = <objID>
		<objID> :se_getparentid
		<parent_id> :GetTags
		if GotParam \{total_length}
			scroll_perc = ((<screenelementpos>.(0.0, 1.0)) / <total_length>)
			scroll_len = 248
			scroll_pos = (((<scroll_perc> * 248) * (0.0, 1.0)) + (-17.0, 60.0))
			highway_menu_anchor :se_setprops highway_menu_scrollbar_thumb_blue_pos = <scroll_pos>
		endif
	endif
endscript
