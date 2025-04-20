
script create_snazzy_dialog_box {title = ""
		text = ""
		anchor_id = dialog_box_anchor
		vmenu_id = dialog_box_vmenu
		container_id = dialog_box_container
		helper_text_anchor_id = dialog_box_helper
		graytint_id = bg_graytint
		title_font = text_a1
		font = text_a1
		text_font = text_a1
		pos = (320.0, 240.0)
		just = [center top]
		scale = (0.9, 0.7)
		line_spacing = 1.2
		title_scale = 0.7
		text_scale = 0.5
		text_dims = (575.0, 0.0)
		exclusive_device = -1
		pos_tweak = (0.0, -50.0)
		bg_rgba = [200 200 200 250]
		bg_gray_tint_rgba = [20 20 20 120]
		title_rgba = [240 240 240 255]
		text_rgba = [130 130 130 255]
		bg_scale = 1
		hmenu_pos = (0.0, 50.0)
		z_priority = 4000
		no_bg
		destroy_on_event = 1
		vmenu_width = 600
		additional_highlight_scale = (0.5, 0.0)
	}
	if screenelementexists id = <anchor_id>
		dialog_box_exit anchor_id = <anchor_id>
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <anchor_id>
		dims = (1280.0, 720.0)
		pos = (<pos> + (660.0, 250.0))
		just = [center center]
		z_priority = <z_priority>
		priority = <priority>
		exclusive_device = <exclusive_device>
	}
	if screenelementexists id = <graytint_id>
		destroyscreenelement id = <graytint_id>
	endif
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		id = <graytint_id>
		just = [center center]
		texture = white
		pos = (0.0, 0.0)
		dims = (10000.0, 10000.0)
		rgba = <bg_gray_tint_rgba>
		z_priority = (<z_priority> - 100)
		alpha = 0
	}
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = <anchor_id>
		dims = (640.0, 480.0)
		pos = <pos>
		just = [center center]
		z_priority = <z_priority>
		priority = <priority>
	}
	createscreenelement {
		type = containerelement
		parent = <anchor_id>
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
		just = [center center]
		z_priority = <z_priority>
	}
	<bg_anchor_id> = <id>
	if gotparam from_cas
		make_cas_bg_elements parent = <bg_anchor_id>
	endif
	if gotparam forced_pos
		pos = <forced_pos>
	endif
	createscreenelement {
		type = vmenu
		parent = <container_id>
		id = <vmenu_id>
		pos = <pos>
		just = [center top]
		internal_just = [center top]
		dims = ((1.0, 0.0) * <vmenu_width>)
		scale = (<scale> * 1.5)
		z_priority = <z_priority>
		padding_scale = 0.9
		exclusive_device = <exclusive_device>
	}
	if NOT gotparam no_helper_text
		if gotparam buttons
			getarraysize <buttons>
			if gotparam pad_back_script
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = root_window
						$generic_dialog_helper_text3
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = root_window
						$generic_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			else
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = root_window
						$generic_dialog_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = root_window
						$generic_dialog_helper_text2
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			endif
		endif
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		local_id = dbox_title
		font = <title_font>
		text = <title>
		just = [center top]
		rgba = <title_rgba>
		scale = <title_scale>
		z_priority = <z_priority>
		not_focusable
		padding_scale = 0.75
		shadow
		shadow_rgba = ($goal_ui_scheme.main)
		shadow_offs = (3.0, 3.0)
	}
	<title_id> = <id>
	getscreenelementdims id = <title_id>
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		font = <title_font>
		text = " "
		just = [center top]
		scale = <title_scale>
		not_focusable
		alpha = 0.0
		padding_scale = 0.75
	}
	if gotparam use_goalmenu_bg
		bg_rgba = [40 60 80 80]
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame
			just = [center top]
			pos = (85.0, -20.0)
			rgba = [0 20 40 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_middle
			just = [center top]
			pos = (85.0, 10.0)
			rgba = [0 20 40 255]
			scale = (2.125, 1.5)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			pos = (85.0, 30.0)
			rgba = [0 20 40 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = menu_selection_white_02
			just = [center top]
			pos = (85.0, 50.0)
			rgba = [10 30 50 70]
			scale = (1.5, 1.0)
			z_priority = (<z_priority> -1)
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			pos = (85.0, 103.0)
			rgba = [10 30 50 100]
			scale = (2.125, 0.25)
			z_priority = (<z_priority> -1)
		}
	endif
	createscreenelement {
		type = textblockelement
		parent = <vmenu_id>
		local_id = dialog_text
		font = <text_font>
		text = <text>
		just = [center top]
		dims = <text_dims>
		rgba = [40 40 40 255]
		scale = <text_scale>
		line_spacing = <line_spacing>
		allow_expansion
		not_focusable
		padding_scale = 0.85
	}
	<text_id> = <id>
	<text_id> :settags the_text = <text>
	getscreenelementdims id = <text_id>
	if gotparam buttons
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			dims = (<text_dims> + (50.0, 60.0))
			child_anchor = [center center]
			not_focusable
		}
		createscreenelement {
			type = spriteelement
			parent = <id>
			texture = menu_goal_underline
			pos = (0.0, -10.0)
			dims = (((1.0, 0.0) * <width>) + (0.0, 8.0))
			rgba = [40 40 40 255]
		}
	endif
	if gotparam logo
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			just = [center center]
			dims = (0.0, 88.0)
		}
		createscreenelement {
			type = spriteelement
			parent = <id>
			texture = <logo>
			just = [center top]
			rgba = [100 100 100 255]
			scale = ((1.4, 1.3) * 1.4)
		}
		no_icon = no_icon
	endif
	if gotparam pad_back_script
		setscreenelementprops {
			id = <vmenu_id>
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			replace_handlers
		}
	endif
	setscreenelementlock id = <vmenu_id> on
	setscreenelementlock id = <vmenu_id> off
	getscreenelementdims id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	if gotparam buttons
		foreachin <buttons> do = create_dialog_button params = {
			font = <font>
			parent = <vmenu_id>
			z_priority = (<z_priority> + 4)
			width = <section_width>
			pad_focus_script = <pad_focus_script>
			additional_highlight_scale = <additional_highlight_scale>
			destroy_on_event = <destroy_on_event>
		}
		getarraysize <buttons>
		if (<array_size> > 1)
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			}
		endif
	endif
	if gotparam sub_logo
		createscreenelement {
			type = spriteelement
			parent = <vmenu_id>
			texture = <sub_logo>
			just = [center center]
			rgba = [240 240 240 88]
			scale = (1.25, 1.0)
			not_focusable
		}
		no_icon = no_icon
	endif
	setscreenelementlock id = <vmenu_id> on
	setscreenelementlock id = <vmenu_id> off
	getscreenelementdims id = <vmenu_id>
	if NOT gotparam buttons
		<width> = (<width> + 225)
		<height> = (<height> + 25)
	endif
	section_width = ((<width> / 100.0) + 0.0)
	section_height = 32
	num_parts = (((<height> * 1.0) / (<section_height> * 1.0)) -1.0)
	if NOT gotparam forced_pos
		centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <height>) / 2) + <pos_tweak>)
		setscreenelementprops id = <vmenu_id> pos = <centered_pos>
	else
		centered_pos = <forced_pos>
	endif
	<bg_x_scale> = 2.0
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		pos = (<centered_pos> + (-5.0, 75.0))
		just = [center bottom]
		texture = menu_headerbar
		dims = (((-1.0, 0.0) * (<width> * 0.71)) + ((0.0, -85.0)))
		rgba = [200 200 200 255]
		z_priority = (<z_priority> - 3)
		flip_v
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = white
		pos = (<centered_pos>)
		dims = (((1.0, 0.0) * (<width> * 0.6)) + ((0.0, 1.0) * (<height> - 16)))
		just = [center top]
		rgba = [200 200 200 255]
		z_priority = (<z_priority> - 3)
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		pos = (<centered_pos> + ((0.0, 1.0) * <height>) + (5.0, 0.0))
		just = [center bottom]
		texture = white
		dims = (((1.0, 0.0) * (<width> * 0.6)) + (0.0, 16.0))
		rgba = [200 200 200 255]
		z_priority = (<z_priority> - 3)
		Random (@ flip_v @ )
	}
	if (Random (@ 0 @ 1 )= 0)
		<left> = {texture = menu_sideA}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideB}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
	else
		<left> = {texture = menu_sideB flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<left> = {<left> flip_h}
		endif
		<right> = {texture = menu_sideA flip_v}
		if (Random (@ 0 @ 1 )= 0)
			<right> = {<right> flip_h}
		endif
	endif
	createscreenelement {
		parent = <anchor_id>
		type = spriteelement
		<left>
		dims = (((0.0, 0.9) * <height>) + (55.0, 0.0))
		pos = ((<centered_pos> + ((-0.3, 0.0) * <width>) + (0.0, 25.0)))
		just = [right top]
		rot_angle = -5
		z_priority = (<z_priority> - 2)
		rgba = <bg_rgba>
	}
	createscreenelement {
		parent = <anchor_id>
		type = spriteelement
		<right>
		dims = (((0.0, 1.0) * <height>) + (55.0, 0.0))
		pos = (<centered_pos> + ((0.26, 0.0) * <width>))
		just = [left top]
		rot_angle = -5
		z_priority = (<z_priority> - 2)
		rgba = <bg_rgba>
	}
	if NOT gotparam no_pad_start
		kill_start_key_binding
	endif
	if gotparam no_pad_start
		<anchor_id> :settags no_pad_start = 1
	endif
	if objectexists id = no_button
		launchevent type = focus target = <vmenu_id> data = {child_id = no_button}
	else
		launchevent type = focus target = <vmenu_id>
	endif
	if gotparam delay_input
		runscriptonscreenelement id = <anchor_id> dialog_box_delay_input params = {delay_input_time = <delay_input_time>}
	endif
	if NOT gotparam no_animate
		if gotparam style
			runscriptonscreenelement id = <anchor_id> <style> params = <...>
		else
			full_animate = 1
			if NOT gotparam full_animate
				runscriptonscreenelement id = <container_id> animate_dialog_box_in params = <...>
			else
				runscriptonscreenelement id = <anchor_id> animate_dialog_box_in params = <...>
			endif
		endif
	else
		if screenelementexists id = <graytint_id>
			doscreenelementmorph id = <graytint_id> alpha = 1.0
		endif
	endif
	if objectexists id = current_menu_anchor
		launchevent type = unfocus target = current_menu_anchor
	endif
	if objectexists id = current_menu
		launchevent type = unfocus target = current_menu
	endif
endscript

script create_error_box \{delay_input_time = 1000}
	create_dialog_box <...> error_box
endscript

script create_dialog_box 
	if NOT gotparam \{preserve_case}
		stringlength string = <text>
		if NOT (<str_len> > 128)
			getlowercasestring <text>
			text = <lowercasestring>
		else
			printf "create_dialog_box: str_len = %n, not converting to lowercase" n = <str_len> channel = ui
		endif
	endif
	create_snazzy_dialog_box <...>
endscript

script button_choose_script 
	destroy_dialog_box
	<callback_script> <callback_params>
endscript

script create_dialog_button {focus_script = main_theme_focus
		focus_params = {highlighted_text_rgba = [240 240 240 255]}
		unfocus_script = main_theme_unfocus
		unfocus_params = {text_rgba = [80 80 80 255]}
		pad_choose_script = destroy_dialog_box
		font = text_a1
		parent = dialog_box_vmenu
		width = 3
		z_priority = 5000
		button_text_scale = 0.6
		button_dims = (0.0, 30.0)
		text_color = [80 80 80 255]
		destroy_on_event = 1
	}
	setscreenelementlock id = root_window off
	setscreenelementlock id = <parent> off
	if NOT gotparam ignore_default_option
		if (<text> = "No")
			id = no_button
		endif
	endif
	if (<destroy_on_event> = 1)
		<pad_choose_params> = {callback_script = <pad_choose_script> callback_params = <pad_choose_params>}
		<pad_choose_script> = button_choose_script
	else
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		dims = <button_dims>
		just = [center center]
		event_handlers =
		[
			{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_start generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
	}
	anchor_id = <id>
	if NOT gotparam preserve_case
		getlowercasestring <text>
		text = <lowercasestring>
	endif
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		pos = (0.0, 0.0)
		font = <font>
		text = <text>
		just = [center center]
		scale = <button_text_scale>
		rgba = <text_color>
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = menu_highlight
		pos = (0.0, -2.0)
		scale = ((0.85, 1.2) + <additional_highlight_scale>)
		rgba = ($goal_ui_scheme.main)
		z_priority = (<z_priority> -1)
		local_id = highlight_bar
		alpha = 0
		Random (@ flip_h @ flip_v @ )
	}
	highlight_angle = 0
	bar_scale = ((<width> + 2) * (0.5, 0.0) + (0.0, 0.7))
	highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0, 0.0)))
endscript

script destroy_dialog_box {anchor_id = dialog_box_anchor helper_text_anchor_id = dialog_box_helper}
	if NOT gotparam dont_restore_input
		setbuttoneventmappings unblock_menu_input
	endif
	debounce x time = 0.3
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	if screenelementexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	if NOT gotparam ignore_helper_text
		if screenelementexists id = <helper_text_anchor_id>
			destroyscreenelement id = <helper_text_anchor_id>
		endif
	endif
	if NOT gotparam dont_focus
		if objectexists id = current_menu_anchor
			launchevent type = focus target = current_menu_anchor
		endif
	endif
	change goal_film_showing_options = false
	change goal_dialog_box_active = 0
endscript

script dialog_box_exit {anchor_id = dialog_box_anchor}
	if screenelementexists id = <anchor_id>
		<anchor_id> :gettags
	endif
	destroy_dialog_box <...>
	if NOT gotparam dont_restore_input
		setbuttoneventmappings unblock_menu_input
	endif
	debounce x time = 0.3
	if objectexists id = <anchor_id>
		<anchor_id> :gettags
		printstruct <...>
		destroyscreenelement id = <anchor_id>
	endif
	if infrontend
	else
		pause_menu_gradient off
	endif
	if NOT gotparam no_pad_start
		if NOT infrontend
			if NOT gotparam no_pad_start
				restore_start_key_binding
			endif
		endif
	endif
endscript

script dialog_box_delay_input \{delay_input_time = 2000}
	temporarilydisableinput time = <delay_input_time>
endscript
dont_create_speech_boxes = 0

script create_speech_box 
	killspawnedscript \{id = create_speech_box_guts}
	spawnscriptnow create_speech_box_guts params = {<...>}
endscript

script create_speech_box_guts {pos = (320.0, 555.0)
		bg_rgba = [12 12 12 255]
		text_rgba = [220 220 220 255]
		anchor_id = speech_box_anchor
		scale = (1.6, 0.68)
		pad_choose_script = speech_box_exit
		pad_choose_params = {}
		parent = root_window
		rot_angle = RandomNoRepeat (@ 2 @ -2 )
		bg_x_scale = 1.12
		pause_input_time = 1000
	}
	font = text_a1
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <anchor_id>
		pos = <pos>
		just = [left center]
		scale = <scale>
		z_priority = <z_priority>
	}
	if NOT gotparam no_pad_choose
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_choose speech_box_input_debounce}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_back_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_back speech_box_input_debounce}
				{pad_back <pad_back_script> params = <pad_back_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_option_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> params = <pad_option_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_option2_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_option2 speech_box_input_debounce}
				{pad_option2 <pad_option2_script> params = <pad_option2_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_up_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_up <pad_up_script> params = <pad_up_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_down_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_down <pad_down_script> params = <pad_down_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_left_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_left <pad_left_script> params = <pad_left_params>}]
			replace_handlers
		}
	endif
	if gotparam pad_right_script
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_right <pad_right_script> params = <pad_right_params>}]
			replace_handlers
		}
	endif
	if NOT gotparam no_pad_start
		setscreenelementprops {
			id = root_window
			event_handlers = [{pad_start <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		font = <font>
		just = [center bottom]
		text = <text>
		rgba = <text_rgba>
		scale = (0.6, 0.95)
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		allow_expansion
	}
	<speech_text> = <id>
	getscreenelementdims id = <speech_text>
	new_width = (<width> * Random (@ 0.85 @ 0.95 @ 0.9 ))
	new_height = (<height> * ((2.2) * Random (@ 0.5 @ -0.5 @ -0.6 @ 0.6 )))
	dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
	createscreenelement {
		parent = <anchor_id>
		type = spriteelement
		texture = cap_whitenoise
		pos = (0.0, -25.0)
		dims = <dims>
		just = [center center]
		rgba = [220 220 220 220]
		z_priority = -50
		alpha = 0.5
	}
	new_width = (<width> * Random (@ 0.9 @ 0.95 ))
	new_height = (<height> * ((2.2) * Random (@ -1.05 @ -1 @ 1 )))
	dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
	createscreenelement {
		parent = <anchor_id>
		type = spriteelement
		texture = menu_highlight
		pos = (0.0, -25.0)
		dims = <dims>
		just = [center center]
		rgba = [0 0 0 255]
		alpha = 1
		rot_angle = RandomRange (-1.5, 1.0)
		z_priority = -51
		alpha = 0.5
	}
	new_width = (<width> * 0.9)
	new_height = (<height> * 2.5)
	dims = ((Random (@ (1.0, 0.0) @ (-1.0, 0.0) )* (<new_width> + 75)) + ((0.0, 0.6) * <new_height>))
	createscreenelement {
		parent = <anchor_id>
		type = spriteelement
		texture = menu_highlight
		pos = (0.0, -25.0)
		dims = <dims>
		just = [center center]
		rgba = ($goal_generic_ui_scheme.main)
		rot_angle = RandomRange (1.0, -1.0)
		alpha = 1
		z_priority = -52
		alpha = 0.5
	}
	temp_pos = ((<pos> - ((1.0, 0.0) * (<pos> [0]))) + (256.0, 0.0))
	setscreenelementprops {
		id = <anchor_id>
		dims = ((1.0, 0.0) * <width>)
		pos = (<temp_pos> + ((0.5, 0.0) * <width>))
		just = [left center]
	}
	getscreenelementprops id = <id>
	pos_top = (<pos> [1])
	if gotparam style
		runscriptonscreenelement id = <anchor_id> <style> params = <...>
	endif
	launchevent type = focus target = <anchor_id>
	if gotparam pause_input
		spawnscriptlater temporarilydisableinput params = {time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if objectexists id = <anchor_id>
		<anchor_id> :gettags
		destroyscreenelement id = <anchor_id>
	endif
	debounce \{x
		time = 0.3}
	debounce \{circle
		time = 0.3}
	if NOT gotparam \{no_pad_start}
		restore_start_key_binding
	endif
	launchevent \{type = speech_box_destroyed}
endscript

script speech_box_input_debounce 
	debounce \{x
		time = 0.3
		clear = 1}
	debounce \{circle
		time = 0.3
		clear = 1}
	debounce \{square
		time = 0.3
		clear = 1}
	debounce \{triangle
		time = 0.3
		clear = 1}
endscript

script speech_box_style 
	runscriptonscreenelement id = <speech_text> hide_speech_text params = <...>
	domorph \{time = 0
		scale = (1.0, 1.0)
		alpha = 1}
	wait \{4
		gameframes}
	domorph \{time = 0.2
		scale = (1.0, 1.0)
		alpha = 1}
	runscriptonscreenelement id = <speech_text> speech_box_style_scale_text params = <...>
endscript

script hide_speech_text 
	domorph \{time = 0
		scale = 0}
endscript

script speech_box_style_scale_text 
	wait \{0.05
		seconds
		ignoreslomo}
	domorph \{time = 0
		scale = (1.0, 1.0)
		alpha = 0}
	domorph \{time = 0.5
		scale = (1.0, 1.0)
		alpha = 1}
	launchevent type = focus target = <anchor_id>
endscript

script animate_dialog_box_in 
	gettags
	if gotparam full_animate
		setscreenelementprops {
			id = <bg_anchor_id>
			hide
		}
	endif
	if NOT gotparam delay_input
		<bg_anchor_id> :obj_spawnscriptlater dialog_box_delay_input params = {delay_input_time = 300}
	endif
	domorph time = 0 scale = (0.0, 0.0) alpha = 0.0 pos = {(-300.0, -100.0) relative}
	doscreenelementmorph id = <id> time = 0.15 scale = (1.0, 1.0)
	if screenelementexists id = bg_graytint
		doscreenelementmorph id = bg_graytint alpha = 1.0 time = 0.15
	endif
	domorph pos = {(300.0, 100.0) relative} alpha = 1.0 time = 0.15
	if gotparam full_animate
		setscreenelementprops {
			id = <bg_anchor_id>
			unhide
		}
	endif
endscript

script create_test_dialog 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_dialog_box \{pad_back_script = create_test_menu
		buttons = [
			{
				font = text_a1
				text = "No"
				pad_choose_script = create_test_menu
			}
			{
				font = text_a1
				text = "Yes"
				pad_choose_script = null_script
			}
		]}
endscript

script dialog_box_accept 
	dialog_box_exit
	launchevent \{type = message_accept}
endscript

script do_ok_dialog_box 
	create_dialog_box {
		<...>
		buttons = [{font = text_a1 text = "Ok" pad_choose_script = do_ok_dialog_box_confirmed}]
	}
	block \{type = ok_dialog_box_confirmed}
endscript

script do_ok_dialog_box_confirmed 
	unpausespawnedscript \{do_ok_dialog_box}
	broadcastevent \{type = ok_dialog_box_confirmed}
endscript
