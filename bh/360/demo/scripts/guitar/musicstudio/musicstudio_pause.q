musicstudio_menu_restore_flag_1 = 0
musicstudio_menu_restore_flag_2 = 0
musicstudio_menu_restore_flag_3 = 0
musicstudio_menu_restore_flag_4 = 0

script musicstudio_pause_player 
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		getplayerinfo <player> controller
		formattext checksumname = handler 'join_player_handler_%p' p = <controller>
		if screenelementexists id = <handler>
			if (<pause> = true)
				launchevent type = unfocus target = <handler>
			else
				launchevent type = focus target = <handler>
			endif
		endif
		if musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
			formattext checksumname = musicstudio_menu 'musicstudio_menu_%s' s = <player>
			formattext checksumname = musicstudio_menu_restore 'musicstudio_menu_restore_%s' s = <player>
			formattext checksumname = musicstudio_menu_restore_flag 'musicstudio_menu_restore_flag_%s' s = <player>
			change globalname = <musicstudio_menu_restore_flag> newvalue = 1
			if (<pause> = true)
				if screenelementexists id = <musicstudio_menu>
					if <musicstudio_menu> :desc_resolvealias name = alias_jamroom_player_menu param = jamroom_player_menu
						<jamroom_player_menu> :desc_resolvealias name = alias_scrolling_menu_elements param = scrolling_menu_elements
						<jamroom_player_menu> :desc_resolvealias name = alias_change_value_cont param = change_value_cont
						if isscreenelementinfocus id = <scrolling_menu_elements>
							printf channel = music_studio qs(0xa2a106bb) a = <player>
							launchevent type = unfocus target = <scrolling_menu_elements>
							assignalias id = <scrolling_menu_elements> alias = <musicstudio_menu_restore>
						elseif isscreenelementinfocus id = <change_value_cont>
							printf channel = music_studio qs(0x1f07d461) a = <player>
							launchevent type = unfocus target = <change_value_cont>
							assignalias id = <change_value_cont> alias = <musicstudio_menu_restore>
						elseif isscreenelementinfocus id = <jamroom_player_menu>
							printf channel = music_studio qs(0xf9638309) a = <player>
							launchevent type = unfocus target = <jamroom_player_menu>
							assignalias id = <jamroom_player_menu> alias = <musicstudio_menu_restore>
						else
							printf \{channel = music_studio
								qs(0xd3722ba3)}
							change globalname = <musicstudio_menu_restore_flag> newvalue = 0
						endif
					endif
				endif
			else
				if ($<musicstudio_menu_restore_flag> = 1)
					if screenelementexists id = <musicstudio_menu_restore>
						printf channel = music_studio qs(0x5205a288) a = <player>
						launchevent type = focus target = <musicstudio_menu_restore>
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_pause_all_shared \{pause = true}
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		if (<pause> = true)
			musicstudio_jamroom_destroy_play_now_helper
		endif
	endif
	<ii> = 1
	begin
	musicstudio_pause_player player = <ii> pause = <pause>
	<ii> = (<ii> + 1)
	repeat 4
endscript

script musicstudio_pause_all 
	printf \{channel = music_studio
		qs(0xbcf4acab)}
	if musicstudio_mainobj :musicstudiojamroom_isinjamroom
		musicstudio_jamroom_stop_recording_and_playing_all_players
	endif
	musicstudio_pause_all_shared \{pause = true}
	if musicstudio_mainobj :musicstudioghmix_isplaying
		musicstudio_mainobj :musicstudioghmix_play \{on = false}
		musicstudio_mainobj :musicstudio_addpauseallflag \{flag = ghmix_play}
	endif
	if musicstudio_mainobj :musicstudio_issongplaying
		musicstudio_mainobj :musicstudio_pausesong
		musicstudio_mainobj :musicstudio_addpauseallflag \{flag = song_playing}
	endif
endscript

script musicstudio_unpause_all 
	printf \{channel = music_studio
		qs(0x498a1853)}
	musicstudio_pause_all_shared \{pause = false}
	if gotparam \{ghmix_play}
		musicstudio_mainobj :musicstudioghmix_play \{on = true}
	endif
	if gotparam \{song_playing}
		musicstudio_mainobj :musicstudio_playsong
	endif
endscript
