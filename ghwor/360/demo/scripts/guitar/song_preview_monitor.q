
script shutdown_preview_monitor 
	change \{g_song_preview_monitor_shutdown_flag = 1}
endscript
g_song_preview_monitor_shutdown_flag = 0
g_disable_song_previews = 0

script song_preview_monitor 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{g_song_preview_monitor_shutdown_flag = 0}
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($g_disable_song_previews = 1)
		return
	endif
	sap_stoppreview \{nowait}
	begin
	if NOT ($current_songlist_song_preview = $target_songlist_song_preview)
		change \{songlist_song_preview_changing = 1}
		song = ($target_songlist_song_preview)
		current_song = ($current_songlist_song_preview)
		if (<song> = jamsession)
			<song> = none
		endif
		if NOT (<current_song> = none)
			sap_stoppreview \{nowait}
		endif
		wait \{0.005
			second}
		if ($g_song_preview_monitor_shutdown_flag = 1)
			change \{g_song_preview_monitor_shutdown_flag = 0}
			break
		endif
		if ($target_songlist_song_preview != <song> || $target_songlist_song_preview = none)
			change \{current_songlist_song_preview = none}
			change \{songlist_song_preview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			get_song_encryption_type song_name = <song>
			if structurecontains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			sap_stoppreview \{nowait}
			sap_playpreview filename = <song_prefix> encryption_type = <encryption_type>
			get_song_struct song = <song>
			change current_songlist_song_preview = <song>
			change \{songlist_song_preview_changing = 0}
		endif
	elseif NOT ($current_songlist_song_preview = none)
		song = ($current_songlist_song_preview)
		get_song_prefix song = <song>
		if NOT sap_ispreviewplaying
			change \{songlist_song_preview_changing = 1}
			get_song_encryption_type song_name = <song>
			sap_stoppreview \{nowait}
			sap_playpreview filename = <song_prefix> content_index = <content_index> encryption_type = <encryption_type>
			change \{songlist_song_preview_changing = 0}
		endif
	endif
	if ($g_song_preview_monitor_shutdown_flag = 1)
		change \{g_song_preview_monitor_shutdown_flag = 0}
		break
	endif
	if ($g_disable_song_previews = 1)
		break
	endif
	wait \{1
		gameframe}
	if ($g_song_preview_monitor_shutdown_flag = 1)
		change \{g_song_preview_monitor_shutdown_flag = 0}
		break
	endif
	if ($g_disable_song_previews = 1)
		break
	endif
	repeat
	sap_stoppreview \{nowait}
endscript
