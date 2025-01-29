on_destroy_dialog_box = null_script
on_destroy_dialog_box_params = {
}
g_dlg_event_handlers_options = [
	{
		pad_up
		ui_sfx
		params = {
			menustate = Generic
			uitype = scrollup
		}
	}
	{
		pad_down
		ui_sfx
		params = {
			menustate = Generic
			uitype = scrolldown
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
	else
		GetArraySize <options>
		if (<array_Size> = 0)
			<template> = no_options
		endif
	endif
	if GotParam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
	endif
	if ScreenElementExists \{id = dialog_box_container}
		DestroyScreenElement \{id = dialog_box_container}
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
		dialog_box_desc_id :se_setprops \{dlog_body_fit
			height = expand_dims}
		<id> :obj_spawnscript dialog_box_heading_fade
		return
	endif
	if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu_container}
		AssignAlias id = <resolved_id> alias = dlog_vmenu_container
		<resolved_id> :se_getprops
		<z> = <z_priority>
	else
		ScriptAssert \{qs(0xf38ef263)}
	endif
	if (<template> = fail_song)
		<Scale> = 0.65000004
		<highlight_bar_scale> = (1.2, 1.0)
	else
		<Scale> = 0.75
		<highlight_bar_scale> = (1.3, 1.0)
	endif
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
	<menu_params> = {
		parent = dlog_vmenu_container
		exclusive_device = <player_device>
		centered = 1
		max_expansion = 3
		Scale = <Scale>
		z_priority = (<z> + 1)
		<pass_param>
	}
	if GotParam \{back_button_script}
		if GotParam \{back_button_params}
			make_generic_barrel_menu {
				<menu_params>
				pad_back_script = <back_button_script>
				pad_back_params = <back_button_params>
			}
		else
			make_generic_barrel_menu {
				<menu_params>
				pad_back_script = <back_button_script>
			}
		endif
	else
		make_generic_barrel_menu {
			<menu_params>
			pad_back_script = nullscript
		}
	endif
	AssignAlias id = <vmenu_id> alias = dialog_box_vmenu
	dialog_box_create_menu_options <...>
	generic_barrel_menu_finish no_helper_pills = 1 index = <initial_focus_index>
	if (<template> = extended)
		dialog_box_desc_id :se_setprops \{dlog_body_fit_height = expand_dims}
	endif
	if GotParam \{no_focus}
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
	else
		LaunchEvent \{Type = focus
			target = dialog_box_vmenu}
	endif
	if NOT GotParam \{no_helpers}
		helper_z_priority = (<dlg_z_priority> + 1000)
		if NOT GotParam \{no_controller_helper}
			if GotParam \{player_device}
				add_gamertag_helper exclusive_device = <player_device> z = <helper_z_priority>
			endif
		endif
		if GotParam \{use_all_controllers}
			all_buttons_flag = {all_buttons}
		endif
		add_user_control_helper text = qs(0xc18d5e76) button = green z = <helper_z_priority> <all_buttons_flag>
		if GotParam \{back_button_script}
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = <helper_z_priority> <all_buttons_flag>
		endif
	endif
	return \{menu_id = dialog_box_vmenu}
endscript

script destroy_dialog_box 
	if (($on_destroy_dialog_box) != null_script)
		($on_destroy_dialog_box) ($on_destroy_dialog_box_params)
		Change \{on_destroy_dialog_box = null_script}
	endif
	if NOT GotParam \{dont_remove_helpers}
		clean_up_user_control_helpers
	endif
	DestroyScreenElement \{id = dialog_box_container}
	set_focus_color
	set_unfocus_color
endscript

script dialog_box_get_desc_type_text 
	switch <template>
		case standard
		return \{desc_type_text = 'dialog_box_standard'}
		case no_options
		return \{desc_type_text = 'dialog_box_standard'}
		return \{desc_type_text = 'dialog_box_standard'}
		case extended
		return \{desc_type_text = 'dialog_box_standard'}
		case fail_song
		return \{desc_type_text = 'dialog_box_alternate'}
	endswitch
endscript

script dialog_box_heading_fade 
	if desc_resolvealias \{Name = alias_dlog_heading_text_cont
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
	menustate = Generic
	sound_func = ui_sfx
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
	if StructureContains structure = <option> not_focusable
		add_generic_barrel_menu_text_item {
			text = (<option>.text)
			pad_choose_script = (<option>.func)
			pad_choose_params = <func_params>
			pad_choose_sound = ui_sfx
			pad_choose_sound_menustate = <menustate>
			pad_choose_sound_uitype = select
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
			pad_choose_sound = ui_sfx
			pad_choose_sound_menustate = <menustate>
			pad_choose_sound_uitype = select
			menurow_txt_item_dims = (610.0, 50.0)
			menurow_just = [center , center]
			extra_props = <extra_props>
			focus_script_params = <focus_script_params>
		}
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
