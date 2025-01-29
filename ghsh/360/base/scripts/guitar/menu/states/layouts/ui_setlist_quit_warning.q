
script ui_create_setlist_quit_warning 
	printstruct <...>
	create_popup_warning_menu \{textblock = {
			text = qs(0x2cba2a44)
			dims = (800.0, 400.0)
			Scale = 0.55
		}
		use_all_controllers
		no_background
		menu_pos = (640.0, 520.0)
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
	destroy_popup_warning_menu
endscript

script setlist_quit_warning_select_no 
	ui_setlist_go_back
endscript

script setlist_quit_warning_select_yes 
	ui_setlist_go_back \{num_states = 2}
endscript
