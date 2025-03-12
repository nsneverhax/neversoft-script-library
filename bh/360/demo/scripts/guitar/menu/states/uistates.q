
script registeruistates 
	printf \{qs(0x7e56de1f)}
	mempushcontext \{frontendheap}
	registerstate \{name = uistate_null
		task = {
			name = task_menu
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
	registerstate \{name = uistate_options_cheats_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'options_cheats_warning'
			}
		}}
	registerstate \{name = uistate_songlist
		task = {
			name = task_menu
			params = {
				base_name = 'songlist'
				pakname = 'band_lobby'
			}
		}}
	registerstate \{name = uistate_test_medley_mode
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'test_medley_mode'
			}
		}}
	registerstate \{name = uistate_band_lobby
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'band_lobby'
				pakname = 'band_lobby'
				anim_in_script = ui_band_lobby_anim_in
				visualizer_preset = 0x15ae3545
			}
		}}
	registerstate \{name = uistate_band_lobby_setup
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'band_lobby_setup'
			}
		}}
	registerstate \{name = uistate_mic_debug
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'mic_debug'
			}
		}}
	registerstate \{name = uistate_mic_binding
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'mic_binding'
			}
		}}
	registerstate \{name = uistate_team_selection
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'team_selection'
			}
		}}
	registerstate \{name = uistate_physics
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'physics'
				pakname = 'physics'
			}
		}}
	registerstate \{name = uistate_options_progression
		task = {
			name = task_menu
			params = {
				base_name = 'options_progression'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_voting
		task = {
			name = task_menu
			params = {
				base_name = 'voting'
				anim_in_script = ui_anim_in_voting
				pakname = 'songlist'
			}
		}}
	registerstate \{name = uistate_career_movie
		task = {
			name = task_menu
			params = {
				base_name = 'career_movie'
			}
			pakname = 'career_venue_select'
		}}
	registerstate \{name = uistate_songlist_manage_playlist
		task = {
			name = task_menu
			params = {
				base_name = 'songlist_manage_playlist'
				focus_id = barrel_menu
			}
		}}
	registerstate \{name = uistate_edit_name
		task = {
			name = task_menu
			params = {
				base_name = 'edit_name'
				focus_id = edit_name_menu
			}
		}}
	registerstate \{name = uistate_music_store_hub
		task = {
			name = task_menu
			params = {
				base_name = 'music_store_hub'
			}
		}}
	registerstate \{name = uistate_team_select
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'team_select'
				pakname = 'team_select'
			}
		}}
	registerstate \{name = uistate_options_change_progression_warning
		task = {
			name = task_menu
			params = {
				base_name = 'options_change_progression_warning'
			}
		}}
	registerstate \{name = uistate_tutorial_guitar_load_basic
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_basic'
				pakname = 'tutorial_guitar_basic'
			}
		}}
	registerstate \{name = uistate_tutorial_guitar_load_intermediate
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_intermediate'
				pakname = 'tutorial_guitar_intermediate'
			}
		}}
	registerstate \{name = uistate_tutorial_guitar_load_advanced
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_guitar_load_advanced'
				pakname = 'tutorial_guitar_advanced'
			}
		}}
	registerstate \{name = uistate_tutorial_drums_load
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_drums_load'
				pakname = 'tutorial_drums'
			}
		}}
	registerstate \{name = uistate_tutorial_bass_load
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_bass_load'
				pakname = 'tutorial_bass'
			}
		}}
	registerstate \{name = uistate_tutorial_vocals_load
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_vocals_load'
				pakname = 'tutorial_vocals'
			}
		}}
	registerstate \{name = uistate_tutorial_band_load
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_band_load'
				pakname = 'tutorial_band'
			}
		}}
	registerstate \{name = uistate_tutorial_gameplay_load
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_gameplay_load'
				pakname = 'tutorial_gameplay'
			}
		}}
	registerstate \{name = uistate_tutorial_menu
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_menu'
				pakname = 'tutorial_shared'
			}
		}}
	registerstate \{name = uistate_tutorial_gameplay
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_gameplay'
			}
		}}
	registerstate \{name = uistate_tutorial_text_with_video
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_text_with_video'
			}
		}}
	registerstate \{name = uistate_tutorial_text_with_images
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_text_with_images'
			}
		}}
	registerstate \{name = uistate_tutorial_text
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_text'
			}
		}}
	registerstate \{name = uistate_tutorial_menu_skill_level
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_menu_skill_level'
			}
		}}
	registerstate \{name = uistate_tutorial_menu_lessons
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_menu_lessons'
			}
		}}
	registerstate \{name = uistate_band_lobby_popup
		task = {
			name = task_menu
			params = {
				base_name = 'band_lobby_popup'
			}
		}}
	registerstate \{name = uistate_invite_continue
		task = {
			name = task_menu
			params = {
				base_name = 'invite_continue'
			}
		}}
	registerstate \{name = uistate_tutorial_setup
		task = {
			name = task_menu
			params = {
				base_name = 'tutorial_setup'
			}
		}}
	registerstate \{name = uistate_sing_a_long
		task = {
			name = task_menu
			params = {
				base_name = 'sing_a_long'
			}
		}}
	mempopcontext
endscript

script registeruistates_boot 
	registerstate \{name = uistate_freeplay
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'freeplay'
			}
		}}
	registerstate \{name = uistate_freeplay_pause
		task = {
			name = task_menu
			params = {
				base_name = 'freeplay_pause'
			}
		}}
	registerstate \{name = uistate_boot_download_scan
		task = {
			name = task_menu
			params = {
				base_name = 'boot_download_scan'
			}
		}}
endscript

script registeruistates_profile 
	registerstate \{name = uistate_signin
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'signin'
			}
		}}
	registerstate \{name = uistate_signin_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'signin_warning'
			}
		}}
	registerstate \{name = uistate_signin_complete
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'signin_complete'
			}
		}}
	registerstate \{name = uistate_memcard
		task = {
			name = task_menu
			params = {
				base_name = 'memcard'
			}
		}}
	registerstate \{name = uistate_signin_changed
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'signin_changed'
			}
		}}
	registerstate \{name = uistate_connection_loss
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'connection_loss'
			}
		}}
endscript

script registeruistates_frontend 
	registerstate \{name = uistate_mainmenu
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
					musicmonitor
				]
				base_name = 'mainmenu'
				pakname = 'band_lobby'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_motd
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'motd'
				pakname = 'band_lobby'
			}
		}}
	registerstate \{name = uistate_vip_invite
		task = {
			name = task_menu
			params = {
				base_name = 'vip_invite'
				pakname = 'vip_invite'
			}
		}}
	registerstate \{name = uistate_generic_dialog_box
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'generic_dialog_box'
				focus_id = dialog_box_vmenu
			}
		}}
	registerstate \{name = uistate_helper_dialogue
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'helper_dialogue'
				focus_id = helper_root
			}
		}}
endscript

script registeruistates_options 
	registerstate \{name = uistate_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
					musicmonitor
				]
				base_name = 'options'
				pakname = 'band_lobby'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_options_audio
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_audio'
				pakname = 'options_audio'
			}
		}}
	registerstate \{name = uistate_options_mic_binding_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_mic_binding_warning'
			}
		}}
	registerstate \{name = uistate_options_calibrate_lag
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_calibrate_lag'
				pakname = 'calibrate_lag'
			}
		}}
	registerstate \{name = uistate_options_calibrate_lag_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_calibrate_lag_warning'
			}
		}}
	registerstate \{name = uistate_options_controller
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_controller'
			}
		}}
	registerstate \{name = uistate_options_controller_whammy
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_controller_whammy'
			}
		}}
	registerstate \{name = uistate_bonus_videos
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'bonus_videos'
				pakname = 'band_lobby'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_bonus_videos_credits
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'bonus_videos_credits'
				pakname = 'bonus_videos_credits'
			}
		}}
	registerstate \{name = uistate_options_cheats
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'options_cheats'
			}
		}}
	registerstate \{name = uistate_options_cheats_new
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'options_cheats_new'
				pakname = 'cheats'
			}
		}}
	registerstate \{name = uistate_top_rockers_mode
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'top_rockers_mode'
				pakname = 'leaderboard'
			}
		}}
	registerstate \{name = uistate_options_data
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_data'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_options_data_delete
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_data_delete'
			}
		}}
	registerstate \{name = uistate_options_controller_star_power
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_controller_star_power'
			}
		}}
	registerstate \{name = uistate_options_settings
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_settings'
			}
		}}
	registerstate \{name = uistate_options_settings_lefty_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_settings_lefty_warning'
				focus_id = dialog_box_vmenu
			}
		}}
	registerstate \{name = uistate_options_calibrate
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_calibrate'
			}
		}}
	registerstate \{name = uistate_band_name_logo
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'band_name_logo'
				pakname = 'cas_ui'
				focus_id = band_name_menu
			}
		}}
	registerstate \{name = uistate_options_vocals_view_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'options_vocals_view_warning'
			}
		}}
	registerstate \{name = uistate_guitarhero_com
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'guitarhero_com'
				pakname = 'guitarhero_com'
			}
		}}
	registerstate \{name = uistate_quickplay_choice
		task = {
			name = task_menu
			params = {
				base_name = 'quickplay_choice'
			}
		}}
	registerstate \{name = uistate_failed_three_times_warning
		task = {
			name = task_menu
			params = {
				base_name = 'failed_three_times_warning'
			}
		}}
endscript

script registeruistates_music_central 
	registerstate \{name = uistate_music_central
		task = {
			name = task_menu
			params = {
				base_name = 'music_central'
			}
		}}
endscript

script registeruistates_debug 
	registerstate \{name = uistate_debug
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug'
			}
		}}
	registerstate \{name = uistate_debug_color_calibration
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug_color_calibration'
			}
		}}
	registerstate \{name = uistate_debug_color_histogram
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug_color_histogram'
			}
		}}
	registerstate \{name = uistate_atom_unlock
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'atom_unlock'
			}
		}}
	registerstate \{name = uistate_rockout
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'rockout'
				pakname = 'rockout'
			}
		}}
	registerstate \{name = uistate_autotest_next_test
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'autotest_next_test'
			}
		}}
	registerstate \{name = uistate_debug_brightness_calibration
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug_brightness_calibration'
				pakname = 'debug_brightness_calibration'
			}
		}}
	registerstate \{name = uistate_debug_gamma_calibration
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug_gamma_calibration'
				pakname = 'debug_gamma_calibration'
			}
		}}
	registerstate \{name = uistate_debug_atvi_color_calibration
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'debug_atvi_color_calibration'
				pakname = 'debug_gamma_calibration'
			}
		}}
	registerstate \{name = uistate_nxgui_preview
		task = {
			name = task_menu
			params = {
				base_name = 'nxgui_preview'
				pakname = $ui_preview_pak_name
			}
		}}
endscript

script registeruistates_career 
	registerstate \{name = uistate_play_song
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'play_song'
			}
		}}
	registerstate \{name = uistate_gameplay
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'gameplay'
			}
		}}
	registerstate \{name = uistate_fail_song
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'fail_song'
				pakname = 'fail_song'
			}
		}}
	registerstate \{name = uistate_controller_disconnect
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'controller_disconnect'
			}
		}}
	registerstate \{name = uistate_beat_game
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'beat_game'
			}
		}}
	registerstate \{name = uistate_song_breakdown
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'song_breakdown'
				pakname = 'song_breakdown'
			}
		}}
	registerstate \{name = uistate_career_gig_select
		task = {
			name = task_menu
			params = {
				base_name = 'career_gig_select'
				pakname = 'career_venue_select'
			}
		}}
	registerstate \{name = uistate_career_gig_info
		task = {
			name = task_menu
			params = {
				base_name = 'career_gig_info'
				pakname = 'career_venue_select'
			}
		}}
	registerstate \{name = uistate_unlock_venue
		task = {
			name = task_menu
			params = {
				base_name = 'unlock_venue'
				pakname = 'unlock_venue'
			}
		}}
	registerstate \{name = uistate_rewards_unlocked
		task = {
			name = task_menu
			params = {
				base_name = 'rewards_unlocked'
				pakname = 'rewards_unlocked'
			}
		}}
	registerstate \{name = uistate_unlock_gig
		task = {
			name = task_menu
			params = {
				base_name = 'unlock_gig'
			}
		}}
	registerstate \{name = uistate_career_venue_select
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'career_venue_select'
				pakname = 'career_venue_select'
			}
		}}
	registerstate \{name = 0x266d767b
		task = {
			name = task_menu
			params = {
				base_name = 'career_video'
			}
		}}
endscript

script registeruistates_pause 
	registerstate \{name = uistate_pausemenu
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu'
				visualizer_preset = 0x46c4810b
			}
		}}
	registerstate \{name = uistate_pause_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pause_options'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_pausemenu_restart_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_restart_warning'
			}
		}}
	registerstate \{name = uistate_pausemenu_change_difficulty
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_change_difficulty'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_pausemenu_change_difficulty_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_change_difficulty_warning'
			}
		}}
	registerstate \{name = uistate_pausemenu_change_difficulty_confirm
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_change_difficulty_confirm'
			}
		}}
	registerstate \{name = uistate_pausemenu_lefty_flip_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_lefty_flip_warning'
			}
		}}
	registerstate \{name = uistate_pausemenu_highwaytype_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_highwaytype_warning'
			}
		}}
	registerstate \{name = uistate_pausemenu_highwaytype
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_highwaytype'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_pausemenu_quit_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_quit_warning'
			}
		}}
	registerstate \{name = uistate_pausemenu_song_ended
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'pausemenu_song_ended'
				pakname = 'fail_song'
			}
		}}
	registerstate \{name = uistate_song_unpause
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'song_unpause'
				pakname = 'song_unpause'
				alternate_pakname = 'band_lobby'
				alternate_decision_script = use_alternate_if_in_freeplay
			}
		}}
endscript

script registeruistates_outro 
	registerstate \{name = uistate_song_breakdown_competitive
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'song_breakdown_competitive'
				pakname = 'song_breakdown_competitive'
				anim_in_script = ui_song_breakdown_competitive_anim_in_script
				anim_out_script = ui_song_breakdown_competitive_anim_out_script
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_song_breakdown_shreddfest_match_complete
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'song_breakdown_shreddfest_match_complete'
				pakname = 'song_breakdown_competitive'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_top_rockers
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'top_rockers'
				pakname = 'top_rockers'
			}
		}}
	registerstate \{name = uistate_rewards
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'rewards'
				pakname = 'rewards'
			}
		}}
	registerstate \{name = uistate_song_summary_details
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'song_summary_details'
			}
		}}
	registerstate \{name = uistate_gig_complete_noncompetitive
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'gig_complete_noncompetitive'
				pakname = 'gig_complete_noncompetitive'
			}
		}}
	registerstate \{name = uistate_game_rules
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'game_rules'
				pakname = 'game_rules'
			}
		}}
endscript

script registeruistates_practice 
	registerstate \{name = uistate_select_training
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_training'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_select_practice_mode
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_practice_mode'
			}
		}}
	registerstate \{name = uistate_select_practice_instrument
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_practice_instrument'
				pakname = 'practice_menu_popup'
			}
		}}
	registerstate \{name = uistate_select_practice_difficulty
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_practice_difficulty'
				pakname = 'practice_menu_popup'
			}
		}}
	registerstate \{name = uistate_select_tutorial
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_tutorial'
			}
		}}
	registerstate \{name = uistate_play_tutorial
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'play_tutorial'
				pakname = 'guitar_tutorials'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	registerstate \{name = uistate_select_song_section
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'select_song_section'
				pakname = 'select_song_section'
			}
		}}
	registerstate \{name = uistate_practice_select_speed
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'practice_select_speed'
				pakname = 'practice_menu_popup'
			}
		}}
	registerstate \{name = uistate_practice_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'practice_warning'
			}
		}}
	registerstate \{name = uistate_practice_select_looping
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'practice_select_looping'
				pakname = 'practice_menu_popup'
			}
		}}
	registerstate \{name = uistate_tutorial_prompt
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'tutorial_prompt'
				focus_id = dialog_box_vmenu
			}
		}}
endscript

script registeruistates_musicstudio 
	registerstate \{name = uistate_musicstudio_ghmix
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'musicstudio_ghmix'
				pakname = 'musicstudio_ghmix'
			}
		}}
	registerstate \{name = uistate_musicstudio_ghmix_song
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'musicstudio_ghmix_song'
				pakname = 'musicstudio_ghmix'
			}
		}}
	registerstate \{name = uistate_musicstudio_jamroom_wizard
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'musicstudio_jamroom_wizard'
				pakname = 'jam'
			}
		}}
endscript

script registeruistates_notetracker 
endscript

script registeruistates_jam 
	registerstate \{name = uistate_jam
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam'
				pakname = 'jam'
			}
		}}
	registerstate \{name = uistate_jam_select_song
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_select_song'
				pakname = 'jam'
			}
		}}
	registerstate \{name = uistate_jam_song_wizard
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_song_wizard'
				pakname = 'jam'
			}
		}}
	registerstate \{name = uistate_jam_band
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_band'
				pakname = 'musicstudio_jamroom'
			}
		}}
	registerstate \{name = uistate_recording
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'recording'
				pakname = 'jam_advanced'
			}
		}}
	registerstate \{name = uistate_recording_disconnect
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'recording_disconnect'
			}
		}}
	registerstate \{name = uistate_jam_publish_song
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_song'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_genre
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_genre'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_track_select
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_track_select'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_slot
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_download_slot
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_download_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_text_entry
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_text_entry'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_update_fileid
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_update_fileid'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_jam_publish_signin
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_publish_signin'
				pakname = 'jam'
			}
		}}
	registerstate \{name = uistate_jam_ghtunes
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_ghtunes'
				pakname = 'jam_ghtunes'
			}
		}}
	registerstate \{name = uistate_gh_tunes_share
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'gh_tunes_share'
				pakname = 'gh_tunes_share'
			}
		}}
	registerstate \{name = uistate_jam_ratesong
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_ratesong'
				pakname = 'musicstudio_rate_song'
			}
		}}
	registerstate \{name = 0x51c439a1
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'jam_ratesong_quickplay'
				pakname = 'musicstudio_rate_song'
			}
		}}
	registerstate \{name = uistate_jam_quickplay_event
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'jam_quickplay_event'
			}
		}}
	registerstate \{name = uistate_jam_tutorials
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'jam_tutorials'
			}
		}}
	registerstate \{name = uistate_jam_mixer
		task = {
			name = task_menu
			params = {
				systems = [
					camera
					band
				]
				base_name = 'jam_mixer'
				pakname = 'options_audio'
			}
		}}
endscript

script registeruistates_select_rocker 
	registerstate \{name = uistate_character_selection
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'character_selection'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character'
				hist_tex = icon_editcharacter
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_enter
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_enter'
				hist_tex = icon_editcharacter
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_head
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_head'
				hist_tex = icon_head
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_body
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_body'
				hist_tex = icon_body
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_proportions
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_proportions'
				hist_tex = icon_size
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_body_art
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_body_art'
				hist_tex = icon_graphics
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_character_face_deformation
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'character_face_deformation'
				hist_tex = icon_face
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_character_face_deformation_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'character_face_deformation_options'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_color_edit
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_color_edit'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_save_changes_dialogue
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'save_changes_dialogue'
				focus_id = dialog_box_vmenu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_create_character_gender
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'create_character_gender'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_create_character_genre
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'create_character_genre'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_discard_changes
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_discard_changes'
				focus_id = dialog_box_vmenu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_mic
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_mic'
				hist_tex = icon_mic_2
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_mic_main
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_mic_main'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_select_part_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_select_part_options'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_popout_select_part
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'popout_select_part'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_select_part_color_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_select_part_color_options'
			}
		}}
	registerstate \{name = uistate_cas_select_part_swatches
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_select_part_swatches'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_text_entry
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_text_entry'
				hist_tex = icon_name
			}
		}}
	registerstate \{name = uistate_end_credits
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'end_credits'
			}
		}}
endscript

script registeruistates_cap 
	registerstate \{name = uistate_cap_main
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_main'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_layers_list
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_layers_list'
				pakname = 'cas_ui'
				hist_tex = icon_current
			}
		}}
	registerstate \{name = uistate_cap_shape_list
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_shape_list'
				pakname = 'cas_ui'
				hist_tex = category
			}
		}}
	registerstate \{name = uistate_cap_shape_list_subset
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_shape_list_subset'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_color_wheel
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_color_wheel'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_shape_edit
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_shape_edit'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_artist_layer
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_artist_layer'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_layers_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_layers_options'
				pakname = 'cas_ui'
				focus_id = layers_options_vmenu
			}
		}}
	registerstate \{name = uistate_cap_artist_layer_options
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_artist_layer_options'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cap_artist_layer_popout
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cap_artist_layer_popout'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cas_save_slots
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cas_save_slots'
				pakname = 'cas_ui'
			}
		}}
endscript

script registeruistates_outfit 
	registerstate \{name = uistate_customize_character_outfit
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_outfit'
				hist_tex = icon_outfit
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_outfit_accessories
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_outfit_accessories'
				hist_tex = accessories
				pakname = 'cas_ui'
			}
		}}
endscript

script registeruistates_cag 
	registerstate \{name = uistate_customize_character_instrument
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_instrument'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_customize_character_instrument_change
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'customize_character_instrument_change'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_main
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_main'
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_body
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_body'
				hist_tex = icon_cag_body
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_body_types
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_body_types'
				focus_id = current_list_menu
				hist_tex = icon_cag_type
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_select_part_inclusion
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_select_part_inclusion'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_hardware
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_hardware'
				hist_tex = icon_cag_hardware
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_head
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_head'
				hist_tex = icon_cag_head
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_strings
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_strings'
				focus_id = current_list_menu
				hist_tex = icon_cag_strings
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cag_custom_highway
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cag_custom_highway'
			}
		}}
endscript

script registeruistates_online 
	registerstate \{name = uistate_online
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'online'
				pakname = 'online_lobby'
			}
		}}
	registerstate \{name = uistate_net_custom_search
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_custom_search'
			}
		}}
	registerstate \{name = uistate_net_serverlist
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_serverlist'
			}
		}}
	registerstate \{name = uistate_net_joining
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_joining'
			}
		}}
	registerstate \{name = uistate_net_debug_lobby
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_debug_lobby'
			}
		}}
	registerstate \{name = uistate_net_debug_lobby_join
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_debug_lobby_join'
			}
		}}
	registerstate \{name = uistate_net_signin_popup
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_signin_popup'
				focus_id = net_signin_popup
			}
		}}
	registerstate \{name = uistate_net_career_join_popup
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_career_join_popup'
				focus_id = career_join_popup
			}
		}}
	registerstate \{name = uistate_leaderboard
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
					musicmonitor
				]
				base_name = 'leaderboard'
				pakname = 'leaderboard'
			}
		}}
	registerstate \{name = uistate_leaderboard_instrument
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'leaderboard_instrument'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_leaderboard_difficulty
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
					stageshow
				]
				base_name = 'leaderboard_difficulty'
				visualizer_preset = 0xc13ccfa8
			}
		}}
	registerstate \{name = uistate_net_zero_search_results_popup
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_zero_search_results_popup'
				focus_id = net_zero_popup
			}
		}}
	registerstate \{name = uistate_friends_list
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'friends_list'
				focus_id = friends_list_popup
			}
		}}
	registerstate \{name = uistate_net_preferences
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_preferences'
				focus_id = net_preferences_popup
			}
		}}
	registerstate \{name = uistate_online_post_game_lobby
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'online_post_game_lobby'
				pakname = 'online_lobby'
			}
		}}
	registerstate \{name = uistate_net_setup
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'net_setup'
			}
		}}
	registerstate \{name = uistate_online_quit_warning
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'online_quit_warning'
				focus_id = online_quit_menu
			}
		}}
	registerstate \{name = uistate_rock_record
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'rock_record'
				focus_id = rock_record_menu
			}
		}}
endscript

script registeruistates_cadrm 
	registerstate \{name = uistate_cadrm_main
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cadrm_main'
				hist_tex = icon_cadrm_drum
				pakname = 'cas_ui'
			}
		}}
	registerstate \{name = uistate_cadrm_hub
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'cadrm_hub'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
endscript

script registeruistates_music_store 
	registerstate \{name = uistate_music_store_purchase
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'music_store_purchase'
			}
		}}
	registerstate \{name = uistate_music_store_terms
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'music_store_terms'
			}
		}}
	registerstate \{name = uistate_music_store_scan_marketplace
		task = {
			name = task_menu
			params = {
				systems = [
					venue
					crowd
					camera
					band
				]
				base_name = 'music_store_scan_marketplace'
			}
		}}
endscript

script registeruistates_savegame 
	registerstate \{name = uistate_savegame_boot_scan
		task = {
			name = task_menu
			params = {
				base_name = 'savegame_boot_scan'
			}
		}}
	registerstate \{name = uistate_trophy_warning
		task = {
			name = task_menu
			params = {
				base_name = 'trophy_warning'
			}
		}}
endscript

script registeruistates_import 
	registerstate \{name = uistate_import_setup
		task = {
			name = task_menu
			params = {
				base_name = 'import_setup'
			}
		}}
	registerstate \{name = uistate_import
		task = {
			name = task_menu
			params = {
				base_name = 'import'
				pakname = 'import'
			}
		}}
	registerstate \{name = uistate_import_keycode
		task = {
			name = task_menu
			params = {
				base_name = 'import_keycode'
				pakname = 'import'
			}
		}}
	registerstate \{name = uistate_import_edit_name
		task = {
			name = task_menu
			params = {
				base_name = 'import_edit_name'
				focus_id = edit_name_menu
				pakname = 'import'
			}
		}}
	registerstate \{name = uistate_import_pre_legal
		task = {
			name = task_menu
			params = {
				base_name = 'import_pre_legal'
				pakname = 'import'
			}
		}}
	registerstate \{name = uistate_import_post_legal
		task = {
			name = task_menu
			params = {
				base_name = 'import_post_legal'
				pakname = 'import'
			}
		}}
	registerstate \{name = uistate_import_scan_marketplace
		task = {
			name = task_menu
			params = {
				base_name = 'import_scan_marketplace'
			}
		}}
	registerstate \{name = uistate_import_terms
		task = {
			name = task_menu
			params = {
				base_name = 'import_terms'
			}
		}}
endscript
