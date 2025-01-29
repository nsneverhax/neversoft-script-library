
script ui_create_cas_save_slots \{slot_list = !q1768515945}
	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	make_generic_car_menu {
		title = <text>
		icon = <hist_tex>
		<show_history>
		exclusive_device = <state_device>
		no_up_down_sound_handlers
	}
	current_menu :se_setprops \{just = [
			center
			top
		]
		dims = (600.0, 400.0)}
	if generic_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
		<resolved_id> :se_setprops Pos = {(50.0, 0.0) relative}
	endif
	if GotParam \{load_guitar}
		pad_choose_script = load_guitar_save_apply
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{save_guitar}
		pad_choose_script = exit_save_instrument_worker
		pad_choose_params = {device_num = <state_device> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_drum}
		pad_choose_script = load_drum_save
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_design}
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
	formatText TextName = text qs(0x1af30f77) i = <array_Size> j = <max_saves>
	CreateScreenElement {
		Type = TextBlockElement
		parent = root_window
		id = num_slots
		font = ($test_menu_font)
		text = <text>
		Pos = (525.0, 175.0)
		rgba = [250 250 250 255]
		dims = (675.0, 50.0)
		Scale = 1
	}
	<num_items> = <array_Size>
	if (<array_Size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <slot_list> index = <i>
		if GotParam \{disable_delete}
			slots_add_item {
				index = <i>
				text = (<element>.Name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
				pad_select_sound_uitype = None
			}
		else
			slots_add_item {
				index = <i>
				text = (<element>.Name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i> overwrite}
				pad_square_script = generic_event_choose
				pad_square_params = {
					data = {
						state = uistate_generic_dialog_box
						is_popup
						heading_text = qs(0x11fb365e)
						body_text = qs(0x42fc65dd)
						confirm_func = slot_delete_entry
						confirm_func_params = {list = <slot_list> index = <i> savegame = <savegame>}
					}
				}
				pad_square_sound_uitype = warningmessage
				pad_select_sound_uitype = None
				additional_focus_script = save_slots_set_helper_text_delete
				additional_focus_params = {device_num = <state_device>}
			}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		if ((GotParam load_guitar) || (GotParam load_drum) || (GotParam load_design))
			<num_items> = 1
			slots_add_item {
				index = <array_Size>
				text = qs(0x44330a6a)
				pad_choose_script = generic_event_back
				pad_choose_params = {nosound}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		endif
	endif
	if (<array_Size> < <max_saves>)
		if GotParam \{save_guitar}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_Size>
				text = qs(0x4496766c)
				pad_choose_script = exit_save_instrument
				pad_choose_params = {index = <array_Size> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame> no_show_history = <no_show_history> device_num = <state_device>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		elseif GotParam \{save_cap}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_Size>
				text = qs(0x4496766c)
				pad_choose_script = save_cap_design
				pad_choose_params = {device_num = <state_device> index = <array_Size> list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
				additional_focus_params = {device_num = <state_device>}
			}
		endif
	endif
	if (<num_items> > 1)
		add_generic_menu_up_down_sound_handlers
	endif
	LaunchEvent Type = focus target = current_menu data = {child_index = <loaded_index>}
	menu_finish no_helper_text controller = <state_device>
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	if NOT GotParam \{disable_delete}
		add_user_control_helper controller = <state_device> text = qs(0x271a1633) button = blue z = 100000
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

script slots_add_item \{parent = current_menu
		focus_script = slot_focus_script
		unfocus_script = slot_unfocus_script
		pad_select_sound_menustate = Generic
		pad_select_sound_uitype = select
		pad_square_sound_menustate = Generic
		pad_square_sound_uitype = select}
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		desc = 'generic_menu_slot_item'
		<not_focusable>
		slot_text_text = <text>
		autosizedims = true
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
				{pad_choose ui_sfx params = {menustate = <pad_select_sound_menustate> uitype = <pad_select_sound_uitype>}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_square_script> params = <pad_square_params>}
				{pad_square ui_sfx params = {menustate = <pad_square_sound_menustate> uitype = <pad_square_sound_uitype>}}
			]
		}
	endif
	<parent> :GetTags
	if GotParam \{total_length}
		GetScreenElementDims id = <parent>
		parent_height = <height>
		GetScreenElementDims id = <id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			if generic_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
				AssignAlias id = <resolved_id> alias = generic_menu_scrollbar_wgt
				generic_scrollbar_wgt_initialize \{id = generic_menu_scrollbar_wgt}
				GetScreenElementChildren id = <parent>
				GetArraySize <children>
				generic_scrollbar_wgt_set_resolution id = generic_menu_scrollbar_wgt num_elements = <array_Size>
			else
				ScriptAssert \{qs(0x7631f46d)}
			endif
		endif
		<parent> :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims id = <id>
		<parent> :SetTags {total_length = <height>}
	endif
endscript

script load_guitar_save_edit 
	load_instrument_save <...>
	ui_sfx \{menustate = car
		uitype = select}
	ui_event event = menu_replace data = {state = uistate_cag_custom instrument_info = <instrument_info> loaded_index = <index>}
endscript

script load_guitar_save_apply 
	load_instrument_save <...>
	ui_sfx \{menustate = car
		uitype = select}
	generic_event_back
endscript

script load_instrument_save \{list = !q1768515945
		index = !i1768515945
		instrument_info = 0x69696969}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	instrument_save = <element>
	printf \{qs(0x9df9700a)}
	printstruct <...>
	GetArraySize \{g_cag_save_list
		globalarray}
	<i> = 0
	begin
	<named_piece_thingy> = ($g_cag_save_list [<i>])
	if StructureContains structure = <instrument_info> <named_piece_thingy>
		if StructureContains structure = <instrument_save> <named_piece_thingy>
			setcasappearancepartinstance {
				part = (<instrument_info>.<named_piece_thingy>)
				part_instance = (<instrument_save>.<named_piece_thingy>)
			}
		else
			editcasappearance {
				target = clearpart
				targetparams = {part = (<instrument_info>.<named_piece_thingy>)}
			}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	printcurrentappearance
	rebuildcurrentcasmodel
endscript

script slot_focus_script \{index = !i1768515945}
	if ScreenElementExists id = <id>
		<id> :se_setprops {
			slot_text_font = fontgrid_text_a1
			slot_bg_texture = slot_boarder
			slot_text_rgba = [255 255 255 255]
		}
		if generic_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
			generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <index>
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script slot_unfocus_script 
	if ScreenElementExists id = <id>
		<id> :se_setprops {
			slot_text_font = fontgrid_text_a1
			slot_text_material = NULL
			slot_bg_texture = slot_boarder_no
			slot_text_rgba = [100 88 71 255]
		}
	endif
endscript

script slot_delete_entry 
	SpawnScriptNow slot_delete_entry_worker params = <...>
endscript

script slot_delete_entry_worker \{list = !q1768515945
		index = !i1768515945}
	globaltag_removearrayelement savegame = <savegame> array_name = <list> index = <index>
	ui_memcard_autosave_replace \{event = menu_back}
endscript

script exit_save_instrument \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {
		state = uistate_os_edit_name
		is_popup
		char_limit = 18
		default_name = <default_name>
		title = qs(0x5003a0bf)
		device_num = <device_num>
		accept_script = save_instrument_accept_name
		accept_params = {<...>}
		no_show_history = <no_show_history>
	}
endscript

script save_instrument_accept_name 
	SpawnScriptNow exit_save_instrument_worker params = {<...>}
endscript

script exit_save_instrument_worker \{instrument_info = 0x69696969
		savegame = !i1768515945
		index = !i1768515945
		list = !q1768515945}
	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> Name = <text> savegame = <savegame>
			ui_sfx \{menustate = Generic
				uitype = warningmessage}
			ui_event_wait event = menu_replace data = {
				state = uistate_generic_dialog_box
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
	GetArraySize \{g_cag_save_list
		globalarray}
	<i> = 0
	<entry> = {}
	begin
	<named_piece_thingy> = ($g_cag_save_list [<i>])
	if StructureContains structure = <instrument_info> <named_piece_thingy>
		if getcasappearancepartinstance part = (<instrument_info>.<named_piece_thingy>)
			AddParam {
				structure_name = entry
				Name = <named_piece_thingy>
				value = <part_instance>
			}
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	printf \{'exit_save_instrument_worker'}
	printstruct <entry>
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<index> > (<array_Size> -1))
		entry = {
			<entry>
			Name = <text>
		}
		ui_sfx \{menustate = car
			uitype = select}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			Name = (<element>.Name)
		}
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		ui_event event = menu_change data = {
			state = uistate_generic_dialog_box
			is_popup
			heading_text = qs(0x93a7149b)
			body_text = qs(0x275837ee)
			confirm_func = set_save_instrument_return
			confirm_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
		}
	endif
endscript

script set_save_instrument_return \{list = !q1768515945
		index = !i1768515945
		entry = 0x69696969
		savegame = !i1768515945}
	if NOT globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
		ScriptAssert 'failed saving %s to %a' s = <list> a = <index>
	endif
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script load_drum_save 
	ui_sfx \{menustate = car
		uitype = select}
	load_instrument_save <...>
	generic_event_back
endscript

script apply_cap_design 
	ui_sfx \{menustate = car
		uitype = select}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data {
		layers = (<element>.layers)
		source_aspect_ratio = (<element>.aspect_ratio)
		source_ui_rotation = (<element>.ui_rotation)
		source_part = (<element>.source_part)
		source_base_tex = (<element>.base_tex)
		<...>
	}
	generic_event_back \{nosound}
endscript

script load_cap_design \{list = !q1768515945
		index = !i1768515945
		savegame = !i1768515945}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data {
		layers = (<element>.layers)
		source_aspect_ratio = (<element>.aspect_ratio)
		source_ui_rotation = (<element>.ui_rotation)
		source_part = (<element>.source_part)
		source_base_tex = (<element>.base_tex)
		<...>
	}
	ui_event event = menu_replace data = {state = uistate_cap_layers_list loaded_index = <index> <...>}
endscript

script save_cap_design \{default_name = qs(0x00000000)
		event = menu_change}
	RemoveParameter \{text}
	ui_event event = <event> data = {
		state = uistate_os_edit_name
		is_popup
		char_limit = 18
		default_name = <default_name>
		title = qs(0xa796f1a6)
		device_num = <device_num>
		accept_script = save_cap_design_accept
		accept_params = {<...>}
		no_show_history = <no_show_history>
	}
endscript

script save_cap_design_accept 
	SpawnScriptNow save_cap_design_worker params = {<...>}
endscript

script save_cap_design_worker 
	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> Name = <text> savegame = <savegame>
			ui_sfx \{menustate = Generic
				uitype = warningmessage}
			ui_event_wait event = menu_replace data = {
				state = uistate_generic_dialog_box
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
	entry = {base_tex = <base_tex> layers = <layers> ui_rotation = <ui_rotation> aspect_ratio = <aspect_ratio> source_part = <part>}
	if (<index> > (<array_Size> -1))
		entry = {
			<entry>
			Name = <text>
		}
		ui_sfx \{menustate = car
			uitype = select}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			Name = (<element>.Name)
		}
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		ui_event event = menu_change data = {
			state = uistate_generic_dialog_box
			is_popup
			heading_text = qs(0x93a7149b)
			body_text = qs(0x275837ee)
			confirm_func = set_save_cap_return
			confirm_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
		}
	endif
endscript

script set_save_cap_return 
	if NOT globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
		ScriptAssert 'failed saving %s to %a' s = <list> a = <index>
	endif
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script is_name_unique \{list = !q1768515945
		Name = 0x69696969
		savegame = !i1768515945}
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<array_Size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <i>
		if ((<element>.Name) = <Name>)
			return \{FALSE}
		endif
		i = (<i> + 1)
		repeat <array_Size>
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
