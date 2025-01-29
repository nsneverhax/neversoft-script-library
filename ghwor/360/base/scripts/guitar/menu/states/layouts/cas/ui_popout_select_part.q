
script ui_create_popout_select_part 
	SpawnScriptNow ui_create_popout_select_part_spawned params = {<...>}
endscript

script ui_create_popout_select_part_spawned \{create_bg_menu = 0}
	RequireParams \{[
			part
		]
		all}
	if (<create_bg_menu> = 1)
		make_generic_car_menu {
			title = <menu_title>
		}
		generic_menu :se_setprops \{skull_alpha = 0}
		generic_menu :se_setprops \{border_elements_alpha = 1}
	endif
	make_list_menu {
		vmenu_id = create_popout_select_part_vmenu
		title = <text>
		pad_back_script = generic_exit_restore
		pad_back_sound = audio_null_sound
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
		exclusive_device = <state_device>
	}
	create_popout_select_part_vmenu :SetTags create_bg_menu = <create_bg_menu>
	if NOT GotParam \{disable_rotation_zoom}
		setup_cas_menu_handlers vmenu_id = create_popout_select_part_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> controller = <state_device>
	endif
	clean_up_user_control_helpers
	resolvebodyspecificpartinappearance part = <part>
	current_part = 0
	if get_part_current_desc_id part = <part>
		if part_has_swatch_list part = <part> desc_id = <current_desc_id>
			current_parent_swatch = <parent_swatch>
		endif
	endif
	if GotParam \{download}
		ScriptAssert \{'download flag not supported'}
	else
		part_list = ($<part>)
	endif
	swatch_editable_icon = style_icon
	GetArraySize <part_list>
	num_parts_added = 0
	if (<array_Size> > 0)
		i = 0
		begin
		<this_desc_id> = ((<part_list> [<i>]).desc_id)
		if cas_item_is_visible part = <part> desc_id = <this_desc_id>
			if StructureContains structure = (<part_list> [<i>]) locked
				price = 100
			else
				RemoveParameter \{price}
			endif
			hide_item = 0
			if (<this_desc_id> = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			if GotParam \{current_parent_swatch}
				if (<this_desc_id> = <current_parent_swatch>)
					<current_part> = <num_parts_added>
					<this_desc_id> = <current_desc_id>
				endif
			endif
			if (<hide_item> = 0)
				if NOT GotParam \{disallow_edit}
					if is_part_editable part = <part> desc_id = <this_desc_id>
						if GotParam \{choose_script}
							pad_option2_script = <choose_script>
						else
							pad_option2_script = popout_select_part_decide_action
							show_editable = 1
							editable = {editable}
							editable_icon = colorwheel_tiny
						endif
						pad_option2_params = {
							part = <part>
							color_wheel = <color_wheel>
							num_icons = <num_icons>
							icon = <hist_tex>
							cam_name = <cam_name>
							camera_list = <camera_list>
							zoom_camera = <zoom_camera>
							NO_ROTATE = <NO_ROTATE>
							no_zoom = <no_zoom>
							pull_back_distance = <pull_back_distance>
							stance = <stance>
							additional_deinit_script = <additional_deinit_script>
							return_stance = <return_stance>
						}
					elseif part_has_swatch_list part = <part> desc_id = <this_desc_id>
						if GotParam \{choose_script}
							pad_option2_script = <choose_script>
						else
							pad_option2_script = popout_select_part_decide_action
							show_swatches = 1
							editable = {editable}
							editable_icon = <swatch_editable_icon>
						endif
						pad_option2_params = {
							part = <part>
							num_icons = <num_icons>
							icon = <hist_tex>
							cam_name = <cam_name>
							camera_list = <camera_list>
							zoom_camera = <zoom_camera>
							NO_ROTATE = <NO_ROTATE>
							no_zoom = <no_zoom>
							pull_back_distance = <pull_back_distance>
							stance = <stance>
							additional_deinit_script = <additional_deinit_script>
							return_stance = <return_stance>
						}
					endif
				endif
				<frontend_desc> = ((<part_list> [<i>]).frontend_desc)
				if GotParam \{current_parent_swatch}
					get_frontend_desc part = <part> desc_id = <this_desc_id>
				endif
				if NOT GotParam \{editable}
					RemoveParameter \{pad_option2_script}
				endif
				<cannot_choose> = 0
				if is_part_unlockable part = <part> desc_id = <this_desc_id> savegame = ($cas_current_savegame)
					if is_part_unlocked part = <part> desc_id = <this_desc_id> savegame = ($cas_current_savegame)
						locked = {
							is_unlocked_item
						}
					else
						locked = {
							is_locked_item
							pad_choose_script = nullscript
							pad_option2_script = nullscript
						}
						<cannot_choose> = 1
						RemoveParameter \{show_purchasable}
						RemoveParameter \{show_editable}
						RemoveParameter \{show_swatches}
					endif
				endif
				add_list_item {
					text = <frontend_desc>
					pad_choose_script = popout_select_part_choose
					pad_choose_params = {part = <part> instrument = <instrument> nosound}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = select_part_focus_change
					additional_focus_params = {
						state_device = <state_device>
						part = <part>
						desc_id = <this_desc_id>
						play_current_anim = <play_current_anim>
						disable_rotation_zoom = <disable_rotation_zoom>
						show_purchasable = <show_purchasable>
						show_editable = <show_editable>
						show_swatches = <show_swatches>
						awarded = <awarded>
						currently_chosen_desc_id = <current_desc_id>
						cannot_choose = <cannot_choose>
					}
					index = <num_parts_added>
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
					pad_option2_script = <pad_option2_script>
					pad_option2_params = <pad_option2_params>
					<editable>
					editable_icon = <editable_icon>
					<locked>
				}
				num_parts_added = (<num_parts_added> + 1)
			endif
			RemoveParameter \{price}
			RemoveParameter \{pad_choose_dialogue}
			RemoveParameter \{pad_back_dialogue}
			RemoveParameter \{show_purchasable}
			RemoveParameter \{show_editable}
			RemoveParameter \{show_swatches}
			RemoveParameter \{pad_option2_script}
			RemoveParameter \{editable}
			RemoveParameter \{locked}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = sponsor_logo
		desc = 'Axesmith_menu_item'
		not_focusable}
	if generic_list_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <num_parts_added>
	endif
	LaunchEvent Type = focus target = create_popout_select_part_vmenu data = {child_index = <current_part>}
	if GotParam \{stance}
		if getcurrentcasobject
			bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
		endif
	endif
	if GotParam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims Name = <cas_object> fa_type = <face_anim>
		endif
	endif
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_popout_select_part 
	if ScreenElementExists \{id = sponsor_logo}
		DestroyScreenElement \{id = sponsor_logo}
	endif
	if ScreenElementExists \{id = create_popout_select_part_vmenu}
		create_popout_select_part_vmenu :GetSingleTag \{create_bg_menu}
		if (<create_bg_menu> = 1)
			destroy_generic_menu
		endif
	endif
	generic_list_destroy
	if GotParam \{face_anim}
		if getcurrentcasobject
			band_changefacialanims Name = <cas_object> ff_anims = facial_anims_female_rocker mf_anims = facial_anims_male_rocker
		endif
	endif
	destroy_dialog_box
endscript

script ui_init_popout_select_part 
	RequireParams \{[
			part
		]
		all}
	ui_cas_precache part = <part>
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{bonemenu_popup}
		cas_bonemenu_exit part = <bonemenu_popup>
	endif
	pushtemporarycasappearance
	if GotParam \{remove_parts}
		GetArraySize <remove_parts>
		i = 0
		begin
		part = (<remove_parts> [<i>])
		editcasappearance {
			target = clearpart
			targetparams = {part = <part>}
		}
		i = (<i> + 1)
		repeat <array_Size>
		rebuildcurrentcasmodel
	endif
endscript

script ui_deinit_popout_select_part 
	flushallcompositetexturesfromui
	if GotParam \{merge_parts}
		if NOT is_accepting_invite_or_sigining_out
			mergepartintotemporarycasappearance part_list = <merge_parts>
		endif
	else
		poptemporarycasappearance
	endif
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		if getcurrentcasobject
			if GotParam \{return_stance}
				bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
			else
				bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
			endif
			if GotParam \{return_face_anim}
				band_changefacialanims Name = <cas_object> fa_type = <return_face_anim>
			else
				band_changefacialanims Name = <cas_object> fa_type = '_rocker'
			endif
		endif
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
	if GotParam \{bonemenu_popup}
		cas_bonemenu_begin part = <bonemenu_popup>
	endif
endscript

script popout_select_part_decide_action 
	if ScriptIsRunning \{select_part_focus_change_spawned}
		KillSpawnedScript \{Name = select_part_focus_change_spawned}
	endif
	RequireParams \{[
			part
		]
		all}
	if GotParam \{purchase_menu}
	endif
	ui_event_add_params \{skip_deinit_script = 1}
	if is_part_capable part = <part>
		if getcaspartmaterials part = <part>
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_replace data = {
				state = uistate_cas_select_part_options
				part = <part>
				part_materials = <part_materials>
				num_states = 1
				num_icons = <num_icons>
				hist_tex = <icon>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
			return
		endif
		if get_section_index_from_desc_id part = <part> target_desc_id = finishes
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_replace data = {
				state = uistate_cap_artist_layer
				part = <part> text = qs(0x6e23fd31)
				section_index = <section_index>
				back_steps = 2
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
			return
		else
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_replace data = {
				state = uistate_cap_main
				savegame = ($cas_current_savegame)
				part = <part> text = qs(0xd02a3b59)
				back_steps = 1
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
			return
		endif
	elseif getcaspartmaterials part = <part>
		GetArraySize <part_materials>
		if (<array_Size> > 1)
			ui_event event = menu_replace data = {
				state = uistate_cas_select_part_color_options
				part = <part>
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
		elseif (<array_Size> = 1)
			ui_event event = menu_replace data = {
				state = uistate_cas_color_edit
				part = <part>
				title = (<part_materials> [0].title)
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				NO_ROTATE = <NO_ROTATE>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
		endif
		return
	elseif getcaspartswatches part = <part>
		ui_event event = menu_replace data = {
			state = uistate_cas_select_part_swatches
			part = <part>
			part_swatches = <part_swatches>
			current_swatch_desc_id = <current_swatch_desc_id>
			frontend_desc = <frontend_desc>
			hist_tex = menu_history_color_edit
			num_icons = <num_icons>
			camera_list = <camera_list>
			zoom_camera = <zoom_camera>
			NO_ROTATE = <NO_ROTATE>
			no_zoom = <no_zoom>
			pull_back_distance = <pull_back_distance>
			stance = <stance>
			additional_deinit_script = <additional_deinit_script>
			return_stance = <return_stance>
			cam_name = <cam_name>
		}
		return
	endif
endscript

script select_part_focus_change \{part = !q1768515945
		cannot_choose = !i1768515945}
	killallcompositetextures
	get_part_current_desc_id part = <part>
	printf qs(0x1e9f665e) c = <current_desc_id> donotresolve
	if (<desc_id> != <current_desc_id>)
		cas_add_item_to_appearance {
			part = <part>
			desc_id = <desc_id>
		}
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id> donotresolve
		endif
	endif
	if get_cas_sponsor_texture_and_title part = <part>
		sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
	else
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	endif
	if GotParam \{play_current_anim}
		if GotParam \{frontend_anim_name}
			if getcurrentcasobject
				Band_PlaySimpleAnim Name = <cas_object> anim = <frontend_anim_name>
			endif
		endif
	endif
	clean_up_user_control_helpers
	if GotParam \{disable_rotation_zoom}
		no_rotate_zoom_text = {no_rotate_zoom_text}
	endif
	if (<cannot_choose> = 1)
		car_helper_text = {car_helper_text_cancel_only}
	elseif GotParam \{show_editable}
		car_helper_text = {car_helper_text_alt}
	elseif GotParam \{show_purchasable}
		car_helper_text = {car_helper_text_purchase}
	elseif GotParam \{show_swatches}
		car_helper_text = {car_helper_text_swatches}
	else
		car_helper_text = {car_helper_text_cancel}
	endif
	menu_finish <car_helper_text> <no_rotate_zoom_text> controller = <state_device>
endscript

script popout_select_part_choose 
	if GotParam \{instrument}
		switch (<instrument>)
			case drum
			state = uistate_cadrm_main
			case vocals
			state = uistate_customize_character_mic_main
			default
			ScriptAssert 'Invalid Instrument - %s' s = <instrument>
		endswitch
		if ui_event_exists_in_stack \{Name = 'cadrm_main'}
			ui_sfx \{menustate = car
				uitype = select}
			generic_event_back state = <state>
		elseif ui_event_exists_in_stack \{Name = 'customize_character_mic_main'}
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
		generic_event_back
	endif
endscript
