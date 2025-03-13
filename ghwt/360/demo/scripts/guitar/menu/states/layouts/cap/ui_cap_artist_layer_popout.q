
script ui_create_cap_artist_layer_popout 
	spawnscriptnow ui_create_cap_artist_layer_popout_spawned params = {<...>}
endscript

script ui_create_cap_artist_layer_popout_spawned \{back_steps = 1}
	requireparams \{[
			part
			text
			section_index
		]
		all}
	ui_event_add_params hist_tex = <hist_text>
	make_list_menu {
		vmenu_id = create_cap_artist_layer_popout_vmenu
		pad_back_script = exit_artist_layers
		parent = <container_id>
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
	}
	setup_cas_menu_handlers vmenu_id = create_cap_artist_layer_popout_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance>
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	create_lookup_layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i>
	if gotparam \{sections}
		current_part = 0
		mask = ((<sections> [<section_index>]).mask)
		getarraysize (<mask>)
		i = 0
		begin
		if lookup_layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i> model_layers = <model_layers>
			current_part = <i>
		endif
		if NOT cap_no_transforms mask = ((<mask>) [<i>])
			editable = {editable}
		endif
		add_list_item {
			text = ((<mask>) [<i>].frontend_desc)
			pad_choose_script = generic_event_back
			pad_option2_script = cap_artist_layers_popout_decide_action
			pad_option2_params = {part = <part> section = (<sections> [<section_index>]) mask_index = <i> back_steps = <back_steps> num_icons = <num_icons> color_wheel = <color_wheel> additional_init_script = <additional_init_script> additional_deinit_script = <additional_deinit_script> camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom>}
			additional_focus_script = cap_change_selected_pattern
			additional_focus_params = {part = <part> mask_index = <i> mask = <mask> section = (<sections> [<section_index>])}
			<editable>
		}
		if gotparam \{editable}
			removeparameter \{editable}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_alt}
	launchevent type = focus target = create_cap_artist_layer_popout_vmenu data = {child_index = <current_part>}
	if gotparam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
endscript

script ui_destroy_cap_artist_layer_popout 
	generic_list_destroy
endscript

script ui_init_cap_artist_layer_popout 
	ui_load_cas_rawpak finishes = <part>
	pushtemporarycasappearance
	if gotparam \{additional_init_script}
		<additional_init_script>
	endif
endscript

script ui_deinit_cap_artist_layer_popout 
	flushallcompositetextures
	if NOT gotparam \{skip_deinit_script}
		if gotparam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		poptemporarycasappearance
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
endscript

script cap_artist_layers_popout_decide_action 
	ui_event_add_params \{skip_deinit_script = 1}
	mask = (<section>.mask)
	if NOT cap_no_transforms mask = ((<mask>) [<mask_index>])
		ui_event_wait event = menu_replace data = {state = uistate_cap_artist_layer_options <...>}
	endif
endscript

script create_lookup_layer_is_on_model 
	requireparams \{[
			part
			section
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	model_layers = []
	if gotparam \{cap}
		getarraysize \{cap}
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			formattext checksumname = name '%s' s = (<section>.base_tex)
			if is_matching_section cap = (<cap> [<i>]) section = <section>
				if structurecontains structure = (<cap> [<i>]) pre_layer
					if structurecontains structure = <section> pre_userlayer
						getarraysize (((<cap> [<i>]).pre_layer))
						if (<array_size> > 0)
							j = 0
							begin
							addarrayelement array = <model_layers> element = ((((<cap> [<i>]).pre_layer) [<j>]).texture)
							model_layers = <array>
							j = (<j> + 1)
							repeat <array_size>
						endif
					endif
				endif
				if structurecontains structure = (<cap> [<i>]) post_layer
					if structurecontains structure = <section> post_userlayer
						getarraysize (((<cap> [<i>]).post_layer))
						if (<array_size> > 0)
							j = 0
							begin
							addarrayelement array = <model_layers> element = ((((<cap> [<i>]).post_layer) [<j>]).texture)
							model_layers = <array>
							j = (<j> + 1)
							repeat <array_size>
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
	requireparams \{[
			mask
			mask_index
		]
		all}
	fiximagepath path = (((<mask>) [<mask_index>]).pattern)
	if arraycontains array = <model_layers> contains = <name>
		return \{true}
	else
		return \{false}
	endif
endscript
