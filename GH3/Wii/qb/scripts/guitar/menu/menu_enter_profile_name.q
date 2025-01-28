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
	text_scale = 2.0
	text_pos = (685.0, 340.0)
	background_pos = (640.0, 360.0)
	background_dims = (1280.0, 720.0)
	header_pos = (730.0, 134.0)
	header_scale = 1.0
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (625.0, 500.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1160.0, 330.0)
	right_side_img_dims = (196.0, 408.0)
}
enter_profile_name_small_vals = {
	text_scale = 1.1
	text_pos = (650.0, 345.0)
	background_pos = (540.0, 360.0)
	background_dims = (1600.0, 900.0)
	header_pos = (652.0, 85.0)
	header_scale = 1.3
	tour_pos = (500.0, 425.0)
	tour_scale = 1.375
	address_pos = (500.0, 480.0)
	address_scale = 1.375
	date_pos = (500.0, 555.0)
	date_scale = 1.222
	sponsor_pos = (900.0, 410.0)
	sponsor_scale = 1.0
	sponsor_dims = (164.0, 164.0)
	sponsor_offset = (0.0, 26.0)
	right_side_img_pos = (1190.0, 330.0)
	right_side_img_dims = (245.0, 510.0)
}

script create_enter_profile_name_menu 
	printf ('------- create_enter_profile_name_menu\\n')
	change \{in_enter_profile_menu = 1}
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	enter_profile_name_reset_variables
	rotation_angle = -2
	createscreenelement \{type = containerelement
		parent = root_window
		id = ebn_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		parent = ebn_container
		id = menu_backdrop
		texture = venue_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		blend = diffuse
		just = [
			center
			center
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		parent = ebn_container
		id = ticket_image
		texture = band_name_ticket
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1}
	createscreenelement {
		type = spriteelement
		parent = ebn_container
		id = random_image
		texture = band_name_graphic03
		rgba = [255 255 255 255]
		pos = (($enter_profile_name_big_vals).right_side_img_pos)
		dims = (($enter_profile_name_big_vals).right_side_img_dims)
		z_priority = 2
	}
	rand = 0
	getrandomvalue \{name = rand
		integer
		a = 0
		b = 2}
	if (<rand> = 0)
		setscreenelementprops \{id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		setscreenelementprops \{id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		setscreenelementprops \{id = random_image
			texture = band_name_graphic03}
	endif
	black = [70 10 10 255]
	blue = [30 110 150 255]
	namecolor = [180 70 35 255]
	activecolor = [230 130 65 255]
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = $wii_enter_profile_name
		id = ebn_header_text
		pos = (($enter_profile_name_big_vals).header_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_profile_name_big_vals).header_scale)
	}
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = $wii_legends
		id = ebn_tour_text
		pos = (($enter_band_name_big_vals).tour_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_band_name_big_vals).tour_scale)
	}
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = $wii_tour
		id = ebn_address_text
		pos = (($enter_band_name_big_vals).address_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_band_name_big_vals).address_scale)
	}
	getlocalsystemtime
	if english
		getuppercasestring (($us_month_names) [(<localsystemtime>.month)])
		formattext textname = date_text '%m %d, %y' m = (<uppercasestring>) d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	else
		getuppercasestring (($us_month_names) [(<localsystemtime>.month)])
		formattext textname = date_text '%d %m %y' d = (<localsystemtime>.dayofmonth) m = (<uppercasestring>) y = (<localsystemtime>.year)
	endif
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = <date_text>
		id = ebn_date_text
		pos = (($enter_band_name_big_vals).date_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_band_name_big_vals).date_scale)
	}
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = $wii_sponsored_by
		id = ebn_sponsor_text
		pos = (($enter_band_name_big_vals).sponsor_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_band_name_big_vals).sponsor_scale)
	}
	createscreenelement {
		type = spriteelement
		parent = ebn_container
		id = logo_vault_image
		texture = setlist_icon_generic
		pos = (($enter_profile_name_big_vals).sponsor_pos + ($enter_profile_name_big_vals).sponsor_offset)
		dims = (($enter_profile_name_big_vals).sponsor_dims)
		rot_angle = <rotation_angle>
		just = [center top]
		blend = subtract
	}
	createscreenelement {
		type = containerelement
		parent = ebn_container
		id = profile_name_text_container
		rot_angle = <rotation_angle>
	}
	createscreenelement {
		type = textelement
		parent = profile_name_text_container
		font = text_a3
		scale = (($enter_profile_name_big_vals).text_scale)
		rgba = <namecolor>
		id = profile_name_text
		pos = (($enter_profile_name_big_vals).text_pos)
		just = [center center]
	}
	createscreenelement {
		type = textelement
		parent = profile_name_text_container
		font = text_a3
		scale = (($enter_profile_name_big_vals).text_scale)
		rgba = <activecolor>
		text = 'A'
		id = profile_name_entry_char
		just = [center center]
	}
	createscreenelement {
		type = spriteelement
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
		rgba = <activecolor>
		exclusive_device = ($primary_controller)
	}
	runscriptonscreenelement \{id = ebn_marker
		blinker
		params = {
			id = ebn_marker
			time = 0.5
		}}
	runscriptonscreenelement \{id = profile_name_entry_char
		blinker
		params = {
			id = profile_name_entry_char
			time = 0.5
		}}
	launchevent \{type = focus
		target = ebn_marker}
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
	change \{new_profile_name = [
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
	change \{new_profile_index = 0}
	change \{default_profile_indexes = [
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
	change \{new_profile_flashing_char = 'A'}
	change \{new_profile_flashing_index = 0}
	change \{profile_allow_whitespace = 0}
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
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	clean_up_user_control_helpers
	change \{in_enter_profile_menu = 0}
endscript

script confirm_profile_name 
	printf 'new_profile_index = %d' d = ($new_profile_index)
	if ($new_profile_index < $min_profile_characters)
		open_not_enough_characters_dialog
		return
	endif
	menu_ebn_get_profile_name_text
	stringremovetrailingwhitespace string = <profile_name_text_string>
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
	change \{profile_track_stats = 1}
	create_generic_popup \{yes_no_menu
		title = $wii_online_stats_text
		message = $wii_ask_track_stats_text
		yes_no_menu
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
	if gotparam \{device_num}
		if isguitarcontroller controller = <device_num>
			if gotparam \{up}
				change_profile_character_down
			else
				change_profile_character_up
			endif
		else
			if gotparam \{up}
				change_profile_character_up
			else
				change_profile_character_down
			endif
		endif
	endif
endscript

script enter_profile_name_remove_focus 
	launchevent \{type = unfocus
		target = scrolling_enter_profile_name}
endscript

script enter_profile_name_refocus 
	launchevent \{type = focus
		target = scrolling_enter_profile_name}
endscript

script change_profile_character_up 
	printf \{'------- change_character_up\\n'}
	generic_menu_up_or_down_sound \{up}
	change new_profile_flashing_index = ($new_profile_flashing_index + 1)
	printf 'new_profile_flashing_index = %d\\n' d = ($new_profile_flashing_index)
	getarraysize \{$default_profile_characters}
	if ($new_profile_flashing_index = (<array_size> -1))
		if ($profile_allow_whitespace = 0)
			change new_profile_flashing_index = ($new_profile_flashing_index + 1)
		endif
	endif
	if ($new_profile_flashing_index > (<array_size> -1))
		change \{new_profile_flashing_index = 0}
	endif
	change new_profile_flashing_char = ($default_profile_characters [$new_profile_flashing_index])
	menu_ebn_update_profile_marker
endscript

script change_profile_character_down 
	generic_menu_up_or_down_sound \{down}
	change new_profile_flashing_index = ($new_profile_flashing_index -1)
	if ($new_profile_flashing_index < 0)
		getarraysize \{$default_profile_characters}
		change new_profile_flashing_index = (<array_size> -1)
		if ($profile_allow_whitespace = 0)
			change new_profile_flashing_index = ($new_profile_flashing_index -1)
		endif
	endif
	change new_profile_flashing_char = ($default_profile_characters [$new_profile_flashing_index])
	menu_ebn_update_profile_marker
endscript

script profile_advance_pointer 
	if (($new_profile_index + 1) < $max_profile_characters)
		soundevent \{event = ui_sfx_select}
		setarrayelement \{arrayname = new_profile_name
			globalarray
			index = $new_profile_index
			newvalue = $new_profile_flashing_char}
		change \{new_profile_flashing_index_prev = $new_profile_flashing_index}
		change \{new_profile_flashing_index = 0}
		change \{new_profile_flashing_char = 'A'}
		change new_profile_index = ($new_profile_index + 1)
		change \{profile_allow_whitespace = 1}
		menu_ebn_refresh_profile_name
	endif
endscript

script profile_retreat_pointer 
	if ($new_profile_index = 0)
		cancelenterwifimenu
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
	if (($new_profile_index -1) > -1)
		generic_menu_pad_back_sound
		change new_profile_index = ($new_profile_index -1)
		change new_profile_flashing_char = ($new_profile_name [$new_profile_index])
		setarrayelement \{arrayname = new_profile_name
			globalarray
			index = $new_profile_index
			newvalue = ''}
		change \{new_profile_flashing_index = $new_profile_flashing_index_prev}
		menu_ebn_refresh_profile_name
	endif
	if ($new_profile_index = 0)
		change \{profile_allow_whitespace = 0}
	endif
endscript

script menu_ebn_get_profile_name_text 
	formattext textname = profile_name_text_string '%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p' a = ($new_profile_name [0]) b = ($new_profile_name [1]) c = ($new_profile_name [2]) d = ($new_profile_name [3]) e = ($new_profile_name [4]) f = ($new_profile_name [5]) g = ($new_profile_name [6]) h = ($new_profile_name [7]) i = ($new_profile_name [8]) j = ($new_profile_name [9]) k = ($new_profile_name [10]) l = ($new_profile_name [11]) m = ($new_profile_name [12]) n = ($new_profile_name [13]) o = ($new_profile_name [14]) p = ($new_profile_name [15])
	return profile_name_text_string = <profile_name_text_string>
endscript

script menu_ebn_refresh_profile_name 
	menu_ebn_get_profile_name_text
	vals_struct = ($enter_profile_name_big_vals)
	if ($new_profile_index > 9)
		<vals_struct> = ($enter_profile_name_small_vals)
	endif
	setscreenelementprops id = profile_name_text text = (<profile_name_text_string>) scale = (<vals_struct>.text_scale) pos = (<vals_struct>.text_pos)
	setscreenelementprops id = profile_name_entry_char scale = (<vals_struct>.text_scale)
	getscreenelementdims \{id = profile_name_text}
	setscreenelementprops id = menu_backdrop pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	setscreenelementprops id = ticket_image pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	setscreenelementprops id = ebn_header_text pos = (<vals_struct>.header_pos) scale = (<vals_struct>.header_scale)
	setscreenelementprops id = ebn_tour_text pos = (<vals_struct>.tour_pos) scale = (<vals_struct>.tour_scale)
	setscreenelementprops id = ebn_address_text pos = (<vals_struct>.address_pos) scale = (<vals_struct>.address_scale)
	setscreenelementprops id = ebn_date_text pos = (<vals_struct>.date_pos) scale = (<vals_struct>.date_scale)
	setscreenelementprops id = ebn_sponsor_text pos = (<vals_struct>.sponsor_pos) scale = (<vals_struct>.sponsor_scale)
	setscreenelementprops id = logo_vault_image pos = ((<vals_struct>.sponsor_pos) + (<vals_struct>.sponsor_offset)) dims = (<vals_struct>.sponsor_dims)
	setscreenelementprops id = random_image pos = ((<vals_struct>.right_side_img_pos)) dims = (<vals_struct>.right_side_img_dims)
	menu_ebn_update_profile_marker
endscript

script menu_ebn_update_profile_marker 
	vals_struct = ($enter_profile_name_big_vals)
	if ($new_profile_index > 9)
		<vals_struct> = ($enter_profile_name_small_vals)
	endif
	setscreenelementprops \{id = profile_name_entry_char
		text = $new_profile_flashing_char}
	getscreenelementdims \{id = profile_name_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = profile_name_text}
	getscreenelementdims \{id = profile_name_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	setscreenelementprops id = profile_name_entry_char text = $new_profile_flashing_char pos = <new_pos>
	getscreenelementdims \{id = ebn_marker}
	setscreenelementprops id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) pos = (<new_pos> + (<new_height> * 0.6 * (0.0, 1.0)))
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
				retail_menu_focus
			}
			{
				unfocus
				retail_menu_unfocus
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
	change \{profile_track_stats = 1}
	destroy_generic_popup
	confirm_profile_name
endscript

script track_stats_no 
	change \{profile_track_stats = 0}
	destroy_generic_popup
	confirm_profile_name
endscript
