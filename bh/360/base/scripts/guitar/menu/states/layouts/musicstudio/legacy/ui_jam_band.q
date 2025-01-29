jamroom_auto_play = 0

script ui_create_jam_band \{tutorial = 0}
	musicstudio_mainobj :MusicStudioJamRoom_OnCreate
	create_highway_root_window
	spawnscriptnow create_jam_band_menu id = jam_band_spawns params = {<...>}
	musicstudio_stop_menu_music
	Change \{jamroom_auto_play = 1}
endscript

script ui_destroy_jam_band 
	musicstudio_mainobj :MusicStudioJamRoom_OnDestroy
	<ii> = 0
	begin
	musicstudio_jamroom_remove_joing_player_handler controller = <ii>
	<ii> = (<ii> + 1)
	repeat 4
	destroy_jam_band_menu
	destroy_dialog_box
	jam_force_kill_tutorial \{status = force_exit}
	destroy_highway_root_window
	jam_stop_all_samples
endscript

script ui_init_jam_band 
	Change \{jam_current_bpm = 120}
	musicstudio_mainobj :MusicStudioJamRoom_OnEnter
	musicstudio_mainobj :MusicStudio_Init \{stream = false
		using_samples = true}
	musicstudio_mainobj :MusicStudio_ModifyGuitarTweakData
endscript

script ui_deinit_jam_band 
	musicstudio_reinit_in_game_players
	musicstudio_mainobj :MusicStudioJamRoom_OnExit
	musicstudio_reinit_menu_sounds
	musicstudio_mainobj :MusicStudio_RestoreGuitarTweakData
	musicstudio_jamroom_exit_cleanup
	musicstudio_start_menu_music
	Change \{select_shift = 1}
	Change \{debug_show_analog_options = 1}
	musicstudio_jamroom_destroy_play_now_helper
endscript
