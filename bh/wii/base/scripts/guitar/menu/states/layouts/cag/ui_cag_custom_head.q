
script ui_create_cag_custom_head 
	make_generic_car_menu {
		vmenu_id = create_cag_custom_head_id
		show_history
		title = qs(0x888dd748)
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{skull_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_head_id
		camera_list = [
			'cag_custom_head'
			'cag_custom_head_R'
			'cag_custom_head_B'
			'cag_custom_head_L'
		]
		zoom_camera = 'customize_cag_Zoom'}
	add_car_menu_text_item {
		icon = icon_cag_head_type
		text = qs(0xe8775204)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = <part>
			body_part = <body_part>
			text = qs(0x4e02295c)
			is_popup
			hist_tex = icon_cag_head_type
			color_wheel = ($guitar_colorwheel)
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'customize_cag_Zoom'
			no_edit
		}
	}
	if getcasappearancepart part = <part>
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if GotParam \{finishable}
			add_car_menu_text_item {
				text = qs(0x3f47b13d)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = <part> text = qs(0x6e23fd31) camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes}
			}
		endif
		if GotParam \{detailable}
			add_car_menu_text_item {
				text = qs(0xe35a68c5)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<detailable>) body_part = <part> text = qs(0x7f5a5c11) camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes}
			}
		endif
	endif
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent Type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_head 
	destroy_generic_menu
endscript

script ui_return_cag_custom_head 
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
