new_profile_name = [
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
	''
]
new_profile_flashing_char = 'A'
new_profile_flashing_index = 0
new_profile_flashing_index_prev = 0
new_profile_index = 0
min_profile_characters = 3
max_profile_characters = 15
default_profile_characters = [
	'A'
	'B'
	'C'
	'D'
	'E'
	'F'
	'G'
	'H'
	'I'
	'J'
	'K'
	'L'
	'M'
	'N'
	'O'
	'P'
	'Q'
	'R'
	'S'
	'T'
	'U'
	'V'
	'W'
	'X'
	'Y'
	'Z'
	'1'
	'2'
	'3'
	'4'
	'5'
	'6'
	'7'
	'8'
	'9'
	'0'
	' '
]
profile_name_position = (725.0, 345.0)
default_profile_indexes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
profile_allow_whitespace = 0
profile_track_stats = 1
in_enter_profile_menu = 0

script is_in_enter_profile_menu 
	return \{open = $in_enter_profile_menu}
endscript
enter_profile_name_big_vals = {
	top_title_scale = 1.2
	top_title_pos = (720.0, 105.0)
	text_scale = 2.0
	text_pos = (685.0, 270.0)
	background_pos = (640.0, 360.0)
	background_scale = (1.0, 1.0)
	header_pos = (730.0, 164.0)
	header_scale = 1.0
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (745.0, 550.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1150.0, 345.0)
	right_side_img_scale = (2.05, 2.05)
}
enter_profile_name_small_vals = {
	top_title_scale = 1.5
	top_title_pos = (645.0, 27.0)
	text_scale = 1.1
	text_diff = 0.071
	text_pos = (650.0, 245.0)
	background_pos = (540.0, 360.0)
	background_scale = (1.25, 1.3199999)
	header_pos = (652.0, 105.0)
	header_scale = 1.3
	tour_pos = (500.0, 425.0)
	tour_scale = 1.375
	address_pos = (500.0, 480.0)
	address_scale = 1.375
	date_pos = (700.0, 575.0)
	date_scale = 1.222
	sponsor_pos = (900.0, 410.0)
	sponsor_scale = 1.0
	sponsor_dims = (164.0, 164.0)
	sponsor_offset = (0.0, 26.0)
	right_side_img_pos = (1182.0, 340.0)
	right_side_img_scale = (2.7, 2.7)
}

script create_enter_profile_name_menu 

	Change \{in_enter_profile_menu = 1}
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	enter_profile_name_reset_variables
	rotation_angle = -2
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ebn_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = ebn_container
		id = menu_backdrop
		texture = Venue_BG
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		blend = diffuse
		just = [
			center
			center
		]
		z_priority = 0}
	CreateScreenElement \{Type = SpriteElement
		parent = ebn_container
		id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = ebn_container
		id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 200]
		Pos = (($enter_profile_name_big_vals).right_side_img_pos)
		Scale = (($enter_profile_name_big_vals).right_side_img_scale)
		relative_scale
		z_priority = 2
	}
	rand = 0
	GetRandomValue \{Name = rand
		integer
		a = 0
		b = 2}
	if (<rand> = 0)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic03}
	endif
	black = [70 10 10 255]
	blue = [30 110 150 255]
	nameColor = [95 112 147 255]
	activeColor = (($g_menu_colors).pink)
	CreateScreenElement {
		Type = TextElement
		parent = ebn_container
		font = text_a3
		text = $wii_enter_profile_name
		id = ebn_header_text
		Pos = (($enter_profile_name_big_vals).header_pos)
		rot_angle = <rotation_angle>
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [center top]
		Scale = (($enter_profile_name_big_vals).tour_scale)
	}
	CreateScreenElement {
		Type = TextElement
		parent = ebn_container
		font = text_a3
		text = 'AEROSMITH LEGENDS TOUR'
		id = top_title_text
		Pos = (($enter_profile_name_big_vals).top_title_pos)
		rot_angle = <rotation_angle>
		rgba = [212 228 236 255]
		just = [center top]
		Scale = (($enter_profile_name_big_vals).top_title_scale)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [142 134 160 255]
	}
	GetLocalSystemTime
	if English
		GetUpperCaseString (($us_month_names) [(<localsystemtime>.month)])
		formatText TextName = date_text '%m %d, %y' m = (<UppercaseString>) d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	else
		GetUpperCaseString (($us_month_names) [(<localsystemtime>.month)])
		formatText TextName = date_text '%d %m %y' d = (<localsystemtime>.dayofmonth) m = (<UppercaseString>) y = (<localsystemtime>.year)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = ebn_container
		font = text_a3
		text = <date_text>
		id = ebn_date_text
		Pos = (($enter_profile_name_big_vals).date_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		Scale = (($enter_profile_name_big_vals).date_scale)
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = ebn_container
		id = profile_name_text_container
		rot_angle = <rotation_angle>
	}
	CreateScreenElement {
		Type = TextElement
		parent = profile_name_text_container
		font = text_a3
		Scale = (($enter_profile_name_big_vals).text_scale)
		rgba = <nameColor>
		id = profile_name_text
		Pos = (($enter_profile_name_big_vals).text_pos)
		just = [center center]
	}
	CreateScreenElement {
		Type = TextElement
		parent = profile_name_text_container
		font = text_a3
		Scale = (($enter_profile_name_big_vals).text_scale)
		rgba = <activeColor>
		text = 'A'
		id = profile_name_entry_char
		just = [center center]
		alpha = 0.25
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = profile_name_text_container
		id = ebn_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up enter_profile_name_change_character params = {up}}
			{pad_down enter_profile_name_change_character params = {down}}
			{pad_choose profile_advance_pointer}
			{pad_back profile_retreat_pointer}
			{pad_start confirm_profile_track_stats}
		]
		rgba = <activeColor>
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = ebn_marker
		blinker
		params = {
			id = ebn_marker
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = ebn_marker}
	Change \{ebn_transitioning_back = 0}
	menu_ebn_update_profile_marker
	enter_profile_name_reset_user_control_helpers
endscript

script enter_profile_name_reset_user_control_helpers 
	add_user_control_helper \{button = green
		text = $wii_next}
	add_user_control_helper \{button = red
		text = $wii_back}
	add_user_control_helper \{button = strumbar
		text = $wii_updown}
	add_user_control_helper \{button = start
		text = $wii_accept}
endscript

script enter_profile_name_reset_variables 
	Change \{new_profile_name = [
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
			''
		]}
	Change \{new_profile_index = 0}
	Change \{default_profile_indexes = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{new_profile_flashing_char = 'A'}
	Change \{new_profile_flashing_index = 0}
	Change \{profile_allow_whitespace = 0}
endscript

script reset_enter_profile_name_menu_from_dialog 
	destroy_generic_popup
	enter_profile_name_reset_variables
	menu_ebn_refresh_profile_name
	menu_ebn_update_profile_marker
endscript

script destroy_enter_profile_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	clean_up_user_control_helpers
	Change \{in_enter_profile_menu = 0}
endscript

script confirm_profile_name 

	if ($new_profile_index < $min_profile_characters)
		open_not_enough_characters_dialog
		return
	endif
	menu_ebn_get_profile_name_text
	StringRemoveTrailingWhitespace string = <profile_name_text_string>
	StringLength string = <new_string>
	if (<str_len> < $min_profile_characters)
		open_not_enough_characters_dialog
		return
	endif
	stringchecknumberofdigits profile_name_string = <profile_name_text_string>
	if (<num_digits> > 6)
		open_bad_name_menu
		return
	endif
	createprofile {
		profile_name_string = <profile_name_text_string>
		track_stats = ($profile_track_stats)
	}
endscript

script confirm_profile_track_stats 
	Change \{profile_track_stats = 1}
	create_generic_popup \{yes_no_menu
		title = $wii_online_stats_text
		message = $wii_ask_track_stats_text
		default_blackout
		yes_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				track_stats_yes
			}
		]
		no_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				track_stats_no
			}
		]}
endscript

script enter_profile_name_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				change_profile_character_down
			else
				change_profile_character_up
			endif
		else
			if GotParam \{up}
				change_profile_character_up
			else
				change_profile_character_down
			endif
		endif
	endif
endscript

script enter_profile_name_remove_focus 
	LaunchEvent \{Type = unfocus
		target = scrolling_enter_profile_name}
endscript

script enter_profile_name_refocus 
	LaunchEvent \{Type = focus
		target = scrolling_enter_profile_name}
endscript

script change_profile_character_up 

	generic_menu_up_or_down_sound \{up}
	Change new_profile_flashing_index = ($new_profile_flashing_index + 1)

	GetArraySize \{$default_profile_characters}
	if ($new_profile_flashing_index = (<array_Size> -1))
		if ($profile_allow_whitespace = 0)
			Change new_profile_flashing_index = ($new_profile_flashing_index + 1)
		endif
	endif
	if ($new_profile_flashing_index > (<array_Size> -1))
		Change \{new_profile_flashing_index = 0}
	endif
	Change new_profile_flashing_char = ($default_profile_characters [$new_profile_flashing_index])
	menu_ebn_update_profile_marker
endscript

script change_profile_character_down 
	generic_menu_up_or_down_sound \{down}
	Change new_profile_flashing_index = ($new_profile_flashing_index -1)
	if ($new_profile_flashing_index < 0)
		GetArraySize \{$default_profile_characters}
		Change new_profile_flashing_index = (<array_Size> -1)
		if ($profile_allow_whitespace = 0)
			Change new_profile_flashing_index = ($new_profile_flashing_index -1)
		endif
	endif
	Change new_profile_flashing_char = ($default_profile_characters [$new_profile_flashing_index])
	menu_ebn_update_profile_marker
endscript

script profile_advance_pointer 
	if (($new_profile_index + 1) < $max_profile_characters)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_profile_name
			globalarray
			index = $new_profile_index
			NewValue = $new_profile_flashing_char}
		Change \{new_profile_flashing_index_prev = $new_profile_flashing_index}
		Change new_profile_index = ($new_profile_index + 1)
		Change \{profile_allow_whitespace = 1}
		if ($new_profile_index > 8)
			Change structurename = enter_profile_name_small_vals text_scale = ($enter_profile_name_small_vals.text_scale - $enter_profile_name_small_vals.text_diff)
			if ($enter_profile_name_small_vals.text_scale < 1.2)
				Change \{structurename = enter_profile_name_small_vals
					text_scale = 1.2}
			endif
		endif
		menu_ebn_refresh_profile_name
		if (($new_profile_index + 1) = $max_profile_characters)
			0xfc0bdff4
			GetScreenElementDims \{id = profile_name_entry_char}
			<char_width> = (<width> / 2)
			SetScreenElementProps id = profile_name_text Pos = (($enter_profile_name_small_vals.text_pos) + (<char_width> * (1.0, 0.0)))
		endif
	endif
endscript

script 0xfc0bdff4 
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = 'BACK'}
	add_user_control_helper \{button = start
		text = 'ACCEPT'}
	SetScreenElementProps \{id = profile_name_entry_char
		Hide}
	SetScreenElementProps \{id = ebn_marker
		Hide}
endscript

script profile_retreat_pointer 
	if ($new_profile_index = 0)
		Change \{ebn_transitioning_back = 1}
		cancelenterwifimenu
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	if (($new_profile_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_profile_index = ($new_profile_index -1)
		if ($new_profile_index > 8)
			Change structurename = enter_profile_name_small_vals text_scale = ($enter_profile_name_small_vals.text_scale + $enter_profile_name_small_vals.text_diff)
		endif
		Change new_profile_flashing_char = ($new_profile_name [$new_profile_index])
		SetArrayElement \{ArrayName = new_profile_name
			globalarray
			index = $new_profile_index
			NewValue = ''}
		Change \{new_profile_flashing_index = $new_profile_flashing_index_prev}
		if (($new_profile_index + 2) = $max_profile_characters)
			0x649100c9
			Change \{structurename = enter_profile_name_small_vals
				text_scale = 1.2}
		endif
		menu_ebn_refresh_profile_name
	endif
	if ($new_profile_index = 0)
		Change \{profile_allow_whitespace = 0}
	endif
endscript

script 0x649100c9 
	clean_up_user_control_helpers
	enter_profile_name_reset_user_control_helpers
	SetScreenElementProps \{id = profile_name_entry_char
		unhide}
	SetScreenElementProps \{id = ebn_marker
		unhide}
endscript

script menu_ebn_get_profile_name_text 
	formatText TextName = profile_name_text_string '%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p' a = ($new_profile_name [0]) b = ($new_profile_name [1]) c = ($new_profile_name [2]) d = ($new_profile_name [3]) e = ($new_profile_name [4]) f = ($new_profile_name [5]) g = ($new_profile_name [6]) h = ($new_profile_name [7]) i = ($new_profile_name [8]) j = ($new_profile_name [9]) k = ($new_profile_name [10]) l = ($new_profile_name [11]) m = ($new_profile_name [12]) n = ($new_profile_name [13]) o = ($new_profile_name [14]) p = ($new_profile_name [15])
	return profile_name_text_string = <profile_name_text_string>
endscript

script menu_ebn_refresh_profile_name 
	menu_ebn_get_profile_name_text
	<do_scaling> = 0
	if (($new_profile_index = 9) && ($ebn_using_big_vals = 1))
		Change \{ebn_using_big_vals = 0}
		Change \{structurename = enter_profile_name_small_vals
			text_scale = 1.8}
		<vals_struct> = ($enter_profile_name_small_vals)
		<do_scaling> = 1
	elseif (($new_profile_index = 8) && ($ebn_using_big_vals = 0))
		Change \{ebn_using_big_vals = 1}
		<vals_struct> = ($enter_profile_name_big_vals)
		<do_scaling> = 1
	else
		<do_scaling> = 0
	endif
	if (($new_profile_index > 9) && (<do_scaling> = 0))
		<vals_struct> = ($enter_profile_name_small_vals)
		DoScreenElementMorph id = profile_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) time = <time> motion = ease_out
		DoScreenElementMorph id = profile_name_entry_char Scale = (<vals_struct>.text_scale) time = <time> motion = ease_out
	endif
	SetScreenElementProps id = profile_name_text text = (<profile_name_text_string>)
	if (<do_scaling>)
		<time> = 0.5
		LaunchEvent \{Type = unfocus
			target = ebn_marker}
		DoScreenElementMorph id = profile_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) time = <time> motion = ease_out
		DoScreenElementMorph id = profile_name_entry_char Scale = (<vals_struct>.text_scale) time = <time> motion = ease_out
		SetScreenElementProps \{id = profile_name_entry_char
			Hide}
		SetScreenElementProps \{id = ebn_marker
			Hide}
		DoScreenElementMorph id = menu_backdrop Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale time = <time> motion = ease_out
		DoScreenElementMorph id = ticket_image Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale time = <time> motion = ease_out
		DoScreenElementMorph id = ebn_header_text Pos = (<vals_struct>.header_pos) Scale = (<vals_struct>.header_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = top_title_text Pos = (<vals_struct>.top_title_pos) Scale = (<vals_struct>.top_title_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = ebn_date_text Pos = (<vals_struct>.date_pos) Scale = (<vals_struct>.date_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = random_image Pos = ((<vals_struct>.right_side_img_pos)) Scale = (<vals_struct>.right_side_img_scale) relative_scale time = <time> motion = ease_out
		Wait (<time> * 1.5) Seconds
		menu_ebn_update_profile_marker
		LaunchEvent \{Type = focus
			target = ebn_marker}
	else
		menu_ebn_update_profile_marker
	endif
endscript

script menu_ebn_update_profile_marker 
	vals_struct = ($enter_profile_name_big_vals)
	if ($new_profile_index > 9)
		<vals_struct> = ($enter_profile_name_small_vals)
	endif
	SetScreenElementProps \{id = profile_name_entry_char
		text = $new_profile_flashing_char}
	GetScreenElementDims \{id = profile_name_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = profile_name_text}
	GetScreenElementDims \{id = profile_name_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps id = profile_name_entry_char text = $new_profile_flashing_char Pos = <new_pos> unhide
	GetScreenElementDims \{id = ebn_marker}
	SetScreenElementProps id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.6 * (0.0, 1.0))) unhide
endscript

script open_bad_name_menu 
	destroy_name_dialog_early
	create_generic_popup \{ok_menu
		previous_menu = ebn_marker
		message = $wii_diff_name
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				reset_enter_profile_name_menu_from_dialog
			}
		]}
endscript

script open_not_enough_characters_dialog 
	create_generic_popup \{ok_menu
		message = $wii_profile_name_not_enought_characters_text
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]}
endscript

script close_enter_profile_name_menu_goto_main_menu 
	ui_flow_manager_respond_to_action \{action = profile_name_confirmed}
endscript

script track_stats_yes 
	Change \{profile_track_stats = 1}
	destroy_generic_popup
	confirm_profile_name
endscript

script track_stats_no 
	Change \{profile_track_stats = 0}
	destroy_generic_popup
	confirm_profile_name
endscript
