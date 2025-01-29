register_id = 123456789
register_pin = 1234
register_name = "SONIC BOOM"
register_loc_id = "235"
register_address1 = "512 BLOOR ST"
register_address2 = ""
register_city = "TORONTO"
register_state = "ONTARIO"
register_zip = "12345"
register_zone = "GMT -5"
register_zone_index = 7
register_phone = "4165320334"
local_register_name = "SONIC BOOM"
local_register_loc_id = "235"
local_register_address1 = "512 BLOOR ST"
local_register_address2 = ""
local_register_city = "TORONTO"
local_register_state = "ONTARIO"
local_register_zip = "12345"
local_register_zone = "GMT -5"
local_register_zone_index = 7
local_register_phone = "4165320334"
register_graphic_idx = -1
register_last_key = -1
register_keypad_alpha_index = 0
register_current_choice = 0
register_current_zone = 0
default_register_name_indexes = [
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
new_register_name = [
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
new_register_name_index = 0
new_register_name_flashing_char = "A"
new_register_name_flashing_index = 0
new_register_name_flashing_index_prev = 0
max_register_name_characters = 17
max_register_id_characters = 11
max_register_pin_characters = 5
max_register_zip_characters = 6
max_register_phone_characters = 11
register_num_locations = 0
register_max_locations = 32
register_loc_name_array = [
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
register_loc_id_array = [
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
register_loc_address1_array = [
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
register_loc_address2_array = [
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
register_loc_city_array = [
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
register_loc_state_array = [
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
register_loc_zip_array = [
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
register_loc_zone_array = [
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
register_loc_phone_array = [
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

script create_register_bg 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = register_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Toprockers_bg}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = ticket_image
		texture = band_name_ticket
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 1}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = random_image
		texture = band_name_graphic03
		Pos = (1190.0, 330.0)
		dims = (196.0, 408.0)
		z_priority = 2}
	if ($register_graphic_idx = -1)
		rand = 0
		GetRandomValue \{Name = rand
			integer
			a = 0
			b = 2}
		Change register_graphic_idx = <rand>
	else
		rand = $register_graphic_idx
	endif
	if (<rand> = 0)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic01}
	elseif (<rand> = 1)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic02}
	elseif (<rand> = 2)
		SetScreenElementProps \{id = random_image
			texture = band_name_graphic03
			Pos = (1160.0, 330.0)}
	endif
endscript

script register_reset_variables 
	Change \{default_register_name_indexes = [
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
	Change \{new_register_name = [
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
	Change \{new_register_name_index = 0}
	Change \{new_register_name_flashing_char = "A"}
	Change \{new_register_name_flashing_index = 0}
endscript

script register_update_marker 
	SetScreenElementProps \{id = rn_entry_char
		text = $new_register_name_flashing_char}
	GetScreenElementDims \{id = rn_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = rn_text}
	GetScreenElementDims \{id = rn_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps id = rn_entry_char text = $new_register_name_flashing_char Pos = <new_pos>
	GetScreenElementDims \{id = rn_marker}
	SetScreenElementProps id = rn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript

script register_put_back_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SetScreenElementProps \{id = rn_entry_char
		unhide}
	SetScreenElementProps \{id = rn_marker
		unhide}
endscript

script register_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SetScreenElementProps \{id = rn_entry_char
		Hide}
	SetScreenElementProps \{id = rn_marker
		Hide}
endscript

script get_register_name_text 
	formatText TextName = register_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_register_name [0]) b = ($new_register_name [1]) c = ($new_register_name [2]) d = ($new_register_name [3]) e = ($new_register_name [4]) f = ($new_register_name [5]) g = ($new_register_name [6]) h = ($new_register_name [7]) i = ($new_register_name [8]) j = ($new_register_name [9]) k = ($new_register_name [10]) l = ($new_register_name [11]) m = ($new_register_name [12]) n = ($new_register_name [13]) o = ($new_register_name [14]) p = ($new_register_name [15]) q = ($new_register_name [16]) r = ($new_register_name [17]) s = ($new_register_name [18]) t = ($new_register_name [19])
	return register_name_text_string = <register_name_text_string>
endscript

script create_operator_id_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER OPERATOR ID"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "ID CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	Change \{new_register_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_digit
				params = {
					up
				}
			}
			{
				pad_down
				register_change_digit
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_digit_pointer
				params = {
					max_characters = $max_register_id_characters
				}
			}
			{
				pad_back
				register_retreat_digit_pointer
				params = {
					max_characters = $max_register_id_characters
				}
			}
			{
				pad_square
				register_confirm_id
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_digit_watch_keypad
		params = {
			Max = $max_register_id_characters
		}}
endscript

script destroy_operator_id_menu 
	KillSpawnedScript \{Name = register_digit_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_id 
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		<valid> = 1
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_register_id_characters)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_error_text :SetProps \{text = "ID CANNOT BE BLANK"
			alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		id_value = <register_name_text_string>
		WideStringToInteger \{id_value}
		Change register_id = <id_value>
		printf \{"register_confirm_id: register_id=%a"
			a = $register_id}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script register_change_digit 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				register_digit_down
			else
				register_digit_up
			endif
		else
			if GotParam \{up}
				register_digit_up
			else
				register_digit_down
			endif
		endif
	endif
endscript

script register_digit_up 
	generic_menu_up_or_down_sound \{up}
	Change new_register_name_flashing_index = ($new_register_name_flashing_index + 1)
	GetArraySize \{$default_pin_characters}
	if ($new_register_name_flashing_index > (<array_Size> -1))
		Change \{new_register_name_flashing_index = 0}
	endif
	Change new_register_name_flashing_char = ($default_pin_characters [$new_register_name_flashing_index])
	register_update_marker
endscript

script register_digit_down 
	generic_menu_up_or_down_sound \{down}
	Change new_register_name_flashing_index = ($new_register_name_flashing_index -1)
	if ($new_register_name_flashing_index < 0)
		GetArraySize \{$default_pin_characters}
		Change new_register_name_flashing_index = (<array_Size> -1)
	endif
	Change new_register_name_flashing_char = ($default_pin_characters [$new_register_name_flashing_index])
	register_update_marker
endscript

script register_advance_digit_pointer \{max_characters = 11}
	if (($new_register_name_index + 1) < <max_characters>)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_register_name
			globalarray
			index = $new_register_name_index
			NewValue = $new_register_name_flashing_char}
		Change \{new_register_name_flashing_index_prev = $new_register_name_flashing_index}
		Change \{new_register_name_flashing_index = 0}
		Change \{new_register_name_flashing_char = "0"}
		Change new_register_name_index = ($new_register_name_index + 1)
		refresh_register_name
		if (($new_register_name_index + 1) = <max_characters>)
			register_take_away_blinker
		endif
	endif
endscript

script register_retreat_digit_pointer \{max_characters = 11}
	if (($new_register_name_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_register_name_index = ($new_register_name_index -1)
		Change new_register_name_flashing_char = ($new_register_name [$new_register_name_index])
		SetArrayElement \{ArrayName = new_register_name
			globalarray
			index = $new_register_name_index
			NewValue = ""}
		Change \{new_register_name_flashing_index = $new_register_name_flashing_index_prev}
		refresh_register_name
		if (($new_register_name_index + 2) = <max_characters>)
			register_put_back_blinker
		endif
	endif
endscript

script refresh_register_name 
	formatText TextName = register_text "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_register_name [0]) b = ($new_register_name [1]) c = ($new_register_name [2]) d = ($new_register_name [3]) e = ($new_register_name [4]) f = ($new_register_name [5]) g = ($new_register_name [6]) h = ($new_register_name [7]) i = ($new_register_name [8]) j = ($new_register_name [9]) k = ($new_register_name [10]) l = ($new_register_name [11]) m = ($new_register_name [12]) n = ($new_register_name [13]) o = ($new_register_name [14]) p = ($new_register_name [15]) q = ($new_register_name [16]) r = ($new_register_name [17]) s = ($new_register_name [18]) t = ($new_register_name [19])
	SetScreenElementProps id = rn_text text = (<register_text>)
	register_update_marker
endscript

script register_digit_watch_keypad 
	begin
	getkeypad
	if (<key> != -1)
		if (<key> >= 0 && <key> <= 9)
			if (($new_register_name_index + 1) < <Max>)
				SoundEvent \{event = ui_sfx_select}
				formatText TextName = keypad_digit "%a" a = <key>
				SetArrayElement ArrayName = new_register_name globalarray index = $new_register_name_index NewValue = <keypad_digit>
				Change new_register_name_flashing_index_prev = <keypad_digit>
				Change \{new_register_name_flashing_index = 0}
				Change \{new_register_name_flashing_char = "0"}
				Change new_register_name_index = ($new_register_name_index + 1)
				refresh_register_name
				if (($new_register_name_index + 1) = <Max>)
					register_take_away_blinker
				endif
			endif
		elseif (<key> = 10)
			register_retreat_digit_pointer
		elseif (<key> = 11)
			LaunchEvent \{Type = pad_square}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_operator_pin_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER OPERATOR PIN"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "PIN CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	Change \{new_register_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_digit
				params = {
					up
				}
			}
			{
				pad_down
				register_change_digit
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_digit_pointer
				params = {
					max_characters = $max_register_pin_characters
				}
			}
			{
				pad_back
				register_retreat_digit_pointer
				params = {
					max_characters = $max_register_pin_characters
				}
			}
			{
				pad_square
				register_confirm_pin
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_digit_watch_keypad
		params = {
			Max = $max_register_pin_characters
		}}
endscript

script destroy_operator_pin_menu 
	KillSpawnedScript \{Name = register_digit_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_pin 
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		<valid> = 1
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_register_id_characters)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_error_text :SetProps \{text = "PIN CANNOT BE BLANK"
			alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		pin_value = <register_name_text_string>
		WideStringToInteger \{pin_value}
		Change register_pin = <pin_value>
		printf \{"register_confirm_pin: register_pin=%a"
			a = $register_pin}
		if ($register_current_state = unregister)
			ui_flow_manager_respond_to_action \{action = select_unregister}
		else
			ui_flow_manager_respond_to_action \{action = select_accept}
		endif
	endif
endscript

script create_operator_load_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "LOADING LOCATIONS"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "PLEASE WAIT"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "OPERATOR LOAD ERROR"
		id = register_error_text
		Pos = (730.0, 470.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (485.0, 440.0)
		just = [
			left
			center
		]
		text = "WORKING."}
	Change \{register_loc_name_array = [
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
	Change \{register_loc_id_array = [
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
	Change \{register_loc_address1_array = [
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
	Change \{register_loc_address2_array = [
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
	Change \{register_loc_city_array = [
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
	Change \{register_loc_state_array = [
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
	Change \{register_loc_zip_array = [
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
	Change \{register_loc_zone_array = [
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
	Change \{register_loc_phone_array = [
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
	Change \{register_num_locations = 0}
	SpawnScriptNow \{load_operator_data}
endscript

script destroy_operator_load_menu 
	KillSpawnedScript \{Name = load_operator_data}
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script load_operator_data 
	success = 0
	GetLocationsByOperatorBegin \{operator_id = $register_id}
	load_counter = 0
	begin
	MathMod a = <load_counter> b = 30
	if (<Mod> < 10)
		rn_text :SetProps \{text = "WORKING."}
	elseif (<Mod> < 20)
		rn_text :SetProps \{text = "WORKING  ."}
	else
		rn_text :SetProps \{text = "WORKING    ."}
	endif
	GetLocationsByOperatorLoop msgid = <msgid>
	if (<answered> = 1)
		break
	endif
	<load_counter> = (<load_counter> + 1)
	Wait \{1
		gameframe}
	repeat
	GetLocationsByOperatorEnd msgid = <msgid>
	locindex = 0
	if (<num_locations> > 0)
		begin
		GetLocation index = <locindex>
		printf "load_operator_data: %a - %b" a = <id> b
		printf "load_operator_data: name = %a" a = <Name>
		formatText TextName = tid "%a" a = <id>
		formatText TextName = tname "%a" a = <Name>
		formatText TextName = taddress1 "%a" a = <address1>
		formatText TextName = taddress2 "%a" a = <address2>
		formatText TextName = tcity "%a" a = <city>
		formatText TextName = tstate "%a" a = <state>
		formatText TextName = tzip "%a" a = <zip>
		formatText TextName = tzone "%a" a = <zone>
		formatText TextName = tphone "%a" a = <phone>
		SetArrayElement ArrayName = register_loc_id_array globalarray index = <locindex> NewValue = <tid>
		SetArrayElement ArrayName = register_loc_name_array globalarray index = <locindex> NewValue = <tname>
		SetArrayElement ArrayName = register_loc_address1_array globalarray index = <locindex> NewValue = <taddress1>
		SetArrayElement ArrayName = register_loc_address2_array globalarray index = <locindex> NewValue = <taddress2>
		SetArrayElement ArrayName = register_loc_city_array globalarray index = <locindex> NewValue = <tcity>
		SetArrayElement ArrayName = register_loc_state_array globalarray index = <locindex> NewValue = <tstate>
		SetArrayElement ArrayName = register_loc_zip_array globalarray index = <locindex> NewValue = <tzip>
		SetArrayElement ArrayName = register_loc_zone_array globalarray index = <locindex> NewValue = <tzone>
		SetArrayElement ArrayName = register_loc_phone_array globalarray index = <locindex> NewValue = <tphone>
		<locindex> = (<locindex> + 1)
		repeat <num_locations>
	else
		SetArrayElement ArrayName = register_loc_id_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_name_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_address1_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_address2_array globalarray index = <locindex> NewValue = ""
		SetArrayElement ArrayName = register_loc_city_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_state_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_zip_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_zone_array globalarray index = <locindex> NewValue = "N/A"
		SetArrayElement ArrayName = register_loc_phone_array globalarray index = <locindex> NewValue = "N/A"
		<num_locations> = 1
	endif
	if (<success> = 1)
		Change register_num_locations = <num_locations>
		rn_text :SetProps \{text = "SUCCESS!"}
		Wait \{2
			Seconds}
		printf \{"load_operator_data: success!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = load_success
			}}
	else
		Change \{register_num_locations = 0}
		rn_text :SetProps \{text = "FAILURE!"}
		register_error_text :SetProps \{alpha = 1}
		Wait \{2
			Seconds}
		printf \{"load_operator_data: failure!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = load_failure
			}}
	endif
endscript

script create_operator_location_hub_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = register_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = sponsor_bg}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 99}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = register_paperbg
		texture = Options_Calibrate_BG
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		z_priority = -10}
	CreateScreenElement \{Type = SpriteElement
		parent = register_container
		id = register_papermag
		texture = sponsor_papermag
		just = [
			center
			center
		]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		z_priority = 10}
	displaySprite \{parent = register_container
		tex = Song_Summary_Percent_Fill_Paste
		Pos = (970.0, 70.0)
		dims = (360.0, 120.0)
		z = 15
		just = [
			center
			center
		]}
	displayText \{parent = register_container
		text = "LOCATIONS"
		Pos = (930.0, 50.0)
		Scale = 1.0
		just = [
			center
			center
		]
		rgba = [
			194
			190
			157
			255
		]
		font = text_a11_Large
		z = 18
		rot = 2
		noshadow}
	displayText \{parent = register_container
		text = "LOCATIONS"
		Pos = (932.0, 52.0)
		Scale = 1.0
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a11_Large
		z = 17
		rot = 1
		noshadow}
	displaySprite \{parent = register_container
		tex = Song_Summary_Percent_Fill_Paste
		Pos = (470.0, 80.0)
		dims = (360.0, 120.0)
		z = 15
		just = [
			center
			center
		]
		rot_angle = -6}
	displayText \{parent = register_container
		text = "DETAILS"
		Pos = (430.0, 60.0)
		Scale = 1.0
		just = [
			center
			center
		]
		rgba = [
			194
			190
			157
			255
		]
		font = text_a11_Large
		z = 18
		rot = -4
		noshadow}
	displayText \{parent = register_container
		text = "DETAILS"
		Pos = (432.0, 62.0)
		Scale = 1.0
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a11_Large
		z = 17
		rot = -5
		noshadow}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = detail_container
		Pos = (0.0, 0.0)
		rot_angle = -6}
	displayText \{parent = detail_container
		text = "NAME:"
		Pos = (320.0, 222.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "ID:"
		Pos = (320.0, 252.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "ADDRESS:"
		Pos = (320.0, 282.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "CITY:"
		Pos = (320.0, 342.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "STATE:"
		Pos = (320.0, 372.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "ZIP:"
		Pos = (320.0, 402.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "ZONE:"
		Pos = (320.0, 432.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		text = "PHONE:"
		Pos = (320.0, 462.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			right
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_name
		text = ""
		Pos = (340.0, 222.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_id
		text = ""
		Pos = (340.0, 252.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_address1
		text = ""
		Pos = (340.0, 282.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_address2
		text = ""
		Pos = (340.0, 312.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_city
		text = ""
		Pos = (340.0, 342.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_state
		text = ""
		Pos = (340.0, 372.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_zip
		text = ""
		Pos = (340.0, 402.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_zone
		text = ""
		Pos = (340.0, 432.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displayText \{parent = detail_container
		id = detail_phone
		text = ""
		Pos = (340.0, 462.0)
		font = text_a4
		Scale = 0.7
		rgba = [
			70
			10
			10
			255
		]
		z = 20
		just = [
			left
			top
		]
		noshadow}
	displaySprite \{parent = register_container
		id = register_highlight
		tex = Toprockers_Bar_1
		Pos = (750.0, 360.0)
		dims = (345.0, 36.0)
		rgba = [
			70
			10
			10
			255
		]
		z = -7
		just = [
			left
			center
		]
		rot_angle = 0}
	new_menu \{scrollid = scrolling_register_menu
		vmenuid = vmenu_register_menu
		exclusive_device = None
		menu_pos = (775.0, 320.0)
		internal_just = [
			left
			center
		]
		no_focus = 1
		no_wrap = 1
		z = -5}
	set_focus_color \{rgba = [
			228
			222
			198
			255
		]}
	set_unfocus_color \{rgba = [
			70
			10
			10
			255
		]}
	text_params = {
		Type = TextElement
		parent = vmenu_register_menu
		font = text_a4
		Scale = 0.7
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{unfocus register_unfocus}
			{pad_choose register_select}
		]
	}
	index = 0
	begin
	formatText checksumName = table_id 'rm_loc_%i_id' i = <index>
	formatText TextName = table_text "%a" a = ($register_loc_name_array [<index>])
	CreateScreenElement {
		<text_params>
		id = <table_id>
		text = <table_text>
		event_handlers = [
			{focus register_focus params = {index = <index>}}
			{unfocus register_unfocus}
			{pad_choose register_select}
			{pad_square ui_flow_manager_respond_to_action params = {action = select_add}}
		]
	}
	index = (<index> + 1)
	repeat $register_num_locations
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "CANCEL"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ADD NEW"
		button = blue
		z = 100}
	LaunchEvent \{Type = focus
		target = vmenu_register_menu}
endscript

script destroy_operator_location_hub_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_register_menu}
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_focus \{index = 0}
	retail_menu_focus
	GetTags
	printf "register_focus: id=%a" a = <id>
	Change register_current_choice = <index>
	scrolling_register_menu :SetProps Pos = ((775.0, 320.0) + <index> * (0.0, -34.25))
	formatText TextName = name_text "%a" a = ($register_loc_name_array [<index>])
	formatText TextName = id_text "%a" a = ($register_loc_id_array [<index>])
	formatText TextName = address1_text "%a" a = ($register_loc_address1_array [<index>])
	formatText TextName = address2_text "%a" a = ($register_loc_address2_array [<index>])
	formatText TextName = city_text "%a" a = ($register_loc_city_array [<index>])
	formatText TextName = state_text "%a" a = ($register_loc_state_array [<index>])
	formatText TextName = zip_text "%a" a = ($register_loc_zip_array [<index>])
	formatText TextName = zone_text "%a" a = ($register_loc_zone_array [<index>])
	formatText TextName = phone_text "%a" a = ($register_loc_phone_array [<index>])
	detail_name :SetProps text = <name_text>
	detail_id :SetProps text = <id_text>
	detail_address1 :SetProps text = <address1_text>
	detail_address2 :SetProps text = <address2_text>
	detail_city :SetProps text = <city_text>
	detail_state :SetProps text = <state_text>
	detail_zip :SetProps text = <zip_text>
	detail_zone :SetProps text = <zone_text>
	detail_phone :SetProps text = <phone_text>
	printf \{"register_focus: register_current_choice=%a"
		a = $register_current_choice}
endscript

script register_unfocus 
	retail_menu_unfocus
endscript

script register_select 
	ui_flow_manager_respond_to_action \{action = select_use}
endscript

script create_operator_location_confirm_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "CONFIRM LOCATION"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0
		event_handlers = [
			{
				pad_choose
				operator_location_select
			}
			{
				pad_back
				operator_location_cancel
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "ASSIGN GAME TO THIS LOCATION?"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	formatText TextName = nameid_text "%a (#%b)" a = ($register_loc_name_array [$register_current_choice]) b = ($register_loc_id_array [$register_current_choice])
	formatText TextName = address_text "%a %b" a = ($register_loc_address1_array [$register_current_choice]) b = ($register_loc_address2_array [$register_current_choice])
	formatText TextName = citystatezip_text "%a, %b %c" a = ($register_loc_city_array [$register_current_choice]) b = ($register_loc_state_array [$register_current_choice]) c = ($register_loc_zip_array [$register_current_choice])
	formatText TextName = phone_text "%a" a = ($register_loc_phone_array [$register_current_choice])
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_nameid
		Pos = (450.0, 360.0)
		just = [left top]
		text = <nameid_text>
	}
	GetScreenElementDims \{id = rn_nameid}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_nameid dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_address
		Pos = (450.0, 400.0)
		just = [left top]
		text = <address_text>
	}
	GetScreenElementDims \{id = rn_address}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_address dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_citystatezip
		Pos = (450.0, 440.0)
		just = [left top]
		text = <citystatezip_text>
	}
	GetScreenElementDims \{id = rn_citystatezip}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_citystatezip dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_phone
		Pos = (450.0, 480.0)
		just = [left top]
		text = <phone_text>
	}
	GetScreenElementDims \{id = rn_phone}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_phone dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	LaunchEvent \{Type = focus
		target = register_header_text}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "CANCEL"
		button = red
		z = 100}
endscript

script destroy_operator_location_confirm_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script operator_location_select 
	ui_flow_manager_respond_to_action \{action = select_accept}
endscript

script operator_location_cancel 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script create_operator_location_name_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER LOCATION"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "NAME CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_character
				params = {
					up
				}
			}
			{
				pad_down
				register_change_character
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_back
				register_retreat_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_square
				register_confirm_name
				params = {
					max_characters = $max_register_name_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_character_watch_keypad
		params = {
			Max = $max_register_name_characters
		}}
endscript

script destroy_operator_location_name_menu 
	KillSpawnedScript \{Name = register_character_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_name \{max_characters = 17}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_name = <register_name_text_string>
		printf \{"register_confirm_name: register_name=%a"
			a = $register_name}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script register_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				register_character_down
			else
				register_character_up
			endif
		else
			if GotParam \{up}
				register_character_up
			else
				register_character_down
			endif
		endif
	endif
endscript

script register_character_up 
	generic_menu_up_or_down_sound \{up}
	Change new_register_name_flashing_index = ($new_register_name_flashing_index + 1)
	GetArraySize \{$default_band_characters}
	if ($new_register_name_flashing_index > (<array_Size> -1))
		Change \{new_register_name_flashing_index = 0}
	endif
	Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
	register_update_marker
endscript

script register_character_down 
	generic_menu_up_or_down_sound \{down}
	Change new_register_name_flashing_index = ($new_register_name_flashing_index -1)
	if ($new_register_name_flashing_index < 0)
		GetArraySize \{$default_band_characters}
		Change new_register_name_flashing_index = (<array_Size> -1)
	endif
	Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
	register_update_marker
endscript

script register_advance_character_pointer \{max_characters = 17}
	if (($new_register_name_index + 1) < <max_characters>)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_register_name
			globalarray
			index = $new_register_name_index
			NewValue = $new_register_name_flashing_char}
		Change \{new_register_name_flashing_index_prev = $new_register_name_flashing_index}
		Change \{new_register_name_flashing_index = 0}
		Change \{new_register_name_flashing_char = "A"}
		Change new_register_name_index = ($new_register_name_index + 1)
		refresh_register_name
		if (($new_register_name_index + 1) = <max_characters>)
			register_take_away_blinker
		endif
	endif
endscript

script register_retreat_character_pointer \{max_characters = 17}
	if (($new_register_name_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_register_name_index = ($new_register_name_index -1)
		Change new_register_name_flashing_char = ($new_register_name [$new_register_name_index])
		SetArrayElement \{ArrayName = new_register_name
			globalarray
			index = $new_register_name_index
			NewValue = ""}
		Change \{new_register_name_flashing_index = $new_register_name_flashing_index_prev}
		refresh_register_name
		if (($new_register_name_index + 2) = <max_characters>)
			register_put_back_blinker
		endif
	endif
endscript
register_keypad_indices_1 = [
	26
]
register_keypad_indices_2 = [
	0
	1
	2
	27
]
register_keypad_indices_3 = [
	3
	4
	5
	28
]
register_keypad_indices_4 = [
	6
	7
	8
	29
]
register_keypad_indices_5 = [
	9
	10
	11
	30
]
register_keypad_indices_6 = [
	12
	13
	14
	31
]
register_keypad_indices_7 = [
	15
	16
	17
	18
	32
]
register_keypad_indices_8 = [
	19
	20
	21
	33
]
register_keypad_indices_9 = [
	22
	23
	24
	25
	34
]
register_keypad_indices_0 = [
	36
	35
]

script register_character_watch_keypad \{Max = 17}
	begin
	getkeypad
	if (<key> != -1)
		if (<key> = 1)
			if ($register_last_key = 1)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 0)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_1 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 1}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 2)
			if ($register_last_key = 2)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_2 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 2}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 3)
			if ($register_last_key = 3)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_3 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 3}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 4)
			if ($register_last_key = 4)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_4 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 4}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 5)
			if ($register_last_key = 5)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_5 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 5}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 6)
			if ($register_last_key = 6)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_6 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 6}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 7)
			if ($register_last_key = 7)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 4)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_7 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 7}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 8)
			if ($register_last_key = 8)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 3)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_8 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 8}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 9)
			if ($register_last_key = 9)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 4)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_9 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 9}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 0)
			if ($register_last_key = 0)
				generic_menu_up_or_down_sound \{up}
				Change register_keypad_alpha_index = ($register_keypad_alpha_index + 1)
				if ($register_keypad_alpha_index > 1)
					Change \{register_keypad_alpha_index = 0}
				endif
			elseif ($register_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{register_keypad_alpha_index = 0}
			else
				register_advance_character_pointer max_characters = <Max>
				Change \{register_keypad_alpha_index = 0}
			endif
			Change new_register_name_flashing_index = ($register_keypad_indices_0 [$register_keypad_alpha_index])
			Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
			register_update_marker
			Change \{register_last_key = 0}
			KillSpawnedScript \{Name = register_watch_advance}
			SpawnScriptNow register_watch_advance params = {Max = <Max>}
		elseif (<key> = 10)
			Change \{register_last_key = -1}
			register_retreat_character_pointer max_characters = <Max>
		elseif (<key> = 11)
			Change \{register_last_key = -1}
			LaunchEvent \{Type = pad_square}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script register_watch_advance \{Max = 17}
	Wait \{1
		Seconds}
	register_advance_character_pointer max_characters = <Max>
	Change \{register_keypad_alpha_index = 0}
	Change new_register_name_flashing_index = ($register_keypad_indices_2 [$register_keypad_alpha_index])
	Change new_register_name_flashing_char = ($default_band_characters [$new_register_name_flashing_index])
	register_update_marker
	Change \{register_last_key = -1}
endscript

script create_operator_location_address1_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER ADDRESS"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "ADDRESS CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_character
				params = {
					up
				}
			}
			{
				pad_down
				register_change_character
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_back
				register_retreat_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_square
				register_confirm_address1
				params = {
					max_characters = $max_register_name_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_character_watch_keypad
		params = {
			Max = $max_register_name_characters
		}}
endscript

script destroy_operator_location_address1_menu 
	KillSpawnedScript \{Name = register_character_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_address1 \{max_characters = 17}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_address1 = <register_name_text_string>
		printf \{"register_confirm_address1: register_address1=%a"
			a = $register_address1}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script create_operator_location_address2_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER ADDRESS (CONT)"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = (0.9, 1.0)}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "ADDRESS CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_character
				params = {
					up
				}
			}
			{
				pad_down
				register_change_character
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_back
				register_retreat_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_square
				register_confirm_address2
				params = {
					max_characters = $max_register_name_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_character_watch_keypad
		params = {
			Max = $max_register_name_characters
		}}
endscript

script destroy_operator_location_address2_menu 
	KillSpawnedScript \{Name = register_character_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_address2 \{max_characters = 17}
	get_register_name_text
	StringRemoveTrailingWhitespace string = <register_name_text_string>
	Change register_address2 = <register_name_text_string>
	printf \{"register_confirm_address2: register_address2=%a"
		a = $register_address2}
	ui_flow_manager_respond_to_action \{action = select_accept}
endscript

script create_operator_location_city_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER CITY"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "CITY CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_character
				params = {
					up
				}
			}
			{
				pad_down
				register_change_character
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_back
				register_retreat_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_square
				register_confirm_city
				params = {
					max_characters = $max_register_name_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_character_watch_keypad
		params = {
			Max = $max_register_name_characters
		}}
endscript

script destroy_operator_location_city_menu 
	KillSpawnedScript \{Name = register_character_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_city \{max_characters = 17}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_city = <register_name_text_string>
		printf \{"register_confirm_city: register_city=%a"
			a = $register_city}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script create_operator_location_state_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER STATE"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "CITY CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_character
				params = {
					up
				}
			}
			{
				pad_down
				register_change_character
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_back
				register_retreat_character_pointer
				params = {
					max_characters = $max_register_name_characters
				}
			}
			{
				pad_square
				register_confirm_state
				params = {
					max_characters = $max_register_name_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_character_watch_keypad
		params = {
			Max = $max_register_name_characters
		}}
endscript

script destroy_operator_location_state_menu 
	KillSpawnedScript \{Name = register_character_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_state \{max_characters = 17}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_state = <register_name_text_string>
		printf \{"register_confirm_state: register_state=%a"
			a = $register_state}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script create_operator_location_zip_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER ZIP"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "ZIP CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	Change \{new_register_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_digit
				params = {
					up
				}
			}
			{
				pad_down
				register_change_digit
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_digit_pointer
				params = {
					max_characters = $max_register_zip_characters
				}
			}
			{
				pad_back
				register_retreat_digit_pointer
				params = {
					max_characters = $max_register_zip_characters
				}
			}
			{
				pad_square
				register_confirm_zip
				params = {
					max_characters = $max_register_zip_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_digit_watch_keypad
		params = {
			Max = $max_register_zip_characters
		}}
endscript

script destroy_operator_location_zip_menu 
	KillSpawnedScript \{Name = register_digit_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_zip \{max_characters = 6}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		Change \{new_register_name_flashing_char = "0"}
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_zip = <register_name_text_string>
		printf \{"register_confirm_zip: register_zip=%a"
			a = $register_zip}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript
register_zone_array = [
	"(GMT -12) Eniwetok"
	"(GMT -11) Samoa"
	"(GMT -10) Honolulu"
	"(GMT  -9) Alaska"
	"(GMT  -8) Seattle"
	"(GMT  -7) Denver"
	"(GMT  -6) Chicago"
	"(GMT  -5) New York"
	"(GMT  -4) Caracas"
	"(GMT  -3) Buenos Aires"
	"(GMT  -2) Atlantic"
	"(GMT  -1) Azores"
	"(GMT   0) London"
	"(GMT  +1) Paris"
	"(GMT  +2) Athens"
	"(GMT  +3) Moscow"
	"(GMT  +4) Abu Dhabi"
	"(GMT  +5) New Delhi"
	"(GMT  +6) Dhakar"
	"(GMT  +7) Bangkok"
	"(GMT  +8) Hong Kong"
	"(GMT  +9) Tokyo"
	"(GMT +10) Sydney"
	"(GMT +11) Solomon"
	"(GMT +12) Auckland"
]
register_zone_value_array = [
	-12
	-11
	-10
	-9
	-8
	-7
	-6
	-5
	-4
	-3
	-2
	-1
	0
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10
	11
	12
]
register_num_zones = 25

script create_operator_location_zone_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER TIME ZONE"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	new_menu \{scrollid = scrolling_zone_menu
		vmenuid = vmenu_zone_menu
		exclusive_device = None
		menu_pos = (750.0, 260.0)
		just = [
			center
			top
		]
		internal_just = [
			left
			center
		]
		no_focus = 1
		z = 5
		rot_angle = -2}
	scrolling_zone_menu :SetProps \{regular_space_amount = 30
		num_items_to_show = 10}
	vmenu_zone_menu :SetProps \{regular_space_amount = 30
		num_items_to_show = 10}
	set_focus_color \{rgba = [
			230
			130
			65
			255
		]}
	set_unfocus_color \{rgba = [
			180
			70
			35
			255
		]}
	text_params = {
		Type = TextElement
		parent = vmenu_zone_menu
		font = text_a3
		Scale = 0.7
		rgba = ($menu_unfocus_color)
	}
	index = 0
	begin
	formatText checksumName = zone_id 'rm_zone_%i_id' i = <index>
	formatText TextName = zone_text "%a" a = ($register_zone_array [<index>])
	CreateScreenElement {
		<text_params>
		id = <zone_id>
		text = <zone_text>
		event_handlers = [
			{focus register_zone_focus params = {index = <index>}}
			{unfocus register_zone_unfocus}
			{pad_choose register_confirm_zone}
		]
	}
	index = (<index> + 1)
	repeat $register_num_zones
	LaunchEvent \{Type = focus
		target = vmenu_zone_menu}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_operator_location_zone_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_zone_menu}
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_zone 
	formatText TextName = zone_text "%a" a = ($register_zone_array [($register_current_zone)])
	Change register_zone = ($register_zone_value_array [($register_current_zone)])
	Change \{register_zone_index = $register_current_zone}
	printf \{"register_confirm_zone: register_zone=%a register_zone_index=%b"
		a = $register_zone
		b = $register_zone_index}
	ui_flow_manager_respond_to_action \{action = select_accept}
endscript

script register_zone_focus 
	retail_menu_focus
	GetTags
	printf "register_zone_focus: id=%a" a = <id>
	Change register_current_zone = <index>
	printf \{"register_zone_focus: register_current_zone=%a"
		a = $register_current_zone}
endscript

script register_zone_unfocus 
	retail_menu_unfocus
endscript

script create_operator_location_phone_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "ENTER PHONE"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "PHONE CANNOT BE BLANK"
		id = register_error_text
		Pos = (730.0, 490.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	register_reset_variables
	Change \{new_register_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = rn_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = SpriteElement
		parent = rn_container
		id = rn_marker
		texture = band_name_underline
		just = [
			center
			center
		]
		event_handlers = [
			{
				pad_up
				register_change_digit
				params = {
					up
				}
			}
			{
				pad_down
				register_change_digit
				params = {
					down
				}
			}
			{
				pad_choose
				register_advance_digit_pointer
				params = {
					max_characters = $max_register_phone_characters
				}
			}
			{
				pad_back
				register_retreat_digit_pointer
				params = {
					max_characters = $max_register_phone_characters
				}
			}
			{
				pad_square
				register_confirm_phone
				params = {
					max_characters = $max_register_phone_characters
				}
			}
		]
		rgba = [
			230
			130
			65
			255
		]}
	RunScriptOnScreenElement \{id = rn_marker
		blinker
		params = {
			id = rn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = rn_entry_char
		blinker
		params = {
			id = rn_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = rn_marker}
	register_update_marker
	Change \{register_last_key = -1}
	Change \{register_keypad_alpha_index = 0}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SpawnScriptNow \{register_digit_watch_keypad
		params = {
			Max = $max_register_phone_characters
		}}
endscript

script destroy_operator_location_phone_menu 
	KillSpawnedScript \{Name = register_digit_watch_keypad}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script register_confirm_phone \{max_characters = 11}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_register_name [<array_entry>] = "")
		if NOT ($new_register_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat (<max_characters>)
	if (<valid> = 0)
		SoundEvent \{event = Menu_Warning_SFX}
		register_reset_variables
		Change \{new_register_name_flashing_char = "0"}
		refresh_register_name
		register_put_back_blinker
		register_update_marker
		register_error_text :SetProps \{alpha = 1}
	else
		get_register_name_text
		StringRemoveTrailingWhitespace string = <register_name_text_string>
		Change register_phone = <register_name_text_string>
		printf \{"register_confirm_phone: register_phone=%a"
			a = $register_phone}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript

script create_operator_upload_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "UPLOADING LOCATION"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "PLEASE WAIT"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "OPERATOR UPLOAD ERROR"
		id = register_error_text
		Pos = (730.0, 470.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9
		alpha = 0}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = rn_text
		Pos = (485.0, 440.0)
		just = [
			left
			center
		]
		text = "WORKING."}
	SpawnScriptNow \{upload_operator_data}
endscript

script destroy_operator_upload_menu 
	KillSpawnedScript \{Name = upload_operator_data}
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script upload_operator_data 
	success = 0
	formatText \{TextName = id
		'%a'
		a = $register_id}
	formatText \{TextName = Name
		'%a'
		a = $register_name}
	formatText \{TextName = address1
		'%a'
		a = $register_address1}
	formatText \{TextName = address2
		'%a'
		a = $register_address2}
	formatText \{TextName = city
		'%a'
		a = $register_city}
	formatText \{TextName = state
		'%a'
		a = $register_state}
	formatText \{TextName = zip
		'%a'
		a = $register_zip}
	formatText \{TextName = zone
		'%a'
		a = $register_zone}
	formatText \{TextName = phone
		'%a'
		a = $register_phone}
	AddLocationBegin id = <id> Name = <Name> address1 = <address1> address2 = <address2> city = <city> state = <state> zip = <zip> zone = <zone> phone = <phone>
	upload_counter = 0
	begin
	MathMod a = <upload_counter> b = 30
	if (<Mod> < 10)
		rn_text :SetProps \{text = "WORKING."}
	elseif (<Mod> < 20)
		rn_text :SetProps \{text = "WORKING  ."}
	else
		rn_text :SetProps \{text = "WORKING    ."}
	endif
	AddLocationLoop msgid = <msgid>
	if (<answered> = 1)
		break
	endif
	<upload_counter> = (<upload_counter> + 1)
	Wait \{1
		gameframe}
	repeat
	AddLocationEnd msgid = <msgid>
	if (<success> = 1)
		rn_text :SetProps \{text = "SUCCESS!"}
		Wait \{2
			Seconds}
		printf \{"upload_operator_data: success!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = upload_success
			}}
	else
		rn_text :SetProps \{text = "FAILURE!"}
		register_error_text :SetProps \{alpha = 1}
		Wait \{2
			Seconds}
		printf \{"upload_operator_data: failure!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = upload_failure
			}}
	endif
endscript

script create_operator_unregister_menu 
	create_register_bg
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a10_Large
		text = "CONFIRM UNREGISTER"
		id = register_header_text
		Pos = (730.0, 134.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 1.0
		event_handlers = [
			{
				pad_choose
				operator_unregister_select
			}
			{
				pad_back
				operator_unregister_cancel
			}
		]}
	CreateScreenElement \{Type = TextElement
		parent = register_container
		font = text_a3
		text = "UNREGISTER THIS GAME FROM COINUP?"
		id = register_subheader_text
		Pos = (730.0, 250.0)
		rot_angle = -2
		rgba = [
			70
			10
			10
			255
		]
		just = [
			center
			top
		]
		Scale = 0.9}
	formatText \{TextName = nameid_text
		"%a (#%b)"
		a = $local_register_name
		b = $local_register_loc_id}
	formatText \{TextName = address_text
		"%a %b"
		a = $local_register_address1
		b = $local_register_address2}
	formatText \{TextName = citystatezip_text
		"%a, %b %c"
		a = $local_register_city
		b = $local_register_state
		c = $local_register_zip}
	formatText \{TextName = phone_text
		"%a"
		a = $local_register_phone}
	CreateScreenElement \{Type = ContainerElement
		parent = register_container
		id = rn_container
		rot_angle = -2}
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_nameid
		Pos = (450.0, 360.0)
		just = [left top]
		text = <nameid_text>
	}
	GetScreenElementDims \{id = rn_nameid}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_nameid dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_address
		Pos = (450.0, 400.0)
		just = [left top]
		text = <address_text>
	}
	GetScreenElementDims \{id = rn_address}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_address dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_citystatezip
		Pos = (450.0, 440.0)
		just = [left top]
		text = <citystatezip_text>
	}
	GetScreenElementDims \{id = rn_citystatezip}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_citystatezip dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = TextElement
		parent = rn_container
		font = text_a3
		Scale = 1.0
		rgba = [180 70 35 255]
		id = rn_phone
		Pos = (450.0, 480.0)
		just = [left top]
		text = <phone_text>
	}
	GetScreenElementDims \{id = rn_phone}
	if (<width> > 540)
		fit_text_in_rectangle id = rn_phone dims = ((540.0, 0.0) + <height> * (0.0, 1.0))
	endif
	LaunchEvent \{Type = focus
		target = register_header_text}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "CANCEL"
		button = red
		z = 100}
endscript

script destroy_operator_unregister_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = register_container}
	destroy_menu_backdrop
endscript

script operator_unregister_select 
	ui_flow_manager_respond_to_action \{action = select_accept}
endscript

script operator_unregister_cancel 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript
