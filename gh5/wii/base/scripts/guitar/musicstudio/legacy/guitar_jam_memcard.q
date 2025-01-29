jam_curr_directory_listing = [
]
jam_controller_directory_listing_0 = [
]
jam_controller_directory_listing_1 = [
]
jam_controller_directory_listing_2 = [
]
jam_controller_directory_listing_3 = [
]

script print_jam_directory_listings 
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x363b3f70)}
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x6ca39470)}
	GetArraySize ($jam_curr_directory_listing)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_Size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0xa040e0e6)}
	GetArraySize ($jam_controller_directory_listing_0)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_Size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x2dc81d04)}
	GetArraySize ($jam_controller_directory_listing_1)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_Size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x60201d63)}
	GetArraySize ($jam_controller_directory_listing_2)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_Size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0xeda8e081)}
	GetArraySize ($jam_controller_directory_listing_3)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_Size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x363b3f70)}
endscript

script jam_get_controller_directory_listing \{controller = 0}
	get_savegame_from_controller controller = <controller>
	formatText checksumName = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	directorylisting = ($<controller_directory_listing>)
	return directorylisting = <directorylisting>
endscript

script jam_reset_controller_directory_listing \{controller = 0}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formatText checksumName = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists Name = <controller_directory_listing>
		Change GlobalName = <controller_directory_listing> NewValue = []
	endif
	printf \{channel = directory_listing
		qs(0x1ed7626b)}
	print_jam_directory_listings
endscript

script jam_update_controller_directory_listing \{controller = 0}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formatText checksumName = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists Name = <controller_directory_listing>
		Change GlobalName = <controller_directory_listing> NewValue = <directorylisting>
	endif
	printf \{channel = directory_listing
		qs(0x15d915e7)}
	print_jam_directory_listings
endscript

script jam_update_curr_directory_listing \{controller = 0}
	print_jam_directory_listings
endscript

script jam_get_num_songs 
	user_song_count = 0
	downloaded_song_count = 0
	GetArraySize ($jam_curr_directory_listing)
	if (<array_Size> > 0)
		index = 0
		begin
		if NOT (($jam_curr_directory_listing [<index>].song_version) = $jam_song_version_dummy)
			if StructureContains structure = ($jam_curr_directory_listing [<index>]) downloaded
				if (($jam_curr_directory_listing [<index>].downloaded) = 1)
					<user_song_count> = (<user_song_count> + 1)
				else
					<user_song_count> = (<user_song_count> + 1)
				endif
			else
				<user_song_count> = (<user_song_count> + 1)
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	printf channel = jam_mode qs(0xc2a66e62) a = <user_song_count> b = <downloaded_song_count>
	return user_song_count = <user_song_count>
endscript
memcard_jamsession_file_name = $wii_jam_custom_song
memcard_jamsession_file_name_patterns = qs(0x11c9d85f)
memcard_jamsession_new_file_name = $wii_jam_custom_song
memcard_jamsession_artist = qs(0x2dc91c7c)
memcard_jamsession_actual_file_name = ''
memcard_jamsession_song_version = 0
memcard_jamsession_downloaded = 0
memcard_jamsession_genre = 0
memcard_jamsession_song_length = 0
memcard_jamsession_year = 2009
memcard_jamsession_fileid = {
	fileid = [
		0
		0
	]
}
memcard_jamsession_playback_track1 = 0
memcard_jamsession_playback_track2 = 0
memcard_jamsession_playback_track_drums = 0
memcard_jamsession_playback_track_vocals = 0
memcard_jamsession_content_name = qs(0xcf50afcb)

script jam_update_song_artist_name 
	band_name = qs(0x00000000)
	getonlineprofilename
	setsonginfo artist = <Name>
	if (<Name> = qs(0x00000000))
		<Name> = qs(0x3777ad0b)
	endif
	setsonginfo artist = <Name>
endscript

script jam_save_song_setup 
	printf \{channel = jam_mode
		qs(0xbc408dca)}
	musicstudio_update_playables
	jam_update_song_artist_name
	if GotParam \{no_menu}
		song = ($memcard_jamsession_file_name)
	elseif NOT GotParam \{song}
		if ($jam_band_new_song = 0)
			song = $jam_selected_song
			savegame_ui_begin savegame = <song> text = qs(0xe75bbd7c)
			OnExitRun savegame_ui_end params = {savegame = <song>}
			clean_up_user_control_helpers
		else
			if GotParam \{from_notetracker}
				if (<from_notetracker> = 1)
					song_mp3 = $jam_notetracker_mp3
					stringremove text = <song_mp3> remove = 'notetracker/' new_string = song
				else
					jam_recording_get_unique_name
				endif
			else
				jam_recording_get_unique_name
			endif
			savegame_ui_begin savegame = <song> text = qs(0xe75bbd7c)
			OnExitRun savegame_ui_end params = {savegame = <song>}
			clean_up_user_control_helpers
		endif
	else
		savegame_ui_begin savegame = <song> text = qs(0xe75bbd7c)
		OnExitRun savegame_ui_end params = {savegame = <song>}
		clean_up_user_control_helpers
	endif
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	gem_array = ($jam_tracks [<index>].gem_array)
	processhammerons Name = <gem_array> name_fretbar = editable_fretbars
	<index> = (<index> + 1)
	repeat (<array_Size> - 1)
	jam_save_scale
	jam_save_effect
	jam_clear_clipboards
	Change memcard_jamsession_file_name = <song>
endscript

script jam_save_song_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearcustomsong
endscript

script jam_recording_get_unique_name \{prefix = $wii_jam_custom_song}
	song_name = <prefix>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_Size> > 0)
		unique_name = 1
		index = 0
		begin
		if (<song_name> = (<directorylisting> [<index>].FileName) &&
				(<directorylisting> [<index>].song_version) != 0)
			<unique_name> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
		if NOT (<unique_name> = 1)
			name_count = 1
			begin
			formatText TextName = song_name qs(0x7b1de562) a = <prefix> s = <name_count>
			unique_name = 1
			index = 0
			begin
			if (<song_name> = (<directorylisting> [<index>].FileName) &&
					(<directorylisting> [<index>].song_version) != 0)
				<unique_name> = 0
				break
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
			<name_count> = (<name_count> + 1)
			if (<unique_name> = 1)
				break
			endif
			repeat
		endif
		index = (<array_Size> - 1)
		begin
		if ((<directorylisting> [<index>].song_version) = 0)
			Change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
			break
		endif
		<index> = (<index> -1)
		repeat <array_Size>
	endif
	StringLength string = <song_name>
	printf channel = jam_mode qs(0x1f1c4e00) a = <song_name> b = <str_len>
	if (<str_len> > 17)
		StringLength string = <prefix>
		stringncopy string = <prefix> length = (<str_len> - 1)
		jam_recording_get_unique_name prefix = <new_string>
		<song_name> = <song>
	else
		printf channel = jam_mode qs(0xe973043a) s = <song_name>
	endif
	return song = <song_name>
endscript

script debug_create_max_jam_songs 
	debug_create_multiple_jam_songs \{num_songs = 50
		downloaded = 0}
	debug_create_multiple_jam_songs \{num_songs = 100
		downloaded = 1}
endscript

script debug_create_multiple_jam_songs \{num_songs = 1
		downloaded = 0}
	count = 0
	begin
	jam_setup_new_song
	setsonginfo \{playback_track1 = 0}
	setsonginfo \{playback_track2 = 2}
	setsonginfo \{playback_track_drums = 1}
	setsonginfo \{playback_track_vocals = 1}
	setsonginfo downloaded = <downloaded>
	if (<downloaded> = 1)
		d = 'D'
	else
		d = 'L'
	endif
	formatText TextName = FileName qs(0xf7e8d767) s = <count> d = <d>
	printf channel = jam_mode qs(0x8c8718b7) s = <FileName>
	Change memcard_jamsession_file_name = <FileName>
	Change \{memcard_after_func = debug_create_jam_song_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			show_popup = 0
		}}
	Block \{Type = debug_create_jam_song}
	printf channel = jam_mode qs(0x48440232) s = <FileName>
	jam_recording_cleanup
	Wait \{1
		Second}
	<count> = (<count> + 1)
	repeat <num_songs>
endscript

script debug_create_jam_song_after_func 
	broadcastevent \{Type = debug_create_jam_song}
endscript

script musicstudio_get_directory_listing_pattern_index 
	GetArraySize <directorylisting>
	if (<array_Size> > 0)
		<ii> = 0
		begin
		<next_struct> = (<directorylisting> [<ii>])
		if ((<next_struct>.filetype) = jamsessionpatterns)
			return pattern_index = <ii>
		endif
		<ii> = (<ii> + 1)
		repeat <array_Size>
	endif
	return \{pattern_index = -1}
endscript

script musicstudio_copy_curr_directory_listing 
endscript
