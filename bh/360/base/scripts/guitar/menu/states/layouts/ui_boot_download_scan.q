g_have_stored_signin_state = 0
g_signin_player = [
	0
	0
	0
	0
]
g_signin_tag = [
	null
	null
	null
	null
]
g_ps3_dlc_scan_occured = 0

script reset_dlc_signin_state 
	Change \{g_have_stored_signin_state = 0}
	Change \{g_ps3_dlc_scan_occured = 0}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_player
		index = 0
		newValue = 0}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_player
		index = 1
		newValue = 0}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_player
		index = 2
		newValue = 0}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_player
		index = 3
		newValue = 0}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_tag
		index = 0
		newValue = null}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_tag
		index = 1
		newValue = null}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_tag
		index = 2
		newValue = null}
	SetArrayElement \{GlobalArray
		arrayName = g_signin_tag
		index = 3
		newValue = null}
endscript

script should_scan_dlc 
	if isXenon
		if ($g_have_stored_signin_state = 1)
			matches = 1
			player = 0
			begin
			if CheckForSignIn local controller_index = <player>
				if (($g_signin_player [<player>]) != 1)
					matches = 0
					break
				endif
				GetLocalGamerTag controller = <player> checksum
				if (($g_signin_tag [<player>]) != <checksum>)
					matches = 0
					break
				endif
			else
				if (($g_signin_player [<player>]) != 0)
					matches = 0
					break
				endif
			endif
			<player> = (<player> + 1)
			repeat 4
			if (<matches> = 1)
				return \{false}
			endif
		endif
		player = 0
		begin
		if CheckForSignIn local controller_index = <player>
			SetArrayElement GlobalArray arrayName = g_signin_player index = <player> newValue = 1
			GetLocalGamerTag controller = <player> checksum
			SetArrayElement GlobalArray arrayName = g_signin_tag index = <player> newValue = <checksum>
		else
			SetArrayElement GlobalArray arrayName = g_signin_player index = <player> newValue = 0
			SetArrayElement GlobalArray arrayName = g_signin_tag index = <player> newValue = null
		endif
		<player> = (<player> + 1)
		repeat 4
		Change \{g_have_stored_signin_state = 1}
	else
		if ($g_ps3_dlc_scan_occured = 0)
			Change \{g_ps3_dlc_scan_occured = 1}
		else
			return \{false}
		endif
	endif
	return \{true}
endscript

script ui_create_boot_download_scan \{Force = 0}
	RequireParams \{[
			event_params
			controller
		]
		all}
	Change \{music_store_attempted_purchase = 0}
	mark_unsafe_for_shutdown
	if is_signing_out
		printf \{qs(0x9d853e8d)}
		return
	endif
	if (<controller> = -1)
		controller = 0
	else
	endif
	if ($downloadcontent_enabled = 0)
		spawnscriptnow ui_event_wait params = <event_params>
		return
	endif
	if (<Force> = 0)
		if NOT should_scan_dlc
			spawnscriptnow ui_event_wait params = <event_params>
			return
		endif
	endif
	Change store_respond_to_signin_changed = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 1}
	get_savegame_from_controller controller = <controller>
	spawnscriptnow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan 
	RequireParams \{[
			controller
			event_params
			savegame
		]
		all}
	SetScriptCannotPause
	savegame_ui_begin savegame = <savegame> text = qs(0x11ba1951) no_cleanup_messages
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	wait \{1
		gameframes}
	if NOT ui_event_exists_in_stack \{name = 'mainmenu'}
		if ControllerPressed x <controller>
			if ControllerPressed circle <controller>
				if ControllerPressed square <controller>
					if ControllerPressed triangle <controller>
						printf \{qs(0xa1f3a821)}
						RemoveContentFiles \{clear_cache}
					endif
				endif
			endif
		endif
	endif
	if is_signing_out
		return
	endif
	GetTrueStartTime
	Downloads_EnumContent controller = <controller> savegame_ui_savegame = <savegame>
	begin
	GetTrueElapsedTime starttime = <starttime>
	if (<elapsedtime> > 1000)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($shutdown_game_for_signin_change_flag = 1)
		mark_safe_for_shutdown
		return
	endif
	ui_event_wait <event_params>
	if StructureContains structure = (<event_params>.data) state
		if ((<event_params>.data.state) = uistate_jam)
			create_loading_screen \{jam_mode = 1}
		endif
	endif
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
endscript

script ui_deinit_boot_download_scan 
	RequireParams \{[
			controller
		]
		all}
	mark_safe_for_shutdown
	if is_signing_out
		printf \{'ui_deinit_boot_download_scan - savegame_ui_end'}
		savegame_ui_end savegame = <controller>
	endif
endscript
