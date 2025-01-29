musicstudio_menu_restore_flag_1 = 0
musicstudio_menu_restore_flag_2 = 0
musicstudio_menu_restore_flag_3 = 0
musicstudio_menu_restore_flag_4 = 0

script musicstudio_pause_player 
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		GetPlayerInfo <player> controller
		FormatText checksumname = handler 'join_player_handler_%p' p = <controller>
		if ScreenElementExists id = <handler>
			if (<Pause> = true)
				LaunchEvent type = unfocus target = <handler>
			else
				LaunchEvent type = focus target = <handler>
			endif
		endif
		if musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
			FormatText checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
			FormatText checksumname = musicstudio_menu_restore 'musicstudio_menu_restore_%s' s = <player>
			FormatText checksumname = musicstudio_menu_restore_flag 'musicstudio_menu_restore_flag_%s' s = <player>
			Change globalname = <musicstudio_menu_restore_flag> newValue = 1
			if (<Pause> = true)
				if ScreenElementExists id = <musicstudio_menu>
					if <musicstudio_menu> :Desc_ResolveAlias name = alias_jamroom_player_menu param = jamroom_player_menu
						<jamroom_player_menu> :Desc_ResolveAlias name = alias_scrolling_menu_elements param = scrolling_menu_elements
						<jamroom_player_menu> :Desc_ResolveAlias name = alias_change_value_cont param = change_value_cont
						if IsScreenElementInFocus id = <scrolling_menu_elements>
							printf channel = music_studio qs(0xa2a106bb) a = <player>
							LaunchEvent type = unfocus target = <scrolling_menu_elements>
							AssignAlias id = <scrolling_menu_elements> alias = <musicstudio_menu_restore>
						elseif IsScreenElementInFocus id = <change_value_cont>
							printf channel = music_studio qs(0x1f07d461) a = <player>
							LaunchEvent type = unfocus target = <change_value_cont>
							AssignAlias id = <change_value_cont> alias = <musicstudio_menu_restore>
						elseif IsScreenElementInFocus id = <jamroom_player_menu>
							printf channel = music_studio qs(0xf9638309) a = <player>
							LaunchEvent type = unfocus target = <jamroom_player_menu>
							AssignAlias id = <jamroom_player_menu> alias = <musicstudio_menu_restore>
						else
							printf \{channel = music_studio
								qs(0xd3722ba3)}
							Change globalname = <musicstudio_menu_restore_flag> newValue = 0
						endif
					endif
				endif
			else
				if ($<musicstudio_menu_restore_flag> = 1)
					if ScreenElementExists id = <musicstudio_menu_restore>
						printf channel = music_studio qs(0x5205a288) a = <player>
						LaunchEvent type = focus target = <musicstudio_menu_restore>
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_pause_all_shared \{Pause = true}
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		if (<Pause> = true)
			musicstudio_jamroom_destroy_play_now_helper
		endif
	endif
	<ii> = 1
	begin
	musicstudio_pause_player player = <ii> Pause = <Pause>
	<ii> = (<ii> + 1)
	repeat 4
endscript

script musicstudio_pause_all 
	printf \{channel = music_studio
		qs(0xbcf4acab)}
	if musicstudio_mainobj :MusicStudioJamRoom_IsInJamRoom
		musicstudio_jamroom_stop_recording_and_playing_all_players
	endif
	musicstudio_pause_all_shared \{Pause = true}
	if musicstudio_mainobj :MusicStudioGhmix_IsPlaying
		musicstudio_mainobj :MusicStudioGhmix_Play \{on = false}
		musicstudio_mainobj :MusicStudio_AddPauseAllFlag \{flag = ghmix_play}
	endif
	if musicstudio_mainobj :MusicStudio_IsSongPlaying
		musicstudio_mainobj :MusicStudio_PauseSong
		musicstudio_mainobj :MusicStudio_AddPauseAllFlag \{flag = song_playing}
	endif
endscript

script musicstudio_unpause_all 
	printf \{channel = music_studio
		qs(0x498a1853)}
	musicstudio_pause_all_shared \{Pause = false}
	if GotParam \{ghmix_play}
		musicstudio_mainobj :MusicStudioGhmix_Play \{on = true}
	endif
	if GotParam \{song_playing}
		musicstudio_mainobj :MusicStudio_PlaySong
	endif
endscript
