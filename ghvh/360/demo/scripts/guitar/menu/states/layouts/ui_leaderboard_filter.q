
script ui_create_leaderboard_filter 
	createscreenelement {
		parent = root_window
		id = leaderboard_popup
		type = descinterface
		desc = 'leaderboard_filters'
		exclusive_device = ($lb_controller)
		z_priority = 10000
		alpha = 0.0
	}
	getarraysize ($filtertypes.search.values)
	if (($leaderboardsearchvalue >= <array_size>) || ($leaderboardsearchvalue < 0))
		change \{leaderboardsearchvalue = 0}
	endif
	if leaderboard_popup :desc_resolvealias \{name = alias_item}
		assignalias id = <resolved_id> alias = filter_menu
		filter_menu :se_setprops {
			text = ($filtertypes.search.values [($leaderboardsearchvalue)])
			event_handlers = [
				{pad_back generic_event_back}
				{pad_choose ui_leaderboard_filter_choose}
				{pad_up ui_leaderboard_filter_change}
				{pad_down ui_leaderboard_filter_change params = {down}}
			]
			tags = {index = $leaderboardsearchvalue}
		}
	endif
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs(0xa22c24d9) button = green <all_button_params> z = 100000
	add_user_control_helper text = qs(0xaf4d5dd2) button = red <all_button_params> z = 100000
endscript

script ui_destroy_leaderboard_filter 
	destroyscreenelement \{id = leaderboard_popup}
	clean_up_user_control_helpers
endscript

script ui_leaderboard_filter_change 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	gettags
	current_menu :getsingletag \{my_data}
	current_menu :getsingletag \{friendlist}
	getarraysize ($filtertypes.search.values)
	if isps3
		<array_size> = (<array_size> - 1)
	else
		if NOT gotparam \{friendlist}
			<array_size> = (<array_size> - 1)
		endif
	endif
	if gotparam \{down}
		index = (<index> + 1)
		if NOT gotparam \{my_data}
			if (<index> = 1)
				index = (<index> + 1)
			endif
		endif
		if (<index> >= <array_size>)
			index = 0
		endif
		generic_menu_up_or_down_sound \{down}
		leaderboard_popup :se_setprops \{arrow_dn_scale = 1.5
			time = 0.1
			motion = ease_in}
		se_setprops \{scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				top
			]}
	else
		index = (<index> - 1)
		if (<index> < 0)
			index = (<array_size> - 1)
		endif
		if NOT gotparam \{my_data}
			if (<index> = 1)
				index = (<index> - 1)
			endif
		endif
		generic_menu_up_or_down_sound
		leaderboard_popup :se_setprops \{arrow_up_scale = 1.5
			time = 0.1
			motion = ease_in}
		se_setprops \{scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				bottom
			]}
	endif
	se_setprops text = ($filtertypes.search.values [<index>])
	wait \{0.1
		seconds}
	se_setprops \{scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	leaderboard_popup :se_setprops \{arrow_up_scale = 1.0
		arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_in}
	settags index = <index>
	wait \{0.1
		seconds}
endscript

script ui_leaderboard_filter_choose 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if netsessionfunc func = isliveenabled params = {controller_index = <device_num>}
		signin_params = {network_platform_only}
		if isps3
			signin_params = {}
		endif
		if checkforsignin <signin_params> controller_index = <device_num>
			<live_enabled> = 1
		endif
	endif
	if NOT gotparam \{live_enabled}
		if (netsessionfunc func = is_cable_unplugged)
			cable_unplugged = 1
		endif
		generic_event_replace state = uistate_leaderboard_timeout data = {cable_unplugged = <cable_unplugged> func_params = {data = {num_states = 2}}}
		return
	endif
	se_setprops \{block_events}
	gettags
	if NOT (<index> = $leaderboardsearchvalue)
		change leaderboardsearchvalue = <index>
	endif
	switch ($leaderboardsearchvalue)
		case 0
		change \{lb_list_type = 0}
		case 1
		change \{lb_list_type = me}
		case 2
		change \{lb_list_type = friends}
	endswitch
	change \{lb_offset = 1}
	generic_event_replace \{state = uistate_leaderboard_load
		data = {
			is_popup
		}}
endscript
