edit_name_allow_accept = 0
edit_name_allow_backspace = 0

script ui_create_edit_name {
		desc = 'edit_name'
		is_censored = 0
		z_priority = 30
		allowed_sets = [upper lower space number Misc foreign]
		upper_characters = ($name_entry_upper_characters)
		lower_characters = ($name_entry_lower_characters)
		space_character = ($name_entry_space_character)
		number_characters = ($name_entry_number_characters)
		misc_characters = ($name_entry_misc_characters)
		foreign_characters = ($name_entry_foreign_characters)
	}
	RequireParams \{[
			default_name
			char_limit
			title
			device_num
		]
		all}
	clean_up_user_control_helpers
	StringToCharArray string = <default_name>
	array_Size = 0
	if GotParam \{char_array}
		GetArraySize <char_array>
	endif
	<name_text> = <default_name>
	if (<is_censored> = 1)
		get_censored_text text = <name_text>
		<name_text> = <censored_text>
	endif
	formatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_Size>) y = <char_limit>
	CreateScreenElement {
		parent = root_window
		id = edit_name_screen_id
		Type = descinterface
		desc = <desc>
		pos_anchor = [center , center]
		just = [center , center]
		Pos = (0.0, 0.0)
		name_text = <name_text>
		edit_name_chars_left_text = <char_limit_text>
		edit_name_chars_left_rgba = black
		edit_name_title_text = <title>
		tags = {
			text_case = upper
			letter_index = 0
			upper_characters = <upper_characters>
			lower_characters = <lower_characters>
			space_character = <space_character>
			number_characters = <number_characters>
			misc_characters = <misc_characters>
			foreign_characters = <foreign_characters>
			allowed_sets = <allowed_sets>
		}
		z_priority = <z_priority>
	}
	if GotParam \{accept_script}
		edit_name_screen_id :SetTags {
			accept_script = <accept_script>
			accept_params = <accept_params>
		}
	endif
	if GotParam \{cancel_script}
		edit_name_screen_id :SetTags cancel_script = <cancel_script>
	endif
	edit_name_screen_id :SetTags {exclusive_device = <device_num> name_text_tag = <default_name> is_censored = <is_censored>}
	edit_name_setup_handler_scripts_and_pills default_name = <default_name> char_limit = <char_limit> device_num = <device_num> show_gamertag = <show_gamertag>
	AssignAlias \{id = edit_name_screen_id
		alias = edit_name_menu}
	if edit_name_screen_id :desc_resolvealias \{Name = alias_highlight_01
			param = highlight_01_id}
		<highlight_01_id> :obj_spawnscript ui_band_lobby_pulse
	else
	endif
	if edit_name_screen_id :desc_resolvealias \{Name = alias_name_letter
			param = name_letter_id}
		<name_letter_id> :obj_spawnscript ui_band_lobby_pulse
	else
	endif
endscript

script ui_destroy_edit_name 
	Change \{edit_name_allow_accept = 0}
	Change \{edit_name_allow_backspace = 0}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = edit_name_screen_id}
		DestroyScreenElement \{id = edit_name_screen_id}
	endif
endscript

script edit_name_setup_handler_scripts_and_pills 
	RequireParams \{[
			default_name
			char_limit
			device_num
		]
		all}
	if ScreenElementExists \{id = edit_name_screen_id}
		<event_handlers> = [
			{pad_back ui_edit_name_cancel_name params = {name_text = <default_name>}}
			{pad_option2 ui_edit_name_toggle_case}
			{pad_up ui_edit_name_scroll_char params = {up char_limit = <char_limit>}}
			{pad_down ui_edit_name_scroll_char params = {down char_limit = <char_limit>}}
			{pad_start ui_edit_name_finish}
		]
		ui_event_get_top
		if (<base_name> = 'edit_name')
			AddArrayElement array = <event_handlers> element = {pad_choose ui_edit_name_enter_character params = {char_limit = <char_limit>}}
			AddArrayElement array = <array> element = {pad_option ui_edit_name_backspace params = {char_limit = <char_limit>}}
			<event_handlers> = <array>
		else
			AddArrayElement array = <event_handlers> element = {keyboard_enter ui_import_edit_name_enter_pressed params = {char_limit = <char_limit>}}
			AddArrayElement array = <array> element = {keyboard_backspace ui_import_edit_name_backspace params = {char_limit = <char_limit>}}
			AddArrayElement array = <array> element = {keyboard_keypress ui_import_edit_name_enter_character params = {char_limit = <char_limit>}}
			<event_handlers> = <array>
		endif
		edit_name_screen_id :GetSingleTag \{exclusive_device}
		if NOT GotParam \{exclusive_device}
			<exclusive_device> = ($primary_controller)
		endif
		edit_name_screen_id :se_setprops {
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_device>
			replace_handlers
		}
		if GotParam \{show_gamertag}
			edit_name_setup_helper_pills show_gamertag = <show_gamertag>
		else
			edit_name_setup_helper_pills
		endif
	endif
endscript

script edit_name_setup_helper_pills 
	if GotParam \{show_gamertag}
		add_gamertag_helper exclusive_device = <show_gamertag>
	endif
	add_user_control_helper text = qs(0x43f2255e) button = green z = 100000 controller = <exclusive_device>
	add_user_control_helper text = qs(0xf7723015) button = red z = 100000 controller = <exclusive_device>
	add_user_control_helper text = qs(0x71449adf) button = yellow z = 100000 controller = <exclusive_device>
	add_user_control_helper text = qs(0xe3576d13) button = blue z = 100000 controller = <exclusive_device>
	add_user_control_helper text = qs(0x3fc1c076) button = start z = 100000 controller = <exclusive_device>
endscript

script ui_edit_name_cancel_name 
	RequireParams \{[
			name_text
		]
		all}
	if ScreenElementExists \{id = edit_name_screen_id}
		LaunchEvent \{Type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :GetSingleTag \{cancel_script}
		if GotParam \{cancel_script}
			edit_name_screen_id :GetSingleTag \{exclusive_device}
			<cancel_script> exclusive_device = <exclusive_device>
		else
			ui_sfx \{menustate = Generic
				uitype = select}
			edit_name_screen_id :se_setprops name_text = <name_text>
			generic_event_back
		endif
	endif
endscript

script ui_edit_name_toggle_case 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :GetTags
	edit_name_screen_id :se_getprops
	if (<name_letter_alpha> = 0)
		ui_sfx \{menustate = Generic
			uitype = scrollendwarning}
		return
	endif
	GetArraySize <allowed_sets>
	i = 0
	begin
	i = (<i> + 1)
	if (<text_case> = (<allowed_sets> [(<i> - 1)]))
		break
	endif
	repeat <array_Size>
	if (<i> = <array_Size>)
		i = 0
	endif
	switch (<allowed_sets> [<i>])
		case upper
		edit_name_screen_id :SetTags \{text_case = upper}
		StringToCharArray string = <upper_characters>
		name_letter_text = (<char_array> [<letter_index>])
		case lower
		edit_name_screen_id :SetTags \{text_case = lower}
		StringToCharArray string = <lower_characters>
		name_letter_text = (<char_array> [<letter_index>])
		case space
		edit_name_screen_id :SetTags \{text_case = space}
		StringToCharArray string = <space_character>
		name_letter_text = (<char_array> [0])
		case number
		edit_name_screen_id :SetTags \{text_case = number}
		StringToCharArray string = <number_characters>
		name_letter_text = (<char_array> [0])
		case Misc
		edit_name_screen_id :SetTags \{text_case = Misc}
		StringToCharArray string = <misc_characters>
		name_letter_text = (<char_array> [0])
		case foreign
		edit_name_screen_id :SetTags \{text_case = foreign}
		StringToCharArray string = <foreign_characters>
		name_letter_text = (<char_array> [0])
	endswitch
	SoundEvent \{event = audio_ui_text_entry_caps}
	edit_name_screen_id :se_setprops name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scroll_char 
	RequireParams \{[
			char_limit
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_getprops
	edit_name_screen_id :GetTags
	<name_text> = <name_text_tag>
	switch (<text_case>)
		case upper
		StringToCharArray string = <upper_characters>
		case lower
		StringToCharArray string = <lower_characters>
		case space
		StringToCharArray string = <space_character>
		case number
		StringToCharArray string = <number_characters>
		case Misc
		StringToCharArray string = <misc_characters>
		case foreign
		StringToCharArray string = <foreign_characters>
	endswitch
	char_set_array = <char_array>
	GetArraySize <allowed_sets>
	allowed_sets_size = <array_Size>
	if GotParam \{char_set_array}
		GetArraySize <char_set_array>
		char_array_size = <array_Size>
		StringToCharArray string = <name_text>
		GetArraySize <char_array>
		name_text_size = <array_Size>
		if (<name_text_size> >= <char_limit>)
			ui_sfx \{menustate = Generic
				uitype = scrollendwarning}
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
		if GotParam \{down}
			SoundEvent \{event = audio_ui_text_entry_scroll_down}
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
					edit_name_screen_id :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					edit_name_screen_id :SetTags \{letter_index = 0}
					case lower
					edit_name_screen_id :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					edit_name_screen_id :SetTags \{letter_index = 0}
					case space
					edit_name_screen_id :SetTags \{text_case = space}
					StringToCharArray string = <space_character>
					case number
					edit_name_screen_id :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
					case Misc
					edit_name_screen_id :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
					case foreign
					edit_name_screen_id :SetTags \{text_case = foreign}
					StringToCharArray string = <foreign_characters>
				endswitch
				name_letter_text = (<char_array> [0])
			else
				name_letter_text = (<char_set_array> [(<i> + 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :SetTags letter_index = (<i> + 1)
				endif
			endif
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_down_arrow}
		else
			SoundEvent \{event = audio_ui_text_entry_scroll_up}
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
					edit_name_screen_id :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					case lower
					edit_name_screen_id :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					case space
					edit_name_screen_id :SetTags \{text_case = space}
					StringToCharArray string = <space_character>
					case number
					edit_name_screen_id :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
					case Misc
					edit_name_screen_id :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
					case foreign
					edit_name_screen_id :SetTags \{text_case = foreign}
					StringToCharArray string = <foreign_characters>
				endswitch
				GetArraySize <char_array>
				name_letter_text = (<char_array> [(<array_Size> - 1)])
				edit_name_screen_id :GetSingleTag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :SetTags letter_index = (<array_Size> - 1)
				endif
			else
				name_letter_text = (<char_set_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :SetTags letter_index = (<i> - 1)
				endif
			endif
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_up_arrow}
		endif
	endif
	edit_name_screen_id :se_setprops name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scale_up_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	edit_name_screen_id :se_setprops \{letter_arrow_up_scale = 1.25
		time = 0.1}
	Wait \{0.1
		Seconds}
	edit_name_screen_id :se_setprops \{letter_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_edit_name_scale_down_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	edit_name_screen_id :se_setprops \{letter_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	Wait \{0.1
		Seconds}
	edit_name_screen_id :se_setprops \{letter_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript
