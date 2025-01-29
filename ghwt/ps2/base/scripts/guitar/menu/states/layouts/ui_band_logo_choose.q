
script ui_create_band_logo_choose 
	SpawnScriptLater ui_create_band_logo_choose_spawned params = {<...>}
endscript

script ui_create_band_logo_choose_spawned 
	Change \{cas_heap_state = in_cas}
	cas_destroy_all_characters
	generate_random_appearance \{is_female = 1
		genre = mixed
		new_car_character}
	editcasappearance \{target = setpart
		targetparams = {
			part = cas_torso
			desc_id = f_torso_band_logo_tee
		}}
	if current_band_has_band_logo
		setbandlogotocasappearance
	else
		randomize_band_logo
	endif
	Change \{cas_current_instrument = None}
	cas_queue_add_request appearance = ($cas_current_appearance) instrument = None Player = ($cas_current_player)
	cas_queue_wait
	getcurrentcasobject
	bandmanager_changestance Name = <cas_object> stance = stance_select_torso no_wait
	getcurrentcasobject
	<cas_object> :Obj_SetPosition position = (0.0, 0.0, 0.0)
	<cas_object> :Obj_SetOrientation Quat = (0.0, -0.13, 0.0)
	PlayIGCCam \{Name = character_head_camera
		viewport = bg_viewport
		Pos = (-0.3, 1.4499999, 1.0)
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
		if Spanish
			<menu_create_script> {
				title = $0x48015c3a
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)
				item_scale = 1.3
				pad_back_script = nullscript
				pad_back_sound = NULL
			}
		elseif Italian
			<menu_create_script> {
				title = $0x48015c3a
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)
				item_scale = 1.3
				pad_back_script = nullscript
				pad_back_sound = NULL
			}
		elseif German
			<menu_create_script> {
				title = $0x48015c3a
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)
				item_scale = 1.3
				pad_back_script = nullscript
				pad_back_sound = NULL
			}
		elseif French
			<menu_create_script> {
				title = $0x48015c3a
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)
				item_scale = 1.3
				pad_back_script = nullscript
				pad_back_sound = NULL
			}
		else
			<menu_create_script> {
				title = $0x48015c3a
				item_scale = 1.3
				pad_back_script = nullscript
				pad_back_sound = NULL
			}
		endif
	endif
	<item_add_script> {
		text = qs(0x494b4d7f)
		pad_choose_script = band_logo_choose_continue
		pad_choose_params = {event_params = <event_params> from_band_info = <from_band_info>}
	}
	get_savegame_from_controller controller = ($primary_controller)
	<item_add_script> {
		text = qs(0x65b8a528)
		choose_state = uistate_popout_select_part
		choose_state_data = {text = qs(0x9a6bb96f) part = 0x197f6b46 num_icons = 2 is_popup icon_offset = (0.0, 20.0) list_offset = (0.0, 55.0) color_wheel = ($clothing_colorwheel) disable_rotation_zoom = 1}
	}
	<item_add_script> {
		text = qs(0xaad48d9e)
		pad_choose_script = randomize_band_logo
	}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	if GotParam \{pad_back_script}
		if GotParam \{from_band_info}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	endif
	LaunchEvent \{Type = focus
		target = current_menu}
	destroy_loading_screen
endscript

script ui_destroy_band_logo_choose 
	cas_destroy_all_characters
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_init_band_logo_choose controller = ($primary_controller)
	init_band_logo controller = <controller>
	fadetoblack \{OFF
		alpha = 1.0
		time = 0.1
		z_priority = 100
		no_wait}
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'options_manage_band_logo'
		}}
	bandlogoobject :Obj_SetPosition \{position = (-33.45, -1.42, 21.9)}
	bandlogoobject :Obj_SetOrientation \{Dir = (0.0, 0.0, -1.0)}
	bandlogoobject :SwitchOnAtomic \{cas_band_logo}
	bandlogoobject :Obj_ApplyScaling \{Scale = 1.0}
endscript

script ui_deinit_band_logo_choose 
	Change \{cas_override_object = None}
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script randomize_band_logo 
	if cas_queue_is_busy \{in_queue_too}
		return
	endif
	if cas_pick_random_part \{part_name = 0x197f6b46
			genre = None}
		if getactualcasoptionstruct part = 0x197f6b46 desc_id = (<random_part>.desc_id)
			get_savegame_from_controller controller = <device_num>
			get_current_band_info
			SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = (<random_part>.desc_id)}
			generatecagtexture single_texture = <with1>
			editcasappearance target = setpart targetparams = {part = 0x197f6b46 desc_id = (<random_part>.desc_id)}
			if getcurrentcasobject
				rebuildcurrentcasmodel
			endif
		endif
	endif
endscript

script band_logo_choose_continue 
	begin
	if NOT ScriptIsRunning \{trigger_cas_rebuild_loop}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait
	getcasappearancepart \{part = cas_band_logo}
	if GotParam \{cap}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <cap>}
	endif
	getcasappearancepart \{part = 0x197f6b46}
	if GotParam \{desc_id}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <desc_id>}
	else

	endif
	if GotParam \{from_band_info}
		generic_event_back
	else
		generic_event_replace state = uistate_game_mode data = {event_params = <event_params>}
	endif
endscript

script current_band_has_band_logo controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		if ischecksum <band_logo>
			return \{true}
		else
			return \{FALSE}
		endif
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

script 0x24977466 
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	if GotParam \{from_band_info}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
	endif
endscript
