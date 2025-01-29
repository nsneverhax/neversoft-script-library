
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
	registeruistates_frontend
	registeruistates_debug
	registeruistates_profile
	registeruistates_career
	registeruistates_outro
	registeruistates_character
	registeruistates_pause
	registeruistates_practice
	registeruistates_jam
	registeruistates_select_rocker
	registeruistates_outfit
	registeruistates_cap
	registeruistates_cag
	registeruistates_online
	registeruistates_cadrm
	registeruistates_music_store
	RegisterState \{Name = uistate_trophy_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'trophy_warning'
			}
		}}
	RegisterState \{Name = uistate_fan_video
		task = {
			Name = task_menu
			params = {
				base_name = 'fan_video'
				pakname = 'rewards'
			}
		}}
	RegisterState \{Name = uistate_boot_trophy_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_trophy_warning'
			}
		}}
	RegisterState \{Name = uistate_optimal_drum
		task = {
			Name = task_menu
			params = {
				base_name = 'optimal_drum'
			}
		}}
	RegisterState \{Name = uistate_invalid_instrument
		task = {
			Name = task_menu
			params = {
				base_name = 'invalid_instrument'
			}
		}}
	MemPopContext
endscript

script registeruistates_boot 
	RegisterState \{Name = uistate_boot_legal
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_legal'
			}
		}}
	RegisterState \{Name = uistate_boot_movie_atvi
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_movie_ATVI'
			}
		}}
	RegisterState \{Name = uistate_boot_movie_red_octane
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_movie_red_octane'
			}
		}}
	RegisterState \{Name = uistate_boot_movie_neversoft
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_movie_neversoft'
			}
		}}
	RegisterState \{Name = uistate_boot_movie_intro
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_movie_intro'
			}
		}}
	RegisterState \{Name = uistate_boot_iis
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_iis'
				do_not_hide
			}
		}}
	RegisterState \{Name = uistate_boot_attract
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_attract'
			}
		}}
	RegisterState \{Name = uistate_boot_guitar
		task = {
			Name = task_menu
			params = {
				base_name = 'boot_guitar'
				pakname = 'usingguitar'
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
				base_name = 'signin'
			}
		}}
	RegisterState \{Name = uistate_signin_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'signin_warning'
			}
		}}
	RegisterState \{Name = uistate_signin_complete
		task = {
			Name = task_menu
			params = {
				base_name = 'signin_complete'
			}
		}}
	RegisterState \{Name = uistate_memcard
		task = {
			Name = task_menu
			params = {
				base_name = 'memcard'
				Type = boot
			}
		}}
	RegisterState \{Name = uistate_signin_changed
		task = {
			Name = task_menu
			params = {
				base_name = 'signin_changed'
			}
		}}
	RegisterState \{Name = uistate_connection_loss
		task = {
			Name = task_menu
			params = {
				base_name = 'connection_loss'
			}
		}}
endscript

script registeruistates_frontend 
	RegisterState \{Name = uistate_mainmenu
		task = {
			Name = task_menu
			params = {
				base_name = 'mainmenu'
				anim_in_script = ui_mainmenu_anim_in
				anim_out_script = ui_mainmenu_anim_out
			}
		}}
	RegisterState \{Name = uistate_mainmenu_intro
		task = {
			Name = task_menu
			params = {
				base_name = 'mainmenu_intro'
			}
		}}
	RegisterState \{Name = uistate_motd
		task = {
			Name = task_menu
			params = {
				base_name = 'motd'
				pakname = 'motd'
			}
		}}
	RegisterState \{Name = uistate_select_difficulty
		task = {
			Name = task_menu
			params = {
				base_name = 'select_difficulty'
				anim_in_script = ui_select_difficulty_anim_in
				anim_out_script = ui_select_difficulty_anim_out
			}
		}}
	RegisterState \{Name = uistate_band_difficulty
		task = {
			Name = task_menu
			params = {
				base_name = 'band_difficulty'
				pakname = 'band_mode'
			}
		}}
	RegisterState \{Name = uistate_setlist
		task = {
			Name = task_menu
			params = {
				base_name = 'setlist'
				pakname = 'setlist'
				focus_id = None
			}
		}}
	RegisterState \{Name = uistate_setlist_prompt
		task = {
			Name = task_menu
			params = {
				base_name = 'setlist_prompt'
			}
		}}
	RegisterState \{Name = uistate_setlist_lyrics
		task = {
			Name = task_menu
			params = {
				base_name = 'setlist_lyrics'
				pakname = 'setlist'
			}
		}}
	RegisterState \{Name = uistate_select_instrument_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'select_instrument_warning'
			}
		}}
	RegisterState \{Name = uistate_setlist_quit_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'setlist_quit_warning'
			}
		}}
	RegisterState \{Name = uistate_generic_dialogue
		task = {
			Name = task_menu
			params = {
				base_name = 'generic_dialogue'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{Name = uistate_generic_alert_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'generic_alert_popup'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{Name = uistate_helper_dialogue
		task = {
			Name = task_menu
			params = {
				base_name = 'helper_dialogue'
				focus_id = helper_root
			}
		}}
	RegisterState \{Name = uistate_dialog_box
		task = {
			Name = task_menu
			params = {
				base_name = 'dialog_box'
			}
		}}
	RegisterState \{Name = uistate_double_bass_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'double_bass_popup'
			}
		}}
	RegisterState \{Name = uistate_new_song_info_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'new_song_info_popup'
			}
		}}
	RegisterState \{Name = uistate_backstage
		task = {
			Name = task_menu
			params = {
				base_name = 'backstage'
				pakname = 'backstage'
				anim_in_script = ui_backstage_anim_in
				anim_out_script = ui_backstage_anim_out
			}
		}}
	RegisterState \{Name = uistate_extras
		task = {
			Name = task_menu
			params = {
				base_name = 'extras'
				pakname = 'backstage'
				anim_in_script = ui_extras_anim_in
				anim_out_script = ui_extras_anim_out
			}
		}}
	RegisterState \{Name = uistate_soundboard
		task = {
			Name = task_menu
			params = {
				base_name = 'soundboard'
				pakname = 'soundboard'
			}
		}}
	RegisterState \{Name = uistate_song_extras
		task = {
			Name = task_menu
			params = {
				base_name = 'song_extras'
				pakname = 'setlist'
			}
		}}
	RegisterState \{Name = uistate_song_extras_movie
		task = {
			Name = task_menu
			params = {
				base_name = 'song_extras_movie'
				pakname = 'setlist'
			}
		}}
	RegisterState \{Name = uistate_song_extras_lyrics
		task = {
			Name = task_menu
			params = {
				base_name = 'song_extras_lyrics'
				pakname = 'setlist'
			}
		}}
	RegisterState \{Name = uistate_song_extras_details
		task = {
			Name = task_menu
			params = {
				base_name = 'song_extras_details'
				pakname = 'song_extras_details'
			}
		}}
endscript

script registeruistates_options 
	RegisterState \{Name = uistate_options
		task = {
			Name = task_menu
			params = {
				base_name = 'options'
				pakname = 'options'
				anim_in_script = ui_options_anim_in
				anim_out_script = ui_options_anim_out
			}
		}}
	RegisterState \{Name = uistate_options_audio
		task = {
			Name = task_menu
			params = {
				base_name = 'options_audio'
				pakname = 'options_audio'
			}
		}}
	RegisterState \{Name = uistate_options_calibrate_lag
		task = {
			Name = task_menu
			params = {
				base_name = 'options_calibrate_lag'
				pakname = 'calibrate_lag'
			}
		}}
	RegisterState \{Name = uistate_options_calibrate_lag_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'options_calibrate_lag_warning'
			}
		}}
	RegisterState \{Name = uistate_failed_three_times_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'failed_three_times_warning'
			}
		}}
	RegisterState \{Name = uistate_options_controller
		task = {
			Name = task_menu
			params = {
				base_name = 'options_controller'
			}
		}}
	RegisterState \{Name = uistate_options_controller_whammy
		task = {
			Name = task_menu
			params = {
				base_name = 'options_controller_whammy'
			}
		}}
	RegisterState \{Name = uistate_bonus_videos
		task = {
			Name = task_menu
			params = {
				base_name = 'bonus_videos'
				pakname = 'backstage'
				anim_in_script = ui_bonus_videos_anim_in
				anim_out_script = ui_bonus_videos_anim_out
			}
		}}
	RegisterState \{Name = uistate_gallery
		task = {
			Name = task_menu
			params = {
				base_name = 'gallery'
				anim_in_script = ui_gallery_anim_in
				anim_out_script = ui_gallery_anim_out
			}
		}}
	RegisterState \{Name = uistate_bonus_videos_credits
		task = {
			Name = task_menu
			params = {
				base_name = 'bonus_videos_credits'
				pakname = 'bonus_videos_credits'
			}
		}}
	RegisterState \{Name = uistate_options_cheats
		task = {
			Name = task_menu
			params = {
				base_name = 'options_cheats'
				pakname = 'cheats'
				anim_out_script = ui_options_cheats_anim_out
			}
		}}
	RegisterState \{Name = uistate_options_cheats_new
		task = {
			Name = task_menu
			params = {
				base_name = 'options_cheats_new'
				pakname = 'cheats'
				anim_out_script = ui_options_cheats_new_anim_out
			}
		}}
	RegisterState \{Name = uistate_options_cheats_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'options_cheats_warning'
			}
		}}
	RegisterState \{Name = uistate_top_rockers_mode
		task = {
			Name = task_menu
			params = {
				base_name = 'top_rockers_mode'
				pakname = 'backstage'
				anim_in_script = ui_top_rockers_mode_anim_in
				anim_out_script = ui_top_rockers_mode_anim_out
			}
		}}
	RegisterState \{Name = uistate_options_data
		task = {
			Name = task_menu
			params = {
				base_name = 'options_data'
				focus_id = current_submenu
			}
		}}
	RegisterState \{Name = uistate_options_data_delete
		task = {
			Name = task_menu
			params = {
				base_name = 'options_data_delete'
			}
		}}
	RegisterState \{Name = uistate_options_manage_band
		task = {
			Name = task_menu
			params = {
				base_name = 'options_manage_band'
			}
		}}
	RegisterState \{Name = uistate_options_manage_band_logo
		task = {
			Name = task_menu
			params = {
				base_name = 'options_manage_band_logo'
				no_animate_in
			}
		}}
	RegisterState \{Name = uistate_options_delete_band
		task = {
			Name = task_menu
			params = {
				base_name = 'options_delete_band'
			}
		}}
	RegisterState \{Name = uistate_options_controller_star_power
		task = {
			Name = task_menu
			params = {
				base_name = 'options_controller_star_power'
			}
		}}
	RegisterState \{Name = uistate_options_controller_sensors
		task = {
			Name = task_menu
			params = {
				base_name = 'options_controller_sensors'
			}
		}}
	RegisterState \{Name = uistate_options_settings
		task = {
			Name = task_menu
			params = {
				base_name = 'options_settings'
				focus_id = current_submenu
			}
		}}
	RegisterState \{Name = uistate_options_settings_lefty_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'options_settings_lefty_warning'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{Name = uistate_options_calibrate
		task = {
			Name = task_menu
			params = {
				base_name = 'options_calibrate'
			}
		}}
	RegisterState \{Name = uistate_options_manage_band_font
		task = {
			Name = task_menu
			params = {
				base_name = 'options_manage_band_font'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_band_logo_choose
		task = {
			Name = task_menu
			params = {
				base_name = 'band_logo_choose'
			}
		}}
	RegisterState \{Name = uistate_band_name_logo
		task = {
			Name = task_menu
			params = {
				base_name = 'band_name_logo'
				pakname = 'cas_ui'
				focus_id = band_name_menu
			}
		}}
	RegisterState \{Name = uistate_downloads
		task = {
			Name = task_menu
			params = {
				base_name = 'downloads'
			}
		}}
	RegisterState \{Name = uistate_options_vocals_view_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'options_vocals_view_warning'
			}
		}}
	RegisterState \{Name = uistate_guitarhero_com
		task = {
			Name = task_menu
			params = {
				base_name = 'guitarhero_com'
				pakname = 'guitarhero_com'
			}
		}}
endscript

script registeruistates_debug 
	RegisterState \{Name = uistate_debug
		task = {
			Name = task_menu
			params = {
				base_name = 'debug'
			}
		}}
	RegisterState \{Name = uistate_debug_color_calibration
		task = {
			Name = task_menu
			params = {
				base_name = 'debug_color_calibration'
			}
		}}
	RegisterState \{Name = uistate_viewport_test
		task = {
			Name = task_menu
			params = {
				base_name = 'viewport_test'
			}
		}}
	RegisterState \{Name = uistate_atom_unlock
		task = {
			Name = task_menu
			params = {
				base_name = 'atom_unlock'
			}
		}}
	RegisterState \{Name = uistate_test
		task = {
			Name = task_menu
			params = {
				base_name = 'test'
				pakname = 'testpak'
			}
		}}
	RegisterState \{Name = uistate_autotest_next_test
		task = {
			Name = task_menu
			params = {
				base_name = 'autotest_next_test'
			}
		}}
endscript

script registeruistates_career 
	RegisterState \{Name = uistate_play_song
		task = {
			Name = task_menu
			params = {
				base_name = 'play_song'
			}
		}}
	RegisterState \{Name = Uistate_gameplay
		task = {
			Name = task_menu
			params = {
				base_name = 'gameplay'
			}
		}}
	RegisterState \{Name = uistate_game_mode
		task = {
			Name = task_menu
			params = {
				base_name = 'game_mode'
				anim_in_script = game_mode_anim_in
				anim_out_script = game_mode_anim_out
			}
		}}
	RegisterState \{Name = uistate_select_instrument
		task = {
			Name = task_menu
			params = {
				base_name = 'select_instrument'
				anim_in_script = select_instrument_anim_in
				anim_out_script = select_instrument_anim_out
			}
		}}
	RegisterState \{Name = uistate_band_name_enter
		task = {
			Name = task_menu
			params = {
				base_name = 'band_name_enter'
			}
		}}
	RegisterState \{Name = uistate_band_choose
		task = {
			Name = task_menu
			params = {
				base_name = 'band_choose'
			}
		}}
	RegisterState \{Name = uistate_select_controller
		task = {
			Name = task_menu
			params = {
				base_name = 'select_controller'
				pakname = 'select_controller'
			}
			anim_in_script = ui_select_controller_anim_in
			anim_out_script = ui_select_controller_anim_out
		}}
	RegisterState \{Name = uistate_select_mp_mode
		task = {
			Name = task_menu
			params = {
				base_name = 'select_mp_mode'
			}
		}}
	RegisterState \{Name = uistate_fail_song
		task = {
			Name = task_menu
			params = {
				base_name = 'fail_song'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{Name = uistate_band_mode
		task = {
			Name = task_menu
			params = {
				base_name = 'band_mode'
				focus_id = band_mode_menu
				pakname = 'band_mode'
			}
		}}
	RegisterState \{Name = uistate_battle_helper
		task = {
			Name = task_menu
			params = {
				base_name = 'battle_helper'
				pakname = 'battle_helper'
			}
		}}
	RegisterState \{Name = uistate_boss_wuss_out
		task = {
			Name = task_menu
			params = {
				base_name = 'boss_wuss_out'
			}
		}}
	RegisterState \{Name = uistate_choose_part
		task = {
			Name = task_menu
			params = {
				base_name = 'choose_part'
			}
		}}
	RegisterState \{Name = uistate_controller_disconnect
		task = {
			Name = task_menu
			params = {
				base_name = 'controller_disconnect'
			}
		}}
	RegisterState \{Name = uistate_encore_confirmation
		task = {
			Name = task_menu
			params = {
				base_name = 'encore_confirmation'
			}
		}}
	RegisterState \{Name = uistate_beat_game
		task = {
			Name = task_menu
			params = {
				base_name = 'beat_game'
			}
		}}
	RegisterState \{Name = uistate_gig_posters
		task = {
			Name = task_menu
			params = {
				base_name = 'gig_posters'
				focus_id = setlist_menu
				pakname = 'setlist'
			}
		}}
	RegisterState \{Name = uistate_special_events
		task = {
			Name = task_menu
			params = {
				base_name = 'special_events'
				pakname = 'special_events'
			}
		}}
	RegisterState \{Name = uistate_special_event_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'special_event_popup'
			}
		}}
	RegisterState \{Name = uistate_special_event_win
		task = {
			Name = task_menu
			params = {
				base_name = 'special_event_win'
			}
		}}
	RegisterState \{Name = uistate_group_play
		task = {
			Name = task_menu
			params = {
				base_name = 'group_play'
				focu_id = group_play
			}
		}}
	RegisterState \{Name = uistate_cash_milestones
		task = {
			Name = task_menu
			params = {
				base_name = 'cash_milestones'
				pakname = 'cash_milestones'
			}
		}}
	RegisterState \{Name = uistate_song_breakdown
		task = {
			Name = task_menu
			params = {
				base_name = 'song_breakdown'
				pakname = 'song_breakdown'
				anim_in_script = ui_song_breakdown_anim_in_script
				anim_out_script = ui_song_breakdown_anim_out_script
			}
		}}
	RegisterState \{Name = uistate_cash_rewards_3
		task = {
			Name = task_menu
			params = {
				base_name = 'cash_rewards_3'
				pakname = 'cash_rewards_3'
			}
		}}
	RegisterState \{Name = uistate_metallifacts
		task = {
			Name = task_menu
			params = {
				base_name = 'metallifacts'
				pakname = 'metallifacts'
			}
		}}
endscript

script registeruistates_character 
	RegisterState \{Name = uistate_character_hub
		task = {
			Name = task_menu
			params = {
				base_name = 'character_hub'
				pakname = 'band_mode'
			}
		}}
	RegisterState \{Name = uistate_singleplayer_character_hub
		task = {
			Name = task_menu
			params = {
				base_name = 'singleplayer_character_hub'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_character_select
		task = {
			Name = task_menu
			params = {
				base_name = 'character_select'
				pakname = 'characterselect'
			}
		}}
	RegisterState \{Name = uistate_select_outfit
		task = {
			Name = task_menu
			params = {
				base_name = 'select_outfit'
			}
		}}
	RegisterState \{Name = uistate_select_outfit_style
		task = {
			Name = task_menu
			params = {
				base_name = 'select_outfit_style'
			}
		}}
	RegisterState \{Name = uistate_select_guitar
		task = {
			Name = task_menu
			params = {
				base_name = 'select_guitar'
			}
		}}
	RegisterState \{Name = uistate_select_venue
		task = {
			Name = task_menu
			params = {
				base_name = 'select_venue'
				pakname = 'select_venue'
			}
		}}
endscript

script registeruistates_pause 
	RegisterState \{Name = Uistate_pausemenu
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu'
			}
		}}
	RegisterState \{Name = uistate_pause_options
		task = {
			Name = task_menu
			params = {
				base_name = 'pause_options'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_restart_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_restart_warning'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_change_difficulty
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_change_difficulty'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_change_difficulty_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_change_difficulty_warning'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_change_difficulty_confirm
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_change_difficulty_confirm'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_lefty_flip_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_lefty_flip_warning'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_quit_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_quit_warning'
			}
		}}
	RegisterState \{Name = uistate_pausemenu_song_ended
		task = {
			Name = task_menu
			params = {
				base_name = 'pausemenu_song_ended'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{Name = uistate_song_unpause
		task = {
			Name = task_menu
			params = {
				base_name = 'song_unpause'
				pakname = 'song_unpause'
			}
		}}
endscript

script registeruistates_outro 
	RegisterState \{Name = uistate_win_song
		task = {
			Name = task_menu
			params = {
				base_name = 'win_song'
				pakname = 'win_song'
			}
		}}
	RegisterState \{Name = uistate_song_statistic
		task = {
			Name = task_menu
			params = {
				base_name = 'song_statistic'
				pakname = 'song_statistic'
			}
		}}
	RegisterState \{Name = uistate_song_summary
		task = {
			Name = task_menu
			params = {
				base_name = 'song_summary'
				pakname = 'song_summary'
			}
		}}
	RegisterState \{Name = uistate_detailed_stats
		task = {
			Name = task_menu
			params = {
				base_name = 'detailed_stats'
			}
		}}
	RegisterState \{Name = uistate_top_rockers
		task = {
			Name = task_menu
			params = {
				base_name = 'top_rockers'
				pakname = 'top_rockers'
			}
		}}
	RegisterState \{Name = uistate_cash_reward
		task = {
			Name = task_menu
			params = {
				base_name = 'cash_reward'
				pakname = 'cash_reward'
			}
		}}
	RegisterState \{Name = uistate_sponsored
		task = {
			Name = task_menu
			params = {
				base_name = 'sponsored'
				pakname = 'sponsor'
			}
		}}
	RegisterState \{Name = uistate_unlock
		task = {
			Name = task_menu
			params = {
				base_name = 'unlock'
			}
		}}
	RegisterState \{Name = uistate_rewards
		task = {
			Name = task_menu
			params = {
				base_name = 'rewards'
				pakname = 'rewards'
			}
		}}
	RegisterState \{Name = uistate_song_summary_details
		task = {
			Name = task_menu
			params = {
				base_name = 'song_summary_details'
				pakname = 'song_summary_details'
				anim_in_script = ui_song_summary_details_anim_in
				anim_out_script = ui_song_summary_details_anim_out
			}
		}}
	RegisterState \{Name = uistate_sponsor_new
		task = {
			Name = task_menu
			params = {
				base_name = 'sponsor_new'
				pakname = 'sponsor_new'
			}
		}}
	RegisterState \{Name = uistate_cash_rewards
		task = {
			Name = task_menu
			params = {
				base_name = 'cash_rewards'
				pakname = 'cash_rewards'
			}
		}}
	RegisterState \{Name = uistate_magazine_cover
		task = {
			Name = task_menu
			params = {
				base_name = 'magazine_cover'
				pakname = 'magazine_cover'
				anim_in_script = ui_magazine_cover_anim_in
				anim_out_script = ui_magazine_cover_anim_out
			}
		}}
	RegisterState \{Name = uistate_gig_cash_summary
		task = {
			Name = task_menu
			params = {
				base_name = 'gig_cash_summary'
				pakname = 'gig_cash_summary'
				anim_in_script = ui_gig_cash_summary_anim_in_script
			}
		}}
	RegisterState \{Name = uistate_top_5_rockers
		task = {
			Name = task_menu
			params = {
				base_name = 'top_5_rockers'
			}
		}}
	RegisterState \{Name = uistate_att_ballpark
		task = {
			Name = task_menu
			params = {
				base_name = 'att_ballpark'
				pakname = 'att_ballpark'
			}
		}}
endscript

script registeruistates_practice 
	RegisterState \{Name = uistate_select_practice_mode
		task = {
			Name = task_menu
			params = {
				base_name = 'select_practice_mode'
			}
		}}
	RegisterState \{Name = uistate_select_tutorial
		task = {
			Name = task_menu
			params = {
				base_name = 'select_tutorial'
			}
		}}
	RegisterState \{Name = uistate_play_tutorial
		task = {
			Name = task_menu
			params = {
				base_name = 'play_tutorial'
				pakname = 'guitar_tutorials'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	RegisterState \{Name = uistate_practice_select_part
		task = {
			Name = task_menu
			params = {
				base_name = 'practice_select_part'
			}
		}}
	RegisterState \{Name = uistate_select_song_section
		task = {
			Name = task_menu
			params = {
				base_name = 'select_song_section'
				pakname = 'select_song_section'
			}
		}}
	RegisterState \{Name = uistate_practice_select_speed
		task = {
			Name = task_menu
			params = {
				base_name = 'practice_select_speed'
				anim_in_script = ui_select_difficulty_anim_in
				anim_out_script = ui_select_difficulty_anim_out
			}
		}}
	RegisterState \{Name = uistate_practice_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'practice_warning'
			}
		}}
	RegisterState \{Name = uistate_practice_select_difficulty
		task = {
			Name = task_menu
			params = {
				base_name = 'practice_select_difficulty'
				anim_in_script = ui_select_difficulty_anim_in
				anim_out_script = ui_select_difficulty_anim_out
			}
		}}
	RegisterState \{Name = uistate_tutorial_prompt
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_prompt'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{Name = uistate_tutorial_prompt_easy
		task = {
			Name = task_menu
			params = {
				base_name = 'tutorial_prompt_easy'
				focus_id = pu_warning_vmenu
			}
		}}
endscript

script registeruistates_jam 
	RegisterState \{Name = uistate_jam
		task = {
			Name = task_menu
			params = {
				base_name = 'jam'
				pakname = 'jam'
				anim_in_script = nullscript
				anim_out_script = nullscript
			}
		}}
	RegisterState \{Name = uistate_jam_select_song
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_select_song'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_song_wizard
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_song_wizard'
				pakname = 'jam_wizard'
			}
		}}
	RegisterState \{Name = uistate_jam_band
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_band'
				pakname = 'jam_band'
			}
		}}
	RegisterState \{Name = uistate_recording
		task = {
			Name = task_menu
			params = {
				base_name = 'recording'
				pakname = 'jam_advanced'
			}
		}}
	RegisterState \{Name = uistate_recording_disconnect
		task = {
			Name = task_menu
			params = {
				base_name = 'recording_disconnect'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_song
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_song'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_genre
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_genre'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_track_select
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_track_select'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_slot
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_download_slot
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_download_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_text_entry
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_text_entry'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_update_fileid
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_update_fileid'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_jam_publish_signin
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_publish_signin'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_ghtunes
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_ghtunes'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{Name = uistate_gh_tunes_share
		task = {
			Name = task_menu
			params = {
				base_name = 'gh_tunes_share'
				pakname = 'gh_tunes_share'
			}
		}}
	RegisterState \{Name = uistate_jam_ratesong
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_ratesong'
				pakname = 'jam'
			}
		}}
	RegisterState \{Name = uistate_jam_songwriter_event
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_songwriter_event'
				pakname = 'jam_songwriter'
			}
		}}
	RegisterState \{Name = uistate_jam_quickplay_event
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_quickplay_event'
			}
		}}
	RegisterState \{Name = uistate_jam_tutorials
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_tutorials'
			}
		}}
	RegisterState \{Name = uistate_jam_mixer
		task = {
			Name = task_menu
			params = {
				base_name = 'jam_mixer'
				pakname = 'jam_mixer'
			}
		}}
endscript

script registeruistates_select_rocker 
	RegisterState \{Name = uistate_character_selection
		task = {
			Name = task_menu
			params = {
				base_name = 'character_selection'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_character_purchase
		task = {
			Name = task_menu
			params = {
				base_name = 'character_purchase'
				focus_id = character_purchase_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character'
				hist_tex = icon_editcharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_head
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_head'
				hist_tex = icon_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_body
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_body'
				hist_tex = icon_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_proportions
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_proportions'
				hist_tex = icon_size
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_body_art
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_body_art'
				hist_tex = icon_graphics
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_stage_presence
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_stage_presence'
				hist_tex = icon_presence
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_character_face_deformation
		task = {
			Name = task_menu
			params = {
				base_name = 'character_face_deformation'
				hist_tex = icon_face
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_character_face_deformation_options
		task = {
			Name = task_menu
			params = {
				base_name = 'character_face_deformation_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_color_edit
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_color_edit'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_save_changes_dialogue
		task = {
			Name = task_menu
			params = {
				base_name = 'save_changes_dialogue'
				focus_id = pu_warning_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_genre
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_genre'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_gender
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_gender'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_create_character_gender
		task = {
			Name = task_menu
			params = {
				base_name = 'create_character_gender'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_create_character_genre
		task = {
			Name = task_menu
			params = {
				base_name = 'create_character_genre'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_discard_changes
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_discard_changes'
				focus_id = pu_warning_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_mic
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_mic'
				hist_tex = icon_mic_2
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_mic_main
		task = {
			Name = task_menu
			params = {
				base_name = 'customize_character_mic_main'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_select_part
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_select_part'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_select_part_options
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_select_part_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_popout_select_part
		task = {
			Name = task_menu
			params = {
				base_name = 'popout_select_part'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_select_part_color_options
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_select_part_color_options'
			}
		}}
	RegisterState \{Name = uistate_cas_text_entry
		task = {
			Name = task_menu
			params = {
				base_name = 'cas_text_entry'
				hist_tex = icon_name
			}
		}}
	RegisterState \{Name = uistate_end_credits
		task = {
			Name = task_menu
			params = {
				base_name = 'end_credits'
			}
		}}
endscript

script registeruistates_cap 
	RegisterState \{Name = uistate_cap_main
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_main'
				pakname = 'cas_ui'
				anim_out_script = ui_cap_main_anim_out
			}
		}}
	RegisterState \{Name = uistate_cap_layers_list
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_layers_list'
				pakname = 'cas_ui'
				hist_tex = icon_current
			}
		}}
	RegisterState \{Name = uistate_cap_shape_list
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_shape_list'
				pakname = 'cas_ui'
				hist_tex = category
			}
		}}
	RegisterState \{Name = uistate_cap_shape_list_subset
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_shape_list_subset'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cap_color_wheel
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_color_wheel'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cap_shape_edit
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_shape_edit'
				anim_in_script = nullscript
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cap_artist_layer
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_artist_layer'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cap_layers_options
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_layers_options'
				pakname = 'cas_ui'
				focus_id = layers_options_vmenu
			}
		}}
	RegisterState \{Name = uistate_cap_artist_layer_options
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_artist_layer_options'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cap_artist_layer_popout
		task = {
			Name = task_menu
			params = {
				base_name = 'cap_artist_layer_popout'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cas_save_slots
		task = {
			Name = task_menu
			params = {
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
				base_name = 'customize_character_outfit'
				hist_tex = icon_outfit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_customize_character_outfit_accessories
		task = {
			Name = task_menu
			params = {
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
				base_name = 'customize_character_instrument'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_main
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_main'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_custom'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom_body
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_custom_body'
				hist_tex = icon_cag_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom_body_types
		task = {
			Name = task_menu
			params = {
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
				base_name = 'cag_select_part_inclusion'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_select_part_inclusion_options
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_select_part_inclusion_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_metallica_presets
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_metallica_presets'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom_hardware
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_custom_hardware'
				hist_tex = icon_cag_hardware
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom_head
		task = {
			Name = task_menu
			params = {
				base_name = 'cag_custom_head'
				hist_tex = icon_cag_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cag_custom_strings
		task = {
			Name = task_menu
			params = {
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
				base_name = 'cag_custom_highway'
			}
		}}
endscript

script registeruistates_online 
	RegisterState \{Name = uistate_online
		task = {
			Name = task_menu
			params = {
				base_name = 'online'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{Name = uistate_net_setlist
		task = {
			Name = task_menu
			params = {
				base_name = 'net_setlist'
			}
		}}
	RegisterState \{Name = uistate_net_custom_search
		task = {
			Name = task_menu
			params = {
				base_name = 'net_custom_search'
			}
		}}
	RegisterState \{Name = uistate_net_serverlist
		task = {
			Name = task_menu
			params = {
				base_name = 'net_serverlist'
			}
		}}
	RegisterState \{Name = uistate_net_joining
		task = {
			Name = task_menu
			params = {
				base_name = 'net_joining'
			}
		}}
	RegisterState \{Name = uistate_net_debug_lobby
		task = {
			Name = task_menu
			params = {
				base_name = 'net_debug_lobby'
			}
		}}
	RegisterState \{Name = uistate_net_debug_lobby_join
		task = {
			Name = task_menu
			params = {
				base_name = 'net_debug_lobby_join'
			}
		}}
	RegisterState \{Name = uistate_net_signin_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'net_signin_popup'
				focus_id = net_signin_popup
			}
		}}
	RegisterState \{Name = uistate_net_career_join_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'net_career_join_popup'
				focus_id = career_join_popup
			}
		}}
	RegisterState \{Name = uistate_leaderboard
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_groups
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_groups'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_list
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_list'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_load
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_load'
				pakname = 'leaderboard'
				focus_id = leaderboard_load
			}
		}}
	RegisterState \{Name = uistate_leaderboard_filter
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_filter'
				pakname = 'leaderboard'
				focus_id = filter_menu
				anim_in_script = ui_leaderboard_popup_anim_in
				anim_out_script = ui_leaderboard_popup_anim_out
			}
		}}
	RegisterState \{Name = uistate_leaderboard_me
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_me'
				pakname = 'leaderboard'
				focus_id = leaderboard_popup
				anim_in_script = ui_leaderboard_popup_anim_in
				anim_out_script = ui_leaderboard_popup_anim_out
			}
		}}
	RegisterState \{Name = uistate_leaderboard_instrument
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_instrument'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_timeout
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_timeout'
			}
		}}
	RegisterState \{Name = uistate_leaderboard_empty
		task = {
			Name = task_menu
			params = {
				base_name = 'leaderboard_empty'
			}
		}}
	RegisterState \{Name = uistate_net_zero_search_results_popup
		task = {
			Name = task_menu
			params = {
				base_name = 'net_zero_search_results_popup'
				focus_id = net_zero_popup
			}
		}}
	RegisterState \{Name = uistate_friends_list
		task = {
			Name = task_menu
			params = {
				base_name = 'friends_list'
				focus_id = friends_list_popup
			}
		}}
	RegisterState \{Name = uistate_net_preferences
		task = {
			Name = task_menu
			params = {
				base_name = 'net_preferences'
				focus_id = net_preferences_popup
			}
		}}
	RegisterState \{Name = uistate_online_post_game_lobby
		task = {
			Name = task_menu
			params = {
				base_name = 'online_post_game_lobby'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{Name = uistate_net_setup
		task = {
			Name = task_menu
			params = {
				base_name = 'net_setup'
			}
		}}
	RegisterState \{Name = uistate_online_quit_warning
		task = {
			Name = task_menu
			params = {
				base_name = 'online_quit_warning'
				focus_id = online_quit_menu
			}
		}}
endscript

script registeruistates_cadrm 
	RegisterState \{Name = uistate_cadrm_main
		task = {
			Name = task_menu
			params = {
				base_name = 'cadrm_main'
				hist_tex = icon_cadrm_drum
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{Name = uistate_cadrm_hub
		task = {
			Name = task_menu
			params = {
				base_name = 'cadrm_hub'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
endscript

script registeruistates_music_store 
	RegisterState \{Name = uistate_music_store
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_newarrivals
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_newarrivals'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_songs
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_songs'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_specialpacks
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_specialpacks'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_albums
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_albums'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_albums_details
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_albums_details'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_songs_details
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_songs_details'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_specialpacks_details
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_specialpacks_details'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_purchase
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_purchase'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_songs_additional
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_songs_additional'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_song_list
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_song_list'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_terms
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_terms'
			}
		}}
	RegisterState \{Name = uistate_music_store_setup
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_setup'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_processing
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_processing'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_unavailible
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_unavailible'
				pakname = 'music_store'
			}
		}}
	RegisterState \{Name = uistate_music_store_scan_marketplace
		task = {
			Name = task_menu
			params = {
				base_name = 'music_store_scan_marketplace'
				pakname = 'music_store'
			}
		}}
endscript
