
script ui_create_band_difficulty 
	xenon_singleplayer_session_begin_uninit
	SpawnScriptNow \{xenon_singleplayer_session_complete_uninit
		params = {
			song_failed
		}}
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	if GotParam \{p2}
		cas_set_object_node_pos \{Player = 1
			node = z_soundcheck_trg_waypoint_player1_start}
		cas_set_object_node_pos \{Player = 2
			node = z_soundcheck_trg_waypoint_player4_start}
		get_savegame_from_controller controller = ($player1_status.controller)
		cas_queue_new_character_profile id = ($player1_status.character_id) Player = 1 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 1
		get_savegame_from_controller controller = ($player2_status.controller)
		cas_queue_new_character_profile id = ($player2_status.character_id) Player = 2 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 2
	else
		cas_set_object_node_pos \{Player = 1
			node = z_soundcheck_trg_waypoint_player1_start}
		cas_set_object_node_pos \{Player = 2
			node = z_soundcheck_trg_waypoint_player2_start}
		cas_set_object_node_pos \{Player = 3
			node = z_soundcheck_trg_waypoint_player3_start}
		cas_set_object_node_pos \{Player = 4
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
				cas_queue_new_character_profile id = <character_id> Player = (<controller> + 1) savegame = <savegame>
				printf 'requesting %s for %d' s = <character_id> d = (<controller> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
	endif
	Change \{respond_to_signin_changed_all_players = 1}
	set_focus_color
	set_unfocus_color
	CreateScreenElement {
		parent = root_window
		id = myinterfaceelement
		Type = descinterface
		desc = 'band_play'
		tags = {continue_data = <continue_data>}
	}
	myinterfaceelement :se_getprops
	if myinterfaceelement :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	if GotParam \{p2}
		<band_hmenu> :se_setprops spacing_between = 400
	endif
	menu_array = []
	desc_array = []
	i = 0
	j = 1
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	if GotParam \{p2}
		if (<i> = 2)
			DestroyScreenElement id = <resolved_id>
			i = 1
		endif
	endif
	if ScreenElementExists id = <resolved_id>
		curr_desc = <resolved_id>
		AddArrayElement array = <desc_array> element = <resolved_id>
		desc_array = <array>
		<resolved_id> :desc_resolvealias Name = alias_menu
		continue = 0
		begin
		getplayerinfo <j> controller
		if GotParam \{p2}
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
		if GotParam \{p2}
			j = 2
		else
			j = 1
		endif
		if (<continue> = 1)
			if NOT GotParam \{p2}
				ui_get_controller_parts_allowed controller = <i>
			else
				switch ($g_head_to_head_instrument_type)
					case guitar
					allowed = {guitar bass}
					case drums
					allowed = {drum}
					case vocals
					gamemode_gettype
					if (<Type> != battle)
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
			if GotParam \{p2}
				<resolved_id> :SetTags {
					menu = instrument
					instrument = None
					difficulty = None
					controller = <controller>
					allowed = <allowed>
					index = <i>
				}
			else
				<resolved_id> :SetTags {
					menu = instrument
					instrument = None
					difficulty = None
					controller = <i>
					allowed = <allowed>
					index = <i>
				}
				controller = <i>
			endif
			if (<controller> = $band_mode_current_leader)
				<curr_desc> :se_setprops leader_indicator_alpha = 1
			endif
			<resolved_id> :SetTags {index = <i>}
			<resolved_id> :SetProps event_handlers = [
				{pad_up ui_band_mode_scroll_sound params = {up}}
				{pad_down ui_band_mode_scroll_sound params = {down}}
			]
			AddArrayElement array = <menu_array> element = <resolved_id>
			menu_array = <array>
		else
			<resolved_id> :se_getparentid
			<parent_id> :se_setprops not_focusable alpha = 0.0
			<curr_desc> :se_setprops reposition_pos = (0.0, 500.0)
		endif
	endif
	i = (<i> + 1)
	repeat 4
	myinterfaceelement :SetTags {menus = <menu_array> descs = <desc_array>}
	GetArraySize <menu_array>
	i = 0
	begin
	resolved_id = (<menu_array> [<i>])
	<resolved_id> :GetSingleTag controller
	<resolved_id> :GetSingleTag index
	if GotParam \{p2}
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu params = {player_index = <i>}
	else
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu
	endif
	Name = qs(0x03ac90f0)
	NetSessionFunc func = get_gamertag params = {controller = <controller>}
	if GotParam \{Name}
		band_gamertag_rename gamertag = <Name> index = <index>
	endif
	<resolved_id> :Obj_SpawnScriptNow ui_band_instrument_check_controllers
	i = (<i> + 1)
	repeat <array_Size>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		myinterfaceelement :se_setprops \{ticker_alpha = 0.0}
	endif
	LaunchEvent \{Type = focus
		target = myinterfaceelement}
	ui_band_mode_helper_text
endscript

script ui_band_instrument_check_controllers 
	GetTags
	<my_allowed> = <allowed>
	begin
	if (<menu> = instrument)
		ui_get_controller_parts_allowed controller = <controller> filter_by_character
		if NOT comparestructs struct1 = <allowed> struct2 = <my_allowed>
			SetTags allowed = <allowed>
			<my_allowed> = <allowed>
			ui_band_mode_update_menu
		endif
		Wait \{10
			gameframes}
	else
		return
	endif
	repeat
endscript

script ui_destroy_band_difficulty 
	DestroyScreenElement \{id = myinterfaceelement}
	generic_ui_destroy
endscript

script ui_band_difficulty_continue 
	if is_ui_event_running
		return
	endif
	GetTags
	num_ready = 0
	Player = 1
	temp_parts = [arse , arse , arse , arse]
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	if (<menu> = ready2)
		<num_ready> = (<num_ready> + 1)
		get_player_num_from_controller controller_index = <controller>
		SetArrayElement ArrayName = temp_parts index = (<player_num> -1) NewValue = <instrument>
		setplayerinfo <player_num> difficulty = <difficulty>
	endif
	i = (<i> + 1)
	repeat <array_Size>
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
	<Player> = 1
	begin
	part = (<temp_parts> [(<Player> - 1)])
	if (<part> = arse)
		ScriptAssert \{'Yes, something is very wrong here'}
	endif
	setplayerinfo <Player> part = <part>
	Player = (<Player> + 1)
	repeat <num_ready>
	cas_destroy_all_characters
	if (<faceoff> = FALSE)
		vocals_distribute_mics
	endif
	if NOT vocals_mic_distribution_is_valid
		getplayerinfo <invalid_mic_player> controller
		generic_event_choose state = uistate_select_instrument_warning data = {instrument = vocals controller = <controller>}
		return
	endif
	if GotParam \{continue_data}
		generic_event_choose no_sound data = {<continue_data>}
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script ui_deinit_band_difficulty 
	cancel_all_cas_loads
endscript
