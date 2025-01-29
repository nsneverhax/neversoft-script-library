
script freeplay_setup_root_helper_pills 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	DestroyScreenElement \{id = freeplay_ds_helper_pill}
	getmaxlocalplayers
	freeplay_get_num_active_players
	if (<num_active_players> = 0)
		add_user_control_helper \{text = qs(0xa43fc6bd)
			button = start
			all_buttons}
		if NOT is_ds_connected
			add_user_control_helper \{text = $wii_freeplay_connect_ds
				button = back
				all_buttons
				generate_helper_pill_id = FALSE
				helper_pill_id = freeplay_ds_helper_pill}
		endif
		add_user_control_helper \{text = qs(0x793e4d21)
			button = green
			all_buttons}
	elseif (<num_active_players> < <max_players>)
		force_reposition = FALSE
		freeplay_get_num_active_vocalists
		if (<num_active_vocalists> > 0)
			<force_reposition> = true
		endif
		if (<force_reposition> = true)
			add_user_control_helper \{helper_pill_id = freeplay_extra_helper_pill
				text = qs(0x54683336)
				button = start
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
				button = start
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
	else
		force_reposition = FALSE
		freeplay_get_num_active_vocalists
		if (<num_active_vocalists> > 0)
			<force_reposition> = true
		endif
		if (<force_reposition> = true)
			add_user_control_helper \{helper_pill_id = freeplay_extra_helper_pill
				text = qs(0xcbd7ea6a)
				button = start
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
				text = qs(0xcbd7ea6a)
				button = start
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
	freeplay_update_highway_helpers
endscript
