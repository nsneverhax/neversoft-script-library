
script ui_create_boot_guitar 
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_mainmenu_intro
		}}
	return
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		green_button_text = qs(0xaf4d5dd2)
		red_button_text = qs(0x182f0173)
		default
		green_button_text = qs(0x182f0173)
		red_button_text = qs(0xaf4d5dd2)
	endswitch
	fadetoblack \{On
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
	if StructureContains structure = <allowed> guitar
		instrument = guitar
		desc = 'boot_usingGuitar'
	endif
	if StructureContains structure = <allowed> drum
		instrument = drum
		desc = 'boot_usingDrum'
	endif
	if StructureContains structure = <allowed> vocals
		if ismicrophonepluggedin
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
		Type = descinterface
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
	<id> :0x8e6af868 child = bg z_priority = 0.0
	if (<instrument> = drum)
		<id> :0x8e6af868 child = instrument_drum_drumset dims = (640.0, 512.0) Pos = (164.0, 212.0)
		<id> :0x8e6af868 child = line_1 Pos = (17.0, 283.0)
		<id> :0x8e6af868 child = line_2 Pos = (78.0, 283.0)
	elseif (<instrument> = guitar)
		<id> :0x8e6af868 child = instruction_box dims = (1124.0, 512.0)
	endif
	if isrbdrum controller = ($primary_controller)
		SpawnScriptNow \{create_rb_drum_notification}
	endif
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000
		all_buttons}
endscript

script create_rb_drum_notification 
	CreateScreenElement \{parent = root_window
		id = notification_box
		Type = descinterface
		desc = 'notification_box'}
	Wait \{3
		Seconds}
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
		return \{FALSE}
	elseif isdrumcontroller controller = <controller>
		return \{FALSE}
	endif
	return \{true}
endscript
