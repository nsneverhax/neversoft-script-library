
script ui_create_band_logo_choose 
	SpawnScriptNow ui_create_band_logo_choose_spawned params = {<...>}
endscript

script ui_create_band_logo_choose_spawned 
	if NOT GotParam \{supress_model_load}
		Change \{cas_heap_state = in_cas}
		get_current_band_info
		GetGlobalTags <band_info>
		if GotParam \{band_logo}
			GetArraySize <band_logo>
			if ((<array_Size>) <= 0)
				randomize_band_logo
			endif
		endif
		cas_update_band_logo
		generate_random_appearance \{is_female = 1
			genre = mixed
			new_car_character}
		editcasappearance \{target = setpart
			targetparams = {
				part = cas_torso
				desc_id = f_torso_band_logo_tee
			}}
		Change \{cas_current_instrument = None}
		cas_queue_add_request appearance = ($cas_current_appearance) instrument = None Player = ($cas_current_player)
		cas_queue_wait
		getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_select_torso no_wait
	endif
	getcurrentcasobject
	<cas_object> :Obj_SetPosition position = (0.0, 0.0, 0.0)
	<cas_object> :Obj_SetOrientation Quat = (0.0, -0.13, 0.0)
	<cas_object> :obj_setvisibility viewport = bg_viewport exclusive
	PlayIGCCam \{Name = character_head_camera
		viewport = bg_viewport
		Pos = (-0.15, 1.4499999, 1.0)
		play_hold = 1
		interrupt_current}
	Change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	pad_back_script = nullscript
	menu_create_script = make_generic_menu
	item_add_script = add_generic_menu_text_item
	if ui_event_exists_in_stack \{Name = 'mainmenu'}
		pad_back_script = generic_event_back
	endif
	cam_name = 'options_manage_band_logo'
	if GotParam \{from_band_info}
		<menu_create_script> {
			title = qs(0x9baf87e5)
			item_scale = 1.3
			pad_back_script = <pad_back_script>
		}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		bandname_id = <band_info>
		GetGlobalTags <bandname_id> param = Name savegame = <savegame>
		CreateScreenElement {
			Type = TextBlockElement
			parent = generic_menu
			text = <Name>
			Pos = (315.0, 145.0)
			font = fontgrid_text_a6_fire
			dims = (260.0, 35.0)
			just = [center , top]
			rgba = (($default_color_scheme).text_color)
			fit_height = `scale	down	if	larger`
			fit_width = `scale	each	line	if	larger`
		}
		<item_add_script> {
			text = qs(0x7716d78c)
			choose_state = uistate_band_name_enter
			choose_state_data = {from_band_logo = 1}
		}
	else
		<menu_create_script> {
			title = qs(0xf508391c)
			item_scale = 1.3
			pad_back_script = <pad_back_script>
		}
	endif
	<item_add_script> {
		text = qs(0x494b4d7f)
		pad_choose_script = band_logo_choose_continue
		pad_choose_params = {event_params = <event_params> from_band_info = <from_band_info>}
	}
	get_savegame_from_controller controller = ($primary_controller)
	<item_add_script> {
		text = qs(0x65b8a528)
		choose_state = uistate_cap_main
		choose_state_data = {savegame = <savegame> text = qs(0x9a6bb96f) part = cas_band_logo cam_name = <cam_name> num_icons = 0}
	}
	<item_add_script> {
		text = qs(0xaad48d9e)
		pad_choose_script = randomize_band_logo
		pad_choose_params = {rebuild_model = 1}
	}
	if NOT GotParam \{pad_back_script}
		menu_finish
	else
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	LaunchEvent \{Type = focus
		target = current_menu}
	destroy_loading_screen
endscript

script ui_destroy_band_logo_choose 
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_init_band_logo_choose controller = ($primary_controller)
endscript

script ui_deinit_band_logo_choose 
	Change \{cas_override_object = None}
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script randomize_band_logo \{rebuild_model = 0}
	edit_graphic_select_random_logo
	0x9b97f817
	cas_update_band_logo \{no_wait}
endscript

script band_logo_choose_continue 
	getcasappearancepart \{part = cas_band_logo}
	if GotParam \{cap}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <cap>}
	endif
	if GotParam \{from_band_info}
		ui_memcard_autosave_replace \{event = menu_replace
			state = uistate_options}
	else
		ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {controller = <device_num>}
	endif
endscript

script current_band_has_band_logo controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script current_band_has_band_name controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{Name}
		if (<Name> = qs(0x03ac90f0))
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script any_band_has_band_name 
	<loop_count> = ($num_career_bands)
	band_index = 1
	begin
	formatText checksumName = bandname_id 'band%i_info' i = <band_index>
	GetGlobalTags <bandname_id> param = Name
	if GotParam \{Name}
		if NOT (<Name> = qs(0x03ac90f0))
			return \{true}
		endif
	endif
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	return \{FALSE}
endscript

script current_band_save_created controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{save_created}
		if (<save_created> = 0)
			return \{FALSE}
		else
			return \{true}
		endif
	else
		return \{FALSE}
	endif
endscript

script setbandlogotocasappearance 
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		if ischecksum <band_logo>
			editcasappearance target = setpart targetparams = {part = 0x197f6b46 desc_id = <band_logo>}
		endif
	endif
endscript
