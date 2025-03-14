net_rounds_round_list_pos = (850.0, 50.0)
net_rounds_round_list_entry_color = [
	200
	200
	200
	255
]
net_rounds_round_list_entry_focus_color = [
	255
	0
	0
	255
]
net_rounds_round_list_text_scale = 0.8
net_rounds_results_title_bg_main = [
	0
	0
	0
	255
]
net_rounds_results_title_bg_minor = [
	255
	0
	0
	255
]
net_rounds_results_bg_color = [
	64
	64
	64
	100
]
net_rounds_result_item_bg_focus = [
	255
	255
	255
	255
]
net_rounds_result_item_bg_unfocus = [
	0
	0
	0
	0
]
net_rounds_current_round_info_name_color = [
	255
	255
	255
	255
]

script net_rounds_ui_setup 
	printf \{"---net_rounds_ui_setup"}
endscript

script net_rounds_create_round_list 
	printf "--- net_rounds_create_round_list"
	if screenelementexists id = net_rounds_round_list_cont
		softassert "Round list currently still up!"
		return
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = net_rounds_round_list_cont
		pos = $net_rounds_round_list_pos
		just = [left top]
	}
	createscreenelement {
		type = vmenu
		id = net_rounds_round_list_vmenu
		parent = net_rounds_round_list_cont
		just = [left top]
		event_handlers = [
			{pad_back net_rounds_round_list_menu_leave}
			{focus net_rounds_round_list_disable_refresh}
			{unfocus net_rounds_round_list_enable_refresh}
		]
	}
	runscriptonscreenelement id = net_rounds_round_list_vmenu net_rounds_roun_list_timed_refresh
endscript
net_rounds_round_list_do_refresh = 1

script net_rounds_round_list_disable_refresh 
	change \{net_rounds_round_list_do_refresh = 0}
endscript

script net_rounds_round_list_enable_refresh 
	change \{net_rounds_round_list_do_refresh = 1}
endscript

script net_rounds_round_list_menu_leave 
	printf \{"--- net_rounds_round_list_menu_leave"}
	launchevent \{type = unfocus
		target = net_rounds_round_list_vmenu}
	launchevent \{type = focus
		target = current_menu}
endscript

script net_rounds_round_list_menu_enter 
	printf \{"--- net_rounds_round_list_menu_enter"}
	launchevent \{type = unfocus
		target = current_menu}
	launchevent \{type = focus
		target = net_rounds_round_list_vmenu}
endscript

script net_rounds_round_list_menu_hide 
	if screenelementexists \{id = net_rounds_round_list_cont}
		setscreenelementprops \{id = net_rounds_round_list_cont
			alpha = 0}
	endif
endscript

script net_rounds_round_list_menu_unhide 
	if screenelementexists \{id = net_rounds_round_list_cont}
		setscreenelementprops \{id = net_rounds_round_list_cont
			alpha = 1}
	endif
endscript

script net_rounds_destroy_round_list 
	printf \{"--- net_rounds_destroy_round_list"}
	if screenelementexists \{id = net_rounds_round_list_cont}
		destroyscreenelement \{id = net_rounds_round_list_cont}
	endif
endscript

script net_rounds_round_list_refresh 
	if NOT gotparam force
		if ($net_rounds_round_list_do_refresh = 0)
			return
		endif
	endif
	destroyscreenelement {
		id = net_rounds_round_list_vmenu
		preserve_parent
	}
	NetRoundFunc func = get_round_settings
	if gotparam score_mode
		if (<score_mode> = rounds)
			net_rounds_round_list_settings_add_item {
				text = "Round Mode"
			}
			formattext textname = round_text "Rounds: %d" d = <rounds>
			net_rounds_round_list_settings_add_item {
				text = <round_text>
				id = net_round_game_mode_item
			}
		elseif (<score_mode> = points)
			net_rounds_round_list_settings_add_item {
				text = "Points Mode"
			}
			formattext textname = points_text "Rounds: %d" d = <rounds>
			net_rounds_round_list_settings_add_item {
				text = <points_text>
				id = net_round_game_mode_item_settings
			}
		endif
	endif
	NetRoundFunc func = get_round_list
	if gotparam round_list
		getarraysize <round_list>
		if (<array_size> > 0)
			i = 0
			begin
			net_rounds_round_list_add_item {
				(<round_list> [<i>])
				num = (<i> + 1)
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script net_rounds_roun_list_timed_refresh 
	begin
	wait \{1
		second}
	net_rounds_round_list_refresh
	repeat
endscript

script net_rounds_round_list_settings_add_item 
	text_scale = $net_rounds_round_list_text_scale
	createscreenelement {
		type = containerelement
		id = <id>
		parent = net_rounds_round_list_vmenu
		just = [left top]
		dims = (50.0, 50.0)
		not_focusable
	}
	cont_id = <id>
	createscreenelement {
		type = textelement
		local_id = text
		parent = <cont_id>
		font = text_a1
		text = <text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
	}
endscript

script net_rounds_round_list_add_item 
	net_rounds_get_game_mode_info mode = <mode>
	formattext checksumname = cont_id 'round_entry_%d' d = <round_id>
	text_scale = $net_rounds_round_list_text_scale
	createscreenelement {
		type = containerelement
		id = <cont_id>
		parent = net_rounds_round_list_vmenu
		just = [left top]
		dims = (50.0, 50.0)
		event_handlers = [
			{focus net_rounds_round_list_item_focus}
			{unfocus net_rounds_round_list_item_unfocus}
			{pad_square net_rounds_round_list_remove_round}
		]
	}
	<cont_id> :settags mode = <mode> round_id = <round_id> num = <num>
	formattext textname = num_text "%d" d = <num>
	createscreenelement {
		type = textelement
		local_id = round_num
		parent = <cont_id>
		font = text_a1
		text = <num_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
	}
	getscreenelementprops id = <id>
	text_pos = (<pos> + (30.0, 0.0))
	createscreenelement {
		type = textelement
		local_id = round_name
		parent = <cont_id>
		pos = <text_pos>
		font = text_a1
		text = (<mode_info>.name)
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
	}
endscript

script net_rounds_round_list_remove_round 
	printf \{"--- net_rounds_round_list_remove_round"}
	obj_getid
	<objid> :gettags
	printstruct <...>
	NetRoundFunc {
		func = remove_round
		params = {
			round_num = <round_id>
		}
	}
	wait \{5
		gameframes}
	net_rounds_round_list_refresh \{force}
	launchevent \{type = focus
		target = net_rounds_round_list_vmenu}
endscript

script net_rounds_round_list_item_focus 
	obj_getid
	setscreenelementprops id = {<objid> child = round_num} rgba = ($net_rounds_round_list_entry_focus_color)
	setscreenelementprops id = {<objid> child = round_name} rgba = ($net_rounds_round_list_entry_focus_color)
endscript

script net_rounds_round_list_item_unfocus 
	obj_getid
	setscreenelementprops id = {<objid> child = round_num} rgba = ($net_rounds_round_list_entry_color)
	setscreenelementprops id = {<objid> child = round_name} rgba = ($net_rounds_round_list_entry_color)
endscript

script net_rounds_get_game_mode_info 
	requireparams [mode] all
	getarraysize $net_game_type_info
	i = 0
	found_mode = 0
	begin
	if (($net_game_type_info [<i>].checksum) = <mode>)
		found_mode = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<found_mode> = 0)
		softassert "Did not find game mode!"
		printstruct <...>
	endif
	return mode_info = ($net_game_type_info [<i>])
endscript

script net_rounds_current_round_hud_create 
	printf "--- net_rounds_current_round_hud_create"
	cont_id = net_rounds_current_round_hud_cont
	createscreenelement {
		type = containerelement
		id = <cont_id>
		parent = net_rounds_round_list_vmenu
		just = [left top]
		dims = (50.0, 50.0)
	}
	NetRoundFunc func = get_current_round_params
	net_rounds_get_game_mode_info mode = <mode>
	createscreenelement {
		type = spriteelement
		local_id = bg
		parent = <cont_id>
		texture = menu_highlight
		rgba = $net_rounds_round_list_entry_color
		just = [left top]
	}
	getscreenelementprops id = <id>
	text_pos = (0.0, 0.0)
	createscreenelement {
		type = textelement
		local_id = round_name
		parent = <cont_id>
		pos = <text_pos>
		font = text_a1
		text = (<mode_info>.name)
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
	}
endscript

script net_rounds_current_round_hud_destroy 
	printf \{"--- net_rounds_current_round_hud_destroy"}
	if screenelementexists \{id = net_rounds_current_round_hud_cont}
		destroyscreenelement \{id = net_rounds_current_round_hud_cont}
	endif
endscript

script net_rounds_prepare_rankings 
	printf "--- net_rounds_prepare_rankings"
	change just_finished_net_game = 1
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if objectexists id = dialog_box_anchor
		close_rankings
		return
	endif
	if objectexists id = quit_dialog_anchor
		close_rankings
		return
	endif
	kill_start_key_binding
	pause_trick_text
	FillRankingScreen
	if NetRoundFunc func = in_round_mode
		if NetRoundFunc func = is_arbitrator
			NetRoundFunc {
				func = end_round
				params = {
					callback = net_rounds_create_rankings
				}
			}
		endif
	endif
	spawnscriptlater spawned_net_rounds_prepare_rankings
	gman_deactivateallgoals
	gman_setcanstartgoal 0
endscript

script spawned_net_rounds_prepare_rankings 
	printf \{"--- spawned_net_rounds_prepare_rankings"}
	unpause_game_and_destroy_pause_menu
	wait \{10
		gameframes}
	NetRoundFunc \{func = ready_to_end}
endscript

script net_rounds_create_rankings 
	printf "--- net_rounds_create_rankings"
	kill_start_key_binding
	createscreenelement {
		type = containerelement
		parent = root_window
		id = rankings_anchor
		just = [left top]
		pos = (240.0, 100.0)
	}
	assignalias id = rankings_anchor alias = current_menu_anchor
	createscreenelement {
		type = vmenu
		parent = rankings_anchor
		id = rankings_vmenu
		just = [left top]
		internal_just = [left top]
	}
	NetRoundFunc {
		func = get_round_results
	}
	if NetRoundFunc func = is_game_over
		if OnServer
			NetRoundFunc {
				func = update_wagers
			}
		endif
		if ininternetmode
			if netsessionfunc obj = match func = logged_in
				netsessionfunc obj = stats func = stats_write_multiplayer params = {use_saved_params}
			endif
		endif
	endif
	net_rounds_create_bg {
		parent = rankings_anchor
		dims = (780.0, 400.0)
		pos = (-25.0, 45.0)
	}
	if isxenon
		net_rounds_add_ranking {
			gamertag_text = "Gamertag"
			round_score_text = "Game Score"
			round_points_text = "Round Points"
			not_focusable
			title
		}
	else
		net_rounds_add_ranking {
			gamertag_text = "Name"
			round_score_text = "Game Score"
			round_points_text = "Round Points"
			not_focusable
			title
		}
	endif
	GetNumTeams
	has_teams = 0
	if (<num_teams> > 0)
		has_teams = 1
	endif
	printstruct <...>
	getarraysize round_results
	if (<array_size> > 0)
		i = 0
		begin
		if (<has_teams> = 1)
			get_team_color_from_team_num team_num = (<round_results> [<i>].team_num)
		endif
		net_rounds_add_ranking entry = (<round_results> [<i>]) color = <team_color>
		i = (<i> + 1)
		repeat <array_size>
	endif
	runscriptonscreenelement id = current_menu_anchor net_rounds_delay_input_show_helper_text params = {delay_input_seconds = 2}
	launchevent type = focus target = rankings_vmenu
endscript

script net_rounds_delay_input_show_helper_text 
	printf "--- net_rounds_delay_input_show_helper_text"
	wait <delay_input_seconds> seconds
	choose_script = close_rankings
	if NetRoundFunc func = is_game_over
		choose_script = net_rounds_create_rankings_end_game
	endif
	setscreenelementprops {
		id = rankings_vmenu
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose <choose_script>}
		]
	}
	if isxenon
		<helper_text_elements> = [
			{text = "\\m5 Gamer Card"}
			{text = "\\m0 Continue"}
		]
	else
		<helper_text_elements> = [
			{text = "\\m0 Continue"}
		]
	endif
	create_helper_text {
		helper_text_elements = <helper_text_elements>
	}
endscript

script net_rounds_create_bg 
	printf "--- net_rounds_create_bg"
	if NOT gotparam parent
		printf "net_rounds_create_bg no parent provided, returning"
		return
	endif
	if NOT gotparam dims
		dims = (640.0, 480.0)
	endif
	if NOT gotparam pos
		pos = (0.0, 0.0)
	endif
	bg_dims = <dims>
	z_priority = -30
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = rankings_bg_cont
		just = [left top]
		pos = <pos>
		z_priority = -5
	}
	getscreenelementprops id = <id>
	cont_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = dialog_frame
		just = [left top]
		rgba = $net_rounds_results_bg_color
		z_priority = (<z_priority> -1)
		flip_v
	}
	scale_element_to_size {
		id = <id>
		target_width = ((1.0, 0.0).<dims>)
	}
	getscreenelementdims id = <id>
	border_height = <height>
	getscreenelementprops id = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = dialog_middle
		just = [left top]
		rgba = $net_rounds_results_bg_color
		z_priority = (<z_priority> -1)
		flip_v
	}
	scale_element_to_size {
		id = <id>
		target_width = ((1.0, 0.0).<bg_dims>)
		target_height = ((0.0, 1.0).<bg_dims> - <border_height> * 2)
	}
	setscreenelementprops {
		id = <id>
		pos = (<pos> + (0.0, 1.0) * <height>)
	}
	getscreenelementprops id = <id>
	getscreenelementdims id = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		texture = dialog_frame_b
		just = [left top]
		rgba = $net_rounds_results_bg_color
		z_priority = (<z_priority> -1)
		flip_v
	}
	scale_element_to_size {
		id = <id>
		target_width = ((1.0, 0.0).<dims>)
	}
	setscreenelementprops {
		id = <id>
		pos = (<pos> + (0.0, 1.0) * <height>)
	}
	return bg_id = <cont_id>
endscript

script net_rounds_finalize_rankings 
	printf \{"--- net_rounds_finalize_rankings"}
endscript

script net_rounds_add_ranking 
	printf "--- net_rounds_add_ranking"
	if NOT gotparam gamertag_text
		if NOT PlayerExists player_num = (<entry>.player_num)
			return
		endif
	endif
	if gotparam not_focusable
		not_focusable = not_focusable
	else
		player_num = (<entry>.player_num)
	endif
	printstruct <...>
	entry_dims = (200.0, 50.0)
	if isxenon
		createscreenelement {
			type = containerelement
			parent = rankings_vmenu
			just = [left top]
			dims = <entry_dims>
			event_handlers = [
				{pad_square show_gamer_card params = {player_xuid = <player_num>}}
				{focus net_rounds_rank_item_focus}
				{unfocus net_rounds_rank_item_unfocus}
			]
			<not_focusable>
		}
	else
		createscreenelement {
			type = containerelement
			parent = rankings_vmenu
			just = [left top]
			dims = <entry_dims>
			event_handlers = [
				{focus net_rounds_rank_item_focus}
				{unfocus net_rounds_rank_item_unfocus}
			]
			<not_focusable>
		}
	endif
	cont_id = <id>
	text_scale = (0.75, 1.0)
	text_pos = (0.0, 0.0)
	z_priority = 5
	if gotparam color
		<cont_id> :settags color = <color>
	endif
	if NOT gotparam gamertag_text
		GetPlayerGamertag player_num = (<entry>.player_num)
		gamertag_text = <gamertag>
	endif
	createscreenelement {
		type = textelement
		local_id = gamertag_text
		parent = <cont_id>
		font = text_a1
		text = <gamertag_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <text_pos>
		z_priority = <z_priority>
		rgba = <color>
	}
	text_pos = (<text_pos> + (380.0, 0.0))
	if NOT gotparam round_score_text
		formattext textname = round_score_text "%d" d = (<entry>.gamemode_score)
	endif
	createscreenelement {
		type = textelement
		local_id = round_score_text
		parent = <cont_id>
		font = text_a1
		text = <round_score_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <text_pos>
		z_priority = <z_priority>
		rgba = <color>
	}
	text_pos = (<text_pos> + (200.0, 0.0))
	if NOT gotparam round_points_text
		formattext textname = round_points_text "%d" d = (<entry>.round_score)
	endif
	createscreenelement {
		type = textelement
		local_id = round_points_text
		parent = <cont_id>
		font = text_a1
		text = <round_points_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <text_pos>
		z_priority = <z_priority>
		rgba = <color>
	}
	getscreenelementdims id = <id>
	bg_priority = (<z_priority> - 2)
	bg_nudge = 20
	bg_shad_offset = (5.0, 5.0)
	bg_height = (<entry_dims>.(0.0, 1.0))
	bg_width = (<text_pos>.(1.0, 0.0) + <width> + 20)
	if gotparam title
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			texture = menu_highlight
			rgba = $net_rounds_results_title_bg_minor
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0) + <bg_shad_offset>)
			z_priority = <bg_priority>
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			texture = menu_highlight
			rgba = $net_rounds_results_title_bg_main
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0))
			z_priority = (<bg_priority> + 1)
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
		rankings_vmenu :settags bg_width = <bg_width>
	else
		rankings_vmenu :getsingletag bg_width
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			local_id = bg
			texture = menu_highlight
			rgba = $net_rounds_result_item_bg_unfocus
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0))
			z_priority = (<bg_priority> + 1)
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
	endif
endscript

script net_rounds_rank_item_focus 
	printf "--- net_rounds_rank_item_focus"
	obj_getid
	<objid> :gettags
	if NOT gotparam color
		setscreenelementprops id = {<objid> child = gamertag_text} rgba = ($net_rounds_round_list_entry_focus_color)
		setscreenelementprops id = {<objid> child = round_score_text} rgba = ($net_rounds_round_list_entry_focus_color)
		setscreenelementprops id = {<objid> child = round_points_text} rgba = ($net_rounds_round_list_entry_focus_color)
	endif
	setscreenelementprops id = {<objid> child = bg} rgba = ($net_rounds_result_item_bg_focus)
endscript

script net_rounds_rank_item_unfocus 
	printf "--- net_rounds_rank_item_unfocus"
	obj_getid
	<objid> :gettags
	if NOT gotparam color
		setscreenelementprops id = {<objid> child = gamertag_text} rgba = ($net_rounds_round_list_entry_color)
		setscreenelementprops id = {<objid> child = round_score_text} rgba = ($net_rounds_round_list_entry_color)
		setscreenelementprops id = {<objid> child = round_points_text} rgba = ($net_rounds_round_list_entry_color)
	endif
	setscreenelementprops id = {<objid> child = bg} rgba = ($net_rounds_result_item_bg_unfocus)
endscript

script net_rounds_prepare_rankings_end_game 
	printf "--- net_rounds_prepare_rankings_end_game"
	if OnServer
		MarkGameOver
	endif
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if objectexists id = dialog_box_anchor
		close_rankings
		return
	endif
	if objectexists id = quit_dialog_anchor
		close_rankings
		return
	endif
	pause_trick_text
	unpause_game_and_destroy_pause_menu
	if innetgame
		if isobserving
			ForceChangeObservingState state = false
		endif
		netsessionfunc func = incrementnumgamesplayed
	endif
endscript

script net_rounds_create_rankings_end_game 
	printf "--- net_rounds_create_rankings_end_game"
	net_rounds_prepare_rankings_end_game
	if screenelementexists id = rankings_anchor
		destroyscreenelement id = rankings_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = rankings_anchor
		just = [left top]
		pos = (200.0, 100.0)
	}
	assignalias id = rankings_anchor alias = current_menu_anchor
	createscreenelement {
		type = vmenu
		parent = rankings_anchor
		id = rankings_vmenu
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_choose close_rankings}
		]
	}
	NetRoundFunc {
		func = get_match_results
	}
	printstruct <...>
	net_rounds_create_bg {
		parent = rankings_anchor
		dims = (880.0, 400.0)
		pos = (-25.0, 45.0)
	}
	if isxenon
		net_rounds_add_ranking_end_game {
			gamertag_text = "Gamertag"
			round_points_text = "Round Points"
			not_focusable
			title
		}
	else
		net_rounds_add_ranking_end_game {
			gamertag_text = "Name"
			round_points_text = "Round Points"
			not_focusable
			title
		}
	endif
	getarraysize player_list
	if NOT gotparam player_list
		printf "Ack! Host has told me to clear out my list! I don't have results to show!"
		close_rankings
		return
	endif
	team_num = -1
	if (<num_teams> > 0)
		i = 0
		begin
		get_team_color_from_team_num team_num = (<player_list> [<i>].team)
		if (<player_list> [<i>].team = <team_num>)
		else
			team_num = (<player_list> [<i>].team)
			if (<team_num> >= 0)
				formattext textname = team_text "Team %d" d = (<team_num> + 1)
				formattext textname = team_score "%d" d = (<team_list> [<team_num>].score)
				net_rounds_add_ranking_end_game {
					gamertag_text = <team_text>
					round_points_text = <team_score>
					not_focusable
					team_header
					color = <team_color>
				}
			endif
		endif
		net_rounds_add_ranking_end_game {
			entry = (<player_list> [<i>])
			rank = (<i> + 1)
			color = <team_color>
		}
		i = (<i> + 1)
		repeat <array_size>
	else
		i = 0
		begin
		net_rounds_add_ranking_end_game {
			entry = (<player_list> [<i>])
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
	if isxenon
		<helper_text_elements> = [
			{text = "\\m5 Gamer Card"}
			{text = "\\m0 Continue"}
		]
	else
		<helper_text_elements> = [
			{text = "\\m0 Continue"}
		]
	endif
	create_helper_text {
		helper_text_elements = <helper_text_elements>
	}
	launchevent type = focus target = rankings_vmenu
endscript

script net_rounds_add_ranking_end_game 
	printf "--- net_rounds_add_ranking_end_game"
	if NOT gotparam gamertag_text
		if NOT PlayerExists player_num = (<entry>.id)
			return
		endif
	endif
	if gotparam not_focusable
		not_focusable = not_focusable
	else
		player_num = (<entry>.id)
	endif
	printstruct <...>
	entry_dims = (200.0, 50.0)
	if isxenon
		createscreenelement {
			type = containerelement
			parent = rankings_vmenu
			just = [left top]
			dims = <entry_dims>
			event_handlers = [
				{pad_square show_gamer_card params = {player_xuid = <player_num>}}
				{focus net_rounds_rank_item_end_game_focus}
				{unfocus net_rounds_rank_item_end_game_unfocus}
			]
			<not_focusable>
		}
	else
		createscreenelement {
			type = containerelement
			parent = rankings_vmenu
			just = [left top]
			dims = <entry_dims>
			event_handlers = [
				{focus net_rounds_rank_item_end_game_focus}
				{unfocus net_rounds_rank_item_end_game_unfocus}
			]
			<not_focusable>
		}
	endif
	cont_id = <id>
	text_scale = (0.7, 0.9)
	text_pos = (0.0, 0.0)
	z_priority = 0
	if gotparam team_header
		bg_color = <color>
	else
		text_color = <color>
	endif
	if gotparam color
		<cont_id> :settags color = <color>
	endif
	if NOT gotparam gamertag_text
		GetPlayerGamertag player_num = (<entry>.id)
		gamertag_text = <gamertag>
	endif
	createscreenelement {
		type = textelement
		local_id = gamertag_text
		parent = <cont_id>
		font = text_a1
		text = <gamertag_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <text_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	text_pos = (<text_pos> + (700.0, 0.0))
	if NOT gotparam round_points_text
		formattext textname = round_points_text "%d" d = (<entry>.score)
	endif
	createscreenelement {
		type = textelement
		local_id = round_points_text
		parent = <cont_id>
		font = text_a1
		text = <round_points_text>
		rgba = $net_rounds_round_list_entry_color
		scale = <text_scale>
		just = [left top]
		pos = <text_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	getscreenelementdims id = <id>
	bg_priority = (<z_priority> - 2)
	bg_nudge = 20
	bg_shad_offset = (5.0, 5.0)
	bg_height = (<entry_dims>.(0.0, 1.0))
	bg_width = (<text_pos>.(1.0, 0.0) + <width> + 20)
	if gotparam title
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			texture = menu_highlight
			rgba = $net_rounds_results_title_bg_minor
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0) + <bg_shad_offset>)
			z_priority = <bg_priority>
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			texture = menu_highlight
			rgba = $net_rounds_results_title_bg_main
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0))
			z_priority = (<bg_priority> + 1)
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
		rankings_vmenu :settags bg_width = <bg_width>
	else
		rankings_vmenu :getsingletag bg_width
		createscreenelement {
			type = spriteelement
			parent = <cont_id>
			local_id = bg
			texture = menu_highlight
			rgba = $net_rounds_result_item_bg_unfocus
			just = [left top]
			pos = ((-1.0, 0.0) * (<bg_nudge> / 2.0))
			z_priority = (<bg_priority> + 1)
			rgba = <bg_color>
		}
		scale_element_to_size {
			id = <id>
			target_height = <bg_height>
			target_width = <bg_width>
		}
	endif
endscript

script net_rounds_rank_item_end_game_focus 
	printf "--- net_rounds_rank_item_end_game_focus"
	obj_getid
	<objid> :gettags
	if NOT gotparam color
		setscreenelementprops id = {<objid> child = gamertag_text} rgba = ($net_rounds_round_list_entry_focus_color)
		setscreenelementprops id = {<objid> child = round_points_text} rgba = ($net_rounds_round_list_entry_focus_color)
	endif
	setscreenelementprops id = {<objid> child = bg} rgba = ($net_rounds_result_item_bg_focus)
endscript

script net_rounds_rank_item_end_game_unfocus 
	printf "--- net_rounds_rank_item_end_game_unfocus"
	obj_getid
	<objid> :gettags
	if NOT gotparam color
		setscreenelementprops id = {<objid> child = gamertag_text} rgba = ($net_rounds_round_list_entry_color)
		setscreenelementprops id = {<objid> child = round_points_text} rgba = ($net_rounds_round_list_entry_color)
	endif
	setscreenelementprops id = {<objid> child = bg} rgba = ($net_rounds_result_item_bg_unfocus)
endscript

script net_rounds_create_current_round 
	printf \{"--- net_rounds_create_current_round"}
	NetRoundFunc \{func = get_current_round_params}
	NetRoundFunc \{func = get_round_num}
	net_rounds_get_game_mode_info mode = <mode>
	formattext textname = round_text "%d) %e" d = <round_num> e = (<mode_info>.name)
	net_rounds_create_info_swatch_text {
		text = <round_text>
	}
endscript

script net_rounds_create_info_swatch_text 
	printf "--- net_rounds_create_info_swatch_text"
	if NOT gotparam text
		printf "warning, did not get text param, returning"
		return
	endif
	if screenelementexists id = net_rounds_current_round_info_cont
		destroyscreenelement id = net_rounds_current_round_info_cont
	endif
	just = [left top]
	text_pos = (0.0, 0.0)
	text_scale = 0.8
	createscreenelement {
		type = containerelement
		id = net_rounds_current_round_info_cont
		parent = root_window
		just = <just>
		pos = (130.0, 60.0)
	}
	cont_id = <id>
	createscreenelement {
		type = textelement
		local_id = round_name
		parent = <cont_id>
		pos = <text_pos>
		font = text_a1
		text = <text>
		rgba = $net_rounds_current_round_info_name_color
		scale = <text_scale>
		just = <just>
	}
	getscreenelementdims id = <id>
	swatch_extra_x = 20
	swatch_extra_y = 10
	text_width = (<width> + <swatch_extra_x>)
	text_height = (<height> + <swatch_extra_y>)
	z_priority = 0
	bg_pos = ((-1.0, 0.0) * (<swatch_extra_x> / 2.0) + (0.0, -1.0) * (<swatch_extra_y> / 2.0))
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = cap_whitenoise
		just = <just>
		rgba = [220 220 220 220]
		z_priority = (<z_priority> - 1)
		alpha = 0.5
		pos = <bg_pos>
	}
	scale_element_to_size {
		id = <id>
		target_width = <text_width>
		target_height = <text_height>
	}
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = menu_highlight
		just = <just>
		rgba = [0 0 0 255]
		rot_angle = RandomRange (-1.5, 1.0)
		z_priority = (<z_priority> - 2)
		alpha = 0.5
		pos = <bg_pos>
	}
	scale_element_to_size {
		id = <id>
		target_width = <text_width>
		target_height = <text_height>
	}
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = menu_highlight
		just = <just>
		rgba = ($goal_ui_scheme.main)
		rot_angle = RandomRange (1.0, -1.0)
		z_priority = (<z_priority> - 3)
		alpha = 0.5
		pos = <bg_pos>
	}
	scale_element_to_size {
		id = <id>
		target_width = <text_width>
		target_height = <text_height>
	}
	net_rounds_current_round_info_cont :settags text_width = <text_width> text_height = <text_height> text_pos = <text_pos>
endscript

script net_rounds_destroy_current_round 
	printf \{"--- net_rounds_destroy_current_round"}
	if screenelementexists \{id = net_rounds_current_round_info_cont}
		destroyscreenelement \{id = net_rounds_current_round_info_cont}
	endif
endscript

script net_rounds_create_current_round_description description = "some text with small words"
	printf "--- net_rounds_create_current_round_description"
	wait 5 gameframes
	if NOT screenelementexists id = net_rounds_current_round_info_cont
		return
	endif
	net_rounds_current_round_info_cont :getsingletag text_width
	net_rounds_current_round_info_cont :getsingletag text_height
	net_rounds_current_round_info_cont :getsingletag text_pos
	just = [left top]
	if screenelementexists id = net_rounds_current_round_game_settings_cont
		destroyscreenelement id = net_rounds_current_round_game_settings_cont
	endif
	createscreenelement {
		type = containerelement
		id = net_rounds_current_round_game_settings_cont
		parent = net_rounds_current_round_info_cont
		just = <just>
		alpha = 0
	}
	cont_id = <id>
	smudge_height = (30 + <text_height>)
	createscreenelement {
		parent = <cont_id>
		type = spriteelement
		texture = menu_highlight
		just = <just>
		rgba = [0 0 0 255]
		z_priority = -50
		alpha = 0.5
	}
	smudge_id = <id>
	fudge_factor_y = 5
	fudge_factor_x = 20
	desc_pos = ((0.0, 1.0) * (<text_height> - <fudge_factor_y>) + (1.0, 0.0) * <fudge_factor_x>)
	text_scale = 0.7
	block_width = (<text_width> - <fudge_factor_x>)
	if english
		if (<block_width> < 300)
			block_width = 300
		endif
	else
		if (<block_width> < 500)
			block_width = 500
		endif
	endif
	block_dims = ((1.0, 0.0) * <block_width> + (0.0, 10.0))
	createscreenelement {
		type = textblockelement
		local_id = description
		parent = <cont_id>
		pos = <desc_pos>
		font = text_a1
		text = <description>
		rgba = $net_rounds_current_round_info_name_color
		internal_scale = <text_scale>
		just = <just>
		internal_just = [left top]
		dims = <block_dims>
		rgba = [200 200 200 255]
		allow_expansion
	}
	getscreenelementdims id = <id>
	block_width = <width>
	block_height = <height>
	smudge_fudge_y = 10
	scale_element_to_size {
		id = <smudge_id>
		target_width = <block_width>
		target_height = (<text_height> + <block_height> + <smudge_fudge_y>)
	}
	runscriptonscreenelement id = <cont_id> net_rounds_current_round_description_anim
endscript

script net_rounds_current_round_description_anim \{msg_time = 10}
	obj_getid
	<objid> :domorph alpha = 1 time = 0.5
	wait <msg_time> seconds
	<objid> :domorph alpha = 0 time = 0.5
	<objid> :die
endscript

script net_rounds_create_pre_round_info 
	printf \{"--- net_rounds_create_pre_round_info"}
	net_rounds_get_game_mode_info mode = <mode>
	formattext textname = starting_text "Starting %d" d = (<mode_info>.name)
	net_rounds_create_info_swatch_text {
		text = <starting_text>
	}
endscript

script net_rounds_create_panel_message 
	printf "--- net_rounds_create_panel_message"
	if NOT gotparam text
		printf "Did not get text param!"
		return
	endif
	just = [left top]
	if screenelementexists id = net_rounds_panel_message_cont
		destroyscreenelement id = net_rounds_panel_message_cont
	endif
	createscreenelement {
		type = containerelement
		id = net_rounds_panel_message_cont
		parent = root_window
		just = <just>
		alpha = 0
	}
	cont_id = <id>
	desc_pos = (900.0, 300.0)
	text_scale = 0.7
	block_width = 250
	block_dims = ((1.0, 0.0) * <block_width> + (0.0, 10.0))
	createscreenelement {
		type = textblockelement
		local_id = description
		parent = <cont_id>
		pos = <desc_pos>
		font = text_a1
		text = <text>
		rgba = $net_rounds_current_round_info_name_color
		internal_scale = <text_scale>
		just = <just>
		internal_just = [right top]
		dims = <block_dims>
		rgba = [200 200 200 255]
		allow_expansion
	}
	runscriptonscreenelement id = <cont_id> net_rounds_current_round_description_anim params = {msg_time = (<msg_time> / 1000.0)}
endscript

script net_rounds_create_game_description_ui 
	createscreenelement {
		type = containerelement
		id = net_round_game_desc_cont
		parent = root_window
		pos = (830.0, 120.0)
		scale = 0.75
		alpha = 0
	}
	cont_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <cont_id>
		local_id = bg
		texture = cap_controlsbg
		just = [left top]
		pos = (-40.0, -20.0)
		rgba = [0 0 0 120]
		dims = (440.0, 140.0)
		z_priority = -2
		Random (@ @ flip_v )
		Random (@ @ flip_h )
	}
	NetRoundFunc func = get_round_settings
	if gotparam score_mode
		if (<score_mode> = rounds)
			formattext textname = desc_text "Score the most points at the end of %d round(s)" d = <rounds>
		elseif (<score_mode> = points)
			formattext textname = desc_text "First person to %d points wins" d = <points>
		endif
	endif
	block_dims = (400.0, 0.0)
	just = [left top]
	text_scale = 0.8
	desc_pos = (0.0, 0.0)
	createscreenelement {
		type = textblockelement
		local_id = description
		parent = <cont_id>
		pos = <desc_pos>
		font = text_a1
		text = <desc_text>
		rgba = $net_rounds_current_round_info_name_color
		internal_scale = <text_scale>
		just = <just>
		internal_just = [left top]
		dims = <block_dims>
		rgba = [200 200 200 255]
		allow_expansion
	}
	getscreenelementdims id = <id>
	setscreenelementprops id = {<cont_id> child = bg} dims = ((440.0, 0.0) + ((0.0, 1.5) * <height>))
	runscriptonscreenelement id = <cont_id> net_rounds_current_round_description_anim
endscript

script net_rounds_hide_panel_stuff 
	printf \{"--- net_rounds_hide_panel_stuff"}
	if screenelementexists \{id = net_round_game_desc_cont}
		doscreenelementmorph \{id = net_round_game_desc_cont
			alpha = 0}
	endif
	if screenelementexists \{id = net_rounds_current_round_info_cont}
		doscreenelementmorph \{id = net_rounds_current_round_info_cont
			alpha = 0}
	endif
endscript

script net_rounds_show_panel_stuff 
	printf \{"--- net_rounds_hide_panel_stuff"}
	if screenelementexists \{id = net_round_game_desc_cont}
		doscreenelementmorph \{id = net_round_game_desc_cont
			alpha = 1}
	endif
	if screenelementexists \{id = net_rounds_current_round_info_cont}
		doscreenelementmorph \{id = net_rounds_current_round_info_cont
			alpha = 1}
	endif
endscript

script get_team_color_from_team_num 
	if NOT gotparam \{team_num}
		return \{team_color = [
				0
				0
				0
				255
			]}
	endif
	return team_color = ($graffitiColors [(<team_num> + 1)])
endscript

script get_player_color_from_player_id 
	if NOT gotparam \{player_id}
		return \{player_color = [
				0
				0
				0
				255
			]}
	endif
	return player_color = ($graffitiColors [(<player_id> + 1)])
endscript
