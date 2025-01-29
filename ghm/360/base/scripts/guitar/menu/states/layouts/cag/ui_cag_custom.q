
script ui_create_cag_custom 
	if cag_custom_is_new_category is_esp = <is_esp>
		cag_randomize part = (<instrument_info>.body_part)
	endif
	title = qs(0x6cbee2a3)
	if (<is_esp>)
		<title> = qs(0x6e63c77e)
	endif
	make_generic_menu {
		vmenu_id = create_cag_custom_vmenu
		title = <title>
		show_history
	}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_vmenu
		camera_list = [
			'cag_main'
			'cag_main_R'
			'cag_main_B'
			'cag_main_L'
		]
		zoom_camera = 'customize_cag_Zoom'}
	add_generic_menu_text_item {
		text = qs(0x706474c8)
		choose_state = uistate_cag_custom_body
		choose_state_data = {instrument_info = <instrument_info> is_esp = <is_esp>}
	}
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
			is_esp = <is_esp>
		}
	}
	get_section_index_from_desc_id part = (<instrument_info>.neck_part) target_desc_id = finishes
	if GotParam \{section_index}
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
				is_esp = <is_esp>
			}
		}
		RemoveParameter \{section_index}
	endif
	add_generic_menu_text_item {
		text = qs(0x69a146e9)
		choose_state = uistate_cag_custom_head
		choose_state_data = {part = (<instrument_info>.head_part) body_part = (<instrument_info>.body_part) is_esp = <is_esp>}
	}
	add_generic_menu_text_item {
		text = qs(0xa263f7ae)
		choose_state = uistate_cag_custom_hardware
		choose_state_data = {instrument_info = <instrument_info> is_esp = <is_esp>}
	}
	add_generic_menu_text_item {
		text = qs(0x2e2ac615)
		choose_state = uistate_cag_custom_highway
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_text_item {
		text = qs(0x0b6c701b)
		pad_choose_script = cag_randomize
		pad_choose_params = {part = (<instrument_info>.body_part)}
		pad_choose_sound = ui_menu_select_sfx
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cag
	if (<visit_cag> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cag = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x8cf3582a)
			}}
	endif
	menu_finish \{car_helper_text}
	LaunchEvent Type = focus target = create_cag_custom_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom 
	destroy_generic_menu
endscript

script ui_return_cag_custom 
	SpawnScriptNow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript

script cag_custom_is_new_category 
	if ($cag_instrument_type = guitar)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = guitar_category
		<old_category> = <guitar_category>
		if GotParam \{is_esp}
			if (<is_esp> = 1)
				SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = esp}
			else
				SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = gh}
			endif
		else
			SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = gh}
		endif
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = guitar_category
		if (<old_category> != <guitar_category>)
			return \{true}
		endif
	endif
	if ($cag_instrument_type = bass)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = bass_category
		<old_category> = <bass_category>
		if GotParam \{is_esp}
			if (<is_esp> = 1)
				SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = esp}
			else
				SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = gh}
			endif
		else
			SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category = gh}
		endif
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = bass_category
		if (<old_category> != <bass_category>)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script cag_randomize 
	cas_get_is_female \{Player = $cas_current_player}
	genre = (($cas_current_appearance).genre)
	if (<part> = cas_guitar_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre> category = <guitar_category>
	elseif (<part> = cas_bass_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre> category = <bass_category>
	endif
	rebuildcurrentcasmodel
endscript
