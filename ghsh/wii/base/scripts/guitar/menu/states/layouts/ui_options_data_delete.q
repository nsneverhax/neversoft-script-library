
script ui_create_options_data_delete 
	if 0x8658e568
		destroy_loading_screen
	endif
	if IsLoggedIn
		create_new_generic_popup \{popup_type = yes_no_menu
			title = qs(0xb2359d6b)
			text = qs(0xf2366899)
			yes_func = reset_data_online_confirmation
			yes_func_params = {
				logoff
			}
			no_func = reset_data_online_confirmation
			no_func_params = {
				go_back
			}}
	elseif NOT GotParam \{really}
		create_popup_warning_menu \{textblock = {
				text = qs(0x136b155e)
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
					func = 0x9082a17c
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
						state = uistate_memcard
						data = {
							Type = replace
						}
					}
					text = qs(0x120d3970)
				}
				{
					func = 0x9082a17c
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
	destroy_popup_warning_menu
endscript

script ui_options_data_delete 
	create_popup_warning_menu \{textblock = {
			text = qs(0xbcacfe8f)
		}}
	Wait \{1
		Second}
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags \{user_options
		params = {
			autosave
		}}
	reset_globaltags savegame = <savegame>
	get_band_info
	SetGlobalTags savegame = <savegame> <band_info> params = {($default_bandtags)}
	0x3227a145 index = ($current_band - 1)
	SetGlobalTags \{user_options
		params = {
			autosave = 1
		}}
	ui_event_wait_for_safe
	create_loading_screen
	ui_memcard_autosave \{event = menu_change
		state = uistate_boot_iis
		data = {
			clear_previous_stack
			0x6d221ff1
		}}
endscript

script reset_data_online_confirmation 
	destroy_generic_popup
	if GotParam \{logoff}
		logout
		generic_event_replace \{state = uistate_options_data_delete}
	endif
	if GotParam \{go_back}
		generic_event_back
	endif
endscript

script 0x9082a17c 
	create_loading_screen
	generic_event_back
endscript
