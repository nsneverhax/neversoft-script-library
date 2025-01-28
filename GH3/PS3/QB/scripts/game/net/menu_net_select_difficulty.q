
script net_create_select_difficulty_menu 
	ResetDifficultySelections
	create_select_difficulty_menu
endscript

script net_difficulty_go_back 
	if ($g_sd_p1_ready = 1)
		SendNetMessage \{Type = difficulty_selection
			DIFFICULTY = 2
			Index = 15}
	else
		SendNetMessage \{Type = difficulty_selection
			DIFFICULTY = 0
			Index = 0}
	endif
endscript

script net_sd_highlight_menuitem 
	SendNetMessage {
		Type = difficulty_selection
		DIFFICULTY = 2
		Index = <Index>
	}
endscript

script net_request_difficulty 
	if (($g_sd_p1_ready = 1) && ($g_sd_p2_ready = 1))
		return
	endif
	if ScreenElementExists \{Id = vmenu_select_difficulty}
		LaunchEvent \{Type = unfocus
			Target = vmenu_select_difficulty}
	endif
	switch <diff>
		case EASY
		<diff_index> = 3
		case MEDIUM
		<diff_index> = 4
		case HARD
		<diff_index> = 5
		case EXPERT
		<diff_index> = 6
	endswitch
	SendNetMessage {
		Type = difficulty_selection
		DIFFICULTY = <diff_index>
		Index = 0
	}
endscript

script net_select_difficulty 
	switch <difficulty_index>
		case 0
		menu_sd_back_up Player = <Player>
		return
		case 1
		return
		case 2
		if ((<Index> > -1) && (<Index> < 8))
			if (<Player> = 2)
				<diff_index> = (<Index> + 4)
				<Index> = (<Index> + 4)
			else
				<diff_index> = <Index>
			endif
			sd_highlight_menuitem Player = <Player> Index = <Index> difficulty_index = <diff_index>
			return
		else
			menu_sd_back_up Player = <Player>
			return
		endif
		case 3
		if ScreenElementExists \{Id = vmenu_select_difficulty}
			temp_selected_difficulty Player = <Player> diff = EASY
		endif
		case 4
		if ScreenElementExists \{Id = vmenu_select_difficulty}
			temp_selected_difficulty Player = <Player> diff = MEDIUM
		endif
		case 5
		if ScreenElementExists \{Id = vmenu_select_difficulty}
			temp_selected_difficulty Player = <Player> diff = HARD
		endif
		case 6
		if ScreenElementExists \{Id = vmenu_select_difficulty}
			temp_selected_difficulty Player = <Player> diff = EXPERT
		endif
	endswitch
	if (<Player> = 1)
		if NOT (($g_sd_p1_ready = 1) && ($g_sd_p2_ready = 1))
			if ScreenElementExists \{Id = vmenu_select_difficulty}
				LaunchEvent \{Type = Focus
					Target = vmenu_select_difficulty}
			endif
		endif
	endif
endscript
