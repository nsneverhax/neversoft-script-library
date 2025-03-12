
script ui_create_cag_custom_body_types 
	requireparams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_custom_body_types_vmenu
		pad_back_script = list_exit_restore
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_types_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	getarraysize ($<part>)
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			<add_item> = 1
			if gotparam \{is_esp}
				if (<is_esp> = 1)
					scriptassert \{qs(0x88dc5235)}
				else
					if structurecontains structure = (($<part>) [<i>]) is_esp
						if (((($<part>) [<i>]).is_esp) = 1)
							printf channel = bort qs(0x54e803d2) n = ((($<part>) [<i>]).desc_id)
							<add_item> = 0
						endif
					endif
				endif
			endif
			if structurecontains structure = (($<part>) [<i>]) is_metallica
				if (((($<part>) [<i>]).is_metallica) = 1)
					printf channel = bort qs(0xeff55241) n = ((($<part>) [<i>]).desc_id)
					<add_item> = 0
				endif
			endif
			if structurecontains structure = (($<part>) [<i>]) is_van_halen
				if (((($<part>) [<i>]).is_van_halen) = 1)
					<add_item> = 0
				endif
			endif
			if (<add_item> = 1)
				if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
					current_part = <num_parts_added>
				endif
				if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
					price = ((($<part>) [<i>]).price)
					formattext textname = pad_choose_dialogue qs(0x50618374) s = ((($<part>) [<i>]).frontend_desc)
				endif
				add_list_item {
					text = (($<part> [<i>]).frontend_desc)
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part>}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = add_cag_part
					additional_focus_params = {part = <part> index = <i>}
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
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
				num_parts_added = (<num_parts_added> + 1)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel}
	launchevent type = focus target = create_cag_custom_body_types_vmenu data = {child_index = <current_part>}
endscript

script ui_destroy_cag_custom_body_types 
	generic_list_destroy
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

script add_cag_part 
	requireparams \{[
			part
			index
		]
		all}
	killallcompositetextures
	dumpcompositescratchtextures
	get_part_current_desc_id part = <part>
	if NOT (((($<part>) [<index>]).desc_id) = <current_desc_id>)
		cas_part_will_conflict part_name = <part> part_desc_id = ($<part> [<index>].desc_id)
		if gotparam \{change_parts}
			printf \{qs(0xb3a58f0c)}
			getarraysize \{change_parts}
			if (<array_size> > 0)
				i = 0
				begin
				cas_add_item_to_appearance part = (<change_parts> [<i>].part) desc_id = (<change_parts> [<i>].desc_id) no_rebuild
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		cas_add_item_to_appearance part = <part> desc_id = ($<part> [<index>].desc_id) incremental
	endif
endscript

script add_cag_part_spin_guitar 
	getcurrentcasobject
	if is_female_char
		band_playsimpleanim name = <cas_object> anim = car_female_select_guitar_turn_flip blendduration = 1.0
	else
		band_playsimpleanim name = <cas_object> anim = car_male_select_guitar_turn_flip blendduration = 1.0
	endif
endscript
