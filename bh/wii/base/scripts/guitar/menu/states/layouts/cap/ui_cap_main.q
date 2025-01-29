
script ui_create_cap_main \{album_cover = 0}
	SpawnScriptNow ui_create_cap_main_spawned params = {<...>}
endscript

script ui_create_cap_main_spawned savegame = ($cas_current_savegame)
	if NOT GotParam \{old_save_checksum}
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
		pad_back_script = cap_main_back
		pad_back_params = {album_cover = <album_cover>}
		title = <text>
		num_icons = <num_icons>
		<show_history>
	}
	add_car_menu_text_item {
		icon = icon_current
		text = qs(0x57a22b82)
		choose_state = uistate_cap_layers_list
		choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}
	}
	add_car_menu_text_item {
		icon = icon_save
		text = qs(0xe618e644)
		pad_choose_script = cap_main_choose_save
		pad_choose_params = {savegame = <savegame> slot_list = player_created_graphics_save save_cap part = <part> div_id = <div_id> hist_tex = icon_save text = qs(0x5a1c43cf) no_show_history = <no_show_history>}
	}
	add_car_menu_text_item {
		icon = icon_load
		text = qs(0xad5cfad4)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			heading_text = qs(0x427518a8)
			body_text = qs(0x7b18be62)
			confirm_func = generic_event_replace
			confirm_func_params = {data = {state = uistate_cas_save_slots savegame = <savegame> text = qs(0x9f46747e) slot_list = player_created_graphics_save part = <part> div_id = <div_id> load_design hist_tex = icon_load camera_list = <camera_list> zoom_camera = <zoom_camera> no_show_history = <no_show_history>}}
		}
	}
	if checksumequals a = <part> b = cas_band_logo
		add_car_menu_text_item \{icon = icon_random
			text = qs(0x0b6c701b)
			pad_choose_script = randomize_band_logo}
	endif
	add_car_menu_text_item {
		icon = icon_remove
		text = qs(0xe37a67d9)
		choose_state = uistate_generic_dialog_box
		choose_state_data = {
			is_popup
			heading_text = qs(0x31cf1706)
			body_text = qs(0x28e2d00a)
			confirm_func = cap_clear_design
			confirm_func_params = {part = <part> div_id = <div_id>}
			highlight_no
		}
	}
	if checksumequals a = <part> b = cas_band_logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
		generic_menu_animate_in
	else
		setup_cas_menu_handlers vmenu_id = create_cap_main_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
	if GotParam \{cam_name}
		Change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		Change \{generic_menu_block_input = 0}
	endif
	GetGlobalTags savegame = <savegame> cas_helper_dialogue param = visit_cap
	if (<visit_cap> = 0)
		printf \{qs(0xaba2e79c)}
		SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {visit_cap = 1}
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
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
endscript

script ui_init_cap_main 
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{stance}
		if getcurrentcasobject
			bandmanager_changestance Name = <cas_object> stance = <stance> no_wait
		endif
	endif
endscript

script ui_destroy_cap_main 
	destroy_generic_menu
endscript

script ui_deinit_cap_main 
	flushallcompositetextures
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	if getcurrentcasobject
		if GotParam \{return_stance}
			bandmanager_changestance Name = <cas_object> stance = <return_stance> no_wait
		else
			bandmanager_changestance Name = <cas_object> stance = stance_frontend no_wait
		endif
	endif
endscript

script cas_load_graphic 
	ScriptAssert \{'cas_load_graphic: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script cas_load_graphic_data 
	RequireParams \{[
			layers
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id> donotresolve
	endif
	if NOT GotParam \{sections}
		ScriptAssert qs(0x9d0f595e) s = <part> donotresolve
	endif
	printf qs(0xd59a22e6) d = <div_id> donotresolve
	get_div_info part = <part> div_id = <div_id>
	if NOT GotParam \{target}
		printf \{qs(0x8f2a48f2)}
	endif
	printf qs(0x8ca54ffc) t = <target>
	if StructureContains structure = (<layers> [0]) texture
		match_layers_texture sections = <sections> prof_texture = (<layers> [0].texture) target = <target> material = <material>
	elseif StructureContains structure = (<layers> [0]) font
		match_layers_font prof_font = (<layers> [0].font) prof_text = (<layers> [0].text) sections = <sections> target = <target> material = <material>
	endif
	if NOT GotParam \{section_index}
		if NOT CD
			create_panel_message \{text = qs(0x03692b6c)
				Pos = (950.0, 600.0)
				rgba = [
					200
					50
					50
					255
				]
				Scale = 0.5}
			printf \{qs(0x5402b519)}
		endif
	endif
	printf qs(0xff32c09c) s = <section_index>
	if GotParam \{section_index}
		section = (<sections> [<section_index>])
		if GotParam \{cap}
			GetArraySize \{cap}
			i = 0
			begin
			if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
				printf qs(0xfba10fd5) i = <i>
				if is_matching_section cap = (<cap> [<i>]) section = <section>
					SetArrayElement ArrayName = cap index = <i> NewValue = {
						(<cap> [<i>])
						layers = <layers>
					}
					setcasappearancecap part = <part> cap = <cap>
					updatecasmodelcap part = <part>
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
			formatText checksumName = Name '%s' s = (<sections> [<section_index>].base_tex)
			entry = {
				base_tex = <Name>
				material = (<sections> [<section_index>].material)
				layers = <layers>
			}
			cap_set_target entry = <entry> section = <section>
			AddArrayElement array = <cap> element = <entry>
			setcasappearancecap part = <part> cap = <array>
			updatecasmodelcap part = <part>
			return
		else
			formatText checksumName = Name '%s' s = (<sections> [<section_index>].base_tex)
			entry = {
				base_tex = <Name>
				material = (<sections> [<section_index>].material)
				layers = <layers>
			}
			cap_set_target entry = <entry> section = <section>
			setcasappearancecap part = <part> cap = [{<entry>}]
			updatecasmodelcap part = <part>
			return
		endif
	endif
endscript

script cap_new_design_worker 
	if NOT getcasappearancepart part = <part>
		ScriptAssert '%s not found' s = <part> donotresolve
	endif
	remove_cap = 0
	if GotParam \{cap}
		newcap = <cap>
		GetArraySize \{cap}
		i = 0
		begin
		capstruct = (<cap> [<i>])
		if is_target_in_div target = <capstruct> part = <part> div_id = <div_id>
			RemoveComponent \{Name = layers
				structure_name = capstruct}
			SetArrayElement ArrayName = newcap index = <i> NewValue = <capstruct>
			if NOT ((StructureContains structure = <capstruct> pre_layer) || (StructureContains structure = <capstruct> post_layer))
				RemoveArrayElement array = <newcap> index = <i>
				newcap = <array>
				if (<array_Size> = 1)
					remove_cap = 1
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
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
	generic_event_back
endscript

script cap_main_back 
	if NOT (<album_cover> = 1)
		generic_event_back
	else
		LaunchEvent \{Type = unfocus
			target = current_menu}
		cas_free_resources \{album_art
			no_loading_screen}
		jam_go_back_from_album_art
	endif
endscript

script cap_main_choose_save 
	extract_current_layers part = <part> div_id = <div_id>
	if NOT GotParam \{layers}
		generic_event_choose \{state = uistate_generic_dialog_box
			data = {
				template = continue
				confirm_func = generic_event_back
				confirm_func_params = {
					nosound
				}
				is_popup
				heading_text = qs(0xeb986690)
				body_text = qs(0x8b78631c)
			}}
	else
		generic_event_choose data = {state = uistate_cas_save_slots savegame = <savegame> <...>}
	endif
endscript
