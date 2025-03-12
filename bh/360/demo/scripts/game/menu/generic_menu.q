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
	if NOT gotparam \{title}
		notitle = 1
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	update_ingame_controllers controller = <exclusive_device>
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = <desc>
		id = generic_menu
		exclusive_device = <exclusive_device>
		generic_menu_title_text_text = <title>
		generic_menu_bg_texture = <generic_menu_bg_texture>
		generic_menu_bg_dims = <generic_menu_bg_dims>
		pos = <pos>
		z_priority = <z_priority>
		0x7e9b9525 = <spacing_between>
	}
	if ui_event_exists_in_stack \{name = 'debug'}
		alias_name = 0x92a24386
	else
		alias_name = alias_generic_menu_vmenu
	endif
	if generic_menu :desc_resolvealias name = <alias_name> param = generic_smenu
		assignalias id = <generic_smenu> alias = current_menu
		if gotparam \{vmenu_id}
			assignalias id = <generic_smenu> alias = <vmenu_id>
		endif
		<generic_smenu> :settags {total_length = 0}
	else
		scriptassert \{qs(0x0c18c573)}
	endif
	if NOT gotparam \{no_up_down_sound_handlers}
		add_generic_menu_up_down_sound_handlers
	endif
	if gotparam \{pad_down_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if gotparam \{pad_up_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_start <pad_start_script> params = <pad_start_params>}
			]
		}
	endif
	if gotparam \{pad_option2_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_option2 <pad_back_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
		}
	endif
	if gotparam \{pad_option_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_option <pad_back_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
			]
		}
	endif
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	if gotparam \{nobg}
		generic_menu :se_setprops \{generic_menu_bg_alpha = 0}
	endif
	if gotparam \{notitle}
		generic_menu :se_setprops \{generic_menu_title_alpha = 0}
	elseif gotparam \{notitlebg}
		generic_menu :se_setprops \{generic_menu_title_bg_alpha = 0}
	endif
	if (<desc> = 'generic_menu')
		if screenelementexists \{id = generic_menu}
			if generic_menu :desc_resolvealias \{name = 0xea039265}
				if screenelementexists id = <resolved_id>
					<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.25 color = [128 128 200 200]}
				endif
			else
				softassert \{'UI_art: couldnt create songlist glitter. alias missing?'}
			endif
		endif
	endif
	return \{desc_id = generic_menu}
endscript

script destroy_generic_menu 
	if screenelementexists \{id = generic_menu}
		destroyscreenelement \{id = generic_menu}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script add_generic_menu_up_down_sound_handlers \{parent = current_menu}
	setscreenelementprops {
		id = <parent>
		event_handlers = [
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
	}
endscript

script add_generic_menu_text_item \{focus_script = focus_generic_menu_text_item
		unfocus_script = unfocus_generic_menu_text_item
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		ui_event_script = ui_event
		choose_state_event = menu_change
		font = fontgrid_text_a1
		internal_just = [
			left
			center
		]
		desc = 'generic_menu_text_item'
		rgba = gh51_purple_lt}
	if screenelementexists id = <parent>
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			scale = <scale>
			generic_menu_smenu_textitem_text_text = <text>
			generic_menu_smenu_textitem_text_font = <font>
			generic_menu_smenu_textitem_text_rgba = <rgba>
			generic_menu_smenu_textitem_text_dims = <dims>
			generic_menu_smenu_textitem_text_internal_just = <internal_just>
		}
	else
		scriptassert \{qs(0x2a39a91f)}
	endif
	if gotparam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = <choose_state_event> data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> font = <font> do_not_scroll = <do_not_scroll> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> font = <font> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
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
	if gotparam \{pad_left_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_left <pad_left_script> params = <pad_left_params>}
			]
		}
	endif
	if gotparam \{pad_right_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_right <pad_right_script> params = <pad_right_params>}
			]
		}
	endif
	if gotparam \{pad_square_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if gotparam \{not_focusable}
		if gotparam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		if gotparam \{not_focusable_rgba}
			rgba = <not_focusable_rgba>
		endif
		alpha = 1
		if gotparam \{0xb1402a27}
			alpha = <0xb1402a27>
		endif
		setscreenelementprops {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = <rgba> alpha = <alpha>
		}
	endif
	if gotparam \{heading}
		setscreenelementprops {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = [200 70 70 255]
		}
	endif
	if gotparam \{text_case}
		<id> :se_setprops generic_menu_smenu_textitem_text_textcase = <text_case>
	endif
	<parent> :gettags
	getscreenelementchildren id = <parent>
	getarraysize <children>
	if (<array_size> > 9)
		generic_menu :se_setprops \{scrollbar_alpha = 1.0}
	endif
	return item_container_id = <id>
endscript

script focus_generic_menu_text_item 
	if screenelementexists \{id = generic_menu}
		<id> :se_setprops generic_menu_smenu_textitem_text_rgba = ($uicolorref_palette.0x3638d08e.rgba)
		<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
		if NOT gotparam \{do_not_scroll}
			set_generic_menu_scrollbar_pos id = <id>
		endif
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_menu_text_item 
	<id> :se_setprops generic_menu_smenu_textitem_text_rgba = ($uicolorref_palette.gh51_purple_lt.rgba)
	<id> :se_setprops generic_menu_smenu_textitem_text_font = <font>
	<id> :se_setprops generic_menu_smenu_textitem_text_material = null
	if gotparam \{additional_unfocus_script}
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
	if screenelementexists id = <parent>
		createscreenelement {
			id = <id>
			type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			generic_menu_smenu_iconitem_text_text = <text>
			generic_menu_smenu_iconitem_icon_texture = <icon>
			generic_menu_smenu_iconitem_icon_rot_angle = <icon_rot>
			generic_menu_smenu_iconitem_icon_alpha = <icon_alpha>
			generic_menu_smenu_iconitem_icon_rgba = <icon_rgba>
			generic_menu_smenu_iconitem_text_font = <font>
			generic_menu_smenu_iconitem_text_rgba = <rgba>
		}
	else
		scriptassert \{qs(0x48e08831)}
	endif
	if gotparam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = <choose_state_event> data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> font = <font> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> font = <font> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
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
	if gotparam \{pad_square_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if gotparam \{not_focusable}
		if gotparam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		if gotparam \{not_focusable_rgba}
			rgba = <not_focusable_rgba>
		endif
		setscreenelementprops {
			id = <id>
			not_focusable
			generic_menu_smenu_iconitem_text_rgba = <rgba>
		}
	endif
	if gotparam \{text_case}
		<id> :se_setprops generic_menu_smenu_iconitem_text_textcase = <text_case>
	endif
	<parent> :gettags
	if gotparam \{total_length}
		getscreenelementdims id = <parent>
		parent_height = <height>
		getscreenelementdims id = <id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent> :settags {total_length = <total_length>}
	else
		getscreenelementdims id = <id>
		<parent> :settags {total_length = <height>}
	endif
	return item_container_id = <id>
endscript

script focus_generic_menu_icon_item 
	if screenelementexists id = <id>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($default_color_scheme).text_focus_color)
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 1 time = 0.1 anim = fast_in
		set_generic_menu_scrollbar_pos id = <id>
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script unfocus_generic_menu_icon_item 
	if screenelementexists id = <id>
		<id> :se_setprops generic_menu_smenu_iconitem_text_rgba = (($default_color_scheme).text_color)
		<id> :se_setprops generic_menu_smenu_iconitem_text_font = <font>
		<id> :se_setprops generic_menu_smenu_iconitem_highlight_alpha = 0 time = 0.5 anim = fast_in
	endif
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script set_generic_menu_scrollbar_pos \{id = generic_menu
		menu_id = current_menu}
	if screenelementexists id = <id>
		if screenelementexists id = <menu_id>
			set_generic_menu_scrollbar_worker desc_id = <id> <...>
		endif
	endif
endscript

script set_generic_menu_scrollbar_index \{desc_id = generic_menu}
	requireparams \{[
			vmenu
		]
		all}
	if NOT gotparam \{index}
		index = 0
	endif
	if screenelementexists id = <desc_id>
		set_generic_menu_scrollbar_worker menu_id = <vmenu> desc_id = <desc_id> <...>
	endif
endscript

script set_generic_menu_scrollbar_worker \{0xf6e0b026 = 464
		0x586dbcf2 = 0
		menu_id = current_menu}
	<menu_id> :gettags
	getscreenelementchildren id = <menu_id>
	getarraysize <children>
	<0xdbf7c6c0> = (1.0 * <tag_selected_index>)
	if (<array_size> > 1)
		scroll_perc = (<0xdbf7c6c0> / (<array_size> - 1))
	else
		scroll_perc = 0
	endif
	if (<0x586dbcf2> > <0xf6e0b026>)
		softassert \{qs(0x1b489582)}
	endif
	<0xf6e0b026> = (<0xf6e0b026> - <0x586dbcf2>)
	scroll_pos = (((<scroll_perc> * (<0xf6e0b026>)) * (0.0, 1.0)) + (<0x586dbcf2> * (0.0, 1.0)))
	<desc_id> :se_setprops scrollbar_thumb_pos = <scroll_pos> time = 0.08
endscript
generic_menu_block_input = 0

script generic_blocking_execute_script 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if ($generic_menu_block_input = 0)
		break
	endif
	wait \{1
		game
		frame}
	repeat
	if is_ui_event_running
		return \{false}
	endif
	<pad_script> <pad_params> device_num = <device_num>
	if gotparam \{additional_pad_script}
		<additional_pad_script> <additional_pad_params> device_num = <device_num>
	endif
endscript

script generic_menu_animate_in 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if screenelementexists \{id = generic_menu}
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
	if screenelementexists \{id = generic_menu}
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
	wait \{0.22
		seconds}
	if screenelementexists \{id = generic_menu}
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
	requireparams \{[
			parent
			text
		]
		all}
	createscreenelement {
		type = hmenu
		parent = <parent>
		<...>
	}
	menu_id = <id>
	stringtochararray string = <text>
	getarraysize <char_array>
	if (<array_size>)
		i = 0
		begin
		createscreenelement {
			type = textelement
			font = fontgrid_text_a3
			<text_params>
			parent = <menu_id>
			text = (<char_array> [<i>])
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
	getscreenelementchildren id = <menu_id>
	return {menu_id = <menu_id> text_element_array = <children> text_element_array_size = <array_size>}
endscript

script menu_finish controller = ($primary_controller)
	if NOT gotparam \{no_helper_text}
		if gotparam \{no_back_button}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
		elseif gotparam \{car_helper_text}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_back}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaf4d5dd2) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_cancel}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_extra}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0x3fc1c076) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_alt}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0xaa2546c1) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_swatches}
			add_user_control_helper controller = <controller> text = qs(0xc18d5e76) button = green z = 100000
			add_user_control_helper controller = <controller> text = qs(0xf7723015) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0x709f133c) button = yellow z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_helper_text_purchase}
			add_user_control_helper controller = <controller> text = qs(0x9b07ecb6) button = green z = 100000
			menu_finish_rotate_zoom <...>
		elseif gotparam \{car_rotate_zoom}
			menu_finish_rotate_zoom <...>
		else
		endif
	endif
endscript

script menu_finish_rotate_zoom 
	if NOT gotparam \{no_rotate_zoom_text}
		if ((isguitarcontroller controller = <controller>) || (isdrumcontroller controller = <controller>))
			if NOT gotparam \{no_rotate_text}
				add_user_control_helper controller = <controller> text = qs(0xe7d2a66e) button = blue z = 100000
			endif
			if NOT gotparam \{no_zoom_text}
				add_user_control_helper controller = <controller> text = qs(0x26950e02) button = orange z = 100000
			endif
		else
			if NOT gotparam \{no_rotate_text}
				add_user_control_helper controller = <controller> text = qs(0xe7d2a66e) button = lbrb z = 100000
			endif
			if NOT gotparam \{no_zoom_text}
				add_user_control_helper controller = <controller> text = qs(0x26950e02) button = rt z = 100000
			endif
		endif
	endif
endscript

script generic_ui_destroy \{parent_anchor = current_menu_anchor}
	cleanup_cas_menu_handlers
	if screenelementexists id = <parent_anchor>
		destroyscreenelement id = <parent_anchor>
	endif
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	clean_up_user_control_helpers
	destroy_generic_menu
endscript

script menu_force_kill_focus 
	obj_getid
	begin
	launchevent type = unfocus target = <objid>
	wait \{1
		gameframe}
	repeat <num_frames>
	launchevent type = focus target = <objid>
endscript
