
script registeruistates 
	printf \{qs(0x7e56de1f)}
	MemPushContext \{frontendheap}
	RegisterState \{Name = uistate_null
		task = {
			Name = task_menu
			params = {
				base_name = 'null'
			}
		}}
	registeruistates_boot
	registeruistates_options
	registeruistates_music_central
	registeruistates_frontend
	registeruistates_debug
	registeruistates_profile
	registeruistates_career
	registeruistates_outro
	registeruistates_pause
	registeruistates_practice
	registeruistates_jam
	registeruistates_musicstudio
	registeruistates_notetracker
	registeruistates_select_rocker
	registeruistates_outfit
	registeruistates_cap
	registeruistates_cag
	registeruistates_online
	registeruistates_cadrm
	registeruistates_music_store
	registeruistates_savegame
	registeruistates_import
	RegisterState \{Name = uistate_options_cheats_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_songlist
		task = {
			Name = task_menu
			params = {
				base_name = 'songlist'
				pakname = 'band_lobby'
			}
		}}
	RegisterState \{Name = uistate_test_medley_mode
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_band_lobby
		task = {
			Name = task_menu
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
			}
		}}
	RegisterState \{Name = uistate_band_lobby_setup
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_mic_debug
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_mic_binding
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_team_selection
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_physics
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_progression
		task = {
			Name = task_menu
			params = {
				base_name = 'options_progression'
			}
		}}
	RegisterState \{Name = uistate_voting
		task = {
			Name = task_menu
			params = {
				base_name = 'voting'
				anim_in_script = ui_anim_in_voting
				pakname = 'songlist'
			}
		}}
	RegisterState \{Name = uistate_career_movie
		task = {
			Name = task_menu
			params = {
				base_name = 'career_movie'
			}
			pakname = 'career_venue_select'
		}}
	RegisterState \{Name = uistate_songlist_manage_playlist
		task = {
			Name = task_menu
			params = {
				base_name = 'songlist_manage_playlist'
			}
		}}
	RegisterState \{Name = uistate_edit_name
		task = {
			Name = task_menu
			params = {
				base_name = 'edit_name'
				focus_id = edit_name_menu
			}
		}}
	RegisterState \{Name = uistate_music_store_hub
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_hub'
			}
		}}
	RegisterState \{Name = uistate_team_select
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_change_progression_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'options_change_progression_warning'
			}
		}}
	RegisterState \{Name = uistate_tutorial_guitar_load_basic
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_basic'
				pakname = 'tutorial_guitar_basic'
			}
		}}
	RegisterState \{Name = uistate_tutorial_guitar_load_intermediate
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_intermediate'
				pakname = 'tutorial_guitar_intermediate'
			}
		}}
	RegisterState \{Name = uistate_tutorial_guitar_load_advanced
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_advanced'
				pakname = 'tutorial_guitar_advanced'
			}
		}}
	RegisterState \{Name = uistate_tutorial_drums_load
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_drums_load'
				pakname = 'tutorial_drums'
			}
		}}
	RegisterState \{Name = uistate_tutorial_bass_load
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_bass_load'
				pakname = 'tutorial_bass'
			}
		}}
	RegisterState \{Name = uistate_tutorial_vocals_load
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_vocals_load'
				pakname = 'tutorial_vocals'
			}
		}}
	RegisterState \{Name = uistate_tutorial_band_load
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_band_load'
				pakname = 'tutorial_band'
			}
		}}
	RegisterState \{Name = uistate_tutorial_gameplay_load
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_gameplay_load'
				pakname = 'tutorial_gameplay'
			}
		}}
	RegisterState \{Name = uistate_tutorial_menu
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_menu'
				pakname = 'tutorial_shared'
			}
		}}
	RegisterState \{Name = uistate_tutorial_gameplay
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_gameplay'
			}
		}}
	RegisterState \{Name = uistate_tutorial_text_with_video
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_text_with_video'
			}
		}}
	RegisterState \{Name = uistate_tutorial_text_with_images
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_text_with_images'
			}
		}}
	RegisterState \{Name = uistate_tutorial_text
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_text'
			}
		}}
	RegisterState \{Name = uistate_tutorial_menu_skill_level
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_menu_skill_level'
			}
		}}
	RegisterState \{Name = uistate_tutorial_menu_lessons
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_menu_lessons'
			}
		}}
	RegisterState \{Name = uistate_band_lobby_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'band_lobby_popup'
			}
		}}
	RegisterState \{Name = uistate_invite_continue
		task = {
			Name = task_menu
			params = {
				base_name = 'invite_continue'
			}
		}}
	RegisterState \{Name = uistate_tutorial_setup
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_setup'
			}
		}}
	MemPopContext
endscript

script registeruistates_boot 
	RegisterState \{Name = uistate_freeplay
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_freeplay_pause
		task = {
			Name = task_menu
			params = {
				base_name = 'freeplay_pause'
			}
		}}
	RegisterState \{Name = uistate_boot_download_scan
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_download_scan'
			}
		}}
endscript

script registeruistates_profile 
	RegisterState \{Name = uistate_signin
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_signin_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_signin_complete
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_memcard
		task = {
			Name = task_menu
			params = {
				base_name = 'memcard'
			}
		}}
	RegisterState \{Name = uistate_signin_changed
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_connection_loss
		task = {
			Name = task_menu
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

script registeruistates_frontend 
	RegisterState \{Name = uistate_mainmenu
		task = {
			Name = task_menu
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
			}
		}}
	RegisterState \{Name = uistate_motd
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_vip_invite
		task = {
			Name = task_menu
			params = {
				base_name = 'vip_invite'
				pakname = 'vip_invite'
			}
		}}
	RegisterState \{Name = uistate_generic_dialog_box
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_helper_dialogue
		task = {
			Name = task_menu
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

script registeruistates_options 
	RegisterState \{Name = uistate_options
		task = {
			Name = task_menu
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
			}
		}}
	RegisterState \{Name = uistate_options_audio
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_mic_binding_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_calibrate_lag
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_calibrate_lag_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_controller
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_controller_whammy
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_bonus_videos
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'bonus_videos'
			}
		}}
	RegisterState \{Name = uistate_bonus_videos_credits
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_cheats
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_cheats_new
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_top_rockers_mode
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_data
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'options_data'
			}
		}}
	RegisterState \{Name = uistate_options_data_delete
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_controller_star_power
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_settings
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_settings_lefty_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_calibrate
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_band_name_logo
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_options_vocals_view_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_guitarhero_com
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_quickplay_choice
		task = {
			Name = task_menu
			params = {
				base_name = 'quickplay_choice'
			}
		}}
	RegisterState \{Name = uistate_failed_three_times_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'failed_three_times_warning'
			}
		}}
endscript

script registeruistates_music_central 
	RegisterState \{Name = uistate_music_central
		task = {
			Name = task_menu
			params = {
				base_name = 'music_central'
			}
		}}
endscript

script registeruistates_debug 
	RegisterState \{Name = uistate_debug
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_debug_color_calibration
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_atom_unlock
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_rockout
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_autotest_next_test
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_debug_brightness_calibration
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_debug_gamma_calibration
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_debug_atvi_color_calibration
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_nxgui_preview
		task = {
			Name = task_menu
			params = {
				base_name = 'nxgui_preview'
				pakname = $ui_preview_pak_name
			}
		}}
endscript

script registeruistates_career 
	RegisterState \{Name = uistate_play_song
		task = {
			Name = task_menu
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
	RegisterState \{Name = Uistate_gameplay
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_fail_song
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_controller_disconnect
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_beat_game
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_song_breakdown
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_career_gig_select
		task = {
			Name = task_menu
			params = {
				base_name = 'career_gig_select'
				pakname = 'career_venue_select'
			}
		}}
	RegisterState \{Name = uistate_career_gig_info
		task = {
			Name = task_menu
			params = {
				base_name = 'career_gig_info'
				pakname = 'career_venue_select'
			}
		}}
	RegisterState \{Name = uistate_unlock_venue
		task = {
			Name = task_menu
			params = {
				base_name = 'unlock_venue'
				pakname = 'unlock_venue'
			}
		}}
	RegisterState \{Name = uistate_rewards_unlocked
		task = {
			Name = task_menu
			params = {
				base_name = 'rewards_unlocked'
				pakname = 'rewards_unlocked'
			}
		}}
	RegisterState \{Name = uistate_unlock_gig
		task = {
			Name = task_menu
			params = {
				base_name = 'unlock_gig'
			}
		}}
	RegisterState \{Name = uistate_career_venue_select
		task = {
			Name = task_menu
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
endscript

script registeruistates_pause 
	RegisterState \{Name = Uistate_pausemenu
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu'
			}
		}}
	RegisterState \{Name = uistate_pause_options
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pause_options'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_restart_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_change_difficulty
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_change_difficulty'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_change_difficulty_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_change_difficulty_confirm
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_lefty_flip_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_highwaytype_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_highwaytype
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'pausemenu_highwaytype'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_quit_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_pausemenu_song_ended
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_song_unpause
		task = {
			Name = task_menu
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

script registeruistates_outro 
	RegisterState \{Name = uistate_song_breakdown_competitive
		task = {
			Name = task_menu
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
			}
		}}
	RegisterState \{Name = uistate_song_breakdown_shreddfest_match_complete
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'song_breakdown_shreddfest_match_complete'
				pakname = 'song_breakdown_competitive'
			}
		}}
	RegisterState \{Name = uistate_top_rockers
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_rewards
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_song_summary_details
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_gig_complete_noncompetitive
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_game_rules
		task = {
			Name = task_menu
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

script registeruistates_practice 
	RegisterState \{Name = uistate_select_training
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'select_training'
			}
		}}
	RegisterState \{Name = uistate_select_practice_mode
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_select_practice_instrument
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_select_practice_difficulty
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_select_tutorial
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_play_tutorial
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_select_song_section
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_practice_select_speed
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_practice_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_practice_select_looping
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_tutorial_prompt
		task = {
			Name = task_menu
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

script registeruistates_musicstudio 
	RegisterState \{Name = uistate_musicstudio_ghmix
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'musicstudio_ghmix'
				pakname = 'musicstudio_ghmix'
			}
		}}
	RegisterState \{Name = uistate_musicstudio_ghmix_song
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'musicstudio_ghmix_song'
				pakname = 'musicstudio_ghmix'
			}
		}}
	RegisterState \{Name = uistate_musicstudio_jamroom_wizard
		task = {
			Name = task_menu
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

script registeruistates_notetracker 
endscript

script registeruistates_jam 
	RegisterState \{Name = uistate_jam
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_select_song
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_select_song'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_song_wizard
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_song_wizard'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_band
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_band'
				pakname = 'musicstudio_jamroom'
			}
		}}
	RegisterState \{Name = uistate_recording
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'recording'
				pakname = 'jam_advanced'
			}
		}}
	RegisterState \{Name = uistate_recording_disconnect
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'recording_disconnect'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_song
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_song'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_genre
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_genre'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_track_select
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_track_select'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_slot
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_download_slot
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_download_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_text_entry
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_text_entry'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_update_fileid
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_update_fileid'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_signin
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_publish_signin'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_ghtunes
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_ghtunes'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_gh_tunes_share
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'gh_tunes_share'
				pakname = 'gh_tunes_share'
			}
		}}
	RegisterState \{Name = uistate_jam_ratesong
		task = {
			Name = task_menu
			params = {
				systems = [
					Camera
					Band
				]
				base_name = 'jam_ratesong'
				pakname = 'musicstudio_rate_song'
			}
		}}
	RegisterState \{Name = uistate_jam_quickplay_event
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_jam_tutorials
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_jam_mixer
		task = {
			Name = task_menu
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

script registeruistates_select_rocker 
	RegisterState \{Name = uistate_character_selection
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character'
				hist_tex = icon_editcharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_enter
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_enter'
				hist_tex = icon_editcharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_head
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_body
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_proportions
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_body_art
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_character_face_deformation
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_character_face_deformation_options
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_color_edit
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_save_changes_dialogue
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_create_character_gender
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_create_character_genre
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_discard_changes
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_mic
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_mic_main
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_select_part_options
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_popout_select_part
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_select_part_color_options
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_select_part_swatches
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_text_entry
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_end_credits
		task = {
			Name = task_menu
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

script registeruistates_cap 
	RegisterState \{Name = uistate_cap_main
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_layers_list
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_shape_list
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_shape_list_subset
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_color_wheel
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_shape_edit
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_artist_layer
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_layers_options
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_artist_layer_options
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cap_artist_layer_popout
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cas_save_slots
		task = {
			Name = task_menu
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

script registeruistates_outfit 
	RegisterState \{Name = uistate_customize_character_outfit
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_outfit_accessories
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
				]
				base_name = 'customize_character_outfit_accessories'
				hist_tex = accessories
				pakname = 'cas_ui'
			}
		}}
endscript

script registeruistates_cag 
	RegisterState \{Name = uistate_customize_character_instrument
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_customize_character_instrument_change
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_main
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_body
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_body_types
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_select_part_inclusion
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_hardware
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_head
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_strings
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cag_custom_highway
		task = {
			Name = task_menu
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

script registeruistates_online 
	RegisterState \{Name = uistate_online
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_custom_search
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_serverlist
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_joining
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_debug_lobby
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_debug_lobby_join
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_signin_popup
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_career_join_popup
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_leaderboard
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_leaderboard_instrument
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'leaderboard_instrument'
				pakname = 'leaderboard_list'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_difficulty
		task = {
			Name = task_menu
			params = {
				systems = [
					venue
					Crowd
					Camera
					Band
					stageshow
				]
				base_name = 'leaderboard_difficulty'
			}
		}}
	RegisterState \{Name = uistate_net_zero_search_results_popup
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_friends_list
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_preferences
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_online_post_game_lobby
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_net_setup
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_online_quit_warning
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_rock_record
		task = {
			Name = task_menu
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

script registeruistates_cadrm 
	RegisterState \{Name = uistate_cadrm_main
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_cadrm_hub
		task = {
			Name = task_menu
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

script registeruistates_music_store 
	RegisterState \{Name = uistate_music_store_purchase
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_music_store_terms
		task = {
			Name = task_menu
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
	RegisterState \{Name = uistate_music_store_scan_marketplace
		task = {
			Name = task_menu
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

script registeruistates_savegame 
	RegisterState \{Name = uistate_savegame_boot_scan
		task = {
			Name = task_menu
			params = {
				base_name = 'savegame_boot_scan'
			}
		}}
	RegisterState \{Name = uistate_trophy_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'trophy_warning'
			}
		}}
endscript

script registeruistates_import 
	RegisterState \{Name = uistate_import_setup
		task = {
			Name = task_menu
			params = {
				base_name = 'import_setup'
			}
		}}
	RegisterState \{Name = uistate_import
		task = {
			Name = task_menu
			params = {
				base_name = 'import'
				pakname = 'import'
			}
		}}
	RegisterState \{Name = uistate_import_keycode
		task = {
			Name = task_menu
			params = {
				base_name = 'import_keycode'
				pakname = 'import'
			}
		}}
	RegisterState \{Name = uistate_import_edit_name
		task = {
			Name = task_menu
			params = {
				base_name = 'import_edit_name'
				focus_id = edit_name_menu
				pakname = 'import'
			}
		}}
	RegisterState \{Name = uistate_import_pre_legal
		task = {
			Name = task_menu
			params = {
				base_name = 'import_pre_legal'
				pakname = 'import'
			}
		}}
	RegisterState \{Name = uistate_import_post_legal
		task = {
			Name = task_menu
			params = {
				base_name = 'import_post_legal'
				pakname = 'import'
			}
		}}
	RegisterState \{Name = uistate_import_scan_marketplace
		task = {
			Name = task_menu
			params = {
				base_name = 'import_scan_marketplace'
			}
		}}
	RegisterState \{Name = uistate_import_terms
		task = {
			Name = task_menu
			params = {
				base_name = 'import_terms'
			}
		}}
endscript
