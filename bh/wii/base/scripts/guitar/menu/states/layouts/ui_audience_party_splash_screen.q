
script 0x713ec616 
endscript

script 0xed26725d 
endscript

script 0x384d0a14 
	CreateScreenElement {
		parent = root_window
		id = 0x93f35815
		Type = descinterface
		desc = 'ds_party_play_splash'
		event_handlers = [
			{pad_back generic_event_back}
			{pad_choose 0x6d326350 params = {from = <from> device_num = <device_num>}}
		]
		z_priority = 100
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		all_buttons
		z = 1000}
	AssignAlias \{id = 0x93f35815
		alias = current_menu}
	Change \{block_clean_up_user_control_helpers = true}
endscript

script 0x52d68cf1 
	Change \{block_clean_up_user_control_helpers = FALSE}
	DestroyScreenElement \{id = 0x93f35815}
	clean_up_user_control_helpers
endscript

script 0x6d326350 
	SoundEvent \{event = ui_sfx_select}
	ds_connection_helper mode = audience_party from = <from> event = menu_replace device_num = <device_num>
endscript
