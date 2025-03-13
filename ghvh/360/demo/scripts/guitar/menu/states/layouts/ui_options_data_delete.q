
script ui_create_options_data_delete 
	if NOT gotparam \{really}
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
			focus_index = 1
			long}
	elseif NOT gotparam \{confirm}
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
			focus_index = 1
			long}
	else
		if isxenon
			text = qs(0xe4655cd5)
		else
			text = qs(0x3cb30bee)
		endif
		create_popup_warning_menu {
			textblock = {
				text = <text>
			}
		}
		spawnscriptnow \{ui_options_data_delete}
		menu_music_off
	endif
endscript

script ui_destroy_options_data_delete 
	destroy_popup_warning_menu
endscript

script ui_options_data_delete 
	wait \{1
		gameframe}
	get_savegame_from_controller controller = ($primary_controller)
	reset_globaltags savegame = <savegame>
	setglobaltags \{user_options
		params = {
			autosave = 1
		}}
	ui_event_wait_for_safe
	wait \{0.5
		seconds}
	ui_memcard_autosave \{event = menu_change
		state = uistate_boot_iis
		data = {
			clear_previous_stack
		}}
endscript
