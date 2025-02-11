login_new_account = 0
login_last_key = -1
login_keypad_alpha_index = 0
login_current_choice = login
login_first_name = SCOTT
login_last_name = PILGRIM
login_pin = 0
login_birthday = 927
login_active = 0
login_graphic_idx = -1
default_login_name_indexes = [
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
new_login_name = [
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
	""
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
new_login_name_index = 0
new_login_name_flashing_char = "A"
new_login_name_flashing_index = 0
new_login_name_flashing_index_prev = 0
max_login_name_characters = 13
max_login_digits = 11
max_login_birthday = 5
default_pin_characters = [
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
]

script create_login_bg 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = login_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Toprockers_bg}
	CreateScreenElement \{Type = SpriteElement
		parent = login_container
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
		parent = login_container
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
		parent = login_container
		id = random_image
		texture = band_name_graphic03
		Pos = (1190.0, 330.0)
		dims = (196.0, 408.0)
		z_priority = 2}
	if ($login_graphic_idx = -1)
		rand = 0
		GetRandomValue \{Name = rand
			integer
			a = 0
			b = 2}
		Change login_graphic_idx = <rand>
	else
		rand = $login_graphic_idx
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

script login_reset_variables 
	Change \{default_login_name_indexes = [
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
	Change \{new_login_name = [
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
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
	Change \{new_login_name_index = 0}
	Change \{new_login_name_flashing_char = "A"}
	Change \{new_login_name_flashing_index = 0}
endscript

script login_update_marker 
	SetScreenElementProps \{id = ln_entry_char
		text = $new_login_name_flashing_char}
	GetScreenElementDims \{id = ln_entry_char}
	new_width = <width>
	new_height = <height>
	fastscreenelementpos \{id = ln_text}
	GetScreenElementDims \{id = ln_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps id = ln_entry_char text = $new_login_name_flashing_char Pos = <new_pos>
	GetScreenElementDims \{id = ln_marker}
	SetScreenElementProps id = ln_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript

script login_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				login_character_down
			else
				login_character_up
			endif
		else
			if GotParam \{up}
				login_character_up
			else
				login_character_down
			endif
		endif
	endif
endscript

script login_character_up 
	generic_menu_up_or_down_sound \{up}
	Change new_login_name_flashing_index = ($new_login_name_flashing_index + 1)
	GetArraySize \{$default_band_characters}
	if ($new_login_name_flashing_index > (<array_Size> -1))
		Change \{new_login_name_flashing_index = 0}
	endif
	Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
	login_update_marker
endscript

script login_character_down 
	generic_menu_up_or_down_sound \{down}
	Change new_login_name_flashing_index = ($new_login_name_flashing_index -1)
	if ($new_login_name_flashing_index < 0)
		GetArraySize \{$default_band_characters}
		Change new_login_name_flashing_index = (<array_Size> -1)
	endif
	Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
	login_update_marker
endscript

script login_advance_pointer 
	if (($new_login_name_index + 1) < $max_login_name_characters)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = $new_login_name_flashing_char}
		Change \{new_login_name_flashing_index_prev = $new_login_name_flashing_index}
		Change \{new_login_name_flashing_index = 0}
		Change \{new_login_name_flashing_char = "A"}
		Change new_login_name_index = ($new_login_name_index + 1)
		refresh_login_name
		if (($new_login_name_index + 1) = $max_login_name_characters)
			login_take_away_blinker
		endif
	endif
endscript

script login_retreat_pointer 
	if (($new_login_name_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_login_name_index = ($new_login_name_index -1)
		Change new_login_name_flashing_char = ($new_login_name [$new_login_name_index])
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = ""}
		Change \{new_login_name_flashing_index = $new_login_name_flashing_index_prev}
		refresh_login_name
		if (($new_login_name_index + 2) = $max_login_name_characters)
			login_put_back_blinker
		endif
	endif
endscript

script login_put_back_blinker 
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
	SetScreenElementProps \{id = ln_entry_char
		unhide}
	SetScreenElementProps \{id = ln_marker
		unhide}
endscript

script login_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{text = "DELETE"
		button = red
		z = 100}
	add_user_control_helper \{text = "ACCEPT"
		button = blue
		z = 100}
	SetScreenElementProps \{id = ln_entry_char
		Hide}
	SetScreenElementProps \{id = ln_marker
		Hide}
endscript

script get_login_name_text 
	formatText TextName = login_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_login_name [0]) b = ($new_login_name [1]) c = ($new_login_name [2]) d = ($new_login_name [3]) e = ($new_login_name [4]) f = ($new_login_name [5]) g = ($new_login_name [6]) h = ($new_login_name [7]) i = ($new_login_name [8]) j = ($new_login_name [9]) k = ($new_login_name [10]) l = ($new_login_name [11]) m = ($new_login_name [12]) n = ($new_login_name [13]) o = ($new_login_name [14]) p = ($new_login_name [15]) q = ($new_login_name [16]) r = ($new_login_name [17]) s = ($new_login_name [18]) t = ($new_login_name [19])
	return login_name_text_string = <login_name_text_string>
endscript

script refresh_login_name 
	get_login_name_text
	SetScreenElementProps id = ln_text text = (<login_name_text_string>)
	login_update_marker
endscript

script create_login_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "AXE CLUB LOGIN"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "NEW PLAYER? SELECT 'NEW ACCOUNT'"
		id = login_tour_text
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
	displaySprite \{parent = login_container
		id = login_highlight
		tex = Song_Summary_Menu_Hilite
		Pos = (518.0, 396.0)
		dims = (485.0, 64.0)
		rgba = [
			70
			10
			10
			255
		]
		z = 2
		just = [
			left
			center
		]
		rot_angle = 0}
	new_menu {
		scrollid = scrolling_login_menu
		vmenuid = vmenu_login_menu
		menu_pos = (530.0, 340.0)
		exclusive_device = ($primary_controller)
		internal_just = [left center]
		no_focus = 1
		rot_angle = -2
		spacing = 5
	}
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
		parent = vmenu_login_menu
		font = text_a3
		Scale = 1.4
		rgba = ($menu_unfocus_color)
	}
	CreateScreenElement {
		<text_params>
		id = lm_new_id
		text = "NEW ACCOUNT"
		event_handlers = [
			{focus login_focus}
			{unfocus login_unfocus}
			{pad_choose login_select params = {option = new}}
		]
	}
	CreateScreenElement {
		<text_params>
		id = lm_login_id
		text = "LOGIN"
		event_handlers = [
			{focus login_focus}
			{unfocus login_unfocus}
			{pad_choose login_select params = {option = login}}
		]
	}
	add_user_control_helper \{text = "SELECT"
		button = green}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar}
	LaunchEvent \{Type = focus
		target = vmenu_login_menu}
	SpawnScriptNow \{login_watch_timer
		params = {
			Timer = 15
		}}
endscript

script destroy_login_menu 
	KillSpawnedScript \{Name = login_watch_timer}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_login_menu}
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script login_focus 
	retail_menu_focus
	GetTags
	printf "login_focus: id=%a" a = <id>
	switch (<id>)
		case lm_login_id
		Change \{login_current_choice = login}
		SetScreenElementProps \{id = login_highlight
			Pos = (518.0, 470.0)
			dims = (485.0, 64.0)}
		case lm_new_id
		default
		Change \{login_current_choice = new}
		SetScreenElementProps \{id = login_highlight
			Pos = (518.0, 396.0)
			dims = (485.0, 64.0)}
	endswitch
	printf \{"login_focus: login_current_choice=%a"
		a = $login_current_choice}
endscript

script login_unfocus 
	retail_menu_unfocus
endscript

script login_select 
	printf "login_select: option = %s" s = <option>
	switch <option>
		case login
		Change \{login_new_account = 0}
		ui_flow_manager_respond_to_action \{action = select_login}
		case new
		default
		Change \{login_new_account = 1}
		ui_flow_manager_respond_to_action \{action = select_new}
	endswitch
endscript

script login_watch_timer \{Timer = 15
		warning = 5}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"login_watch_timer: countdown expired with id=%s"
			s = $login_current_choice}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{login_select
		params = {
			option = $login_current_choice
		}}
endscript

script create_login_firstname_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "ENTER FIRST NAME"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "NAME CANNOT BE BLANK"
		id = login_legend_text
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
	login_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = ln_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = ln_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement {
		Type = SpriteElement
		parent = ln_container
		id = ln_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up login_change_character params = {up}}
			{pad_down login_change_character params = {down}}
			{pad_choose login_advance_pointer}
			{pad_back login_retreat_pointer}
			{pad_square login_firstname_confirm_name}
		]
		rgba = [230 130 65 255]
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = ln_marker
		blinker
		params = {
			id = ln_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = ln_entry_char
		blinker
		params = {
			id = ln_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = ln_marker}
	login_update_marker
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
	Change \{login_last_key = -1}
	Change \{login_keypad_alpha_index = 0}
	SpawnScriptNow \{login_watch_keypad
		params = {
			Name = first
		}}
	SpawnScriptNow \{login_firstname_watch_timer
		params = {
			Timer = 45
		}}
endscript

script destroy_login_firstname_menu 
	KillSpawnedScript \{Name = login_watch_advance}
	KillSpawnedScript \{Name = login_watch_keypad}
	KillSpawnedScript \{Name = login_firstname_watch_timer}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script login_firstname_watch_timer \{Timer = 45
		warning = 10}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"login_firstname_watch_timer: countdown expired"}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{login_firstname_confirm_name
		params = {
			timeout = 1
		}}
endscript

script login_firstname_confirm_name \{timeout = 0}
	good_first_names = [
		"AXEL" "JOHNNY" "JUDY" "IZZY" "CASEY" "LARS" "MIDORI" "SLASH"
	]
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_login_name [<array_entry>] = "")
		if NOT ($new_login_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_login_name_characters)
	if (<valid> = 0)
		if (<timeout> = 1)
			GetArraySize <good_first_names>
			num_good_names = <array_Size>
			GetRandomValue Name = good_name_idx integer a = 0 b = (<num_good_names> -1)
			good_name = (<good_first_names> [<good_name_idx>])
			StringRemoveTrailingWhitespace string = <good_name>
			Change login_first_name = <good_name>
			printf \{"login_firstname_confirm_name: INVALID NAME! login_first_name=%a"
				a = $login_first_name}
			ui_flow_manager_respond_to_action \{action = select_accept}
		else
			SoundEvent \{event = Menu_Warning_SFX}
			login_reset_variables
			refresh_login_name
			login_put_back_blinker
			login_update_marker
			login_legend_text :SetProps \{alpha = 1}
		endif
	else
		get_login_name_text
		StringRemoveTrailingWhitespace string = <login_name_text_string>
		Change login_first_name = <login_name_text_string>
		printf \{"login_firstname_confirm_name: login_first_name=%a"
			a = $login_first_name}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript
login_keypad_indices_1 = [
	26
]
login_keypad_indices_2 = [
	0
	1
	2
	27
]
login_keypad_indices_3 = [
	3
	4
	5
	28
]
login_keypad_indices_4 = [
	6
	7
	8
	29
]
login_keypad_indices_5 = [
	9
	10
	11
	30
]
login_keypad_indices_6 = [
	12
	13
	14
	31
]
login_keypad_indices_7 = [
	15
	16
	17
	18
	32
]
login_keypad_indices_8 = [
	19
	20
	21
	33
]
login_keypad_indices_9 = [
	22
	23
	24
	25
	34
]
login_keypad_indices_0 = [
	36
	35
]

script login_watch_keypad \{Name = first}
	begin
	getkeypad
	if (<key> != -1)
		if (<key> = 1)
			if ($login_last_key = 1)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 0)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_1 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 1}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 2)
			if ($login_last_key = 2)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_2 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 2}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 3)
			if ($login_last_key = 3)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_3 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 3}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 4)
			if ($login_last_key = 4)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_4 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 4}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 5)
			if ($login_last_key = 5)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_5 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 5}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 6)
			if ($login_last_key = 6)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_6 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 6}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 7)
			if ($login_last_key = 7)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 4)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_7 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 7}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 8)
			if ($login_last_key = 8)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 3)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_8 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 8}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 9)
			if ($login_last_key = 9)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 4)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_9 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 9}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 0)
			if ($login_last_key = 0)
				generic_menu_up_or_down_sound \{up}
				Change login_keypad_alpha_index = ($login_keypad_alpha_index + 1)
				if ($login_keypad_alpha_index > 1)
					Change \{login_keypad_alpha_index = 0}
				endif
			elseif ($login_last_key = -1)
				generic_menu_up_or_down_sound \{up}
				Change \{login_keypad_alpha_index = 0}
			else
				login_advance_pointer
				Change \{login_keypad_alpha_index = 0}
			endif
			Change new_login_name_flashing_index = ($login_keypad_indices_0 [$login_keypad_alpha_index])
			Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
			login_update_marker
			Change \{login_last_key = 0}
			KillSpawnedScript \{Name = login_watch_advance}
			SpawnScriptNow \{login_watch_advance}
		elseif (<key> = 10)
			Change \{login_last_key = -1}
			login_retreat_pointer
		elseif (<key> = 11)
			Change \{login_last_key = -1}
			if (<Name> = first)
				SpawnScriptNow \{login_firstname_confirm_name}
			elseif (<Name> = last)
				SpawnScriptNow \{login_lastname_confirm_name}
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script login_watch_advance 
	Wait \{1
		Seconds}
	login_advance_pointer
	Change \{login_keypad_alpha_index = 0}
	Change new_login_name_flashing_index = ($login_keypad_indices_2 [$login_keypad_alpha_index])
	Change new_login_name_flashing_char = ($default_band_characters [$new_login_name_flashing_index])
	login_update_marker
	Change \{login_last_key = -1}
endscript

script create_login_lastname_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "ENTER LAST NAME"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "NAME CANNOT BE BLANK"
		id = login_legend_text
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
	login_reset_variables
	CreateScreenElement \{Type = ContainerElement
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = ln_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "A"
		id = ln_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement {
		Type = SpriteElement
		parent = ln_container
		id = ln_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up login_change_character params = {up}}
			{pad_down login_change_character params = {down}}
			{pad_choose login_advance_pointer}
			{pad_back login_retreat_pointer}
			{pad_square login_lastname_confirm_name}
		]
		rgba = [230 130 65 255]
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = ln_marker
		blinker
		params = {
			id = ln_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = ln_entry_char
		blinker
		params = {
			id = ln_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = ln_marker}
	login_update_marker
	Change \{login_last_key = -1}
	Change \{login_keypad_alpha_index = 0}
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
	SpawnScriptNow \{login_watch_keypad
		params = {
			Name = last
		}}
	SpawnScriptNow \{login_lastname_watch_timer
		params = {
			Timer = 45
		}}
endscript

script destroy_login_lastname_menu 
	KillSpawnedScript \{Name = login_watch_advance}
	KillSpawnedScript \{Name = login_watch_keypad}
	KillSpawnedScript \{Name = login_lastname_watch_timer}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script login_lastname_watch_timer \{Timer = 45
		warning = 10}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"login_lastname_watch_timer: countdown expired"}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{login_lastname_confirm_name
		params = {
			timeout = 1
		}}
endscript

script login_lastname_confirm_name \{timeout = 0}
	good_last_names = [
		"SMITH" "JOHNSON" "WILLIAMS" "JONES" "BROWN" "DAVIS" "MILLER" "WILSON"
	]
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_login_name [<array_entry>] = "")
		if NOT ($new_login_name [<array_entry>] = " ")
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_login_name_characters)
	if (<valid> = 0)
		if (<timeout> = 1)
			GetArraySize <good_last_names>
			num_good_names = <array_Size>
			GetRandomValue Name = good_name_idx integer a = 0 b = (<num_good_names> -1)
			good_name = (<good_last_names> [<good_name_idx>])
			StringRemoveTrailingWhitespace string = <good_name>
			Change login_last_name = <good_name>
			printf \{"login_lastname_confirm_name: INVALID NAME! login_last_name=%a"
				a = $login_last_name}
			ui_flow_manager_respond_to_action \{action = select_accept}
		else
			SoundEvent \{event = Menu_Warning_SFX}
			login_reset_variables
			refresh_login_name
			login_put_back_blinker
			login_update_marker
			login_legend_text :SetProps \{alpha = 1}
		endif
	else
		get_login_name_text
		StringRemoveTrailingWhitespace string = <login_name_text_string>
		Change login_last_name = <login_name_text_string>
		printf \{"login_lastname_confirm_name: login_last_name=%a"
			a = $login_last_name}
		ui_flow_manager_respond_to_action \{action = select_accept}
	endif
endscript
login_confirm = 0

script create_login_pin_menu 
	create_login_bg
	if (login_confirm = 0)
		CreateScreenElement \{Type = TextElement
			parent = login_container
			font = text_a10_Large
			text = "ENTER PIN NUMBER"
			id = login_header_text
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
	else
		CreateScreenElement \{Type = TextElement
			parent = login_container
			font = text_a10_Large
			text = "CONFIRM PIN NUMBER"
			id = login_header_text
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
	endif
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "PIN CANNOT BE BLANK"
		id = login_legend_text
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
	login_reset_variables
	Change \{new_login_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = ln_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = ln_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement {
		Type = SpriteElement
		parent = ln_container
		id = ln_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up login_change_digit params = {up}}
			{pad_down login_change_digit params = {down}}
			{pad_choose login_advance_digit_pointer}
			{pad_back login_retreat_digit_pointer}
			{pad_square login_pin_confirm_pin}
		]
		rgba = [230 130 65 255]
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = ln_marker
		blinker
		params = {
			id = ln_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = ln_entry_char
		blinker
		params = {
			id = ln_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = ln_marker}
	login_update_marker
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
	SpawnScriptNow \{login_pin_watch_keypad}
	SpawnScriptNow \{login_pin_watch_timer
		params = {
			Timer = 45
		}}
endscript

script destroy_login_pin_menu 
	KillSpawnedScript \{Name = login_pin_watch_keypad}
	KillSpawnedScript \{Name = login_pin_watch_timer}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script login_pin_watch_timer \{Timer = 45
		warning = 10}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"login_pin_watch_timer: countdown expired"}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{login_pin_confirm_pin
		params = {
			timeout = 1
		}}
endscript

script login_pin_confirm_pin \{timeout = 0}
	array_entry = 0
	<valid> = 0
	begin
	if NOT ($new_login_name [<array_entry>] = "")
		<valid> = 1
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_login_digits)
	if (<valid> = 0)
		if (<timeout> = 1)
			if ($login_new_account = 1)
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "CANCELLING ACCOUNT PROCESS"
					alpha = 1}
				Wait \{2
					Seconds}
				ui_flow_manager_respond_to_action \{action = select_invalid}
			else
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "CANCELLING LOGIN PROCESS"
					alpha = 1}
				Wait \{2
					Seconds}
				ui_flow_manager_respond_to_action \{action = select_invalid_login}
			endif
		else
			SoundEvent \{event = Menu_Warning_SFX}
			login_legend_text :SetProps \{text = "PIN CANNOT BE BLANK"
				alpha = 1}
		endif
	else
		get_login_name_text
		StringRemoveTrailingWhitespace string = <login_name_text_string>
		old_login_pin = $login_pin
		pin_value = <login_name_text_string>
		WideStringToInteger \{pin_value}
		Change login_pin = <pin_value>
		printf \{"login_pin_confirm_pin: login_pin=%a"
			a = $login_pin}
		if ($login_confirm = 0 && $login_new_account = 1)
			Change \{login_confirm = 1}
			ui_flow_manager_respond_to_action \{action = select_confirm}
		else
			if (<old_login_pin> = $login_pin || $login_new_account = 0)
				Change \{login_confirm = 0}
				ui_flow_manager_respond_to_action \{action = select_accept}
			else
				Change \{login_confirm = 0}
				ui_flow_manager_respond_to_action \{action = select_restart}
			endif
		endif
	endif
endscript

script login_change_digit 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				login_digit_down
			else
				login_digit_up
			endif
		else
			if GotParam \{up}
				login_digit_up
			else
				login_digit_down
			endif
		endif
	endif
endscript

script login_digit_up 
	generic_menu_up_or_down_sound \{up}
	Change new_login_name_flashing_index = ($new_login_name_flashing_index + 1)
	GetArraySize \{$default_pin_characters}
	if ($new_login_name_flashing_index > (<array_Size> -1))
		Change \{new_login_name_flashing_index = 0}
	endif
	Change new_login_name_flashing_char = ($default_pin_characters [$new_login_name_flashing_index])
	login_update_marker
endscript

script login_digit_down 
	generic_menu_up_or_down_sound \{down}
	Change new_login_name_flashing_index = ($new_login_name_flashing_index -1)
	if ($new_login_name_flashing_index < 0)
		GetArraySize \{$default_pin_characters}
		Change new_login_name_flashing_index = (<array_Size> -1)
	endif
	Change new_login_name_flashing_char = ($default_pin_characters [$new_login_name_flashing_index])
	login_update_marker
endscript

script login_advance_digit_pointer 
	if (($new_login_name_index + 1) < $max_login_digits)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = $new_login_name_flashing_char}
		Change \{new_login_name_flashing_index_prev = $new_login_name_flashing_index}
		Change \{new_login_name_flashing_index = 0}
		Change \{new_login_name_flashing_char = "0"}
		Change new_login_name_index = ($new_login_name_index + 1)
		refresh_login_pin
		if (($new_login_name_index + 1) = $max_login_digits)
			login_take_away_blinker
		endif
	endif
endscript

script login_retreat_digit_pointer 
	if (($new_login_name_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_login_name_index = ($new_login_name_index -1)
		Change new_login_name_flashing_char = ($new_login_name [$new_login_name_index])
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = ""}
		Change \{new_login_name_flashing_index = $new_login_name_flashing_index_prev}
		refresh_login_pin
		if (($new_login_name_index + 2) = $max_login_digits)
			login_put_back_blinker
		endif
	endif
endscript

script refresh_login_pin 
	star_array = ["" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""]
	array_entry = 0
	begin
	if NOT ($new_login_name [<array_entry>] = "")
		SetArrayElement ArrayName = star_array index = <array_entry> NewValue = "*"
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_login_digits)
	formatText TextName = login_star_text "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = (<star_array> [0]) b = (<star_array> [1]) c = (<star_array> [2]) d = (<star_array> [3]) e = (<star_array> [4]) f = (<star_array> [5]) g = (<star_array> [6]) h = (<star_array> [7]) i = (<star_array> [8]) j = (<star_array> [9]) k = (<star_array> [10]) l = (<star_array> [11]) m = (<star_array> [12]) n = (<star_array> [13]) o = (<star_array> [14]) p = (<star_array> [15]) q = (<star_array> [16]) r = (<star_array> [17]) s = (<star_array> [18]) t = (<star_array> [19])
	SetScreenElementProps id = ln_text text = (<login_star_text>)
	login_update_marker
endscript

script login_pin_watch_keypad 
	begin
	getkeypad
	if (<key> != -1)
		if (<key> >= 0 && <key> <= 9)
			if (($new_login_name_index + 1) < $max_login_digits)
				SoundEvent \{event = ui_sfx_select}
				formatText TextName = keypad_digit "%a" a = <key>
				SetArrayElement ArrayName = new_login_name globalarray index = $new_login_name_index NewValue = <keypad_digit>
				Change new_login_name_flashing_index_prev = <keypad_digit>
				Change \{new_login_name_flashing_index = 0}
				Change \{new_login_name_flashing_char = "0"}
				Change new_login_name_index = ($new_login_name_index + 1)
				refresh_login_pin
				if (($new_login_name_index + 1) = $max_login_digits)
					login_take_away_blinker
				endif
			endif
		elseif (<key> = 10)
			login_retreat_digit_pointer
		elseif (<key> = 11)
			SpawnScriptNow \{login_pin_confirm_pin}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_login_birthday_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "ENTER BIRTHDAY"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "USE GUITAR OR KEYPAD BUTTONS"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "(MM/DD)"
		id = login_legend_text
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
		Scale = 0.9}
	login_reset_variables
	Change \{new_login_name_flashing_char = "0"}
	CreateScreenElement \{Type = ContainerElement
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = ln_text
		Pos = (685.0, 440.0)
		just = [
			center
			center
		]}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			230
			130
			65
			255
		]
		text = "0"
		id = ln_entry_char
		just = [
			center
			center
		]}
	CreateScreenElement {
		Type = SpriteElement
		parent = ln_container
		id = ln_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up login_change_digit params = {up}}
			{pad_down login_change_digit params = {down}}
			{pad_choose login_advance_birthday_pointer}
			{pad_back login_retreat_birthday_pointer}
			{pad_square login_confirm_birthday}
		]
		rgba = [230 130 65 255]
		exclusive_device = ($primary_controller)
	}
	RunScriptOnScreenElement \{id = ln_marker
		blinker
		params = {
			id = ln_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = ln_entry_char
		blinker
		params = {
			id = ln_entry_char
			time = 0.5
		}}
	LaunchEvent \{Type = focus
		target = ln_marker}
	login_update_marker
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
	SpawnScriptNow \{login_birthday_watch_keypad}
	SpawnScriptNow \{login_birthday_watch_timer
		params = {
			Timer = 45
		}}
endscript

script destroy_login_birthday_menu 
	KillSpawnedScript \{Name = login_birthday_watch_keypad}
	KillSpawnedScript \{Name = login_birthday_watch_timer}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script login_birthday_watch_timer \{Timer = 45
		warning = 10}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"login_birthday_watch_timer: countdown expired"}
		break
	endif
	Wait \{1
		Second}
	repeat
	SpawnScriptNow \{login_confirm_birthday
		params = {
			timeout = 1
		}}
endscript

script login_confirm_birthday \{timeout = 0}
	array_entry = 0
	<valid> = 1
	begin
	if ($new_login_name [<array_entry>] = "")
		<valid> = 0
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_login_birthday -1)
	printf "login_confirm_birthday: valid=%a" a = <valid>
	if (<valid> = 1)
		formatText TextName = login_month "%a%b" a = ($new_login_name [0]) b = ($new_login_name [1])
		formatText TextName = login_day "%a%b" a = ($new_login_name [2]) b = ($new_login_name [3])
		printf "login_confirm_birthday: month=%a%b day=%c%d" a = ($new_login_name [0]) b = ($new_login_name [1]) c = ($new_login_name [2]) d = ($new_login_name [3])
		WideStringToInteger \{login_month}
		WideStringToInteger \{login_day}
		printf "login_confirm_birthday: month=%a day=%b" a = <login_month> b = <login_day>
		if (<login_month> < 1 || <login_month> > 12)
			<valid> = -1
		else
			if ((<login_month> = 2) && (<login_day> < 1 || <login_day> > 29))
				<valid> = -1
			elseif ((<login_month> = 4 || <login_month> = 6 || <login_month> = 9 || <login_month> = 11) && (<login_day> < 1 || <login_day> > 30))
				<valid> = -1
			elseif (<login_day> < 1 || <login_day> > 31)
				<valid> = -1
			endif
		endif
	endif
	printf "login_confirm_birthday: valid=%a" a = <valid>
	if (<valid> != 1)
		if (<timeout> = 1)
			if ($login_new_account = 1)
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "CANCELLING ACCOUNT PROCESS"}
				Wait \{2
					Seconds}
				ui_flow_manager_respond_to_action \{action = select_invalid}
			else
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "CANCELLING LOGIN PROCESS"}
				Wait \{2
					Seconds}
				ui_flow_manager_respond_to_action \{action = select_invalid_login}
			endif
		else
			if (<valid> = 0)
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "ALL FOUR DIGITS REQUIRED"}
			elseif (<valid> = -1)
				SoundEvent \{event = Menu_Warning_SFX}
				login_legend_text :SetProps \{text = "INVALID DATE"}
				login_reset_variables
				Change \{new_login_name_flashing_char = "0"}
				refresh_login_birthday
				login_put_back_blinker
				login_update_marker
			endif
		endif
	else
		get_login_name_text
		StringRemoveTrailingWhitespace string = <login_name_text_string>
		birthday_value = <login_name_text_string>
		WideStringToInteger \{birthday_value}
		Change login_birthday = <birthday_value>
		printf \{"login_confirm_birthday: login_birthday=%a"
			a = $login_birthday}
		if ($login_new_account = 1)
			ui_flow_manager_respond_to_action \{action = select_create}
		else
			ui_flow_manager_respond_to_action \{action = select_load}
		endif
	endif
endscript

script login_advance_birthday_pointer 
	if (($new_login_name_index + 1) < $max_login_birthday)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = $new_login_name_flashing_char}
		Change \{new_login_name_flashing_index_prev = $new_login_name_flashing_index}
		Change \{new_login_name_flashing_index = 0}
		Change \{new_login_name_flashing_char = "0"}
		Change new_login_name_index = ($new_login_name_index + 1)
		refresh_login_birthday
		if (($new_login_name_index + 1) = $max_login_birthday)
			login_take_away_blinker
		endif
	endif
endscript

script login_retreat_birthday_pointer 
	if (($new_login_name_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_login_name_index = ($new_login_name_index -1)
		Change new_login_name_flashing_char = ($new_login_name [$new_login_name_index])
		SetArrayElement \{ArrayName = new_login_name
			globalarray
			index = $new_login_name_index
			NewValue = ""}
		Change \{new_login_name_flashing_index = $new_login_name_flashing_index_prev}
		refresh_login_birthday
		if (($new_login_name_index + 2) = $max_login_birthday)
			login_put_back_blinker
		endif
	endif
endscript

script refresh_login_birthday 
	if ($new_login_name_index > 1)
		formatText TextName = login_birthday_text "%a%b/%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_login_name [0]) b = ($new_login_name [1]) c = ($new_login_name [2]) d = ($new_login_name [3]) e = ($new_login_name [4]) f = ($new_login_name [5]) g = ($new_login_name [6]) h = ($new_login_name [7]) i = ($new_login_name [8]) j = ($new_login_name [9]) k = ($new_login_name [10]) l = ($new_login_name [11]) m = ($new_login_name [12]) n = ($new_login_name [13]) o = ($new_login_name [14]) p = ($new_login_name [15]) q = ($new_login_name [16]) r = ($new_login_name [17]) s = ($new_login_name [18]) t = ($new_login_name [19])
	else
		formatText TextName = login_birthday_text "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p%q%r%s%t" a = ($new_login_name [0]) b = ($new_login_name [1]) c = ($new_login_name [2]) d = ($new_login_name [3]) e = ($new_login_name [4]) f = ($new_login_name [5]) g = ($new_login_name [6]) h = ($new_login_name [7]) i = ($new_login_name [8]) j = ($new_login_name [9]) k = ($new_login_name [10]) l = ($new_login_name [11]) m = ($new_login_name [12]) n = ($new_login_name [13]) o = ($new_login_name [14]) p = ($new_login_name [15]) q = ($new_login_name [16]) r = ($new_login_name [17]) s = ($new_login_name [18]) t = ($new_login_name [19])
	endif
	SetScreenElementProps id = ln_text text = (<login_birthday_text>)
	login_update_marker
endscript

script login_birthday_watch_keypad 
	begin
	getkeypad
	if (<key> != -1)
		if (<key> >= 0 && <key> <= 9)
			if (($new_login_name_index + 1) < $max_login_birthday)
				SoundEvent \{event = ui_sfx_select}
				formatText TextName = keypad_digit "%a" a = <key>
				SetArrayElement ArrayName = new_login_name globalarray index = $new_login_name_index NewValue = <keypad_digit>
				Change new_login_name_flashing_index_prev = <keypad_digit>
				Change \{new_login_name_flashing_index = 0}
				Change \{new_login_name_flashing_char = "0"}
				Change new_login_name_index = ($new_login_name_index + 1)
				refresh_login_birthday
				if (($new_login_name_index + 1) = $max_login_birthday)
					login_take_away_blinker
				endif
			endif
		elseif (<key> = 10)
			login_retreat_birthday_pointer
		elseif (<key> = 11)
			SpawnScriptNow \{login_confirm_birthday}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_login_create_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "CREATING ACCOUNT"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "PLEASE WAIT"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "PIN + BIRTHDAY ALREADY EXISTS"
		id = login_legend_text
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
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 2.0
		rgba = [
			180
			70
			35
			255
		]
		id = ln_text
		Pos = (485.0, 440.0)
		just = [
			left
			center
		]
		text = "WORKING."}
	hide_countdown_timer
	SpawnScriptNow \{create_coinup_account}
endscript

script destroy_login_create_menu 
	KillSpawnedScript \{Name = create_coinup_account}
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script create_coinup_account 
	success = 0
	create_counter = 0
	begin
	MathMod a = <create_counter> b = 30
	if (<Mod> < 10)
		ln_text :SetProps \{text = "WORKING."}
	elseif (<Mod> < 20)
		ln_text :SetProps \{text = "WORKING  ."}
	else
		ln_text :SetProps \{text = "WORKING    ."}
	endif
	if (<create_counter> > 120)
		<success> = 1
		break
	endif
	<create_counter> = (<create_counter> + 1)
	Wait \{1
		gameframe}
	repeat
	if (<success> = 1)
		ln_text :SetProps \{text = "SUCCESS!"}
		Wait \{2
			Seconds}
		printf \{"create_coinup_account: success!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = create_success
			}}
	else
		ln_text :SetProps \{text = "FAILURE!"}
		login_legend_text :SetProps \{alpha = 1}
		Wait \{2
			Seconds}
		printf \{"create_coinup_account: failure!"}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = create_failure
			}}
	endif
endscript
login_load_step = login_load_init
login_load_state = login_load_working

script create_login_load_menu 
	create_login_bg
	CreateScreenElement \{Type = TextElement
		parent = login_container
		font = text_a10_Large
		text = "LOADING ACCOUNT"
		id = login_header_text
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
		parent = login_container
		font = text_a3
		text = "PLEASE WAIT"
		id = login_tour_text
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
		parent = login_container
		font = text_a3
		text = "ACCOUNT DOES NOT EXIST"
		id = login_error_text
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
	CreateScreenElement \{Type = ContainerElement
		parent = login_container
		id = ln_container
		rot_angle = -2}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_logininfo_text
		Pos = (475.0, 340.0)
		just = [
			left
			center
		]
		text = "Login Information"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_logininfo_state
		Pos = (850.0, 340.0)
		just = [
			left
			center
		]
		text = ""}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_rockingcrew_text
		Pos = (475.0, 365.0)
		just = [
			left
			center
		]
		text = "Rocking Crew"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_rockingcrew_state
		Pos = (850.0, 365.0)
		just = [
			left
			center
		]
		text = ""}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_tourneystandings_text
		Pos = (475.0, 390.0)
		just = [
			left
			center
		]
		text = "Tournament Standings"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_tourneystandings_state
		Pos = (850.0, 390.0)
		just = [
			left
			center
		]
		text = ""}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_tourneyplaydata_text
		Pos = (475.0, 415.0)
		just = [
			left
			center
		]
		text = "Tournament Play Data"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_tourneyplaydata_state
		Pos = (850.0, 415.0)
		just = [
			left
			center
		]
		text = ""}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_playdata_text
		Pos = (475.0, 440.0)
		just = [
			left
			center
		]
		text = "Play Data"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_playdata_state
		Pos = (850.0, 440.0)
		just = [
			left
			center
		]
		text = ""}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			180
			70
			35
			255
		]
		id = ln_songdata_text
		Pos = (475.0, 465.0)
		just = [
			left
			center
		]
		text = "Song Data"}
	CreateScreenElement \{Type = TextElement
		parent = ln_container
		font = text_a3
		Scale = 0.7
		rgba = [
			230
			130
			65
			255
		]
		id = ln_songdata_state
		Pos = (850.0, 465.0)
		just = [
			left
			center
		]
		text = ""}
	Change \{login_load_step = login_load_init}
	Change \{login_load_state = login_load_working}
	hide_countdown_timer
	SpawnScriptNow \{load_coinup_account}
endscript

script destroy_login_load_menu 
	KillSpawnedScript \{Name = load_coinup_account}
	destroy_menu \{menu_id = login_container}
	destroy_menu_backdrop
endscript

script load_coinup_account 
	success = 0
	load_counter = 0
	begin
	MathMod a = <load_counter> b = 30
	if (<Mod> < 10)
		formatText \{TextName = working_text
			"WORKING."}
	elseif (<Mod> < 20)
		formatText \{TextName = working_text
			"WORKING  ."}
	else
		formatText \{TextName = working_text
			"WORKING    ."}
	endif
	printf \{"login_load_step: %a login_load_state: %b"
		a = $login_load_step
		b = $login_load_state}
	if ($login_load_step = login_load_init)
		Change \{login_load_step = login_load_info}
		SpawnScriptNow \{spawn_login_load_info}
	elseif ($login_load_step = login_load_info)
		if ($login_load_state = login_load_success)
			ln_logininfo_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_crew}
			Change \{login_load_state = login_load_working}
			SpawnScriptNow \{spawn_login_load_crew}
		elseif ($login_load_state = login_load_failure)
			ln_logininfo_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ACCOUNT DOES NOT EXIST"
				alpha = 1}
			break
		else
			ln_logininfo_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_crew)
		if ($login_load_state = login_load_success)
			ln_rockingcrew_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_standings}
			Change \{login_load_state = login_load_working}
			SpawnScriptNow \{spawn_login_load_standings}
		elseif ($login_load_state = login_load_failure)
			ln_rockingcrew_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ERROR LOADING DATA"
				alpha = 1}
			break
		else
			ln_rockingcrew_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_standings)
		if ($login_load_state = login_load_success)
			ln_tourneystandings_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_tourneyplaydata}
			Change \{login_load_state = login_load_working}
			SpawnScriptNow \{spawn_login_load_tourneyplaydata}
		elseif ($login_load_state = login_load_failure)
			ln_tourneystandings_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ERROR LOADING DATA"
				alpha = 1}
			break
		else
			ln_tourneystandings_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_tourneyplaydata)
		if ($login_load_state = login_load_success)
			ln_tourneyplaydata_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_playdata}
			Change \{login_load_state = login_load_working}
			SpawnScriptNow \{spawn_login_load_playdata}
		elseif ($login_load_state = login_load_failure)
			ln_tourneyplaydata_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ERROR LOADING DATA"
				alpha = 1}
			break
		else
			ln_tourneyplaydata_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_playdata)
		if ($login_load_state = login_load_success)
			ln_playdata_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_songdata}
			Change \{login_load_state = login_load_working}
			SpawnScriptNow \{spawn_login_load_songdata}
		elseif ($login_load_state = login_load_failure)
			ln_playdata_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ERROR LOADING DATA"
				alpha = 1}
			break
		else
			ln_playdata_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_songdata)
		if ($login_load_state = login_load_success)
			ln_songdata_state :SetProps \{text = "SUCCESS"
				rgba = [
					0
					255
					0
					255
				]}
			Change \{login_load_step = login_load_done}
			Change \{login_load_state = login_load_working}
		elseif ($login_load_state = login_load_failure)
			ln_songdata_state :SetProps \{text = "FAILURE"
				rgba = [
					255
					0
					0
					255
				]}
			login_error_text :SetProps \{text = "ERROR LOADING DATA"
				alpha = 1}
			break
		else
			ln_songdata_state :SetProps text = <working_text>
		endif
	elseif ($login_load_step = login_load_done)
		<success> = 1
		break
	endif
	<load_counter> = (<load_counter> + 1)
	Wait \{1
		gameframe}
	repeat
	if (<success> = 1)
		Wait \{2
			Seconds}
		printf \{"load_coinup_account: success!"}
		Change \{login_active = 1}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = load_success
			}}
	else
		Wait \{2
			Seconds}
		printf \{"load_coinup_account: failure!"}
		Change \{login_active = 0}
		SpawnScriptNow \{ui_flow_manager_respond_to_action
			params = {
				action = load_failure
			}}
	endif
endscript

script spawn_login_load_info 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript

script spawn_login_load_crew 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript

script spawn_login_load_standings 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript

script spawn_login_load_tourneyplaydata 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript

script spawn_login_load_playdata 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript

script spawn_login_load_songdata 
	Wait \{1
		Seconds}
	Change \{login_load_state = login_load_success}
endscript
