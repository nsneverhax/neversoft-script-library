edit_name_allow_accept = 0
edit_name_allow_backspace = 0

script ui_create_edit_name \{allowed_sets = [
			upper
			space
			lower
			number
			misc
			foreign
		]
		desc = 'edit_name'}
	requireparams \{[
			default_name
			char_limit
			title
			device_num
		]
		all}
	clean_up_user_control_helpers
	stringtochararray string = <default_name>
	array_size = 0
	if gotparam \{char_array}
		getarraysize <char_array>
	endif
	formattext textname = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
	createscreenelement {
		parent = root_window
		id = edit_name_screen_id
		type = descinterface
		desc = <desc>
		pos_anchor = [center , center]
		just = [center , center]
		pos = (0.0, 0.0)
		name_text = <default_name>
		edit_name_chars_left_text = <char_limit_text>
		edit_name_chars_left_rgba = 0x77457656
		edit_name_title_text = <title>
		tags = {
			text_case = upper
			letter_index = 0
			upper_characters = ($name_entry_upper_characters)
			lower_characters = ($name_entry_lower_characters)
			space_character = ($name_entry_space_character)
			number_characters = ($name_entry_number_characters)
			misc_characters = ($name_entry_misc_characters)
			foreign_characters = ($name_entry_foreign_characters)
			allowed_sets = <allowed_sets>
		}
		z_priority = 30
	}
	if edit_name_screen_id :desc_resolvealias \{name = 0x10aeb4b2}
		if screenelementexists \{id = edit_name_screen_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 5 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = 0xa02563d1}
		if screenelementexists \{id = edit_name_screen_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = 0x5f448112}
		if screenelementexists \{id = edit_name_screen_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = 0x219b1158}
		if screenelementexists \{id = edit_name_screen_id}
			<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if gotparam \{accept_script}
		edit_name_screen_id :settags {
			accept_script = <accept_script>
			accept_params = <accept_params>
		}
	endif
	if gotparam \{cancel_script}
		edit_name_screen_id :settags cancel_script = <cancel_script>
	endif
	edit_name_screen_id :settags exclusive_device = <device_num>
	edit_name_setup_handler_scripts_and_pills default_name = <default_name> char_limit = <char_limit> device_num = <device_num> show_gamertag = <show_gamertag>
	assignalias \{id = edit_name_screen_id
		alias = edit_name_menu}
	if edit_name_screen_id :desc_resolvealias \{name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = alias_diamondbling2
			param = diamondbling_id2}
		<diamondbling_id2> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = alias_highlight_01
			param = highlight_id}
		<highlight_id> :obj_spawnscript 0x00e3a9a7
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = 0xf7ea3f38
			param = 0x5cb15552}
		<0x5cb15552> :obj_spawnscript 0x00e3a9a7
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{name = 0x5e3c214b
			param = 0xb1f7cbcc}
		<0xb1f7cbcc> :obj_spawnscript 0x00e3a9a7
	else
	endif
endscript

script ui_destroy_edit_name 
	change \{edit_name_allow_accept = 0}
	change \{edit_name_allow_backspace = 0}
	clean_up_user_control_helpers
	if screenelementexists \{id = edit_name_screen_id}
		destroyscreenelement \{id = edit_name_screen_id}
	endif
endscript

script edit_name_setup_handler_scripts_and_pills 
	requireparams \{[
			default_name
			char_limit
			device_num
		]
		all}
	if screenelementexists \{id = edit_name_screen_id}
		event_handlers = [
			{pad_back ui_edit_name_cancel_name params = {name_text = <default_name>}}
			{pad_option2 ui_edit_name_toggle_case}
			{pad_up ui_edit_name_scroll_char params = {up char_limit = <char_limit>}}
			{pad_down ui_edit_name_scroll_char params = {down char_limit = <char_limit>}}
			{pad_start ui_edit_name_finish}
		]
		ui_event_get_top
		if (<base_name> = 'edit_name')
			edit_name_screen_id :obj_spawnscriptlater ui_edit_name_backspace_spawned params = {char_limit = <char_limit> device_num = <device_num>}
			edit_name_screen_id :obj_spawnscriptlater ui_edit_name_enter_character_spawned params = {char_limit = <char_limit> device_num = <device_num>}
		endif
		edit_name_screen_id :getsingletag \{exclusive_device}
		if NOT gotparam \{exclusive_device}
			<exclusive_device> = ($primary_controller)
		endif
		edit_name_screen_id :se_setprops {
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_device>
			replace_handlers
		}
		if gotparam \{show_gamertag}
			add_gamertag_helper exclusive_device = <show_gamertag>
		endif
		add_user_control_helper text = qs(0xc224796c) button = green z = 100000 controller = <exclusive_device>
		add_user_control_helper text = qs(0xf7723015) button = red z = 100000 controller = <exclusive_device>
		add_user_control_helper text = qs(0x2847496f) button = yellow z = 100000 controller = <exclusive_device>
		add_user_control_helper text = qs(0xe3576d13) button = blue z = 100000 controller = <exclusive_device>
		add_user_control_helper text = qs(0x3fc1c076) button = start z = 100000 controller = <exclusive_device>
	endif
endscript

script ui_edit_name_enter_character 
	requireparams \{[
			char_limit
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_getprops
	stringtochararray string = <name_text>
	if gotparam \{char_array}
		getarraysize <char_array>
		if (<array_size> < <char_limit>)
			<name_text> = (<name_text> + <name_letter_text>)
			stringtochararray string = <name_text>
			array_size = 0
			if gotparam \{char_array}
				getarraysize <char_array>
			endif
			formattext textname = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
			soundevent \{event = enter_band_name_select}
			edit_name_screen_id :se_setprops {
				name_text = <name_text>
				edit_name_chars_left_text = <char_limit_text>
				edit_name_chars_left_rgba = 0x77457656
			}
			if (<array_size> = <char_limit>)
				edit_name_screen_id :se_setprops \{name_letter_alpha = 0}
			endif
		else
			menu_scroll_end_sound
		endif
	endif
endscript

script ui_edit_name_enter_character_spawned 
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
				ui_edit_name_enter_character char_limit = <char_limit>
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

script ui_edit_name_cancel_name 
	requireparams \{[
			name_text
		]
		all}
	if screenelementexists \{id = edit_name_screen_id}
		launchevent \{type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :getsingletag \{cancel_script}
		if gotparam \{cancel_script}
			edit_name_screen_id :getsingletag \{exclusive_device}
			<cancel_script> exclusive_device = <exclusive_device>
		else
			edit_name_screen_id :se_setprops name_text = <name_text>
			generic_event_back
		endif
	endif
endscript

script ui_edit_name_backspace 
	requireparams \{[
			char_limit
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
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
			soundevent \{event = enter_band_name_back}
		elseif (<array_size> = 1)
			soundevent \{event = enter_band_name_back}
		else
			menu_scroll_end_sound
		endif
		stringtochararray string = <text>
		array_size = 0
		if gotparam \{char_array}
			getarraysize <char_array>
		endif
		formattext textname = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
		edit_name_screen_id :se_setprops {
			name_text = <text>
			edit_name_chars_left_text = <char_limit_text>
			edit_name_chars_left_rgba = 0x77457656
			name_dims = (0.0, 40.0)
			name_letter_alpha = 1
		}
	endif
endscript

script ui_edit_name_backspace_spawned 
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
				ui_edit_name_backspace char_limit = <char_limit>
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

script ui_edit_name_toggle_case 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :gettags
	edit_name_screen_id :se_getprops
	if (<name_letter_alpha> = 0)
		menu_scroll_end_sound
		return
	endif
	getarraysize <allowed_sets>
	i = 0
	begin
	i = (<i> + 1)
	if (<text_case> = (<allowed_sets> [(<i> - 1)]))
		break
	endif
	repeat <array_size>
	if (<i> = <array_size>)
		i = 0
	endif
	switch (<allowed_sets> [<i>])
		case upper
		edit_name_screen_id :settags \{text_case = upper}
		stringtochararray string = <upper_characters>
		name_letter_text = (<char_array> [<letter_index>])
		case lower
		edit_name_screen_id :settags \{text_case = lower}
		stringtochararray string = <lower_characters>
		name_letter_text = (<char_array> [<letter_index>])
		case space
		edit_name_screen_id :settags \{text_case = space}
		stringtochararray string = <space_character>
		name_letter_text = (<char_array> [0])
		case number
		edit_name_screen_id :settags \{text_case = number}
		stringtochararray string = <number_characters>
		name_letter_text = (<char_array> [0])
		case misc
		edit_name_screen_id :settags \{text_case = misc}
		stringtochararray string = <misc_characters>
		name_letter_text = (<char_array> [0])
		case foreign
		edit_name_screen_id :settags \{text_case = foreign}
		stringtochararray string = <foreign_characters>
		name_letter_text = (<char_array> [0])
	endswitch
	soundevent \{event = enter_band_name_caps}
	edit_name_screen_id :se_setprops name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scroll_char 
	requireparams \{[
			char_limit
		]
		all}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_getprops
	edit_name_screen_id :gettags
	switch (<text_case>)
		case upper
		stringtochararray string = <upper_characters>
		case lower
		stringtochararray string = <lower_characters>
		case space
		stringtochararray string = <space_character>
		case number
		stringtochararray string = <number_characters>
		case misc
		stringtochararray string = <misc_characters>
		case foreign
		stringtochararray string = <foreign_characters>
	endswitch
	char_set_array = <char_array>
	getarraysize <allowed_sets>
	allowed_sets_size = <array_size>
	if gotparam \{char_set_array}
		getarraysize <char_set_array>
		char_array_size = <array_size>
		stringtochararray string = <name_text>
		getarraysize <char_array>
		name_text_size = <array_size>
		if (<name_text_size> >= <char_limit>)
			menu_scroll_end_sound
			return
		endif
		i = 0
		begin
		if (<name_letter_text> = (<char_set_array> [<i>]))
			break
		endif
		i = (<i> + 1)
		repeat <char_array_size>
		if (<i> = <char_array_size>)
			return
		endif
		if gotparam \{down}
			soundevent \{event = enter_band_name_scroll_up}
			index = 0
			begin
			index = (<index> + 1)
			if (<text_case> = (<allowed_sets> [(<index> - 1)]))
				break
			endif
			repeat <allowed_sets_size>
			if (<index> = <allowed_sets_size>)
				index = 0
			endif
			if (<i> = (<char_array_size> - 1))
				switch (<allowed_sets> [<index>])
					case upper
					edit_name_screen_id :settags \{text_case = upper}
					stringtochararray string = <upper_characters>
					edit_name_screen_id :settags \{letter_index = 0}
					case lower
					edit_name_screen_id :settags \{text_case = lower}
					stringtochararray string = <lower_characters>
					edit_name_screen_id :settags \{letter_index = 0}
					case space
					edit_name_screen_id :settags \{text_case = space}
					stringtochararray string = <space_character>
					case number
					edit_name_screen_id :settags \{text_case = number}
					stringtochararray string = <number_characters>
					case misc
					edit_name_screen_id :settags \{text_case = misc}
					stringtochararray string = <misc_characters>
					case foreign
					edit_name_screen_id :settags \{text_case = foreign}
					stringtochararray string = <foreign_characters>
				endswitch
				name_letter_text = (<char_array> [0])
			else
				name_letter_text = (<char_set_array> [(<i> + 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :settags letter_index = (<i> + 1)
				endif
			endif
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_up_arrow}
		else
			soundevent \{event = enter_band_name_scroll_down}
			index = (<allowed_sets_size> - 1)
			begin
			index = (<index> - 1)
			if (<text_case> = (<allowed_sets> [(<index> + 1)]))
				break
			endif
			repeat <allowed_sets_size>
			if (<index> < 0)
				index = (<allowed_sets_size> - 1)
			endif
			if (<i> = 0)
				switch (<allowed_sets> [<index>])
					case upper
					edit_name_screen_id :settags \{text_case = upper}
					stringtochararray string = <upper_characters>
					case lower
					edit_name_screen_id :settags \{text_case = lower}
					stringtochararray string = <lower_characters>
					case space
					edit_name_screen_id :settags \{text_case = space}
					stringtochararray string = <space_character>
					case number
					edit_name_screen_id :settags \{text_case = number}
					stringtochararray string = <number_characters>
					case misc
					edit_name_screen_id :settags \{text_case = misc}
					stringtochararray string = <misc_characters>
					case foreign
					edit_name_screen_id :settags \{text_case = foreign}
					stringtochararray string = <foreign_characters>
				endswitch
				getarraysize <char_array>
				name_letter_text = (<char_array> [(<array_size> - 1)])
				edit_name_screen_id :getsingletag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :settags letter_index = (<array_size> - 1)
				endif
			else
				name_letter_text = (<char_set_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :settags letter_index = (<i> - 1)
				endif
			endif
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_down_arrow}
		endif
	endif
	edit_name_screen_id :se_setprops name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scale_up_arrow 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	edit_name_screen_id :se_setprops \{letter_arrow_up_scale = 1.25
		time = 0.1}
	wait \{0.1
		seconds}
	edit_name_screen_id :se_setprops \{letter_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_edit_name_scale_down_arrow 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	edit_name_screen_id :se_setprops \{letter_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	wait \{0.1
		seconds}
	edit_name_screen_id :se_setprops \{letter_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript

script ui_edit_name_finish 
	if screenelementexists \{id = edit_name_screen_id}
		launchevent \{type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :se_getprops
		edit_name_screen_id :getsingletag \{accept_script}
		edit_name_screen_id :getsingletag \{accept_params}
		edit_name_screen_id :getsingletag \{exclusive_device}
		stringtochararray string = <name_text>
		array_size = 0
		if gotparam \{char_array}
			getarraysize <char_array>
			if (<array_size> > 0)
				i = 0
				begin
				if NOT (<char_array> [<i>] = qs(0x2ba2c9a2))
					break
				endif
				i = (<i> + 1)
				repeat <array_size>
				if (<i> = <array_size>)
					array_size = 0
				endif
			endif
		endif
		if (<array_size> = 0)
			formattext \{textname = empty_name_error
				qs(0x3319b8cb)}
			edit_name_screen_id :se_setprops {
				edit_name_chars_left_text = <empty_name_error>
				edit_name_chars_left_rgba = red_md
			}
			menu_scroll_end_sound
			launchevent \{type = focus
				target = edit_name_screen_id}
			return
		endif
		if gotparam \{accept_script}
			<accept_script> text = <name_text> exclusive_device = <exclusive_device> <accept_params>
		else
			generic_event_back data = {text = <name_text>}
		endif
	endif
endscript
