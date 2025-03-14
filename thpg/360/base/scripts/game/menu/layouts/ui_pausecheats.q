
script ui_create_pausecheats 
	if infrontend
		create_real_cheats_menu \{back_script = ui_change_state
			back_params = {
				state = UIstate_mainoptions
			}}
	else
		create_real_cheats_menu \{back_script = ui_change_state
			back_params = {
				state = UIstate_pauseoptions
			}}
	endif
endscript

script ui_destroy_pausecheats 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	generic_ui_destroy
	foreachin \{$Cheat_Menu_Array
		do = ui_pause_cheats_update}
endscript

script ui_pause_cheats_update 
	if gotparam \{update}
		<update>
	endif
endscript
