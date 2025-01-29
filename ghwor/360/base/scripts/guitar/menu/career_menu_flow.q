
script lefty_flip_func 
	getplayerinfo <Player> lefty_flip
	setplayerinfo <Player> lefthanded_gems = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip>
	if (<lefty_flip>)
		Change \{pad_event_up_inversion = true}
	else
		Change \{pad_event_up_inversion = FALSE}
	endif
	if ($game_mode = practice)
		practice_restart_song
	else
		career_restart_song
	endif
endscript

script career_restart_song 
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	if quest_progression_is_chapter_finale
		set_chapter_venue_intro_flags \{value = 1}
	endif
	restart_song
	if (($g_enable_pause_for_drum_type_missmatch) = 1)
		Change \{g_enable_pause_for_drum_type_missmatch = 0}
		enable_pause
	endif
endscript

script career_song_ended_select_quit 
	if ($debug_playcredits_active = 1)
		Change \{debug_playcredits_active = 0}
	endif
	kill_gem_scroller <...>
endscript

script start_encore 
	printf \{qs(0x0cfa1258)}
endscript
default_loading_screen = {
	create = create_loading_screen
	Destroy = destroy_loading_screen
}
