
script ui_create_leaderboard_me 
	current_menu :getsingletag \{my_data}
	if gotparam \{my_data}
		createscreenelement {
			parent = root_window
			id = leaderboard_popup
			type = descinterface
			desc = 'leaderboard_info_desc'
			exclusive_device = ($lb_controller)
			z_priority = 10000
			event_handlers = [
				{pad_back generic_event_back}
			]
			alpha = 0.0
		}
		current_menu :getsingletag \{my_cash}
		if gotparam \{my_cash}
			formattext textname = earnings '%e' e = <my_cash>
			stringtointeger \{earnings}
			cash_get_info_from_earnings earnings = <earnings>
			formattext textname = rank qs(0x6a2b4870) r = <rank>
		endif
		getarraysize <my_data>
		data_index = (<array_size> - 1)
		if (($current_leaderboard_instrument) = band)
			data_index = 2
		endif
		leaderboard_popup :se_setprops {
			rank_text = (<my_data> [0])
			nametag_text = (<my_data> [1])
			score_text = (<my_data> [<data_index>])
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <rank>
		}
		if ($current_leaderboard_group = song)
			if NOT (($current_leaderboard_instrument) = band)
				ui_leaderboard_get_difficulty_icon num = (<my_data> [2])
				leaderboard_popup :se_setprops {
					icon_texture = <difficulty_icon>
					icon_alpha = <difficulty_alpha>
				}
			else
			endif
		elseif ($current_leaderboard_group = cash)
			leaderboard_popup :se_setprops \{score_desc_text = qs(0x2334f5f5)}
		endif
	else
		ui_event_wait \{event = menu_back}
		return
	endif
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
endscript

script ui_destroy_leaderboard_me 
	destroyscreenelement \{id = leaderboard_popup}
endscript

script ui_leaderboard_popup_anim_in 
	if screenelementexists \{id = leaderboard_popup}
		leaderboard_popup :se_setprops \{alpha = 1.0
			time = 0.1}
		leaderboard_popup :se_waitprops
	endif
endscript

script ui_leaderboard_popup_anim_out 
	if screenelementexists \{id = leaderboard_popup}
		leaderboard_popup :se_setprops \{alpha = 0.0
			time = 0.1}
		leaderboard_popup :se_waitprops
	endif
endscript
