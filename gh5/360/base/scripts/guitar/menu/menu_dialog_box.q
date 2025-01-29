on_destroy_dialog_box = null_script
on_destroy_dialog_box_params = {
}
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

script create_dialog_box {
		template = standard
		player_device = ($primary_controller)
		dlg_z_priority = 500
		parent = root_window
	}
	if GotParam \{on_destroy_script}
		Change on_destroy_dialog_box = <on_destroy_script>
		Change on_destroy_dialog_box_params = <on_destroy_script_params>
	else
		Change \{on_destroy_dialog_box = null_script}
		Change \{on_destroy_dialog_box_params = {
			}}
	endif
	if isps3
		if ui_event_exists_in_stack \{Name = 'savegame_boot_scan'}
			use_all_controllers = 1
		endif
	endif
	if NOT GotParam \{options}
		if (<template> = standard)
			<template> = no_options
		endif
	endif
	if GotParam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
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
	if NOT GotParam \{dont_remove_helpers}
		clean_up_user_control_helpers
	endif
	if (<template> = no_options)
		if NOT GotParam \{no_helpers}
			if NOT GotParam \{no_controller_helper}
				if GotParam \{player_device}
					add_gamertag_helper exclusive_device = <player_device>
				endif
			endif
		endif
		dialog_box_desc_id :se_setprops \{highlight_btn_alpha = 0.0
			dlog_body_no_options_alpha = 1.0
			dlog_body_alpha = 0.0}
		<id> :obj_spawnscript dialog_box_heading_fade
		return
	endif
	GetArraySize \{options}
	if (<array_Size> > 2)
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu_container}
			AssignAlias id = <resolved_id> alias = dlog_vmenu_container
			<resolved_id> :se_getprops
			<z> = <z_priority>
		else
			ScriptAssert \{qs(0xf38ef263)}
		endif
		if (<template> = fail_song)
			<menu_pos> = (502.0, 246.0)
			<Scale> = 0.75
		else
			<menu_pos> = (520.0, 314.0)
			<Scale> = 0.85
		endif
		<menu_params> = {
			parent = dlog_vmenu_container
			exclusive_device = <player_device>
			centered = 1
			Pos = <menu_pos>
			max_expansion = 3
			Scale = <Scale>
			z_priority = (<z> + 1)
			no_highlight_bar
			use_original_barrel
		}
		pass_param = nullparam
		if GotParam \{no_up_down_sound_handlers}
			pass_param = no_up_down_sound_handlers
		endif
		if GotParam \{pad_back_sound}
			pass_param = {
				pad_back_sound = <pad_back_sound>
				<pass_param>
			}
		endif
		if GotParam \{back_button_script}
			if GotParam \{back_button_params}
				make_generic_barrel_menu {
					<menu_params>
					pad_back_script = <back_button_script>
					pad_back_params = <back_button_params>
					<pass_param>
				}
			else
				make_generic_barrel_menu {
					<menu_params>
					pad_back_script = <back_button_script>
					<pass_param>
				}
			endif
		else
			make_generic_barrel_menu {
				<menu_params>
				pad_back_script = nullscript
				<pass_param>
			}
		endif
		AssignAlias id = <vmenu_id> alias = dialog_box_vmenu
	else
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu}
			AssignAlias id = <resolved_id> alias = dialog_box_vmenu
			updown_sound = 1
			if (<array_Size> = 1)
				<updown_sound> = 0
			endif
			if GotParam \{no_up_down_sound_handlers}
				<updown_sound> = 0
			endif
			if NOT (<updown_sound> = 1)
				dialog_box_vmenu :se_setprops {
					exclusive_device = <player_device>
				}
			else
				dialog_box_vmenu :se_setprops {
					exclusive_device = <player_device>
					event_handlers = ($g_dlg_event_handlers_options)
				}
			endif
		endif
	endif
	dialog_box_create_menu_options <...>
	if (<array_Size> > 2)
		generic_barrel_menu_finish no_helper_pills = 1 index = <initial_focus_index>
	elseif (<array_Size> = 2)
		if InNetGame
			if dialog_box_desc_id :desc_resolvealias \{Name = alias_highlight_btn
					param = highlight_btn}
				<highlight_btn> :se_setprops alpha = 0.0
			endif
		endif
		highlight_btn_pos = (-114.0, 74.0)
		if (<template> = extended)
			highlight_btn_pos = (-114.0, 124.0)
		elseif (<template> = fail_song)
			menu_pos = (0.0, -60.0)
		endif
		dialog_box_desc_id :SetProps {
			highlight_btn_pos = <highlight_btn_pos>
			dlog_vmenu_pos = <menu_pos>
		}
	endif
	if GotParam \{no_focus}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
	else
		if (<array_Size> = 2)
			LaunchEvent Type = focus target = dialog_box_vmenu data = {child_index = <initial_focus_index>}
		else
			LaunchEvent \{Type = focus
				target = dialog_box_vmenu}
		endif
	endif
	if NOT GotParam \{no_helpers}
		if NOT GotParam \{no_controller_helper}
			if GotParam \{player_device}
				add_gamertag_helper exclusive_device = <player_device>
			endif
		endif
		if GotParam \{use_all_controllers}
			all_buttons_flag = {all_buttons}
		endif
		add_user_control_helper text = qs(0xc18d5e76) button = green z = 100000 <all_buttons_flag>
		if GotParam \{back_button_script}
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = 100000 <all_buttons_flag>
		endif
	endif
	return \{menu_id = dialog_box_vmenu}
endscript

script dialog_box_setup_physics_elements 
	if (<desc_type_text> = 'dialog_box_standard' || <desc_type_text> = 'dialog_box_alternate' || <desc_type_text> = 'dialog_box_standard_musicstudio' || <desc_type_text> = 'dialog_box_extended')
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
			ScriptAssert \{'dschorn1'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_skull_frame
				param = skull_frame_id}
			<skullborder_id> :obj_spawnscript ui_shakey
		else
			ScriptAssert \{'dschorn1'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_flame2_container
				param = flame2_id}
			<flame2_id> :obj_spawnscript ui_shakey
		else
			ScriptAssert \{'dschorn1'}
		endif
	endif
	if (<desc_type_text> = 'dialog_box_standard' || <desc_type_text> = 'dialog_box_standard_musicstudio')
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_dialog_frame_animate
				param = dialog_frame_anim_id}
			<dialog_frame_anim_id> :obj_spawnscript ui_shakey
		else
			ScriptAssert \{'drose1'}
		endif
	endif
endscript

script destroy_dialog_box 
	if (($on_destroy_dialog_box) != null_script)
		($on_destroy_dialog_box) ($on_destroy_dialog_box_params)
		Change \{on_destroy_dialog_box = null_script}
	endif
	if NOT GotParam \{dont_remove_helpers}
		clean_up_user_control_helpers
	endif
	DestroyScreenElement \{id = dialog_box_desc_id}
	destroy_menu \{menu_id = dialog_box_container}
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
		case extended
		return \{desc_type_text = 'dialog_box_extended'}
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
				menurow_txt_item_dims = (610.0, 50.0)
				menurow_just = [center , center]
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		else
			add_generic_barrel_menu_text_item {
				text = (<option>.text)
				pad_choose_script = (<option>.func)
				pad_choose_params = <func_params>
				pad_choose_sound = <sound_func>
				menurow_txt_item_dims = (610.0, 50.0)
				menurow_just = [center , center]
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		endif
	else
		Shadow = true
		if (<dlg_z_priority> > 1000)
			Shadow = FALSE
		endif
		if (<array_Size> = 2)
			if (<template> = extended)
				if (<index> = 0)
					<focus_params> = {hl_pos = (-114.0, 124.0)}
				else
					<focus_params> = {hl_pos = (-114.0, 174.0)}
				endif
				Shadow = FALSE
			elseif (<template> = fail_song)
				if (<index> = 0)
					<focus_params> = {hl_pos = (630.0, 440.0)}
				else
					<focus_params> = {hl_pos = (630.0, 490.0)}
				endif
			else
				if (<index> = 0)
					<focus_params> = {hl_pos = (-114.0, 74.0)}
				else
					<focus_params> = {hl_pos = (-114.0, 124.0)}
				endif
			endif
		else
			<focus_params> = {}
		endif
		if ((GotParam num_focusable_options) && (<num_focusable_options> = 1))
			event_handlers = [
				{focus dialog_box_focus params = {<focus_params> dont_move_highlight}}
				{unfocus dialog_box_unfocus}
				{pad_choose <sound_func>}
				{pad_choose (<option>.func) params = <func_params>}
			]
		else
			event_handlers = [
				{focus dialog_box_focus params = <focus_params>}
				{unfocus dialog_box_unfocus}
				{pad_choose <sound_func>}
				{pad_choose (<option>.func) params = <func_params>}
			]
		endif
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
		if StructureContains structure = <option> not_focusable
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
				not_focusable
			}
		else
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
				menurow_txt_item_shadow_enabled = <Shadow>
			}
		endif
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dialog_box_vmenu
	GetArraySize <options>
	<num_focusable_options> = 0
	<i> = 0
	begin
	if NOT StructureContains structure = (<options> [<i>]) not_focusable
		<num_focusable_options> = (<num_focusable_options> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
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
		num_focusable_options = <num_focusable_options>
		back_button_script = <back_button_script>
		back_button_params = <back_button_params>
		dlg_z_priority = <dlg_z_priority>
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
	if NOT GotParam \{dont_move_highlight}
		dialog_box_desc_id :SetProps {
			highlight_btn_pos = <hl_pos>
		}
	endif
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
