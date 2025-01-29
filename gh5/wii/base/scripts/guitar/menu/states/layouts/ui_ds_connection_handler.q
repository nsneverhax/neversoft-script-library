ds_mode_settings = {
	freestyle = {
		target_ds_count = 1
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4196484
		program_title = qs(0xe7934624)
		program_comment = qs(0xd79f36b9)
		initial_header_text = qs(0x841a61ed)
		initial_instructions_text = qs(0xd94ade9d)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0x973562b5)
	}
	roadie_battle = {
		target_ds_count = 2
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4196484
		program_title = qs(0xe7934624)
		program_comment = qs(0xac560c65)
		initial_header_text = qs(0x841a61ed)
		initial_instructions_text = qs(0x9816e56b)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0x84020d67)
	}
	audience_party = {
		target_ds_count = 1
		connection_type = download
		multiboot_path = 'gh5w_ds_multiboot.srl'
		multiboot_heap = quota_samples
		ggid = 4196484
		program_title = qs(0x12c9e187)
		program_comment = qs(0xadda5b1f)
		initial_header_text = qs(0x841a61ed)
		initial_instructions_text = qs(0xd94ade9d)
		header_text = qs(0x6196617d)
		instructions_text = qs(0x45acc60b)
	}
	career_linking = {
		target_ds_count = 1
		connection_type = connect
		ggid = 4196482
		initial_header_text = qs(0x841a61ed)
		initial_instructions_text = qs(0x4c1271a9)
		header_text = qs(0xe96608fe)
		instructions_text = qs(0x4c1271a9)
	}
}
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
	if GotParam \{device_num}
		Change ds_connection_device_num = <device_num>
	else
		Change \{ds_connection_device_num = -1}
	endif
	CreateScreenElement \{parent = root_window
		id = ds_connection_handler_tree
		Type = descinterface
		desc = 'ds_connection_handler_tree'
		event_handlers = [
			{
				pad_back
				do_generic_cancel_connection
			}
			{
				pad_choose
				ui_generic_connection_try_download
			}
			{
				pad_L1
				do_ds_debug_options
			}
			{
				ds_count_change
				generic_ds_count_change_handler
			}
			{
				ds_communication_error
				generic_ds_communication_error_handler
			}
			{
				ds_download_cancellation
				generic_ds_download_cancellation_handler
			}
			{
				ds_connect_cancellation
				generic_ds_connect_cancellation_handler
			}
			{
				ds_connection_complete
				generic_ds_connection_complete_handler
			}
			{
				ds_disconnect
				generic_ds_communication_error_handler
			}
		]
		z_priority = 100}
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
		<resolved_id> :se_setprops {Pos = (-475.0, -151.0) rot_angle = 0}
	endif
	ds_connection_handler_tree :se_setprops instructions_header_text = (<settings>.initial_header_text)
	ds_connection_handler_tree :se_setprops instructions_text = (<settings>.initial_instructions_text)
	add_user_control_helper \{button = red
		text = qs(0xf7723015)
		z = 1000}
	if ($enable_debug = 1)
		add_user_control_helper \{button = orange
			text = qs(0x324f4e66)
			z = 1000}
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
endscript

script ui_destroy_ds_connection_handler 
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
		clean_up_user_control_helpers
		add_user_control_helper \{button = red
			text = qs(0xf7723015)
			z = 1000}
		if ($enable_debug = 1)
			add_user_control_helper \{button = orange
				text = qs(0x324f4e66)
				z = 1000}
		endif
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_0}
		<resolved_id> :se_setprops {alpha = 0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_1}
		<resolved_id> :se_setprops {alpha = 0}
		KillSpawnedScript \{id = spawned_script_0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_0}
		<resolved_id> :se_setprops {alpha = 1 text = qs(0xabaabdde)}
		SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_0 params = {id = <resolved_id> frequency = 2}
		KillSpawnedScript \{id = spawned_script_1}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_1}
		<resolved_id> :se_setprops {alpha = 1 text = qs(0xabaabdde)}
		SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_1 params = {id = <resolved_id> frequency = 2}
	else
		SoundEvent \{event = gigboard_select}
		Change \{ds_can_download = 1}
		clean_up_user_control_helpers
		add_user_control_helper \{button = green
			text = qs(0x719b7342)
			z = 1000}
		add_user_control_helper \{button = red
			text = qs(0xf7723015)
			z = 1000}
		if ($enable_debug = 1)
			add_user_control_helper \{button = orange
				text = qs(0x324f4e66)
				z = 1000}
		endif
		<ds_number> = 0
		begin
		<ds_name> = ((<ds_infos> [<ds_number>]).ds_name)
		if (<ds_name> != qs(0x00000000))
			switch <ds_number>
				case 0
				KillSpawnedScript \{id = spawned_script_0}
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_0}
				<resolved_id> :se_setprops {text = qs(0x0d119c9b) alpha = 1}
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_0}
				formatText TextName = moo qs(0x4d4555da) s = <ds_name>
				<resolved_id> :se_setprops {alpha = 1 text = <moo>}
				case 1
				KillSpawnedScript \{id = spawned_script_1}
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_1}
				<resolved_id> :se_setprops {text = qs(0x0d119c9b) alpha = 1}
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_found_indicator_text_1}
				formatText TextName = moo qs(0x4d4555da) s = <ds_name>
				<resolved_id> :se_setprops {alpha = 1 text = <moo>}
				default
			endswitch
			<ds_number> = (<ds_number> + 1)
		else
			switch <ds_number>
				case 0
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_0}
				<resolved_id> :se_setprops {text = qs(0xabaabdde) alpha = 1}
				SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_0 params = {id = <resolved_id> frequency = 2}
				case 1
				ds_connection_handler_tree :desc_resolvealias \{Name = alias_search_indicator_text_1}
				<resolved_id> :se_setprops {text = qs(0xabaabdde) alpha = 1}
				SpawnScriptNow ds_connection_oscillate_alpha id = spawned_script_1 params = {id = <resolved_id> frequency = 2}
			endswitch
		endif
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
	switch ($ds_mode)
		case roadie_battle
		if ($ds_connection_device_num >= 0)
			<device_num> = ($ds_connection_device_num)
		endif
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
		default
		printf \{qs(0x81efaea0)}
		ui_event \{event = menu_back}
	endswitch
endscript

script generic_ds_communication_error_handler 
	switch <error_type>
		case broadcast
		<msg_text> = qs(0x52e8131f)
		default
		<msg_text> = qs(0xccf81252)
	endswitch
	<title_text> = qs(0x79597197)
	cancel_ds_operation
	LaunchEvent \{Type = unfocus
		target = ds_connection_handler_tree}
	create_dialog_box {
		use_all_controllers
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
	dlc_update_loading
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
	<ds_bottom_text_0_id> :se_setprops {alpha = 1 text = qs(0xf4b1f85e)}
	SpawnScriptNow ds_connection_oscillate_alpha params = {id = <ds_bottom_text_0_id> frequency = 2}
	wiidscommunication :getstatus
	if (<target_ds_count> < 2)
		<ds_bottom_text_1_id> :se_setprops {alpha = 0}
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_1}
		<resolved_id> :se_setprops {alpha = 0} time = 0.5 motion = smooth
		ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_indicator_container_0}
		<resolved_id> :se_setprops {Pos = (-475.0, -151.0) rot_angle = 0 time = 0.5 motion = smooth}
	else
		<ds_bottom_text_1_id> :se_setprops {alpha = 1 text = qs(0xf4b1f85e)}
		SpawnScriptNow ds_connection_oscillate_alpha params = {id = <ds_bottom_text_1_id> frequency = 2}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = qs(0xf7723015)
		z = 1000}
	if ($enable_debug = 1)
		add_user_control_helper \{button = orange
			text = qs(0x324f4e66)
			z = 1000}
	endif
	begin
	wiidscommunication :getstatus
	if NOT (<error> = 0)
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	if GotParam \{ds_dlprogress1}
		percentage = ((<download_progress> * 1.0) / 100)
		new_scale = (((1.0, 0.0) * <percentage>) + (0.0, 1.0))
		ds_connection_handler_tree :se_setprops {
			progress_scale_0 = <new_scale>
		}
	endif
	if GotParam \{ds_dlprogress2}
		percentage = ((<download_progress> * 1.0) / 100)
		new_scale = (((1.0, 0.0) * <percentage>) + (0.0, 1.0))
		ds_connection_handler_tree :se_setprops {
			progress_scale_1 = <new_scale>
		}
	endif
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
	LaunchEvent \{Type = ds_download_cancellation
		target = ds_event_listener}
endscript

script ds_connect_cancel 
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
	formatText TextName = connect_text qs(0x88066116) s = <console_nickname>
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
	dlc_update_loading
	Wait \{1
		gameframe}
	repeat
	wiidscommunication :sendmessage set_mode mode = <mode>
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
	endif
	Wait \{1
		gameframe}
	repeat
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
		from = NULL}
	ui_event event = menu_change state = uistate_ds_connection_handler data = {mode = <mode> from = <from>}
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
