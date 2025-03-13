
script freeplay_setup_root_helper_pills 
	clean_up_user_control_helpers
	destroyscreenelement \{id = freeplay_extra_helper_pill}
	getmaxlocalplayers
	freeplay_get_num_active_players
	if demobuild
		join_button = green
	else
		join_button = yellow
	endif
	if (<num_active_players> = 0)
		add_user_control_helper {
			text = qs(0xa43fc6bd)
			button = <join_button>
			another_button = <0x6649bc4b>
			all_buttons
		}
		if demobuild
			if demoallowsquit
				add_user_control_helper \{text = qs(0x228a51a9)
					button = red
					all_buttons}
			endif
		else
			add_user_control_helper \{text = qs(0x793e4d21)
				button = start
				all_buttons}
		endif
	elseif (<num_active_players> < <max_players>)
		freeplay_get_num_active_vocalists
		if (<num_active_players> = <num_active_vocalists>)
			add_user_control_helper {
				text = qs(0x54683336)
				button = <join_button>
				another_button = <0x6649bc4b>
				all_buttons
			}
		else
			add_user_control_helper {
				helper_pill_id = freeplay_extra_helper_pill
				text = qs(0x54683336)
				button = <join_button>
				another_button = <0x6649bc4b>
				all_buttons
				override_parent = root_window
				generate_helper_pill_id = false
				pos_anchor = [right , top]
				just = [right , top]
				pos = (-70.0, 35.0)
				scale = (0.9, 0.9)
			}
		endif
	endif
endscript
