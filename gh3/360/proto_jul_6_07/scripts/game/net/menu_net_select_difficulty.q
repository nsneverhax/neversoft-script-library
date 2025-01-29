
script net_create_select_difficulty_menu 
	resetdifficultyselections
	create_select_difficulty_menu
endscript

script net_difficulty_go_back 
	if ($g_sd_p1_ready = 1)
		sendnetmessage {
			type = difficulty_selection
			difficulty = 2
			index = $<index>
		}
	else
		sendnetmessage \{type = difficulty_selection
			difficulty = 0
			index = 0}
	endif
endscript

script net_sd_highlight_menuitem 
	printf \{"--- net_sd_highlight_menuitem"}
	printstruct <...>
	if (<player> = 1)
		sendnetmessage {
			type = difficulty_selection
			difficulty = 2
			index = <index>
		}
	else
		sd_highlight_menuitem player = <player> index = <index> difficulty_index = <difficulty_index>
	endif
endscript

script net_request_difficulty 
	switch <diff>
		case easy
		<diff_index> = 3
		case medium
		<diff_index> = 4
		case hard
		<diff_index> = 5
		case expert
		<diff_index> = 6
	endswitch
	sendnetmessage {
		type = difficulty_selection
		difficulty = <diff_index>
		index = 0
	}
endscript

script net_select_difficulty 
	printf "--- net_select_difficulty"
	printstruct <...>
	switch <difficulty_index>
		case 0
		menu_sd_back_up player = <player>
		return
		case 1
		return
		case 2
		if (<player> = 2)
			<diff_index> = (<index> + 4)
			<index> = (<index> + 4)
		else
			<diff_index> = <index>
		endif
		sd_highlight_menuitem player = <player> index = <index> difficulty_index = <diff_index>
		return
		case 3
		<diff> = easy
		case 4
		<diff> = medium
		case 5
		<diff> = hard
		case 6
		<diff> = expert
	endswitch
	temp_selected_difficulty player = <player> diff = <diff>
endscript
