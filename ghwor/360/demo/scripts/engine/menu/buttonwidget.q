button_widget_up_sound = menu_scroll_up
button_widget_down_sound = menu_scroll_down
button_widget_choose_sound = car_widget_select_sfx
button_widget_unchoose_sound = car_widget_deselect_sfx
button_widget_fill_texture = widget_frame_fill
button_widget_fill_circle_texture = widget_frame_round_fill
button_widget_fill_alpha = 1
button_widget_fill_z = 4
button_widget_unfocus_rgba = [
	150
	150
	150
	255
]
backing_uninit_rgba = [
	85
	88
	96
	255
]
backing_init_rgba = [
	166
	30
	45
	255
]

script button_widget_add_item \{widget_id = widget
		button_icon = button_type_1
		pos = (0.0, 0.0)
		dims = (375.0, 70.0)
		parent_id = current_menu
		pad_up_script = debug_widget_up_script
		pad_down_script = debug_widget_down_script
		min = 0.0
		max = 0.0
		step = 0.0
		start_value = 0
		z_priority = 5
		fill_type = `center up/down`
		text_offset = (75.0, 25.0)
		text_case = upper}
	if (<start_value> < <min>)
		<start_value> = <min>
	endif
	if (<start_value> > <max>)
		<start_value> = <max>
	endif
	createscreenelement {
		type = containerelement
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
	ui_event_get_param_from_top \{param = state_device}
	if NOT gotparam \{no_cas_handlers}
		setup_cas_menu_handlers vmenu_id = <widget_id> camera_list = <camera_list> zoom_camera = <zoom_camera> controller = <state_device>
	endif
	createscreenelement {
		type = containerelement
		parent = <widget_id>
		dims = (70.0, 70.0)
		just = [left , top]
		pos = (-5.0, 0.0)
	}
	icon_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = list_highlight
		pos = <pos>
		alpha = 0
		z_priority = (<z_priority> + 1)
		dims = (70.0, 70.0)
		just = [left , top]
	}
	highlight_id = <id>
	button_widget_find_fill value = (<start_value> * 1.0) min = <min> max = <max>
	fill_texture = ($button_widget_fill_texture)
	frame = widget_frame
	rot_angle = 0
	fill_dims = (50.0, 50.0)
	if checksumequals a = <fill_type> b = `bottom to top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
		back_pos = (10.0, 57.0)
		back_just = [left , bottom]
		back_pos_anchor = [left , top]
		fill_dims = (47.0, 47.0)
	elseif checksumequals a = <fill_type> b = `left to right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
		back_pos = (10.0, 10.0)
		back_just = [left , top]
		back_pos_anchor = [left , top]
		fill_dims = (47.0, 47.0)
	elseif checksumequals a = <fill_type> b = `center left/right`
		back_scale = ((((<start_value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		endif
		back_pos = <pos>
		back_just = [left , center]
		back_pos_anchor = [center , center]
		fill_dims = (47.0, 47.0)
	elseif checksumequals a = <fill_type> b = `center up/down`
		back_scale = ((((<start_value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		endif
		back_pos = <pos>
		back_just = [center , bottom]
		back_pos_anchor = [center , center]
		fill_dims = (47.0, 47.0)
	elseif checksumequals a = <fill_type> b = `center out`
		back_just = [center , center]
		back_pos = (0.0, 0.0)
		back_pos_anchor = [center , center]
		fill_texture = ($button_widget_fill_circle_texture)
		back_scale = (<fill_perc> * (1.0, 1.0))
		frame = widget_frame_round
	else
		scriptassert \{qs(0xa936665d)}
	endif
	if gotparam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <fill_texture>
		material = null
		rgba = ($backing_uninit_rgba)
		dims = <fill_dims>
		scale = <back_scale>
		pos = <back_pos>
		z_priority = (<z_priority> + ($button_widget_fill_z))
		pos_anchor = [center , bottom]
		just = <back_just>
		pos_anchor = <back_pos_anchor>
		rot_angle = <rot_angle>
		alpha = ($button_widget_fill_alpha)
	}
	backing_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <button_icon>
		z_priority = (<z_priority> + 5)
		rgba = ($button_widget_unfocus_rgba)
		rot_angle = <icon_rot>
		dims = (50.0, 50.0)
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
	}
	button_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <frame>
		z_priority = (<z_priority> + 4)
		dims = (70.0, 70.0)
		just = [left , top]
	}
	if (<text_case> = lower)
		getlowercasestring <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		getuppercasestring <text>
		<text> = <uppercasestring>
	endif
	createscreenelement {
		type = descinterface
		desc = 'generic_car_menu_text_item'
		parent = <widget_id>
		pos = <text_offset>
		z_priority = (<z_priority> + 4)
		generic_menu_smenu_textitem_text_text = <text>
		generic_menu_smenu_textitem_text_dims = (260.0, 35.0)
		generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
		generic_menu_smenu_textitem_text_font = fontgrid_text_a1
		highlight_btn_alpha = 0.0
	}
	text_id = <id>
	if gotparam \{invert}
		invert = {invert}
	endif
	<widget_id> :settags {
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
		max = (<max> * 1.0)
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
	<parent_id> :gettags
	if gotparam \{total_length}
		getscreenelementdims id = <parent_id>
		parent_height = <height>
		getscreenelementdims id = <widget_id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			printf \{qs(0x1be83349)}
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent_id> :settags {total_length = <total_length>}
	else
		getscreenelementdims id = <id>
		<parent_id> :settags {total_length = <height>}
	endif
endscript

script init_button_widget 
	setmenuautorepeattimes \{(0.2, 0.03)}
	<widget_id> :gettags
	<widget_id> :settags {start_value = <value>}
	launchevent type = unfocus target = <parent_id>
	launchevent type = focus target = <widget_id>
	<event_handlers> = [
		{pad_back deinit_button_widget params = {widget_id = <widget_id> deinit_helper_text = <deinit_helper_text> run_deinit}}
		{pad_choose deinit_button_widget params = {widget_id = <widget_id> deinit_helper_text = <deinit_helper_text>}}
		{pad_up up_button_widget params = {widget_id = <widget_id>}}
		{pad_down down_button_widget params = {widget_id = <widget_id>}}
	]
	if gotparam \{pad_left_script}
		<additional_handlers> = [
			{pad_right up_button_widget params = {widget_id = <widget_id>}}
			{pad_left down_button_widget params = {widget_id = <widget_id>}}
		]
		event_handlers = (<event_handlers> + <additional_handlers>)
	endif
	setscreenelementprops {
		id = <widget_id>
		event_handlers = <event_handlers>
		replace_handlers
	}
	setscreenelementprops {
		id = <backing_id>
		rgba = ($backing_init_rgba)
	}
	soundevent event = ($button_widget_choose_sound)
	setscreenelementprops {
		id = <button_id>
		rgba = [255 255 255 255]
	}
	if gotparam \{init_helper_text}
		clean_up_user_control_helpers
		menu_finish <init_helper_text>
	endif
	if gotparam \{init_script}
		<init_script> <init_params>
	endif
endscript

script focus_button_widget 
	<widget_id> :getsingletag highlight_id
	setscreenelementprops {
		id = <highlight_id>
		alpha = 1
	}
	<widget_id> :getsingletag text_id
	setscreenelementprops {
		id = <text_id>
		generic_menu_smenu_textitem_text_font = fontgrid_text_a1
		generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_focus_color)
		highlight_btn_alpha = 1.0
	}
	set_generic_menu_scrollbar_pos id = <widget_id>
endscript

script unfocus_button_widget 
	<widget_id> :getsingletag highlight_id
	setscreenelementprops {
		id = <highlight_id>
		alpha = 0
	}
	<widget_id> :getsingletag text_id
	setscreenelementprops {
		id = <text_id>
		generic_menu_smenu_textitem_text_font = fontgrid_text_a1
		generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
		highlight_btn_alpha = 0.0
	}
endscript

script deinit_button_widget 
	<widget_id> :gettags parent_id
	setmenuautorepeattimes \{(0.3, 0.1)}
	launchevent type = unfocus target = <widget_id>
	launchevent type = focus target = <parent_id>
	setscreenelementprops {
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
	setscreenelementprops {
		id = <button_id>
		rgba = ($button_widget_unfocus_rgba)
	}
	setscreenelementprops {
		id = <backing_id>
		rgba = ($backing_uninit_rgba)
	}
	soundevent event = ($button_widget_unchoose_sound)
	if gotparam \{deinit_helper_text}
		clean_up_user_control_helpers
		menu_finish <deinit_helper_text>
	endif
	if gotparam \{run_deinit}
		button_widget_set_value widget_id = <widget_id> new_value = (<start_value> * 1.0)
		if gotparam \{pad_left_script}
			<pad_left_script> {<pad_left_params> value = (<start_value> * 1.0)}
		else
			<pad_up_script> {<pad_up_params> value = (<start_value> * 1.0)}
		endif
	endif
	if gotparam \{deinit_script}
		<deinit_script> <deinit_params>
	endif
endscript

script up_button_widget 
	requireparams \{[
			widget_id
		]
		all}
	<widget_id> :gettags
	if gotparam \{invert}
		if (<value> <= <min>)
			return
		endif
		value = (<value> - <step>)
		if (<value> < <min>)
			value = <min>
		endif
	else
		if (<value> >= <max>)
			return
		endif
		value = (<value> + <step>)
		if (<value> > <max>)
			value = <max>
		endif
	endif
	button_widget_find_fill value = <value> min = <min> max = <max>
	rot_angle = 0
	if checksumequals a = <fill_type> b = `bottom to top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `left to right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `center left/right`
		back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center up/down`
		back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center out`
		back_scale = (<fill_perc> * (1.0, 1.0))
	endif
	if gotparam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	if screenelementexists id = <backing_id>
		setscreenelementprops {
			id = <backing_id>
			scale = <back_scale>
			rot_angle = <rot_angle>
		}
	endif
	<widget_id> :settags {value = <value>}
	spawnscriptnow audio_ui_play_car_scroll_widget_sfx params = {<...>}
	if gotparam \{pad_left_script}
		<pad_left_script> {<pad_left_params> value = <value>}
	else
		<pad_up_script> {<pad_up_params> value = <value>}
	endif
endscript

script down_button_widget 
	requireparams \{[
			widget_id
		]
		all}
	<widget_id> :gettags
	if gotparam \{invert}
		if (<value> >= <max>)
			return
		endif
		value = (<value> + <step>)
		if (<value> > <max>)
			value = <max>
		endif
	else
		if (<value> <= <min>)
			return
		endif
		value = (<value> - <step>)
		if (<value> < <min>)
			value = <min>
		endif
	endif
	button_widget_find_fill value = <value> min = <min> max = <max>
	rot_angle = 0
	if checksumequals a = <fill_type> b = `bottom to top`
		back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `left to right`
		back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
	elseif checksumequals a = <fill_type> b = `center left/right`
		back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
		if (<back_scale>.(1.0, 0.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center up/down`
		back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
		if (<back_scale>.(0.0, 1.0) < 0)
			rot_angle = 180
		else
			rot_angle = 0
		endif
	elseif checksumequals a = <fill_type> b = `center out`
		back_scale = (<fill_perc> * (1.0, 1.0))
	endif
	if gotparam \{invert}
		rot_angle = (<rot_angle> + 180)
	endif
	if screenelementexists id = <backing_id>
		setscreenelementprops {
			id = <backing_id>
			scale = <back_scale>
			rot_angle = <rot_angle>
		}
	endif
	<widget_id> :settags {value = <value>}
	spawnscriptnow audio_ui_play_car_scroll_widget_sfx params = {<...>}
	if gotparam \{pad_right_script}
		<pad_right_script> {<pad_right_params> value = <value>}
	else
		<pad_down_script> {<pad_down_params> value = <value>}
	endif
endscript

script button_generic_set_value 
	requireparams \{[
			id
			new_value
		]}
	if screenelementexists id = <id>
		<id> :gettags
		if (<new_value> = true)
			alpha = 1
		else
			alpha = 0
		endif
		if gotparam \{backing_id}
			setscreenelementprops {
				id = <backing_id>
				alpha = <alpha>
			}
			<backing_id> :settags on = <new_value>
		endif
	endif
endscript

script button_widget_set_value 
	requireparams \{[
			widget_id
			new_value
		]}
	if screenelementexists id = <widget_id>
		<widget_id> :gettags
		value = <new_value>
		button_widget_find_fill value = <value> min = <min> max = <max>
		if checksumequals a = <fill_type> b = `bottom to top`
			back_scale = ((1.0, 0.0) + <fill_perc> * (0.0, 1.0))
		elseif checksumequals a = <fill_type> b = `left to right`
			back_scale = (<fill_perc> * (1.0, 0.0) + (0.0, 1.0))
		elseif checksumequals a = <fill_type> b = `center left/right`
			back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (1.0, 0.0) + (0.0, 1.0))
			if (<back_scale>.(1.0, 0.0) < 0)
				rot_angle = 180
			else
				rot_angle = 0
			endif
		elseif checksumequals a = <fill_type> b = `center up/down`
			back_scale = ((((<value> - <min>) - (<max> - <min>) * 0.5) / (<max> - <min>)) * (0.0, 1.0) + (1.0, 0.0))
			if (<back_scale>.(0.0, 1.0) < 0)
				rot_angle = 180
			else
				rot_angle = 0
			endif
		elseif checksumequals a = <fill_type> b = `center out`
			back_scale = (<fill_perc> * (1.0, 1.0))
		endif
		if gotparam \{invert}
			rot_angle = (<rot_angle> + 180)
		endif
		if screenelementexists id = <backing_id>
			setscreenelementprops {
				id = <backing_id>
				scale = <back_scale>
				rot_angle = <rot_angle>
			}
		endif
		<widget_id> :settags {value = <value>}
	endif
endscript

script button_widget_find_fill 
	requireparams \{[
			value
			min
			max
		]
		all}
	if (<max> = <min>)
		return \{fill_perc = 0}
	endif
	fill_perc = ((<value> - <min>) / (<max> - <min>))
	return fill_perc = <fill_perc>
endscript

script debug_widget_up_script 
	printstruct <...>
endscript

script debug_widget_down_script 
	printstruct <...>
endscript

script rot_widget_add_item \{widget_id = widget
		button_icon = button_type_1
		parent_id = current_menu
		pad_up_script = debug_widget_up_script
		pad_down_script = debug_widget_down_script
		pos = (0.0, 0.0)
		min = 0.0
		max = 0.0
		step = 0.0
		start_value = 0
		z_priority = 100
		text_offset = (75.0, 25.0)
		text_scale = 1.5
		text_case = upper
		fill_type = `counter clockwise`
		dims = (70.0, 70.0)}
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		id = <widget_id>
		scale = <scale>
		event_handlers = [
			{pad_choose init_rotate_widget params = {widget_id = <widget_id>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
		]
		z_priority = <z_priority>
		just = [left , bottom]
		dims = <dims>
	}
	ui_event_get_param_from_top \{param = state_device}
	if NOT gotparam \{no_cas_handlers}
		setup_cas_menu_handlers vmenu_id = <widget_id> camera_list = <camera_list> zoom_camera = <zoom_camera> controller = <state_device>
	endif
	button_widget_find_fill value = <start_value> min = <min> max = <max>
	createscreenelement {
		type = containerelement
		parent = <widget_id>
		dims = (70.0, 70.0)
		just = [left , top]
	}
	icon_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = list_highlight
		pos = <pos>
		alpha = 0
		z_priority = (<z_priority> + 1)
		dims = (70.0, 70.0)
		just = [left , top]
	}
	highlight_id = <id>
	createscreenelement {
		type = containerelement
		parent = <icon_id>
		z_priority = (<z_priority> + 2)
		dims = (50.0, 50.0)
		pos = <pos>
		just = [left , top]
		pos_anchor = [center , center]
	}
	backing_id = <id>
	if checksumequals a = <fill_type> b = `counter clockwise`
		rot_dir = -3
	elseif checksumequals a = <fill_type> b = clockwise
		rot_dir = 3
	else
		scriptassert \{qs(0xea7f3c88)}
	endif
	end_inc = (120 * <start_value> / <max>)
	i = 0
	begin
	if (<i> > <end_inc>)
		alpha = 0
	else
		alpha = 1
	endif
	createscreenelement {
		type = containerelement
		parent = <backing_id>
		rot_angle = (<rot_dir> * <i>)
		alpha = <alpha>
		just = [center , center]
		pos_anchor = [center , center]
		pos = (-26.0, -26.0)
	}
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = widget_frame_round_fill
		rgba = ($backing_uninit_rgba)
		dims = (22.0, 3.0)
		z_priority = (<z_priority> + 2)
		pos_anchor = [left , center]
		pos = (16.0, 0.0)
	}
	i = (<i> + 1)
	repeat 120
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = <button_icon>
		pos = <pos>
		z_priority = (<z_priority> + 3)
		rot_angle = <icon_rot>
		dims = (50.0, 50.0)
		just = [center , center]
		pos_anchor = [center , center]
		rgba = ($button_widget_unfocus_rgba)
	}
	button_id = <id>
	if (<text_case> = lower)
		getlowercasestring <text>
		<text> = <lowercasestring>
	elseif (<text_case> = upper)
		getuppercasestring <text>
		<text> = <uppercasestring>
	endif
	createscreenelement {
		type = descinterface
		desc = 'generic_car_menu_text_item'
		parent = <widget_id>
		pos = <text_offset>
		z_priority = (<z_priority> + 4)
		generic_menu_smenu_textitem_text_text = <text>
		generic_menu_smenu_textitem_text_dims = (260.0, 35.0)
		generic_menu_smenu_textitem_text_rgba = (($cas_color_scheme).text_color)
		generic_menu_smenu_textitem_text_font = fontgrid_text_a1
		highlight_btn_alpha = 0.0
	}
	text_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <icon_id>
		texture = widget_frame_round
		pos = <pos>
		z_priority = (<z_priority> + 1)
		dims = (70.0, 70.0)
		just = [left , top]
	}
	if gotparam \{wrap}
		wrap = 1
	endif
	if gotparam \{sweep}
		sweep = 1
	endif
	<widget_id> :settags {
		parent_id = <parent_id>
		pad_up_script = <pad_up_script>
		pad_up_params = {<pad_up_params> widget_id = <widget_id>}
		pad_down_script = <pad_down_script>
		pad_down_params = {<pad_down_params> widget_id = <widget_id>}
		min = (<min> * 1.0)
		max = (<max> * 1.0)
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
	<parent_id> :gettags
	if gotparam \{total_length}
		getscreenelementdims id = <parent_id>
		parent_height = <height>
		getscreenelementdims id = <widget_id>
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			printf \{qs(0x1be83349)}
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		<parent_id> :settags {total_length = <total_length>}
	else
		getscreenelementdims id = <id>
		<parent_id> :settags {total_length = <height>}
	endif
endscript

script init_rotate_widget 
	setmenuautorepeattimes \{(0.2, 0.03)}
	<widget_id> :gettags
	<widget_id> :settags {start_value = <value>}
	launchevent type = unfocus target = <parent_id>
	launchevent type = focus target = <widget_id>
	setscreenelementprops {
		id = <widget_id>
		event_handlers = [
			{pad_up up_rotate_widget params = {widget_id = <widget_id>}}
			{pad_down down_rotate_widget params = {widget_id = <widget_id>}}
			{pad_back deinit_rotate_widget params = {widget_id = <widget_id> run_deinit}}
			{pad_choose deinit_rotate_widget params = {widget_id = <widget_id>}}
		]
		replace_handlers
	}
	setscreenelementprops {
		id = <button_id>
		rgba = [255 255 255 255]
	}
	getscreenelementchildren id = <backing_id>
	<backing_children> = <children>
	getarraysize <children>
	k = 0
	begin
	getscreenelementchildren id = (<backing_children> [<k>])
	setscreenelementprops id = (<children> [0]) rgba = ($backing_init_rgba)
	k = (<k> + 1)
	repeat <array_size>
	soundevent event = ($button_widget_choose_sound)
	if gotparam \{init_script}
		<init_script> <init_params>
	endif
endscript

script deinit_rotate_widget 
	setmenuautorepeattimes \{(0.3, 0.1)}
	<widget_id> :gettags parent_id
	launchevent type = unfocus target = <widget_id>
	launchevent type = focus target = <parent_id>
	setscreenelementprops {
		id = <widget_id>
		event_handlers = [
			{pad_choose init_rotate_widget params = {widget_id = <widget_id>}}
			{focus focus_button_widget params = {widget_id = <widget_id>}}
			{unfocus unfocus_button_widget params = {widget_id = <widget_id>}}
		]
		replace_handlers
	}
	setscreenelementprops {
		id = <button_id>
		rgba = ($button_widget_unfocus_rgba)
	}
	getscreenelementchildren id = <backing_id>
	<backing_children> = <children>
	getarraysize <children>
	k = 0
	begin
	getscreenelementchildren id = (<backing_children> [<k>])
	setscreenelementprops id = (<children> [0]) rgba = ($backing_uninit_rgba)
	k = (<k> + 1)
	repeat <array_size>
	soundevent event = ($button_widget_unchoose_sound)
	if gotparam \{run_deinit}
		rotate_widget_set_value widget_id = <widget_id> new_value = (<start_value> * 1.0)
		if gotparam \{pad_left_script}
			<pad_left_script> {<pad_left_params> value = (<start_value> * 1.0)}
		else
			<pad_up_script> {<pad_up_params> value = (<start_value> * 1.0)}
		endif
	endif
	if gotparam \{deinit_script}
		<deinit_script> <deinit_params>
	endif
endscript

script up_rotate_widget 
	requireparams \{[
			widget_id
		]
		all}
	<widget_id> :gettags
	if (<value> >= <max>)
		if NOT gotparam \{wrap}
			return
		endif
	endif
	value = (<value> + <step>)
	if (<value> > <max>)
		if gotparam \{wrap}
			value = <min>
		else
			value = <max>
		endif
	endif
	end_inc = (119 * <value> / <max>)
	button_widget_find_fill value = <value> min = <min> max = <max>
	getscreenelementchildren id = <backing_id>
	getarraysize <children>
	k = 0
	begin
	if gotparam \{sweep}
		if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
			setscreenelementprops id = (<children> [<k>]) alpha = 1
		else
			setscreenelementprops id = (<children> [<k>]) alpha = 0
		endif
	else
		if (<k> < <end_inc>)
			setscreenelementprops id = (<children> [<k>]) alpha = 1
		else
			setscreenelementprops id = (<children> [<k>]) alpha = 0
		endif
	endif
	k = (<k> + 1)
	repeat <array_size>
	<widget_id> :settags {value = <value>}
	soundevent \{event = audio_ui_car_rotate_button}
	<pad_up_script> {<pad_up_params> value = <value>}
endscript

script down_rotate_widget 
	requireparams \{[
			widget_id
		]
		all}
	<widget_id> :gettags
	if (<value> <= <min>)
		if NOT gotparam \{wrap}
			return
		endif
	endif
	value = (<value> - <step>)
	if (<value> < <min>)
		if gotparam \{wrap}
			value = <max>
		else
			value = <min>
		endif
	endif
	end_inc = (119 * <value> / <max>)
	button_widget_find_fill value = <value> min = <min> max = <max>
	getscreenelementchildren id = <backing_id>
	getarraysize <children>
	k = 0
	begin
	if gotparam \{sweep}
		if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
			setscreenelementprops id = (<children> [<k>]) alpha = 1
		else
			setscreenelementprops id = (<children> [<k>]) alpha = 0
		endif
	else
		if (<k> < <end_inc>)
			setscreenelementprops id = (<children> [<k>]) alpha = 1
		else
			setscreenelementprops id = (<children> [<k>]) alpha = 0
		endif
	endif
	k = (<k> + 1)
	repeat <array_size>
	<widget_id> :settags {value = <value>}
	soundevent \{event = audio_ui_car_rotate_button}
	<pad_down_script> {<pad_down_params> value = <value>}
endscript

script rotate_widget_set_value 
	requireparams \{[
			widget_id
			new_value
		]
		all}
	if screenelementexists id = <widget_id>
		<widget_id> :gettags
		value = <new_value>
		end_inc = (119 * <value> / <max>)
		button_widget_find_fill value = <value> min = <min> max = <max>
		getscreenelementchildren id = <backing_id>
		getarraysize <children>
		k = 0
		begin
		if gotparam \{sweep}
			if ((<k> < (<end_inc> + 1)) && (<k> > (<end_inc> - 1)))
				setscreenelementprops id = (<children> [<k>]) alpha = 1
			else
				setscreenelementprops id = (<children> [<k>]) alpha = 0
			endif
		else
			if (<k> < <end_inc>)
				setscreenelementprops id = (<children> [<k>]) alpha = 1
			else
				setscreenelementprops id = (<children> [<k>]) alpha = 0
			endif
		endif
		k = (<k> + 1)
		repeat <array_size>
		<widget_id> :settags {value = <value>}
	endif
endscript

script add_generic_menu_button_icon_item \{on = false}
	add_car_menu_icon_item <...>
	createscreenelement {
		parent = <item_container_id>
		type = spriteelement
		texture = white
		dims = (54.0, 54.0)
		pos = (8.0, 8.0)
		just = [left , top]
		rgba = ($backing_init_rgba)
		relative_z_priority = -0.5
	}
	<id> :settags {on = <on>}
	<item_container_id> :settags {backing_id = <id>}
	if (<on> = false)
		setscreenelementprops id = <id> alpha = 0
	else
		setscreenelementprops id = <id> alpha = 1
	endif
	setscreenelementprops {
		id = <item_container_id>
		event_handlers = [
			{pad_choose test_button_choose params = {id = <id>}}
		]
	}
	return item_container_id = <item_container_id>
endscript

script test_button_choose 
	<id> :getsingletag on
	if (<on> = false)
		on = true
		setscreenelementprops id = <id> alpha = 1
	else
		on = false
		setscreenelementprops id = <id> alpha = 0
	endif
	<id> :settags {on = <on>}
endscript
