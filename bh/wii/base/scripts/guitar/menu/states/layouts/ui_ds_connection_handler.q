ds_mode_settings = {
	freestyle = {
		target_ds_count = 1
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4198549
		program_title = qs(0x12c9e187)
		program_comment = qs(0xd79f36b9)
		initial_header_text = qs(0xfb4ec88a)
		initial_instructions_text = qs(0xbcbd7469)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0x44f87589)
	}
	roadie_battle = {
		target_ds_count = 2
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4198549
		program_title = qs(0x12c9e187)
		program_comment = qs(0xac560c65)
		initial_header_text = qs(0xfb4ec88a)
		initial_instructions_text = qs(0xe0aa8aa8)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0x84020d67)
	}
	audience_party = {
		target_ds_count = 1
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4198549
		program_title = qs(0x12c9e187)
		program_comment = qs(0xc8288fe4)
		initial_header_text = qs(0xfb4ec88a)
		initial_instructions_text = qs(0xbcbd7469)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0x3ab0acbd)
	}
	0x69e1949a = {
		target_ds_count = 1
		connection_type = connect
		ggid = 4196482
		initial_header_text = qs(0xf7f0eadd)
		initial_instructions_text = qs(0x4c1271a9)
		header_text = qs(0xe96608fe)
		instructions_text = qs(0x4c1271a9)
	}
	0x54dbf89d = {
		target_ds_count = 1
		connection_type = connect
		ggid = 4196483
		initial_header_text = qs(0xf7f0eadd)
		initial_instructions_text = qs(0x4c1271a9)
		header_text = qs(0xe96608fe)
		instructions_text = qs(0x4c1271a9)
	}
}
ds_estimated_download_rate = 20000
ds_max_asset_download_percentage = 0.9
ds_state = None
ds_mode = None
ds_connection_error = 0
ds_connection_canceled = 0
ds_connection_device_num = -1
ds_asset_download_complete = [
]
ds_infos = [
	{
	}
	{
	}
]
ds_can_download = 0
ds_asset_download_started = FALSE
ds_asset_download_starttime = 0
ds_asset_download_estimatedduration = 0

script do_ds_debug_options 
	if ($enable_debug = 0)
		return
	endif
	cancel_ds_operation
	if ($ds_mode_settings.$ds_mode.target_ds_count = 1)
		ds_connection_handler_tree :GetTags \{from}
		options = [
			{
				func = ds_debug_popup_choose
				func_params = {func = do_ds_broadcast}
				text = qs(0xce7bf568)
			}
			{
				func = ds_debug_popup_choose
				func_params = {func = debug_skip_ds_download func_params = {target_ds_count = 1}}
				text = qs(0xcec79d1d)
			}
			{
				func = ds_debug_popup_choose
				func_params = {func = LaunchEvent func_params = {Type = ds_connection_complete target = ds_event_listener}}
				text = qs(0xe95603f0)
			}
		]
		if (<from> = freestyle_band_lobby)
			func = freestyle_band_lobby_close_ds_connect
		else
			func = generic_event_back
		endif
	else
		options = [
			{
				func = ds_debug_popup_choose
				func_params = {func = do_ds_broadcast}
				text = qs(0xce7bf568)
			}
			{
				func = ds_debug_popup_choose
				func_params = {func = debug_skip_ds_download func_params = {target_ds_count = 1}}
				text = qs(0xc9b0a253)
			}
			{
				func = ds_debug_popup_choose
				func_params = {func = debug_skip_ds_download func_params = {target_ds_count = 2}}
				text = qs(0xe29df190)
			}
			{
				func = ds_debug_popup_choose
				func_params = {func = LaunchEvent func_params = {Type = ds_connection_complete target = ds_event_listener}}
				text = qs(0xe95603f0)
			}
		]
		func = generic_event_back
	endif
	create_new_generic_popup {
		popup_type = message_options
		back_script = ds_debug_popup_choose
		back_params = {func = <func>}
		title = qs(0x9ac3c719)
		text = qs(0x86af5cc9)
		options = <options>
		title_effect
	}
endscript

script ui_create_ds_connection_handler \{from = standard}
	KillSpawnedScript \{Name = monitor_controller_signal_strength}
	cancel_ds_operation
	push_block_home_button
	sdcardmanagerfunc \{func = force_hold_ejects}
	if (<from> = freestyle_mainmenu)
		0x61906aac
	endif
	if GotParam \{device_num}
		Change ds_connection_device_num = <device_num>
	else
		Change ds_connection_device_num = ($primary_controller)
	endif
	CreateScreenElement {
		parent = root_window
		id = ds_connection_handler_tree
		Type = descinterface
		desc = 'ds_connection_handler_tree'
		exclusive_device = ($ds_connection_device_num)
		event_handlers = [
			{pad_back do_generic_cancel_connection}
			{pad_choose ui_generic_connection_try_download}
			{pad_L1 do_ds_debug_options}
			{ds_count_change generic_ds_count_change_handler}
			{ds_communication_error generic_ds_communication_error_handler}
			{ds_download_cancellation generic_ds_download_cancellation_handler}
			{ds_connect_cancellation generic_ds_connect_cancellation_handler}
			{ds_connection_complete generic_ds_connection_complete_handler}
			{ds_disconnect generic_ds_communication_error_handler}
		]
		z_priority = 100
	}
	if (<from> = freestyle_band_lobby)
		ds_connection_handler_tree :se_setprops \{background_graphic_alpha = 0}
	endif
	ds_connection_handler_tree :SetTags from = <from>
	Change \{ds_connection_error = 0}
	Change \{ds_connection_canceled = 0}
	Change \{ds_can_download = 0}
	Change \{ds_asset_download_complete = [
		]}
	Change ds_mode = <mode>
	<settings> = ($ds_mode_settings.$ds_mode)
	<target_ds_count> = (<settings>.target_ds_count)
	ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_0}
	<resolved_id> :se_setprops {alpha = 1}
	SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_0 params = {id = <resolved_id> frequency = 2}
	if (<target_ds_count> = 2)
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_1}
		<resolved_id> :se_setprops {alpha = 1}
		SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_1 params = {id = <resolved_id> frequency = 2}
	else
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_1}
		<resolved_id> :se_setprops {alpha = 0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_0}
		<resolved_id> :se_setprops {Pos = (0.0, -50.0) rot_angle = 0}
	endif
	ds_connection_handler_tree :se_setprops instructions_header_text = (<settings>.initial_header_text)
	ds_connection_handler_tree :se_setprops instructions_text = (<settings>.initial_instructions_text)
	set_all_ds_progress_bars_visible \{visible = FALSE}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($ds_connection_device_num) ignore_player_part = true
	add_user_control_helper \{button = red
		text = qs(0xf7723015)
		z = 1000
		controller = $ds_connection_device_num}
	if ($enable_debug = 1)
		add_user_control_helper \{button = orange
			text = qs(0x324f4e66)
			z = 1000
			controller = $ds_connection_device_num}
	endif
	AssignAlias \{id = ds_connection_handler_tree
		alias = current_menu}
	AssignAlias \{id = ds_connection_handler_tree
		alias = ds_event_listener}
	if NOT CD
		if ($enable_debug = 0)
			do_ds_broadcast
		else
			do_ds_debug_options
		endif
	else
		do_ds_broadcast
	endif
	Change \{block_clean_up_user_control_helpers = true}
endscript

script ui_destroy_ds_connection_handler 
	Change \{block_clean_up_user_control_helpers = FALSE}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
	DestroyScreenElement \{id = ds_connection_handler_tree}
	KillSpawnedScript \{id = spawned_script_0}
	KillSpawnedScript \{id = spawned_script_1}
	KillSpawnedScript \{Name = ds_connection_oscillate_alpha}
	clean_up_user_control_helpers
	if GotParam \{cancel}
		cancel_ds_operation
	endif
	SpawnScriptLater \{monitor_controller_signal_strength}
	pop_block_home_button
	removealias \{ds_event_listener}
endscript

script do_generic_cancel_connection 
	SpawnScriptNow do_generic_cancel_connection_spawned params = <...>
endscript

script do_generic_cancel_connection_spawned 
	destroy_dialog_box
	if GotParam \{destroy_popup}
		destroy_generic_popup
	endif
	cancel_ds_operation
	ds_connection_handler_tree :GetTags \{from}
	switch <from>
		case freestyle_band_lobby
		freestyle_band_lobby_close_ds_connect
		case freestyle_mainmenu
		menu_transition_stoprender
		generic_event_back
		case freeplay
		generic_event_back
		default
		ui_event \{event = menu_back
			state = uistate_mainmenu}
	endswitch
endscript

script ui_generic_connection_try_download 
	if ($ds_can_download = 0)
		return
	endif
	Change \{ds_can_download = 0}
	do_ds_download
endscript

script ds_notify_asset_download_complete 
	RequireParams \{[
			ds_number
		]
		all}
	printf 'in ds_notify_asset_download_complete: DS_number = %d' d = <ds_number>
	SetArrayElement ArrayName = ds_asset_download_complete globalarray index = (<ds_number> - 1) NewValue = 1
endscript

script generic_ds_count_change_handler 
	if (<current_ds_count> = 0)
		Change \{ds_can_download = 0}
		Change \{block_clean_up_user_control_helpers = FALSE}
		clean_up_user_control_helpers
		Change \{block_clean_up_user_control_helpers = true}
		add_gamertag_helper exclusive_device = ($ds_connection_device_num) ignore_player_part = true
		add_user_control_helper \{button = red
			text = qs(0xf7723015)
			z = 1000
			controller = $ds_connection_device_num}
		if ($enable_debug = 1)
			add_user_control_helper \{button = orange
				text = qs(0x324f4e66)
				z = 1000
				controller = $ds_connection_device_num}
		endif
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_0}
		<resolved_id> :se_setprops {alpha = 0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_1}
		<resolved_id> :se_setprops {alpha = 0}
		set_all_ds_status_text \{text = qs(0x9b97c7b2)}
		set_all_ds_progress_bars_visible \{visible = FALSE}
	else
		SoundEvent \{event = gigboard_select}
		Change \{ds_can_download = 1}
		Change \{block_clean_up_user_control_helpers = FALSE}
		clean_up_user_control_helpers
		Change \{block_clean_up_user_control_helpers = true}
		add_gamertag_helper exclusive_device = ($ds_connection_device_num) ignore_player_part = true
		add_user_control_helper \{button = green
			text = qs(0x719b7342)
			z = 1000
			controller = $ds_connection_device_num}
		add_user_control_helper \{button = red
			text = qs(0xf7723015)
			z = 1000
			controller = $ds_connection_device_num}
		if ($enable_debug = 1)
			add_user_control_helper \{button = orange
				text = qs(0x324f4e66)
				z = 1000
				controller = $ds_connection_device_num}
		endif
		<ds_number> = 0
		begin
		<ds_name> = ((<ds_infos> [<ds_number>]).ds_name)
		if (<ds_name> != qs(0x00000000))
			set_ds_status_text ds_index = <ds_number> text = qs(0xb08e1137) flash = FALSE
			switch <ds_number>
				case 0
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_0}
				formatText TextName = moo qs(0x4d4555da) s = <ds_name>
				<resolved_id> :se_setprops {alpha = 1 text = <moo>}
				case 1
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_1}
				formatText TextName = moo qs(0x4d4555da) s = <ds_name>
				<resolved_id> :se_setprops {alpha = 1 text = <moo>}
				default
			endswitch
		else
			set_ds_status_text ds_index = <ds_number> text = qs(0x9b97c7b2) flash = true
		endif
		<ds_number> = (<ds_number> + 1)
		repeat (<target_ds_count>)
		if (<current_ds_count> = <target_ds_count>)
			do_ds_download
		endif
	endif
endscript

script generic_ds_download_cancellation_handler 
	ds_connection_handler_tree :GetTags \{from}
	switch <from>
		case freestyle_band_lobby
		freestyle_band_lobby_close_ds_connect
		default
		ui_event \{event = menu_refresh}
	endswitch
endscript

script generic_ds_connect_cancellation_handler 
	ds_connection_handler_tree :GetTags \{from}
	switch <from>
		case freestyle_band_lobby
		freestyle_band_lobby_close_ds_connect
		default
		ui_event \{event = menu_refresh}
	endswitch
endscript

script generic_ds_connection_complete_handler 
	Wait \{5
		gameframe}
	if ($ds_connection_device_num >= 0)
		<device_num> = ($ds_connection_device_num)
	endif
	switch ($ds_mode)
		case roadie_battle
		menu_transition_stoprender
		ui_event event = menu_replace data = {state = uistate_band_lobby_setup device_num = <device_num> roadie_battle}
		case freestyle
		wiidscommunication :sendmessage \{set_holding_mode}
		wiidscommunication :sendmessage \{set_lobby_status
			is_joined = 1}
		Change \{freestyle_ds_has_disconnected = FALSE}
		ds_connection_handler_tree :GetTags \{from}
		switch <from>
			case freestyle_band_lobby
			freestyle_band_lobby_ds_connection_complete
			default
			ui_event \{event = menu_back}
		endswitch
		case audience_party
		audience_party_init
		ds_connection_handler_tree :GetTags \{from}
		switch <from>
			case main_menu
			main_menu_select_freeplay device_num = <device_num>
			case freeplay
			audience_party_start_game \{reset_time = 0}
			gman_songtool_getcurrentsong
			audience_party_send_song_info send_song = <current_song> send_true_song_duration
			ui_event \{event = menu_back}
			default
			ui_event \{event = menu_back}
		endswitch
		default
		printf \{qs(0x81efaea0)}
		ui_event \{event = menu_back}
	endswitch
endscript

script generic_ds_communication_error_handler 
	switch <error_type>
		case broadcast
		<msg_text> = qs(0xc9b91eb0)
		default
		<msg_text> = qs(0xccf81252)
	endswitch
	<title_text> = qs(0x79597197)
	cancel_ds_operation
	LaunchEvent \{Type = unfocus
		target = ds_connection_handler_tree}
	Change \{block_clean_up_user_control_helpers = FALSE}
	create_dialog_box {
		player_device = ($ds_connection_device_num)
		heading_text = <title_text>
		body_text = <msg_text>
		options = [
			{
				func = do_generic_cancel_connection
				func_params = {}
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
	}
endscript

script ds_debug_popup_choose 
	SpawnScriptNow ds_debug_popup_choose_spawned params = {func = <func> func_params = <func_params>}
endscript

script ds_debug_popup_choose_spawned 
	destroy_generic_popup
	<func> <func_params>
endscript

script do_ds_broadcast 
	SpawnScriptNow do_ds_broadcast_spawned id = ds_broadcast_script params = <...>
endscript

script do_ds_broadcast_spawned 
	KillSpawnedScript \{Name = do_ds_download_spawned}
	KillSpawnedScript \{Name = do_ds_connect_spawned}
	<mode> = ($ds_mode)
	<settings> = ($ds_mode_settings.<mode>)
	ds_connection_handler_tree :GetTags \{from}
	if (<from> = freestyle_band_lobby)
		LaunchEvent \{Type = focus
			target = ds_connection_handler_tree}
	endif
	getconsolenickname
	if NOT GotParam \{console_nickname}
		<console_nickname> = qs(0xf5e8ed8b)
	endif
	disconnect_network_wait
	if ($ds_mode = audience_party)
		wait_for_song_to_begin
	endif
	if NOT wiidscommunication :broadcastdownload <settings> server_name = <console_nickname>
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	Wait \{1
		gameframe}
	Change \{ds_state = broadcasting}
	<last_count> = -1
	begin
	wiidscommunication :getstatus
	if NOT (<error> = 0)
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	if (<current_ds_count> != <last_count>)
		<ds_infos> = []
		<i> = 1
		<ds_params> = {
			current_ds_count = <current_ds_count>
			target_ds_count = <target_ds_count>
		}
		begin
		formatText checksumName = ds_name_var 'DS_Name%i' i = <i>
		if GotParam <ds_name_var>
			<dsnametmp> = (<...>.<ds_name_var>)
			<ds_infos> = (<ds_infos> + {ds_name = <dsnametmp>})
		else
			<ds_infos> = (<ds_infos> + {ds_name = qs(0x00000000)})
		endif
		<dsnametmp> = qs(0x00000000)
		<i> = (<i> + 1)
		repeat (<target_ds_count>)
		Change ds_infos = <ds_infos>
		<last_count> = <current_ds_count>
		<ds_params> = (<ds_params> + {ds_infos = <ds_infos>})
		LaunchEvent Type = ds_count_change data = <ds_params> target = ds_event_listener
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script do_ds_download 
	Change \{ds_can_download = 0}
	SpawnScriptNow do_ds_download_spawned params = <...>
endscript

script do_ds_download_spawned 
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_connect_spawned}
	dlc_reset_loading
	if NOT wiidscommunication :senddownload
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	Change \{ds_state = downloading}
	SoundEvent \{event = gigboard_select_back}
	<settings> = ($ds_mode_settings.$ds_mode)
	ds_connection_handler_tree :se_setprops instructions_header_text = (<settings>.header_text)
	ds_connection_handler_tree :se_setprops instructions_text = (<settings>.instructions_text)
	ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_0}
	<ds_bottom_text_0_id> = <resolved_id>
	ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_1}
	<ds_bottom_text_1_id> = <resolved_id>
	begin
	if ScriptIsRunning \{ds_connection_oscillate_alpha}
		KillSpawnedScript \{Name = ds_connection_oscillate_alpha}
	else
		break
	endif
	repeat
	ds_connection_handler_tree :desc_resolvealias \{Name = 0x305cecd7}
	wiidscommunication :getstatus
	if (<target_ds_count> < 2)
		<ds_bottom_text_1_id> :se_setprops {alpha = 0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_1}
		<resolved_id> :se_setprops {alpha = 0} time = 0.5 motion = smooth
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_0}
		<resolved_id> :se_setprops {Pos = (0.0, -50.0) rot_angle = 0 time = 0.5 motion = smooth}
		ds_connection_handler_tree :desc_resolvealias \{Name = 0x475bdc41}
		<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 3 start_dims = (5.0, 5.0)}
	endif
	set_all_ds_status_text \{text = qs(0xd778c770)}
	set_all_ds_progress_bars_visible \{visible = true}
	Change \{block_clean_up_user_control_helpers = FALSE}
	clean_up_user_control_helpers
	Change \{block_clean_up_user_control_helpers = true}
	add_gamertag_helper exclusive_device = ($ds_connection_device_num) ignore_player_part = true
	add_user_control_helper \{button = red
		text = qs(0xf7723015)
		z = 1000
		controller = $ds_connection_device_num}
	if ($enable_debug = 1)
		add_user_control_helper \{button = orange
			text = qs(0x324f4e66)
			z = 1000
			controller = $ds_connection_device_num}
	endif
	begin
	wiidscommunication :getstatus
	if NOT (<error> = 0)
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	set_all_ds_progress_bars progress = <download_progress>
	if (<state> = download_complete)
		Change \{freestyle_stage_manager_ds = true}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	dlc_reset_loading
	wiidscommunication :getstatus
	if NOT wiidscommunication :disconnect \{enable_network = FALSE}
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	Wait \{1
		gameframe}
	do_ds_connect target_ds_count = <target_ds_count>
endscript

script ds_download_cancel 
	SoundEvent \{event = gigboard_select_back}
	LaunchEvent \{Type = ds_download_cancellation
		target = ds_event_listener}
endscript

script ds_connect_cancel 
	SoundEvent \{event = gigboard_select_back}
	destroy_generic_popup
	LaunchEvent \{Type = ds_connect_cancellation
		target = ds_event_listener}
endscript

script debug_skip_ds_download 
	if NOT wiidscommunication :disconnect
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	do_ds_connect target_ds_count = <target_ds_count>
endscript

script do_ds_connect 
	SpawnScriptNow do_ds_connect_spawned params = <...>
endscript

script do_ds_connect_spawned 
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_download_spawned}
	dlc_reset_loading
	if (<target_ds_count> = 1)
		Change \{ds_asset_download_complete = [
				0
			]}
	else
		Change \{ds_asset_download_complete = [
				0
				0
			]}
	endif
	<mode> = ($ds_mode)
	<settings> = ($ds_mode_settings.<mode>)
	getconsolenickname
	if NOT GotParam \{console_nickname}
		<console_nickname> = qs(0xf5e8ed8b)
	endif
	disconnect_network_wait
	if NOT wiidscommunication :connect target_ds_count = <target_ds_count> ggid = (<settings>.ggid) host_name = <console_nickname>
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	set_all_ds_progress_bars \{progress = 0}
	set_all_ds_progress_bars_visible \{visible = FALSE}
	set_all_ds_status_text \{text = qs(0xa4d1f3c3)}
	Change \{ds_asset_download_started = FALSE}
	GetStartTime
	Change \{ds_state = connecting}
	begin
	wiidscommunication :getstatus
	getelapsedtime starttime = <starttime>
	if ((<error> != 0) || (<ElapsedTime> > 15000))
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	printf qs(0x340b3dd6) t = <target_ds_count>
	printf qs(0x707a153a) t = <current_ds_count>
	if (<current_ds_count> = <target_ds_count>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wiidscommunication :sendmessage set_mode mode = <mode>
	set_all_ds_status_text \{text = qs(0x9f5ae44e)}
	set_all_ds_progress_bars \{progress = 0}
	set_all_ds_progress_bars_visible \{visible = true}
	GetArraySize \{$ds_asset_download_complete}
	begin
	<complete> = 1
	<i> = 0
	begin
	if NOT (($ds_asset_download_complete [<i>]) = 1)
		<complete> = 0
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<complete> = 1)
		break
	else
		if ($ds_asset_download_started = true)
			getelapsedtime starttime = ($ds_asset_download_starttime)
			0x4fa9da3a = (<ElapsedTime> / $ds_asset_download_estimatedduration)
			if (<0x4fa9da3a> > $ds_max_asset_download_percentage)
				0x4fa9da3a = ($ds_max_asset_download_percentage)
			endif
			set_all_ds_progress_bars progress = (<0x4fa9da3a> * 100)
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if ($ds_mode = audience_party)
		sdcardmanagerfunc \{func = force_handle_events}
		dlccatalogmanagerfunc \{func = load_catalogs}
	endif
	set_all_ds_progress_bars \{progress = 100}
	Wait \{1
		Second}
	if ($ds_mode = audience_party)
		begin
		if NOT dlccatalogmanagerfunc \{func = is_busy}
			break
		endif
		WaitOneGameFrame
		repeat
		set_all_ds_status_text \{text = qs(0xeeb00467)}
		set_all_ds_progress_bars \{progress = 0}
		set_all_ds_progress_bars_visible \{visible = true}
		audience_party_count_all_songs
		SpawnScriptNow \{audience_party_send_all_song_info}
		begin
		Wait \{1
			Frame}
		if ($audience_party_total_song_list_sent < $audience_party_total_song_list_size)
			progress = (($audience_party_total_song_list_sent / ($audience_party_total_song_list_size * 1.0)) * 100)
			set_all_ds_progress_bars progress = <progress>
		else
			break
		endif
		repeat
	endif
	LaunchEvent \{Type = ds_connection_complete
		target = ds_event_listener}
	Change \{ds_state = connected}
endscript

script cancel_ds_operation 
	SpawnScriptNow cancel_ds_operation_spawned params = <...>
endscript

script cancel_ds_operation_spawned 
	wiidscommunication :disconnect
	Change \{ds_state = None}
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_download_spawned}
	KillSpawnedScript \{Name = do_ds_connect_spawned}
	ds_connection_exit
endscript

script ds_connection_exit 
	if GotParam \{error}
		Change ds_connection_error = <error>
	endif
	if GotParam \{canceled}
		Change ds_connection_canceled = <canceled>
	endif
endscript

script ds_disconnect_callback 
	printf \{'========================================='}
	printf \{'==== inside DS_DISCONNECT_CALLBACK'}
	printf \{'========================================='}
	begin
	ui_event_wait_for_safe
	event_launched = 0
	if ScreenElementExists \{id = ds_event_listener}
		LaunchEvent \{Type = ds_disconnect
			target = ds_event_listener}
		<event_launched> = 1
	endif
	if ScreenElementExists \{id = ds_catcher}
		LaunchEvent \{Type = ds_disconnect
			target = ds_catcher}
		<event_launched> = 1
	endif
	if (<event_launched> = 1)
		break
	endif
	Wait \{0.25
		Seconds}
	repeat 5
	if (<event_launched> = 0)
		pausegh3
		generic_ds_communication_error_handler
		unpausegh3
	endif
endscript

script get_current_ds_count 
	wiidscommunication :getstatus
	return current_ds_count = <current_ds_count>
endscript

script ds_connection_helper \{mode = roadie_battle
		from = NULL
		event = menu_change}
	if (<from> = freestyle_mainmenu)
		menu_transition_stoprender
	endif
	ui_event event = <event> state = uistate_ds_connection_handler data = {mode = <mode> from = <from> device_num = <device_num>}
endscript

script end_ds_comm 
	wiidscommunication :disconnect
endscript

script ds_connection_oscillate_alpha \{frequency = 1}
	Duration = ((1.0 / <frequency>) / 2)
	begin
	<id> :se_setprops {
		alpha = 0
		time = <Duration>
	}
	Wait <Duration> Seconds
	<id> :se_setprops {
		alpha = 1
		time = <Duration>
	}
	Wait <Duration> Seconds
	repeat
endscript

script disconnect_network_wait 
	disablenetwork
	suspendwiiconnect24
	begin
	printf \{'Waiting for Network to disable'}
	Wait \{1
		Frame}
	if ((isnetworkdisabled) && (iswiiconnect24suspended))
		break
	endif
	repeat
endscript

script monitor_controller_signal_strength 
	num_checks = (15 * 60)
	poor_signal_threshold = 10
	hits_to_drop = (<num_checks> * 0.2)
	begin
	hits_below_threshold = [0 0 0 0]
	begin
	controller = 0
	begin
	if getcontrollersignalstrength controller = <controller>
		if (<signal_strength> <= <poor_signal_threshold>)
			hit_count = (<hits_below_threshold> [<controller>] + 1)
			printf 'Controller %c poor signal hit %h' c = <controller> h = <hit_count>
			SetArrayElement ArrayName = hits_below_threshold index = <controller> NewValue = <hit_count>
			if (<hit_count> >= <hits_to_drop>)
				printf 'Turning off controller %c due to poor signal' c = <controller>
				turnoffcontroller controller = <controller>
			endif
		endif
	endif
	<controller> = (<controller> + 1)
	repeat 4
	Wait \{1
		Frame}
	repeat <num_checks>
	repeat
endscript

script set_ds_status_text \{flash = true}
	RequireParams \{[
			ds_index
			text
		]
		all}
	formatText checksumName = script_id 'spawned_script_%d' d = <ds_index>
	formatText checksumName = text_id 'alias_search_indicator_text_%d' d = <ds_index>
	KillSpawnedScript id = <script_id>
	ds_connection_handler_tree :desc_resolvealias Name = <text_id>
	<resolved_id> :se_setprops {alpha = 1 text = <text>}
	if (<flash> = true)
		SpawnScriptNow ds_connection_oscillate_alpha id = <script_id> params = {id = <resolved_id> frequency = 2}
	endif
endscript

script set_all_ds_status_text 
	set_ds_status_text ds_index = 0 <...>
	set_ds_status_text ds_index = 1 <...>
endscript

script set_ds_progress_bar 
	RequireParams \{[
			ds_index
			progress
		]
		all}
	formatText checksumName = 0xbc247836 'progress_scale_%d' d = <ds_index>
	percentage = ((<progress> * 1.0) / 100)
	new_scale = (((1.0, 0.0) * <percentage>) + (0.0, 1.0))
	props = {}
	setstructureparam struct_name = props param = <0xbc247836> value = <new_scale>
	ds_connection_handler_tree :se_setprops <props>
endscript

script set_all_ds_progress_bars 
	RequireParams \{[
			progress
		]
		all}
	set_ds_progress_bar ds_index = 0 <...>
	set_ds_progress_bar ds_index = 1 <...>
endscript

script set_ds_progress_bar_visible 
	RequireParams \{[
			ds_index
			visible
		]
		all}
	formatText checksumName = bar_id 'alias_load_bar_%d' d = <ds_index>
	formatText checksumName = backing_id 'alias_load_bar_backing_%d' d = <ds_index>
	if (<visible> = true)
		ds_connection_handler_tree :desc_resolvealias Name = <bar_id>
		<resolved_id> :se_setprops unhide
		ds_connection_handler_tree :desc_resolvealias Name = <backing_id>
		<resolved_id> :se_setprops unhide
	else
		ds_connection_handler_tree :desc_resolvealias Name = <bar_id>
		<resolved_id> :se_setprops Hide
		ds_connection_handler_tree :desc_resolvealias Name = <backing_id>
		<resolved_id> :se_setprops Hide
	endif
endscript

script set_all_ds_progress_bars_visible 
	RequireParams \{[
			visible
		]
		all}
	set_ds_progress_bar_visible ds_index = 0 <...>
	set_ds_progress_bar_visible ds_index = 1 <...>
endscript

script notify_ds_asset_download_started 
	RequireParams \{[
			file_size
		]
		all}
	if ($ds_asset_download_started = FALSE)
		GetStartTime
		Change \{ds_asset_download_started = true}
		Change ds_asset_download_starttime = <starttime>
		estimated_duration_secs = ((<file_size> * $ds_max_asset_download_percentage) / $ds_estimated_download_rate)
		Change ds_asset_download_estimatedduration = (<estimated_duration_secs> * 1000.0)
	endif
endscript

script wait_for_song_to_begin 
	begin
	if istransitionplaying \{Type = fastintro}
		Wait \{1
			Frame}
	else
		break
	endif
	repeat
endscript

script ds_connection_should_disc_eject_cause_disconnect 
	switch ($ds_state)
		case downloading
		case connecting
		return \{true}
	endswitch
	return \{FALSE}
endscript
