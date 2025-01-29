popup_warning_menu_font = fontgrid_title_gh3
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
g_cpw_have_helper_pills = 0

script create_popup_warning_menu player_device = ($primary_controller)
	printstruct <...>
	change \{g_cpw_have_helper_pills = 0}
	<menu_pos> = (640.0, 510.0)
	<menu_bg_offset> = (0.0, -28.0)
	<event_handlers> = {}
	if gotparam \{options}
		getarraysize <options>
		if (<array_size> > 1)
			<event_handlers> = ($popup_event_handlers_options)
			<menu_pos> = (642.0, 496.0)
			<menu_bg_offset> = (-2.0, -8.0)
		endif
	endif
	if (<player_device> = -1)
		exclusive_mp_controllers = [0 , 0]
		setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
		setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
		<player_device> = <exclusive_mp_controllers>
	endif
	new_menu {
		scrollid = pu_warning_scroll
		vmenuid = pu_warning_vmenu
		menu_pos = <menu_pos>
		spacing = -45
		internal_just = [center center]
		event_handlers = <event_handlers>
		exclusive_device = <player_device>
		focus_color = pink
		unfocus_color = dk_violet_grey
	}
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
			tex = venue_bg
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z = 96}
		popup_warning_container :settags \{no_background = 0}
	else
		popup_warning_container :settags \{no_background = 1}
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
	endif
	if gotparam \{helper_pills}
		change \{g_cpw_have_helper_pills = 1}
		change \{user_control_pill_text_color = [
				0
				0
				0
				255
			]}
		change \{user_control_pill_color = [
				180
				180
				180
				255
			]}
		getarraysize <helper_pills>
		<i> = 0
		begin
		if (<helper_pills> [<i>] = select)
			add_user_control_helper \{text = "SELECT"
				button = green
				z = 100}
		elseif (<helper_pills> [<i>] = back)
			add_user_control_helper \{text = "BACK"
				button = red
				z = 100}
		elseif (<helper_pills> [<i>] = updown)
			add_user_control_helper \{text = "UP/DOWN"
				button = strumbar
				z = 100}
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script destroy_popup_warning_menu 
	destroy_pause_menu_frame
	if screenelementexists \{id = popup_warning_container}
		popup_warning_container :gettags
		if (<no_background> = 0)
			destroy_menu_backdrop
		endif
	endif
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
endscript

script create_popup_warning_text \{title = "WARNING"}
	<title_scale> = 1.2
	if gotparam \{title_props}
		title_scale = (<title_props>.scale)
	endif
	createscreenelement {
		type = textelement
		font = ($popup_warning_menu_font)
		text = <title>
		just = [center center]
		pos = (640.0, 217.0)
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
			scale = 0.6
			parent = popup_warning_container
			rgba = (($g_menu_colors).light_brown)
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
			scale = 0.85
			parent = popup_warning_container
			rgba = (($g_menu_colors).light_brown)
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<z> + 2)
			<textelement>
		}
	endif
endscript

script create_popup_warning_menu_option \{max_option_width = 300}
	<focus_params> = {use_highlight = 1}
	if gotparam \{pad_back_script}
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) params = (<option>.params)}
			{pad_back soundevent params = {event = generic_menu_back_sfx}}
			{pad_back <pad_back_script>}
		]
	else
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose (<option>.func) params = (<option>.params)}
		]
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		dims = (0.0, 90.0)
		event_handlers = <event_handlers>
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
		rgba = (($g_menu_colors).pink)
		pos = (58.0, 7.0)
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
		rgba = (($g_menu_colors).pink)
		pos = (0.0, 7.0)
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
	if gotparam \{pad_back_script}
		create_popup_warning_menu_option {
			option = (<options> [<i>])
			z = <z>
			num_options = <array_size>
			parent = <parent>
			max_option_width = <max_option_width>
			pad_back_script = <pad_back_script>
		}
	else
		create_popup_warning_menu_option {
			option = (<options> [<i>])
			z = <z>
			num_options = <array_size>
			parent = <parent>
			max_option_width = <max_option_width>
		}
	endif
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
	setscreenelementprops id = (<children> [<i>]) dims = (<largest_width> * (1.0, 0.0) + <height> * (0.0, 1.0) + (44.0, 0.0)) preserve_flip
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
