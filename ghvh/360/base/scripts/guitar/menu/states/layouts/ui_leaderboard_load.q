
script ui_create_leaderboard_load 
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = stats_init}
	SpawnScriptNow ui_create_leaderboard_load_spawned params = <...>
endscript

script ui_create_leaderboard_load_spawned 
	RemoveParameter \{base_name}
	RemoveParameter \{focus_id}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = leaderboard_load
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 1000000}
	ui_leaderboard_get_headers
	if GotParam \{my_status}
		CreateScreenElement \{parent = leaderboard_load
			Type = descinterface
			desc = 'leaderboard'
			z_priority = -100}
		<id> :obj_spawnscript ui_leaderboard_load_spin
		ui_event_wait_for_safe
		Change \{LeaderboardSearchValue = 0}
		Change \{LeaderboardDiffValue = 3}
		Change \{lb_list_type = 0}
		Change \{lb_offset = 1}
		if ($current_leaderboard_group = song)
			Change lb_rating_value = (($LeaderboardDiffValue) + 1)
		else
			Change \{lb_rating_value = 0}
		endif
		if isXenon
			controller_index = ($lb_controller)
		endif
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback_me
				offset = 1
				columns = <columns>
				num_rows = 1
				listtype = me
				controller_index = <controller_index>
			}
		}
	elseif GotParam \{offset}
		leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
		leaderboard_load :SetTags offset = <prev_offset>
		if ($lb_list_type = friends)
			listtype = friends
		endif
		if isXenon
			controller_index = ($lb_controller)
		endif
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = <listtype>
				controller_index = <controller_index>
			}
		}
	else
		leaderboardinterface :obj_spawnscript \{ui_leaderboard_load_spin}
		if ((isps3) && ($lb_list_type = friends))
			Change \{lb_list_type = 0}
		elseif ($lb_list_type = me)
			leaderboard_load :SetTags \{my_leaderboard = 1}
		endif
		if isXenon
			controller_index = ($lb_controller)
		endif
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = ($lb_list_type)
				rating_val = ($lb_rating_value)
				controller_index = <controller_index>
			}
		}
	endif
endscript

script ui_destroy_leaderboard_load 
	destroy_menu_backdrop
	KillSpawnedScript \{Name = ui_leaderboard_load_spin}
	DestroyScreenElement \{id = leaderboard_load}
	if ScreenElementExists \{id = leaderboardinterface}
		leaderboardinterface :se_setprops \{loading_alpha = 0.0
			time = 0.1}
	endif
	if NOT GotParam \{my_status}
	endif
endscript

script ui_leaderboard_load_callback_me 
	printf \{qs(0xe0264b2d)
		channel = leaderboard}
	GetArraySize \{leaderboard_data}
	if (<array_Size> > 0)
		my_data = (<leaderboard_data> [0].data)
		leaderboard_load :SetTags my_data = <my_data>
		leaderboard_load :SetTags my_xuid = (<leaderboard_data> [0].player_xuid)
		my_cash = (<my_data> [2])
	endif
	if ($current_leaderboard_group = cash)
		SpawnScriptNow ui_leaderboard_load_callback_me_continue params = {my_data = <my_data> my_cash = <my_cash>}
	else
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_cash_me}
	endif
endscript

script ui_leaderboard_load_cash_me 
	printf \{qs(0x2d7e3020)}
	Wait \{0.5
		Second}
	GetSingleTag \{my_xuid}
	if GotParam \{my_xuid}
		array = []
		AddArrayElement array = <array> element = <my_xuid>
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = lb_career_cash
				callback = ui_leaderboard_load_callback_xuid_me
				listtype = custom_list
				num_rows = 1
				columns = [1]
				uid_array = <array>
			}
		}
	else
		SpawnScriptNow \{ui_leaderboard_load_callback_xuid_me
			params = {
				leaderboard_data = [
				]
			}}
		return
	endif
endscript

script ui_leaderboard_load_callback_xuid_me 
	printf \{qs(0x6199ec64)}
	leaderboard_load :GetSingleTag \{my_data}
	GetArraySize \{leaderboard_data}
	if (<array_Size> > 0)
		my_cash = (<leaderboard_data> [0].data [2])
	endif
	SpawnScriptNow ui_leaderboard_load_callback_me_continue params = {my_data = <my_data> my_cash = <my_cash>}
endscript

script ui_leaderboard_load_callback_me_continue 
	ui_event_wait_for_safe
	mark_unsafe_for_shutdown
	SetButtonEventMappings \{block_menu_input}
	ui_event_block event = menu_replace data = {state = uistate_leaderboard my_data = <my_data> my_cash = <my_cash> keep_loading = 1}
	ui_event_remove_params \{param = keep_loading}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_leaderboard_load
			is_popup
		}}
	SetButtonEventMappings \{unblock_menu_input}
	mark_safe_for_shutdown
endscript

script ui_leaderboard_load_callback 
	printf \{qs(0x0e5280e0)
		channel = leaderboard}
	if NOT ($lb_list_type = friends)
		if GotParam \{offset}
			Change lb_offset = <offset>
		endif
	endif
	unblock_invites
	leaderboard_load :SetTags song_data = <leaderboard_data>
	if ($current_leaderboard_group = cash)
		SpawnScriptNow ui_leaderboard_load_callback_xuid params = {leaderboard_data = <leaderboard_data>}
	else
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_cash}
	endif
endscript

script ui_leaderboard_load_cash 
	printf \{qs(0x13c6793d)}
	Wait \{0.5
		Second}
	GetSingleTag \{song_data}
	GetArraySize <song_data>
	controller = ($lb_controller)
	if isps3
		controller = ($primary_controller)
	endif
	<live_enabled> = 0
	if NetSessionFunc func = isliveenabled params = {controller_index = <controller>}
		signin_params = {network_platform_only}
		if isps3
			signin_params = {}
		endif
		if CheckForSignIn <signin_params> controller_index = <controller>
			<live_enabled> = 1
		else
			array_Size = 0
		endif
	endif
	if NetSessionFunc \{func = iscableunplugged}
		<live_enabled> = 0
		<cable_unplugged> = 1
	endif
	if (<array_Size> > 0)
		array = []
		i = 0
		begin
		AddArrayElement array = <array> element = (<song_data> [<i>].player_xuid)
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{array}
		GetArraySize <array>
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = lb_career_cash
				callback = ui_leaderboard_load_callback_xuid
				listtype = custom_list
				columns = [1]
				num_rows = <array_Size>
				uid_array = <array>
			}
		}
	elseif (<live_enabled> = 0)
		if ui_event_exists_in_stack \{Name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		ui_event_wait event = menu_replace data = {state = uistate_leaderboard_timeout cable_unplugged = <cable_unplugged>}
		return
	else
		if ui_event_exists_in_stack \{Name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		leaderboard_load :GetSingleTag \{offset}
		if NOT GotParam \{offset}
			leaderboard_load :obj_spawnscript \{ui_leaderboard_load_empty}
		else
			Change lb_offset = <offset>
		endif
		return
	endif
endscript

script ui_leaderboard_load_callback_xuid 
	printf \{qs(0x3d715f60)
		channel = leaderboard}
	leaderboard_load :GetSingleTag \{song_data}
	leaderboard_load :GetSingleTag \{my_leaderboard}
	GetArraySize <song_data>
	controller = ($lb_controller)
	if isps3
		controller = ($primary_controller)
	endif
	<live_enabled> = 0
	if NetSessionFunc func = isliveenabled params = {controller_index = <controller>}
		signin_params = {network_platform_only}
		if isps3
			signin_params = {}
		endif
		if CheckForSignIn <signin_params> controller_index = <controller>
			<live_enabled> = 1
		else
			array_Size = 0
		endif
	endif
	if NetSessionFunc \{func = iscableunplugged}
		<live_enabled> = 0
		<cable_unplugged> = 1
	endif
	if (<array_Size> > 0)
		ui_leaderboard_update_rows leaderboard_data = <song_data> cash_data = <leaderboard_data> my_leaderboard = <my_leaderboard>
	elseif (<live_enabled> = 0)
		if ui_event_exists_in_stack \{Name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		ui_event_wait event = menu_replace data = {state = uistate_leaderboard_timeout cable_unplugged = <cable_unplugged>}
	else
		if ui_event_exists_in_stack \{Name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		leaderboard_load :GetSingleTag \{offset}
		if NOT GotParam \{offset}
			leaderboard_load :obj_spawnscript \{ui_leaderboard_load_empty}
		else
			Change lb_offset = <offset>
		endif
		return
	endif
endscript

script ui_leaderboard_load_timeout 
	if NOT GotParam \{no_wait}
		Wait \{5
			Seconds}
	endif
	if (<callback> = ui_leaderboard_load_callback_me)
		leaderboard_load :obj_spawnscript <callback> params = {leaderboard_data = []}
		return
	endif
	printf \{qs(0x1ab6e016)
		channel = leaderboard}
	if ($lb_list_type = friends)
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_leaderboard
			}}
		return
	endif
	if ui_event_exists_in_stack \{Name = 'leaderboard'}
		ui_event \{event = menu_back}
	endif
	leaderboard_load :GetSingleTag \{offset}
	if NOT GotParam \{offset}
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_leaderboard_timeout
			}}
	else
		Change lb_offset = <offset>
	endif
endscript

script ui_leaderboard_load_empty 
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_leaderboard_empty
		}}
endscript

script ui_leaderboard_load_spin 
	se_setprops spin_rot_angle = RandomFloat (0.0, 360.0)
	se_setprops \{loading_alpha = 1.0}
	if desc_resolvealias \{Name = alias_spin}
		begin
		<resolved_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = (<rot_angle> + 360.0) time = 1.0
		<resolved_id> :se_waitprops
		repeat
	endif
endscript
