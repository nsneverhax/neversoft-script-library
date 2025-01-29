debug_allow_modify_preset_characters = 0
has_entered_car_before = 1

script ui_create_customize_character 
	SpawnScriptNow \{0x419cda3a}
	0x31956c10 \{FALSE}
	Change \{rich_presence_context = presence_rockstar_creator}
	set_cas_loading_setup \{setup = single}
	0xce0505af
	cas_set_object_node_pos Player = ($cas_current_player) node = <0xb07e72b1>
	KillSkaterCamAnim \{all}
	make_generic_menu \{vmenu_id = create_customize_character_vmenu
		pad_back_script = customize_character_save_prompt
		title = qs(0x131c0c64)
		show_history
		num_icons = 0}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_vmenu
		camera_list = [
			'customize_character'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		custom_musician = 1
	else
		if is_ghrocker id = ($cas_current_profile)
			ghrocker = 1
		endif
		focusable_flags = {not_focusable}
	endif
	if is_from_singleplayer_hub
		add_generic_menu_text_item \{text = qs(0x7863365c)
			pad_choose_script = return_to_singleplayer_hub}
	endif
	add_generic_menu_text_item {
		text = ($cas_current_fullname)
		choose_state = uistate_cas_text_entry
		choose_state_data = {choose_script = name_entry_choose_script text = ($cas_current_fullname) num_icons = 1 cam_name = 'customize_character'}
		<focusable_flags>
		text_case = Original
	}
	if ((GotParam custom_musician) || ($debug_allow_modify_preset_characters = 1))
		add_generic_menu_text_item \{text = qs(0x888dd748)
			choose_state = uistate_customize_character_head}
		add_generic_menu_text_item \{text = qs(0x706474c8)
			choose_state = uistate_customize_character_body}
		add_generic_menu_text_item {
			text = qs(0xca300866)
			choose_state = uistate_popout_select_part
			choose_state_data = {
				text = qs(0x8476cb4e)
				cam_name = 'customize_character_hair'
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
	endif
	if GotParam \{ghrocker}
		0x84d8355f part = cas_full_body ghrocker = ($cas_current_profile)
		if (<0xe8e2af61> > 1)
			add_generic_menu_text_item {
				icon = icon_outfit
				text = qs(0xa946c7b7)
				choose_state = uistate_popout_select_part
				choose_state_data = {
					text = qs(0x9f86d873)
					cam_name = 'customize_character_outfit'
					camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					zoom_camera = 'customize_character_Zoom'
					part = cas_full_body
					num_icons = 1
					hist_tex = icon_outfit
					is_popup
					ghrocker = ($cas_current_profile)
				}
			}
		endif
	else
		add_generic_menu_text_item \{text = qs(0xa946c7b7)
			choose_state = uistate_customize_character_outfit}
	endif
	add_generic_menu_text_item \{text = qs(0x8694014b)
		choose_state = uistate_customize_character_instrument}
	menu_finish \{car_helper_text}
	if is_from_singleplayer_hub
		LaunchEvent \{Type = focus
			target = create_customize_character_vmenu
			data = {
				child_index = 0
			}}
	else
		LaunchEvent Type = focus target = create_customize_character_vmenu data = {child_index = <selected_index>}
	endif
	if (($has_entered_car_before) = 0)
		generic_event_choose \{state = uistate_helper_dialogue
			data = {
				is_popup
			}}
		Change \{has_entered_car_before = 1}
	endif
	SpawnScriptNow \{0x419cda3a}
endscript

script 0x419cda3a 
	0xd3f993c8 \{0x9fe16047}
	cas_queue_wait
	Change \{cas_current_instrument = guitar}
	rebuildcurrentcasmodel \{instrument = guitar}
	cas_queue_wait
	getcurrentcasobject
	if GotParam \{cas_object}
		bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
	endif
	0xe5a305c6
endscript

script ui_return_customize_character 
	menu_finish \{car_helper_text}
	if GotParam \{text}
		Change cas_current_fullname = <text>
	endif
endscript

script ui_destroy_customize_character 
	destroy_generic_menu
endscript

script ui_init_customize_character 
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	Change cas_current_fullname = (<profile_struct>.fullname)
	0xbe6e9296 part_list = ($0x44007ccb.0x288ddb10)
	GetArraySize <0x63cedf49>
	if (<array_Size> > 0)
		ui_event_add_params 0x9ae842e9 = <0x63cedf49>
	endif
	0x9db2b00d
endscript

script ui_deinit_customize_character 
	if ($cas_heap_state = in_game)
	else
		if ($shutdown_game_for_signin_change_flag = 1)
			cas_free_resources \{spawn
				block_scripts = 1}
		else
			SpawnScriptNow \{cas_free_resources}
		endif
	endif
	if ($invite_controller = -1)
		Change \{cas_current_savegame = -1}
		Change \{cas_current_profile = None}
	elseif NOT ui_event_exists_in_stack \{Name = 'create_character_gender'}
		Change \{cas_current_savegame = -1}
		Change \{cas_current_profile = None}
	endif
	if GotParam \{0x9ae842e9}
		0x9219fac2 part_list = <0x9ae842e9>
	endif
endscript

script name_entry_choose_script 
	Change cas_current_fullname = <text>
	ui_event \{event = menu_back}
endscript

script ui_return 
	ui_event \{event = menu_back}
endscript

script customize_character_save_prompt 
	LaunchEvent \{Type = unfocus
		target = create_customize_character_vmenu}
	cas_queue_wait
	0x31956c10 \{true}
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	made_changes = 0
	if (($cas_editing_new_character) = true)
		made_changes = 1
	endif
	if NOT comparestructs struct1 = <struct1> struct2 = <struct2>
		made_changes = 1
	endif
	0x8dbdaee4 qs(0x776f4948) n = (<profile_struct>.fullname) m = ($cas_current_fullname)
	if ((<profile_struct>.fullname) != ($cas_current_fullname))
		made_changes = 1
	endif
	if (<made_changes> = 0)
		exit_discard_changes \{no_changes}
	else
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
	return \{FALSE}
endscript

script return_to_singleplayer_hub 
	0x31956c10 \{true}
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	Change \{first_character_hub_enter = 0}
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	if (($cas_editing_new_character) = FALSE && comparestructs struct1 = <struct1> struct2 = <struct2>)
		exit_skip_save \{readytorock = 1}
	else
		if NOT is_autosave_on savegame = ($cas_current_savegame)
			customize_character_save_prompt
		else
			cas_get_player_status
			if isXenon
				if CheckForSignIn local controller_index = ($<player_status>.controller)
					exit_save_changes \{not_replace
						readytorock = 1}
				else
					exit_skip_save \{readytorock = 1}
				endif
			else
				exit_save_changes \{not_replace
					readytorock = 1
					0x6d221ff1}
			endif
		endif
	endif
endscript

script 0x84d8355f 
	GetArraySize ($<part>)
	0xe8e2af61 = 0
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if ghrocker_body_matches matcheswith = <ghrocker> part = <part> desc_id = ((($<part>) [<i>]).desc_id)
				0xe8e2af61 = (<0xe8e2af61> + 1)
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return 0xe8e2af61 = <0xe8e2af61>
endscript
