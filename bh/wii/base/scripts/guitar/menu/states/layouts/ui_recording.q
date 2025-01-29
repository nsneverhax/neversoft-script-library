
script ui_create_recording 
	SpawnScriptNow create_jam_recording_menu params = {<...>}
endscript

script ui_destroy_recording 
	destroy_jam_recording_menu
	jam_force_kill_tutorial \{status = force_exit}
	DestroyScreenElement \{id = tutorial_container}
endscript

script ui_deinit_recording 
	Change \{select_shift = 1}
	Change \{debug_show_analog_options = 1}
endscript
