
script ui_create_cag_select_part_inclusion_options 
	spawnscriptnow ui_create_cag_select_part_inclusion_options_worker params = {<...>}
endscript

script ui_create_cag_select_part_inclusion_options_worker 
	requireparams \{[
			part
		]
		all}
	make_generic_menu \{vmenu_id = create_cag_custom_part_pickguard_options_vmenu
		pad_back_script = ui_event
		pad_back_params = {
			event = menu_back
			data = {
				num_states = 2
			}
		}}
	create_ui_history_header text = <text>
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_part_pickguard_options_vmenu}
	get_section_index_from_desc_id part = <part> target_desc_id = finishes
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			text = qs(0x6e23fd31)
			choose_state = uistate_cap_artist_layer
			choose_state_data = {part = <part> text = qs(0x6e23fd31) section_index = <section_index>}
		}
		removeparameter \{section_index}
	endif
	get_section_index_from_desc_id part = <part> target_desc_id = details
	if gotparam \{section_index}
		add_generic_menu_icon_item {
			text = qs(0x7f5a5c11)
			choose_state = uistate_cap_artist_layer
			choose_state_data = {part = <part> text = qs(0x7f5a5c11) section_index = <section_index>}
		}
		removeparameter \{section_index}
	endif
	menu_finish \{car_helper_text}
	if gotparam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
	launchevent type = focus target = create_cag_custom_part_pickguard_options_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_select_part_inclusion_options 
	destroy_generic_menu
endscript
