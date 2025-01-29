
script ui_create_new_song_info_popup 
	Player = (($primary_controller) + 1)
	if (<Player> > 4)
		part = drum
	else
		getplayerinfo <Player> part
	endif
	0x91e66f17 = qs(0x64f07d44)

	if (<part> = vocals)
		0x91e66f17 = qs(0xe368618b)
	elseif (<part> = drum)
		0x91e66f17 = qs(0x8704a48f)
	elseif (<part> = guitar)
		0x91e66f17 = qs(0xbb0b71dd)
	elseif (<part> = bass)
		0x91e66f17 = qs(0xbb0b71dd)
	endif
	formatText TextName = popup_text qs(0x4248dd06) a = <0x91e66f17>
	CreateScreenElement {
		Type = descinterface
		desc = 'setlist_b_extras_pop'
		parent = root_window
		id = new_song_info_popup
		event_handlers = [
			{pad_choose setlist_prompt_continue}
		]
		0x7b8f8efa = <popup_text>
	}
	SoundEvent \{event = enter_band_name_finish}
	SpawnScriptNow \{0xb20ce9b6}
	SpawnScriptNow \{ui_new_song_info_wait_and_focus}
endscript

script ui_new_song_info_wait_and_focus 
	LaunchEvent \{Type = focus
		target = new_song_info_popup}
	setlist_menu :se_setprops \{block_events}
	Wait \{2
		gameframes}
	SetButtonEventMappings \{unblock_menu_input}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_new_song_info_popup 
	if ScreenElementExists \{id = new_song_info_popup}
		DestroyScreenElement \{id = new_song_info_popup}
	endif
	setlist_menu :se_setprops \{unblock_events}
	SpawnScriptNow \{0x1e464d15}
endscript
