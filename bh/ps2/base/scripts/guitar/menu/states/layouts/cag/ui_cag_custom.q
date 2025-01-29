
script ui_create_cag_custom 
	if cag_custom_is_new_category is_esp = <is_esp>
		cag_randomize part = (<instrument_info>.body_part)
	endif
	title = qs(0x1f790f57)
	if (<is_esp>)
		<title> = qs(0x16e9b43d)
	endif
	make_generic_menu {
		vmenu_id = create_cag_custom_vmenu
		title = <title>
		show_history
		0xc1dc518f = 1
		0x36ee6bbc
	}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
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
	if getcasappearancepart part = (<instrument_info>.neck_part)
		getactualcasoptionstruct part = (<instrument_info>.neck_part) desc_id = <desc_id>
		if GotParam \{finishable}
			add_generic_menu_text_item {
				text = qs(0x3436c336)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = (<instrument_info>.neck_part) text = qs(0x3436c336) cam_name = 'cag_select_fretboard' camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L'] zoom_camera = 'cag_select_fretboard_Zoom' container_id = <container_id> is_popup hist_tex = icon_cag_inlay color_wheel = ($guitar_colorwheel)}
			}
		endif
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
		text = qs(0x0b6c701b)
		choose_state = uistate_generic_dialogue
		choose_state_data = {
			title = qs(0x49127634)
			text = qs(0xcb2b7871)
			choose_yes_func = 0xcf811cf5
			choose_yes_params = {part = (<instrument_info>.body_part)}
		}
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
	0x59249cc9
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
	SpawnScriptNow 0xe9abba42 params = {<...>}
endscript

script 0xe9abba42 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	cas_get_is_female \{Player = $cas_current_player}
	genre = (($cas_current_appearance).genre)
	cas_start_loading_anim \{player_index = 0}
	if NOT GotParam \{genre}
		genre = rock
	endif
	if (<part> = cas_guitar_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre> category = <guitar_category> 0xc2c0ca93
	elseif (<part> = cas_bass_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre> category = <bass_category> 0xc2c0ca93
	endif
	rebuildcurrentcasmodel
	Wait \{1
		Second}
endscript

script 0xcf811cf5 
	0xe9abba42 <...>
	ui_event \{event = menu_back}
endscript
