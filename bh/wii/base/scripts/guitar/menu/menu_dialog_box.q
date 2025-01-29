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
	if ((isps3) || (isngc))
		if ui_event_exists_in_stack \{Name = 'savegame_boot_scan'}
			use_all_controllers = 1
		endif
	endif
	if NOT GotParam \{options}
		if (<template> = standard)
			<template> = no_options
		endif
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		player_device = ($menu_over_ride_exclusive_device)
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
	highlight_btn_pos = (-114.0, 74.0)
	CreateScreenElement {
		parent = dialog_box_container
		id = dialog_box_desc_id
		Type = descinterface
		desc = <desc_type_text>
		z_priority = <dlg_z_priority>
		exclusive_device = <player_device>
		arrows_alpha = 0
	}
	if (<template> = standard)
		if GotParam \{error_code}
			<id> :se_setprops error_indicator_alpha = 1
			if <id> :desc_resolvealias Name = alias_error_indicator param = 0x7c9f7728
				<0x7c9f7728> :obj_spawnscript 0x7d825c87
			else
			endif
			if (<error_code> && 1)
				<id> :se_setprops error_3_alpha = 1.0
			else
				<id> :se_setprops error_3_alpha = 0.5
			endif
			if (<error_code> && 2)
				<id> :se_setprops error_2_alpha = 1.0
			else
				<id> :se_setprops error_2_alpha = 0.5
			endif
			if (<error_code> && 4)
				<id> :se_setprops error_1_alpha = 1.0
			else
				<id> :se_setprops error_1_alpha = 0.5
			endif
			if (<error_code> && 8)
				<id> :se_setprops error_0_alpha = 1.0
			else
				<id> :se_setprops error_0_alpha = 0.5
			endif
		endif
	endif
	if (<template> = dlc_pin)
		dialog_box_desc_id :se_setprops \{dlc_confirm_download_dialog_alpha = 0
			dlc_pin_dialog_alpha = 1
			dlog_body_text = $wii_dlc_pin_entry_text}
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
		formatText TextName = wii_points_text qs(0x577d2b34) h = ($wii_dlc_wii_points) a = <top_wii_points> b = <middle_wii_points> c = <bottom_wii_points>
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
		highlight_btn_pos = (-114.0, 99.0)
	endif
	if dialog_box_desc_id :desc_resolvealias \{Name = 0x29901814
			param = 0xa59a3dfe}
		<0xa59a3dfe> :obj_spawnscript ui_frazzmatazz_03
	endif
	if dialog_box_desc_id :desc_resolvealias \{Name = alias_bkg_anim
			param = 0xda1265c9}
		<0xda1265c9> :obj_spawnscript ui_alphablast
	else
	endif
	if dialog_box_desc_id :desc_resolvealias \{Name = 0x451e1896
			param = 0xd446bf97}
		<0xd446bf97> :obj_spawnscript ui_alphablast
	else
	endif
	if GotParam \{options}
		GetArraySize \{options}
		if (<array_Size> > 2)
			dialog_box_desc_id :se_setprops \{arrows_alpha = 1}
		endif
		if (<array_Size> < 3)
			if NOT dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu}
				ScriptAssert \{qs(0xf0bc810c)}
			endif
			if (<array_Size> = 1)
				dialog_box_desc_id :se_setprops \{0x962e4d2c = 1.5}
			else
				<resolved_id> :se_setprops event_handlers = ($g_dlg_event_handlers_options)
			endif
		else
			if NOT dialog_box_desc_id :desc_resolvealias \{Name = 0xf6dace97}
				ScriptAssert \{qs(0xf0bc810c)}
			endif
			<resolved_id> :se_setprops {
				event_handlers = [
					{pad_up 0x0c5f870a params = {desc_id = dialog_box_desc_id up}}
					{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true play_scroll_sound = 1}}
					{pad_down 0x0c5f870a params = {desc_id = dialog_box_desc_id down}}
					{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true play_scroll_sound = 1}}
					{pad_left 0x0c5f870a params = {desc_id = dialog_box_desc_id up}}
					{pad_left smoothmenuscroll params = {Dir = -1 isvertical = true play_scroll_sound = 1}}
					{pad_right 0x0c5f870a params = {desc_id = dialog_box_desc_id down}}
					{pad_right smoothmenuscroll params = {Dir = 1 isvertical = true play_scroll_sound = 1}}
				]
				tags = {
					smooth_morph_time = 0.1
					0x86b76cb5 = 1
				}
			}
		endif
		AssignAlias id = <resolved_id> alias = dlog_vmenu
		AssignAlias id = <resolved_id> alias = dialog_box_vmenu
		if GotParam \{allow_alternate_directional_events}
			dlog_vmenu :se_setprops allow_alternate_directional_events = <allow_alternate_directional_events>
		endif
	elseif (<template> = dlc_pin)
		<target_alias> = alias_dlog_vmenu
		if (<template> = dlc_pin)
			<target_alias> = alias_num_hmenu
		endif
		if dialog_box_desc_id :desc_resolvealias Name = <target_alias>
			AssignAlias id = <resolved_id> alias = dialog_box_vmenu
			if (<template> = dlc_pin)
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
				clean_up_user_control_helpers
				parent_pin_make_helpers
				menu_epp_refresh_parent_pin
			endif
		endif
	endif
	if (<template> = dlc_confirm)
		dialog_box_create_all_text \{heading_text = qs(0x12bbdbbd)}
	elseif (<template> = dlc_pin)
		dialog_box_create_all_text \{heading_text = qs(0xbc9d071e)}
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
		dialog_box_desc_id :se_setprops \{highlight_btn_alpha = 0.0
			dlog_body_no_options_alpha = 1.0
			dlog_body_alpha = 0.0}
		if dialog_box_desc_id :desc_resolvealias \{Name = 0x461c5023}
			<resolved_id> :se_setprops middle_dims = (687.0, 300.0) Pos = (0.0, -120.0)
		endif
		<id> :obj_spawnscript dialog_box_heading_fade
		return
	endif
	dialog_box_create_menu_options <...>
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
		LaunchEvent Type = focus target = dialog_box_vmenu data = {child_index = <initial_focus_index>}
	elseif GotParam \{no_focus}
		LaunchEvent \{Type = unfocus
			target = dlog_vmenu}
	else
		if (<array_Size> <= 3)
			LaunchEvent Type = focus target = dlog_vmenu data = {child_index = <initial_focus_index>}
		else
			LaunchEvent \{Type = focus
				target = dlog_vmenu}
		endif
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
			dlog_vmenu :se_setprops event_handlers = [{pad_back <back_button_script> params = {<back_button_params>}}]
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = <helper_z_priority> <all_buttons_flag>
		endif
	endif
	return \{menu_id = dlog_vmenu}
endscript

script 0x06c3e566 
	<desc_type_text> = 'dialog_box_alternate'
	if dialog_box_desc_id :desc_resolvealias \{Name = 0x29901814
			param = 0xa59a3dfe}
		<0xa59a3dfe> :obj_spawnscript 0xbe23aff9
	else
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
		case trc
		return \{desc_type_text = 'dialog_box_standard'}
		case extended
		return \{desc_type_text = 'dialog_box_extended'}
		case fail_song
		return \{desc_type_text = 'dialog_box_alternate'}
		case musicstudio
		return \{desc_type_text = 'dialog_box_standard_musicstudio'}
		case dlc_pin
		case dlc_confirm
		return \{desc_type_text = 'dialog_box_wii_music_store'}
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
			0xd2df7831 = red_md
			0x544b0a9f = red_md
			0x9f17d93a = red_md
			0x791ad3bc = 1
			0x599ce9bc = 1
			0x465aad51 = 0
			0x2fc26910 = red_md
			0xe0374277 = red_md
		}
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = red_md}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_diamondbling2
				param = diamondbling2_id}
			<diamondbling2_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = red_md}
		else
			ScriptAssert \{'ui_art'}
		endif
		dialog_box_desc_id :obj_spawnscript \{0x06c3e566}
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
		if dialog_box_desc_id :desc_resolvealias \{Name = 0x29901814
				param = 0xa59a3dfe}
			<0xa59a3dfe> :obj_spawnscript ui_frazzmatazz_03
		endif
		dialog_box_desc_id :SetProps \{0x465aad51 = 1
			0x791ad3bc = 0}
		dialog_box_desc_id :SetProps \{0xd2df7831 = [
				255
				255
				255
				255
			]
			0x544b0a9f = [
				255
				255
				255
				255
			]
			0x9f17d93a = [
				255
				255
				255
				255
			]}
		dialog_box_desc_id :SetProps \{dlog_heading_rgba = ntsc_white}
		dialog_box_desc_id :SetProps \{0x2fc26910 = 0x8d470aac
			0xe0374277 = 0x8d470aac}
		dialog_box_desc_id :SetProps \{0x791ad3bc = 0
			0x599ce9bc = 0
			0x465aad51 = 1}
		dialog_box_desc_id :SetProps \{0x2fc26910 = 0x8d470aac
			0xe0374277 = 0x8d470aac}
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = ntsc_white}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = alias_diamondbling2
				param = diamondbling2_id}
			<diamondbling2_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = ntsc_white}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{Name = 0x451e1896
				param = 0xd446bf97}
			<0xda1265c9> :obj_spawnscript ui_alphablast
		else
		endif
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
	0x8797cd0d = 1.2
	0xb1bb68ad = 'menurow_txt_desc'
	0xc0805554 = ($menu_unfocus_color)
	if (<array_Size> > 2)
		if StructureContains structure = <option> not_focusable
			add_generic_barrel_menu_text_item {
				text = (<option>.text)
				parent = <parent>
				pad_choose_script = (<option>.func)
				pad_choose_params = <func_params>
				pad_choose_sound = <sound_func>
				not_focusable
				menurow_txt_item_dims = (610.0, 50.0)
				menurow_just = [center center]
				menurow_internal_just = [center center]
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		else
			add_generic_barrel_menu_text_item {
				text = (<option>.text)
				parent = <parent>
				pad_choose_script = (<option>.func)
				pad_choose_params = <func_params>
				pad_choose_sound = <sound_func>
				menurow_txt_item_dims = (610.0, 50.0)
				menurow_just = [center center]
				menurow_internal_just = [center center]
				extra_props = <extra_props>
				focus_script_params = <focus_script_params>
			}
		endif
	else
		Shadow = FALSE
		if (<dlg_z_priority> > 1000)
			Shadow = FALSE
		endif
		shrink_scale = 1.0
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
				<unfocus_params> = {}
			elseif (<template> = dlc_confirm)
				if (<index> = 0)
					<focus_params> = {hl_pos = (8.0, 125.0)}
				else
					<focus_params> = {hl_pos = (8.0, 175.0)}
				endif
				<unfocus_params> = {}
			elseif (<template> = trc)
				if (<index> = 0)
					<focus_params> = {hl_pos = (-114.0, 74.0)}
				else
					<focus_params> = {hl_pos = (-114.0, 124.0)}
				endif
				if Spanish
					<0x8797cd0d> = 0.94
				endif
				if English
					<0x8797cd0d> = 1.05
				endif
				<unfocus_params> = {shrink_scale = 1.1}
				shrink_scale = 1.1
				Shadow = true
				0xb1bb68ad = 'menurow_trc_txt_desc'
				dialog_box_desc_id :se_setprops \{0xbdf18424 = (87.0, 364.0)
					0x5f3391e7 = (1205.0, 364.0)}
			else
				if (<index> = 0)
					<focus_params> = {hl_pos = (-114.0, 74.0)}
				else
					<focus_params> = {hl_pos = (-114.0, 124.0)}
				endif
				<unfocus_params> = {}
			endif
		else
			<focus_params> = {}
			<unfocus_params> = {}
		endif
		if (<array_Size> = 1)
			<unfocus_script> = nullscript
		else
			<unfocus_script> = generic_barrel_menu_item_unfocus
		endif
		if ((GotParam num_focusable_options) && (<num_focusable_options> = 1))
			event_handlers = [
				{focus generic_barrel_menu_item_focus params = {Scale = <0x8797cd0d>}}
				{unfocus <unfocus_script> params = <unfocus_params>}
				{pad_choose <sound_func>}
				{pad_choose (<option>.func) params = <func_params>}
			]
		else
			event_handlers = [
				{focus generic_barrel_menu_item_focus params = {Scale = <0x8797cd0d>}}
				{unfocus <unfocus_script> params = <unfocus_params>}
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
				desc = <0xb1bb68ad>
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = <0xc0805554>
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = <Shadow>
				not_focusable
			}
		elseif StructureContains structure = <option> not_focusable_hack
			CreateScreenElement {
				Type = descinterface
				parent = <parent>
				desc = <0xb1bb68ad>
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = <0xc0805554>
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = <Shadow>
				not_focusable
			}
		elseif StructureContains structure = <option> id
			CreateScreenElement {
				Type = descinterface
				id = (<option>.id)
				parent = <parent>
				desc = <0xb1bb68ad>
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = <0xc0805554>
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = <Shadow>
			}
			(<option>.id) :se_setprops {
				menurow_scale = <shrink_scale>
			}
		else
			CreateScreenElement {
				Type = descinterface
				parent = <parent>
				desc = <0xb1bb68ad>
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = <0xc0805554>
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = <Shadow>
			}
		endif
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dlog_vmenu
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
		grow_scale = 1.0}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	0x0cf62187 id = <id> focus
	<id> :se_getparentid
	0xe846fb2d menu_id = <parent_id>
	if NOT GotParam \{dont_move_highlight}
		if GotParam \{hl_pos}
			dialog_box_desc_id :SetProps {
				highlight_btn_pos = <hl_pos>
			}
		endif
		dialog_box_desc_id :SetProps {
			highlight_btn_pos = <hl_pos>
		}
	endif
endscript

script dialog_box_unfocus \{time = 0.05
		shrink_scale = 1.0}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	0x0cf62187 id = <id> unfocus
endscript
