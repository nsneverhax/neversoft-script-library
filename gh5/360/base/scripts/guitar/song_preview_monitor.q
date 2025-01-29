
script song_preview_monitor 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	songstoppreview
	begin
	if NOT ($current_songlist_song_preview = $target_songlist_song_preview)
		Change \{songlist_song_preview_changing = 1}
		song = ($target_songlist_song_preview)
		current_song = ($current_songlist_song_preview)
		if (<song> = jamsession)
			<song> = None
		endif
		if NOT (<current_song> = None)
			songstoppreview
		endif
		Wait \{0.5
			Second}
		if ($target_songlist_song_preview != <song> || $target_songlist_song_preview = None)
			Change \{current_songlist_song_preview = None}
			Change \{songlist_song_preview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if StructureContains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			songstoppreview
			songplaypreview FileName = <song_prefix>
			get_song_struct song = <song>
			Change current_songlist_song_preview = <song>
			Change \{songlist_song_preview_changing = 0}
		endif
	elseif NOT ($current_songlist_song_preview = None)
		song = ($current_songlist_song_preview)
		get_song_prefix song = <song>
		if NOT songispreviewplaying
			Change \{songlist_song_preview_changing = 1}
			songstoppreview
			songplaypreview FileName = <song_prefix> content_index = <content_index>
			Change \{songlist_song_preview_changing = 0}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
