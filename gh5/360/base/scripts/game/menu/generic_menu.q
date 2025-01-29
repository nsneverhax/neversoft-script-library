menu_history_icon_container_dim = (300.0, 100.0)
menu_history_icon_size = 128

script make_generic_menu {
		pad_back_sound = generic_menu_pad_back_sound
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
		z_priority = 1.0
		desc = 'generic_menu'
	}
	destroy_generic_menu
	if NOT GotParam \{title}
		notitle = 1
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	update_ingame_controllers controller = <exclusive_device>
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = <desc>
		id = generic_menu
		exclusive_device = <exclusive_device>
		generic_menu_title_text_text = <title>
		generic_menu_bg_texture = <generic_menu_bg_texture>
		generic_menu_bg_dims = <generic_menu_bg_dims>
		Pos = <Pos>
		z_priority = <z_priority>
	}
	if generic_menu :desc_resolvealias \{Name = alias_generic_menu_vmenu
			param = generic_smenu}
		AssignAlias id = <generic_smenu> alias = current_menu
		if GotParam \{vmenu_id}
			AssignAlias id = <generic_smenu> alias = <vmenu_id>
		endif
		<generic_smenu> :SetTags {total_length = 0}
	else
		ScriptAssert \{qs(0x0c18c573)}
	endif
	if NOT GotParam \{no_up_down_sound_handlers}
		add_generic_menu_up_down_sound_handlers
	endif
	if GotParam \{pad_down_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_start <pad_start_script> params = <pad_start_params>}
			]
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option2 <pad_back_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option <pad_back_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	if GotParam \{nobg}
		generic_menu :se_setprops \{generic_menu_bg_alpha = 0}
	endif
	if GotParam \{notitle}
		generic_menu :se_setprops \{generic_menu_title_alpha = 0}
	elseif GotParam \{notitlebg}
		generic_menu :se_setprops \{generic_menu_title_bg_alpha = 0}
	endif
	return \{desc_id = generic_menu}
endscript

script destroy_generic_menu 
	if ScreenElementExists \{id = generic_menu}
		DestroyScreenElement \{id = generic_menu}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script add_generic_menu_up_down_sound_handlers \{parent = current_menu}
	SetScreenElementProps {
		id = <parent>
		event_handlers = [
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
	}
endscript

script add_generic_menu_text_item {
		focus_script = focus_generic_menu_text_item
		unfocus_script = unfocus_generic_menu_text_item
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		ui_event_script = ui_event
		choose_state_event = menu_change
		font = fontgrid_title_a1
		rgba = (($default_color_scheme).text_color)
		dims = (365.0, 35.0)
		internal_just = [left , center]
		desc = 'generic_menu_text_item'
	}
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			generic_menu_smenu_textitem_text_text = <text>
			generic_menu_smenu_textitem_text_font = <font>
			generic_menu_smenu_textitem_text_rgba = <rgba>
			generic_menu_smenu_textitem_text_dims = <dims>
			generic_menu_smenu_textitem_text_internal_just = <internal_just>
		}
	else
		ScriptAssert \{qs(0x2a39a91f)}
	endif
	if GotParam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = <choose_state_event> data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> font = <font> do_not_scroll = <do_not_scroll> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> font = <font> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound>}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script>
						additional_pad_script = <additional_choose_script>
						pad_params = {container_id = <id> <pad_choose_params>}
						additional_pad_params = {container_id = <id> <additional_choose_params>}}}
			]
		}
	endif
	if GotParam \{pad_left_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_left <pad_left_script> params = <pad_left_params>}
			]
		}
	endif
	if GotParam \{pad_right_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_right <pad_right_script> params = <pad_right_params>}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		if GotParam \{not_focusable_rgba}
			rgba = <not_focusable_rgba>
		endif
		<i> = 0
		begin
		clrval = (<rgba> [<i>] * 0.5)
		CastToInteger \{clrval}
		SetArrayElement ArrayName = rgba index = <i> NewValue = <clrval>
		<i> = (<i> + 1)
		repeat 3
		SetScreenElementProps {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = <rgba>
		}
	endif
	if GotParam \{heading}
		SetScreenElementProps {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = [200 70 70 255]
		}
	endif
	if GotParam \{text_case}
		<id> :se_setprops generic_menu_smenu_textitem_text_textcase = <text_case>
	endif
	<parent> :GetTags
	if GotParam \{total_length}
		GetScreenElementDims id = <parent>
		parent_height = <height>
		GetScreenElementDims id = <id>
		total_length = (<total_length> + <height>)
		if ((<total_length> + 40) > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent> :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims id = <id>
		<parent> :SetTags {total_length = <height>}
	endif
	return item_container_id = <id>
endscript

script focus_generic_menu_text_item 
	if ScreenElementExists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = (($default_color_scheme).text_focus_color)
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		if NOT GotParam \{do_not_scroll}
			set_generic_menu_scrollbar_pos id = <id>
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = (($default_color_scheme).text_color)
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	<id> :se_setprops generic_menu_smenu_textitem_text_material = NULL
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_menu_icon_item {
		focus_script = focus_generic_menu_icon_item
		unfocus_script = unfocus_generic_menu_icon_item
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		ui_event_script = ui_event
		choose_state_event = menu_change
		font = fontgrid_text_a1
		rgba = (($default_color_scheme).text_color)
		dims = (260.0, 35.0)
		icon_alpha = 1.0
		icon_rgba = [255 255 255 255]
		desc = 'generic_menu_icon_item'
	}
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			id = <id>
			Type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			generic_menu_smenu_iconitem_text_text = <text>
			generic_menu_smenu_iconitem_icon_texture = <icon>
			generic_menu_smenu_iconitem_icon_rot_angle = <icon_rot>
			generic_menu_smenu_iconitem_icon_alpha = <icon_alpha>
			generic_menu_smenu_iconitem_icon_rgba = <icon_rgba>
			generic_menu_smenu_iconitem_text_dims = <dims>
			generic_menu_smenu_iconitem_text_font = <font>
			generic_menu_smenu_iconitem_text_rgba = <rgba>
		}
	else
		ScriptAssert \{qs(0x48e08831)}
	endif
	if GotParam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = <choose_state_event> data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> font = <font> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> font = <font> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound>}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script>
						additional_pad_script = <additional_choose_script>
						pad_params = {container_id = <id> <pad_choose_params>}
						additional_pad_params = {container_id = <id> <additional_choose_params>}}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		if GotParam \{not_focusable_rgba}
			rgba = <not_focusable_rgba>
		endif
		<i> = 0
		begin
		clrval = (<rgba> [<i>] * 0.5)
		CastToInteger \{clrval}
		SetArrayElement ArrayName = rgba index = <i> NewValue = <clrval>
		<i> = (<i> + 1)
		repeat 3
		SetScreenElementProps {
			id = <id>
			not_focusable
			generic_menu_smenu_iconitem_text_rgba = <rgba>
		}
	endif
	if GotParam \{text_case}
		<id> :se_setprops generic_menu_smenu_iconitem_text_textcase = <text_case>
	endif
	<parent> :GetTags
	if GotParam \{total_length}
		GetScreenElementDims id = <parent>
		parent_height = <height>
		GetScreenElementDims id = <id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent> :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims id = <id>
		<parent> :SetTags {total_length = <height>}
	endif
	return item_container_id = <id>
endscript

script focus_generic_menu_icon_item 
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($default_color_scheme).text_focus_color)
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 1 time = 0.1 anim = fast_in
		set_generic_menu_scrollbar_pos id = <id>
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_menu_icon_item 
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($default_color_scheme).text_color)
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 0 time = 0.5 anim = fast_in
	endif
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script set_generic_menu_scrollbar_pos 
	if ScreenElementExists \{id = generic_menu}
		GetScreenElementPosition id = <id>
		<id> :se_getparentid
		<parent_id> :GetTags
		if GotParam \{total_length}
			set_generic_menu_scrollbar_worker <...>
		endif
	endif
endscript

script set_generic_menu_scrollbar_index 
	RequireParams \{[
			VMenu
		]
		all}
	if NOT GotParam \{index}
		index = 0
	endif
	if ScreenElementExists \{id = generic_menu}
		GetScreenElementChildren id = <VMenu>
		GetArraySize <children>
		if (<index> < <array_Size>)
			if ScreenElementExists id = (<children> [<index>])
				GetScreenElementPosition id = (<children> [<index>])
				<VMenu> :GetTags
				if GotParam \{total_length}
					set_generic_menu_scrollbar_worker <...>
				endif
			endif
		endif
	endif
endscript

script set_generic_menu_scrollbar_worker 
	scroll_perc = ((<screenelementpos>.(0.0, 1.0)) / <total_length>)
	scroll_len = 418
	scroll_pos = (((<scroll_perc> * <scroll_len>) * (0.0, 1.0)) + (-20.0, -13.0))
	generic_menu :se_setprops generic_menu_scrollbar_thumb_blue_pos = <scroll_pos>
endscript
generic_menu_block_input = 0

script generic_blocking_execute_script 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($generic_menu_block_input = 0)
		break
	endif
	Wait \{1
		game
		Frame}
	repeat
	if is_ui_event_running
		return \{FALSE}
	endif
	<pad_script> <pad_params> device_num = <device_num>
	if GotParam \{additional_pad_script}
		<additional_pad_script> <additional_pad_params> device_num = <device_num>
	endif
endscript

script generic_menu_animate_in 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = generic_menu}
		generic_menu :se_setprops \{generic_menu_anchor_pos = {
				relative
				(0.0, -1000.0)
			}
			generic_menu_title_pos = {
				relative
				(-500.0, -100.0)
			}}
	else
		return
	endif
	if ScreenElementExists \{id = generic_menu}
		generic_menu :se_setprops \{generic_menu_anchor_pos = {
				relative
				(0.0, 1020.0)
			}
			generic_menu_title_pos = {
				relative
				(500.0, 100.0)
			}
			time = 0.2}
	else
		return
	endif
	Wait \{0.22
		Seconds}
	if ScreenElementExists \{id = generic_menu}
		generic_menu :se_setprops \{generic_menu_anchor_pos = {
				relative
				(0.0, -20.0)
			}
			time = 0.1}
	else
		return
	endif
endscript

script split_text_into_menu 
	RequireParams \{[
			parent
			text
		]
		all}
	CreateScreenElement {
		Type = HMenu
		parent = <parent>
		<...>
	}
	menu_id = <id>
	StringToCharArray string = <text>
	GetArraySize <char_array>
	if (<array_Size>)
		i = 0
		begin
		CreateScreenElement {
			Type = TextElement
			font = fontgrid_text_a3
			<text_params>
			parent = <menu_id>
			text = (<char_array> [<i>])
		}
		i = (<i> + 1)
		repeat <array_Size>
	endif
	GetScreenElementChildren id = <menu_id>
	return {menu_id = <menu_id> text_element_array = <children> text_element_array_size = <array_Size>}
endscript

script menu_finish controller = ($primary_controller)
	if NOT GotParam \{no_helper_text}
		if GotParam \{no_back_button}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
		elseif GotParam \{car_helper_text}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_back}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_cancel}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_extra}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0x3fc1c076) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_alt}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaa2546c1) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_swatches}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0x709f133c) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_helper_text_purchase}
			add_user_control_helper controller = <controller> text = qs(0x9b07ecb6) button = green z = 100000
			menu_finish_rotate_zoom <...>
		elseif GotParam \{car_rotate_zoom}
			menu_finish_rotate_zoom <...>
		else
		endif
	endif
endscript

script menu_finish_rotate_zoom 
	if NOT GotParam \{no_rotate_zoom_text}
		if ((IsGuitarController controller = <controller>) || (isdrumcontroller controller = <controller>))
			if NOT GotParam \{no_rotate_text}
				add_user_control_helper controller = <controller> text = qs(0xe7d2a66e) button = blue z = 100000
			endif
			if NOT GotParam \{no_zoom_text}
				add_user_control_helper controller = <controller> text = qs(0x26950e02) button = orange z = 100000
			endif
		else
			if NOT GotParam \{no_rotate_text}
				add_user_control_helper controller = <controller> text = qs(0xe7d2a66e) button = lbrb z = 100000
			endif
			if NOT GotParam \{no_zoom_text}
				add_user_control_helper controller = <controller> text = qs(0x26950e02) button = rt z = 100000
			endif
		endif
	endif
endscript

script generic_ui_destroy \{parent_anchor = current_menu_anchor}
	cleanup_cas_menu_handlers
	if ScreenElementExists id = <parent_anchor>
		DestroyScreenElement id = <parent_anchor>
	endif
	if ScreenElementExists \{id = helper_text_anchor}
		DestroyScreenElement \{id = helper_text_anchor}
	endif
	clean_up_user_control_helpers
	destroy_generic_menu
endscript

script menu_force_kill_focus 
	Obj_GetID
	begin
	LaunchEvent Type = unfocus target = <objID>
	Wait \{1
		gameframe}
	repeat <num_frames>
	LaunchEvent Type = focus target = <objID>
endscript
