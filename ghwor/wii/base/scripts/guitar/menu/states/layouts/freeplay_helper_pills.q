
script freeplay_setup_root_helper_pills 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	DestroyScreenElement \{id = freeplay_extra_helper_pill_menu}
	DestroyScreenElement \{id = freeplay_ds_helper_pill}
	getmaxlocalplayers
	freeplay_get_num_active_players
	if demobuild
		<join_button> = green
	else
		<join_button> = green
	endif
	if (<num_active_players> = 0)
		add_user_control_helper {
			text = qs(0x54683336)
			button = <join_button>
			all_buttons
		}
		if demobuild
			if demoallowsquit
				add_user_control_helper \{text = qs(0x228a51a9)
					button = red
					all_buttons}
			endif
		else
			add_user_control_helper \{text = qs(0x89152f9c)
				button = red
				all_buttons}
		endif
		if freeplay_condition_no_ds_connected
			add_user_control_helper \{helper_pill_id = freeplay_ds_helper_pill
				text = $wii_freeplay_connect_ds
				button = button_1
				all_buttons
				generate_helper_pill_id = FALSE}
		endif
	elseif (<num_active_players> <= <max_players>)
		force_reposition = FALSE
		freeplay_get_num_active_vocalists
		if (<num_active_vocalists> > 0)
			<force_reposition> = true
		endif
		freeplay_get_first_active_player
		<add_menu_pill> = 0
		begin
		getplayerinfo <Player> controller
		getplayerinfo <Player> mic_connected
		get_controller_type controller_index = <controller>
		if ((<controller_type> = guitar) || (<controller_type> = bass) || (<controller_type> = drum) || ((<controller_type> = vocals) && (<mic_connected> = mic_disconnected)))
			<add_menu_pill> = 1
		endif
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
		if (<force_reposition> = true)
			add_user_control_helper {
				helper_pill_id = freeplay_extra_helper_pill
				text = qs(0x54683336)
				button = <join_button>
				all_buttons
				override_parent = root_window
				generate_helper_pill_id = FALSE
				pos_anchor = [right , top]
				just = [right , top]
				Pos = (-70.0, 215.0)
				Scale = (0.7, 0.7)
			}
			<next_pos> = (-70.0, 260.0)
			if freeplay_condition_no_ds_connected
				add_user_control_helper {
					helper_pill_id = freeplay_ds_helper_pill
					text = $wii_freeplay_connect_ds
					button = button_1
					standard
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [right , top]
					just = [right , top]
					Pos = <next_pos>
					Scale = (0.7, 0.7)
				}
				<next_pos> = (-70.0, 305.0)
			endif
			if (<add_menu_pill> = 1)
				add_user_control_helper {
					helper_pill_id = freeplay_extra_helper_pill_menu
					text = qs(0xcbd7ea6a)
					button = start
					all_buttons
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [right , top]
					just = [right , top]
					Pos = <next_pos>
					Scale = (0.7, 0.7)
				}
			endif
		else
			add_user_control_helper {
				helper_pill_id = freeplay_extra_helper_pill
				text = qs(0x54683336)
				button = <join_button>
				all_buttons
				override_parent = root_window
				generate_helper_pill_id = FALSE
				pos_anchor = [right , top]
				just = [right , top]
				Pos = (-70.0, 35.0)
				Scale = (0.9, 0.9)
			}
			<next_pos> = (-70.0, 90.0)
			if freeplay_condition_no_ds_connected
				add_user_control_helper {
					helper_pill_id = freeplay_ds_helper_pill
					text = $wii_freeplay_connect_ds
					button = button_1
					standard
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [right , top]
					just = [right , top]
					Pos = <next_pos>
					Scale = (0.8, 0.8)
				}
				<next_pos> = (-70.0, 135.0)
			endif
			if (<add_menu_pill> = 1)
				add_user_control_helper {
					helper_pill_id = freeplay_extra_helper_pill_menu
					text = qs(0xcbd7ea6a)
					button = start
					all_buttons
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [right , top]
					just = [right , top]
					Pos = <next_pos>
					Scale = (0.8, 0.8)
				}
			endif
		endif
	endif
	freeplay_update_highway_helpers
endscript
