
script registeruistates 
	printf \{qs(0x7e56de1f)}
	MemPushContext \{frontendheap}
	ui_registerstate \{Name = uistate_null
		params = {
			base_name = 'null'
		}}
	registeruistates_boot
	registeruistates_options
	registeruistates_frontend
	registeruistates_debug
	registeruistates_profile
	registeruistates_career
	registeruistates_outro
	registeruistates_pause
	registeruistates_practice
	registeruistates_jam
	registeruistates_musicstudio
	registeruistates_select_rocker
	registeruistates_outfit
	registeruistates_cap
	registeruistates_cag
	registeruistates_online
	regsisteruistates_ds
	registeruistates_cadrm
	registeruistates_music_store
	registeruistates_savegame
	registeruistates_import
	registeruistates_temp
	registeruistates_stackobjecttest
	registeruistates_songlist
	registeruistates_hallofrecords
	ui_registerstate \{Name = uistate_band_lobby
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
		}}
	ui_registerstate \{Name = uistate_band_lobby_setup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'band_lobby_setup'
		}}
	ui_registerstate \{Name = uistate_mic_debug
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'mic_debug'
		}}
	ui_registerstate \{Name = uistate_mic_binding
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'mic_binding'
		}}
	ui_registerstate \{Name = uistate_team_selection
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'team_selection'
		}}
	ui_registerstate \{Name = uistate_options_progression
		params = {
			base_name = 'options_progression'
			anim_out_script = ui_options_progression_anim_out
		}}
	ui_registerstate \{Name = uistate_voting
		params = {
			base_name = 'voting'
			anim_in_script = ui_anim_in_voting
			pakname = 'voting'
		}}
	ui_registerstate \{Name = uistate_career_movie
		params = {
			base_name = 'career_movie'
		}}
	ui_registerstate \{Name = uistate_edit_name
		params = {
			base_name = 'edit_name'
			focus_id = edit_name_menu
		}}
	ui_registerstate \{Name = uistate_team_select
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'team_select'
			pakname = 'team_select'
		}}
	ui_registerstate \{Name = uistate_options_change_progression_warning
		params = {
			base_name = 'options_change_progression_warning'
		}}
	ui_registerstate \{Name = uistate_tutorial_menu
		params = {
			base_name = 'tutorial_menu'
			pakname = 'tutorial_shared'
		}}
	ui_registerstate \{Name = uistate_tutorial_pausemenu
		params = {
			base_name = 'pausemenu'
		}}
	ui_registerstate \{Name = uistate_tutorial_gameplay
		params = {
			base_name = 'tutorial_gameplay'
		}}
	ui_registerstate \{Name = uistate_tutorial_text_with_video
		params = {
			base_name = 'tutorial_text_with_video'
		}}
	ui_registerstate \{Name = uistate_tutorial_text_with_images
		params = {
			base_name = 'tutorial_text_with_images'
		}}
	ui_registerstate \{Name = uistate_tutorial_text
		params = {
			base_name = 'tutorial_text'
		}}
	ui_registerstate \{Name = uistate_tutorial_menu_skill_level
		params = {
			base_name = 'tutorial_menu_skill_level'
			pakname = 'tutorial_shared'
		}}
	ui_registerstate \{Name = uistate_tutorial_menu_lessons
		params = {
			base_name = 'tutorial_menu_lessons'
			pakname = 'tutorial_shared'
		}}
	ui_registerstate \{Name = uistate_band_lobby_popup
		params = {
			base_name = 'band_lobby_popup'
		}}
	ui_registerstate \{Name = uistate_invite_continue
		params = {
			base_name = 'invite_continue'
		}}
	ui_registerstate \{Name = uistate_tutorial_setup
		params = {
			base_name = 'tutorial_setup'
		}}
	ui_registerstate \{Name = uistate_finish_song_loading
		params = {
			base_name = 'finish_song_loading'
		}}
	ui_registerstate \{Name = uistate_debug_submenu
		params = {
			base_name = 'debug_submenu'
		}}
	ui_registerstate \{Name = uistate_universal_help
		params = {
			base_name = 'universal_help'
		}}
	ui_registerstate \{Name = uistate_universal_help_index
		params = {
			base_name = 'universal_help_index'
			pakname = 'universal_help'
			anim_in_script = ui_universal_help_index_anim_in
			anim_out_script = ui_universal_help_index_anim_out
		}}
	ui_registerstate \{Name = uistate_award_case
		params = {
			base_name = 'award_case'
			focus_id = null_id
			obj_desc = compositeobject_awardcaseuistackobject
			obj_id = awardcase
			pakname = 'award_case'
		}}
	ui_registerstate \{Name = uistate_rewards_unlocked_qp
		params = {
			base_name = 'rewards_unlocked_qp'
			pakname = 'rewards_unlocked'
		}}
	ui_registerstate \{Name = uistate_pointer_test
		params = {
			base_name = 'pointer_test'
		}}
	ui_registerstate \{Name = uistate_sing_a_long
		params = {
			base_name = 'sing_a_long'
		}}
	ui_registerstate \{Name = uistate_qp_earned_stars
		params = {
			base_name = 'qp_earned_stars'
			pakname = 'qp_earned_stars'
		}}
	ui_registerstate \{Name = uistate_quickplay_power_select
		params = {
			base_name = 'quickplay_power_select'
			focus_id = qp_power_select_id
			pakname = 'award_case'
		}}
	ui_registerstate \{Name = uistate_social_networks_choose
		params = {
			base_name = 'social_networks_choose'
			focus_id = alias_social_choose_vmenu
		}}
	ui_registerstate \{Name = uistate_sync_spot_warning
		params = {
			base_name = 'sync_spot_warning'
			focus_id = sync_spot_warning_id
		}}
	MemPopContext
endscript

script registeruistates_boot 
	ui_registerstate \{Name = uistate_freeplay
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'freeplay'
			obj_desc = compositeobject_freeplayuistackobject
			obj_id = freeplay
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_freeplay_pause
		params = {
			base_name = 'freeplay_pause'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_boot_download_scan
		params = {
			base_name = 'boot_download_scan'
			pakname = 'wii_handle_trc'
		}}
	ui_registerstate \{Name = uistate_save_icon_warning
		params = {
			base_name = 'save_icon_warning'
			pakname = 'wii_handle_trc'
			focus_id = autosave_boot_message
		}}
endscript

script registeruistates_profile 
	ui_registerstate \{Name = uistate_signin
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'signin'
		}}
	ui_registerstate \{Name = uistate_signin_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'signin_warning'
		}}
	ui_registerstate \{Name = uistate_signin_complete
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'signin_complete'
		}}
	ui_registerstate \{Name = uistate_memcard
		params = {
			base_name = 'memcard'
			Type = boot
		}}
	ui_registerstate \{Name = uistate_signin_changed
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'signin_changed'
		}}
	ui_registerstate \{Name = uistate_connection_loss
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'connection_loss'
		}}
	ui_registerstate \{Name = uistate_wii_handle_trc
		params = {
			base_name = 'wii_handle_trc'
			pakname = 'wii_handle_trc'
		}}
endscript

script registeruistates_frontend 
	ui_registerstate \{Name = uistate_mainmenu
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
			pakname = 'mainmenu'
			anim_out_script = ui_mainmenu_anim_out
		}}
	ui_registerstate \{Name = uistate_mainmenu_play
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'mainmenu_play'
			pakname = 'mainmenu'
			anim_out_script = ui_mainmenu_play_anim_out
		}}
	ui_registerstate \{Name = uistate_mainmenu_create
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'mainmenu_create'
			pakname = 'mainmenu'
			anim_out_script = ui_mainmenu_create_anim_out
		}}
	ui_registerstate \{Name = uistate_motd
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'motd'
			pakname = 'band_lobby'
		}}
	ui_registerstate \{Name = uistate_vip_invite
		params = {
			base_name = 'vip_invite'
			pakname = 'vip_invite'
		}}
	ui_registerstate \{Name = uistate_generic_dialog_box
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'generic_dialog_box'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{Name = uistate_helper_dialogue
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'helper_dialogue'
			focus_id = helper_root
		}}
	ui_registerstate \{Name = uistate_iis
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'iis'
			pakname = 'band_lobby'
			anim_in_script = ui_iis_anim_in
		}}
endscript

script registeruistates_options 
	ui_registerstate \{Name = uistate_options
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
			pakname = 'mainmenu'
			anim_out_script = ui_options_anim_out
		}}
	ui_registerstate \{Name = uistate_options_gameplay
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'options_gameplay'
			pakname = 'mainmenu'
			anim_out_script = ui_options_gameplay_anim_out
		}}
	ui_registerstate \{Name = uistate_options_game_setup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'options_game_setup'
			pakname = 'mainmenu'
			anim_in_script = ui_options_game_setup_anim_in
			anim_out_script = ui_options_game_setup_anim_out
		}}
	ui_registerstate \{Name = uistate_options_audio
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_audio'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_options_mic_binding_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_mic_binding_warning'
		}}
	ui_registerstate \{Name = uistate_options_calibrate_lag_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_calibrate_lag_warning'
		}}
	ui_registerstate \{Name = uistate_options_controller
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_controller'
		}}
	ui_registerstate \{Name = uistate_bonus_videos
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'bonus_videos'
			pakname = 'band_lobby'
			pakname = 'mainmenu'
			anim_in_script = ui_bonus_videos_anim_in
			anim_out_script = ui_bonus_videos_anim_out
		}}
	ui_registerstate \{Name = uistate_bonus_videos_credits
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'bonus_videos_credits'
			pakname = 'bonus_videos_credits'
		}}
	ui_registerstate \{Name = uistate_options_cheats_new
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
		}}
	ui_registerstate \{Name = uistate_options_data
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_data'
			anim_out_script = ui_options_data_anim_out
		}}
	ui_registerstate \{Name = uistate_options_settings
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_settings'
		}}
	ui_registerstate \{Name = uistate_options_settings_lefty_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_settings_lefty_warning'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{Name = uistate_options_calibrate
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_calibrate'
		}}
	ui_registerstate \{Name = uistate_band_name_logo
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'band_name_logo'
			focus_id = band_name_menu
		}}
	ui_registerstate \{Name = uistate_options_vocals_view_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'options_vocals_view_warning'
		}}
	ui_registerstate \{Name = uistate_guitarhero_com
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'guitarhero_com'
			pakname = 'guitarhero_com'
		}}
	ui_registerstate \{Name = uistate_failed_three_times_warning
		params = {
			base_name = 'failed_three_times_warning'
		}}
	ui_registerstate \{Name = uistate_options_universal_help
		params = {
			base_name = 'options_universal_help'
			pakname = 'universal_help'
		}}
	ui_registerstate \{Name = uistate_options_facebook
		params = {
			base_name = 'options_facebook'
			focus_id = options_facebook_vmenu
		}}
	ui_registerstate \{Name = uistate_options_twitter
		params = {
			base_name = 'options_twitter'
			focus_id = options_twitter_vmenu
		}}
	ui_registerstate \{Name = uistate_social_networks_setup
		params = {
			base_name = 'social_networks_setup'
		}}
	ui_registerstate \{Name = uistate_social_networks_broadcast
		params = {
			base_name = 'social_networks_broadcast'
		}}
	ui_registerstate \{Name = uistate_privacy_policy
		params = {
			base_name = 'privacy_policy'
		}}
endscript

script registeruistates_debug 
	ui_registerstate \{Name = uistate_debug
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'debug'
			pakname = 'ui_debug'
		}}
	ui_registerstate \{Name = uistate_debug_color_calibration
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'debug_color_calibration'
		}}
	ui_registerstate \{Name = uistate_rockout
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'rockout'
			pakname = 'rockout'
		}}
	ui_registerstate \{Name = uistate_autotest_next_test
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'autotest_next_test'
		}}
	ui_registerstate \{Name = uistate_debug_brightness_calibration
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'debug_brightness_calibration'
			pakname = 'debug_brightness_calibration'
		}}
	ui_registerstate \{Name = uistate_debug_gamma_calibration
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'debug_gamma_calibration'
			pakname = 'debug_gamma_calibration'
		}}
	ui_registerstate \{Name = uistate_debug_atvi_color_calibration
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'debug_atvi_color_calibration'
			pakname = 'debug_gamma_calibration'
		}}
	ui_registerstate \{Name = uistate_nxgui_preview
		params = {
			base_name = 'nxgui_preview'
			pakname = $ui_preview_pak_name
		}}
endscript

script registeruistates_career 
	ui_registerstate \{Name = uistate_play_song
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'play_song'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = Uistate_gameplay
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'gameplay'
			pakname = 'gameplay'
			alternate_pakname = 'calibrate_lag'
			alternate_decision_script = use_alternate_if_in_calibrate
		}}
	ui_registerstate \{Name = uistate_fail_song
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'fail_song'
		}}
	ui_registerstate \{Name = uistate_controller_disconnect
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'controller_disconnect'
		}}
	ui_registerstate \{Name = uistate_song_breakdown
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'song_breakdown'
			pakname = 'song_breakdown'
		}}
	ui_registerstate \{Name = uistate_quest_map
		params = {
			base_name = 'quest_map'
			pakname = 'career_map'
		}}
	ui_registerstate \{Name = uistate_quest_band_select
		params = {
			base_name = 'quest_band_select'
			pakname = 'career_band_select'
		}}
	ui_registerstate \{Name = uistate_quest_band_select_power_details
		params = {
			base_name = 'quest_band_select_power_details'
		}}
	ui_registerstate \{Name = uistate_quest_map_giglist
		params = {
			base_name = 'quest_map_giglist'
			pakname = 'career_map_giglist'
		}}
	ui_registerstate \{Name = uistate_quest_transformation_info
		params = {
			base_name = 'quest_transformation_info'
		}}
	ui_registerstate \{Name = uistate_quest_breakdown
		params = {
			base_name = 'quest_breakdown'
		}}
	ui_registerstate \{Name = uistate_quest_unlocks
		params = {
			base_name = 'quest_unlocks'
			pakname = 'quest_unlocks'
		}}
	ui_registerstate \{Name = uistate_rewards_unlocked
		params = {
			base_name = 'rewards_unlocked'
			pakname = 'rewards_unlocked'
		}}
endscript

script registeruistates_pause 
	ui_registerstate \{Name = Uistate_pausemenu
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pause_options
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pause_options'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_restart_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_restart_warning'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_change_difficulty
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_change_difficulty'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_change_difficulty_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_change_difficulty_warning'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_change_difficulty_confirm
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_change_difficulty_confirm'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_lefty_flip_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_lefty_flip_warning'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_highwaytype_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_highwaytype_warning'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_highwaytype
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_highwaytype'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_quit_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_quit_warning'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_pausemenu_song_ended
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'pausemenu_song_ended'
			pakname = 'gameplay'
		}}
	ui_registerstate \{Name = uistate_song_unpause
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'song_unpause'
			pakname = 'gameplay'
		}}
endscript

script registeruistates_outro 
	ui_registerstate \{Name = uistate_song_breakdown_competitive
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
		}}
	ui_registerstate \{Name = uistate_song_breakdown_shreddfest_match_complete
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'song_breakdown_shreddfest_match_complete'
			pakname = 'song_breakdown_competitive'
		}}
	ui_registerstate \{Name = uistate_rewards
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'rewards'
			pakname = 'rewards'
		}}
	ui_registerstate \{Name = uistate_song_summary_details
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'song_summary_details'
			pakname = 'song_breakdown'
		}}
	ui_registerstate \{Name = uistate_game_rules
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'game_rules'
			pakname = 'game_rules'
		}}
endscript

script registeruistates_practice 
	ui_registerstate \{Name = uistate_select_training
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'select_training'
			pakname = 'mainmenu'
			anim_in_script = ui_select_training_anim_in
			anim_out_script = ui_select_training_anim_out
		}}
	ui_registerstate \{Name = uistate_select_practice_instrument
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'select_practice_instrument'
			pakname = 'practice_select'
		}}
	ui_registerstate \{Name = uistate_select_practice_difficulty
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'select_practice_difficulty'
			pakname = 'practice_select'
		}}
	ui_registerstate \{Name = uistate_select_tutorial
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'select_tutorial'
		}}
	ui_registerstate \{Name = uistate_play_tutorial
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
		}}
	ui_registerstate \{Name = uistate_select_song_section
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'select_song_section'
			pakname = 'practice_select'
		}}
	ui_registerstate \{Name = uistate_practice_select_speed
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'practice_select_speed'
			pakname = 'practice_select'
		}}
	ui_registerstate \{Name = uistate_practice_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'practice_warning'
		}}
	ui_registerstate \{Name = uistate_practice_select_looping
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'practice_select_looping'
			pakname = 'practice_select'
		}}
endscript

script registeruistates_musicstudio 
	ui_registerstate \{Name = uistate_musicstudio_ghmix
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'musicstudio_ghmix'
			pakname = 'musicstudio_ghmix'
		}}
	ui_registerstate \{Name = uistate_musicstudio_ghmix_song
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'musicstudio_ghmix_song'
			pakname = 'musicstudio_ghmix'
		}}
	ui_registerstate \{Name = uistate_musicstudio_jamroom_wizard
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'musicstudio_jamroom_wizard'
			pakname = 'jam'
		}}
endscript

script registeruistates_jam 
	ui_registerstate \{Name = uistate_jam
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam'
			pakname = 'jam'
		}}
	ui_registerstate \{Name = uistate_jam_select_song
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_select_song'
			pakname = 'jam'
		}}
	ui_registerstate \{Name = uistate_jam_band
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_band'
			pakname = 'musicstudio_jamroom'
		}}
	ui_registerstate \{Name = uistate_recording_disconnect
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'recording_disconnect'
		}}
	ui_registerstate \{Name = uistate_jam_publish_song
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_song'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_publish_genre
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_genre'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_publish_track_select
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_track_select'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_publish_slot
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_slot'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_download_slot
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_download_slot'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_publish_text_entry
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_text_entry'
			pakname = 'jam_ghtunes'
			focus_id = text_entry_vmenu
		}}
	ui_registerstate \{Name = uistate_jam_publish_update_fileid
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_update_fileid'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_publish_signin
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_publish_signin'
			pakname = 'jam'
		}}
	ui_registerstate \{Name = uistate_jam_ghtunes
		params = {
			systems = [
				Camera
				Band
			]
			base_name = 'jam_ghtunes'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{Name = uistate_jam_ratesong
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'jam_ratesong'
			pakname = 'musicstudio_rate_song'
		}}
endscript

script registeruistates_select_rocker 
	ui_registerstate \{Name = uistate_character_selection
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'character_selection'
			pakname = 'mainmenu'
		}}
	ui_registerstate \{Name = uistate_customize_character
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
		}}
	ui_registerstate \{Name = uistate_customize_character_enter
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
			alternate_pakname = 'band_lobby'
			alternate_decision_script = use_alternate_if_from_lobby
		}}
	ui_registerstate \{Name = uistate_customize_character_head
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
		}}
	ui_registerstate \{Name = uistate_customize_character_body
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
		}}
	ui_registerstate \{Name = uistate_customize_character_proportions
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
		}}
	ui_registerstate \{Name = uistate_customize_character_body_art
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
		}}
	ui_registerstate \{Name = uistate_customize_character_makeup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'customize_character_makeup'
			hist_tex = icon_face
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_character_face_deformation
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
		}}
	ui_registerstate \{Name = uistate_character_face_deformation_options
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'character_face_deformation_options'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_cas_color_edit
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_color_edit'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_save_changes_dialogue
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
		}}
	ui_registerstate \{Name = uistate_create_character_gender
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'create_character_gender'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_create_character_genre
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'create_character_genre'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_cas_discard_changes
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
		}}
	ui_registerstate \{Name = uistate_customize_character_mic
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
		}}
	ui_registerstate \{Name = uistate_customize_character_mic_main
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
		}}
	ui_registerstate \{Name = uistate_cas_select_part_options
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_select_part_options'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_popout_select_part
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
		}}
	ui_registerstate \{Name = uistate_popout_select_preset
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'popout_select_preset'
			focus_id = current_list_menu
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_cas_select_part_color_options
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_select_part_color_options'
		}}
	ui_registerstate \{Name = uistate_cas_select_part_swatches
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_select_part_swatches'
			pakname = 'cas_swatch_edit'
		}}
	ui_registerstate \{Name = uistate_cas_text_entry
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_text_entry'
			hist_tex = icon_name
		}}
	ui_registerstate \{Name = uistate_end_credits
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'end_credits'
			pakname = 'bonus_videos_credits'
		}}
endscript

script registeruistates_cap 
	ui_registerstate \{Name = uistate_cagr
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cagr'
		}}
	ui_registerstate \{Name = uistate_cap_main
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cagr'
		}}
	ui_registerstate \{Name = uistate_cap_layers_list
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
		}}
	ui_registerstate \{Name = uistate_cap_shape_list
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
		}}
	ui_registerstate \{Name = uistate_cap_shape_list_subset
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
		}}
	ui_registerstate \{Name = uistate_cap_color_wheel
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
		}}
	ui_registerstate \{Name = uistate_cap_shape_edit
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
		}}
	ui_registerstate \{Name = uistate_cap_artist_layer
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cap_artist_layer'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_cap_layers_options
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
		}}
	ui_registerstate \{Name = uistate_cap_artist_layer_options
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
		}}
	ui_registerstate \{Name = uistate_cap_artist_layer_popout
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
		}}
	ui_registerstate \{Name = uistate_cas_save_slots
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cas_save_slots'
			pakname = 'cas_ui'
		}}
endscript

script registeruistates_outfit 
	ui_registerstate \{Name = uistate_customize_character_outfit
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
		}}
	ui_registerstate \{Name = uistate_customize_character_outfit_accessories
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
		}}
endscript

script registeruistates_cag 
	ui_registerstate \{Name = uistate_customize_character_instrument
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
		}}
	ui_registerstate \{Name = uistate_customize_character_instrument_change
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
		}}
	ui_registerstate \{Name = uistate_cag_main
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cag_main'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{Name = uistate_cag_custom
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_body
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_body_types
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
		}}
	ui_registerstate \{Name = uistate_cag_select_part_inclusion
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_hardware
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_head
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_strings
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
		}}
	ui_registerstate \{Name = uistate_cag_custom_highway
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'cag_custom_highway'
		}}
endscript

script registeruistates_online 
	ui_registerstate \{Name = uistate_online
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'online'
			pakname = 'online_lobby'
		}}
	ui_registerstate \{Name = uistate_net_custom_search
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_custom_search'
		}}
	ui_registerstate \{Name = uistate_net_serverlist
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_serverlist'
		}}
	ui_registerstate \{Name = uistate_net_joining
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_joining'
		}}
	ui_registerstate \{Name = uistate_net_debug_lobby
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_debug_lobby'
		}}
	ui_registerstate \{Name = uistate_net_debug_lobby_join
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_debug_lobby_join'
		}}
	ui_registerstate \{Name = uistate_net_signin_popup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_signin_popup'
			focus_id = net_signin_popup
		}}
	ui_registerstate \{Name = uistate_net_career_join_popup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_career_join_popup'
			focus_id = career_join_popup
		}}
	ui_registerstate \{Name = uistate_leaderboard
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
		}}
	ui_registerstate \{Name = uistate_leaderboard_instrument
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
			anim_in_script = ui_leaderboard_inst_menu_anim_in
			anim_out_script = ui_leaderboard_inst_menu_anim_out
		}}
	ui_registerstate \{Name = uistate_leaderboard_difficulty
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
			]
			base_name = 'leaderboard_difficulty'
		}}
	ui_registerstate \{Name = uistate_net_zero_search_results_popup
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'net_zero_search_results_popup'
			focus_id = net_zero_popup
		}}
	ui_registerstate \{Name = uistate_online_quit_warning
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'online_quit_warning'
			focus_id = online_quit_menu
		}}
	ui_registerstate \{Name = uistate_rock_record
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'rock_record'
			focus_id = rock_record_menu
		}}
	ui_registerstate \{Name = uistate_rock_archive
		params = {
			base_name = 'Rock_Archive'
		}}
	ui_registerstate \{Name = uistate_online_setup
		params = {
			base_name = 'Online_Setup'
			pakname = 'mainmenu'
		}}
	ui_registerstate \{Name = uistate_online_settings
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
				stageshow
				musicmonitor
			]
			base_name = 'Online_Settings'
			pakname = 'mainmenu'
			anim_out_script = ui_options_online_anim_out
		}}
	ui_registerstate \{Name = uistate_achievements
		params = {
			base_name = 'achievements'
			pakname = 'achievements'
		}}
endscript

script registeruistates_cadrm 
	ui_registerstate \{Name = uistate_cadrm_main
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
		}}
	ui_registerstate \{Name = uistate_cadrm_hub
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
		}}
endscript

script registeruistates_music_store 
	ui_registerstate \{Name = uistate_music_store_hub
		params = {
			base_name = 'music_store_hub'
			focus_id = music_store_hub_vmenu
		}}
	ui_registerstate \{Name = uistate_music_store_terms
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'music_store_terms'
		}}
	ui_registerstate \{Name = uistate_music_store_scan_marketplace
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'music_store_scan_marketplace'
		}}
	ui_registerstate \{Name = uistate_ecard_edit_name
		params = {
			base_name = 'ecard_edit_name'
			focus_id = edit_name_menu
		}}
endscript

script registeruistates_savegame 
	ui_registerstate \{Name = uistate_savegame_boot_scan
		params = {
			base_name = 'savegame_boot_scan'
			pakname = 'mainmenu'
		}}
	ui_registerstate \{Name = uistate_trophy_warning
		params = {
			base_name = 'trophy_warning'
		}}
endscript

script registeruistates_import 
	ui_registerstate \{Name = uistate_import_keycode
		params = {
			base_name = 'import_keycode'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{Name = uistate_import_edit_name
		params = {
			base_name = 'import_edit_name'
			focus_id = edit_name_menu
		}}
	ui_registerstate \{Name = uistate_import_pre_legal
		params = {
			base_name = 'import_pre_legal'
			focus_id = import_legal_dialog_box
		}}
	ui_registerstate \{Name = uistate_import_post_legal
		params = {
			base_name = 'import_post_legal'
			focus_id = import_legal_dialog_box
		}}
endscript

script registeruistates_temp 
	ui_registerstate \{Name = uistate_nxgui_sandbox
		params = {
			base_name = 'NxGUI_Sandbox'
			pakname = 'NxGUI_Sandbox'
		}}
endscript

script registeruistates_stackobjecttest 
	ui_registerstate \{Name = uistate_test_ui_state_a
		params = {
			base_name = 'test_ui_state_A'
			obj_desc = compositeobject_debuguistackobject
			init_variable = a
		}}
	ui_registerstate \{Name = uistate_test_ui_state_b
		params = {
			base_name = 'test_ui_state_B'
			obj_desc = compositeobject_debuguistackobject
			init_variable = b
		}}
	ui_registerstate \{Name = uistate_example_ui_stack_object
		params = {
			base_name = 'example_ui_stack_object'
			obj_desc = compositeobject_exampleuistackobject
			a = 7
			b = 0
		}}
endscript

script registeruistates_songlist 
	ui_registerstate \{Name = uistate_songlist
		params = {
			base_name = 'songlist'
			pakname = 'songlist'
			obj_desc = compositeobject_songlistuistackobject
			obj_id = songlist_component
			no_auto_focus = 1
			alternate_pakname = 'music_store'
			alternate_decision_script = should_load_music_store_pak
		}}
	ui_registerstate \{Name = uistate_songlist_options
		params = {
			base_name = 'songlist_options'
			focus_id = songlist_options_vmenu
		}}
endscript

script regsisteruistates_ds 
	ui_registerstate \{Name = uistate_ds_service_menu
		params = {
			base_name = 'ds_service_menu'
		}}
	ui_registerstate \{Name = uistate_ds_connection_handler
		params = {
			base_name = 'ds_connection_handler'
			pakname = 'ds_connection_handler'
		}}
	ui_registerstate \{Name = uistate_roadie_battle_choose_mode
		params = {
			base_name = 'roadie_battle_choose_mode'
			pakname = 'roadie_battle_choose_mode'
		}}
	ui_registerstate \{Name = uistate_roadie_battle_ds_disconnect
		params = {
			base_name = 'roadie_battle_ds_disconnect'
		}}
	ui_registerstate \{Name = uistate_roadie_challenge_target_select
		params = {
			base_name = 'roadie_challenge_target_select'
			pakname = 'roadie_challenge_target_select'
		}}
endscript

script registeruistates_hallofrecords 
	ui_registerstate \{Name = uistate_hall_of_records
		params = {
			systems = [
				venue
				Crowd
				Camera
				Band
			]
			base_name = 'hall_of_records'
			pakname = 'hall_of_records'
			anim_out_script = ui_hall_anim_in
		}}
	ui_registerstate \{Name = uistate_art_gallery_menu
		params = {
			base_name = 'art_gallery_menu'
			pakname = 'art_gallery'
			anim_in_script = ui_art_anim_in
		}}
	ui_registerstate \{Name = uistate_art_gallery
		params = {
			base_name = 'art_gallery'
			anim_in_script = ui_art_anim_in
		}}
	ui_registerstate \{Name = uistate_unlock_tracker
		params = {
			base_name = 'unlock_tracker'
			pakname = 'mainmenu'
		}}
endscript
