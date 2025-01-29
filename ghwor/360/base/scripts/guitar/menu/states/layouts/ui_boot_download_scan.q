g_have_stored_signin_state = 0
g_signin_player = [
	0
	0
	0
	0
]
g_signin_tag = [
	NULL
	NULL
	NULL
	NULL
]
g_ps3_dlc_scan_occured = 0

script reset_dlc_signin_state 
	Change \{g_have_stored_signin_state = 0}
	Change \{g_ps3_dlc_scan_occured = 0}
	SetArrayElement \{globalarray
		ArrayName = g_signin_player
		index = 0
		NewValue = 0}
	SetArrayElement \{globalarray
		ArrayName = g_signin_player
		index = 1
		NewValue = 0}
	SetArrayElement \{globalarray
		ArrayName = g_signin_player
		index = 2
		NewValue = 0}
	SetArrayElement \{globalarray
		ArrayName = g_signin_player
		index = 3
		NewValue = 0}
	SetArrayElement \{globalarray
		ArrayName = g_signin_tag
		index = 0
		NewValue = NULL}
	SetArrayElement \{globalarray
		ArrayName = g_signin_tag
		index = 1
		NewValue = NULL}
	SetArrayElement \{globalarray
		ArrayName = g_signin_tag
		index = 2
		NewValue = NULL}
	SetArrayElement \{globalarray
		ArrayName = g_signin_tag
		index = 3
		NewValue = NULL}
endscript

script will_scan_dlc 
	if ($g_force_songlist_dlc_scan = 1)
		return \{true}
	endif
	if marketplacebgmonitorfunc \{func = should_enumerate}
		return \{true}
	endif
	if isXenon
		if ($g_have_stored_signin_state = 1)
			matches = 1
			Player = 0
			begin
			if CheckForSignIn local controller_index = <Player>
				if (($g_signin_player [<Player>]) != 1)
					matches = 0
					break
				endif
				getlocalgamertag controller = <Player> checksum
				if (($g_signin_tag [<Player>]) != <checksum>)
					matches = 0
					break
				endif
			else
				if (($g_signin_player [<Player>]) != 0)
					matches = 0
					break
				endif
			endif
			<Player> = (<Player> + 1)
			repeat 4
			if (<matches> = 1)
				return \{FALSE}
			endif
		endif
		Player = 0
		begin
		if CheckForSignIn local controller_index = <Player>
			SetArrayElement globalarray ArrayName = g_signin_player index = <Player> NewValue = 1
			getlocalgamertag controller = <Player> checksum
			SetArrayElement globalarray ArrayName = g_signin_tag index = <Player> NewValue = <checksum>
		else
			SetArrayElement globalarray ArrayName = g_signin_player index = <Player> NewValue = 0
			SetArrayElement globalarray ArrayName = g_signin_tag index = <Player> NewValue = NULL
		endif
		<Player> = (<Player> + 1)
		repeat 4
		Change \{g_have_stored_signin_state = 1}
	elseif iswindx
		return \{FALSE}
	else
		if ($g_ps3_dlc_scan_occured = 0)
			Change \{g_ps3_dlc_scan_occured = 1}
		else
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script should_scan_dlc 
	if ($g_force_songlist_dlc_scan = 1)
		return \{true}
	endif
	if marketplacebgmonitorfunc \{func = should_enumerate}
		return \{true}
	endif
	if isXenon
		if ($g_have_stored_signin_state = 1)
			matches = 1
			Player = 0
			begin
			if CheckForSignIn local controller_index = <Player>
				if NOT NetSessionFunc func = xenonisguest params = {controller_index = <Player>}
					if (($g_signin_player [<Player>]) != 1)
						matches = 0
						break
					endif
					getlocalgamertag controller = <Player> checksum
					if (($g_signin_tag [<Player>]) != <checksum>)
						matches = 0
						break
					endif
				endif
			else
				if (($g_signin_player [<Player>]) != 0)
					matches = 0
					break
				endif
			endif
			<Player> = (<Player> + 1)
			repeat 4
			if (<matches> = 1)
				return \{FALSE}
			endif
		endif
	elseif iswindx
		return \{FALSE}
	else
		if ($g_ps3_dlc_scan_occured = 1)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script ui_create_boot_download_scan \{Force = 0
		show_mainmenu_bg = 0}
	RequireParams \{[
			event_params
			controller
		]
		all}
	Change \{music_store_attempted_purchase = 0}
	hide_glitch \{num_frames = 4}
	pushunsafeforshutdown \{context = boot_download_scan}
	if is_signing_out
		popunsafeforshutdown \{context = boot_download_scan}
		printf \{qs(0x9d853e8d)}
		return
	endif
	if (<controller> = -1)
		controller = 0
	else
	endif
	if ($downloadcontent_enabled = 0)
		popunsafeforshutdown \{context = boot_download_scan}
		SpawnScriptNow ui_event_wait params = <event_params>
		return
	endif
	if (<Force> = 0)
		if NOT will_scan_dlc
			popunsafeforshutdown \{context = boot_download_scan}
			SpawnScriptNow ui_event_wait params = <event_params>
			return
		endif
	endif
	Change store_respond_to_signin_changed = ($respond_to_signin_changed)
	Change \{respond_to_signin_changed = 1}
	get_savegame_from_controller controller = <controller>
	SpawnScriptNow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{show_mainmenu_bg = 0
		controller = !i1768515945
		event_params = 0x69696969
		savegame = !i1768515945}
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	setscriptcannotpause
	popdisablerendering \{context = going_into_songlist
		Type = unchecked}
	savegame_ui_begin {
		savegame = <savegame>
		text = qs(0x11ba1951)
		no_cleanup_messages
		Type = dlc_scan
	}
	OnExitRun savegame_ui_end params = {savegame = <savegame>}
	Wait \{1
		gameframes}
	<manifest_enumeration> = 1
	if ControllerPressed X <controller>
		if ControllerPressed circle <controller>
			if ControllerPressed Square <controller>
				if ControllerPressed Triangle <controller>
					<manifest_enumeration> = 0
				endif
			endif
		endif
	endif
	if is_signing_out
		popunsafeforshutdown \{context = boot_download_scan}
		return
	endif
	GetTrueStartTime
	Downloads_EnumContent controller = <controller> savegame_ui_savegame = <savegame> manifest_enumeration = <manifest_enumeration>
	begin
	GetTrueElapsedTime starttime = <starttime>
	if (<ElapsedTime> > 1000)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	popunsafeforshutdown \{context = boot_download_scan}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if StructureContains structure = (<event_params>.data) state
		if ((<event_params>.data.state) = uistate_songlist)
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
		endif
	endif
	ui_event_wait <event_params>
	if StructureContains structure = (<event_params>.data) state
		if ((<event_params>.data.state) = uistate_jam)
			create_loading_screen
		endif
	endif
	Change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan \{show_mainmenu_bg = 0}
	if (<show_mainmenu_bg> = 1)
		destroy_mainmenu_bg
	endif
endscript

script ui_deinit_boot_download_scan 
	RequireParams \{[
			controller
		]
		all}
	if is_signing_out
		printf \{'ui_deinit_boot_download_scan - savegame_ui_end'}
		savegame_ui_end savegame = <controller>
	endif
endscript
