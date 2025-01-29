
script create_mp_split_off_flow_for_character_select 
	generic_menu_pad_choose_sound
	ui_event_add_continue \{object = 1
		add_state_data = {
			state = uistate_character_hub
			base_name = 'character_hub'
			Player = 1
			object = 1
		}
		continue_state_data = {
			state = uistate_character_select
			Player = 1
			object = 1
		}}
endscript

script create_mp_split_off_flow_for_character_hub 
	if ($current_num_players = 2)
	endif
endscript

script mp_faceoff_song_select_quit 
	GH3_SFX_fail_song_stop_sounds
	kill_gem_scroller
endscript
