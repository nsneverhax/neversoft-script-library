
script ui_create_boot_guitar 
	if ($invite_controller != -1)
		spawnscriptnow \{ui_boot_guitar_follow_invite}
		return
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_mainmenu_intro
		}}
	return
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		green_button_text = qs("BACK")
		red_button_text = qs("CONTINUE")
		default
		green_button_text = qs("CONTINUE")
		red_button_text = qs("BACK")
	endswitch
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		no_wait}
	ui_get_controller_parts_allowed controller = ($primary_controller)
	instrument = mic
	if isXenon
		desc = 'boot_usingMic_360'
	else
		desc = 'boot_usingMic_PS3'
	endif
	if StructureContains Structure = <allowed> guitar
		instrument = guitar
		desc = 'boot_usingGuitar'
	endif
	if StructureContains Structure = <allowed> drum
		instrument = drum
		desc = 'boot_usingDrum'
	endif
	if StructureContains Structure = <allowed> Vocals
		if IsMicrophonePluggedIn
			instrument = mic
			if isXenon
				desc = 'boot_usingMic_360'
			else
				desc = 'boot_usingMic_PS3'
			endif
		elseif is_regular_controller controller = ($primary_controller)
			instrument = mic
			if isXenon
				desc = 'boot_usingMic_360'
			else
				desc = 'boot_usingMic_PS3'
			endif
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = current_menu
		type = DescInterface
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
	if isRBDrum controller = ($primary_controller)
		spawnscriptnow \{create_rb_drum_notification}
	endif
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
endscript

script ui_boot_guitar_follow_invite 
	Wait \{1
		gameframe}
	ui_event_wait_for_safe
	ui_event_block \{event = menu_back
		state = UIstate_Null}
	ui_event_wait_for_safe
	spawnscriptnow invite_accepted params = {controllerid = ($invite_controller)}
endscript

script create_rb_drum_notification 
	CreateScreenElement \{parent = root_window
		id = notification_box
		type = DescInterface
		desc = 'notification_box'}
	Wait \{3
		seconds}
	DestroyScreenElement \{id = notification_box}
endscript

script ui_destroy_boot_guitar 
	DestroyScreenElement \{id = current_menu}
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
	if IsGuitarController controller = <controller>
		return \{false}
	elseif IsDrumController controller = <controller>
		return \{false}
	endif
	return \{true}
endscript
