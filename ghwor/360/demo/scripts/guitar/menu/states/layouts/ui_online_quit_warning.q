g_online_quit_refresh_band_lobby_hack = 0

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
		body_text = qs(0x589a7273)
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
				text = qs(0xb5196a13)
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

script confirm_quit_online \{save = 0}
	online_quit_menu :gettags
	if gotparam \{callback}
		if gotparam \{callback_params}
			spawnscriptnow <callback> params = <callback_params>
		else
			spawnscriptnow <callback>
		endif
	endif
	quit_online_now save = <save>
endscript

script quit_online_now \{save = 0
		new_state = uistate_band_lobby
		band_lobby_save = 0}
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
	if (<type> = career)
		destroy_cameracuts
	endif
	ui_event_wait_for_safe
	if (1 = <save>)
		killspawnedscript \{name = net_ui_song_breakdown_start_timer_spawned}
		killspawnedscript \{name = net_ui_song_breakdown_competitive_start_timer_spawned}
		if (<band_lobby_save> = 1)
			change \{g_online_quit_refresh_band_lobby_hack = 1}
			change \{g_suppress_anim_in = 1}
			net_save_and_uistate_change event = menu_back state = <new_state> is_popup
		else
			net_save_and_uistate_change event = menu_back state = <new_state>
		endif
	else
		generic_event_back state = <new_state>
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
		ui_sfx \{menustate = generic
			uitype = select}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
		generic_event_back data = {num_states = (<i> + 1)}
	else
		ui_sfx \{menustate = generic
			uitype = select}
		generic_event_back \{state = uistate_mainmenu}
	endif
	unpausegame
endscript

script net_career_host_disband_party 
	printf \{qs(0x810fcf45)}
	ui_sfx \{menustate = generic
		uitype = select}
	hide_glitch \{num_frames = 2}
	netsessionfunc \{obj = party
		func = disband_party_session}
	generic_event_back \{state = uistate_group_play}
endscript

script net_career_leave_party_confirm 
	ui_sfx \{menustate = generic
		uitype = select}
	printf \{qs(0xcf553d16)}
	netsessionfunc \{obj = party
		func = leave_party}
	generic_event_back \{state = uistate_group_play}
endscript
