
script ui_create_double_bass_popup 
	CreateScreenElement \{Type = descinterface
		desc = 'setlist_b_db_pop'
		parent = root_window
		id = double_bass_popup
		event_handlers = [
			{
				pad_choose
				ui_setlist_go_back
			}
		]}
	SoundEvent \{event = enter_band_name_finish}
	SpawnScriptNow \{0xb20ce9b6}
	SpawnScriptNow \{ui_double_bass_wait_and_focus}
endscript

script ui_double_bass_wait_and_focus 
	Wait \{2
		gameframes}
	LaunchEvent \{Type = focus
		target = double_bass_popup}
	setlist_menu :se_setprops \{block_events}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script ui_destroy_double_bass_popup 
	if ScreenElementExists \{id = double_bass_popup}
		DestroyScreenElement \{id = double_bass_popup}
	endif
	setlist_menu :se_setprops \{unblock_events}
	SpawnScriptNow \{0x1e464d15}
endscript
