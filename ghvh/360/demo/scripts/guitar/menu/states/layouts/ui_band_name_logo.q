band_name_logo_controller = 0
band_name_logo_current_name = none
store_bnl_respond_to_signin_changed = 0
store_bnl_respond_to_signin_changed_all_players = 0
store_bnl_respond_to_signin_changed_func = none

script ui_init_band_name_logo controller = ($primary_controller)
	init_band_logo controller = <controller>
	change \{ui_band_name_logo_current_mode = main}
	change \{band_name_logo_current_name = none}
endscript
ui_band_name_logo_current_mode = main

script ui_create_band_name_logo controller = ($primary_controller)
	change band_name_logo_controller = <controller>
	change menu_over_ride_exclusive_device = <controller>
	fadetoblack \{off
		no_wait}
	spawnscript \{cleanup_frontend_bg_movie}
	change store_bnl_respond_to_signin_changed = ($respond_to_signin_changed)
	change store_bnl_respond_to_signin_changed_all_players = ($respond_to_signin_changed_all_players)
	change store_bnl_respond_to_signin_changed_func = ($respond_to_signin_changed_func)
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change \{respond_to_signin_changed_func = ui_band_name_logo_signin_changed}
	if NOT screenelementexists \{id = bandinterface}
		name_a = qs(0x26416b7f)
		name_b = qs(0xfcb61b8d)
		name_c = qs(0xd61b472f)
		name_d = qs(0x07a99897)
		name_e = qs(0x447be3c8)
		name_f = qs(0xab059c8a)
		name_g = qs(0x5669d0e2)
		name_h = qs(0xfc1f9495)
		name_i = qs(0x511a2cbf)
		name_j = qs(0xc2b1b978)
		random_name_tip = Random (@ <name_a> @ <name_b> @ <name_c> @ <name_d> @ <name_e> @ <name_f> @ <name_g> @ <name_h> @ <name_i> @ <name_j> )
		createscreenelement {
			parent = root_window
			id = bandinterface
			type = descinterface
			desc = 'band_name'
			exclusive_device = ($band_name_logo_controller)
			just = [center center]
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
		cas_update_band_logo controller = ($band_name_logo_controller)
		pushassetcontext context = ($cas_band_logo_details.assetcontext)
		createscreenelement {
			type = spriteelement
			parent = <id>
			texture = ($cas_band_logo_details.textureasset)
			just = [left center]
			rgba = [255 255 255 250]
			pos = (405.0, 256.0)
			dims = (300.0, 300.0)
			z_priority = 5
		}
		popassetcontext
	else
	endif
	if NOT (($band_name_logo_current_name) = none)
		bandinterface :se_setprops band_name_text = ($band_name_logo_current_name)
	elseif current_band_has_band_name controller = ($band_name_logo_controller)
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_info
		getglobaltags savegame = <savegame> <band_info>
		bandinterface :se_setprops band_name_text = <name> band_name_font = <font>
		change band_name_logo_current_name = <name>
	elseif ((gotparam from_boot) || (gotparam from_save))
		ui_band_name_logo_random_name \{no_sound}
		randomize_band_logo
	endif
	if bandinterface :desc_resolvealias \{name = alias_band_name
			param = band_name}
		getscreenelementdims id = <band_name>
		<band_name> :se_setprops dims = (<height> * (0.0, 1.0))
	endif
	if NOT ((gotparam from_boot) || (gotparam from_save))
		bandinterface :se_setprops band_name_info_text = <random_name_tip>
	endif
	assignalias \{id = bandinterface
		alias = band_name_menu}
	ui_band_name_logo_mode
	launchevent \{type = focus
		target = bandinterface}
	if gotparam \{skip_destroy}
		ui_event_remove_params \{param = skip_destroy}
	endif
	bandinterface :se_setprops \{pos = (640.0, 360.0)}
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
	if NOT gotparam \{skip_destroy}
		if screenelementexists \{id = bandinterface}
			bandinterface :gettags
			destroyscreenelement \{id = bandinterface}
		endif
	else
		ui_event_remove_params \{param = skip_destroy}
	endif
endscript

script ui_deinit_band_name_logo 
	change \{cas_override_object = none}
	bandlogoobject :switchoffatomic \{cas_band_logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo
		no_fix_camera}
	change \{menu_over_ride_exclusive_device = -1}
	change \{band_name_logo_current_name = none}
	if screenelementexists \{id = bandinterface}
		destroyscreenelement \{id = bandinterface}
	endif
endscript

script ui_band_name_logo_save 
	bandinterface :se_getprops
	bandinterface :gettags
	change ui_band_name_logo_current_mode = <mode>
	bandname_id = band_info
	gettruestarttime
	formattext checksumname = band_unique_id 'band_info_%d' d = <starttime>
	get_savegame_from_controller controller = ($band_name_logo_controller)
	setglobaltags savegame = <savegame> <bandname_id> params = {name = <band_name_text> band_unique_id = <band_unique_id> font = <band_name_font>}
	agora_update band_id = <band_unique_id> name = <band_name_text> new_band
	achievements_i_have_a_sound_system name = <band_name_text>
	getcasappearancepart \{part = cas_band_logo}
	if gotparam \{cap}
		get_current_band_info
		lockglobaltags \{off}
		setglobaltags savegame = <savegame> <band_info> params = {band_logo = <cap>}
		lockglobaltags
	endif
endscript

script ui_band_name_logo_continue 
	bandinterface :gettags
	ui_band_name_logo_save
	soundevent \{event = enter_band_name_finish}
	change respond_to_signin_changed = ($store_bnl_respond_to_signin_changed)
	change respond_to_signin_changed_all_players = ($store_bnl_respond_to_signin_changed_all_players)
	change respond_to_signin_changed_func = ($store_bnl_respond_to_signin_changed_func)
	if gotparam \{from_boot}
		unpausegame
		printf \{'ui_band_name_logo_continue - ui_event_wait_for_safe'}
		ui_event_wait_for_safe
		fadetoblack \{on
			z_priority = 0
			alpha = 1.0}
	endif
	if ((gotparam from_boot) || (gotparam from_save))
		ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {event_params = <event_params> savegame = <device_num> controller = <device_num>}
	else
		data = {controller = <device_num>}
		if gotparam \{event_params}
			if structurecontains structure = <event_params> data
				data = {(<event_params>.data) savegame = <device_num> controller = <device_num>}
			endif
		endif
		ui_memcard_autosave_replace <event_params> data = {<data> all_active_players = 1}
	endif
endscript

script ui_band_name_logo_edit 
	requireparams \{[
			savegame
		]
		all}
	generic_event_choose data = {state = uistate_cap_main text = qs(0x9a6bb96f) part = cas_band_logo num_icons = 0 savegame = <savegame> from_band_name_logo = 1}
	ui_event_add_params \{skip_destroy = 1}
endscript

script ui_band_name_logo_mode \{mode = main}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	if gotparam \{check_name}
		bandinterface :se_getprops
		if NOT ui_band_name_is_valid text = <band_name_text>
			soundevent \{event = menu_warning_sfx}
			bandinterface :obj_spawnscript \{ui_band_name_logo_warning}
			return
		endif
	endif
	if gotparam \{from_logo}
		soundevent \{event = box_check_sfx}
	elseif gotparam \{from_name}
		soundevent \{event = box_check_sfx}
	endif
	clean_up_user_control_helpers
	if NOT ($ui_band_name_logo_current_mode = main)
		mode = $ui_band_name_logo_current_mode
		change \{ui_band_name_logo_current_mode = main}
	endif
	bandinterface :settags mode = <mode>
	bandinterface :gettags
	bandinterface :se_setprops \{event_handlers = [
		]
		replace_handlers}
	switch (<mode>)
		case main
		get_savegame_from_controller controller = ($band_name_logo_controller)
		event_handlers = [
			{pad_choose ui_band_name_logo_continue}
			{pad_option2 ui_band_name_logo_mode params = {mode = name}}
			{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
			{pad_l1 ui_band_name_logo_random_name}
		]
		if bandinterface :desc_resolvealias \{name = alias_cursor}
			getscreenelementdims id = <resolved_id>
			<resolved_id> :se_setprops text = qs(0x00000000) alpha = 0.0 dims = (<height> * (0.0, 1.0))
			killspawnedscript \{name = ui_band_name_logo_blink_cursor}
		endif
		if bandinterface :desc_resolvealias \{name = alias_band_name_letter}
			<resolved_id> :se_setprops alpha = 0.25
		endif
		add_user_control_helper \{text = qs(0xb73cb78f)
			button = green
			z = 100000}
		if NOT gotparam \{from_save}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
		endif
		add_user_control_helper \{text = qs(0x86be1220)
			button = yellow
			z = 100000}
		add_user_control_helper \{text = qs(0x6bc37cc3)
			button = blue
			z = 100000}
		add_user_control_helper \{text = qs(0xf99069a2)
			button = orange
			z = 100000}
		if NOT gotparam \{from_save}
			event_handlers = [
				{pad_back generic_event_back}
				{pad_choose ui_band_name_logo_continue}
				{pad_option2 ui_band_name_logo_mode params = {mode = name}}
				{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
				{pad_l1 ui_band_name_logo_random_name}
			]
		endif
		case name
		if NOT gotparam \{no_sound}
			generic_menu_pad_choose_sound
		endif
		bandinterface :se_getprops
		event_handlers = [
			{pad_choose ui_band_name_logo_mode params = {check_name from_name}}
			{pad_back ui_band_name_logo_cancel_name params = {band_name_text = <band_name_text>}}
			{pad_option2 ui_band_name_logo_enter_character}
			{pad_option ui_band_name_logo_backspace}
			{pad_l1 ui_band_name_logo_toggle_case}
			{pad_up ui_band_name_logo_scroll params = {up}}
			{pad_down ui_band_name_logo_scroll}
		]
		if bandinterface :desc_resolvealias \{name = alias_cursor}
			if NOT scriptisrunning \{ui_band_name_logo_blink_cursor}
				<resolved_id> :se_setprops text = qs(0xd99030ce) alpha = 1.0
				<resolved_id> :obj_spawnscript ui_band_name_logo_blink_cursor
			endif
		endif
		if bandinterface :desc_resolvealias \{name = alias_band_name_letter}
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
		bandinterface :getsingletag \{text_case}
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
			case misc
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
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	bandinterface :gettags
	switch (<text_case>)
		case upper
		bandinterface :settags \{text_case = lower}
		stringtochararray string = <lower_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
		case lower
		bandinterface :settags \{text_case = number}
		stringtochararray string = <number_characters>
		band_name_letter_text = (<char_array> [0])
		case number
		bandinterface :settags \{text_case = misc}
		stringtochararray string = <misc_characters>
		band_name_letter_text = (<char_array> [0])
		case misc
		bandinterface :settags \{text_case = foreign}
		stringtochararray string = <foreign_characters>
		band_name_letter_text = (<char_array> [0])
		case foreign
		bandinterface :settags \{text_case = upper}
		stringtochararray string = <upper_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
	endswitch
	soundevent \{event = enter_band_name_caps}
	ui_band_name_logo_mode \{mode = name
		no_sound}
	bandinterface :se_setprops band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_random_name 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	cas_random_band_name
	if NOT gotparam \{no_sound}
		soundevent \{event = enter_band_name_caps}
	endif
	bandinterface :se_setprops band_name_text = <random_name>
	change band_name_logo_current_name = <random_name>
	if bandinterface :desc_resolvealias \{name = alias_band_name
			param = band_name}
		getscreenelementdims id = <band_name>
		<band_name> :se_setprops dims = (<height> * (0.0, 1.0))
	endif
endscript

script ui_band_name_logo_scroll 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	bandinterface :gettags
	switch (<text_case>)
		case upper
		stringtochararray string = <upper_characters>
		case lower
		stringtochararray string = <lower_characters>
		case number
		stringtochararray string = <number_characters>
		case misc
		stringtochararray string = <misc_characters>
		case foreign
		stringtochararray string = <foreign_characters>
	endswitch
	if gotparam \{char_array}
		getarraysize <char_array>
		printstruct <...>
		i = 0
		begin
		if (<band_name_letter_text> = (<char_array> [<i>]))
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return
		endif
		if gotparam \{up}
			soundevent \{event = enter_band_name_scroll_up}
			if (<i> = (<array_size> - 1))
				switch (<text_case>)
					case upper
					bandinterface :settags \{text_case = lower}
					stringtochararray string = <lower_characters>
					bandinterface :settags \{letter_index = 0}
					case lower
					bandinterface :settags \{text_case = number}
					stringtochararray string = <number_characters>
					case number
					bandinterface :settags \{text_case = misc}
					stringtochararray string = <misc_characters>
					case misc
					bandinterface :settags \{text_case = foreign}
					stringtochararray string = <foreign_characters>
					case foreign
					bandinterface :settags \{text_case = upper}
					stringtochararray string = <upper_characters>
					bandinterface :settags \{letter_index = 0}
				endswitch
				band_name_letter_text = (<char_array> [0])
			else
				band_name_letter_text = (<char_array> [(<i> + 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :settags letter_index = (<i> + 1)
				endif
			endif
			bandinterface :obj_spawnscript \{ui_band_name_logo_scale_up_arrow}
		else
			soundevent \{event = enter_band_name_scroll_down}
			if (<i> = 0)
				switch (<text_case>)
					case upper
					bandinterface :settags \{text_case = foreign}
					stringtochararray string = <foreign_characters>
					case lower
					bandinterface :settags \{text_case = upper}
					stringtochararray string = <upper_characters>
					case number
					bandinterface :settags \{text_case = lower}
					stringtochararray string = <lower_characters>
					case misc
					bandinterface :settags \{text_case = number}
					stringtochararray string = <number_characters>
					case foreign
					bandinterface :settags \{text_case = misc}
					stringtochararray string = <misc_characters>
				endswitch
				getarraysize <char_array>
				band_name_letter_text = (<char_array> [(<array_size> - 1)])
				bandinterface :getsingletag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :settags letter_index = (<array_size> - 1)
				endif
			else
				band_name_letter_text = (<char_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					bandinterface :settags letter_index = (<i> - 1)
				endif
			endif
			bandinterface :obj_spawnscript \{ui_band_name_logo_scale_down_arrow}
		endif
	endif
	ui_band_name_logo_mode \{mode = name
		no_sound}
	bandinterface :se_setprops band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_enter_character 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	stringtochararray string = <band_name_text>
	if gotparam \{char_array}
		getarraysize <char_array>
		if NOT (<array_size> >= 20)
			band_name_text = (<band_name_text> + <band_name_letter_text>)
			soundevent \{event = enter_band_name_select}
			bandinterface :se_setprops band_name_text = <band_name_text>
			change band_name_logo_current_name = <band_name_text>
		else
			menu_scroll_end_sound
		endif
	endif
endscript

script ui_band_name_logo_backspace 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	bandinterface :se_getprops
	stringtochararray string = <band_name_text>
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
		bandinterface :se_setprops band_name_text = <text>
		change band_name_logo_current_name = <text>
		if bandinterface :desc_resolvealias \{name = alias_band_name
				param = band_name}
			getscreenelementdims id = <band_name>
			<band_name> :se_setprops dims = (<height> * (0.0, 1.0))
		endif
	endif
endscript

script ui_band_name_logo_toggle_font 
	bandinterface :se_getprops
	getarraysize \{$car_font_list}
	i = 0
	printstruct <...>
	begin
	if (<band_name_font> = ((($car_font_list) [<i>]).font_checksum))
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<i> >= (<array_size> - 1))
		i = 0
	else
		i = (<i> + 1)
	endif
	soundevent \{event = enter_band_name_caps}
	bandinterface :se_setprops band_name_font = ((($car_font_list) [<i>]).font_checksum)
endscript

script ui_band_name_logo_blink_cursor 
	setspawninstancelimits \{max = 1
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
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	gettags
	bandinterface :se_setprops \{band_name_info_text = qs(0xf9afb2a1)}
	wait \{4.0
		seconds}
	if ((gotparam from_boot) || (gotparam from_save))
		bandinterface :se_setprops \{band_name_info_text = qs(0x7a5e3606)}
	else
		bandinterface :se_setprops band_name_info_text = <random_name_tip>
	endif
endscript

script ui_band_name_logo_scale_up_arrow 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	bandinterface :se_setprops \{name_arrow_up_scale = 1.25
		time = 0.1}
	wait \{0.1
		seconds}
	bandinterface :se_setprops \{name_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_band_name_logo_scale_down_arrow 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	bandinterface :se_setprops \{name_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	wait \{0.1
		seconds}
	bandinterface :se_setprops \{name_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript

script ui_band_name_logo_cancel_name 
	bandinterface :se_setprops band_name_text = <band_name_text>
	change band_name_logo_current_name = <band_name_text>
	if ui_band_name_is_valid text = <band_name_text>
		ui_band_name_logo_mode \{mode = main
			from_name}
	else
		bandinterface :obj_spawnscript \{ui_band_name_logo_warning}
	endif
	if bandinterface :desc_resolvealias \{name = alias_band_name
			param = band_name}
		getscreenelementdims id = <band_name>
		<band_name> :se_setprops dims = (<height> * (0.0, 1.0))
	endif
endscript
