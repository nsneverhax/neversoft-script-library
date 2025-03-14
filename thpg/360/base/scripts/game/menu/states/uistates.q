
script registeruibehaviors 
	Register_UIStates
endscript

script Register_UIStates 
	printf "UIState: Register_UIStates"
	ui_initialize
	mempushcontext frontendheap
	RegisterState_UI_Gameplay
	RegisterState_UI_PauseMenu
	RegisterState_UI_PauseOptions
	RegisterState_UI_SoundOptions
	RegisterState_UI_pausecheats
	RegisterState_UI_pauselevel
	RegisterState_UI_debugoptions
	RegisterState_UI_controlsetup
	RegisterState_UI_displayoptions
	RegisterState_UI_achieve_main
	RegisterState_UI_achieve_leaderboard
	RegisterState_UI_achieve_awards
	RegisterState_UI_Crib_Main
	RegisterState_UI_video_editor_Main
	RegisterState_UI_video_editor_Clip_Menu
	RegisterState_UI_video_editor_Edit_View
	RegisterState_UI_video_editor_clip_recorded_menu
	RegisterState_UI_video_editor_camera_recorded_menu
	RegisterState_UI_video_editor_rendering
	RegisterState_UI_goal_film_clip_options
	RegisterState_UI_Photo_Viewer
	RegisterState_UI_videophone
	RegisterState_UI_savegame
	RegisterState_UI_view_missions
	RegisterState_UI_view_gaps
	RegisterState_UI_view_tricks
	RegisterState_UI_view_status
	RegisterState_UI_stats
	RegisterState_UI_progress
	RegisterState_ui_endrankings
	RegisterState_ui_endmovies
	RegisterState_ui_aidebug
	RegisterState_UI_mainmenu
	RegisterState_UI_cas
	RegisterState_UI_cas_charselect
	RegisterState_UI_cas_base
	RegisterState_UI_onlinemain
	RegisterState_UI_mainoptions
	RegisterState_UI_loadgame
	RegisterState_UI_LoadGame_CareerOptions
	RegisterState_UI_mainmovies
	RegisterState_UI_yourlife
	RegisterState_UI_yourlife_newlife
	RegisterState_UI_mainprogress
	RegisterState_UI_mainscores
	RegisterState_UI_freeskate
	RegisterState_UI_freeskate_ready
	RegisterState_UI_leaderboard
	RegisterState_UI_net_startgame
	RegisterState_UI_net_options
	RegisterState_UI_net_hostoptions
	RegisterState_UI_net_gametype
	RegisterState_UI_net_xboxlive
	RegisterState_UI_net_currentplayers
	RegisterState_UI_net_confirmquit
	RegisterState_UI_net_skaterselect
	RegisterState_UI_net_invite_ready
	RegisterState_UI_net_view_goals
	RegisterState_UI_net_round_settings
	RegisterState_UI_remaptricks
	RegisterState_UI_2player
	RegisterState_UI_2player_create_game
	mempopcontext
endscript

script ui_change_state \{state = null}
	printf "UI State: Changing to %s" s = <state>
	ui :obj_spawnscriptnow ui_change_state_internal params = {state = <state>}
endscript

script ui_change_state_internal 
	ui :fsm_set state = <state> replacement = this
endscript

script ui_add_event 
	ui :eventcache_add event_id = <event_id>
endscript

script generic_ui_destroy 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	killskatercamanim \{name = ui_pausemenu_cam}
endscript
