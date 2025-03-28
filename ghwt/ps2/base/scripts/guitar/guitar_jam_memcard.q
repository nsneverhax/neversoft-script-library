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




	GetArraySize ($jam_curr_directory_listing)



	GetArraySize ($jam_controller_directory_listing_0)



	GetArraySize ($jam_controller_directory_listing_1)



	GetArraySize ($jam_controller_directory_listing_2)



	GetArraySize ($jam_controller_directory_listing_3)



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

	print_jam_directory_listings
endscript

script jam_update_curr_directory_listing \{controller = 0}
	print_jam_directory_listings
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	formatText checksumName = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists Name = <controller_directory_listing>
		directorylisting = ($<controller_directory_listing>)
		Change jam_curr_directory_listing = <directorylisting>
	endif

	print_jam_directory_listings
endscript

script jam_get_num_songs 
	user_song_count = 0
	downloaded_song_count = 0
	GetArraySize ($jam_curr_directory_listing)
	if (<array_Size> > 0)
		index = 0
		begin
		if StructureContains structure = ($jam_curr_directory_listing [<index>]) downloaded
			if (($jam_curr_directory_listing [<index>].downloaded) = 1)
				<downloaded_song_count> = (<downloaded_song_count> + 1)
			else
				<user_song_count> = (<user_song_count> + 1)
			endif
		else
			<user_song_count> = (<user_song_count> + 1)
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif

	return user_song_count = <user_song_count> downloaded_song_count = <downloaded_song_count>
endscript
memcard_jamsession_file_name = qs(0xef150ff7)
memcard_jamsession_new_file_name = qs(0xef150ff7)
memcard_jamsession_ps2_file_name = 'Hermaflamingo'
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
memcard_jamsession_content_name = qs(0xcf50afcb)

script jam_save_song_setup 

	if NOT GotParam \{song}
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
	formatText \{checksumName = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists Name = <undo_clipboard_array> Type = array

		destroyscriptarray Name = <undo_clipboard_array>
	endif
	Change memcard_jamsession_file_name = <song>
endscript

script jam_save_song_unload 
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
endscript

script jam_recording_get_unique_name \{prefix = qs(0xef150ff7)}
	song_name = <prefix>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_Size> > 0)
		unique_name = 1
		index = 0
		begin
		if 0x010d8fc7 s1 = <song_name> 0x72e396b5 = (<directorylisting> [<index>].FileName)
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
			if 0x010d8fc7 s1 = <song_name> 0x72e396b5 = (<directorylisting> [<index>].FileName)
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
	endif
	StringLength string = <song_name>

	if (<str_len> > 17)
		StringLength string = <prefix>
		stringncopy string = <prefix> length = (<str_len> - 1)
		jam_recording_get_unique_name prefix = <new_string>
		<song_name> = <song>
	else

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

	Change memcard_jamsession_file_name = <FileName>
	Change \{memcard_after_func = debug_create_jam_song_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			show_popup = 0
		}}
	Block \{Type = debug_create_jam_song}

	jam_recording_cleanup
	Wait \{1
		Second}
	<count> = (<count> + 1)
	repeat <num_songs>
endscript

script debug_create_jam_song_after_func 
	broadcastevent \{Type = debug_create_jam_song}
endscript
