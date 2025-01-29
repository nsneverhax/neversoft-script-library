
script 0x6776bbc8 
	0xfd22d1e7 \{num = 1}
endscript

script 0x93700c16 
	0x88e84c31
endscript

script ui_create_game_mode \{mode = career}
	if 0x8658e568
		destroy_loading_screen
	endif
	cas_destroy_all_characters
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{in_join_band_screens = 0}
	Change \{first_character_hub_enter = 1}
	Change \{respond_to_signin_changed = 0}
	Change \{respond_to_signin_changed_func = main_menu_signin_changed}
	Change \{current_progression_flag = None}
	Change \{practice_enabled = 0}
	clear_exclusive_devices
	reset_band_mode
	Change \{band_mode_menu_tags = None}
	Change \{band_mode_mode = None}
	i = 1
	begin
	getplayerinfo <i> controller
	getplayerinfo <i> part
	if (<part> = Band)
		setplayerinfo <i> part = guitar
		getplayerinfo <i> part
	endif
	getsavegamefromcontroller controller = <controller>
	cas_get_random_preset_character savegame = <savegame> part = <part>
	setplayerinfo <i> character_id = <character_id>
	i = (<i> + 1)
	repeat 4
	if (<mode> = career)
		choose_script = game_mode_select_career
		text = qs(0xde7ec8b3)
	elseif (<mode> = 0x955f856c)
		choose_script = 0xde1174ba
		text = qs(0x8a778398)
	elseif (<mode> = freeplay)
		choose_script = 0xcbadbeff
		text = qs(0x2406ab68)
	else
		choose_script = game_mode_select_quickplay
		text = qs(0xfabdce2b)
	endif
	0x5e1a3a04 {
		pad_back_script = ui_game_mode_back
		title = <text>
		use_all_controllers
	}
	0x9d0992fe text = qs(0xdfe62bc8) pad_choose_script = <choose_script>
	if ((<mode> = quickplay) || (<mode> = 0x955f856c) || (<mode> = freeplay))
		if are_multiple_controllers_connected
			0x9d0992fe text = qs(0xdabf99c0) pad_choose_script = <choose_script> pad_choose_params = {Band}
			<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 1 mode = <mode>}
		else
			0x9d0992fe text = qs(0xdabf99c0) pad_choose_script = <choose_script> pad_choose_params = {Band}
		endif
		<desc_id> :Obj_SpawnScriptNow career_menu_jaw_anim
	else
		if has_enough_controllers_for_band
			0x9d0992fe {
				text = qs(0xdabf99c0)
				pad_choose_script = <choose_script> pad_choose_params = {Band}
			}
		else
			0x9d0992fe {
				text = qs(0xdabf99c0)
				pad_choose_script = <choose_script> pad_choose_params = {Band}
			}
		endif
		0x9d0992fe \{text = qs(0xc6510dd1)
			pad_choose_script = ui_select_practice_mode_choose}
		<desc_id> :Obj_SpawnScriptNow career_menu_jaw_anim
	endif
	0x87679bf6 \{z_offset = 700.0}
	ui_return_game_mode
endscript

script career_menu_jaw_anim 
	if ScreenElementExists \{id = movie_handler}
		begin
		Wait \{2
			Frame}
		if NOT ScreenElementExists \{id = movie_handler}
			break
		endif
		repeat
	endif
	if desc_resolvealias \{Name = 0xd389b1ff
			param = 0xb9ea5094}
		<0xb9ea5094> :obj_spawnscript 0xd5b5a21b params = {0xc2c7c0e4}
	else

	endif
endscript

script game_mode_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script game_mode_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_destroy_game_mode 
	KillSpawnedScript \{Name = career_menu_jaw_anim}
	0xafd96096
	generic_ui_destroy
endscript

script ui_return_game_mode 
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000
		all_buttons}
endscript

script game_mode_select_career 
	if NOT IsGuitarController controller = <device_num>
		if NOT isdrumcontroller controller = <device_num>
			if NOT ismicrophonepluggedin
				if ($allow_controller_for_all_instruments = 0)
					ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0x67b7ef20) player_device = <device_num>}
					return
				endif
			endif
		endif
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScriptIsRunning \{menu_transition_in_spawned}
		KillSpawnedScript \{Name = menu_transition_in_spawned}
	endif
	if ScriptIsRunning \{menu_transition_in}
		KillSpawnedScript \{Name = menu_transition_in}
	endif
	if NOT GotParam \{Band}
		Change \{game_mode = gh4_p1_career}
		Change \{current_num_players = 1}
		Change \{structurename = player1_status
			part = guitar}
		Change primary_controller = <device_num>
		Change structurename = player1_status controller = <device_num>
		Change GlobalName = player1_device NewValue = <device_num>
		Change \{structurename = player2_status
			part = guitar}
		Change \{band_mode_mode = None}
	else
		Change \{game_mode = gh4_p2_career}
		Change \{current_num_players = 2}
		Change \{band_mode_mode = career}
		Change \{in_join_band_screens = 1}
		ui_group_play_select_local device_num = <device_num>
		return
	endif
	if ($band_mode_mode = None)
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		if (($allow_controller_for_all_instruments) = 0)
			if NOT IsGuitarController controller = <device_num>
				if isdrumcontroller controller = <device_num>
					ui_select_instrument_done instrument = drum device_num = <device_num> skip
					return
				else
					ui_select_instrument_done instrument = vocals device_num = <device_num> skip
					return
				endif
			endif
		endif
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	elseif ($band_mode_mode = career)
		set_primary_controller device_num = <device_num> state = uistate_band_mode
	endif
endscript

script 0xcbadbeff 
	game_mode_select_quickplay freeplay <...>
endscript

script 0xde1174ba 
	game_mode_select_quickplay 0x955f856c <...>
endscript

script game_mode_select_quickplay 
	if ScriptIsRunning \{menu_transition_in_spawned}
		KillSpawnedScript \{Name = menu_transition_in_spawned}
	endif
	if ScriptIsRunning \{menu_transition_in}
		KillSpawnedScript \{Name = menu_transition_in}
	endif
	if NOT GotParam \{Band}
		Change \{game_mode = p1_quickplay}
		Change \{current_num_players = 1}
		Change primary_controller = <device_num>
		Change structurename = player1_status controller = <device_num>
		Change GlobalName = player1_device NewValue = <device_num>
		Change \{respond_to_signin_changed = 1}
		Change \{respond_to_signin_changed_func = None}
		if NOT IsGuitarController controller = <device_num>
			if NOT isdrumcontroller controller = <device_num>
				if NOT ismicrophonepluggedin
					if ($allow_controller_for_all_instruments = 0)
						ui_event event = menu_change data = {is_popup state = uistate_generic_alert_popup title = qs(0x361603ec) text = qs(0x67b7ef20) player_device = <device_num>}
						return
					endif
				endif
			endif
		endif
		if (($allow_controller_for_all_instruments) = 0)
			if NOT IsGuitarController controller = <device_num>
				if isdrumcontroller controller = <device_num>
					ui_select_instrument_done instrument = drum device_num = <device_num> skip
					return
				else
					ui_select_instrument_done instrument = vocals device_num = <device_num> skip
					return
				endif
			endif
		endif
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	else
		Change \{band_mode_mode = quickplay}
		Change \{game_mode = p2_quickplay}
		Change \{current_num_players = 2}
		Change \{in_join_band_screens = 1}
		ui_group_play_select_local device_num = <device_num>
	endif
endscript

script ui_game_mode_back 
	generic_event_back
endscript

script ui_game_mode_poll_for_band_mode 
	begin
	if NOT are_multiple_controllers_connected
		if (<band_mode_allowed> = 1)
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	else
		if (<band_mode_allowed> = 0)
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
