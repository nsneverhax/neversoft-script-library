
script ui_create_options_data_delete 
	fadetoblack \{OFF
		no_wait}
	if NOT GotParam \{really}
		create_popup_warning_menu \{textblock = {
				text = qs(0x113bad66)
			}
			options = [
				{
					func = generic_event_replace
					func_params = {
						state = uistate_options_data_delete
						data = {
							really = 1
						}
					}
					text = qs(0xc2993a50)
				}
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
			]
			focus_index = 1}
	elseif NOT GotParam \{confirm}
		create_popup_warning_menu \{textblock = {
				text = qs(0x1df63a52)
			}
			options = [
				{
					func = generic_event_replace
					func_params = {
						state = uistate_options_data_delete
						data = {
							really = 1
							confirm = 1
						}
					}
					text = qs(0x120d3970)
				}
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
			]
			focus_index = 1}
	else
		SpawnScriptNow \{ui_options_data_delete}
		menu_music_off
	endif
endscript

script ui_destroy_options_data_delete 
	if 0x8658e568
		destroy_loading_screen \{Force = 1}
	else
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 100011}
	endif
	destroy_popup_warning_menu
endscript

script ui_options_data_delete 
	create_popup_warning_menu \{textblock = {
			text = qs(0x3cb30bee)
		}}
	Wait \{1
		Second}
	get_savegame_from_controller controller = ($primary_controller)
	reset_globaltags savegame = <savegame>
	create_loading_screen
	ui_event_wait_for_safe
	ui_memcard_autosave \{event = menu_change
		state = uistate_boot_iis
		data = {
			clear_previous_stack
		}}
endscript
