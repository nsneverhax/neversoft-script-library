
script ngc_nand_fatal 
	pausegh3
	ngc_bgcolor \{r = 64
		g = 0
		b = 0
		a = 255}
	ngc_message \{font = qs(0xa802346c)
		text = qs(0x5eeccaac)
		y = 160
		Scale = 2}
	ngc_message \{font = qs(0xa802346c)
		text = qs(0x2ab3fb35)
		Scale = 2}
endscript
ngc_corrupt_running = 0

script ngc_cnt_corrupt 
	printf \{qs(0xf0fa75a7)}
	if ($ngc_corrupt_running = 1)
		return
	endif
	Change \{ngc_corrupt_running = 1}
	ui_event_wait_for_safe
	ui_event_get_top
	if (<base_name> = 'setlist')
		get_song_title song = ($target_setlist_songpreview)
		get_song_prefix song = ($target_setlist_songpreview)
	else
		get_song_title song = ($current_song)
		get_song_prefix song = ($current_song)
	endif
	if (<base_name> = 'play_song')
		begin
		ui_event_get_top
		if NOT (<base_name> = 'play_song')
			break
		endif
		WaitOneGameFrame
		repeat
		Wait \{1
			Second}
	endif
	printf \{'DO IT! DO IT NOW!'}
	if ($is_network_game)
		quit_network_game
	endif
	formatText TextName = error_text qs(0x73ff2cbb) n = <song_title>
	if (<base_name> = 'gameplay')
		hide_highway
		pausegh3
		create_loading_screen
		loading_screen_container :se_setprops \{loading_text = qs(0x00000000)
			tip_text = qs(0x00000000)}
		ui_event_block \{event = menu_back
			state = uistate_mainmenu}
		destroy_loading_screen
		unpausegh3
	else
		ui_event_block \{event = menu_back
			state = uistate_mainmenu}
	endif
	create_generic_popup {
		title = qs(0x79597197)
		ok_menu
		message = <error_text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose destroy_generic_popup}
		]
	}
	GetContentFolderIndexFromFile <song_prefix>
	if (<content_index> > 0)
		cntgetflags index = <content_index>
		if (<flag_corrupt> = FALSE)
			cnttoggleflag index = <content_index> flag = 2
		endif
	endif
	Change \{ngc_corrupt_running = 0}
endscript
