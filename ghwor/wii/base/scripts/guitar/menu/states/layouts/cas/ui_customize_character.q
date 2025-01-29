g_customize_character_text_rows = {
	Name = {
		text = qs(0x43940d2d)
		rhs_width = 350
	}
	gender = {
		text = qs(0x946c6262)
		rhs_width = 300
	}
	Face = {
		text = qs(0x6a492ca9)
		rhs_width = 300
	}
	Body = {
		text = qs(0x71e2467e)
		rhs_width = 300
	}
	hair = {
		text = qs(0x18d5505a)
		rhs_width = 300
	}
	outfit = {
		text = qs(0x8b2d1853)
		rhs_width = 300
	}
}

script ui_create_customize_character 
	printf \{'ui_create_customize_character'}
	Change \{rich_presence_context = presence_rockstar_creator}
	cas_get_player
	make_generic_car_menu {
		vmenu_id = create_customize_character_vmenu
		pad_back_script = customize_character_save_prompt
		pad_back_params = {state_device = <state_device>}
		pad_back_sound_uitype = None
		title = qs(0x67bd7527)
		exclusive_device = <state_device>
		show_history
		num_icons = 0
	}
	setup_cas_menu_handlers controller = <state_device> vmenu_id = create_customize_character_vmenu camera_list = ['customize_character_body' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom'
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
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
	cas_get_is_female Player = ($cas_current_player)
	add_car_hub_text_item {
		($g_customize_character_text_rows.Name)
		value_script = customize_character_get_name_value
		pad_choose_script = customize_character_choose_name
		pad_choose_params = {device_num = <state_device>}
		<focusable_flags>
	}
	if NOT GotParam \{is_avatar}
		if ((GotParam custom_musician) || ($debug_allow_modify_preset_characters = 1))
			if NOT StructureContains structure = ($cas_current_appearance) presets
				Change cas_current_appearance = {($cas_current_appearance) presets = {}}
			endif
			add_car_hub_text_item {
				($g_customize_character_text_rows.gender)
				value_script = customize_character_get_gender_value
				pad_choose_script = customize_character_change_gender
				pad_choose_params = {state_device = <state_device>}
				pad_select_sound_uitype = warningmessage
			}
			add_car_hub_text_item {
				($g_customize_character_text_rows.Face)
				value_script = customize_character_get_preset_value
				value_script_params = {preset_type = car_presets_face}
				choose_state = uistate_character_face_deformation
				choose_state_data = {
					text = qs(0xb5847ea6)
					cam_name = 'customize_character_head'
					camera_list = ['customize_character_head' 'customize_character_head_R' 'customize_character_head_B' 'customize_character_head_L']
					zoom_camera = 'customize_character_Zoom'
					num_icons = 1
					hist_tex = icon_hair
					is_popup
					stance = stance_select_hair
					customize_state = uistate_character_face_deformation
				}
			}
			add_car_hub_text_item {
				($g_customize_character_text_rows.Body)
				value_script = customize_character_get_preset_value
				value_script_params = {preset_type = car_presets_body}
				choose_state = uistate_popout_select_preset
				choose_state_data = {
					text = qs(0x706474c8)
					cam_name = 'customize_character_outfit'
					camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					zoom_camera = 'customize_character_Zoom'
					preset_list_name = car_presets_body
					num_icons = 1
					hist_tex = icon_hair
					is_popup
					customize_state = uistate_customize_character_body
				}
			}
			add_car_hub_text_item {
				($g_customize_character_text_rows.hair)
				value_script = customize_character_get_hair_value
				value_script_params = {part = cas_hair}
				choose_state = uistate_popout_select_part
				choose_state_data = {
					text = qs(0xca300866)
					cam_name = 'customize_character_hair'
					camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
					zoom_camera = 'customize_character_Zoom'
					part = cas_hair
					num_icons = 1
					color_wheel = ($hair_colorwheel)
					hist_tex = icon_hair
					is_popup
					stance = stance_select_hair
					remove_parts = [cas_hat cas_acc_face cas_hat_hair]
					merge_parts = [cas_hair]
				}
			}
		endif
		if NOT GotParam \{ghrocker}
			add_car_hub_text_item {
				($g_customize_character_text_rows.outfit)
				value_script = customize_character_get_preset_value
				value_script_params = {preset_type = car_presets_outfit}
				choose_state = uistate_popout_select_preset
				choose_state_data = {
					text = qs(0xa946c7b7)
					cam_name = 'customize_character_outfit'
					camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					zoom_camera = 'customize_character_Zoom'
					preset_list_name = car_presets_outfit
					num_icons = 1
					hist_tex = icon_outfit
					is_popup
					stance = stance_frontend
					customize_state = uistate_customize_character_outfit
				}
			}
		endif
	endif
	add_car_hub_text_item \{text = qs(0x8694014b)
		choose_state = uistate_customize_character_instrument}
	add_car_hub_text_item \{text = qs(0xf62e7772)
		pad_choose_script = exit_save_changes}
	customize_character_refresh_values
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
		<cas_object> :Obj_SpawnScriptNow end_moment_anim
	endif
	menu_finish car_helper_text controller = <state_device>
	LaunchEvent Type = focus target = create_customize_character_vmenu data = {child_index = <selected_index>}
	if (($has_entered_car_before) = 0)
		Change \{generic_menu_block_input = 1}
		generic_event_choose \{state = uistate_helper_dialogue
			data = {
				is_popup
			}}
		Change \{has_entered_car_before = 1}
	endif
	if ($autolaunch_cas_instrument != None)
		spawnscriptdelayed \{frames = 20
			generic_event_choose
			params = {
				state = uistate_customize_character_instrument
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
	Change \{cas_build_model_request = 0}
	hide_glitch \{num_frames = 10}
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	Change cas_current_fullname = (<profile_struct>.fullname)
	if GotParam \{state_device}
		ui_event event = menu_change_device force_event = true data = {state_device = <state_device>}
	endif
	if NOT ui_event_exists_in_stack \{Name = 'character_selection'}
		hack_stop_ampzilla
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
	if NOT ui_event_exists_in_stack \{Name = 'character_selection'}
		hack_start_ampzilla
	endif
	Change \{cas_build_model_request = 0}
endscript

script customize_character_choose_name 
	generic_event_choose state = uistate_edit_name data = {
		is_popup
		char_limit = 18
		default_name = ($cas_current_fullname)
		title = qs(0x2e9c2c85)
		device_num = <device_num>
		text_case = Original
	}
endscript

script customize_character_save_prompt 
	printf \{'customize_character_save_prompt'}
	printstruct <...>
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	made_changes = 0
	if (($cas_editing_new_character) = true)
		made_changes = 1
	endif
	if NOT comparestructs struct1 = <struct1> struct2 = <struct2>
		made_changes = 1
	endif
	if ((<profile_struct>.fullname) != ($cas_current_fullname))
		made_changes = 1
	endif
	if (<made_changes> = 0)
		ui_sfx \{menustate = Generic
			uitype = back}
		exit_discard_changes \{no_changes}
	else
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		ui_event event = menu_change data = {state = uistate_save_changes_dialogue is_popup state_device = <state_device>}
	endif
endscript

script customize_character_choose_gender 
	SpawnScriptNow \{customize_character_choose_gender_spawned}
	generic_event_back
endscript

script customize_character_choose_gender_spawned 
	setscriptcannotpause
	pushunsafeforshutdown \{context = customize_character_choose_gender_spawned}
	SetButtonEventMappings \{block_menu_input}
	cas_get_is_female Player = ($cas_current_player)
	<index> = <is_female>
	cas_gender_focus_change part = cas_body new_desc_id = ($cas_body [<index>].desc_id)
	Wait \{1
		gameframe}
	current_menu :se_setprops \{alpha = 0.0}
	user_control_container :se_setprops \{alpha = 0.0}
	cas_queue_wait
	customize_character_refresh_values
	SetButtonEventMappings \{unblock_menu_input}
	popunsafeforshutdown \{context = customize_character_choose_gender_spawned}
	user_control_container :se_setprops \{alpha = 1.0}
	current_menu :se_setprops \{alpha = 1.0}
endscript

script customize_character_refresh_values 
	characterprofilegetstruct Name = ($cas_current_profile) savegame = ($cas_current_savegame)
	GetScreenElementChildren \{id = create_customize_character_vmenu}
	GetArraySize \{children}
	<i> = 0
	begin
	<element> = (<children> [<i>])
	<element> :GetSingleTag value_script
	<element> :GetSingleTag value_script_params
	<value_script> <value_script_params>
	<element> :se_setprops value_text = <value>
	<element> :se_setprops value_rgba = [205 185 123 255]
	if GotParam \{different_color}
		if (<different_color> = 1)
			<element> :se_setprops value_rgba = [220 220 220 255]
		endif
	endif
	RemoveParameter \{different_color}
	RemoveParameter \{value}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script customize_character_get_name_value 
	return value = ($cas_current_fullname)
endscript

script customize_character_get_gender_value 
	cas_get_is_female Player = ($cas_current_player)
	if (<is_female> = 1)
		return \{value = qs(0x8d865a78)}
	else
		return \{value = qs(0x8297fc0c)}
	endif
endscript

script customize_character_get_preset_value \{preset_type = !q1768515945}
	if (<preset_type> = car_presets_face)
		return \{value = qs(0xd2cd3957)}
	elseif is_preset_type_in_appearance preset_type = <preset_type>
		return value = (<preset_list> [<preset_index>].frontend_desc)
	else
		return \{value = qs(0xd2cd3957)}
	endif
endscript

script customize_character_get_hair_value 
	resolvebodyspecificpartinappearance part = <part>
	get_part_current_desc_id part = <part>
	GetArraySize ($<part>)
	<i> = 0
	begin
	<hair_part> = ($<part> [<i>])
	if (<hair_part>.desc_id = <current_desc_id>)
		return value = (<hair_part>.frontend_desc)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{value = qs(0xd2cd3957)
		different_color = 1}
endscript

script customize_character_get_default_value 
	return \{value = qs(0x03ac90f0)}
endscript

script customize_character_change_gender 
	ui_event event = menu_change data = {
		state = uistate_generic_dialog_box
		is_popup
		player_device = <state_device>
		heading_text = qs(0xaa163738)
		body_text = qs(0x1e14b3f4)
		template = cancel_confirm
		options = [
			{
				text = qs(0xf7723015)
				func = generic_event_back
			}
			{
				text = qs(0x113815bc)
				func = customize_character_choose_gender
				func_params = {is_female = <is_female>}
			}
		]
	}
endscript
