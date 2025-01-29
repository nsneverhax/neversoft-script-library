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
	if IsPS3
		if ui_event_exists_in_stack \{name = 'savegame_boot_scan'}
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
	if ScreenElementExists \{id = dialog_box_container}
		DestroyScreenElement \{id = dialog_box_container}
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		id = dialog_box_container
		Pos = (0.0, 0.0)
		just = [left top]
	}
	dialog_box_get_desc_type_text template = <template>
	CreateScreenElement {
		parent = dialog_box_container
		id = dialog_box_desc_id
		type = DescInterface
		desc = <desc_type_text>
		z_priority = <dlg_z_priority>
		exclusive_device = <player_device>
		arrows_alpha = 0
	}
	if (<template> = standard)
		if GotParam \{error_code}
			<id> :SE_SetProps error_indicator_alpha = 1
			if <id> :Desc_ResolveAlias name = alias_error_indicator param = error_id
				<error_id> :Obj_SpawnScript ui_alphablast_lite
			else
			endif
			if (<error_code> && 1)
				<id> :SE_SetProps error_3_alpha = 1.0
			else
				<id> :SE_SetProps error_3_alpha = 0.5
			endif
			if (<error_code> && 2)
				<id> :SE_SetProps error_2_alpha = 1.0
			else
				<id> :SE_SetProps error_2_alpha = 0.5
			endif
			if (<error_code> && 4)
				<id> :SE_SetProps error_1_alpha = 1.0
			else
				<id> :SE_SetProps error_1_alpha = 0.5
			endif
			if (<error_code> && 8)
				<id> :SE_SetProps error_0_alpha = 1.0
			else
				<id> :SE_SetProps error_0_alpha = 0.5
			endif
		endif
	endif
	if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_speaker_r
			param = speaker_r_id}
		<speaker_r_id> :Obj_SpawnScript ui_frazzmatazz_03
	endif
	if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_bkg_anim
			param = bkg_id}
		<bkg_id> :Obj_SpawnScript ui_alphablast
	else
	endif
	if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_bkg_plain_anim
			param = bkg_plain_add_id}
		<bkg_plain_add_id> :Obj_SpawnScript ui_alphablast
	else
	endif
	if GotParam \{options}
		GetArraySize \{options}
		if (<array_size> > 2)
			dialog_box_desc_id :SE_SetProps \{arrows_alpha = 1}
		endif
		if (<array_size> < 3)
			if NOT dialog_box_desc_id :Desc_ResolveAlias \{name = alias_dlog_vmenu}
				ScriptAssert \{qs(0xf0bc810c)}
			endif
			if (<array_size> = 1)
				dialog_box_desc_id :SE_SetProps \{dlog_vmenu_scale = 1.5}
			else
				<resolved_id> :SE_SetProps event_handlers = ($g_dlg_event_handlers_options)
			endif
		else
			if NOT dialog_box_desc_id :Desc_ResolveAlias \{name = alias_dlog_vmenu_loop}
				ScriptAssert \{qs(0xf0bc810c)}
			endif
			<resolved_id> :SE_SetProps {
				event_handlers = [
					{pad_up ui_flash_scroll_arrow params = {desc_id = dialog_box_desc_id up}}
					{pad_up SmoothMenuScroll params = {Dir = -1 isVertical = true play_scroll_sound = 1}}
					{pad_down ui_flash_scroll_arrow params = {desc_id = dialog_box_desc_id down}}
					{pad_down SmoothMenuScroll params = {Dir = 1 isVertical = true play_scroll_sound = 1}}
					{pad_left ui_flash_scroll_arrow params = {desc_id = dialog_box_desc_id up}}
					{pad_left SmoothMenuScroll params = {Dir = -1 isVertical = true play_scroll_sound = 1}}
					{pad_right ui_flash_scroll_arrow params = {desc_id = dialog_box_desc_id down}}
					{pad_right SmoothMenuScroll params = {Dir = 1 isVertical = true play_scroll_sound = 1}}
				]
				tags = {
					smooth_morph_time = 0.1
					create_dummy_items = 1
				}
			}
		endif
		AssignAlias id = <resolved_id> alias = dlog_vmenu
		AssignAlias id = <resolved_id> alias = dialog_box_vmenu
		if GotParam \{allow_alternate_directional_events}
			dlog_vmenu :SE_SetProps allow_alternate_directional_events = <allow_alternate_directional_events>
		endif
	endif
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
		dialog_box_desc_id :SE_SetProps \{highlight_btn_alpha = 0.0
			dlog_body_no_options_alpha = 1.0
			dlog_body_alpha = 0.0}
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_generic_rounded_box_desc}
			<resolved_id> :SE_SetProps middle_dims = (687.0, 300.0) Pos = (0.0, -120.0)
		endif
		<id> :Obj_SpawnScript dialog_box_heading_fade
		return
	endif
	dialog_box_create_menu_options <...>
	if GotParam \{no_focus}
		LaunchEvent \{type = unfocus
			target = dlog_vmenu}
	else
		if (<array_size> <= 3)
			LaunchEvent type = focus target = dlog_vmenu data = {child_index = <initial_focus_index>}
		else
			LaunchEvent \{type = focus
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
			dlog_vmenu :SE_SetProps event_handlers = [{pad_back <back_button_script> params = {<back_button_params>}}]
			printf 'back_button_script = %s' s = <back_button_script>
			add_user_control_helper text = qs(0xaf4d5dd2) button = red z = <helper_z_priority> <all_buttons_flag>
		endif
	endif
	return \{menu_id = dlog_vmenu}
endscript

script dialog_box_alternate 
	<desc_type_text> = 'dialog_box_alternate'
	if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_speaker_r
			param = speaker_r_id}
		<speaker_r_id> :Obj_SpawnScript ui_failflicker
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
		case extended
		return \{desc_type_text = 'dialog_box_extended'}
		case fail_song
		return \{desc_type_text = 'dialog_box_alternate'}
		case musicstudio
		return \{desc_type_text = 'dialog_box_standard_musicstudio'}
	endswitch
endscript

script dialog_box_heading_fade 
	if Desc_ResolveAlias \{name = alias_dialog_text
			param = cont}
		wait \{2
			seconds}
		begin
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :SE_SetProps alpha = 0.5 time = 1.0 motion = ease_in
		<cont> :SE_WaitProps
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :SE_SetProps alpha = 1.0 time = 1.0 motion = ease_out
		<cont> :SE_WaitProps
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
			frame01_rgba = red_md
			frame02_rgba = red_md
			frame03_rgba = red_md
			bkg_anim_alpha = 1
			bkgd_alpha = 1
			practice_menu_elements_alpha = 0
			diamondBling_rgba = red_md
			diamondBling2_rgba = red_md
		}
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_diamondBling
				param = diamondBling_id}
			<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_crown params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = red_md}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_diamondBling2
				param = diamondBling2_id}
			<diamondBling2_id> :Obj_SpawnScript anim_bling_horizontal_crown params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = red_md}
		else
			ScriptAssert \{'ui_art'}
		endif
		dialog_box_desc_id :Obj_SpawnScript \{dialog_box_alternate}
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
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_speaker_r
				param = speaker_r_id}
			<speaker_r_id> :Obj_SpawnScript ui_frazzmatazz_03
		endif
		dialog_box_desc_id :SetProps \{practice_menu_elements_alpha = 1
			bkg_anim_alpha = 0}
		dialog_box_desc_id :SetProps \{frame01_rgba = [
				255
				255
				255
				255
			]
			frame02_rgba = [
				255
				255
				255
				255
			]
			frame03_rgba = [
				255
				255
				255
				255
			]}
		dialog_box_desc_id :SetProps \{dlog_heading_rgba = ntsc_white}
		dialog_box_desc_id :SetProps \{diamondBling_rgba = GH51_red_lt
			diamondBling2_rgba = GH51_red_lt}
		dialog_box_desc_id :SetProps \{bkg_anim_alpha = 0
			bkgd_alpha = 0
			practice_menu_elements_alpha = 1}
		dialog_box_desc_id :SetProps \{diamondBling_rgba = GH51_red_lt
			diamondBling2_rgba = GH51_red_lt}
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_diamondBling
				param = diamondBling_id}
			<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_crown params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = ntsc_white}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_diamondBling2
				param = diamondBling2_id}
			<diamondBling2_id> :Obj_SpawnScript anim_bling_horizontal_crown params = {minwidth = 25 maxwidth = 50 maxtime = 0.5 Color = ntsc_white}
		else
			ScriptAssert \{'ui_art'}
		endif
		if dialog_box_desc_id :Desc_ResolveAlias \{name = alias_bkg_plain_anim
				param = bkg_plain_add_id}
			<bkg_id> :Obj_SpawnScript ui_alphablast
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
	if (<array_size> > 2)
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
		if ((GotParam num_focusable_options) && (<num_focusable_options> = 1))
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
				type = DescInterface
				parent = <parent>
				desc = 'menurow_txt_desc'
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_A1
				menurow_txt_item_rgba = ($menu_unfocus_color)
				autoSizeDims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				not_focusable
			}
		else
			CreateScreenElement {
				type = DescInterface
				parent = <parent>
				desc = 'menurow_txt_desc'
				menurow_just = [center center]
				menurow_internal_just = [center center]
				menurow_txt_item_font = fontgrid_text_A1
				menurow_txt_item_rgba = ($menu_unfocus_color)
				autoSizeDims = true
				menurow_txt_item_text = (<option>.text)
				event_handlers = <event_handlers>
				menurow_txt_item_shadow_enabled = false
			}
		endif
	endif
endscript

script dialog_box_create_menu_options 
	<parent> = dlog_vmenu
	GetArraySize <options>
	<num_focusable_options> = 0
	<i> = 0
	begin
	if NOT StructureContains structure = (<options> [<i>]) not_focusable
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
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	text_item_font_swap id = <id> focus
	<id> :SE_GetParentID
	create_dummy_menu_items menu_id = <parent_id>
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
	text_item_font_swap id = <id> unfocus
endscript
