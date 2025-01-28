new_band_name = [
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
]
new_band_flashing_char = "A"
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_transitioning_back = 0
default_band_characters = [
	"A"
	"B"
	"C"
	"D"
	"E"
	"F"
	"G"
	"H"
	"I"
	"J"
	"K"
	"L"
	"M"
	"N"
	"O"
	"P"
	"Q"
	"R"
	"S"
	"T"
	"U"
	"V"
	"W"
	"X"
	"Y"
	"Z"
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
	"!"
	"@"
	"#"
	"$"
	"^"
	"&"
	"*"
	"("
	")"
	"_"
	"+"
	"-"
	"="
	"/"
	" "
]
band_name_position = (725.0, 345.0)
default_band_indexes = [
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
	0
	0
	0
	0
]
enter_band_name_big_vals = {
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
enter_band_name_small_vals = {
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
us_month_names = [
	"January"
	"February"
	"March"
	"April"
	"May"
	"June"
	"July"
	"August"
	"September"
	"October"
	"November"
	"December"
]

script create_enter_band_name_menu 
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	netsessionfunc \{func = stats_init}
	enter_band_name_reset_variables
	rotation_angle = -2
	createscreenelement \{type = containerelement
		parent = root_window
		id = ebn_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		parent = ebn_container
		id = menu_backdrop
		texture = toprockers_bg
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
		z_priority = 0}
	createscreenelement \{type = spriteelement
		parent = ebn_container
		id = light_overlay
		texture = venue_overlay
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
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
		pos = (($enter_band_name_big_vals).right_side_img_pos)
		dims = (($enter_band_name_big_vals).right_side_img_dims)
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
		font = text_a10_large
		text = "ENTER BAND NAME"
		id = ebn_header_text
		pos = (($enter_band_name_big_vals).header_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		scale = (($enter_band_name_big_vals).header_scale)
	}
	createscreenelement {
		type = textelement
		parent = ebn_container
		font = text_a3
		text = "THE LEGENDS"
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
		text = "OF ROCK TOUR"
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
		formattext textname = date_text "%m %d, %y" m = (<uppercasestring>) d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	else
		getuppercasestring (($us_month_names) [(<localsystemtime>.month)])
		formattext textname = date_text "%d %m %y" d = (<localsystemtime>.dayofmonth) m = (<uppercasestring>) y = (<localsystemtime>.year)
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
		text = "SPONSORED BY:"
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
		pos = (($enter_band_name_big_vals).sponsor_pos + ($enter_band_name_big_vals).sponsor_offset)
		dims = (($enter_band_name_big_vals).sponsor_dims)
		rot_angle = <rotation_angle>
		just = [center top]
		blend = subtract
	}
	createscreenelement {
		type = containerelement
		parent = ebn_container
		id = band_name_text_container
		rot_angle = <rotation_angle>
	}
	createscreenelement {
		type = textelement
		parent = band_name_text_container
		font = text_a3
		scale = (($enter_band_name_big_vals).text_scale)
		rgba = <namecolor>
		id = band_name_text
		pos = (($enter_band_name_big_vals).text_pos)
		just = [center center]
	}
	createscreenelement {
		type = textelement
		parent = band_name_text_container
		font = text_a3
		scale = (($enter_band_name_big_vals).text_scale)
		rgba = <activecolor>
		text = "A"
		id = band_name_entry_char
		just = [center center]
	}
	createscreenelement {
		type = spriteelement
		parent = band_name_text_container
		id = ebn_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up enter_band_name_change_character params = {up}}
			{pad_down enter_band_name_change_character params = {down}}
			{pad_choose band_advance_pointer}
			{pad_back band_retreat_pointer}
			{pad_start confirm_band_name}
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
	runscriptonscreenelement \{id = band_name_entry_char
		blinker
		params = {
			id = band_name_entry_char
			time = 0.5
		}}
	launchevent \{type = focus
		target = ebn_marker}
	change \{ebn_transitioning_back = 0}
	menu_ebn_update_marker
	enter_band_name_reset_user_control_helpers
endscript

script enter_band_name_reset_user_control_helpers 
	add_user_control_helper \{button = green
		text = "NEXT"}
	add_user_control_helper \{button = red
		text = "BACK"}
	add_user_control_helper \{button = strumbar
		text = "UP/DOWN"}
	add_user_control_helper \{button = start
		text = "ACCEPT"}
endscript

script enter_band_name_reset_variables 
	change \{new_band_name = [
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
		]}
	change \{new_band_index = 0}
	change \{default_band_indexes = [
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
			0
			0
			0
			0
		]}
	change \{new_band_flashing_char = "A"}
	change \{new_band_flashing_index = 0}
endscript

script destroy_enter_band_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script blinker 
	if NOT screenelementexists id = <id>
		return
	endif
	begin
	doscreenelementmorph id = <id> alpha = 0 time = <time>
	wait <time> seconds
	doscreenelementmorph id = <id> alpha = 1.0
	wait <time> seconds
	repeat
endscript

script confirm_band_name 
	if ($ebn_transitioning_back)
		return
	endif
	num_spaces = 0
	array_entry = 0
	<valid> = 0
	<need_unique> = 0
	begin
	if NOT ($new_band_name [<array_entry>] = "")
		if NOT ($new_band_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_band_characters)
	if (<valid> = 1)
		<prev_band_index> = ($current_band - 1)
		if (<prev_band_index> > 0)
			begin
			menu_ebn_get_band_name_text
			stringremovetrailingwhitespace string = <band_name_text_string>
			get_band_game_mode_name
			formattext checksumname = bandname_id 'band%i_info_%g' i = <prev_band_index> g = <game_mode_name>
			getglobaltags <bandname_id> param = name
			if (<name> = <new_string>)
				<valid> = 0
				<need_unique> = 1
			endif
			<prev_band_index> = (<prev_band_index> - 1)
			repeat ($current_band - 1)
		endif
		<next_band_index> = ($current_band + 1)
		if (<next_band_index> < 6)
			begin
			menu_ebn_get_band_name_text
			stringremovetrailingwhitespace string = <band_name_text_string>
			get_band_game_mode_name
			formattext checksumname = bandname_id 'band%i_info_%g' i = <next_band_index> g = <game_mode_name>
			getglobaltags <bandname_id> param = name
			if (<name> = <new_string>)
				<valid> = 0
				<need_unique> = 1
			endif
			<next_band_index> = (<next_band_index> + 1)
			repeat (5 - $current_band)
		endif
	endif
	if (<valid> = 0)
		soundevent \{event = menu_warning_sfx}
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if screenelementexists \{id = ebn_marker}
			if (<need_unique> = 1)
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = "The Band Name you entered already exists.  Please enter a different Band Name."}
			else
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = "You must enter a Band Name to proceed!"}
			endif
		endif
	else
		menu_ebn_get_band_name_text
		stringremovetrailingwhitespace string = <band_name_text_string>
		get_band_game_mode_name
		formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
		gettruestarttime
		formattext checksumname = band_unique_id 'band%i_info_%g_%d' i = ($current_band) g = <game_mode_name> d = <starttime>
		setglobaltags <bandname_id> params = {name = <new_string> band_unique_id = <band_unique_id>}
		agora_update band_id = <band_unique_id> name = <new_string> new_band
		if ($options_for_manage_band = 1)
			ui_flow_manager_respond_to_action \{action = enter_band_name_for_manage_band}
		else
			ui_flow_manager_respond_to_action \{action = enter_band_name}
		endif
	endif
endscript

script enter_band_name_change_character 
	if gotparam \{device_num}
		if isguitarcontroller controller = <device_num>
			if gotparam \{up}
				change_character_down
			else
				change_character_up
			endif
		else
			if gotparam \{up}
				change_character_up
			else
				change_character_down
			endif
		endif
	endif
endscript

script enter_band_name_remove_focus 
	launchevent \{type = unfocus
		target = scrolling_enter_band_name}
endscript

script enter_band_name_refocus 
	launchevent \{type = focus
		target = scrolling_enter_band_name}
endscript

script change_character_up 
	generic_menu_up_or_down_sound \{up}
	change new_band_flashing_index = ($new_band_flashing_index + 1)
	getarraysize \{$default_band_characters}
	if ($new_band_flashing_index > (<array_size> -1))
		change \{new_band_flashing_index = 0}
	endif
	change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script change_character_down 
	generic_menu_up_or_down_sound \{down}
	change new_band_flashing_index = ($new_band_flashing_index -1)
	if ($new_band_flashing_index < 0)
		getarraysize \{$default_band_characters}
		change new_band_flashing_index = (<array_size> -1)
	endif
	change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script band_advance_pointer 
	if (($new_band_index + 1) < $max_band_characters)
		soundevent \{event = ui_sfx_select}
		setarrayelement \{arrayname = new_band_name
			globalarray
			index = $new_band_index
			newvalue = $new_band_flashing_char}
		change \{new_band_flashing_index_prev = $new_band_flashing_index}
		change \{new_band_flashing_index = 0}
		change \{new_band_flashing_char = "A"}
		change new_band_index = ($new_band_index + 1)
		menu_ebn_refresh_band_name
		if (($new_band_index + 1) = $max_band_characters)
			ebn_take_away_blinker
		endif
	endif
endscript

script ebn_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = "BACK"}
	add_user_control_helper \{button = start
		text = "ACCEPT"}
	setscreenelementprops \{id = band_name_entry_char
		hide}
	setscreenelementprops \{id = ebn_marker
		hide}
endscript

script band_retreat_pointer 
	if ($new_band_index = 0)
		change \{ebn_transitioning_back = 1}
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	if (($new_band_index -1) > -1)
		generic_menu_pad_back_sound
		change new_band_index = ($new_band_index -1)
		change new_band_flashing_char = ($new_band_name [$new_band_index])
		setarrayelement \{arrayname = new_band_name
			globalarray
			index = $new_band_index
			newvalue = ""}
		change \{new_band_flashing_index = $new_band_flashing_index_prev}
		menu_ebn_refresh_band_name
		if (($new_band_index + 2) = $max_band_characters)
			ebn_put_back_blinker
		endif
	endif
endscript

script ebn_put_back_blinker 
	clean_up_user_control_helpers
	enter_band_name_reset_user_control_helpers
	setscreenelementprops \{id = band_name_entry_char
		unhide}
	setscreenelementprops \{id = ebn_marker
		unhide}
endscript

script menu_ebn_get_band_name_text 
	formattext textname = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15]) q = ($new_band_name [16]) r = ($new_band_name [17]) s = ($new_band_name [18]) t = ($new_band_name [19])
	return band_name_text_string = <band_name_text_string>
endscript
menu_ebn_width_threshold = 609
menu_ebn_backdrop_pos_change_factor = (100.0, 0.0)

script menu_ebn_refresh_band_name 
	menu_ebn_get_band_name_text
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	setscreenelementprops id = band_name_text text = (<band_name_text_string>) scale = (<vals_struct>.text_scale) pos = (<vals_struct>.text_pos)
	setscreenelementprops id = band_name_entry_char scale = (<vals_struct>.text_scale)
	getscreenelementdims \{id = band_name_text}
	setscreenelementprops id = menu_backdrop pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	setscreenelementprops id = ticket_image pos = (<vals_struct>.background_pos) dims = (<vals_struct>.background_dims)
	setscreenelementprops id = ebn_header_text pos = (<vals_struct>.header_pos) scale = (<vals_struct>.header_scale)
	setscreenelementprops id = ebn_tour_text pos = (<vals_struct>.tour_pos) scale = (<vals_struct>.tour_scale)
	setscreenelementprops id = ebn_address_text pos = (<vals_struct>.address_pos) scale = (<vals_struct>.address_scale)
	setscreenelementprops id = ebn_date_text pos = (<vals_struct>.date_pos) scale = (<vals_struct>.date_scale)
	setscreenelementprops id = ebn_sponsor_text pos = (<vals_struct>.sponsor_pos) scale = (<vals_struct>.sponsor_scale)
	setscreenelementprops id = logo_vault_image pos = ((<vals_struct>.sponsor_pos) + (<vals_struct>.sponsor_offset)) dims = (<vals_struct>.sponsor_dims)
	setscreenelementprops id = random_image pos = ((<vals_struct>.right_side_img_pos)) dims = (<vals_struct>.right_side_img_dims)
	menu_ebn_update_marker
endscript

script menu_ebn_update_marker 
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	setscreenelementprops \{id = band_name_entry_char
		text = $new_band_flashing_char}
	getscreenelementdims \{id = band_name_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = band_name_text}
	getscreenelementdims \{id = band_name_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	setscreenelementprops id = band_name_entry_char text = $new_band_flashing_char pos = <new_pos>
	getscreenelementdims \{id = ebn_marker}
	setscreenelementprops id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript
