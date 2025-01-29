
script ui_create_options_data_delete 
	if NOT GotParam \{really}
		create_dialog_box \{body_text = qs(0x16539585)
			options = [
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
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
			]}
	elseif NOT GotParam \{confirm}
		create_dialog_box \{body_text = qs(0xc2f98014)
			options = [
				{
					func = generic_event_back
					text = qs(0xf7723015)
				}
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
			]}
	else
		SpawnScriptNow \{ui_options_data_delete}
		menu_music_off
	endif
endscript

script ui_destroy_options_data_delete 
	destroy_dialog_box
endscript

script ui_options_data_delete 
	create_dialog_box \{body_text = qs(0x3cb30bee)}
	Wait \{1
		Second}
	get_savegame_from_controller controller = ($primary_controller)
	Wait \{2
		gameframes}
	GetGlobalTags \{user_options
		params = {
			autosave
		}}
	reset_globaltags savegame = <savegame>
	SetGlobalTags user_options params = {autosave = <autosave>}
	formatText TextName = bandname_id 'band%i' i = ($current_band)
	formatText checksumName = default_bandname 'band%i_info' i = ($current_band) AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <default_bandname> params = {($default_bandtags)}
	deleteonlineprofile
	ui_event_wait_for_safe
	ui_memcard_save \{event = menu_change
		state = uistate_mainmenu
		data = {
			clear_previous_stack
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
