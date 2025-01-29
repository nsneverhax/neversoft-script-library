audience_party_ds_disconnect_timeout_secs = 15.0
audience_party_ds_genre_enum_order = [
	Misc
	rock
	grunge
	`hard	rock`
	`classic	rock`
	`southern	rock`
	`progressive	rock`
	`prog	rock`
	alternative
	`modern	rock`
	rockabilly
	`new	wave`
	country
	electronic
	dance
	pop
	`pop	rock`
	`indie	rock`
	`blues	rock`
	reggae
	`r&b`
	blues
	jazz
	`heavy	metal`
	`surf	rock`
	metal
	`glam	rock`
	`death	metal`
	`speed	metal`
	`black	metal`
	`nu	metal`
	experimental
	industrial
	`big	band`
	international
	funk
	disco
	hip_hop
	punk
	`hardcore	punk`
	hardcore
	`pop	punk`
	`ska	punk`
	other
]
audience_party_ds_source_enum_order = [
	None
	gh4
	gh4_dlc
	gh4_1
	gh4_2
	gh4_3
	gh5
	gh5_dlc
	gh5_1
	gh5_1_dlc
	gh5_2
	gh5_3
	gh5_4
	gh6
	gh6_dlc
]
audience_party_micromanager_achievement_song_count = 15
audience_party_roadie_names = [
	party_roadie1
	party_roadie2
	party_roadie3
	party_roadie4
]
audience_party_started = 0
audience_party_total_song_list_size = 0
audience_party_total_song_list_sent = 0
audience_party_ds_songs_played = 0
audience_party_roadie_avatar = -1
audience_party_ignore_setlist_update_messages = FALSE

script audience_party_available 
	if is_ds_connected
		if ($ds_mode = audience_party)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script audience_party_init 
	CreateScreenElement \{parent = root_window
		id = audience_party_ds_event_listener
		Type = ContainerElement
		event_handlers = [
			{
				ds_connect
				audience_party_handle_ds_connect
			}
			{
				ds_disconnect
				audience_party_handle_ds_disconnect
			}
		]}
	sdcardmanagerfunc \{func = set_audience_party_mode}
	wiidscommunication :sendmessage \{set_holding_mode
		is_popup = FALSE}
	LoadPak \{'pak/ui/audience_party.pak'}
	Change \{audience_party_ds_songs_played = 0}
endscript

script audience_party_deinit 
	audience_party_cleanup
	DestroyScreenElement \{id = audience_party_ds_event_listener}
	if ScreenElementExists \{id = audience_party_playlist_popup}
		DestroyScreenElement \{id = audience_party_playlist_popup}
	endif
	if ScriptIsRunning \{audience_party_send_time_elapsed_loop_script_id}
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
	audience_party_send_setlist
	Change \{audience_party_ignore_setlist_update_messages = FALSE}
	if NOT ScriptIsRunning \{audience_party_send_time_elapsed_loop_script_id}
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
	playlist_getsize
	<playlist_size> = (<playlist_size> -1)
	current_playlist = []
	if (<playlist_size> > 0)
		i = 1
		begin
		playlist_getsongname index = <i>
		AddArrayElement array = <current_playlist> element = <requested_song_name>
		<current_playlist> = <array>
		<i> = (<i> + 1)
		repeat <playlist_size>
	endif
	return current_playlist = <current_playlist> playlist_size = <playlist_size>
endscript

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
	playlist_removeunplayedsongs
	<i> = 0
	if (<array_Size> > 0)
		begin
		playlist_addsong song = (<songs> [<i>]) additional_props = {added_from_ds = 1} insert_at = back
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
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
	fire_achievement Name = achievement_roadierequester controller = ($primary_controller)
endscript

script audience_party_create_playlist_popup \{fade_time = 0.25}
	RequireParams \{[
			position
			display_time
			message_type_text
			message_text
		]
		all}
	audio_ui_band_lobby_sfx_logic \{choose = 1}
	convert_notification_position Pos = <position>
	<roadie_texture> = ($audience_party_roadie_names [$audience_party_roadie_avatar])
	if NOT ScreenElementExists \{id = audience_party_playlist_popup}
		CreateScreenElement {
			id = audience_party_playlist_popup
			parent = root_window
			Type = descinterface
			desc = 'ds_party_play_notification'
			message_type_text = <message_type_text>
			message_text = <message_text>
			roadie_portrait_texture = <roadie_texture>
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
	halt_wii_notifications
	OnExitRun \{allow_wii_notifications}
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
	playlist_getsize
	wiidscommunication :sendmessage setlist_length length = <playlist_size>
	index = 0
	if (<playlist_size> > 0)
		begin
		playlist_getsongname index = <index>
		wiidscommunication :sendmessage setlist_entry index = <index> song = <requested_song_name>
		<index> = (<index> + 1)
		Wait \{1
			Frame}
		repeat <playlist_size>
	endif
	playlist_getcurrentsongindex
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

script audience_party_send_song_info \{send_song = !q1768515945}
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
	<source_enum> = 0
	if convert_to_ds_enum order_array_name = audience_party_ds_source_enum_order checksum_value = <Source>
		<source_enum> = <ds_enum_value>
	endif
	<genre_enum> = 0
	if convert_to_ds_enum order_array_name = audience_party_ds_genre_enum_order checksum_value = <genre>
		<genre_enum> = <ds_enum_value>
	endif
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

script audience_party_handle_ds_connect 
	displaynotification \{qs(0x87581a63)}
	KillSpawnedScript \{Name = audience_party_ds_timeout_wait}
endscript

script audience_party_handle_ds_disconnect 
	displaynotification \{qs(0x58308b52)}
	SpawnScriptNow \{audience_party_ds_timeout_wait}
endscript

script audience_party_ds_timeout_wait 
	setscriptcannotpause
	Wait \{$audience_party_ds_disconnect_timeout_secs
		Seconds}
	audience_party_notify_ds_timeout
endscript

script audience_party_notify_ds_timeout 
	displaynotification \{qs(0x61cf1e60)}
	wiidscommunication :disconnect
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
	if (<base_name> = 'roadie_battle_choose_mode')
		return \{true}
	endif
	return \{FALSE}
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

script audience_party_song_won 
	if NOT audience_party_available
		return
	endif
	playlist_getcurrentsongprops
	<from_ds> = FALSE
	if StructureContains structure = <additional_props> added_from_ds
		if ((<additional_props>.added_from_ds) = 1)
			<from_ds> = true
		endif
	endif
	if (<from_ds> = true)
		getnumplayersingame
		if (<num_players> > 0)
			Change audience_party_ds_songs_played = ($audience_party_ds_songs_played + 1)
			if ($audience_party_ds_songs_played >= $audience_party_micromanager_achievement_song_count)
				fire_achievement Name = achievement_roadiemicromanager controller = ($primary_controller)
			endif
		endif
	else
		Change \{audience_party_ds_songs_played = 0}
	endif
endscript

script audience_party_set_roadie_avatar \{roadie_avatar = !i1768515945}
	Change audience_party_roadie_avatar = <roadie_avatar>
endscript
