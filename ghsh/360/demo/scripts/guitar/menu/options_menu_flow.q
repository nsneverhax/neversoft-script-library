options_for_manage_band = 0
top_rockers_which_mode = p1_quickplay

script setup_top_rockers_single 
	change \{top_rockers_which_mode = p1_quickplay}
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
	generic_event_choose \{state = uistate_select_instrument
		data = {
			from_top_rocker = 1
			override_base_name = 'options'
		}}
endscript
