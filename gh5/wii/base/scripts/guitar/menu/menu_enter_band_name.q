new_band_name = [
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
]
new_band_flashing_char = qs(0x57449344)
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_transitioning_back = 0
default_band_characters = [
	qs(0x0dd10f11)
	qs(0x26fc5cd2)
	qs(0x3fe76d93)
	qs(0x70a6fb54)
	qs(0x69bdca15)
	qs(0x429099d6)
	qs(0x5b8ba897)
	qs(0xdc13b458)
	qs(0xc5088519)
	qs(0xee25d6da)
	qs(0xf73ee79b)
	qs(0xb87f715c)
	qs(0xa164401d)
	qs(0x8a4913de)
	qs(0x9352229f)
	qs(0x5e082c01)
	qs(0x47131d40)
	qs(0x6c3e4e83)
	qs(0x75257fc2)
	qs(0x3a64e905)
	qs(0x237fd844)
	qs(0x08528b87)
	qs(0x1149bac6)
	qs(0x96d1a609)
	qs(0x8fca9748)
	qs(0xa4e7c48b)
	qs(0x22ee76e7)
	qs(0x09c32524)
	qs(0x10d81465)
	qs(0x5f9982a2)
	qs(0x4682b3e3)
	qs(0x6dafe020)
	qs(0x74b4d161)
	qs(0xf32ccdae)
	qs(0xea37fcef)
	qs(0x3bf547a6)
	qs(0x682c64b6)
	qs(0x14ca3e50)
	qs(0x5a1a0634)
	qs(0x155b90f3)
	qs(0x276df271)
	qs(0x8bd8bd7d)
	qs(0xb9eedfff)
	qs(0xa0f5eebe)
	qs(0xd99030ce)
	qs(0x92c38c3c)
	qs(0xc4992bba)
	qs(0x8e5b39eb)
	qs(0xf6af4938)
	qs(0x713755f7)
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
	text_pos = (250.0, 150.0)
	background_pos = (640.0, 360.0)
	background_dims = (1280.0, 720.0)
	header_pos = (640.0, 250.0)
	header_scale = 0.8
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (640.0, 500.0)
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
	text_pos = (250.0, 150.0)
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
	qs(0xd9c05655)
	qs(0x48d38461)
	qs(0xa92dae34)
	qs(0x08d15a6f)
	qs(0x809c1537)
	qs(0xba1c7d13)
	qs(0xf662e8c5)
	qs(0x8c940a83)
	qs(0x409a50bd)
	qs(0xc4015e26)
	qs(0x246b637a)
	qs(0x96549921)
]

script create_enter_band_name_menu 
	ScriptAssert \{'create_enter_band_name_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script enter_band_name_reset_user_control_helpers 
	add_user_control_helper \{button = green
		text = qs(0x2931d48b)}
	add_user_control_helper \{button = red
		text = qs(0xaf4d5dd2)}
	add_user_control_helper \{button = start
		text = qs(0xb73cb78f)}
endscript

script enter_band_name_reset_variables 
	Change \{new_band_name = [
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
			qs(0x03ac90f0)
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
	Change \{new_band_flashing_char = qs(0x0dd10f11)}
	Change \{new_band_flashing_index = 0}
endscript

script destroy_enter_band_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_dialog_box
	generic_ui_destroy
endscript

script blinker 
	if NOT ScreenElementExists id = <id>
		return
	endif
	begin
	legacydoscreenelementmorph id = <id> alpha = 0 time = <time>
	Wait <time> Seconds
	legacydoscreenelementmorph id = <id> alpha = 1.0
	Wait <time> Seconds
	repeat
endscript

script confirm_band_name 
	if NOT band_name_is_valid <...>
		SoundEvent \{event = Menu_Warning_SFX}
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if ScreenElementExists \{id = ebn_marker}
			LaunchEvent \{Type = unfocus
				target = ebn_marker}
			if (<need_unique> = 1)
				create_dialog \{create_dialog
					body_text = $wii_name_already_exists
					options = [
						{
							func = enter_band_name_remove_warning
							text = qs(0x182f0173)
						}
					]}
			else
				create_dialog_box \{create_dialog_box
					body_text = $wii_must_enter_band
					options = [
						{
							func = enter_band_name_remove_warning
							text = qs(0x182f0173)
						}
					]}
			endif
		endif
	else
		if isngc
			NetSessionFunc \{func = stats_uninit}
			NetSessionFunc \{func = stats_init}
		endif
		menu_ebn_get_band_name_text
		StringRemoveTrailingWhitespace string = <band_name_text_string>
		formatText checksumName = bandname_id 'band%i_info' i = ($current_band)
		GetTrueStartTime
		formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
		SetGlobalTags <bandname_id> params = {Name = <new_string> band_unique_id = <band_unique_id>}
		agora_update Name = <new_string> new_band
		if ($options_for_manage_band = 1)
			generic_event_choose \{event = menu_change
				state = uistate_options_manage_band_logo}
		else
			if GotParam \{from_options}
				generic_event_choose \{event = menu_replace
					state = uistate_options_manage_band_logo}
			else
				generic_event_choose \{event = menu_replace
					state = uistate_game_mode}
			endif
		endif
	endif
endscript

script enter_band_name_remove_warning 
	destroy_dialog_box
	enter_band_name_reset_user_control_helpers
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script enter_band_name_change_character 
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
endscript

script enter_band_name_remove_focus 
	ScriptAssert \{'enter_band_name_remove_focus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script enter_band_name_refocus 
	ScriptAssert \{'enter_band_name_refocus: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
		Change \{new_band_flashing_index = 0}
		Change \{new_band_flashing_char = qs(0x0dd10f11)}
		Change new_band_index = ($new_band_index + 1)
		menu_ebn_refresh_band_name
		if (($new_band_index + 1) = $max_band_characters)
			ebn_take_away_blinker
		endif
	endif
endscript

script ebn_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = qs(0xaf4d5dd2)}
	add_user_control_helper \{button = start
		text = qs(0xb73cb78f)}
	SetScreenElementProps \{id = band_name_entry_char
		Hide}
	SetScreenElementProps \{id = ebn_marker
		Hide}
endscript

script band_retreat_pointer 
	if ($new_band_index = 0)
		Change \{ebn_transitioning_back = 1}
		destroy_enter_band_name_menu
		generic_event_back
		return
	endif
	if (($new_band_index -1) > -1)
		generic_menu_pad_back_sound
		Change new_band_index = ($new_band_index -1)
		Change new_band_flashing_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			globalarray
			index = $new_band_index
			NewValue = qs(0x03ac90f0)}
		Change \{new_band_flashing_index = $new_band_flashing_index_prev}
		menu_ebn_refresh_band_name
		if (($new_band_index + 2) = $max_band_characters)
			ebn_put_back_blinker
		endif
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
	formatText TextName = band_name_text_string qs(0x15edabf9) a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15]) q = ($new_band_name [16]) r = ($new_band_name [17]) s = ($new_band_name [18]) t = ($new_band_name [19])
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
	SetScreenElementProps id = band_name_text text = (<band_name_text_string>) Scale = (<vals_struct>.text_scale) Pos = (<vals_struct>.text_pos)
	SetScreenElementProps id = band_name_entry_char Scale = (<vals_struct>.text_scale)
	GetScreenElementDims \{id = band_name_text}
	menu_ebn_update_marker
endscript

script menu_ebn_update_marker 
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
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
	SetScreenElementProps id = band_name_entry_char text = $new_band_flashing_char Pos = <new_pos>
	GetScreenElementDims \{id = ebn_marker}
	SetScreenElementProps id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <height>) Pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript

script band_name_is_valid 
	if ($ebn_transitioning_back)
		return
	endif
	num_spaces = 0
	array_entry = 0
	<valid> = 0
	<need_unique> = 0
	begin
	if NOT ($new_band_name [<array_entry>] = qs(0x03ac90f0))
		if NOT ($new_band_name [<array_entry>] = qs(0x713755f7))
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_band_characters)
	if (<valid> = 0)
		return FALSE need_unique = <need_unique>
	else
		return true need_unique = <need_unique>
	endif
endscript
