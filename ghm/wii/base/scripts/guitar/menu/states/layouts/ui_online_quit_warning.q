
script ui_create_online_quit_warning player_device = ($primary_controller)
	if NOT GotParam \{confirm_script}
		confirm_script = confirm_quit_online
	endif
	if NOT GotParam \{quit_script}
		quit_script = generic_event_back
	endif
	DestroyScreenElement \{id = popup_warning_container}
	create_popup_warning_menu {
		title = qs(0xaa163738)
		textblock = {
			text = qs(0x3be02ff6)
		}
		parent = root_window
		no_background
		options = [
			{
				func = <quit_script>
				text = qs(0xf7723015)
			}
			{
				func = <confirm_script>
				text = qs(0x67d9c56d)
			}
		]
		player_device = <player_device>
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
	destroy_popup_warning_menu
endscript

script confirm_quit_online 
	spawn_player_drop_listeners \{drop_player_script = nullscript
		end_game_script = nullscript}
	create_loading_screen \{Wait}
	online_quit_menu :GetTags
	if GotParam \{callback}
		if GotParam \{callback_params}
			SpawnScriptNow <callback> params = <callback_params>
		else
			SpawnScriptNow <callback>
		endif
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($net_band_mode_menu = HOST)
			Change \{is_network_game = 0}
			generic_event_back \{state = uistate_group_play}
			return
		else
			if IsHost
				Change \{net_band_mode_menu = HOST}
			else
				Change \{net_band_mode_menu = join}
			endif
		endif
	else
		Change \{net_new_matchmaking_ui_flag = 0}
	endif
	net_clear_all_remote_player_status
	quit_network_game_early
	destroy_all_exploding_text
	Change \{net_pause = 0}
	if (<Type> = career)
		Change \{num_local_players = 0}
		quit_career_back_to_lobby
	else
		UnPauseGame
		if (<Type> = quickplay)
			GetGlobalTags \{user_options}
			if (<autosave> = 1)
				ui_memcard_autosave_replace \{event = menu_back
					state = uistate_online
					data = {
						0x6d221ff1
					}}
			else
				UnPauseGame
				generic_event_back \{state = uistate_online}
			endif
		else
			generic_event_back \{state = uistate_online}
		endif
	endif
endscript

script quit_career_back_to_lobby 
	Change \{num_players_in_band = 0}
	Change \{net_band_members = [
		]}
	Change \{net_num_joiners = 0}
	Change \{0x0c2faa8d = 0}
	Change \{career_matchmaking_complete = 0}
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
		generic_event_back data = {num_states = (<i> + 1)}
	else
		generic_event_back \{state = uistate_mainmenu}
	endif
	UnPauseGame
endscript
