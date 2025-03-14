net_horse_attempt_checkpoint = wait_on_player
goal_net_horse_genericParams = {
	goal_text = "You must score the most points to win!"
	time = 10
	net
	goal_type_checksum = net
	init = goal_net_horse_init
	post_deactivate = net_horse_post_deactivate
	goal_description = "COMBO MAMBO!"
}

script goal_net_horse_init 
endscript

script net_horse_done 
	do_backend_retry
endscript

script send_start_net_horse 
	printf \{"--- send_start_net_horse"}
	if OnServer
		GetPreferenceString \{pref_type = network
			horse_word}
		horse_word = <ui_string>
		NetHorse_StartGame horse_word = <horse_word>
	else
		printf \{"can't start a game unless you're the server!"}
	endif
endscript

script startgoal_net_horse horse_word = "ho"
	printf "--- StartGoal_net_horse"
	if checksumequals a = <game_style> b = ClassicMode
		horse_goal = net_horse
		change net_horse_current_menu_states = ($net_horse_layout_states_classic)
		printf "Classic Mode"
	elseif checksumequals a = <game_style> b = NTTMode
		horse_goal = net_horse_ntt
		change net_horse_current_menu_states = ($net_horse_layout_states_ntt)
		printf "NTT Mode"
	endif
	net_horse_get_player_data_setup horse_word = <horse_word>
	stringlength string = <horse_word>
	NetRoundFunc func = get_last_round_loser
	printstruct <...>
	layout_skater = <last_round_loser>
	if NOT PlayerExists player_num = <layout_skater>
		net_horse_get_next_player
		layout_skater = <next_player>
	endif
	if ishost
		getpreferencechecksum pref_type = network player_collision
		GetPreferenceString pref_type = network player_collision
		old_col_setting = <checksum>
		old_col_setting_string = <ui_string>
		SetPreferencesFromUI {
			prefs = network
			field = 'player_collision'
			checksum = boolean_false
			string = "Off"
		}
		netsessionfunc obj = match func = update_game_options
	endif
	gman_setdata {
		goal = <horse_goal>
		params = {
			layout_skater = <layout_skater>
			play_mode = <play_mode>
			player_data = <player_data>
			start_time = <time>
			kicker_set = 0
			collision = <old_col_setting>
			collision_string = <old_col_setting_string>
		}
	}
	printf "end of StartGoal_net_horse"
	gman_activategoal goal = <horse_goal>
endscript

script net_horse_common_post_activate 
	printf \{"--- net_horse_common_post_activate"}
	change \{dont_restore_start_key_binding = 1}
	ChangeObserverMode \{mode = chase_cam}
endscript
net_horse_is_laying_pieces = 0

script net_horse_ntt_layout_state_enter 
	net_horse_layout_state_enter
endscript

script net_horse_layout_state_enter 
	printf "--- net_horse_layout_state_enter"
	getskaterid
	net_horse_get_data
	net_horse_decolor_all_objects
	net_horse_set_data {
		current_player = <layout_skater>
	}
	gman_getactivatedgoalid
	if (<layout_skater> = <objnum>)
		printf "woo! its my turn to lay out pieces!"
		gman_timerfunc {
			goal = <activated_goal_id>
			tool = timeout_tmr
			checkpoint = layout_state
			func = start
		}
		gman_timerfunc {
			goal = <activated_goal_id>
			tool = timeout_tmr
			checkpoint = layout_state
			func = show
		}
		trick_obj_select_list = []
		net_horse_set_data {
			trick_obj_select_list = <trick_obj_select_list>
		}
		change net_horse_is_laying_pieces = 1
		MakeSkaterGoto Enter_CAP_mode params = {mode = GOAL_CREATION}
		kill_start_key_binding
		net_horse_disable_skater_input
	else
		GetPlayerGamertag player_num = <layout_skater>
		formattext textname = other_layout_text "%g is selecting pieces for the next round." g = <gamertag>
		create_net_panel_message text = <other_layout_text>
		gman_timerfunc {
			goal = <activated_goal_id>
			tool = timeout_tmr
			checkpoint = layout_state
			func = stop
		}
		gman_timerfunc {
			goal = <activated_goal_id>
			tool = timeout_tmr
			checkpoint = layout_state
			func = hide
		}
	endif
	spawnscript net_horse_wait_and_hide_layout_skater
	net_horse_set_next_checkpoint_from_play_mode
	gman_getactivatedgoalid
	gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = <next_checkpoint>
	spawnscript net_horse_layout_state_wait_and_check
endscript

script net_horse_wait_and_hide_layout_skater 
	net_horse_get_data
	onexitrun \{net_horse_unhide_layout_skater}
	begin
	wait \{1
		gameframe}
	if gotparam \{layout_skater}
		if getskaterid skater = <layout_skater> net
			<objid> :hide
		endif
	endif
	repeat
endscript

script net_horse_unhide_layout_skater 
	net_horse_get_data
	if getskaterid skater = <layout_skater> net
		<objid> :unhide
	endif
endscript

script net_horse_ntt_layout_state_timeout_tmr_expire 
	net_horse_layout_state_timeout_tmr_expire
endscript

script net_horse_layout_state_timeout_tmr_expire 
	printf \{"--- net_horse_layout_state_timeout_tmr_expire"}
	NetHorse_EndGame
endscript

script net_horse_layout_state_wait_and_check 
	printf \{"--- net_horse_layout_state_wait_and_check"}
	net_horse_get_data
	begin
	if NOT PlayerExists player_num = <layout_skater>
		break
	endif
	wait \{1
		gameframe}
	repeat
	gman_getactivatedgoalid
	if gotparam \{activated_goal_id}
		gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = game_end
		gman_passcheckpoint goal = <activated_goal_id>
	endif
endscript

script net_horse_set_next_checkpoint_from_play_mode 
	printf "--- net_horse_set_next_checkpoint_from_play_mode"
	net_horse_get_data
	if checksumequals a = <play_mode> b = sequential
		printf "sequential: choose next player"
		getskaterid
		if (<current_player> = <objnum>)
			printf "going to layout!"
			next_checkpoint = $net_horse_attempt_checkpoint
		else
			printf "waiting!"
			next_checkpoint = wait_on_player
		endif
		net_horse_get_next_player current_player = <current_player>
	elseif checksumequals a = <play_mode> b = observe
		printf "observe: choose next player"
		getskaterid
		if (<current_player> = <objnum>)
			printf "going to layout!"
			next_checkpoint = $net_horse_attempt_checkpoint
		else
			printf "waiting!"
			next_checkpoint = wait_on_player
		endif
		net_horse_get_next_player current_player = <current_player>
	elseif checksumequals a = <play_mode> b = freeforall
		printf "free for all"
		next_checkpoint = $net_horse_attempt_checkpoint
	else
		softassert "Didn't understand play mode!"
		next_checkpoint = wait_on_player
	endif
	return next_checkpoint = <next_checkpoint>
endscript

script net_horse_layout_pieces_show_dialog 
	printf "--- net_horse_layout_pieces_show_dialog"
	create_dialog_box {
		anchor_id = net_horse_layout_info_dialog
		container_id = net_horse_layout_info_cont
		title = "CHOOSE YOUR PIECES"
		text = "Please place a start point and select at least one trick object."
		buttons = [
			{text = "CONTINUE" pad_choose_script = net_horse_layout_pieces_dialog_continue}
		]
	}
endscript

script net_horse_layout_pieces_dialog_continue 
	printf \{"--- net_horse_layout_pieces_dialog_continue"}
	dialog_box_exit \{anchor_id = net_horse_layout_info_dialog}
	MakeSkaterGoto \{Enter_CAP_mode
		params = {
			mode = GOAL_CREATION
		}}
endscript

script net_horse_recieve_data 
	printf \{"--- net_horse_recieve_data"}
	objects = (<data>.trick_objs)
	printstruct <...>
	net_horse_set_data {
		<data>
	}
	broadcastevent \{type = net_horse_recieve_data_event}
	gman_getactivatedgoalid
	gman_flagfunc {
		goal = <activated_goal_id>
		tool = done
		checkpoint = layout_state
		func = set
		params = {flag = done value = 1}
	}
endscript

script net_horse_common_handle_data 
	printf "--- net_horse_common_handle_data"
	net_horse_get_data
	getskaterid
	if (<current_player> = <objnum>)
	else
		if checksumequals a = <play_mode> b = observe
			MakeSkaterGoto SkaterInit
			net_horse_show_observer_name player_num = <current_player>
			ForceChangeObservingState state = true player_num = <current_player>
		endif
	endif
	killspawnedscript name = net_horse_wait_and_hide_layout_skater
	if gotparam layout_skater
		if getskaterid skater = <layout_skater> net
			<objid> :unhide
		endif
	endif
endscript

script net_horse_ntt_layout_state_exit 
	net_horse_layout_state_exit
endscript

script net_horse_layout_state_exit 
	printf \{"--- net_horse_layout_state_exit"}
	unpauseskaters
	killspawnedscript \{name = net_horse_layout_state_wait_and_check}
	net_horse_get_data
	if gotparam \{net_start_pos_obj}
		if compositeobjectexists name = <net_start_pos_obj>
			<net_start_pos_obj> :die
		endif
	endif
endscript

script net_horse_ntt_layout_state_done_gotallflags 
	printf \{"--- wrapper wrapper"}
	net_horse_layout_state_done_gotallflags
endscript

script net_horse_layout_state_done_gotallflags 
	printf \{"--- net_horse_layout_state_done_gotallflags"}
	gman_getactivatedgoalid
	gman_passcheckpoint goal = <activated_goal_id>
endscript

script net_horse_ntt_wait_on_player_enter 
	net_horse_wait_on_player_enter
endscript

script net_horse_wait_on_player_enter 
	printf \{"--- net_horse_wait_on_player_enter"}
	create_net_panel_message \{text = "Waiting for other players to take their turn"}
	spawnscriptlater \{net_horse_wait_and_check_game_over}
	net_horse_color_initial_objects
endscript

script net_horse_ntt_wait_on_player_exit 
	net_horse_wait_on_player_exit
endscript

script net_horse_wait_on_player_exit 
	printf \{"--- net_horse_wait_on_player_exit"}
endscript

script net_horse_ntt_wait_on_player_wait_gotallflags 
	net_horse_wait_on_player_wait_gotallflags
endscript

script net_horse_wait_on_player_wait_gotallflags 
	printf \{"--- net_horse_wait_on_player_wait_gotallflags"}
endscript

script net_horse_in_horse_type_game 
	printf \{"--- net_horse_in_horse_game"}
	gman_getactivatedgoalid
	in_horse_type_game = 0
	if gotparam \{activated_goal_id}
		if (<activated_goal_id> = net_horse)
			in_horse_type_game = 1
		endif
	endif
	return in_horse_type_game = <in_horse_type_game>
endscript

script net_horse_set_score \{score = 0}
	printf \{"--- net_horse_set_score"}
	casttointeger \{score}
	getskaterid
	NetHorse_SetScore {
		player_num = <objnum>
		new_score = <score>
	}
endscript

script net_horse_recieve_set_score 
	printf "--- net_horse_recieve_set_score"
	killspawnedscript name = net_horse_wait_and_check_game_over
	printstruct <...>
	gman_getactivatedgoalid
	if NOT gotparam activated_goal_id
		return
	endif
	broadcastevent type = net_horse_recieve_set_score data = {new_score = <new_score>}
	if GetPlayerGamertag player_num = <player_num>
		set_score_msg = ""
		formattext textname = set_score_msg "%b got the score %i" i = <new_score> b = <gamertag>
		printf "message: %m" m = <set_score_msg>
		create_net_panel_message text = <set_score_msg> time = 2000
		wait 3 seconds
	else
		printf "WARNING! DID NOT SHOW SET SCORE MESSAGE!"
	endif
	printf "setting score..."
	printstruct <...>
	NetHorse_SetPlayerScore {
		player_num = <player_num>
		player_score = <new_score>
	}
	net_horse_mark_player_has_gone player_num = <player_num>
	net_horse_get_data
	net_horse_is_game_over
	if (<game_over> = 1)
		printf "the game is now over"
		killspawnedscript name = net_horse_wait_and_check_game_over
		gman_getactivatedgoalid
		gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = game_end
		gman_passcheckpoint goal = <activated_goal_id>
	elseif checksumequals a = <play_mode> b = freeforall
		printf "free for all: did we do it?"
		if gotparam score_player
			if (<player_num> = <objnum>)
				printf "we did! obj %d" d = <objnum>
				gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = wait_on_player
				gman_passcheckpoint goal = <activated_goal_id>
			endif
		endif
	elseif OnServer
		net_horse_send_next_person
	endif
endscript

script net_horse_send_next_person 
	printf "--- net_horse_send_next_person"
	if NOT OnServer
		return
	endif
	net_horse_get_data
	if checksumequals a = <play_mode> b = sequential
		printf "sequential: choose next player"
		net_horse_get_next_player current_player = <current_player>
	elseif checksumequals a = <play_mode> b = freeforall
		printf "free for all, don't start anyone!"
		return
	elseif checksumequals a = <play_mode> b = observe
		printf "observe: choose next player"
		net_horse_get_next_player current_player = <current_player>
	endif
	NetHorse_NextPlayer {
		player_num = <next_player>
	}
endscript

script net_horse_recieve_next_player 
	printf "--- net_horse_recieve_next_player"
	net_horse_get_data
	getskaterid
	if checksumequals a = <play_mode> b = observe
		if (<objnum> = <next_player>)
			net_horse_destroy_observer_name
			ForceChangeObservingState state = false
		else
			MakeSkaterGoto SkaterInit
			net_horse_show_observer_name player_num = <next_player>
			ForceChangeObservingState state = true player_num = <next_player>
		endif
	endif
	gman_getactivatedgoalid
	if gman_goalisactive goal = <activated_goal_id>
		if (<objnum> = <next_player>)
			gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = $net_horse_attempt_checkpoint
		else
			gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = wait_on_player
		endif
		net_horse_set_data {
			current_player = <next_player>
		}
		gman_passcheckpoint goal = <activated_goal_id>
	endif
endscript

script net_horse_show_observer_name player_num = 0 gamertag = "null"
	printf "--- net_horse_show_observer_name"
	net_horse_destroy_observer_name
	createscreenelement {
		id = net_horse_observer_name_cont
		pos = (970.0, 95.0)
		parent = root_window
		type = containerelement
	}
	cont_id = <id>
	GetPlayerGamertag player_num = <player_num>
	createscreenelement {
		type = textelement
		parent = <cont_id>
		font = text_a1
		text = <gamertag>
		rgba = [255 255 255 255]
		just = [center center]
		scale = (0.8, 0.8)
		shadow
		shadow_rgba = [0 0 0 200]
		shadow_offs = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	text_height = <height>
	text_width = <width>
	createscreenelement {
		local_id = highlight
		type = spriteelement
		parent = <cont_id>
		texture = menu_highlight
		just = [center center]
	}
	setscreenelementprops {
		id = {<cont_id> child = highlight}
		rgba = ($graffitiColors [(<player_num> + 1)])
		scale = 1
		pos = (5.0, 0.0)
	}
	scale_element_to_size {
		id = {<cont_id> child = highlight}
		target_height = (<text_height> + 6)
		target_width = (<text_width> + 40)
	}
endscript

script net_horse_destroy_observer_name 
	if screenelementexists \{id = net_horse_observer_name_cont}
		destroyscreenelement \{id = net_horse_observer_name_cont}
	endif
endscript

script net_horse_get_letter 
	printf \{"--- net_horse_get_letter"}
	printscriptinfo
	getskaterid
	NetHorse_AnnounceLetter {
		player_num = <objnum>
	}
endscript

script net_horse_recieve_player_letter 
	printf \{"--- net_horse_recieve_player_letter DEPRICATED"}
endscript

script net_horse_ntt_wait_and_check_game_over 
	net_horse_wait_and_check_game_over
endscript

script net_horse_wait_and_check_game_over 
	begin
	wait 1 second
	net_horse_get_data
	net_horse_is_game_over
	if (<game_over> = 1)
		printf "the game is now over"
		gman_getactivatedgoalid
		if gotparam activated_goal_id
			gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = game_end
			gman_passcheckpoint goal = <activated_goal_id>
			break
		endif
	endif
	if OnServer
		printstruct <...>
		if NOT PlayerExists player_num = <current_player>
			net_horse_send_next_person
		endif
	endif
	repeat
endscript

script net_horse_ntt_game_end_enter 
	net_horse_game_end_enter
endscript

script net_horse_game_end_enter 
	printf \{"--- net_horse_game_end_enter"}
	if OnServer
		wait_then_create_rankings
	else
		create_rankings
	endif
endscript

script net_horse_get_next_player current_player = 0
	printf "--- net_horse_get_next_player"
	next_player = (<current_player> + 1)
	<max_iterations> = ($MAX_NET_PLAYERS * 2)
	begin
	if (<next_player> > $MAX_NET_PLAYERS)
		next_player = 0
	endif
	net_horse_player_in_game player_num = <next_player>
	if (<in_game> = 1)
		net_horse_player_has_gone player_num = <next_player>
		if (<has_gone> = 0)
			printf "breaking: next player=%d" d = <next_player>
			break
		endif
	endif
	next_player = (<next_player> + 1)
	repeat <max_iterations>
	if NOT (<in_game> = 1)
		printf "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  Did not get next player! this could be bad! !!!!!!!!!!!!!!!!!!!!!!!"
		next_player = <current_player>
	endif
	return next_player = <next_player>
endscript

script net_horse_get_player_data_setup horse_word = "horse"
	printf "--- net_horse_get_player_data_setup"
	player_data = []
	i = 0
	begin
	in_game = 0
	if PlayerExists player_num = <i>
		in_game = 1
	endif
	addarrayelement {
		array = <player_data>
		element = {
			in_game = <in_game>
			eliminated = 0
			has_gone = 0
		}
	}
	player_data = <array>
	i = (<i> + 1)
	repeat $MAX_NET_PLAYERS
	return player_data = <player_data>
endscript

script net_horse_create_display_array 
	printf "--- net_horse_create_display_array 		***depricated"
	if NOT gotparam horse_word
		softassert "Did not get horse_word!"
	endif
	if NOT gotparam letter_index
		softassert "Did not get letter_index!"
	endif
	stringtochararray string = <horse_word>
	getarraysize <char_array>
	display_array = []
	i = 0
	begin
	if (<i> < <letter_index>)
		addarrayelement array = <display_array> element = (<char_array> [<i>])
		display_array = <array>
	else
		addarrayelement array = <display_array> element = "_"
		display_array = <array>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return display_array = <display_array>
endscript

script net_horse_add_letter_to_player 
	printf "--- net_horse_add_letter_to_player   ***depricated"
	if NOT gotparam player_num
		softassert "Did not get player_num!"
	endif
	net_horse_get_data
	new_index = (<player_data> [<player_num>].letter_index + 1)
	net_horse_create_display_array {
		horse_word = <horse_word>
		letter_index = <new_index>
	}
	player = (<player_data> [<player_num>])
	new_data = {
		<player>
		letter_index = <new_index>
		display_array = <display_array>
	}
	setarrayelement {
		arrayname = player_data
		index = <player_num>
		newvalue = <new_data>
	}
	net_horse_set_data {
		player_data = <player_data>
	}
endscript

script net_horse_is_game_over 
	printf \{"--- net_horse_is_game_over"}
	net_horse_get_players_left_to_go
	game_over = 0
	if (<players_left> < 1)
		game_over = 1
	endif
	return game_over = <game_over>
endscript

script net_horse_update_eliminations 
	printf "--- net_horse_update_eliminations		***depricated"
	net_horse_get_data
	i = 0
	begin
	if PlayerExists player_num = <i>
		if (<player_data> [<i>].in_game = 1)
			if (<player_data> [<i>].letter_index = <word_len>)
				player = (<player_data> [<i>])
				new_data = {
					<player>
					eliminated = 1
				}
				setarrayelement {
					arrayname = player_data
					index = <i>
					newvalue = <new_data>
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat $MAX_NET_PLAYERS
	net_horse_set_data {
		player_data = <player_data>
	}
endscript

script net_horse_player_in_game 
	if NOT gotparam \{player_num}
		softassert \{"Did not get param player_num!"}
	endif
	in_game = 0
	net_horse_get_data
	if gotparam \{player_data}
		if PlayerExists player_num = <player_num>
			if (<player_data> [<player_num>].in_game = 1)
				in_game = 1
			endif
		endif
	endif
	return in_game = <in_game>
endscript

script net_horse_player_has_gone 
	if NOT gotparam player_num
		softassert "Did not get param player_num!"
	endif
	has_gone = 0
	net_horse_get_data
	if gotparam player_data
		if PlayerExists player_num = <player_num>
			if (<player_data> [<player_num>].in_game = 1)
				if (<player_data> [<player_num>].has_gone = 1)
					has_gone = 1
				endif
			endif
		endif
	endif
	return has_gone = <has_gone>
endscript

script net_horse_mark_player_has_gone 
	printf "--- net_horse_mark_player_has_gone"
	if NOT gotparam player_num
		softassert "Did not get param player_num!"
	endif
	net_horse_get_data
	if gotparam player_data
		player = (<player_data> [<player_num>])
		new_data = {
			<player>
			has_gone = 1
		}
		setarrayelement {
			arrayname = player_data
			index = <player_num>
			newvalue = <new_data>
		}
		net_horse_set_data {
			player_data = <player_data>
		}
	endif
endscript

script net_horse_get_players_left_to_go 
	net_horse_get_data
	players_left = 0
	i = 0
	begin
	net_horse_player_in_game player_num = <i>
	if (<in_game> = 1)
		net_horse_player_has_gone player_num = <i>
		if (<has_gone> = 0)
			players_left = (<players_left> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat $MAX_NET_PLAYERS
	return players_left = <players_left>
endscript

script net_horse_get_players_left 
	printf \{"--- net_horse_get_players_left			***depricated"}
	net_horse_get_data
	players_left = 0
	i = 0
	begin
	net_horse_is_player_alive player_num = <i>
	if (<is_alive> = 1)
		players_left = (<players_left> + 1)
	endif
	i = (<i> + 1)
	repeat $MAX_NET_PLAYERS
	return players_left = <players_left>
endscript

script net_horse_is_player_alive 
	printf "--- net_horse_is_player_alive		***depricated"
	if NOT gotparam player_num
		softassert "Did not get param player_num!"
	endif
	is_alive = 0
	net_horse_get_data
	if gotparam player_data
		if PlayerExists player_num = <player_num>
			printf "player exists"
			if (<player_data> [<player_num>].in_game = 1)
				printf "in game"
				if (<player_data> [<player_num>].eliminated = 0)
					printf "not eliminated"
					is_alive = 1
				endif
			endif
		endif
	endif
	return is_alive = <is_alive>
endscript

script net_horse_print_status 
	printf \{"--- net_horse_print_status"}
	net_horse_get_data
	printstruct <...>
endscript

script net_horse_get_numerical_player_score 
	printf "--- net_horse_get_numerical_player_score		***depricated"
	if NOT gotparam player_num
		softassert "Did not get player_num!"
	endif
	net_horse_get_data
	letter_index = (<player_data> [<player_num>].letter_index)
	stringlength string = <horse_word>
	return player_score = (<str_len> - <letter_index>)
endscript

script net_horse_get_last_player_letter 
	printf "--- net_horse_get_last_player_letter		***depricated"
	if NOT gotparam player_num
		softassert "Did not get player_num!"
	endif
	net_horse_get_data
	cur_player_data = (<player_data> [<player_num>])
	letter_index = (<cur_player_data>.letter_index - 1)
	if (<letter_index> < 0)
		letter_index = 0
	endif
	current_letter = ((<cur_player_data>.display_array) [<letter_index>])
	return current_letter = <current_letter>
endscript

script net_horse_get_player_display_string 
	printf "--- net_horse_get_player_display_string			***depricated"
	if NOT gotparam player_num
		softassert "Did not get player_num!"
	endif
	net_horse_get_data
	display_string = ""
	if gotparam player_data
		display_array = (<player_data> [<player_num>].display_array)
		getarraysize <display_array>
		i = 0
		begin
		display_string = (<display_string> + <display_array> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	else
		printf "Did not get player data, returning empty string..."
	endif
	return display_string = <display_string>
endscript

script net_horse_set_initial_player_scores 
	printf "--- net_horse_set_initial_player_scores			***depricated"
	net_horse_get_data
	i = 0
	begin
	net_horse_is_player_alive player_num = <i>
	if (<is_alive> = 1)
		net_horse_get_numerical_player_score player_num = <i>
		NetHorse_SetPlayerScore {
			player_num = <i>
			player_score = <player_score>
		}
	endif
	i = (<i> + 1)
	repeat $MAX_NET_PLAYERS
endscript

script net_horse_callback_begin_contact 
	getnode <node>
	trick_obj_select_list = []
	if structurecontains structure = <node> trickobject
		ColorTrickObjectCluster cluster = (<node>.cluster) color_index = 1
	endif
	net_horse_disable_skater_input
endscript

script net_horse_callback_end_contact 
	getnode <node>
	if structurecontains structure = <node> trickobject
		net_horse_object_in_select_list node = (<node>.name)
		if (<in_list> = 1)
			ColorTrickObjectCluster cluster = (<node>.cluster) color_index = 2
		else
			ColorTrickObjectCluster cluster = (<node>.cluster) color_index = 0
		endif
	endif
	net_horse_disable_skater_input
endscript

script net_horse_done_placing_pieces start_pos = (0.0, 0.0, 0.0)
	printf "--- net_horse_done_placing_pieces"
	softassert "This shouldn't be used anymore"
	net_horse_menu_cleanup
	if ($net_horse_is_laying_pieces = 1)
		change net_horse_is_laying_pieces = 0
		net_horse_get_data
		getarraysize trick_obj_select_list
		if (<array_size> > 0)
			NetHorse_SendData {
				type = classic
				data = {
					start_pos = <start_pos>
					start_quat = <start_quat>
					trick_objs = <trick_obj_select_list>
				}
			}
			net_horse_enable_skater_input
		else
			if gamemodeequals is_lobby
			else
				printf "Didn't have pieces selected!"
			endif
		endif
	endif
endscript

script net_horse_done_placing_pieces_error 
	printf \{"--- net_horse_done_placing_pieces_error"}
	create_net_panel_message \{text = "You must select at least one object!"}
	wait \{3
		seconds}
	net_horse_layout_state_enter
endscript

script net_horse_disable_skater_input 
	printf \{"--- net_horse_disable_skater_input"}
	getskaterid
	<objid> :netdisableplayerinput
endscript

script net_horse_enable_skater_input 
	printf \{"--- net_horse_enable_skater_input"}
	getskaterid
	<objid> :netenableplayerinput
endscript

script net_horse_choose_start_pos 
	printf "--- net_horse_choose_start_pos"
	if NOT ($cap_current_object) :cap_isposvalid
		return
	endif
	net_horse_get_data
	if gotparam net_start_pos_obj
		printf "gotparam"
		if compositeobjectexists name = <net_start_pos_obj>
			printf "object exists"
			<net_start_pos_obj> :die
		endif
	endif
	($cap_current_object) :obj_getposition
	($cap_current_object) :obj_getquat
	construct_new_object {
		index = ($cap_current_index)
		constructtype = ($cap_current_type)
		pos = <pos>
		quat = <quat>
		placed = false
		use_offsets = false
		use_cap = false
	}
	net_horse_set_data {
		start_pos = <pos>
		start_quat = <quat>
		net_start_pos_obj = <object_name>
	}
	if screenelementexists id = net_horse_layout_info_dialog
		dialog_box_exit anchor_id = net_horse_layout_info_dialog
	endif
	net_horse_disable_skater_input
	net_horse_layout_set_can_proceed
endscript

script net_horse_choose_kicker 
	printf "--- net_horse_choose_kicker"
	if NOT ($cap_current_object) :cap_isposvalid
		return
	endif
	net_horse_get_data
	if gotparam net_ntt_kicker_obj
		printf "gotparam"
		if compositeobjectexists name = <net_ntt_kicker_obj>
			printf "object exists"
			<net_ntt_kicker_obj> :die
		endif
	endif
	($cap_current_object) :obj_getposition
	($cap_current_object) :obj_getquat
	construct_new_object {
		index = ($cap_current_index)
		constructtype = ($cap_current_type)
		pos = <pos>
		quat = <quat>
		placed = false
		use_offsets = false
		use_cap = false
	}
	net_horse_set_data {
		ntt_kicker_pos = <pos>
		ntt_kicker_quat = <quat>
		net_ntt_kicker_obj = <object_name>
		kicker_set = 1
	}
	net_horse_disable_skater_input
	net_horse_layout_set_can_proceed
endscript

script net_horse_get_data 
	gman_getactivatedgoalid
	if gotparam \{activated_goal_id}
		gman_getdata goal = <activated_goal_id>
	endif
	return <...>
endscript

script net_horse_set_data 
	gman_getactivatedgoalid
	if gotparam \{activated_goal_id}
		gman_setdata {
			goal = <activated_goal_id>
			params = <...>
		}
	else
		printf \{"Warning! set horse data while not in horse goal!"}
		printscriptinfo
	endif
endscript

script net_horse_online_kicker_trigger_plane_script 
	printf \{"--- net_horse_online_kicker_trigger_plane_script"}
	net_horse_ntt_play
endscript

script net_horse_common_clear_game_objects 
	printf "--- net_horse_common_clear_game_objects"
	net_horse_get_data
	if gotparam net_ntt_kicker_obj
		if compositeobjectexists name = <net_ntt_kicker_obj>
			<net_ntt_kicker_obj> :die
		endif
	endif
	if gotparam net_start_pos_obj
		if compositeobjectexists name = <net_start_pos_obj>
			<net_start_pos_obj> :die
		endif
	endif
	if gotparam net_end_pos_obj
		printf "got the param"
		if compositeobjectexists name = <net_end_pos_obj>
			printf "found the object"
			<net_end_pos_obj> :die
		endif
	endif
endscript

script net_horse_common_post_deactivate 
	printf "--- net_horse_common_post_deactivate"
	change dont_restore_start_key_binding = 0
	net_horse_destroy_observer_name
	if ishost
		SetPreferencesFromUI {
			prefs = network
			field = 'player_collision'
			checksum = <collision>
			string = <collision_string>
		}
		netsessionfunc obj = match func = update_game_options
	endif
	if ($cap_in_menu = 1)
		cap_finish
	endif
	killspawnedscript name = net_horse_wait_and_check_game_over
	killspawnedscript name = net_horse_recieve_set_score
	if screenelementexists id = net_horse_layout_info_dialog
		destroyscreenelement id = net_horse_layout_info_dialog
	endif
	if screenelementexists id = net_horse_menu_cont
		destroyscreenelement id = net_horse_menu_cont
	endif
	ForceChangeObservingState state = false
	killspawnedscript name = net_horse_wait_and_hide_layout_skater
	if gotparam layout_skater
		if getskaterid skater = <layout_skater> net
			<objid> :unhide
		endif
	endif
endscript

script Net_horse_finish_plane_script 
	printf \{"--- Net_horse_finish_plane_script"}
	gman_flagfunc \{goal = net_horse
		tool = complete
		checkpoint = attempt_goal_classic
		func = set
		params = {
			flag = crossed_finish
			value = 1
		}}
	GMan_Land
	stopbalancetrick
	landskatertricks
	cleareventbuffer
endscript

script net_horse_choose_end_pos 
	printf "--- net_horse_choose_end_pos"
	if NOT ($cap_current_object) :cap_isposvalid
		return
	endif
	net_horse_get_data
	if gotparam net_end_pos_obj
		printf "gotparam"
		if compositeobjectexists name = <net_end_pos_obj>
			printf "object exists"
			<net_end_pos_obj> :die
		endif
	endif
	($cap_current_object) :obj_getposition
	($cap_current_object) :obj_getquat
	construct_new_object {
		index = ($cap_current_index)
		constructtype = ($cap_current_type)
		pos = <pos>
		quat = <quat>
		placed = false
		use_offsets = false
		use_cap = false
	}
	net_horse_set_data {
		net_end_pos_pos = <pos>
		net_end_pos_quat = <quat>
		net_end_pos_obj = <object_name>
		kicker_set = 1
	}
	net_horse_disable_skater_input
	net_horse_layout_set_can_proceed
endscript

script net_horse_recieve_end_game 
	printf \{"--- net_horse_recieve_end_game"}
	gman_getactivatedgoalid
	if gotparam \{activated_goal_id}
		gman_setnextcheckpoint goal = <activated_goal_id> next_checkpoint = game_end
		gman_passcheckpoint goal = <activated_goal_id>
	endif
endscript
