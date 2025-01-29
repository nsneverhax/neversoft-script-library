button_widget_up_sound = menu_scroll_up
button_widget_down_sound = menu_scroll_down
button_widget_choose_sound = ui_sfx_select
button_widget_unchoose_sound = ui_sfx_select
button_widget_unfocus_rgba = [
	149
	48
	48
	255
]
backing_uninit_rgba = [
	149
	48
	48
	255
]
backing_init_rgba = [
	200
	60
	60
	255
]

script button_widget_add_item \{widget_id = widget
		button_icon = button_type_1
		parent_id = current_menu
		pad_up_script = debug_widget_up_script
		pad_down_script = debug_widget_down_script
		min = 0.0
		Max = 0.0
		step = 0.0
		start_value = 0
		z_priority = 5
		fill_type = `center	up/down`
		Pos = (0.0, 0.0)
		dims = (375.0, 95.0)
		text_offset = (120.0, 15.0)
		text_case = upper}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent_id>
		id = <widget_id>
		event_handlers = [
			{pad_choose init_button_widget params = {widget_id = <widget_id> init_helper_text = <init_helper_text> deinit_helper_text = <deinit_helper_text>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
		]
		z_priority = <z_priority>
		just = [left , top]
		dims = <dims>
	}
	if NOT GotParam \{no_cas_handlers}
		setup_cas_menu_handlers vmenu_id = <widget_id> camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <widget_id>
		dims = (90.0, 90.0)
		just = [left , top]
		Pos = (5.0, 0.0)
	}
	icon_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = list_highlight
		Pos = <Pos>
		alpha = 0
		z_priority = (<z_priority> + 1)
		dims = (90.0, 90.0)
		just = [left , top]
	}
	highlight_id = <id>
	button_widget_find_fill value = (<start_value> * 1.0) min = <min> Max = <Max>
	fill_texture = white
	Frame = widget_frame
	rot_angle = 0
	if checksumequals a = <fill_type> b = `bottom	to	top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
		back_pos = ((4.0, 0.0) + 84 * (0.0, 1.0))
		back_just = [left , bottom]
		back_pos_anchor = [left , top]
	elseif checksumequals a = <fill_type> b = `left	to	right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
		back_pos = (4.0, 4.0)
		back_just = [left , top]
		back_pos_anchor = [left , top]
	elseif checksumequals a = <fill_type> b = `center	left/right`
		back_scale = ((((<start_value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		endif
		back_pos = <Pos>
		back_just = [left , center]
		back_pos_anchor = [center , center]
	elseif checksumequals a = <fill_type> b = `center	up/down`
		back_scale = ((((<start_value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		endif
		back_pos = <Pos>
		back_just = [center , bottom]
		back_pos_anchor = [center , center]
	elseif checksumequals a = <fill_type> b = `center	out`
		back_just = [center , center]
		back_pos = (0.0, 0.0)
		back_pos_anchor = [center , center]
		fill_texture = fill_circle
		back_scale = (<fill_perc> * (1.0, 1.0))
		Frame = widget_frame_round
	else

	endif
	if GotParam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = <fill_texture>
		material = NULL
		rgba = ($backing_uninit_rgba)
		dims = (80.0, 80.0)
		Scale = <back_scale>
		Pos = <back_pos>
		z_priority = (<z_priority> + 2)
		pos_anchor = [center , bottom]
		just = <back_just>
		pos_anchor = <back_pos_anchor>
		rot_angle = <rot_angle>
	}
	backing_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = <button_icon>
		z_priority = (<z_priority> + 3)
		rgba = ($button_widget_unfocus_rgba)
		rot_angle = <icon_rot>
		dims = (70.0, 70.0)
		pos_anchor = [center , center]
		Pos = (0.0, 0.0)
	}
	button_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = <Frame>
		z_priority = (<z_priority> + 4)
		dims = (90.0, 90.0)
		just = [left , top]
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
		parent = <widget_id>
		text = <text>
		Pos = <text_offset>
		z_priority = (<z_priority> + 4)
		font = ($test_menu_font)
		dims = (260.0, 55.0)
		just = [left , top]
		rgba = [0 0 0 255]
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	text_id = <id>
	if GotParam \{invert}
		invert = {invert}
	endif
	<widget_id> :SetTags {
		parent_id = <parent_id>
		pad_up_script = <pad_up_script>
		pad_up_params = {<pad_up_params> widget_id = <widget_id>}
		pad_down_script = <pad_down_script>
		pad_down_params = {<pad_down_params> widget_id = <widget_id>}
		pad_left_script = <pad_left_script>
		pad_left_params = {<pad_left_params> widget_id = <widget_id>}
		pad_right_script = <pad_right_script>
		pad_right_params = {<pad_right_params> widget_id = <widget_id>}
		deinit_script = <deinit_script>
		deinit_params = {<deinit_params> widget_id = <widget_id>}
		init_script = <init_script>
		init_params = {<init_params> widget_id = <widget_id>}
		accept_script = <accept_script>
		accept_params = {<accept_params> widget_id = <widget_id>}
		min = (<min> * 1.0)
		Max = (<Max> * 1.0)
		step = (<step> * 1.0)
		value = (<start_value> * 1.0)
		start_value = <start_value>
		backing_id = <backing_id>
		highlight_id = <highlight_id>
		fill_type = <fill_type>
		text_id = <text_id>
		button_id = <button_id>
		<invert>
	}
	<parent_id> :GetTags
	if GotParam \{total_length}
		GetScreenElementDims id = <parent_id>
		parent_height = <height>
		GetScreenElementDims id = <widget_id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)

			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent_id> :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims id = <id>
		<parent_id> :SetTags {total_length = <height>}
	endif
endscript

script init_button_widget 
	<widget_id> :GetTags
	<widget_id> :SetTags {start_value = <value>}
	LaunchEvent Type = unfocus target = <parent_id>
	LaunchEvent Type = focus target = <widget_id>
	<event_handlers> = [
		{pad_back deinit_button_widget params = {widget_id = <widget_id> deinit_helper_text = <deinit_helper_text> run_deinit}}
		{pad_choose deinit_button_widget params = {widget_id = <widget_id> deinit_helper_text = <deinit_helper_text>}}
		{pad_up up_button_widget params = {widget_id = <widget_id>}}
		{pad_down down_button_widget params = {widget_id = <widget_id>}}
	]
	if GotParam \{pad_left_script}
		<additional_handlers> = [
			{pad_right up_button_widget params = {widget_id = <widget_id>}}
			{pad_left down_button_widget params = {widget_id = <widget_id>}}
		]
		event_handlers = (<event_handlers> + <additional_handlers>)
	endif
	SetScreenElementProps {
		id = <widget_id>
		event_handlers = <event_handlers>
		replace_handlers
	}
	SetScreenElementProps {
		id = <backing_id>
		rgba = ($backing_init_rgba)
	}
	SoundEvent event = ($button_widget_choose_sound)
	SetScreenElementProps {
		id = <button_id>
		rgba = [255 255 255 255]
	}
	if GotParam \{init_helper_text}
		clean_up_user_control_helpers
		menu_finish <init_helper_text>
	endif
	if GotParam \{init_script}
		<init_script> <init_params>
	endif
endscript

script focus_button_widget 
	set_generic_menu_scrollbar_pos id = <widget_id>
	if generic_menu :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframes}
		<resolved_id> :se_setprops alpha = 1
		<widget_id> :GetSingleTag text_id
		GetScreenElementChildren id = <text_id>
		GetScreenElementDims id = (<children> [0])
		Scale = (((1.0, 0.0) * (((<width> + 10.0) / 256.0))) + (0.0, 1.2))
		offset = ((1.0, 0.0) * (<width> / 2) + (3.0, 30.0))
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset>)} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = (<children> [0]) summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset>)} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script unfocus_button_widget 
endscript

script deinit_button_widget 
	<widget_id> :GetTags parent_id
	LaunchEvent Type = unfocus target = <widget_id>
	LaunchEvent Type = focus target = <parent_id>
	SetScreenElementProps {
		id = <widget_id>
		event_handlers = [
			{pad_choose init_button_widget params = {widget_id = <widget_id>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
			{pad_left nullscript}
			{pad_right nullscript}
		]
		replace_handlers
	}
	SetScreenElementProps {
		id = <button_id>
		rgba = ($button_widget_unfocus_rgba)
	}
	SetScreenElementProps {
		id = <backing_id>
		rgba = ($backing_uninit_rgba)
	}
	SoundEvent event = ($button_widget_unchoose_sound)
	if GotParam \{deinit_helper_text}
		clean_up_user_control_helpers
		menu_finish <deinit_helper_text>
	endif
	if GotParam \{run_deinit}
		button_widget_set_value widget_id = <widget_id> new_value = (<start_value> * 1.0)
		if GotParam \{pad_left_script}
			<pad_left_script> {<pad_left_params> value = (<start_value> * 1.0)}
		else
			<pad_up_script> {<pad_up_params> value = (<start_value> * 1.0)}
		endif
	endif
	if GotParam \{deinit_script}
		<deinit_script> <deinit_params>
	endif
endscript

script up_button_widget 

	<widget_id> :GetTags
	if GotParam \{invert}
		value = (<value> - <step>)
		if (<value> < <min>)
			value = <min>
		endif
	else
		value = (<value> + <step>)
		if (<value> > <Max>)
			value = <Max>
		endif
	endif
	button_widget_find_fill value = <value> min = <min> Max = <Max>
	rot_angle = 0
	if checksumequals a = <fill_type> b = `bottom	to	top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `left	to	right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `center	left/right`
		back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center	up/down`
		back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center	out`
		back_scale = (<fill_perc> * (1.0, 1.0))
	endif
	if GotParam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	if ScreenElementExists id = <backing_id>
		SetScreenElementProps {
			id = <backing_id>
			Scale = <back_scale>
			rot_angle = <rot_angle>
		}
	endif
	<widget_id> :SetTags {value = <value>}
	PlaySound menu_entername_scroll_1 vol = -1 pitch_percent = ((<fill_perc> * 40.0) + 60) buss = Front_End
	if GotParam \{pad_left_script}
		<pad_left_script> {<pad_left_params> value = <value>}
	else
		<pad_up_script> {<pad_up_params> value = <value>}
	endif
endscript

script down_button_widget 

	<widget_id> :GetTags
	if GotParam \{invert}
		value = (<value> + <step>)
		if (<value> > <Max>)
			value = <Max>
		endif
	else
		value = (<value> - <step>)
		if (<value> < <min>)
			value = <min>
		endif
	endif
	button_widget_find_fill value = <value> min = <min> Max = <Max>
	rot_angle = 0
	if checksumequals a = <fill_type> b = `bottom	to	top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `left	to	right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `center	left/right`
		back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center	up/down`
		back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center	out`
		back_scale = (<fill_perc> * (1.0, 1.0))
	endif
	if GotParam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	if ScreenElementExists id = <backing_id>
		SetScreenElementProps {
			id = <backing_id>
			Scale = <back_scale>
			rot_angle = <rot_angle>
		}
	endif
	<widget_id> :SetTags {value = <value>}
	PlaySound menu_entername_scroll_1 vol = -1 pitch_percent = ((<fill_perc> * 40.0) + 60) buss = Front_End
	if GotParam \{pad_right_script}
		<pad_right_script> {<pad_right_params> value = <value>}
	else
		<pad_down_script> {<pad_down_params> value = <value>}
	endif
endscript

script button_generic_set_value 

	if ScreenElementExists id = <id>
		<id> :GetTags
		if (<new_value> = true)
			alpha = 1
		else
			alpha = 0
		endif
		SetScreenElementProps {
			id = <backing_id>
			alpha = <alpha>
		}
		<backing_id> :SetTags On = <new_value>
	endif
endscript

script button_widget_set_value 

	if ScreenElementExists id = <widget_id>
		<widget_id> :GetTags
		value = <new_value>
		button_widget_find_fill value = <value> min = <min> Max = <Max>
		if checksumequals a = <fill_type> b = `bottom	to	top`
			back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
		elseif checksumequals a = <fill_type> b = `left	to	right`
			back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
		elseif checksumequals a = <fill_type> b = `center	left/right`
			back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
			if (<back_scale>.(1.0, 0.0) < 0)
				rot_angle = 180
			else
				rot_angle = 0
			endif
		elseif checksumequals a = <fill_type> b = `center	up/down`
			back_scale = ((((<value> - <min>) - (<Max> - <min>) * 0.5) / (<Max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
			if (<back_scale>.(0.0, 1.0) < 0)
				rot_angle = 180
			else
				rot_angle = 0
			endif
		elseif checksumequals a = <fill_type> b = `center	out`
			back_scale = (<fill_perc> * (1.0, 1.0))
		endif
		if ScreenElementExists id = <backing_id>
			SetScreenElementProps {
				id = <backing_id>
				Scale = <back_scale>
				rot_angle = <rot_angle>
			}
		endif
		<widget_id> :SetTags {value = <value>}
	endif
endscript

script button_widget_find_fill 

	if (<Max> = <min>)
		return \{fill_perc = 0}
	endif
	fill_perc = ((<value> - <min>) / (<Max> - <min>))
	return fill_perc = <fill_perc>
endscript

script debug_widget_up_script 

endscript

script debug_widget_down_script 

endscript

script rot_widget_add_item \{widget_id = widget
		button_icon = button_type_1
		parent_id = current_menu
		pad_up_script = debug_widget_up_script
		pad_down_script = debug_widget_down_script
		Pos = (0.0, 0.0)
		min = 0.0
		Max = 0.0
		step = 0.0
		start_value = 0
		z_priority = 100
		text_offset = (120.0, 15.0)
		text_scale = 1.5
		text_case = upper
		fill_type = `counter	clockwise`
		dims = (375.0, 95.0)}
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent_id>
		id = <widget_id>
		Scale = <Scale>
		event_handlers = [
			{pad_choose init_rotate_widget params = {widget_id = <widget_id>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
		]
		z_priority = <z_priority>
		just = [left , bottom]
		Pos = <Pos>
		dims = <dims>
	}
	if NOT GotParam \{no_cas_handlers}
		setup_cas_menu_handlers vmenu_id = <widget_id> camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	button_widget_find_fill value = <start_value> min = <min> Max = <Max>
	CreateScreenElement {
		Type = ContainerElement
		parent = <widget_id>
		dims = (90.0, 90.0)
		just = [left , top]
	}
	icon_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = list_highlight
		Pos = <Pos>
		alpha = 0
		z_priority = (<z_priority> + 1)
		dims = (90.0, 90.0)
		just = [left , top]
	}
	highlight_id = <id>
	CreateScreenElement {
		Type = ContainerElement
		parent = <icon_id>
		z_priority = (<z_priority> + 2)
		dims = (70.0, 70.0)
		Pos = <Pos>
		just = [left , top]
		pos_anchor = [center , center]
	}
	backing_id = <id>
	if checksumequals a = <fill_type> b = `counter	clockwise`
		rot_dir = -3
	elseif checksumequals a = <fill_type> b = clockwise
		rot_dir = 3
	else

	endif
	end_inc = (120 * <start_value> / <Max>)
	i = 0
	begin
	if (<i> > <end_inc>)
		alpha = 0
	else
		alpha = 1
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <backing_id>
		rot_angle = (<rot_dir> * <i>)
		alpha = <alpha>
		just = [center , center]
		pos_anchor = [center , center]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <id>
		texture = white
		rgba = ($backing_uninit_rgba)
		dims = (40.0, 4.0)
		z_priority = (<z_priority> + 2)
		pos_anchor = [left , center]
		Pos = (16.0, 0.0)
	}
	i = (<i> + 1)
	repeat 120
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = <button_icon>
		Pos = <Pos>
		z_priority = (<z_priority> + 3)
		rot_angle = <icon_rot>
		dims = (70.0, 70.0)
		just = [center , center]
		pos_anchor = [center , center]
	}
	button_id = <id>
	if (<text_case> = lower)
		GetLowerCaseString <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		GetUpperCaseString <text>
		<text> = <UppercaseString>
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <widget_id>
		text = <text>
		Pos = <text_offset>
		z_priority = (<z_priority> + 4)
		font = ($test_menu_font)
		dims = (260.0, 55.0)
		just = [left , top]
		rgba = [0 0 0 255]
		fit_height = `scale	down	if	larger`
		fit_width = `scale	each	line	if	larger`
	}
	text_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <icon_id>
		texture = widget_frame_round
		Pos = <Pos>
		z_priority = (<z_priority> + 4)
		dims = (90.0, 90.0)
		just = [left , top]
	}
	if GotParam \{wrap}
		wrap = 1
	endif
	if GotParam \{sweep}
		sweep = 1
	endif
	<widget_id> :SetTags {
		parent_id = <parent_id>
		pad_up_script = <pad_up_script>
		pad_up_params = {<pad_up_params> widget_id = <widget_id>}
		pad_down_script = <pad_down_script>
		pad_down_params = {<pad_down_params> widget_id = <widget_id>}
		min = (<min> * 1.0)
		Max = (<Max> * 1.0)
		step = (<step> * 1.0)
		value = (<start_value> * 1.0)
		start_value = <start_value>
		backing_id = <backing_id>
		highlight_id = <highlight_id>
		fill_type = <fill_type>
		text_id = <text_id>
		button_id = <button_id>
		wrap = <wrap>
		sweep = <sweep>
		deinit_script = <deinit_script>
		deinit_params = {<deinit_params> widget_id = <widget_id>}
		init_script = <init_script>
		init_params = {<init_params> widget_id = <widget_id>}
		accept_script = <accept_script>
		accept_params = {<accept_params> widget_id = <widget_id>}
	}
	<parent_id> :GetTags
	if GotParam \{total_length}
		GetScreenElementDims id = <parent_id>
		parent_height = <height>
		GetScreenElementDims id = <widget_id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)

			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent_id> :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims id = <id>
		<parent_id> :SetTags {total_length = <height>}
	endif
endscript

script init_rotate_widget 
	<widget_id> :GetTags
	<widget_id> :SetTags {start_value = <value>}
	LaunchEvent Type = unfocus target = <parent_id>
	LaunchEvent Type = focus target = <widget_id>
	SetScreenElementProps {
		id = <widget_id>
		event_handlers = [
			{pad_up up_rotate_widget params = {widget_id = <widget_id>}}
			{pad_down down_rotate_widget params = {widget_id = <widget_id>}}
			{pad_back deinit_rotate_widget params = {widget_id = <widget_id> run_deinit}}
			{pad_choose deinit_rotate_widget params = {widget_id = <widget_id>}}
		]
		replace_handlers
	}
	SetScreenElementProps {
		id = <button_id>
		rgba = [255 255 255 255]
	}
	GetScreenElementChildren id = <backing_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) rgba = ($backing_init_rgba)
	k = (<k> + 1)
	repeat <array_Size>
	SoundEvent event = ($button_widget_choose_sound)
	if GotParam \{init_script}
		<init_script> <init_params>
	endif
endscript

script deinit_rotate_widget 
	<widget_id> :GetTags parent_id
	LaunchEvent Type = unfocus target = <widget_id>
	LaunchEvent Type = focus target = <parent_id>
	SetScreenElementProps {
		id = <widget_id>
		event_handlers = [
			{pad_choose init_rotate_widget params = {widget_id = <widget_id>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
		]
		replace_handlers
	}
	SetScreenElementProps {
		id = <button_id>
		rgba = ($button_widget_unfocus_rgba)
	}
	GetScreenElementChildren id = <backing_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) rgba = ($backing_uninit_rgba)
	k = (<k> + 1)
	repeat <array_Size>
	SoundEvent event = ($button_widget_unchoose_sound)
	if GotParam \{run_deinit}
		rotate_widget_set_value widget_id = <widget_id> new_value = (<start_value> * 1.0)
		if GotParam \{pad_left_script}
			<pad_left_script> {<pad_left_params> value = (<start_value> * 1.0)}
		else
			<pad_up_script> {<pad_up_params> value = (<start_value> * 1.0)}
		endif
	endif
	if GotParam \{deinit_script}
		<deinit_script> <deinit_params>
	endif
endscript

script up_rotate_widget 

	<widget_id> :GetTags
	value = (<value> + <step>)
	if (<value> > <Max>)
		if GotParam \{wrap}
			value = <min>
		else
			value = <Max>
		endif
	endif
	end_inc = (119 * <value> / <Max>)
	button_widget_find_fill value = <value> min = <min> Max = <Max>
	GetScreenElementChildren id = <backing_id>
	GetArraySize <children>
	k = 0
	begin
	if GotParam \{sweep}
		if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
			SetScreenElementProps id = (<children> [<k>]) alpha = 1
		else
			SetScreenElementProps id = (<children> [<k>]) alpha = 0
		endif
	else
		if (<k> < <end_inc>)
			SetScreenElementProps id = (<children> [<k>]) alpha = 1
		else
			SetScreenElementProps id = (<children> [<k>]) alpha = 0
		endif
	endif
	k = (<k> + 1)
	repeat <array_Size>
	<widget_id> :SetTags {value = <value>}
	PlaySound \{menu_entername_scroll_3
		vol_percent = 100
		buss = Front_End}
	<pad_up_script> {<pad_up_params> value = <value>}
endscript

script down_rotate_widget 

	<widget_id> :GetTags
	value = (<value> - <step>)
	if (<value> < <min>)
		if GotParam \{wrap}
			value = <Max>
		else
			value = <min>
		endif
	endif
	end_inc = (119 * <value> / <Max>)
	button_widget_find_fill value = <value> min = <min> Max = <Max>
	GetScreenElementChildren id = <backing_id>
	GetArraySize <children>
	k = 0
	begin
	if GotParam \{sweep}
		if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
			SetScreenElementProps id = (<children> [<k>]) alpha = 1
		else
			SetScreenElementProps id = (<children> [<k>]) alpha = 0
		endif
	else
		if (<k> < <end_inc>)
			SetScreenElementProps id = (<children> [<k>]) alpha = 1
		else
			SetScreenElementProps id = (<children> [<k>]) alpha = 0
		endif
	endif
	k = (<k> + 1)
	repeat <array_Size>
	<widget_id> :SetTags {value = <value>}
	PlaySound \{menu_entername_scroll_3
		vol_percent = 100
		buss = Front_End}
	<pad_down_script> {<pad_down_params> value = <value>}
endscript

script rotate_widget_set_value 

	if ScreenElementExists id = <widget_id>
		<widget_id> :GetTags
		value = <new_value>
		end_inc = (119 * <value> / <Max>)
		button_widget_find_fill value = <value> min = <min> Max = <Max>
		GetScreenElementChildren id = <backing_id>
		GetArraySize <children>
		k = 0
		begin
		if GotParam \{sweep}
			if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
				SetScreenElementProps id = (<children> [<k>]) alpha = 1
			else
				SetScreenElementProps id = (<children> [<k>]) alpha = 0
			endif
		else
			if (<k> < <end_inc>)
				SetScreenElementProps id = (<children> [<k>]) alpha = 1
			else
				SetScreenElementProps id = (<children> [<k>]) alpha = 0
			endif
		endif
		k = (<k> + 1)
		repeat <array_Size>
		<widget_id> :SetTags {value = <value>}
	endif
endscript

script add_generic_menu_button_icon_item \{On = FALSE}
	add_generic_menu_icon_item <...>
	CreateScreenElement {
		parent = <item_container_id>
		Type = SpriteElement
		texture = white
		dims = (74.0, 74.0)
		Pos = (8.0, 8.0)
		just = [left , top]
		rgba = ($backing_init_rgba)
		relative_z_priority = -0.5
	}
	<id> :SetTags {On = <On>}
	<item_container_id> :SetTags {backing_id = <id>}
	if (<On> = FALSE)
		SetScreenElementProps id = <id> alpha = 0
	else
		SetScreenElementProps id = <id> alpha = 1
	endif
	SetScreenElementProps {
		id = <item_container_id>
		event_handlers = [
			{pad_choose test_button_choose params = {id = <id>}}
		]
	}
	return item_container_id = <item_container_id>
endscript

script test_button_choose 
	<id> :GetSingleTag On
	if (<On> = FALSE)
		On = true
		SetScreenElementProps id = <id> alpha = 1
	else
		On = FALSE
		SetScreenElementProps id = <id> alpha = 0
	endif
	<id> :SetTags {On = <On>}
endscript
