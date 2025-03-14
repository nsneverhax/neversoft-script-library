
script ui_create_loadgame 
	printf "UI: ui_create_loadgame"
	if checksumequals a = <from_state> b = UIstate_LoadGame
		<pad_choose_script> = launch_options_menu_load_game_sequence
		<back_state> = UIstate_mainoptions
	else
		<pad_choose_script> = launch_career_menu_load_game_sequence
		<back_state> = UIstate_yourlife
	endif
	if mc_hasvalidatedfolder
		pad_choose_params = {force = 1}
	else
		pad_choose_params = {force = 0}
	endif
	if getglobalflag flag = $career_started
		create_dialog_box {
			title = "WARNING!"
			text = "Any unsaved changes to your current game progress will be lost.\\nContinue?"
			pos = (320.0, 240.0)
			just = [center center]
			buttons = [{font = text_a1 text = "LOAD GAME" pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>}
				{font = text_a1 text = "CANCEL" pad_choose_script = ui_no_load pad_choose_params = {back_state = <back_state>}}
			]
		}
	else
		spawnscriptnow <pad_choose_script> params = {<pad_choose_params>}
	endif
endscript

script ui_destroy_loadgame 
	printf \{"UI: ui_destroy_loadgame"}
	generic_ui_destroy
endscript

script ui_no_load 
	dialog_box_exit
	ui_change_state state = <back_state>
endscript
