debug_allow_modify_preset_characters = 0
has_entered_car_before = 1

script ui_create_customize_character 
	change \{disallow_band_edit_char_spam = 0}
	change \{rich_presence_context = presence_rockstar_creator}
	set_cas_loading_setup \{setup = single}
	cas_set_object_node_pos player = ($cas_current_player) node = z_soundcheck_trg_waypoint_car_start
	killskatercamanim \{all}
	if NOT is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		no_up_down_sound_handlers = true
	endif
	make_generic_menu {
		vmenu_id = create_customize_character_vmenu
		pad_back_script = exit_discard_changes
		title = qs(0x70a9b711)
		show_history
		num_icons = 0
		no_up_down_sound_handlers = <no_up_down_sound_handlers>
	}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_vmenu
		camera_list = [
			'customize_character_body'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		custom_musician = 1
	else
		focusable_flags = {not_focusable}
	endif
	if is_from_singleplayer_hub
		add_generic_menu_text_item \{text = qs(0x7863365c)
			pad_choose_script = return_to_singleplayer_hub}
	endif
	add_generic_menu_text_item {
		text = (<profile_struct>.fullname)
		choose_state = uistate_cas_text_entry
		choose_state_data = {choose_script = name_entry_choose_script text = (<profile_struct>.fullname) num_icons = 1 cam_name = 'customize_character'}
		<focusable_flags>
		text_case = original
	}
	if ((gotparam custom_musician) || ($debug_allow_modify_preset_characters = 1))
		add_generic_menu_text_item \{text = qs(0x888dd748)
			not_focusable
			choose_state = uistate_customize_character_head}
		<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [48 48 48 128]
		add_generic_menu_text_item \{text = qs(0x706474c8)
			not_focusable
			choose_state = uistate_customize_character_body}
		<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [48 48 48 128]
		height = 0
		find_physique_height
		if (<height> > 0)
			if is_female_char
				hair_cam_name = 'customize_character_hair'
			else
				hair_cam_name = 'customize_character_hair'
			endif
		else
			if is_female_char
				hair_cam_name = 'customize_character_hair'
			else
				hair_cam_name = 'customize_character_hair'
			endif
		endif
		add_generic_menu_text_item {
			text = qs(0xca300866)
			not_focusable
			choose_state = uistate_popout_select_part
			choose_state_data = {
				text = qs(0x8476cb4e)
				cam_name = <hair_cam_name>
				camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
				zoom_camera = 'customize_character_Zoom'
				part = cas_hair
				num_icons = 1
				color_wheel = ($hair_colorwheel)
				hist_tex = icon_hair
				is_popup
				stance = stance_select_hair
			}
		}
		<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [48 48 48 128]
	endif
	if customize_outfit_allowed name = (<profile_struct>.name)
		add_generic_menu_text_item \{text = qs(0xa946c7b7)
			not_focusable
			choose_state = uistate_customize_character_outfit}
		<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [48 48 48 128]
	endif
	add_generic_menu_text_item \{text = qs(0x8694014b)
		not_focusable
		choose_state = uistate_customize_character_instrument}
	<item_container_id> :se_setprops generic_menu_smenu_textitem_text_rgba = [48 48 48 128]
	add_generic_menu_text_item \{text = qs(0x320a8d1c)
		pad_choose_script = exit_discard_changes}
	getcurrentcasobject
	if gotparam \{cas_object}
		bandmanager_changestance name = <cas_object> stance = stance_frontend
	endif
	menu_finish \{car_helper_text}
	if is_from_singleplayer_hub
		launchevent \{type = focus
			target = create_customize_character_vmenu
			data = {
				child_index = 0
			}}
	else
		launchevent type = focus target = create_customize_character_vmenu data = {child_index = <selected_index>}
	endif
	if (($has_entered_car_before) = 0)
		generic_event_choose \{state = uistate_helper_dialogue
			data = {
				is_popup
			}}
		change \{has_entered_car_before = 1}
	endif
endscript

script ui_return_customize_character 
	menu_finish \{car_helper_text}
endscript

script ui_destroy_customize_character 
	destroy_generic_menu
endscript

script ui_init_customize_character 
	create_band_money_display
endscript

script ui_deinit_customize_character 
	if ($cas_heap_state = in_game)
	else
		if ($shutdown_game_for_signin_change_flag = 1)
			cas_free_resources \{spawn
				block_scripts = 1}
		else
			spawnscriptnow \{cas_free_resources}
		endif
	endif
	destroy_band_money_display
	if ($invite_controller = -1)
		change \{cas_current_savegame = -1}
		change \{cas_current_profile = none}
	elseif NOT ui_event_exists_in_stack \{name = 'create_character_gender'}
		change \{cas_current_savegame = -1}
		change \{cas_current_profile = none}
	endif
endscript

script customize_outfit_allowed 
	switch (<name>)
		case alex_van_halen2
		case alex_van_halen_alt2
		case eddie_van_halen2
		case eddie_van_halen_alt2
		case wolf_van_halen2
		case wolf_van_halen_alt2
		case david_lee_roth2
		case david_lee_roth_alt2
		return \{false}
	endswitch
	return \{true}
endscript

script name_entry_choose_script 
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <text> savegame = ($cas_current_savegame)
	ui_event \{event = menu_back}
endscript

script get_genre_name 
	getarraysize ($genre_list)
	i = 0
	begin
	if ((($genre_list) [<i>].desc_id) = <genre>)
		return genre_name = (($genre_list) [<i>].frontend_desc)
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_return 
	ui_event \{event = menu_back}
endscript

script customize_character_save_prompt 
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	if (($cas_editing_new_character) = false && comparestructs struct1 = <struct1> struct2 = <struct2>)
		exit_discard_changes \{no_changes}
	else
		spawnscriptnow \{temporarilydisableinput
			params = {
				time = 250
			}}
		ui_event \{event = menu_change
			data = {
				state = uistate_save_changes_dialogue
				is_popup
			}}
	endif
endscript

script is_from_singleplayer_hub 
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		return \{true}
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script return_to_singleplayer_hub 
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	change \{first_character_hub_enter = 0}
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	if (($cas_editing_new_character) = false && comparestructs struct1 = <struct1> struct2 = <struct2>)
		exit_skip_save \{readytorock = 1}
	else
		if NOT is_autosave_on savegame = ($cas_current_savegame)
			customize_character_save_prompt
		else
			cas_get_player_status
			if isxenon
				if checkforsignin local controller_index = ($<player_status>.controller)
					exit_save_changes \{not_replace
						readytorock = 1}
				else
					exit_skip_save \{readytorock = 1}
				endif
			else
				exit_save_changes \{not_replace
					readytorock = 1}
			endif
		endif
	endif
endscript
