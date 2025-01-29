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
		dlg_z_priority = 20000
		parent = root_window
		update_net_controllers = 1
	}
	if GotParam \{on_destroy_script}
		Change on_destroy_dialog_box = <on_destroy_script>
		Change on_destroy_dialog_box_params = <on_destroy_script_params>
	else
		Change \{on_destroy_dialog_box = null_script}
		Change \{on_destroy_dialog_box_params = {
			}}
	endif
	if ((isps3) || (isngc))
		if ui_event_exists_in_stack \{Name = 'savegame_boot_scan'}
			use_all_controllers = 1
		endif
	endif
	destroy_loading_screen
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
	if GotParam \{heading_text}
		if ((<heading_text> = qs(0xaa163738)) || (<heading_text> = qs(0x361603ec)) || (<heading_text> = qs(0x79597197)) || (<heading_text> = qs(0xb2359d6b)) || (<heading_text> = qs(0x5ce7042a)) || (<heading_text> = qs(0x5bca5cb5)) || (<heading_text> = qs(0xcf5deb58)) || (<heading_text> = qs(0x2e1c496a)) || (<heading_text> = qs(0xe7187b7e)) || (<heading_text> = qs(0x5a260fdc)) || (<heading_text> = qs(0xb1245fb5)) || (<heading_text> = qs(0x87f7b248)) || (<heading_text> = qs(0xd028ceaa)) || (<heading_text> = qs(0x24c5d3a9)))
			ui_sfx \{menustate = Generic
				uitype = warningmessage}
		endif
	else
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = dialog_box_container
		Pos = (0.0, 0.0)
		just = [left top]
	}
	dialog_box_get_desc_type_text template = <template>
	highlight_btn_pos = (-114.0, 74.0)
	CreateScreenElement {
		parent = dialog_box_container
		id = dialog_box_desc_id
		Type = descinterface
		desc = <desc_type_text>
		z_priority = <dlg_z_priority>
		exclusive_device = <player_device>
	}
	if GotParam \{dlog_body_dims}
		dialog_box_desc_id :se_setprops dlog_body_dims = <dlog_body_dims>
	endif
	if (<template> = dlc_pin)
		dialog_box_desc_id :se_setprops {
			dlc_confirm_download_dialog_alpha = 0
			dlc_pin_dialog_alpha = 1
			dlog_body_text = ($ecommerce_messages.rvlec_message_0007_pin_entry_text)
		}
		dialog_box_desc_id :SetTags pin_callback = <callback>
		Change \{parent_pin_index = 0}
		Change \{parent_pin_values = [
				0
				0
				0
				0
			]}
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_arrow_container}
			AssignAlias id = <resolved_id> alias = alias_arrow_container
		endif
	elseif (<template> = dlc_confirm)
		if NOT GotParam \{top_blocks}
			<top_blocks> = qs(0xc4d5515e)
			<middle_blocks> = qs(0xc4d5515e)
			<bottom_blocks> = qs(0xc4d5515e)
		endif
		if NOT GotParam \{top_wii_points}
			<top_wii_points> = qs(0xc4d5515e)
			<middle_wii_points> = qs(0xc4d5515e)
			<bottom_wii_points> = qs(0xc4d5515e)
		endif
		formatText TextName = wii_points_text qs(0x577d2b34) h = qs(0x6fc02f06) a = <top_wii_points> b = <middle_wii_points> c = <bottom_wii_points>
		formatText TextName = blocks_text qs(0x577d2b34) h = ($wii_dlc_blocks) a = <top_blocks> b = <middle_blocks> c = <bottom_blocks>
		dialog_box_desc_id :se_setprops {
			dlc_pin_dialog_alpha = 0
			dlog_body_alpha = 0
			dlc_confirm_download_dialog_alpha = 1
			dlog_vmenu_pos = (0.0, 20.0)
			label_column_text = ($wii_dlc_confirm_label_column_text)
			wii_points_column_text = <wii_points_text>
			blocks_column_text = <blocks_text>
		}
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_disclaimer_text}
			<resolved_id> :se_setprops text = ($ecommerce_messages.rvlec_message_0002_confirm_download)
		else
			ScriptAssert \{qs(0xab8e8d65)}
		endif
	endif
	if (<template> = standard)
		if GotParam \{error_code}
			<id> :se_setprops error_indicator_alpha = 1
			if (<error_code> && 1)
				<id> :se_setprops error_3_alpha = 1.0
			else
				<id> :se_setprops error_3_alpha = 0.0
			endif
			if (<error_code> && 2)
				<id> :se_setprops error_2_alpha = 1.0
			else
				<id> :se_setprops error_2_alpha = 0.0
			endif
			if (<error_code> && 4)
				<id> :se_setprops error_1_alpha = 1.0
			else
				<id> :se_setprops error_1_alpha = 0.0
			endif
			if (<error_code> && 8)
				<id> :se_setprops error_0_alpha = 1.0
			else
				<id> :se_setprops error_0_alpha = 0.0
			endif
		endif
	endif
	if (<template> = dlc_confirm)
		dialog_box_create_all_text heading_text = qs(0x12bbdbbd) <...>
	elseif (<template> = dlc_pin)
		dialog_box_create_all_text heading_text = qs(0xbc9d071e) <...>
	else
		dialog_box_create_all_text <...>
	endif
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
			height = `expand	dims`}
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
		<Scale> = 0.75
		<highlight_bar_scale> = (1.3, 1.0)
	elseif (<template> = dlc_confirm)
		<Scale> = 0.675
		<highlight_bar_scale> = (1.1700001, 0.9)
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
		update_net_controllers = <update_net_controllers>
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
	if (<template> = dlc_pin)
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_num_hmenu}
			AssignAlias id = <resolved_id> alias = dialog_box_vmenu
		else
			ScriptAssert \{qs(0x238c907f)}
		endif
		<event_handlers> = [
			{pad_up enter_parent_pin_change_character params = {up}}
			{pad_down enter_parent_pin_change_character params = {down}}
			{pad_choose parent_pin_advance_pointer}
			{pad_back parent_pin_retreat_pointer params = {back_button_script = <back_button_script>}}
			{pad_start confirm_parent_pin}
		]
		dialog_box_vmenu :se_setprops {
			exclusive_device = <player_device>
			event_handlers = <event_handlers>
		}
		parent_pin_make_helpers
		menu_epp_refresh_parent_pin
	endif
	dialog_box_create_menu_options <...>
	generic_barrel_menu_finish no_helper_pills = 1 index = <initial_focus_index>
	if (<template> = extended)
		dialog_box_desc_id :se_setprops \{dlog_body_fit_height = `expand	dims`}
	endif
	if (<template> = dlc_pin || <template> = dlc_confirm)
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		if NOT GotParam \{initial_focus_index}
			<initial_focus_index> = 0
		endif
		LaunchEvent \{Type = unfocus
			target = dialog_box_vmenu}
		LaunchEvent \{Type = focus
			target = dialog_box_vmenu}
	elseif GotParam \{no_focus}
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
		elseif GotParam \{player_device}
			if isps3
				if NOT IsArray <player_device>
					if NOT IsGuitarController controller = <player_device>
						<standard_button_flag> = {force_pad_button}
					endif
				endif
			endif
		endif
		add_user_control_helper text = qs(0xc18d5e76) button = green z = <helper_z_priority> <all_buttons_flag> <standard_button_flag>
		if GotParam \{back_button_script}
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = <helper_z_priority> <all_buttons_flag> <standard_button_flag>
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
		case trc
		return \{desc_type_text = 'dialog_box_standard'}
		case extended
		return \{desc_type_text = 'dialog_box_standard'}
		case fail_song
		return \{desc_type_text = 'dialog_box_alternate'}
		case dlc_pin
		case dlc_confirm
		return \{desc_type_text = 'dialog_box_wii_music_store'}
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
	if (<dlg_z_priority> > ($sys_fade_overlay_z_priority))
		printf \{'Disabling dialog box menu text shadow'}
		dialog_box_desc_id :SetProps \{dlog_heading_shadow_enabled = FALSE}
	endif
	if GotParam \{body_text}
		dialog_box_desc_id :SetProps {
			dlog_body_text = <body_text>
		}
	endif
	if GotParam \{fail_song_props}
		if ((<fail_song_props>.use_stars_fail_info) = 0)
			dialog_box_desc_id :SetProps {
				dlog_body_alpha = 0.0
				dlog_fail_song_info_alpha = 1.0
				dlog_fail_song_title_text = (<fail_song_props>.song_title)
				dlog_fail_song_section_text = (<fail_song_props>.section_name_text)
				dlog_fail_song_percent_text = (<fail_song_props>.percent_text)
				dlog_fail_song_difficulty_text = (<fail_song_props>.difficulty_text)
				net_host_wait_text_alpha = (<fail_song_props>.host_text_alpha)
			}
		else
			printstruct channel = zdebug <...>
			dialog_box_desc_id :SetProps {
				dlog_body_alpha = 0.0
				dlog_fail_song_info_alpha = 0.0
				dlog_fail_song_info_stars_cont_alpha = 1.0
				dlog_fail_song_title_text = (<fail_song_props>.song_title)
				dlog_fail_song_stars_text = (<fail_song_props>.num_stars_fail_info)
				dlog_fail_song_max_stars_text = (<fail_song_props>.max_stars_fail_info)
				dlog_fail_song_difficulty_text = (<fail_song_props>.difficulty_text)
				net_host_wait_text_alpha = (<fail_song_props>.host_text_alpha)
			}
		endif
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
			menurow_txt_item_dims = (860.0, 50.0)
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
			menurow_txt_item_dims = (860.0, 50.0)
			menurow_just = [center , center]
			extra_props = <extra_props>
			focus_script_params = <focus_script_params>
		}
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dialog_box_vmenu
	if NOT GotParam \{options}
		return
	endif
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
