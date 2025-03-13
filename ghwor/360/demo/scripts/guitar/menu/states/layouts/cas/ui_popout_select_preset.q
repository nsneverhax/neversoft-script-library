
script ui_create_popout_select_preset 
	spawnscriptnow ui_create_popout_select_preset_spawned params = {<...>}
endscript

script ui_create_popout_select_preset_spawned \{is_customizable = true
		create_bg_menu = 0}
	if (<preset_list_name> = car_presets_face)
		change \{g_face_preset_glitch_fix_hack = 1}
	endif
	make_list_menu {
		vmenu_id = create_popout_select_preset_vmenu
		title = <text>
		pad_back_script = generic_exit_restore
		pad_back_sound = audio_null_sound
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
		exclusive_device = <state_device>
	}
	create_popout_select_preset_vmenu :settags create_bg_menu = <create_bg_menu>
	if NOT gotparam \{disable_rotation_zoom}
		setup_cas_menu_handlers vmenu_id = create_popout_select_preset_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> controller = <state_device>
	endif
	clean_up_user_control_helpers
	<preset_list> = ($<preset_list_name>.male)
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		<preset_list> = ($<preset_list_name>.female)
	endif
	num_parts_added = 0
	if (<is_customizable> = true)
		add_list_item {
			text = qs(0xd2cd3957)
			pad_choose_script = popout_select_preset_customize
			pad_choose_params = {preset_type = <preset_list_name> customize_state = <customize_state> stance = <stance> face_anim = <face_anim> remove_parts = <remove_parts>}
			additional_focus_script = select_preset_focus_change
			additional_focus_params = {
				preset_type = <preset_list_name>
				preset_index = -1
				restore_car = 1
				state_device = <state_device>
				play_current_anim = <play_current_anim>
				stance = <stance>
				face_anim = <face_anim>
				remove_parts = <remove_parts>
			}
			index = <num_parts_added>
		}
		<num_parts_added> = (<num_parts_added> + 1)
	endif
	current_part = 0
	swatch_editable_icon = style_icon
	getarraysize <preset_list>
	if (<array_size> > 0)
		i = 0
		begin
		pad_option2_script = popout_select_preset_customize
		pad_option2_params = {preset_type = <preset_list_name> customize_state = <customize_state> stance = <stance> face_anim = <face_anim> remove_parts = <remove_parts>}
		show_customizable = 1
		if (<preset_list_name> = car_presets_outfit)
			if structurecontains structure = (<preset_list> [<i>]) locked
				if NOT check_cas_outfit_preset_unlocked_flag {savegame = ($cas_current_savegame) outfit_preset = ((<preset_list> [<i>]).desc_id)}
					locked = {
						is_locked_item
						pad_option2_script = nullscript
						pad_choose_script = locked_item_negative_select_sfx
					}
					removeparameter \{show_customizable}
				else
					locked = {
						is_unlocked_item
					}
				endif
			endif
		endif
		add_list_item {
			text = ((<preset_list> [<i>]).frontend_desc)
			pad_choose_script = popout_select_preset_choose
			pad_choose_params = {preset_type = <preset_list_name> preset_index = <i> instrument = <instrument> remove_parts = <remove_parts> nosound}
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			additional_focus_script = select_preset_focus_change
			additional_focus_params = {
				state_device = <state_device>
				preset_type = <preset_list_name>
				preset_index = <i>
				play_current_anim = <play_current_anim>
				disable_rotation_zoom = <disable_rotation_zoom>
				show_customizable = <show_customizable>
				customize_state = <customize_state>
				stance = <stance>
				face_anim = <face_anim>
				show_locked = <locked>
			}
			pad_option2_script = <pad_option2_script>
			pad_option2_params = <pad_option2_params>
			index = <num_parts_added>
			<locked>
		}
		num_parts_added = (<num_parts_added> + 1)
		removeparameter \{show_purchasable}
		removeparameter \{show_swatches}
		removeparameter \{show_customizable}
		removeparameter \{pad_option2_script}
		removeparameter \{editable}
		removeparameter \{locked}
		i = (<i> + 1)
		repeat <array_size>
	endif
	<focus_index> = 0
	if is_preset_type_in_appearance preset_type = <preset_list_name>
		if (<is_customizable> = true)
			<focus_index> = (<preset_index> + 1)
		else
			<focus_index> = <preset_index>
		endif
	endif
	if generic_list_menu :desc_resolvealias \{name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <num_parts_added>
	endif
	launchevent type = focus target = create_popout_select_preset_vmenu data = {child_index = <focus_index>}
	if gotparam \{stance}
		if getcurrentcasobject
			bandmanager_changestance name = <cas_object> stance = <stance> no_wait
		endif
	endif
	if gotparam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims name = <cas_object> fa_type = <face_anim>
		endif
	endif
	if gotparam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_popout_select_preset 
	change \{g_face_preset_glitch_fix_hack = 0}
	if screenelementexists \{id = sponsor_logo}
		destroyscreenelement \{id = sponsor_logo}
	endif
	if screenelementexists \{id = create_popout_select_preset_vmenu}
		create_popout_select_preset_vmenu :getsingletag \{create_bg_menu}
		if (<create_bg_menu> = 1)
			destroy_generic_menu
		endif
	endif
	generic_list_destroy
	if gotparam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims name = <cas_object> ff_anims = facial_anims_female_rocker mf_anims = facial_anims_male_rocker
		endif
	endif
	destroy_dialog_box
endscript

script ui_init_popout_select_preset 
	requireparams \{[
			preset_list_name
		]
		all}
	if gotparam \{additional_init_script}
		<additional_init_script>
	endif
	pushtemporarycasappearance
	preset_remove_parts remove_parts = <remove_parts>
endscript

script preset_remove_parts 
	if gotparam \{remove_parts}
		getarraysize <remove_parts>
		i = 0
		begin
		part = (<remove_parts> [<i>])
		editcasappearance {
			target = clearpart
			targetparams = {part = <part>}
		}
		i = (<i> + 1)
		repeat <array_size>
		rebuildcurrentcasmodel
	endif
endscript

script ui_deinit_popout_select_preset 
	flushallcompositetexturesfromui
	poptemporarycasappearance
	if NOT gotparam \{skip_deinit_script}
		if gotparam \{additional_deinit_script}
			<additional_deinit_script>
		endif
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	if getcurrentcasobject
		if gotparam \{return_stance}
			bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
		else
			bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
		endif
		if gotparam \{return_face_anim}
			band_changefacialanims name = <cas_object> fa_type = <return_face_anim>
		else
			band_changefacialanims name = <cas_object> fa_type = '_rocker'
		endif
	endif
	cleanup_cas_menu_handlers
	if gotparam \{bonemenu_popup}
		cas_bonemenu_begin part = <bonemenu_popup>
	endif
endscript

script cas_get_gender {
		0x52 player = ($cas_current_player)
	}
	cas_get_is_female player = <player>
	if (<is_female> = 1)
		return \{gender = female}
	else
		return \{gender = male}
	endif
endscript

script cas_set_body_material_from_preset \{mat_name = !q1768515945
		default_value = !q1768515945
		preset = 0x69696969}
	<skin_material_value> = <default_value>
	if structurecontains structure = <preset> cas_body
		if structurecontains structure = (<preset>.cas_body) chosen_materials
			chosen_materials = ((<preset>.cas_body).chosen_materials)
			if structurecontains structure = <chosen_materials> <mat_name>
				<skin_material_value> = (<chosen_materials>.<mat_name>)
			endif
		endif
	endif
	setcasappearancematerial part = cas_body material = <mat_name> value = <skin_material_value>
endscript

script select_preset_focus_change \{preset_type = !q1768515945
		preset_index = !i1768515945
		state_device = !i1768515945}
	killallcompositetextures
	cas_get_gender
	<preset_list> = ($<preset_type>.<gender>)
	if gotparam \{restore_car}
		restoretoptemporarycasappearance
		preset_remove_parts remove_parts = <remove_parts>
	else
		if (<preset_index> >= 0)
			cas_apply_preset {
				preset_type = <preset_type>
				preset_index = <preset_index>
				gender = <gender>
			}
		endif
	endif
	if gotparam \{play_current_anim}
		if gotparam \{frontend_anim_name}
			if getcurrentcasobject
				band_playsimpleanim name = <cas_object> anim = <frontend_anim_name>
			endif
		endif
	endif
	rebuildcurrentcasmodel
	clean_up_user_control_helpers
	if gotparam \{disable_rotation_zoom}
		no_rotate_zoom_text = {no_rotate_zoom_text}
	endif
	if gotparam \{show_purchasable}
		car_helper_text = {car_helper_text_purchase}
	elseif gotparam \{show_swatches}
		car_helper_text = {car_helper_text_swatches}
	elseif gotparam \{show_customizable}
		car_helper_text = {car_helper_text_customize}
	elseif gotparam \{show_locked}
		car_helper_text = {car_helper_text_cancel_only}
	else
		car_helper_text = {car_helper_text_cancel}
	endif
	menu_finish <car_helper_text> <no_rotate_zoom_text> controller = <state_device>
endscript

script popout_select_preset_choose 
	if gotparam \{instrument}
		switch (<instrument>)
			case drum
			state = uistate_cadrm_main
			case vocals
			state = uistate_customize_character_mic_main
			default
			scriptassert 'Invalid Instrument - %s' s = <instrument>
		endswitch
		if ui_event_exists_in_stack \{name = 'cadrm_main'}
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_back state = <state>
		elseif ui_event_exists_in_stack \{name = 'customize_character_mic_main'}
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_back state = <state>
		else
			ui_event_wait event = menu_replace data = {
				state = <state>
				instrument_info = ($cag_instruments [$cag_instrument_idxs.<instrument>])
				instrument = <instrument>
			}
		endif
	else
		if gotparam \{remove_parts}
			if selective_restore_top_temporary_appearance parts = <remove_parts>
				rebuildcurrentcasmodel
			endif
		endif
		generic_event_back
	endif
endscript

script popout_select_preset_customize 
	if gotparam \{remove_parts}
		if selective_restore_top_temporary_appearance parts = <remove_parts>
			rebuildcurrentcasmodel
			hide_glitch \{num_frames = 8}
		endif
	endif
	ui_sfx \{menustate = car
		uitype = select}
	remove_preset_from_appearance preset_type = <preset_type>
	ui_event_wait event = menu_replace data = {state = <customize_state> stance = <stance> face_anim = <face_anim>}
endscript
