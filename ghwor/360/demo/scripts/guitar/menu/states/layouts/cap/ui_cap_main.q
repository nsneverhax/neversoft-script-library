
script ui_create_cap_main \{album_cover = 0}
	spawnscriptnow ui_create_cap_main_spawned params = {<...>}
endscript

script ui_create_cap_main_spawned savegame = ($cas_current_savegame)
	if NOT gotparam \{old_save_checksum}
		globaltag_getarraychecksum savegame = <savegame> array_name = player_created_graphics_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	if NOT checksumequals a = <part> b = cas_band_logo
		show_history = {show_history}
	else
		no_show_history = 1
	endif
	make_generic_car_menu {
		vmenu_id = create_cap_main_vmenu
		pad_back_script = cap_main_back_warning
		pad_back_params = {album_cover = <album_cover> part = <part>}
		title = <text>
		num_icons = <num_icons>
		<show_history>
		exclusive_device = <state_device>
	}
	add_car_menu_text_item {
		icon = icon_current
		text = qs(0x57a22b82)
		choose_state = uistate_cap_layers_list
		choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera> override_base_name = <cam_name>}
	}
	dim_save_option_for_guest <...>
	add_car_menu_text_item {
		icon = icon_save
		text = qs(0xe618e644)
		pad_choose_script = cap_main_choose_save
		pad_choose_params = {exclusive_device = <state_device> savegame = <savegame> slot_list = player_created_graphics_save save_cap part = <part> div_id = <div_id> hist_tex = icon_save text = qs(0x5a1c43cf) no_show_history = <no_show_history>}
		not_focusable = <not_focusable>
	}
	add_car_menu_text_item {
		icon = icon_load
		text = qs(0xad5cfad4)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			player_device = <state_device>
			heading_text = qs(0x84d47226)
			body_text = qs(0x7b18be62)
			confirm_func = generic_event_replace
			confirm_func_params = {data = {state = uistate_cas_save_slots savegame = <savegame> text = qs(0x9f46747e) slot_list = player_created_graphics_save part = <part> div_id = <div_id> load_design hist_tex = icon_load camera_list = <camera_list> zoom_camera = <zoom_camera> no_show_history = <no_show_history>}}
		}
		not_focusable = <not_focusable>
		pad_select_sound_uitype = warningmessage
	}
	if checksumequals a = <part> b = cas_band_logo
		add_car_menu_text_item {
			icon = icon_random
			text = qs(0x0b6c701b)
			choose_state = uistate_generic_dialog_box
			choose_state_data = {
				is_popup
				player_device = <state_device>
				heading_text = qs(0x49127634)
				body_text = qs(0xcb2b7871)
				confirm_func = randomize_band_logo
				highlight_no
			}
			pad_select_sound_uitype = warningmessage
		}
	endif
	add_car_menu_text_item {
		icon = icon_remove
		text = qs(0xe37a67d9)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			player_device = <state_device>
			heading_text = qs(0x09b883f2)
			body_text = qs(0x28e2d00a)
			confirm_func = cap_clear_design
			confirm_func_params = {part = <part> div_id = <div_id>}
			highlight_no
		}
		pad_select_sound_uitype = warningmessage
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		setup_cas_menu_handlers vmenu_id = create_cap_main_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish car_helper_text controller = <state_device>
	endif
	if gotparam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
	getglobaltags savegame = <savegame> cas_helper_dialogue param = visit_cap
	if (<visit_cap> = 0)
		printf \{qs(0xaba2e79c)}
		ui_sfx \{menustate = car
			uitype = popup}
		change \{generic_menu_block_input = 1}
		setglobaltags savegame = <savegame> cas_helper_dialogue params = {visit_cap = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_helper_dialogue
				is_popup
				life = 30
				text = qs(0x6b2c6fa2)
			}}
	endif
endscript

script ui_return_cap_main 
	clean_up_user_control_helpers
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		menu_finish car_helper_text controller = <state_device>
	endif
endscript

script ui_init_cap_main 
	if gotparam \{additional_init_script}
		<additional_init_script>
	endif
	if gotparam \{stance}
		if getcurrentcasobject
			bandmanager_changestance name = <cas_object> stance = <stance> no_wait
		endif
	endif
	change \{disable_transition_stoprender = 1}
endscript

script ui_destroy_cap_main 
	destroy_generic_menu
endscript

script ui_deinit_cap_main 
	change \{disable_transition_stoprender = 0}
	flushallcompositetexturesfromui
	setmenuautorepeattimes \{(0.3, 0.1)}
	if gotparam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	if NOT ui_event_exists_in_stack \{name = 'options'}
		if getcurrentcasobject
			if gotparam \{return_stance}
				bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
			else
				bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
			endif
		endif
	endif
endscript

script cas_get_cap_texture_entry_for_base_tex 
	requireparams \{[
			part
		]
		all}
	if NOT getcasappearancepartdescid part = <part>
		scriptassert 'No %s found' s = <part>
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert 'No %s %a found' s = <part> a = <desc_id>
	endif
	if NOT gotparam \{cap_textures}
		scriptassert 'No cap_textures on %s %a' s = <part> a = <desc_id>
	endif
	getarraysize <cap_textures>
	if (<array_size> > 0)
		i = 0
		begin
		entry = (<cap_textures> [<i>])
		if structurecontains structure = <entry> user_layer_settings
			if NOT gotparam \{base_tex}
				found_entry = <entry>
				break
			endif
			if (<entry>.base_tex = <base_tex>)
				found_entry = <entry>
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if gotparam \{found_entry}
		return true cap_texture_entry = <found_entry>
	endif
	if gotparam \{base_tex}
		scriptassert 'Couldnt find cap texture entry in part=%s desc_id=%a base_tex=%b' s = <part> a = <desc_id> b = <base_tex>
	else
		scriptassert 'Couldnt find cap texture entry in part=%s desc_id=%a' s = <part> a = <desc_id>
	endif
	return \{false}
endscript

script merge_loaded_cap_entry 
	requireparams \{[
			part
			new_entry
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert 'No %s found' s = <part>
	endif
	if NOT gotparam \{cap}
		addarrayelement array = [] element = <new_entry>
		setcasappearancecap part = <part> cap = <array>
		return \{true}
	else
		i = 0
		getarraysize <cap>
		if (<array_size> > 0)
			begin
			cap_entry = (<cap> [<i>])
			if is_matching_section cap = <cap_entry> section = <new_entry>
				printf \{'Found matching cap section'}
				cap_entry = {<cap_entry> layers = (<new_entry>.layers)}
				setarrayelement arrayname = cap index = <i> newvalue = <cap_entry>
				setcasappearancecap part = <part> cap = <cap>
				return \{true}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		printf \{'Matching cap section not found, adding a new one...'}
		addarrayelement array = <cap> element = <new_entry>
		setcasappearancecap part = <part> cap = <array>
		return \{true}
	endif
endscript

script get_cap_part_defaults_for_loading 
	requireparams \{[
			part
			rotation
		]
		all}
	switch (<part>)
		case cas_band_logo
		case cas_drums
		return \{x_offset = 0
			y_offset = 0}
		case cas_male_torso
		case cas_female_torso
		case cas_body
		return \{x_offset = 0
			y_offset = 0}
		case cas_guitar_body
		if (<rotation> = 0)
			return \{x_offset = -20
				y_offset = 15}
		else
			return \{x_offset = -20
				y_offset = -15}
		endif
		case cas_bass_body
		if (<rotation> = 0)
			return \{x_offset = -20
				y_offset = 0}
		elseif (<rotation> = 90)
			return \{x_offset = -20
				y_offset = 5}
		elseif (<rotation> = 180)
			return \{x_offset = -35
				y_offset = 5}
		else
			return \{x_offset = 20
				y_offset = 0}
		endif
		case cas_guitar_head
		if (<rotation> = 90)
			return \{x_offset = -20
				y_offset = -30}
		else
			return \{x_offset = 0
				y_offset = -30}
		endif
		case cas_bass_head
		if (<rotation> = 90)
			return \{x_offset = -20
				y_offset = -30}
		else
			return \{x_offset = 0
				y_offset = -30}
		endif
	endswitch
	return \{x_offset = 0
		y_offset = 0}
endscript

script correct_layers 
	requireparams \{[
			source_part
			dest_part
			source_rotation
			dest_rotation
			source_aspect_ratio
			layers
		]
		all}
	get_cap_part_defaults_for_loading part = <source_part> rotation = <source_rotation>
	src_x_offset = <x_offset>
	src_y_offset = <y_offset>
	get_cap_part_defaults_for_loading part = <dest_part> rotation = <dest_rotation>
	rot_diff = (<dest_rotation> - <source_rotation>)
	if ((<rot_diff> = 0) || (<rot_diff> = 180) || (<rot_diff> = -180))
		aspect_change = (<source_aspect_ratio> / <dest_aspect_ratio>)
	else
		aspect_change = (<dest_aspect_ratio> / <source_aspect_ratio>)
	endif
	if ((<source_rotation> = 90) || (<source_rotation> = 270))
		aspect_change = (1.0 / <aspect_change>)
	endif
	rot_diff = ((<rot_diff> / 90.0) * 1570.0)
	roundtointeger \{rot_diff}
	if ((<rot_diff> = 0) && (<x_offset> = <src_x_offset>) && (<y_offset> = <src_y_offset>) && (<aspect_change> = 0.0))
		return
	endif
	i = 0
	getarraysize <layers>
	if (<array_size> > 0)
		begin
		layer = (<layers> [<i>])
		rot = 0
		if structurecontains structure = <layer> rot
			rot = (<layer>.rot)
		endif
		x_scale = ($default_cap_scale)
		if structurecontains structure = <layer> x_scale
			x_scale = ((<layer>.x_scale) * 1.0)
		endif
		y_scale = ($default_cap_scale)
		if structurecontains structure = <layer> y_scale
			y_scale = ((<layer>.y_scale) * 1.0)
		endif
		x_trans = ($default_cap_trans)
		if structurecontains structure = <layer> x_trans
			x_trans = ((<layer>.x_trans) * 1.0)
		endif
		y_trans = ($default_cap_trans)
		if structurecontains structure = <layer> y_trans
			y_trans = ((<layer>.y_trans) * 1.0)
		endif
		x_trans = (<x_trans> - <src_x_offset>)
		y_trans = (<y_trans> - <src_y_offset>)
		rotatecapentry {
			x_trans = <x_trans>
			y_trans = <y_trans>
			rot_by = (<rot_diff>)
			aspect = <aspect_change>
		}
		x_trans = (<x_trans> + <x_offset>)
		y_trans = (<y_trans> + <y_offset>)
		roundtointeger \{x_scale}
		roundtointeger \{y_scale}
		roundtointeger \{x_trans}
		roundtointeger \{y_trans}
		if structurecontains structure = <layer> texture
			rot = (<rot> + <rot_diff>)
		else
			rot = (<rot> - <rot_diff>)
		endif
		if (<rot> < 0)
			<rot> = (<rot> + 6283)
		elseif (<rot> >= 6283)
			<rot> = (<rot> - 6283)
		endif
		layer = {
			<layer>
			rot = <rot>
			x_scale = <x_scale>
			y_scale = <y_scale>
			x_trans = <x_trans>
			y_trans = <y_trans>
		}
		setarrayelement arrayname = layers index = <i> newvalue = <layer>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return layers = <layers>
endscript

script cas_load_graphic_data \{layers = !a1768515945
		source_aspect_ratio = !f1768515945
		source_ui_rotation = !i1768515945
		source_part = !q1768515945
		part = !q1768515945}
	if gotparam \{div_id}
		if NOT get_div_info part = <part> div_id = <div_id>
			printf \{qs(0x3aded8f0)}
		endif
		printf qs(0x20268b9a) t = <base_tex>
	endif
	if cas_get_cap_texture_entry_for_base_tex part = <part> base_tex = <base_tex>
		base_tex = (<cap_texture_entry>.base_tex)
		get_extra_cap_saving_flags part = <part> base_tex = <base_tex>
		correct_layers {
			source_part = <source_part>
			dest_part = <part>
			source_rotation = <source_ui_rotation>
			dest_rotation = <part_ui_rotation>
			source_aspect_ratio = <source_aspect_ratio>
			dest_aspect_ratio = <part_aspect_ratio>
			layers = <layers>
		}
		entry = {
			base_tex = <base_tex>
			layers = <layers>
		}
		merge_loaded_cap_entry part = <part> new_entry = <entry>
	endif
	updatecasmodelcap part = <part>
endscript

script cap_new_design_worker 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	remove_cap = 0
	if gotparam \{cap}
		newcap = <cap>
		getarraysize \{cap}
		if (<array_size> > 0)
			i = 0
			begin
			capstruct = (<cap> [<i>])
			if is_target_in_div target = <capstruct> part = <part> div_id = <div_id>
				removecomponent \{name = layers
					structure_name = capstruct}
				setarrayelement arrayname = newcap index = <i> newvalue = <capstruct>
				if NOT ((structurecontains structure = <capstruct> pre_layer) || (structurecontains structure = <capstruct> post_layer))
					removearrayelement array = <newcap> index = <i>
					newcap = <array>
					if (<array_size> = 1)
						remove_cap = 1
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		else
			setcasappearancecap part = <part>
		endif
		if (<remove_cap> = 1)
			setcasappearancecap part = <part>
		else
			setcasappearancecap part = <part> cap = <newcap>
		endif
	endif
	updatecasmodelcap part = <part>
endscript

script cap_clear_design 
	cap_new_design_worker <...>
	ui_event \{event = menu_back}
endscript

script cap_main_back_warning 
	if NOT (<album_cover> = 1)
		ui_sfx \{menustate = car
			uitype = back}
		generic_event_back
		return
	endif
	if ($cas_logo_data_dirty = 1)
		launchevent \{type = unfocus
			target = current_menu}
		destroy_dialog_box
		create_dialog_box {
			heading_text = qs(0xaa163738)
			no_background
			body_text = qs(0xd556ac8f)
			exclusive_device = <state_device>
			options = [
				{
					func = cap_main_back_warning_cancel
					func_params = {<...>}
					text = qs(0xf7723015)
				}
				{
					func = cap_main_back_continue
					func_params = {<...> from_warning = 1}
					text = qs(0x182f0173)
				}
			]
		}
	else
		cap_main_back_continue <...>
	endif
endscript

script cap_main_back_warning_cancel 
	destroy_dialog_box
	launchevent \{type = focus
		target = current_menu}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish car_helper_text no_rotate_zoom_text controller = <state_device>
	else
		menu_finish car_helper_text controller = <state_device>
	endif
endscript

script cap_main_back_continue \{from_warning = 0}
	if (<from_warning> = 1)
		cap_main_back_warning_cancel part = <part> state_device = <state_device>
	endif
	launchevent \{type = unfocus
		target = current_menu}
	jam_go_back_from_album_art
endscript

script cap_main_choose_save 
	extract_current_layers part = <part> div_id = <div_id>
	if NOT gotparam \{layers}
		ui_sfx \{menustate = generic
			uitype = warningmessage}
		generic_event_choose state = uistate_generic_dialog_box data = {template = continue player_device = <exclusive_device> confirm_func = generic_event_back confirm_func_params = {nosound} is_popup heading_text = qs(0xeb986690) body_text = qs(0x8b78631c)}
	else
		ui_sfx \{menustate = car
			uitype = select}
		generic_event_choose data = {state = uistate_cas_save_slots savegame = <savegame> <...>}
	endif
endscript
