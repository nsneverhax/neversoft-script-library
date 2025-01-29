
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
	if NOT ScreenElementExists \{id = guitar_sponsor_container}
		bx_create_guitar_sponsor
		bx_refresh_guitar_sponsor image = <image>
	else
		bx_refresh_guitar_sponsor image = <image>
	endif
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
				guit_name = qs(0x0f69690e)
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
				guit_name = qs(0x90f2d7d1)
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
	if getcasappearancepart part = (<instrument_info>.neck_part)
		getactualcasoptionstruct part = (<instrument_info>.neck_part) desc_id = <desc_id>
		if GotParam \{finishable}
			add_generic_menu_text_item {
				text = qs(0x3436c336)
				choose_state = uistate_cag_select_part_inclusion
				choose_state_data = {part = (<finishable>) body_part = (<instrument_info>.neck_part) text = qs(0x3436c336) cam_name = 'cag_select_fretboard' camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L'] container_id = <container_id> is_popup hist_tex = icon_cag_inlay color_wheel = ($guitar_colorwheel)}
			}
		endif
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
		choose_state_data = {instrument_info = <instrument_info> image = <image>}
	}
	if NOT (<is_prs> || <is_sch>)
		add_generic_menu_text_item {
			text = qs(0x0b6c701b)
			pad_choose_script = 0xe9abba42
			pad_choose_params = {part = (<instrument_info>.body_part)}
			pad_choose_sound = ui_menu_select_sfx
		}
	endif
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cag
	if (<visit_cag> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cag = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0xeff43829)
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
		if NOT (<is_prs> || <is_sch>)
			SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = gh}
		else
			if GotParam \{is_prs}
				if (<is_prs> = 1)
					SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = prs}
				endif
			endif
			if GotParam \{is_sch}
				if (<is_sch> = 1)
					SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {guitar_category = sch}
				endif
			endif
		endif
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = guitar_category
		printf channel = 0x1e4a6bb4 qs(0x59be82c3) p = (<guitar_category>)
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
	if NOT GotParam \{genre}
		genre = rock
	endif
	if (<part> = cas_guitar_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = guitar_category
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre> category = <guitar_category>
	elseif (<part> = cas_bass_body)
		GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {bass_category}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.bass) is_female = <is_female> genre = <genre> category = <bass_category>
	endif
	rebuildcurrentcasmodel
	Wait \{1
		Second}
endscript
