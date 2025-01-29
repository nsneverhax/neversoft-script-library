musicstudio_savesong_memory_size = 64
music_studio_non_traditional_bands = 1
musicstudio_enable_visualizers = 0
musicstudio_max_notes_per_song = 7500
musicstudio_allow_recording_past_max_notes = 0
musicstudio_mainobj_desc = {
	components = [
		{
			component = musicstudio
		}
		{
			component = MusicStudioGhmix
		}
		{
			component = MusicStudioHighway
		}
		{
			component = MusicStudioJamRoom
		}
	]
	params = {
		name = musicstudio_mainobj
	}
}
musicstudio_player_checksums = [
	musicstudio_player0
	musicstudio_player1
	musicstudio_player2
	musicstudio_player3
]

script add_music_studio_player_object 
	musicstudio_refresh_lefty_flip_flags player = <player> controller = <controller>
	<rebind_main_player> = false
	musicstudio_mainobj :MusicStudio_GetCurrMainPlayer
	if (<main_player> = null)
		<rebind_main_player> = true
	elseif musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		if <player_object> :MusicStudioPlayer_IsJamRoomPlayer
			printf qs(0xac8bc94b) s = <player_object>
			<player_object> :MusicStudioPlayer_SetJamRoomPlayer jam_room_player = <jam_room_player>
			return new_player = <player_object> do_not_refresh_highways
		endif
		if (<main_player> = <player_object>)
			<rebind_main_player> = true
		endif
		<player_object> :Die
	endif
	musicstudio_mainobj :MusicStudio_GetAvailableObjectId
	CreateCompositeObject {
		components = [
			{
				component = MusicStudioPlayer
				player = <player>
				spawn_id = <spawn_id>
			}
			{
				component = MusicStudioMenu
			}
		]
		params = {
			name = <new_player>
			controller = <controller>
			jam_room_player = <jam_room_player>
		}
	}
	if (<rebind_main_player> = true)
		musicstudio_mainobj :MusicStudio_BindPlayerObject Object = <new_player>
	endif
	return new_player = <new_player>
endscript

script musicstudio_player_on_mark_as_dead 
	GetPlayerInfo <player> controller
	if ($invite_controller = -1)
		printf channel = musicstudio qs(0xeb115c5e) a = <controller>
		NetSessionFunc func = RemoveController params = {controller = <controller>}
	else
		printf channel = musicstudio qs(0x3fa00e82) a = <controller>
	endif
endscript

script musicstudio_player_on_init 
	GetPlayerInfo <player> controller
	printf channel = musicstudio qs(0x3177b0ee) a = <controller>
	NetSessionFunc func = AddControllers params = {controller = <controller>}
endscript

script musicstudio_initialize_empty_song 
	RequireParams \{[
			FileName
		]
		all}
	FormatText TextName = filename_localized qs(0x73307931) s = <FileName>
	musicstudio_mainobj :MusicStudio_AddSong song_name = <filename_localized>
endscript

script musicstudio_play_strum_anim 
endscript

script musicstudio_is_recording_locked 
	if ($musicstudio_allow_recording_past_max_notes = 1)
		return \{false}
	endif
	musicstudio_mainobj :MusicStudio_GetNoteResourceInfo
	if (<recording_locked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script musicstudio_on_note_limit_reached 
	if ($musicstudio_allow_recording_past_max_notes = 1)
		return
	endif
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		musicstudio_jamroom_outofnotes_warning
	else
		musicstudio_show_note_limit_warning
	endif
endscript

script musicstudio_reinit_in_game_players 
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		SetPlayerInfo <player> in_game = 0
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
endscript

script musicstudio_refresh_lefty_flip_flags 
	get_controller_type controller_index = <controller>
	if (<controller_type> = Drum)
		part = Drum
	else
		part = guitar
	endif
	get_progression_instrument_user_option part = <part> controller = <controller> option = 'lefty_flip'
	if (<user_option> = -1)
		<user_option> = 0
	endif
	SetPlayerInfo <player> lefty_flip = <user_option>
	guitar_init_lefty_highway player = <player>
endscript

script musicstudio_is_text_valid 
	FormatText TextName = new_name_text '%s' s = <new_string>
	FormatText checksumname = new_name_checksum '%s' s = <new_name_text>
	prop_struct = gh_songlist_props
	if StructureContains structure = ($<prop_struct>) <new_name_checksum>
		return \{false}
	endif
	return \{true}
endscript
musicstudio_entry_unsafe_for_shutdown = 0

script musicstudio_entry_unsafe_for_shutdown_push 
	printf \{channel = bkutcher
		qs(0xfe0636a3)
		a = $musicstudio_entry_unsafe_for_shutdown}
	if ($musicstudio_entry_unsafe_for_shutdown = 0)
		Change \{musicstudio_entry_unsafe_for_shutdown = 1}
		push_unsafe_for_shutdown \{reason = enter_music_central}
	endif
endscript

script musicstudio_entry_unsafe_for_shutdown_pop 
	printf \{channel = bkutcher
		qs(0xe18fddd2)
		a = $musicstudio_entry_unsafe_for_shutdown}
	if ($musicstudio_entry_unsafe_for_shutdown = 1)
		Change \{musicstudio_entry_unsafe_for_shutdown = 0}
		pop_unsafe_for_shutdown \{reason = enter_music_central}
	endif
endscript
