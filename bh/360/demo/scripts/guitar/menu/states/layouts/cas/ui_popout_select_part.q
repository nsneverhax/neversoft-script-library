
script ui_create_popout_select_part 
	spawnscriptnow ui_create_popout_select_part_spawned params = {<...>}
endscript

script ui_create_popout_select_part_spawned 
	requireparams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_popout_select_part_vmenu
		pad_back_script = generic_exit_restore
		pad_back_sound = nullsound
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
		exclusive_device = <state_device>
	}
	if NOT gotparam \{disable_rotation_zoom}
		setup_cas_menu_handlers vmenu_id = create_popout_select_part_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> controller = <state_device>
	endif
	clean_up_user_control_helpers
	resolvebodyspecificpartinappearance part = <part>
	current_part = 0
	get_part_current_desc_id part = <part>
	if gotparam \{download}
		scriptassert \{'download flag not supported'}
	else
		part_list = ($<part>)
	endif
	if part_has_swatch_list part = <part> desc_id = <current_desc_id>
		current_parent_swatch = <parent_swatch>
	endif
	swatch_editable_icon = style_icon
	getarraysize <part_list>
	num_parts_added = 0
	if (<array_size> > 0)
		i = 0
		begin
		if cas_item_is_visible part = <part> desc_id = ((<part_list> [<i>]).desc_id)
			if is_part_unlocked part = <part> desc_id = ((<part_list> [<i>]).desc_id) savegame = ($cas_current_savegame)
				if structurecontains structure = (<part_list> [<i>]) locked
					price = 100
				else
					removeparameter \{price}
				endif
				hide_item = 0
				if gotparam \{ghrocker}
					if NOT ghrocker_body_matches matcheswith = <ghrocker> part = <part> desc_id = ((<part_list> [<i>]).desc_id)
						hide_item = 1
					endif
				endif
				if (((<part_list> [<i>]).desc_id) = <current_desc_id>)
					current_part = <num_parts_added>
				endif
				if gotparam \{current_parent_swatch}
					if (((<part_list> [<i>]).desc_id) = <current_parent_swatch>)
						current_part = <num_parts_added>
					endif
				endif
				if (<hide_item> = 0)
					if is_part_editable part = <part> desc_id = ((<part_list> [<i>]).desc_id)
						if gotparam \{choose_script}
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
							no_rotate = <no_rotate>
							no_zoom = <no_zoom>
							pull_back_distance = <pull_back_distance>
							stance = <stance>
							additional_deinit_script = <additional_deinit_script>
							return_stance = <return_stance>
						}
					elseif part_has_swatch_list part = <part> desc_id = ((<part_list> [<i>]).desc_id)
						if gotparam \{choose_script}
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
							no_rotate = <no_rotate>
							no_zoom = <no_zoom>
							pull_back_distance = <pull_back_distance>
							stance = <stance>
							additional_deinit_script = <additional_deinit_script>
							return_stance = <return_stance>
						}
					endif
					add_list_item {
						text = ((<part_list> [<i>]).frontend_desc)
						pad_choose_script = generic_event_back
						pad_choose_params = {part = <part> nosound}
						camera_list = <camera_list>
						zoom_camera = <zoom_camera>
						additional_focus_script = select_part_focus_change
						additional_focus_params = {
							state_device = <state_device>
							part = <part>
							desc_id = ((<part_list> [<i>]).desc_id)
							play_current_anim = <play_current_anim>
							disable_rotation_zoom = <disable_rotation_zoom>
							show_purchasable = <show_purchasable>
							show_editable = <show_editable>
							show_swatches = <show_swatches>
							awarded = <awarded>
						}
						price = <price>
						pad_choose_dialogue = <pad_choose_dialogue>
						pad_option2_script = <pad_option2_script>
						pad_option2_params = <pad_option2_params>
						<editable>
						editable_icon = <editable_icon>
					}
					num_parts_added = (<num_parts_added> + 1)
				endif
				if gotparam \{price}
					removeparameter \{price}
				endif
				if gotparam \{pad_choose_dialogue}
					removeparameter \{pad_choose_dialogue}
				endif
				if gotparam \{pad_back_dialogue}
					removeparameter \{pad_back_dialogue}
				endif
				if gotparam \{show_purchasable}
					removeparameter \{show_purchasable}
				endif
				if gotparam \{show_editable}
					removeparameter \{show_editable}
				endif
				if gotparam \{show_swatches}
					removeparameter \{show_swatches}
				endif
				if gotparam \{pad_option2_script}
					removeparameter \{pad_option2_script}
				endif
				if gotparam \{editable}
					removeparameter \{editable}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		add_list_item \{text = qs(0x830e7c66)}
		add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	endif
	createscreenelement \{parent = root_window
		type = descinterface
		id = sponsor_logo
		desc = 'Axesmith_menu_item'
		not_focusable}
	launchevent type = focus target = create_popout_select_part_vmenu data = {child_index = <current_part>}
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

script ui_destroy_popout_select_part 
	if screenelementexists \{id = sponsor_logo}
		destroyscreenelement \{id = sponsor_logo}
	endif
	generic_list_destroy
	destroy_dialog_box
endscript

script ui_init_popout_select_part 
	requireparams \{[
			part
		]
		all}
	ui_cas_precache part = <part>
	if gotparam \{additional_init_script}
		<additional_init_script>
	endif
	if gotparam \{bonemenu_popup}
		cas_bonemenu_exit part = <bonemenu_popup>
	endif
	pushtemporarycasappearance
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

script ui_deinit_popout_select_part 
	flushallcompositetexturesfromui
	if gotparam \{merge_parts}
		if NOT is_accepting_invite_or_sigining_out
			mergepartintotemporarycasappearance part_list = <merge_parts>
		endif
	else
		poptemporarycasappearance
	endif
	if NOT gotparam \{skip_deinit_script}
		if gotparam \{additional_deinit_script}
			<additional_deinit_script>
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
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
	if gotparam \{bonemenu_popup}
		cas_bonemenu_begin part = <bonemenu_popup>
	endif
endscript

script popout_select_part_decide_action 
	if scriptisrunning \{select_part_focus_change_spawned}
		killspawnedscript \{name = select_part_focus_change_spawned}
	endif
	requireparams \{[
			part
		]
		all}
	if gotparam \{purchase_menu}
	endif
	ui_event_add_params \{skip_deinit_script = 1}
	if is_part_capable part = <part>
		if getcaspartmaterials part = <part>
			generic_event_replace data = {
				state = uistate_cas_select_part_options
				part = <part>
				part_materials = <part_materials>
				num_states = 1
				num_icons = <num_icons>
				hist_tex = <icon>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
			return
		endif
		get_section_index_from_desc_id part = <part> target_desc_id = finishes
		if gotparam \{section_index}
			generic_event_replace data = {
				state = uistate_cap_artist_layer
				part = <part> text = qs(0x6e23fd31)
				section_index = <section_index>
				back_steps = 2
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
			return
		else
			generic_event_replace data = {
				state = uistate_cap_main
				savegame = ($cas_current_savegame)
				part = <part> text = qs(0xd02a3b59)
				back_steps = 1
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
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
		getarraysize <part_materials>
		if (<array_size> > 1)
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
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				cam_name = <cam_name>
			}
		elseif (<array_size> = 1)
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
				no_rotate = <no_rotate>
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
			no_rotate = <no_rotate>
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

script select_part_focus_change 
	requireparams \{[
			part
		]
		all}
	killallcompositetextures
	get_part_current_desc_id part = <part>
	printf qs(0x1e9f665e) c = <current_desc_id> donotresolve
	current_parent_swatch = null
	if part_has_swatch_list part = <part> desc_id = <current_desc_id>
		current_parent_swatch = <parent_swatch>
	endif
	if (<desc_id> != <current_desc_id>)
		if (<current_parent_swatch> != <desc_id>)
			cas_add_item_to_appearance {
				part = <part>
				desc_id = <desc_id>
			}
			if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
				scriptassert '%s %t not found' s = <part> t = <desc_id> donotresolve
			endif
		endif
	endif
	if get_cas_sponsor_texture_and_title part = <part>
		sponsor_logo :se_setprops axesmith_menu_item_img_texture = <texture>
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 1.0}
	else
		sponsor_logo :se_setprops \{axesmith_menu_item_img_alpha = 0.0}
	endif
	if gotparam \{play_current_anim}
		if gotparam \{frontend_anim_name}
			if getcurrentcasobject
				band_playsimpleanim name = <cas_object> anim = <frontend_anim_name>
			endif
		endif
	endif
	clean_up_user_control_helpers
	if gotparam \{disable_rotation_zoom}
		no_rotate_zoom_text = {no_rotate_zoom_text}
	endif
	if gotparam \{show_editable}
		car_helper_text = {car_helper_text_alt}
	elseif gotparam \{show_purchasable}
		car_helper_text = {car_helper_text_purchase}
	elseif gotparam \{show_swatches}
		car_helper_text = {car_helper_text_swatches}
	else
		car_helper_text = {car_helper_text_cancel}
	endif
	menu_finish <car_helper_text> <no_rotate_zoom_text> controller = <state_device>
endscript
