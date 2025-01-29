
script ui_init_tutorial_pause 
	if ScriptExists \{ui_init_pausemenu}
		ui_init_pausemenu <...>
	endif
endscript

script ui_create_tutorial_pause 
	if ScriptExists \{ui_create_pausemenu}
		ui_create_pausemenu <...>
	endif
endscript

script ui_destroy_tutorial_pause 
	if ScriptExists \{ui_destroy_pausemenu}
		ui_destroy_pausemenu <...>
	endif
endscript

script ui_deinit_tutorial_pause 
	if ScriptExists \{ui_deinit_pausemenu}
		ui_deinit_pausemenu <...>
	endif
endscript
