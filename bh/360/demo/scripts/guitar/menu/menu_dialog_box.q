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
	if gotparam \{on_destroy_script}
		change on_destroy_dialog_box = <on_destroy_script>
		change on_destroy_dialog_box_params = <on_destroy_script_params>
	else
		change \{on_destroy_dialog_box = null_script}
		change \{on_destroy_dialog_box_params = {
			}}
	endif
	if isps3
		if ui_event_exists_in_stack \{name = 'savegame_boot_scan'}
			use_all_controllers = 1
		endif
	endif
	if NOT gotparam \{options}
		if (<template> = standard)
			<template> = no_options
		endif
	endif
	if gotparam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
	endif
	if screenelementexists \{id = dialog_box_container}
		destroyscreenelement \{id = dialog_box_container}
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = dialog_box_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	dialog_box_get_desc_type_text template = <template>
	createscreenelement {
		parent = dialog_box_container
		id = dialog_box_desc_id
		type = descinterface
		desc = <desc_type_text>
		z_priority = <dlg_z_priority>
		exclusive_device = <player_device>
		arrows_alpha = 0
	}
	if (<template> = standard)
		if gotparam \{error_code}
			<id> :se_setprops error_indicator_alpha = 1
			if <id> :desc_resolvealias name = alias_error_indicator param = 0x7c9f7728
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
	if dialog_box_desc_id :desc_resolvealias \{name = 0x29901814
			param = 0xa59a3dfe}
		<0xa59a3dfe> :obj_spawnscript ui_frazzmatazz_03
	endif
	if dialog_box_desc_id :desc_resolvealias \{name = alias_bkg_anim
			param = 0xda1265c9}
		<0xda1265c9> :obj_spawnscript ui_alphablast
	else
	endif
	if dialog_box_desc_id :desc_resolvealias \{name = 0x451e1896
			param = 0xd446bf97}
		<0xd446bf97> :obj_spawnscript ui_alphablast
	else
	endif
	if gotparam \{options}
		getarraysize \{options}
		if (<array_size> > 2)
			dialog_box_desc_id :se_setprops \{arrows_alpha = 1}
		endif
		if (<array_size> < 3)
			if NOT dialog_box_desc_id :desc_resolvealias \{name = alias_dlog_vmenu}
				scriptassert \{qs(0xf0bc810c)}
			endif
			if (<array_size> = 1)
				dialog_box_desc_id :se_setprops \{0x962e4d2c = 1.5}
			else
				<resolved_id> :se_setprops event_handlers = ($g_dlg_event_handlers_options)
			endif
		else
			if NOT dialog_box_desc_id :desc_resolvealias \{name = 0xf6dace97}
				scriptassert \{qs(0xf0bc810c)}
			endif
			<resolved_id> :se_setprops {
				event_handlers = [
					{pad_up 0x0c5f870a params = {desc_id = dialog_box_desc_id up}}
					{pad_up smoothmenuscroll params = {dir = -1 isvertical = true play_scroll_sound = 1}}
					{pad_down 0x0c5f870a params = {desc_id = dialog_box_desc_id down}}
					{pad_down smoothmenuscroll params = {dir = 1 isvertical = true play_scroll_sound = 1}}
					{pad_left 0x0c5f870a params = {desc_id = dialog_box_desc_id up}}
					{pad_left smoothmenuscroll params = {dir = -1 isvertical = true play_scroll_sound = 1}}
					{pad_right 0x0c5f870a params = {desc_id = dialog_box_desc_id down}}
					{pad_right smoothmenuscroll params = {dir = 1 isvertical = true play_scroll_sound = 1}}
				]
				tags = {
					smooth_morph_time = 0.1
					0x86b76cb5 = 1
				}
			}
		endif
		assignalias id = <resolved_id> alias = dlog_vmenu
		assignalias id = <resolved_id> alias = dialog_box_vmenu
		if gotparam \{allow_alternate_directional_events}
			dlog_vmenu :se_setprops allow_alternate_directional_events = <allow_alternate_directional_events>
		endif
	endif
	dialog_box_create_all_text <...>
	if NOT gotparam \{dont_remove_helpers}
		clean_up_user_control_helpers
	endif
	if (<template> = no_options)
		if NOT gotparam \{no_helpers}
			if NOT gotparam \{no_controller_helper}
				if gotparam \{player_device}
					add_gamertag_helper exclusive_device = <player_device>
				endif
			endif
		endif
		dialog_box_desc_id :se_setprops \{highlight_btn_alpha = 0.0
			dlog_body_no_options_alpha = 1.0
			dlog_body_alpha = 0.0}
		if dialog_box_desc_id :desc_resolvealias \{name = 0x461c5023}
			<resolved_id> :se_setprops middle_dims = (687.0, 300.0) pos = (0.0, -120.0)
		endif
		<id> :obj_spawnscript dialog_box_heading_fade
		return
	endif
	dialog_box_create_menu_options <...>
	if gotparam \{no_focus}
		launchevent \{type = unfocus
			target = dlog_vmenu}
	else
		if (<array_size> <= 3)
			launchevent type = focus target = dlog_vmenu data = {child_index = <initial_focus_index>}
		else
			launchevent \{type = focus
				target = dlog_vmenu}
		endif
	endif
	if NOT gotparam \{no_helpers}
		helper_z_priority = (<dlg_z_priority> + 1000)
		if NOT gotparam \{no_controller_helper}
			if gotparam \{player_device}
				add_gamertag_helper exclusive_device = <player_device> z = <helper_z_priority>
			endif
		endif
		if gotparam \{use_all_controllers}
			all_buttons_flag = {all_buttons}
		endif
		add_user_control_helper text = qs(0xc18d5e76) button = green z = <helper_z_priority> <all_buttons_flag>
		if gotparam \{back_button_script}
			dlog_vmenu :se_setprops event_handlers = [{pad_back <back_button_script> params = {<back_button_params>}}]
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = <helper_z_priority> <all_buttons_flag>
		endif
	endif
	return \{menu_id = dlog_vmenu}
endscript

script 0x06c3e566 
	<desc_type_text> = 'dialog_box_alternate'
	if dialog_box_desc_id :desc_resolvealias \{name = 0x29901814
			param = 0xa59a3dfe}
		<0xa59a3dfe> :obj_spawnscript 0xbe23aff9
	else
	endif
endscript

script destroy_dialog_box 
	if (($on_destroy_dialog_box) != null_script)
		($on_destroy_dialog_box) ($on_destroy_dialog_box_params)
		change \{on_destroy_dialog_box = null_script}
	endif
	if NOT gotparam \{dont_remove_helpers}
		clean_up_user_control_helpers
	endif
	destroyscreenelement \{id = dialog_box_desc_id}
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
	if desc_resolvealias \{name = alias_dialog_text
			param = cont}
		wait \{2
			seconds}
		begin
		if NOT screenelementexists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 0.5 time = 1.0 motion = ease_in
		<cont> :se_waitprops
		if NOT screenelementexists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 1.0 time = 1.0 motion = ease_out
		<cont> :se_waitprops
		repeat
	endif
endscript

script dialog_box_create_all_text \{heading_text = qs(0xaa163738)}
	dialog_box_desc_id :setprops {
		dlog_heading_text = <heading_text>
	}
	if gotparam \{body_text}
		dialog_box_desc_id :setprops {
			dlog_body_text = <body_text>
		}
	endif
	if gotparam \{fail_song_props}
		dialog_box_desc_id :setprops {
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
		if dialog_box_desc_id :desc_resolvealias \{name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 color = red_md}
		else
			scriptassert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{name = alias_diamondbling2
				param = diamondbling2_id}
			<diamondbling2_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 color = red_md}
		else
			scriptassert \{'ui_art'}
		endif
		dialog_box_desc_id :obj_spawnscript \{0x06c3e566}
	endif
	if gotparam \{fail_song_props_prac}
		dialog_box_desc_id :setprops \{dlog_fail_song_info_prac_alpha = 1
			dlog_fail_song_info_alpha = 0}
		dialog_box_desc_id :setprops {
			dlog_fail_song_title_text = (<fail_song_props_prac>.song_title)
		}
		dialog_box_desc_id :setprops {
			dlog_fail_song_percent_prac_text = (<fail_song_props_prac>.percent_text)
		}
		dialog_box_desc_id :setprops {
			dlog_fail_song_difficulty_prac_text = (<fail_song_props_prac>.difficulty_text)
		}
		if dialog_box_desc_id :desc_resolvealias \{name = 0x29901814
				param = 0xa59a3dfe}
			<0xa59a3dfe> :obj_spawnscript ui_frazzmatazz_03
		endif
		dialog_box_desc_id :setprops \{0x465aad51 = 1
			0x791ad3bc = 0}
		dialog_box_desc_id :setprops \{0xd2df7831 = [
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
		dialog_box_desc_id :setprops \{dlog_heading_rgba = ntsc_white}
		dialog_box_desc_id :setprops \{0x2fc26910 = 0x8d470aac
			0xe0374277 = 0x8d470aac}
		dialog_box_desc_id :setprops \{0x791ad3bc = 0
			0x599ce9bc = 0
			0x465aad51 = 1}
		dialog_box_desc_id :setprops \{0x2fc26910 = 0x8d470aac
			0xe0374277 = 0x8d470aac}
		if dialog_box_desc_id :desc_resolvealias \{name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 color = ntsc_white}
		else
			scriptassert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{name = alias_diamondbling2
				param = diamondbling2_id}
			<diamondbling2_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 color = ntsc_white}
		else
			scriptassert \{'ui_art'}
		endif
		if dialog_box_desc_id :desc_resolvealias \{name = 0x451e1896
				param = 0xd446bf97}
			<0xda1265c9> :obj_spawnscript ui_alphablast
		else
		endif
	endif
endscript

script dialog_box_create_menu_option_singular 
	if structurecontains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if structurecontains structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if structurecontains structure = <option> no_sound
		sound_func = nullscript
	endif
	if structurecontains structure = <option> screenelementprops
		extra_props = (<option>.screenelementprops)
	endif
	if structurecontains structure = <option> focus_script_params
		focus_script_params = (<option>.focus_script_params)
	endif
	set_unfocus_color
	if (<array_size> > 2)
		if structurecontains structure = <option> not_focusable
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
		shadow = true
		if (<dlg_z_priority> > 1000)
			shadow = false
		endif
		if (<array_size> = 2)
			if (<template> = extended)
				if (<index> = 0)
					<focus_params> = {hl_pos = (-114.0, 124.0)}
				else
					<focus_params> = {hl_pos = (-114.0, 174.0)}
				endif
				shadow = false
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
		if (<array_size> = 1)
			<unfocus_script> = nullscript
		else
			<unfocus_script> = generic_barrel_menu_item_unfocus
		endif
		if ((gotparam num_focusable_options) && (<num_focusable_options> = 1))
			event_handlers = [
				{focus generic_barrel_menu_item_focus params = {scale = 1.2}}
				{unfocus <unfocus_script>}
				{pad_choose <sound_func>}
				{pad_choose (<option>.func) params = <func_params>}
			]
		else
			event_handlers = [
				{focus generic_barrel_menu_item_focus params = {scale = 1.2}}
				{unfocus <unfocus_script>}
				{pad_choose <sound_func>}
				{pad_choose (<option>.func) params = <func_params>}
			]
		endif
		if gotparam \{back_button_script}
			<event> = {pad_back generic_menu_pad_choose_sound}
			addarrayelement array = <event_handlers> element = <event>
			if gotparam \{back_button_params}
				<event> = {pad_back <back_button_script> params = {<back_button_params>}}
			else
				<event> = {pad_back <back_button_script>}
			endif
			addarrayelement array = <event_handlers> element = <event>
			<event_handlers> = <array>
		endif
		if structurecontains structure = <option> not_focusable
			createscreenelement {
				type = descinterface
				parent = <parent>
				desc = 'menurow_txt_desc'
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = ($menu_unfocus_color)
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				not_focusable
			}
		else
			createscreenelement {
				type = descinterface
				parent = <parent>
				desc = 'menurow_txt_desc'
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_a1
				menurow_txt_item_rgba = ($menu_unfocus_color)
				autosizedims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = false
			}
		endif
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dlog_vmenu
	getarraysize <options>
	<num_focusable_options> = 0
	<i> = 0
	begin
	if NOT structurecontains structure = (<options> [<i>]) not_focusable
		<num_focusable_options> = (<num_focusable_options> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	<i> = 0
	begin
	dialog_box_create_menu_option_singular {
		option = (<options> [<i>])
		z = <z>
		num_options = <array_size>
		parent = <parent>
		template = <template>
		array_size = <array_size>
		index = <i>
		num_focusable_options = <num_focusable_options>
		back_button_script = <back_button_script>
		back_button_params = <back_button_params>
		dlg_z_priority = <dlg_z_priority>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script dialog_box_focus \{time = 0.05
		grow_scale = 1.0}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	0x0cf62187 id = <id> focus
	<id> :se_getparentid
	0xe846fb2d menu_id = <parent_id>
	if NOT gotparam \{dont_move_highlight}
		dialog_box_desc_id :setprops {
			highlight_btn_pos = <hl_pos>
		}
	endif
endscript

script dialog_box_unfocus \{time = 0.05}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	0x0cf62187 id = <id> unfocus
endscript
