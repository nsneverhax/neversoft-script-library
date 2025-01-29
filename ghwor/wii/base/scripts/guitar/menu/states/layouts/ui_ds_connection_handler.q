ds_no_assert_on_bad_send_data = 1
ds_mode_settings = {
	roadie_battle = {
		target_ds_count = 4
		connection_type = download
		multiboot_paths = {
			na = 'gh6w_ds_multiboot_rb_na.srl'
			eu = 'gh6w_ds_multiboot_rb_eu.srl'
		}
		multiboot_heap = quota_animations
		download_ggids = {
			na = 4198982
			eu = 8389981
		}
		communication_ggids = {
			na = 4198742
			eu = 8389916
		}
		program_title = qs(0xbe60453e)
		program_comment = qs(0x93788ce6)
		initial_header_text = qs(0xfb4ec88a)
		initial_instructions_text = qs(0xc2ee0c86)
		header_text = qs(0x03ac90f0)
		instructions_text = qs(0x03ac90f0)
		instruction_page_alpha_props = [
			roadie_battle_instructions_1_alpha
			roadie_battle_instructions_2_alpha
			roadie_battle_instructions_3_alpha
		]
	}
	audience_party = {
		target_ds_count = 1
		connection_type = download
		multiboot_paths = {
			na = 'gh6w_ds_multiboot_ap_na.srl'
			eu = 'gh6w_ds_multiboot_ap_eu.srl'
		}
		multiboot_heap = quota_misc
		download_ggids = {
			na = 4198983
			eu = 8389982
		}
		communication_ggids = {
			na = 4198743
			eu = 8389917
		}
		program_title = qs(0xbe60453e)
		program_comment = qs(0x3a2b0b69)
		initial_header_text = qs(0xfb4ec88a)
		initial_instructions_text = qs(0xd898747d)
		header_text = qs(0xf9168c7c)
		instructions_text = qs(0xa8601576)
	}
}
ds_estimated_download_rate = 20000
ds_max_asset_download_percentage = 0.9
ds_maximum_connected_count = 4
ds_switch_instruction_page_time_secs = 1.0
ds_min_players_for_roadie_battle = 2
ds_state = None
ds_mode = None
ds_connection_error = 0
ds_connection_canceled = 0
ds_connection_device_num = -1
ds_asset_download_complete = [
]
ds_infos = [
]
ds_can_download = 0
ds_asset_download_started = FALSE
ds_asset_download_starttime = 0
ds_asset_download_estimatedduration = 0
ds_debug_skipped_connection = FALSE
ds_instruction_page_showing = 0
ds_instruction_page_count = 0

script ds_get_region 
	if (isnabuild)
		return \{region = na}
	else
		return \{region = eu}
	endif
endscript

script ui_create_ds_connection_handler \{from = standard}
	KillSpawnedScript \{Name = monitor_controller_signal_strength}
	push_block_home_button
	sdcardmanagerfunc \{func = force_hold_ejects}
	push_disable_wii_invites_menu
	if GotParam \{device_num}
		Change ds_connection_device_num = <device_num>
	else
		Change ds_connection_device_num = ($primary_controller)
	endif
	Change \{ds_state = None}
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
		tags = {
			from = <from>
		}
	}
	AssignAlias \{id = ds_connection_handler_tree
		alias = current_menu}
	AssignAlias \{id = ds_connection_handler_tree
		alias = ds_event_listener}
	if NOT ds_connection_handler_tree :desc_resolvealias \{Name = alias_ds_container}
		ScriptAssert \{'unable to resolve alias_ds_container'}
	endif
	AssignAlias id = <resolved_id> alias = ds_container
	Change \{ds_connection_error = 0}
	Change \{ds_connection_canceled = 0}
	Change \{ds_can_download = 0}
	Change \{ds_asset_download_complete = [
		]}
	Change ds_mode = <mode>
	<settings> = ($ds_mode_settings.$ds_mode)
	<target_ds_count> = (<settings>.target_ds_count)
	<ds> = 0
	begin
	if (<ds> < <target_ds_count>)
		set_ds_status_text ds_index = <ds> text = qs(0x9b97c7b2) flash = true
		set_ds_name_text ds_index = <ds> text = ''
	else
		set_ds_container_visible ds_index = <ds> visible = FALSE
	endif
	<ds> = (<ds> + 1)
	repeat $ds_maximum_connected_count
	ds_connection_handler_tree :se_setprops instructions_header_text = (<settings>.initial_header_text)
	ds_connection_handler_tree :se_setprops instructions_text = (<settings>.initial_instructions_text)
	set_all_ds_progress_bars_visible \{visible = FALSE}
	create_ds_connection_user_control_helpers \{show_continue = FALSE}
	do_ds_broadcast
	Change \{block_clean_up_user_control_helpers = true}
	destroy_friend_feed
endscript

script ui_destroy_ds_connection_handler 
	Change \{block_clean_up_user_control_helpers = FALSE}
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
	DestroyScreenElement \{id = ds_connection_handler_tree}
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_download_spawned}
	KillSpawnedScript \{Name = do_ds_connect_spawned}
	clean_up_user_control_helpers
	SpawnScriptLater \{monitor_controller_signal_strength}
	pop_block_home_button
	pop_disable_wii_invites_menu
endscript

script do_generic_cancel_connection 
	SpawnScriptNow do_generic_cancel_connection_spawned params = <...>
endscript

script do_generic_cancel_connection_spawned 
	destroy_dialog_box
	if GotParam \{destroy_popup}
		destroy_dialog_box
	endif
	cancel_ds_operation
	ds_connection_handler_tree :GetTags \{from}
	switch <from>
		default
		generic_event_back
	endswitch
endscript

script ui_generic_connection_try_download 
	if ($ds_can_download = 0)
		return
	endif
	if ds_need_more_players_for_roadie_battle
		create_dialog_box {
			player_device = ($ds_connection_device_num)
			heading_text = qs(0x12b85493)
			body_text = qs(0xf82473cd)
			back_button_script = ui_ds_need_more_players_back
			options = [
				{
					func = ui_ds_need_more_players_back
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	Change \{ds_can_download = 0}
	do_ds_download
endscript

script ui_ds_need_more_players_back 
	ui_sfx \{menustate = Generic
		uitype = back}
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_menu}
	create_ds_connection_user_control_helpers \{show_continue = true}
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
		create_ds_connection_user_control_helpers \{show_continue = FALSE}
		set_all_ds_status_text \{text = qs(0x9b97c7b2)}
		set_ds_name_text \{ds_index = 0
			text = ''}
		set_all_ds_progress_bars_visible \{visible = FALSE}
	else
		SoundEvent \{event = audio_ui_career_medallion_fill_fast}
		Change \{ds_can_download = 1}
		create_ds_connection_user_control_helpers \{show_continue = true}
		<ds_number> = 0
		begin
		if (((<ds_infos> [<ds_number>]).connected) = true)
			set_ds_status_text ds_index = <ds_number> text = qs(0xb08e1137) flash = FALSE
			set_ds_name_text ds_index = <ds_number> text = ((<ds_infos> [<ds_number>]).Name)
		else
			set_ds_status_text ds_index = <ds_number> text = qs(0x9b97c7b2) flash = true
			set_ds_name_text ds_index = <ds_number> text = ''
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
		default
		ui_event \{event = menu_refresh}
	endswitch
endscript

script generic_ds_connect_cancellation_handler 
	ds_connection_handler_tree :GetTags \{from}
	switch <from>
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
	wiidscommunication :lockchildren
	wiidscommunication :getstatus
	Change ds_infos = <ds_info>
	switch ($ds_mode)
		case roadie_battle
		roadie_battle_enter
		roadie_battle_connected
		roadie_battle_goto_lobby device_num = <device_num>
		case audience_party
		audience_party_init
		wiidscommunication :sendmessage \{set_holding_mode}
		ds_connection_handler_tree :GetTags \{from}
		switch (<from>)
			case main_menu
			help_select_audience_party next_func = main_menu_select_freeplay device_num = <device_num>
			case mode_select
			help_select_audience_party next_func = main_menu_select_freeplay device_num = <device_num>
			case freeplay
			push_disable_globaltag_freeplay_check
			help_select_audience_party next_func = freeplay_to_audience_party device_num = <device_num>
			default
			ui_event \{event = menu_back}
		endswitch
		default
		ScriptAssert \{qs(0xf8f8165e)
			s = $ds_mod}
		ui_event \{event = menu_back}
	endswitch
endscript

script help_select_audience_party \{next_func = !q1768515945
		device_num = !i1768515945}
	Change g_net_leader_player_num = (<device_num> + 1)
	universal_help_display_help_check help_context = roadiesetlist_to_gameplay device_num = ($primary_controller)
	if (<show_help_page> = 1)
		generic_event_replace {
			state = uistate_universal_help
			band_lobby_continue_sfx
			data = {
				next_state_script = <next_func>
				next_state_params = {
					device_num = <device_num>
				}
				device_num = <device_num>
				help_global_index = <help_index>
			}
		}
	else
		<next_func> device_num = <device_num>
	endif
endscript

script freeplay_to_audience_party 
	pop_disable_globaltag_freeplay_check
	audience_party_start_game \{reset_time = 0}
	playlist_getcurrentsong
	audience_party_send_song_info send_song = <current_song> send_true_song_duration
	ui_event \{event = menu_back
		state = Uistate_gameplay}
endscript

script generic_ds_communication_error_handler 
	switch <error_type>
		case broadcast
		<msg_text> = qs(0xc9b91eb0)
		default
		<msg_text> = qs(0xccf81252)
	endswitch
	<title_text> = qs(0xdc4ea2ad)
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
				func = ds_communication_error_continue
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

script ds_communication_error_continue 
	destroy_dialog_box
	ui_event \{event = menu_refresh}
endscript

script ds_debug_popup_choose 
	SpawnScriptNow ds_debug_popup_choose_spawned params = {func = <func> func_params = <func_params>}
endscript

script ds_debug_popup_choose_spawned 
	destroy_dialog_box
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
	getconsolenickname
	if NOT GotParam \{console_nickname}
		<console_nickname> = qs(0xf5e8ed8b)
	endif
	set_all_ds_status_text \{text = qs(0xa4d1f3c3)}
	disconnect_network_wait
	if ($ds_mode = audience_party)
		wait_for_song_to_begin
	endif
	ds_get_region
	<ggid> = (<settings>.download_ggids.<region>)
	<path> = (<settings>.multiboot_paths.<region>)
	if NOT wiidscommunication :broadcastdownload {
			ggid = <ggid>
			multiboot_path = <path>
			target_ds_count = (<settings>.target_ds_count)
			program_title = (<settings>.program_title)
			program_comment = (<settings>.program_comment)
			multiboot_heap = (<settings>.multiboot_heap)
			server_name = <console_nickname>
		}
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	Wait \{1
		gameframe}
	set_all_ds_status_text \{text = qs(0x9b97c7b2)}
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
		<i> = 1
		<ds_params> = {
			current_ds_count = <current_ds_count>
			target_ds_count = <target_ds_count>
		}
		Change ds_infos = <ds_info>
		<last_count> = <current_ds_count>
		<ds_params> = (<ds_params> + {ds_infos = <ds_info>})
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
	if NOT wiidscommunication :senddownload
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	Change \{ds_state = downloading}
	SoundEvent \{event = audio_ui_generic_select}
	<settings> = ($ds_mode_settings.$ds_mode)
	ds_connection_handler_tree :se_setprops instructions_header_text = (<settings>.header_text)
	ds_connection_handler_tree :se_setprops instructions_text = (<settings>.instructions_text)
	if StructureContains structure = <settings> instruction_page_alpha_props
		GetArraySize (<settings>.instruction_page_alpha_props)
		Change ds_instruction_page_count = <array_Size>
		Change \{ds_instruction_page_showing = -1}
		<page_flip_progress_delta> = (100 / $ds_instruction_page_count)
		<next_page_flip_progress> = <page_flip_progress_delta>
		ds_connection_advance_instruction_page
	else
		Change \{ds_instruction_page_count = 0}
	endif
	wiidscommunication :getstatus
	<num_ds_to_disable> = ($ds_maximum_connected_count - <target_ds_count>)
	if (<num_ds_to_disable> > 0)
		<i> = 0
		begin
		set_ds_container_visible ds_index = (<target_ds_count> + <i>) visible = FALSE
		<i> = (<i> + 1)
		repeat <num_ds_to_disable>
	endif
	set_all_ds_status_text \{text = qs(0xd778c770)}
	set_all_ds_progress_bars_visible \{visible = true}
	create_ds_connection_user_control_helpers \{show_continue = FALSE}
	begin
	wiidscommunication :getstatus
	if NOT (<error> = 0)
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	set_all_ds_progress_bars progress = <download_progress>
	if (($ds_instruction_page_count > 0) && ($ds_instruction_page_showing < ($ds_instruction_page_count - 1)))
		if (<download_progress> >= <next_page_flip_progress>)
			ds_connection_advance_instruction_page
			<next_page_flip_progress> = (<next_page_flip_progress> + <page_flip_progress_delta>)
		endif
	endif
	if (<state> = download_complete)
		<ds> = 0
		begin
		set_ds_download_complete_texture ds_index = <ds>
		<ds> = (<ds> + 1)
		repeat $ds_maximum_connected_count
		break
	endif
	WaitOneGameFrame
	repeat
	disconnect_ds_communication_wait \{enable_network = FALSE}
	wiidscommunication :getstatus
	do_ds_connect target_ds_count = <target_ds_count>
endscript

script debug_skip_ds_connection 
	Change \{ds_debug_skipped_connection = true}
	LaunchEvent \{Type = ds_connection_complete
		target = ds_event_listener}
endscript

script debug_skip_ds_download 
	disconnect_ds_communication_wait \{enable_network = FALSE}
	do_ds_connect target_ds_count = <target_ds_count>
endscript

script do_ds_connect 
	SpawnScriptNow do_ds_connect_spawned params = <...>
endscript

script do_ds_connect_spawned 
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_download_spawned}
	Change \{ds_asset_download_complete = [
		]}
	begin
	Change ds_asset_download_complete = ($ds_asset_download_complete + 0)
	repeat <target_ds_count>
	<mode> = ($ds_mode)
	<settings> = ($ds_mode_settings.<mode>)
	ds_get_region
	getconsolenickname
	if NOT GotParam \{console_nickname}
		<console_nickname> = qs(0xf5e8ed8b)
	endif
	disconnect_network_wait
	if NOT wiidscommunication :connect {
			target_ds_count = <target_ds_count>
			ggid = (<settings>.communication_ggids.<region>)
			host_name = <console_nickname>
		}
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
	<last_ds_count> = 0
	begin
	wiidscommunication :getstatus
	getelapsedtime starttime = <starttime>
	if ((<error> != 0) || (<ElapsedTime> > 15000))
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	if (<last_ds_count> != <current_ds_count>)
		<ds> = 0
		begin
		if (<ds_info> [<ds>].booted = true)
			set_ds_status_text ds_index = <ds> text = qs(0x0d119c9b) flash = FALSE
			set_ds_name_text ds_index = <ds> text = (<ds_info> [<ds>].Name)
		endif
		<ds> = (<ds> + 1)
		repeat <target_ds_count>
		<last_ds_count> = <current_ds_count>
	endif
	if (<current_ds_count> = <target_ds_count>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wiidscommunication :sendmessage set_mode mode = <mode>
	if ($ds_mode = audience_party)
		sdcardmanagerfunc \{func = force_handle_events}
		dlccatalogmanagerfunc \{func = load_catalogs}
	endif
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
		SpawnScriptNow \{ds_connection_force_seek}
		begin
		if NOT ScriptIsRunning \{ds_connection_force_seek}
			break
		endif
		Wait \{1
			Frame}
		repeat
	endif
	LaunchEvent \{Type = ds_connection_complete
		target = ds_event_listener}
	Change \{ds_state = connected}
endscript

script ds_connection_force_seek 
	LoadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
	UnloadPakAsync \{pak_name = 'pak/ui/force_seek.pak'
		Heap = BottomUpHeap
		async = 1}
endscript

script cancel_ds_operation \{enable_network = 0x00000018}
	wiidscommunication :disconnect enable_network = <enable_network>
	Change \{ds_state = None}
	KillSpawnedScript \{Name = do_ds_broadcast_spawned}
	KillSpawnedScript \{Name = do_ds_download_spawned}
	KillSpawnedScript \{Name = do_ds_connect_spawned}
endscript

script get_current_ds_count 
	wiidscommunication :getstatus
	return current_ds_count = <current_ds_count>
endscript

script ds_connection_helper \{mode = roadie_battle
		from = NULL
		event = menu_change}
	ui_event event = <event> state = uistate_ds_connection_handler data = {mode = <mode> from = <from> device_num = <device_num>}
endscript

script end_ds_comm 
	wiidscommunication :disconnect
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

script disconnect_ds_communication_wait \{enable_network = 0x00000018}
	if NOT wiidscommunication :disconnect enable_network = <enable_network>
		LaunchEvent \{Type = ds_communication_error
			target = ds_event_listener}
		return
	endif
	begin
	WaitOneGameFrame
	wiidscommunication :getstatus
	if (<state> = Idle)
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

script set_ds_status_text \{ds_index = !i1768515945
		text = 0x69696969
		flash = 0x00000038}
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	<resolved_id> :Obj_KillSpawnedScript Name = ds_connection_flash_status_text
	<resolved_id> :se_setprops status_text = <text> status_alpha = 1
	if (<flash> = true)
		<resolved_id> :Obj_SpawnScriptNow ds_connection_flash_status_text
	endif
endscript

script ds_connection_flash_status_text 
	begin
	se_setprops \{time = 0.5
		status_alpha = 0}
	se_waitprops
	se_setprops \{time = 0.5
		status_alpha = 1}
	se_waitprops
	Wait \{0.5
		Seconds}
	repeat
endscript

script set_all_ds_status_text \{text = 0x69696969
		flash = 0x00000028}
	<ds> = 0
	begin
	set_ds_status_text ds_index = <ds> text = <text> flash = <flash>
	<ds> = (<ds> + 1)
	repeat $ds_maximum_connected_count
endscript

script set_ds_progress_bar \{ds_index = !i1768515945
		progress = !f1768515945}
	setpaircomponents load_bar_scale X = ((<progress> * 1.0) / 100) y = 1.0
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	<resolved_id> :se_setprops load_bar_scale = <load_bar_scale>
endscript

script set_all_ds_progress_bars \{progress = !f1768515945}
	<ds> = 0
	begin
	set_ds_progress_bar ds_index = <ds> text = <text> progress = <progress>
	<ds> = (<ds> + 1)
	repeat $ds_maximum_connected_count
endscript

script set_ds_progress_bar_visible \{ds_index = !i1768515945
		visible = 0x00000028}
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	if (<visible> = true)
		<resolved_id> :se_setprops load_bar_alpha = 1
	else
		<resolved_id> :se_setprops load_bar_alpha = 0
	endif
endscript

script set_all_ds_progress_bars_visible \{visible = 0x00000018}
	<ds> = 0
	begin
	set_ds_progress_bar_visible ds_index = <ds> visible = <visible>
	<ds> = (<ds> + 1)
	repeat $ds_maximum_connected_count
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

script set_ds_container_visible \{ds_index = !i1768515945
		visible = 0x00000028}
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	if (<visible> = true)
		<resolved_id> :se_setprops alpha = 1
	else
		<resolved_id> :se_setprops alpha = 0
	endif
endscript

script set_ds_name_text \{ds_index = !i1768515945
		text = 0x69696969}
	formatText TextName = localized_text qs(0x73307931) s = <text>
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	<resolved_id> :se_setprops ds_name_text = <localized_text>
endscript

script set_ds_download_complete_texture \{ds_index = !i1768515945}
	ResolveScreenElementID id = {ds_container child = <ds_index>}
	<resolved_id> :se_setprops nintendo_ds_light_alpha = 1
endscript

script ds_connection_advance_instruction_page 
	<settings> = ($ds_mode_settings.$ds_mode)
	if ($ds_instruction_page_showing = -1)
		<props> = {
			generic_instructions_alpha = 0
			time = ($ds_switch_instruction_page_time_secs)
		}
		setstructureparam struct_name = props param = (<settings>.instruction_page_alpha_props [0]) value = 1
		ds_connection_handler_tree :se_setprops <props>
		Change \{ds_instruction_page_showing = 0}
	else
		if ($ds_instruction_page_showing >= $ds_instruction_page_count)
			ScriptAssert \{'attemping to show an invalid DS instruction page'}
		endif
		<props> = {
			time = ($ds_switch_instruction_page_time_secs)
		}
		setstructureparam {
			struct_name = props
			param = (<settings>.instruction_page_alpha_props [($ds_instruction_page_showing)])
			value = 0
		}
		setstructureparam {
			struct_name = props
			param = (<settings>.instruction_page_alpha_props [($ds_instruction_page_showing + 1)])
			value = 1
		}
		ds_connection_handler_tree :se_setprops <props>
		Change ds_instruction_page_showing = ($ds_instruction_page_showing + 1)
	endif
endscript

script ds_need_more_players_for_roadie_battle 
	get_current_ds_count
	if ($ds_mode = roadie_battle)
		if ($roadie_battle_mode = competitive)
			if (<current_ds_count> < $ds_min_players_for_roadie_battle)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script create_ds_connection_user_control_helpers \{show_continue = 0x00000018}
	Change \{block_clean_up_user_control_helpers = FALSE}
	clean_up_user_control_helpers
	Change \{block_clean_up_user_control_helpers = true}
	add_gamertag_helper exclusive_device = ($ds_connection_device_num) z = 1000 ignore_player_part = true
	if (<show_continue> = true)
		add_user_control_helper \{button = green
			text = qs(0x719b7342)
			z = 1000
			controller = $ds_connection_device_num}
	endif
	add_user_control_helper \{button = red
		text = qs(0xf7723015)
		z = 1000
		controller = $ds_connection_device_num}
endscript
