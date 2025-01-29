
script ui_create_recording 
	SpawnScriptNow create_jam_recording_menu params = {<...>}
endscript

script 0x521fdb4b 
	0x8461758e
endscript

script ui_destroy_recording 
	destroy_jam_recording_menu
	jam_force_kill_tutorial \{status = force_exit}
	DestroyScreenElement \{id = training_container}
endscript

script ui_deinit_recording 
	Change \{select_shift = 1}
	Change \{debug_show_analog_options = 1}
endscript
