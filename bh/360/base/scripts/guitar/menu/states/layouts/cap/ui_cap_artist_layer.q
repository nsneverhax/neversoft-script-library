
script ui_create_cap_artist_layer 
	RequireParams \{[
			part
			text
			section_index
		]
		all}
	ui_event_add_params hist_tex = <hist_text>
	make_generic_car_menu {
		vmenu_id = create_cap_artist_layer_vmenu
		pad_option2_script = exit_artist_layers
		scrolling
		scroll_bar_offeset = (425.0, 0.0)
		exclusive_device = <state_device>
	}
	if GotParam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	setup_cas_menu_handlers \{vmenu_id = create_cap_artist_layer_vmenu}
	if GetCAPSectionsArray appearance = $cas_current_appearance part = <part>
		focus_index = 0
		current_part = 0
		mask = ((<sections> [<section_index>]).mask)
		GetArraySize (<mask>)
		i = 0
		begin
		if layer_is_on_model section = (<sections> [<section_index>]) part = <part> mask = (<mask>) mask_index = <i>
			current_part = <focus_index>
		endif
		if StructureContains structure = (<mask> [<i>]) locked
			if NOT check_cas_texture_unlocked_flag savegame = ($cas_current_savegame) texture = (<mask> [<i>].pattern)
				is_locked = 1
			endif
		endif
		if NOT GotParam \{is_locked}
			add_car_menu_text_item {
				text = ((<mask>) [<i>].frontend_desc)
				pad_choose_script = cap_artist_layers_decide_action
				pad_choose_params = {part = <part> section = (<sections> [<section_index>]) mask_index = <i> back_steps = <back_steps>}
				additional_focus_script = cap_change_selected_pattern
				additional_focus_params = {state_device = <state_device> part = <part> mask_index = <i> mask = <mask> section = (<sections> [<section_index>])}
			}
			focus_index = (<focus_index> + 1)
		else
			RemoveParameter \{is_locked}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	menu_finish car_helper_text_extra controller = <state_device>
	if NOT GotParam \{entered_with_part}
		entered_with_part = <current_part>
		ui_event_add_params entered_with_part = <entered_with_part>
	endif
	LaunchEvent type = focus target = create_cap_artist_layer_vmenu data = {child_index = <entered_with_part>}
endscript

script ui_destroy_cap_artist_layer 
	destroy_generic_menu
endscript

script ui_init_cap_artist_layer 
	PushTemporaryCASAppearance
endscript

script ui_deinit_cap_artist_layer 
	FlushAllCompositeTexturesFromUI
	PopTemporaryCASAppearance
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
		if NOT GetCASAppearancePart part = <part>
			ScriptAssert '%s not found' s = <part> DoNotResolve
		endif
		if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id>
		endif
		set_cap_flags mask = ((<mask>) [<mask_index>])
		Get_Cap part = <part> section = <section> mask_index = <mask_index>
		name = (((<mask>) [<mask_index>]).pattern)
		if GotParam \{pre_layer}
			pre_layer = {<pre_layer>
				texture = <name>}
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
					texture = <name>
					flags = <flags>}
			endif
			Set_Cap part = <part> section = <section> pre_layer = <pre_layer> mask_index = <mask_index>
		endif
		if GotParam \{post_layer}
			post_layer = {<post_layer>
				texture = <name>}
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
					texture = <name>
					flags = <flags>}
			endif
			Set_Cap part = <part> section = <section> post_layer = <post_layer> mask_index = <mask_index>
		endif
	endif
	clean_up_user_control_helpers
	if cap_no_transforms mask = ((<mask>) [<mask_index>])
		menu_finish car_helper_text_cancel controller = <state_device>
	else
		menu_finish car_helper_text_alt controller = <state_device>
	endif
endscript

script exit_artist_layers 
	KillAllCompositeTextures
	RestoreTopTemporaryCASAppearance
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
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{CAP}
		GetArraySize \{CAP}
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			name = (<section>.base_tex)
			if is_matching_section CAP = (<CAP> [<i>]) section = <section>
				if StructureContains structure = (<CAP> [<i>]) pre_layer
					if StructureContains structure = <section> pre_userlayer
						GetArraySize (((<CAP> [<i>]).pre_layer))
						if (<array_size> > 0)
							j = 0
							begin
							name = (((<mask>) [<mask_index>]).pattern)
							if (((((<CAP> [<i>]).pre_layer) [<j>]).texture) = <name>)
								printf \{qs(0x53e901f3)}
								return \{true}
							endif
							j = (<j> + 1)
							repeat <array_size>
						endif
					endif
				endif
				if StructureContains structure = (<CAP> [<i>]) post_layer
					if StructureContains structure = <section> post_userlayer
						GetArraySize (((<CAP> [<i>]).post_layer))
						if (<array_size> > 0)
							j = 0
							begin
							name = (((<mask>) [<mask_index>]).pattern)
							if (((((<CAP> [<i>]).post_layer) [<j>]).texture) = <name>)
								printf \{qs(0x53e901f3)}
								return \{true}
							endif
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
	return \{false}
endscript

script cap_artist_layers_decide_action 
	mask = (<section>.mask)
	if cap_no_transforms mask = ((<mask>) [<mask_index>])
		cap_artist_layers_decide_steps_back
		ui_event event = menu_back data = {num_states = <num_states>}
	else
		generic_event_choose state = UIstate_cap_artist_layer_options data = {<...>}
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
