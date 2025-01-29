ui_roadie_battle_ds_disconnect_block_event_time_secs = 1.0
ui_roadie_battle_ds_disconnect_paused = 0
ui_roadie_battle_ds_disconnect_type = uninitialized
ui_roadie_battle_ds_disconnect_block_events = FALSE

script ui_create_roadie_battle_ds_disconnect 
	Change \{ui_roadie_battle_ds_disconnect_paused = 0}
	Change \{ui_roadie_battle_ds_disconnect_type = uninitialized}
	Change \{ui_roadie_battle_ds_disconnect_block_events = true}
	SpawnScriptNow \{ui_roadie_battle_ds_disconnect_update}
	SpawnScriptNow \{ui_roadie_battle_ds_disconnect_unblocker}
	if ($roadie_battle_in_game = 1)
		disable_pause
		SpawnScriptNow \{ui_roadie_battle_ds_disconnect_pause}
	else
		wiidscommunication :sendmessage \{set_holding_mode}
	endif
	if NOT GotParam \{is_popup}
		create_menu_backdrop \{texture = black}
	endif
endscript

script ui_destroy_roadie_battle_ds_disconnect 
	KillSpawnedScript \{Name = ui_roadie_battle_ds_disconnect_update}
	KillSpawnedScript \{Name = ui_roadie_battle_ds_disconnect_pause}
	KillSpawnedScript \{Name = ui_roadie_battle_ds_disconnect_unblocker}
	destroy_dialog_box
	if ($roadie_battle_in_game = 0)
		roadie_battle_deactivate_timed_out_roadies
	endif
	if NOT GotParam \{is_popup}
		destroy_menu_backdrop
	endif
endscript

script ui_roadie_battle_ds_disconnect_pause 
	ui_event_wait_for_safe
	if NOT GameIsPaused
		gh_pause_game
		Change \{ui_roadie_battle_ds_disconnect_paused = 1}
	endif
endscript

script ui_roadie_battle_ds_disconnect_create_dialog \{Type = !q1768515945}
	switch (<Type>)
		case fatal_timeout
		<heading_text> = qs(0xdc4ea2ad)
		<body_text> = qs(0xfa45b915)
		<options_array> = [
			{
				func = ui_roadie_battle_ds_disconnect_quit_to_main_menu
				text = qs(0x55c34bc7)
			}
		]
		case recoverable_timeout
		<heading_text> = qs(0xdc4ea2ad)
		<body_text> = qs(0x1034e3dd)
		<options_array> = [
			{
				func = ui_roadie_battle_ds_disconnect_quit_to_band_lobby
				text = qs(0x55c34bc7)
			}
		]
		case attempting_reconnect
		<heading_text> = qs(0x131b4d0f)
		<body_text> = qs(0x58308b52)
		<options_array> = [
			{
				func = ui_roadie_battle_ds_disconnect_quit_to_main_menu
				text = qs(0x55c34bc7)
			}
		]
		case None
		<heading_text> = qs(0x14d209cb)
		<body_text> = qs(0xe10955b8)
		if ($roadie_battle_in_game = 1)
			<options_array> = [
				{
					func = ui_roadie_battle_ds_disconnect_restart_song
					text = qs(0x5036897f)
				}
				{
					func = ui_roadie_battle_ds_disconnect_quit_to_band_lobby
					text = qs(0x55c34bc7)
				}
			]
		else
			<options_array> = [
				{
					func = ui_roadie_battle_ds_disconnect_continue
					text = qs(0x494b4d7f)
				}
				{
					func = ui_roadie_battle_ds_disconnect_quit_to_band_lobby
					text = qs(0x55c34bc7)
				}
			]
		endif
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = <heading_text>
		body_text = <body_text>
		options = <options_array>
		dlg_z_priority = 1000
		use_all_controllers
		no_helpers
	}
	if ($ui_roadie_battle_ds_disconnect_block_events = true)
		dialog_box_vmenu :se_setprops \{block_non_focus_events}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 1000000
		all_buttons}
endscript

script ui_roadie_battle_ds_disconnect_continue 
	if (($roadie_battle_in_game = 1) && ($ui_roadie_battle_ds_disconnect_paused = 1))
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_song_unpause
			}}
		Change \{ui_roadie_battle_ds_disconnect_paused = 0}
	else
		generic_event_back
	endif
endscript

script ui_roadie_battle_ds_disconnect_restart_song 
	SpawnScriptNow \{ui_roadie_battle_ds_disconnect_restart_song_spawned}
endscript

script ui_roadie_battle_ds_disconnect_restart_song_spawned 
	setscriptcannotpause
	create_loading_screen
	gh_unpause_game
	ui_event_wait_for_safe
	generic_event_back \{state = Uistate_gameplay}
	ui_event_wait_for_safe
	Change \{gameplay_restart_song = 1}
	ui_event \{event = menu_refresh}
endscript

script ui_roadie_battle_ds_disconnect_quit_to_main_menu 
	ui_event \{event = menu_back
		data = {
			state = uistate_mainmenu
		}}
endscript

script ui_roadie_battle_ds_disconnect_quit_to_band_lobby 
	ui_event \{event = menu_back
		data = {
			state = uistate_band_lobby
		}}
endscript

script ui_roadie_battle_ds_disconnect_update 
	setscriptcannotpause
	begin
	roadie_battle_get_ds_disconnect_type
	if (<ds_disconnect_type> != $ui_roadie_battle_ds_disconnect_type)
		ui_roadie_battle_ds_disconnect_create_dialog Type = <ds_disconnect_type>
		Change ui_roadie_battle_ds_disconnect_type = <ds_disconnect_type>
		if (<ds_disconnect_type> = attempting_reconnect)
			Wait \{2
				Seconds}
		endif
	endif
	WaitOneGameFrame
	repeat
endscript

script ui_roadie_battle_ds_disconnect_unblocker 
	setscriptcannotpause
	Wait \{$ui_roadie_battle_ds_disconnect_block_event_time_secs
		Seconds}
	dialog_box_vmenu :se_setprops \{unblock_non_focus_events}
	Change \{ui_roadie_battle_ds_disconnect_block_events = FALSE}
endscript
