
script ui_create_cap_artist_layer_popout 
	pushfrontendoverridequota \{quota = quota_misc}
	SpawnScriptNow ui_create_cap_artist_layer_popout_spawned params = {<...>}
endscript

script ui_create_cap_artist_layer_popout_spawned \{back_steps = 1}
	RequireParams \{[
			part
			text
			section_index
		]
		all}
	ui_event_add_params hist_tex = <hist_text>
	make_list_menu {
		title = <text>
		vmenu_id = create_cap_artist_layer_popout_vmenu
		pad_back_script = exit_artist_layers
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
		exclusive_device = <state_device>
	}
	setup_cas_menu_handlers controller = <state_device> vmenu_id = create_cap_artist_layer_popout_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance>
	if getcapsectionsarray appearance = $cas_current_appearance part = <part>
		create_lookup_layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i>
		focus_index = 0
		current_part_index = 0
		clear_part_index = 0
		mask = ((<sections> [<section_index>]).mask)
		GetArraySize (<mask>)
		i = 0
		begin
		if ((((<mask>) [<i>]).frontend_desc) = qs(0x9c1b5214))
			clear_part_index = <focus_index>
		endif
		if lookup_layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i> model_layers = <model_layers>
			current_part_index = <focus_index>
			found_good_part = 1
		endif
		if StructureContains structure = (<mask> [<i>]) locked
			if check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<mask> [<i>].pattern)
				locked = {
					is_unlocked_item
				}
			else
				locked = {
					is_locked_item
					pad_choose_script = nullscript
					pad_option2_script = nullscript
				}
			endif
		endif
		if NOT cap_no_transforms mask = ((<mask>) [<i>])
			editable = {editable}
		endif
		RemoveParameter \{pad_option2_script}
		if NOT cap_no_transforms mask = ((<mask>) [<i>])
			pad_option2_script = cap_artist_layers_popout_decide_action
		endif
		add_list_item {
			text = ((<mask>) [<i>].frontend_desc)
			pad_choose_script = generic_event_back
			price = <price>
			pad_option2_script = <pad_option2_script>
			pad_option2_params = {part = <part> section = (<sections> [<section_index>]) mask_index = <i> back_steps = <back_steps> num_icons = <num_icons> color_wheel = <color_wheel> additional_init_script = <additional_init_script> additional_deinit_script = <additional_deinit_script> camera_list = <camera_list> zoom_camera = <zoom_camera> NO_ROTATE = <NO_ROTATE> no_zoom = <no_zoom>}
			additional_focus_script = cap_change_selected_pattern
			additional_focus_params = {state_device = <state_device> part = <part> mask_index = <i> mask = <mask> section = (<sections> [<section_index>]) <locked>}
			index = <i>
			<editable>
			<locked>
		}
		focus_index = (<focus_index> + 1)
		RemoveParameter \{editable}
		RemoveParameter \{locked}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = sponsor_logo
		desc = 'Axesmith_menu_item'
		not_focusable
		axesmith_menu_item_img_alpha = 0.0}
	if NOT GotParam \{found_good_part}
		current_part_index = <clear_part_index>
	endif
	if generic_list_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		generic_scrollbar_wgt_initialize id = <resolved_id>
		generic_scrollbar_wgt_set_resolution id = <resolved_id> num_elements = <i>
	endif
	clean_up_user_control_helpers
	menu_finish car_helper_text_alt controller = <state_device>
	LaunchEvent Type = focus target = create_cap_artist_layer_popout_vmenu data = {child_index = <current_part_index>}
	if GotParam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
endscript

script ui_destroy_cap_artist_layer_popout 
	generic_list_destroy
	popfrontendoverridequota
	if ScreenElementExists \{id = sponsor_logo}
		DestroyScreenElement \{id = sponsor_logo}
	endif
	popfrontendoverridequota
endscript

script ui_init_cap_artist_layer_popout 
	ui_cas_precache finishes = <part>
	pushtemporarycasappearance
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
endscript

script ui_deinit_cap_artist_layer_popout 
	flushallcompositetexturesfromui
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		poptemporarycasappearance
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
endscript

script cap_artist_layers_popout_decide_action 
	mask = (<section>.mask)
	if NOT cap_no_transforms mask = ((<mask>) [<mask_index>])
		ui_event_add_params \{skip_deinit_script = 1}
		ui_event_wait event = menu_replace data = {state = uistate_cap_artist_layer_options <...>}
	endif
endscript

script create_lookup_layer_is_on_model 
	RequireParams \{[
			part
			section
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	model_layers = []
	if GotParam \{cap}
		GetArraySize \{cap}
		cap_array_size = <array_Size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			Name = (<section>.base_tex)
			if is_matching_section cap = (<cap> [<i>]) section = <section>
				if StructureContains structure = (<cap> [<i>]) pre_layer
					if StructureContains structure = <section> pre_userlayer
						GetArraySize (((<cap> [<i>]).pre_layer))
						if (<array_Size> > 0)
							j = 0
							begin
							AddArrayElement array = <model_layers> element = ((((<cap> [<i>]).pre_layer) [<j>]).texture)
							model_layers = <array>
							j = (<j> + 1)
							repeat <array_Size>
						endif
					endif
				endif
				if StructureContains structure = (<cap> [<i>]) post_layer
					if StructureContains structure = <section> post_userlayer
						GetArraySize (((<cap> [<i>]).post_layer))
						if (<array_Size> > 0)
							j = 0
							begin
							AddArrayElement array = <model_layers> element = ((((<cap> [<i>]).post_layer) [<j>]).texture)
							model_layers = <array>
							j = (<j> + 1)
							repeat <array_Size>
						endif
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	return model_layers = <model_layers>
endscript

script lookup_layer_is_on_model 
	RequireParams \{[
			mask
			mask_index
		]
		all}
	Name = (((<mask>) [<mask_index>]).pattern)
	if ArrayContains array = <model_layers> contains = <Name>
		return \{true}
	else
		return \{FALSE}
	endif
endscript
