
script ui_create_setlist_quit_warning 
	printstruct <...>
	create_dialog_box \{body_text = qs(0x43eb4df5)
		use_all_controllers
		no_background
		options = [
			{
				func = setlist_quit_warning_select_no
				text = qs(0xf7723015)
			}
			{
				func = setlist_quit_warning_select_yes
				text = qs(0x23b6e962)
			}
		]}
endscript

script ui_destroy_setlist_quit_warning 
	destroy_dialog_box
endscript

script setlist_quit_warning_select_no 
	ui_setlist_go_back
endscript

script setlist_quit_warning_select_yes 
	if ($g_band_lobby_flag = 1)
		generic_event_back \{state = uistate_band_lobby_setup}
	else
		ui_setlist_go_back \{num_states = 2}
	endif
endscript
