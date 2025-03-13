
script ui_create_cag_custom_highway 
	part = (<instrument_info>.highway_part)
	make_generic_menu \{title = qs(0xb22af2c1)
		pad_back_script = generic_exit_restore
		centered}
	add_highway_menu_item \{vmenu_id = highway_vmenu}
	resolvebodyspecificpartinappearance part = <part>
	current_part = 0
	get_locked_highway_list savegame = ($cas_current_savegame)
	get_part_current_desc_id part = <part>
	getarraysize ($<part>)
	num_parts_added = 0
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if NOT arraycontains array = <locked_highways> contains = ((($<part>) [<i>]).desc_id)
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
	endif
	i = (<i> + 1)
	repeat <array_size>
	launchevent type = focus target = highway_menu data = {child_index = <current_part>}
endscript

script ui_destroy_cag_custom_highway 
	destroy_generic_menu
endscript

script ui_init_cag_custom_highway 
	pushtemporarycasappearance
endscript

script ui_deinit_cag_custom_highway 
	poptemporarycasappearance
endscript

script focus_change_highway 
	select_part_focus_change {part = <part> index = <index>}
	highway_menu_anchor :se_setprops highway_menu_item_highway_texture = ((($<part>) [<index>]).frontend_img)
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
endscript

script get_locked_highway_list 
	requireparams \{[
			savegame
		]
		all}
	get_musician_profile_size savegame = <savegame>
	locked_highways = []
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	if NOT structurecontains structure = <profile_struct> selection_not_allowed
		if NOT customize_outfit_allowed name = (<profile_struct>.name)
			if NOT display_character_logic profile_struct = <profile_struct> savegame = <savegame> part = guitar
				addarrayelement array = <locked_highways> element = (<profile_struct>.appearance.cas_guitar_highway.desc_id)
				locked_highways = <array>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct locked_highways = <locked_highways>
	return locked_highways = <locked_highways>
endscript
