audience_party_started = 0
audience_party_total_song_list_size = 0
audience_party_total_song_list_sent = 0

script audience_party_available 
	if is_ds_connected
		if ($ds_mode = audience_party)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script audience_party_init 
	removealias \{ds_event_listener}
	CreateScreenElement \{parent = root_window
		id = ds_event_listener
		Type = ContainerElement
		event_handlers = [
			{
				ds_disconnect
				0x2efcfd2d
			}
		]}
	sdcardmanagerfunc \{func = set_audience_party_mode}
	wiidscommunication :sendmessage \{set_holding_mode
		is_popup = FALSE}
	LoadPak \{'pak/ui/audience_party.pak'}
endscript

script audience_party_deinit 
	audience_party_cleanup
	DestroyScreenElement \{id = ds_event_listener}
	if ScreenElementExists \{id = audience_party_playlist_popup}
		DestroyScreenElement \{id = audience_party_playlist_popup}
	endif
	if ScriptIsRunning \{id = audience_party_send_time_elapsed_loop_script_id}
		KillSpawnedScript \{id = audience_party_send_time_elapsed_loop_script_id}
	endif
	sdcardmanagerfunc \{func = set_audience_party_mode
		OFF}
	UnLoadPak \{'pak/ui/audience_party.pak'}
endscript

script audience_party_update_dlc 
	if NOT audience_party_available
		return
	endif
	sdcardmanagerfunc \{func = force_hold_ejects}
	if sdcardmanagerfunc \{func = force_handle_events}
		audience_party_set_holding_mode \{is_popup = FALSE}
		dlccatalogmanagerfunc \{func = load_catalogs}
		begin
		if NOT dlccatalogmanagerfunc \{func = is_busy}
			break
		endif
		WaitOneGameFrame
		repeat
		audience_party_send_all_song_info
		WaitOneGameFrame
		audience_party_start_game
	endif
	sdcardmanagerfunc \{func = force_hold_ejects
		OFF}
endscript

script audience_party_start_game \{paused = 0
		reset_time = 1}
	if NOT audience_party_available
		return
	endif
	SpawnScriptNow audience_party_start_game_spawned params = {<...>}
endscript

script audience_party_start_game_spawned \{paused = 0
		reset_time = 1}
	Change \{audience_party_started = 1}
	Change \{audience_party_ignore_setlist_update_messages = FALSE}
	audience_party_send_setlist
	if NOT ScriptIsRunning \{id = audience_party_send_time_elapsed_loop_script_id}
		SpawnScriptNow \{audience_party_send_time_elapsed_loop
			id = audience_party_send_time_elapsed_loop_script_id}
	endif
	wiidscommunication :sendmessage \{start_mode}
	if (<reset_time> = 1)
		Wait \{0.25
			Seconds}
		audience_party_reset_time_elapsed
	endif
	if (<paused> = 1)
		Wait \{0.25
			Seconds}
		audience_party_pause_game
	else
		Wait \{0.25
			Seconds}
		audience_party_resume_game
	endif
endscript

script audience_party_send_time_elapsed 
	if ($audience_party_started = 1)
		GetSongTimeMs
		CastToInteger \{time}
		wiidscommunication :sendmessage set_time_elapsed time = <time>
		if GotParam \{resume}
			Wait \{0.25
				Seconds}
			audience_party_resume_game
		endif
	endif
endscript

script audience_party_send_time_elapsed_loop 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	begin
	if ($audience_party_paused = 0)
		audience_party_send_time_elapsed
		Wait \{6
			Seconds}
	else
		Wait \{0.25
			Seconds}
	endif
	repeat
endscript

script audience_party_reset_time_elapsed 
	if NOT audience_party_available
		return
	endif
	wiidscommunication :sendmessage \{set_time_elapsed
		time = 0}
endscript

script audience_party_set_holding_mode \{is_popup = FALSE}
	if NOT audience_party_available
		return
	endif
	Change \{audience_party_ignore_setlist_update_messages = true}
	wiidscommunication :sendmessage set_holding_mode is_popup = <is_popup> send_immediately = true
endscript

script 0x6006702e 
	if NOT audience_party_available
		return
	endif
	audience_party_set_holding_mode
	audience_party_cleanup
endscript

script audience_party_cleanup 
	Change \{audience_party_started = 0}
endscript
audience_party_paused = 0

script audience_party_pause_game 
	if ($audience_party_started = 1)
		wiidscommunication :sendmessage \{pause_mode
			send_immediately = true}
		Change \{audience_party_paused = 1}
	endif
endscript

script audience_party_resume_game 
	if ($audience_party_started = 1)
		wiidscommunication :sendmessage \{resume_mode}
		Change \{audience_party_paused = 0}
	endif
endscript

script audience_party_get_current_playlist 
	gman_songfunc \{func = get_playlist_size}
	<playlist_size> = (<playlist_size> -1)
	current_playlist = []
	if (<playlist_size> > 0)
		i = 1
		begin
		gman_songfunc func = get_songname_by_index params = {index = <i>}
		AddArrayElement array = <current_playlist> element = <requested_song_name>
		<current_playlist> = <array>
		<i> = (<i> + 1)
		repeat <playlist_size>
	endif
	return current_playlist = <current_playlist> playlist_size = <playlist_size>
endscript
audience_party_ignore_setlist_update_messages = FALSE

script audience_party_set_unplayed_setlist_songs 
	if NOT GotParam \{songs}
		printf \{qs(0xd4ad8bfd)}
		return
	endif
	if NOT is_ds_connected
		return
	endif
	if ($audience_party_ignore_setlist_update_messages = true)
		return
	endif
	audience_party_get_current_playlist
	playlist_backup = <current_playlist>
	if (<playlist_size> > 0)
		next_up_backup = (<playlist_backup> [0])
	else
		next_up_backup = _nothing
	endif
	GetArraySize <songs>
	if (<array_Size> > 0)
		next_up = (<songs> [0])
	else
		next_up = _nothing
	endif
	gman_songfunc \{func = 0xc84f681d}
	gman_songfunc func = add_song_array_to_play_list params = {
		song_array = <songs>
		insert_at = back
	}
	if audience_party_should_show_playlist_popup
		if ((<next_up> != _nothing) && (<next_up> != <next_up_backup>))
			message_type_text = qs(0x36cd78db)
			song_checksum = <next_up>
		elseif (<array_Size> > <playlist_size>)
			message_type_text = qs(0x844fbae6)
			bigger_array = <songs>
			smaller_array = <playlist_backup>
		elseif (<array_Size> < <playlist_size>)
			message_type_text = qs(0x3c8b9295)
			bigger_array = <playlist_backup>
			smaller_array = <songs>
		endif
		if GotParam \{bigger_array}
			GetArraySize <bigger_array>
			i = 0
			if NOT GotParam \{smaller_array}
				smaller_array = []
			endif
			begin
			song_checksum = (<bigger_array> [<i>])
			if NOT ArrayContains array = <smaller_array> contains = <song_checksum>
				break
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
		if GotParam \{song_checksum}
			get_song_title song = <song_checksum>
			formatText TextName = message_text qs(0x76b3fda7) d = <song_title>
			SpawnScriptNow audience_party_create_playlist_popup params = {
				message_text = <message_text>
				message_type_text = <message_type_text>
				position = $sysnotify_ingame_position
				display_time = 7.5
			}
		endif
	endif
endscript

script audience_party_create_playlist_popup \{fade_time = 0.25}
	RequireParams \{[
			position
			display_time
			message_type_text
			message_text
		]
		all}
	gh5_band_screen_ui_sound \{choose = 1}
	convert_notification_position Pos = <position>
	if NOT ScreenElementExists \{id = audience_party_playlist_popup}
		CreateScreenElement {
			id = audience_party_playlist_popup
			parent = root_window
			Type = descinterface
			desc = 'ds_party_play_notification'
			message_type_text = <message_type_text>
			message_text = <message_text>
			z_priority = 2970
		}
		<id> :desc_resolvealias Name = alias_notificationbox
		<resolved_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just> alpha = 0.0
	else
		<id> = audience_party_playlist_popup
		<id> :se_setprops message_type_text = <message_type_text> message_text = <message_text>
	endif
	if ScriptIsRunning \{audience_party_animate_playlist_popup}
		KillSpawnedScript \{Name = audience_party_animate_playlist_popup}
	endif
	<id> :obj_spawnscript audience_party_animate_playlist_popup params = {
		position = <position>
		display_time = <display_time>
		fade_time = <fade_time>
	}
endscript

script audience_party_animate_playlist_popup \{fade_time = 0.25}
	setscriptcannotpause
	RequireParams \{[
			position
			display_time
		]
		all}
	Obj_GetID
	<objID> :desc_resolvealias Name = alias_notificationbox
	notif_id = <resolved_id>
	<notif_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just>
	<notif_id> :se_setprops alpha = 1.0 time = <fade_time>
	if ScriptIsRunning \{audience_party_scroll_playlist_popup_text}
		KillSpawnedScript \{Name = audience_party_scroll_playlist_popup_text}
	endif
	desc_resolvealias \{Name = alias_message_text_container}
	<resolved_id> :se_setprops Pos = (0.0, 0.0)
	se_setprops \{message_dims = (0.0, 40.0)
		message_copy_alpha = 0}
	se_getprops
	window_width = (<message_text_window_dims> [0])
	text_width = ((<message_dims> [0]) * (<message_scale> [0]))
	if (<text_width> > <window_width>)
		<objID> :obj_spawnscript audience_party_scroll_playlist_popup_text
		begin
		WaitOneGameFrame
		if ($ds_popup_is_scrolling = 0)
			break
		endif
		repeat
	else
		<notif_id> :se_waitprops
		Wait <display_time> Seconds
	endif
	<notif_id> :se_setprops alpha = 0.0 time = <fade_time>
	<notif_id> :se_waitprops
endscript
ds_popup_is_scrolling = 0
ds_popup_scroll_first_delay = 1.8
ds_popup_scroll_speed = 100.0
ds_popup_copy_offset = 130.0
ds_popup_scroll_second_delay = 1.8

script audience_party_scroll_playlist_popup_text \{no_repeat = true}
	Change \{ds_popup_is_scrolling = 1}
	se_getprops
	text_width = ((<message_dims> [0]) * (<message_scale> [0]))
	message_copy_posx = (<text_width> + $ds_popup_copy_offset)
	se_setprops message_copy_pos = ((1.0, 0.0) * <message_copy_posx>)
	se_setprops \{message_copy_alpha = 1}
	scroll_time = (<message_copy_posx> / $ds_popup_scroll_speed)
	desc_resolvealias \{Name = alias_message_text_container}
	begin
	Wait \{$ds_popup_scroll_first_delay
		Seconds}
	<resolved_id> :se_setprops Pos = ((-1.0, 0.0) * <message_copy_posx>) time = <scroll_time>
	<resolved_id> :se_waitprops
	<resolved_id> :se_setprops Pos = (0.0, 0.0)
	if (<no_repeat> = true)
		break
	endif
	repeat
	Wait \{$ds_popup_scroll_second_delay
		Seconds}
	Change \{ds_popup_is_scrolling = 0}
endscript

script audience_party_should_show_playlist_popup 
	if is_ui_event_running
		return \{FALSE}
	endif
	ui_event_get_top
	if (<base_name> != 'gameplay')
		return \{FALSE}
	endif
	if ScreenElementExists \{id = dialog_box_container}
		return \{FALSE}
	endif
	return \{true}
endscript

script audience_party_hide_playlist_popup 
	KillSpawnedScript \{Name = audience_party_animate_playlist_popup}
	if ScreenElementExists \{id = audience_party_playlist_popup}
		audience_party_playlist_popup :desc_resolvealias \{Name = alias_notificationbox}
		<resolved_id> :se_setprops alpha = 0.0
	endif
endscript

script audience_party_send_setlist 
	gman_songfunc \{func = get_playlist_size}
	wiidscommunication :sendmessage setlist_length length = <playlist_size>
	index = 0
	if (<playlist_size> > 0)
		begin
		gman_songfunc func = get_songname_by_index params = {index = <index>}
		wiidscommunication :sendmessage setlist_entry index = <index> song = <requested_song_name>
		<index> = (<index> + 1)
		Wait \{1
			Frame}
		repeat <playlist_size>
	endif
	gman_songfunc \{func = get_current_song_playlist_index}
	wiidscommunication :sendmessage current_song_index index = <current_song_index>
endscript

script audience_party_count_all_songs 
	Change \{audience_party_total_song_list_size = 0}
	songlist_all = $gh_songlist
	GetArraySize <songlist_all>
	<num_lists> = <array_Size>
	i = 0
	begin
	SongList = ((<songlist_all> [<i>]).list)
	GetArraySize $<SongList>
	<num_songs> = <array_Size>
	j = 0
	if (<num_songs> > 0)
		begin
		current_song = (($<SongList>) [<j>])
		if is_song_downloaded song_checksum = <current_song>
			Change audience_party_total_song_list_size = ($audience_party_total_song_list_size + 1)
		endif
		<j> = (<j> + 1)
		repeat <num_songs>
	endif
	<i> = (<i> + 1)
	repeat <num_lists>
endscript

script audience_party_send_all_song_info 
	Change \{audience_party_total_song_list_sent = 0}
	songlist_all = $gh_songlist
	GetArraySize <songlist_all>
	<num_lists> = <array_Size>
	i = 0
	begin
	SongList = ((<songlist_all> [<i>]).list)
	GetArraySize $<SongList>
	<num_songs> = <array_Size>
	j = 0
	if (<num_songs> > 0)
		begin
		if NOT is_ds_connected
			break
		endif
		current_song = (($<SongList>) [<j>])
		if is_song_downloaded song_checksum = <current_song>
			audience_party_send_song_info send_song = <current_song> needs_sd = <content_on_sd> needs_sd = <patch_on_sd>
			Change audience_party_total_song_list_sent = ($audience_party_total_song_list_sent + 1)
		endif
		RemoveParameter \{content_on_sd}
		RemoveParameter \{patch_on_sd}
		<j> = (<j> + 1)
		Wait \{1
			Frame}
		repeat <num_songs>
	endif
	<i> = (<i> + 1)
	repeat <num_lists>
endscript

script audience_party_send_song_info \{send_song}
	if NOT GotParam \{send_song}
		printf \{qs(0x916cf612)}
		return
	endif
	get_song_title song = <send_song>
	get_song_artist song = <send_song> with_year = 0
	get_song_artist_text song = <send_song>
	get_song_year song = <send_song>
	get_song_genre song = <send_song>
	if GotParam \{send_true_song_duration}
		songfilemanager func = get_song_end_time song_name = <send_song>
		CastToInteger \{total_end_time}
		song_duration_secs = (<total_end_time> / 1000)
	else
		get_song_duration_secs song = <send_song>
	endif
	get_song_source song_name = <send_song>
	get_song_difficulty_ratings song = <send_song>
	0x0c8441c3 Source = <Source>
	0x6a00296b genre = <genre>
	song_artist_text_flag = 0
	if (<song_artist_text> = $artist_text_as_made_famous_by)
		song_artist_text_flag = 1
	endif
	wiidscommunication :sendmessage song_info {
		checksum = <send_song>
		title = <song_title>
		artist = <song_artist>
		artist_text = <song_artist_text_flag>
		year = <year>
		genre = <genre_enum>
		Duration = <song_duration_secs>
		Source = <source_enum>
		difficulty_guitar = <guitar_difficulty_rating>
		difficulty_bass = <bass_difficulty_rating>
		difficulty_vocals = <vocals_difficulty_rating>
		difficulty_drums = <drums_difficulty_rating>
		needs_sd = <needs_sd>
	}
endscript

script audience_party_send_sd_eject 
	wiidscommunication :sendmessage \{sd_card_ejected}
endscript

script 0x0c8441c3 
	if NOT GotParam \{Source}
		printf \{qs(0xb64575fe)}
		return
	endif
	0x724855d0 = 0
	switch <Source>
		case gh4
		0x724855d0 = 1
		case gh4_dlc
		0x724855d0 = 2
		case gh4_1
		0x724855d0 = 3
		case gh4_2
		0x724855d0 = 4
		case gh4_3
		0x724855d0 = 5
		case 0xd5072a1f
		0x724855d0 = 6
		case gh5_dlc
		0x724855d0 = 7
		case 0x86cb6945
		0x724855d0 = 8
		case gh5_1_dlc
		0x724855d0 = 9
		case gh5_2
		0x724855d0 = 10
		case gh5_3
		0x724855d0 = 11
		case gh5_4
		0x724855d0 = 12
	endswitch
	return source_enum = <0x724855d0>
endscript

script 0x6a00296b 
	if NOT GotParam \{genre}
		printf \{qs(0x47c4032a)}
		return
	endif
	genre_enum = 0
	switch <genre>
		case rock
		genre_enum = 1
		case grunge
		genre_enum = 2
		case `hard	rock`
		genre_enum = 3
		case `classic	rock`
		genre_enum = 4
		case `southern	rock`
		genre_enum = 5
		case `progressive	rock`
		genre_enum = 6
		case `prog	rock`
		genre_enum = 7
		case alternative
		genre_enum = 8
		case `modern	rock`
		genre_enum = 9
		case rockabilly
		genre_enum = 10
		case `new	wave`
		genre_enum = 11
		case country
		genre_enum = 12
		case electronic
		genre_enum = 13
		case dance
		genre_enum = 14
		case pop
		genre_enum = 15
		case `pop	rock`
		genre_enum = 16
		case `indie	rock`
		genre_enum = 17
		case `blues	rock`
		genre_enum = 18
		case reggae
		genre_enum = 19
		case `r&b`
		genre_enum = 20
		case blues
		genre_enum = 21
		case jazz
		genre_enum = 22
		case `heavy	metal`
		genre_enum = 23
		case `surf	rock`
		genre_enum = 24
		case metal
		genre_enum = 25
		case `glam	rock`
		genre_enum = 26
		case `death	metal`
		genre_enum = 27
		case `speed	metal`
		genre_enum = 28
		case `black	metal`
		genre_enum = 29
		case `nu	metal`
		genre_enum = 30
		case experimental
		genre_enum = 31
		case industrial
		genre_enum = 32
		case `big	band`
		genre_enum = 33
		case international
		genre_enum = 34
		case funk
		genre_enum = 35
		case disco
		genre_enum = 36
		case hip_hop
		genre_enum = 37
		case punk
		genre_enum = 38
		case `hardcore	punk`
		genre_enum = 39
		case hardcore
		genre_enum = 40
		case `pop	punk`
		genre_enum = 41
		case `ska	punk`
		genre_enum = 42
		case other
		genre_enum = 43
	endswitch
	return genre_enum = <genre_enum>
endscript

script 0x2efcfd2d 
	displaynotification \{qs(0xb151e48a)}
	audience_party_deinit
	ui_event_get_top
	if (<base_name> = 'gameplay')
		gamemode_gettype
		if (<Type> = freeplay)
			if NOT ScreenElementExists \{id = dialog_box_desc_id}
				freeplay_get_num_active_players
				if (<num_active_players> = 0)
					freeplay_setup_root_helper_pills
				endif
			endif
		endif
	endif
endscript

script audience_party_maybe_halt_loading 
	begin
	if audience_party_should_halt_loading
		Wait \{1
			Frame}
	else
		break
	endif
	repeat
endscript

script audience_party_should_halt_loading 
	if is_ui_event_running
		return \{true}
	endif
	ui_event_get_top
	if (<base_name> = 'ds_connection_handler')
		return \{true}
	endif
	if (<base_name> = 'audience_party_splash_screen')
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x2366ee22 
	RequireParams \{[
			song_checksum
		]
		all}
	if StructureContains structure = $gh_songlist_props <song_checksum>
		formatText checksumName = challenge_global 'c_%s' s = (($gh_songlist_props.<song_checksum>).Name)
	else
		challenge_global = 0x702e6402
	endif
	if NOT GlobalExists Name = <challenge_global>
		0xdea32b8d = qs(0x6a5cf46c)
	else
		0xdea32b8d = ($<challenge_global>.descrip)
	endif
	wiidscommunication :sendmessage 0x5c279bf7 string = <0xdea32b8d>
endscript

script audience_party_full_pause_game 
	if NOT audience_party_available
		return
	endif
	wiidscommunication :sendmessage \{set_holding_mode
		is_popup = FALSE
		send_immediately = true}
endscript

script audience_party_full_resume_game 
	if NOT audience_party_available
		return
	endif
	wiidscommunication :sendmessage \{start_mode}
endscript
