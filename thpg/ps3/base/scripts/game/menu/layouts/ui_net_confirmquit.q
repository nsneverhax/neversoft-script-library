
script ui_create_net_confirmquit 
	printf "UI: ui_create_net_confirmquit"
	if ishost
		if isxenon
			<text> = "Are you sure you wish to leave this Xbox LIVE game?\\nLeaving the game will end the session."
		else
			<text> = "Are you sure you wish to leave this online game?\\nLeaving the game will end the session."
		endif
	else
		if isxenon
			<text> = "Are you sure you wish to leave this Xbox LIVE game?"
		else
			<text> = "Are you sure you wish to leave this online game?"
		endif
	endif
	pad_choose_script = quit_network_game
	if gotparam to_singleplayer
		pad_choose_script = quit_back_to_singleplayer
	endif
	create_dialog_box {
		title = "WARNING!"
		text = <text>
		pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 255]
		text_scale = 0.6
		buttons = [{font = text_a1 text = "QUIT" pad_choose_script = <pad_choose_script>}
			{font = text_a1 text = "CANCEL" pad_choose_script = ui_net_noquit id = no_button}
		]
		pad_back_script = ui_net_noquit
		preserve_case
		vmenu_width = 500
		text_dims = (600.0, 0.0)
	}
endscript

script ui_destroy_net_confirmquit 
	printf \{"UI: ui_destroy_net_confirmquit"}
	generic_ui_destroy
endscript

script ui_net_noquit 
	dialog_box_exit
	ui_change_state \{state = uistate_pausemenu}
endscript
