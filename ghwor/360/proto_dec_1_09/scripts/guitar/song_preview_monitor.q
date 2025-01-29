
script shutdown_preview_monitor 
	Change \{g_song_preview_monitor_shutdown_flag = 1}
endscript
g_song_preview_monitor_shutdown_flag = 0

script song_preview_monitor 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{g_song_preview_monitor_shutdown_flag = 0}
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	sap_stoppreview \{noWait}
	begin
	if NOT ($current_songlist_song_preview = $target_songlist_song_preview)
		Change \{songlist_song_preview_changing = 1}
		song = ($target_songlist_song_preview)
		current_song = ($current_songlist_song_preview)
		if (<song> = jamsession)
			<song> = None
		endif
		if NOT (<current_song> = None)
			sap_stoppreview \{noWait}
		endif
		if ($target_songlist_song_preview != <song> || $target_songlist_song_preview = None)
			Change \{current_songlist_song_preview = None}
			Change \{songlist_song_preview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			get_song_encryption_type song_name = <song>
			if StructureContains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			sap_stoppreview \{noWait}
			sap_playpreview FileName = <song_prefix> encryption_type = <encryption_type>
			get_song_struct song = <song>
			Change current_songlist_song_preview = <song>
			Change \{songlist_song_preview_changing = 0}
		endif
	elseif NOT ($current_songlist_song_preview = None)
		song = ($current_songlist_song_preview)
		get_song_prefix song = <song>
		if NOT sap_ispreviewplaying
			Change \{songlist_song_preview_changing = 1}
			get_song_encryption_type song_name = <song>
			sap_stoppreview \{noWait}
			sap_playpreview FileName = <song_prefix> content_index = <content_index> encryption_type = <encryption_type>
			Change \{songlist_song_preview_changing = 0}
		endif
	endif
	if ($g_song_preview_monitor_shutdown_flag = 1)
		Change \{g_song_preview_monitor_shutdown_flag = 0}
		break
	endif
	Wait \{1
		gameframe}
	if ($g_song_preview_monitor_shutdown_flag = 1)
		Change \{g_song_preview_monitor_shutdown_flag = 0}
		break
	endif
	repeat
	sap_stoppreview \{noWait}
endscript
