g_online_quit_refresh_band_lobby_hack = 0

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
	AssignAlias id = <menu_id> alias = online_quit_menu
	LaunchEvent \{Type = focus
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

script confirm_quit_online \{save = 0}
	online_quit_menu :GetTags
	if GotParam \{callback}
		if GotParam \{callback_params}
			SpawnScriptNow <callback> params = <callback_params>
		else
			SpawnScriptNow <callback>
		endif
	endif
	quit_online_now save = <save>
endscript

script quit_online_now \{save = 0
		new_state = uistate_band_lobby
		band_lobby_save = 0}
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
	gamemode_gettype
	if ($playing_song = 1)
		hide_glitch \{num_frames = 15}
	endif
	quit_network_game_early no_unpost = <no_unpost>
	gman_shutdowngamemodegoal
	band_lobby_restore_prematchmaking_settings
	Change \{net_pause = 0}
	if GotParam \{stop_rendering_on_quit}
		StopRendering
	endif
	if (<Type> = career)
		destroy_cameracuts
	endif
	ui_event_wait_for_safe
	if (1 = <save>)
		KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
		KillSpawnedScript \{Name = net_ui_song_breakdown_competitive_start_timer_spawned}
		if (<band_lobby_save> = 1)
			Change \{g_online_quit_refresh_band_lobby_hack = 1}
			Change \{g_suppress_anim_in = 1}
			net_save_and_uistate_change event = menu_back state = <new_state> is_popup
		else
			net_save_and_uistate_change event = menu_back state = <new_state>
		endif
	else
		generic_event_back state = <new_state>
	endif
endscript
