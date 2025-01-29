menu_over_ride_exclusive_device = -1

script make_menu {
		menu_id = main_menu_anchor
		vmenu_id = main_menu
		parent = root_window
		pad_back_script = ui_event
		pad_back_params = {event = menu_back}
		Pos = (200.0, 175.0)
		dims = (400.0, 450.0)
		rot_angle = 0
		pad_back_sound = ui_menu_select_sfx
		title_scale = 1.0
		title_pos = (410.0, 110.0)
		title_just = [center center]
		title_bg_pos = (385.0, 15.0)
		title_bg_scale = (1.9599999, 1.4)
		extra_z = 0
		scroll_bar_offeset = (375.0, -10.0)
		spacing_between = 0
		internal_just = [left top]
		selection_width = 425
		selection_height = 50
		menu_bg = menu_bg
		bg_pos = (-30.0, 0.0)
		bg_dims = (1280.0, 720.0)
		exclusive_device = ($primary_controller)
		bg_scale = (0.95, 1.0)
		scroll_down_sfx = generic_menu_up_or_down_sound
		scroll_up_sfx = generic_menu_up_or_down_sound
	}
	SetScreenElementLock id = <parent> OFF
	if NOT GotParam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT GotParam \{title_rgba}
		title_rgba = (<color_scheme>.title_color)
	endif
	if NOT GotParam \{scroll_bar_offset}
		scroll_bar_offset = (0.0, 0.0)
	endif
	if NOT GotParam \{keep_current}
		if ScreenElementExists \{id = current_menu_anchor}
			DestroyScreenElement \{id = current_menu_anchor}
		endif
	else
		if GotParam \{fade_out_current}
			legacydoscreenelementmorph \{id = current_menu_anchor
				alpha = 0
				time = 0}
		endif
	endif
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	if GotParam \{centered}
		if NOT GotParam \{centered_offset}
			centered_offset = (0.0, 0.0)
		endif
		Pos = ((((1.0, 0.0) * (640 - (<dims> [0] / 2))) + (0.0, 250.0)) + <centered_offset>)
		title_pos = (640.0, 130.0)
		if (<menu_bg> = menu_bg_2)
			title_rot_angle = -10
			title_pos = (640.0, 155.0)
		endif
	endif
	MangleChecksums a = <menu_id> b = menu
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = <menu_id>
		rot_angle = <rot_angle>
		just = [left top]
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		alpha = 1
		z_priority = <extra_z>
		focusable_child = <mangled_ID>
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = <menu_id>
		id = <mangled_ID>
		just = [left top]
		focusable_child = <vmenu_id>
	}
	<highlight_parent_id> = <menu_id>
	if NOT GotParam \{keep_current}
		AssignAlias id = <menu_id> alias = current_menu_anchor
	endif
	if GotParam \{title}
		CreateScreenElement {
			Type = TextBlockElement
			parent = <mangled_ID>
			local_id = title
			font = ($test_menu_font_title)
			text = <title>
			rgba = <title_rgba>
			Scale = <title_scale>
			Pos = (<title_pos> - (0.0, 0.0))
			just = <title_just>
			z_priority = (3 + <extra_z>)
			rot_angle = <title_rot_angle>
			dims = (275.0, 75.0)
			fit_height = `scale	down	if	larger`
			fit_width = `scale	each	line	if	larger`
			internal_just = [center center]
		}
		if NOT ((GotParam nobg) || (GotParam notitlebg))
			CreateScreenElement {
				Type = SpriteElement
				parent = <mangled_ID>
				texture = menu_history_background_empty
				Scale = <title_bg_scale>
				dims = (256.0, 128.0)
				Pos = <title_bg_pos>
				z_priority = (2 + <extra_z>)
				just = [center top]
			}
		endif
	endif
	<menu_id> :SetTags num_options = 0
	if GotParam \{scrolling}
		<menu_id> :SetTags scrolling_num_options = 0
		scroll_bar_pos = (<Pos> + <scroll_bar_offeset>)
		scroll_bar_len = ((<dims> [1]) + 10)
		CreateScreenElement {
			Type = ContainerElement
			parent = <mangled_ID>
			local_id = scroll_bar
			Pos = (<scroll_bar_pos> + <scroll_bar_offset>)
			just = [right top]
			dims = ((20.0, 0.0) + ((0.0, 1.0) * <scroll_bar_len>))
		}
		scroll_bar_id = <id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <scroll_bar_id>
			Pos = (0.0, -5.0)
			just = [center top]
			texture = arrow
			dims = (20.0, 20.0)
			z_priority = (14 + <extra_z>)
			rgba = [200 200 200 255]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <scroll_bar_id>
			Pos = (0.0, 0.0)
			just = [center top]
			texture = white
			rgba = [64 64 64 255]
			dims = ((20.0, 0.0) + ((0.0, 1.0) * <scroll_bar_len>))
			z_priority = (13 + <extra_z>)
			alpha = 0.0
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <scroll_bar_id>
			Pos = ((0.0, 1.0) * <scroll_bar_len>)
			just = [center bottom]
			texture = arrow
			dims = (20.0, 20.0)
			z_priority = (14 + <extra_z>)
			rot_angle = 180
			rgba = [200 200 200 255]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <scroll_bar_id>
			local_id = zipper
			Pos = (0.0, 0.0)
			just = [center top]
			texture = white
			rgba = [200 200 0 255]
			dims = (20.0, 20.0)
			z_priority = (17 + <extra_z>)
			alpha = 0.0
		}
		<menu_id> :SetTags scroll_bar_id = <scroll_bar_id>
		<menu_id> :SetTags scroll_bar_len = (<scroll_bar_len> - 20)
		<menu_id> :SetTags scroll_bar_option = 0
		CreateScreenElement {
			Type = VScrollingMenu
			parent = <mangled_ID>
			dims = <dims>
			Pos = <Pos>
			just = [left top]
		}
		<parent_id> = <id>
		AssignAlias id = <parent_id> alias = current_scrolling_menu
		<vmenu_pos> = (0.0, 0.0)
	else
		<parent_id> = <mangled_ID>
		<vmenu_pos> = <Pos>
	endif
	CreateScreenElement {
		Type = VMenu
		parent = <parent_id>
		id = <vmenu_id>
		Pos = <vmenu_pos>
		font = ($test_menu_font)
		just = [left top]
		internal_just = <internal_just>
		<dont_allow_wrap>
		regular_space_amount = <regular_space_amount>
		spacing_between = <spacing_between>
	}
	if NOT GotParam \{nobg}
		CreateScreenElement {
			Type = SpriteElement
			parent = <menu_id>
			Pos = <bg_pos>
			texture = <menu_bg>
			just = [left top]
			dims = <bg_dims>
			Scale = <bg_scale>
		}
		AssignAlias id = <id> alias = current_menu_background
	endif
	if GotParam \{no_event_handlers}
		killeventhandlers
	else
		internal_pad_up_params = {up = 1}
		internal_pad_down_params = {down = 2}
		if GotParam \{scrolling}
			internal_pad_up_params = {<internal_pad_up_params> scrolling}
			internal_pad_down_params = {<internal_pad_down_params> scrolling}
		endif
		if (<pad_back_script> = nullscript)
			<pad_back_sound> = nullscript
		endif
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back <pad_back_script> params = <pad_back_params>}
				{pad_up <scroll_up_sfx> params = <internal_pad_up_params>}
				{pad_down <scroll_down_sfx> params = <internal_pad_down_params>}
			]
		}
		if GotParam \{pad_down_script}
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [
					{pad_down <pad_down_script> params = <pad_down_params>}
				]
			}
		endif
		if GotParam \{pad_up_script}
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [
					{pad_up <pad_up_script> params = <pad_up_params>}
				]
			}
		endif
		if GotParam \{pad_option2_script}
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [
					{pad_option2 <pad_option2_script> params = <pad_option2_params>}
				]
			}
		endif
		if GotParam \{pad_option_script}
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [
					{pad_option <pad_option_script> params = <pad_option_params>}
				]
			}
		endif
	endif
	if NOT GotParam \{keep_current}
		AssignAlias id = <vmenu_id> alias = current_menu
	endif
	width = (<dims>.(1.0, 0.0))
	<vmenu_id> :SetTags color_scheme = <color_scheme>
	<vmenu_id> :SetTags extra_z = <extra_z>
	<vmenu_id> :SetTags scroll_bar_offset = <scroll_bar_offset>
	<vmenu_id> :SetTags menu_pos = <Pos>
	if GotParam \{selection_width}
		<vmenu_id> :SetTags selection_width = <selection_width>
	endif
	if GotParam \{selection_height}
		<vmenu_id> :SetTags selection_height = <selection_height>
	endif
	if GotParam \{additional_create_script}
		<vmenu_id> :SetTags additional_create_script = <additional_create_script>
	endif
	if GotParam \{additional_focus_script}
		<vmenu_id> :SetTags additional_focus_script = <additional_focus_script>
	endif
	if GotParam \{additional_unfocus_script}
		<vmenu_id> :SetTags additional_unfocus_script = <additional_unfocus_script>
	endif
	if GotParam \{no_highlight_bar}
		<vmenu_id> :SetTags no_highlight_bar = 1
	else
		if GotParam \{highlight_dims}
			<vmenu_id> :SetTags highlight_dims = <highlight_dims>
		endif
		if GotParam \{highlight_bar}
			0x05039c3f parent_id = <highlight_parent_id> z_priority = <extra_z>
		endif
	endif
	if GotParam \{additional_menu_create_script}
		<additional_menu_create_script> <additional_menu_create_params>
	endif
	if GotParam \{centered}
		<vmenu_id> :SetTags centered = 1
	endif
endscript

script add_menu_item \{focus_script = menu_item_focus
		unfocus_script = menu_item_unfocus
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = nullscript
		pad_choose_params = {
		}
		option_arrows_callback = nullscript
		additional_focus_script = nullscript
		additional_focus_params = {
		}
		additional_unfocus_script = nullscript
		additional_unfocus_params = {
		}
		Scale = (0.8, 0.71999997)
		just = [
			left
			top
		]
		text_just = [
			left
			center
		]
		text_internal_just = [
			left
			center
		]
		child_anchor = [
			left
			center
		]
		parent = current_menu
		parent_anchor = current_menu_anchor
		scale_highlight_text = 0
		rot = 0
		text_offset = (36.0, 0.0)
		extras_offset = (16.0, 0.0)
		arrow_offset = (60.0, 0.0)
		cas_offset = (0.0, 0.0)
		alpha = 1
		text_case = upper}
	if GlobalExists \{Name = massive_build}
		if NOT ($massive_build = 0)
			if GotParam \{massive_secret_item}
				return
			endif
		endif
	endif
	<parent> :GetSingleTag no_highlight_bar
	if NOT GotParam \{dims}
		if NOT GotParam \{selection_width}
			<parent> :GetSingleTag selection_width
		endif
		if NOT GotParam \{selection_height}
			<parent> :GetSingleTag selection_height
		endif
		dims = (((0.0, 1.0) * <selection_height>) + ((1.0, 0.0) * <selection_width>))
		if NOT GotParam \{highlight_dims}
			highlight_dims = (<dims> - (0.0, 10.0))
		endif
	else
	endif
	<parent> :GetSingleTag centered
	if GotParam \{centered}
		child_anchor = [center center]
		text_just = [center center]
		text_offset = (0.0, 0.0)
	endif
	<parent> :GetSingleTag color_scheme
	<parent> :GetSingleTag extra_z
	if NOT GotParam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT GotParam \{rgba}
		<rgba> = ($default_color_scheme.text_color)
	endif
	if NOT GotParam \{extra_rgba}
		extra_rgba = ($default_color_scheme.text_color)
	endif
	if GotParam \{id}
		if ScreenElementExists id = <id>
			RemoveParameter \{id}
		endif
	endif
	if GotParam \{heading}
		AddParams \{not_focusable}
		<rgba> = [200 70 70 255]
	endif
	if GotParam \{not_focusable}
		if GotParam \{heading}
		else
			if IsArray <rgba>
				clrval = (<rgba> [0] * 0.5)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 0 NewValue = <clrval>
				clrval = (<rgba> [1] * 0.5)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 1 NewValue = <clrval>
				clrval = (<rgba> [2] * 0.5)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 2 NewValue = <clrval>
			endif
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			Pos = <cas_offset>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			not_focusable
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			Pos = <cas_offset>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			dims = <dims>
		}
		if GotParam \{tag_grid_x}
			<id> :SetTags tag_grid_x = <tag_grid_x> tag_length = <length>
		else
			<id> :SetTags tag_length = <length>
		endif
	endif
	<container_id> = <id>
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
	if NOT GotParam \{no_highlight_bar}
		CreateScreenElement {
			Type = ContainerElement
			parent = <container_id>
			local_id = highlight
			just = [left center]
			Pos = (0.0, 0.0)
			z_priority = (9 + <extra_z>)
			alpha = 0.0
		}
	endif
	if GotParam \{children}
		GetArraySize \{children}
		<i> = 0
		begin
		if NOT StructureContains structure = (<children> [<i>]) NULL
			CreateScreenElement {
				z_priority = (10 + <extra_z>)
				(<children> [<i>])
				parent = <container_id>
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{toggle}
		if (<toggle> = On)
			extra_text = qs(0x9feda83b)
		else
			extra_text = qs(0x87289b63)
		endif
		extra_block = {dims = (50.0, 0.0) internal_just = [center center] allow_expansion}
		AddParams \{option_arrows}
		if NOT GotParam \{no_toggle}
			<option_arrows_callback> = menu_toggle_item
			<option_arrows_callback_params> = {toggle_script = <toggle_script> id = <container_id> toggle_params = <toggle_params>}
			<container_id> :SetTags toggle = <toggle>
		endif
	endif
	if ((<additional_focus_script> = nullscript) && (<additional_unfocus_script> = nullscript))
		if (<pad_choose_script> = nullscript)
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				]
			}
		else
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{pad_choose <pad_choose_sound>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
	else
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{pad_choose <pad_choose_sound>}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{focus <additional_focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_focus_params>}}
				{unfocus <additional_unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_unfocus_params>}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_square <pad_square_script> params = {id = <container_id> <pad_square_params>}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_start <pad_start_script> params = {id = <container_id> <pad_start_params>}}
			]
		}
	endif
	<container_id> :SetTags text_offset = <text_offset>
	<container_id> :SetTags arrow_offset = <arrow_offset>
	<container_id> :SetTags extras_offset = <extras_offset>
	<container_id> :SetTags option_arrows_callback = <option_arrows_callback>
	<container_id> :SetTags cas_offset = <cas_offset>
	<container_id> :SetTags just = <just>
	<container_id> :SetTags rgba = <rgba>
	<container_id> :SetTags extra_rgba = <extra_rgba>
	<parent_anchor> :GetSingleTag scrolling_num_options
	if GotParam \{scrolling_num_options}
		<container_id> :SetTags scrolling_option = <scrolling_num_options>
		<scrolling_num_options> = (<scrolling_num_options> + 1)
		<parent_anchor> :SetTags scrolling_num_options = <scrolling_num_options>
	endif
	<parent_anchor> :GetSingleTag num_options
	if GotParam \{num_options}
		<num_options> = (<num_options> + 1)
		<parent_anchor> :SetTags num_options = <num_options>
	endif
	if (<text_case> = lower)
		GetLowerCaseString <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		GetUpperCaseString <text>
		<text> = <UppercaseString>
	endif
	text_scale = <Scale>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = ($test_menu_font)
		text = <text>
		rgba = <rgba>
		Scale = <text_scale>
		just = <text_just>
		Pos = <text_offset>
		z_priority = (10 + <extra_z>)
		dims = (((1.0, 0.0) * (<dims> [0])) + (0.0, 50.0))
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
		internal_just = <text_internal_just>
	}
	if GotParam \{extra_text}
		if NOT GotParam \{extra_just}
			if GotParam \{option_arrows}
				<extra_just> = [center center]
			else
				<extra_just> = [left center]
			endif
		endif
		if NOT GotParam \{extra_block}
			CreateScreenElement {
				Type = TextBlockElement
				parent = <container_id>
				local_id = extra_text
				font = ($test_menu_font)
				text = <extra_text>
				rgba = <extra_rgba>
				Pos = (((1.0, 0.0) * <dims> [0]) + <extras_offset>)
				just = <extra_just>
				Scale = <Scale>
				z_priority = (10 + <extra_z>)
				dims = (((1.0, 0.0) * (<dims> [0] - (<text_offset> [0] * 2))) + (0.0, 50.0))
				fit_height = `scale	down	if	larger`
				fit_width = `scale	each	line	if	larger`
			}
		else
			CreateScreenElement {
				Type = TextBlockElement
				parent = <container_id>
				local_id = extra_text
				font = ($test_menu_font)
				text = <extra_text>
				rgba = <extra_rgba>
				just = <extra_just>
				internal_scale = <Scale>
				internal_just = [left top]
				<extra_block>
				Pos = (((1.0, 0.0) * <dims> [0]) + <extras_offset>)
				z_priority = (10 + <extra_z>)
			}
			GetScreenElementChildren id = <id>
			GetArraySize <children>
			if NOT (<array_Size> = 1)
				<container_id> :se_setprops dims = (((1.0, 0.0) * <dims> [0]) + ((0.0, 1.0) * (<dims> [1] * <array_Size>)))
			endif
		endif
		if GotParam \{option_arrows}
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [
					{pad_left <option_arrows_callback> params = {left <option_arrows_callback_params>}}
					{pad_right <option_arrows_callback> params = {right <option_arrows_callback_params>}}
				]
			}
		endif
	endif
	menu_item_resize id = <container_id>
	if <parent> :GetSingleTag additional_create_script
		<additional_create_script> <...>
	endif
	SetScreenElementLock id = <parent> On
	SetScreenElementLock id = <parent> OFF
	return item_container_id = <container_id>
endscript

script add_icon_menu_item \{focus_script = menu_icon_focus
		unfocus_script = menu_icon_unfocus
		pad_choose_sound = ui_menu_select_sfx
		pad_choose_script = nullscript
		pad_choose_params = {
		}
		additional_focus_script = nullscript
		additional_focus_params = {
		}
		additional_unfocus_script = nullscript
		additional_unfocus_params = {
		}
		Scale = (0.8, 0.71999997)
		just = [
			left
			top
		]
		text_just = [
			left
			center
		]
		child_anchor = [
			left
			center
		]
		parent = current_menu
		parent_anchor = current_menu_anchor
		scale_highlight_text = 0
		rot = 0
		text_offset = (110.0, 7.0)
		extras_offset = (16.0, 0.0)
		arrow_offset = (60.0, 0.0)
		alpha = 1
		text_case = lower
		icon_scale = 0.5
		icon_offset = (64.0, 0.0)
		icon_dims = (75.0, 75.0)
		icon_padding = (0.0, 16.0)
		text_case = upper
		extra_z = 0
		selection_width = 345
		selection_height = 60}
	if GlobalExists \{Name = massive_build}
		if NOT ($massive_build = 0)
			if GotParam \{massive_secret_item}
				return
			endif
		endif
	endif
	<parent> :GetSingleTag no_highlight_bar
	if NOT GotParam \{dims}
		if NOT GotParam \{selection_width}
			<parent> :GetSingleTag selection_width
		endif
		if NOT GotParam \{selection_height}
			<parent> :GetSingleTag selection_height
		endif
		dims = (((0.0, 1.0) * <selection_height>) + ((1.0, 0.0) * <selection_width>))
		dims = (<dims> + <icon_padding>)
		if NOT GotParam \{highlight_dims}
			highlight_dims = (<dims> - (0.0, 10.0))
		endif
	else
		dims = (<dims> + <icon_padding>)
	endif
	<parent> :GetSingleTag centered
	if GotParam \{centered}
		child_anchor = [center center]
		text_just = [center center]
		text_offset = (0.0, 0.0)
	endif
	<parent> :GetSingleTag color_scheme
	<parent> :GetSingleTag extra_z
	if NOT GotParam \{color_scheme}
		color_scheme = $cas_color_scheme
	endif
	if NOT GotParam \{rgba}
		<rgba> = ($default_color_scheme.text_color)
	endif
	if NOT GotParam \{extra_rgba}
		extra_rgba = ($default_color_scheme.text_color)
	endif
	if GotParam \{id}
		if ScreenElementExists id = <id>
			RemoveParameter \{id}
		endif
	endif
	if GotParam \{heading}
		AddParams \{not_focusable}
		<rgba> = [200 70 70 255]
	endif
	if GotParam \{not_focusable}
		if GotParam \{heading}
		else
			if IsArray <rgba>
				clrval = (<rgba> [0] * 0.75)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 0 NewValue = <clrval>
				clrval = (<rgba> [1] * 0.75)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 1 NewValue = <clrval>
				clrval = (<rgba> [2] * 0.75)
				CastToInteger \{clrval}
				SetArrayElement ArrayName = rgba index = 2 NewValue = <clrval>
			endif
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			not_focusable
		}
	else
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			id = <id>
			local_id = <local_id>
			dims = <dims>
			rot_angle = <rot>
			alpha = <alpha>
			just = <just>
			child_anchor = <child_anchor>
			dims = <dims>
		}
		if GotParam \{tag_grid_x}
			<id> :SetTags tag_grid_x = <tag_grid_x> tag_length = <length>
		else
			<id> :SetTags tag_length = <length>
		endif
	endif
	<container_id> = <id>
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
	if GotParam \{children}
		GetArraySize \{children}
		<i> = 0
		begin
		if NOT StructureContains structure = (<children> [<i>]) NULL
			CreateScreenElement {
				z_priority = (10 + <extra_z>)
				(<children> [<i>])
				parent = <container_id>
			}
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if ((<additional_focus_script> = nullscript) && (<additional_unfocus_script> = nullscript))
		if (<pad_choose_script> = nullscript)
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				]
			}
		else
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [
					{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
					{pad_choose <pad_choose_sound>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
	else
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{focus <focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{unfocus <unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> scale_highlight_text = <scale_highlight_text>}}
				{pad_choose <pad_choose_sound>}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{focus <additional_focus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_focus_params>}}
				{unfocus <additional_unfocus_script> params = {parent = <parent> parent_anchor = <parent_anchor> id = <container_id> <additional_unfocus_params>}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_square <pad_square_script> params = {id = <container_id> <pad_square_params>}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_start <pad_start_script> params = {id = <container_id> <pad_start_params>}}
			]
		}
	endif
	<container_id> :SetTags text_offset = <text_offset>
	<container_id> :SetTags just = <just>
	<container_id> :SetTags rgba = <rgba>
	<container_id> :SetTags extra_rgba = <extra_rgba>
	<parent_anchor> :GetSingleTag scrolling_num_options
	if GotParam \{scrolling_num_options}
		<container_id> :SetTags scrolling_option = <scrolling_num_options>
		<scrolling_num_options> = (<scrolling_num_options> + 1)
		<parent_anchor> :SetTags scrolling_num_options = <scrolling_num_options>
	endif
	<parent_anchor> :GetSingleTag num_options
	if GotParam \{num_options}
		<num_options> = (<num_options> + 1)
		<parent_anchor> :SetTags num_options = <num_options>
	endif
	text_scale = <Scale>
	if NOT GotParam \{icon}
		icon = menu_history_unknown
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		local_id = icon_texture
		texture = <icon>
		Scale = <icon_scale>
		internal_just = [left center]
		Pos = <icon_offset>
		rot_angle = <icon_rot>
		z_priority = (10 + <extra_z>)
		dims = <icon_dims>
	}
	if (<text_case> = lower)
		GetLowerCaseString <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		GetUpperCaseString <text>
		<text> = <UppercaseString>
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = ($test_menu_font)
		text = <text>
		rgba = <rgba>
		Scale = <text_scale>
		just = <text_just>
		Pos = <text_offset>
		z_priority = (10 + <extra_z>)
		dims = (((1.0, 0.0) * (<dims> [0])) + (0.0, 50.0))
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	menu_item_resize id = <container_id>
	if <parent> :GetSingleTag additional_create_script
		<additional_create_script> <...>
	endif
	SetScreenElementLock id = <parent> On
	SetScreenElementLock id = <parent> OFF
	return item_container_id = <container_id>
endscript

script menu_item_resize_extras 
	<id> :GetSingleTag extras_offset
	<id> :GetSingleTag arrow_offset
	if ScreenElementExists id = {<id> child = extra_text}
		GetScreenElementDims id = <id>
		if ScreenElementExists id = {<id> child = arrow_left}
			SetScreenElementProps {
				id = {<id> child = arrow_left}
				Pos = (((1.0, 0.0) * <width>) + <extras_offset>)
			}
			SetScreenElementProps {
				id = {<id> child = extra_text}
				Pos = (((1.0, 0.0) * <width>) + <arrow_offset> + <extras_offset>)
			}
			SetScreenElementProps {
				id = {<id> child = arrow_right}
				Pos = (((1.0, 0.0) * <width>) + <arrow_offset> + <arrow_offset> + <extras_offset>)
			}
		endif
	endif
endscript

script menu_item_resize 
	menu_item_resize_extras id = <id>
endscript

script menu_item_focus \{parent_anchor = current_menu_anchor
		parent = current_menu}
	on_color = [200 70 70 255]
	<id> :GetSingleTag scrolling_option
	<parent> :GetSingleTag color_scheme
	on_color = (<color_scheme>.text_focus_color)
	SetScreenElementProps {
		id = {<id> child = text}
		rgba = [255 255 255 255]
	}
	if ScreenElementExists id = {<id> child = extra_text}
		SetScreenElementProps {
			id = {<id> child = extra_text}
			rgba = <on_color>
		}
	endif
	if GotParam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 Scale = 1.25 relative_scale
		endif
	endif
	if ScreenElementExists id = <parent>
		if <parent> :GetSingleTag additional_focus_script
			<additional_focus_script> <...>
		endif
	endif
	if GotParam \{scrolling_option}
		<parent_anchor> :GetSingleTag scrolling_num_options
		menu_update_scrollbar parent = <parent> parent_anchor = <parent_anchor> option = <scrolling_option> num_options = <scrolling_num_options>
	endif
	if ScreenElementExists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 1.0 time = 0.1
	endif
endscript

script menu_update_scrollbar \{parent_anchor = current_menu_anchor}
	if <parent_anchor> :GetSingleTag scroll_bar_id
		<parent_anchor> :GetSingleTag scroll_bar_len
		<parent_anchor> :GetSingleTag scroll_bar_option
		if (<num_options> > 1)
			pos_fraction = ((<option> * 1.0) / (<num_options> - 1.0))
			pos_length = (<scroll_bar_len> * <pos_fraction>)
			Pos = (<pos_length> * (0.0, 1.0))
		endif
		if ScreenElementExists id = {<scroll_bar_id> child = zipper}
			<parent_anchor> :SetTags scroll_bar_option = <option>
			legacydoscreenelementmorph id = {<scroll_bar_id> child = zipper} Pos = (<Pos>)
		endif
	endif
endscript

script menu_item_unfocus \{parent = current_menu}
	<id> :GetSingleTag rgba
	<id> :GetSingleTag extra_rgba
	SetScreenElementProps {
		id = {<id> child = text}
		rgba = <rgba>
	}
	if ScreenElementExists id = {<id> child = extra_text}
		SetScreenElementProps {
			id = {<id> child = extra_text}
			rgba = <extra_rgba>
		}
	endif
	if GotParam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 Scale = 1.0 relative_scale
		endif
	endif
	if ScreenElementExists id = {<id> child = highlight}
		legacydoscreenelementmorph id = {<id> child = highlight} alpha = 0.0 time = 0.5
	endif
	if ScreenElementExists id = <parent>
		if <parent> :GetSingleTag additional_unfocus_script
			<additional_unfocus_script> <...>
		endif
	endif
endscript

script add_menu_flag_item \{toggle_script = menu_toggle_flag}
	if NOT GotParam \{flag}

		return
	endif
	if NOT GotParam \{toggle_params}
		toggle_params = {flag = <flag>}
	endif
	if GetGlobalFlag flag = <flag>
		if GotParam \{reverse}
			toggle = OFF
			reverse = reverse
		else
			toggle = On
		endif
	else
		if GotParam \{reverse}
			toggle = On
			reverse = reverse
		else
			toggle = OFF
		endif
	endif
	add_menu_item <...> toggle_script = <toggle_script> toggle_params = <toggle_params>
endscript

script menu_toggle_flag 
	if GetGlobalFlag flag = <flag>
		UnsetGlobalFlag flag = <flag>
	else
		setglobalflag flag = <flag>
	endif
endscript

script menu_toggle_item 
	<id> :GetSingleTag toggle
	if (<toggle> = On)
		<toggle> = OFF
		if ScreenElementExists id = {<id> child = extra_text}
			SetScreenElementProps id = {<id> child = extra_text} text = qs(0x87289b63)
		endif
	else
		<toggle> = On
		if ScreenElementExists id = {<id> child = extra_text}
			SetScreenElementProps id = {<id> child = extra_text} text = qs(0x9feda83b)
		endif
	endif
	<id> :SetTags toggle = <toggle>
	if GotParam \{toggle_script}
		<toggle_script> <toggle_params>
	endif
endscript

script menu_checkbox_sound 
	SoundEvent \{event = ui_toggle_checkbox_sfx}
endscript

script animate_in 
	SetButtonEventMappings \{block_menu_input}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = entering
		}}
	LaunchEvent Type = focus target = <menu_id>
	legacydomorph \{time = 0.05
		rot_angle = 3
		Pos = (40.0, 0.0)
		alpha = 1}
	legacydomorph \{time = 0.01
		rot_angle = 0
		Pos = (10.0, 0.0)}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = On
		}}
	if NOT GotParam \{dont_unblock}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script menu_onscreen \{menu_id = current_menu_anchor}
	legacydomorph \{Scale = 2
		time = 0}
	if GotParam \{Pos}
		legacydomorph Pos = <Pos>
	endif
	se_setprops \{just = [
			center
			center
		]}
	GetTags
	Obj_GetID
	<id> = <objID>
	if GotParam \{focus_child}
		LaunchEvent Type = focus target = <menu_id> data = {child_id = <focus_child>}
	else
		LaunchEvent Type = focus target = <id>
	endif
	if NOT GotParam \{preserve_menu_state}
		SetScreenElementProps \{id = root_window
			tags = {
				menu_state = On
			}}
	endif
endscript

script animate_out \{menu_id = current_menu_anchor}
	SetButtonEventMappings \{block_menu_input}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = leaving
		}}
	GetTags
	Obj_GetID
	<id> = <objID>
	se_setprops \{just = [
			center
			center
		]}
	legacydomorph \{time = 0
		Scale = 1.0}
	legacydomorph \{time = 0.3
		alpha = 0}
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = OFF
		}}
	SetScreenElementLock \{id = root_window
		OFF}
	DestroyScreenElement id = <menu_id>
	SetButtonEventMappings \{unblock_menu_input}
endscript

script menu_offscreen 
	SetScreenElementProps \{id = root_window
		tags = {
			menu_state = OFF
		}}
	SetScreenElementLock \{id = root_window
		OFF}
	Obj_GetID
	<id> = <objID>
	LaunchEvent Type = unfocus target = <id>
	DestroyScreenElement id = <id> recurse
endscript

script hide_root_window 
	SetScreenElementProps \{id = root_window
		Hide}
endscript

script menu_icon_focus \{parent = current_menu}
	on_color = [200 70 70 255]
	<id> :GetSingleTag scrolling_option
	<parent> :GetSingleTag color_scheme
	on_color = (<color_scheme>.text_focus_color)
	SetScreenElementProps {
		id = {<id> child = text}
		rgba = <on_color>
		alpha = 1
	}
	if ScreenElementExists id = {<id> child = extra_text}
		SetScreenElementProps {
			id = {<id> child = extra_text}
			rgba = <on_color>
		}
	endif
	if GotParam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 Scale = 1.25 relative_scale
		endif
	endif
	if ScreenElementExists id = <parent>
		if <parent> :GetSingleTag additional_focus_script
			<additional_focus_script> <...>
		endif
	endif
	if GotParam \{scrolling_option}
		<parent_anchor> :GetSingleTag scrolling_num_options
		menu_update_scrollbar parent = <parent> parent_anchor = <parent_anchor> option = <scrolling_option> num_options = <scrolling_num_options>
	endif
	<parent> :GetSingleTag no_highlight_bar
	if NOT GotParam \{no_highlight_bar}
		if ScreenElementExists id = {<parent_anchor> child = highlight_bars}
			GetScreenElementPosition id = {<id> child = text} summed
			GetScreenElementDims id = {<id> child = text}
			0xc446b6d3 = 10.0
			Scale = (((1.0, 0.0) * (((<width> + (<0xc446b6d3> * 2)) / 256.0))) + (0.0, 1.0))
			SetScreenElementProps {
				id = {<parent_anchor> child = highlight_bars}
				Pos = {absolute <screenelementpos>}
				Scale = <Scale>
			}
		endif
	endif
endscript

script menu_icon_unfocus \{parent = current_menu}
	<id> :GetSingleTag rgba
	<id> :GetSingleTag extra_rgba
	SetScreenElementProps {
		id = {<id> child = text}
		rgba = <rgba>
	}
	if ScreenElementExists id = {<id> child = extra_text}
		SetScreenElementProps {
			id = {<id> child = extra_text}
			rgba = <extra_rgba>
		}
	endif
	if GotParam \{scale_highlight_text}
		if (<scale_highlight_text>)
			legacydoscreenelementmorph id = {<id> child = text} time = 0.05 Scale = 1.0 relative_scale
		endif
	endif
	if ScreenElementExists \{id = current_menu}
		if <parent> :GetSingleTag additional_unfocus_script
			<additional_unfocus_script> <...>
		endif
	endif
endscript

script 0x05039c3f 
	dims = (256.0, 64.0)
	0x638b9bc5 = highlight_bars
	highlight_id = highlight
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent_id>
		local_id = <0x638b9bc5>
		dims = <dims>
		Pos = <Pos>
		just = [0.0 0.0]
		pos_anchor = [0.0 0.0]
		z_priority = <z_priority>
	}
	0x638b9bc5 = <id>
	z_priority = (<z_priority> / 2.0)
	CreateScreenElement {
		Type = descinterface
		desc = 'gh5_highlight_bar'
		parent = <id>
		local_id = <highlight_id>
		dims = <dims>
		just = [0.0 0.0]
		pos_anchor = [0.0 0.0]
		z_priority = <z_priority>
		Pos = (0.0, 0.0)
	}
	highlight_id = <id>
	<parent_id> :obj_spawnscript 0x63332911 params = {0x638b9bc5 = <0x638b9bc5>}
	return 0x638b9bc5 = <0x638b9bc5> highlight_id = <highlight_id>
endscript
