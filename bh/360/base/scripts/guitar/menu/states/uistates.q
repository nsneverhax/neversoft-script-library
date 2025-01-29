
script RegisterUIStates 
	printf \{qs(0x7e56de1f)}
	MemPushContext \{FrontEndHeap}
	RegisterState \{name = UIstate_null
		task = {
			name = Task_Menu
			params = {
				base_name = 'null'
			}
		}}
	RegisterUIStates_Boot
	RegisterUIStates_Options
	RegisterUIStates_Music_Central
	RegisterUIStates_Frontend
	RegisterUIStates_Debug
	RegisterUIStates_Profile
	RegisterUIStates_Career
	RegisterUIStates_Outro
	RegisterUIStates_Pause
	RegisterUIStates_Practice
	RegisterUIStates_Jam
	RegisterUIStates_MusicStudio
	RegisterUIStates_Notetracker
	RegisterUIStates_Select_Rocker
	RegisterUIStates_Outfit
	RegisterUIStates_CAP
	RegisterUIStates_CAG
	RegisterUIStates_Online
	RegisterUIStates_CADrm
	RegisterUIStates_Music_store
	RegisterUIStates_SaveGame
	RegisterUIStates_Import
	RegisterState \{name = UIstate_options_cheats_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'options_cheats_warning'
			}
		}}
	RegisterState \{name = uistate_songlist
		task = {
			name = Task_Menu
			params = {
				base_name = 'songlist'
				pakname = 'band_lobby'
			}
		}}
	RegisterState \{name = UIstate_test_medley_mode
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'test_medley_mode'
			}
		}}
	RegisterState \{name = UIstate_band_lobby
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'band_lobby'
				pakname = 'band_lobby'
				anim_in_script = ui_band_lobby_anim_in
				visualizer_preset = TB_UI_Band_Lobby_4
			}
		}}
	RegisterState \{name = UIstate_band_lobby_setup
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'band_lobby_setup'
			}
		}}
	RegisterState \{name = UIstate_mic_debug
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'mic_debug'
			}
		}}
	RegisterState \{name = UIstate_mic_binding
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'mic_binding'
			}
		}}
	RegisterState \{name = UIstate_team_selection
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'team_selection'
			}
		}}
	RegisterState \{name = UIstate_physics
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'physics'
				pakname = 'physics'
			}
		}}
	RegisterState \{name = UIstate_options_progression
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_progression'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_voting
		task = {
			name = Task_Menu
			params = {
				base_name = 'voting'
				anim_in_script = ui_anim_in_voting
				pakname = 'songlist'
			}
		}}
	RegisterState \{name = UIstate_career_movie
		task = {
			name = Task_Menu
			params = {
				base_name = 'career_movie'
			}
			pakname = 'career_venue_select'
		}}
	RegisterState \{name = UIstate_songlist_manage_playlist
		task = {
			name = Task_Menu
			params = {
				base_name = 'songlist_manage_playlist'
				focus_id = barrel_menu
			}
		}}
	RegisterState \{name = UIstate_edit_name
		task = {
			name = Task_Menu
			params = {
				base_name = 'edit_name'
				focus_id = edit_name_menu
			}
		}}
	RegisterState \{name = UIstate_music_store_hub
		task = {
			name = Task_Menu
			params = {
				base_name = 'music_store_hub'
			}
		}}
	RegisterState \{name = UIstate_team_select
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'team_select'
				pakname = 'team_select'
			}
		}}
	RegisterState \{name = UIstate_options_change_progression_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_change_progression_warning'
			}
		}}
	RegisterState \{name = UIstate_tutorial_guitar_load_basic
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_guitar_load_basic'
				pakname = 'tutorial_guitar_basic'
			}
		}}
	RegisterState \{name = UIstate_tutorial_guitar_load_intermediate
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_guitar_load_intermediate'
				pakname = 'tutorial_guitar_intermediate'
			}
		}}
	RegisterState \{name = UIstate_tutorial_guitar_load_advanced
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_guitar_load_advanced'
				pakname = 'tutorial_guitar_advanced'
			}
		}}
	RegisterState \{name = UIstate_tutorial_drums_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_drums_load'
				pakname = 'tutorial_drums'
			}
		}}
	RegisterState \{name = UIstate_tutorial_bass_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_bass_load'
				pakname = 'tutorial_bass'
			}
		}}
	RegisterState \{name = UIstate_tutorial_vocals_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_vocals_load'
				pakname = 'tutorial_vocals'
			}
		}}
	RegisterState \{name = UIstate_tutorial_band_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_band_load'
				pakname = 'tutorial_band'
			}
		}}
	RegisterState \{name = UIstate_tutorial_gameplay_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_gameplay_load'
				pakname = 'tutorial_gameplay'
			}
		}}
	RegisterState \{name = UIstate_tutorial_menu
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_menu'
				pakname = 'tutorial_shared'
			}
		}}
	RegisterState \{name = UIstate_tutorial_gameplay
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_gameplay'
			}
		}}
	RegisterState \{name = UIstate_tutorial_text_with_video
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_text_with_video'
			}
		}}
	RegisterState \{name = UIstate_tutorial_text_with_images
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_text_with_images'
			}
		}}
	RegisterState \{name = UIstate_tutorial_text
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_text'
			}
		}}
	RegisterState \{name = UIstate_tutorial_menu_skill_level
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_menu_skill_level'
			}
		}}
	RegisterState \{name = uistate_tutorial_menu_lessons
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_menu_lessons'
			}
		}}
	RegisterState \{name = UIstate_band_lobby_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_lobby_popup'
			}
		}}
	RegisterState \{name = UIstate_invite_continue
		task = {
			name = Task_Menu
			params = {
				base_name = 'invite_continue'
			}
		}}
	RegisterState \{name = uistate_tutorial_setup
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_setup'
			}
		}}
	RegisterState \{name = UIstate_sing_a_long
		task = {
			name = Task_Menu
			params = {
				base_name = 'sing_a_long'
			}
		}}
	MemPopContext
endscript

script RegisterUIStates_Boot 
	RegisterState \{name = UIstate_freeplay
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'freeplay'
			}
		}}
	RegisterState \{name = UIstate_freeplay_pause
		task = {
			name = Task_Menu
			params = {
				base_name = 'freeplay_pause'
			}
		}}
	RegisterState \{name = UIstate_boot_download_scan
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_download_scan'
			}
		}}
endscript

script RegisterUIStates_Profile 
	RegisterState \{name = uistate_signin
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'signin'
			}
		}}
	RegisterState \{name = UIstate_signin_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'signin_warning'
			}
		}}
	RegisterState \{name = UIstate_signin_complete
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'signin_complete'
			}
		}}
	RegisterState \{name = uistate_memcard
		task = {
			name = Task_Menu
			params = {
				base_name = 'memcard'
			}
		}}
	RegisterState \{name = UIstate_signin_changed
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'signin_changed'
			}
		}}
	RegisterState \{name = UIstate_connection_loss
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'connection_loss'
			}
		}}
endscript

script RegisterUIStates_Frontend 
	RegisterState \{name = uistate_mainmenu
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
					musicmonitor
				]
				base_name = 'mainmenu'
				pakname = 'band_lobby'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_motd
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'motd'
				pakname = 'band_lobby'
			}
		}}
	RegisterState \{name = UIstate_vip_invite
		task = {
			name = Task_Menu
			params = {
				base_name = 'vip_invite'
				pakname = 'vip_invite'
			}
		}}
	RegisterState \{name = UIstate_generic_dialog_box
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'generic_dialog_box'
				focus_id = dialog_box_vmenu
			}
		}}
	RegisterState \{name = UIstate_helper_dialogue
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'helper_dialogue'
				focus_id = helper_root
			}
		}}
endscript

script RegisterUIStates_Options 
	RegisterState \{name = UIstate_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
					musicmonitor
				]
				base_name = 'options'
				pakname = 'band_lobby'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_options_audio
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_audio'
				pakname = 'options_audio'
			}
		}}
	RegisterState \{name = UIstate_options_mic_binding_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_mic_binding_warning'
			}
		}}
	RegisterState \{name = UIstate_options_calibrate_lag
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_calibrate_lag'
				pakname = 'calibrate_lag'
			}
		}}
	RegisterState \{name = UIstate_options_calibrate_lag_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_calibrate_lag_warning'
			}
		}}
	RegisterState \{name = UIstate_options_controller
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_controller'
			}
		}}
	RegisterState \{name = UIstate_options_controller_whammy
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_controller_whammy'
			}
		}}
	RegisterState \{name = UIstate_bonus_videos
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'bonus_videos'
				pakname = 'band_lobby'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_bonus_videos_credits
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'bonus_videos_credits'
				pakname = 'bonus_videos_credits'
			}
		}}
	RegisterState \{name = UIstate_options_cheats
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'options_cheats'
			}
		}}
	RegisterState \{name = UIstate_options_cheats_new
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'options_cheats_new'
				pakname = 'cheats'
			}
		}}
	RegisterState \{name = UIstate_top_rockers_mode
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'top_rockers_mode'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_options_data
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_data'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_options_data_delete
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_data_delete'
			}
		}}
	RegisterState \{name = UIstate_options_controller_star_power
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_controller_star_power'
			}
		}}
	RegisterState \{name = UIstate_options_settings
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_settings'
			}
		}}
	RegisterState \{name = UIstate_options_settings_lefty_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_settings_lefty_warning'
				focus_id = dialog_box_vmenu
			}
		}}
	RegisterState \{name = UIstate_options_calibrate
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_calibrate'
			}
		}}
	RegisterState \{name = UIstate_band_name_logo
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'band_name_logo'
				pakname = 'cas_ui'
				focus_id = band_name_menu
			}
		}}
	RegisterState \{name = UIstate_options_vocals_view_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_vocals_view_warning'
			}
		}}
	RegisterState \{name = UIstate_guitarhero_com
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'guitarhero_com'
				pakname = 'guitarhero_com'
			}
		}}
	RegisterState \{name = UIstate_quickplay_choice
		task = {
			name = Task_Menu
			params = {
				base_name = 'quickplay_choice'
			}
		}}
	RegisterState \{name = UIstate_failed_three_times_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'failed_three_times_warning'
			}
		}}
endscript

script RegisterUIStates_Music_Central 
	RegisterState \{name = UIstate_music_central
		task = {
			name = Task_Menu
			params = {
				base_name = 'music_central'
			}
		}}
endscript

script RegisterUIStates_Debug 
	RegisterState \{name = UIstate_debug
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug'
			}
		}}
	RegisterState \{name = UIstate_debug_color_calibration
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug_color_calibration'
			}
		}}
	RegisterState \{name = UIstate_debug_color_histogram
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug_color_histogram'
			}
		}}
	RegisterState \{name = UIstate_atom_unlock
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'atom_unlock'
			}
		}}
	RegisterState \{name = UIstate_rockout
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'rockout'
				pakname = 'rockout'
			}
		}}
	RegisterState \{name = UIstate_autotest_next_test
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'autotest_next_test'
			}
		}}
	RegisterState \{name = UIstate_debug_brightness_calibration
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug_brightness_calibration'
				pakname = 'debug_brightness_calibration'
			}
		}}
	RegisterState \{name = UIstate_debug_gamma_calibration
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug_gamma_calibration'
				pakname = 'debug_gamma_calibration'
			}
		}}
	RegisterState \{name = UIstate_debug_atvi_color_calibration
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'debug_atvi_color_calibration'
				pakname = 'debug_gamma_calibration'
			}
		}}
	RegisterState \{name = UIstate_nxgui_preview
		task = {
			name = Task_Menu
			params = {
				base_name = 'nxgui_preview'
				pakname = $ui_preview_pak_name
			}
		}}
endscript

script RegisterUIStates_Career 
	RegisterState \{name = uistate_play_song
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'play_song'
			}
		}}
	RegisterState \{name = uistate_gameplay
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'gameplay'
			}
		}}
	RegisterState \{name = UIstate_fail_song
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'fail_song'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{name = UIstate_controller_disconnect
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'controller_disconnect'
			}
		}}
	RegisterState \{name = UIstate_beat_game
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'beat_game'
			}
		}}
	RegisterState \{name = UIstate_song_breakdown
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_breakdown'
				pakname = 'song_breakdown'
			}
		}}
	RegisterState \{name = UIstate_career_gig_select
		task = {
			name = Task_Menu
			params = {
				base_name = 'career_gig_select'
				pakname = 'career_venue_select'
			}
		}}
	RegisterState \{name = UIstate_career_gig_info
		task = {
			name = Task_Menu
			params = {
				base_name = 'career_gig_info'
				pakname = 'career_venue_select'
			}
		}}
	RegisterState \{name = UIstate_unlock_venue
		task = {
			name = Task_Menu
			params = {
				base_name = 'unlock_venue'
				pakname = 'unlock_venue'
			}
		}}
	RegisterState \{name = UIstate_rewards_unlocked
		task = {
			name = Task_Menu
			params = {
				base_name = 'rewards_unlocked'
				pakname = 'rewards_unlocked'
			}
		}}
	RegisterState \{name = UIstate_unlock_gig
		task = {
			name = Task_Menu
			params = {
				base_name = 'unlock_gig'
			}
		}}
	RegisterState \{name = UIstate_career_venue_select
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'career_venue_select'
				pakname = 'career_venue_select'
			}
		}}
	RegisterState \{name = UIstate_career_video
		task = {
			name = Task_Menu
			params = {
				base_name = 'career_video'
			}
		}}
endscript

script RegisterUIStates_Pause 
	RegisterState \{name = UIstate_pausemenu
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu'
				visualizer_preset = TB_UI_Mainmenu_Pause_A
			}
		}}
	RegisterState \{name = UIstate_pause_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pause_options'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_pausemenu_restart_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_restart_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_change_difficulty'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_change_difficulty_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty_confirm
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_change_difficulty_confirm'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_lefty_flip_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_lefty_flip_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_highwaytype_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_highwaytype_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_highwaytype
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_highwaytype'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_pausemenu_quit_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_quit_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_song_ended
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_song_ended'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{name = UIstate_song_unpause
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_unpause'
				pakname = 'song_unpause'
				alternate_pakname = 'band_lobby'
				alternate_decision_script = use_alternate_if_in_freeplay
			}
		}}
endscript

script RegisterUIStates_Outro 
	RegisterState \{name = UIstate_song_breakdown_competitive
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_breakdown_competitive'
				pakname = 'song_breakdown_competitive'
				anim_in_script = ui_song_breakdown_competitive_anim_in_script
				anim_out_script = ui_song_breakdown_competitive_anim_out_script
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_song_breakdown_shreddfest_match_complete
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_breakdown_shreddfest_match_complete'
				pakname = 'song_breakdown_competitive'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_top_rockers
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'top_rockers'
				pakname = 'top_rockers'
			}
		}}
	RegisterState \{name = UIstate_rewards
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'rewards'
				pakname = 'rewards'
			}
		}}
	RegisterState \{name = UIstate_song_summary_details
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_summary_details'
			}
		}}
	RegisterState \{name = UIstate_gig_complete_noncompetitive
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'gig_complete_noncompetitive'
				pakname = 'gig_complete_noncompetitive'
			}
		}}
	RegisterState \{name = UIstate_game_rules
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'game_rules'
				pakname = 'game_rules'
			}
		}}
endscript

script RegisterUIStates_Practice 
	RegisterState \{name = UIstate_select_training
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_training'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_select_practice_mode
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_practice_mode'
			}
		}}
	RegisterState \{name = UIstate_select_practice_instrument
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_practice_instrument'
				pakname = 'practice_menu_popup'
			}
		}}
	RegisterState \{name = UIstate_select_practice_difficulty
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_practice_difficulty'
				pakname = 'practice_menu_popup'
			}
		}}
	RegisterState \{name = UIstate_select_tutorial
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_tutorial'
			}
		}}
	RegisterState \{name = UIstate_play_tutorial
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'play_tutorial'
				pakname = 'guitar_tutorials'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	RegisterState \{name = UIstate_select_song_section
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_song_section'
				pakname = 'select_song_section'
			}
		}}
	RegisterState \{name = UIstate_practice_select_speed
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'practice_select_speed'
				pakname = 'practice_menu_popup'
			}
		}}
	RegisterState \{name = UIstate_practice_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'practice_warning'
			}
		}}
	RegisterState \{name = UIstate_practice_select_looping
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'practice_select_looping'
				pakname = 'practice_menu_popup'
			}
		}}
	RegisterState \{name = UIstate_tutorial_prompt
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'tutorial_prompt'
				focus_id = dialog_box_vmenu
			}
		}}
endscript

script RegisterUIStates_MusicStudio 
	RegisterState \{name = UIstate_musicstudio_ghmix
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'musicstudio_ghmix'
				pakname = 'musicstudio_ghmix'
			}
		}}
	RegisterState \{name = UIstate_musicstudio_ghmix_song
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'musicstudio_ghmix_song'
				pakname = 'musicstudio_ghmix'
			}
		}}
	RegisterState \{name = UIstate_musicstudio_jamroom_wizard
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'musicstudio_jamroom_wizard'
				pakname = 'jam'
			}
		}}
endscript

script RegisterUIStates_Notetracker 
endscript

script RegisterUIStates_Jam 
	RegisterState \{name = uistate_jam
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_select_song
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_select_song'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_song_wizard
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_song_wizard'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = uistate_jam_band
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_band'
				pakname = 'musicstudio_jamroom'
			}
		}}
	RegisterState \{name = uistate_recording
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'recording'
				pakname = 'jam_advanced'
			}
		}}
	RegisterState \{name = uistate_recording_disconnect
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'recording_disconnect'
			}
		}}
	RegisterState \{name = uistate_jam_publish_song
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_song'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_genre
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_genre'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_track_select
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_track_select'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_slot
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_download_slot
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_download_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_text_entry
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_text_entry'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_update_fileid
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_update_fileid'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = uistate_jam_publish_signin
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_signin'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_ghtunes
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_ghtunes'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_gh_tunes_share
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'gh_tunes_share'
				pakname = 'gh_tunes_share'
			}
		}}
	RegisterState \{name = UIstate_jam_ratesong
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_ratesong'
				pakname = 'musicstudio_rate_song'
			}
		}}
	RegisterState \{name = UIstate_jam_ratesong_quickplay
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'jam_ratesong_quickplay'
				pakname = 'musicstudio_rate_song'
			}
		}}
	RegisterState \{name = uistate_jam_quickplay_event
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'jam_quickplay_event'
			}
		}}
	RegisterState \{name = uistate_jam_tutorials
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'jam_tutorials'
			}
		}}
	RegisterState \{name = UIstate_jam_mixer
		task = {
			name = Task_Menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_mixer'
				pakname = 'options_audio'
			}
		}}
endscript

script RegisterUIStates_Select_Rocker 
	RegisterState \{name = UIstate_character_selection
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'character_selection'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character'
				hist_tex = icon_EditCharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_enter
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_enter'
				hist_tex = icon_EditCharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_head
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_head'
				hist_tex = icon_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_body
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_body'
				hist_tex = icon_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_proportions
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_proportions'
				hist_tex = icon_size
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_body_art
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_body_art'
				hist_tex = icon_graphics
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_character_face_deformation
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'character_face_deformation'
				hist_tex = icon_face
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_character_face_deformation_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'character_face_deformation_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_color_edit
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_color_edit'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_save_changes_dialogue
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'save_changes_dialogue'
				focus_id = dialog_box_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_create_character_gender
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'create_character_gender'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_create_character_genre
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'create_character_genre'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_discard_changes
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_discard_changes'
				focus_id = dialog_box_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_mic
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_mic'
				hist_tex = icon_mic_2
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_mic_main
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_mic_main'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_select_part_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_popout_select_part
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'popout_select_part'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part_color_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_select_part_color_options'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part_swatches
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_select_part_swatches'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_text_entry
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_text_entry'
				hist_tex = icon_name
			}
		}}
	RegisterState \{name = UIstate_end_credits
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'end_credits'
			}
		}}
endscript

script RegisterUIStates_CAP 
	RegisterState \{name = UIstate_cap_main
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_main'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_layers_list
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_layers_list'
				pakname = 'cas_ui'
				hist_tex = icon_current
			}
		}}
	RegisterState \{name = UIstate_cap_shape_list
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_shape_list'
				pakname = 'cas_ui'
				hist_tex = category
			}
		}}
	RegisterState \{name = UIstate_cap_shape_list_subset
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_shape_list_subset'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_color_wheel
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_color_wheel'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_shape_edit
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_shape_edit'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_artist_layer'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_layers_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_layers_options'
				pakname = 'cas_ui'
				focus_id = layers_options_vmenu
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer_options
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_artist_layer_options'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer_popout
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cap_artist_layer_popout'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_save_slots
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cas_save_slots'
				pakname = 'cas_ui'
			}
		}}
endscript

script RegisterUIStates_Outfit 
	RegisterState \{name = UIstate_customize_character_outfit
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_outfit'
				hist_tex = icon_outfit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_outfit_accessories
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_outfit_accessories'
				hist_tex = Accessories
				pakname = 'cas_ui'
			}
		}}
endscript

script RegisterUIStates_CAG 
	RegisterState \{name = UIstate_customize_character_instrument
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_instrument'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_instrument_change
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_instrument_change'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_main
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_main'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_body
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_body'
				hist_tex = icon_cag_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_body_types
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_body_types'
				focus_id = current_list_menu
				hist_tex = icon_cag_type
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_select_part_inclusion
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_select_part_inclusion'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_hardware
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_hardware'
				hist_tex = icon_cag_hardware
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_head
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_head'
				hist_tex = icon_cag_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_strings
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_strings'
				focus_id = current_list_menu
				hist_tex = icon_cag_strings
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_highway
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cag_custom_highway'
			}
		}}
endscript

script RegisterUIStates_Online 
	RegisterState \{name = UIstate_online
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'online'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{name = UIstate_net_custom_search
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_custom_search'
			}
		}}
	RegisterState \{name = UIstate_net_serverlist
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_serverlist'
			}
		}}
	RegisterState \{name = UIstate_net_joining
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_joining'
			}
		}}
	RegisterState \{name = UIstate_net_debug_lobby
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_debug_lobby'
			}
		}}
	RegisterState \{name = UIstate_net_debug_lobby_join
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_debug_lobby_join'
			}
		}}
	RegisterState \{name = UIstate_net_signin_popup
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_signin_popup'
				focus_id = net_signin_popup
			}
		}}
	RegisterState \{name = UIstate_net_career_join_popup
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_career_join_popup'
				focus_id = career_join_popup
			}
		}}
	RegisterState \{name = UIstate_leaderboard
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
					musicmonitor
				]
				base_name = 'leaderboard'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_instrument
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'leaderboard_instrument'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_leaderboard_difficulty
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'leaderboard_difficulty'
				visualizer_preset = TB_UI_Mainmenu
			}
		}}
	RegisterState \{name = UIstate_net_zero_search_results_popup
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_zero_search_results_popup'
				focus_id = net_zero_popup
			}
		}}
	RegisterState \{name = UIstate_friends_list
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'friends_list'
				focus_id = friends_list_popup
			}
		}}
	RegisterState \{name = UIstate_net_preferences
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_preferences'
				focus_id = net_preferences_popup
			}
		}}
	RegisterState \{name = UIstate_online_post_game_lobby
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'online_post_game_lobby'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{name = UIstate_net_setup
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'net_setup'
			}
		}}
	RegisterState \{name = UIstate_online_quit_warning
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'online_quit_warning'
				focus_id = online_quit_menu
			}
		}}
	RegisterState \{name = UIstate_rock_record
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'rock_record'
				focus_id = rock_record_menu
			}
		}}
endscript

script RegisterUIStates_CADrm 
	RegisterState \{name = UIstate_cadrm_main
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cadrm_main'
				hist_tex = icon_cadrm_drum
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cadrm_hub
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'cadrm_hub'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
endscript

script RegisterUIStates_Music_store 
	RegisterState \{name = UIstate_music_store_purchase
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'music_store_purchase'
			}
		}}
	RegisterState \{name = UIstate_music_store_terms
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'music_store_terms'
			}
		}}
	RegisterState \{name = UIstate_music_store_scan_marketplace
		task = {
			name = Task_Menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'music_store_scan_marketplace'
			}
		}}
endscript

script RegisterUIStates_SaveGame 
	RegisterState \{name = UIstate_savegame_boot_scan
		task = {
			name = Task_Menu
			params = {
				base_name = 'savegame_boot_scan'
			}
		}}
	RegisterState \{name = UIstate_trophy_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'trophy_warning'
			}
		}}
endscript

script RegisterUIStates_Import 
	RegisterState \{name = UIstate_import_setup
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_setup'
			}
		}}
	RegisterState \{name = UIstate_import
		task = {
			name = Task_Menu
			params = {
				base_name = 'import'
				pakname = 'import'
			}
		}}
	RegisterState \{name = UIstate_import_keycode
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_keycode'
				pakname = 'import'
			}
		}}
	RegisterState \{name = UIstate_import_edit_name
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_edit_name'
				focus_id = edit_name_menu
				pakname = 'import'
			}
		}}
	RegisterState \{name = UIstate_import_pre_legal
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_pre_legal'
				pakname = 'import'
			}
		}}
	RegisterState \{name = UIstate_import_post_legal
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_post_legal'
				pakname = 'import'
			}
		}}
	RegisterState \{name = UIstate_import_scan_marketplace
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_scan_marketplace'
			}
		}}
	RegisterState \{name = UIstate_import_terms
		task = {
			name = Task_Menu
			params = {
				base_name = 'import_terms'
			}
		}}
endscript
