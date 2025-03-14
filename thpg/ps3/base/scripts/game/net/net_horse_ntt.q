
script net_horse_ntt_post_activate 
	printf \{"--- net_horse_post_activate"}
	GMan_GiveSkillForGoal \{skill = ntt}
	net_horse_common_post_activate
	spawnscriptlater \{net_horse_ntt_set_event_handlers}
	change \{net_horse_attempt_checkpoint = attempt_ntt}
	change \{net_horse_layout_validation_script = net_horse_ntt_layout_check_valid_placed_objects}
endscript

script net_horse_ntt_set_event_handlers 
	printf "--- net_horse_ntt_set_event_handlers"
	seteventhandler {
		event = net_horse_recieve_set_score
		scr = net_horse_ntt_handle_set_score
		response = call_script
	}
	seteventhandler {
		event = net_horse_recieve_data_event
		scr = net_horse_ntt_handle_data
		response = call_script
	}
	seteventhandler {
		event = net_horse_ready_to_send_data
		scr = net_horse_ntt_send_data
		response = call_script
	}
	block
endscript

script net_horse_ntt_post_deactivate 
	printf \{"--- net_horse_ntt_post_deactivate"}
	gman_getdata \{goal = net_horse_ntt}
	printstruct <...>
	net_horse_common_post_deactivate <...>
	net_horse_common_clear_game_objects <...>
	if screenelementexists \{id = net_horse_layout_info_dialog}
		destroyscreenelement \{id = net_horse_layout_info_dialog}
	endif
	killspawnedscript \{name = net_horse_done_placing_pieces_error}
	killspawnedscript \{name = net_horse_ntt_set_event_handlers}
endscript

script net_horse_ntt_attempt_ntt_enter start_pos = (0.0, 0.0, 0.0)
	printf "--- net_horse_ntt_attempt_ntt_enter"
	net_horse_destroy_observer_name
	gman_flagfunc {
		goal = net_horse_ntt
		tool = complete
		checkpoint = attempt_ntt
		func = reset
		params = {}
	}
	create_net_panel_message text = "Start your run!"
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
		goal = net_horse_ntt
		tool = start_tmr
		checkpoint = attempt_ntt
		func = set_time
		params = {
			time = <start_time>
		}
	}
	gman_flagfunc {
		goal = net_horse_ntt
		tool = complete
		checkpoint = attempt_ntt
		func = reset
	}
	GMan_NailFunc {
		goal = net_horse_ntt
		tool = nail
		checkpoint = attempt_ntt
		func = nail_goal_reset
	}
	net_horse_enable_skater_input
	gman_setnextcheckpoint goal = net_horse_ntt next_checkpoint = wait_on_player
endscript

script net_horse_ntt_attempt_ntt_exit 
	gman_timerfunc \{goal = net_horse_ntt
		tool = start_tmr
		checkpoint = attempt_ntt
		func = stop}
	gman_timerfunc \{goal = net_horse_ntt
		tool = start_tmr
		checkpoint = attempt_ntt
		func = hide}
endscript

script net_horse_ntt_attempt_ntt_start_tmr_expire 
	printf \{"--- net_horse_ntt_attempt_ntt_start_tmr_expire"}
	net_horse_set_score \{score = 0}
endscript

script net_horse_ntt_play 
	printf "--- net_horse_ntt_play"
	if gman_getactivatedgoalid
		if (<activated_goal_id> = net_horse_ntt)
			getskaterid
			<objid> :settags nail_last_score = 0
			gman_getcurrentcheckpoint goal = net_horse_ntt
			printstruct <...>
			if checksumequals a = <current_checkpoint> b = attempt_ntt
				printf "here"
				gman_timerfunc {
					goal = net_horse_ntt
					tool = start_tmr
					checkpoint = attempt_ntt
					func = get_time
				}
				if (<time> >= 0)
					printf "here2"
					gman_flagfunc {
						goal = net_horse_ntt
						tool = complete
						checkpoint = attempt_ntt
						func = set
						params = {
							flag = hit_trigger
							value = 1
						}
					}
					gman_timerfunc {
						goal = net_horse_ntt
						tool = start_tmr
						checkpoint = attempt_ntt
						func = set_time
						params = {
							time = 1
						}
					}
				endif
			endif
		endif
	endif
endscript

script net_horse_ntt_attempt_ntt_nail_startNTT 
	printf "--- net_horse_ntt_attempt_ntt_nail_startNTT"
	if gman_getactivatedgoalid
		if (<activated_goal_id> = net_horse_ntt)
			getskaterid
			<objid> :settags nail_last_score = 0
			gman_getcurrentcheckpoint goal = net_horse_ntt
			printstruct <...>
			if checksumequals a = <current_checkpoint> b = attempt_ntt
				printf "here"
				gman_timerfunc {
					goal = net_horse_ntt
					tool = start_tmr
					checkpoint = attempt_ntt
					func = get_time
				}
				if (<time> >= 0)
					printf "here2"
					GMan_NailFunc {
						goal = net_horse_ntt
						tool = nail
						checkpoint = attempt_ntt
						func = start
					}
					gman_timerfunc {
						goal = net_horse_ntt
						tool = start_tmr
						checkpoint = attempt_ntt
						func = stop
					}
					gman_timerfunc {
						goal = net_horse_ntt
						tool = start_tmr
						checkpoint = attempt_ntt
						func = hide
					}
				endif
			endif
		endif
	endif
endscript

script net_horse_end_ntx 
	wait 2 gameframes
	if isinbail
		<landed> = 0
	else
		<landed> = 1
	endif
	if (<landed> = 0)
		printf "didn't land"
		net_horse_set_score score = 0
	elseif gman_flagfunc goal = net_horse_ntt tool = complete checkpoint = attempt_ntt func = all_set
		getskaterid
		<objid> :nailthetrickscore_getscoreinfo
		casttointeger total_score
		printf "flags set"
		net_horse_get_data
		net_horse_set_score score = <total_score>
	else
		printf "landed, but not all flags set"
		net_horse_set_score score = 0
	endif
	GMan_NailFunc {
		goal = net_horse_ntt
		tool = nail
		checkpoint = attempt_ntt
		func = stop
	}
endscript

script net_horse_ntt_attempt_ntt_nail_endNTX 
	printf "--- net_horse_ntt_attempt_ntt_nail_endNTX"
	printf "killing the timer..."
	gman_timerfunc {
		goal = net_horse_ntt
		tool = start_tmr
		checkpoint = attempt_ntt
		func = stop
	}
	gman_timerfunc {
		goal = net_horse_ntt
		tool = start_tmr
		checkpoint = attempt_ntt
		func = hide
	}
	getskaterid
	<objid> :obj_spawnscriptnow net_horse_end_ntx params = {<...>}
endscript

script net_horse_ntt_handle_set_score 
	printf \{"--- net_horse_ntt_handle_set_score"}
	net_horse_set_data {
		ntt_score = <new_score>
	}
	GMan_NailFunc {
		goal = net_horse_ntt
		tool = nail
		checkpoint = attempt_ntt
		func = set_targets
		params = {
			target_final_score = <new_score>
		}
	}
endscript

script net_horse_ntt_handle_data 
	printf "--- net_horse_ntt_handle_data"
	net_horse_set_data {
		ntt_score = 1
	}
	GMan_NailFunc {
		goal = net_horse_ntt
		tool = nail
		checkpoint = attempt_ntt
		func = set_targets
		params = {
			target_final_score = 1
		}
	}
	net_horse_get_data
	printstruct <...>
	if gotparam net_ntt_kicker_obj
		printf "gotparam"
		if compositeobjectexists name = <net_ntt_kicker_obj>
			printf "object exists"
			<net_ntt_kicker_obj> :die
		endif
	endif
	cap_piece_array = ($ConstructionTypes.NetGoalLayout)
	getarraysize cap_piece_array
	i = 0
	begin
	if checksumequals a = (<cap_piece_array> [<i>].name) b = NTTKicker
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	construct_new_object {
		index = <i>
		constructtype = NetGoalLayout
		pos = <ntt_kicker_pos>
		quat = <ntt_kicker_quat>
		placed = false
		use_offsets = false
		use_cap = false
	}
	net_horse_set_data {
		net_ntt_kicker_obj = <object_name>
	}
	net_horse_common_handle_data
endscript

script net_horse_ntt_send_data 
	printf \{"--- net_horse_ntt_send_data"}
	net_horse_get_data
	getarraysize \{trick_obj_select_list}
	NetHorse_SendData {
		type = classic
		data = {
			start_pos = <start_pos>
			start_quat = <start_quat>
			ntt_kicker_pos = <ntt_kicker_pos>
			ntt_kicker_quat = <ntt_kicker_quat>
		}
	}
endscript

script net_horse_ntt_layout_check_valid_placed_objects 
	printf \{"--- net_horse_ntt_layout_check_valid_placed_objects"}
	net_horse_get_data
	is_valid = 0
	if (<kicker_set> = 1)
		if gotparam \{ntt_kicker_pos}
			is_valid = 1
		endif
	endif
	return is_valid = <is_valid>
endscript
