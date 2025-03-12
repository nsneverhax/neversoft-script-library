
script make_generic_barrel_menu {
		pad_back_sound = generic_menu_pad_back_sound
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
		x_dims = 1024
		parent = root_window
		scale = 1.0
		centered = 0
		max_expansion = 5
		no_highlight_bar
		internal_just = [center center]
		allow_wrap = true
		loop_view = true
		loop_center = true
		0x72d0c24f = 100
		spacing_between = -50
	}
	destroy_generic_barrel_menu
	if NOT gotparam \{title}
		no_title = 1
	endif
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if (<pad_back_script> = nullscript)
		pad_back_sound = nullscript
	endif
	update_ingame_controllers controller = <exclusive_device>
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if gotparam \{use_original_barrel}
		<desc> = 'generic_barrel_menu'
	else
		<desc> = 'generic_barrel_menu_2'
	endif
	createscreenelement {
		type = descinterface
		parent = <parent>
		desc = <desc>
		id = generic_barrel_menu
		exclusive_device = <exclusive_device>
		0x72d0c24f = ((<0x72d0c24f> * (0.0, 1.0)) + (1000.0, 110.0))
		pos = <pos>
		scale = <scale>
		0x14b698d9 = <internal_just>
		just = [center center]
		0xb674f6cb = <spacing_between>
		tags = {
			exclusive_device = <exclusive_device>
		}
	}
	if gotparam \{z_priority}
		<id> :se_setprops z_priority = <z_priority>
	endif
	if NOT gotparam \{use_original_barrel}
		if gotparam \{texture}
			<id> :se_setprops {
				bg_texture = <texture>
				bg_alpha = 1
			}
		else
			<id> :se_setprops {
				bg_alpha = 0
			}
		endif
		if gotparam \{no_highlight_bar}
			highlight_btn_alpha = 0
		elseif (<max_expansion> < 3)
			highlight_btn_alpha = 0
		else
			highlight_btn_alpha = 0.3
		endif
		<id> :se_setprops {
			highlight_btn_alpha = <highlight_btn_alpha>
		}
		if ((<max_expansion> = 3) || (<max_expansion> = 4))
			<id> :se_getprops highlight_btn_pos
			if gotparam \{highlight_btn_pos}
				<id> :se_setprops {
					highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 39.0)))
				}
			endif
		endif
		generic_barrel_menu_setup_physics_elements screen_id = <id>
	else
		generic_barrel_menu :settags \{use_original_barrel = 1}
	endif
	if (<centered> = 1)
		<id> :se_getprops highlight_btn_pos
		if gotparam \{highlight_btn_pos}
			<id> :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * ((<highlight_btn_pos> [0]) + 25.0)) + ((0.0, 1.0) * (<highlight_btn_pos> [1])))
			}
		endif
		generic_barrel_menu :se_setprops \{generic_barrel_menu_internal_just = [
				center
				center
			]}
	endif
	<id> :settags {
		x_dims = <x_dims>
		max_expansion = <max_expansion>
	}
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_vmenu}
		assignalias id = <resolved_id> alias = generic_barrel_vmenu
		if gotparam \{vmenu_id}
			assignalias id = <resolved_id> alias = <vmenu_id>
		endif
		if (<centered> = 1)
			generic_barrel_vmenu :se_setprops \{internal_just = [
					center
					center
				]}
			generic_barrel_vmenu :settags \{centered = 1}
		else
			generic_barrel_vmenu :settags \{centered = 0}
		endif
		generic_barrel_vmenu :se_setprops {
			allow_wrap = <allow_wrap>
			loop_view = <loop_view>
			loop_center = <loop_center>
		}
		<event_handlers> = [
			{pad_up generic_barrel_menu_pad_up}
			{pad_down generic_barrel_menu_pad_down}
		]
		generic_barrel_vmenu :settags \{total_length = 0
			smooth_morph_time = 0.1}
		generic_barrel_vmenu :se_setprops {
			event_handlers = <event_handlers>
			tags = {
				0xcd40a8a2 = (-5.0, 0.0)
			}
		}
	else
		scriptassert \{qs(0x091f75b4)}
	endif
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_up_arrow}
		assignalias id = <resolved_id> alias = generic_barrel_menu_up_arrow
	else
		scriptassert \{qs(0x091f75b4)}
	endif
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_menu_down_arrow}
		assignalias id = <resolved_id> alias = generic_barrel_menu_down_arrow
	else
		scriptassert \{qs(0x091f75b4)}
	endif
	if NOT gotparam \{no_up_down_sound_handlers}
		add_generic_menu_up_down_sound_handlers \{parent = generic_barrel_vmenu}
	endif
	if gotparam \{pad_start_script}
		<event_handlers> = [
			{pad_start <pad_start_script> params = <pad_start_params>}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_option2_script}
		<event_handlers> = [
			{pad_option2 <pad_back_sound>}
			{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_option_script}
		<event_handlers> = [
			{pad_option <pad_back_sound>}
			{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_back_script}
		<event_handlers> = [
			{pad_back <pad_back_sound>}
			{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers> replace_handlers
	endif
	if generic_barrel_menu :desc_resolvealias \{name = alias_generic_barrel_vmenu}
		assignalias id = <resolved_id> alias = generic_barrel_vmenu
		if gotparam \{vmenu_id}
			assignalias id = <resolved_id> alias = <vmenu_id>
		endif
	endif
	if gotparam \{no_title}
		generic_barrel_menu :se_setprops \{generic_barrel_menu_title_alpha = 0}
	endif
	return \{desc_id = generic_barrel_menu
		vmenu_id = generic_barrel_vmenu}
endscript

script generic_barrel_menu_set_max_expansion 
	requireparams \{[
			max_expansion
		]
		all}
	if screenelementexists \{id = generic_barrel_menu}
		if ((<max_expansion> = 3) || (<max_expansion> = 4))
			generic_barrel_menu :se_getprops \{highlight_btn_pos}
			if gotparam \{highlight_btn_pos}
				generic_barrel_menu :se_setprops {
					highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 39.0)))
				}
			endif
		endif
		generic_barrel_menu :settags {
			max_expansion = <max_expansion>
		}
	endif
endscript

script generic_barrel_menu_finish \{no_helper_pills = 0
		index = 0}
	if (<no_helper_pills> = 0)
		menu_finish
	endif
	generic_barrel_menu :gettags
	if NOT isarray \{exclusive_device}
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	getscreenelementchildren \{id = generic_barrel_vmenu}
	if NOT gotparam \{children}
		return
	endif
	getarraysize <children>
	switch <array_size>
		case 1
		generic_barrel_menu_up_arrow :se_setprops \{alpha = 0.0}
		generic_barrel_menu_down_arrow :se_setprops \{alpha = 0.0}
		generic_barrel_vmenu :se_setprops \{loop_view = false
			loop_center = false}
		generic_barrel_vmenu :settags \{smooth_morph_time = 0.0}
		generic_barrel_menu :settags \{max_expansion = 1
			hl_index = 0}
		generic_barrel_menu :se_getprops \{highlight_btn_pos}
		if gotparam \{highlight_btn_pos}
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 76.0)))
			}
		endif
		case 2
		generic_barrel_vmenu :se_setprops \{loop_view = false
			loop_center = false}
		generic_barrel_vmenu :settags \{smooth_morph_time = 0.0}
		generic_barrel_menu :settags \{max_expansion = 2
			hl_index = 0}
		if (<index> = 1)
			generic_barrel_menu_hilight_toggle
		endif
		generic_barrel_menu :se_getprops \{highlight_btn_pos}
		if gotparam \{highlight_btn_pos}
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 76.0)))
			}
		endif
		default
		if gotparam \{use_original_barrel}
			<offset_5> = (0.0, 245.0)
			<offset_3> = (0.0, 142.0)
		else
			<offset_5> = (0.0, 200.0)
			<offset_3> = (0.0, 123.0)
		endif
	endswitch
	<i> = 0
	begin
	generic_barrel_menu_item_unfocus id = (<children> [<i>]) time = 0.0
	<i> = (<i> + 1)
	repeat <array_size>
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	generic_barrel_menu_item_focus id = (<children> [<index>]) time = 0.0
	launchevent \{type = unfocus
		target = generic_barrel_vmenu}
	launchevent type = focus target = generic_barrel_vmenu data = {child_index = <index>}
endscript

script destroy_generic_barrel_menu 
	if screenelementexists \{id = generic_barrel_menu}
		destroyscreenelement \{id = generic_barrel_menu}
	endif
	clean_up_user_control_helpers
	change \{g_num_menu_items_with_icon = 0}
endscript

script clear_out_generic_barrel_menu 
	destroyscreenelement \{id = generic_barrel_vmenu
		preserve_parent}
endscript

script hide_generic_barrel_menu 
	generic_barrel_menu :se_setprops \{alpha = 0.0}
endscript

script unhide_generic_barrel_menu 
	generic_barrel_menu :se_setprops \{alpha = 1.0}
endscript

script add_generic_barrel_menu_text_item {
		focus_script = generic_barrel_menu_item_focus
		focus_script_params = {}
		unfocus_script = generic_barrel_menu_item_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = generic_barrel_vmenu
		extra_props = {}
		rgba = ($menu_unfocus_color)
		menurow_just = [right center]
		menurow_internal_just = [right center]
		font = fontgrid_text_a1
		scale = 1.0
	}
	if screenelementexists id = <parent>
		<parent> :getsingletag centered
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			autosizedims = true
			0x8ea77628 = (250.0, -2.0)
			menurow_txt_item_text = <text>
			menurow_txt_item_font = <font>
			menurow_txt_item_rgba = <rgba>
			menurow_txt_item_dims = <dims>
			menurow_just = <menurow_just>
			menurow_internal_just = <menurow_internal_just>
		}
	else
		scriptassert \{qs(0x2b8c76bc)}
	endif
	if gotparam \{0xa3721c47}
		<id> :se_setprops menurow_txt_item_rgba = ($0x24ff60ab)
		<id> :settags 0xa3721c47 = 1
		removeparameter \{choose_state}
		pad_choose_script = soundevent
		pad_choose_params = {event = menu_warning_sfx}
		helper_text = qs(0xff643d8e)
	else
		if gotparam \{not_focusable}
			if gotparam \{header_text}
				rgba = (($g_menu_colors).menu_subhead)
			else
				rgba = 0x77457656
			endif
			<id> :se_setprops not_focusable menurow_txt_item_rgba = <rgba> alpha = 0.125
			<id> :settags not_focusable = 1
			return item_container_id = <id>
		endif
	endif
	if gotparam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	if gotparam \{pad_back_script}
		<event_handlers> = [
			{pad_back <pad_back_script>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	<id> :settags helper_text = <helper_text>
	<event_handlers> = [
		{focus <focus_script> params = {id = <id> <focus_script_params> do_not_scroll = <do_not_scroll> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
		{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
	]
	<id> :se_setprops event_handlers = <event_handlers>
	if gotparam \{pad_choose_script}
		<event_handlers> = [
			{pad_choose <pad_choose_sound>}
			{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
		]
		if gotparam \{dont_force_quit}
			if (<dont_force_quit> = 0)
				<another_choose> = {pad_choose goal_pause_tool_destroy_menu}
				addarrayelement array = <event_handlers> element = <another_choose>
				<event_handlers> = <array>
			endif
		endif
		<id> :se_setprops event_handlers = <event_handlers>
	elseif gotparam \{dont_force_quit}
		<event_handlers> = [
			{pad_choose goal_pause_tool_destroy_menu}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_left_script}
		<event_handlers> = [
			{pad_left <pad_left_script> params = <pad_left_params>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_right_script}
		<event_handlers> = [
			{pad_right <pad_right_script> params = <pad_right_params>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_square_script}
		<event_handlers> = [
			{pad_square <pad_choose_sound>}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_start_script}
		event_handlers = [
			{pad_start <pad_choose_sound>}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{heading}
		<id> :se_setprops not_focusable menurow_txt_item_rgba = [200 70 70 255]
	endif
	return item_container_id = <id>
endscript
g_num_menu_items_with_icon = 0

script add_generic_barrel_menu_icon_item {
		focus_script = generic_barrel_menu_item_focus
		focus_script_params = {}
		unfocus_script = generic_barrel_menu_item_unfocus
		pad_choose_sound = ui_menu_select_sfx
		text_unfocus_color = ($menu_unfocus_color)
		parent = current_menu
		ui_event_script = ui_event
		icon_first = 1
		scale = 1.0
	}
	formattext \{checksumname = menurow_ico_item
		'menurow_ico_item_%i'
		i = $g_num_menu_items_with_icon}
	change g_num_menu_items_with_icon = ($g_num_menu_items_with_icon + 1)
	if (<icon_first> = 1)
		<desc> = 'menurow_ico_txt_desc'
	else
		<desc> = 'menurow_txt_ico_desc'
	endif
	if screenelementexists id = <parent>
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			menurow_txt_item_text = <text>
			menurow_txt_item_font = <font>
			menurow_txt_item_rgba = <text_unfocus_color>
			menurow_just = <menurow_just>
			menurow_internal_just = <menurow_internal_just>
			menurow_ico_item_texture = <icon>
			menurow_txt_item_internal_just = <menurow_txt_item_internal_just>
			tags = {
				focus_color = <text_focus_color>
				unfocus_color = <text_unfocus_color>
			}
		}
		text_element = <id>
		<id> :se_setprops {
			menurow_ico_item_dims = <icon_dims>
			menurow_txt_item_font = ($0x3c5111c2)
			menurow_txt_item_rgba = <text_unfocus_color>
			time = 0
		}
	else
		scriptassert \{qs(0x49555792)}
	endif
	if gotparam \{0xa3721c47}
		<id> :se_setprops menurow_txt_item_rgba = ($0x24ff60ab)
		<id> :settags 0xa3721c47 = 1
		removeparameter \{choose_state}
		pad_choose_script = soundevent
		pad_choose_params = {event = menu_warning_sfx}
		helper_text = qs(0xff643d8e)
	else
		if gotparam \{not_focusable}
			if gotparam \{header_text}
				rgba = (($g_menu_colors).menu_subhead)
			else
				rgba = 0x77457656
			endif
			<id> :se_setprops not_focusable menurow_txt_item_rgba = <rgba> alpha = 0.125
			<id> :settags not_focusable = 1
			return item_container_id = <id>
		endif
	endif
	<id> :settags helper_text = <helper_text>
	if gotparam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id> icon_id = <menurow_ico_item>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	if gotparam \{pad_back_script}
		<event_handlers> = [
			{pad_back <pad_back_script>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	<event_handlers> = [
		{focus <focus_script> params = {id = <id> <focus_script_params> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
		{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
	]
	<id> :se_setprops event_handlers = <event_handlers>
	if gotparam \{pad_choose_script}
		<event_handlers> = [
			{pad_choose <pad_choose_sound>}
			{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params> icon_id = <menurow_ico_item>}}}
		]
		if gotparam \{dont_force_quit}
			if (<dont_force_quit> = 0)
				<another_choose> = {pad_choose goal_pause_tool_destroy_menu}
				addarrayelement array = <event_handlers> element = <another_choose>
				<event_handlers> = <array>
			endif
		endif
		<id> :se_setprops event_handlers = <event_handlers>
	elseif gotparam \{dont_force_quit}
		<event_handlers> = [
			{pad_choose goal_pause_tool_destroy_menu}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_square_script}
		<event_handlers> = [
			{pad_square <pad_choose_sound>}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if gotparam \{pad_start_script}
		<event_handlers> = [
			{pad_start <pad_choose_sound>}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	return item_container_id = <id>
endscript

script generic_barrel_menu_item_focus \{scale = 1.5}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	<id> :getsingletag 0xa3721c47
	if gotparam \{0xa3721c47}
		rgba = ($0x1892c8f1)
	endif
	0x0cf62187 scale = <scale> id = <id> rgba = <rgba> focus
	<id> :se_getparentid
	0xe846fb2d menu_id = <parent_id>
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script generic_barrel_menu_item_unfocus \{time = 0.05}
	if NOT gotparam \{id}
		obj_getid
		<id> = <objid>
	endif
	<id> :getsingletag 0xa3721c47
	if gotparam \{0xa3721c47}
		rgba = ($0x24ff60ab)
	endif
	0x0cf62187 id = <id> rgba = <rgba> unfocus
	if gotparam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script generic_barrel_menu_pad_up 
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse}
endscript

script generic_barrel_menu_pad_down 
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse}
endscript

script 0x0cf62187 \{scale = 1.0
		time = 0.05}
	<id> :gettags
	if gotparam \{focus}
		if NOT gotparam \{rgba}
			rgba = ($menu_focus_color)
		endif
		<id> :se_setprops {
			menurow_scale = <scale>
			0xe2d8d29d = 0
			menurow_txt_item_font = ($0x44eab176)
			menurow_txt_item_rgba = <rgba>
			motion = ease_in
			time = <time>
		}
	else
		if NOT gotparam \{rgba}
			rgba = ($menu_unfocus_color)
		endif
		<id> :se_setprops {
			menurow_scale = <scale>
			0xe2d8d29d = 5
			menurow_txt_item_font = ($0x3c5111c2)
			menurow_txt_item_rgba = <rgba>
			motion = ease_in
			time = 0
		}
	endif
endscript

script generic_barrel_menu_hilight_toggle 
	generic_barrel_menu :se_getprops
	if gotparam \{highlight_btn_pos}
		generic_barrel_menu :getsingletag \{hl_index}
		if (<hl_index> = 0)
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) + 42.0)))
			}
			generic_barrel_menu :settags \{hl_index = 1}
		else
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 42.0)))
			}
			generic_barrel_menu :settags \{hl_index = 0}
		endif
	endif
endscript

script generic_barrel_menu_do_arrow_pulse 
	obj_getid
	<objid> :se_setprops scale = 1.3 time = 0.01 relative_scale
	<objid> :se_waitprops
	<objid> :se_setprops scale = 1.0 time = 0.1 relative_scale
	wait \{0.1
		seconds}
	destroyscreenelement id = <id>
endscript

script generic_barrel_menu_do_scroll_glow 
	obj_getid
	createscreenelement {
		type = spriteelement
		parent = <objid>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		pos = (0.0, 0.0)
		rgba = ($menu_focus_color)
		just = [center center]
		pos_anchor = [center center]
		z_priority = 10
		alpha = 0.2
		blend = add
	}
	if screenelementexists \{generic_barrel_vmenu}
		generic_barrel_vmenu :getsingletag \{0xcd40a8a2}
		if gotparam \{0xcd40a8a2}
			<id> :se_setprops pos = {<0xcd40a8a2> relative}
		endif
	endif
	<id> :se_setprops scale = 1.2 relative_scale
	<id> :se_setprops scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	wait \{0.2
		seconds}
	destroyscreenelement id = <id>
endscript

script generic_barrel_menu_setup_physics_elements 
	requireparams \{[
			screen_id
		]
		all}
	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias name = alias_music_add_container param = music_add_id
		<music_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias name = alias_crazy_add_container param = crazy_add_id
		<crazy_add_id> :obj_spawnscript ui_shakey
	else
		scriptassert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias name = alias_generic_barrel_menu_up_arrow
		arrow_up_id = <resolved_id>
	else
		scriptassert \{qs(0x3232c204)}
	endif
	if <screen_id> :desc_resolvealias name = alias_generic_barrel_menu_down_arrow
		arrow_down_id = <resolved_id>
	else
		scriptassert \{qs(0x3232c204)}
	endif
endscript
