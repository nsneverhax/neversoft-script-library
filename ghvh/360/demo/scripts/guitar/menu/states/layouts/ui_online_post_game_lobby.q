allow_postgame_lobby_tooltips = 1
network_game_postgame_lobby = 0

script ui_init_online_post_game_lobby 
	change \{playing_song = 0}
	spawnscriptnow \{idle_for_post_game_lobby}
	next_id = ($online_song_choice_id + 1)
	getnumplayers
	if (<next_id> > (<num_players> - 1))
		<next_id> = 0
	endif
	change online_song_choice_id = <next_id>
	disable_pause
endscript

script ui_deinit_online_post_game_lobby 
	spawnscriptlater \{kill_idle_for_post_game_lobby}
endscript

script kill_idle_for_post_game_lobby 
	hide_crowd_models
	destroy_crowd_models
	destroy_bg_viewport
	destroy_cameracuts
	transition_killall
	change \{current_transition = none}
endscript

script idle_for_post_game_lobby 
	resetyieldinfo \{yield = true}
	printf \{qs(0x2fc96321)}
	killspawnedscript \{name = yieldmonitor}
	spawnscriptnow \{yieldmonitor}
	yield
	band_playtransitionidles
	bandmanager_stopallanimiterators
	kill_gem_scroller \{type = normal}
	yield \{'kill_gem_scroller'}
	create_crowd_models
	setup_bg_viewport
	yield \{'setup_bg_viewport'}
	create_cameracuts
	change \{current_transition = fastintro}
	transition_play \{type = loading}
	yield
	unpausegame
	yield
	startrendering
endscript

script ui_create_online_post_game_lobby 
	if screenelementexists \{id = you_rock}
		destroyscreenelement \{id = you_rock}
	endif
	netsessionfunc \{obj = voice
		func = turnteamtalkoff}
	getactivecontrollers
	getarraysize <active_controllers>
	ingame_controllers = []
	i = 0
	begin
	if netsessionfunc func = iscontrolleringame params = {controller = <i>}
		addarrayelement array = <ingame_controllers> element = <i>
		<ingame_controllers> = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if screenelementexists \{id = you_rock}
		destroyscreenelement \{id = you_rock}
	endif
	createscreenelement {
		parent = root_window
		id = onlinelobbyinterface
		type = descinterface
		desc = 'online_postgame_lobby_final'
		exclusive_device = <ingame_controllers>
		tags = {
			menu_index = 0
			menu_items = 0
			loser_index = 0
			loser_items = 0
			loser_menu_id = null
			winner_index = 0
			winner_items = 0
			winner_menu_id = null
			postgame_menu_id = null
			locked_to_players = 0
			setlist_enabled = 0
			toggle_allowed = 1
		}
	}
	assignalias id = <id> alias = current_menu_anchor
	current_menu_anchor :obj_spawnscript \{highlight_motion}
	spawn_player_drop_listeners \{drop_player_script = lobby_drop_player_scr
		end_game_script = lobby_end_game_scr}
	spawnscriptnow \{menu_music_on}
	set_focus_color
	set_unfocus_color
	onlinelobbyinterface :desc_checkversion \{desired = 9
		assertif = mismatch}
	change \{network_game_postgame_lobby = 1}
	change \{allow_postgame_lobby_tooltips = 1}
	create_postgame_lobby_left_side
	create_player_scores_postgame_container
	if onlinelobbyinterface :desc_resolvealias \{name = alias_local_rockers}
		<resolved_id> :obj_spawnscriptnow setup_local_rockers
	endif
	menu_finish
	netoptions :pref_get \{name = game_modes}
	if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		getactivecontrollers
		getarraysize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if netsessionfunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script online_post_game_lobby_animate_in 
	wait \{0.5
		second}
	soundevent \{event = online_main_panel_in}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{pos = (0.0, 30.0)
			time = 0.2
			anim = gentle}
	else
		return
	endif
	wait \{0.22
		second}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{pos = (0.0, 0.0)
			time = 0.1
			anim = gentle}
	else
		return
	endif
	launchevent \{type = focus
		target = current_menu}
endscript

script ui_destroy_online_post_game_lobby 
	destroy_player_drop_events
	if screenelementexists \{id = onlinelobbyinterface}
		destroyscreenelement \{id = onlinelobbyinterface}
	endif
	change \{network_game_postgame_lobby = 0}
	generic_ui_destroy
endscript

script ui_return_online_post_game_lobby 
	set_focus_color
	set_unfocus_color
	clean_up_user_control_helpers
	menu_finish
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		if (<locked_to_players> = 0)
			netoptions :pref_get \{name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				getactivecontrollers
				getarraysize <active_controllers>
				i = 0
				begin
				if (<active_controllers> [<i>] = 1)
					if netsessionfunc func = iscontrolleringame params = {controller = <i>}
						get_controller_type controller_index = <i>
						if (<controller_type> = guitar)
							add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
							break
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
endscript

script postgame_lobby_transition_in 
	if screenelementexists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{name = alias_left_side
				param = left_side}
			<left_side> :se_setprops pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
		endif
	else
		return
	endif
	onlinelobbyinterface :gettags
	if (<locked_to_players> = 0)
		ui_return_online_post_game_lobby
		wait \{0.15
			second}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script postgame_lobby_transition_out 
	if screenelementexists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{name = alias_left_side
				param = left_side}
			<left_side> :se_setprops pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
		endif
	else
		return
	endif
	wait \{0.15
		second}
endscript

script create_postgame_lobby_left_side 
	if onlinelobbyinterface :desc_resolvealias \{name = alias_left_side_vmenu
			param = left_side_menu}
		assignalias id = <left_side_menu> alias = current_menu
		netoptions :pref_get \{name = game_modes}
		if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
			current_menu :se_setprops \{event_handlers = [
					{
						pad_back
						postgame_lobby_quit
					}
					{
						pad_up
						postgame_lobby_up_down_action
						params = {
							action = up
						}
					}
					{
						pad_down
						postgame_lobby_up_down_action
						params = {
							action = down
						}
					}
					{
						pad_l1
						post_game_toggle_guitar_part
					}
				]}
		else
			current_menu :se_setprops \{event_handlers = [
					{
						pad_back
						postgame_lobby_quit
					}
					{
						pad_up
						postgame_lobby_up_down_action
						params = {
							action = up
						}
					}
					{
						pad_down
						postgame_lobby_up_down_action
						params = {
							action = down
						}
					}
				]}
		endif
		getnumplayers
		current_num_players = <num_players>
		gamemode_getnumplayers
		if (<current_num_players> = <num_players>)
			onlinelobbyinterface :settags \{menu_items = 3}
			onlinelobbyinterface :settags \{setlist_enabled = 1}
		else
			onlinelobbyinterface :settags \{menu_items = 2}
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_setlist_text
				param = setlist_text}
			if (<current_num_players> = <num_players>)
				<setlist_text> :settags msg_checksum = postgame_play_again
				<setlist_text> :se_setprops event_handlers = [
					{focus postgame_item_change_focus params = {focus}}
					{unfocus postgame_item_change_focus params = {unfocus}}
					{pad_choose postgame_lobby_to_setlist}
					{pad_choose ui_menu_select_sfx}
				]
			else
				destroyscreenelement id = <setlist_text>
			endif
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_pref_text
				param = pref_text}
			<pref_text> :settags msg_checksum = preferences
			<pref_text> :se_setprops event_handlers = [
				{focus postgame_item_change_focus params = {focus}}
				{unfocus postgame_item_change_focus params = {unfocus}}
				{pad_choose postgame_net_preferences}
				{pad_choose ui_menu_select_sfx}
			]
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_quit_text
				param = quit_text}
			<quit_text> :settags msg_checksum = postgame_quit
			<quit_text> :se_setprops event_handlers = [
				{focus postgame_item_change_focus params = {focus}}
				{unfocus postgame_item_change_focus params = {unfocus}}
				{pad_choose postgame_lobby_quit}
				{pad_choose ui_menu_select_sfx}
			]
		endif
		onlinelobbyinterface :settags postgame_menu_id = <left_side_menu>
	endif
endscript

script local_player_is_choosing_song 
	player_idx = 1
	gamemode_getnumplayers
	begin
	getplayerinfo <player_idx> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <player_idx> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			printf qs(0xb21f476b) d = ($online_song_choice_id)
			return \{true}
		endif
	endif
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
	return \{false}
endscript

script create_player_scores_postgame_container 
	if NOT gamemode_iscooperative
		determine_game_scores_and_winner
		gamemode_getnumplayers
		if (<opponent_team_score> > <team_score>)
			setup_slot_menu menu = alias_winner_vmenu color = ($player_slot_team1) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			onlinelobbyinterface :settags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu color = ($player_slot_team2) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			onlinelobbyinterface :settags loser_menu_id = <menu_id>
			onlinelobbyinterface :settags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			formattext textname = winner_score qs(0x48c6d14c) d = <opponent_team_score>
			formattext textname = loser_score qs(0x48c6d14c) d = <team_score>
			onlinelobbyinterface :se_setprops {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		else
			setup_slot_menu menu = alias_winner_vmenu color = ($player_slot_team1) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			onlinelobbyinterface :settags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu color = ($player_slot_team2) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			onlinelobbyinterface :settags loser_menu_id = <menu_id>
			onlinelobbyinterface :settags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			formattext textname = winner_score qs(0x48c6d14c) d = <team_score>
			formattext textname = loser_score qs(0x48c6d14c) d = <opponent_team_score>
			onlinelobbyinterface :se_setprops {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		endif
		if (<tie> = true)
			stamp_texture = stamp_tie
			if french
				<stamp_texture> = stamp_tie_french
			elseif spanish
				<stamp_texture> = stamp_tie_spanish
			elseif german
				<stamp_texture> = stamp_tie_german
			elseif italian
				<stamp_texture> = stamp_tie_italian
			endif
			onlinelobbyinterface :se_setprops {
				stamp_rot_angle = 0
				loser_stamp_alpha = 1
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
			if onlinelobbyinterface :desc_resolvealias \{name = alias_hand_devil_horn
					param = winner_hand}
				<winner_hand> :die
			endif
			if onlinelobbyinterface :desc_resolvealias \{name = alias_hand_thumb_down
					param = loser_hand}
				<loser_hand> :die
			endif
		else
			stamp_texture = stamp
			if french
				<stamp_texture> = stamp_winner_french
			elseif spanish
				<stamp_texture> = stamp_winner_spanish
			elseif german
				<stamp_texture> = stamp_winner_german
			elseif italian
				<stamp_texture> = stamp_winner_italian
			endif
			onlinelobbyinterface :se_setprops {
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
		endif
	else
		gamemode_getnumplayers
		<team_score> = ($band1_status.score)
		casttointeger \{team_score}
		setup_slot_menu menu = alias_winner_vmenu color = ($player_slot_team1) score = <team_score> start_index = 1 num_players = <num_players>
		onlinelobbyinterface :settags winner_menu_id = <menu_id>
		formattext textname = winner_score qs(0x48c6d14c) d = <team_score>
		onlinelobbyinterface :se_setprops {
			winner_score = <winner_score>
		}
		onlinelobbyinterface :settags {
			winner_items = <num_players>
			loser_items = 0
		}
		resolvescreenelementid \{param = loser_container
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = loser
				}
			]}
		if screenelementexists id = <loser_container>
			destroyscreenelement id = <loser_container>
		endif
		resolvescreenelementid \{param = menu_chain_id
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = menu_chain
				}
			]}
		if screenelementexists id = <menu_chain_id>
			destroyscreenelement id = <menu_chain_id>
		endif
		resolvescreenelementid \{param = stamp_id
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = stamp
				}
			]}
		if screenelementexists id = <stamp_id>
			destroyscreenelement id = <stamp_id>
		endif
	endif
	gamemode_gettype
	if (<type> = battle)
		if onlinelobbyinterface :desc_resolvealias \{name = alias_winner_score_container
				param = winner_score}
			<winner_score> :die
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_loser_score_container
				param = loser_score}
			<loser_score> :die
		endif
	endif
	gamemode_getnumplayers
	if (<num_players> > 2)
		onlinelobbyinterface :se_setprops \{loser_stamp_alpha = 0
			winner_stamp_alpha = 0}
	endif
endscript

script destroy_player_scores_postgame_container 
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		if screenelementexists id = <loser_menu_id>
			destroyscreenelement id = <loser_menu_id> preserve_parent
		endif
		if screenelementexists id = <winner_menu_id>
			destroyscreenelement id = <winner_menu_id> preserve_parent
		endif
	endif
endscript

script determine_game_scores_and_winner 
	team_score = 0
	opponent_team_score = 0
	tie = false
	gamemode_getnumplayers
	if (<num_players> > 2)
		<opponent_team_score> = ($band2_status.score)
		<team_score> = ($band1_status.score)
	else
		if ($game_mode = p2_battle)
			<team_score> = ($player1_status.save_health)
			<opponent_team_score> = ($player2_status.save_health)
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			<team_score> = ($player1_status.score)
			<opponent_team_score> = ($player2_status.score)
		endif
	endif
	if (<team_score> = <opponent_team_score>)
		<tie> = true
	endif
	casttointeger \{team_score}
	casttointeger \{opponent_team_score}
	return team_score = <team_score> opponent_team_score = <opponent_team_score> tie = <tie>
endscript

script refresh_player_scores_postgame_container 
	printf \{qs(0x7de0e7be)}
	onlinelobbyinterface :gettags
	if screenelementexists id = <loser_menu_id>
		if isscreenelementinfocus id = <loser_menu_id>
			launchevent type = unfocus target = <loser_menu_id>
			focus_id = <loser_menu_id>
			focus_index = <loser_index>
		endif
	endif
	if screenelementexists id = <winner_menu_id>
		if isscreenelementinfocus id = <winner_menu_id>
			launchevent type = unfocus target = <winner_menu_id>
			focus_id = <winner_menu_id>
			focus_index = <winner_index>
		endif
	endif
	destroy_player_scores_postgame_container
	create_player_scores_postgame_container
	if gotparam \{locked}
		onlinelobbyinterface :gettags
		new_event_handlers = [
			{pad_up postgame_lobby_up_down_action params = {action = up}}
			{pad_down postgame_lobby_up_down_action params = {action = down}}
		]
		if screenelementexists id = <loser_menu_id>
			setscreenelementprops {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			setscreenelementprops {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if screenelementexists id = <winner_menu_id>
			setscreenelementprops {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			setscreenelementprops {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		onlinelobbyinterface :settags \{locked_to_players = 1}
		if screenelementexists \{id = netprefinterface}
			ui_destroy_net_preferences
		endif
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			generic_event_back
		endif
		if screenelementexists \{id = current_menu}
			if isscreenelementinfocus \{id = current_menu}
				launchevent \{type = unfocus
					target = current_menu}
			endif
		endif
		if screenelementexists id = <winner_menu_id>
			if NOT isscreenelementinfocus id = <winner_menu_id>
				if NOT isscreenelementinfocus id = <loser_menu_id>
					onlinelobbyinterface :settags \{winner_index = 0}
					launchevent type = focus target = <winner_menu_id> data = {child_index = 0}
				endif
			endif
		endif
		clean_up_user_control_helpers
		if (<setlist_enabled> = 1)
			menu_finish
		endif
	elseif gotparam \{unlock}
		onlinelobbyinterface :gettags
		if screenelementexists id = <loser_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <loser_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			setscreenelementprops {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			setscreenelementprops {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if screenelementexists id = <winner_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <winner_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			setscreenelementprops {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			setscreenelementprops {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
	endif
	if gotparam \{focus_id}
		launchevent type = focus target = <focus_id> data = {child_index = <focus_index>}
	endif
	printf \{qs(0xbb30d99b)}
endscript

script postgame_lobby_to_setlist 
	if ishost
		sendstructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
		onlinelobbyinterface :obj_spawnscriptlater \{song_being_selected}
	else
		sendstructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
	endif
endscript

script postgame_goto_setlist 
	if ishost
		begin
		if screenelementexists \{id = onlinelobbyinterface}
			break
		endif
		wait \{1
			gameframe}
		repeat
		onlinelobbyinterface :obj_spawnscriptlater \{song_being_selected}
		sendstructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
	else
		begin
		if screenelementexists \{id = onlinelobbyinterface}
			break
		endif
		wait \{1
			gameframe}
		repeat
		onlinelobbyinterface :obj_spawnscriptnow \{song_being_selected}
	endif
endscript

script song_being_selected 
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		onlinelobbyinterface :settags \{setlist_enabled = 0}
		change \{allow_postgame_lobby_tooltips = 0}
		resolvescreenelementid id = {<postgame_menu_id> child = 0}
		if (<menu_index> = 0)
			if isscreenelementinfocus \{id = current_menu}
				launchevent \{type = unfocus
					target = current_menu}
				launchevent \{type = focus
					target = current_menu
					data = {
						child_index = 1
					}}
			endif
			onlinelobbyinterface :settags \{menu_index = 0}
			onlinelobbyinterface :settags menu_items = (<menu_items> - 1)
		endif
		<resolved_id> :se_setprops {not_focusable}
		resolvescreenelementid id = {<resolved_id> child = text}
		<resolved_id> :se_setprops {alpha = 0.5}
		onlinelobbyinterface :settags \{toggle_allowed = 0}
		refresh_player_scores_postgame_container \{locked}
		wait \{1
			second}
		host_start_player_settings_sync
		index = ($online_to_setlist_count)
		begin
		formattext textname = timer_msg qs(0xbd40792a) d = <index>
		printf qs(0x73307931) s = <timer_msg>
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops net_info_text = <timer_msg>
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		wait \{1
			second}
		repeat
		generic_event_back \{state = uistate_setlist
			data = {
				no_jamsession
			}}
	else
		printf \{qs(0xb8033e72)}
	endif
endscript

script postgame_lobby_quit 
	if gotparam \{device_num}
		if (<device_num> = $primary_controller)
			if gotparam \{id}
				launchevent type = unfocus target = <id>
			endif
			ui_event_get_top
			if gotparam \{is_popup}
				generic_event_replace \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			else
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		endif
	endif
endscript

script postgame_net_preferences 
	if NOT screenelementexists \{id = netprefinterface}
		launchevent \{type = unfocus
			target = current_menu}
		postgame_lobby_transition_out
		ui_create_net_preferences device_num = <device_num> exit_script = postgame_lobby_transition_in post_game_lobby
	endif
endscript

script postgame_lobby_add_player_slot \{cash_text = qs(0x6160dbf3)
		cash_icon_id = cash_milestone_icon_001}
	requireparams \{[
			name
			controller_texture
			xuid
			player_slot_rgba
			parent
			local
			player_num
		]
		all}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		if ($allow_postgame_lobby_tooltips = 1)
			event_handlers = [
				{focus player_slot_change_focus params = {focus post_game}}
				{unfocus player_slot_change_focus params = {unfocus post_game}}
			]
		else
			event_handlers = []
		endif
		formattext checksumname = player_slot_id 'player_slot_p%p' p = <player_num> addtostringlookup
		createscreenelement {
			type = descinterface
			desc = 'online_lobby_player_slot'
			id = <player_slot_id>
			parent = <parent>
			auto_dims = false
			dims = (450.0, 51.0)
			event_handlers = <event_handlers>
			tags = {local_player = 0}
		}
		if isxenon
			if gotparam \{xuid}
				if ($allow_postgame_lobby_tooltips = 1)
					<id> :se_setprops event_handlers = [{pad_choose ui_menu_select_sfx}
						{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
					]
				endif
			endif
		endif
		if isxenon
			formattext checksumname = player_status 'player%d_status' d = (<player_num>)
			<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
		endif
		<id> :se_setprops {
			player_slot_name_text = <name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_rgba = <player_slot_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :desc_resolvealias name = alias_sign_in_button param = signin_id
			<signin_id> :die
		endif
		<id> :settags msg_checksum = gamer_card
		<id> :settags local_player = <local>
	endif
endscript

script setup_slot_menu menu = alias_winner_vmenu color = ($player_slot_team1)
	requireparams \{[
			score
			start_index
			num_players
		]
		all}
	if screenelementexists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias name = <menu> param = slot_menu
			netoptions :pref_get \{name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				<slot_menu> :se_setprops {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
						{pad_l1 post_game_toggle_guitar_part}
					]
				}
			else
				<slot_menu> :se_setprops {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
					]
				}
			endif
			begin
			getplayerinfo <start_index> net_id_first
			getplayerinfo <start_index> net_id_second
			getplayerinfo <start_index> part
			getplayerinfo <start_index> is_local_client
			switch (<part>)
				case guitar
				icon_texture = logo_guitar_grayscale
				case bass
				icon_texture = logo_bass_grayscale
				case drum
				icon_texture = logo_drum_grayscale
				case vocals
				icon_texture = logo_vocal_grayscale
			endswitch
			formattext checksumname = gamertag 'gamertag_%d' d = (<start_index> - 1)
			name = $<gamertag>
			xuid = [0 0]
			setarrayelement arrayname = xuid index = 0 newvalue = (<net_id_first>)
			setarrayelement arrayname = xuid index = 1 newvalue = (<net_id_second>)
			getplayerinfo <start_index> career_earnings
			cash_get_info_from_earnings earnings = <career_earnings>
			formattext textname = cash_text qs(0x48c6d14c) d = <rank>
			getplayerinfo \{1
				team}
			yellow_team = <team>
			getplayerinfo <start_index> team
			color = $player_slot_team1
			if (<team> != <yellow_team>)
				<color> = $player_slot_team2
			endif
			postgame_lobby_add_player_slot {
				name = <name>
				controller_texture = <icon_texture>
				xuid = <xuid>
				player_slot_rgba = <color>
				parent = <slot_menu>
				cash_text = <cash_text>
				cash_icon_id = <cash_icon_id>
				player_num = <start_index>
				local = <is_local_client>
			}
			<start_index> = (<start_index> + 1)
			repeat <num_players>
			return menu_id = <slot_menu>
		endif
	endif
endscript

script postgame_item_change_focus 
	obj_getid
	<objid> :gettags
	if gotparam \{focus}
		if gotparam \{msg_checksum}
			if ($allow_postgame_lobby_tooltips = 1)
				set_net_dialog_message msg_checksum = <msg_checksum>
			endif
		endif
		se_setprops rgba = ($menu_focus_color)
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 1.0
			obj_getid
			<objid> :menu_focus_set_highlight spinner_offset = -15
		endif
	elseif gotparam \{unfocus}
		turn_off_highlight
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 0.0
		endif
		se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script set_postgame_dialog_message 
	if NOT gotparam \{msg_checksum}
		return
	endif
	if isxenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	appendsuffixtochecksum base = <msg_checksum> suffixstring = '_text'
	if structurecontains structure = ($<plat_helper_strings>) <appended_id>
		if screenelementexists \{id = onlinelobbyinterface}
			if onlinelobbyinterface :desc_resolvealias \{name = alias_left_side
					param = left_side}
				<left_side> :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
			endif
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = onlinelobbyinterface}
			if onlinelobbyinterface :desc_resolvealias \{name = alias_left_side
					param = left_side}
				<left_side> :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
			endif
		endif
	endif
endscript

script postgame_lobby_up_down_action 
	onlinelobbyinterface :gettags
	if NOT gotparam \{action}
		return
	endif
	if NOT screenelementexists \{id = current_menu}
		return
	endif
	if NOT screenelementexists id = <winner_menu_id>
		return
	endif
	generic_menu_up_or_down_sound
	printf \{qs(0xdbdbcf54)}
	if isscreenelementinfocus \{id = current_menu}
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<menu_index> = 0)
				if (<loser_items> > 0)
					launchevent \{type = unfocus
						target = current_menu}
					launchevent type = focus target = <loser_menu_id> data = {child_index = (<loser_items> - 1)}
					onlinelobbyinterface :settags loser_index = (<loser_items> - 1)
				else
					launchevent \{type = unfocus
						target = current_menu}
					launchevent type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
					onlinelobbyinterface :settags winner_index = (<winner_items> - 1)
				endif
			else
				onlinelobbyinterface :settags menu_index = (<menu_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<menu_index> = (<menu_items> - 1))
				if (<winner_items> > 0)
					launchevent \{type = unfocus
						target = current_menu}
					launchevent type = focus target = <winner_menu_id> data = {child_index = 0}
					onlinelobbyinterface :settags \{winner_index = 0}
				else
					onlinelobbyinterface :settags \{menu_index = 0}
				endif
			else
				onlinelobbyinterface :settags menu_index = (<menu_index> + 1)
			endif
		endif
	elseif isscreenelementinfocus id = <winner_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<winner_index> = 0)
				if (<locked_to_players> = 0)
					launchevent type = unfocus target = <winner_menu_id>
					launchevent type = focus target = current_menu data = {child_index = (<menu_items> - 1)}
					onlinelobbyinterface :settags menu_index = (<menu_items> - 1)
				elseif (<loser_items> > 0)
					launchevent type = unfocus target = <winner_menu_id>
					launchevent type = focus target = <loser_menu_id> data = {child_index = 0}
					onlinelobbyinterface :settags \{loser_index = 0}
				else
					onlinelobbyinterface :settags winner_index = (<winner_items> - 1)
				endif
			else
				onlinelobbyinterface :settags winner_index = (<winner_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<winner_index> = (<winner_items> - 1))
				if (<loser_items> > 0)
					launchevent type = unfocus target = <winner_menu_id>
					launchevent type = focus target = <loser_menu_id> data = {child_index = 0}
					onlinelobbyinterface :settags \{loser_index = 0}
				elseif (<locked_to_players> = 0)
					launchevent type = unfocus target = <winner_menu_id>
					launchevent \{type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					onlinelobbyinterface :settags \{menu_index = 0}
				else
					onlinelobbyinterface :settags \{winner_index = 0}
				endif
			else
				onlinelobbyinterface :settags winner_index = (<winner_index> + 1)
			endif
		endif
	elseif isscreenelementinfocus id = <loser_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<loser_index> = 0)
				launchevent type = unfocus target = <loser_menu_id>
				launchevent type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
				onlinelobbyinterface :settags winner_index = (<winner_items> - 1)
			else
				onlinelobbyinterface :settags loser_index = (<loser_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<loser_index> = (<loser_items> - 1))
				if (<locked_to_players> = 0)
					launchevent type = unfocus target = <loser_menu_id>
					launchevent \{type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					onlinelobbyinterface :settags \{menu_index = 0}
				else
					launchevent type = unfocus target = <loser_menu_id>
					launchevent type = focus target = <winner_menu_id> data = {child_index = 0}
					onlinelobbyinterface :settags \{winner_index = 0}
				endif
			else
				onlinelobbyinterface :settags loser_index = (<loser_index> + 1)
			endif
		endif
	endif
endscript

script post_game_toggle_guitar_part 
	printf \{qs(0x7f246a05)}
	onlinelobbyinterface :getsingletag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	requireparams \{[
			device_num
		]
		all}
	info_index = 1
	index = 1
	begin
	getplayerinfo <index> controller
	if (<device_num> = <controller>)
		<info_index> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 8
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar || <controller_type> = controller)
		soundevent \{event = online_instrument_change}
		getplayerinfo <info_index> part
		if (<part> = guitar)
			setplayerinfo <info_index> part = bass
			getplayerinfo <info_index> net_id_first
			getplayerinfo <info_index> net_id_second
			formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
			sendstructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = bass}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = bass
		elseif (<part> = bass)
			setplayerinfo <info_index> part = guitar
			getplayerinfo <info_index> net_id_first
			getplayerinfo <info_index> net_id_second
			formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
			sendstructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar
		endif
	endif
endscript

script update_postgame_part 
	if ishost
		sendstructure callback = update_postgame_part data_to_send = <...>
	endif
	printf \{qs(0x42b1f802)}
	found = 0
	info_index = 1
	begin
	getplayerinfo <info_index> net_id_first
	getplayerinfo <info_index> net_id_second
	formattext checksumname = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isxenon
			<found> = 1
			break
		elseif localizedstringequals a = <name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		setplayerinfo <info_index> part = <part>
		if screenelementexists \{id = onlinelobbyinterface}
			refresh_player_scores_postgame_container
		endif
	endif
endscript

script lobby_drop_player_scr 
	printf \{qs(0xd2c6f893)}
	killspawnedscript \{name = postgame_goto_setlist}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		onlinelobbyinterface :obj_killspawnedscript \{name = song_being_selected}
		if (<setlist_enabled> = 1)
			onlinelobbyinterface :settags \{setlist_enabled = 0}
			onlinelobbyinterface :gettags
			resolvescreenelementid id = {<postgame_menu_id> child = 0}
			if (<menu_index> = 0)
				launchevent \{type = unfocus
					target = current_menu}
				if NOT screenelementexists \{id = netprefinterface}
					launchevent \{type = focus
						target = current_menu
						data = {
							child_index = 1
						}}
				endif
				onlinelobbyinterface :settags \{menu_index = 0}
			else
				onlinelobbyinterface :settags menu_index = (<menu_index> - 1)
			endif
			onlinelobbyinterface :settags menu_items = (<menu_items> - 1)
			<resolved_id> :se_setprops {not_focusable}
			resolvescreenelementid id = {<resolved_id> child = text}
			<resolved_id> :se_setprops {alpha = 0.5}
		endif
		if (<dropped_player_num> = 0)
			ui_event_get_top
			if (<base_name> = 'online_quit_warning')
				generic_event_back
				ui_event_wait_for_safe
			endif
			if screenelementexists \{id = netprefinterface}
				netprefinterface :gettags
				if screenelementexists id = <submenu_id>
					launchevent type = unfocus target = <submenu_id>
				else
					launchevent \{type = unfocus
						target = net_preferences_popup}
				endif
			else
				launchevent \{type = unfocus
					target = current_menu}
			endif
			formattext \{textname = popup_text}
			create_net_popup \{title = qs(0x5ca2c535)
				popup_text = qs(0x433296b8)}
			wait \{3
				seconds}
			destroy_net_popup
			set_focus_color
			set_unfocus_color
			if screenelementexists \{id = netprefinterface}
				netprefinterface :gettags
				if screenelementexists id = <submenu_id>
					launchevent type = focus target = <submenu_id>
				else
					launchevent \{type = focus
						target = net_preferences_popup}
				endif
			else
				launchevent \{type = focus
					target = current_menu}
			endif
			if (<locked_to_players> = 1)
				onlinelobbyinterface :settags \{locked_to_players = 0}
				refresh_player_scores_postgame_container \{unlock}
			endif
			player = 1
			gamemode_getnumplayers
			begin
			formattext checksumname = player_slot_id 'player_slot_p%p' p = <player>
			<player_slot_id> :gettags
			if (<local_player> = 0)
				<player_slot_id> :se_setprops {alpha = 0.35000002}
			endif
			<player> = (<player> + 1)
			repeat <num_players>
		else
			formattext checksumname = player_slot_id 'player_slot_p%p' p = <dropped_player_num>
			<player_slot_id> :se_setprops {alpha = 0.35000002}
			if (<locked_to_players> = 1)
				onlinelobbyinterface :settags \{locked_to_players = 0}
				refresh_player_scores_postgame_container \{unlock}
			endif
		endif
	endif
endscript

script lobby_end_game_scr 
	printf \{qs(0xa6595096)}
endscript
