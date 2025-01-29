
script ui_create_cas_save_slots 
	if NOT GotParam \{savegame}
		savegame = ($cas_current_savegame)
	endif

	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	make_generic_menu {
		title = <text>
		icon = <hist_tex>
		<show_history>
		no_up_down_sound_handlers
	}
	if GotParam \{load_guitar}
		pad_triangle_script = load_guitar_save_edit
		pad_triangle_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
		pad_choose_script = load_guitar_save_apply
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{save_guitar}
		pad_choose_script = exit_save_instrument_worker
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
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
		pad_choose_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
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
		dims = (375.0, 50.0)
		Scale = 0.7
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
						state = uistate_generic_dialogue
						is_popup
						title = qs(0x2682022f)
						text = qs(0x42fc65dd)
						choose_yes_func = {
							slot_delete_entry params = {list = <slot_list> index = <i> savegame = <savegame>}
						}
					}
				}
				additional_focus_script = save_slots_set_helper_text_delete
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
				additional_focus_script = save_slots_set_helper_text
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
				pad_choose_params = {index = <array_Size> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
			}
		elseif GotParam \{save_cap}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_Size>
				text = qs(0x4496766c)
				pad_choose_script = save_cap_design
				pad_choose_params = {index = <array_Size> list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
			}
		endif
	endif
	if (<num_items> > 1)
		add_generic_menu_up_down_sound_handlers
	endif
	LaunchEvent Type = focus target = current_menu data = {child_index = <loaded_index>}
	menu_finish \{no_helper_text}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
	endif
endscript

script ui_return_cas_save_slots 
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
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
		Type = descinterface
		parent = current_menu
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
				{pad_option <pad_square_script> params = <pad_square_params>}
				{pad_option generic_menu_pad_choose_sound}
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
	ui_event event = menu_replace data = {state = uistate_cag_custom instrument_info = <instrument_info> loaded_index = <index>}
endscript

script load_guitar_save_apply 
	load_guitar_save <...>
	generic_event_back
endscript

script load_guitar_save 


	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	guitar_save = <element>
	if StructureContains structure = <guitar_save> body_part
		setcasappearancepartinstance part = (<instrument_info>.body_part) part_instance = (<guitar_save>.body_part)
	endif
	if StructureContains structure = <guitar_save> neck_part
		setcasappearancepartinstance part = (<instrument_info>.neck_part) part_instance = (<guitar_save>.neck_part)
	endif
	if StructureContains structure = <guitar_save> head_part
		setcasappearancepartinstance part = (<instrument_info>.head_part) part_instance = (<guitar_save>.head_part)
	endif
	if StructureContains structure = <guitar_save> pick_guard_part
		setcasappearancepartinstance part = (<instrument_info>.pick_guard_part) part_instance = (<guitar_save>.pick_guard_part)
	endif
	if StructureContains structure = <guitar_save> pickups_part
		setcasappearancepartinstance part = (<instrument_info>.pickups_part) part_instance = (<guitar_save>.pickups_part)
	endif
	if StructureContains structure = <guitar_save> knobs_part
		setcasappearancepartinstance part = (<instrument_info>.knobs_part) part_instance = (<guitar_save>.knobs_part)
	endif
	if StructureContains structure = <guitar_save> bridge_part
		setcasappearancepartinstance part = (<instrument_info>.bridge_part) part_instance = (<guitar_save>.bridge_part)
	endif
	if StructureContains structure = <guitar_save> highway_part
		setcasappearancepartinstance part = (<instrument_info>.highway_part) part_instance = (<guitar_save>.highway_part)
	endif
	if StructureContains structure = <guitar_save> stand_part
		setcasappearancepartinstance part = (<instrument_info>.stand_part) part_instance = (<guitar_save>.stand_part)
	endif
	if StructureContains structure = <guitar_save> detail_part
		setcasappearancepartinstance part = (<instrument_info>.detail_part) part_instance = (<guitar_save>.detail_part)
	endif
	if StructureContains structure = <guitar_save> finish_part
		setcasappearancepartinstance part = (<instrument_info>.finish_part) part_instance = (<guitar_save>.finish_part)
	endif
	if StructureContains structure = <guitar_save> logo_part
		setcasappearancepartinstance part = (<instrument_info>.logo_part) part_instance = (<guitar_save>.logo_part)
	endif
	if StructureContains structure = <guitar_save> head_finish_part
		setcasappearancepartinstance part = (<instrument_info>.head_finish_part) part_instance = (<guitar_save>.head_finish_part)
	endif
	if StructureContains structure = <guitar_save> neck_finish_part
		setcasappearancepartinstance part = (<instrument_info>.neck_finish_part) part_instance = (<guitar_save>.neck_finish_part)
	endif
	if StructureContains structure = <guitar_save> pickgaurd_finish_part
		setcasappearancepartinstance part = (<instrument_info>.pickgaurd_finish_part) part_instance = (<guitar_save>.pickgaurd_finish_part)
	endif
	if StructureContains structure = <guitar_save> head_detail_part
		setcasappearancepartinstance part = (<instrument_info>.head_detail_part) part_instance = (<guitar_save>.head_detail_part)
	endif
	printcurrentappearance
	rebuildcurrentcasmodel
endscript

script slot_focus_script 
	if ScreenElementExists id = <id>
		<id> :se_setprops {
			slot_text_font = fontgrid_text_a6_fire
			slot_text_material = sys_fontgrid_text_a6_fire_sys_fontgrid_text_a6_fire
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
		<id> :se_setprops {
			slot_text_font = fontgrid_text_a6
			slot_text_material = NULL
			slot_bg_texture = slot_boarder_no
			slot_text_rgba = [100 88 71 255]
		}
	endif
endscript

script slot_delete_entry 
	SpawnScriptNow slot_delete_entry_worker params = <...>
endscript

script slot_delete_entry_worker 

	globaltag_removearrayelement savegame = <savegame> array_name = <list> index = <index>
	ui_event_block \{event = menu_back}
	Wait \{1
		gameframe}
	ui_event \{event = menu_refresh}
endscript

script exit_save_instrument 
	ui_event event = menu_replace data = {state = uistate_cas_text_entry choose_script = exit_save_instrument_worker choose_params = {<...>} no_show_history = <no_show_history>}
endscript

script exit_save_instrument_worker 

	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> Name = <text> savegame = <savegame>
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_generic_alert_popup
					is_popup
					title = qs(0xade772d9)
					text = qs(0xe029feb1)
					pad_choose_script = save_slots_return_from_warning
				}}
			return
		endif
	endif
	if StructureContains structure = <instrument_info> body_part
		if getcasappearancepartinstance part = (<instrument_info>.body_part)
			entry = {
				<entry>
				body_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> neck_part
		if getcasappearancepartinstance part = (<instrument_info>.neck_part)
			entry = {
				<entry>
				neck_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> head_part
		if getcasappearancepartinstance part = (<instrument_info>.head_part)
			entry = {
				<entry>
				head_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> pick_guard_part
		if getcasappearancepartinstance part = (<instrument_info>.pick_guard_part)
			entry = {
				<entry>
				pick_guard_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> pickups_part
		if getcasappearancepartinstance part = (<instrument_info>.pickups_part)
			entry = {
				<entry>
				pickups_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> knobs_part
		if getcasappearancepartinstance part = (<instrument_info>.knobs_part)
			entry = {
				<entry>
				knobs_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> bridge_part
		if getcasappearancepartinstance part = (<instrument_info>.bridge_part)
			entry = {
				<entry>
				bridge_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> highway_part
		if getcasappearancepartinstance part = (<instrument_info>.highway_part)
			entry = {
				<entry>
				highway_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> stick_part
		if getcasappearancepartinstance part = (<instrument_info>.stick_part)
			entry = {
				<entry>
				stick_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> stand_part
		if getcasappearancepartinstance part = (<instrument_info>.stand_part)
			entry = {
				<entry>
				stand_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> detail_part
		if getcasappearancepartinstance part = (<instrument_info>.detail_part)
			entry = {
				<entry>
				detail_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> finish_part
		if getcasappearancepartinstance part = (<instrument_info>.finish_part)
			entry = {
				<entry>
				finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> logo_part
		if getcasappearancepartinstance part = (<instrument_info>.logo_part)
			entry = {
				<entry>
				logo_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> head_finish_part
		if getcasappearancepartinstance part = (<instrument_info>.head_finish_part)
			entry = {
				<entry>
				head_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> neck_finish_part
		if getcasappearancepartinstance part = (<instrument_info>.neck_finish_part)
			entry = {
				<entry>
				neck_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> pickgaurd_finish_part
		if getcasappearancepartinstance part = (<instrument_info>.pickgaurd_finish_part)
			entry = {
				<entry>
				pickgaurd_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains structure = <instrument_info> head_detail_part
		if getcasappearancepartinstance part = (<instrument_info>.head_detail_part)
			entry = {
				<entry>
				head_detail_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<index> > (<array_Size> -1))
		entry = {
			<entry>
			Name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			Name = (<element>.Name)
		}
		ui_event event = menu_change data = {
			state = uistate_generic_dialogue
			is_popup
			title = qs(0x9f8d48f3)
			text = qs(0x275837ee)
			choose_yes_func = {
				set_save_instrument_return
				params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
			}
		}
	endif
	if (<instrument_info>.desc_id = guitar)
		achievements_one_of_a_kind_axe controller = ($primary_controller)
	elseif (<instrument_info>.desc_id = drum)
		achievements_custom_beats controller = ($primary_controller)
	endif
endscript

script set_save_instrument_return 
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script load_drum_save 
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	drum_save = <element>
	if StructureContains structure = <drum_save> body_part
		setcasappearancepartinstance part = (<instrument_info>.body_part) part_instance = (<drum_save>.body_part)
	endif
	if StructureContains structure = <drum_save> highway_part
		setcasappearancepartinstance part = (<instrument_info>.highway_part) part_instance = (<drum_save>.highway_part)
	endif
	if StructureContains structure = <drum_save> stick_part
		setcasappearancepartinstance part = (<instrument_info>.stick_part) part_instance = (<drum_save>.stick_part)
	endif
	if StructureContains structure = <drum_save> detail_part
		setcasappearancepartinstance part = (<instrument_info>.detail_part) part_instance = (<drum_save>.detail_part)
	endif
	if StructureContains structure = <drum_save> finish_part
		setcasappearancepartinstance part = (<instrument_info>.finish_part) part_instance = (<drum_save>.finish_part)
	endif
	rebuildcurrentcasmodel
	ui_event event = menu_replace data = {state = uistate_cadrm_hub instrument_info = <instrument_info> loaded_index = <index>}
endscript

script apply_cap_design 
	Change \{achievements_modified_logo = 0}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data layers = (<element>.layers) <...>
	generic_event_back \{nosound}
endscript

script load_cap_design 

	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	cas_load_graphic_data layers = (<element>.layers) <...>
	ui_event event = menu_replace data = {state = uistate_cap_layers_list loaded_index = <index> <...>}
endscript

script save_cap_design 
	ui_event event = menu_replace data = {state = uistate_cas_text_entry choose_script = save_cap_design_worker choose_params = {<...>} no_show_history = <no_show_history>}
endscript

script save_cap_design_worker 
	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> Name = <text> savegame = <savegame>
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_generic_alert_popup
					is_popup
					title = qs(0xade772d9)
					text = qs(0xe029feb1)
					pad_choose_script = save_slots_return_from_warning
				}}
			return
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	entry = {layers = ($edit_graphic_layer_infos)}
	if (<index> > (<array_Size> -1))
		entry = {
			<entry>
			Name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			Name = (<element>.Name)
		}
		ui_event event = menu_change data = {
			state = uistate_generic_dialogue
			is_popup
			title = qs(0x9f8d48f3)
			text = qs(0x275837ee)
			choose_yes_func = {
				set_save_cap_return
				params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
			}
		}
	endif
endscript

script set_save_cap_return 
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script is_name_unique 

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

script save_slots_return_from_warning 
	generic_event_back
	SpawnScriptLater \{lock_to_text_entry}
endscript

script save_slots_set_helper_text_delete 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs(0x271a1633)
			button = blue
			z = 100000}
	endif
endscript

script save_slots_set_helper_text 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript
