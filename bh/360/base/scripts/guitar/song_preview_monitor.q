
script song_preview_monitor 
	SetScriptCannotPause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	SongStopPreview
	begin
	if NOT ($current_songlist_song_preview = $target_songlist_song_preview)
		Change \{songlist_song_preview_changing = 1}
		song = ($target_songlist_song_preview)
		current_song = ($current_songlist_song_preview)
		if (<song> = jamsession)
			<song> = None
		endif
		if NOT (<current_song> = None)
			SongStopPreview
		endif
		wait \{0.5
			second}
		if ($target_songlist_song_preview != <song> || $target_songlist_song_preview = None)
			Change \{current_songlist_song_preview = None}
			Change \{songlist_song_preview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if StructureContains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			SongStopPreview
			SongPlayPreview FileName = <song_prefix>
			get_song_struct song = <song>
			Change current_songlist_song_preview = <song>
			Change \{songlist_song_preview_changing = 0}
		endif
	elseif NOT ($current_songlist_song_preview = None)
		song = ($current_songlist_song_preview)
		get_song_prefix song = <song>
		if NOT SongIsPreviewPlaying
			Change \{songlist_song_preview_changing = 1}
			SongStopPreview
			SongPlayPreview FileName = <song_prefix> content_index = <content_index>
			Change \{songlist_song_preview_changing = 0}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
