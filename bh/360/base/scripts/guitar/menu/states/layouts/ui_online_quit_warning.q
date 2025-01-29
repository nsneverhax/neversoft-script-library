
script ui_create_online_quit_warning 
	if NOT GotParam \{confirm_script}
		confirm_script = confirm_quit_online
	endif
	if NOT GotParam \{confirm_params}
		if GotParam \{stop_rendering_on_quit}
			confirm_params = {stop_rendering_on_quit}
		else
			confirm_param = {}
		endif
	endif
	DestroyScreenElement \{id = dialog_box_container}
	controller = ($primary_controller)
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = qs(0x3be02ff6)
		parent = root_window
		no_background
		options = [
			{
				func = generic_event_back
				func_params = {nosound}
				text = qs(0xf7723015)
			}
			{
				func = <confirm_script>
				func_params = <confirm_params>
				text = qs(0x67d9c56d)
			}
		]
		player_device = <controller>
	}
	AssignAlias id = <menu_id> alias = online_quit_menu
	LaunchEvent \{type = focus
		target = online_quit_menu}
	if GotParam \{callback}
		online_quit_menu :SetTags {callback = <callback>}
	endif
	if GotParam \{callback_params}
		online_quit_menu :SetTags callback_params = <callback_params>
	endif
endscript

script ui_destroy_online_quit_warning 
	destroy_dialog_box
endscript

script confirm_quit_online 
	online_quit_menu :GetTags
	if GotParam \{callback}
		if GotParam \{callback_params}
			spawnscriptnow <callback> params = <callback_params>
		else
			spawnscriptnow <callback>
		endif
	endif
	quit_online_now
endscript

script quit_online_now 
	no_unpost = 0
	if NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = leave_game}
	else
		no_unpost = 1
		NetSessionFunc \{Obj = party
			func = leave_party}
		band_lobby_add_in_game_players_to_party
	endif
	GameMode_GetType
	if ($playing_song = 1)
		hide_glitch \{num_frames = 15}
	endif
	quit_network_game_early no_unpost = <no_unpost>
	GMan_ShutDownGameModeGoal
	band_lobby_restore_prematchmaking_settings
	Change \{net_pause = 0}
	if GotParam \{stop_rendering_on_quit}
		StopRendering
	endif
	if ($g_band_lobby_flag = 1)
		if (<type> = career)
			destroy_cameracuts
			career_end_challenge
		endif
		ui_event_wait_for_safe
		generic_event_back \{state = UIstate_band_lobby_setup}
	else
		ScriptAssert \{'DEPRECATED FLOW'}
	endif
endscript

script quit_career_back_to_lobby 
	found_state = 0
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'band_mode')
		<found_state> = 1
		break
	endif
	i = (<i> + 1)
	repeat <stack_size>
	if (<found_state> = 1)
		NetSessionFunc \{Obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
		generic_event_back data = {num_states = (<i> + 1)}
	else
		generic_event_back \{state = uistate_mainmenu}
	endif
	UnpauseGame
endscript

script net_career_host_disband_party 
	printf \{qs(0x810fcf45)}
	hide_glitch \{num_frames = 2}
	NetSessionFunc \{Obj = party
		func = disband_party_session}
	generic_event_back \{state = uistate_group_play}
endscript

script net_career_leave_party_confirm 
	printf \{qs(0xcf553d16)}
	NetSessionFunc \{Obj = party
		func = leave_party}
	generic_event_back \{state = uistate_group_play}
endscript
