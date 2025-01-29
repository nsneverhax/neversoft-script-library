
script ui_create_cag_select_part_inclusion_options 
	SpawnScriptNow ui_create_cag_select_part_inclusion_options_worker params = {<...>}
endscript

script ui_create_cag_select_part_inclusion_options_worker 

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
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{finishable}
			add_generic_menu_text_item {
				text = qs(0x48b206fc)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = <part> text = qs(0x48b206fc) cam_anim = guitarbody}
			}
		endif
		if GotParam \{0x7f2cf2c2}
			add_generic_menu_text_item {
				text = qs(0x6149aa3d)
				choose_state = uistate_cas_color_edit
				choose_state_data = {part = <part> text = qs(0x6149aa3d) cam_anim = guitarbody part_materials = [skin]}
			}
		endif
		if GotParam \{detailable}
			add_generic_menu_text_item {
				text = qs(0x7f5a5c11)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = cas_drum_detail body_part = <part> text = qs(0x7f5a5c11) cam_anim = guitarbody}
			}
		endif
	endif
	menu_finish \{car_helper_text}
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
	LaunchEvent Type = focus target = create_cag_custom_part_pickguard_options_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_select_part_inclusion_options 
	destroy_generic_menu
endscript
