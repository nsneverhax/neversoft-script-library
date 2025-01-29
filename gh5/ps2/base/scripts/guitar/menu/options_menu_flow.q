options_for_manage_band = 0
top_rockers_enabled = 0
top_rockers_which_mode = p1_quickplay

script setup_top_rockers_single 
	Change \{top_rockers_enabled = 1}
	Change \{top_rockers_which_mode = p1_quickplay}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	if GotParam \{device_num}
		Change primary_controller = <device_num>
	endif
	set_primary_controller device_num = <device_num> state = uistate_select_instrument data = {from_top_rocker = 1 override_base_name = 'options'}
endscript

script setup_top_rockers_coop 
	Change \{top_rockers_which_mode = p2_quickplay}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	generic_event_choose \{state = uistate_select_instrument
		data = {
			from_top_rocker = 1
			override_base_name = 'options'
		}}
endscript

script setup_top_rockers_for_mode 
	Change game_mode = ($top_rockers_which_mode)
	Change current_difficulty_coop = ($player1_status.difficulty)
	if ($game_mode = p1_quickplay)
		Change \{current_num_players = 1}
	elseif ($game_mode = p2_quickplay)
		Change \{current_num_players = 2}
	endif
endscript

script reset_top_rockers_mode 
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
endscript
store_autosave_required = 0

script store_maybe_autosave 
	if ($store_autosave_required = 1)
		Change \{store_autosave_required = 0}
		return \{flow_state = store_autosave_fs}
	else
		go_back_to_where_you_came_from
		return flow_state = <flow_state>
	endif
endscript
