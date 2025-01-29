
script ui_create_leaderboard_filter 
	CreateScreenElement {
		parent = root_window
		id = leaderboard_popup
		Type = descinterface
		desc = 'leaderboard_filters'
		exclusive_device = ($lb_controller)
		z_priority = 10000
		alpha = 0.0
	}
	GetArraySize ($FilterTypes.search.values)
	if (($LeaderboardSearchValue >= <array_Size>) || ($LeaderboardSearchValue < 0))
		Change \{LeaderboardSearchValue = 0}
	endif
	if leaderboard_popup :desc_resolvealias \{Name = alias_item}
		AssignAlias id = <resolved_id> alias = filter_menu
		filter_menu :se_setprops {
			text = ($FilterTypes.search.values [($LeaderboardSearchValue)])
			event_handlers = [
				{pad_back generic_event_back}
				{pad_choose ui_leaderboard_filter_choose}
				{pad_up ui_leaderboard_filter_change}
				{pad_down ui_leaderboard_filter_change params = {down}}
			]
			tags = {index = $LeaderboardSearchValue}
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
	DestroyScreenElement \{id = leaderboard_popup}
	clean_up_user_control_helpers
endscript

script ui_leaderboard_filter_change 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendlist}
	GetArraySize ($FilterTypes.search.values)
	if isps3
		<array_Size> = (<array_Size> - 1)
	else
		if NOT GotParam \{friendlist}
			<array_Size> = (<array_Size> - 1)
		endif
	endif
	if GotParam \{down}
		index = (<index> + 1)
		if NOT GotParam \{my_data}
			if (<index> = 1)
				index = (<index> + 1)
			endif
		endif
		if (<index> >= <array_Size>)
			index = 0
		endif
		generic_menu_up_or_down_sound \{down}
		leaderboard_popup :se_setprops \{arrow_dn_scale = 1.5
			time = 0.1
			motion = ease_in}
		se_setprops \{Scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				top
			]}
	else
		index = (<index> - 1)
		if (<index> < 0)
			index = (<array_Size> - 1)
		endif
		if NOT GotParam \{my_data}
			if (<index> = 1)
				index = (<index> - 1)
			endif
		endif
		generic_menu_up_or_down_sound
		leaderboard_popup :se_setprops \{arrow_up_scale = 1.5
			time = 0.1
			motion = ease_in}
		se_setprops \{Scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				bottom
			]}
	endif
	se_setprops text = ($FilterTypes.search.values [<index>])
	Wait \{0.1
		Seconds}
	se_setprops \{Scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	leaderboard_popup :se_setprops \{arrow_up_scale = 1.0
		arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_in}
	SetTags index = <index>
	Wait \{0.1
		Seconds}
endscript

script ui_leaderboard_filter_choose 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NetSessionFunc func = isliveenabled params = {controller_index = <device_num>}
		signin_params = {network_platform_only}
		if isps3
			signin_params = {}
		endif
		if CheckForSignIn <signin_params> controller_index = <device_num>
			<live_enabled> = 1
		endif
	endif
	if NOT GotParam \{live_enabled}
		if (NetSessionFunc func = is_cable_unplugged)
			cable_unplugged = 1
		endif
		generic_event_replace state = uistate_leaderboard_timeout data = {cable_unplugged = <cable_unplugged> func_params = {data = {num_states = 2}}}
		return
	endif
	se_setprops \{block_events}
	GetTags
	if NOT (<index> = $LeaderboardSearchValue)
		Change LeaderboardSearchValue = <index>
	endif
	switch ($LeaderboardSearchValue)
		case 0
		Change \{lb_list_type = 0}
		case 1
		Change \{lb_list_type = me}
		case 2
		Change \{lb_list_type = friends}
	endswitch
	Change \{lb_offset = 1}
	generic_event_replace \{state = uistate_leaderboard_load
		data = {
			is_popup
		}}
endscript
