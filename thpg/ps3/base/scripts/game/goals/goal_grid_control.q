
script grid_control_init_grid_control_manager 
	return
	if ($grids_for_career_added = 0)
		loadpak \{'pak/grid_control/grid_control.pak'
			localized
			no_vram}
		GridControlFunc \{func = add_all_grids}
		unloadpak \{'pak/grid_control/grid_control.pak'
			localized}
		change \{grids_for_career_added = 1}
	endif
endscript

script grid_control_deinit_grid_control_manager 
	return
	if ($grids_for_career_added = 1)
		GridControlFunc \{func = remove_all_grids}
		change \{grids_for_career_added = 0}
	endif
endscript

script grid_control_init 
	manglechecksums a = <grid_id> b = _trigger
	if iscreated <mangled_id>
		return
	endif
	setsearchallassetcontexts
	createcompositeobject {
		components = [
			{component = motion}
			{component = model}
			{component = hover}
			{component = suspend}
			{component = objectproximity}
		]
		params = {
			name = <mangled_id>
			model = 'Props\\movable_marker\\movable_marker.mdl'
			pos = <trigger_pos>
		}
	}
	setsearchallassetcontexts off
	<mangled_id> :obj_roty speed = 200
	<mangled_id> :obj_hover amp = 0.25 freq = 2
	<mangled_id> :obj_setoutlineflag on
	<trigger_obj_id> = <mangled_id>
	<speech_box_id> = grid_control_enter_dialog
	grid_control_trigger_init grid_id = <grid_id> trigger_obj_id = <trigger_obj_id> speech_box_id = <speech_box_id> goal = <goal>
endscript

script grid_control_trigger_init 
	runscriptonobject {
		id = <trigger_obj_id>
		grid_control_trigger_set_in_exceptions
		params = {grid_id = <grid_id> trigger_obj_id = <trigger_obj_id> speech_box_id = <speech_box_id> goal = <goal>}
	}
endscript

script grid_control_trigger_set_in_exceptions 
	speech_box_exit anchor_id = <speech_box_id>
	cleareventhandler \{objectoutofradius}
	cleareventhandler \{objectinradius}
	obj_setinnerradius \{2}
	seteventhandler {
		event = objectinradius
		scr = grid_control_trigger_speech_box_show
		response = switch_script
		params = {
			grid_id = <grid_id>
			trigger_obj_id = <trigger_obj_id>
			speech_box_id = <speech_box_id>
			goal = <goal>
		}
	}
endscript

script grid_control_trigger_set_out_exceptions 
	cleareventhandler \{objectinradius}
	cleareventhandler \{objectoutofradius}
	obj_setouterradius \{3}
	seteventhandler {
		event = objectoutofradius
		scr = grid_control_trigger_set_in_exceptions
		response = switch_script
		params = {
			grid_id = <grid_id>
			trigger_obj_id = <trigger_obj_id>
			speech_box_id = <speech_box_id>
			goal = <goal>
		}
	}
endscript

script grid_control_trigger_speech_box_show 
	<display_speech_box> = 1
	gman_getactivatedgoalid
	if gotparam activated_goal_id
		if gotparam goal
			if NOT checksumequals a = <activated_goal_id> b = <goal>
				<display_speech_box> = 0
			endif
		else
			<display_speech_box> = 0
		endif
	endif
	if (<display_speech_box> = 1)
		getskaterid
		<skaterid> = <objid>
		if <skaterid> :isinbail
			<display_speech_box> = 0
		else
			if skatercurrentscorepotgreaterthan 0
				<display_speech_box> = 0
			else
				if <skaterid> :skating
					if NOT <skaterid> :onground
						if <skaterid> :rightpressed
							<display_speech_box> = 0
						endif
						if <skaterid> :leftpressed
							<display_speech_box> = 0
						endif
						if <skaterid> :uppressed
							<display_speech_box> = 0
						endif
						if <skaterid> :downpressed
							<display_speech_box> = 0
						endif
					endif
				else
					if NOT <skaterid> :walk_ground
						<display_speech_box> = 0
					endif
				endif
			endif
		endif
	endif
	if (<display_speech_box> = 1)
		runscriptonobject {
			id = <trigger_obj_id>
			grid_control_trigger_set_out_exceptions
			params = {grid_id = <grid_id> trigger_obj_id = <trigger_obj_id> speech_box_id = <speech_box_id> goal = <goal>}
		}
		player1_panel_container :settags grid_control_speech_box = <speech_box_id>
		create_speech_box {
			anchor_id = <speech_box_id>
			parent = player1_panel_container
			text = "\\m5 Move Stuff Around"
			no_pad_choose
			no_pad_start
			pad_option_script = grid_control_trigger_speech_box_accept
			pad_option_params = {grid_id = <grid_id> trigger_obj_id = <trigger_obj_id> speech_box_id = <speech_box_id> goal = <goal>}
			z_priority = 5
			font = text_a1
		}
	endif
endscript

script grid_trigger_dialog_kill 
	if screenelementexists \{id = grid_control_enter_dialog}
		destroyscreenelement \{id = grid_control_enter_dialog}
	endif
endscript

script grid_control_trigger_speech_box_accept 
	speech_box_exit anchor_id = <speech_box_id>
	grid_control_enter {
		grid = <grid_id>
		exit_script = grid_control_trigger_init
		exit_params = {grid_id = <grid_id> trigger_obj_id = <trigger_obj_id> speech_box_id = <speech_box_id> goal = <goal>}
	}
endscript

script grid_control_enter 
	if innetgame
		return
	endif
	if inmultiplayergame
		return
	endif
	speech_box_exit
	MakeSkaterGoto \{SkaterInit}
	skater :pausephysics
	skater :disableplayerinput
	grid_control_create_event_handler grid = <grid> exit_script = <exit_script> exit_params = <exit_params>
	grid_control_helper_text_create \{state = none_none}
	kill_start_key_binding
	GridControlFunc func = activate_grid params = {grid = <grid>}
	change \{grid_control_clear_for_action = 1}
	broadcastevent \{type = event_grid_control_enter}
endscript

script grid_control_exit 
	killspawnedscript \{name = wait_refocus_event_handler}
	grid_control_handle :gettags
	grid_control_destroy_event_handler
	GridControlFunc func = deactivate_grid params = {grid = <grid>}
	change \{grid_control_clear_for_action = 1}
	skater :unpausephysics
	skater :enableplayerinput
	MakeSkaterGoto \{SkaterInit}
	restore_start_key_binding
	if gotparam \{exit_script}
		<exit_script> <exit_params>
	endif
	broadcastevent \{type = event_grid_control_exit}
endscript

script grid_control_instructions_create text = ""
	begin
	block type = event_grid_control_enter
	if screenelementexists id = grid_control_instruction_text
		destroyscreenelement id = grid_control_instruction_text
	endif
	setscreenelementlock id = root_window off
	createscreenelement {
		id = grid_control_instruction_text
		parent = root_window
		type = textblockelement
		text = <text>
		font = text_a1
		pos = (515.0, 50.0)
		dims = (315.0, 0.0)
		allow_expansion
		scale = 0.45000002
		just = [center top]
		rgba = [90 90 90 255]
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		not_focusable
	}
	onexitrun grid_control_instructions_destroy
	block type = event_grid_control_exit
	grid_control_instructions_destroy
	repeat
endscript

script grid_control_instructions_destroy 
	if screenelementexists \{id = grid_control_instruction_text}
		destroyscreenelement \{id = grid_control_instruction_text}
	endif
endscript

script grid_control_uninit 
	manglechecksums a = <grid_id> b = _trigger
	if iscreated <mangled_id>
		<mangled_id> :die
	endif
endscript

script grid_control_pickup 
	grid_control_handle :gettags
	GridControlFunc func = pickup params = {grid = <grid>}
endscript

script grid_control_drop 
	grid_control_handle :gettags
	GridControlFunc func = drop params = {grid = <grid>}
endscript

script grid_control_move 
	grid_control_handle :gettags
	GridControlFunc func = move params = {grid = <grid> dir = <dir>}
endscript

script grid_control_rotate 
	grid_control_handle :gettags
	GridControlFunc func = rotate params = {grid = <grid>}
endscript

script grid_control_combine 
	grid_control_handle :gettags
	GridControlFunc func = combine params = {grid = <grid>}
endscript

script grid_control_separate 
	grid_control_handle :gettags
	GridControlFunc func = separate params = {grid = <grid>}
endscript

script grid_control_swap 
	grid_control_handle :gettags
	GridControlFunc func = swap params = {grid = <grid>}
endscript

script grid_control_create_add_object_menu 
	launchevent type = unfocus target = grid_control_handle
	grid_control_handle :gettags
	GridControlFunc func = get_available_object_types params = {grid = <grid>}
	getarraysize available_object_types
	<index> = 0
	<num_added> = 0
	<buttons> = []
	<tmp_array> = [{font = none text = "none" button_text_scale = 0.65000004 pad_choose_script = null_script pad_choose_params = {type = none}}]
	begin
	if structurecontains structure = (<available_object_types> [<index>]) name
		<button> = {
			font = text_a1
			button_text_scale = 0.7
			button_dims = (0.0, 50.0)
			text = ((<available_object_types> [<index>]).name)
			pad_choose_script = grid_control_add
			pad_choose_params = {type = ((<available_object_types> [<index>]).type)}
		}
		setarrayelement {
			arrayname = tmp_array
			index = 0
			newvalue = <button>
		}
		<buttons> = (<buttons> + <tmp_array>)
		<num_added> = (<num_added> + 1)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if (<num_added> > 0)
		<button> = {
			font = text_a1
			button_text_scale = 0.7
			button_dims = (0.0, 20.0)
			text = "Back"
			pad_choose_script = grid_control_cancel_add
		}
		setarrayelement {
			arrayname = tmp_array
			index = 0
			newvalue = <button>
		}
		<buttons> = (<buttons> + <tmp_array>)
		create_dialog_box {
			title = "CREATE OBJECT"
			text = "SELECT A NEW OBJECT TO ADD:"
			pos = (320.0, 240.0)
			just = [center center]
			text_rgba = [88 105 112 255]
			text_scale = 0.6
			pad_back_script = grid_control_cancel_add
			buttons = <buttons>
			use_goalmenu_bg
		}
	else
		grid_control_cant_add
	endif
endscript

script grid_control_cancel_add 
	dialog_box_exit
	kill_start_key_binding
	grid_control_helper_text_recreate
	killspawnedscript \{name = wait_refocus_event_handler}
	spawnscriptlater \{wait_refocus_event_handler}
endscript

script grid_control_add 
	dialog_box_exit
	kill_start_key_binding
	grid_control_handle :gettags
	GridControlFunc func = add_object params = {grid = <grid> type = <type>}
	killspawnedscript \{name = wait_refocus_event_handler}
	spawnscriptlater \{wait_refocus_event_handler}
endscript

script grid_control_cant_add 
	create_dialog_box {
		title = "CREATE OBJECT"
		text = "All Objects Already In Use"
		pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 255]
		text_scale = 0.6
		pad_back_script = grid_control_confirm_cant_add
		buttons = [
			{font = text_a1 text = "OK" pad_choose_script = grid_control_confirm_cant_add}
		]
	}
endscript

script grid_control_confirm_cant_add 
	dialog_box_exit
	kill_start_key_binding
	grid_control_helper_text_recreate
	killspawnedscript \{name = wait_refocus_event_handler}
	spawnscriptlater \{wait_refocus_event_handler}
endscript

script grid_control_confirm_remove 
	launchevent type = unfocus target = grid_control_handle
	create_dialog_box {
		title = "Confirm Delete"
		text = "Really delete this object?"
		pos = (320.0, 240.0)
		just = [center center]
		text_rgba = [88 105 112 255]
		text_scale = 0.75
		pad_back_script = grid_control_cancel_remove
		buttons = [
			{font = text_a1 text = "Delete" pad_choose_script = grid_control_remove}
			{font = text_a1 text = "Cancel" pad_choose_script = grid_control_cancel_remove}
		]
	}
endscript

script grid_control_cancel_remove 
	dialog_box_exit
	kill_start_key_binding
	grid_control_helper_text_recreate
	killspawnedscript \{name = wait_refocus_event_handler}
	spawnscriptlater \{wait_refocus_event_handler}
endscript

script grid_control_remove 
	dialog_box_exit
	kill_start_key_binding
	grid_control_handle :gettags
	GridControlFunc func = remove_object params = {grid = <grid>}
	killspawnedscript \{name = wait_refocus_event_handler}
	spawnscriptlater \{wait_refocus_event_handler}
endscript

script grid_control_wait_complete_action 
	change grid_control_clear_for_action = 0
	<enter_loop> = 0
	if gotparam moving
		<enter_loop> = 1
	else
		if gotparam rotating
			<enter_loop> = 1
		endif
	endif
	if (<enter_loop> = 1)
		if NOT gotparam object_id
			script_assert "No object_id param passed to grid_control_wait_complete_action, when moving or rotating was indicated."
		endif
		begin
		if gotparam moving
			if NOT <object_id> :obj_ismoving
				break
			endif
		else
			if NOT <object_id> :obj_isrotating
				break
			endif
		endif
		wait 2 gameframes
		repeat
	endif
	if gotparam state
		grid_control_handle :obj_killspawnedscript name = grid_control_set_event_handlers
		grid_control_handle :obj_spawnscriptlater grid_control_set_event_handlers params = {state = <state>}
		grid_control_helper_text_create state = <state>
	endif
	change grid_control_clear_for_action = 1
endscript

script grid_control_spin_cursor 
	grid_control_stop_cursor cursor_id = <cursor_id>
	<cursor_id> :obj_roty speed = 500
endscript

script grid_control_stop_cursor 
	<cursor_id> :obj_stoprotating
endscript

script grid_control_cam_set 
	playigccamscene {
		controlscript = grid_control_cam_control
		name = grid_control_igccam
		play_hold
		params = {
			lockto = <lockto>
			pos = <pos>
			quat = <quat>
			fov = <fov>
		}
	}
endscript

script grid_control_cam_control 
	move1 = {
		lockto = <lockto>
		pos = <pos>
		quat = <quat>
		fov = <fov>
	}
	ccam_domorph <move1>
	ccam_freeze
endscript

script grid_control_cam_clear 
	killskatercamanim \{name = grid_control_igccam}
endscript

script wait_refocus_event_handler 
	wait \{2
		gameframes}
	launchevent \{type = focus
		target = grid_control_handle}
endscript

script grid_control_create_event_handler 
	setscreenelementlock id = root_window off
	if screenelementexists id = grid_control_handle
		destroyscreenelement id = grid_control_handle
	endif
	if gotparam exit_script
		<exit> = <exit_script>
	else
		<exit> = nullscript
	endif
	if gotparam exit_params
		<params> = <exit_params>
	else
		<params> = {}
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = grid_control_handle
		pos = (0.0, 0.0)
		tags = {
			grid = <grid>
			exit_script = <exit>
			exit_params = <params>
		}
	}
	grid_control_handle :obj_spawnscriptlater grid_control_set_event_handlers params = {entry state = none_none}
	launchevent type = focus target = grid_control_handle
endscript

script grid_control_destroy_event_handler 
	if screenelementexists \{id = grid_control_handle}
		grid_control_handle :gettags
		destroyscreenelement \{id = grid_control_handle}
		return exit_script = <exit_script> exit_params = <exit_params>
	endif
endscript

script grid_control_set_event_handlers 
	if gotparam entry
		igc_temporarily_disable_input
		wait 0.3 seconds
	endif
	switch <state>
		case none_none
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_create_add_object_menu}
				{pad_btn_right grid_control_exit}
				{pad_btn_top null_script}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case none_single
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_pickup}
				{pad_btn_right grid_control_exit}
				{pad_btn_top null_script}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case none_double
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_pickup}
				{pad_btn_right grid_control_exit}
				{pad_btn_top null_script}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case single_none
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_drop}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top null_script}
				{pad_btn_left grid_control_rotate}
			]
			replace_handlers
		}
		case single_single_can_combine
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_combine}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_swap}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case single_single_cant_combine
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom null_script}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_swap}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case single_double
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom null_script}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_swap}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case double_none
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom grid_control_drop}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_separate}
				{pad_btn_left grid_control_rotate}
			]
			replace_handlers
		}
		case double_single_cant_combine
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom null_script}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_swap}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
		case double_double
		setscreenelementprops {
			id = grid_control_handle
			event_handlers = [
				{pad_up grid_control_move params = {dir = {x = 0 y = -1}}}
				{pad_down grid_control_move params = {dir = {x = 0 y = 1}}}
				{pad_left grid_control_move params = {dir = {x = -1 y = 0}}}
				{pad_right grid_control_move params = {dir = {x = 1 y = 0}}}
				{pad_btn_bottom null_script}
				{pad_btn_right grid_control_confirm_remove}
				{pad_btn_top grid_control_swap}
				{pad_btn_left null_script}
			]
			replace_handlers
		}
	endswitch
endscript

script grid_control_helper_text_recreate 
	grid_control_helper_text_create state = (grid_control_helper_text_current_state)
endscript

script grid_control_helper_text_create 
	switch <state>
		case none_none
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 CREATE..."}
				{text = "\\b2 DONE"}
			]
		}
		case none_single
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 PICK UP"}
				{text = "\\b2 DONE"}
			]
		}
		case none_double
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 PICK UP"}
				{text = "\\b2 DONE"}
			]
		}
		case single_none
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 DROP"}
				{text = "\\b2 DELETE"}
				{text = "\\b1 ROTATE"}
			]
		}
		case single_single_can_combine
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 COMBINE"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SWAP"}
			]
		}
		case single_single_cant_combine
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SWAP"}
			]
		}
		case single_double
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SWAP"}
			]
		}
		case double_none
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b3 DROP"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SEPARATE"}
				{text = "\\b1 ROTATE"}
			]
		}
		case double_single_cant_combine
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SWAP"}
			]
		}
		case double_double
		create_helper_text {
			parent = grid_control_handle
			helper_text_elements = [
				{text = "\\b7/\\b4/\\b6/\\b5 MOVE"}
				{text = "\\b2 DELETE"}
				{text = "\\b0 SWAP"}
			]
		}
		default
		if ($grid_control_helper_text_current_state = undefined_state)
			script_assert "no state passed to grid_control_helper_text_create"
		endif
	endswitch
	change grid_control_helper_text_current_state = <state>
endscript

script grid_control_play_sound 
	<use_goal_sounds> = 0
	if gman_hasactivegoals
		<use_goal_sounds> = 1
		gman_getactivatedgoalid
		if gotparam activated_goal_id
			if checksumequals a = <activated_goal_id> b = m_story_banners
				<use_goal_sounds> = 0
			endif
		endif
	endif
	if (<use_goal_sounds> = 1)
		switch <action>
			case grid_control_addobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_Add_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_Add_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_Add_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_Add_Block type = bus
			endswitch
			case grid_control_removeobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_Remove_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_Remove_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_Remove_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_Remove_Block type = bus
			endswitch
			case grid_control_selectobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_Pickup_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_Pickup_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_Pickup_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_Pickup_Block type = bus
			endswitch
			case grid_control_dropobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_SetDown_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_SetDown_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_SetDown_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_SetDown_Block type = bus
			endswitch
			case grid_control_rotateobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_RotateBlock type = metal
				case Wood
				soundevent event = GridControl_SFX_RotateBlock type = Wood
				case Concrete
				soundevent event = GridControl_SFX_RotateBlock type = Concrete
				case bus
				soundevent event = GridControl_SFX_RotateBlock type = bus
			endswitch
			case grid_control_moveobject
			switch <soundtype>
				case cursor
				soundevent event = GridControl_SFX_Move_Cursor
				case cant_move
				soundevent event = GridControl_SFX_ErrorBuzzer
				case metal
				soundevent event = GridControl_SFX_MoveBlock type = metal
				case Wood
				soundevent event = GridControl_SFX_MoveBlock type = Wood
				case Concrete
				soundevent event = GridControl_SFX_MoveBlock type = Concrete
				case bus
				soundevent event = GridControl_SFX_MoveBlock type = bus
			endswitch
			case grid_control_swapobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_SetDown_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_SetDown_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_SetDown_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_SetDown_Block type = bus
			endswitch
			case grid_control_combineobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_SetDown_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_SetDown_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_SetDown_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_SetDown_Block type = bus
			endswitch
			case grid_control_separateobject
			switch <soundtype>
				case metal
				soundevent event = GridControl_SFX_SetDown_Block type = metal
				case Wood
				soundevent event = GridControl_SFX_SetDown_Block type = Wood
				case Concrete
				soundevent event = GridControl_SFX_SetDown_Block type = Concrete
				case bus
				soundevent event = GridControl_SFX_SetDown_Block type = bus
			endswitch
		endswitch
	else
		switch <action>
			case grid_control_addobject
			soundevent event = generic_menu_pad_choose_sfx
			case grid_control_removeobject
			soundevent event = generic_menu_pad_back_sfx
			case grid_control_selectobject
			soundevent event = Keyboard_SFX_MenuUp
			case grid_control_dropobject
			soundevent event = generic_menu_pad_choose_sfx
			case grid_control_rotateobject
			soundevent event = Keyboard_SFX_Backspace
			case grid_control_moveobject
			soundevent event = Keyboard_SFX_Backspace
			case grid_control_swapobject
			soundevent event = generic_menu_pad_choose_sfx
			case grid_control_combineobject
			soundevent event = generic_menu_pad_choose_sfx
			case grid_control_separateobject
			soundevent event = generic_menu_pad_choose_sfx
		endswitch
	endif
endscript
