
script lefty_flip_func 
	getplayerinfo <player> lefty_flip
	setplayerinfo <player> lefthanded_gems = <lefty_flip>
	setplayerinfo <player> lefthanded_button_ups = <lefty_flip>
	if (<lefty_flip>)
		change \{pad_event_up_inversion = true}
	else
		change \{pad_event_up_inversion = false}
	endif
	if ($game_mode = practice)
		practice_restart_song
	else
		career_restart_song
	endif
endscript

script career_restart_song 
	killspawnedscript \{name = guitarevent_songwon_spawned}
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	restart_song
endscript

script career_song_ended_select_quit 
	if ($debug_playcredits_active = 1)
		change \{debug_playcredits_active = 0}
	endif
	kill_gem_scroller <...>
endscript

script start_encore 
	printf \{qs(0x0cfa1258)}
endscript
default_loading_screen = {
	create = create_loading_screen
	destroy = destroy_loading_screen
}
