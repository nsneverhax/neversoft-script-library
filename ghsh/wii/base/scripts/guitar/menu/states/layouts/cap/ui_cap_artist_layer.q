
script ui_create_cap_artist_layer 
	RequireParams \{[
			part
			text
			section_index
		]
		all}
	0x79db87d7
	ui_event_add_params hist_tex = <hist_text>
	make_generic_menu \{vmenu_id = create_cap_artist_layer_vmenu
		pad_option2_script = exit_artist_layers
		scrolling
		scroll_bar_offeset = (425.0, 0.0)}
	create_ui_history_header text = <text> num_icons = <num_icons>
	if GotParam \{cam_name}
		SpawnScriptNow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	setup_cas_menu_handlers \{vmenu_id = create_cap_artist_layer_vmenu}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{sections}
		current_part = 0
		mask = ((<sections> [<section_index>]).mask)
		GetArraySize (<mask>)
		i = 0
		begin
		if layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i>
			current_part = <i>
		endif
		add_generic_menu_text_item {
			text = ((<mask>) [<i>].frontend_desc)
			pad_choose_script = cap_artist_layers_decide_action
			pad_choose_params = {part = <part> section = (<sections> [<section_index>]) mask_index = <i> back_steps = <back_steps>}
			additional_focus_script = cap_change_selected_pattern
			additional_focus_params = {part = <part> mask_index = <i> mask = <mask> section = (<sections> [<section_index>])}
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	menu_finish \{car_helper_text_extra}
	if NOT GotParam \{entered_with_part}
		entered_with_part = <current_part>
		ui_event_add_params entered_with_part = <entered_with_part>
	endif
	LaunchEvent Type = focus target = create_cap_artist_layer_vmenu data = {child_index = <entered_with_part>}
	0xf00f29a9
endscript

script ui_destroy_cap_artist_layer 
	destroy_generic_menu
endscript

script ui_init_cap_artist_layer 
	pushtemporarycasappearance
endscript

script ui_deinit_cap_artist_layer 
	flushallcompositetextures
	castemporariesflush
	poptemporarycasappearance
endscript

script cap_change_selected_pattern 
	RequireParams \{[
			part
			mask
			mask_index
			section
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT layer_is_on_model section = <section> part = <part> mask = <mask> mask_index = <mask_index>
		if NOT getcasappearancepart part = <part>
			ScriptAssert '%s not found' s = <part> donotresolve
		endif
		if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id>
		endif
		set_cap_flags mask = ((<mask>) [<mask_index>])
		get_cap part = <part> section = <section> mask_index = <mask_index>
		fiximagepath path = (((<mask>) [<mask_index>]).pattern)
		if GotParam \{pre_layer}
			pre_layer = {<pre_layer>
				texture = <Name>}
			if StructureContains structure = <section> initial_values
				pre_layer = {<pre_layer>
					(<section>.initial_values)}
			endif
			if StructureContains structure = ((<mask>) [<mask_index>]) initial_values
				pre_layer = {<pre_layer>
					(((<mask>) [<mask_index>]).initial_values)}
			endif
			if NOT (<flags> = 0)
				pre_layer = {<pre_layer>
					texture = <Name>
					flags = <flags>}
			endif
			set_cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
		endif
		if GotParam \{post_layer}
			post_layer = {<post_layer>
				texture = <Name>}
			if StructureContains structure = <section> initial_values
				post_layer = {<post_layer>
					(<section>.initial_values)}
			endif
			if StructureContains structure = ((<mask>) [<mask_index>]) initial_values
				post_layer = {<post_layer>
					(((<mask>) [<mask_index>]).initial_values)}
			endif
			if NOT (<flags> = 0)
				post_layer = {<post_layer>
					texture = <Name>
					flags = <flags>}
			endif
			set_cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
		endif
	endif
	clean_up_user_control_helpers
	if cap_no_transforms mask = ((<mask>) [<mask_index>])
		menu_finish \{car_helper_text_cancel}
	else
		menu_finish \{car_helper_text_alt}
	endif
endscript

script exit_artist_layers 
	killallcompositetextures
	castemporariesflush
	caswaitforunloads \{Block}
	restoretoptemporarycasappearance
	ui_event \{event = menu_back}
endscript

script layer_is_on_model 
	RequireParams \{[
			part
			section
			mask
			mask_index
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{cap}
		GetArraySize \{cap}
		cap_array_size = <array_Size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			formatText checksumName = Name '%s' s = (<section>.base_tex)
			if is_matching_section cap = (<cap> [<i>]) section = <section>
				if StructureContains structure = (<cap> [<i>]) pre_layer
					if StructureContains structure = <section> pre_userlayer
						GetArraySize (((<cap> [<i>]).pre_layer))
						if (<array_Size> > 0)
							j = 0
							begin
							fiximagepath path = (((<mask>) [<mask_index>]).pattern)
							if (((((<cap> [<i>]).pre_layer) [<j>]).texture) = <Name>)
								printf \{qs(0x53e901f3)}
								return \{true}
							endif
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
							fiximagepath path = (((<mask>) [<mask_index>]).pattern)
							if (((((<cap> [<i>]).post_layer) [<j>]).texture) = <Name>)
								printf \{qs(0x53e901f3)}
								return \{true}
							endif
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
	return \{FALSE}
endscript

script cap_artist_layers_decide_action 
	mask = (<section>.mask)
	if cap_no_transforms mask = ((<mask>) [<mask_index>])
		cap_artist_layers_decide_steps_back
		ui_event event = menu_back data = {num_states = <num_states>}
	else
		generic_event_choose state = uistate_cap_artist_layer_options data = {<...>}
	endif
endscript

script cap_artist_layers_decide_steps_back 
	ui_event_get_stack
	if (((<stack> [1].base_name) = 'cag_custom_body_types') || ((<stack> [1].base_name) = 'cas_select_part'))
		return \{num_states = 2}
	else
		return \{num_states = 1}
	endif
endscript
