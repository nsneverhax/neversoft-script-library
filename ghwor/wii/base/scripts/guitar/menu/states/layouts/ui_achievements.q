
script ui_init_achievements 
	if ininternetmode
		push_block_home_button
	endif
endscript

script ui_create_achievements \{friends_uid = [
			0
			0
		]
		friends_name = qs(0x03ac90f0)}
	create_achievements_ui {
		exit_Script = generic_event_back
		friends_uid = <friends_uid>
		friends_name = <friends_name>
	}
endscript

script ui_return_achievements 
	achievements_ui_add_helper_pills_and_focus
endscript

script ui_deinit_achievements 
	if ininternetmode
		pop_block_home_button
	endif
endscript
