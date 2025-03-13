
script net_create_choose_part_menu 
	resetinstrumentselections
	ui_print_gamertags \{pos1 = (500.0, 100.0)
		pos2 = (780.0, 550.0)
		dims = (330.0, 35.0)
		just1 = [
			center
			top
		]
		just2 = [
			center
			top
		]}
	create_choose_part_menu
endscript

script net_choose_part_screen_elements 
	createscreenelement \{type = vmenu
		parent = si_scrolling_menu
		id = si_vmenu_p1
		event_handlers = [
			{
				pad_up
				select_instrument_scroll
				params = {
					player = 1
					dir = up
				}
			}
			{
				pad_down
				select_instrument_scroll
				params = {
					player = 1
					dir = down
				}
			}
			{
				pad_choose
				net_request_instrument
				params = {
					player = 1
				}
			}
			{
				pad_back
				net_instrument_go_back
				params = {
					player = 1
				}
			}
			{
				pad_start
				menu_show_gamercard
			}
		]
		exclusive_device = $player1_device}
	createscreenelement \{type = vmenu
		parent = si_scrolling_menu
		id = si_vmenu_p2}
endscript

script net_request_instrument 
	sendnetmessage {
		type = instrument_selection
		value = ($g_si_player1_index + 2)
	}
endscript

script net_select_instrument 
	if (<instrument_index> < 0)
		select_instrument_go_back player = <player>
		return
	endif
	if (<player> = 1)
		if NOT ($g_si_player1_index = <instrument_index>)
			change \{g_si_player1_locked = 1}
			change g_si_player1_index = <instrument_index>
		endif
	else
		if NOT ($g_si_player2_index = <instrument_index>)
			change \{g_si_player2_locked = 1}
			change g_si_player2_index = <instrument_index>
			force_instrument_highlight player = <player>
		endif
	endif
	choose_part_menu_select_part player = <player>
endscript

script force_instrument_highlight 
	if (<player> = 1)
		if ($g_si_player1_index = 0)
			setscreenelementprops \{id = si_hilite_p1
				pos = $g_si_hilitep1_pos}
			setscreenelementprops id = si_hilite_bookend_p1a pos = ($g_si_hilitep1_pos + (0.0, 10.0))
		else
			setscreenelementprops id = si_hilite_p1 pos = ($g_si_hilitep1_pos + (0.0, 50.0))
			setscreenelementprops id = si_hilite_bookend_p1a pos = ($g_si_hilitep1_pos + (0.0, 60.0))
		endif
	else
		if ($g_si_player2_index = 0)
			setscreenelementprops \{id = si_hilite_p2
				pos = $g_si_hilitep2_pos
				flip_h}
			setscreenelementprops id = si_hilite_bookend_p2a pos = ($g_si_hilitep2_pos + (0.0, 20.0))
		else
			setscreenelementprops id = si_hilite_p2 pos = ($g_si_hilitep2_pos + (0.0, 50.0)) flip_h
			setscreenelementprops id = si_hilite_bookend_p2a pos = ($g_si_hilitep2_pos + (0.0, 70.0))
		endif
	endif
	select_instrument_randomize_bookends player = <player>
endscript

script net_instrument_go_back 
	sendnetmessage \{type = instrument_selection
		value = 1}
endscript
