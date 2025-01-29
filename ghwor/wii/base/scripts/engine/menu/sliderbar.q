
script sliderbar_rescale_to_bar 
	<target1> = ((<value> - <min>) / (<Max> - <min>))
	<target2> = (<right> - <left>)
	<target3> = (<target1> * <target2>)
	<rescaled_value> = (<target3> + <left>)
	return x_val = <rescaled_value>
endscript

script sliderbar_add_item \{tab = tab1
		font = fontgrid_text_a3
		icon_rgba = [
			127
			102
			0
			128
		]
		icon_scale = 0
		icon_pos = (22.0, 9.0)
		text_just = [
			center
			center
		]
		text_pos = (0.0, 0.0)
		arrow_pos_up = (0.0, 8.0)
		arrow_pos_down = (0.0, -8.0)
		arrow_rgba = [
			100
			90
			80
			255
		]
		up_arrow_texture = up_arrow
		down_arrow_texture = down_arrow
		dims = (0.0, 20.0)}
	if GotParam \{is_enabled_script}
		<is_enabled_script>
		if (<success> = 0)
			return
		endif
	endif
	switch <tab>
		case tab1
		<bar_scale> = (0.91999996, 1.2)
		case tab2
		<bar_scale> = (0.85, 1.2)
		case tab3
		<bar_scale> = (0.78, 1.2)
		<font> = dialog
	endswitch
	SetScreenElementLock \{id = current_menu
		OFF}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	if GotParam \{index}
		if GotParam \{pad_choose_params}
			<pad_choose_params> = (<pad_choose_params> + {parent_index = <index>})
		else
			<pad_choose_params> = {parent_index = <index>}
		endif
	endif
	<z_priority> = 300
	CreateScreenElement {
		Type = ContainerElement
		parent = current_menu
		id = <anchor_id>
		dims = <dims>
		event_handlers = [{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	<parent_id> = <id>
	if GotParam \{index}
		SetScreenElementProps {
			id = <parent_id>
			tags = {tag_grid_x = <index>}
		}
	endif
	if GotParam \{not_focusable}
		<rgba> = [60 60 60 100]
	else
		rgba = [128 128 128 240]
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <parent_id>
		font = fontgrid_text_a3
		text = <text>
		Scale = 0.5
		rgba = [128 , 128 , 128 , 255]
		just = <text_just>
		Pos = <text_pos>
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (1.0, 1.0)
		replace_handlers
		<not_focusable>
	}
	highlight_angle = 0
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		texture = DE_highlight_bar
		Pos = (-25.0, -7.0)
		rgba = [0 0 0 0]
		just = [center center]
		Scale = (1.9, 0.7)
		z_priority = (3 -1)
		rot_angle = <highlight_angle>
	}
	<Pos> = (-9.0, 0.0)
	if GotParam \{bar_pos}
		<Pos> = <bar_pos>
	endif
	bar_rgba = [100 90 80 255]
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		z_priority = (<z_priority> - 2)
		Pos = (<Pos> + (0.0, 2.0))
		Scale = (1.2, 1.0)
		texture = menu_highlight
		rgba = [200 200 200 255]
	}
	legacydoscreenelementmorph id = <id> alpha = 0 time = 0
	if NOT GotParam \{arrow_scale}
		arrow_scale = 0.0
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <anchor_id>
		just = [center bottom]
		dims = {200 , 200}
		Pos = <arrow_pos_down>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		id = <down_arrow_id>
		texture = <down_arrow_texture>
		rgba = <arrow_rgba>
		Scale = <arrow_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <anchor_id>
		just = [center top]
		dims = {200 , 200}
		Pos = <arrow_pos_up>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		id = <up_arrow_id>
		texture = <up_arrow_texture>
		rgba = <arrow_rgba>
		Scale = <arrow_scale>
	}
	if GotParam \{child_texture}
		CreateScreenElement {
			Type = SpriteElement
			parent = <parent_id>
			texture = <child_texture>
			Pos = <icon_pos>
			rgba = <icon_rgba>
			Scale = <icon_scale>
			id = <icon_id>
		}
	endif
	SetScreenElementLock \{id = current_menu
		On}
endscript

script guitar_select_handler_change 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	cap_focus_script up_arrow_id = <up_arrow_id> down_arrow_id = <down_arrow_id> color_bar_id = <color_bar_id>
	if NOT ScreenElementExists \{id = guitar_selection_element}
		CreateScreenElement {
			Type = ContainerElement
			id = guitar_selection_element
			parent = root_window
			event_handlers = [
				{pad_up <pad_up_handler> params = <handler_params>}
				{pad_down <pad_down_handler> params = <handler_params>}
				{pad_right <pad_up_handler> params = <handler_params>}
				{pad_left <pad_down_handler> params = <handler_params>}
				{pad_choose guitar_select_handler_change_return params = {vmenu_id = <vmenu_id>}}
				{pad_back guitar_select_handler_change_return params = {vmenu_id = <vmenu_id>}}
			]
			z_priority = <z_priority>
		}
		LaunchEvent \{Type = focus
			target = guitar_selection_element}
	endif
endscript

script guitar_select_handler_change_return 
	LaunchEvent \{Type = unfocus
		target = guitar_selection_element}
	if ScreenElementExists \{id = guitar_selection_element}
		DestroyScreenElement \{id = guitar_selection_element}
	endif
	LaunchEvent \{Type = focus
		target = current_menu}
endscript
