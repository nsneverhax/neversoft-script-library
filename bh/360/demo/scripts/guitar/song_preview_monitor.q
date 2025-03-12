
script song_preview_monitor 
	setscriptcannotpause
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if ($songlist_song_preview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	songstoppreview
	begin
	if NOT ($current_songlist_song_preview = $target_songlist_song_preview)
		change \{songlist_song_preview_changing = 1}
		song = ($target_songlist_song_preview)
		current_song = ($current_songlist_song_preview)
		if (<song> = jamsession)
			<song> = none
		endif
		if NOT (<current_song> = none)
			songstoppreview
		endif
		wait \{0.5
			second}
		if ($target_songlist_song_preview != <song> || $target_songlist_song_preview = none)
			change \{current_songlist_song_preview = none}
			change \{songlist_song_preview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if structurecontains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			songstoppreview
			songplaypreview filename = <song_prefix>
			get_song_struct song = <song>
			change current_songlist_song_preview = <song>
			change \{songlist_song_preview_changing = 0}
		endif
	elseif NOT ($current_songlist_song_preview = none)
		song = ($current_songlist_song_preview)
		get_song_prefix song = <song>
		if NOT songispreviewplaying
			change \{songlist_song_preview_changing = 1}
			songstoppreview
			songplaypreview filename = <song_prefix> content_index = <content_index>
			change \{songlist_song_preview_changing = 0}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
