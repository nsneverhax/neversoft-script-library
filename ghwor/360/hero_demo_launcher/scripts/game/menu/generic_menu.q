menu_history_icon_container_dim = (300.0, 100.0)
menu_history_icon_size = 128

script make_generic_menu {
		pad_back_sound = generic_menu_pad_back_sound
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_generic_menu
	if NOT gotparam \{title}
		notitle = 1
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	update_ingame_controllers controller = <exclusive_device>
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'generic_menu'
		id = generic_menu
		exclusive_device = <exclusive_device>
		generic_menu_title_text_text = <title>
		generic_menu_bg_texture = <generic_menu_bg_texture>
		generic_menu_bg_dims = <generic_menu_bg_dims>
		pos = <pos>
	}
	bx_createhighlightstars \{parent = generic_menu}
	if generic_menu :desc_resolvealias \{name = alias_generic_menu_vmenu
			param = generic_smenu}
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
	if gotparam \{show_history}
		generic_menu :se_setprops \{generic_menu_title_text_pos = {
				(0.0, 0.0)
				relative
			}}
		generic_menu :se_setprops \{generic_menu_title_hist_alpha = 1}
		generic_menu :se_setprops \{generic_menu_title_icon_alpha = 1}
		ui_event_get_stack
		getarraysize <stack>
		if (<array_size> > 0)
			if gotparam \{hist_tex}
				generic_menu :se_setprops generic_menu_title_icon_texture = <hist_tex>
			else
				if structurecontains structure = (<stack> [0]) hist_tex
					generic_menu :se_setprops generic_menu_title_icon_texture = (<stack> [0].hist_tex)
				endif
			endif
		endif
		if NOT gotparam \{num_icons}
			num_icons = 3
		else
			if (<num_icons> > 3)
				num_icons = 3
			elseif (<num_icons> < 0)
				num_icons = 0
			endif
		endif
		if NOT (<num_icons> = 0)
			generic_menu :se_setprops \{generic_menu_title_bg_texture = generic_title_bg_icons}
		endif
		if (<num_icons> = 0)
			generic_menu :se_setprops \{generic_menu_title_hist_icon_1_alpha = 0}
			generic_menu :se_setprops \{generic_menu_title_hist_icon_2_alpha = 0}
			generic_menu :se_setprops \{generic_menu_title_hist_icon_3_alpha = 0}
		elseif (<array_size> > 0)
			i = 1
			begin
			if NOT (<i> > (<array_size> -1))
				if (<i> > <num_icons>)
					formattext checksumname = icon_id 'generic_menu_title_hist_icon_%i_alpha' i = <i>
					addparam name = <icon_id> structure_name = alpha_struct value = 0
					generic_menu :se_setprops <alpha_struct>
				else
					if structurecontains structure = (<stack> [<i>]) hist_tex
						formattext checksumname = icon_id 'generic_menu_title_hist_icon_%i_texture' i = <i>
						addparam name = <icon_id> structure_name = text_struct value = (<stack> [<i>].hist_tex)
						generic_menu :se_setprops <text_struct>
					endif
				endif
			endif
			i = (<i> + 1)
			repeat 3
		endif
	endif
endscript

script car_skull_eye_anim 
endscript

script destroy_generic_menu 
	if screenelementexists \{id = generic_menu}
		destroyscreenelement \{id = generic_menu}
	endif
	killspawnedscript \{name = car_skull_eye_anim}
	cleanup_cas_menu_handlers
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script add_generic_menu_up_down_sound_handlers 
	setscreenelementprops \{id = current_menu
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up = 1
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down = 2
				}
			}
		]}
endscript

script add_generic_menu_text_item \{focus_script = focus_generic_menu_text_item
		unfocus_script = unfocus_generic_menu_text_item
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		internal_just = [
			center
			center
		]
		fit_width = `expand dims`
		text_dims = (10.0, 50.0)
		forceautoscale = false}
	if screenelementexists id = <parent>
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = 'generic_menu_text_item'
			autosizedims = true
			generic_menu_smenu_textitem_text_text = <text>
			generic_menu_smenu_textitem_text_internal_just = <internal_just>
			generic_menu_smenu_textitem_text_fit_width = <fit_width>
			generic_menu_smenu_textitem_text_dims = <text_dims>
		}
		if <id> :desc_resolvealias name = alias_generic_menu_smenu_textitem_text
			<id> :settags {text_id = <resolved_id>}
		endif
		<id> :se_getprops
		width = (<generic_menu_smenu_textitem_text_dims> [0])
		height = (<generic_menu_smenu_textitem_text_dims> [1])
		if gotparam \{fix_width_for_cheats}
			bx_resizetextforcheats id = <id> width = <width> height = <height>
		else
			if (<width> > 340)
				if (<forceautoscale> = true)
					<id> :se_setprops {
						generic_menu_smenu_textitem_text_dims = (((0.0, 1.0) * <height>) + (400.0, 0.0))
						generic_menu_smenu_textitem_text_fit_width = `scale each line if larger`
						generic_menu_smenu_textitem_text_fit_height = `scale to fit`
					}
				else
					if (<width> > 550)
						<id> :se_setprops {
							generic_menu_smenu_textitem_text_dims = (((0.0, 1.5) * <height>) + (300.0, 0.0))
							generic_menu_smenu_textitem_text_fit_width = wrap
							generic_menu_smenu_textitem_text_fit_height = `scale to fit`
							generic_menu_smenu_textitem_text_pos = (<generic_menu_smenu_textitem_text_pos> + (0.0, 13.0))
							autosizedims = false
							dims = (<dims> + (0.0, 13.0))
						}
					else
						<id> :se_setprops {
							generic_menu_smenu_textitem_text_dims = (((0.0, 1.0) * <height>) + (340.0, 0.0))
							generic_menu_smenu_textitem_text_fit_width = `scale each line if larger`
							generic_menu_smenu_textitem_text_fit_height = `scale to fit`
						}
					endif
				endif
			endif
		endif
	else
		scriptassert \{qs(0x2a39a91f)}
	endif
	if gotparam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> do_not_scroll = <do_not_scroll> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound>}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
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
		rgba = (($g_menu_colors).menu_gold)
		font = fontgrid_bordello
		setscreenelementprops {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = <rgba>
			generic_menu_smenu_textitem_text_font = <font>
		}
	endif
	if gotparam \{heading}
		setscreenelementprops {
			id = <id>
			not_focusable
			generic_menu_smenu_textitem_text_rgba = (($g_menu_colors).menu_white)
			generic_menu_smenu_textitem_text_font = fontgrid_denim_title
		}
	endif
	if gotparam \{text_case}
		<id> :se_setprops generic_menu_smenu_textitem_text_textcase = <text_case>
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

script focus_generic_menu_text_item 
	if screenelementexists \{id = generic_menu}
		obj_getid
		gettags
		bx_genericmenu_updatescrollbar bx_scrollbar_index = <bx_scrollbar_index>
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
	if screenelementexists \{id = layers_list_focus}
		highlightstars :se_setprops \{alpha = 0}
	else
		se_setprops generic_menu_smenu_textitem_text_rgba = (($g_menu_colors).menu_title)
		wait \{1
			gameframe}
		bx_focushighlightstarson_genericmenu objid = <objid>
	endif
endscript

script generic_menu_highlight_motion 
	if generic_menu :desc_resolvealias \{name = alias_highlight}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = false
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = false
			endif
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript

script unfocus_generic_menu_text_item 
	se_setprops generic_menu_smenu_textitem_text_rgba = (($g_menu_colors).menu_gold)
	highlightstars :se_setprops \{alpha = 0}
	gettags
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script add_generic_menu_icon_item \{focus_script = focus_generic_menu_icon_item
		unfocus_script = unfocus_generic_menu_icon_item
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		ui_event_script = ui_event}
	if screenelementexists id = <parent>
		createscreenelement {
			id = <id>
			type = descinterface
			parent = <parent>
			desc = 'generic_menu_icon_item'
			autosizedims = true
			generic_menu_smenu_iconitem_text_text = <text>
			generic_menu_smenu_iconitem_icon_texture = <icon>
			generic_menu_smenu_iconitem_icon_rot_angle = <icon_rot>
		}
		if <id> :desc_resolvealias name = alias_generic_menu_smenu_iconitem_text
			<id> :settags {text_id = <resolved_id>}
			if gotparam \{text_dims}
				bx_resizetextfield {
					id = <resolved_id>
					dims = <text_dims>
					fit_width = `scale each line if larger`
				}
			endif
		endif
	else
		scriptassert \{qs(0x2a39a91f)}
	endif
	if gotparam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
		]
	}
	if gotparam \{pad_choose_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound>}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
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
			rgba = [110 100 90 175]
		endif
		<i> = 0
		begin
		clrval = (<rgba> [<i>] * 0.5)
		casttointeger \{clrval}
		setarrayelement arrayname = rgba index = <i> newvalue = <clrval>
		<i> = (<i> + 1)
		repeat 3
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
	if screenelementexists \{id = generic_menu}
		obj_getid
		gettags
		bx_genericmenu_updatescrollbar bx_scrollbar_index = <bx_scrollbar_index>
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
	wait \{1
		gameframe}
	se_setprops generic_menu_smenu_iconitem_text_rgba = (($g_menu_colors).menu_title)
	gettags
	bx_focushighlightstarson_genericmenu objid = <text_id>
endscript

script unfocus_generic_menu_icon_item 
	se_setprops generic_menu_smenu_iconitem_text_rgba = (($g_menu_colors).menu_gold)
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script set_generic_menu_scrollbar_pos 
	if screenelementexists \{id = generic_menu}
		getscreenelementposition id = <id>
		<id> :se_getparentid
		<parent_id> :gettags
		if gotparam \{total_length}
			set_generic_menu_scrollbar_worker <...>
		endif
	endif
endscript

script set_generic_menu_scrollbar_index 
	requireparams \{[
			vmenu
		]
		all}
	if NOT gotparam \{index}
		index = 0
	endif
	if screenelementexists \{id = generic_menu}
		getscreenelementchildren id = <vmenu>
		getarraysize <children>
		if (<index> < <array_size>)
			if screenelementexists id = (<children> [<index>])
				getscreenelementposition id = (<children> [<index>])
				<vmenu> :gettags
				if gotparam \{total_length}
					set_generic_menu_scrollbar_worker <...>
				endif
			endif
		endif
	endif
endscript

script set_generic_menu_scrollbar_worker 
	if (<total_length> = 0)
		return
	endif
	scroll_perc = ((<screenelementpos>.(0.0, 1.0)) / <total_length>)
	scroll_len = 419
	scroll_pos = ((((<scroll_perc> * <scroll_len>)) * (0.0, 1.0)) + (-17.0, 0.0))
	generic_menu :se_setprops generic_menu_scrollbar_thumb_blue_pos = <scroll_pos>
endscript
generic_menu_block_input = 0

script generic_blocking_execute_script 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if ($generic_menu_block_input = 0)
		break
	endif
	if (<pad_script> = reset_physique_to_default || <pad_script> = restore_group_defaults)
		return
	endif
	wait \{1
		game
		frame}
	repeat
	if is_ui_event_running
		return \{false}
	endif
	<pad_script> <pad_params> device_num = <device_num>
endscript

script generic_menu_block_inputs_spawned \{time = 30}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if screenelementexists \{id = generic_menu}
		setscreenelementprops \{id = generic_menu
			block_events}
		wait <time> gameframe
		setscreenelementprops \{id = generic_menu
			unblock_events}
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

script bx_genericmenu_setupscrollbar \{default_index = 0}
	if generic_menu :desc_resolvealias \{name = alias_generic_menu_scrollbar}
		scrollbar_id = <resolved_id>
		generic_menu :settags scrollbar_id = <scrollbar_id>
		if generic_menu :desc_resolvealias \{name = alias_generic_menu_scrollbar_thumb}
			scrollbar_thumb_id = <resolved_id>
			if gotparam \{initial_alpha}
				init_alpha = {initial_alpha = <initial_alpha>}
			else
				init_alpha = {}
			endif
			if gotparam \{no_update}
				dont_update = {no_update}
			else
				dont_update = {}
			endif
			bx_setupscrollbar {
				id = <scrollbar_id>
				thumb_top_pos = (-16.5, -26.0)
				thumb_bottom_pos = (-16.5, 322.0)
				thumb_id = <scrollbar_thumb_id>
				num_items = <num_items>
				default_index = <default_index>
				<init_alpha>
				<dont_update>
			}
		endif
	endif
endscript

script bx_genericmenu_updatescrollbar 
	generic_menu :getsingletag \{scrollbar_id}
	if gotparam \{scrollbar_id}
		bx_updatescrollbar id = <scrollbar_id> bx_scrollbar_index = <bx_scrollbar_index>
	endif
endscript

script bx_setupscrollbar \{default_index = 0}
	if gotparam \{initial_alpha}
		<id> :se_setprops alpha = <initial_alpha>
	endif
	<id> :settags {
		thumb_top_pos = <thumb_top_pos>
		thumb_bottom_pos = <thumb_bottom_pos>
		thumb_id = <thumb_id>
		num_items = (<num_items> - 1.0)
	}
	if NOT gotparam \{no_update}
		bx_updatescrollbar id = <id> bx_scrollbar_index = <default_index>
	endif
endscript

script bx_updatescrollbar 
	<id> :gettags
	if (<num_items> = 0)
		factor = 0.0
	else
		factor = (<bx_scrollbar_index> / <num_items>)
	endif
	new_pos = (((<thumb_bottom_pos> - <thumb_top_pos>) * <factor>) + <thumb_top_pos>)
	<thumb_id> :se_setprops pos = <new_pos>
endscript

script bx_refreshmenuitemsindexes 
	num_items = 0
	if screenelementexists id = <vmenu_id>
		if getscreenelementchildren id = <vmenu_id>
			getarraysize \{name = children}
			i = 0
			focusable_child_index = 0
			begin
			if NOT (<children> [<i>]) :getsingletag tag_not_focusable
				(<children> [<i>]) :settags bx_scrollbar_index = <focusable_child_index>
				<focusable_child_index> = (<focusable_child_index> + 1)
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			<num_items> = <focusable_child_index>
		endif
		if gotparam \{scrollbar_id}
			printf \{channel = ggl
				qs(0x438799c7)}
			<scrollbar_id> :settags num_items = <num_items>
		endif
	endif
	return num_items = <num_items>
endscript
