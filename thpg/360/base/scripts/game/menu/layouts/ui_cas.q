ui_cas_skater_selected = 0

script ui_create_cas 
	printf "UI: ui_create_cas"
	if isxenon
		<warning_text> = "This will not affect STORY mode. The STORY skater's appearance can only be changed while in STORY mode. This menu edits the skater used in Xbox LIVE, 2-PLAYER, and HIGH SCORE/FREE SKATE modes."
	else
		<warning_text> = "This will not affect STORY mode. The STORY skater's appearance can only be changed while in STORY mode. This menu edits the skater used in 2-PLAYER, and HIGH SCORE/FREE SKATE modes."
	endif
	create_dialog_box {
		title = "WARNING!"
		text = <warning_text>
		vmenu_width = 600
		text_dims = (700.0, 0.0)
		buttons = [
			{
				text = "CONTINUE"
				pad_choose_script = ui_cas_select_character
			}
			{
				text = "CANCEL"
				pad_choose_script = ui_change_state
				pad_choose_params = {state = uistate_mainmenu}
			}
		]
	}
endscript

script ui_destroy_cas 
	printf \{"UI: ui_destroy_cas"}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript
