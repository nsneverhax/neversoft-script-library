net_horse_layout_states_classic = [
	{
		enter_script = net_horse_layout_pieces_helper_text
		enter_params = {
			title = "START POSITION"
			text = "Please place a start point for where the skater should start the run from."
			done_script = net_horse_layout_set_piece_index
			done_params = {
				piece_index = 0
			}
		}
		exit_script = net_horse_layout_pieces_helper_text_generic_cleanup
		error_script = net_horse_layout_pieces_helper_text
		error_params = {
			title = "ERROR"
			text = "You must place a start point for where the skater should start the run from."
		}
	}
	{
		enter_script = net_horse_layout_pieces_helper_text
		enter_params = {
			title = "CHOOSE PIECES"
			text = "Please choose the pieces all players must trick hit in their combos."
			done_script = net_horse_layout_set_piece_index
			done_params = {
				piece_index = 1
			}
		}
		validation_script = $net_horse_layout_validation_script
		exit_script = net_horse_layout_pieces_helper_text_generic_cleanup
		error_script = net_horse_layout_pieces_helper_text
		error_params = {
			title = "ERROR"
			text = "You must choose at least one piece to hit in a combo."
		}
	}
	{
		enter_script = net_horse_layout_pieces_helper_text
		enter_params = {
			title = "FINISH POSITION"
			text = "Please place a finish point for the end of the goal."
			done_script = net_horse_layout_set_piece_index
			done_params = {
				piece_index = 3
			}
		}
		exit_script = net_horse_layout_pieces_helper_text_generic_cleanup
		error_script = net_horse_layout_pieces_helper_text
		error_params = {
			title = "ERROR"
			text = "You must place an end position."
		}
	}
	{
		enter_script = net_horse_menu_finish_selection
		error_script = nullscript
		exit_script = nullscript
	}
]
net_horse_layout_states_ntt = [
	{
		enter_script = net_horse_layout_pieces_helper_text
		enter_params = {
			title = "START POSITION"
			text = "Please place a start point for where the skater should start the run from."
			done_script = net_horse_layout_set_piece_index
			done_params = {
				piece_index = 0
			}
		}
		exit_script = net_horse_layout_pieces_helper_text_generic_cleanup
		error_script = net_horse_layout_pieces_helper_text
		error_params = {
			title = "ERROR"
			text = "You must place a start point for where the skater should start the run from."
		}
	}
	{
		enter_script = net_horse_layout_pieces_helper_text
		enter_params = {
			title = "PLACE KICKER"
			text = "Please place the kicker."
			done_script = net_horse_layout_set_piece_index
			done_params = {
				piece_index = 2
			}
		}
		validation_script = $net_horse_layout_validation_script
		exit_script = net_horse_layout_pieces_helper_text_generic_cleanup
		error_script = net_horse_layout_pieces_helper_text
		error_params = {
			title = "ERROR"
			text = "You must place the kicker before continuing."
		}
	}
	{
		enter_script = net_horse_menu_finish_selection
		error_script = nullscript
		exit_script = nullscript
	}
]
net_horse_current_menu_states = [
]

script net_horse_layout_set_can_proceed 
	printf \{"--- net_horse_layout_set_can_proceed"}
	net_horse_menu_cont :settags \{can_proceed = 1}
endscript

script net_horse_layout_set_no_proceed 
	printf \{"--- net_horse_layout_set_can_proceed"}
	net_horse_menu_cont :settags \{can_proceed = 0}
endscript

script net_horse_move_next_state 
	printf "--- net_horse_next_state"
	if screenelementexists id = net_horse_layout_info_dialog
		return
	endif
	net_horse_menu_cont :getsingletag layout_state
	got_error = 0
	if structurecontains structure = ($net_horse_current_menu_states [<layout_state>]) validation_script
		validation_script = ($net_horse_current_menu_states [<layout_state>].validation_script)
		<validation_script>
		if (<is_valid> = 0)
			got_error = 1
		endif
	else
		net_horse_menu_cont :getsingletag can_proceed
		if (<can_proceed> = 0)
			got_error = 1
		endif
	endif
	if (<got_error> = 1)
		error_script = ($net_horse_current_menu_states [<layout_state>].error_script)
		if structurecontains structure = ($net_horse_current_menu_states [<layout_state>]) error_params
			error_params = ($net_horse_current_menu_states [<layout_state>].error_params)
		endif
		<error_script> <error_params>
		return
	endif
	exit_script = ($net_horse_current_menu_states [<layout_state>].exit_script)
	if structurecontains structure = ($net_horse_current_menu_states [<layout_state>]) exit_params
		exit_params = ($net_horse_current_menu_states [<layout_state>].exit_params)
	endif
	<exit_script> <exit_params>
	getarraysize $net_horse_current_menu_states
	layout_state = (<layout_state> + 1)
	if (<layout_state> = <array_size>)
		softassert "We don't want to support looping with these states!"
		layout_state = 0
	endif
	net_horse_menu_cont :settags can_proceed = 0
	enter_script = ($net_horse_current_menu_states [<layout_state>].enter_script)
	if structurecontains structure = ($net_horse_current_menu_states [<layout_state>]) enter_params
		enter_params = ($net_horse_current_menu_states [<layout_state>].enter_params)
	endif
	<enter_script> <enter_params>
	net_horse_menu_cont :settags layout_state = <layout_state>
endscript

script net_horse_layout_pieces_helper_text 
	printf "--- net_horse_layout_pieces_helper_text"
	launchevent {
		type = unfocus
		target = net_horse_menu_vmenu
	}
	create_dialog_box {
		anchor_id = net_horse_layout_info_dialog
		container_id = net_horse_layout_info_cont
		vmenu_id = net_horse_layout_info_vmenu
		title = <title>
		text = <text>
		z_priority = 5
		buttons = [
			{text = "CONTINUE" pad_choose_script = net_horse_layout_pieces_helper_text_close}
		]
	}
	if gotparam done_script
		net_horse_layout_info_dialog :settags done_script = <done_script> done_params = <done_params>
	endif
	launchevent {
		type = focus
		target = net_horse_layout_info_cont
	}
	kill_start_key_binding
endscript

script net_horse_layout_pieces_helper_text_close 
	printf "--- net_horse_layout_pieces_helper_text_close"
	net_horse_layout_info_dialog :gettags
	dialog_box_exit anchor_id = net_horse_layout_info_dialog
	kill_start_key_binding
	if gotparam done_script
		<done_script> <done_params>
	endif
	launchevent {
		type = focus
		target = net_horse_menu_vmenu
	}
	<helper_text_elements> = [
		{text = "\\m5 Continue"}
		{text = "\\m0 Select"}
	]
	create_helper_text {
		helper_text_elements = <helper_text_elements>
	}
endscript

script net_horse_layout_pieces_helper_text_generic_cleanup 
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
endscript

script net_horse_layout_set_piece_index 
	printf \{"--- net_horse_layout_set_piece_index"}
	cap_scroll_object force_index = <piece_index> constructtype = ($cap_current_category)
	net_horse_menu_finish
endscript

script net_horse_initialize_layout_state 
	printf \{"--- net_horse_initialize_layout_state"}
	net_horse_menu_cont :getsingletag \{layout_state}
	net_horse_menu_cont :settags \{can_proceed = 0}
	enter_script = ($net_horse_current_menu_states [<layout_state>].enter_script)
	if structurecontains structure = ($net_horse_current_menu_states [<layout_state>]) enter_params
		enter_params = ($net_horse_current_menu_states [<layout_state>].enter_params)
	endif
	kill_start_key_binding
	<enter_script> <enter_params>
endscript
