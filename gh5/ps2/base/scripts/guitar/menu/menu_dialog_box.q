g_dlg_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		params = {
			up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		params = {
			down
		}
	}
]
0x72016ee9 = 0

script create_popup_warning_menu player_device = ($primary_controller) popup_event_handlers = ($g_dlg_event_handlers_options) header_offset = (0.0, 0.0) dlg_z_priority = 500 parent = root_window
	heading_text = <title>
	body_text = (<textblock>.text)
	0xda98f1ae = <popup_event_handlers>
	create_dialog_box <...>
endscript

script create_dialog_box {
		template = standard
		player_device = ($primary_controller)
		0xda98f1ae = ($g_dlg_event_handlers_options)
		dlg_z_priority = 500
		parent = root_window
	}
	if ScreenElementExists \{id = dialog_box_container}
		0x93d8d5cf \{'Attempted to create popup warning when one already existed.'}
		return
	endif
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if NOT GotParam \{options}
		if (<template> = standard)
			<template> = no_options
		endif
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{player_device}
		get_all_exclusive_devices
		player_device = <exclusive_device>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = dialog_box_container
		Pos = (0.0, 0.0)
		just = [left top]
	}
	dialog_box_get_desc_type_text template = <template>
	CreateScreenElement {
		parent = dialog_box_container
		id = dialog_box_desc_id
		Type = descinterface
		desc = <desc_type_text>
		z_priority = <dlg_z_priority>
		exclusive_device = <player_device>
	}
	dialog_box_setup_physics_elements desc_type_text = <desc_type_text>
	dialog_box_create_all_text <...>
	if GotParam \{0x481c5af8}
		Change \{0x72016ee9 = 1}
		hide_user_control_helpers
	else
		clean_up_user_control_helpers
	endif
	if (<template> = no_options)
		dialog_box_desc_id :se_setprops \{highlight_btn_alpha = 0.0
			dlog_body_no_options_alpha = 1.0
			dlog_body_alpha = 0.0}
		<id> :obj_spawnscript dialog_box_heading_fade
		Change menu_flow_locked = ($menu_flow_locked - 1)
		return
	elseif NOT GotParam \{options}
		0x93d8d5cf \{'Template is not no_options, but no options were passed in.'}
	endif
	GetArraySize \{options}
	if (<array_Size> > 2)
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu_container}
			AssignAlias id = <resolved_id> alias = dlog_vmenu_container
			<resolved_id> :se_getprops
			<z> = <z_priority>
		else

		endif
		if (<template> = fail_song)
			<menu_pos> = (510.0, 220.0)
		else
			<menu_pos> = (510.0, 260.0)
		endif
		<menu_params> = {
			parent = dlog_vmenu_container
			exclusive_device = <player_device>
			centered = 1
			Pos = <menu_pos>
			max_expansion = 3
			Scale = 0.8
			z_priority = (<z> + 1)
		}
		if GotParam \{back_button_script}
			if GotParam \{back_button_params}
				make_generic_barrel_menu {
					<menu_params>
					pad_back_script = <back_button_script>
					pad_back_params = <back_button_params>
					no_highlight_bar
				}
			else
				make_generic_barrel_menu {
					<menu_params>
					pad_back_script = <back_button_script>
					no_highlight_bar
				}
			endif
		else
			make_generic_barrel_menu {
				<menu_params>
				pad_back_script = nullscript
				pad_back_sound = nullscript
				no_highlight_bar
			}
		endif
		AssignAlias id = <vmenu_id> alias = dialog_box_vmenu
	else
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu}
			AssignAlias id = <resolved_id> alias = dialog_box_vmenu
			if (<array_Size> = 1)
				dialog_box_vmenu :se_setprops {
					exclusive_device = <player_device>
				}
			else
				dialog_box_vmenu :se_setprops {
					exclusive_device = <player_device>
					event_handlers = <0xda98f1ae>
				}
			endif
		endif
	endif
	dialog_box_create_menu_options <...>
	if (<array_Size> > 2)
		generic_barrel_menu_finish \{no_helper_pills = 1}
	endif
	dialog_box_desc_id :SetProps \{highlight_btn_pos = (2000.0, 2000.0)}
	if GotParam \{no_focus}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
	else
		LaunchEvent \{Type = focus
			target = dialog_box_vmenu}
	endif
	if NOT GotParam \{no_helpers}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		if GotParam \{back_button_script}

			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
	return \{menu_id = dialog_box_vmenu}
endscript

script dialog_box_setup_physics_elements 
	if (<desc_type_text> = 'dialog_box_standard' || <desc_type_text> = 'dialog_box_alternate' || <desc_type_text> = 'dialog_box_standard_musicstudio')
		create_2d_spring_system \{desc_id = dialog_box_desc_id
			num_springs = 2
			stiffness = 50
			rest_length = 1}
	endif
	if (<desc_type_text> = 'dialog_box_alternate')
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_skullborder_animate
				param = skullborder_id}
			<skullborder_id> :obj_spawnscript ui_frazzmatazz
		else

		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_skull_frame
				param = skull_frame_id}
			<skullborder_id> :obj_spawnscript ui_shakey
		else

		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_flame2_container
				param = flame2_id}
			<flame2_id> :obj_spawnscript ui_shakey
		else

		endif
	endif
	if (<desc_type_text> = 'dialog_box_standard' || <desc_type_text> = 'dialog_box_standard_musicstudio')
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dialog_frame_animate
				param = dialog_frame_anim_id}
			<dialog_frame_anim_id> :obj_spawnscript ui_shakey
		else

		endif
	endif
endscript

script destroy_popup_warning_menu 
	destroy_dialog_box <...>
endscript

script destroy_dialog_box 
	if ($0x72016ee9 = 0)
		clean_up_user_control_helpers
	endif
	DestroyScreenElement \{id = dialog_box_desc_id}
	destroy_menu \{menu_id = dialog_box_container}
	if ($0x72016ee9 = 1)
		Change \{0x72016ee9 = 0}
		0xd13df5ab
	endif
	set_focus_color
	set_unfocus_color
endscript

script dialog_box_get_desc_type_text 
	switch <template>
		case standard
		return \{desc_type_text = 'dialog_box_standard'}
		case no_options
		return \{desc_type_text = 'dialog_box_standard'}
		case large_body
		return \{desc_type_text = 'dialog_box_standard'}
		case fail_song
		return \{desc_type_text = 'dialog_box_alternate'}
		case musicstudio
		return \{desc_type_text = 'dialog_box_standard_musicstudio'}
	endswitch
endscript

script dialog_box_heading_fade 
	if desc_resolvealias \{Name = alias_dialog_text
			param = cont}
		Wait \{2
			Seconds}
		begin
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 0.5 time = 1.0 motion = ease_in
		<cont> :se_waitprops
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 1.0 time = 1.0 motion = ease_out
		<cont> :se_waitprops
		repeat
	endif
endscript

script dialog_box_create_all_text \{heading_text = qs(0xaa163738)}
	dialog_box_desc_id :SetProps {
		dlog_heading_text = <heading_text>
	}
	if GotParam \{body_text}
		dialog_box_desc_id :SetProps {
			dlog_body_text = <body_text>
		}
	endif
	if GotParam \{fail_song_props}
		dialog_box_desc_id :SetProps {
			dlog_body_alpha = 0.0
			dlog_fail_song_info_alpha = 1.0
			dlog_fail_song_title_text = (<fail_song_props>.song_title)
			dlog_fail_song_section_text = (<fail_song_props>.section_name_text)
			dlog_fail_song_percent_text = (<fail_song_props>.percent_text)
			dlog_fail_song_difficulty_text = (<fail_song_props>.difficulty_text)
			dlog_fail_song_on_text = (<fail_song_props>.0x8d1f5266)
		}
	endif
	if GotParam \{fail_song_props_prac}
		dialog_box_desc_id :SetProps \{dlog_fail_song_info_prac_alpha = 1
			dlog_fail_song_info_alpha = 0}
		dialog_box_desc_id :SetProps {
			dlog_fail_song_title_text = (<fail_song_props_prac>.song_title)
		}
		dialog_box_desc_id :SetProps {
			dlog_fail_song_percent_prac_text = (<fail_song_props_prac>.percent_text)
		}
		dialog_box_desc_id :SetProps {
			dlog_fail_song_difficulty_prac_text = (<fail_song_props_prac>.difficulty_text)
		}
	endif
endscript

script dialog_box_create_menu_option_singular 
	if StructureContains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if StructureContains structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if StructureContains structure = <option> no_sound
		sound_func = nullscript
	endif
	if StructureContains structure = <option> screenelementprops
		extra_props = (<option>.screenelementprops)
	endif
	if StructureContains structure = <option> focus_script_params
		focus_script_params = (<option>.focus_script_params)
	endif
	set_unfocus_color
	if (<array_Size> > 2)
		if StructureContains structure = <option> not_focusable
			add_generic_barrel_menu_text_item {
				text = (<option>.text)
				pad_choose_script = (<option>.func)
				pad_choose_params = <func_params>
				pad_choose_sound = <sound_func>
				not_focusable
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		else
			add_generic_barrel_menu_text_item {
				text = (<option>.text)
				pad_choose_script = (<option>.func)
				pad_choose_params = <func_params>
				pad_choose_sound = <sound_func>
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		endif
	else
		if (<array_Size> = 2)
			if (<index> = 0)
				<focus_params> = {hl_pos = (622.0, 530.0)}
			else
				<focus_params> = {hl_pos = (622.0, 580.0)}
			endif
		else
			<focus_params> = {}
		endif
		event_handlers = [
			{focus dialog_box_focus params = <focus_params>}
			{unfocus dialog_box_unfocus}
			{pad_choose <sound_func>}
			{pad_choose (<option>.func) params = <func_params>}
		]
		if GotParam \{back_button_script}
			<event> = {pad_back generic_menu_pad_choose_sound}
			AddArrayElement array = <event_handlers> element = <event>
			if GotParam \{back_button_params}
				<event> = {pad_back <back_button_script> params = {<back_button_params>}}
			else
				<event> = {pad_back <back_button_script>}
			endif
			AddArrayElement array = <event_handlers> element = <event>
			<event_handlers> = <array>
		endif
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			menurow_just = [center center]
			menurow_internal_just = [center center]
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = ($menu_unfocus_color)
			autosizedims = true
			menurow_txt_item_text = (<option>.text)
			event_handlers = <event_handlers>
		}
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dialog_box_vmenu
	GetArraySize <options>
	<i> = 0
	begin
	dialog_box_create_menu_option_singular {
		option = (<options> [<i>])
		z = <z>
		num_options = <array_Size>
		parent = <parent>
		template = <template>
		array_Size = <array_Size>
		index = <i>
		back_button_script = <back_button_script>
		back_button_params = <back_button_params>
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script dialog_box_focus \{time = 0.05
		grow_scale = 1.5}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_focus_color)
		motion = ease_in
		time = <time>
	}
	dialog_box_desc_id :SetProps {
		highlight_btn_pos = <hl_pos>
	}
endscript

script dialog_box_unfocus \{time = 0.05}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
		motion = ease_in
		time = <time>
	}
endscript
