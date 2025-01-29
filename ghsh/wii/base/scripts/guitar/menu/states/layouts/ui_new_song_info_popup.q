
script ui_create_new_song_info_popup 
	user_control_helper_get_buttonchar \{button = blue}
	0x91e66f17 = <buttonchar>
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
		exclusive_device = ($primary_controller)
	}
	SpawnScriptNow \{0x8216f21e}
	SoundEvent \{event = enter_band_name_finish}
	SpawnScriptNow \{destroy_setlist_songpreview_monitor}
	SpawnScriptNow \{ui_new_song_info_wait_and_focus}
endscript

script 0x8216f21e 
	begin
	RemoveParameter \{buttonchar}
	RemoveParameter \{0x91e66f17}
	user_control_helper_get_buttonchar \{button = blue}
	0x91e66f17 = <buttonchar>
	formatText TextName = popup_text qs(0x4248dd06) a = <0x91e66f17>
	if ScreenElementExists \{id = new_song_info_popup}
		new_song_info_popup :se_setprops 0x7b8f8efa = <popup_text>
	else
		return
	endif
	Wait \{5
		gameframes}
	repeat
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
	KillSpawnedScript \{Name = 0x8216f21e}
	if ScreenElementExists \{id = new_song_info_popup}
		DestroyScreenElement \{id = new_song_info_popup}
	endif
	setlist_menu :se_setprops \{unblock_events}
	SpawnScriptNow \{setlist_songpreview_monitor}
endscript
