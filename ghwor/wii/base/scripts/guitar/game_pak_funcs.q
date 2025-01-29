g_current_game_pak = NULL

script load_game_pak \{Heap = quota_sprites}
	printscriptinfo \{channel = clayton
		'load_game_pak'}
	wii_timer_start \{label = 'oogame'}
	game_pak = 'pak/oogame/oogame.pak'
	if inroadiebattlemode
		game_pak = 'pak/oogame/oogamerb.pak'
	endif
	if (<game_pak> != $g_current_game_pak)
		Change g_current_game_pak = <game_pak>
		LoadPak $g_current_game_pak Heap = <Heap>
	endif
	wii_timer_stop \{label = 'oogame'}
endscript

script unload_game_pak \{Wait = FALSE}
	printscriptinfo \{channel = clayton
		'unload_game_pak'}
	if ($g_current_game_pak != NULL)
		UnLoadPak \{$g_current_game_pak}
		if (<Wait> = true)
			WaitUnloadPak \{$g_current_game_pak}
		endif
		Change \{g_current_game_pak = NULL}
	endif
endscript
