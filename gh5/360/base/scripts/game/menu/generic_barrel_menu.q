
script make_generic_barrel_menu {
		pad_back_sound = generic_menu_pad_back_sound
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
		x_dims = 1024
		parent = root_window
		Scale = 1.0
		centered = 0
		max_expansion = 5
	}
	destroy_generic_barrel_menu
	if NOT GotParam \{title}
		no_title = 1
	endif
	if NOT GotParam \{Pos}
		if (<parent> = root_window)
			<Pos> = (1152.0, 625.0)
		else
			<Pos> = (0.0, 0.0)
		endif
	endif
	if NOT GotParam \{z_priority}
		if (<parent> = root_window)
			<z_priority> = 1.0
		else
			<parent> :se_getprops z_priority
			<z_priority> = (<z_priority> + 1)
		endif
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if (<pad_back_script> = nullscript)
		pad_back_sound = nullscript
	endif
	update_ingame_controllers controller = <exclusive_device>
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	if GotParam \{use_original_barrel}
		<desc> = 'generic_barrel_menu'
	else
		<desc> = 'generic_barrel_menu_2'
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		desc = <desc>
		id = generic_barrel_menu
		exclusive_device = <exclusive_device>
		generic_barrel_menu_title_text = <title>
		Pos = <Pos>
		Scale = <Scale>
		z_priority = <z_priority>
		tags = {
			exclusive_device = <exclusive_device>
		}
	}
	if NOT GotParam \{use_original_barrel}
		if GotParam \{texture}
			<id> :se_setprops {
				bg_texture = <texture>
				bg_alpha = 1
			}
		else
			<id> :se_setprops {
				bg_alpha = 0
			}
		endif
		if GotParam \{no_highlight_bar}
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
			if GotParam \{highlight_btn_pos}
				<id> :se_setprops {
					highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 39.0)))
				}
			endif
		endif
		generic_barrel_menu_setup_physics_elements screen_id = <id>
	else
		generic_barrel_menu :SetTags \{use_original_barrel = 1}
	endif
	if (<centered> = 1)
		<id> :se_getprops highlight_btn_pos
		if GotParam \{highlight_btn_pos}
			<id> :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * ((<highlight_btn_pos> [0]) + 25.0)) + ((0.0, 1.0) * (<highlight_btn_pos> [1])))
			}
		endif
		generic_barrel_menu :se_setprops \{generic_barrel_menu_internal_just = [
				center
				top
			]}
	endif
	<id> :SetTags {
		x_dims = <x_dims>
		max_expansion = <max_expansion>
	}
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_vmenu}
		AssignAlias id = <resolved_id> alias = generic_barrel_vmenu
		if GotParam \{vmenu_id}
			AssignAlias id = <resolved_id> alias = <vmenu_id>
		endif
		if (<centered> = 1)
			generic_barrel_vmenu :se_setprops \{pos_anchor = [
					center
					center
				]
				just = [
					center
					center
				]
				internal_just = [
					center
					center
				]
				Pos = (0.0, 0.0)}
			generic_barrel_vmenu :SetTags \{centered = 1}
		else
			generic_barrel_vmenu :SetTags \{centered = 0}
		endif
		<event_handlers> = [
			{pad_up generic_barrel_menu_pad_up}
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
			{pad_down generic_barrel_menu_pad_down}
		]
		generic_barrel_vmenu :SetTags \{total_length = 0
			smooth_morph_time = 0.1}
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	else
		ScriptAssert \{qs(0x091f75b4)}
	endif
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_up_arrow}
		AssignAlias id = <resolved_id> alias = generic_barrel_menu_up_arrow
	else
		ScriptAssert \{qs(0x091f75b4)}
	endif
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_down_arrow}
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
			{pad_option2 <pad_back_sound>}
			{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_option_script}
		<event_handlers> = [
			{pad_option <pad_back_sound>}
			{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_back_script}
		<event_handlers> = [
			{pad_back <pad_back_sound>}
			{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
		]
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers> replace_handlers
	endif
	if GotParam \{no_title}
		generic_barrel_menu :se_setprops \{generic_barrel_menu_title_alpha = 0}
	endif
	return \{desc_id = generic_barrel_menu
		vmenu_id = generic_barrel_vmenu}
endscript

script generic_barrel_menu_set_max_expansion 
	RequireParams \{[
			max_expansion
		]
		all}
	if ScreenElementExists \{id = generic_barrel_menu}
		if ((<max_expansion> = 3) || (<max_expansion> = 4))
			generic_barrel_menu :se_getprops \{highlight_btn_pos}
			if GotParam \{highlight_btn_pos}
				generic_barrel_menu :se_setprops {
					highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 39.0)))
				}
			endif
		endif
		generic_barrel_menu :SetTags {
			max_expansion = <max_expansion>
		}
	endif
endscript

script generic_barrel_menu_finish \{no_helper_pills = 0
		index = 0}
	if (<no_helper_pills> = 0)
		menu_finish
	endif
	generic_barrel_menu :GetTags
	if NOT IsArray \{exclusive_device}
		add_gamertag_helper exclusive_device = <exclusive_device>
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
		generic_barrel_menu :SetTags \{max_expansion = 1
			hl_index = 0}
		generic_barrel_menu :se_getprops \{highlight_btn_pos}
		if GotParam \{highlight_btn_pos}
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 76.0)))
			}
		endif
		generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 45.0))
		case 2
		generic_barrel_vmenu :se_setprops \{loop_view = FALSE
			loop_center = FALSE}
		generic_barrel_vmenu :SetTags \{smooth_morph_time = 0.0}
		generic_barrel_menu :SetTags \{max_expansion = 2
			hl_index = 0}
		if (<index> = 1)
			generic_barrel_menu_hilight_toggle
		endif
		generic_barrel_menu :se_getprops \{highlight_btn_pos}
		if GotParam \{highlight_btn_pos}
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 76.0)))
			}
		endif
		generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 94.0))
		case 3
		case 4
		if (<max_expansion> >= 3)
			if GotParam \{use_original_barrel}
				generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 142.0))
			else
				generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 126.0))
			endif
		else
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 45.0))
		endif
		default
		if GotParam \{use_original_barrel}
			<offset_5> = (0.0, 245.0)
			<offset_3> = (0.0, 142.0)
		else
			<offset_5> = (0.0, 200.0)
			<offset_3> = (0.0, 123.0)
		endif
		if (<max_expansion> >= 5)
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + <offset_5>)
		elseif (<max_expansion> >= 3)
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + <offset_3>)
		else
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 45.0))
		endif
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
		pad_choose_sound = ui_menu_select_sfx
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
			}
		}
	else
		ScriptAssert \{qs(0x2b8c76bc)}
	endif
	<parent> :GetSingleTag centered
	if (<centered> = 1)
		<id> :se_setprops {
			menurow_just = [center center]
			menurow_internal_just = [center center]
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
			{pad_choose <pad_choose_sound>}
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
			{pad_square <pad_choose_sound>}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_start_script}
		event_handlers = [
			{pad_start <pad_choose_sound>}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		<i> = 0
		begin
		clrval = (<rgba> [<i>])
		CastToInteger \{clrval}
		SetArrayElement ArrayName = rgba index = <i> NewValue = <clrval>
		<i> = (<i> + 1)
		repeat 3
		<id> :se_setprops not_focusable menurow_txt_item_rgba = <rgba>
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
		pad_choose_sound = ui_menu_select_sfx
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
			}
		}
	else
		ScriptAssert \{qs(0x49555792)}
	endif
	<parent> :GetSingleTag centered
	if (<centered> = 1)
		<id> :se_setprops {
			menurow_just = [center center]
			menurow_internal_just = [center center]
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
			{pad_choose <pad_choose_sound>}
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
			{pad_square <pad_choose_sound>}
			{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{pad_start_script}
		<event_handlers> = [
			{pad_start <pad_choose_sound>}
			{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
		]
		<id> :se_setprops event_handlers = <event_handlers>
	endif
	if GotParam \{not_focusable}
		if GotParam \{header_text}
			rgba = (($g_menu_colors).menu_subhead)
		else
			rgba = (($default_color_scheme).text_color)
		endif
		<i> = 0
		begin
		clrval = (<rgba> [<i>])
		CastToInteger \{clrval}
		SetArrayElement ArrayName = rgba index = <i> NewValue = <clrval>
		<i> = (<i> + 1)
		repeat 3
		<id> :se_setprops not_focusable menurow_txt_item_rgba = <rgba>
	endif
	return item_container_id = <id>
endscript

script generic_barrel_menu_item_focus \{time = 0.05
		grow_scale = 1.5}
	text_focus_color = ($menu_focus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetSingleTag text_focus_color
	generic_barrel_menu :GetTags \{use_original_barrel}
	if NOT GotParam \{use_original_barrel}
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
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <text_focus_color>
		motion = ease_in
		time = <time>
	}
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
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <text_unfocus_color>
		motion = ease_in
		time = <time>
	}
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> {id = <id>} <additional_unfocus_params>
	endif
endscript

script generic_barrel_menu_pad_up 
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_up_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse}
	generic_barrel_menu :GetSingleTag \{max_expansion}
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
	generic_barrel_menu :GetSingleTag \{max_expansion}
	if (<max_expansion> = 2)
		generic_barrel_menu_hilight_toggle
	endif
endscript

script generic_barrel_menu_hilight_toggle 
	generic_barrel_menu :se_getprops \{highlight_btn_pos}
	if GotParam \{highlight_btn_pos}
		generic_barrel_menu :GetSingleTag \{hl_index}
		if (<hl_index> = 0)
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) + 42.0)))
			}
			generic_barrel_menu :SetTags \{hl_index = 1}
		else
			generic_barrel_menu :se_setprops {
				highlight_btn_pos = (((1.0, 0.0) * (<highlight_btn_pos> [0])) + ((0.0, 1.0) * ((<highlight_btn_pos> [1]) - 42.0)))
			}
			generic_barrel_menu :SetTags \{hl_index = 0}
		endif
	endif
endscript

script generic_barrel_menu_do_arrow_pulse 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (64.0, 32.0)
		Pos = (32.0, 16.0)
		just = [center center]
		rgba = (($g_menu_colors).gh5_focus_white)
		z_priority = 6
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
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (32.0, 16.0)
		rgba = ($menu_focus_color)
		just = [center center]
		z_priority = 4
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	Wait \{0.2
		Seconds}
	DestroyScreenElement id = <id>
endscript

script generic_barrel_menu_setup_physics_elements 
	RequireParams \{[
			screen_id
		]
		all}
	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias Name = alias_music_add_container param = music_add_id
		<music_add_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_crazy_add_container param = crazy_add_id
		<crazy_add_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_dragon_add_container param = dragon_add_id
		<dragon_add_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_generic_barrel_menu_up_arrow
		arrow_up_id = <resolved_id>
	else
		ScriptAssert \{qs(0x3232c204)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_generic_barrel_menu_down_arrow
		arrow_down_id = <resolved_id>
	else
		ScriptAssert \{qs(0x3232c204)}
	endif
endscript
