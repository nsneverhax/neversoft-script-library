keyboard_current_charset = alphanumeric_lower
keyboard_text_scale = (0.45000002, 0.3)
keyboard_button_scale = (1.0, 1.8499999)
keyboard_caps_lock = 0
keyboard_text_block_width = 360
keyboard_color = {
	keyboard_text_focus = [
		0
		0
		0
		230
	]
	keyboard_text_unfocus = [
		32
		32
		32
		230
	]
	keyboard_bar_color = [
		130
		40
		60
		255
	]
	keyboard_button_focus = [
		220
		220
		220
		255
	]
	keyboard_button_unfocus = [
		64
		64
		64
		255
	]
	keyboard_highlight = [
		220
		220
		220
		255
	]
	keyboard_unhighlight = [
		140
		130
		120
		255
	]
	keyboard_text_faint = [
		64
		64
		64
		230
	]
	keyboard_title_bg = [
		200
		200
		200
		250
	]
	keyboard_button_bg = [
		128
		128
		128
		250
	]
	keyboard_string = [
		200
		70
		70
		250
	]
}
alphanumeric_charset_lower = [
	[
		"1"
		"2"
		"3"
		"4"
		"5"
		"6"
		"7"
		"8"
		"9"
		"0"
	]
	[
		"a"
		"b"
		"c"
		"d"
		"e"
		"f"
		"g"
		"h"
		"i"
	]
	[
		"j"
		"k"
		"l"
		"m"
		"n"
		"o"
		"p"
		"q"
		"r"
	]
	[
		"s"
		"t"
		"u"
		"v"
		"w"
		"x"
		"y"
		"z"
		" "
	]
]
alphanumeric_charset_upper = [
	[
		"1"
		"2"
		"3"
		"4"
		"5"
		"6"
		"7"
		"8"
		"9"
		"0"
	]
	[
		"A"
		"B"
		"C"
		"D"
		"E"
		"F"
		"G"
		"H"
		"I"
	]
	[
		"J"
		"K"
		"L"
		"M"
		"N"
		"O"
		"P"
		"Q"
		"R"
	]
	[
		"S"
		"T"
		"U"
		"V"
		"W"
		"X"
		"Y"
		"Z"
		" "
	]
]
punctuation_charset = [
	[
		"1"
		"2"
		"3"
		"4"
		"5"
		"6"
		"7"
		"8"
		"9"
		"0"
	]
	[
		"."
		","
		"!"
		"?"
		"-"
		"¦"
		"'"
		"+"
		"/"
	]
	[
		"^"
		"#"
		"$"
		"{"
		"*"
		"@"
		"`"
		"&"
		":"
	]
	[
		"<"
		">"
		"_"
		"-"
		"¡"
		"="
		"("
		")"
		" "
	]
]
foreign_charset_lower = [
	[
		"ª"
		"º"
		"¡"
		"ß"
		"ç"
		""
		"ñ"
		" "
		" "
		" "
	]
	[
		"à"
		"á"
		"â"
		"ä"
		"è"
		"é"
		"ê"
		"ë"
		" "
	]
	[
		"ì"
		"í"
		"î"
		"ï"
		"ò"
		"ó"
		"ô"
		"ö"
		" "
	]
	[
		"ù"
		"ú"
		"û"
		"ü"
		" "
		" "
		" "
		"¿"
		" "
	]
]
foreign_charset_upper = [
	[
		"ª"
		"º"
		"¡"
		"ß"
		"Ç"
		""
		"Ñ"
		" "
		" "
		" "
	]
	[
		"À"
		"Á"
		"â"
		"Ä"
		"È"
		"É"
		"ê"
		"ë"
		" "
	]
	[
		"Ì"
		"Í"
		"î"
		"ï"
		"Ò"
		"ó"
		"ô"
		"Ö"
		" "
	]
	[
		"Ù"
		"Ú"
		"û"
		"Ü"
		" "
		" "
		" "
		"¿"
		" "
	]
]

script create_onscreen_keyboard {keyboard_title = "KEYBOARD"
		keyboard_cancel_script = keyboard_cancel
		pos = (475.0, 320.0)
		max_length = 20
		display_text = "_"
		text = ""
		display_text_scale = 0.55
		display_text_offset = (0.0, 15.0)
	}
	heap = frontendheap
	change keyboard_toggling_char_set = 0
	highlight_color = [100 90 80 255]
	unhighlight_color = ($mainmenu_color_scheme.keyboard_unhighlight)
	destroy_onscreen_keyboard
	setscreenelementlock id = root_window off
	if gotparam no_buttons
		createscreenelement {
			type = containerelement
			parent = root_window
			id = keyboard_anchor
			scale = 1.5
			pos = <pos>
			dims = (640.0, 480.0)
			z_priority = 15
			heap = <heap>
		}
	else
		createscreenelement {
			type = containerelement
			parent = root_window
			id = keyboard_bg_anchor
			pos = <pos>
			dims = (640.0, 480.0)
			heap = <heap>
		}
		createscreenelement {
			type = containerelement
			parent = keyboard_bg_anchor
			id = keyboard_anchor
			focusable_child = keyboard_vmenu
			scale = 1.5
			pos = <pos>
			dims = (640.0, 480.0)
			heap = <heap>
		}
	endif
	assignalias id = keyboard_anchor alias = current_menu_anchor
	if gotparam disable_special_character_tabs
		keyboard_anchor :settags disable_special_character_tabs
	endif
	if gotparam password
		keyboard_anchor :settags password
	endif
	if NOT gotparam no_buttons
		if gotparam allow_cancel
			create_helper_text {helper_text_elements = [{text = "\\m1 CANCEL"}
					{text = "\\m0 ACCEPT"}
					{text = "\\mf/\\mg CHARACTER SET"}
				]
				helper_pos = <helper_pos>
				parent = keyboard_bg_anchor
			}
		else
			create_helper_text {helper_text_elements = [{text = "\\m0 ACCEPT"}
					{text = "\\mf/\\mg CHARACTER SET"}
				]
				helper_pos = <helper_pos>
				parent = keyboard_bg_anchor
			}
		endif
	endif
	<org_text> = <text>
	formattext textname = text "%s_" s = <text>
	if gotparam no_buttons
		keyboard_anchor :settags no_buttons
		setscreenelementprops {
			id = keyboard_anchor
			event_handlers = [{pad_choose keyboard_done params = <...>}
				{pad_start keyboard_done params = <...>}
				{pad_start generic_keyboard_sound}
				{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
			]
		}
		createscreenelement {
			type = textelement
			parent = keyboard_anchor
			font = text_a1
			id = kb_no_button_hdr
			text = <display_text>
			pos = (320.0, 65.0)
			just = [center top]
			z_priority = 15
			heap = <heap>
		}
		if gotparam text_block
			createscreenelement {
				type = textblockelement
				parent = keyboard_anchor
				id = keyboard_display_string
				allow_expansion
				font = text_a1
				just = [center top]
				text = "_"
				internal_just = [center center]
				not_focusable
				pos = (320.0, 85.0)
				dims = ((1.0, 0.0) * $keyboard_text_block_width + (0.0, 10.0))
				scale = 0.65000004
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
		else
			createscreenelement {
				type = textelement
				parent = keyboard_anchor
				id = keyboard_display_string
				font = text_a1
				just = [center top]
				text = "_"
				not_focusable
				pos = (320.0, 85.0)
				scale = 0.65000004
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
		endif
		printf "*** 9"
		if gotparam password
			keyboard_display_string :text_getlength
			setscreenelementprops id = keyboard_display_string text = ""
			if (<length> > 1)
				begin
				keyboard_display_string :text_concatenate "*"
				repeat (<length> -1)
				keyboard_display_string :text_concatenate "_"
			endif
		endif
		createscreenelement {
			type = textblockelement
			parent = keyboard_anchor
			id = keyboard_current_string
			font = text_a1
			just = [center top]
			text = <org_text>
			not_focusable
			pos = (320.0, 85.0)
			dims = ((1.0, 0.0) * $keyboard_text_block_width + (0.0, 10.0))
			allow_expansion
			scale = 0
			rgba = ($keyboard_color.keyboard_string)
			heap = <heap>
		}
		if gotparam allowed_characters
			keyboard_current_string :settags allowed_characters = <allowed_characters>
		endif
		if gotparam max_length
			if (<max_length> < 1)
				script_assert "create_onscreen_keyboard called with bad max_length"
			endif
			begin
			keyboard_current_string :text_getlength
			if (<length> > <max_length>)
				keyboard_current_string :text_backspace
				keyboard_display_string :text_backspace
			else
				break
			endif
			repeat
		endif
		launchevent type = focus target = keyboard_anchor
	else
		createscreenelement {
			local_id = input_background
			parent = keyboard_anchor
			type = spriteelement
			texture = menu_highlight
			pos = (300.0, 100.0)
			z_priority = 1
			scale = (1.5, 1.5)
			rgba = ($keyboard_color.keyboard_title_bg)
			flip_h
		}
		ui_create_messy_background {
			parent = keyboard_bg_anchor
			messy_id = test_messy
			dims = (900.0, 1200.0)
			pos = (-100.0, -300.0)
			z_priority = -2
			rot_angle = RandomRange (-13.0, -10.0)
		}
		if NOT gotparam title_scale_extend
			title_scale_extend = (0.0, 0.0)
		endif
		createscreenelement {
			type = spriteelement
			parent = keyboard_bg_anchor
			texture = menu_headerbar
			just = [left top]
			pos = (-50.0, 0.0)
			scale = ((1.0, 1.0) + <title_scale_extend>)
			z_priority = 0
			flip_v
			rgba = ($goal_ui_scheme.main)
		}
		createscreenelement {
			type = textelement
			parent = keyboard_bg_anchor
			font = text_a1
			text = <keyboard_title>
			just = [left center]
			pos = (0.0, 38.0)
			rgba = [200 200 200 255]
			scale = (1.1, 0.8)
			z_priority = 1
			shadow
			shadow_rgba = [0 0 0 255]
			shadow_offs = (3.0, 3.0)
		}
		if gotparam text_block
			createscreenelement {
				type = vmenu
				parent = keyboard_anchor
				id = keyboard_vmenu
				pos = (320.0, 247.0)
				internal_just = [center top]
				regular_space_amount = 30
				event_handlers = [
					{pad_up keyboard_change_key_sound}
					{pad_down keyboard_change_key_sound}
				]
				heap = <heap>
			}
			if NOT gotparam no_back
				setscreenelementprops {
					id = keyboard_vmenu
					event_handlers = [
						{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
					]
				}
			else
				kill_start_key_binding
			endif
		else
			createscreenelement {
				type = vmenu
				parent = keyboard_anchor
				id = keyboard_vmenu
				pos = (320.0, 212.0)
				scale = (1.1, 1.1)
				internal_just = [center top]
				regular_space_amount = 35
				event_handlers = [
					{pad_up keyboard_change_key_sound}
					{pad_down keyboard_change_key_sound}
				]
				heap = <heap>
			}
			if NOT gotparam no_back
				setscreenelementprops {
					id = keyboard_vmenu
					event_handlers = [
						{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
					]
				}
			else
				kill_start_key_binding
			endif
		endif
		setscreenelementprops {id = keyboard_vmenu
			event_handlers = [{pad_backspace keyboard_handle_backspace}
			]
		}
		if NOT gotparam no_space
			setscreenelementprops {id = keyboard_vmenu
				event_handlers = [{pad_space keyboard_handle_space params = {max_length = <max_length>}}
				]
			}
		endif
		if NOT gotparam no_back
			setscreenelementprops {
				id = keyboard_vmenu
				event_handlers = [
					{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}
				]
			}
		else
			kill_start_key_binding
		endif
		if gotparam text_block
			keyboard_anchor :settags text_block
			createscreenelement {
				type = containerelement
				parent = keyboard_vmenu
				internal_just = [center center]
				dims = (10.0, 20.0)
				not_focusable
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
			createscreenelement {
				type = textblockelement
				parent = keyboard_anchor
				id = keyboard_display_string
				font = text_a1
				just = [center top]
				internal_just = [left center]
				text = <text>
				not_focusable
				pos = (320.0, 90.0)
				dims = ((1.0, 0.0) * $keyboard_text_block_width + (20.0, 400.0))
				allow_expansion
				line_spacing = 0.86
				scale = 0.55
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
		else
			createscreenelement {
				type = containerelement
				parent = keyboard_vmenu
				id = keyboard_display_string_container
				dims = (10.0, 20.0)
				not_focusable
				heap = <heap>
			}
			createscreenelement {
				type = textelement
				parent = <id>
				id = keyboard_display_string
				pos = ((-150.0, 0.0) + <display_text_offset>)
				font = text_a1
				just = [left center]
				text = <text>
				scale = <display_text_scale>
				not_focusable
				rgba = <highlight_color>
				heap = <heap>
			}
		endif
		if gotparam password
			keyboard_display_string :text_getlength
			setscreenelementprops id = keyboard_display_string text = ""
			if (<length> > 1)
				begin
				keyboard_display_string :text_concatenate "*"
				repeat (<length> -1)
				keyboard_display_string :text_concatenate "_"
			endif
		endif
		if gotparam text_block
			createscreenelement {
				type = textblockelement
				parent = keyboard_anchor
				id = keyboard_current_string
				font = text_a1
				just = [center top]
				text = <org_text>
				not_focusable
				pos = (320.0, 85.0)
				dims = ((1.0, 0.0) * $keyboard_text_block_width + (0.0, 16.0))
				allow_expansion
				scale = 0
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
		else
			createscreenelement {
				type = textelement
				parent = keyboard_anchor
				id = keyboard_current_string
				font = text_a1
				just = [center top]
				text = <org_text>
				not_focusable
				pos = (320.0, 85.0)
				scale = 0
				rgba = ($keyboard_color.keyboard_string)
				heap = <heap>
			}
		endif
		if gotparam allowed_characters
			keyboard_current_string :settags allowed_characters = <allowed_characters>
		endif
		if gotparam max_length
			if (<max_length> < 1)
				script_assert "create_onscreen_keyboard called with bad max_length"
			endif
			begin
			keyboard_current_string :text_getlength
			if (<length> > <max_length>)
				keyboard_current_string :text_backspace
				keyboard_display_string :text_backspace
			else
				break
			endif
			repeat
		endif
		keyboard_create_key_sprites <...>
		keyboard_change_charset charset = $alphanumeric_charset_lower max_length = <max_length>
		change keyboard_current_charset = alphanumeric_lower
		launchevent type = focus target = keyboard_vmenu
		runscriptonscreenelement id = keyboard_anchor keyboard_animate_in
	endif
	if NOT gotparam no_buttons
		assignalias id = keyboard_bg_anchor alias = current_menu_anchor
	endif
	if infrontend
		stopkeyboardhandler
	endif
	startkeyboardhandler max_length = <max_length>
endscript

script keyboard_animate_in 
	obj_getid
	doscreenelementmorph id = <objid> alpha = 0
	doscreenelementmorph id = <objid> alpha = 1 time = 0.3
endscript
global_keyboard_done = {
	empty
}

script keyboard_create_key_sprites 
	keyboard_add_hmenu id = keyboard_row_1 heap = <heap>
	keyboard_add_hmenu id = keyboard_row_2 heap = <heap>
	keyboard_add_hmenu id = keyboard_row_3 heap = <heap>
	keyboard_add_hmenu id = keyboard_row_4 heap = <heap>
	keyboard_add_hmenu id = keyboard_row_5 heap = <heap>
	keyboard_add_hmenu id = keyboard_row_6 heap = <heap>
	keyboard_add_special_button {
		button_id = keyboard_caps_button
		hmenu_id = keyboard_row_1
		pad_choose_script = keyboard_handle_caps
		pad_choose_params = {max_length = <max_length>}
		text = "caps"
		text_id = caps_lock_text
		text_pos = (30.0, 0.0)
		width = 58
		grid_x = 0
	}
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_1 number_of_buttons = 10 heap = <heap>
	keyboard_anchor :getsingletag disable_special_character_tabs
	focus = {focusable}
	if gotparam disable_special_character_tabs
		focus = {not_focusable}
	endif
	keyboard_add_special_button {
		hmenu_id = keyboard_row_2
		pad_choose_script = keyboard_handle_foreign
		pad_choose_params = {max_length = <max_length>}
		text = "foreign"
		text_pos = (124.0, 5.0)
		pad_button_pos = (36.0, 11.0)
		width = 96
		grid_x = 0
		<focus>
	}
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_2 number_of_buttons = 9 heap = <heap>
	keyboard_add_special_button {
		hmenu_id = keyboard_row_3
		pad_choose_script = keyboard_handle_symbol
		pad_choose_params = {max_length = <max_length>}
		text = "symbol"
		text_pos = (124.0, 5.0)
		pad_button_pos = (36.0, 11.0)
		width = 96
		grid_x = 0
		<focus>
	}
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_3 number_of_buttons = 9 heap = <heap>
	keyboard_add_special_button {
		button_id = keyboard_shift_button
		hmenu_id = keyboard_row_4
		pad_choose_script = keyboard_handle_shift
		pad_choose_params = {max_length = <max_length>}
		text = "shift"
		text_id = shift_text
		text_pos = (48.0, 0.0)
		width = 96
		grid_x = 0
	}
	keyboard_add_generic_buttons_to_hmenu hmenu_id = keyboard_row_4 number_of_buttons = 9 heap = <heap>
	keyboard_add_special_button {
		hmenu_id = keyboard_row_5
		pad_choose_script = keyboard_handle_backspace
		text = "backspace"
		pad_button_text = "\\m7"
		text_pos = (124.0, 5.0)
		pad_button_pos = (36.0, 11.0)
		width = 159
		grid_x = 0
	}
	params = {
		pad_button_text = "\\m8"
	}
	if gotparam no_space
		params = {
			not_focusable
			pad_button_text = ""
		}
	endif
	keyboard_add_special_button {
		hmenu_id = keyboard_row_5
		pad_choose_script = keyboard_handle_space
		pad_choose_params = {max_length = <max_length>}
		text = "space"
		pad_button_text = "\\m8"
		<params>
		text_pos = (95.0, 8.0)
		pad_button_pos = (48.0, 11.0)
		width = 128
		grid_x = 3
	}
	if gotparam allow_cancel
		setscreenelementprops {
			id = keyboard_vmenu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}}]
			replace_handlers
		}
		keyboard_add_special_button {
			hmenu_id = keyboard_row_5
			pad_choose_script = generic_menu_pad_back params <keyboard_cancel_script>
			pad_choose_params = {callback = <keyboard_cancel_script> <keyboard_cancel_params>}
			text = "cancel"
			pad_button_text = "\\m1"
			text_pos = (106.0, 8.0)
			pad_button_pos = (47.0, 10.0)
			width = 132
			grid_x = 6
		}
	endif
	change global_keyboard_done = <...>
	keyboard_add_special_button {
		hmenu_id = keyboard_row_6
		pad_choose_script = keyboard_done pad_choose_params = <...>
		button_id = keyboard_done_button
		text = "done"
		text_pos = (62.0, -1.0)
		width = 430
		grid_x = 9
	}
	setscreenelementprops {
		id = keyboard_vmenu
		event_handlers = [
			{pad_start keyboard_done params = <...>}
			{pad_start generic_keyboard_sound}
		]
	}
endscript

script keyboard_change_charset 
	begin
	if getnextarrayelement <charset> index = <index>
		keyboard_change_key_row row = <element> row_number = <index> max_length = <max_length>
	else
		break
	endif
	repeat
endscript

script keyboard_change_key_row 
	formattext checksumname = hmenu_id 'keyboard_row_%i' i = (<row_number> + 1)
	<index_tag> = 2
	if (<hmenu_id> = keyboard_row_1)
		<index_tag> = 1
	endif
	begin
	if getnextarrayelement <row> index = <index>
		setscreenelementprops {
			id = {<hmenu_id> child = {(<index> + 1) child = 0}}
			text = <element>
			replace_handlers
		}
		setscreenelementprops {
			id = {<hmenu_id> child = (<index> + 1)}
			tags = {tag_grid_x = (<index> + <index_tag>)}
		}
		keyboard_set_button_events {
			hmenu_id = <hmenu_id>
			index = (<index> + 1)
			text = <element>
			max_length = <max_length>
		}
	else
		break
	endif
	repeat
endscript

script destroy_onscreen_keyboard 
	killspawnedscript \{name = keyboard_key_focus}
	if objectexists \{id = keyboard_anchor}
		destroyscreenelement \{id = keyboard_anchor}
	endif
	if objectexists \{id = keyboard_bg_anchor}
		destroyscreenelement \{id = keyboard_bg_anchor}
	endif
	if infrontend
		if isxenon
			stopkeyboardhandler
		endif
	else
		stopkeyboardhandler
	endif
	change \{keyboard_caps_lock = 0}
endscript

script keyboard_add_hmenu 
	createscreenelement {
		type = hmenu
		parent = keyboard_vmenu
		id = <id>
		internal_just = [left center]
		event_handlers = [{pad_left keyboard_change_key_sound}
			{pad_right keyboard_change_key_sound}
		]
		heap = <heap>
		spacing_between = 5
	}
endscript

script keyboard_add_generic_buttons_to_hmenu 
	<button_rgba> = ($keyboard_color.keyboard_button_bg)
	begin
	createscreenelement {
		type = spriteelement
		parent = <hmenu_id>
		rgba = <button_rgba>
		texture = generic_key
		scale = $keyboard_button_scale
		heap = <heap>
	}
	keyboard_create_dummy_text id = <id>
	repeat <number_of_buttons>
endscript

script keyboard_set_button_events 
	if gotparam id
		if objectexists id = <id>
			setscreenelementprops {
				id = <id>
				event_handlers = [{focus keyboard_button_focus}
					{unfocus keyboard_button_unfocus}
					{pad_choose keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
				]
				replace_handlers
			}
		endif
	else
		if objectexists id = <hmenu_id>
			if objectexists id = {<hmenu_id> child = <index>}
				setscreenelementprops {
					id = {<hmenu_id> child = <index>}
					event_handlers = [{focus keyboard_button_focus}
						{unfocus keyboard_button_unfocus}
						{pad_choose keyboard_button_pressed params = {text = <text> max_length = <max_length>}}
					]
					replace_handlers
				}
			endif
		endif
	endif
endscript

script keyboard_create_dummy_text 
	unhighlight_color = ($keyboard_color.keyboard_text_faint)
	createscreenelement {
		local_id = text
		type = textelement
		parent = <id>
		rgba = ($keyboard_color.keyboard_text_faint)
		just = [center center]
		pos = (17.0, 10.0)
		scale = $keyboard_text_scale
		font = text_a1
	}
endscript

script keyboard_add_special_button {
		text_scale = $keyboard_text_scale
		pad_button_pos = (33.0, 8.0)
		button_scale = $keyboard_button_scale
		width = 32
		height = 35
	}
	<button_rgba> = ($keyboard_color.keyboard_button_bg)
	unhighlight_color = ($keyboard_color.keyboard_text_faint)
	<focus> = {}
	if gotparam not_focusable
		<focus> = {not_focusable}
		unhighlight_color = ($keyboard_color.keyboard_text_unfocus)
		<button_rgba> = ($keyboard_color.keyboard_button_unfocus)
	endif
	createscreenelement {
		type = containerelement
		id = <button_id>
		parent = <hmenu_id>
		tags = {tag_grid_x = <grid_x> is_special_button}
		dims = ((1.0, 0.0) * <width> + (0.0, 35.0))
		<focus>
	}
	<parent_id> = <id>
	<root_pos> = (4.0, 17.5)
	createscreenelement {
		type = spriteelement
		local_id = left
		parent = <parent_id>
		scale = <button_scale>
		texture = key_left
		rgba = <button_rgba>
		pos = <root_pos>
	}
	<button_id> = <id>
	<iterations> = ((<width> - 16) / 4)
	<dx> = (<iterations> * 4)
	<kb_scale> = ((<iterations> * (1.0, 0.0)) + (0.0, 1.6))
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		local_id = center
		texture = key_middle
		scale = (<kb_scale> + (0.1, 0.25))
		rgba = <button_rgba>
		pos = ((0.5, 0.0) * <dx> + <root_pos> + (4.0, 0.0))
		not_focusable
		z_priority = 1
	}
	createscreenelement {
		type = spriteelement
		parent = <parent_id>
		local_id = right
		scale = <button_scale>
		texture = key_right
		rgba = <button_rgba>
		not_focusable
		pos = ((1.0, 0.0) * <dx> + <root_pos> + (8.1, 0.0))
	}
	if ((<text> = "space") || (<text> = "backspace"))
		setscreenelementprops {
			id = <parent_id>
			event_handlers = [{focus keyboard_button_focus}
				{unfocus keyboard_button_unfocus}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
	else
		setscreenelementprops {
			id = <parent_id>
			event_handlers = [{focus keyboard_button_focus}
				{unfocus keyboard_button_unfocus}
				{pad_choose generic_keyboard_sound}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
			]
			replace_handlers
		}
	endif
	<new_text> = ""
	if gotparam pad_button_text
		<new_text> = (<pad_button_text> + " ")
	endif
	getscreenelementposition id = <button_id>
	<text_pos> = ((((0.5, 0.0) * <width>) + ((0.0, 0.5) * <height>) + (0.0, 5.0)) + (0.0, -3.0))
	<text_just> = [center center]
	<text_scale> = (<text_scale> + (0.07, 0.07))
	<new_text> = (<new_text> + <text>)
	createscreenelement {
		local_id = text
		type = textelement
		parent = <parent_id>
		z_priority = 10
		font = text_a1
		id = <text_id>
		text = <new_text>
		pos = <text_pos>
		scale = <text_scale>
		just = <text_just>
		rgba = <unhighlight_color>
		event_handlers = [{focus keyboard_text_focus}
			{unfocus keyboard_text_unfocus}
		]
	}
	<bg_width> = (<width> - 8.0)
	getscreenelementdims id = <id>
	if (<width> > <bg_width>)
		<scale> = ((<bg_width> / <width>) * <text_scale>)
		printf "scale = %s" s = <scale>
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
endscript
keyboard_button_focus_id = none

script keyboard_button_focus 
	getsingletag id
	getsingletag is_special_button
	<highlight_rgba> = ($keyboard_color.keyboard_button_focus)
	if NOT ($keyboard_button_focus_id = none)
		keyboard_button_unfocus id = ($keyboard_button_focus_id)
	endif
	change keyboard_button_focus_id = <id>
	if gotparam is_special_button
		doscreenelementmorph id = {<id> child = 0} rgba = <highlight_rgba> time = 0
		doscreenelementmorph id = {<id> child = 1} rgba = <highlight_rgba> time = 0
		doscreenelementmorph id = {<id> child = 2} rgba = <highlight_rgba> time = 0
	else
		doscreenelementmorph id = <id> rgba = <highlight_rgba> time = 0
	endif
endscript

script keyboard_button_unfocus 
	getsingletag \{id}
	getsingletag \{is_special_button}
	<button_rgba> = ($keyboard_color.keyboard_button_bg)
	if gotparam \{is_special_button}
		doscreenelementmorph id = {<id> child = 0} rgba = <button_rgba>
		doscreenelementmorph id = {<id> child = 1} rgba = <button_rgba>
		doscreenelementmorph id = {<id> child = 2} rgba = <button_rgba>
	else
		doscreenelementmorph id = <id> rgba = <button_rgba>
	endif
endscript

script keyboard_key_focus 
	begin
	if screenelementexists id = <id>
		doscreenelementmorph id = <id> time = 0.03 scale = (<org_scale> * 1.05)
	endif
	wait \{0.2
		second}
	if screenelementexists id = <id>
		doscreenelementmorph id = <id> time = 0.03 scale = (<org_scale> * 0.95)
	endif
	wait \{0.2
		second}
	repeat
endscript

script keyboard_text_focus 
	highlight_color = ($keyboard_color.keyboard_text_focus)
	setprops rgba = <highlight_color>
endscript

script keyboard_text_unfocus 
	unhighlight_color = ($keyboard_color.keyboard_text_faint)
	setprops rgba = <unhighlight_color>
endscript

script keyboard_button_pressed 
	if (<text> = "\\\\")
		<text> = "\\"
	endif
	if (<text> = "\\")
		soundevent event = Keyboard_SFX_GUI_Buzzer
		return
	endif
	if (<text> = "%")
		soundevent event = Keyboard_SFX_GUI_Buzzer
		return
	endif
	if gotparam max_length
		keyboard_current_string :text_getlength
		if (<length> > (<max_length> - 1))
			soundevent event = Keyboard_SFX_GUI_Buzzer
			return
		endif
	endif
	keyboard_current_string :getsingletag allowed_characters
	if gotparam allowed_characters
		if arraycontains array = <allowed_characters> contains = <text>
			soundevent event = Keyboard_SFX_MenuUp
		else
			soundevent event = Keyboard_SFX_GUI_Buzzer
			return
		endif
	else
		soundevent event = Keyboard_SFX_MenuUp
	endif
	if (<text> = "\\")
		<text> = "\\\\"
	endif
	getscreenelementdims id = keyboard_display_string
	if (<height> > 40)
		<last_line> = last_line
	endif
	if keyboard_current_string :text_concatenate <text> enforce_max_width <last_line>
		keyboard_anchor :getsingletag password
		if gotparam password
			keyboard_display_string :text_backspace
			formattext textname = text_w_cursor "%s_" s = "*"
			keyboard_display_string :text_concatenate <text_w_cursor> enforce_max_width <last_line>
		else
			keyboard_display_string :text_backspace
			formattext textname = text_w_cursor "%s_" s = <text>
			keyboard_display_string :text_concatenate <text_w_cursor> enforce_max_width <last_line>
		endif
		getscreenelementdims id = keyboard_display_string
		if gotparam no_buttons
			max_string_width = 550
		else
			max_string_width = 300
		endif
		if screenelementexists id = keyboard_display_string_container
			if (<width> > <max_string_width>)
				keyboard_display_string :text_backspace
				keyboard_display_string :text_backspace
				keyboard_current_string :text_backspace
				soundevent event = Keyboard_SFX_GUI_Buzzer
			endif
		else
			printf "%s %t" s = <height> t = <width>
			if (<height> > 80)
				keyboard_display_string :text_backspace
				keyboard_current_string :text_backspace
				if NOT (<text> = " ")
					keyboard_display_string :text_backspace
					keyboard_display_string :text_concatenate " " enforce_max_width <last_line>
				endif
				printf "string reached end of keyboard!"
				soundevent event = Keyboard_SFX_GUI_Buzzer
			endif
		endif
		switch $keyboard_current_charset
			case alphanumeric_lower
			if istrue $keyboard_caps_lock
				keyboard_change_charset charset = $alphanumeric_charset_upper max_length = <max_length>
				change keyboard_current_charset = alphanumeric_upper
			endif
			case alphanumeric_upper
			if NOT istrue $keyboard_caps_lock
				keyboard_change_charset charset = $alphanumeric_charset_lower max_length = <max_length>
				change keyboard_current_charset = alphanumeric_lower
			endif
			case foreign_lower
			if istrue $keyboard_caps_lock
				keyboard_change_charset charset = $foreign_charset_upper max_length = <max_length>
				change keyboard_current_charset = foreign_upper
			endif
			case foreign_upper
			if NOT istrue $keyboard_caps_lock
				keyboard_change_charset charset = $foreign_charset_lower max_length = <max_length>
				change keyboard_current_charset = foreign_lower
			endif
		endswitch
	else
		printf "string too long!"
	endif
endscript
keyboard_toggling_char_set = 0

script reset_char_guides 
	unhighlight_color = ($mainmenu_color_scheme.keyboard_unhighlight)
	setscreenelementprops id = char_guide_allcaps rgba = <unhighlight_color>
	setscreenelementprops id = char_guide_lower rgba = <unhighlight_color>
	setscreenelementprops id = char_guide_symbols rgba = <unhighlight_color>
	setscreenelementprops id = char_guide_foreign rgba = <unhighlight_color>
	reset_char_disabled
	change \{keyboard_caps_lock = 0}
endscript

script reset_char_disabled 
	if keyboard_anchor :getsingletag \{disable_special_character_tabs}
		setscreenelementprops \{id = char_guide_symbols
			rgba = [
				0
				0
				0
				30
			]}
		setscreenelementprops \{id = char_guide_foreign
			rgba = [
				0
				0
				0
				30
			]}
	endif
endscript

script keyboard_handle_shift 
	soundevent event = Keyboard_SFX_MenuUp
	switch $keyboard_current_charset
		case alphanumeric_lower
		keyboard_change_charset charset = $alphanumeric_charset_upper max_length = <max_length>
		change keyboard_current_charset = alphanumeric_upper
		case alphanumeric_upper
		keyboard_change_charset charset = $alphanumeric_charset_lower max_length = <max_length>
		change keyboard_current_charset = alphanumeric_lower
		case foreign_upper
		keyboard_change_charset charset = $foreign_charset_lower max_length = <max_length>
		change keyboard_current_charset = foreign_lower
		case foreign_lower
		keyboard_change_charset charset = $foreign_charset_upper max_length = <max_length>
		change keyboard_current_charset = foreign_upper
		default
	endswitch
endscript

script keyboard_handle_backspace 
	soundevent \{event = Keyboard_SFX_Backspace}
	keyboard_display_string :text_backspace
	keyboard_display_string :text_backspace
	keyboard_display_string :text_concatenate \{"_"}
	if NOT keyboard_current_string :text_backspace
	endif
endscript

script keyboard_handle_space 
	keyboard_button_pressed text = " " max_length = <max_length>
endscript

script keyboard_handle_caps 
	highlight_color = ($keyboard_color.keyboard_text_focus)
	soundevent event = Keyboard_SFX_MenuUp
	switch $keyboard_current_charset
		case alphanumeric_upper
		keyboard_change_charset charset = $alphanumeric_charset_lower max_length = <max_length>
		change keyboard_current_charset = alphanumeric_lower
		change keyboard_caps_lock = 0
		case alphanumeric_lower
		keyboard_change_charset charset = $alphanumeric_charset_upper max_length = <max_length>
		change keyboard_current_charset = alphanumeric_upper
		change keyboard_caps_lock = 1
		case foreign_upper
		keyboard_change_charset charset = $foreign_charset_lower max_length = <max_length>
		change keyboard_current_charset = foreign_lower
		change keyboard_caps_lock = 0
		case foreign_lower
		keyboard_change_charset charset = $foreign_charset_upper max_length = <max_length>
		change keyboard_current_charset = foreign_upper
		change keyboard_caps_lock = 1
		default
	endswitch
	if ($keyboard_caps_lock = 1)
		setscreenelementprops {
			id = {keyboard_caps_button child = text}
			text = "CAPS"
		}
	else
		setscreenelementprops {
			id = {keyboard_caps_button child = text}
			text = "caps"
		}
	endif
endscript

script keyboard_handle_alpha 
	gettags
	setscreenelementprops {
		id = keyboard_caps_button
		focusable
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = text}
		rgba = ($keyboard_color.keyboard_text_faint)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = left}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = center}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = right}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	setscreenelementprops {
		id = keyboard_shift_button
		focusable
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = text}
		rgba = ($keyboard_color.keyboard_text_faint)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = left}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = center}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = right}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	printf "$keyboard_current_charset = %a" a = $keyboard_current_charset
	if ($keyboard_current_charset = symbol)
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_symbol params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "symbol"
		}
	else
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_foreign params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "foreign"
		}
	endif
	if ($keyboard_caps_lock = 0)
		keyboard_change_charset charset = $alphanumeric_charset_lower max_length = <max_length>
		change keyboard_current_charset = alphanumeric_lower
	else
		keyboard_change_charset charset = $alphanumeric_charset_upper max_length = <max_length>
		change keyboard_current_charset = alphanumeric_upper
	endif
endscript

script keyboard_handle_symbol 
	gettags
	setscreenelementprops {
		id = keyboard_caps_button
		not_focusable
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = text}
		rgba = ($keyboard_color.keyboard_text_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = left}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = center}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = right}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	setscreenelementprops {
		id = keyboard_shift_button
		not_focusable
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = text}
		rgba = ($keyboard_color.keyboard_text_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = left}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = center}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = right}
		rgba = ($keyboard_color.keyboard_button_unfocus)
	}
	if (($keyboard_current_charset = alphanumeric_lower) || $keyboard_current_charset = alphanumeric_upper)
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_alpha params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "alpha"
		}
	else
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_foreign params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "foreign"
		}
	endif
	keyboard_change_charset charset = $punctuation_charset max_length = <max_length>
	change keyboard_current_charset = symbol
endscript

script keyboard_handle_foreign 
	gettags
	setscreenelementprops {
		id = keyboard_caps_button
		focusable
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = text}
		rgba = ($keyboard_color.keyboard_text_faint)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = left}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = center}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_caps_button child = right}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	setscreenelementprops {
		id = keyboard_shift_button
		focusable
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = text}
		rgba = ($keyboard_color.keyboard_text_faint)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = left}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = center}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	doscreenelementmorph {
		id = {keyboard_shift_button child = right}
		rgba = ($keyboard_color.keyboard_button_bg)
	}
	if (($keyboard_current_charset = alphanumeric_lower) || $keyboard_current_charset = alphanumeric_upper)
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_alpha params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "alpha"
		}
	else
		setprops {
			event_handlers = [
				{pad_choose keyboard_handle_symbol params = {max_length = <max_length>}}
				{pad_choose generic_keyboard_sound}
			]
			replace_handlers
		}
		setscreenelementprops {
			id = {<id> child = text}
			text = "symbol"
		}
	endif
	if ($keyboard_caps_lock = 0)
		keyboard_change_charset charset = $foreign_charset_lower max_length = <max_length>
		change keyboard_current_charset = foreign_lower
	else
		keyboard_change_charset charset = $foreign_charset_upper max_length = <max_length>
		change keyboard_current_charset = foreign_upper
	endif
endscript

script keyboard_done 
	if NOT screenelementexists id = keyboard_anchor
		return
	endif
	generic_menu_pad_choose_sound
	setbuttoneventmappings unblock_menu_input
	if gotparam min_length
		keyboard_current_string :text_getstring
		stringremovetrailingwhitespace param = string
		stringlength string = <string>
		if (<str_len> < <min_length>)
			printf "Not enough characters"
			return
		endif
	endif
	change keyboard_current_charset = alphanumeric_lower
	change keyboard_caps_lock = 0
	if gotparam keyboard_done_script
		printf "calling done script"
		GotoPreserveParams <keyboard_done_script> params = <keyboard_done_params>
	else
		keyboard_current_string :text_getstring
		if gotparam string
			printf "%s" s = <string>
		endif
		destroy_onscreen_keyboard
		unpause_game_and_destroy_pause_menu
	endif
endscript

script keyboard_cancel 
	destroy_onscreen_keyboard
	unpause_game_and_destroy_pause_menu
endscript
standard_charset = {
	alphanumeric_charset
	allow_punctuation
	allow_spaces
}
gapname_charset = {
	alphanumeric_charset
	allow_basic_punctuation
	allow_spaces
}
ip_charset = {
	ip_control
	allow_numbers
	allow_period
}
alphanumeric_charset = {
	allow_numbers
	allow_uppercase
	allow_lowercase
	allow_foreign
}
horse_charset = {
	allow_numbers
	allow_uppercase
	allow_lowercase
}

script truncate_string max_width = 100
	getscreenelementdims id = <id>
	if (<max_width> > <width>)
		return
	endif
	<id> :text_getlength
	if (2 > <length>)
		printf "too short... can't truncate text"
		return
	endif
	initial_width = <width>
	printf "initial width = %w max width = %m" w = <width> m = <max_width>
	<id> :text_concatenate "..."
	getscreenelementdims id = <id>
	extra_width = (<width> - <initial_width>)
	<id> :text_backspace
	<id> :text_backspace
	<id> :text_backspace
	begin
	getscreenelementdims id = <id>
	if ((<width> + <extra_width>) > <max_width>)
		<id> :text_backspace
	else
		break
	endif
	<id> :text_getlength
	if (0 = <length>)
		return
	endif
	repeat
	<id> :text_concatenate "..."
	getscreenelementdims id = <id>
	printf "final width = %w" w = <width>
endscript

script keyboard_change_key_sound 
	soundevent \{event = Keyboard_SFX_ChangeKey}
endscript

script handle_keyboard_input 
	if NOT screenelementexists \{id = keyboard_anchor}
		handle_keyboard_input_profile <...>
		return
	endif
	if gotparam \{text}
		keyboard_button_pressed text = <text> max_length = <max_length>
	endif
	if gotparam \{got_backspace}
		keyboard_handle_backspace
	endif
	if gotparam \{got_enter}
		spawnscriptnow keyboard_done params = ($global_keyboard_done)
	endif
endscript
current_page = 0
current_cpu = 0

script handle_keyboard_input_profile 
	if gotparam got_f1
		togglemetrics mode = 0
	endif
	if gotparam got_f2
		togglemetrics mode = 1
	endif
	if gotparam got_f3
		togglemetrics mode = 2
	endif
	if gotparam got_f4
		togglemetrics mode = 3
	endif
	getmetricsmode
	getarraysize $profile_pages
	num_pages = <array_size>
	num_cpus = 7
	if isps3
		<num_cpus> = 3
	endif
	if gotparam text
		<key> = 1
		begin
		formattext textname = key_name "%k" k = <key>
		if (<text> = <key_name>)
			if (<mode> = 2)
				if ((<key> - 1) < <num_cpus>)
					change current_cpu = (<key> -1)
					printf "Current CPU %c" c = $current_cpu
					break
				endif
			endif
			if (<mode> = 3)
				if ((<key> - 1) < <num_pages>)
					change current_page = (<key> -1)
					break
				endif
			endif
		endif
		<key> = (<key> + 1)
		repeat 9
		if (<mode> = 2)
			if (<text> = " ")
				moveprofilecursor cpu = ($current_cpu) freeze
			endif
			if (<text> = "d")
				dumpprofilestart
				dumpprofile cpu = ($current_cpu) title = "Profile Dump:"
				dumpprofileend output_text output_file
			endif
		endif
	endif
	if (<mode> = 2)
		if gotparam got_left
			moveprofilecursor cpu = ($current_cpu) left
		endif
		if gotparam got_right
			moveprofilecursor cpu = ($current_cpu) right
		endif
		if gotparam got_up
			moveprofilecursor cpu = ($current_cpu) up
		endif
		if gotparam got_down
			moveprofilecursor cpu = ($current_cpu) down
		endif
	endif
endscript
