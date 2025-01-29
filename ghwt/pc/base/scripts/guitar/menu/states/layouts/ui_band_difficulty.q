
script ui_create_band_difficulty 
	xenon_singleplayer_session_begin_uninit
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	if gotparam \{p2}
		cas_set_object_node_pos \{player = 1
			node = z_soundcheck_trg_waypoint_player1_start}
		cas_set_object_node_pos \{player = 2
			node = z_soundcheck_trg_waypoint_player4_start}
		get_savegame_from_controller controller = ($player1_status.controller)
		cas_queue_new_character_profile id = ($player1_status.character_id) player = 1 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 1
		get_savegame_from_controller controller = ($player2_status.controller)
		cas_queue_new_character_profile id = ($player2_status.character_id) player = 2 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 2
	else
		cas_set_object_node_pos \{player = 1
			node = z_soundcheck_trg_waypoint_player1_start}
		cas_set_object_node_pos \{player = 2
			node = z_soundcheck_trg_waypoint_player2_start}
		cas_set_object_node_pos \{player = 3
			node = z_soundcheck_trg_waypoint_player3_start}
		cas_set_object_node_pos \{player = 4
			node = z_soundcheck_trg_waypoint_player4_start}
		i = 0
		begin
		controller = ($band_mode_actual_devices [<i>])
		setplayerinfo (<i> + 1) controller = <controller>
		if (<controller> < 4)
			getplayerinfo (<i> + 1) is_local_client
			if (<is_local_client> = 1)
				getplayerinfo (<i> + 1) character_id
				get_savegame_from_controller controller = <controller>
				cas_queue_new_character_profile id = <character_id> player = (<controller> + 1) savegame = <savegame>
				printf 'requesting %s for %d' s = <character_id> d = (<controller> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
	endif
	change \{respond_to_signin_changed_all_players = 1}
	set_focus_color
	set_unfocus_color
	createscreenelement {
		parent = root_window
		id = myinterfaceelement
		type = descinterface
		desc = 'band_play'
		tags = {continue_data = <continue_data>}
	}
	myinterfaceelement :se_getprops
	if myinterfaceelement :desc_resolvealias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	if gotparam \{p2}
		<band_hmenu> :se_setprops spacing_between = 400
	endif
	menu_array = []
	desc_array = []
	i = 0
	j = 1
	begin
	resolvescreenelementid id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	if gotparam \{p2}
		if (<i> = 2)
			destroyscreenelement id = <resolved_id>
			i = 1
		endif
	endif
	if screenelementexists id = <resolved_id>
		curr_desc = <resolved_id>
		addarrayelement array = <desc_array> element = <resolved_id>
		desc_array = <array>
		<resolved_id> :desc_resolvealias name = alias_menu
		continue = 0
		begin
		getplayerinfo <j> controller
		if gotparam \{p2}
			<cont_check> = 0
			begin
			if (<cont_check> = <controller>)
				continue = 1
				break
			endif
			<cont_check> = (<cont_check> + 1)
			repeat 4
			if (<continue> = 1)
				break
			endif
		else
			if (<i> = <controller>)
				continue = 1
				break
			endif
		endif
		j = (<j> + 1)
		repeat ($current_num_players)
		if gotparam \{p2}
			j = 2
		else
			j = 1
		endif
		if (<continue> = 1)
			if NOT gotparam \{p2}
				ui_get_controller_parts_allowed controller = <i>
			else
				switch ($g_head_to_head_instrument_type)
					case guitar
					allowed = {guitar bass}
					case drums
					allowed = {drum}
					case vocals
					gamemode_gettype
					if (<type> != battle)
						if ($allow_controller_for_all_instruments = 0)
							allowed = {vocals}
						else
							allowed = {guitar bass drum vocals}
						endif
					else
						allowed = {}
					endif
				endswitch
			endif
			if gotparam \{p2}
				<resolved_id> :settags {
					menu = instrument
					instrument = none
					difficulty = none
					controller = <controller>
					allowed = <allowed>
					index = <i>
				}
			else
				<resolved_id> :settags {
					menu = instrument
					instrument = none
					difficulty = none
					controller = <i>
					allowed = <allowed>
					index = <i>
				}
				controller = <i>
			endif
			if (<controller> = $band_mode_current_leader)
				<curr_desc> :se_setprops leader_indicator_alpha = 1
			endif
			<resolved_id> :settags {index = <i>}
			<resolved_id> :setprops event_handlers = [
				{pad_up ui_band_mode_scroll_sound params = {up}}
				{pad_down ui_band_mode_scroll_sound params = {down}}
			]
			addarrayelement array = <menu_array> element = <resolved_id>
			menu_array = <array>
		else
			<resolved_id> :se_getparentid
			<parent_id> :se_setprops not_focusable alpha = 0.0
			<curr_desc> :se_setprops reposition_pos = (0.0, 500.0)
		endif
	endif
	i = (<i> + 1)
	repeat 4
	myinterfaceelement :settags {menus = <menu_array> descs = <desc_array>}
	getarraysize <menu_array>
	i = 0
	begin
	resolved_id = (<menu_array> [<i>])
	<resolved_id> :getsingletag controller
	<resolved_id> :getsingletag index
	if gotparam \{p2}
		runscriptonscreenelement id = <resolved_id> ui_band_mode_create_menu params = {player_index = <i>}
	else
		runscriptonscreenelement id = <resolved_id> ui_band_mode_create_menu
	endif
	name = qs(0x03ac90f0)
	netsessionfunc func = get_gamertag params = {controller = <controller>}
	if gotparam \{name}
		band_gamertag_rename gamertag = <name> index = <index>
	endif
	<resolved_id> :obj_spawnscriptnow ui_band_instrument_check_controllers
	i = (<i> + 1)
	repeat <array_size>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		myinterfaceelement :se_setprops \{ticker_alpha = 0.0}
	endif
	launchevent \{type = focus
		target = myinterfaceelement}
	ui_band_mode_helper_text
endscript

script ui_band_instrument_check_controllers 
	gettags
	<my_allowed> = <allowed>
	begin
	if (<menu> = instrument)
		ui_get_controller_parts_allowed controller = <controller> filter_by_character
		if NOT comparestructs struct1 = <allowed> struct2 = <my_allowed>
			settags allowed = <allowed>
			<my_allowed> = <allowed>
			ui_band_mode_update_menu
		endif
		wait \{10
			gameframes}
	else
		return
	endif
	repeat
endscript

script ui_destroy_band_difficulty 
	destroyscreenelement \{id = myinterfaceelement}
	generic_ui_destroy
endscript

script ui_band_difficulty_continue 
	if is_ui_event_running
		return
	endif
	gettags
	num_ready = 0
	player = 1
	temp_parts = [arse , arse , arse , arse]
	getarraysize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :gettags
	if (<menu> = ready2)
		<num_ready> = (<num_ready> + 1)
		get_player_num_from_controller controller_index = <controller>
		setarrayelement arrayname = temp_parts index = (<player_num> -1) newvalue = <instrument>
		setplayerinfo <player_num> difficulty = <difficulty>
	endif
	i = (<i> + 1)
	repeat <array_size>
	gamemode_getproperty \{prop = faceoff}
	if (<faceoff> = true)
		if (<instrument> = vocals)
			if NOT vocals_mic_distribution_is_valid
				getplayerinfo <invalid_mic_player> controller
				printf 'ui_band_difficulty_continue: Player %p (controller %c) is missing their mic.' p = <invalid_mic_player> c = <controller>
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <controller>}
				return
			endif
		endif
	endif
	if NOT (<num_ready> = $current_num_players)
		return
	else
		register_new_progression_atoms \{career_band}
	endif
	printstruct <...>
	<player> = 1
	begin
	part = (<temp_parts> [(<player> - 1)])
	if (<part> = arse)
		scriptassert \{'Yes, something is very wrong here'}
	endif
	setplayerinfo <player> part = <part>
	player = (<player> + 1)
	repeat <num_ready>
	cas_destroy_all_characters
	if (<faceoff> = false)
		vocals_distribute_mics
	endif
	if NOT vocals_mic_distribution_is_valid
		getplayerinfo <invalid_mic_player> controller
		generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <controller>}
		return
	endif
	if gotparam \{continue_data}
		generic_event_choose no_sound data = {<continue_data>}
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script ui_deinit_band_difficulty 
	cancel_all_cas_loads
endscript
