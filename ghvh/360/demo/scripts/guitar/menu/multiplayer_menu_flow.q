
script create_mp_split_off_flow_for_character_select 
	generic_menu_pad_choose_sound
	ui_event_add_continue \{object = 1
		add_state_data = {
			state = uistate_character_hub
			base_name = 'character_hub'
			player = 1
			object = 1
		}
		continue_state_data = {
			state = uistate_character_select
			player = 1
			object = 1
		}}
endscript

script create_mp_split_off_flow_for_character_hub 
	if ($current_num_players = 2)
	endif
endscript

script set_store_came_from_p2_multiplayer 
	change \{store_came_from = p2_faceoff}
endscript

script mp_faceoff_song_select_quit 
	gh3_sfx_fail_song_stop_sounds
	kill_gem_scroller
endscript

script mp_faceoff_change_mode_if_coop_dlc 
	if ($coop_dlc_active = 1)
		change \{game_mode = p2_faceoff}
	endif
endscript
