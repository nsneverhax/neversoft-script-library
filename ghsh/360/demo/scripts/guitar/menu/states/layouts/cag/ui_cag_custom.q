
script ui_create_cag_custom 
	if cag_custom_is_new_category <...>
		cag_randomize part = (<instrument_info>.body_part)
	endif
	title = qs(0xc6bd9663)
	image = empty
	if (<is_prs>)
		<title> = qs(0x58ae91c9)
		image = prs_sponsor
	elseif (<is_sch>)
		<title> = qs(0x887ba818)
		image = schecter_sponsor
	endif
	make_generic_menu {
		vmenu_id = create_cag_custom_vmenu
		title = <title>
		show_history
	}
	bx_refresh_guitar_sponsor image = <image>
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_vmenu
		camera_list = [
			'cag_main'
			'cag_main_R'
			'cag_main_B'
			'cag_main_L'
		]
		zoom_camera = 'customize_cag_Zoom'}
	if (<is_prs>)
		add_generic_menu_text_item {
			text = qs(0xf7416d79)
			choose_state = uistate_cag_ghgh_presets
			choose_state_data = {
				guit_name = qs(0x803b11bf)
				part = cas_guitar_body
				is_popup
				hist_tex = icon_customize
				no_edit
				camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L']
				zoom_camera = 'customize_cag_Zoom'
				is_prs = <is_prs>
			}
		}
	elseif (<is_sch>)
		add_generic_menu_text_item {
			text = qs(0xf7416d79)
			choose_state = uistate_cag_ghgh_presets
			choose_state_data = {
				guit_name = qs(0xd3e038bb)
				part = cas_guitar_body
				is_popup
				hist_tex = icon_customize
				no_edit
				camera_list = ['cag_main' 'cag_main_R' 'cag_main_B' 'cag_main_L']
				zoom_camera = 'customize_cag_Zoom'
				is_sch = <is_sch>
			}
		}
	endif
	if (<is_prs>)
		add_generic_menu_text_item {
			text = qs(0x706474c8)
			choose_state = uistate_cag_custom_body
			choose_state_data = {instrument_info = <instrument_info> is_sch = 0 is_prs = 1}
		}
	elseif (<is_sch>)
		add_generic_menu_text_item {
			text = qs(0x706474c8)
			choose_state = uistate_cag_custom_body
			choose_state_data = {instrument_info = <instrument_info> is_sch = 1 is_prs = 0}
		}
	else
		add_generic_menu_text_item {
			text = qs(0x706474c8)
			choose_state = uistate_cag_custom_body
			choose_state_data = {instrument_info = <instrument_info> is_sch = 0 is_prs = 0}
		}
	endif
	add_generic_menu_text_item {
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
			zoom_camera = 'cag_select_fretboard_Zoom'
		}
	}
	get_section_index_from_desc_id part = (<instrument_info>.neck_part) target_desc_id = finishes
	if gotparam \{section_index}
		add_generic_menu_text_item {
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
				zoom_camera = 'cag_select_fretboard_Zoom'
			}
		}
		removeparameter \{section_index}
	endif
	if (<is_prs>)
		add_generic_menu_text_item {
			text = qs(0x69a146e9)
			choose_state = uistate_cag_custom_head
			choose_state_data = {part = (<instrument_info>.head_part) body_part = (<instrument_info>.body_part) is_sch = 0 is_prs = 1}
		}
	elseif (<is_sch>)
		add_generic_menu_text_item {
			text = qs(0x69a146e9)
			choose_state = uistate_cag_custom_head
			choose_state_data = {part = (<instrument_info>.head_part) body_part = (<instrument_info>.body_part) is_sch = 1 is_prs = 0}
		}
	else
		add_generic_menu_text_item {
			text = qs(0x69a146e9)
			choose_state = uistate_cag_custom_head
			choose_state_data = {part = (<instrument_info>.head_part) body_part = (<instrument_info>.body_part) is_sch = 0 is_prs = 0}
		}
	endif
	if (<is_prs>)
		add_generic_menu_text_item {
			text = qs(0xa263f7ae)
			choose_state = uistate_cag_custom_hardware
			choose_state_data = {instrument_info = <instrument_info> is_sch = 0 is_prs = 1}
		}
	elseif (<is_sch>)
		add_generic_menu_text_item {
			text = qs(0xa263f7ae)
			choose_state = uistate_cag_custom_hardware
			choose_state_data = {instrument_info = <instrument_info> is_sch = 1 is_prs = 0}
		}
	else
		add_generic_menu_text_item {
			text = qs(0xa263f7ae)
			choose_state = uistate_cag_custom_hardware
			choose_state_data = {instrument_info = <instrument_info> is_sch = 0 is_prs = 0}
		}
	endif
	add_generic_menu_text_item {
		text = qs(0x2e2ac615)
		choose_state = uistate_cag_custom_highway
		choose_state_data = {instrument_info = <instrument_info>}
	}
	if NOT (<is_prs> || <is_sch>)
		add_generic_menu_text_item {
			text = qs(0x0b6c701b)
			pad_choose_script = cag_randomize
			pad_choose_params = {part = (<instrument_info>.body_part)}
			pad_choose_sound = ui_menu_select_sfx
		}
	endif
	getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cag
	if (<visit_cag> = 0)
		setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cag = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xeff43829)
			}}
	endif
	menu_finish \{car_helper_text}
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

script cag_custom_is_new_category 
	if ($cag_instrument_type = guitar)
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = guitar_category
		<old_category> = <guitar_category>
		if NOT (<is_prs> || <is_sch>)
			setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = gh}
		else
			if gotparam \{is_prs}
				if (<is_prs> = 1)
					setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = prs}
				endif
			endif
			if gotparam \{is_sch}
				if (<is_sch> = 1)
					setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = sch}
				endif
			endif
		endif
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = guitar_category
		if (<old_category> != <guitar_category>)
			return \{true}
		endif
	endif
	if ($cag_instrument_type = bass)
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = bass_category
		<old_category> = <bass_category>
		if gotparam \{is_esp}
			if (<is_esp> = 1)
				setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = esp}
			else
				setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = gh}
			endif
		else
			setglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = gh}
		endif
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = bass_category
		if (<old_category> != <bass_category>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script cag_randomize 
	cas_get_is_female \{player = $cas_current_player}
	genre = (($cas_current_appearance).genre)
	if (<part> = cas_guitar_body)
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre> category = <guitar_category>
	elseif (<part> = cas_bass_body)
		getglobaltags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre> category = <bass_category>
	endif
	rebuildcurrentcasmodel
endscript
