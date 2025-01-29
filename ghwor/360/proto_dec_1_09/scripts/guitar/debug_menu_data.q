menu_pos = (675.0, 100.0)
debug_from_gameplay = 0
debug_items_per_page = 11
framerate_warning = 57.5
debug_enable_bink_in_game = 0
debug_show_measures = 0
debug_show_song_time = 0
debug_show_camera_name = 0
debug_show_song_name = 0
debug_show_song_stars = 0
debug_song_volume_info = 0
debug_use_screen_noise = 1
debug_use_motion_blur = 1
debug_use_ad_overlay = 0
0x11b17fcd = 0
debug_band_member1_visible = 1
debug_band_member2_visible = 1
debug_band_member3_visible = 1
debug_band_member4_visible = 1
debug_band_visible = 1
debug_crowd_visible = 1
debug_stage_visible = 1
debug_scene_ped_visible = 1
g_debug_highway_visible = 1
g_debug_band_moment_starpower = 0
g_debug_performance_mode = 0
debug_forcescore = OFF
debug_forcescore_dir = up
debug_selected_intro = 0
debug_play_celeb_intro = 0
debug_micstand_visible = 1
debug_cameracut_group_iterator = 0
debug_cameracut_iterator = -1
debug_cameracut_mode_on = 0
debug_sa_level_list = [
	0
	1
	2
]
debug_sp_mult_1 = 0
debug_sp_mult_2 = 0
debug_sp_mult_3 = 0
debug_sp_mult_4 = 0
debug_mult_max_1 = 0
debug_mult_max_2 = 0
debug_mult_max_3 = 0
debug_mult_max_4 = 0
debug_mult_enhance_1 = 0
debug_mult_enhance_2 = 0
debug_mult_enhance_3 = 0
debug_mult_enhance_4 = 0
debug_star_power_gain_multiplier_1 = 0
debug_star_power_gain_multiplier_2 = 0
debug_star_power_gain_multiplier_3 = 0
debug_star_power_gain_multiplier_4 = 0
debug_sp_note_streak_1 = 0
debug_sp_note_streak_2 = 0
debug_sp_note_streak_3 = 0
debug_sp_note_streak_4 = 0
debug_crowd_meter_start_bonus_1 = 0
debug_crowd_meter_start_bonus_2 = 0
debug_crowd_meter_start_bonus_3 = 0
debug_crowd_meter_start_bonus_4 = 0
debug_miss_note_bonus_1 = 0
debug_miss_note_bonus_2 = 0
debug_miss_note_bonus_3 = 0
debug_miss_note_bonus_4 = 0
debug_resurrection_lives_1 = 0
debug_resurrection_lives_2 = 0
debug_resurrection_lives_3 = 0
debug_resurrection_lives_4 = 0
debug_musician1 = guitar
debug_musician2 = bass
debug_musician3 = drum
debug_musician4 = vocals
forcescore_list = [
	OFF
	poor
	medium
	good
]
debug_camera_array = None
debug_camera_array_pakname = None
debug_camera_array_count = 0
part_list = [
	guitar
	drum
	bass
	vocals
]
g_virtual_controller = -1
g_virtual_controller_enabled = -1
g_virtual_controller_type = None
g_virtual_controller_source_device = -1
g_virtual_controller_data = [
	{
		Type = controller
		Enabled = 0
		source_device = -1
	}
	{
		Type = controller
		Enabled = 0
		source_device = -1
	}
	{
		Type = controller
		Enabled = 0
		source_device = -1
	}
	{
		Type = controller
		Enabled = 0
		source_device = -1
	}
]
part_list_props = {
	guitar = {
		index = 0
		text_nl = 'guitar'
		text = qs(0x11355666)
		text_upper = qs(0x9504b94a)
	}
	drum = {
		index = 1
		text_nl = 'drum'
		text = qs(0xfd52050f)
		text_upper = qs(0xcf488ba5)
	}
	bass = {
		index = 2
		text_nl = 'bass'
		text = qs(0x4f551cbe)
		text_upper = qs(0x7d4f9214)
	}
	vocals = {
		index = 3
		text_nl = 'vocals'
		text = qs(0x9fae80a8)
		text_upper = qs(0x1b9f6f84)
	}
	Band = {
		index = 3
		text_nl = 'band'
		text = qs(0xe8a5176a)
		text_upper = qs(0xdabf99c0)
	}
}
CameraCutPrefixArray = [
	'cameras'
	'cameras_guitarist'
	'cameras_singer'
	'cameras_drummer'
	'cameras_bassist'
	'cameras_headtohead'
	'cameras_single'
	'cameras_solo'
	'cameras_guitar_closeup'
	'cameras_closeup'
	'cameras_closeups'
	'cameras_orbits'
	'cameras_pan'
	'cameras_dolly'
	'cameras_zoom_slow'
	'cameras_zoom_fast'
	'cameras_zoom_out'
	'cameras_zoom'
	'cameras_spotlight'
	'cameras_audience'
	'cameras_vert_drummer'
	'cameras_vert_guitarist'
	'cameras_vert_stagerear'
	'cameras_vert_stagefront'
	'cameras_intro'
	'cameras_fastintro'
	'cameras_encore'
	'cameras_walk'
	'cameras_starpower'
	'cameras_special'
	'cameras_stagedive'
	'cameras_win'
	'cameras_lose'
	'cameras_Verts_front'
	'cameras_Verts_rear'
	'cameras_G_across_stage'
	'cameras_S_across_stage'
	'cameras_debug_face'
	'cameras_debug_drum'
	'cameras_preencore'
	'cameras_2p'
	'cameras_player_closeup_2p'
	'cameras_solo_2p'
	'cameras_guitar_closeup_2p'
	'cameras_drummer_2p'
	'cameras_singer_2p'
	'cameras_singer_closeup_2p'
	'cameras_bassist_2p'
	'cameras_orbit_2p'
	'cameras_pan_2p'
	'cameras_intro_2p'
	'cameras_fastintro_2p'
	'cameras_starpower_2p'
	'cameras_win_2p'
	'cameras_lose_2p'
	'cameras_debug_lightshow'
]
debug_submenus = [
	{
		id = 'main'
		title = qs(0x49a0d144)
		back_script = debug_menu_back_to_retail_menu
		items = [
			{
				text = qs(0x350e7e6b)
				Type = new_menu
				menu_id = 'new_modes'
			}
			{
				text = qs(0xc98853b2)
				Type = new_menu
				menu_id = 'in_game'
			}
			{
				text = qs(0x37767de1)
				Type = new_menu
				menu_id = 'hud_ui'
			}
			{
				text = qs(0xdb4779a7)
				Type = new_menu
				menu_id = 'band_setup'
			}
			{
				text = qs(0x23a76ddd)
				Type = new_menu
				menu_id = 'tools'
			}
			{
				text = qs(0x3b308bff)
				Type = new_menu
				menu_id = 'notetracking'
			}
			{
				text = qs(0x00b7a760)
				Type = new_menu
				menu_id = 'screenshot_utilities'
			}
			{
				text = qs(0x265776e4)
				Type = run_script
				choose_script = debug_menu_unlockall
			}
		]
	}
	{
		id = 'virtual_controllers'
		title = qs(0xa2bf692c)
		items = [
			{
				text = qs(0x19e3c7ba)
				Type = new_menu
				menu_id = 'virtual_controller'
				additional_choose_script = debug_menu_virtual_controller_choose
				additional_choose_params = {
					virtual_controller = 0
				}
			}
			{
				text = qs(0x32ce9479)
				Type = new_menu
				menu_id = 'virtual_controller'
				additional_choose_script = debug_menu_virtual_controller_choose
				additional_choose_params = {
					virtual_controller = 1
				}
			}
			{
				text = qs(0x2bd5a538)
				Type = new_menu
				menu_id = 'virtual_controller'
				additional_choose_script = debug_menu_virtual_controller_choose
				additional_choose_params = {
					virtual_controller = 2
				}
			}
			{
				text = qs(0x649433ff)
				Type = new_menu
				menu_id = 'virtual_controller'
				additional_choose_script = debug_menu_virtual_controller_choose
				additional_choose_params = {
					virtual_controller = 3
				}
			}
		]
	}
	{
		id = 'virtual_controller'
		title = qs(0x18e3af0a)
		items = [
			{
				text = qs(0x43a2c843)
				Type = toggle
				Global = g_virtual_controller_enabled
			}
			{
				text = qs(0xb7295778)
				Type = option
				text_script = debug_menu_virtual_controller_type_text_script
				value_script = debug_menu_virtual_controller_type_get_value
				left_script = debug_menu_virtual_controller_type_left
				right_script = debug_menu_virtual_controller_type_right
			}
			{
				text = qs(0xc9004222)
				Type = option
				text_script = debug_menu_virtual_controller_source_text_script
				value_script = debug_menu_virtual_controller_source_get_value
				left_script = debug_menu_virtual_controller_source_left
				right_script = debug_menu_virtual_controller_source_right
			}
			{
				text = qs(0x2a4840c8)
				Type = run_script
				choose_script = debug_menu_virtual_controller_accept_settings
			}
		]
	}
	{
		id = 'new_modes'
		title = qs(0x350e7e6b)
		items = [
			{
				text = qs(0xb964f337)
				Type = toggle
				Global = debug_enable_bink_in_game
			}
			{
				text = qs(0xf0cf4b78)
				Type = toggle
				Global = single_stream_enabled
				on_script = 0x70e68339
				off_script = 0x92cbe9bf
			}
			{
				text = qs(0xfea03695)
				Type = new_menu
				menu_id = 'minigame_prototypes'
			}
		]
	}
	{
		id = 'in_game'
		title = qs(0xc98853b2)
		items = [
			{
				text = qs(0xe1a28c5f)
				Type = toggle
				Global = allow_controller_for_all_instruments
			}
			{
				text = qs(0x092c9f43)
				Type = option
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				left_script = debug_menu_play_song_option_left
				right_script = debug_menu_play_song_option_right
				option_select = {
					Type = new_menu
					menu_id = 'num_players'
				}
			}
			{
				text = qs(0x414faedc)
				Type = new_menu
				menu_id = 'skip_into_song'
			}
			{
				text = qs(0x0606bdb8)
				Type = new_menu
				menu_id = 'change_venue'
			}
			{
				text = qs(0x474a49b8)
				Type = new_menu
				menu_id = 'camera_cut_group'
			}
			{
				text = qs(0xa596cd4e)
				Type = toggle
				Global = g_debug_audible_hitnote
			}
			{
				text = qs(0x8ebb9e8d)
				Type = toggle
				Global = show_play_log
			}
			{
				text = qs(0x97a0afcc)
				Type = toggle
				Global = g_debug_audible_open
			}
			{
				text = qs(0x3cf0ba39)
				Type = option
				value_script = debug_menu_input_logic_lag_get_value
				text_script = debug_menu_input_logic_lag_get_text
				left_script = debug_menu_input_logic_lag_option_left
				right_script = debug_menu_input_logic_lag_option_right
			}
			{
				text = qs(0x46448fa5)
				Type = option
				value_script = debug_menu_gem_logic_lag_get_value
				text_script = debug_menu_gem_logic_lag_get_text
				left_script = debug_menu_gem_logic_lag_option_left
				right_script = debug_menu_gem_logic_lag_option_right
			}
			{
				text = qs(0x61a35ccc)
				Type = option
				value_script = debug_menu_audio_logic_lag_get_value
				text_script = debug_menu_audio_logic_lag_get_text
				left_script = debug_menu_audio_logic_lag_option_left
				right_script = debug_menu_audio_logic_lag_option_right
			}
			{
				text = qs(0xd7f64bb0)
				Type = option
				value_script = debug_menu_force_score_get_value
				text_script = debug_menu_force_score_get_text
				left_script = debug_menu_force_score_option_left
				right_script = debug_menu_force_score_option_right
			}
			{
				text = qs(0x94d2ee82)
				Type = toggle
				Global = vocal_enable_freeform_always
			}
			{
				text = qs(0xbeef52ab)
				Type = run_script
				choose_script = debug_menu_select_start_song
			}
			{
				text = qs(0x04a9d108)
				Type = run_script
				choose_script = debug_menu_select_start_song
				choose_params = {
					force_long_intro = 1
				}
			}
			{
				text = qs(0x4fc818b5)
				Type = run_script
				choose_script = debug_menu_select_start_song
				choose_params = {
					force_encore = 1
				}
			}
			{
				text = qs(0x7589d686)
				Type = option
				value_script = debug_menu_play_celeb_intro_get_value
				text_script = debug_menu_play_celeb_intro_get_text
				left_script = debug_menu_play_celeb_intro_option_left
				right_script = debug_menu_play_celeb_intro_option_right
				option_select = {
					Type = run_script
					choose_script = debug_start_song_with_celeb_intro
				}
			}
			{
				text = qs(0xd37611a5)
				Type = new_menu
				menu_id = 'character_viewer'
			}
			{
				text = qs(0x2755bf0f)
				Type = toggle
				Global = 0x9260476c
				on_script = debug_menu_turn_on_whammy_rewind
				off_script = debug_menu_turn_off_whammy_rewind
			}
			{
				text = qs(0xa94b8c04)
				Type = toggle
				Global = debug_micstand_visible
				condition_script = debug_menu_is_micstand_visible
				on_script = debug_menu_turn_micstand_on
				off_script = debug_menu_turn_micstand_off
			}
			{
				text = qs(0xd8147791)
				Type = run_script
				choose_script = quickplay_complete_all_current_challenges
			}
			{
				text = qs(0xd6f8292c)
				Type = toggle
				Global = is_ampzilla_battle
			}
		]
	}
	{
		id = 'num_players'
		title = qs(0x47ce8d95)
		items = [
			{
				text = qs(0x147fa9f1)
				Type = new_menu
				menu_id = 'play_song'
				additional_choose_script = debug_menu_num_players_choose
				additional_choose_params = {
					num_players = 1
				}
			}
			{
				text = qs(0x4c392898)
				Type = new_menu
				menu_id = 'play_song'
				additional_choose_script = debug_menu_num_players_choose
				additional_choose_params = {
					num_players = 2
				}
			}
			{
				text = qs(0xa36b9e79)
				Type = new_menu
				menu_id = 'play_song'
				additional_choose_script = debug_menu_num_players_choose
				additional_choose_params = {
					num_players = 3
				}
			}
			{
				text = qs(0x4245941d)
				Type = new_menu
				menu_id = 'play_song'
				additional_choose_script = debug_menu_num_players_choose
				additional_choose_params = {
					num_players = 4
				}
			}
		]
	}
	{
		id = 'play_song'
		title = qs(0x9ca61b7d)
		items = [
			{
				multiitem
				build_script = debug_menu_build_song_source_menu
				name_script = debug_menu_play_song_source_name_builder
				Type = new_menu
				menu_id = 'play_song_2'
				menu_params = debug_menu_play_song_params_builder
			}
		]
	}
	{
		id = 'play_song_2'
		title = qs(0x81eb0aa1)
		paged
		items = [
			{
				multiitem
				build_script = debug_menu_build_play_song_menu
				name_script = debug_menu_play_song_menu_name_builder
				Type = new_menu
				menu_id = 'song_part'
				menu_params = debug_menu_song_part_menu_params_builder
			}
		]
	}
	{
		id = 'song_part'
		title = qs(0xb67ab3e1)
		items = [
			{
				multiitem
				build_script = debug_menu_build_song_part_menu_items
				name_script = debug_menu_song_part_menu_name_builder
				value_script = debug_menu_song_part_menu_value_builder
				text_script = debug_menu_song_part_menu_text_builder
				Type = option
				left_script = debug_menu_song_part_type_option_left
				right_script = debug_menu_song_part_type_option_right
			}
			{
				text = qs(0x503fc138)
				Type = new_menu
				menu_id = 'choose_difficulty'
				additional_choose_script = persistent_band_create_band
				additional_choose_params = {
					refresh = 1
				}
			}
		]
	}
	{
		id = 'choose_difficulty'
		title = qs(0xcdf1d3a0)
		items = [
			{
				multiitem
				build_script = debug_menu_build_song_difficulty_menu_items
				name_script = debug_menu_song_difficulty_menu_name_builder
				value_script = debug_menu_song_difficulty_menu_value_builder
				text_script = debug_menu_song_difficulty_menu_text_builder
				Type = option
				left_script = debug_menu_song_difficulty_type_option_left
				right_script = debug_menu_song_difficulty_type_option_right
			}
			{
				text = qs(0x3ba5946a)
				Type = new_menu
				menu_id = 'choose_bot'
			}
		]
	}
	{
		id = 'choose_bot'
		title = qs(0xfd06ec87)
		items = [
			{
				multiitem
				build_script = debug_menu_build_bot_setup_menu_items
				name_script = debug_menu_bot_setup_menu_name_builder
				condition_script = debug_menu_bot_setup_check
				Type = toggle
				on_script = debug_menu_turn_on_bot
				off_script = debug_menu_turn_off_bot
			}
			{
				text = qs(0x0e0e6799)
				Type = run_script
				choose_script = debug_menu_select_start_song
			}
		]
	}
	{
		id = 'skip_into_song'
		title = qs(0x414faedc)
		items = [
			{
				text = qs(0x0a24a218)
				Type = new_menu
				menu_id = 'skip_by_time'
			}
			{
				text = qs(0x526a37ed)
				Type = new_menu
				menu_id = 'skip_by_marker'
			}
			{
				text = qs(0x28f0ccb7)
				Type = new_menu
				menu_id = 'skip_by_measure'
			}
			{
				text = qs(0x4d6ca7f3)
				Type = new_menu
				menu_id = 'skip_by_phrase'
			}
			{
				text = qs(0xc4e211c1)
				Type = new_menu
				menu_id = 'loop_point'
			}
		]
	}
	{
		id = 'skip_by_time'
		title = qs(0x0a24a218)
		items = [
			{
				multiitem
				build_script = debug_menu_build_skip_by_time_menu
				name_script = debug_menu_skip_by_time_menu_name_builder
				Type = run_script
				choose_script = debug_menu_skip_by_time_menu_choose_script_builder
			}
		]
	}
	{
		id = 'skip_by_marker'
		title = qs(0x526a37ed)
		items = [
			{
				multiitem
				build_script = debug_menu_build_skip_by_marker_menu
				name_script = debug_menu_skip_by_marker_menu_name_builder
				Type = run_script
				choose_script = debug_menu_skip_by_marker_menu_choose_script_builder
			}
		]
	}
	{
		id = 'skip_by_measure'
		title = qs(0x28f0ccb7)
		items = [
			{
				multiitem
				build_script = debug_menu_build_skip_by_measure_menu
				name_script = debug_menu_skip_by_measure_menu_name_builder
				Type = run_script
				choose_script = debug_menu_skip_by_measure_menu_choose_script_builder
			}
		]
	}
	{
		id = 'skip_by_phrase'
		title = qs(0x4d6ca7f3)
		items = [
			{
				multiitem
				build_script = debug_menu_build_skip_by_vocal_phrase_menu
				name_script = debug_menu_skip_by_vocal_phrase_menu_name_builder
				Type = run_script
				choose_script = debug_menu_skip_by_vocal_phrase_menu_choose_script_builder
			}
		]
	}
	{
		id = 'loop_point'
		title = qs(0xc4e211c1)
		items = [
			{
				text = qs(0x4ed8d839)
				Type = new_menu
				menu_id = 'skip_by_time'
				menu_params = {
					looppoint = 1
				}
			}
			{
				text = qs(0xda3a3908)
				Type = new_menu
				menu_id = 'skip_by_marker'
				menu_params = {
					looppoint = 1
				}
			}
			{
				text = qs(0xec416e49)
				Type = new_menu
				menu_id = 'skip_by_measure'
				menu_params = {
					looppoint = 1
				}
			}
		]
	}
	{
		id = 'change_venue'
		title = qs(0xc2ba3227)
		items = [
			{
				multiitem
				build_script = debug_menu_build_change_venue_menu
				name_script = debug_menu_change_venue_menu_name_builder
				Type = run_script
				choose_script = debug_menu_change_venue_menu_choose_script_builder
			}
		]
	}
	{
		id = 'camera_cut_group'
		title = qs(0xecd234cc)
		items = [
			{
				text = qs(0x128bfaaa)
				Type = run_script
				choose_script = debug_select_cameracut
				choose_params = {
					Camera_Array_pakname = None
					Camera_Array = None
					index = None
				}
			}
			{
				multiitem
				build_script = debug_menu_build_camera_cut_group_menu
				name_script = debug_menu_camera_cut_group_menu_name_builder
				Type = new_menu
				menu_id = 'camera_cut'
				menu_params = debug_menu_camera_cut_group_menu_params_builder
			}
		]
	}
	{
		id = 'camera_cut'
		title = qs(0x474a49b8)
		items = [
			{
				multiitem
				build_script = debug_menu_build_camera_cut_menu
				name_script = debug_menu_camera_cut_menu_name_builder
				Type = run_script
				choose_script = debug_menu_camera_cut_menu_choose_script_builder
				square_script = debug_menu_camera_cut_menu_square_script_builder
			}
		]
		nobg = 1
	}
	{
		id = 'character_viewer'
		title = qs(0xdb335bb2)
		items = [
			{
				text = qs(0x3eaa1c82)
				Type = new_menu
				menu_id = 'change_musician'
				menu_params = {
					part = guitar
				}
			}
			{
				text = qs(0x8745f1a9)
				Type = new_menu
				menu_id = 'change_musician'
				menu_params = {
					part = bass
				}
			}
			{
				text = qs(0x5f98720d)
				Type = new_menu
				menu_id = 'change_musician'
				menu_params = {
					part = vocals
				}
			}
			{
				text = qs(0xd8973b9e)
				Type = new_menu
				menu_id = 'change_musician'
				menu_params = {
					part = drum
				}
			}
		]
	}
	{
		id = 'change_musician'
		title = qs(0xb8dc0d7b)
		items = [
			{
				multiitem
				build_script = debug_menu_build_change_musician_menu
				name_script = debug_menu_change_musician_menu_name_builder
				Type = new_menu
				menu_id = 'select_outfit'
				menu_params = debug_menu_change_musician_menu_params_builder
			}
		]
	}
	{
		id = 'select_outfit'
		title = qs(0x554c4b91)
		items = [
			{
				multiitem
				build_script = 0x517a6414
				name_script = 0xa72a357b
				Type = run_script
				choose_script = 0x5be63cba
			}
		]
	}
	{
		id = 'hud_ui'
		title = qs(0x37767de1)
		items = [
			{
				text = qs(0x6bb068f0)
				Type = new_menu
				menu_id = 'visibility'
			}
			{
				text = qs(0x680492d0)
				Type = toggle
				Global = debug_show_measures
				on_script = debug_menu_turn_on_show_measures
				off_script = debug_menu_turn_off_show_measures
			}
			{
				text = qs(0xdae59d1c)
				Type = toggle
				Global = debug_show_song_stars
				on_script = debug_menu_turn_on_show_song_stars
				off_script = debug_menu_turn_off_show_song_stars
			}
			{
				text = qs(0xba249053)
				Type = toggle
				Global = debug_show_song_time
				on_script = debug_menu_turn_on_show_song_time
				off_script = debug_menu_turn_off_show_song_time
			}
			{
				text = qs(0xbb0c3fdd)
				Type = toggle
				Global = debug_show_song_name
				on_script = debug_menu_turn_on_show_song_name
				off_script = debug_menu_turn_off_show_song_name
			}
			{
				text = qs(0x3630af7e)
				Type = toggle
				Global = debug_show_camera_name
				on_script = debug_menu_turn_on_show_camera_name
				off_script = debug_menu_turn_off_show_camera_name
			}
			{
				text = qs(0x32db050e)
				Type = toggle
				Global = show_play_log
				on_script = debug_menu_turn_on_show_input_log
				off_script = debug_menu_turn_off_show_input_log
			}
			{
				text = qs(0xe280d18b)
				Type = toggle
				Global = debug_song_volume_info
				on_script = debug_menu_turn_on_view_volumes
				off_script = debug_menu_turn_off_view_volumes
			}
			{
				text = qs(0x1ea1707a)
				Type = toggle
				Global = debug_use_screen_noise
				on_script = debug_menu_turn_on_screen_noise
				off_script = debug_menu_turn_off_screen_noise
			}
			{
				text = qs(0x9005eafe)
				Type = toggle
				Global = debug_use_motion_blur
				on_script = debug_menu_turn_on_motion_blur
				off_script = debug_menu_turn_off_motion_blur
			}
			{
				text = qs(0x601b6008)
				Type = toggle
				Global = debug_use_ad_overlay
				on_script = debug_menu_turn_on_ad_overlay
				off_script = debug_menu_turn_off_ad_overlay
			}
			{
				text = qs(0x14ac31e1)
				Type = toggle
				Global = 0x11b17fcd
				on_script = 0xb1e5020f
				off_script = 0x91c4880c
			}
			{
				text = qs(0x78e0256e)
				Type = toggle
				Global = g_debug_overlay_on
				on_script = toggle_debug_overlay
				off_script = toggle_debug_overlay
			}
		]
	}
	{
		id = 'visibility'
		title = qs(0x505a7697)
		items = [
			{
				text = qs(0x4ba5fecf)
				Type = toggle
				Global = debug_band_visible
				on_script = debug_menu_turn_on_band_visibility
				off_script = debug_menu_turn_off_band_visibility
			}
			{
				text = qs(0x7139a78c)
				Type = toggle
				Global = debug_band_member1_visible
				on_script = debug_menu_turn_on_band_member_visibility
				on_params = {
					Obj = musician1
				}
				off_script = debug_menu_turn_off_band_member_visibility
				off_params = {
					Obj = musician1
				}
			}
			{
				text = qs(0x5a14f44f)
				Type = toggle
				Global = debug_band_member2_visible
				on_script = debug_menu_turn_on_band_member_visibility
				on_params = {
					Obj = musician2
				}
				off_script = debug_menu_turn_off_band_member_visibility
				off_params = {
					Obj = musician2
				}
			}
			{
				text = qs(0x430fc50e)
				Type = toggle
				Global = debug_band_member3_visible
				on_script = debug_menu_turn_on_band_member_visibility
				on_params = {
					Obj = musician3
				}
				off_script = debug_menu_turn_off_band_member_visibility
				off_params = {
					Obj = musician3
				}
			}
			{
				text = qs(0x0c4e53c9)
				Type = toggle
				Global = debug_band_member4_visible
				on_script = debug_menu_turn_on_band_member_visibility
				on_params = {
					Obj = musician4
				}
				off_script = debug_menu_turn_off_band_member_visibility
				off_params = {
					Obj = musician4
				}
			}
			{
				text = qs(0x83f087be)
				Type = toggle
				condition_script = debug_menu_visibility_check
				condition_params = {
					Type = 'crowd'
				}
				on_script = debug_menu_turn_on_visibility
				on_params = {
					Type = 'crowd'
				}
				off_script = debug_menu_turn_off_visibility
				off_params = {
					Type = 'crowd'
				}
			}
			{
				text = qs(0x1139087f)
				Type = toggle
				condition_script = debug_menu_visibility_check
				condition_params = {
					Type = 'stage'
				}
				on_script = debug_menu_turn_on_visibility
				on_params = {
					Type = 'stage'
				}
				off_script = debug_menu_turn_off_visibility
				off_params = {
					Type = 'stage'
				}
			}
			{
				text = qs(0x5f20955e)
				Type = toggle
				condition_script = debug_menu_visibility_check
				condition_params = {
					Type = 'scene_ped'
				}
				on_script = debug_menu_turn_on_visibility
				on_params = {
					Type = 'scene_ped'
				}
				off_script = debug_menu_turn_off_visibility
				off_params = {
					Type = 'scene_ped'
				}
			}
			{
				text = qs(0xf1192c92)
				Type = toggle
				Global = g_debug_highway_visible
				on_script = debug_menu_turn_on_highway_visibility
				off_script = debug_menu_turn_off_highway_visibility
			}
		]
	}
	{
		id = 'band_setup'
		title = qs(0xdb4779a7)
		items = [
			{
				text = qs(0xce37488d)
				Type = run_script
				choose_script = debug_add_worst_case_cas_chars
			}
			{
				multiitem
				build_script = debug_menu_build_musician_menu_items
				name_script = debug_menu_musician_menu_name_builder
				value_script = debug_menu_musician_menu_value_builder
				text_script = debug_menu_musician_menu_text_builder
				Type = option
				left_script = debug_menu_musician_type_option_left
				right_script = debug_menu_musician_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_bot_menu_items
				name_script = debug_menu_bot_menu_name_builder
				condition_script = debug_menu_bot_check
				Type = toggle
				on_script = debug_menu_turn_on_bot
				off_script = debug_menu_turn_off_bot
			}
			{
				text = qs(0x256857ee)
				Type = toggle
				condition_script = debug_menu_bot_instructions_check
				on_script = debug_menu_turn_on_bot_instructions
				off_script = debug_menu_turn_off_bot_instructions
			}
			{
				multiitem
				build_script = debug_menu_build_star_menu_items
				name_script = debug_menu_star_menu_name_builder
				value_script = debug_menu_star_menu_value_builder
				text_script = debug_menu_star_menu_text_builder
				Type = option
				left_script = debug_menu_star_type_option_left
				right_script = debug_menu_star_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_hyperspeed_menu_items
				name_script = debug_menu_hyperspeed_menu_name_builder
				value_script = debug_menu_hyperspeed_menu_value_builder
				text_script = debug_menu_hyperspeed_menu_text_builder
				Type = option
				left_script = debug_menu_hyperspeed_type_option_left
				right_script = debug_menu_hyperspeed_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_mult_max_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_mult_max_menu_value_builder
				text_script = debug_menu_mult_max_menu_text_builder
				Type = option
				left_script = debug_menu_mult_max_type_option_left
				right_script = debug_menu_mult_max_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_sp_mult_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_sp_mult_menu_value_builder
				text_script = debug_menu_sp_mult_menu_text_builder
				Type = option
				left_script = debug_menu_sp_mult_type_option_left
				right_script = debug_menu_sp_mult_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_mult_enhance_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_mult_enhance_menu_value_builder
				text_script = debug_menu_mult_enhance_menu_text_builder
				Type = option
				left_script = debug_menu_mult_enhance_type_option_left
				right_script = debug_menu_mult_enhance_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_sp_gain_mult_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_sp_gain_mult_menu_value_builder
				text_script = debug_menu_sp_gain_mult_menu_text_builder
				Type = option
				left_script = debug_menu_sp_gain_mult_type_option_left
				right_script = debug_menu_sp_gain_mult_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_sp_note_streak_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_sp_note_streak_menu_value_builder
				text_script = debug_menu_sp_note_streak_menu_text_builder
				Type = option
				left_script = debug_menu_sp_note_streak_type_option_left
				right_script = debug_menu_sp_note_streak_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_crowd_meter_start_bonus_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_crowd_meter_start_bonus_menu_value_builder
				text_script = debug_menu_crowd_meter_start_bonus_menu_text_builder
				Type = option
				left_script = debug_menu_crowd_meter_start_bonus_type_option_left
				right_script = debug_menu_crowd_meter_start_bonus_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_miss_note_bonus_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_miss_note_bonus_menu_value_builder
				text_script = debug_menu_miss_note_bonus_menu_text_builder
				Type = option
				left_script = debug_menu_miss_note_bonus_type_option_left
				right_script = debug_menu_miss_note_bonus_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_resurrection_lives_menu_items
				name_script = debug_menu_scoring_attribute_menu_name_builder
				value_script = debug_menu_resurrection_lives_menu_value_builder
				text_script = debug_menu_resurrection_lives_menu_text_builder
				Type = option
				left_script = debug_menu_resurrection_lives_type_option_left
				right_script = debug_menu_resurrection_lives_type_option_right
			}
		]
	}
	{
		id = 'tools'
		title = qs(0x23a76ddd)
		items = [
			{
				text = qs(0x79aee6c5)
				Type = run_script
				choose_script = debug_menu_check_cas_assets
			}
			{
				text = qs(0x56dc7134)
				Type = run_script
				choose_script = 0x45e248df
			}
			{
				text = qs(0xbc1f222f)
				Type = run_script
				choose_script = debug_menu_dump_heaps
			}
			{
				text = qs(0x0e852edb)
				Type = toggle
				condition_script = debug_menu_autosave_check
				on_script = debug_menu_turn_on_autosave
				off_script = debug_menu_turn_off_autosave
			}
			{
				text = qs(0xa2fa3e9a)
				Type = run_script
				choose_script = debug_menu_save_replay
			}
			{
				text = qs(0xc1c448fd)
				Type = new_menu
				menu_id = 'replay'
			}
			{
				text = qs(0x72718c0c)
				Type = run_script
				choose_script = debug_menu_play_credits
			}
			{
				text = qs(0x6bbf81bd)
				Type = run_script
				choose_script = toggle_model_viewer
			}
			{
				text = qs(0xc540004a)
				Type = new_menu
				menu_id = 'difficulty_analyzer'
			}
			{
				text = qs(0x7b0ed426)
				Type = run_script
				choose_script = debug_toggle_changelist
			}
			{
				text = qs(0xa3218900)
				Type = toggle
				Global = lightshow_debug
				on_script = debug_menu_turn_on_lightshow
				off_script = debug_menu_turn_off_lightshow
			}
			{
				text = qs(0xdb091893)
				Type = run_script
				choose_script = debug_menu_color_calibration
			}
			{
				text = qs(0x4e153102)
				Type = run_script
				choose_script = debug_menu_color_histogram
			}
			{
				text = qs(0xd3f1185b)
				Type = run_script
				choose_script = debug_menu_play_rockout
			}
			{
				text = qs(0xc939b12e)
				Type = run_script
				choose_script = debug_menu_ui_physics_test
			}
			{
				text = qs(0x385c5e06)
				Type = new_menu
				menu_id = 'autotesting'
			}
			{
				text = qs(0x600ea38c)
				Type = toggle
				Global = show_gpu_time
			}
			{
				text = qs(0xb43fef0b)
				Type = toggle
				Global = show_cpu_time
			}
			{
				text = qs(0x9e201e57)
				Type = run_script
				choose_script = debug_menu_test_velocity_strum
			}
			{
				text = qs(0x6c05787c)
				Type = run_script
				choose_script = debug_menu_mic_debugger
			}
			{
				text = qs(0x186d278f)
				Type = toggle
				Global = alternate_viewer_hud_behavior
			}
			{
				text = qs(0xed265db9)
				Type = toggle
				Global = g_include_debug_songs
			}
			{
				text = qs(0x557a299c)
				Type = run_script
				choose_script = debug_menu_nxgui_sandbox
			}
			{
				text = qs(0xf28fca92)
				Type = run_script
				choose_script = debug_menu_ui_sfx_test
			}
			{
				text = qs(0x46999207)
				Type = new_menu
				menu_id = 'virtual_controllers'
			}
		]
	}
	{
		id = 'replay'
		title = qs(0xc1c448fd)
		items = [
			{
				multiitem
				build_script = debug_menu_build_replay_menu
				name_script = debug_menu_replay_menu_name_builder
				Type = run_script
				choose_script = debug_menu_replay_menu_choose_script_builder
			}
		]
	}
	{
		id = 'difficulty_analyzer'
		title = qs(0xc540004a)
		back_script = debug_menu_difficulty_analyzer_back
		items = [
			{
				multiitem
				build_script = debug_menu_build_difficulty_analyzer_menu
				name_script = debug_menu_difficulty_analyzer_menu_name_builder
				Type = new_menu
				menu_id = 'difficulty_analyzer_instrument'
				menu_params = debug_menu_difficulty_analyzer_menu_params_builder
				focus_script = debug_menu_difficulty_analyzer_menu_focus_script_builder
			}
			{
				text = qs(0x2c1db66a)
				Type = new_menu
				menu_id = 'difficulty_analyzer_instrument'
				menu_params = {
					difficulty = all
					song_name = debug_output
				}
				focus_script = debug_menu_wait_for_diff_analyzer
				focus_params = {
					song_checksum = debug_output
				}
			}
		]
	}
	{
		id = 'difficulty_analyzer_instrument'
		title = qs(0xf1283fc0)
		items = [
			{
				multiitem
				build_script = debug_menu_build_difficulty_analyzer_instrument_menu
				name_script = debug_menu_difficulty_analyzer_instrument_menu_name_builder
				Type = new_menu
				menu_id = 'difficulty_analyzer_difficulty'
				menu_params = debug_menu_difficulty_analyzer_instrument_menu_params_builder
			}
		]
	}
	{
		id = 'difficulty_analyzer_difficulty'
		title = qs(0x7db6b015)
		items = [
			{
				multiitem
				build_script = debug_menu_build_difficulty_analyzer_difficulty_menu
				name_script = debug_menu_difficulty_analyzer_difficulty_menu_name_builder
				Type = run_script
				choose_script = debug_menu_difficulty_analyzer_difficulty_menu_choose_script_builder
				focus_script = debug_menu_difficulty_analyzer_difficulty_menu_focus_script_builder
			}
		]
	}
	{
		id = 'autotesting'
		title = qs(0x385c5e06)
		additional_start_script = autotest_menu_start
		back_script = destroy_autotest_menu
		back_params = {
			still_testing = 1
		}
		items = [
			{
				text = qs(0x9caa8f36)
				Type = new_menu
				menu_id = 'test_suite_select'
			}
			{
				text = qs(0x4aa2db7d)
				Type = toggle
				Global = autotest_hud_on
			}
			{
				text = qs(0xe07529e6)
				Type = toggle
				Global = autotest_turbo_mode
			}
			{
				text = qs(0x54f923a7)
				Type = run_script
				choose_script = autotest_start
			}
		]
	}
	{
		id = 'test_suite_select'
		title = qs(0x9caa8f36)
		items = [
			{
				multiitem
				build_script = debug_menu_build_test_suite_select_menu
				name_script = debug_menu_test_suite_select_menu_name_builder
				Type = run_script
				choose_script = debug_menu_test_suite_select_menu_choose_script_builder
				square_script = debug_menu_test_suite_select_menu_square_script_builder
			}
		]
	}
	{
		id = 'notetracking'
		title = qs(0x3b308bff)
		items = [
			{
				text = qs(0x1341c68c)
				Type = new_menu
				menu_id = 'nt_quickplay'
			}
			{
				text = qs(0x679949e1)
				Type = new_menu
				menu_id = 'nt_guitar_presets'
			}
			{
				text = qs(0x96167133)
				Type = new_menu
				menu_id = 'nt_drum_presets'
			}
			{
				text = qs(0xcdb73f8e)
				Type = new_menu
				menu_id = 'nt_vocal_presets'
			}
		]
	}
	{
		id = 'nt_quickplay'
		title = qs(0x1341c68c)
		items = [
			{
				text = qs(0xe1a28c5f)
				Type = toggle
				Global = allow_controller_for_all_instruments
			}
			{
				text = qs(0x092c9f43)
				Type = option
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				left_script = debug_menu_play_song_option_left
				right_script = debug_menu_play_song_option_right
				option_select = {
					Type = new_menu
					menu_id = 'num_players'
				}
			}
			{
				text = qs(0x414faedc)
				Type = new_menu
				menu_id = 'skip_into_song'
			}
			{
				text = qs(0x0606bdb8)
				Type = new_menu
				menu_id = 'change_venue'
			}
			{
				text = qs(0x474a49b8)
				Type = new_menu
				menu_id = 'camera_cut_group'
			}
			{
				text = qs(0xd7f64bb0)
				Type = option
				value_script = debug_menu_force_score_get_value
				text_script = debug_menu_force_score_get_text
				left_script = debug_menu_force_score_option_left
				right_script = debug_menu_force_score_option_right
			}
			{
				text = qs(0x680492d0)
				Type = toggle
				Global = debug_show_measures
				on_script = debug_menu_turn_on_show_measures
				off_script = debug_menu_turn_off_show_measures
			}
			{
				text = qs(0xba249053)
				Type = toggle
				Global = debug_show_song_time
				on_script = debug_menu_turn_on_show_song_time
				off_script = debug_menu_turn_off_show_song_time
			}
			{
				text = qs(0x256857ee)
				Type = toggle
				condition_script = debug_menu_bot_instructions_check
				on_script = debug_menu_turn_on_bot_instructions
				off_script = debug_menu_turn_off_bot_instructions
			}
			{
				multiitem
				build_script = debug_menu_build_star_menu_items
				name_script = debug_menu_star_menu_name_builder
				value_script = debug_menu_star_menu_value_builder
				text_script = debug_menu_star_menu_text_builder
				Type = option
				left_script = debug_menu_star_type_option_left
				right_script = debug_menu_star_type_option_right
			}
			{
				multiitem
				build_script = debug_menu_build_hyperspeed_menu_items
				name_script = debug_menu_hyperspeed_menu_name_builder
				value_script = debug_menu_hyperspeed_menu_value_builder
				text_script = debug_menu_hyperspeed_menu_text_builder
				Type = option
				left_script = debug_menu_hyperspeed_type_option_left
				right_script = debug_menu_hyperspeed_type_option_right
			}
			{
				text = qs(0x256857ee)
				Type = toggle
				condition_script = debug_menu_bot_instructions_check
				on_script = debug_menu_turn_on_bot_instructions
				off_script = debug_menu_turn_off_bot_instructions
			}
		]
	}
	{
		id = 'nt_guitar_presets'
		title = qs(0x679949e1)
		items = [
			{
				text = qs(0x5197232a)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_guitar_fourplay
			}
			{
				text = qs(0x63caf8b8)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_bass_fourplay
			}
			{
				text = qs(0x18561eaa)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_band_moment_script
			}
			{
				text = qs(0x9e7670a5)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_lightshow_viewer
			}
			{
				text = qs(0x46a0b2ca)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_guitar_viewer
			}
			{
				text = qs(0xbbbd5c60)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_bass_viewer
			}
		]
	}
	{
		id = 'nt_drum_presets'
		title = qs(0x96167133)
		items = [
			{
				text = qs(0x84b4d3ef)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_drum_fourplay
			}
			{
				text = qs(0x03a6f77e)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_drum_viewer
			}
		]
	}
	{
		id = 'nt_vocal_presets'
		title = qs(0xcdb73f8e)
		items = [
			{
				text = qs(0xb6ae04e6)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_vocals_static
			}
			{
				text = qs(0x3dbccfdf)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_vocals_karaoke
			}
			{
				text = qs(0xc4cade4f)
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				Type = new_menu
				menu_id = 'nt_debug_songlist'
				additional_choose_script = select_nt_debug_vocals_scrolling
			}
			{
				text = qs(0x5dcbe281)
				Type = run_script
				choose_script = select_debug_vocal_highway_static
			}
			{
				text = qs(0x5f6c5e64)
				Type = run_script
				choose_script = select_debug_vocal_highway_karaoke
			}
			{
				text = qs(0x27b13f68)
				Type = run_script
				choose_script = select_debug_vocal_highway_scrolling
			}
		]
	}
	{
		id = 'nt_debug_songlist'
		title = qs(0x81eb0aa1)
		paged
		items = [
			{
				multiitem
				build_script = debug_menu_build_play_song_menu
				name_script = debug_menu_play_song_menu_name_builder
				Type = run_script
				choose_script = nt_debug_songlist_choose_script_builder
			}
		]
	}
	{
		id = 'screenshot_utilities'
		title = qs(0x00b7a760)
		items = [
			{
				text = qs(0x092c9f43)
				Type = option
				value_script = debug_menu_play_song_get_value
				text_script = debug_menu_play_song_get_text
				left_script = debug_menu_play_song_option_left
				right_script = debug_menu_play_song_option_right
				option_select = {
					Type = new_menu
					menu_id = 'num_players'
				}
			}
			{
				text = qs(0x0606bdb8)
				Type = new_menu
				menu_id = 'change_venue'
			}
			{
				text = qs(0xdb4779a7)
				Type = new_menu
				menu_id = 'band_setup'
			}
			{
				text = qs(0xe1a28c5f)
				Type = toggle
				Global = allow_controller_for_all_instruments
			}
			{
				text = qs(0x1ea1707a)
				Type = toggle
				Global = debug_use_screen_noise
				on_script = debug_menu_turn_on_screen_noise
				off_script = debug_menu_turn_off_screen_noise
			}
			{
				text = qs(0x9005eafe)
				Type = toggle
				Global = debug_use_motion_blur
				on_script = debug_menu_turn_on_motion_blur
				off_script = debug_menu_turn_off_motion_blur
			}
			{
				text = qs(0x83f087be)
				Type = toggle
				condition_script = debug_menu_visibility_check
				condition_params = {
					Type = 'crowd'
				}
				on_script = debug_menu_turn_on_visibility
				on_params = {
					Type = 'crowd'
				}
				off_script = debug_menu_turn_off_visibility
				off_params = {
					Type = 'crowd'
				}
			}
			{
				text = qs(0xf1192c92)
				Type = toggle
				Global = g_debug_highway_visible
				on_script = debug_menu_turn_on_highway_visibility
				off_script = debug_menu_turn_off_highway_visibility
			}
			{
				text = qs(0xd7f64bb0)
				Type = option
				value_script = debug_menu_force_score_get_value
				text_script = debug_menu_force_score_get_text
				left_script = debug_menu_force_score_option_left
				right_script = debug_menu_force_score_option_right
			}
			{
				text = qs(0x186d278f)
				Type = toggle
				Global = alternate_viewer_hud_behavior
			}
			{
				text = qs(0x3cfc5017)
				Type = new_menu
				menu_id = 'target_camera'
			}
		]
	}
	{
		id = 'target_camera'
		title = qs(0x3cfc5017)
		additional_start_script = debug_screenshot_util_additional_start_script
		back_script = debug_screenshot_util_back_script
		items = [
			{
				text = qs(0x2a5fa2e9)
				Type = option
				value_script = debug_screenshot_util_bandmember_get_value
				text_script = debug_screenshot_util_bandmember_get_text
				left_script = debug_screenshot_util_bandmember_option_left
				right_script = debug_screenshot_util_bandmember_option_right
			}
			{
				text = qs(0x015aa725)
				Type = option
				value_script = debug_screenshot_util_bone_get_value
				text_script = debug_screenshot_util_bone_get_text
				left_script = debug_screenshot_util_bone_option_left
				right_script = debug_screenshot_util_bone_option_right
			}
			{
				text = qs(0x4df7813d)
				Type = option
				value_script = debug_screenshot_util_lockto_bone_get_value
				text_script = debug_screenshot_util_lockto_bone_get_text
				left_script = debug_screenshot_util_lockto_bone_option_left
				right_script = debug_screenshot_util_lockto_bone_option_right
			}
			{
				text = qs(0x3b42ee32)
				Type = option
				value_script = debug_screenshot_util_value1_get_value
				text_script = debug_screenshot_util_value1_get_text
				left_script = debug_screenshot_util_value1_option_left
				right_script = debug_screenshot_util_value1_option_right
			}
			{
				text = qs(0xdf564613)
				Type = option
				value_script = debug_screenshot_util_value2_get_value
				text_script = debug_screenshot_util_value2_get_text
				left_script = debug_screenshot_util_value2_option_left
				right_script = debug_screenshot_util_value2_option_right
			}
			{
				text = qs(0x7946208c)
				Type = option
				value_script = debug_screenshot_util_value3_get_value
				text_script = debug_screenshot_util_value3_get_text
				left_script = debug_screenshot_util_value3_option_left
				right_script = debug_screenshot_util_value3_option_right
			}
			{
				text = qs(0xf0bab908)
				Type = option
				value_script = debug_screenshot_util_value4_get_value
				text_script = debug_screenshot_util_value4_get_text
				left_script = debug_screenshot_util_value4_option_left
				right_script = debug_screenshot_util_value4_option_right
			}
			{
				text = qs(0x37f87d25)
				Type = option
				value_script = debug_screenshot_util_value5_get_value
				text_script = debug_screenshot_util_value5_get_text
				left_script = debug_screenshot_util_value5_option_left
				right_script = debug_screenshot_util_value5_option_right
			}
			{
				text = qs(0x4a3c4581)
				Type = toggle
				Global = g_debug_screenshot_util_precise_tuning_enabled
				on_script = debug_screenshot_util_update_precise_tuning
				off_script = debug_screenshot_util_update_precise_tuning
			}
			{
				text = qs(0xd73678e0)
				Type = run_script
				choose_script = userviewerx_frame_step
			}
			{
				text = qs(0x7b0c4d95)
				Type = run_script
				choose_script = debug_screenshot_util_pause_unpause
			}
			{
				text = qs(0x8c6324f7)
				Type = run_script
				choose_script = debug_screenshot_util_toggle_debug_menu
			}
		]
	}
	{
		id = 'minigame_prototypes'
		title = qs(0xfea03695)
		items = [
			{
				text = qs(0x391d4d2b)
				Type = run_script
				choose_script = 0xf1d67dfd
			}
		]
	}
]
