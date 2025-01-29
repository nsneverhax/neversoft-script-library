roadie_battle_ds_disconnect_timeout_secs = 15.0

script roadie_battle_handle_ds_connect \{aid = !i1768515945}
	if roadie_battle_find_roadie_by_aid aid = <aid>
		roadie_battle_set_roadie_info roadie = <roadie> param = connected value = true
		formatText checksumName = script_id 'ds_timeout_%r' r = <roadie>
		KillSpawnedScript id = <script_id>
		roadie_battle_resync_ds aid = <aid> roadie = <roadie>
	endif
endscript

script roadie_battle_handle_ds_disconnect \{aid = !i1768515945}
	if roadie_battle_find_roadie_by_aid aid = <aid>
		roadie_battle_get_roadie_info roadie = <roadie> param = connected
		if (<connected> = true)
			roadie_battle_set_roadie_info roadie = <roadie> param = connected value = FALSE
			formatText checksumName = script_id 'ds_timeout_%r' r = <roadie>
			SpawnScriptNow {
				roadie_battle_ds_timeout_wait
				id = <script_id>
				params = {
					aid = <aid>
					roadie = <roadie>
				}
			}
			if NOT ScriptIsRunning \{roadie_battle_maybe_display_ds_error}
				SpawnScriptNow \{roadie_battle_maybe_display_ds_error}
			endif
		endif
	endif
endscript

script roadie_battle_ds_timeout_wait \{aid = !i1768515945
		roadie = !i1768515945}
	setscriptcannotpause
	Wait \{$roadie_battle_ds_disconnect_timeout_secs
		Seconds}
	roadie_battle_handle_ds_timeout aid = <aid> roadie = <roadie>
endscript

script roadie_battle_handle_ds_timeout \{aid = !i1768515945
		roadie = !i1768515945}
	roadie_battle_set_roadie_info roadie = <roadie> param = timed_out value = true
	wiidscommunication :disconnectchild aid = <aid>
	if NOT ScriptIsRunning \{roadie_battle_maybe_display_ds_error}
		SpawnScriptNow \{roadie_battle_maybe_display_ds_error}
	endif
endscript

script roadie_battle_deactivate_timed_out_roadies 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = timed_out
	if (<timed_out> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		wiidscommunication :sendmessage {
			roadie_confirm_signout
			ds_aid = <ds_aid>
		}
		wiidscommunication :sendmessage {
			roadie_confirm_avatar
			ds_aid = <ds_aid>
			avatar = -1
		}
		wiidscommunication :sendmessage {
			roadie_confirm_partner
			ds_aid = <ds_aid>
			Player = -1
		}
		roadie_battle_deactivate_roadie roadie = <roadie>
		roadie_battle_set_roadie_info roadie = <roadie> param = timed_out value = FALSE
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_send_all_connected_ds_info 
	<ds> = 0
	<all_ds_aids> = []
	<all_ds_names> = []
	wiidscommunication :getstatus
	if (<current_ds_count> > 0)
		begin
		<all_ds_aids> = (<all_ds_aids> + <ds_info> [<ds>].aid)
		<all_ds_names> = (<all_ds_names> + <ds_info> [<ds>].Name)
		<ds> = (<ds> + 1)
		repeat <current_ds_count>
	endif
	<ds> = 0
	if (<current_ds_count> > 0)
		begin
		wiidscommunication :sendmessage {
			connected_ds_info
			ds_count = <current_ds_count>
			ds_aids = <all_ds_aids>
			ds_names = <all_ds_names>
			local_ds_index = (<ds_info> [<ds>].aid)
			destination_aid = (<ds_info> [<ds>].aid)
		}
		<ds> = (<ds> + 1)
		repeat <current_ds_count>
	endif
endscript

script roadie_battle_resync_ds \{aid = !i1768515945
		roadie = !i1768515945}
	if ($roadie_battle_in_lobby = true)
		roadie_battle_resync_lobby resync_aid = <aid> resync_roadie = <roadie>
	elseif ($roadie_battle_in_game = 1)
		if GameIsPaused
			wiidscommunication :sendmessage {
				pause_mode
				destination_aid = <aid>
			}
		endif
	else
		wiidscommunication :sendmessage {
			set_holding_mode
			destination_aid = <aid>
		}
	endif
endscript

script roadie_battle_resync_lobby \{resync_aid = !i1768515945
		resync_roadie = !i1768515945}
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = Active
	if (<Active> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		roadie_battle_get_roadie_info roadie = <roadie> param = avatar
		roadie_battle_get_roadie_info roadie = <roadie> param = Player
		if (<signed_in> = true)
			wiidscommunication :sendmessage {
				roadie_confirm_signin
				ds_aid = <ds_aid>
				destination_aid = <resync_aid>
			}
		else
			wiidscommunication :sendmessage {
				roadie_confirm_signout
				ds_aid = <ds_aid>
				destination_aid = <resync_aid>
			}
		endif
		wiidscommunication :sendmessage {
			roadie_confirm_avatar
			ds_aid = <ds_aid>
			avatar = <avatar>
			destination_aid = <resync_aid>
		}
		wiidscommunication :sendmessage {
			roadie_confirm_partner
			ds_aid = <ds_aid>
			Player = <Player>
			destination_aid = <resync_aid>
		}
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	roadie_battle_lobby_send_all_player_info
	roadie_battle_lobby_goto_initial_ds_menu roadie = <resync_roadie>
endscript

script roadie_battle_allow_ds_disconnect_screen 
	if is_ui_event_running
		return \{FALSE}
	elseif ($g_in_loading_screen = 1)
		return \{FALSE}
	elseif ScriptIsRunning \{ui_roadie_battle_ds_disconnect_restart_song_spawned}
		return \{FALSE}
	elseif ScriptIsRunning \{ui_event_wait_spawned}
		return \{FALSE}
	endif
	if ($roadie_battle_in_game = 1)
		if ($playing_song_for_real = 0)
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'pausemenu'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'fail_song'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'song_breakdown'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'controller_disconnect'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'options_calibrate_lag_warning'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'pausemenu_quit_warning'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'pausemenu_restart_warning'}
			return \{FALSE}
		elseif ui_event_exists_in_stack \{above = 'gameplay'
				Name = 'roadie_battle_ds_disconnect'}
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script roadie_battle_goto_ds_disconnect_screen 
	if ($roadie_battle_in_game = 1)
		<data> = {is_popup}
	else
		<data> = {}
	endif
	ui_event event = menu_change state = uistate_roadie_battle_ds_disconnect data = <data>
endscript

script roadie_battle_maybe_display_ds_error 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if NOT inroadiebattlemode
		break
	endif
	if ui_event_exists_in_stack \{Name = 'roadie_battle_ds_disconnect'}
		break
	endif
	if ($roadie_battle_in_game = 1)
		if roadie_battle_allow_ds_disconnect_screen
			roadie_battle_goto_ds_disconnect_screen
			break
		endif
	else
		roadie_battle_get_ds_disconnect_type
		switch (<ds_disconnect_type>)
			case None
			break
			case recoverable_timeout
			case fatal_timeout
			if roadie_battle_allow_ds_disconnect_screen
				roadie_battle_goto_ds_disconnect_screen
				break
			endif
		endswitch
	endif
	WaitOneGameFrame
	repeat
endscript

script roadie_battle_are_there_disconnected_dses 
	roadie_battle_get_ds_disconnect_type
	if (<ds_disconnect_type> = None)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script roadie_battle_get_ds_disconnect_type 
	if ($active_roadie_count = 0)
		return \{ds_disconnect_type = fatal_timeout}
	endif
	<ds_disconnect_type> = None
	<roadie> = 0
	<timeout_count> = 0
	<signed_in_timeout_count> = 0
	<disconnect_count> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	roadie_battle_get_roadie_info roadie = <roadie> param = connected
	roadie_battle_get_roadie_info roadie = <roadie> param = timed_out
	if (<timed_out> = true)
		<timeout_count> = (<timeout_count> + 1)
		if (<signed_in> = true)
			<signed_in_timeout_count> = (<signed_in_timeout_count> + 1)
		endif
	elseif ((<signed_in> = true) && (<connected> = FALSE))
		<disconnect_count> = (<disconnect_count> + 1)
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	if (<timeout_count> = $active_roadie_count)
		<ds_disconnect_type> = fatal_timeout
	elseif (<disconnect_count> > 0)
		<ds_disconnect_type> = attempting_reconnect
	elseif (<signed_in_timeout_count> > 0)
		<ds_disconnect_type> = recoverable_timeout
	endif
	return ds_disconnect_type = <ds_disconnect_type>
endscript
