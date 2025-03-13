
script ui_create_cag_custom 
	title = qs(0x8694014b)
	if ((<instrument_info>.desc_id) = guitar)
		<title> = qs(0x9504b94a)
	elseif ((<instrument_info>.desc_id) = bass)
		<title> = qs(0x7d4f9214)
	endif
	make_generic_car_menu {
		vmenu_id = create_cag_custom_vmenu
		title = <title>
		show_history
		exclusive_device = <state_device>
	}
	generic_menu :se_setprops \{0x0ab38d7a = 0}
	generic_menu :se_setprops \{generic_menu_title_bg_alpha = 0}
	generic_menu :se_setprops \{border_elements_alpha = 1}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_vmenu camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L'] zoom_camera = 'customize_cag_Zoom' controller = <state_device>
	add_car_menu_text_item {
		icon = icon_cag_body
		text = qs(0x706474c8)
		choose_state = uistate_cag_custom_body
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_car_menu_text_item {
		icon = icon_cag_neck
		text = qs(0xf95d39e5)
		choose_state = uistate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.neck_part)
			body_part = (<instrument_info>.body_part)
			text = qs(0x63730a8b)
			cam_name = 'DrumStart'
			is_popup
			hist_tex = icon_cag_neck
			cam_name = 'cag_select_fretboard'
			no_edit
			camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L']
			zoom_camera = 'customize_cag_Zoom'
		}
	}
	get_section_index_from_desc_id part = (<instrument_info>.neck_part) target_desc_id = finishes
	if gotparam \{section_index}
		add_car_menu_text_item {
			icon = icon_cag_inlay
			text = qs(0x3436c336)
			choose_state = uistate_cap_artist_layer_popout
			choose_state_data = {
				part = (<instrument_info>.neck_part)
				text = qs(0x3436c336)
				section_index = <section_index>
				is_popup
				hist_tex = icon_cag_inlay
				cam_name = 'cag_select_fretboard'
				camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L']
				color_wheel = ($guitar_colorwheel)
				zoom_camera = 'customize_cag_Zoom'
			}
		}
		removeparameter \{section_index}
	endif
	add_car_menu_text_item {
		icon = icon_cag_head
		text = qs(0x69a146e9)
		choose_state = uistate_cag_custom_head
		choose_state_data = {
			part = (<instrument_info>.head_part)
			body_part = (<instrument_info>.body_part)
			cam_name = 'cag_custom_head'
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'customize_cag_Zoom'
		}
	}
	add_car_menu_text_item {
		icon = icon_cag_hardware
		text = qs(0xa263f7ae)
		choose_state = uistate_cag_custom_hardware
		choose_state_data = {instrument_info = <instrument_info>}
	}
	getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cag
	if (<visit_cag> = 0)
		setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cag = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xb4470071)
			}}
	endif
	menu_finish car_helper_text controller = <state_device>
	launchevent type = focus target = create_cag_custom_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom 
	destroy_generic_menu
endscript

script ui_return_cag_custom 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
