
script ui_create_online_quit_warning 
	if NOT gotparam \{confirm_script}
		confirm_script = confirm_quit_online
	endif
	if NOT gotparam \{confirm_params}
		if gotparam \{stop_rendering_on_quit}
			confirm_params = {stop_rendering_on_quit}
		else
			confirm_param = {}
		endif
	endif
	destroyscreenelement \{id = dialog_box_container}
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
	assignalias id = <menu_id> alias = online_quit_menu
	launchevent \{type = focus
		target = online_quit_menu}
	if gotparam \{callback}
		online_quit_menu :settags {callback = <callback>}
	endif
	if gotparam \{callback_params}
		online_quit_menu :settags callback_params = <callback_params>
	endif
endscript

script ui_destroy_online_quit_warning 
	destroy_dialog_box
endscript

script confirm_quit_online 
	online_quit_menu :gettags
	if gotparam \{callback}
		if gotparam \{callback_params}
			spawnscriptnow <callback> params = <callback_params>
		else
			spawnscriptnow <callback>
		endif
	endif
	quit_online_now
endscript

script quit_online_now 
	no_unpost = 0
	if netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = leave_game}
	else
		no_unpost = 1
		netsessionfunc \{obj = party
			func = leave_party}
		band_lobby_add_in_game_players_to_party
	endif
	gamemode_gettype
	if ($playing_song = 1)
		hide_glitch \{num_frames = 15}
	endif
	quit_network_game_early no_unpost = <no_unpost>
	gman_shutdowngamemodegoal
	band_lobby_restore_prematchmaking_settings
	change \{net_pause = 0}
	if gotparam \{stop_rendering_on_quit}
		stoprendering
	endif
	if ($g_band_lobby_flag = 1)
		if (<type> = career)
			destroy_cameracuts
			career_end_challenge
		endif
		ui_event_wait_for_safe
		generic_event_back \{state = uistate_band_lobby_setup}
	else
		scriptassert \{'DEPRECATED FLOW'}
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
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
		generic_event_back data = {num_states = (<i> + 1)}
	else
		generic_event_back \{state = uistate_mainmenu}
	endif
	unpausegame
endscript

script net_career_host_disband_party 
	printf \{qs(0x810fcf45)}
	hide_glitch \{num_frames = 2}
	netsessionfunc \{obj = party
		func = disband_party_session}
	generic_event_back \{state = uistate_group_play}
endscript

script net_career_leave_party_confirm 
	printf \{qs(0xcf553d16)}
	netsessionfunc \{obj = party
		func = leave_party}
	generic_event_back \{state = uistate_group_play}
endscript
