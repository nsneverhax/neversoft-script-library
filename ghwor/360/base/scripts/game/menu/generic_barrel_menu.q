g_generic_barrel_menu_focus_scale = 1.1
g_generic_barrel_menu_gravity_counterbalance = 6

script make_generic_barrel_menu {
		pad_back_sound = ui_sfx
		pad_back_sound_menustate = Generic
		pad_back_sound_uitype = back
		pad_choose_sound = ui_sfx
		pad_choose_sound_menustate = Generic
		pad_choose_sound_uitype = select
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
		x_dims = 1024
		parent = root_window
		Scale = 1.0
		highlight_bar_scale = (1.0, 1.0)
		max_expansion = 5
		use_smooth_scroll = 0
		update_net_controllers = 1
	}
	destroy_generic_barrel_menu
	if NOT GotParam \{z_priority}
		if (<parent> = root_window)
			<z_priority> = 1.0
			<just> = [right center]
		else
			<passed_in_scale> = <Scale>
			<parent> :se_getprops z_priority
			<z_priority> = (<z_priority> + 1)
			<Scale> = <passed_in_scale>
		endif
	else
		<passed_in_scale> = <Scale>
		<passed_in_z> = <z_priority>
		<parent> :se_getprops just
		<Scale> = <passed_in_scale>
		<z_priority> = <passed_in_z>
	endif
	<master_just> = <just>
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
	endif
	if (<pad_back_script> = nullscript)
		pad_back_sound = nullscript
	endif
	if (<update_net_controllers> = 1)
		update_ingame_controllers controller = <exclusive_device>
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	if (<parent> = root_window)
		<desc> = 'generic_barrel_menu'
		<extra_params> = {}
	else
		<desc> = 'barrel_menu_desc'
		<extra_params> = {
			just = <master_just>
			pos_anchor = <master_just>
			internal_just = <master_just>
			Pos = (0.0, 0.0)
			autosizedims = true
		}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		desc = <desc>
		id = generic_barrel_menu
		exclusive_device = <exclusive_device>
		Scale = <Scale>
		highlight_bar_physics_scale = <highlight_bar_scale>
		z_priority = <z_priority>
		<extra_params>
		tags = {
			exclusive_device = <exclusive_device>
		}
	}
	if (<parent> = root_window)
		if generic_barrel_menu :desc_resolvealias \{Name = alias_barrel_menu_desc}
			AssignAlias id = <resolved_id> alias = barrel_menu_desc
		else
			ScriptAssert \{qs(0x091f75b4)}
		endif
	else
		AssignAlias \{id = generic_barrel_menu
			alias = barrel_menu_desc}
	endif
	if barrel_menu_desc :desc_resolvealias \{Name = alias_highlight_bar_physics}
		AssignAlias id = <resolved_id> alias = highlight_bar_physics
		highlight_bar_physics :se_getprops \{visible_dims}
		highlight_bar_physics :SetTags y_dims = (<visible_dims>.(0.0, 1.0))
	endif
	if GotParam \{no_highlight_bar}
		highlight_bar_physics_alpha = 0
	elseif (<max_expansion> < 3)
		highlight_bar_physics_alpha = 0
	else
		highlight_bar_physics_alpha = 0.9
	endif
	<id> :se_setprops {
		highlight_bar_physics_alpha = <highlight_bar_physics_alpha>
	}
	if NOT (<parent> = root_window)
		if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu}
			generic_barrel_menu :se_getprops
			<x_pos> = (<Pos> [0])
			<parent> :se_getprops
			switch (<master_just> [1])
				case 0
				<y_pos> = 0
				case 1
				<y_pos> = (((<dims> [1]) / 2) + 20.0)
				case -1
				default
				<y_pos> = ((0 - ((<dims> [1]) / 2)) + 20.0)
			endswitch
			<Pos> = (((1.0, 0.0) * <x_pos>) + ((0.0, 1.0) * <y_pos>))
			generic_barrel_menu :se_setprops {
				generic_barrel_menu_internal_just = <master_just>
				generic_barrel_menu_just = <master_just>
				generic_barrel_menu_pos_anchor = <master_just>
			}
			<resolved_id> :se_setprops {
				Pos = <Pos>
			}
		else
			ScriptAssert \{qs(0x091f75b4)}
		endif
	endif
	barrel_menu_desc :SetTags {
		x_dims = <x_dims>
		max_expansion = <max_expansion>
	}
	if barrel_menu_desc :desc_resolvealias \{Name = alias_generic_barrel_vmenu}
		AssignAlias id = <resolved_id> alias = generic_barrel_vmenu
		if GotParam \{vmenu_id}
			AssignAlias id = <resolved_id> alias = <vmenu_id>
		endif
		if NOT (<parent> = root_window)
			if (<master_just> [0] = 0)
				<Pos> = (512.0, 0.0)
			elseif (<master_just> [0] = 1)
				<Pos> = (1024.0, 0.0)
			endif
			generic_barrel_vmenu :se_setprops {
				pos_anchor = <master_just>
				just = <master_just>
				internal_just = <master_just>
				Pos = <Pos>
			}
			highlight_bar_physics :se_setprops {
				pos_anchor = <master_just>
				just = <master_just>
				internal_just = <master_just>
				Pos = ((0.0, -1.0) * ($g_generic_barrel_menu_gravity_counterbalance))
			}
			generic_barrel_vmenu :SetTags master_just = <master_just>
		endif
		<event_handlers> = [
			{pad_up generic_barrel_menu_pad_up}
			{pad_down generic_barrel_menu_pad_down}
		]
		if (<use_smooth_scroll> = 1)
			AddArrayElement {
				array = <event_handlers>
				element = {pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			}
			<event_handlers> = <array>
			AddArrayElement {
				array = <event_handlers>
				element = {pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
			}
			<event_handlers> = <array>
		endif
		generic_barrel_vmenu :SetTags \{total_length = 0
			smooth_morph_time = 0.1}
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	else
		ScriptAssert \{qs(0x091f75b4)}
	endif
	if barrel_menu_desc :desc_resolvealias \{Name = alias_generic_barrel_menu_up_arrow}
		AssignAlias id = <resolved_id> alias = generic_barrel_menu_up_arrow
	else
		ScriptAssert \{qs(0x091f75b4)}
	endif
	if barrel_menu_desc :desc_resolvealias \{Name = alias_generic_barrel_menu_down_arrow}
		AssignAlias id = <resolved_id> alias = generic_barrel_menu_down_arrow
	else
		ScriptAssert \{qs(0x091f75b4)}
	endif
	if NOT GotParam \{no_up_down_sound_handlers}
		add_generic_menu_up_down_sound_handlers \{parent = generic_barrel_vmenu}
	endif
	if GotParam \{pad_start_script}
		<event_handlers> = [
			{pad_start <pad_start_script> params = <pad_start_params>}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_option2_script}
		<event_handlers> = [
			{pad_option2 <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
			{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_option_script}
		<event_handlers> = [
			{pad_option <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
			{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_back_script}
		<event_handlers> = [
			{pad_back <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
			{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers> replace_handlers
	endif
	return \{desc_id = generic_barrel_menu
		vmenu_id = generic_barrel_vmenu}
endscript

script generic_barrel_menu_set_max_expansion 
	RequireParams \{[
			max_expansion
		]
		all}
	if ScreenElementExists \{id = barrel_menu_desc}
		barrel_menu_desc :SetTags {
			max_expansion = <max_expansion>
		}
	endif
endscript

script generic_barrel_menu_finish \{no_helper_pills = 0
		index = 0
		max_expansion_override = 0}
	barrel_menu_desc :GetTags
	if (<no_helper_pills> = 0)
		if NOT IsArray \{exclusive_device}
			add_gamertag_helper exclusive_device = <exclusive_device>
		endif
		menu_finish
	endif
	GetScreenElementChildren \{id = generic_barrel_vmenu}
	if NOT GotParam \{children}
		return
	endif
	GetArraySize <children>
	switch <array_Size>
		case 1
		generic_barrel_menu_up_arrow :se_setprops \{alpha = 0.0}
		generic_barrel_menu_down_arrow :se_setprops \{alpha = 0.0}
		generic_barrel_vmenu :se_setprops \{loop_view = FALSE
			loop_center = FALSE}
		generic_barrel_vmenu :SetTags \{smooth_morph_time = 0.0}
		barrel_menu_desc :SetTags \{max_expansion = 1
			hl_index = 0}
		(<children> [0]) :se_getprops dims
		<y_dims> = ((<dims>.(0.0, 1.0)) * ($g_generic_barrel_menu_focus_scale))
		barrel_menu_desc :se_setprops generic_barrel_window_dims = ((<x_dims> * (1.0, 0.0)) + (<y_dims> * (0.0, 1.0)))
		case 2
		generic_barrel_vmenu :se_setprops \{loop_view = FALSE
			loop_center = FALSE}
		generic_barrel_vmenu :SetTags \{smooth_morph_time = 0.0}
		barrel_menu_desc :SetTags \{max_expansion = 2
			hl_index = 0}
		barrel_menu_desc :se_getprops \{highlight_bar_physics_pos}
		if GotParam \{highlight_bar_physics_pos}
			highlight_bar_physics :GetSingleTag \{y_dims}
			barrel_menu_desc :se_setprops {
				highlight_bar_physics_pos = (((1.0, 0.0) * (<highlight_bar_physics_pos> [0])) + ((0.0, 1.0) * ((<highlight_bar_physics_pos> [1]) + ($g_generic_barrel_menu_gravity_counterbalance) - (<y_dims> / 2.0))))
			}
		endif
		if (<index> = 1)
			generic_barrel_menu_hilight_toggle
		endif
		(<children> [0]) :se_getprops dims
		<y_dims> = ((<dims>.(0.0, 1.0)) * (($g_generic_barrel_menu_focus_scale) + 1))
		barrel_menu_desc :se_setprops generic_barrel_window_dims = ((<x_dims> * (1.0, 0.0)) + (<y_dims> * (0.0, 1.0)))
		case 3
		case 4
		if (<max_expansion_override> = 0)
			if (<max_expansion> >= 3)
				<dims_num> = 3
			else
				<dims_num> = 1
			endif
		else
			<dims_num> = <array_Size>
		endif
		(<children> [0]) :se_getprops dims
		<y_dims> = (((<dims>.(0.0, 1.0)) * <dims_num>) + 10)
		barrel_menu_desc :se_setprops generic_barrel_window_dims = ((<x_dims> * (1.0, 0.0)) + (<y_dims> * (0.0, 1.0)))
		default
		if (<max_expansion_override> = 0)
			if (<max_expansion> >= 5)
				<dims_num> = 5
			elseif (<max_expansion> >= 3)
				<dims_num> = 3
			else
				<dims_num> = 1
			endif
		else
			<dims_num> = <array_Size>
		endif
		(<children> [0]) :se_getprops dims
		<y_dims> = (((<dims>.(0.0, 1.0)) * <dims_num>) + 10)
		barrel_menu_desc :se_setprops generic_barrel_window_dims = ((<x_dims> * (1.0, 0.0)) + (<y_dims> * (0.0, 1.0)))
	endswitch
	<i> = 0
	begin
	generic_barrel_menu_item_unfocus id = (<children> [<i>]) time = 0.0
	<i> = (<i> + 1)
	repeat <array_Size>
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	generic_barrel_menu_item_focus id = (<children> [<index>]) time = 0.0
	LaunchEvent \{Type = unfocus
		target = generic_barrel_vmenu}
	LaunchEvent Type = focus target = generic_barrel_vmenu data = {child_index = <index>}
endscript

script destroy_generic_barrel_menu 
	if ScreenElementExists \{id = generic_barrel_menu}
		DestroyScreenElement \{id = generic_barrel_menu}
	endif
	clean_up_user_control_helpers
	Change \{g_num_menu_items_with_icon = 0}
endscript

script clear_out_generic_barrel_menu 
	DestroyScreenElement \{id = generic_barrel_vmenu
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
		pad_choose_sound = ui_sfx
		pad_choose_sound_menustate = Generic
		pad_choose_sound_uitype = select
		parent = generic_barrel_vmenu
		extra_props = {}
		text_unfocus_color = ($menu_unfocus_color)
		text_focus_color = ($menu_focus_color)
	}
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			autosizedims = true
			menurow_txt_item_text = <text>
			menurow_txt_item_rgba = <text_unfocus_color>
			menurow_txt_item_dims = <menurow_txt_item_dims>
			menurow_just = <menurow_just>
			<extra_props>
			tags = {
				text_unfocus_color = <text_unfocus_color>
				text_focus_color = <text_focus_color>
				focusable = 1
			}
		}
	else
		ScriptAssert \{qs(0x2b8c76bc)}
	endif
	<parent> :GetSingleTag master_just
	if GotParam \{master_just}
		<id> :se_setprops {
			menurow_just = <master_just>
			menurow_internal_just = <master_just>
		}
	endif
	if (<master_just> [0] = 0)
		if NOT GotParam \{menurow_txt_item_dims}
			<id> :se_getprops
		endif
		<id> :se_setprops {
			menurow_highlight_bar_pos = (((1.0, 0.0) * ((<menurow_txt_item_dims> [0]) / 2)) + ((0.0, 1.0) * 0))
			menurow_highlight_bar_dims = (((1.0, 0.0) * (<menurow_txt_item_dims> [0])) + ((0.0, 1.0) * (<menurow_txt_item_dims> [1])))
		}
	endif
	if GotParam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	<id> :SetTags helper_text = <helper_text>
	<event_handlers> = [
		{focus <focus_script> params = {id = <id> <focus_script_params> do_not_scroll = <do_not_scroll> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
		{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
	]
	<id> :se_setprops event_handlers = <event_handlers>
	if GotParam \{pad_choose_script}
		<event_handlers> = [
			{pad_choose ui_sfx params = {menustate = <pad_choose_sound_menustate> uitype = <pad_choose_sound_uitype>}}
			{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
		]
		if GotParam \{dont_force_quit}
			if (<dont_force_quit> = 0)
				<another_choose> = {pad_choose goal_pause_tool_destroy_menu}
				AddArrayElement array = <event_handlers> element = <another_choose>
				<event_handlers> = <array>
			endif
		endif
		<id> :se_setprops event_handlers = <event_handlers>
	elseif GotParam \{dont_force_quit}
		<event_handlers> = [
			{pad_choose goal_pause_tool_destroy_menu}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_btn_left_script}
		<event_handlers> = [
			{pad_btn_left generic_blocking_execute_script params = {pad_script = <pad_btn_left_script> pad_params = {container_id = <id> <pad_btn_left_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_btn_top_script}
		<event_handlers> = [
			{pad_btn_top generic_blocking_execute_script params = {pad_script = <pad_btn_top_script> pad_params = {container_id = <id> <pad_btn_top_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_left_script}
		<event_handlers> = [
			{pad_left <pad_left_script> params = <pad_left_params>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_right_script}
		<event_handlers> = [
			{pad_right <pad_right_script> params = <pad_right_params>}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_square_script}
		<event_handlers> = [
			{pad_square <pad_choose_sound> params = {menustate = <pad_choose_sound_menustate> uitype = <pad_select_sound_uitype>}}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_start_script}
		event_handlers = [
			{pad_start <pad_choose_sound> params = {menustate = <pad_select_sound_menustate> uitype = <pad_choose_sound_uitype>}}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = [120 120 120 100]
		endif
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = <rgba>
			tags = {focusable = 0}
		}
	endif
	if GotParam \{heading}
		<id> :se_setprops not_focusable menurow_txt_item_rgba = [200 70 70 255]
	endif
	return item_container_id = <id>
endscript
g_num_menu_items_with_icon = 0

script add_generic_barrel_menu_icon_item {
		focus_script = generic_barrel_menu_item_focus
		unfocus_script = generic_barrel_menu_item_unfocus
		pad_choose_sound = ui_sfx
		pad_choose_sound_menustate = Generic
		pad_choose_sound_uitype = select
		parent = generic_barrel_vmenu
		ui_event_script = ui_event
		icon_first = 1
		text_unfocus_color = ($menu_unfocus_color)
		text_focus_color = ($menu_focus_color)
	}
	formatText \{checksumName = menurow_ico_item
		'menurow_ico_item_%i'
		i = $g_num_menu_items_with_icon}
	Change g_num_menu_items_with_icon = ($g_num_menu_items_with_icon + 1)
	if (<icon_first> = 1)
		<desc> = 'menurow_ico_txt_desc'
	else
		<desc> = 'menurow_txt_ico_desc'
	endif
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			id = <id>
			Type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			menurow_txt_item_text = <text>
			menurow_txt_item_rgba = <text_unfocus_color>
			menurow_ico_item_texture = <icon>
			tags = {
				text_unfocus_color = <text_unfocus_color>
				text_focus_color = <text_focus_color>
				focusable = 1
			}
		}
	else
		ScriptAssert \{qs(0x49555792)}
	endif
	<parent> :GetSingleTag master_just
	if GotParam \{master_just}
		<id> :se_setprops {
			menurow_just = <master_just>
			menurow_internal_just = <master_just>
		}
	endif
	if (<master_just> [0] = 0)
		if NOT GotParam \{menurow_txt_item_dims}
			<id> :se_getprops
		endif
		<id> :se_setprops {
			menurow_highlight_bar_pos = (((1.0, 0.0) * ((<menurow_txt_item_dims> [0]) / 2)) + ((0.0, 1.0) * 0))
			menurow_highlight_bar_dims = (((1.0, 0.0) * (<menurow_txt_item_dims> [0])) + ((0.0, 1.0) * (<menurow_txt_item_dims> [1])))
		}
	endif
	if <id> :desc_resolvealias Name = alias_menurow_ico_item
		AssignAlias id = <resolved_id> alias = <menurow_ico_item>
	else
		ScriptAssert \{qs(0xe4477528)}
	endif
	<id> :SetTags helper_text = <helper_text>
	if GotParam \{choose_state}
		pad_choose_script = <ui_event_script>
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id> icon_id = <menurow_ico_item>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	<event_handlers> = [
		{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
		{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params>}}
	]
	<id> :se_setprops event_handlers = <event_handlers>
	if GotParam \{pad_choose_script}
		<event_handlers> = [
			{pad_choose <pad_choose_sound> params = {menustate = <pad_select_sound_menustate> uitype = <pad_select_sound_uitype>}}
			{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params> icon_id = <menurow_ico_item>}}}
		]
		if GotParam \{dont_force_quit}
			if (<dont_force_quit> = 0)
				<another_choose> = {pad_choose goal_pause_tool_destroy_menu}
				AddArrayElement array = <event_handlers> element = <another_choose>
				<event_handlers> = <array>
			endif
		endif
		<id> :se_setprops event_handlers = <event_handlers>
	elseif GotParam \{dont_force_quit}
		<event_handlers> = [
			{pad_choose goal_pause_tool_destroy_menu}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_square_script}
		<event_handlers> = [
			{pad_square <pad_choose_sound> params = {menustate = <pad_select_sound_menustate> uitype = <pad_select_sound_uitype>}}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_start_script}
		<event_handlers> = [
			{pad_start <pad_choose_sound> params = {menustate = <pad_select_sound_menustate> uitype = <pad_select_sound_uitype>}}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = [120 120 120 100]
		endif
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = <rgba>
			tags = {focusable = 0}
		}
	endif
	return item_container_id = <id>
endscript

script generic_barrel_menu_item_focus time = 0.05 grow_scale = ($g_generic_barrel_menu_focus_scale)
	text_focus_color = ($menu_focus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetSingleTag text_focus_color
	generic_barrel_menu_helper_text_text = qs(0x03ac90f0)
	generic_barrel_menu_helper_text_alpha = 0
	if <id> :GetSingleTag helper_text
		generic_barrel_menu_helper_text_text = <helper_text>
		generic_barrel_menu_helper_text_alpha = 1
	endif
	generic_barrel_menu :se_setprops {
		generic_barrel_menu_helper_text_text = <generic_barrel_menu_helper_text_text>
		generic_barrel_menu_helper_text_alpha = <generic_barrel_menu_helper_text_alpha>
	}
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <text_focus_color>
		menurow_highlight_bar_alpha = 0.5
		motion = ease_in
		time = <time>
	}
	<id> :generic_barrel_menu_unpause_item
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script generic_barrel_menu_item_unfocus \{time = 0.05}
	text_unfocus_color = ($menu_unfocus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetSingleTag text_unfocus_color
	<id> :obj_getintegertag tag_name = focusable
	if (<integer_value> = 0)
		<rgba> = [120 120 120 100]
	else
		<rgba> = [216 181 117 255]
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <rgba>
		menurow_highlight_bar_alpha = 0
		motion = ease_in
		time = <time>
	}
	<id> :generic_barrel_menu_unpause_item
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script generic_barrel_menu_pad_up 
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse}
	barrel_menu_desc :GetSingleTag \{max_expansion}
	if (<max_expansion> = 2)
		generic_barrel_menu_hilight_toggle
	endif
endscript

script generic_barrel_menu_pad_down 
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse
		params = {
			down
		}}
	barrel_menu_desc :GetSingleTag \{max_expansion}
	if (<max_expansion> = 2)
		generic_barrel_menu_hilight_toggle
	endif
endscript

script generic_barrel_menu_hilight_toggle 
	barrel_menu_desc :se_getprops \{highlight_bar_physics_pos}
	if GotParam \{highlight_bar_physics_pos}
		highlight_bar_physics :GetSingleTag \{y_dims}
		barrel_menu_desc :GetSingleTag \{hl_index}
		if (<hl_index> = 0)
			barrel_menu_desc :se_setprops {
				highlight_bar_physics_pos = (((1.0, 0.0) * (<highlight_bar_physics_pos> [0])) + ((0.0, 1.0) * ((<highlight_bar_physics_pos> [1]) + (<y_dims> * 0.75))))
			}
			barrel_menu_desc :SetTags \{hl_index = 1}
		else
			barrel_menu_desc :se_setprops {
				highlight_bar_physics_pos = (((1.0, 0.0) * (<highlight_bar_physics_pos> [0])) + ((0.0, 1.0) * ((<highlight_bar_physics_pos> [1]) - (<y_dims> * 0.75))))
			}
			barrel_menu_desc :SetTags \{hl_index = 0}
		endif
	endif
endscript

script generic_barrel_menu_do_arrow_pulse 
	Obj_GetID
	<objID> :se_getprops
	setscriptcannotpause
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = mainmenu_wgt_barrel_arrow
		dims = <dims>
		Pos = (0.0, 0.0)
		alpha = 1.0
		just = [center center]
		pos_anchor = [center , center]
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	Wait \{0.1
		Seconds}
	DestroyScreenElement id = <id>
endscript

script generic_barrel_menu_do_scroll_glow 
	Obj_GetID
	setscriptcannotpause
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (32.0, 32.0)
		Pos = (0.0, 0.0)
		rgba = ($menu_focus_color)
		just = [center center]
		pos_anchor = [center , center]
		alpha = 0.5
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	Wait \{0.2
		Seconds}
	DestroyScreenElement id = <id>
endscript

script generic_barrel_menu_setup_physics_elements 
	create_2d_spring_system \{desc_id = highlight_bar_physics
		num_springs = 2
		stiffness = 50
		rest_length = 1}
endscript

script generic_barrel_menu_unpause_item 
	se_setprops \{Unpause}
	if desc_resolvealias \{Name = alias_menurow_highlight_bar
			param = menurow_highlight_bar}
		<menurow_highlight_bar> :se_setprops {
			Unpause
		}
	endif
	if desc_resolvealias \{Name = alias_menurow_txt_item
			param = menurow_txt_item}
		<menurow_txt_item> :se_setprops {
			Unpause
		}
	endif
endscript

script generic_barrel_menu_unpause_all_items 
	if ScreenElementExists \{id = generic_barrel_vmenu}
		GetScreenElementChildren \{id = generic_barrel_vmenu}
		if NOT GotParam \{children}
			return
		endif
		GetArraySize <children>
		if (<array_Size> > 0)
			<i> = 0
			begin
			(<children> [<i>]) :generic_barrel_menu_unpause_item
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript
