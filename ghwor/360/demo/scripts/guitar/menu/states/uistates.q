
script registeruistates 
	printf \{qs(0x7e56de1f)}
	mempushcontext \{heap_frontend}
	ui_registerstate \{name = uistate_null
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
	registeruistates_cadrm
	registeruistates_music_store
	registeruistates_savegame
	registeruistates_import
	registeruistates_temp
	registeruistates_stackobjecttest
	registeruistates_songlist
	registeruistates_hallofrecords
	ui_registerstate \{name = uistate_band_lobby
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
		}}
	ui_registerstate \{name = uistate_band_lobby_setup
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'band_lobby_setup'
		}}
	ui_registerstate \{name = uistate_mic_debug
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'mic_debug'
		}}
	ui_registerstate \{name = uistate_mic_binding
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'mic_binding'
		}}
	ui_registerstate \{name = uistate_team_selection
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'team_selection'
		}}
	ui_registerstate \{name = uistate_physics
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'physics'
			pakname = 'physics'
		}}
	ui_registerstate \{name = uistate_options_progression
		params = {
			base_name = 'options_progression'
			anim_out_script = ui_options_progression_anim_out
		}}
	ui_registerstate \{name = uistate_voting
		params = {
			base_name = 'voting'
			anim_in_script = ui_anim_in_voting
			pakname = 'songlist'
		}}
	ui_registerstate \{name = uistate_career_movie
		params = {
			base_name = 'career_movie'
		}}
	ui_registerstate \{name = uistate_os_edit_name
		params = {
			base_name = 'os_edit_name'
			focus_id = null_id
		}}
	ui_registerstate \{name = uistate_team_select
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'team_select'
			pakname = 'team_select'
		}}
	ui_registerstate \{name = uistate_options_change_progression_warning
		params = {
			base_name = 'options_change_progression_warning'
		}}
	ui_registerstate \{name = uistate_tutorial_guitar_load_basic
		params = {
			base_name = 'tutorial_guitar_load_basic'
			pakname = 'tutorial_guitar_basic'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_guitar_load_intermediate
		params = {
			base_name = 'tutorial_guitar_load_intermediate'
			pakname = 'tutorial_guitar_intermediate'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_guitar_load_advanced
		params = {
			base_name = 'tutorial_guitar_load_advanced'
			pakname = 'tutorial_guitar_advanced'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_drums_load
		params = {
			base_name = 'tutorial_drums_load'
			pakname = 'tutorial_drums'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_bass_load
		params = {
			base_name = 'tutorial_bass_load'
			pakname = 'tutorial_bass'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_vocals_load
		params = {
			base_name = 'tutorial_vocals_load'
			pakname = 'tutorial_vocals'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_band_load
		params = {
			base_name = 'tutorial_band_load'
			pakname = 'tutorial_band'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_gameplay_load
		params = {
			base_name = 'tutorial_gameplay_load'
			pakname = 'tutorial_gameplay'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_menu
		params = {
			base_name = 'tutorial_menu'
			pakname = 'tutorial_shared'
			visualizer_preset = og_bluewaves
		}}
	ui_registerstate \{name = uistate_tutorial_gameplay
		params = {
			base_name = 'tutorial_gameplay'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_tutorial_text_with_video
		params = {
			base_name = 'tutorial_text_with_video'
			visualizer_preset = og_blueelectric
		}}
	ui_registerstate \{name = uistate_tutorial_text_with_images
		params = {
			base_name = 'tutorial_text_with_images'
			visualizer_preset = og_blueelectric
		}}
	ui_registerstate \{name = uistate_tutorial_text
		params = {
			base_name = 'tutorial_text'
			visualizer_preset = og_blueelectric
		}}
	ui_registerstate \{name = uistate_tutorial_menu_skill_level
		params = {
			base_name = 'tutorial_menu_skill_level'
			visualizer_preset = og_energina
		}}
	ui_registerstate \{name = uistate_tutorial_menu_lessons
		params = {
			base_name = 'tutorial_menu_lessons'
			visualizer_preset = og_blueelectric
		}}
	ui_registerstate \{name = uistate_band_lobby_popup
		params = {
			base_name = 'band_lobby_popup'
		}}
	ui_registerstate \{name = uistate_invite_continue
		params = {
			base_name = 'invite_continue'
		}}
	ui_registerstate \{name = uistate_tutorial_setup
		params = {
			base_name = 'tutorial_setup'
			visualizer_preset = og_bluetapestry
		}}
	ui_registerstate \{name = uistate_finish_song_loading
		params = {
			base_name = 'finish_song_loading'
		}}
	ui_registerstate \{name = uistate_debug_submenu
		params = {
			base_name = 'debug_submenu'
		}}
	ui_registerstate \{name = uistate_universal_help
		params = {
			base_name = 'universal_help'
		}}
	ui_registerstate \{name = uistate_universal_help_index
		params = {
			base_name = 'universal_help_index'
			pakname = 'universal_help_index'
			anim_in_script = ui_universal_help_index_anim_in
			anim_out_script = ui_universal_help_index_anim_out
		}}
	ui_registerstate \{name = uistate_award_case
		params = {
			base_name = 'award_case'
			focus_id = null_id
			obj_desc = compositeobject_awardcaseuistackobject
			obj_id = awardcase
		}}
	ui_registerstate \{name = uistate_sing_a_long
		params = {
			base_name = 'sing_a_long'
		}}
	ui_registerstate \{name = uistate_rewards_unlocked_qp
		params = {
			base_name = 'rewards_unlocked_qp'
			pakname = 'rewards_unlocked'
		}}
	ui_registerstate \{name = uistate_qp_earned_stars
		params = {
			base_name = 'qp_earned_stars'
			pakname = 'qp_earned_stars'
		}}
	ui_registerstate \{name = uistate_quickplay_power_select
		params = {
			base_name = 'quickplay_power_select'
			focus_id = qp_power_select_id
		}}
	ui_registerstate \{name = uistate_social_networks_choose
		params = {
			base_name = 'social_networks_choose'
			focus_id = alias_social_choose_vmenu
		}}
	ui_registerstate \{name = uistate_sync_spot_warning
		params = {
			base_name = 'sync_spot_warning'
			focus_id = sync_spot_warning_id
		}}
	mempopcontext
endscript

script registeruistates_boot 
	ui_registerstate \{name = uistate_freeplay
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'freeplay'
			obj_desc = compositeobject_freeplayuistackobject
			obj_id = freeplay
		}}
	ui_registerstate \{name = uistate_freeplay_pause
		params = {
			base_name = 'freeplay_pause'
		}}
	ui_registerstate \{name = uistate_boot_download_scan
		params = {
			base_name = 'boot_download_scan'
		}}
	ui_registerstate \{name = uistate_save_icon_warning
		params = {
			base_name = 'save_icon_warning'
			focus_id = autosave_boot_message
			pakname = 'band_lobby'
		}}
endscript

script registeruistates_profile 
	ui_registerstate \{name = uistate_signin
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'signin'
		}}
	ui_registerstate \{name = uistate_signin_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'signin_warning'
		}}
	ui_registerstate \{name = uistate_signin_complete
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'signin_complete'
		}}
	ui_registerstate \{name = uistate_memcard
		params = {
			base_name = 'memcard'
		}}
	ui_registerstate \{name = uistate_signin_changed
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'signin_changed'
		}}
	ui_registerstate \{name = uistate_connection_loss
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'connection_loss'
		}}
endscript

script registeruistates_frontend 
	ui_registerstate \{name = uistate_mainmenu
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
			visualizer_preset = og_tunnelizertoo
			anim_out_script = ui_mainmenu_anim_out
		}}
	ui_registerstate \{name = uistate_mainmenu_play
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
				musicmonitor
			]
			base_name = 'mainmenu_play'
			pakname = 'band_lobby'
			visualizer_preset = og_tunnelizertoo
			anim_out_script = ui_mainmenu_play_anim_out
		}}
	ui_registerstate \{name = uistate_mainmenu_create
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
				musicmonitor
			]
			base_name = 'mainmenu_create'
			pakname = 'band_lobby'
			visualizer_preset = og_tunnelizertoo
			anim_out_script = ui_mainmenu_create_anim_out
		}}
	ui_registerstate \{name = uistate_motd
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'motd'
			pakname = 'band_lobby'
		}}
	ui_registerstate \{name = uistate_vip_invite
		params = {
			base_name = 'vip_invite'
			pakname = 'vip_invite'
		}}
	ui_registerstate \{name = uistate_generic_dialog_box
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'generic_dialog_box'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{name = uistate_helper_dialogue
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'helper_dialogue'
			focus_id = helper_root
		}}
endscript

script registeruistates_options 
	ui_registerstate \{name = uistate_options
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
			anim_in_script = ui_options_anim_in
			anim_out_script = ui_options_anim_out
		}}
	ui_registerstate \{name = uistate_options_gameplay
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
				musicmonitor
			]
			base_name = 'options_gameplay'
			pakname = 'band_lobby'
			anim_in_script = ui_options_gameplay_anim_in
			anim_out_script = ui_options_gameplay_anim_out
		}}
	ui_registerstate \{name = uistate_options_game_setup
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
				musicmonitor
			]
			base_name = 'options_game_setup'
			pakname = 'band_lobby'
			anim_in_script = ui_options_game_setup_anim_in
			anim_out_script = ui_options_game_setup_anim_out
		}}
	ui_registerstate \{name = uistate_options_audio
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_audio'
			pakname = 'options_audio'
		}}
	ui_registerstate \{name = uistate_options_mic_binding_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_mic_binding_warning'
		}}
	ui_registerstate \{name = uistate_options_calibrate_lag_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_calibrate_lag_warning'
		}}
	ui_registerstate \{name = uistate_options_controller
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_controller'
		}}
	ui_registerstate \{name = uistate_bonus_videos
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'bonus_videos'
			pakname = 'band_lobby'
			anim_in_script = ui_bonus_videos_anim_in
			anim_out_script = ui_bonus_videos_anim_out
		}}
	ui_registerstate \{name = uistate_bonus_videos_credits
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'bonus_videos_credits'
			pakname = 'bonus_videos_credits'
		}}
	ui_registerstate \{name = uistate_options_cheats_new
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
		}}
	ui_registerstate \{name = uistate_options_data
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_data'
			anim_out_script = ui_options_data_anim_out
		}}
	ui_registerstate \{name = uistate_options_settings
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_settings'
		}}
	ui_registerstate \{name = uistate_options_settings_lefty_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_settings_lefty_warning'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{name = uistate_options_calibrate
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_calibrate'
		}}
	ui_registerstate \{name = uistate_options_vocals_view_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'options_vocals_view_warning'
		}}
	ui_registerstate \{name = uistate_guitarhero_com
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'guitarhero_com'
			pakname = 'guitarhero_com'
		}}
	ui_registerstate \{name = uistate_options_universal_help
		params = {
			base_name = 'options_universal_help'
			pakname = 'universal_help'
		}}
	ui_registerstate \{name = uistate_options_facebook
		params = {
			base_name = 'options_facebook'
			focus_id = options_facebook_vmenu
		}}
	ui_registerstate \{name = uistate_options_twitter
		params = {
			base_name = 'options_twitter'
			focus_id = options_twitter_vmenu
		}}
	ui_registerstate \{name = uistate_social_networks_setup
		params = {
			base_name = 'social_networks_setup'
		}}
	ui_registerstate \{name = uistate_social_networks_broadcast
		params = {
			base_name = 'social_networks_broadcast'
		}}
	ui_registerstate \{name = uistate_privacy_policy
		params = {
			base_name = 'privacy_policy'
		}}
endscript

script registeruistates_debug 
	ui_registerstate \{name = uistate_debug
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug'
			pakname = 'ui_debug'
		}}
	ui_registerstate \{name = uistate_debug_color_calibration
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug_color_calibration'
		}}
	ui_registerstate \{name = uistate_debug_color_histogram
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug_color_histogram'
		}}
	ui_registerstate \{name = uistate_rockout
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'rockout'
			pakname = 'rockout'
		}}
	ui_registerstate \{name = uistate_autotest_next_test
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'autotest_next_test'
		}}
	ui_registerstate \{name = uistate_debug_brightness_calibration
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug_brightness_calibration'
			pakname = 'debug_brightness_calibration'
		}}
	ui_registerstate \{name = uistate_debug_gamma_calibration
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug_gamma_calibration'
			pakname = 'debug_gamma_calibration'
		}}
	ui_registerstate \{name = uistate_debug_atvi_color_calibration
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'debug_atvi_color_calibration'
			pakname = 'debug_gamma_calibration'
		}}
	ui_registerstate \{name = uistate_nxgui_preview
		params = {
			base_name = 'nxgui_preview'
			pakname = $ui_preview_pak_name
		}}
endscript

script registeruistates_career 
	ui_registerstate \{name = uistate_play_song
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'play_song'
		}}
	ui_registerstate \{name = uistate_gameplay
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'gameplay'
			alternate_pakname = 'calibrate_lag'
			alternate_decision_script = use_alternate_if_in_calibrate
		}}
	ui_registerstate \{name = uistate_fail_song
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'fail_song'
			pakname = 'fail_song'
		}}
	ui_registerstate \{name = uistate_controller_disconnect
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'controller_disconnect'
		}}
	ui_registerstate \{name = uistate_song_breakdown
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'song_breakdown'
			pakname = 'song_breakdown'
		}}
	ui_registerstate \{name = uistate_quest_map
		params = {
			base_name = 'quest_map'
			pakname = 'career_map'
		}}
	ui_registerstate \{name = uistate_quest_band_select
		params = {
			base_name = 'quest_band_select'
			pakname = 'career_map'
		}}
	ui_registerstate \{name = uistate_quest_band_select_power_details
		params = {
			base_name = 'quest_band_select_power_details'
			pakname = 'career_map'
		}}
	ui_registerstate \{name = uistate_quest_map_giglist
		params = {
			base_name = 'quest_map_giglist'
			pakname = 'career_map'
		}}
	ui_registerstate \{name = uistate_quest_transformation_info
		params = {
			base_name = 'quest_transformation_info'
		}}
	ui_registerstate \{name = uistate_quest_breakdown
		params = {
			base_name = 'quest_breakdown'
		}}
	ui_registerstate \{name = uistate_quest_unlocks
		params = {
			base_name = 'quest_unlocks'
			pakname = 'career_map'
		}}
	ui_registerstate \{name = uistate_rewards_unlocked
		params = {
			base_name = 'rewards_unlocked'
			pakname = 'rewards_unlocked'
		}}
endscript

script registeruistates_pause 
	ui_registerstate \{name = uistate_pausemenu
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu'
		}}
	ui_registerstate \{name = uistate_pause_options
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pause_options'
		}}
	ui_registerstate \{name = uistate_pausemenu_restart_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_restart_warning'
		}}
	ui_registerstate \{name = uistate_pausemenu_change_difficulty
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_change_difficulty'
		}}
	ui_registerstate \{name = uistate_pausemenu_change_difficulty_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_change_difficulty_warning'
		}}
	ui_registerstate \{name = uistate_pausemenu_change_difficulty_confirm
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_change_difficulty_confirm'
		}}
	ui_registerstate \{name = uistate_pausemenu_lefty_flip_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_lefty_flip_warning'
		}}
	ui_registerstate \{name = uistate_pausemenu_highwaytype_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_highwaytype_warning'
		}}
	ui_registerstate \{name = uistate_pausemenu_highwaytype
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_highwaytype'
		}}
	ui_registerstate \{name = uistate_pausemenu_quit_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_quit_warning'
		}}
	ui_registerstate \{name = uistate_pausemenu_song_ended
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'pausemenu_song_ended'
			pakname = 'fail_song'
		}}
	ui_registerstate \{name = uistate_song_unpause
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
		}}
endscript

script registeruistates_outro 
	ui_registerstate \{name = uistate_song_breakdown_competitive
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
		}}
	ui_registerstate \{name = uistate_song_breakdown_shreddfest_match_complete
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'song_breakdown_shreddfest_match_complete'
			pakname = 'song_breakdown_competitive'
		}}
	ui_registerstate \{name = uistate_song_summary_details
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'song_summary_details'
		}}
	ui_registerstate \{name = uistate_game_rules
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'game_rules'
			pakname = 'game_rules'
		}}
endscript

script registeruistates_practice 
	ui_registerstate \{name = uistate_select_training
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'select_training'
			pakname = 'band_lobby'
			anim_in_script = ui_select_training_anim_in
			anim_out_script = ui_select_training_anim_out
		}}
	ui_registerstate \{name = uistate_select_practice_instrument
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'select_practice_instrument'
			pakname = 'practice_menu_popup'
		}}
	ui_registerstate \{name = uistate_select_practice_difficulty
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'select_practice_difficulty'
			pakname = 'practice_menu_popup'
		}}
	ui_registerstate \{name = uistate_select_tutorial
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'select_tutorial'
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_play_tutorial
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
			visualizer_preset = og_tunnelizertoo
		}}
	ui_registerstate \{name = uistate_select_song_section
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'select_song_section'
			pakname = 'practice_menu_popup'
		}}
	ui_registerstate \{name = uistate_practice_select_speed
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'practice_select_speed'
			pakname = 'practice_menu_popup'
		}}
	ui_registerstate \{name = uistate_practice_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'practice_warning'
		}}
	ui_registerstate \{name = uistate_practice_select_looping
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'practice_select_looping'
			pakname = 'practice_menu_popup'
		}}
endscript

script registeruistates_musicstudio 
	ui_registerstate \{name = uistate_musicstudio_ghmix
		params = {
			systems = [
				camera
				band
			]
			base_name = 'musicstudio_ghmix'
			pakname = 'musicstudio_ghmix'
		}}
	ui_registerstate \{name = uistate_musicstudio_ghmix_song
		params = {
			systems = [
				camera
				band
			]
			base_name = 'musicstudio_ghmix_song'
			pakname = 'musicstudio_ghmix'
		}}
	ui_registerstate \{name = uistate_musicstudio_jamroom_wizard
		params = {
			systems = [
				camera
				band
			]
			base_name = 'musicstudio_jamroom_wizard'
			pakname = 'jam'
		}}
endscript

script registeruistates_jam 
	ui_registerstate \{name = uistate_jam
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam'
			pakname = 'jam'
		}}
	ui_registerstate \{name = uistate_jam_select_song
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_select_song'
			pakname = 'jam'
		}}
	ui_registerstate \{name = uistate_jam_band
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_band'
			pakname = 'musicstudio_jamroom'
		}}
	ui_registerstate \{name = uistate_recording_disconnect
		params = {
			systems = [
				camera
				band
			]
			base_name = 'recording_disconnect'
		}}
	ui_registerstate \{name = uistate_jam_publish_song
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_song'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_publish_genre
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_genre'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_publish_track_select
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_track_select'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_publish_slot
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_slot'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_download_slot
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_download_slot'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_publish_text_entry
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_text_entry'
			pakname = 'jam_ghtunes'
			focus_id = text_entry_vmenu
		}}
	ui_registerstate \{name = uistate_jam_publish_update_fileid
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_update_fileid'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_publish_signin
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_publish_signin'
			pakname = 'jam'
		}}
	ui_registerstate \{name = uistate_jam_ghtunes
		params = {
			systems = [
				camera
				band
			]
			base_name = 'jam_ghtunes'
			pakname = 'jam_ghtunes'
		}}
	ui_registerstate \{name = uistate_jam_ratesong
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'jam_ratesong'
			pakname = 'musicstudio_rate_song'
		}}
endscript

script registeruistates_select_rocker 
	ui_registerstate \{name = uistate_character_selection
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'character_selection'
			pakname = 'band_lobby'
		}}
	ui_registerstate \{name = uistate_customize_character
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
		}}
	ui_registerstate \{name = uistate_customize_character_enter
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
			alternate_pakname = 'band_lobby'
			alternate_decision_script = use_alternate_if_from_lobby
		}}
	ui_registerstate \{name = uistate_customize_character_head
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
		}}
	ui_registerstate \{name = uistate_customize_character_body
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
		}}
	ui_registerstate \{name = uistate_customize_character_proportions
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
		}}
	ui_registerstate \{name = uistate_customize_character_body_art
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
		}}
	ui_registerstate \{name = uistate_customize_character_makeup
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'customize_character_makeup'
			hist_tex = icon_face
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_character_face_deformation
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
		}}
	ui_registerstate \{name = uistate_character_face_deformation_options
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'character_face_deformation_options'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_cas_color_edit
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cas_color_edit'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_save_changes_dialogue
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
		}}
	ui_registerstate \{name = uistate_cas_discard_changes
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
		}}
	ui_registerstate \{name = uistate_customize_character_mic
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
		}}
	ui_registerstate \{name = uistate_customize_character_mic_main
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
		}}
	ui_registerstate \{name = uistate_cas_select_part_options
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cas_select_part_options'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_popout_select_part
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
		}}
	ui_registerstate \{name = uistate_popout_select_preset
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'popout_select_preset'
			focus_id = current_list_menu
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_cas_select_part_color_options
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cas_select_part_color_options'
		}}
	ui_registerstate \{name = uistate_cas_select_part_swatches
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cas_select_part_swatches'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_end_credits
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'end_credits'
		}}
endscript

script registeruistates_cap 
	ui_registerstate \{name = uistate_cap_main
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cap_main'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_cap_layers_list
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
		}}
	ui_registerstate \{name = uistate_cap_shape_list
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
		}}
	ui_registerstate \{name = uistate_cap_shape_list_subset
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
		}}
	ui_registerstate \{name = uistate_cap_color_wheel
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
		}}
	ui_registerstate \{name = uistate_cap_shape_edit
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
		}}
	ui_registerstate \{name = uistate_cap_artist_layer
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cap_artist_layer'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_cap_layers_options
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
		}}
	ui_registerstate \{name = uistate_cap_artist_layer_options
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
		}}
	ui_registerstate \{name = uistate_cap_artist_layer_popout
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
		}}
	ui_registerstate \{name = uistate_cas_save_slots
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cas_save_slots'
			pakname = 'cas_ui'
		}}
endscript

script registeruistates_outfit 
	ui_registerstate \{name = uistate_customize_character_outfit
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
		}}
	ui_registerstate \{name = uistate_customize_character_outfit_accessories
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
		}}
endscript

script registeruistates_cag 
	ui_registerstate \{name = uistate_customize_character_instrument
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
		}}
	ui_registerstate \{name = uistate_customize_character_instrument_change
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
		}}
	ui_registerstate \{name = uistate_cag_main
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cag_main'
			pakname = 'cas_ui'
		}}
	ui_registerstate \{name = uistate_cag_custom
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
		}}
	ui_registerstate \{name = uistate_cag_custom_body
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
		}}
	ui_registerstate \{name = uistate_cag_custom_body_types
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
		}}
	ui_registerstate \{name = uistate_cag_select_part_inclusion
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
		}}
	ui_registerstate \{name = uistate_cag_custom_hardware
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
		}}
	ui_registerstate \{name = uistate_cag_custom_head
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
		}}
	ui_registerstate \{name = uistate_cag_custom_strings
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
		}}
	ui_registerstate \{name = uistate_cag_custom_highway
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'cag_custom_highway'
		}}
endscript

script registeruistates_online 
	ui_registerstate \{name = uistate_online
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'online'
			pakname = 'online_lobby'
		}}
	ui_registerstate \{name = uistate_net_custom_search
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_custom_search'
		}}
	ui_registerstate \{name = uistate_net_serverlist
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_serverlist'
		}}
	ui_registerstate \{name = uistate_net_joining
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_joining'
		}}
	ui_registerstate \{name = uistate_net_debug_lobby
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_debug_lobby'
		}}
	ui_registerstate \{name = uistate_net_debug_lobby_join
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_debug_lobby_join'
		}}
	ui_registerstate \{name = uistate_net_signin_popup
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_signin_popup'
			focus_id = net_signin_popup
		}}
	ui_registerstate \{name = uistate_net_career_join_popup
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_career_join_popup'
			focus_id = career_join_popup
		}}
	ui_registerstate \{name = uistate_leaderboard
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
		}}
	ui_registerstate \{name = uistate_leaderboard_instrument
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'leaderboard_instrument'
			pakname = 'leaderboard_list'
			anim_in_script = ui_leaderboard_inst_menu_anim_in
			anim_out_script = ui_leaderboard_inst_menu_anim_out
		}}
	ui_registerstate \{name = uistate_leaderboard_difficulty
		params = {
			systems = [
				venue
				crowd
				camera
				band
				stageshow
			]
			base_name = 'leaderboard_difficulty'
		}}
	ui_registerstate \{name = uistate_net_zero_search_results_popup
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'net_zero_search_results_popup'
			focus_id = net_zero_popup
		}}
	ui_registerstate \{name = uistate_friends_list
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'friends_list'
			focus_id = friends_list_popup
		}}
	ui_registerstate \{name = uistate_online_quit_warning
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'online_quit_warning'
			focus_id = online_quit_menu
		}}
	ui_registerstate \{name = uistate_rock_record
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'rock_record'
			focus_id = rock_record_menu
		}}
endscript

script registeruistates_cadrm 
	ui_registerstate \{name = uistate_cadrm_main
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
		}}
	ui_registerstate \{name = uistate_cadrm_hub
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
		}}
endscript

script registeruistates_music_store 
	ui_registerstate \{name = uistate_music_store_hub
		params = {
			base_name = 'music_store_hub'
			focus_id = music_store_hub_vmenu
		}}
	ui_registerstate \{name = uistate_music_store_terms
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'music_store_terms'
			focus_id = music_store_terms
		}}
	ui_registerstate \{name = uistate_music_store_scan_marketplace
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'music_store_scan_marketplace'
		}}
endscript

script registeruistates_savegame 
	ui_registerstate \{name = uistate_savegame_boot_scan
		params = {
			base_name = 'savegame_boot_scan'
		}}
	ui_registerstate \{name = uistate_trophy_warning
		params = {
			base_name = 'trophy_warning'
		}}
endscript

script registeruistates_import 
	ui_registerstate \{name = uistate_import_keycode
		params = {
			base_name = 'import_keycode'
			focus_id = dialog_box_vmenu
		}}
	ui_registerstate \{name = uistate_import_edit_name
		params = {
			base_name = 'import_edit_name'
			focus_id = edit_name_menu
		}}
	ui_registerstate \{name = uistate_import_pre_legal
		params = {
			base_name = 'import_pre_legal'
			focus_id = import_legal_dialog_box
		}}
	ui_registerstate \{name = uistate_import_post_legal
		params = {
			base_name = 'import_post_legal'
			focus_id = import_legal_dialog_box
		}}
endscript

script registeruistates_temp 
	ui_registerstate \{name = uistate_nxgui_sandbox
		params = {
			base_name = 'NxGUI_Sandbox'
			pakname = 'NxGUI_Sandbox'
		}}
	ui_registerstate \{name = uistate_ui_sfx_test
		params = {
			base_name = 'ui_sfx_test'
			pakname = 'ui_sfx_test'
		}}
endscript

script registeruistates_stackobjecttest 
	ui_registerstate \{name = uistate_test_ui_state_a
		params = {
			base_name = 'test_ui_state_A'
			obj_desc = compositeobject_debuguistackobject
			init_variable = a
		}}
	ui_registerstate \{name = uistate_test_ui_state_b
		params = {
			base_name = 'test_ui_state_B'
			obj_desc = compositeobject_debuguistackobject
			init_variable = b
		}}
	ui_registerstate \{name = uistate_example_ui_stack_object
		params = {
			base_name = 'example_ui_stack_object'
			obj_desc = compositeobject_exampleuistackobject
			a = 7
			b = 0
		}}
endscript

script registeruistates_songlist 
	ui_registerstate \{name = uistate_songlist
		params = {
			base_name = 'songlist'
			pakname = 'songlist'
			obj_desc = compositeobject_songlistuistackobject
			obj_id = songlist_component
			no_auto_focus = 1
		}}
	ui_registerstate \{name = uistate_songlist_options
		params = {
			base_name = 'songlist_options'
			focus_id = songlist_options_vmenu
		}}
endscript

script registeruistates_hallofrecords 
	ui_registerstate \{name = uistate_hall_of_records
		params = {
			systems = [
				venue
				crowd
				camera
				band
			]
			base_name = 'hall_of_records'
			pakname = 'band_lobby'
			anim_in_script = ui_hall_anim_in
			anim_out_script = ui_hall_anim_out
		}}
	ui_registerstate \{name = uistate_art_gallery_menu
		params = {
			base_name = 'art_gallery_menu'
			pakname = 'art_gallery'
			anim_in_script = ui_art_anim_in
		}}
	ui_registerstate \{name = uistate_art_gallery
		params = {
			base_name = 'art_gallery'
			anim_in_script = ui_art_anim_in
		}}
	ui_registerstate \{name = uistate_unlock_tracker
		params = {
			base_name = 'unlock_tracker'
			pakname = 'career_map'
		}}
endscript
