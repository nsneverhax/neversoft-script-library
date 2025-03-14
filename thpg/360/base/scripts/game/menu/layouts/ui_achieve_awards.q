
script ui_create_achieve_awards 
	printf \{"UI: ui_create_achieve_awards"}
	RecordsMenu \{pad_back_script = ui_records_destroy_and_back}
endscript

script ui_destroy_achieve_awards 
	printf \{"UI: ui_destroy_achieve_awards"}
	generic_ui_destroy
endscript

script ui_records_destroy_and_back 
	if NOT infrontend
		if gamemodeequals \{is_singlesession}
			ui_change_state \{state = UIstate_hsfsprogress}
		else
			ui_change_state \{state = uistate_leaderboard}
		endif
	else
		ui_change_state \{state = UIstate_mainprogress}
	endif
endscript
