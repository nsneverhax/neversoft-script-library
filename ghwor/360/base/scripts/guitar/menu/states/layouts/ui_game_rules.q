
script ui_create_game_rules 
	if teammodeequals \{team_mode = two_teams}
		filter = team_only
	else
		filter = no_team
	endif
	band_lobby_create_popup_menu_game_rules {
		parent = root_window
		alias = game_rules_screen_id
		Pos = (0.0, 0.0)
		is_popup = 0
		filter = <filter>
	}
	if GotParam \{VMenu}
		<VMenu> :se_setprops {
			exclusive_device = ($primary_controller)
		}
		game_rules_screen_id :SetTags menu_id = <VMenu>
		if GotParam \{start_timer}
			if (<start_timer> = 1)
				if ($song_breakdown_countdown_time_added = 0)
					if IsHost
						net_song_breakdown_add_to_timer
					else
						Change \{song_breakdown_countdown_time_added = 2}
						SendStructure \{callback = net_song_breakdown_add_to_timer
							data_to_send = {
								None
							}}
					endif
				endif
				Change \{net_song_breakdown_timer_screen_id = game_rules_screen_id}
			endif
		endif
		if GotParam \{index_to_focus}
			LaunchEvent Type = focus target = <VMenu> data = {child_index = <index_to_focus>}
		else
			LaunchEvent Type = focus target = <VMenu>
		endif
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x9c8312f4)
			button = blue
			z = 100000}
	endif
endscript

script ui_destroy_game_rules 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = game_rules_screen_id}
		DestroyScreenElement \{id = game_rules_screen_id}
	endif
endscript

script ui_return_game_rules 
	if ScreenElementExists \{id = game_rules_screen_id}
		<screen_id> = game_rules_screen_id
		game_rules_screen_id :se_setprops \{unblock_events}
		if game_rules_screen_id :obj_getchecksumtag \{tag_name = menu_id
				assert = 0}
			<screen_id> = <checksum_value>
		endif
		<screen_id> :se_setprops unblock_events
		LaunchEvent Type = focus target = <screen_id>
		<quit_only> = 0
		if InNetGame
			if sessionisover
				<quit_only> = 1
			endif
		endif
		dbreak
		if (<quit_only> = 1)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
		else
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
			add_user_control_helper \{text = qs(0xf7723015)
				button = red
				z = 100000}
			add_user_control_helper \{text = qs(0x9c8312f4)
				button = blue
				z = 100000}
		endif
	endif
endscript
