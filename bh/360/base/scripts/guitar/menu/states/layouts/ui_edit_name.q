edit_name_allow_accept = 0
edit_name_allow_backspace = 0

script ui_create_edit_name \{allowed_sets = [
			upper
			space
			lower
			number
			MISC
			foreign
		]
		desc = 'edit_name'}
	RequireParams \{[
			default_name
			char_limit
			Title
			device_num
		]
		all}
	clean_up_user_control_helpers
	StringToCharArray string = <default_name>
	array_size = 0
	if GotParam \{char_array}
		GetArraySize <char_array>
	endif
	FormatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
	CreateScreenElement {
		parent = root_window
		id = edit_name_screen_id
		type = DescInterface
		desc = <desc>
		pos_anchor = [center , center]
		just = [center , center]
		Pos = (0.0, 0.0)
		name_text = <default_name>
		edit_name_chars_left_text = <char_limit_text>
		edit_name_chars_left_rgba = GH51_purple_md
		edit_name_title_text = <Title>
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
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_top_emit1}
		if ScreenElementExists \{id = edit_name_screen_id}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 5 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_right_emit1}
		if ScreenElementExists \{id = edit_name_screen_id}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_bottom_emit1}
		if ScreenElementExists \{id = edit_name_screen_id}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_left_emit1}
		if ScreenElementExists \{id = edit_name_screen_id}
			<resolved_id> :Obj_SpawnScript ui_anim_carbonate params = {max_interval = 1 float_time = 5 start_dims = (20.0, 20.0)}
		endif
	else
	endif
	if GotParam \{accept_script}
		edit_name_screen_id :SetTags {
			accept_script = <accept_script>
			accept_params = <accept_params>
		}
	endif
	if GotParam \{cancel_script}
		edit_name_screen_id :SetTags cancel_script = <cancel_script>
	endif
	edit_name_screen_id :SetTags exclusive_device = <device_num>
	edit_name_setup_handler_scripts_and_pills default_name = <default_name> char_limit = <char_limit> device_num = <device_num> show_gamertag = <show_gamertag>
	AssignAlias \{id = edit_name_screen_id
		alias = edit_name_menu}
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_diamondBling
			param = diamondBling_id}
		<diamondBling_id> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_diamondBling2
			param = diamondbling_id2}
		<diamondbling_id2> :Obj_SpawnScript anim_bling_horizontal_sm params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_highlight_01
			param = highlight_id}
		<highlight_id> :Obj_SpawnScript ui_blink_more
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_letter_arrow_up
			param = letter_arrow_up_id}
		<letter_arrow_up_id> :Obj_SpawnScript ui_blink_more
	else
	endif
	if edit_name_screen_id :Desc_ResolveAlias \{name = alias_letter_arrow_dn
			param = letter_arrow_dn_id}
		<letter_arrow_dn_id> :Obj_SpawnScript ui_blink_more
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
		event_handlers = [
			{pad_back ui_edit_name_cancel_name params = {name_text = <default_name>}}
			{pad_option2 ui_edit_name_toggle_case}
			{pad_up ui_edit_name_scroll_char params = {up char_limit = <char_limit>}}
			{pad_down ui_edit_name_scroll_char params = {down char_limit = <char_limit>}}
			{pad_start ui_edit_name_finish}
		]
		ui_event_get_top
		if (<base_name> = 'edit_name')
			edit_name_screen_id :Obj_SpawnScriptLater ui_edit_name_backspace_spawned params = {char_limit = <char_limit> device_num = <device_num>}
			edit_name_screen_id :Obj_SpawnScriptLater ui_edit_name_enter_character_spawned params = {char_limit = <char_limit> device_num = <device_num>}
		endif
		edit_name_screen_id :GetSingleTag \{exclusive_device}
		if NOT GotParam \{exclusive_device}
			<exclusive_device> = ($primary_controller)
		endif
		edit_name_screen_id :SE_SetProps {
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_device>
			replace_handlers
		}
		if GotParam \{show_gamertag}
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
	RequireParams \{[
			char_limit
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :SE_GetProps
	StringToCharArray string = <name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		if (<array_size> < <char_limit>)
			<name_text> = (<name_text> + <name_letter_text>)
			StringToCharArray string = <name_text>
			array_size = 0
			if GotParam \{char_array}
				GetArraySize <char_array>
			endif
			FormatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
			SoundEvent \{event = Enter_Band_Name_Select}
			edit_name_screen_id :SE_SetProps {
				name_text = <name_text>
				edit_name_chars_left_text = <char_limit_text>
				edit_name_chars_left_rgba = GH51_purple_md
			}
			if (<array_size> = <char_limit>)
				edit_name_screen_id :SE_SetProps \{name_letter_alpha = 0}
			endif
		else
			menu_scroll_end_sound
		endif
	endif
endscript

script ui_edit_name_enter_character_spawned 
	RequireParams \{[
			char_limit
			device_num
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	wait \{0.1
		seconds}
	if ScreenElementExists \{id = edit_name_screen_id}
		GetEnterButtonAssignment
		begin
		if ControllerPressed <assignment> <device_num>
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
				Change \{edit_name_allow_accept = 1}
			endif
			wait \{1
				gameframe}
		endif
		repeat
	endif
endscript

script ui_edit_name_cancel_name 
	RequireParams \{[
			name_text
		]
		all}
	if ScreenElementExists \{id = edit_name_screen_id}
		LaunchEvent \{type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :GetSingleTag \{cancel_script}
		if GotParam \{cancel_script}
			edit_name_screen_id :GetSingleTag \{exclusive_device}
			<cancel_script> exclusive_device = <exclusive_device>
		else
			edit_name_screen_id :SE_SetProps name_text = <name_text>
			generic_event_back
		endif
	endif
endscript

script ui_edit_name_backspace 
	RequireParams \{[
			char_limit
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :SE_GetProps
	StringToCharArray string = <name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		text = qs(0x03ac90f0)
		if (<array_size> > 1)
			i = 0
			begin
			text = (<text> + (<char_array> [<i>]))
			i = (<i> + 1)
			repeat (<array_size> - 1)
			SoundEvent \{event = Enter_Band_Name_Back}
		elseif (<array_size> = 1)
			SoundEvent \{event = Enter_Band_Name_Back}
		else
			menu_scroll_end_sound
		endif
		StringToCharArray string = <text>
		array_size = 0
		if GotParam \{char_array}
			GetArraySize <char_array>
		endif
		FormatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_size>) y = <char_limit>
		edit_name_screen_id :SE_SetProps {
			name_text = <text>
			edit_name_chars_left_text = <char_limit_text>
			edit_name_chars_left_rgba = GH51_purple_md
			name_dims = (0.0, 40.0)
			name_letter_alpha = 1
		}
	endif
endscript

script ui_edit_name_backspace_spawned 
	RequireParams \{[
			char_limit
			device_num
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	wait \{0.1
		seconds}
	if ScreenElementExists \{id = edit_name_screen_id}
		button_to_check = square
		if IsPS3
			button_to_check = triangle
		endif
		begin
		if ControllerPressed <button_to_check> <device_num>
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
				Change \{edit_name_allow_backspace = 1}
			endif
			wait \{1
				gameframe}
		endif
		repeat
	endif
endscript

script ui_edit_name_toggle_case 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :GetTags
	edit_name_screen_id :SE_GetProps
	if (<name_letter_alpha> = 0)
		menu_scroll_end_sound
		return
	endif
	GetArraySize <allowed_sets>
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
		case MISC
		edit_name_screen_id :SetTags \{text_case = MISC}
		StringToCharArray string = <misc_characters>
		name_letter_text = (<char_array> [0])
		case foreign
		edit_name_screen_id :SetTags \{text_case = foreign}
		StringToCharArray string = <foreign_characters>
		name_letter_text = (<char_array> [0])
	endswitch
	SoundEvent \{event = Enter_Band_Name_Caps}
	edit_name_screen_id :SE_SetProps name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scroll_char 
	RequireParams \{[
			char_limit
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :SE_GetProps
	edit_name_screen_id :GetTags
	switch (<text_case>)
		case upper
		StringToCharArray string = <upper_characters>
		case lower
		StringToCharArray string = <lower_characters>
		case space
		StringToCharArray string = <space_character>
		case number
		StringToCharArray string = <number_characters>
		case MISC
		StringToCharArray string = <misc_characters>
		case foreign
		StringToCharArray string = <foreign_characters>
	endswitch
	char_set_array = <char_array>
	GetArraySize <allowed_sets>
	allowed_sets_size = <array_size>
	if GotParam \{char_set_array}
		GetArraySize <char_set_array>
		char_array_size = <array_size>
		StringToCharArray string = <name_text>
		GetArraySize <char_array>
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
		if GotParam \{down}
			SoundEvent \{event = Enter_Band_Name_Scroll_Up}
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
					case MISC
					edit_name_screen_id :SetTags \{text_case = MISC}
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
			edit_name_screen_id :Obj_SpawnScript \{ui_edit_name_scale_up_arrow}
		else
			SoundEvent \{event = Enter_Band_Name_Scroll_Down}
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
					case MISC
					edit_name_screen_id :SetTags \{text_case = MISC}
					StringToCharArray string = <misc_characters>
					case foreign
					edit_name_screen_id :SetTags \{text_case = foreign}
					StringToCharArray string = <foreign_characters>
				endswitch
				GetArraySize <char_array>
				name_letter_text = (<char_array> [(<array_size> - 1)])
				edit_name_screen_id :GetSingleTag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :SetTags letter_index = (<array_size> - 1)
				endif
			else
				name_letter_text = (<char_set_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					edit_name_screen_id :SetTags letter_index = (<i> - 1)
				endif
			endif
			edit_name_screen_id :Obj_SpawnScript \{ui_edit_name_scale_down_arrow}
		endif
	endif
	edit_name_screen_id :SE_SetProps name_letter_text = <name_letter_text>
endscript

script ui_edit_name_scale_up_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	edit_name_screen_id :SE_SetProps \{letter_arrow_up_scale = 1.25
		time = 0.1}
	wait \{0.1
		seconds}
	edit_name_screen_id :SE_SetProps \{letter_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_edit_name_scale_down_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	edit_name_screen_id :SE_SetProps \{letter_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	wait \{0.1
		seconds}
	edit_name_screen_id :SE_SetProps \{letter_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript

script ui_edit_name_finish 
	if ScreenElementExists \{id = edit_name_screen_id}
		LaunchEvent \{type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :SE_GetProps
		edit_name_screen_id :GetSingleTag \{accept_script}
		edit_name_screen_id :GetSingleTag \{accept_params}
		edit_name_screen_id :GetSingleTag \{exclusive_device}
		StringToCharArray string = <name_text>
		array_size = 0
		if GotParam \{char_array}
			GetArraySize <char_array>
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
			FormatText \{TextName = empty_name_error
				qs(0x3319b8cb)}
			edit_name_screen_id :SE_SetProps {
				edit_name_chars_left_text = <empty_name_error>
				edit_name_chars_left_rgba = red_md
			}
			menu_scroll_end_sound
			LaunchEvent \{type = focus
				target = edit_name_screen_id}
			return
		endif
		if GotParam \{accept_script}
			<accept_script> text = <name_text> exclusive_device = <exclusive_device> <accept_params>
		else
			generic_event_back data = {text = <name_text>}
		endif
	endif
endscript
