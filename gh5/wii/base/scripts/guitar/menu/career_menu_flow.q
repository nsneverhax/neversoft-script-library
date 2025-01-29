
script career_enter_band_name_flow_state_func 
	ScriptAssert \{'career_enter_band_name_flow_state_func: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script get_current_first_play 
	get_band_game_mode_name
	formatText checksumName = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id>
	return first_play = <first_play>
endscript

script career_select_difficulty_flow_state_func 
	if ($game_mode = career)
		register_new_progression_atoms
	endif
	get_current_first_play
	generic_event_choose \{data = {
			state = uistate_singleplayer_character_hub
			Player = 1
		}}
endscript

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
	KillSpawnedScript \{Name = Failed_Song_Pitch_Down}
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	restart_song
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
