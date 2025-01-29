exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script make_menu_frontend {
		pad_back_script = generic_event_back
		screen = drummer
		item_scale = 0.8
		exclusive_device = ($primary_controller)
		spacing_between = -5
		title_scale = 1.0
		Pos = (0.0, 0.0)
	}
	set_focus_color
	set_unfocus_color
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	update_ingame_controllers controller = <exclusive_device>
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'menu_frontend'
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	if <id> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			tags = {item_scale = <item_scale>}
			spacing_between = <spacing_between>
		}
		current_menu :obj_spawnscript \{highlight_motion
			no_flip}
	endif
	if GotParam \{title}
		menu_frontend_add_title title = <title> item_scale = (<item_scale> * <title_scale>)
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
endscript

script menu_frontend_add_title \{parent = current_menu
		item_scale = 1.0}

	scaling_factor = 1.0
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		id = title_banner
		desc = 'vh_title_banner'
		title_text = <title>
		title_color = (($g_menu_colors).menu_default_title)
		just = [center center]
		Pos = (0.0, 0.0)
		autosizedims = FALSE
		dims = ((150 * <item_scale> * <scaling_factor>) * (0.0, 1.0))
		not_focusable
	}
	menu_frontend_resize_banner banner_id = title_banner Scale = (<item_scale> * <scaling_factor>)
endscript

script menu_frontend_resize_banner \{Scale = 1.0
		max_title_width = 450
		end_cap_extra_width = 100
		min_title_width = 150}

	if ResolveScreenElementID id = [{id = <banner_id>} {local_id = root} {local_id = title}] param = title_id
		GetScreenElementDims id = <title_id>
		<title_id> :se_setprops dims = ((0.0, 1.0) * <height>) fit_width = `expand	dims`
		GetScreenElementDims id = <title_id>
		text_width = <width>
		text_height = <height>

		max_width = (<max_title_width> + <end_cap_extra_width>)
		if (<text_width> > <max_width>)


			<title_id> :se_setprops dims = (((1.0, 0.0) * <max_width>) + ((0.0, 1.0) * <height>)) fit_width = `scale	each	line	if	larger`
			text_width = <max_width>
		endif
		if ResolveScreenElementID id = [{id = <banner_id>} {local_id = root} {local_id = bannermiddle}] param = banner_mid_id
			GetScreenElementDims id = <banner_mid_id>
			mid_width = (<text_width> - <end_cap_extra_width>)
			if (<mid_width> < <min_title_width>)

				mid_width = <min_title_width>
			endif


			<banner_mid_id> :se_setprops dims = ((<mid_width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
		endif
	endif
	if ResolveScreenElementID id = [{id = <banner_id>} {local_id = root}]
		<resolved_id> :se_setprops Scale = <Scale>
	endif
endscript

script clear_exclusive_devices 
	Change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 0
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 1
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 2
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 3
			NewValue = -1}
	endif
	SetArrayElement ArrayName = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) NewValue = <device>
	Change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript

script add_menu_frontend_item {
		rgba = ($menu_unfocus_color)
		item_height = 50
		focus_script = mainmenu_focus
		unfocus_script = mainmenu_unfocus
		font = text_a1
		internal_scale = 1.0
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		single_line = true
		internal_just = [left top]
	}
	if ScreenElementExists \{id = current_menu}
		GetScreenElementDims \{id = current_menu}
		current_menu :GetSingleTag \{item_scale}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
		else
			array_Size = 0
		endif
		if GotParam \{choose_state}
			pad_choose_script = generic_event_choose
			pad_choose_params = {state = <choose_state> data = {<choose_state_data>}}
		endif
		if GotParam \{not_focusable}
			focus = {not_focusable}
		endif
		local_int_scale = <internal_scale>
		if GotParam \{item_scale}
			local_int_scale = (<internal_scale> * <item_scale>)
		endif
		if GotParam \{desc}
			CreateScreenElement {
				Type = descinterface
				desc = <desc>
				parent = <parent>
				item_text = <text>
				item_color = <rgba>
				just = [center center]
				Pos = (0.0, 0.0)
				autosizedims = true
				Scale = <local_int_scale>
				event_handlers = [
					{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script>}
				]
				<focus>
				tags = {index = <array_Size> isinterface = true}
			}
			<id> :se_setprops Scale = <local_int_scale> time = 0.0
			if <id> :desc_resolvealias Name = alias_text_item param = text_id
				if <id> :desc_resolvealias Name = alias_sprite_item param = sprite_id
					GetScreenElementDims id = <text_id>
					text_width = <width>
					total_width = (<text_width> + 30)
					if GotParam \{icon}
						total_width = (<total_width> + 50)
					endif
					GetScreenElementDims id = <sprite_id>
					<sprite_id> :se_setprops dims = (<total_width> * (1.0, 0.0) + <height> * (0.0, 1.0))
				endif
			endif
			<id> :desc_refreshcontentdims
		else
			CreateScreenElement {
				Type = TextElement
				parent = <parent>
				internal_scale = <local_int_scale>
				font = <font>
				text = <text>
				rgba = <rgba>
				just = [center center]
				internal_just = <internal_just>
				Pos = (0.0, 0.0)
				single_line = <single_line>
				event_handlers = [
					{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script>}
				]
				<focus>
				tags = {index = <array_Size>}
			}
		endif
		if GotParam \{choose_state}
			pad_choose_script = ui_event
			pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <container_id>}}
		else
			pad_choose_params = {<pad_choose_params> container_id = <container_id>}
		endif
		if GotParam \{choose_back}
			pad_choose_script = ui_event
			pad_choose_params = {event = menu_back}
		endif
		if GotParam \{pad_choose_script}
			SetScreenElementProps {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
		if GotParam \{heading}
			<id> :se_setprops Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)
		endif
		return item_container_id = <id> item_id = <id>
	endif
endscript

script add_menu_frontend_spacer \{item_height = 50
		parent = current_menu
		internal_just = [
			left
			top
		]}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		rgba = <rgba>
		dims = ((1.0, 1.0) * <item_height>)
		just = [center center]
		Pos = (0.0, 0.0)
		single_line = true
		not_focusable
	}
endscript
spinner_vertical_offset = 3

script menu_focus_set_highlight Type = spin menu = current_menu_anchor spinner_voffset = ($spinner_vertical_offset)
	Obj_GetID
	switch <Type>
		case spin
		if <menu> :desc_resolvealias Name = alias_spinner
			spinner_id = <resolved_id>
			Wait \{2
				gameframe}
			spinner_scale = <Scale>
			<objID> :GetSingleTag spinner_offset
			<objID> :GetSingleTag spinner_voffset
			if ResolveScreenElementID id = [{id = <objID>} {local_id = generic_menu_smenu_textitem} {local_id = generic_menu_smenu_textitem_text}]
				objID = <resolved_id>
			endif
			<objID> :se_getprops
			GetScreenElementDims id = <objID> summed
			element_width = <width>
			element_height = <height>
			GetScreenElementPosition id = <objID> summed
			height_offset = 0
			if ((<just> [1]) = -1)
				height_offset = (<height> * 0.5)
			endif
			if <spinner_id> :desc_resolvealias Name = alias_left_spinner
				left_spinner_id = <resolved_id>
				<left_spinner_id> :se_setprops Scale = 1 time = 0
				GetScreenElementDims id = <left_spinner_id>
				if ((<just> [0]) = -1)
					ltspinner_offset = (<width> * 0.4)
				else
					ltspinner_offset = ((<element_width> * 0.5) + (<width> * 0.4))
				endif
				if GotParam \{spinner_offset}
					ltspinner_offset = (<ltspinner_offset> + <spinner_offset>)
				else
					ltspinner_offset = (<ltspinner_offset> + (<element_height> * 0.025))
				endif
				if GotParam \{spinner_scale}
					scale_height = <spinner_scale>
				else
					scale_height = ((<element_height> * 1.1) / <height>)
				endif
				leftposition = (<screenelementpos> + <ltspinner_offset> * (-1.0, 0.0) + <element_height> * (0.0, -0.1) + <height_offset> * (0.0, 1.0) + <spinner_voffset> * (0.0, 1.0))
				<left_spinner_id> :se_setprops Pos = {absolute <leftposition>} Scale = <scale_height> time = 0
			endif
			if <spinner_id> :desc_resolvealias Name = alias_right_spinner
				right_spinner_id = <resolved_id>
				<right_spinner_id> :se_setprops Scale = 1 time = 0
				GetScreenElementDims id = <right_spinner_id>
				if ((<just> [0]) = -1)
					rtspinner_offset = (<element_width> + (<width> * 0.4))
				else
					rtspinner_offset = ((<element_width> * 0.5) + (<width> * 0.4))
				endif
				if GotParam \{spinner_offset}
					rtspinner_offset = (<rtspinner_offset> + <spinner_offset>)
				else
					rtspinner_offset = (<rtspinner_offset> + (<element_height> * 0.025))
				endif
				if GotParam \{spinner_scale}
					scale_height = <spinner_scale>
				else
					scale_height = ((<element_height> * 1.1) / <height>)
				endif
				rightposition = (<screenelementpos> + <rtspinner_offset> * (1.0, 0.0) + <element_height> * (0.0, -0.1) + <height_offset> * (0.0, 1.0) + <spinner_voffset> * (0.0, 1.0))
				<right_spinner_id> :se_setprops Pos = {absolute <rightposition>} Scale = <scale_height> time = 0
			endif
			if GotParam \{scale_height}
			endif
		endif
		case highlight
		if <menu> :desc_resolvealias Name = alias_highlight
			highlight_id = <resolved_id>
			Wait \{1
				gameframe}
			GetScreenElementDims id = <objID> summed
			element_width = <width>
			element_height = <height>
			<highlight_id> :se_setprops Scale = 1 time = 0
			GetScreenElementDims id = <highlight_id>
			desired_width = ((<element_width> + (<element_height> * 0.5)))
			scale_width = (<desired_width> / <width>)
			scale_height = (((<element_height> * 1.2) / <height>))
			GetScreenElementPosition id = <objID> summed
			<highlight_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = ((<scale_width> * (1.0, 0.0)) + (<scale_height> * (0.0, 1.0))) time = 0
			<highlight_id> :se_waitprops
		endif
	endswitch
endscript

script menu_reset_highlight 

	if ScreenElementExists \{id = current_menu}
		current_menu :menu_getselectedindex
		if GetScreenElementChildren \{id = current_menu}
			if (<selected_index> >= 0)
				(<children> [<selected_index>]) :focus_set_spinners menu = <anchor>
			endif
		endif
	endif
endscript
object_spin_rate = 15

script spin_object spin_rate = ($object_spin_rate)

	if desc_resolvealias Name = <Name>
		setscriptcannotpause
		begin
		if NOT ScreenElementExists id = <resolved_id>
			break
		endif
		<resolved_id> :se_getprops rot_angle
		<resolved_id> :se_setprops rot_angle = (<rot_angle> + <spin_rate>) time = 0.5
		Wait \{5
			gameframes
			ignoreslomo}
		repeat
	endif
endscript
