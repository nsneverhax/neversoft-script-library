band_name_logo_controller = 0
band_name_logo_current_name = None
store_bnl_respond_to_signin_changed = 0
store_bnl_respond_to_signin_changed_all_players = 0
store_bnl_respond_to_signin_changed_func = None
0x8f7b8538 = 20

script ui_init_band_name_logo controller = ($primary_controller)
	init_band_logo controller = <controller> no_wait
	Change \{ui_band_name_logo_current_mode = main}
	Change \{band_name_logo_current_name = None}
endscript
ui_band_name_logo_current_mode = main

script ui_create_band_name_logo controller = ($primary_controller)
	SpawnScriptLater ui_create_band_name_logo_spawned params = {<...>}
endscript

script ui_create_band_name_logo_spawned 
	cas_update_band_logo \{no_wait}
	Wait \{2
		gameframes}
	destroy_loading_screen
	Change band_name_logo_controller = <controller>
	Change menu_over_ride_exclusive_device = <controller>
	fadetoblack \{OFF
		no_wait}
	Change store_bnl_respond_to_signin_changed = ($respond_to_signin_changed)
	Change store_bnl_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
	Change store_bnl_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_all_players = 0}
	Change \{respond_to_signin_changed_func = ui_band_name_logo_signin_changed}
	if NOT ScreenElementExists \{id = bandinterface}
		name_a = qs(0xb6b0f474)
		name_b = qs(0x47055a28)
		name_c = qs(0x1764900a)
		name_d = qs(0x04edf8a4)
		name_e = qs(0x3e9520ee)
		name_f = qs(0x3a480869)
		name_g = qs(0x008f62e9)
		name_h = qs(0xd03060d4)
		name_i = qs(0xc5893874)
		name_j = qs(0x53da127b)
		random_name_tip = Random (@ <name_a> @ <name_b> @ <name_c> @ <name_d> @ <name_e> @ <name_f> @ <name_g> @ <name_h> @ <name_i> @ <name_j> )
		CreateScreenElement {
			parent = root_window
			id = bandinterface
			Type = descinterface
			desc = 'band_name'
			exclusive_device = ($band_name_logo_controller)
			just = [
				1.0
				0.62
			]
			z_priority = -20
			tags = {
				mode = main
				text_case = upper
				letter_index = 0
				upper_characters = qs(0x443718d0)
				lower_characters = qs(0xc808df1b)
				number_characters = qs(0xae9f5865)
				misc_characters = qs(0xd12b75c0)
				foreign_characters = qs(0x6f0b8b63)
				from_boot = <from_boot>
				from_save = <from_save>
				event_params = <event_params>
				random_name_tip = <random_name_tip>
			}
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <id>
			texture = ($cas_band_logo_details.textureasset)
			just = [left center]
			rgba = [255 255 255 250]
			Pos = (465.0, 245.0)
			dims = (350.0, 350.0)
			z_priority = 5
		}
	endif
	if NOT (($band_name_logo_current_name) = None)
		bandinterface :se_setprops band_name_text = ($band_name_logo_current_name)
	elseif current_band_has_band_name controller = ($band_name_logo_controller)
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info>
		bandinterface :se_setprops band_name_text = <Name> band_name_font = <font>
		Change band_name_logo_current_name = <Name>
	elseif ((GotParam from_boot) || (GotParam from_save))
		ui_band_name_logo_random_name \{no_sound}
		randomize_band_logo
	endif
	if NOT ((GotParam from_boot) || (GotParam from_save))
		bandinterface :se_setprops band_name_info_text = <random_name_tip>
	endif
	AssignAlias \{id = bandinterface
		alias = band_name_menu}
	if GotParam \{from_boot}
		ui_band_name_logo_mode \{from_boot}
	else
		ui_band_name_logo_mode
	endif
	LaunchEvent \{Type = focus
		target = bandinterface}
	if GotParam \{skip_destroy}
		ui_event_remove_params \{param = skip_destroy}
	endif
	bandinterface :se_setprops \{Pos = (640.0, 360.0)}
	if IsLoggedIn
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100000}
		0x9c89e681
		0x6b7a2fbe from_boot = <from_boot>
	endif
endscript

script ui_band_name_logo_signin_changed controller = ($primary_controller)
	printf \{qs(0xe90ca467)}
	if (($primary_controller = <controller>) ||
			($band_name_logo_controller = <controller>))
		handle_signin_changed
		return
	endif
	removecontentfiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
endscript

script ui_destroy_band_name_logo 
	clean_up_user_control_helpers
	if NOT GotParam \{skip_destroy}
		if ScreenElementExists \{id = bandinterface}
			bandinterface :GetTags
			DestroyScreenElement \{id = bandinterface}
		endif
	else
		ui_event_remove_params \{param = skip_destroy}
	endif
endscript

script ui_deinit_band_name_logo 
	Change \{cas_override_object = None}
	bandlogoobject :SwitchOffAtomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo
		no_fix_camera}
	Change \{menu_over_ride_exclusive_device = -1}
	Change \{band_name_logo_current_name = None}
	if ScreenElementExists \{id = bandinterface}
		DestroyScreenElement \{id = bandinterface}
	endif
endscript

script ui_band_name_logo_save 
	bandinterface :se_getprops
	bandinterface :GetTags
	Change ui_band_name_logo_current_mode = <mode>
	get_current_band_info
	bandname_id = <band_info>
	GetTrueStartTime
	formatText checksumName = band_unique_id 'band_info_%d' d = <starttime>
	get_savegame_from_controller controller = ($band_name_logo_controller)
	SetGlobalTags savegame = <savegame> <bandname_id> params = {Name = <band_name_text> band_unique_id = <band_unique_id> font = <band_name_font>}
	agora_update band_id = <band_unique_id> Name = <band_name_text> new_band
	cap = $edit_graphic_layer_infos
	if GotParam \{cap}
		get_current_band_info
		lockglobaltags \{OFF}
		SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <cap>}
		lockglobaltags
	endif
endscript

script ui_band_name_logo_continue 
	bandinterface :GetTags
	ui_band_name_logo_save
	SoundEvent \{event = enter_band_name_finish}
	Change respond_to_signin_changed = ($store_bnl_respond_to_signin_changed)
	Change respond_to_signin_changed_all_players = ($store_bnl_respond_to_signin_changed_all_players)
	Change respond_to_signin_changed_func = ($store_bnl_respond_to_signin_changed_func)
	if ((GotParam from_boot) || (GotParam from_save))
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100000}
		0xfe576e0b
		0x6b7a2fbe from_boot = <from_boot>
	endif
	if GotParam \{from_boot}
		UnPauseGame
		printf \{'ui_band_name_logo_continue - ui_event_wait_for_safe'}
		ui_event_wait_for_safe
		fadetoblack \{On
			z_priority = 0
			alpha = 1.0}
	endif
	if ((GotParam from_boot) || (GotParam from_save))
		ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {event_params = <event_params> savegame = <device_num> controller = <device_num>}
	else
		data = {controller = <device_num>}
		if GotParam \{event_params}
			if StructureContains structure = <event_params> data
				data = {(<event_params>.data) savegame = <device_num> controller = <device_num>}
			endif
		endif
		create_loading_screen \{0xdf3c5641}
		ui_memcard_autosave_replace <event_params> data = {<data> all_active_players = 1}
	endif
endscript

script 0x9c89e681 
	create_new_generic_popup \{popup_type = yes_no_menu
		title = qs(0xb2359d6b)
		text = qs(0xf2366899)
		yes_func = 0x51c25f2f
		yes_func_params = {
			logoff
		}
		no_func = 0x51c25f2f
		no_func_params = {
			go_back
		}}
	begin
	is_generic_popup_open
	if (<open> = 0)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script 0xfe576e0b 
	title = qs(0x4b6c0474)
	text = qs(0x66c42da1)
	create_new_generic_popup {
		popup_type = ok_menu
		title = <title>
		text = <text>
		ok_func = destroy_generic_popup
	}
	begin
	is_generic_popup_open
	if (<open> = 0)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script 0x6b7a2fbe 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100000}
	if NOT GotParam \{from_boot}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
	endif
	add_user_control_helper \{text = qs(0x9c716cee)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0x710c020d)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xdeba8f2b)
		button = orange
		z = 100000}
endscript

script ui_band_name_logo_edit 
	RequireParams \{[
			savegame
		]
		all}
	if ScreenElementExists \{id = bandinterface}
		bandinterface :se_setprops \{Pos = {
				relative
				(250.0, 0.0)
			}
			time = 0.2}
	endif
	create_loading_screen \{0xdf3c5641
		Heap = heap_song}
	Wait \{10
		gameframes}
	generic_event_choose data = {state = uistate_cap_main text = qs(0x9a6bb96f) part = cas_band_logo num_icons = 0 savegame = <savegame> from_band_name_logo = 1}
	set_home_button_notallowed
endscript

script ui_band_name_logo_mode \{mode = main}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	if GotParam \{check_name}
		bandinterface :se_getprops
		if NOT ui_band_name_is_valid text = <band_name_text>
			SoundEvent \{event = Menu_Warning_SFX}
			bandinterface :obj_spawnscript \{ui_band_name_logo_warning}
			return
		endif
	endif
	if GotParam \{from_logo}
		SoundEvent \{event = Box_Check_SFX}
	elseif GotParam \{from_name}
		SoundEvent \{event = Box_Check_SFX}
	endif
	clean_up_user_control_helpers
	if NOT ($ui_band_name_logo_current_mode = main)
		mode = $ui_band_name_logo_current_mode
		Change \{ui_band_name_logo_current_mode = main}
	endif
	bandinterface :SetTags mode = <mode>
	bandinterface :GetTags
	bandinterface :se_setprops \{event_handlers = [
		]
		replace_handlers}
	switch (<mode>)
		case main
		get_savegame_from_controller controller = ($band_name_logo_controller)
		event_handlers = [
			{pad_choose ui_band_name_logo_continue}
			{pad_option2 ui_band_name_logo_mode params = {mode = Name}}
			{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
			{pad_R1 ui_band_name_logo_random_name}
		]
		if bandinterface :desc_resolvealias \{Name = alias_cursor}
			<resolved_id> :se_setprops text = qs(0x00000000) alpha = 0.0
			KillSpawnedScript \{Name = ui_band_name_logo_blink_cursor}
		endif
		if bandinterface :desc_resolvealias \{Name = alias_band_name_letter}
			<resolved_id> :se_setprops alpha = 0.25
		endif
		0x6b7a2fbe from_boot = <from_boot>
		if NOT GotParam \{from_boot}
			event_handlers = [
				{pad_back 0x2c7c6a5b}
				{pad_choose ui_band_name_logo_continue}
				{pad_option2 ui_band_name_logo_mode params = {mode = Name}}
				{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
				{pad_L1 ui_band_name_logo_random_name}
			]
		else
			event_handlers = [
				{pad_choose ui_band_name_logo_continue}
				{pad_option2 ui_band_name_logo_mode params = {mode = Name}}
				{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
				{pad_L1 ui_band_name_logo_random_name}
			]
		endif
		case Name
		if NOT GotParam \{no_sound}
			generic_menu_pad_choose_sound
		endif
		bandinterface :se_getprops
		event_handlers = [
			{pad_choose ui_band_name_logo_mode params = {check_name from_name}}
			{pad_back ui_band_name_logo_cancel_name params = {band_name_text = <band_name_text>}}
			{pad_option2 ui_band_name_logo_enter_character}
			{pad_option ui_band_name_logo_backspace}
			{pad_L1 ui_band_name_logo_toggle_case}
			{pad_up ui_band_name_logo_scroll params = {up}}
			{pad_down ui_band_name_logo_scroll}
		]
		if bandinterface :desc_resolvealias \{Name = alias_cursor}
			if NOT ScriptIsRunning \{ui_band_name_logo_blink_cursor}
				<resolved_id> :se_setprops text = qs(0xd99030ce) alpha = 1.0
				<resolved_id> :obj_spawnscript ui_band_name_logo_blink_cursor
			endif
		endif
		if bandinterface :desc_resolvealias \{Name = alias_band_name_letter}
			<resolved_id> :se_setprops alpha = 1.0
		endif
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x09758c70)
			button = yellow
			z = 100000}
		add_user_control_helper \{text = qs(0x1c2cd639)
			button = blue
			z = 100000}
		bandinterface :GetSingleTag \{text_case}
		controller = ($band_name_logo_controller)
		switch (<text_case>)
			case upper
			add_user_control_helper \{text = qs(0x5d820f70)
				button = orange
				z = 100000}
			case lower
			add_user_control_helper \{text = qs(0xaf4512b4)
				button = orange
				z = 100000}
			case number
			add_user_control_helper \{text = qs(0x6a5a10c8)
				button = orange
				z = 100000}
			case Misc
			add_user_control_helper \{text = qs(0x415478eb)
				button = orange
				z = 100000}
			case foreign
			add_user_control_helper \{text = qs(0x3ea7b66d)
				button = orange
				z = 100000}
		endswitch
	endswitch
	bandinterface :se_setprops {
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script ui_band_name_logo_toggle_case 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	bandinterface :GetTags
	switch (<text_case>)
		case upper
		bandinterface :SetTags \{text_case = lower}
		StringToCharArray string = <lower_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
		case lower
		bandinterface :SetTags \{text_case = number}
		StringToCharArray string = <number_characters>
		band_name_letter_text = (<char_array> [0])
		case number
		bandinterface :SetTags \{text_case = Misc}
		StringToCharArray string = <misc_characters>
		band_name_letter_text = (<char_array> [0])
		case Misc
		bandinterface :SetTags \{text_case = foreign}
		StringToCharArray string = <foreign_characters>
		band_name_letter_text = (<char_array> [0])
		case foreign
		bandinterface :SetTags \{text_case = upper}
		StringToCharArray string = <upper_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
	endswitch
	SoundEvent \{event = enter_band_name_caps}
	ui_band_name_logo_mode \{mode = Name
		no_sound}
	bandinterface :se_setprops band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_random_name 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	cas_random_band_name
	begin
	StringLength string = <random_name>
	if (<str_len> <= $0x8f7b8538)
		break
	endif
	cas_random_band_name
	repeat
	if NOT GotParam \{no_sound}
		SoundEvent \{event = enter_band_name_caps}
	endif
	bandinterface :se_setprops band_name_text = <random_name>
	Change band_name_logo_current_name = <random_name>
endscript

script ui_band_name_logo_scroll 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	bandinterface :GetTags
	switch (<text_case>)
		case upper
		StringToCharArray string = <upper_characters>
		case lower
		StringToCharArray string = <lower_characters>
		case number
		StringToCharArray string = <number_characters>
		case Misc
		StringToCharArray string = <misc_characters>
		case foreign
		StringToCharArray string = <foreign_characters>
	endswitch
	if GotParam \{char_array}
		GetArraySize <char_array>
		printstruct <...>
		i = 0
		begin
		if (<band_name_letter_text> = (<char_array> [<i>]))
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if (<i> = <array_Size>)
			return
		endif
		if GotParam \{up}
			SoundEvent \{event = enter_band_name_scroll_up}
			if (<i> = (<array_Size> - 1))
				switch (<text_case>)
					case upper
					bandinterface :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					bandinterface :SetTags \{letter_index = 0}
					case lower
					bandinterface :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
					case number
					bandinterface :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
					case Misc
					bandinterface :SetTags \{text_case = foreign}
					StringToCharArray string = <foreign_characters>
					case foreign
					bandinterface :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					bandinterface :SetTags \{letter_index = 0}
				endswitch
				band_name_letter_text = (<char_array> [0])
			else
				band_name_letter_text = (<char_array> [(<i> + 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :SetTags letter_index = (<i> + 1)
				endif
			endif
			bandinterface :obj_spawnscript \{ui_band_name_logo_scale_up_arrow}
		else
			SoundEvent \{event = enter_band_name_scroll_down}
			if (<i> = 0)
				switch (<text_case>)
					case upper
					bandinterface :SetTags \{text_case = foreign}
					StringToCharArray string = <foreign_characters>
					case lower
					bandinterface :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					case number
					bandinterface :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					case Misc
					bandinterface :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
					case foreign
					bandinterface :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
				endswitch
				GetArraySize <char_array>
				band_name_letter_text = (<char_array> [(<array_Size> - 1)])
				bandinterface :GetSingleTag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :SetTags letter_index = (<array_Size> - 1)
				endif
			else
				band_name_letter_text = (<char_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :SetTags letter_index = (<i> - 1)
				endif
			endif
			bandinterface :obj_spawnscript \{ui_band_name_logo_scale_down_arrow}
		endif
	endif
	ui_band_name_logo_mode \{mode = Name
		no_sound}
	bandinterface :se_setprops band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_enter_character 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	StringToCharArray string = <band_name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		if NOT (<array_Size> >= $0x8f7b8538)
			band_name_text = (<band_name_text> + <band_name_letter_text>)
			SoundEvent \{event = enter_band_name_select}
			bandinterface :se_setprops band_name_text = <band_name_text>
			Change band_name_logo_current_name = <band_name_text>
		else
			menu_scroll_end_sound
		endif
	endif
endscript

script ui_band_name_logo_backspace 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	StringToCharArray string = <band_name_text>
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
		bandinterface :se_setprops band_name_text = <text>
		Change band_name_logo_current_name = <text>
	endif
endscript

script ui_band_name_logo_toggle_font 
	bandinterface :se_getprops
	GetArraySize \{$car_font_list}
	i = 0
	printstruct <...>
	begin
	if (<band_name_font> = ((($car_font_list) [<i>]).font_checksum))
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if (<i> >= (<array_Size> - 1))
		i = 0
	else
		i = (<i> + 1)
	endif
	SoundEvent \{event = enter_band_name_caps}
	bandinterface :se_setprops band_name_font = ((($car_font_list) [<i>]).font_checksum)
endscript

script ui_band_name_logo_blink_cursor 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	se_setprops \{alpha = 0.0
		time = 0.25
		motion = ease_out}
	se_waitprops
	se_setprops \{alpha = 1.0
		time = 0.25
		motion = ease_out}
	se_waitprops
	repeat
endscript

script ui_band_name_logo_warning 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	GetTags
	bandinterface :se_setprops \{band_name_info_text = qs(0xdb65edaa)}
	Wait \{4.0
		Seconds}
	if ((GotParam from_boot) || (GotParam from_save))
		bandinterface :se_setprops \{band_name_info_text = qs(0xa800ef0f)}
	else
		bandinterface :se_setprops band_name_info_text = <random_name_tip>
	endif
endscript

script ui_band_name_logo_scale_up_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	bandinterface :se_setprops \{name_arrow_up_scale = 1.25
		time = 0.1}
	Wait \{0.1
		Seconds}
	bandinterface :se_setprops \{name_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_band_name_logo_scale_down_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	bandinterface :se_setprops \{name_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	Wait \{0.1
		Seconds}
	bandinterface :se_setprops \{name_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript

script ui_band_name_logo_cancel_name 
	bandinterface :se_setprops band_name_text = <band_name_text>
	Change band_name_logo_current_name = <band_name_text>
	if ui_band_name_is_valid text = <band_name_text>
		ui_band_name_logo_mode \{mode = main
			from_name}
	else
		bandinterface :obj_spawnscript \{ui_band_name_logo_warning}
	endif
endscript

script 0x51c25f2f 
	destroy_generic_popup
	if GotParam \{logoff}
		logout
	endif
	if GotParam \{go_back}
		generic_event_back
	endif
endscript

script 0x2c7c6a5b 
	create_loading_screen \{0xdf3c5641}
	generic_event_back
endscript
