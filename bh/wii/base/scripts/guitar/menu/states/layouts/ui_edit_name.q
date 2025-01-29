name_entry_upper_characters = qs(0x443718d0)
name_entry_lower_characters = qs(0xc808df1b)
name_entry_space_character = qs(0x713755f7)
name_entry_underscore_character = qs(0xd99030ce)
name_entry_number_characters = qs(0xae9f5865)
name_entry_misc_characters = qs(0x2fcd14eb)
name_entry_foreign_characters = qs(0x92b1ad75)
edit_name_allow_accept = 0
edit_name_allow_backspace = 0

script ui_create_edit_name \{allowed_sets = [
			upper
			space
			lower
			number
			Misc
			foreign
		]
		Pos = (0.0, 0.0)
		parent = root_window}
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
	if GotParam \{0x2f77bae0}
		tags = {
			text_case = upper
			letter_index = 0
			upper_characters = ($name_entry_upper_characters)
			lower_characters = ($name_entry_lower_characters)
			space_character = ($name_entry_underscore_character)
			number_characters = ($name_entry_number_characters)
			misc_characters = ($name_entry_misc_characters)
			foreign_characters = ($name_entry_foreign_characters)
			allowed_sets = <allowed_sets>
		}
	else
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
	endif
	formatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_Size>) y = <char_limit>
	if freestyle_is_active
		CreateScreenElement {
			parent = <parent>
			id = edit_name_screen_id
			Type = descinterface
			desc = 'edit_name'
			just = [center , center]
			Pos = <Pos>
			name_text = <default_name>
			edit_name_chars_left_text = <char_limit_text>
			edit_name_chars_left_rgba = gh51_blue_lt
			edit_name_title_text = <title>
			tags = <tags>
			z_priority = 30
		}
	else
		CreateScreenElement {
			parent = <parent>
			id = edit_name_screen_id
			Type = descinterface
			desc = 'edit_name'
			just = [center , center]
			name_text = <default_name>
			edit_name_chars_left_text = <char_limit_text>
			edit_name_title_text = <title>
			tags = <tags>
			z_priority = 30
		}
	endif
	if freestyle_is_active
		ResolveScreenElementID \{id = {
				edit_name_screen_id
				child = {
					0
					child = 0
				}
			}}
		<resolved_id> :se_setprops alpha = 0
		ResolveScreenElementID \{id = {
				edit_name_screen_id
				child = {
					0
					child = 1
				}
			}}
		<resolved_id> :se_setprops alpha = 0
		edit_name_screen_id :se_setprops \{name_letter_container_alpha = 0}
		edit_name_screen_id :desc_resolvealias \{Name = alias_diamondbling}
		<resolved_id> :se_setprops alpha = 0
		edit_name_screen_id :desc_resolvealias \{Name = alias_diamondbling2}
		<resolved_id> :se_setprops alpha = 0
		ResolveScreenElementID \{id = {
				edit_name_screen_id
				child = {
					0
					child = {
						3
						child = 2
					}
				}
			}}
		<resolved_id> :se_getprops Pos
		Pos = (<Pos> + (0.0, -16.0))
		<resolved_id> :se_setprops Pos = <Pos>
	endif
	if NOT freestyle_is_active
		if edit_name_screen_id :desc_resolvealias \{Name = 0x10aeb4b2}
			if ScreenElementExists \{id = edit_name_screen_id}
				<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 5 0x3af134dc = 5 start_dims = (20.0, 20.0)}
			endif
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = 0xa02563d1}
			if ScreenElementExists \{id = edit_name_screen_id}
				<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
			endif
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = 0x5f448112}
			if ScreenElementExists \{id = edit_name_screen_id}
				<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
			endif
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = 0x219b1158}
			if ScreenElementExists \{id = edit_name_screen_id}
				<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 5 start_dims = (20.0, 20.0)}
			endif
		else
			ScriptAssert \{'UI_art'}
		endif
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
	if NOT freestyle_is_active
		if edit_name_screen_id :desc_resolvealias \{Name = alias_diamondbling
				param = diamondbling_id}
			<diamondbling_id> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = alias_diamondbling2
				param = diamondbling_id2}
			<diamondbling_id2> :obj_spawnscript 0x01315b7f params = {minwidth = 100 maxwidth = 500 maxtime = 0.5}
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = alias_highlight_01
				param = highlight_id}
			<highlight_id> :obj_spawnscript 0x00e3a9a7
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = 0xf7ea3f38
				param = 0x5cb15552}
			<0x5cb15552> :obj_spawnscript 0x00e3a9a7
		else
			ScriptAssert \{'UI_art'}
		endif
		if edit_name_screen_id :desc_resolvealias \{Name = 0x5e3c214b
				param = 0xb1f7cbcc}
			<0xb1f7cbcc> :obj_spawnscript 0x00e3a9a7
		else
			ScriptAssert \{'UI_art'}
		endif
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
		if ((<base_name> = 'edit_name') || (0x1469760b))
			edit_name_screen_id :Obj_SpawnScriptLater ui_edit_name_backspace_spawned params = {char_limit = <char_limit> device_num = <device_num>}
			edit_name_screen_id :Obj_SpawnScriptLater ui_edit_name_enter_character_spawned params = {char_limit = <char_limit> device_num = <device_num>}
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
			add_gamertag_helper exclusive_device = <show_gamertag>
		endif
		if freestyle_is_active
			LaunchEvent \{Type = focus
				target = edit_name_screen_id}
			freestyle_update_save_song_button_helpers
		else
			add_user_control_helper \{text = qs(0xc224796c)
				button = green
				z = 100000}
			if hascompletedonlinesetup
				add_user_control_helper \{text = qs(0xf7723015)
					button = red
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0xe3576d13)
				button = blue
				z = 100000}
			add_user_control_helper \{text = qs(0x2847496f)
				button = yellow
				z = 100000}
			add_user_control_helper \{text = qs(0x3fc1c076)
				button = start
				z = 100000}
		endif
	endif
endscript

script ui_edit_name_enter_character 
	RequireParams \{[
			char_limit
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :se_getprops
	StringToCharArray string = <name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		if (<array_Size> < <char_limit>)
			<name_text> = (<name_text> + <name_letter_text>)
			StringToCharArray string = <name_text>
			array_Size = 0
			if GotParam \{char_array}
				GetArraySize <char_array>
			endif
			formatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_Size>) y = <char_limit>
			SoundEvent \{event = enter_band_name_select}
			if freestyle_is_active
				edit_name_screen_id :se_setprops {
					name_text = <name_text>
					edit_name_chars_left_text = <char_limit_text>
					edit_name_chars_left_rgba = gh51_blue_lt
				}
			else
				edit_name_screen_id :se_setprops {
					name_text = <name_text>
					edit_name_chars_left_text = <char_limit_text>
					edit_name_chars_left_rgba = 0x77457656
				}
			endif
			if (<array_Size> = <char_limit>)
				edit_name_screen_id :se_setprops \{name_letter_alpha = 0}
			endif
		else
			menu_scroll_end_sound
		endif
	endif
	if freestyle_is_active
		freestyle_update_save_song_button_helpers
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
	Wait \{0.1
		Seconds}
	if ScreenElementExists \{id = edit_name_screen_id}
		GetEnterButtonAssignment
		begin
		if ControllerPressed <assignment> <device_num>
			if (($edit_name_allow_accept) = 1)
				ui_edit_name_enter_character char_limit = <char_limit>
				Wait \{0.2
					Seconds}
			else
				Wait \{1
					gameframe}
			endif
		else
			if (($edit_name_allow_accept) = 0)
				Change \{edit_name_allow_accept = 1}
			endif
			Wait \{1
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
		LaunchEvent \{Type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :GetSingleTag \{cancel_script}
		if GotParam \{cancel_script}
			edit_name_screen_id :GetSingleTag \{exclusive_device}
			<cancel_script> exclusive_device = <exclusive_device>
		else
			edit_name_screen_id :se_setprops name_text = <name_text>
			generic_event_back
		endif
		if freestyle_is_active
			freestyle_update_save_song_button_helpers
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
	edit_name_screen_id :se_getprops
	StringToCharArray string = <name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		text = qs(0x03ac90f0)
		if (<array_Size> > 1)
			i = 0
			begin
			text = (<text> + (<char_array> [<i>]))
			i = (<i> + 1)
			repeat (<array_Size> - 1)
			SoundEvent \{event = enter_band_name_back}
		elseif (<array_Size> = 1)
			SoundEvent \{event = enter_band_name_back}
		else
			menu_scroll_end_sound
		endif
		StringToCharArray string = <text>
		array_Size = 0
		if GotParam \{char_array}
			GetArraySize <char_array>
		endif
		formatText TextName = char_limit_text qs(0xeff4fe29) n = (<char_limit> - <array_Size>) y = <char_limit>
		if NOT freestyle_is_active
			edit_name_screen_id :se_setprops {
				name_text = <text>
				edit_name_chars_left_text = <char_limit_text>
				edit_name_chars_left_rgba = 0x77457656
				name_dims = (0.0, 40.0)
				name_letter_alpha = 1
			}
		else
			edit_name_screen_id :se_setprops {
				name_text = <text>
				edit_name_chars_left_text = <char_limit_text>
				edit_name_chars_left_rgba = gh51_blue_lt
				name_dims = (0.0, 40.0)
				name_letter_alpha = 1
			}
		endif
	endif
	if freestyle_is_active
		freestyle_update_save_song_button_helpers
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
	Wait \{0.1
		Seconds}
	if ScreenElementExists \{id = edit_name_screen_id}
		button_to_check = Square
		if isps3
			button_to_check = Triangle
		endif
		begin
		if ControllerPressed <button_to_check> <device_num>
			if (($edit_name_allow_backspace) = 1)
				ui_edit_name_backspace char_limit = <char_limit>
				Wait \{0.2
					Seconds}
			else
				Wait \{1
					gameframe}
			endif
		else
			if (($edit_name_allow_backspace) = 0)
				Change \{edit_name_allow_backspace = 1}
			endif
			Wait \{1
				gameframe}
		endif
		repeat
	endif
endscript

script ui_edit_name_toggle_case 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	edit_name_screen_id :GetTags
	edit_name_screen_id :se_getprops
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
	SoundEvent \{event = enter_band_name_caps}
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
			SoundEvent \{event = enter_band_name_scroll_up}
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
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_up_arrow}
		else
			SoundEvent \{event = enter_band_name_scroll_down}
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
			edit_name_screen_id :obj_spawnscript \{ui_edit_name_scale_down_arrow}
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

script ui_edit_name_finish 
	if ScreenElementExists \{id = edit_name_screen_id}
		LaunchEvent \{Type = unfocus
			target = edit_name_screen_id}
		edit_name_screen_id :se_getprops
		if freestyle_is_active
			freestyle_update_save_song_button_helpers
		endif
		edit_name_screen_id :GetSingleTag \{accept_script}
		edit_name_screen_id :GetSingleTag \{accept_params}
		edit_name_screen_id :GetSingleTag \{exclusive_device}
		StringToCharArray string = <name_text>
		array_Size = 0
		if GotParam \{char_array}
			GetArraySize <char_array>
			if (<array_Size> > 0)
				i = 0
				begin
				if NOT (<char_array> [<i>] = qs(0x2ba2c9a2))
					break
				endif
				i = (<i> + 1)
				repeat <array_Size>
				if (<i> = <array_Size>)
					array_Size = 0
				endif
			endif
		endif
		if (<array_Size> = 0)
			formatText \{TextName = empty_name_error
				qs(0x3319b8cb)}
			edit_name_screen_id :se_setprops {
				edit_name_chars_left_text = <empty_name_error>
				edit_name_chars_left_rgba = red_md
			}
			menu_scroll_end_sound
			LaunchEvent \{Type = focus
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
