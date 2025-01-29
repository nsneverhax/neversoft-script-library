
script ui_create_musicstudio_ghmix_song \{from_track = 0}
	CreateScreenElement \{parent = root_window
		id = musicstudio_ghmix
		type = DescInterface
		desc = 'musicstudio_ghmix_song'
		Pos = (0.0, 0.0)}
	musicstudio_show_nowbar \{song_mode}
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :SE_SetProps alpha = 1.0 Pos = (756.0, 31.0)
		<ghmix_menu> :SE_SetProps tip_alpha = 1 tip_text = qs(0x03ac90f0) time = 0
		musicstudio_mainobj :MusicStudio_GetMainPlayerController
		musicstudio_mainobj :MusicStudio_GetMainPlayerIdIndex
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <playerid_index>
		SetPlayerInfo <playerid_index> in_game = 1
		<player_object> :MusicStudioMenu_Init player = <playerid_index> controller = <controller>
		<player_object> :MusicStudioMenu_SetState {
			id = <ghmix_menu>
			state = ghmix_song_transport_state
		}
	endif
	musicstudio_ghmix :Obj_SpawnScriptNow \{musicstudio_ghmix_show_inst_tabs
		params = {
			animate = 0
		}}
	musicstudio_ghmix_song_init from_track = <from_track>
	musicstudio_ghmix :Obj_SpawnScript \{jam_recording_check_disconnect}
	musicstudio_force_drum_track \{song}
endscript

script ui_destroy_musicstudio_ghmix_song 
	musicstudio_reinit_in_game_players
	musicstudio_ghmix_song_deinit
	DestroyScreenElement \{id = musicstudio_ghmix}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script musicstudio_show_pattern_name 
	return
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		if <ghmix_menu> :Desc_ResolveAlias name = alias_pattern_name_cont param = pattern_name_cont
			<pattern_name_cont> :SE_SetProps alpha = 1.0
		endif
	endif
endscript

script musicstudio_hide_pattern_name 
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		if <ghmix_menu> :Desc_ResolveAlias name = alias_pattern_name_cont param = pattern_name_cont
			<pattern_name_cont> :SE_SetProps alpha = 0.0
		endif
	endif
endscript

script musicstudio_update_pattern_name_text 
	RequireParams \{[
			category
			sub_category
			type
		]
		all}
	if musicstudio_ghmix :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		get_pattern_name_text show_user_text = 0 category = <category> sub_category = <sub_category> type = <type> Color
		<ghmix_menu> :SE_SetProps pattern_name_text = <pattern_name_text>
	endif
endscript

script ui_init_musicstudio_ghmix_song 
endscript

script ui_deinit_musicstudio_ghmix_song 
endscript
