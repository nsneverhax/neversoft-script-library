popup_warning_menu_font = text_a4
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		params = {
			up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		params = {
			down
		}
	}
]
popup_event_handlers_nooptions = [
]

script create_popup_warning_menu player_device = ($primary_controller)
	<menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if gotparam \{options}
		getarraysize <options>
		if (<array_size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<menu_pos> = (640.0, 490.0)
			<menu_bg_offset> = (0.0, 32.0)
		endif
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		menu_pos = <menu_pos>
		spacing = -45
		internal_just = [center center]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
	}
	set_focus_color \{rgba = [
			130
			0
			0
			250
		]}
	set_unfocus_color \{rgba = [
			0
			0
			0
			255
		]}
	createscreenelement \{type = containerelement
		parent = root_window
		id = popup_warning_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (gotparam no_background)
		displaysprite \{parent = popup_warning_container
			tex = brick_bg
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z = 96}
	endif
	offwhite = [223 223 223 255]
	z = 100
	displaysprite parent = popup_warning_container tex = dialog_title_bg flip_v pos = (416.0, 100.0) dims = (224.0, 224.0) z = <z>
	displaysprite parent = popup_warning_container tex = dialog_title_bg pos = (640.0, 100.0) dims = (224.0, 224.0) z = <z>
	if gotparam \{options}
		createscreenelement {
			type = vmenu
			parent = popup_warning_container
			id = options_bg_id
			pos = (<menu_pos> + <menu_bg_offset>)
			just = [center top]
			internal_just = [center center]
		}
		displaysprite parent = options_bg_id tex = dialog_bg z = <z>
		displaysprite parent = options_bg_id tex = dialog_bg flip_h z = <z>
	endif
	create_pause_menu_frame z = (<z> - 4)
	create_popup_warning_text <...>
	if gotparam \{options}
		create_popup_warning_menu_options <...>
		add_user_control_helper \{text = 'SELECT'
			button = green
			z = 100}
		add_user_control_helper \{text = 'UP/DOWN'
			button = strumbar
			z = 100}
	endif
endscript

script destroy_popup_warning_menu 
	clean_up_user_control_helpers
	destroy_pause_menu_frame
	destroy_menu_backdrop
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
endscript

script create_popup_warning_text \{title = 'WARNING'}
	<title_scale> = 1.3
	if gotparam \{title_props}
		title_scale = (<title_props>.scale)
	endif
	createscreenelement {
		type = textelement
		font = ($popup_warning_menu_font)
		text = <title>
		just = [center center]
		pos = (640.0, 200.0)
		scale = <title_scale>
		parent = popup_warning_container
		rgba = [200 200 200 255]
		shadow
		shadow_offs = (4.0, 4.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<z> + 2)
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = (280 * (1.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1 only_if_larger_y = 0 start_x_scale = <title_scale> start_y_scale = <title_scale>
	if gotparam \{textblock}
		createscreenelement {
			type = textblockelement
			font = ($popup_warning_menu_font)
			just = [center center]
			pos = (640.0, 375.0)
			dims = (700.0, 400.0)
			scale = 0.8
			parent = popup_warning_container
			rgba = [210 130 0 250]
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 2)
			<textblock>
		}
	endif
	if gotparam \{textelement}
		createscreenelement {
			type = textelement
			font = ($popup_warning_menu_font)
			just = [center center]
			pos = (640.0, 430.0)
			scale = 1.1333001
			parent = popup_warning_container
			rgba = [210 130 0 250]
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 2)
			<textelement>
		}
	endif
endscript

script create_popup_warning_menu_option \{max_option_width = 450}
	<focus_params> = {use_highlight = 1}
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = (0.0, 90.0)
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose (<option>.func)}
		]
	}
	<container_id> = <id>
	createscreenelement {
		type = hmenu
		parent = <container_id>
		internal_just = [center top]
		just = [center center]
	}
	<spacer_id> = <id>
	createscreenelement {
		type = containerelement
		parent = <spacer_id>
		local_id = hi_left_spacer
		dims = (64.0, 64.0)
	}
	createscreenelement {
		type = spriteelement
		local_id = hi_left
		parent = <id>
		texture = dialog_highlight
		rgba = [255 255 255 255]
		pos = (64.0, 12.0)
		just = [right top]
		z_priority = (<z> + 0.3)
		alpha = 0
		flip_v
	}
	createscreenelement {
		type = textelement
		font = ($popup_warning_menu_font)
		parent = <spacer_id>
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [center center]
		scale = 1.2
		z_priority = (<z> + 1)
		(<option>)
	}
	getscreenelementdims id = <id>
	if gotparam \{max_option_width}
		fit_text_in_rectangle id = <id> dims = (<max_option_width> * (1.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	endif
	createscreenelement {
		type = containerelement
		parent = <spacer_id>
		local_id = hi_right_spacer
		dims = (64.0, 64.0)
	}
	createscreenelement {
		type = spriteelement
		local_id = hi_right
		parent = <id>
		texture = dialog_highlight
		rgba = [255 255 255 255]
		pos = (0.0, 12.0)
		just = [left top]
		z_priority = (<z> + 1)
		alpha = 0
	}
	setscreenelementlock id = <spacer_id> on
	setscreenelementlock id = <container_id> on
endscript

script create_popup_warning_menu_options 
	<parent> = pu_warning_vmenu
	getarraysize <options>
	<i> = 0
	begin
	create_popup_warning_menu_option option = (<options> [<i>]) z = <z> num_options = <array_size> parent = <parent> max_option_width = <max_option_width>
	<i> = (<i> + 1)
	repeat <array_size>
	<largest_width> = 0
	getscreenelementchildren \{id = pu_warning_vmenu}
	getarraysize <children>
	<i> = 0
	begin
	getscreenelementdims id = {(<children> [<i>]) child = 0}
	if (<largest_width> < <width>)
		<largest_width> = <width>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	getscreenelementchildren \{id = options_bg_id}
	getarraysize <children>
	<i> = 0
	begin
	getscreenelementdims id = (<children> [<i>])
	setscreenelementprops id = (<children> [<i>]) dims = (<largest_width> * (1.0, 0.0) + <height> * (0.0, 3.0) + (32.0, 0.0)) preserve_flip
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script menu_popup_focus 
	getsingletag \{id}
	resolvescreenelementid id = {<id> child = {0 child = text}}
	retail_menu_focus id = <resolved_id>
	if (<use_highlight> = 1)
		doscreenelementmorph id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 1
		doscreenelementmorph id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 1
	endif
endscript

script menu_popup_unfocus 
	getsingletag \{id}
	resolvescreenelementid id = {<id> child = {0 child = text}}
	retail_menu_unfocus id = <resolved_id>
	if (<use_highlight> = 1)
		doscreenelementmorph id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 0
		doscreenelementmorph id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 0
	endif
endscript
