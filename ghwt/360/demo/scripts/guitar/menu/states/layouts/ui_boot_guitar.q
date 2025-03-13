
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
	createscreenelement {
		parent = root_window
		id = current_menu
		type = descinterface
		desc = <desc>
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_start ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_choose ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_start ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
			{pad_choose ui_event params = {event = menu_replace data = {state = uistate_mainmenu_intro}}}
		]
		z_priority = 9000
		green_button_text = <green_button_text>
		red_button_text = <red_button_text>
	}
	if isrbdrum controller = ($primary_controller)
		spawnscriptnow \{create_rb_drum_notification}
	endif
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
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
