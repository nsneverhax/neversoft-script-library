0xeb875706 = 0
0xc5d252f0 = null

script ui_create_boot_guitar 
	if ($invite_controller != -1)
		spawnscriptnow \{ui_boot_guitar_follow_invite}
		return
	endif
	getenterbuttonassignment
	switch <assignment>
		case circle
		green_button_text = qs(0xaf4d5dd2)
		red_button_text = qs(0x182f0173)
		default
		green_button_text = qs(0x182f0173)
		red_button_text = qs(0xaf4d5dd2)
	endswitch
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		no_wait}
	ui_get_controller_parts_allowed controller = ($primary_controller)
	instrument = mic
	if isxenon
		desc = 'boot_usingMic_360'
	else
		desc = 'boot_usingMic_PS3'
	endif
	if structurecontains structure = <allowed> guitar
		instrument = guitar
		desc = 'boot_usingGuitar'
	endif
	if structurecontains structure = <allowed> drum
		instrument = drum
		desc = 'boot_usingDrum'
	endif
	if 0x1c708d82 controller = ($primary_controller)
		instrument = guitar
		desc = 'boot_usingKeyboard'
	endif
	if structurecontains structure = <allowed> vocals
		if ismicrophonepluggedin
			instrument = mic
			if isxenon
				desc = 'boot_usingMic_360'
			else
				desc = 'boot_usingMic_PS3'
			endif
		elseif is_regular_controller controller = ($primary_controller)
			instrument = mic
			if isxenon
				desc = 'boot_usingMic_360'
			else
				desc = 'boot_usingMic_PS3'
			endif
		endif
	endif
	if 0x1c708d82 controller = ($primary_controller)
		event_handlers = [
			{pad_start ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_choose ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_start ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
			{pad_choose ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
			{pad_option2 0x446746c0}
		]
	else
		event_handlers = [
			{pad_start ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_choose ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_start ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
			{pad_choose ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
		]
	endif
	createscreenelement {
		parent = root_window
		id = current_menu
		type = descinterface
		desc = <desc>
		exclusive_device = ($primary_controller)
		event_handlers = <event_handlers>
		z_priority = 9000
		green_button_text = <green_button_text>
		red_button_text = <red_button_text>
	}
	if 0x1c708d82 controller = ($primary_controller)
		if notismacport
			if french
				current_menu :setprops \{instrument_texture = boot_usingkeyboard_f}
			elseif spanish
				current_menu :setprops \{instrument_texture = boot_usingkeyboard_s}
			elseif german
				current_menu :setprops \{instrument_texture = boot_usingkeyboard_g}
			elseif italian
				current_menu :setprops \{instrument_texture = boot_usingkeyboard_i}
			else
				current_menu :setprops \{instrument_texture = boot_usingkeyboard}
			endif
		else
			if french
				current_menu :setprops \{instrument_texture = boot_usingmackeyboard_f}
			elseif spanish
				current_menu :setprops \{instrument_texture = boot_usingmackeyboard_s}
			elseif german
				current_menu :setprops \{instrument_texture = boot_usingmackeyboard_g}
			elseif italian
				current_menu :setprops \{instrument_texture = boot_usingmackeyboard_i}
			else
				current_menu :setprops \{instrument_texture = boot_usingmackeyboard}
			endif
		endif
	endif
	if iswinport
		if ((<instrument>) = mic)
			if notismacport
				if french
					current_menu :setprops \{instrument_texture = 0xefcb971f}
				elseif spanish
					current_menu :setprops \{instrument_texture = 0x821673f4}
				elseif german
					current_menu :setprops \{instrument_texture = 0x98cca789}
				elseif italian
					current_menu :setprops \{instrument_texture = 0x7f748a8e}
				else
					current_menu :setprops \{instrument_texture = 0x86c74dcd}
				endif
			else
				if french
					current_menu :setprops \{instrument_texture = 0xbc495227}
				elseif spanish
					current_menu :setprops \{instrument_texture = 0xd194b6cc}
				elseif german
					current_menu :setprops \{instrument_texture = 0xcb4e62b1}
				elseif italian
					current_menu :setprops \{instrument_texture = 0x2cf64fb6}
				else
					current_menu :setprops \{instrument_texture = 0xbe415063}
				endif
			endif
		endif
	endif
	if isrbdrum controller = ($primary_controller)
		spawnscriptnow \{create_rb_drum_notification}
	endif
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
	if 0x1c708d82 controller = ($primary_controller)
		if NOT ismicrophonepluggedin
			add_user_control_helper \{text = qs(0x987a30cd)
				button = yellow
				z = 100000}
		endif
	endif
endscript

script ui_boot_guitar_follow_invite 
	ui_create_mainmenu_intro_spawned
	wait \{1
		gameframe}
	spawnscriptnow invite_accepted params = {controllerid = ($invite_controller)}
endscript

script create_rb_drum_notification 
	createscreenelement \{parent = root_window
		id = notification_box
		type = descinterface
		desc = 'notification_box'}
	wait \{3
		seconds}
	destroyscreenelement \{id = notification_box}
endscript

script ui_destroy_boot_guitar 
	destroyscreenelement \{id = current_menu}
	clean_up_user_control_helpers
endscript

script ui_boot_guitar_sound 
	switch (<instrument>)
		case guitar
		generic_menu_pad_choose_sound
		case drum
		generic_menu_pad_choose_sound
		case mic
		generic_menu_pad_choose_sound
	endswitch
endscript

script is_regular_controller 
	if isguitarcontroller controller = <controller>
		return \{false}
	elseif isdrumcontroller controller = <controller>
		return \{false}
	endif
	return \{true}
endscript

script 0x446746c0 
	if screenelementexists \{id = current_menu}
		if ($0xeb875706 = 0)
			current_menu :se_getprops
			change 0xc5d252f0 = <instrument_texture>
			if notismacport
				if french
					current_menu :se_setprops \{instrument_texture = 0x6925e65c}
				elseif spanish
					current_menu :se_setprops \{instrument_texture = 0x04f802b7}
				elseif german
					current_menu :se_setprops \{instrument_texture = 0x1e22d6ca}
				elseif italian
					current_menu :se_setprops \{instrument_texture = 0xf99afbcd}
				else
					current_menu :se_setprops \{instrument_texture = 0xfdc54aa8}
				endif
			else
				if french
					current_menu :se_setprops \{instrument_texture = 0x95b43f1a}
				elseif spanish
					current_menu :se_setprops \{instrument_texture = 0xf869dbf1}
				elseif german
					current_menu :se_setprops \{instrument_texture = 0xe2b30f8c}
				elseif italian
					current_menu :se_setprops \{instrument_texture = 0x050b228b}
				else
					current_menu :se_setprops \{instrument_texture = 0xae478f90}
				endif
			endif
			current_menu :se_setprops \{0x49d7b13b = drumset}
			current_menu :se_setprops \{0xf4b8a723 = (512.0, 512.0)}
			current_menu :se_setprops \{0xe676000e = (0.6, 0.6)}
			current_menu :se_setprops \{0xf4b53ff4 = -5.0}
			change \{0xeb875706 = 1}
		else
			current_menu :se_setprops \{instrument_texture = $0xc5d252f0}
			current_menu :se_setprops \{0x49d7b13b = guitar}
			current_menu :se_setprops \{0xf4b8a723 = (1024.0, 256.0)}
			current_menu :se_setprops \{0xe676000e = (0.4, 0.4)}
			current_menu :se_setprops \{0xf4b53ff4 = 120.0}
			change \{0xeb875706 = 0}
		endif
	endif
endscript
