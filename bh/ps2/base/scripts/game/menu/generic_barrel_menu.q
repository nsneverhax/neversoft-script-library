
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
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		desc = 'generic_barrel_menu'
		id = generic_barrel_menu
		exclusive_device = <exclusive_device>
		generic_barrel_menu_title_text = <title>
		Pos = <Pos>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	if (<centered> = 1)
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
		generic_barrel_vmenu :se_setprops event_handlers = <event_handlers>
		<resolved_id> :SetTags {
			total_length = 0
			smooth_morph_time = 0.1
		}
	else

	endif
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_up_arrow}
		AssignAlias id = <resolved_id> alias = generic_barrel_menu_up_arrow
	else

	endif
	if generic_barrel_menu :desc_resolvealias \{Name = alias_generic_barrel_menu_down_arrow}
		AssignAlias id = <resolved_id> alias = generic_barrel_menu_down_arrow
	else

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

script generic_barrel_menu_finish \{no_helper_pills = 0}
	if (<no_helper_pills> = 0)
		if GotParam \{no_back_button}
			menu_finish \{no_back_button = 1}
		else
			menu_finish
		endif
	endif
	generic_barrel_menu :GetTags
	GetScreenElementChildren \{id = generic_barrel_vmenu}
	GetArraySize <children>
	switch <array_Size>
		case 1
		case 2
		generic_barrel_vmenu :se_setprops \{loop_view = FALSE
			loop_center = FALSE}
		generic_barrel_vmenu :SetTags \{smooth_morph_time = 0.0}
		generic_barrel_menu :SetTags {
			max_expansion = <array_Size>
			hl_index = 0
		}
		generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 105.0))
		case 3
		case 4
		if (<max_expansion> >= 3)
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 150.0))
		else
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 45.0))
		endif
		default
		if (<max_expansion> >= 5)
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 245.0))
		elseif (<max_expansion> >= 3)
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 150.0))
		else
			generic_barrel_menu :se_setprops generic_barrel_scrolling_menu_dims = ((<x_dims> * (1.0, 0.0)) + (0.0, 45.0))
		endif
	endswitch
	generic_barrel_menu :SetTags num_children = <array_Size>
	if (<array_Size> > 2)
		<alpha> = 1
	else
		<alpha> = 0
	endif
	generic_barrel_menu_up_arrow :se_setprops alpha = <alpha>
	generic_barrel_menu_down_arrow :se_setprops alpha = <alpha>
	<i> = 0
	begin
	generic_barrel_menu_item_unfocus id = (<children> [<i>]) time = 0.0
	<i> = (<i> + 1)
	repeat <array_Size>
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	LaunchEvent \{Type = focus
		target = generic_barrel_vmenu}
endscript

script destroy_generic_barrel_menu 
	if ScreenElementExists \{id = generic_barrel_menu}
		DestroyScreenElement \{id = generic_barrel_menu}
	endif
	clean_up_user_control_helpers
	Change \{g_num_menu_items_with_icon = 0}
endscript

script add_generic_barrel_menu_text_item \{focus_script = generic_barrel_menu_item_focus
		focus_script_params = {
		}
		unfocus_script = generic_barrel_menu_item_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = generic_barrel_vmenu
		extra_props = {
		}}
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			autosizedims = true
			menurow_txt_item_text = <text>
			<extra_props>
		}
	else

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

script generic_barrel_menu_item_focus \{time = 0.05
		grow_scale = 1.5}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = [230 230 230 255]
		motion = ease_in
		time = <time>
	}
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script generic_barrel_menu_item_unfocus \{time = 0.05}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
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
endscript

script generic_barrel_menu_pad_down 
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_scroll_glow}
	generic_barrel_menu_down_arrow :obj_spawnscript \{generic_barrel_menu_do_arrow_pulse
		params = {
			down
		}}
endscript

script generic_barrel_menu_do_arrow_pulse 
	Obj_GetID
	<objID> :se_setprops hiddenlocal = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (40.0, 40.0)
		Pos = (20.0, 15.0)
		just = [center center]
		rgba = [255 , 99 , 71 , 255]
		z_priority = 5
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
		<id> :se_setprops Pos = {(0.0, 9.0) relative}
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	<id> :se_waitprops
	<objID> :se_setprops hiddenlocal = FALSE
	DestroyScreenElement id = <id>
endscript

script generic_barrel_menu_do_scroll_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (20.0, 15.0)
		rgba = [255 , 99 , 71 , 255]
		just = [center center]
		z_priority = 4
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	<id> :se_waitprops
	DestroyScreenElement id = <id>
endscript

script 0xd04724ad \{time = 0.05
		grow_scale = 1.5}

	Obj_GetID
	if ResolveScreenElementID id = {<objID> child = <child_id>}
		<resolved_id> :se_setprops {
			Scale = <grow_scale>
			motion = ease_in
			time = <time>
		}
	endif
endscript

script 0xf653c16e \{time = 0.05}

	Obj_GetID
	if ResolveScreenElementID id = {<objID> child = <child_id>}
		<resolved_id> :se_setprops {
			Scale = 1
			motion = ease_in
			time = <time>
		}
	endif
endscript

script 0x889804be 

	menu_getselectedindex
	if (<selected_index> = -1)
		selected_index = 0
	endif
	dist = (<selected_index> - <index>)
	if (<dist> = 0)
		return
	endif
	if (<dist> < 0)
		Dir = down
		dist = (<dist> * -1)
	else
		Dir = up
	endif
	begin
	menu_changeselection <Dir>
	repeat <dist>
endscript
