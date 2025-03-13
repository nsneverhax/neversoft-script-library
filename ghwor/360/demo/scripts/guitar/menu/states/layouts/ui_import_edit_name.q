
script ui_create_import_edit_name 
	if marketplacepersistencefunc \{func = encountered_error}
		return
	endif
	if (($g_marketplace_responding_to_error) = 1)
		return
	endif
	ui_create_edit_name <...> desc = 'edit_name_alt'
	edit_name_screen_id :obj_spawnscriptlater ui_import_edit_name_backspace_spawned params = {char_limit = <char_limit> device_num = <device_num>}
	edit_name_screen_id :obj_spawnscriptlater ui_import_edit_name_enter_character_spawned params = {char_limit = <char_limit> device_num = <device_num>}
	edit_name_screen_id :se_setprops \{event_handlers = [
			{
				pad_start
				ui_import_edit_name_finish
			}
		]
		replace_handlers
		edit_name_chars_left_rgba = gh6_gold}
endscript

script ui_destroy_import_edit_name 
	ui_destroy_edit_name <...>
	destroy_dialog_box
endscript

script ui_return_import_edit_name 
	ui_destroy_import_edit_name <...>
	ui_create_import_edit_name <...>
endscript

script ui_import_edit_name_enter_pressed 
	if (($edit_name_allow_accept) = 0)
		ui_sfx \{menustate = generic
			uitype = scrollendwarning}
		return
	endif
	ui_import_edit_name_finish char_limit = <char_limit>
endscript

script ui_import_edit_name_enter_character 
	requireparams \{[
			char_limit
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_getprops
	if gotparam \{key}
		convertsinglecharstringtouppercase string = <key> out = key
		if NOT checkstringforinvalidchars string = <key> valid_characters = [
				$name_entry_upper_characters
				$name_entry_number_characters
			]
			return
		endif
		<name_letter_text> = <key>
	endif
	stringtochararray string = <name_text>
	if gotparam \{char_array}
		getarraysize <char_array>
		if (<array_size> < <char_limit>)
			<name_text> = (<name_text> + <name_letter_text>)
			stringtochararray string = <name_text>
			array_size = 0
			if gotparam \{char_array}
				getarraysize <char_array>
				name_text_key = qs(0x03ac90f0)
				if (<array_size> > 0)
					i = 0
					begin
					name_text_key = (<name_text_key> + (<char_array> [<i>]))
					if ((<i> = 3) || (<i> = 7) || (<i> = 11) || (<i> = 15))
						name_text_key = (<name_text_key> + qs(0xc4992bba))
					endif
					i = (<i> + 1)
					repeat <array_size>
				endif
			endif
			if (<array_size> = 20)
				formattext \{textname = char_limit_text
					qs(0x28f2c919)}
				char_limit_color = green_md
			else
				formattext textname = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
				char_limit_color = gh6_gold
			endif
			soundevent \{event = audio_ui_text_entry_select}
			edit_name_screen_id :se_setprops {
				name_text = <name_text>
				name_text_key = <name_text_key>
				edit_name_chars_left_text = <char_limit_text>
				edit_name_chars_left_rgba = <char_limit_color>
				name_dims = (0.0, 40.0)
			}
			if (<array_size> = <char_limit>)
				edit_name_screen_id :se_setprops \{name_letter_alpha = 0}
			endif
		else
			ui_sfx \{menustate = generic
				uitype = scrollendwarning}
		endif
	endif
endscript

script ui_import_edit_name_enter_character_spawned 
	requireparams \{[
			char_limit
			device_num
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{0.1
		seconds}
	if screenelementexists \{id = edit_name_screen_id}
		getenterbuttonassignment
		begin
		if controllerpressed <assignment> <device_num>
			if (($edit_name_allow_accept) = 1)
				ui_import_edit_name_enter_character char_limit = <char_limit>
				wait \{0.2
					seconds}
			else
				wait \{1
					gameframe}
			endif
		else
			if (($edit_name_allow_accept) = 0)
				change \{edit_name_allow_accept = 1}
			endif
			wait \{1
				gameframe}
		endif
		repeat
	endif
endscript

script ui_import_edit_name_backspace 
	requireparams \{[
			char_limit
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_setprops \{name_text_key = qs(0x03ac90f0)
		name_dims = (0.0, 40.0)}
	edit_name_screen_id :se_getprops
	stringtochararray string = <name_text>
	if gotparam \{char_array}
		getarraysize <char_array>
		text = qs(0x03ac90f0)
		if (<array_size> > 1)
			i = 0
			begin
			text = (<text> + (<char_array> [<i>]))
			i = (<i> + 1)
			repeat (<array_size> - 1)
			soundevent \{event = audio_ui_text_entry_back}
		elseif (<array_size> = 1)
			soundevent \{event = audio_ui_text_entry_back}
		else
			ui_sfx \{menustate = generic
				uitype = scrollendwarning}
		endif
		stringtochararray string = <text>
		array_size = 0
		if gotparam \{char_array}
			getarraysize <char_array>
			name_text_key = qs(0x03ac90f0)
			if (<array_size> > 0)
				i = 0
				begin
				name_text_key = (<name_text_key> + (<char_array> [<i>]))
				if ((<i> = 3) || (<i> = 7) || (<i> = 11) || (<i> = 15))
					name_text_key = (<name_text_key> + qs(0xc4992bba))
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		formattext textname = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
		edit_name_screen_id :se_setprops {
			name_text = <text>
			name_text_key = <name_text_key>
			edit_name_chars_left_text = <char_limit_text>
			edit_name_chars_left_rgba = gh6_gold
			name_dims = (0.0, 40.0)
			name_letter_alpha = 1
		}
	endif
endscript

script ui_import_edit_name_backspace_spawned 
	requireparams \{[
			char_limit
			device_num
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	wait \{0.1
		seconds}
	if screenelementexists \{id = edit_name_screen_id}
		button_to_check = square
		if isps3
			button_to_check = triangle
		endif
		begin
		if controllerpressed <button_to_check> <device_num>
			if (($edit_name_allow_backspace) = 1)
				ui_import_edit_name_backspace char_limit = <char_limit>
				wait \{0.2
					seconds}
			else
				wait \{1
					gameframe}
			endif
		else
			if (($edit_name_allow_backspace) = 0)
				change \{edit_name_allow_backspace = 1}
			endif
			wait \{1
				gameframe}
		endif
		repeat
	endif
endscript

script ui_import_edit_name_finish 
	if screenelementexists \{id = edit_name_screen_id}
		launchevent \{type = unfocus
			target = edit_name_screen_id}
		name_text = qs(0x03ac90f0)
		edit_name_screen_id :se_getprops
		edit_name_screen_id :getsingletag \{accept_script}
		edit_name_screen_id :getsingletag \{accept_params}
		edit_name_screen_id :getsingletag \{exclusive_device}
		stringtochararray string = <name_text>
		if gotparam \{char_array}
			getarraysize <char_array>
			if NOT cd
				if (<array_size> = 0)
					<accept_script> text = <name_text> exclusive_device = <exclusive_device> <accept_params>
					return
				endif
			endif
			if (<array_size> < 20)
				formattext \{textname = empty_name_error
					qs(0x52b16f6e)}
				edit_name_screen_id :se_setprops {
					edit_name_chars_left_text = <empty_name_error>
					edit_name_chars_left_rgba = red_md
				}
				ui_sfx \{menustate = generic
					uitype = scrollendwarning}
				launchevent \{type = focus
					target = edit_name_screen_id}
				return
			endif
		endif
		if gotparam \{accept_script}
			<accept_script> text = <name_text> exclusive_device = <exclusive_device> <accept_params>
		else
			ui_sfx \{menustate = generic
				uitype = select}
			generic_event_back data = {text = <name_text>}
		endif
	endif
endscript
