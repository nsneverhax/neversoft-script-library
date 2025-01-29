band_name_logo_controller = 0
band_name_logo_current_name = None
store_bnl_respond_to_signin_changed = 0
store_bnl_respond_to_signin_changed_all_players = 0
store_bnl_respond_to_signin_changed_func = None
band_name_logo_in_career_flow = 0
band_name_logo_initial_name = qs(0x03ac90f0)
band_name_logo_initial_logo_checksum = bleh

script ui_init_band_name_logo controller = ($primary_controller)
	Change \{band_name_logo_current_name = None}
	get_savegame_from_controller controller = <controller>
	Change cas_current_savegame = <savegame>
	if GotParam \{from_career_flow}
		Change \{band_name_logo_in_career_flow = 1}
	else
		Change \{band_name_logo_in_career_flow = 0}
	endif
	if get_current_band_name savegame = <savegame>
		Change band_name_logo_initial_name = <band_name>
	else
		Change \{band_name_logo_initial_name = qs(0x03ac90f0)}
	endif
	GetGlobalTags savegame = <savegame> progression_band_info
	if GotParam \{band_logo}
		generatechecksumfromarray \{ArrayName = band_logo}
		Change band_name_logo_initial_logo_checksum = <array_checksum>
	else
		Change \{band_name_logo_initial_logo_checksum = bleh}
	endif
endscript

script ui_create_band_name_logo controller = ($primary_controller)
	Change band_name_logo_controller = <controller>
	ui_event event = menu_change_device force_event = true data = {state_device = <controller>}
	fadetoblack \{OFF
		no_wait}
	SpawnScriptNow ui_create_band_name_logo_spawned params = <...>
endscript

script ui_create_band_name_logo_spawned 
	if GotParam \{first_time}
		ui_event_remove_params \{param = first_time}
		init_band_logo controller = <controller>
	endif
	Change store_bnl_respond_to_signin_changed = ($respond_to_signin_changed)
	Change store_bnl_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
	Change store_bnl_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = ui_band_name_logo_signin_changed}
	if NOT ScreenElementExists \{id = bandinterface}
		name_a = qs(0x36544ec2)
		name_b = qs(0x8dadb316)
		name_c = qs(0x0637ad1d)
		name_d = qs(0xe0945f6e)
		name_e = qs(0x447be3c8)
		name_f = qs(0x8bee559c)
		name_g = qs(0x63c0a9b5)
		name_h = qs(0x0c3b62bb)
		name_i = qs(0x511a2cbf)
		name_j = qs(0xead0941e)
		random_name_tip = Random (@ <name_a> @ <name_b> @ <name_c> @ <name_d> @ <name_e> @ <name_f> @ <name_g> @ <name_h> @ <name_i> @ <name_j> )
		CreateScreenElement {
			parent = root_window
			id = bandinterface
			Type = descinterface
			desc = 'band_name'
			exclusive_device = ($band_name_logo_controller)
			just = [center center]
			Scale = 1
			z_priority = -20
			tags = {
				mode = main
				text_case = upper
				letter_index = 0
				upper_characters = ($name_entry_upper_characters)
				lower_characters = ($name_entry_lower_characters)
				number_characters = ($name_entry_number_characters)
				misc_characters = ($name_entry_misc_characters)
				foreign_characters = ($name_entry_foreign_characters)
				random_name_tip = <random_name_tip>
			}
		}
		if bandinterface :desc_resolvealias \{Name = alias_namelogo_container
				param = name_logo_id}
			PushAssetContext context = ($cas_band_logo_details.AssetContext)
			CreateScreenElement {
				Type = SpriteElement
				parent = <name_logo_id>
				texture = ($cas_band_logo_details.textureasset)
				just = [left center]
				rgba = [255 255 255 250]
				Pos = (125.0, 0.0)
				dims = (256.0, 256.0)
				Scale = (0.85, 0.85)
				z_priority = 5
			}
			PopAssetContext
		endif
	else
		bandinterface :se_setprops \{Pos = (640.0, 360.0)
			Scale = (1.0, 1.0)
			time = 0.2}
		bandinterface :se_setprops \{dialog_bkgd_image_alpha = 1.0}
		bandinterface :se_setprops \{band_name_container_alpha = 1.0}
	endif
	bandinterface :se_setprops band_name_info_text = <random_name_tip>
	AssignAlias \{id = bandinterface
		alias = band_name_menu}
	ui_band_name_logo_set_band_name
	LaunchEvent \{Type = focus
		target = bandinterface}
	if GotParam \{skip_destroy}
		ui_event_remove_params \{param = skip_destroy}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_skullborder_animate
			param = skullborder_animate_id}
		<skullborder_animate_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'dschorn1'}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_skullborder_animate
			param = skullborder_animate_id}
		<skullborder_animate_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'dschorn1'}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_logo_frame
			param = logo_frame_id}
		<logo_frame_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_logo_frame
			param = logo_frame_id}
		<logo_frame_id> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_logo_frame2
			param = logo_frame2_id}
		<logo_frame2_id> :obj_spawnscript ui_shakey_02
	else
		ScriptAssert \{'dschorn1'}
	endif
	if bandinterface :desc_resolvealias \{Name = alias_logo_frame2
			param = logo_frame2_id}
		<logo_frame2_id> :obj_spawnscript ui_frazzmatazz_02
	else
		ScriptAssert \{'dschorn1'}
	endif
endscript

script ui_band_name_logo_signin_changed controller = ($primary_controller)
	printf \{qs(0xe90ca467)}
	if (($primary_controller = <controller>) ||
			($band_name_logo_controller = <controller>))
		handle_signin_changed
		return
	endif
	reset_dlc_signin_state
	reset_savegame savegame = <controller>
endscript

script ui_destroy_band_name_logo 
	clean_up_user_control_helpers
	if NOT GotParam \{skip_destroy}
		if ScreenElementExists \{id = bandinterface}
			bandinterface :GetTags
			DestroyScreenElement \{id = bandinterface}
		endif
	else
		ui_event_remove_params \{param = skip_destroy}
	endif
endscript

script ui_deinit_band_name_logo 
	Change \{cas_override_object = None}
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	Change \{band_name_logo_current_name = None}
	Change \{band_name_logo_in_career_flow = 0}
	Change \{cas_current_savegame = -1}
	if ScreenElementExists \{id = bandinterface}
		DestroyScreenElement \{id = bandinterface}
	endif
endscript

script ui_return_band_name_logo 
	ui_band_name_logo_mode
endscript

script ui_band_name_logo_set_band_name 
	if NOT (($band_name_logo_current_name) = None)
		bandinterface :se_setprops band_name_text = ($band_name_logo_current_name)
	else
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_name savegame = <savegame>
		bandinterface :se_setprops band_name_text = <band_name> band_name_font = <font>
		Change band_name_logo_current_name = <band_name>
	endif
	ui_band_name_logo_mode
endscript

script ui_band_name_logo_changed 
	if (($band_name_logo_current_name) != ($band_name_logo_initial_name))
		printf \{'name changed!'}
		return \{true}
	endif
	getcasappearancepart \{part = cas_band_logo}
	if NOT GotParam \{cap}
		cap = []
	endif
	generatechecksumfromarray \{ArrayName = cap}
	if (<array_checksum> != ($band_name_logo_initial_logo_checksum))
		return \{true}
	endif
	return \{FALSE}
endscript

script ui_band_name_logo_save 
	bandinterface :se_getprops
	bandinterface :GetTags
	GetTrueStartTime
	formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
	get_savegame_from_controller controller = ($band_name_logo_controller)
	if savegamegetprogression savegame = <savegame>
		formatText checksumName = Field 'progression_header%d' d = <Progression> AddToStringLookup = true
		if (($band_name_logo_current_name) != None)
			SetGlobalTags savegame = <savegame> <Field> params = {progression_name = ($band_name_logo_current_name)}
		endif
	endif
	SetGlobalTags savegame = <savegame> progression_band_info params = {band_unique_id = <band_unique_id>} Progression = true
	agora_update band_id = <band_unique_id> Name = <band_name> new_band
	getcasappearancepart \{part = cas_band_logo}
	if NOT GotParam \{cap}
		cap = []
	endif
	SetGlobalTags savegame = <savegame> progression_band_info params = {band_logo = <cap>} Progression = true
endscript

script ui_band_name_logo_cancel 
	if ScreenElementExists \{id = bandinterface}
		LaunchEvent \{Type = unfocus
			target = bandinterface}
	endif
	if ui_band_name_logo_changed
		bandinterface :se_setprops \{event_handlers = [
			]
			replace_handlers}
		destroy_dialog_box
		create_dialog_box {
			dlg_z_priority = 1000
			heading_text = qs(0x9a0149db)
			body_text = qs(0xf4cc13e1)
			parent = root_window
			options = [
				{
					func = ui_band_name_logo_cancel_choice
					func_params = {choice = save device_num = <device_num>}
					text = qs(0xe618e644)
				}
				{
					func = ui_band_name_logo_cancel_choice
					func_params = {choice = discard device_num = <device_num>}
					text = qs(0x1fbf1f17)
				}
				{
					func = ui_band_name_logo_cancel_choice
					func_params = {choice = cancel device_num = <device_num>}
					text = qs(0xf7723015)
				}
			]
		}
	else
		generic_event_back
	endif
endscript

script ui_band_name_logo_cancel_choice 
	printstruct <...>
	destroy_dialog_box
	switch (<choice>)
		case save
		ui_band_name_logo_continue device_num = <device_num>
		case discard
		generic_event_back
		case cancel
		ui_band_name_logo_mode
		if ScreenElementExists \{id = bandinterface}
			LaunchEvent \{Type = focus
				target = bandinterface}
		endif
	endswitch
endscript

script ui_band_name_logo_continue 
	if ScreenElementExists \{id = bandinterface}
		LaunchEvent \{Type = unfocus
			target = bandinterface}
	endif
	bandinterface :GetTags
	if ui_band_name_logo_changed
		ui_band_name_logo_save
		apply_band_logo_to_venue \{step = apply}
		save_game = 1
	endif
	SoundEvent \{event = enter_band_name_finish}
	Change respond_to_signin_changed = ($store_bnl_respond_to_signin_changed)
	Change respond_to_signin_changed_all_players = ($store_bnl_respond_to_signin_changed_all_players)
	Change respond_to_signin_changed_func = ($store_bnl_respond_to_signin_changed_func)
	if ($band_name_logo_in_career_flow = 1)
		SetGlobalTags \{career_progression_tags
			params = {
				career_first_time_setup = 1
			}
			Progression = true}
	endif
	Change \{g_lobby_enter_from_main_menu = 1}
	if ($band_name_logo_in_career_flow = 1)
		event_params = {event = menu_replace data = {state = uistate_band_lobby_setup device_num = <device_num>}}
		save_game = 1
	endif
	if GotParam \{save_game}
		data = {controller = <device_num>}
		if GotParam \{event_params}
			if StructureContains structure = <event_params> data
				data = {(<event_params>.data) savegame = <device_num> controller = <device_num> device_num = <device_num>}
			endif
		endif
		ui_memcard_autosave_replace <event_params> data = <data>
	else
		if GotParam \{event_params}
			ui_event no_assert <event_params>
		else
			generic_event_back \{no_assert}
		endif
	endif
endscript

script ui_band_name_logo_edit 
	RequireParams \{[
			savegame
		]
		all}
	if ScreenElementExists \{id = bandinterface}
		LaunchEvent \{Type = unfocus
			target = bandinterface}
		bandinterface :se_setprops \{dialog_bkgd_image_alpha = 0.0}
		bandinterface :se_setprops \{band_name_container_alpha = 0.0}
		bandinterface :se_setprops \{Pos = (575.0, 500.0)
			Scale = (1.7, 1.7)
			time = 0.2}
	endif
	generic_event_choose data = {state = uistate_cap_main text = qs(0x93873390) part = cas_band_logo num_icons = 0 savegame = <savegame>}
	ui_event_add_params \{skip_destroy = 1}
endscript

script ui_band_name_logo_mode 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{rich_presence_context = presence_menus}
	if GotParam \{check_name}
		bandinterface :se_getprops
		if NOT ui_band_name_is_valid text = <band_name_text>
			SoundEvent \{event = Menu_Warning_SFX}
			bandinterface :obj_spawnscript \{ui_band_name_logo_warning}
			return
		endif
	endif
	if GotParam \{from_logo}
		SoundEvent \{event = Box_Check_SFX}
	elseif GotParam \{from_name}
		SoundEvent \{event = Box_Check_SFX}
	endif
	clean_up_user_control_helpers
	bandinterface :GetTags
	bandinterface :se_setprops \{event_handlers = [
		]
		replace_handlers}
	get_savegame_from_controller controller = ($band_name_logo_controller)
	event_handlers = [
		{pad_back ui_band_name_logo_cancel}
		{pad_choose ui_band_name_logo_continue}
		{pad_option2 ui_band_name_edit_band_name}
		{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
		{pad_L1 ui_band_name_logo_random_name}
	]
	if bandinterface :desc_resolvealias \{Name = alias_band_name_letter}
		<resolved_id> :se_setprops font = fontgrid_text_a1 material = NULL alpha = 0.25
	endif
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x86be1220)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0x6bc37cc3)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xf99069a2)
		button = orange
		z = 100000}
	bandinterface :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script ui_band_name_edit_band_name event = menu_change default_name = ($band_name_logo_current_name)
	RequireParams \{[
			device_num
		]
		all}
	generic_menu_pad_choose_sound
	if ScreenElementExists \{id = bandinterface}
		LaunchEvent \{Type = unfocus
			target = bandinterface}
	endif
	RemoveParameter \{text}
	ui_event_wait {
		event = <event>
		state = uistate_edit_name
		data = {
			default_name = <default_name>
			char_limit = 18
			title = qs(0xb539c014)
			device_num = <device_num>
			accept_script = ui_band_name_new_band_name
			accept_params = {<...>}
			no_show_history = <no_show_history>
		}
	}
endscript

script ui_band_name_new_band_name 
	if GotParam \{text}
		if (<text> = qs(0x00000000))
			ui_band_name_show_blank_progression_warning <...>
			return
		endif
		get_savegame_from_controller controller = ($primary_controller)
		if savegamegetprogression savegame = <savegame>
			if NOT options_progression_is_name_unique Name = <text> savegame = <savegame> slot = <Progression>
				ui_band_name_show_nonunique_progression_warning <...>
				return
			endif
		endif
		printstruct <...>
		Change band_name_logo_current_name = <text>
		generic_event_back
	else
		ui_band_name_logo_mode
	endif
endscript

script ui_band_name_show_nonunique_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = uistate_generic_dialog_box
		template = continue
		heading_text = qs(0xb278de63)
		body_text = qs(0xe029feb1)
		confirm_func = ui_band_name_edit_band_name
		confirm_func_params = {<...> default_name = <text> event = menu_replace}
	}
endscript

script ui_band_name_show_blank_progression_warning 
	ui_event_wait event = menu_replace data = {
		state = uistate_generic_dialog_box
		template = continue
		heading_text = qs(0xda16dee3)
		body_text = qs(0xbaee1d38)
		confirm_func = ui_band_name_edit_band_name
		confirm_func_params = {<...> default_name = <text> event = menu_replace}
	}
endscript

script ui_band_name_logo_random_name 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	cas_random_band_name
	if NOT GotParam \{no_sound}
		SoundEvent \{event = enter_band_name_caps}
	endif
	bandinterface :se_setprops band_name_text = <random_name>
	Change band_name_logo_current_name = <random_name>
endscript

script randomize_band_logo 
	if GotParam \{name_logo}
		SoundEvent \{event = enter_band_name_caps}
	endif
	Change \{cas_logo_data_dirty = 1}
	cas_random_band_logo
	setcasappearancecap part = cas_band_logo cap = <cap>
	cas_queue_block
	updatecasmodelcap \{part = cas_band_logo}
	ui_event \{event = menu_back}
endscript

script ui_band_name_logo_warning 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	GetTags
	bandinterface :se_setprops \{band_name_info_text = qs(0xf9afb2a1)}
	Wait \{4.0
		Seconds}
	bandinterface :se_setprops band_name_info_text = <random_name_tip>
endscript

script init_band_logo 
	push_unsafe_for_shutdown \{reason = init_band_logo}
	cas_queue_block
	Change \{cas_editing_new_character = FALSE}
	ensure_band_logo_object_created
	setcasappearance \{appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
			}
		}}
	Change \{cas_override_object = bandlogoobject}
	get_savegame_from_controller controller = ($band_name_logo_controller)
	GetGlobalTags savegame = <savegame> progression_band_info
	if GotParam \{band_logo}
		setcasappearancecap part = cas_band_logo cap = <band_logo>
		cas_update_band_logo controller = ($band_name_logo_controller)
	endif
	pop_unsafe_for_shutdown \{reason = init_band_logo}
endscript

script ensure_band_logo_object_created 
	if NOT CompositeObjectExists \{Name = bandlogoobject}
		LightGroup = [Band Alt_Band]
		createfromdesc {
			Name = bandlogoobject
			desc_id = bandlogogameobject
			Pos = (0.0, 0.0, 0.0)
			AssetContext = ($cas_band_logo_details.AssetContext)
			skeletonname = gh_rocker_female_original
			LightGroup = <LightGroup>
			global_storage = band_logo_block
		}
		bandlogoobject :SetTags {
			no_bone_work
			instrument = None
			LightGroup = <LightGroup>
		}
		params = {
			async = 0
			buildscriptparams = {
				LightGroup = <LightGroup>
				temporary_heap = heap_cas_build
			}
			appearance = {
				cas_band_logo = {desc_id = cas_band_logo_id}
			}
		}
		bandlogoobject :modelbuilder_preload <params>
		bandlogoobject :modelbuilder_loadassets <params>
		bandlogoobject :modelbuilder_processassets
		bandlogoobject :modelbuilder_build <params>
		bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	endif
	return \{object_name = bandlogoobject}
endscript

script cas_update_band_logo controller = ($band_name_logo_controller)
	cas_queue_block
	waitunloadgroup \{cas
		async = 0}
	casblockforloading
	casblockforcomposite
	if GotParam \{album_art}
		if NOT GotParam \{band_logo}
			band_logo = ($editable_jam_album_cover)
		endif
		<use_band_logo> = 0
		if IsArray <band_logo>
			GetArraySize <band_logo>
			if (<array_Size> > 0)
				if StructureContains structure = (<band_logo> [0]) base_tex
					<use_band_logo> = 1
				endif
			endif
		endif
		if (<use_band_logo> = 0)
			band_logo = ($default_album_cover)
		endif
	else
		get_savegame_from_controller controller = <controller>
		GetGlobalTags savegame = <savegame> progression_band_info
		if NOT GotParam \{band_logo}
			printf \{'No band logo to build!'}
			return
		endif
	endif
	if GotParam \{empty_logo}
		band_logo = []
	endif
	printf \{'Building logo...'}
	bandlogoobject :GetSingleTag \{LightGroup}
	params = {
		async = 0
		buildscriptparams = {
			LightGroup = <LightGroup>
			temporary_heap = heap_cas_build
		}
		appearance = {
			cas_band_logo = {
				desc_id = cas_band_logo_id
				cap = <band_logo>
			}
		}
	}
	bandlogoobject :modelbuilder_preload <params>
	bandlogoobject :modelbuilder_loadassets <params>
	bandlogoobject :modelbuilder_processassets
	bandlogoobject :modelbuilder_build <params>
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	casblockforloading
	casblockforcomposite
	flushallcompositetextures
	waitunloadgroup \{cas
		async = 0}
	printf \{'Done building logo...'}
endscript
