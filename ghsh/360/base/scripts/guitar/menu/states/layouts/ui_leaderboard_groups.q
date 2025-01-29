
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

script ui_leaderboard_group_select 
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
