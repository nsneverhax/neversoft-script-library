new_band_name = [
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
	''
	''
	''
	''
]
new_band_flashing_char = 'A'
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_using_big_vals = 1
ebn_transitioning_back = 0
ebn_reached_max_chars = 0
default_band_characters = [
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
	'!'
	'@'
	'#'
	'$'
	'^'
	'&'
	'*'
	'('
	')'
	'_'
	'+'
	'-'
	'='
	'/'
	' '
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
enter_band_name_small_vals = {
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
us_month_names = [
	'January'
	'February'
	'March'
	'April'
	'May'
	'June'
	'July'
	'August'
	'September'
	'October'
	'November'
	'December'
]

script create_enter_band_name_menu 
	Change \{ebn_reached_max_chars = 0}
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	NetSessionFunc \{func = stats_init}
	enter_band_name_reset_variables
	rotation_angle = -2
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = ebn_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = ebn_container
		id = ebn_menu_backdrop
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
		Pos = (($enter_band_name_big_vals).right_side_img_pos)
		Scale = (($enter_band_name_big_vals).right_side_img_scale)
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
		text = 'ENTER BAND NAME:'
		id = ebn_header_text
		Pos = (($enter_band_name_big_vals).header_pos)
		rot_angle = <rotation_angle>
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [center top]
		Scale = (($enter_band_name_big_vals).header_scale)
	}
	CreateScreenElement {
		Type = TextElement
		parent = ebn_container
		font = text_a3
		text = 'AEROSMITH LEGENDS TOUR'
		id = top_title_text
		Pos = (($enter_band_name_big_vals).top_title_pos)
		rot_angle = <rotation_angle>
		rgba = [212 228 236 255]
		just = [center top]
		Scale = (($enter_band_name_big_vals).top_title_scale)
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
		Pos = (($enter_band_name_big_vals).date_pos)
		rot_angle = <rotation_angle>
		rgba = <black>
		just = [center top]
		Scale = (($enter_band_name_big_vals).date_scale)
	}
	CreateScreenElement {
		Type = ContainerElement
		parent = ebn_container
		id = band_name_text_container
		rot_angle = <rotation_angle>
	}
	CreateScreenElement {
		Type = TextElement
		parent = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <nameColor>
		id = band_name_text
		Pos = (($enter_band_name_big_vals).text_pos)
		just = [center center]
		font_spacing = 2
	}
	CreateScreenElement {
		Type = TextElement
		parent = band_name_text_container
		font = text_a3
		Scale = (($enter_band_name_big_vals).text_scale)
		rgba = <activeColor>
		text = 'A'
		id = band_name_entry_char
		just = [center center]
		alpha = 0.35000002
	}
	CreateScreenElement {
		Type = SpriteElement
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
	menu_ebn_update_marker
	enter_band_name_reset_user_control_helpers
endscript

script enter_band_name_reset_user_control_helpers 
	add_user_control_helper \{button = green
		text = 'NEXT'}
	add_user_control_helper \{button = red
		text = 'BACK'}
	add_user_control_helper \{button = strumbar
		text = 'UP/DOWN'}
	add_user_control_helper \{button = start
		text = 'ACCEPT'}
endscript

script enter_band_name_reset_variables 
	Change \{new_band_name = [
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
			''
			''
			''
			''
		]}
	Change \{new_band_index = 0}
	Change \{default_band_indexes = [
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
	Change \{new_band_flashing_char = 'A'}
	Change \{new_band_flashing_index = 0}
	Change \{new_band_flashing_index_prev = 0}
	Change \{new_band_index = 0}
	Change \{ebn_reached_max_chars = 0}
endscript

script destroy_enter_band_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script blinker 
	if NOT ScreenElementExists id = <id>
		return
	endif
	begin
	DoScreenElementMorph id = <id> alpha = 0 time = <time>
	Wait <time> Seconds
	DoScreenElementMorph id = <id> alpha = 1.0
	Wait <time> Seconds
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
	if NOT ($new_band_name [<array_entry>] = '')
		if NOT ($new_band_name [<array_entry>] = ' ')
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
			StringRemoveTrailingWhitespace string = <band_name_text_string>
			get_band_game_mode_name
			formatText checksumName = bandname_id 'band%i_info_%g' i = <prev_band_index> g = <game_mode_name>
			GetGlobalTags <bandname_id> param = Name
			if (<Name> = <new_string>)
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
			StringRemoveTrailingWhitespace string = <band_name_text_string>
			get_band_game_mode_name
			formatText checksumName = bandname_id 'band%i_info_%g' i = <next_band_index> g = <game_mode_name>
			GetGlobalTags <bandname_id> param = Name
			if (<Name> = <new_string>)
				<valid> = 0
				<need_unique> = 1
			endif
			<next_band_index> = (<next_band_index> + 1)
			repeat (5 - $current_band)
		endif
	endif
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if ScreenElementExists \{id = ebn_marker}
			if (<need_unique> = 1)
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = 'The Band Name you entered already exists.  Please enter a different Band Name.'}
			else
				create_alert_popup \{prev_menu_id = ebn_marker
					alert = 'You must enter a Band Name to proceed!'}
			endif
		endif
	else
		if isngc
			NetSessionFunc \{func = stats_uninit}
			NetSessionFunc \{func = stats_init}
		endif
		menu_ebn_get_band_name_text
		StringRemoveTrailingWhitespace string = <band_name_text_string>
		get_band_game_mode_name
		formatText checksumName = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
		GetTrueStartTime
		formatText checksumName = band_unique_id 'band%i_info_%g_%d' i = ($current_band) g = <game_mode_name> d = <starttime>
		SetGlobalTags <bandname_id> params = {Name = <new_string> band_unique_id = <band_unique_id>}
		agora_update Name = <new_string> new_band
		if ($options_for_manage_band = 1)
			ui_flow_manager_respond_to_action \{action = enter_band_name_for_manage_band}
		else
			ui_flow_manager_respond_to_action \{action = enter_band_name}
		endif
	endif
endscript

script enter_band_name_change_character 
	if (($new_band_index + 1) < $max_band_characters)
		if GotParam \{device_num}
			if IsGuitarController controller = <device_num>
				if GotParam \{up}
					change_character_down
				else
					change_character_up
				endif
			else
				if GotParam \{up}
					change_character_up
				else
					change_character_down
				endif
			endif
		endif
	endif
endscript

script enter_band_name_remove_focus 
	LaunchEvent \{Type = unfocus
		target = scrolling_enter_band_name}
endscript

script enter_band_name_refocus 
	LaunchEvent \{Type = focus
		target = scrolling_enter_band_name}
endscript

script change_character_up 
	generic_menu_up_or_down_sound \{up}
	Change new_band_flashing_index = ($new_band_flashing_index + 1)
	GetArraySize \{$default_band_characters}
	if ($new_band_flashing_index > (<array_Size> -1))
		Change \{new_band_flashing_index = 0}
	endif
	Change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script change_character_down 
	generic_menu_up_or_down_sound \{down}
	Change new_band_flashing_index = ($new_band_flashing_index -1)
	if ($new_band_flashing_index < 0)
		GetArraySize \{$default_band_characters}
		Change new_band_flashing_index = (<array_Size> -1)
	endif
	Change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script band_advance_pointer 
	if (($new_band_index + 1) < $max_band_characters)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_band_name
			globalarray
			index = $new_band_index
			NewValue = $new_band_flashing_char}
		Change \{new_band_flashing_index_prev = $new_band_flashing_index}
		Change new_band_index = ($new_band_index + 1)
		if ($new_band_index > 8)
			Change structurename = enter_band_name_small_vals text_scale = ($enter_band_name_small_vals.text_scale - $enter_band_name_small_vals.text_diff)
			if ($enter_band_name_small_vals.text_scale < 1.2)
				Change \{structurename = enter_band_name_small_vals
					text_scale = 1.2}
			endif
		endif
		menu_ebn_refresh_band_name
		if (($new_band_index + 1) = $max_band_characters)
			ebn_take_away_blinker
			GetScreenElementDims \{id = band_name_entry_char}
			<char_width> = (<width> / 2)
			SetScreenElementProps id = band_name_text Pos = (($enter_band_name_small_vals.text_pos) + (<char_width> * (1.0, 0.0)))
		endif
	endif
endscript

script ebn_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = 'BACK'}
	add_user_control_helper \{button = start
		text = 'ACCEPT'}
	SetScreenElementProps \{id = band_name_entry_char
		Hide}
	SetScreenElementProps \{id = ebn_marker
		Hide}
endscript

script band_retreat_pointer 
	if ($new_band_index = 0)
		Change \{ebn_transitioning_back = 1}
		ui_flow_manager_respond_to_action \{action = go_back}
		return
	endif
	if (($new_band_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_band_index = ($new_band_index -1)
		if ($new_band_index > 8)
			Change structurename = enter_band_name_small_vals text_scale = ($enter_band_name_small_vals.text_scale + $enter_band_name_small_vals.text_diff)
		endif
		Change new_band_flashing_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			globalarray
			index = $new_band_index
			NewValue = ''}
		Change \{new_band_flashing_index = $new_band_flashing_index_prev}
		if (($new_band_index + 2) = $max_band_characters)
			ebn_put_back_blinker
			Change \{structurename = enter_band_name_small_vals
				text_scale = 1.2}
		endif
		menu_ebn_refresh_band_name
	endif
endscript

script ebn_put_back_blinker 
	clean_up_user_control_helpers
	enter_band_name_reset_user_control_helpers
	SetScreenElementProps \{id = band_name_entry_char
		unhide}
	SetScreenElementProps \{id = ebn_marker
		unhide}
endscript

script menu_ebn_get_band_name_text 
	formatText TextName = band_name_text_string '%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t' a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15]) q = ($new_band_name [16]) r = ($new_band_name [17]) s = ($new_band_name [18]) t = ($new_band_name [19])
	return band_name_text_string = <band_name_text_string>
endscript
menu_ebn_width_threshold = 609
menu_ebn_backdrop_pos_change_factor = (100.0, 0.0)

script menu_ebn_refresh_band_name 
	menu_ebn_get_band_name_text
	<do_scaling> = 0
	if (($new_band_index = 9) && ($ebn_using_big_vals = 1))
		Change \{ebn_using_big_vals = 0}
		Change \{structurename = enter_band_name_small_vals
			text_scale = 1.8}
		<vals_struct> = ($enter_band_name_small_vals)
		<do_scaling> = 1
	elseif (($new_band_index = 8) && ($ebn_using_big_vals = 0))
		Change \{ebn_using_big_vals = 1}
		<vals_struct> = ($enter_band_name_big_vals)
		<do_scaling> = 1
	elseif (($new_band_index = 0) && ($ebn_using_big_vals = 0))
		Change \{ebn_using_big_vals = 1}
		<vals_struct> = ($enter_band_name_big_vals)
		<do_scaling> = 1
	else
		<do_scaling> = 0
	endif
	if (($new_band_index > 8) && (<do_scaling> = 0))
		<vals_struct> = ($enter_band_name_small_vals)
		DoScreenElementMorph id = band_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) time = <time> motion = ease_out
		DoScreenElementMorph id = band_name_entry_char Scale = (<vals_struct>.text_scale) time = <time> motion = ease_out
	endif
	SetScreenElementProps id = band_name_text text = (<band_name_text_string>)
	if (<do_scaling>)
		<time> = 0.5
		LaunchEvent \{Type = unfocus
			target = ebn_marker}
		DoScreenElementMorph id = band_name_text Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos) time = <time> motion = ease_out
		DoScreenElementMorph id = band_name_entry_char Scale = (<vals_struct>.text_scale) time = <time> motion = ease_out
		SetScreenElementProps \{id = band_name_entry_char
			Hide}
		SetScreenElementProps \{id = ebn_marker
			Hide}
		DoScreenElementMorph id = ebn_menu_backdrop Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale time = <time> motion = ease_out
		DoScreenElementMorph id = ticket_image Pos = (<vals_struct>.background_pos) Scale = (<vals_struct>.background_scale) relative_scale time = <time> motion = ease_out
		DoScreenElementMorph id = ebn_header_text Pos = (<vals_struct>.header_pos) Scale = (<vals_struct>.header_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = top_title_text Pos = (<vals_struct>.top_title_pos) Scale = (<vals_struct>.top_title_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = ebn_date_text Pos = (<vals_struct>.date_pos) Scale = (<vals_struct>.date_scale) time = <time> motion = ease_out
		DoScreenElementMorph id = random_image Pos = ((<vals_struct>.right_side_img_pos)) Scale = (<vals_struct>.right_side_img_scale) relative_scale time = <time> motion = ease_out
		Wait (<time> * 1.5) Seconds
		menu_ebn_update_marker
		LaunchEvent \{Type = focus
			target = ebn_marker}
	else
		menu_ebn_update_marker
	endif
endscript

script menu_ebn_update_marker 
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 8)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps \{id = band_name_entry_char
		text = $new_band_flashing_char}
	GetScreenElementDims \{id = band_name_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = band_name_text}
	GetScreenElementDims \{id = band_name_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps id = band_name_entry_char text = $new_band_flashing_char Pos = <new_pos> unhide
	GetScreenElementDims \{id = ebn_marker}
	SetScreenElementProps id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.6 * (0.0, 1.0))) unhide
endscript
