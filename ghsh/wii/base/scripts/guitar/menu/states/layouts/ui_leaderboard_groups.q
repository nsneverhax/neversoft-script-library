
script ui_create_leaderboard_groups 
	Change \{rich_presence_context = presence_leaderboards}
	make_generic_menu {
		title = qs(0xa1ae7e56)
		exclusive_device = ($primary_controller)
	}
	add_generic_menu_text_item \{text = qs(0x40715f09)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = song
		}}
	add_generic_menu_text_item \{text = qs(0xbe4b72af)
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = career
		}}
	menu_finish
endscript

script ui_destroy_leaderboard_groups 
	generic_ui_destroy
endscript

script 0xa9642264 
	text = qs(0x00000000)
	if NOT IsLoggedIn
		text = qs(0x734ff928)
	elseif NOT IsLoggedIn \{0x5f495f02}
		text = qs(0x5362a397)
	endif
	if NOT (<text> = qs(0x00000000))
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = unfocus
				target = current_menu}
		endif
		create_net_popup title = qs(0x79597197) popup_text = <text>
		Wait \{3
			Seconds}
		destroy_net_popup
		if ScreenElementExists \{id = current_menu}
			LaunchEvent \{Type = focus
				target = current_menu}
		endif
		return \{FALSE}
	endif
	return \{true}
endscript

script ui_leaderboard_group_select 
	if NOT 0xa9642264
		return
	endif
	create_loading_screen
	Change current_leaderboard_group = <group>
	if (<group> = song)
		if isXenon
			Change \{current_leaderboard_array = $master_leaderboard_song_list}
		else
			Change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
		endif
		generic_event_choose \{state = uistate_leaderboard_instrument}
	else
		if isXenon
			Change \{current_leaderboard_array = $master_leaderboard_career_list}
		else
			Change \{current_leaderboard_array = $master_leaderboard_career_list_ps3}
		endif
		generic_event_choose \{state = uistate_leaderboard_list}
	endif
endscript
