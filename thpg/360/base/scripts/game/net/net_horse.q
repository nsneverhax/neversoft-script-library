net_horse_attempt_goal_classic = {
	name = 'attempt_goal_classic'
	no_skater_init_on_exit
	dont_reset_score
	tools = [
		{
			name = 'net'
			type = net
		}
		{
			name = 'piece_flags'
			type = flags
			flags = [
			]
		}
		{
			name = 'trickobj'
			type = trick_objects
			trick_the_objects = {
				flags_tool = piece_flags
				requires_combo
				objects = [
				]
			}
		}
		{
			name = 'combo'
			type = combo
			target_score = 0
		}
		{
			name = 'complete'
			type = flags
			flags = [
				got_pieces
			]
		}
		{
			name = 'start_tmr'
			type = timer
			start_time = 10
			end_time = 0
			start_on_enter
			show_on_enter
			beep_time = 5
			ignore_slomo
			dont_expire_checkpoint
		}
	]
}
max_net_line_items = 20

script net_horse_post_activate 
	printf \{"--- net_horse_post_activate"}
	net_horse_common_post_activate
	spawnscriptlater \{net_horse_set_event_handlers}
	change \{net_horse_attempt_checkpoint = attempt_goal_classic}
	change \{net_horse_layout_validation_script = net_horse_layout_check_valid_placed_objects}
endscript

script net_horse_set_event_handlers 
	printf \{"--- net_horse_set_event_handlers"}
	seteventhandler \{event = net_horse_recieve_set_score
		scr = net_horse_handle_set_score
		response = call_script}
	seteventhandler \{event = net_horse_recieve_data_event
		scr = net_horse_handle_data
		response = call_script}
	seteventhandler \{event = net_horse_ready_to_send_data
		scr = net_horse_send_data
		response = call_script}
	block
endscript

script net_horse_post_deactivate 
	printf \{"--- net_horse_post_deactivate"}
	gman_getdata \{goal = net_horse}
	net_horse_decolor_all_objects <...>
	if screenelementexists \{id = net_horse_layout_info_dialog}
		destroyscreenelement \{id = net_horse_layout_info_dialog}
	endif
	net_horse_common_post_deactivate <...>
	net_horse_common_clear_game_objects <...>
	killspawnedscript \{name = net_horse_done_placing_pieces_error}
	killspawnedscript \{name = net_horse_set_event_handlers}
	killspawnedscript \{name = net_horse_wait_and_check_game_over}
endscript

script net_horse_attempt_goal_classic_enter start_pos = (0.0, 0.0, 0.0)
	printf "--- net_horse_attempt_goal_classic_enter"
	net_horse_destroy_observer_name
	gman_flagfunc {
		goal = net_horse
		tool = complete
		checkpoint = attempt_goal_classic
		func = reset
		params = {}
	}
	create_net_panel_message text = "Start your run!"
	soundevent event = special_sound_in_multiplayer_game
	net_horse_color_initial_objects
	net_horse_get_data
	if NOT (<start_pos> = (0.0, 0.0, 0.0))
		getskaterid
		<objid> :killskater no_node
		<objid> :TeleportSkaterToNode {
			nodename = <restart_node>
			pos = <start_pos>
			quat = <start_quat>
			no_message
			do_effect = 0
			no_offset
			reset
		}
	endif
	gman_timerfunc {
		goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = set_time
		params = {
			time = <start_time>
		}
	}
	GMan_ContactFunc {
		goal = net_horse
		tool = piece_contact
		checkpoint = attempt_goal_classic
		func = start
	}
	net_horse_enable_skater_input
	net_horse_menu_classic_piece_counter_create {
		parent = net_rounds_current_round_info_cont
		pos = (900.0, 30.0)
	}
	net_horse_menu_classic_piece_counter_refresh_in_goal
	gman_setnextcheckpoint goal = net_horse next_checkpoint = wait_on_player
endscript

script net_horse_debug_stop_timer 
	printf \{"--- net_horse_debug_stop_timer"}
	gman_timerfunc \{goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = stop}
endscript

script net_horse_attempt_goal_classic_exit 
	gman_timerfunc \{goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = stop}
	gman_timerfunc \{goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = hide}
	net_horse_clear_touched_objects
	net_horse_menu_classic_piece_counter_destroy
endscript

script net_horse_attempt_goal_classic_piece_flags_gotallflags 
	printf \{"--- net_horse_attempt_goal_classic_complete_gotallflags"}
	gman_flagfunc \{goal = net_horse
		tool = complete
		checkpoint = attempt_goal_classic
		func = set
		params = {
			flag = got_pieces
			value = 1
		}}
endscript

script net_horse_attempt_goal_classic_combo_landedTargetScore 
	printf \{"--- net_horse_attempt_goal_classic_combo_landedTargetScore"}
endscript

script net_horse_attempt_goal_classic_combo_ended 
	printf \{"--- net_horse_attempt_goal_classic_combo_ended"}
	spawnscriptlater net_horse_wait_and_check_chk_complete params = {<...>}
endscript

script net_horse_attempt_goal_classic_combo_started 
	printf \{"--- net_horse_attempt_goal_classic_combo_started"}
	gman_timerfunc \{goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = stop}
	gman_timerfunc \{goal = net_horse
		tool = start_tmr
		checkpoint = attempt_goal_classic
		func = hide}
endscript

script net_horse_attempt_goal_classic_start_tmr_expire 
	printf \{"--- net_horse_attempt_goal_classic_start_tmr_expire"}
	net_horse_set_score \{score = 0}
endscript

script net_horse_wait_and_check_chk_complete 
	gman_flagfunc {
		goal = net_horse
		tool = complete
		checkpoint = attempt_goal_classic
		func = get_num_flags
		params = {}
	}
	gman_flagfunc {
		goal = net_horse
		tool = complete
		checkpoint = attempt_goal_classic
		func = get_num_set
		params = {}
	}
	if (<landed> = 1)
		printf "we landed!"
		if (gman_flagfunc goal = net_horse tool = complete checkpoint = attempt_goal_classic func = all_set)
			printf "we set our flags!"
			net_horse_set_score score = (<score>)
			return
		else
			net_horse_set_score score = (0)
		endif
	else
		net_horse_set_score score = (0)
	endif
endscript

script net_horse_color_initial_objects 
	printf "--- net_horse_color_initial_objects"
	net_horse_get_data
	if NOT gotparam trick_objs
		return
	endif
	getarraysize <trick_objs>
	i = 0
	begin
	obj_id = (<trick_objs> [<i>].id)
	GMan_TrickObjFunc {
		goal = net_horse
		tool = trickobj
		checkpoint = attempt_goal_classic
		func = color_object
		params = {
			id = <obj_id>
			color_index = 2
		}
	}
	printf "colored obj"
	i = (<i> + 1)
	repeat <array_size>
endscript

script net_horse_decolor_all_objects 
	printf \{"--- net_horse_decolor_all_objects"}
	net_horse_get_data
	if NOT gotparam \{trick_objs}
		return
	endif
	getarraysize <trick_objs>
	i = 0
	begin
	obj_id = (<trick_objs> [<i>].id)
	ColorTrickObjectCluster cluster = <obj_id> color_index = 0
	i = (<i> + 1)
	repeat <array_size>
endscript

script net_horse_choose_piece 
	printf "--- net_horse_choose_piece"
	groundcollisioncallback_getcurrentcontactnode
	getnode <node>
	trick_obj_select_list = []
	if structurecontains structure = <node> trickobject
		net_horse_get_data
		i = 0
		removed = 0
		begin
		if getnextarrayelement <trick_obj_select_list>
			if checksumequals a = (<element>.id) b = (<node>.cluster)
				printf "removed from list name=%d cluster=%e" d = (<node>.name) e = (<node>.cluster)
				ColorTrickObjectCluster cluster = (<node>.cluster) color_index = 0
				removearrayelement array = <trick_obj_select_list> index = <i>
				removed = 1
				break
			endif
		else
			break
		endif
		i = (<i> + 1)
		repeat
		getarraysize <trick_obj_select_list>
		item_count = <array_size>
		if gotparam array
			getarraysize <array>
			item_count = <array_size>
		endif
		if (<item_count> >= $max_net_line_items)
			if screenelementexists id = net_horse_menu_vmenu
				launchevent type = unfocus target = net_horse_menu_vmenu
			endif
			formattext textname = error_text "You can only select a maximum of %d objects." d = $max_net_line_items
			create_dialog_box {
				title = "TOO MANY PIECES"
				text = <error_text>
				just = [center center]
				z_priority = 1000
				pad_back_script = net_horse_refocus_vmenu_and_destroy_dialog
				buttons = [
					{font = text_a1 text = "ok" pad_choose_script = net_horse_refocus_vmenu_and_destroy_dialog}
				]
			}
		elseif (<removed> = 0)
			printf "added to list name=%d cluster=%e" d = (<node>.name) e = (<node>.cluster)
			ColorTrickObjectCluster cluster = (<node>.cluster) color_index = 3
			addarrayelement {
				array = <trick_obj_select_list>
				element = {
					id = (<node>.cluster)
					flag = (<node>.cluster)
				}
			}
		endif
		printf "Stored Array:"
		printstruct <array>
		net_horse_set_data {
			trick_obj_select_list = <array>
		}
	endif
	net_horse_menu_classic_piece_counter_refresh
	net_horse_disable_skater_input
endscript

script net_horse_refocus_vmenu_and_destroy_dialog 
	destroy_dialog_box
	launchevent \{type = focus
		target = net_horse_menu_vmenu}
endscript

script net_horse_object_in_select_list 
	net_horse_get_data
	getnode <node>
	in_list = 0
	if structurecontains structure = <node> trickobject
		begin
		if getnextarrayelement <trick_obj_select_list>
			if checksumequals a = (<element>.id) b = (<node>.cluster)
				in_list = 1
				break
			endif
		else
			break
		endif
		repeat
	endif
	return in_list = <in_list>
endscript

script net_horse_layout_check_valid_placed_objects 
	printf \{"--- net_horse_layout_check_valid_placed_objects"}
	net_horse_get_data
	getarraysize \{trick_obj_select_list}
	is_valid = 0
	if (<array_size> > 0)
		is_valid = 1
	endif
	return is_valid = <is_valid>
endscript

script net_horse_handle_set_score 
	printf \{"--- net_horse_handle_set_score"}
	printstruct <...>
	GMan_ComboFunc {
		goal = net_horse
		tool = combo
		checkpoint = attempt_goal_classic
		func = set_target_score
		params = {
			target_score = <new_score>
		}
	}
endscript

script net_horse_handle_data 
	printf "--- net_horse_handle_data"
	net_horse_get_data
	GMan_TrickObjFunc {
		goal = net_horse
		checkpoint = attempt_goal_classic
		tool = trickobj
		func = set_objects
		params = {
			objects = <trick_objs>
		}
	}
	GMan_ContactFunc {
		goal = net_horse
		checkpoint = attempt_goal_classic
		tool = piece_contact
		func = reset
	}
	getarraysize trick_objs
	if (<array_size> > 0)
		contact_pieces = [{node = (<trick_objs> [0].id) target_contacts = 0}]
		i = 1
		if (<array_size> > 1)
			begin
			addarrayelement {
				array = <contact_pieces>
				element = {node = (<trick_objs> [<i>].id) target_contacts = 0}
			}
			contact_pieces = <array>
			i = (<i> + 1)
			repeat (<array_size> - 1)
		endif
	endif
	printstruct <...>
	GMan_ContactFunc {
		goal = net_horse
		checkpoint = attempt_goal_classic
		tool = piece_contact
		func = set_objects
		params = {
			objects = <contact_pieces>
		}
	}
	GMan_ComboFunc {
		goal = net_horse
		tool = combo
		checkpoint = attempt_goal_classic
		func = set_target_score
		params = {target_score = 1}
	}
	if NOT gotparam net_end_pos_pos
		softassert "Didn't get end pos info!"
		return
	endif
	if gotparam net_end_pos_obj
		printf "gotparam"
		if compositeobjectexists name = <net_end_pos_obj>
			printf "end pos object exists"
			<net_end_pos_obj> :die
		endif
	endif
	cap_piece_array = ($ConstructionTypes.NetGoalLayout)
	getarraysize cap_piece_array
	i = 0
	begin
	if checksumequals a = (<cap_piece_array> [<i>].name) b = net_end_pos_cursor
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	construct_new_object {
		index = <i>
		constructtype = NetGoalLayout
		pos = <net_end_pos_pos>
		quat = <net_end_pos_quat>
		placed = false
		use_offsets = false
		use_cap = false
	}
	net_horse_set_data {
		net_end_pos_obj = <object_name>
	}
	net_horse_common_handle_data
endscript

script net_horse_send_data \{start_pos = (0.0, 0.0, 0.0)}
	printf \{"--- net_horse_send_data"}
	net_horse_get_data
	getarraysize \{trick_obj_select_list}
	NetHorse_SendData {
		type = classic
		data = {
			start_pos = <start_pos>
			start_quat = <start_quat>
			trick_objs = <trick_obj_select_list>
			net_end_pos_pos = <net_end_pos_pos>
			net_end_pos_quat = <net_end_pos_quat>
		}
	}
endscript

script net_horse_get_next_object 
	net_horse_get_data
	getarraysize trick_objs
	if (<array_size> = 0)
		printstruct <...>
		softassert "trick object set is empty!"
		return
	endif
	i = 0
	found_it = 0
	begin
	piece = (<trick_objs> [<i>].id)
	if NOT structurecontains structure = <touched_pieces> <piece>
		found_it = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	object = null
	if (<found_it> = 1)
		object = (<trick_objs> [<i>].id)
	endif
	return object = <object>
endscript

script net_horse_set_touched_obj 
	if NOT gotparam \{object}
		softassert \{"Did not get object!"}
		return
	endif
	the_object = <object>
	net_horse_get_data
	object = <the_object>
	removeparameter \{the_object}
	touched_pieces = {
		<touched_pieces>
		<object>
	}
	printstruct <...>
	net_horse_set_data touched_pieces = <touched_pieces>
endscript

script net_horse_count_touched_pieces 
	printf "--- net_horse_count_touched_pieces"
	net_horse_get_data
	num_pieces = 0
	if gotparam touched_pieces
		if gotparam trick_objs
			getarraysize trick_objs
			if (<array_size> > 0)
				i = 0
				begin
				piece = (<trick_objs> [<i>].id)
				if structurecontains structure = <touched_pieces> <piece>
					num_pieces = (<num_pieces> + 1)
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	return num_pieces = <num_pieces>
endscript

script net_horse_clear_touched_objects 
	net_horse_set_data \{touched_pieces = {
		}}
endscript

script net_horse_attempt_goal_classic_trickobj_gotTrickObject 
	printf "Touched Trick Obj!"
	printstruct <...>
	printf "bah"
	net_horse_set_touched_obj object = <trick_object_id>
	net_horse_get_next_object
	printstruct <...>
	net_horse_menu_classic_piece_counter_refresh_in_goal
	if NOT checksumequals a = <object> b = null
		printf "net_horse - highlighting %o" o = <object>
		GMan_TrickObjFunc {
			goal = net_horse
			tool = trickobj
			checkpoint = attempt_goal_classic
			func = color_object
			params = {
				id = <object>
				color_index = 3
			}
		}
	else
	endif
endscript

script net_horse_setup_goal_arrow 
	net_horse_clear_touched_objects
	net_horse_get_next_object
	if NOT checksumequals a = <object> b = null
		GMan_TrickObjFunc {
			goal = net_horse
			tool = trickobj
			checkpoint = attempt_goal_classic
			func = color_object
			params = {
				id = <object>
				color_index = 3
			}
		}
	else
	endif
endscript
