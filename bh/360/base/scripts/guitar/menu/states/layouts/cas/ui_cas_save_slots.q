
script ui_create_cas_save_slots 
	RequireParams \{[
			slot_list
		]
		all}
	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	make_generic_car_menu {
		Title = <text>
		icon = <hist_tex>
		<show_history>
		exclusive_device = <state_device>
		no_up_down_sound_handlers
	}
	if GotParam \{load_guitar}
		pad_triangle_script = load_guitar_save_edit
		pad_triangle_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
		pad_choose_script = load_guitar_save_apply
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{save_guitar}
		pad_choose_script = exit_save_instrument_worker
		pad_choose_params = {device_num = <state_device> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_drum}
		pad_choose_script = load_drum_save
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_design}
		pad_triangle_script = load_cap_design
		pad_triangle_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
		pad_choose_script = apply_cap_design
		pad_choose_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
	elseif GotParam \{save_cap}
		pad_choose_script = save_cap_design_worker
		pad_choose_params = {device_num = <state_device> list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <slot_list>
	if ((GotParam load_design) || (GotParam save_cap))
		max_saves = ($max_num_logo_saves)
	else
		max_saves = ($max_num_instrument_saves)
	endif
	FormatText TextName = text qs(0x1af30f77) i = <array_size> j = <max_saves>
	CreateScreenElement {
		type = TextBlockElement
		parent = root_window
		id = num_slots
		font = fontgrid_title_a1
		text = <text>
		Pos = (525.0, 175.0)
		rgba = [250 250 250 255]
		dims = (375.0, 50.0)
		scale = 0.7
	}
	<num_items> = <array_size>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <slot_list> index = <i>
		if GotParam \{disable_delete}
			slots_add_item {
				index = <i>
				text = (<element>.name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		else
			slots_add_item {
				index = <i>
				text = (<element>.name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i> Overwrite}
				pad_square_script = generic_event_choose
				pad_square_params = {
					data = {
						state = UIstate_generic_dialog_box
						is_popup
						heading_text = qs(0x11fb365e)
						body_text = qs(0x42fc65dd)
						confirm_func = slot_delete_entry
						confirm_func_params = {list = <slot_list> index = <i> savegame = <savegame>}
					}
				}
				additional_focus_script = save_slots_set_helper_text_delete
				additional_focus_params = {device_num = <state_device>}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		if ((GotParam load_guitar) || (GotParam load_drum) || (GotParam load_design))
			<num_items> = 1
			slots_add_item {
				index = <array_size>
				text = qs(0x44330a6a)
				pad_choose_script = generic_event_back
				pad_choose_params = {nosound}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		endif
	endif
	if (<array_size> < <max_saves>)
		if GotParam \{save_guitar}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_size>
				text = qs(0x4496766c)
				pad_choose_script = exit_save_instrument
				pad_choose_params = {index = <array_size> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame> no_show_history = <no_show_history> device_num = <state_device>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		elseif GotParam \{save_cap}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_size>
				text = qs(0x4496766c)
				pad_choose_script = save_cap_design
				pad_choose_params = {device_num = <state_device> index = <array_size> list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		endif
	endif
	if (<num_items> > 1)
		add_generic_menu_up_down_sound_handlers
	endif
	LaunchEvent type = focus target = current_menu data = {child_index = <loaded_index>}
	menu_finish no_helper_text controller = <state_device>
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	if NOT GotParam \{disable_delete}
		add_user_control_helper controller = <state_device> text = qs(0x271a1633) button = blue z = 100000
	endif
	if ScreenElementExists \{id = BandInterface}
		BandInterface :SE_SetProps \{alpha = 1}
	endif
endscript

script ui_return_cas_save_slots 
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	if NOT GotParam \{disable_delete}
		add_user_control_helper controller = <state_device> text = qs(0x271a1633) button = blue z = 100000
	endif
endscript

script ui_destroy_cas_save_slots 
	if ScreenElementExists \{id = num_slots}
		DestroyScreenElement \{id = num_slots}
	endif
	destroy_generic_menu
endscript

script slots_add_item \{focus_script = slot_focus_script
		unfocus_script = slot_unfocus_script}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'generic_menu_slot_item'
		<not_focusable>
		slot_text_text = <text>
		autoSizeDims = true
	}
	SetScreenElementProps {
		id = <id>
		event_handlers = [{focus <focus_script> params = {id = <id> index = <index> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> index = <index>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_triangle_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_option2 <pad_triangle_script> params = <pad_triangle_params>}
				{pad_option2 generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_square_script> params = <pad_square_params>}
				{pad_square generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_start_script> params = <pad_start_params>}
				{pad_start generic_menu_pad_choose_sound}
			]
		}
	endif
endscript

script load_guitar_save_edit 
	load_guitar_save <...>
	ui_event event = menu_replace data = {state = UIstate_cag_custom instrument_info = <instrument_info> loaded_index = <index>}
endscript

script load_guitar_save_apply 
	load_guitar_save <...>
	generic_event_back
endscript

script load_guitar_save 
	RequireParams \{[
			list
			index
		]
		all}
	printf \{qs(0x254267e2)}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	guitar_save = <element>
	if StructureContains structure = <guitar_save> body_part
		SetCASAppearancePartInstance part = (<instrument_info>.body_part) part_instance = (<guitar_save>.body_part)
	endif
	if StructureContains structure = <guitar_save> neck_part
		SetCASAppearancePartInstance part = (<instrument_info>.neck_part) part_instance = (<guitar_save>.neck_part)
	endif
	if StructureContains structure = <guitar_save> head_part
		SetCASAppearancePartInstance part = (<instrument_info>.head_part) part_instance = (<guitar_save>.head_part)
	endif
	if StructureContains structure = <guitar_save> pick_guard_part
		SetCASAppearancePartInstance part = (<instrument_info>.pick_guard_part) part_instance = (<guitar_save>.pick_guard_part)
	endif
	if StructureContains structure = <guitar_save> pickups_part
		SetCASAppearancePartInstance part = (<instrument_info>.pickups_part) part_instance = (<guitar_save>.pickups_part)
	endif
	if StructureContains structure = <guitar_save> knobs_part
		SetCASAppearancePartInstance part = (<instrument_info>.knobs_part) part_instance = (<guitar_save>.knobs_part)
	endif
	if StructureContains structure = <guitar_save> bridge_part
		SetCASAppearancePartInstance part = (<instrument_info>.bridge_part) part_instance = (<guitar_save>.bridge_part)
	endif
	if StructureContains structure = <guitar_save> misc_part
		SetCASAppearancePartInstance part = (<instrument_info>.misc_part) part_instance = (<guitar_save>.misc_part)
	endif
	if StructureContains structure = <guitar_save> stand_part
		SetCASAppearancePartInstance part = (<instrument_info>.stand_part) part_instance = (<guitar_save>.stand_part)
	endif
	printcurrentappearance
	RebuildCurrentCASModel
endscript

script slot_focus_script 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			slot_text_font = fontgrid_title_a1
			slot_bg_texture = slot_boarder
			slot_text_rgba = [255 255 255 255]
		}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script slot_unfocus_script 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			slot_text_font = fontgrid_text_A1
			slot_text_material = null
			slot_bg_texture = slot_boarder_no
			slot_text_rgba = GH51_purple_lt
		}
	endif
endscript

script slot_delete_entry 
	spawnscriptnow slot_delete_entry_worker params = <...>
endscript

script slot_delete_entry_worker 
	RequireParams \{[
			list
			index
		]
		all}
	if ScreenElementExists \{id = BandInterface}
		BandInterface :SE_SetProps \{alpha = 0}
	endif
	globaltag_removearrayelement savegame = <savegame> array_name = <list> index = <index>
	ui_memcard_autosave_replace \{event = menu_back}
endscript

script exit_save_instrument \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {state = UIstate_edit_name is_popup char_limit = 18 default_name = <default_name> Title = qs(0x17f49e18) device_num = <device_num> accept_script = save_instrument_accept_name accept_params = {<...>} no_show_history = <no_show_history>}
endscript

script save_instrument_accept_name 
	spawnscriptnow exit_save_instrument_worker params = {<...>}
endscript

script exit_save_instrument_worker 
	RequireParams \{[
			list
			index
			instrument_info
			savegame
		]
		all}
	if NOT GotParam \{Overwrite}
		if NOT is_name_unique list = <list> name = <text> savegame = <savegame>
			ui_event_wait event = menu_replace data = {
				state = UIstate_generic_dialog_box
				template = continue
				is_popup
				heading_text = qs(0xb278de63)
				body_text = qs(0xe029feb1)
				confirm_func = save_slots_return_from_save_instrument_warning
				confirm_func_params = {<...>}
			}
			return
		endif
	endif
	if StructureContains structure = <instrument_info> body_part
		if GetCASAppearancePartInstance part = (<instrument_info>.body_part)
			entry = {
				<entry>
				body_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> neck_part
		if GetCASAppearancePartInstance part = (<instrument_info>.neck_part)
			entry = {
				<entry>
				neck_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> head_part
		if GetCASAppearancePartInstance part = (<instrument_info>.head_part)
			entry = {
				<entry>
				head_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> pick_guard_part
		if GetCASAppearancePartInstance part = (<instrument_info>.pick_guard_part)
			entry = {
				<entry>
				pick_guard_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> pickups_part
		if GetCASAppearancePartInstance part = (<instrument_info>.pickups_part)
			entry = {
				<entry>
				pickups_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> knobs_part
		if GetCASAppearancePartInstance part = (<instrument_info>.knobs_part)
			entry = {
				<entry>
				knobs_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> bridge_part
		if GetCASAppearancePartInstance part = (<instrument_info>.bridge_part)
			entry = {
				<entry>
				bridge_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> misc_part
		if GetCASAppearancePartInstance part = (<instrument_info>.misc_part)
			entry = {
				<entry>
				misc_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> stick_part
		if GetCASAppearancePartInstance part = (<instrument_info>.stick_part)
			entry = {
				<entry>
				stick_part = <part_instance>
			}
		endif
	endif
	if StructureContains structure = <instrument_info> stand_part
		if GetCASAppearancePartInstance part = (<instrument_info>.stand_part)
			entry = {
				<entry>
				stand_part = <part_instance>
			}
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<index> > (<array_size> -1))
		entry = {
			<entry>
			name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			name = (<element>.name)
		}
		ui_event event = menu_change data = {
			state = UIstate_generic_dialog_box
			is_popup
			heading_text = qs(0x93a7149b)
			body_text = qs(0x275837ee)
			confirm_func = set_save_instrument_return
			confirm_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
		}
	endif
endscript

script set_save_instrument_return 
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script load_drum_save 
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	drum_save = <element>
	if StructureContains structure = <drum_save> body_part
		SetCASAppearancePartInstance part = (<instrument_info>.body_part) part_instance = (<drum_save>.body_part)
	endif
	if StructureContains structure = <drum_save> stick_part
		SetCASAppearancePartInstance part = (<instrument_info>.stick_part) part_instance = (<drum_save>.stick_part)
	endif
	RebuildCurrentCASModel
	generic_event_back
endscript

script apply_cap_design 
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data {
		layers = (<element>.layers)
		source_aspect_ratio = (<element>.aspect_ratio)
		source_ui_rotation = (<element>.ui_rotation)
		source_part = (<element>.source_part)
		<...>
	}
	generic_event_back \{nosound}
endscript

script load_cap_design 
	RequireParams \{[
			list
			index
			savegame
		]
		all}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data {
		layers = (<element>.layers)
		source_aspect_ratio = (<element>.aspect_ratio)
		source_ui_rotation = (<element>.ui_rotation)
		source_part = (<element>.source_part)
		<...>
	}
	ui_event event = menu_replace data = {state = UIstate_cap_layers_list loaded_index = <index> <...>}
endscript

script save_cap_design \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {state = UIstate_edit_name is_popup char_limit = 18 default_name = <default_name> Title = qs(0x17f49e18) device_num = <device_num> accept_script = save_cap_design_accept accept_params = {<...>} no_show_history = <no_show_history>}
endscript

script save_cap_design_accept 
	spawnscriptnow save_cap_design_worker params = {<...>}
endscript

script save_cap_design_worker 
	if NOT GotParam \{Overwrite}
		if NOT is_name_unique list = <list> name = <text> savegame = <savegame>
			ui_event_wait event = menu_replace data = {
				state = UIstate_generic_dialog_box
				template = continue
				is_popup
				heading_text = qs(0xb278de63)
				body_text = qs(0xe029feb1)
				confirm_func = save_slots_return_from_save_cap_design_warning
				confirm_func_params = {<...>}
			}
			return
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	extract_current_layers part = <part> div_id = <div_id>
	entry = {layers = <layers> ui_rotation = <ui_rotation> aspect_ratio = <aspect_ratio> source_part = <part>}
	if (<index> > (<array_size> -1))
		if ScreenElementExists \{id = BandInterface}
			BandInterface :SE_SetProps \{alpha = 0}
		endif
		entry = {
			<entry>
			name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			name = (<element>.name)
		}
		ui_event event = menu_change data = {
			state = UIstate_generic_dialog_box
			is_popup
			heading_text = qs(0x93a7149b)
			body_text = qs(0x275837ee)
			confirm_func = set_save_cap_return
			confirm_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
		}
	endif
endscript

script set_save_cap_return 
	if ScreenElementExists \{id = BandInterface}
		BandInterface :SE_SetProps \{alpha = 0}
	endif
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script is_name_unique 
	RequireParams \{[
			list
			name
			savegame
		]
		all}
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <i>
		if ((<element>.name) = <name>)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{true}
endscript

script save_slots_return_from_save_instrument_warning 
	exit_save_instrument <...> default_name = <text> event = menu_replace
endscript

script save_slots_return_from_save_cap_design_warning 
	save_cap_design <...> default_name = <text> event = menu_replace
endscript

script save_slots_set_helper_text_delete 
	clean_up_user_control_helpers
	add_user_control_helper controller = <device_num> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <device_num> text = qs(0xaf4d5dd2) button = red z = 100000
	if NOT GotParam \{disable_delete}
		add_user_control_helper controller = <device_num> text = qs(0x271a1633) button = blue z = 100000
	endif
endscript

script save_slots_set_helper_text 
	clean_up_user_control_helpers
	add_user_control_helper controller = <device_num> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <device_num> text = qs(0xaf4d5dd2) button = red z = 100000
endscript
