
script ui_create_customize_character 
	printf \{'ui_create_customize_character'}
	printstruct <...>
	Change \{rich_presence_context = presence_rockstar_creator}
	cas_get_player
	make_generic_car_menu {
		vmenu_id = create_customize_character_vmenu
		pad_back_script = customize_character_save_prompt
		pad_back_params = {state_device = <state_device>}
		Title = qs(0xfc4652b9)
		exclusive_device = <state_device>
		show_history
		num_icons = 0
	}
	setup_cas_menu_handlers controller = <state_device> vmenu_id = create_customize_character_vmenu camera_list = ['customize_character_body' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom'
	CharacterProfileGetStruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	if is_completely_custom_musician id = ($cas_current_profile)
		custom_musician = 1
	else
		if is_ghrocker id = ($cas_current_profile)
			ghrocker = 1
		endif
		focusable_flags = {not_focusable}
	endif
	if is_avatar_appearance appearance = ($cas_current_appearance)
		is_avatar = 1
	endif
	if English
		icon = icon_name
	elseif German
		icon = icon_name_german
	elseif French
		icon = icon_name_french
	elseif Italian
		icon = icon_name_italian
	elseif Spanish
		icon = icon_name_spanish
	endif
	add_car_menu_text_item {
		icon = <icon>
		text = ($cas_current_fullname)
		choose_state = UIstate_edit_name
		choose_state_data = {is_popup char_limit = 18 default_name = ($cas_current_fullname) Title = qs(0x17f49e18) device_num = <state_device>}
		<focusable_flags>
		text_case = original
	}
	if NOT GotParam \{is_avatar}
		if ((GotParam custom_musician) || ($debug_allow_modify_preset_characters = 1))
			add_car_menu_text_item \{text = qs(0x888dd748)
				choose_state = UIstate_customize_character_head
				icon = icon_head}
			add_car_menu_text_item \{text = qs(0x706474c8)
				choose_state = UIstate_customize_character_body
				icon = icon_body}
			add_car_menu_text_item {
				icon = icon_hair
				text = qs(0xca300866)
				choose_state = UIstate_popout_select_part
				choose_state_data = {
					text = qs(0x8476cb4e)
					cam_name = 'customize_character_hair'
					camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
					zoom_camera = 'customize_character_Zoom'
					part = CAS_Hair
					num_icons = 1
					color_wheel = ($hair_colorwheel)
					hist_tex = icon_hair
					is_popup
					stance = Stance_Select_Hair
					remove_parts = [CAS_Hat CAS_Acc_Face CAS_Hat_Hair]
					merge_parts = [CAS_Hair]
				}
			}
		endif
		if GotParam \{ghrocker}
			add_car_menu_text_item {
				icon = icon_outfit
				text = qs(0xa946c7b7)
				choose_state = UIstate_popout_select_part
				choose_state_data = {
					text = qs(0x9f86d873)
					cam_name = 'customize_character_outfit'
					camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					zoom_camera = 'customize_character_Zoom'
					part = CAS_Full_Body
					num_icons = 1
					hist_tex = icon_outfit
					is_popup
					stance = Stance_FrontEnd
					ghrocker = ($cas_current_profile)
				}
			}
		else
			add_car_menu_text_item \{text = qs(0xa946c7b7)
				choose_state = UIstate_customize_character_outfit
				icon = icon_outfit}
		endif
	endif
	add_car_menu_text_item \{icon = icon_instrument
		text = qs(0x8694014b)
		choose_state = UIstate_customize_character_instrument}
	add_car_menu_text_item \{text = qs(0xf62e7772)
		pad_choose_script = exit_save_changes}
	if GetCurrentCASObject
		bandmanager_changestance name = <cas_object> stance = Stance_FrontEnd no_wait
		<cas_object> :Obj_SpawnScriptNow end_moment_anim
	endif
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent type = focus target = create_customize_character_vmenu data = {child_index = <selected_index>}
	if (($has_entered_CAR_before) = 0)
		generic_event_choose \{state = UIstate_helper_dialogue
			data = {
				is_popup
			}}
		Change \{has_entered_CAR_before = 1}
	endif
	if ($autolaunch_cas_instrument != None)
		SpawnScriptDelayed \{frames = 20
			generic_event_choose
			params = {
				state = UIstate_customize_character_instrument
			}}
	endif
endscript

script ui_return_customize_character 
	menu_finish car_helper_text controller = <state_device>
	if GotParam \{text}
		Change cas_current_fullname = <text>
	endif
	ui_create_customize_character selected_index = <selected_index> state_device = <state_device>
endscript

script ui_destroy_customize_character 
	destroy_generic_menu
endscript

script ui_init_customize_character 
	hide_glitch \{num_frames = 10}
	CharacterProfileGetStruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	Change cas_current_fullname = (<profile_struct>.fullname)
	if GotParam \{state_device}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
endscript

script ui_deinit_customize_character 
	cleanup_cas_menu_handlers
	Change \{cas_temporary_appearance_stack = [
		]}
	if NOT (($invite_controller) = -1)
		exit_discard_changes
	endif
	cas_free_resources
	Change \{cas_current_savegame = -1}
	Change \{cas_current_profile = None}
endscript

script name_entry_choose_script 
	Change cas_current_fullname = <text>
	ui_event \{event = menu_back}
endscript

script get_genre_name 
	GetArraySize ($cas_genre_list)
	i = 0
	begin
	if ((($cas_genre_list) [<i>].desc_id) = <genre>)
		return genre_name = (($cas_genre_list) [<i>].frontend_desc)
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_return 
	ui_event \{event = menu_back}
endscript

script customize_character_save_prompt 
	printf \{'customize_character_save_prompt'}
	printstruct <...>
	CharacterProfileGetStruct name = ($cas_current_profile) savegame = ($cas_current_savegame)
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	made_changes = 0
	if (($cas_editing_new_character) = true)
		made_changes = 1
	endif
	if NOT CompareStructs struct1 = <struct1> struct2 = <struct2>
		made_changes = 1
	endif
	if ((<profile_struct>.fullname) != ($cas_current_fullname))
		made_changes = 1
	endif
	if (<made_changes> = 0)
		exit_discard_changes \{no_changes}
	else
		ui_event event = menu_change data = {state = UIstate_save_changes_dialogue is_popup state_device = <state_device>}
	endif
endscript
