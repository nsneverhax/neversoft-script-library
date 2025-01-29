
script freeplay_setup_root_helper_pills 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	getmaxlocalplayers
	freeplay_get_num_active_players
	if (<num_active_players> = 0)
		add_user_control_helper \{text = qs(0xa43fc6bd)
			button = yellow
			all_buttons}
		add_user_control_helper \{text = qs(0x793e4d21)
			button = start
			all_buttons}
	elseif (<num_active_players> < <max_players>)
		freeplay_get_num_active_vocalists
		if (<num_active_players> = <num_active_vocalists>)
			add_user_control_helper \{text = qs(0x54683336)
				button = yellow
				all_buttons}
		else
			force_reposition = FALSE
			getmaxlocalplayers
			Player = 1
			begin
			getplayerinfo <Player> freeplay_state
			getplayerinfo <Player> part
			getplayerinfo <Player> vocals_slot
			if ((<freeplay_state> != dropped) && (<part> = vocals) && (<vocals_slot> = 3))
				<force_reposition> = true
			endif
			Player = (<Player> + 1)
			repeat <max_players>
			if (<force_reposition> = true)
				add_user_control_helper \{helper_pill_id = freeplay_extra_helper_pill
					text = qs(0x54683336)
					button = yellow
					all_buttons
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [
						right
						top
					]
					just = [
						right
						top
					]
					Pos = (-30.0, 215.0)
					Scale = (0.7, 0.7)}
			else
				add_user_control_helper \{helper_pill_id = freeplay_extra_helper_pill
					text = qs(0x54683336)
					button = yellow
					all_buttons
					override_parent = root_window
					generate_helper_pill_id = FALSE
					pos_anchor = [
						right
						top
					]
					just = [
						right
						top
					]
					Pos = (-70.0, 35.0)
					Scale = (0.9, 0.9)}
			endif
		endif
	endif
endscript
