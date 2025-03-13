
script ui_create_musicstudio_ghmix_song \{from_track = 0}
	createscreenelement \{parent = root_window
		id = musicstudio_ghmix
		type = descinterface
		desc = 'musicstudio_ghmix_song'
		pos = (0.0, 0.0)}
	musicstudio_show_nowbar \{song_mode}
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		<ghmix_menu> :se_setprops alpha = 1.0 pos = (756.0, 31.0)
		<ghmix_menu> :se_setprops tip_alpha = 1 tip_text = qs(0x03ac90f0) time = 0
		musicstudio_mainobj :musicstudio_getmainplayercontroller
		musicstudio_mainobj :musicstudio_getmainplayeridindex
		musicstudio_mainobj :musicstudio_getplayerfromindex player = <playerid_index>
		setplayerinfo <playerid_index> in_game = 1
		<player_object> :musicstudiomenu_init player = <playerid_index> controller = <controller>
		<player_object> :musicstudiomenu_setstate {
			id = <ghmix_menu>
			state = ghmix_song_transport_state
		}
	endif
	musicstudio_ghmix :obj_spawnscriptnow \{musicstudio_ghmix_show_inst_tabs
		params = {
			animate = 0
		}}
	musicstudio_ghmix_song_init from_track = <from_track>
	musicstudio_ghmix :obj_spawnscript \{jam_recording_check_disconnect}
	musicstudio_force_drum_track \{song}
endscript

script ui_destroy_musicstudio_ghmix_song 
	musicstudio_reinit_in_game_players
	musicstudio_ghmix_song_deinit
	destroyscreenelement \{id = musicstudio_ghmix}
	clean_up_user_control_helpers
	destroy_dialog_box
endscript

script musicstudio_show_pattern_name 
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		if <ghmix_menu> :desc_resolvealias name = alias_pattern_name_cont param = pattern_name_cont
			<pattern_name_cont> :se_setprops alpha = 1.0
		endif
	endif
endscript

script musicstudio_hide_pattern_name 
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		if <ghmix_menu> :desc_resolvealias name = alias_pattern_name_cont param = pattern_name_cont
			<pattern_name_cont> :se_setprops alpha = 0.0
		endif
	endif
endscript

script musicstudio_update_pattern_name_text 
	requireparams \{[
			category
			sub_category
			type
		]
		all}
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		get_pattern_name_text show_user_text = 0 category = <category> sub_category = <sub_category> type = <type> color
		<ghmix_menu> :se_setprops pattern_name_text = <pattern_name_text>
		musicstudio_mainobj :musicstudioghmix_getnumuserpatterns
		formattext textname = num_patterns_text qs(0x047a1d52) a = <num_user_patterns> b = ($musicstudio_saved_patterns_max)
		<ghmix_menu> :se_setprops num_patterns_text = <num_patterns_text>
	endif
endscript

script ui_init_musicstudio_ghmix_song 
endscript

script ui_deinit_musicstudio_ghmix_song 
endscript
