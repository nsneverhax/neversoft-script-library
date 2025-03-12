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
	getarraysize ($jam_curr_directory_listing)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0xa040e0e6)}
	getarraysize ($jam_controller_directory_listing_0)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x2dc81d04)}
	getarraysize ($jam_controller_directory_listing_1)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x60201d63)}
	getarraysize ($jam_controller_directory_listing_2)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0xeda8e081)}
	getarraysize ($jam_controller_directory_listing_3)
	printf channel = directory_listing qs(0xf97f3bfe) s = <array_size>
	printf \{channel = directory_listing
		qs(0x03ac90f0)}
	printf \{channel = directory_listing
		qs(0x363b3f70)}
endscript

script jam_get_controller_directory_listing \{controller = 0}
	get_savegame_from_controller controller = <controller>
	formattext checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	directorylisting = ($<controller_directory_listing>)
	return directorylisting = <directorylisting>
endscript

script jam_reset_controller_directory_listing \{controller = 0}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formattext checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if globalexists name = <controller_directory_listing>
		change globalname = <controller_directory_listing> newvalue = []
	endif
	printf \{channel = directory_listing
		qs(0x1ed7626b)}
	print_jam_directory_listings
endscript

script jam_update_controller_directory_listing \{controller = 0}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formattext checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if globalexists name = <controller_directory_listing>
		change globalname = <controller_directory_listing> newvalue = <directorylisting>
	endif
	printf \{channel = directory_listing
		qs(0x15d915e7)}
	print_jam_directory_listings
endscript

script jam_update_curr_directory_listing \{controller = 0}
	print_jam_directory_listings
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formattext checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if globalexists name = <controller_directory_listing>
		directorylisting = ($<controller_directory_listing>)
		change jam_curr_directory_listing = <directorylisting>
	endif
	printf \{channel = directory_listing
		qs(0x5a68be92)}
	print_jam_directory_listings
endscript

script jam_get_num_songs 
	user_song_count = 0
	downloaded_song_count = 0
	getarraysize ($jam_curr_directory_listing)
	if (<array_size> > 0)
		index = 0
		begin
		if structurecontains structure = ($jam_curr_directory_listing [<index>]) downloaded
			if (($jam_curr_directory_listing [<index>].downloaded) = 1)
				<downloaded_song_count> = (<downloaded_song_count> + 1)
			else
				<user_song_count> = (<user_song_count> + 1)
			endif
		else
			<user_song_count> = (<user_song_count> + 1)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	printf channel = jam_mode qs(0xc2a66e62) a = <user_song_count> b = <downloaded_song_count>
	return user_song_count = <user_song_count> downloaded_song_count = <downloaded_song_count>
endscript
memcard_jamsession_file_name = qs(0xef150ff7)
memcard_jamsession_new_file_name = qs(0xef150ff7)
memcard_jamsession_artist = qs(0x5fc9bc15)
memcard_jamsession_song_version = 0
memcard_jamsession_downloaded = 0
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

script jam_save_song_setup 
	printf \{channel = jam_mode
		qs(0xbc408dca)}
	if isxenon
		getlocalgamertag controller = ($primary_controller)
		setsonginfo artist = <gamertag>
	else
		netsessionfunc func = get_gamertag controller = ($primary_controller)
		if NOT gotparam \{name}
			name = qs(0x73ffc0e7)
		endif
		setsonginfo artist = <name>
	endif
	if NOT gotparam \{song}
		if ($jam_band_new_song = 0)
			create_overwrite_menu
			clean_up_user_control_helpers
			song = $jam_selected_song
		else
			create_save_menu
			clean_up_user_control_helpers
			jam_recording_get_unique_name
		endif
	else
		create_save_menu
		clean_up_user_control_helpers
	endif
	getarraysize \{$jam_tracks}
	index = 0
	begin
	gem_array = ($jam_tracks [<index>].gem_array)
	processhammerons name = <gem_array> name_fretbar = editable_fretbars
	<index> = (<index> + 1)
	repeat (<array_size> - 1)
	jam_save_scale
	jam_save_effect
	jam_clear_clipboards
	formattext \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if globalexists name = <undo_clipboard_array> type = array
		printf \{channel = jam_mode
			qs(0xfed3c437)}
		destroyscriptarray name = <undo_clipboard_array>
	endif
	change memcard_jamsession_file_name = <song>
endscript

script jam_save_song_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
endscript

script jam_recording_get_unique_name \{prefix = qs(0xef150ff7)}
	song_name = <prefix>
	directorylisting = $jam_curr_directory_listing
	getarraysize <directorylisting>
	if (<array_size> > 0)
		unique_name = 1
		index = 0
		begin
		if (<song_name> = (<directorylisting> [<index>].filename))
			<unique_name> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT (<unique_name> = 1)
			name_count = 1
			begin
			formattext textname = song_name qs(0x7b1de562) a = <prefix> s = <name_count>
			unique_name = 1
			index = 0
			begin
			if (<song_name> = (<directorylisting> [<index>].filename))
				<unique_name> = 0
				break
			endif
			<index> = (<index> + 1)
			repeat <array_size>
			<name_count> = (<name_count> + 1)
			if (<unique_name> = 1)
				break
			endif
			repeat
		endif
	endif
	stringlength string = <song_name>
	printf channel = jam_mode qs(0x1f1c4e00) a = <song_name> b = <str_len>
	if (<str_len> > 17)
		stringlength string = <prefix>
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
	formattext textname = filename qs(0xf7e8d767) s = <count> d = <d>
	printf channel = jam_mode qs(0x8c8718b7) s = <filename>
	change memcard_jamsession_file_name = <filename>
	change \{memcard_after_func = debug_create_jam_song_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			show_popup = 0
		}}
	block \{type = debug_create_jam_song}
	printf channel = jam_mode qs(0x48440232) s = <filename>
	jam_recording_cleanup
	wait \{1
		second}
	<count> = (<count> + 1)
	repeat <num_songs>
endscript

script debug_create_jam_song_after_func 
	broadcastevent \{type = debug_create_jam_song}
endscript
