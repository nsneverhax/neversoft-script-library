
script 0x57eeea03 
	0x1621ea7b
endscript

script 0x6ed6dac4 
	0xbd6424fc
endscript

script ui_create_setlist_quit_warning 
	setlistinterface :obj_spawnscript \{0x8ed8c79c
		params = {
			0xb5b8c63e
		}}
	gamemode_gettype
	if (<Type> = pro_faceoff)
		body_text = qs(0x22e09b86)
	else
		body_text = qs(0x43eb4df5)
	endif
	create_dialog_box {
		body_text = <body_text>
		use_all_controllers
		options = [
			{
				func = setlist_quit_warning_select_no
				text = qs(0xf7723015)
			}
			{
				func = setlist_quit_warning_select_yes
				text = qs(0x23b6e962)
			}
		]
	}
endscript

script ui_destroy_setlist_quit_warning 
	KillSpawnedScript \{Name = 0x8ed8c79c}
	destroy_dialog_box
endscript

script setlist_quit_warning_select_no 
	ui_setlist_go_back
endscript

script setlist_quit_warning_select_yes 
	gamemode_gettype
	if (<Type> = pro_faceoff)
		ui_setlist_go_back \{num_states = 4}
	else
		ui_setlist_go_back \{num_states = 2}
	endif
endscript
