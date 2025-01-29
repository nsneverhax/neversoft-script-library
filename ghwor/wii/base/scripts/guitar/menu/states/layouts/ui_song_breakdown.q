last_song_played = None
last_jam_song_props = {
}
ui_song_breakdown_wrote_tr = 0
ui_song_breakdown_helper_params = {
}
ui_song_breakdown_already_animated_stats = 0
sb_jam_song_end_time = 0
song_breakdown_gem_scroller_restarted = 0
net_song_breakdown_timer_screen_id = None
net_song_breakdown_timer_running = 0
g_net_song_breakdown_gone_to_setlist = 0
g_song_breakdown_noncompetitive_stats_order = [
	{
		visibility = {
			quickplay
		}
		Name = unlock_level
		title_text = qs(0x4c292acb)
		caption_text = qs(0x03ac90f0)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		visibility = {
			career
			quickplay
			freeplay
			end_credits
		}
		Name = accuracy
		title_text = qs(0x8795155b)
		caption_text = qs(0x7d221f06)
		use_unit_text = 1
		unit_text = qs(0x0c40a1b2)
	}
	{
		visibility = {
			quickplay
			freeplay
			end_credits
		}
		Name = score
		title_text = qs(0xfb40ab1c)
		caption_text = qs(0x01991b09)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		visibility = {
			career
			quickplay
			freeplay
			end_credits
		}
		Name = streak
		title_text = qs(0x9a210119)
		caption_text = qs(0x9a210119)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
	{
		visibility = {
			career
			quickplay
			freeplay
			end_credits
		}
		Name = multiplier
		title_text = qs(0x1ae60c3c)
		caption_text = qs(0xd250fe14)
		use_unit_text = 1
		unit_text = qs(0x96d1a609)
	}
	{
		visibility = {
			quickplay
			exclude_jam
		}
		Name = challenge
		title_text = qs(0x1b7b63c5)
		caption_text = qs(0x2739838c)
		use_unit_text = 0
		unit_text = qs(0x03ac90f0)
	}
]
g_song_breakdown_noncompetitive_stats_order_backup = [
]

script ui_init_song_breakdown 
	Change \{song_breakdown_gem_scroller_restarted = 0}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{ui_song_breakdown_already_animated_stats = 0}
	Change \{respond_to_signin_changed_func = ui_signin_changed_func}
	Change \{song_breakdown_countdown_time = -1}
	Change \{sb_jam_song_end_time = 0}
	Change \{net_breakdown_continue_msg_sent = 0}
	Change \{g_net_song_breakdown_gone_to_setlist = 0}
	Change \{songtime_paused = 1}
	Change \{playing_song = 0}
	disable_pause
	gamemode_gettype
	if ScreenElementExists \{id = song_outro_anims_container}
		DestroyScreenElement \{id = song_outro_anims_container}
	endif
	if (<Type> = practice)
		SpawnScriptNow \{kill_gem_scroller}
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'select_song_section'
			}}
		return
	endif
	Change \{ui_song_breakdown_wrote_tr = 0}
	social_networks_broadcast_init
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_create_song_breakdown 
	gamemode_gettype
	if (<Type> = practice)
		LoadPak \{'pak/ui/breakdown_icons.pak'
			Heap = quota_misc}
	endif
	printf \{'********* Create song breakdown **********'}
	if inroadiebattlemode
		Change g_song_breakdown_noncompetitive_stats_order_backup = ($g_song_breakdown_noncompetitive_stats_order)
		<new_stats> = [
			{
				visibility = {quickplay}
				Name = roadie_assist
				title_text = qs(0x9ed2a13d)
				caption_text = qs(0xe12e21e5)
				use_unit_text = 1
				unit_text = qs(0x0c40a1b2)
			}
		]
		Change g_song_breakdown_noncompetitive_stats_order = (<new_stats> + $g_song_breakdown_noncompetitive_stats_order_backup)
		roadie_battle_goto_ds_menu \{aids = $roadie_battle_signed_in_ds_aids
			menu_name = results}
		LoadPak \{'pak\\roadie_battle\\roadie_battle_song_breakdown.pak'
			Heap = quota_misc}
	endif
	Change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		Change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		DestroyScreenElement \{id = song_breakdown_noncompetitive_id}
	endif
	playlist_getcurrentsong
	my_song = <current_song>
	if ($game_mode != practice)
		if NOT ($last_song_played = None)
			my_song = ($last_song_played)
		endif
		if (($last_song_played) = jamsession)
			<song_title> = (($last_jam_song_props).jam_display_name)
			<band_name> = (($last_jam_song_props).jam_artist_name)
		else
			get_song_title song = <my_song>
		endif
	else
		get_song_title song = <my_song>
	endif
	if NOT (($last_song_played) = jamsession)
		get_song_original_artist song = <my_song>
		if (<original_artist> = 0)
			<band_name> = qs(0x13c0666a)
		else
			get_song_artist song = <my_song> with_year = 0
			<band_name> = <song_artist>
		endif
	endif
	if (<Type> = career)
		if console_is_net_career_client
			encore_ready = ($g_net_career_progression.career_progression_tags.encore_ready)
		else
			GetGlobalTags savegame = <savegame> career_progression_tags param = encore_ready
		endif
	endif
	if (<Type> = practice)
		ui_create_song_breakdown_practice <...>
	else
		ui_create_song_breakdown_normal <...>
	endif
endscript

script ui_destroy_song_breakdown 
	if issoundplaying \{stats_screen_stars_loop}
		stopsound \{stats_screen_stars_loop}
		stopsound \{stats_screen_last_star_hit}
	endif
	StopSoundEvent \{stats_screen_loop
		fade_type = linear
		fade_time = 0.1}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = pulsate_helper_pill}
	if ScreenElementExists \{id = my_breakdown_practice_id}
		DestroyScreenElement \{id = my_breakdown_practice_id}
	endif
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :GetSingleTag \{num_stars}
			audio_ui_kill_outro_stars num_stars = <num_stars>
		endif
		if song_breakdown_noncompetitive_id :GetSingleTag \{players_list_id}
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		DestroyScreenElement \{id = song_breakdown_noncompetitive_id}
	endif
	Destroy2DParticleSystem \{id = ui_star_particles}
	Destroy2DParticleSystem \{id = ui_star_particles_multi}
	unload_pak_for_quest_chapter
	if inroadiebattlemode
		Change g_song_breakdown_noncompetitive_stats_order = ($g_song_breakdown_noncompetitive_stats_order_backup)
		unload_pak_and_wait \{pak = 'pak\\roadie_battle\\roadie_battle_song_breakdown.pak'}
	endif
	gamemode_gettype
	if (<Type> = practice)
		unload_pak_and_wait \{pak = 'pak/ui/breakdown_icons.pak'}
	endif
endscript

script ui_deinit_song_breakdown 
	Change \{song_breakdown_gem_scroller_restarted = 0}
	Change \{song_breakdown_countdown_time = -1}
	Change \{song_breakdown_countdown_time_added = 0}
	Change \{ui_song_breakdown_already_animated_stats = 0}
	Change \{sb_jam_song_end_time = 0}
	printf \{channel = zdebug
		qs(0xf4674b8a)}
	ui_song_breakdown_clean_up_highest_multipliers
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		if ($shutdown_game_for_signin_change_flag = 1 || ($g_connection_loss_dialogue = 1 && $is_network_game = 1))
			wait_for_start_gem_scroller_completion
		endif
	endif
endscript

script ui_create_song_breakdown_practice 
	Hide_Band
	hide_crowd_models
	disable_pause
	progression_updatedetailedstatsforgig \{failed_or_practice}
	getfirstplayer
	ui_song_breakdown_get_basic_player_data player_index = <Player>
	formatText TextName = percent_text qs(0x581d2af2) p = ($practice_current_percentage) DecimalPlaces = 0
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_practice_id
		Type = descinterface
		desc = 'song_breakdown_practice'
		dlog_title_text = <song_title>
		dlog_continue_notes_entry_text = <percent_text>
		dlog_continue_streak_entry_text = <streak_text>
		icon_difficulty_medium_texture = <diff_texture>
		dlog_fail_song_difficulty_text = <difficulty_text>
		exclusive_device = ($primary_controller)
	}
	my_breakdown_practice_id :desc_resolvealias \{Name = alias_dlog_vmenu}
	SetScreenElementProps {
		id = <resolved_id>
		event_handlers = [
			{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
			{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
		]
	}
	CreateScreenElement {
		Type = descinterface
		desc = 'menurow_txt_desc'
		parent = <resolved_id>
		autosizedims = true
		menurow_txt_item_text = qs(0x4994d173)
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = gh6_gold
		event_handlers = [
			{focus practice_song_breakdown_focus}
			{unfocus practice_song_breakdown_unfocus}
			{pad_choose practice_restart_song}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
	}
	CreateScreenElement {
		Type = descinterface
		desc = 'menurow_txt_desc'
		parent = <resolved_id>
		autosizedims = true
		menurow_txt_item_text = qs(0x1d227332)
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = gh6_gold
		event_handlers = [
			{focus practice_song_breakdown_focus}
			{unfocus practice_song_breakdown_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_song_summary_details}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
	}
	CreateScreenElement {
		Type = descinterface
		desc = 'menurow_txt_desc'
		parent = <resolved_id>
		autosizedims = true
		menurow_txt_item_text = qs(0xde4bb13a)
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = gh6_gold
		event_handlers = [
			{focus practice_song_breakdown_focus}
			{unfocus practice_song_breakdown_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_select_song_section data = {from_in_game = 1}}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
	}
	getfirstplayer
	if NOT playerinfoequals <Player> part = vocals
		CreateScreenElement {
			Type = descinterface
			desc = 'menurow_txt_desc'
			parent = <resolved_id>
			autosizedims = true
			menurow_txt_item_text = qs(0x2586eb28)
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = gh6_gold
			event_handlers = [
				{focus practice_song_breakdown_focus}
				{unfocus practice_song_breakdown_unfocus}
				{pad_choose generic_event_choose params = {state = uistate_practice_select_speed data = {from_song_breakdown = 1}}}
				{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
			]
		}
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'menurow_txt_desc'
		parent = <resolved_id>
		autosizedims = true
		menurow_txt_item_text = qs(0x67d9c56d)
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = gh6_gold
		event_handlers = [
			{focus practice_song_breakdown_focus}
			{unfocus practice_song_breakdown_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_pausemenu_song_ended}}
			{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
		]
	}
	AssignAlias id = <resolved_id> alias = current_menu
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xc18d5e76) button = green z = 100000
	SpawnScriptNow \{reset_mainmenu_camera}
endscript

script practice_song_breakdown_focus \{time = 0.05}
	<text_focus_color> = ($menu_focus_color)
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <text_focus_color>
		menurow_highlight_bar_alpha = 1.0
		motion = ease_in
		time = <time>
	}
endscript

script practice_song_breakdown_unfocus \{time = 0.0}
	<text_unfocus_color> = gh6_gold
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <text_unfocus_color>
		menurow_highlight_bar_alpha = 0.0
		motion = ease_in
		time = <time>
	}
endscript

script song_breakdown_is_single_player_game 
	gamemode_gettype
	if (isSinglePlayerGame)
		return \{true}
	elseif (<Type> = freeplay)
		freeplay_get_num_active_players
		if (<num_active_players> = 1)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script ui_create_song_breakdown_normal 
	if ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		gamemode_gettype
		if (<Type> = quickplay)
			select_initial_scene_swap
		endif
		if (($song_breakdown_gem_scroller_restarted) = 0)
			SpawnScriptLater restart_gem_scroller params = {
				starttime = <starttime>
				practice_intro = 0
				loading_transition = 1
				no_render = 0
			}
			Change \{song_breakdown_gem_scroller_restarted = 1}
		endif
	elseif GotParam \{end_of_setlist_transition}
		if ($last_song_played = jamsession)
			destroy_cameracuts
		endif
	endif
	UnPauseGame
	<display_stats_index> = 0
	SoundEvent \{event = audio_ui_song_complete_menu_in}
	<achieved_gold_stars> = 1
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		get_percent_notes_hit player_index = <Player>
		if GotParam \{percent_notes_hit}
			if (<percent_notes_hit> < 100)
				<achieved_gold_stars> = 0
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
	<stats_finished_animating> = 0
	if ($ui_song_breakdown_already_animated_stats = 1)
		<stats_finished_animating> = 1
	endif
	<gametype_params> = {}
	if song_breakdown_is_single_player_game
		getfirstplayer
		if (<Type> = quickplay || $end_credits > 0)
			<challenge_meter_alpha> = 0
			<challenge_na_text_alpha> = 0
			<quickplay_bonus_badge_menu_alpha> = 1
		else
		endif
		getplayerinfo <Player> part
		getplayerinfo <Player> difficulty
		getplayerinfo <Player> double_kick_drum
		ui_song_breakdown_get_player_difficulty_texture {
			part = <part>
			difficulty = <difficulty>
			double_kick_drum = <double_kick_drum>
		}
		switch <part>
			case guitar
			<icon_fill> = icon_guitar_fill
			<icon_out> = icon_guitar_out
			case bass
			<icon_fill> = icon_bass_fill
			<icon_out> = icon_bass_out
			case drum
			<icon_fill> = icon_drum_fill
			<icon_out> = icon_drum_out
			case vocals
			<icon_fill> = icon_vocals_fill
			<icon_out> = icon_vocals_out
			default
			<icon_fill> = icon_guitar_fill
			<icon_out> = icon_guitar_out
		endswitch
		<do_transform_anim> = 0
		if (<Type> = quickplay)
			quickplay_get_overall_awards_progress Player = <Player>
			quickplay_get_recent_award_points Player = <Player>
			<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
			formatText TextName = total_points_main_text qs(0x0204c31d) t = <starting_award_points_total> usecommas
			quickplay_find_award_point_level award_points = <starting_award_points_total>
			<previous_award_point_level> = <award_point_level>
			quickplay_find_award_point_level award_points = <current_award_points_total>
			quickplay_get_outro_percentages {
				previous_points = <starting_award_points_total>
				current_points = <current_award_points_total>
				previous_level = <previous_award_point_level>
				current_level = <award_point_level>
			}
			quickplay_get_next_threshold level = <previous_award_point_level>
			<start_percentage_int> = (<start_percentage> * 100)
			CastToInteger \{start_percentage_int}
			formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <starting_award_points_total>)
			formatText TextName = level_text qs(0x801f5b44) l = (<previous_award_point_level> + 1)
			<meter_width> = 263.0
			if gman_ispowerscoreenabled
				<gametype_params> = {
					song_summary_star_qp_alpha = 0.0
					star_glow_1_alpha = 1.0
					flying_star_1_alpha = 0.0
					career_meter_alpha = 0.0
				}
			else
				<gametype_params> = {
					song_summary_star_career_alpha = 0.0
					star_glow_career_alpha = 0.0
					flying_star_career_alpha = 0.0
					career_meter_alpha = 0.0
				}
			endif
			if ($last_song_played = jamsession)
				<gametype_params> = {
					<gametype_params>
					ghtracks_alpha = 1.0
					challenges_alpha = 0.0
				}
			endif
			if (<at_max_level> = 1)
				AddParam \{structure_name = gametype_params
					Name = stars_to_next_level_alpha
					value = 0.0}
				AddParam \{structure_name = gametype_params
					Name = max_level_text_alpha
					value = 1.0}
			endif
		elseif (<Type> = career)
			get_savegame_from_player Player = <Player>
			getplayerinfo <Player> character_id
			get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
			<current_chapter> = ($current_chapter)
			<hero_info> = ($<current_chapter>.hero_info)
			quest_get_char_icon hero_name_nl = ($<hero_info>.name_nl) chapter_name = <current_chapter>
			if quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = <current_chapter>
				character_texture = <character_trans_texture>
				fullname = ($<hero_info>.character_transformation_fullname)
			endif
			quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <current_chapter>
			if NOT quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = quest_chapter_finale
				quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <current_chapter> param = encore_unlocked
				if (<encore_unlocked> = 0)
					<star_diff> = ($<current_chapter>.stars_for_encore - <stars_earned>)
					if (<star_diff> = 1)
						formatText TextName = star_amount_needed_text qs(0x04246bb5) d = <star_diff>
					else
						formatText TextName = star_amount_needed_text qs(0x47c0cc3c) d = <star_diff>
					endif
				else
					if NOT quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = <current_chapter>
						star_amount_needed_text = qs(0x85123580)
					else
						star_amount_needed_text = qs(0xd88ec7a1)
						<do_transform_anim> = 1
						meter_fx_complete = 1.0
					endif
				endif
			else
				<stars_needed_for_reward> = ($<current_chapter>.stars_for_reward)
				<star_diff> = (<stars_needed_for_reward> - <stars_earned>)
				if (<star_diff> <= 0)
					<star_amount_needed_text> = qs(0x77d6579b)
				else
					if (<star_diff> = 1)
						formatText TextName = star_amount_needed_text qs(0x46c34881) d = <star_diff>
					else
						formatText TextName = star_amount_needed_text qs(0x5e8d0c5e) d = <star_diff>
					endif
				endif
			endif
			<gametype_params> = {
				song_summary_star_qp_alpha = 0.0
				star_glow_1_alpha = 1.0
				flying_star_1_alpha = 0.0
				award_points_menu_alpha = 0.0
				quickplay_bonus_badge_menu_top_alpha = 0.0
				quickplay_bonus_badge_menu_mid_alpha = 0.0
				quickplay_bonus_badge_menu_bot_alpha = 0.0
				frame_texture_qp_alpha = 0.0
				bgk_fx_alpha = <meter_fx_complete>
				career_character_name_text = <fullname>
				career_star_amount_text = <star_amount_needed_text>
				meter_transform_icon_character_texture = <character_texture>
			}
			unload_pak_for_quickplay
			load_pak_for_quest_chapter \{for_song_breakdown = true}
		endif
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			Type = descinterface
			desc = 'song_summary_single'
			points_frame_alpha = 0.0
			challenge_frame_pos = (0.0, 0.0)
			challenge_frame_alpha = 0.0
			challenge_title_alpha = 0.0
			meter_transform_scale = (0.0, 0.0)
			frame_anim_alpha = 0.0
			frame_anim_pos = (0.0, 0.0)
			you_rock_power_challenge_scale = (1.0, 1.0)
			band_name_text = <band_name>
			song_title_text = <song_title>
			hud_meter_challenge_alpha = <challenge_meter_alpha>
			challenge_na_text_alpha = <challenge_na_text_alpha>
			diff_icon_texture = <diff_texture>
			inst_icon_fill_texture = <icon_fill>
			inst_icon_out_texture = <icon_out>
			quickplay_bonus_badge_menu_alpha = <quickplay_bonus_badge_menu_alpha>
			frame_highlight_alpha = 0.0
			<gametype_params>
			tags = {
				display_stats_index = <display_stats_index>
				dot = 0
				transition_param = None
				num_stars = -1
				stats_finished_animating = <stats_finished_animating>
				qp_num_badges = 0
				current_song_star_total = 0
			}
		}
		if inroadiebattlemode
			if NOT ResolveScreenElementID \{id = {
						song_breakdown_noncompetitive_id
						child = song_summary_master
					}}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_master'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = background}
				ScriptAssert \{'Can\'t find ScreenElement background'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = song_summary_illo}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_ILLO'}
			endif
			getplayerinfo Player = <Player> roadie_battle_roadie_index
			roadie_battle_get_roadie_info roadie = <roadie_battle_roadie_index> param = avatar
			formatText checksumName = roadie_tex 'SongSummary_Roadie%d' d = (<avatar> + 1)
			<resolved_id> :se_setprops texture = <roadie_tex>
			formatText TextName = assist_percentage_text qs(0x76b3fda7) d = ($song_stats_backup [(<Player> - 1)].roadie_assist)
			if NOT ResolveScreenElementID \{id = {
						song_breakdown_noncompetitive_id
						child = song_summary_master
					}}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_master'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = `stat	column`}
				ScriptAssert \{'Can\'t find ScreenElement stat column'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = points_frame}
				ScriptAssert \{'Can\'t find ScreenElement points_frame'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = song_summary_score_bg}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_score_bg'}
			endif
			CreateScreenElement {
				parent = <resolved_id>
				id = vs_summary_roadie
				Type = descinterface
				desc = 'roadie_battle_roadie_summary'
				Pos = (126.0, -320.0)
				score_text = <assist_percentage_text>
			}
			roadie_battle_maybe_play_win_vo roadie = <roadie_battle_roadie_index> delay_time_secs = 3.0
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_dragon_eye_l
				param = dragon_eye_l_id}
			<dragon_eye_l_id> :Obj_SpawnScriptNow ui_alphablast_02
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_dragon_eye_r
				param = dragon_eye_r_id}
			<dragon_eye_r_id> :Obj_SpawnScriptNow ui_alphablast_02
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_star_glow_1
				param = star_glow_id}
			<star_glow_id> :obj_spawnscript ui_frazzmatazz
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_star_glow_1
				param = star_glow_id}
			<star_glow_id> :obj_spawnscript ui_shakey
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_blue_glow
				param = blue_glow_id}
			<blue_glow_id> :obj_spawnscript ui_pulse4
		else
			ScriptAssert \{'dschorn1'}
		endif
		if (<do_transform_anim> = 1)
			if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_career_star_amount
					param = career_star_amount}
				<career_star_amount> :obj_spawnscript chapter_complete_text_anim
			else
				ScriptAssert \{'dschorn1'}
			endif
		endif
	else
		<right_column_pos> = (1030.0, -653.0)
		<center_column_pos> = (120.0, -780.0)
		if ($ui_song_breakdown_already_animated_stats = 1)
			<center_column_pos> = (120.0, 260.0)
			<right_column_pos> = (1030.0, 20.0)
		endif
		if (<Type> = quickplay)
			if gman_ispowerscoreenabled
				<gametype_params> = {
					song_summary_star_qp_alpha = 0.0
					star_glow_alpha = 0.0
					flying_star_alpha = 0.0
					career_meter_alpha = 0.0
				}
			else
				<gametype_params> = {
					song_summary_star_career_alpha = 0.0
					star_glow_career_alpha = 0.0
					flying_star_career_alpha = 0.0
					career_meter_alpha = 0.0
					points_frame_alpha = 1.0
				}
			endif
			if ($last_song_played = jamsession)
				<gametype_params> = {
					<gametype_params>
					ghtracks_alpha = 1.0
					qp_band_award_menu_alpha = 0.0
				}
			endif
		elseif (<Type> = career)
			if NOT ininternetmode
				get_savegame_from_player Player = ($g_net_leader_player_num)
				getplayerinfo ($g_net_leader_player_num) character_id
			else
				get_savegame_from_controller controller = ($primary_controller)
				getfirstplayer \{local}
				begin
				getplayerinfo <Player> controller
				if (<controller> = ($primary_controller))
					getplayerinfo <Player> character_id
					break
				endif
				getnextplayer local Player = <Player>
				repeat
			endif
			get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
			<current_chapter> = ($current_chapter)
			<hero_info> = ($<current_chapter>.hero_info)
			quest_get_char_icon hero_name_nl = ($<hero_info>.name_nl) chapter_name = <current_chapter>
			if quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = <current_chapter>
				character_texture = <character_trans_texture>
				fullname = ($<hero_info>.character_transformation_fullname)
			endif
			<num_stars_to_transform> = (($<current_chapter>.stars_for_encore) - <total_stars>)
			if (<num_stars_to_transform> > 0)
				if (<num_stars_to_transform> = 1)
					formatText TextName = star_amount_needed_text qs(0x04246bb5) d = <num_stars_to_transform>
				else
					formatText TextName = star_amount_needed_text qs(0x47c0cc3c) d = <num_stars_to_transform>
				endif
			else
				if console_is_net_career_client
					<encore_ready> = ($g_net_career_progression.career_progression_tags.encore_ready)
				else
					GetGlobalTags savegame = ($primary_controller) career_progression_tags param = encore_ready
				endif
				if (<encore_ready> = 1)
					<star_amount_needed_text> = qs(0x3ffe6f36)
				else
					<num_stars_to_max> = (($<current_chapter>.stars_for_reward) - <total_stars>)
					if (<num_stars_to_max> > 0)
						if (<num_stars_to_max> = 1)
							formatText TextName = star_amount_needed_text qs(0x46c34881) d = <num_stars_to_max>
						else
							formatText TextName = star_amount_needed_text qs(0x5e8d0c5e) d = <num_stars_to_max>
						endif
					else
						<star_amount_needed_text> = qs(0xdc6af085)
					endif
				endif
			endif
			formatText TextName = num_stars_transform_text qs(0x28c4c672) a = <num_stars_text> b = <num_stars_caption_text>
			<gametype_params> = {
				song_summary_star_qp_alpha = 0.0
				star_glow_alpha = 0.0
				flying_star_alpha = 0.0
				career_meter_alpha = 1.0
				points_frame_alpha = 0.0
				qp_band_award_menu_alpha = 0.0
				character_name_text = <fullname>
				career_star_amount_text = <star_amount_needed_text>
				meter_transform_icon_character_texture = <character_texture>
			}
			unload_pak_for_quickplay
			load_pak_for_quest_chapter \{for_song_breakdown = true}
		endif
		CreateScreenElement {
			parent = root_window
			id = song_breakdown_noncompetitive_id
			Type = descinterface
			desc = 'song_summary_multi'
			points_frame_alpha = 0.0
			challenge_title_alpha = 0.0
			band_name_text = <band_name>
			quest_gamertag_frame_alpha = 0.0
			song_title_text = <song_title>
			center_column_pos = <center_column_pos>
			right_column_pos = <right_column_pos>
			<gametype_params>
			tags = {
				display_stats_index = <display_stats_index>
				dot = 0
				transition_param = None
				num_stars = -1
				stats_finished_animating = <stats_finished_animating>
				qp_num_badges = 0
				current_song_star_total = 0
			}
		}
		if (<Type> = career)
			if GotParam \{character_texture}
				if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_meter_transform}
					<resolved_id> :se_setprops icon_character_texture = <character_texture>
				endif
			endif
			get_fullname_for_player Player = ($g_net_leader_player_num) no_character_names
			song_breakdown_noncompetitive_id :se_setprops quest_gamertag_text = <fullname>
			song_breakdown_noncompetitive_id :se_setprops \{quest_gamertag_frame_alpha = 1.0}
		endif
		ui_song_breakdown_hide_player_data
		if ($end_credits > 0)
			if NOT StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].visibility) end_credits
				<display_stats_index> = (<display_stats_index> + 1)
				song_breakdown_noncompetitive_id :SetTags display_stats_index = <display_stats_index>
			endif
		else
			if NOT StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].visibility) <Type>
				<display_stats_index> = (<display_stats_index> + 1)
				song_breakdown_noncompetitive_id :SetTags display_stats_index = <display_stats_index>
			endif
		endif
		if inroadiebattlemode
			getnumplayersingame
			getfirstplayer
			<array> = []
			begin
			if roadie_battle_find_roadie_for_player Player = <Player>
				getplayerinfo Player = <Player> roadie_battle_roadie_index
				AddArrayElement array = <array> element = <roadie_battle_roadie_index>
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
			if NOT ResolveScreenElementID \{id = {
						song_breakdown_noncompetitive_id
						child = song_summary_master
					}}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_master'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = background}
				ScriptAssert \{'Can\'t find ScreenElement background'}
			endif
			if NOT ResolveScreenElementID id = {<resolved_id> child = song_summary_illo}
				ScriptAssert \{'Can\'t find ScreenElement song_summary_ILLO'}
			endif
			getrandomarrayelement <array>
			<picked_roadie> = <element>
			roadie_battle_get_roadie_info roadie = <picked_roadie> param = avatar
			formatText checksumName = roadie_tex 'SongSummary_Roadie%d' d = (<avatar> + 1)
			<resolved_id> :se_setprops texture = <roadie_tex>
			roadie_battle_maybe_play_win_vo roadie = <picked_roadie> delay_time_secs = 3.0
		endif
		song_breakdown_assign_strips_data
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_dragon_eye_l
				param = dragon_eye_l_id}
			<dragon_eye_l_id> :Obj_SpawnScriptNow ui_alphablast_02
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_dragon_eye_r
				param = dragon_eye_r_id}
			<dragon_eye_r_id> :Obj_SpawnScriptNow ui_alphablast_02
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_star_glow_1
				param = star_glow_id}
			<star_glow_id> :obj_spawnscript ui_frazzmatazz
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_star_glow_1
				param = star_glow_id}
			<star_glow_id> :obj_spawnscript ui_shakey
		else
			ScriptAssert \{'dschorn1'}
		endif
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_blue_glow
				param = blue_glow_id}
			<blue_glow_id> :obj_spawnscript ui_pulse5
		else
			ScriptAssert \{'dschorn1'}
		endif
	endif
	if ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		<show_next_song_ui> = 1
		if InNetGame
			GetNumPlayers
			get_local_players_in_game
			if (<num_local_players> >= <num_players>)
				<show_next_song_ui> = 0
			endif
		endif
		if ScriptIsRunning \{sysnotify_handle_song_load_failed}
			<show_next_song_ui> = 0
		endif
		if (<show_next_song_ui> = 1)
			<temp_song_title> = <song_title>
			playlist_getcurrentsong
			get_song_title song = <current_song>
			formatText TextName = song_title_with_quotes qs(0x9d40624b) s = <song_title>
			song_breakdown_noncompetitive_id :se_setprops {
				next_song_cont_alpha = 1.0
				next_song_text_2_text = <song_title_with_quotes>
			}
			<song_title> = <temp_song_title>
		endif
	endif
	if (<Type> = career)
		if NOT ininternetmode
			get_savegame_from_player Player = ($g_net_leader_player_num)
		else
			get_savegame_from_controller controller = ($primary_controller)
		endif
		<current_chapter> = ($current_chapter)
		quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <current_chapter>
		if isSinglePlayerGame
			getstarsfromdetailedstats Player = ($g_net_leader_player_num)
		else
			getplayerinfo ($g_net_leader_player_num) Band
			<stars> = ($song_stats_backup_band [(<Band> - 1)].stars)
		endif
		apply_blue_flame = 0
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = encore_unlocked
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = completed
		if (<encore_unlocked> = 1 && <completed> = 0)
			apply_blue_flame = 1
		endif
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = quest_chapter_finale param = completed
		stop_at_blue = 1
		if (<completed> = 1)
			stop_at_blue = 0
		endif
		if (<stars_earned> >= ($<current_chapter>.stars_for_reward))
			stars = 0
		endif
		song_breakdown_apply_career_medallion_progress {
			song_stars_earned = <stars>
			current_total_stars = <stars_earned>
			stars_needed_for_transform = ($<current_chapter>.stars_for_encore)
			stars_needed_for_max = ($<current_chapter>.stars_for_reward)
			apply_initial = 1
			force_stats_finished_animating = 1
			stop_at_blue = <stop_at_blue>
			encore_completed = <completed>
			apply_blue_flame = <apply_blue_flame>
		}
	endif
	if ($ui_song_breakdown_already_animated_stats = 1)
		if isSinglePlayerGame
			if (<Type> = freeplay)
				freeplay_get_first_active_player
			else
				getfirstplayer
			endif
			getstarsfromdetailedstats Player = <Player>
			if (<Type> = quickplay)
				song_breakdown_noncompetitive_id :se_setprops \{challenge_frame_alpha = 1.0
					points_frame_alpha = 1.0}
				quickplay_get_overall_awards_progress Player = <Player>
				quickplay_get_recent_award_points Player = <Player>
				<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
				quickplay_find_award_point_level award_points = <starting_award_points_total>
				<previous_award_point_level> = <award_point_level>
				quickplay_find_award_point_level award_points = <current_award_points_total>
				quickplay_get_outro_percentages {
					previous_points = <starting_award_points_total>
					current_points = <current_award_points_total>
					previous_level = <previous_award_point_level>
					current_level = <award_point_level>
					recent = <recent_award_points>
				}
				<award_points_percentage> = (<end_percentage> * 100.0)
				CastToInteger \{award_points_percentage}
				formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <current_award_points_total>)
				formatText TextName = level_text qs(0x801f5b44) l = (<award_point_level> + 1)
				<award_points_scale> = ((<award_points_percentage> * 1.0) / 100.0)
				formatText TextName = award_points_song_main_text qs(0xc85cae43) a = <recent_award_points>
				formatText TextName = total_points_main_text qs(0x0204c31d) t = <current_award_points_total> usecommas
				<max_level_params> = {}
				if (<at_max_level> = 1)
					AddParam \{structure_name = max_level_params
						Name = stars_to_next_level_alpha
						value = 0.0}
					AddParam \{structure_name = max_level_params
						Name = max_level_text_alpha
						value = 1.0}
					<award_points_scale> = 1.0
				endif
				song_breakdown_noncompetitive_id :se_setprops {
					award_points_label_text = <level_text>
					award_points_percentage_text = <percentage_text>
					award_points_percentage_alpha = 1
					award_points_fill_pos = (((1.0, 0.0) * (<award_points_scale> * <meter_width> - 263.0)) + ((0.0, 1.0) * 5))
					award_points_song_main_text = <award_points_song_main_text>
					total_points_main_text = <total_points_main_text>
					<max_level_params>
				}
			endif
		else
			get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
			if (<player_num> != -1)
				<Player> = <player_num>
			else
				getfirstplayer \{on_screen
					local}
				printf \{qs(0xac40001b)}
			endif
			getplayerinfo <Player> Band
			<stars> = ($song_stats_backup_band [(<Band> - 1)].stars)
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_stats_arrows_spawned}
		endif
		if (<Type> = career)
			song_breakdown_noncompetitive_id :se_setprops \{meter_transform_scale = (0.75, 0.75)
				frame_anim_pos = (0.0, 0.0)
				frame_anim_alpha = 1.0}
			if NOT ininternetmode
				get_savegame_from_player Player = ($g_net_leader_player_num)
			else
				get_savegame_from_controller controller = ($primary_controller)
			endif
			<current_chapter> = ($current_chapter)
			quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <current_chapter>
			if isSinglePlayerGame
				getstarsfromdetailedstats Player = <Player>
			else
				getplayerinfo <Player> Band
				<stars> = ($song_stats_backup_band [(<Band> - 1)].stars)
			endif
			apply_blue_flame = 0
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = encore_unlocked
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = completed
			if (<encore_unlocked> = 1 && <completed> = 0)
				apply_blue_flame = 1
			endif
			quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = quest_chapter_finale param = completed
			stop_at_blue = 1
			if (<completed> = 1)
				stop_at_blue = 0
			endif
			song_breakdown_apply_career_medallion_progress {
				song_stars_earned = <stars>
				current_total_stars = <stars_earned>
				stars_needed_for_transform = ($<current_chapter>.stars_for_encore)
				stars_needed_for_max = ($<current_chapter>.stars_for_reward)
				force_stats_finished_animating = 1
				stop_at_blue = <stop_at_blue>
				encore_completed = <completed>
				apply_blue_flame = <apply_blue_flame>
			}
		endif
		formatText TextName = stars_text qs(0x73307931) s = <stars>
		song_breakdown_noncompetitive_id :se_setprops stars_number_text = <stars_text>
		song_breakdown_noncompetitive_id :Obj_SpawnScriptNow anim_star_wiggle_loop params = {game_type = <Type>}
		song_breakdown_noncompetitive_id :SetTags num_stars = <stars>
	endif
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	song_breakdown_assign_band_data song_name = <song_title>
	Change \{net_song_breakdown_timer_screen_id = song_breakdown_noncompetitive_id}
	<add_button_pills> = 1
	ui_song_breakdown_setup_handler_scripts {<...> add_button_pills = <add_button_pills>}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_add_page_counters
		if ($is_network_game = 1)
		endif
	endif
	if (<achieved_gold_stars> = 1)
		song_breakdown_noncompetitive_id :se_setprops \{song_summary_star_rgba = violet_md}
	endif
	display_rival_add_available_notification
endscript

script ui_song_breakdown_normal_animate_stats \{num_stars = !i1768515945}
	<previous_song_stars> = 0
	gamemode_gettype
	if (<Type> = quickplay)
		getfirstplayer
		quickplay_get_challenge_outro_stats Player = <Player>
		GetArraySize <player_challenge_stats>
		song_breakdown_noncompetitive_id :se_setprops \{points_frame_alpha = 1.0}
		if (<array_Size> > 0)
			<previous_song_stars> = (<player_challenge_stats> [0].previous_song_stars)
		endif
	endif
	if (<num_stars> > 0)
		gamemode_gettype
		<i> = 1
		<song_star_diff> = 0
		audio_ui_outro_stars_logic num_stars = <num_stars>
		sfx_backgrounds_new_area \{BG_SFX_Area = FrontEnd
			fadeintime = 4
			fadeintype = linear
			fadeouttime = 4
			fadeouttype = linear}
		One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 1 immediate = <immediate>
		KillSpawnedScript \{Name = audio_crowd_play_quiet_crowd_one_shots}
		SpawnScriptNow \{audio_crowd_play_swells_during_stats_screen}
		setsoundbussparams {
			Crowd = {
				vol = (($default_BussSet.Crowd.vol) - 15) pitch = 0.0
			}
			time = 3
		}
		<stage_speeds> = [
			{
				fly_speed = 0.2
				scale_speed = 0.05
			}
			{
				fly_speed = 0.16
				scale_speed = 0.04
			}
			{
				fly_speed = 0.120000005
				scale_speed = 0.03
			}
			{
				fly_speed = 0.08
				scale_speed = 0.02
			}
			{
				fly_speed = 0.04
				scale_speed = 0.01
			}
		]
		<j> = 0
		<ramp_up_stars> = 3
		if (<num_stars> < 2)
			<number_of_stars> = 2
		else
			<number_of_stars> = <num_stars>
		endif
		<counting_stars> = 0
		casttofloat \{number_of_stars}
		casttofloat \{counting_stars}
		begin
		PlaySound stats_screen_star_whoosh buss = Front_End pitch = ((<counting_stars> / (<number_of_stars> -1)) * 5)
		PlaySound stats_screen_stars_loop buss = Front_End num_loops = -1 vol = (((<counting_stars> / (<number_of_stars> -1)) * 10) - 10) pitch = ((<counting_stars> / (<number_of_stars> -1)) * 5)
		printf channel = sfx qs(0x73307931) s = (<counting_stars> / (<number_of_stars> -1))
		printf channel = sfx qs(0x73307931) s = <counting_stars>
		printf channel = sfx qs(0x73307931) s = <number_of_stars>
		<r> = RandomInteger (90.0, -360.0)
		song_breakdown_noncompetitive_id :se_setprops {
			flying_star_pos = (0.0, 0.0)
			flying_star_rot_angle = <r>
			motion = ease_in
			time = (<stage_speeds> [<j>].fly_speed)
		}
		song_breakdown_noncompetitive_id :se_waitprops
		formatText TextName = stars_text qs(0xc31d83ea) i = <i>
		if (<i> > <previous_song_stars>)
			<song_star_diff> = (<song_star_diff> + 1)
		endif
		formatText TextName = award_points_song_main_text qs(0x0085244b) i = <song_star_diff>
		song_breakdown_noncompetitive_id :se_setprops {
			stars_number_text = <stars_text>
			stars_number_scale = 2.0
			song_summary_star_scale = 1.5
			song_summary_star2_scale = 1.0
			star_glow_1_alpha = 1
			star_glow_1_scale = 1.3
			time = (<stage_speeds> [<j>].scale_speed)
			award_points_song_main_text = <award_points_song_main_text>
		}
		song_breakdown_noncompetitive_id :se_waitprops
		song_breakdown_noncompetitive_id :se_setprops {
			stars_number_scale = 1.0
			song_summary_star_scale = 1.0
			song_summary_star2_scale = 1.0
			star_glow_1_alpha = 1
			star_glow_1_scale = 1.1
			motion = ease_out
			time = (<stage_speeds> [<j>].fly_speed)
		}
		song_breakdown_noncompetitive_id :se_waitprops
		song_breakdown_noncompetitive_id :se_setprops \{flying_star_pos = (363.0, -621.0)}
		song_breakdown_noncompetitive_id :se_waitprops
		<i> = (<i> + 1)
		<counting_stars> = (<counting_stars> + 1)
		if ((<i> / <ramp_up_stars>) < 1)
			<j> = 0
		elseif ((<i> / <ramp_up_stars>) < 2)
			<j> = 1
		elseif ((<i> / <ramp_up_stars>) < 3)
			<j> = 2
		elseif ((<i> / <ramp_up_stars>) < 4)
			<j> = 3
		else
			<j> = 4
		endif
		repeat <num_stars>
		SoundEvent \{event = stats_screen_last_star_hit}
		stopsound \{stats_screen_stars_loop}
		song_breakdown_noncompetitive_id :SetTags current_song_star_total = <song_star_diff>
		if (<Type> = quickplay)
			if song_breakdown_is_single_player_game
				song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{create_ui_star_particles
					params = {
						Pos = (218.0, 450.0)
					}}
			endif
		endif
		if (<Type> = career)
			if song_breakdown_is_single_player_game
				song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{create_ui_star_particles
					params = {
						Pos = (218.0, 450.0)
					}}
			endif
		endif
		song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{create_ui_star_particles_multi
			params = {
				Pos = (308.0, 320.0)
			}}
		gamemode_gettype
		song_breakdown_noncompetitive_id :Obj_SpawnScriptNow anim_star_wiggle_loop params = {game_type = <Type>}
	else
		formatText TextName = stars_text qs(0xc31d83ea) i = <num_stars>
		song_breakdown_noncompetitive_id :se_setprops {
			stars_number_text = <stars_text>
		}
		song_breakdown_noncompetitive_id :SetTags current_song_star_total = <num_stars>
	endif
	song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{challenge_frame}
	song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{career_meter_anim_in}
	SpawnScriptNow \{audio_crowd_kill_only_one_shots}
	gamemode_gettype
	getfirstplayer \{on_screen
		local}
	if song_breakdown_is_single_player_game
		if (<Type> = quickplay)
			quickplay_get_overall_awards_progress Player = <Player>
			if (<next_award_points_threshold> <= 0)
				<award_points_percentage> = 1.0
			else
				<award_points_percentage> = (((<current_award_points_total> * 1.0) / (<next_award_points_threshold> * 1.0)) * 100)
			endif
			CastToInteger \{award_points_percentage}
			<award_points_scale> = ((<award_points_percentage> * 1.0) / 100.0)
			song_breakdown_noncompetitive_id :GetSingleTag \{qp_num_badges}
			if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_quickplay_bonus_badge_menu_top
					param = top_badge_menu_id}
				song_breakdown_reveal_qp_badges badge_menu_id = <top_badge_menu_id> Player = <Player>
			endif
			Wait \{0.25
				Seconds}
			song_breakdown_noncompetitive_id :se_setprops \{you_rock_power_challenge_scale = (1.5, 1.5)
				time = 0.3
				motion = smooth}
			Wait \{0.3
				Seconds}
			song_breakdown_noncompetitive_id :se_setprops \{you_rock_power_challenge_scale = (0.9, 0.9)
				time = 0.1
				motion = ease_in}
			Wait \{0.1
				Seconds}
			song_breakdown_noncompetitive_id :se_setprops \{you_rock_power_challenge_scale = (1.1, 1.1)
				time = 0.1
				motion = ease_out}
			Wait \{0.1
				Seconds}
			song_breakdown_noncompetitive_id :se_setprops \{you_rock_power_challenge_scale = (0.95, 0.95)
				time = 0.1
				motion = ease_in}
			Wait \{0.1
				Seconds}
			Wait \{0.5
				Seconds}
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow {
				song_breakdown_animate_award_points_text_spawned
				params = {
					Player = <Player>
					total_time = (<award_points_scale> * 3.0)
				}
			}
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow {
				song_breakdown_animate_award_points_meter_spawned
				params = {
					Player = <Player>
					total_time = (<award_points_scale> * 3.0)
				}
			}
		endif
	else
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (120.0, 240.0)
			time = 0.3
			motion = ease_in}
		SpawnScriptNow \{audio_song_break_down_whoosh
			params = {
				whoosh = 1
			}}
		Wait \{0.3
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (120.0, 290.0)
			time = 0.2
			motion = ease_out}
		Wait \{0.2
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{center_column_pos = (120.0, 260.0)
			time = 0.2
			motion = ease_in}
		Wait \{0.2
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1030.0, -5.0)
			time = 0.3
			motion = ease_in}
		SpawnScriptNow \{audio_song_break_down_whoosh
			params = {
				whoosh = 2
				delay = 0.2
			}}
		Wait \{0.3
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1030.0, 45.0)
			time = 0.2
			motion = ease_out}
		Wait \{0.2
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{right_column_pos = (1030.0, 20.0)
			time = 0.2
			motion = ease_in}
		Wait \{0.2
			Seconds}
		song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_stats_arrows_spawned}
	endif
	if (<Type> = career)
		get_savegame_from_controller controller = ($primary_controller)
		<current_chapter> = ($current_chapter)
		quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <current_chapter>
		apply_blue_flame = 0
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = encore_unlocked
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = completed
		if (<encore_unlocked> = 1 && <completed> = 0)
			apply_blue_flame = 1
		endif
		quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = quest_chapter_finale param = completed
		stop_at_blue = 1
		if (<completed> = 1)
			stop_at_blue = 0
		endif
		song_breakdown_apply_career_medallion_progress {
			wait_time = 0.1
			song_stars_earned = <num_stars>
			current_total_stars = <stars_earned>
			stars_needed_for_transform = ($<current_chapter>.stars_for_encore)
			stars_needed_for_max = ($<current_chapter>.stars_for_reward)
			force_stats_finished_animating = 0
			animating_callback = song_breakdown_medallion_transform_animating_callback
			stop_at_blue = <stop_at_blue>
			encore_completed = <completed>
			apply_blue_flame = <apply_blue_flame>
		}
	endif
	song_breakdown_noncompetitive_id :SetTags \{stats_finished_animating = 1}
endscript

script song_breakdown_medallion_transform_animating_callback 
	if NOT quest_progression_is_chapter_rush
		<current_chapter> = ($current_chapter)
		<hero_info> = ($<current_chapter>.hero_info)
		quest_get_char_icon hero_name_nl = ($<hero_info>.name_nl) chapter_name = <current_chapter>
		song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_meter_transform}
		<resolved_id> :se_setprops icon_character_texture = <character_trans_texture>
	endif
endscript

script song_breakdown_add_page_counters 
	gamemode_gettype
	<i> = 0
	GetArraySize ($g_song_breakdown_noncompetitive_stats_order)
	<stats_count> = 0
	begin
	if StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<i>].visibility) <Type>
		<stats_count> = (<stats_count> + 1)
	endif
	if ($last_song_played = jamsession)
		if StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<i>].visibility) exclude_jam
			<stats_count> = (<stats_count> - 1)
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	song_breakdown_noncompetitive_id :SetTags num_dots = <stats_count>
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_page_counter}
			GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> < <stats_count>)
				begin
				CreateScreenElement {
					parent = <resolved_id>
					Type = SpriteElement
					texture = dot_64
					rgba = gh6_red_xdk
					alpha = 0.4
					dims = (15.0, 15.0)
					just = [center , center]
					pos_anchor = [left , top]
					z_priority = 4
				}
				repeat (<stats_count> - <array_Size>)
			endif
		endif
	endif
endscript

script song_breakdown_assign_strips_data 
	gamemode_gettype
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :GetSingleTag \{display_stats_index}
		song_breakdown_noncompetitive_id :GetSingleTag \{dot}
		song_breakdown_noncompetitive_id :se_setprops {
			stat_title_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].title_text)
		}
		if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_page_counter}
			GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if (<array_Size> > 0)
				<i> = 0
				begin
				if (<i> = <dot>)
					<dot_alpha> = 1
				else
					<dot_alpha> = 0.4
				endif
				(<children> [<i>]) :se_setprops alpha = <dot_alpha>
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		if (<Type> = freeplay)
			freeplay_get_num_active_players
			<num_players> = <num_active_players>
		else
			getnumplayersingame
		endif
		if (<num_players> > 0)
			if (<Type> = freeplay)
				freeplay_get_first_active_player
			else
				getfirstplayer
			endif
			<i> = 1
			begin
			formatText checksumName = player_stats_bg_panel 'alias_song_summary_playerStats_BG_%i' i = <i>
			if song_breakdown_noncompetitive_id :desc_resolvealias Name = <player_stats_bg_panel>
				DestroyScreenElement id = <resolved_id> preserve_parent
				song_breakdown_get_stat_value_and_instrument player_num = <Player> stat_index = <display_stats_index>
				<accuracy_caption_text> = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].caption_text)
				<percent_symbol_alpha> = (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].use_unit_text) * 0.7)
				if (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = score)
					<stat_desc_name> = 'song_summary_player_score'
				elseif (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = challenge)
					if (<Type> = quickplay)
						<stat_desc_name> = 'song_summary_player_qp_challenge'
					endif
				elseif (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = unlock_level)
					<stat_desc_name> = 'song_summary_player_qp_unlock'
				else
					<stat_desc_name> = 'song_summary_player_accuracy'
					getplayerinfo <Player> part
					if (<part> = vocals)
						if (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = streak)
							<accuracy_caption_text> = qs(0xb37e4ad9)
						elseif (($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].Name) = accuracy)
							if (<use_percent_symbol> = 0)
								<percent_symbol_alpha> = 0
							endif
						endif
					endif
				endif
				formatText checksumName = strip_rgba 'p%i_lt' i = <i>
				CreateScreenElement {
					parent = <resolved_id>
					Type = descinterface
					desc = <stat_desc_name>
					pos_anchor = [left , top]
					just = [left , top]
					Pos = (10.0, 0.0)
					icon_instrument_texture = <instrument_icon>
					icon_instrument_rgba = <instrument_rgba>
					accuracy_text = <stat_text>
					strip_rgba = <strip_rgba>
					accuracy_caption_text = <accuracy_caption_text>
					percent_symbol_alpha = <percent_symbol_alpha>
					percent_symbol_text = ($g_song_breakdown_noncompetitive_stats_order [<display_stats_index>].unit_text)
					z_priority = 3
					autosizedims = true
				}
				if (<stat_desc_name> = 'song_summary_player_challenge')
					<strip_id> = <id>
					<strip_id> :se_getprops
					if <strip_id> :desc_resolvealias Name = alias_hud_meter_challenge param = challenge_meter_id
						if NOT <challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
							ScriptAssert \{'Assert'}
						endif
						<dx> = (360.0 / ($challange_meter_num_ticks))
						<degree> = 0
						<cnt> = 0
						begin
						CreateScreenElement {
							Type = SpriteElement
							parent = <led_container>
							alpha = 0.0
							pos_anchor = [center center]
							rot_angle = <degree>
							Pos = (0.0, 0.0)
							texture = meter_challenge_led
						}
						<degree> = (<degree> + <dx>)
						<cnt> = (<cnt> + 1)
						repeat ($challange_meter_num_ticks)
						if ($end_credits > 0)
							<challenge_applicable> = 0
						else
							song_breakdown_check_if_challenge_applicable {
								challenge = <current_challenge>
								Player = <Player>
							}
						endif
						if (<challenge_applicable> = 1)
							if (<is_band_challenge> = 1)
								<current_player> = <Player>
								if (<Type> = freeplay)
									freeplay_get_first_active_player
								else
									getfirstplayer \{on_screen}
								endif
								<first_player> = <Player>
								<Player> = <current_player>
								gman_getdata goal = <current_challenge> Player = <first_player> Name = meter_high
							else
								gman_getdata goal = <current_challenge> Player = <Player> Name = meter_high
							endif
							song_breakdown_get_highest_completed_challenge_level {
								gold_level = (($<current_challenge>.gold_descrip) * 1.0)
								platinum_level = (($<current_challenge>.platinum_descrip) * 1.0)
								diamond_level = (($<current_challenge>.diamond_descrip) * 1.0)
								current_progress = (<meter_high> * 1.0)
								is_targeting_friend = 0
							}
							fill_challenge_meter_to percent = <percent_to_next> Player = <Player> level = <highest_completed> challenge_meter_id = <challenge_meter_id>
							<strip_id> :se_setprops challenge_na_text_alpha = 0
						else
							<strip_id> :se_setprops challenge_na_text_alpha = 1
						endif
					endif
				elseif (<stat_desc_name> = 'song_summary_player_qp_challenge')
					song_breakdown_apply_quickplay_badges_multi_player {
						Player = <Player>
						panel_id = <id>
					}
				elseif (<stat_desc_name> = 'song_summary_player_qp_unlock')
					song_breakdown_fill_qp_unlock_meter_multi_player {
						Player = <Player>
						panel_id = <id>
						text_color = {
							Color = <strip_rgba>
						}
					}
				endif
				ui_song_breakdown_get_player_display_name player_index = <Player>
				formatText checksumName = player_name_checksum 'p%i_name_text' i = <i>
				AddParam structure_name = player_name Name = <player_name_checksum> value = <player_name_text>
				formatText checksumName = player_name_rgba_checksum 'p%i_name_rgba' i = <i>
				AddParam structure_name = player_name Name = <player_name_rgba_checksum> value = <strip_rgba>
				formatText checksumName = player_name_bg_rgba 'p%i_name_BG_rgba' i = <i>
				formatText checksumName = player_name_bg_rgba_val 'p%i_md' i = <i>
				AddParam structure_name = player_name Name = <player_name_bg_rgba> value = <player_name_bg_rgba_val>
				song_breakdown_noncompetitive_id :se_setprops {
					<player_name>
				}
				<leader_icon_alpha> = 0
				getplayerinfo <Player> controller
				if InNetGame
					<player_controller> = <controller>
					getplayerinfo ($g_net_leader_player_num) controller
					if (<player_controller> = <controller>)
						<leader_icon_alpha> = 1
						<controller> = <player_controller>
					endif
				else
					if (<controller> = ($primary_controller))
						<leader_icon_alpha> = 1
					endif
				endif
				formatText checksumName = leader_icon_alpha_checksum 'leader_icon_p%i_alpha' i = <i>
				AddParam structure_name = leader_icon Name = <leader_icon_alpha_checksum> value = <leader_icon_alpha>
				if (<leader_icon_alpha> = 0)
					formatText checksumName = leader_icon_dims_checksum 'leader_icon_p%i_dims' i = <i>
					AddParam structure_name = leader_icon Name = <leader_icon_dims_checksum> value = (0.0, 0.0)
				endif
				song_breakdown_noncompetitive_id :se_setprops {
					<leader_icon>
				}
			endif
			if (<Type> = freeplay)
				freeplay_get_next_active_player Player = <Player>
			else
				getnextplayer Player = <Player>
			endif
			<i> = (<i> + 1)
			repeat <num_players>
		endif
	endif
endscript

script song_breakdown_remove_strip_for_dropped_player 
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		ui_song_breakdown_hide_player_data
		song_breakdown_assign_strips_data
	endif
endscript

script song_breakdown_get_stat_value_and_instrument \{player_num = !i1768515945
		stat_index = !i1768515945}
	<use_percent_symbol> = 1
	ui_song_breakdown_get_basic_player_data player_index = <player_num> no_units
	getplayerinfo <player_num> part
	switch ($g_song_breakdown_noncompetitive_stats_order [<stat_index>].Name)
		case accuracy
		<stat_text> = <percent_text>
		case score
		<stat_text> = <score_text>
		case streak
		<stat_text> = <streak_text>
		case multiplier
		getplayerinfo <player_num> highest_multiplier
		formatText TextName = stat_text qs(0x99046a05) m = <highest_multiplier>
		if (<part> = vocals)
			if (<vocal_phrase_max_qual> <= 0)
				<stat_text> = qs(0x6a5cf46c)
			endif
		endif
		case challenge
		<stat_text> = qs(0x7d85a5c3)
		case unlock_level
		<stat_text> = qs(0x7d85a5c3)
		case roadie_assist
		formatText TextName = stat_text qs(0x0bc409e2) a = ($song_stats_backup [(<player_num> - 1)].roadie_assist)
		default
		ScriptAssert \{'could not find stat to display'}
	endswitch
	if (<part> = vocals)
		if (<vocal_phrase_max_qual> <= 0)
			<use_percent_symbol> = 0
		endif
	endif
	return stat_text = <stat_text> instrument_icon = <icon_texture> use_percent_symbol = <use_percent_symbol>
endscript

script song_breakdown_scroll_stats \{direction = !q1768515945
		device_num = !i1768515945}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :GetSingleTag \{stats_finished_animating}
		if (<stats_finished_animating> = 1)
			if (<device_num> = ($primary_controller))
				gamemode_gettype
				song_breakdown_noncompetitive_id :GetSingleTag \{display_stats_index}
				song_breakdown_noncompetitive_id :GetSingleTag \{dot}
				song_breakdown_noncompetitive_id :GetSingleTag \{num_dots}
				<new_stat_index_found> = 0
				GetArraySize ($g_song_breakdown_noncompetitive_stats_order)
				if ($last_song_played = jamsession)
					<array_Size> = (<array_Size> - 1)
				endif
				if ((<direction> = left) || (<direction> = up))
					song_breakdown_noncompetitive_id :Obj_KillSpawnedScript \{Name = ui_song_breakdown_pulse_stats_arrows_spawned}
					song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_scroll_left_arrow_spawned}
					song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_stats_arrows_spawned
						params = {
							delayed = 1
						}}
					<unit_to_add> = -1
					<dot> = (<dot> - 1)
				else
					song_breakdown_noncompetitive_id :Obj_KillSpawnedScript \{Name = ui_song_breakdown_pulse_stats_arrows_spawned}
					song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_scroll_right_arrow_spawned}
					song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_stats_arrows_spawned
						params = {
							delayed = 1
						}}
					<unit_to_add> = 1
					<dot> = (<dot> + 1)
				endif
				if (<dot> < 0)
					<dot> = (<num_dots> - 1)
				elseif (<dot> >= <num_dots>)
					<dot> = 0
				endif
				song_breakdown_noncompetitive_id :SetTags dot = <dot>
				<new_display_stats_index> = (<display_stats_index> + <unit_to_add>)
				begin
				if (<new_display_stats_index> < 0)
					<new_display_stats_index> = (<array_Size> - 1)
				elseif (<new_display_stats_index> >= <array_Size>)
					<new_display_stats_index> = 0
				endif
				if ($end_credits > 0)
					if NOT StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<new_display_stats_index>].visibility) end_credits
						<new_display_stats_index> = (<new_display_stats_index> + <unit_to_add>)
					else
						<new_stat_index_found> = 1
						break
					endif
				else
					if NOT StructureContains structure = ($g_song_breakdown_noncompetitive_stats_order [<new_display_stats_index>].visibility) <Type>
						<new_display_stats_index> = (<new_display_stats_index> + <unit_to_add>)
					else
						<new_stat_index_found> = 1
						break
					endif
				endif
				repeat <array_Size>
				if (<new_stat_index_found> = 1)
					song_breakdown_noncompetitive_id :SetTags display_stats_index = <new_display_stats_index>
					song_breakdown_assign_strips_data
				endif
				switch <direction>
					case up
					case right
					ui_sfx \{menustate = Generic
						uitype = scrollup}
					case down
					case left
					ui_sfx \{menustate = Generic
						uitype = scrolldown}
				endswitch
			endif
		endif
	endif
endscript
song_breakdown_countdown_time = -1
song_breakdown_countdown_time_added = 0

script net_ui_song_breakdown_wait_for_timer \{timer_text = qs(0xea4574ef)
		use_button_pill = 1}
	if ($song_breakdown_countdown_time = -1)
		Change song_breakdown_countdown_time = ($net_song_breakdown_countdown_time)
	endif
	($net_song_breakdown_timer_screen_id) :se_setprops {
		net_timer_text_alpha = 0.0
	}
	if (<use_button_pill> = 1)
		formatText TextName = timer_msg qs(0x7ec60bb6) t = <timer_text> d = ($song_breakdown_countdown_time)
		add_user_control_helper text = <timer_msg> button = None z = 100000
	else
		if NOT GotParam \{property_text_chksum}
			ScriptAssert \{'No property to add the timer text to!'}
		endif
		if NOT GotParam \{property_alpha_chksum}
			ScriptAssert \{'No property to change the timer text alpha!'}
		endif
		<params_struct> = {}
		formatText TextName = timer_text qs(0x48c6d14c) d = ($song_breakdown_countdown_time)
		AddParam structure_name = params_struct Name = <property_text_chksum> value = <timer_text>
		AddParam structure_name = params_struct Name = <property_alpha_chksum> value = 1.0
		($net_song_breakdown_timer_screen_id) :se_setprops {
			<params_struct>
		}
	endif
	<requested_count> = 0
	begin
	if ($song_breakdown_countdown_time < 0)
		Change \{song_breakdown_countdown_time = 0}
	endif
	if (<use_button_pill> = 1)
		formatText TextName = timer_msg qs(0x7ec60bb6) t = <timer_text> d = ($song_breakdown_countdown_time)
		if ScreenElementExists id = <helper_pill_id>
			<helper_pill_id> :se_setprops {
				helper_description_text = <timer_msg>
			}
		else
			add_user_control_helper text = <timer_msg> button = None z = 100000
		endif
	else
		<params_struct> = {}
		formatText TextName = timer_text qs(0x48c6d14c) d = ($song_breakdown_countdown_time)
		AddParam structure_name = params_struct Name = <property_text_chksum> value = <timer_text>
		($net_song_breakdown_timer_screen_id) :se_setprops {
			<params_struct>
		}
	endif
	if (($song_breakdown_countdown_time) <= 0 && ($song_breakdown_countdown_time_added = 1 || $song_breakdown_countdown_time_added = 0))
		break
	elseif ($song_breakdown_countdown_time_added = 2)
		<requested_count> = (<requested_count> + 1)
		if (<requested_count> >= 3)
			break
		endif
	endif
	Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) - 1)
	Wait \{1
		Second}
	repeat
	ui_event_wait_for_safe
	($net_song_breakdown_timer_screen_id) :se_setprops block_events
	LaunchEvent Type = unfocus target = ($net_song_breakdown_timer_screen_id)
	Wait \{1
		Second}
	user_control_destroy_helper \{button = None}
	Change \{song_breakdown_countdown_time = -2}
	($net_song_breakdown_timer_screen_id) :se_setprops {
		net_timer_text_alpha = 0
	}
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		if ($shutdown_game_for_signin_change_flag = 1 || ($g_connection_loss_dialogue = 1 && $is_network_game = 1))
			wait_for_start_gem_scroller_completion
		endif
	endif
endscript

script set_net_song_breakdown_timer_running \{value = 0}
	Change net_song_breakdown_timer_running = <value>
endscript

script net_ui_song_breakdown_start_timer_spawned \{use_button_pill = 1
		screen_id = None
		continue_back_to_gameplay = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{net_song_breakdown_timer_running = 1}
	OnExitRun \{set_net_song_breakdown_timer_running
		params = {
			value = 0
		}}
	if (<screen_id> = None)
		Obj_GetID
		<screen_id> = <objID>
	endif
	Change net_song_breakdown_timer_screen_id = <screen_id>
	if (<use_button_pill> = 0)
		if NOT GotParam \{property_text_chksum}
			ScriptAssert \{'No property to add the timer text to!'}
		endif
		if NOT GotParam \{property_alpha_chksum}
			ScriptAssert \{'No property to change the timer text alpha!'}
		endif
	endif
	gamemode_gettype
	if ($is_network_game = 1)
		if NOT (<Type> = career && (($game_mode) = fest_mode) || (($game_mode) = fest_mode_team) || $g_net_quickplay_show_unlock_screen = 1)
			Change \{net_ready_to_start = 0}
		endif
	endif
	<timer_text> = qs(0xea4574ef)
	if (<Type> = quickplay && $g_net_quickplay_show_unlock_screen = 1)
		<timer_text> = qs(0x3ab87eab)
	endif
	net_ui_song_breakdown_wait_for_timer {
		use_button_pill = <use_button_pill>
		property_text_chksum = <property_text_chksum>
		property_alpha_chksum = <property_alpha_chksum>
		timer_text = <timer_text>
	}
	LaunchEvent Type = unfocus target = ($net_song_breakdown_timer_screen_id)
	if ($is_network_game = 1)
		if GotParam \{continue_to_next_song}
			if (<Type> = career)
				Change \{songtime_paused = 0}
				generic_event_back \{nosound
					state = Uistate_gameplay}
			elseif ($game_mode = fest_mode || $game_mode = fest_mode_team)
				display_competitive_rules_voting \{voting_callback = song_breakdown_back_to_gameplay}
			elseif (<Type> = pro_faceoff || <Type> = competitive)
				song_breakdown_back_to_gameplay
			elseif (<Type> = quickplay && $g_net_quickplay_show_unlock_screen = 1)
				generic_event_replace state = uistate_rewards_unlocked_qp data = {continue_back_to_gameplay = <continue_back_to_gameplay>}
			else
				generic_net_sync \{callback = net_song_breakdown_timer_complete_callback}
			endif
		elseif (<Type> = career)
			if IsHost
				getplayerinfo ($g_net_leader_player_num) controller
				net_ui_song_breakdown_continue_to_next_screen_gig_complete device_num = <controller>
			endif
		else
			net_ui_song_breakdown_go_to_setlist device_num = ($primary_controller)
		endif
	else
		if ((<Type> = career) || (<Type> = quickplay))
			net_song_breakdown_end_of_timer_transition_local <...>
		else
			net_song_breakdown_competitive_end_of_timer_transition_local <...>
		endif
	endif
endscript

script net_song_breakdown_timer_complete_callback 
	Change \{songtime_paused = 0}
	resetyieldinfo \{yield = FALSE}
	StopRendering
	gman_shutdowngamemodegoal
	gman_startgamemodegoal
	generic_event_back \{nosound
		state = Uistate_gameplay}
endscript

script net_song_breakdown_add_to_timer 
	if ($song_breakdown_countdown_time_added = 0 || $song_breakdown_countdown_time_added = 2)
		Change \{song_breakdown_countdown_time_added = 1}
		if IsHost
			Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
			SendStructure \{callback = net_song_breakdown_add_to_timer
				data_to_send = {
					None
				}}
		else
			Change song_breakdown_countdown_time = (($song_breakdown_countdown_time) + 30)
		endif
	endif
endscript

script net_song_breakdown_end_of_timer_transition_local 
	if GotParam \{end_of_setlist_transition}
		ui_song_breakdown_continue_to_next_screen_gig_complete
	elseif GotParam \{ENCORE_TRANSITION}
		ui_song_breakdown_continue_to_next_screen_encore
	elseif (GotParam add_setlist_continue_handlers)
		if (GotParam add_setlist_continue_handlers)
			ui_song_breakdown_continue_to_next_screen_song_transition
		endif
	endif
endscript

script song_breakdown_assign_band_data 
	RequireParams \{[
			song_name
		]
		all}
	challenge_text = qs(0x03ac90f0)
	band_challenge_alpha = 0
	gamemode_gettype
	if song_breakdown_is_single_player_game
		if (<Type> = freeplay)
			freeplay_get_first_active_player
		else
			getfirstplayer
		endif
		ui_song_breakdown_get_basic_player_data player_index = <Player>
		streak_caption_text = qs(0x9a210119)
		getplayerinfo <Player> part
		if (<part> = vocals)
			streak_caption_text = qs(0xb37e4ad9)
		endif
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_name>
			score_main_text = <score_text>
			accuracy_main_text = <percent_text>
			streak_main_text = <streak_text>
			streak_caption_text = <streak_caption_text>
		}
		if (<Type> = career)
			if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_hud_meter_challenge
					param = challenge_meter_id}
				if NOT <challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
					ScriptAssert \{'Assert'}
				endif
				<dx> = (360.0 / ($challange_meter_num_ticks))
				<degree> = 0
				<cnt> = 0
				begin
				CreateScreenElement {
					Type = SpriteElement
					parent = <led_container>
					alpha = 0.0
					pos_anchor = [center center]
					rot_angle = <degree>
					Pos = (0.0, 0.0)
					texture = meter_challenge_led
				}
				<degree> = (<degree> + <dx>)
				<cnt> = (<cnt> + 1)
				repeat ($challange_meter_num_ticks)
			endif
		else
			song_breakdown_noncompetitive_id :se_setprops \{hud_meter_challenge_alpha = 0}
			song_breakdown_apply_quickplay_badges_single_player badge_alpha = ($ui_song_breakdown_already_animated_stats)
		endif
	else
		get_local_in_game_player_num_from_controller controller_index = ($primary_controller)
		if (<player_num> != -1)
			getplayerinfo <player_num> Band
		else
			getfirstplayer \{on_screen
				local}
			getplayerinfo <Player> Band
			printf \{qs(0xac40001b)}
		endif
		b_note_streak = ($song_stats_backup_band [(<Band> - 1)].high_1p_streak)
		if (($song_stats_backup_band [(<Band> - 1)].high_2p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<Band> - 1)].high_2p_streak)
		endif
		if (($song_stats_backup_band [(<Band> - 1)].high_3p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<Band> - 1)].high_3p_streak)
		endif
		if (($song_stats_backup_band [(<Band> - 1)].high_4p_streak) > <b_note_streak>)
			b_note_streak = ($song_stats_backup_band [(<Band> - 1)].high_4p_streak)
		endif
		score = ($song_stats_backup_band [(<Band> - 1)].score)
		b_high_mult = ($song_stats_backup_band [(<Band> - 1)].high_mult)
		CastToInteger \{b_high_mult}
		CastToInteger \{score}
		formatText TextName = song_text qs(0x4d4555da) s = <song_name>
		formatText TextName = band_score_text qs(0xb22939c6) n = <score> DecimalPlaces = 0 usecommas
		formatText TextName = band_high_mult_text qs(0x2543b917) n = <b_high_mult>
		formatText TextName = band_high_note_streak qs(0xb22939c6) n = <b_note_streak>
		stars = ($song_stats_backup_band [(<Band> - 1)].stars)
		song_breakdown_noncompetitive_id :se_setprops {
			song_title_text = <song_text>
			score_main_text = <band_score_text>
			accuracy_main_text = <band_high_mult_text>
			accuracy_caption_text = qs(0x508d8110)
			streak_main_text = <band_high_note_streak>
			streak_caption_text = qs(0xf475f778)
		}
		if (<Type> = career)
			song_breakdown_noncompetitive_id :se_setprops \{band_multiplier_alpha = 0.0}
		endif
		if (<Type> = quickplay)
			if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_qp_band_award_cont
					param = qp_band_award_cont_id}
				quickplay_get_challenge_outro_stats \{Player = 0}
				GetArraySize <player_challenge_stats>
				if (<array_Size> > 0)
					gman_getdata \{goal = quickplay
						Name = targeted_challenge}
					if NOT checksumequals a = <targeted_challenge> b = NULL
						quickplay_targeting_player_get_result
						if NOT checksumequals a = <Result> b = not_targeting_player
							switch <Result>
								case success
								<you_rock_text> = qs(0x98a03633)
								case fail
								<you_rock_text> = qs(0x1e8ddef8)
								case tie
								<you_rock_text> = qs(0xdc65b6c7)
							endswitch
							quickplay_targeting_player_get_opponent_gamertag
							<opponent_gamertag> = <gamertag>
							NetSessionFunc func = get_gamertag params = {controller = ($primary_controller)}
							if (<opponent_gamertag> = <Name>)
								<gamertag_text> = qs(0xaacb668e)
							else
								formatText TextName = gamertag_text qs(0x5d9eae64) g = <opponent_gamertag>
							endif
						else
							gman_getdata \{goal = quickplay
								Name = targeted_challenge_inst_config}
							ExtendCrc <targeted_challenge> '_info' out = targeted_challenge_info
							if ((<targeted_challenge_inst_config> = Band) || (<targeted_challenge_inst_config> = traditional_band))
								formatText checksumName = player_challenge_id '%n' n = ($<targeted_challenge_info>.Name)
							else
								formatText checksumName = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.Name) p = ($g_leader_player_num)
							endif
							quickplay_get_grade goal_id = <player_challenge_id>
							switch (<pending_grade>)
								case 1
								<you_rock_text> = qs(0xbc96471a)
								case 2
								<you_rock_text> = qs(0x79485ae4)
								case 3
								<you_rock_text> = qs(0x9973028a)
								default
								<you_rock_text> = qs(0x03ac90f0)
							endswitch
							<i> = 0
							begin
							if (<targeted_challenge> = (<player_challenge_stats> [<i>]).goal_name)
								quickplay_get_challenge_name_string_from_checksum goal_name = ((<player_challenge_stats> [<i>]).goal_name) Player = ($g_leader_player_num)
								gamertag_text = <challenge_name_string>
							endif
							<i> = (<i> + 1)
							repeat <array_Size>
						endif
						song_breakdown_noncompetitive_id :se_setprops {
							you_rock_label_text = <you_rock_text>
							gamertag_label_text = <gamertag_text>
						}
						if (<array_Size> = 1)
							<badge_order> = [0]
						elseif (<array_Size> = 2)
							if (<targeted_challenge> = (<player_challenge_stats> [0]).goal_name)
								<badge_order> = [0 1]
							else
								<badge_order> = [1 0]
							endif
						elseif (<array_Size> = 3)
							if (<targeted_challenge> = (<player_challenge_stats> [0]).goal_name)
								<badge_order> = [1 0 2]
							elseif (<targeted_challenge> = (<player_challenge_stats> [1]).goal_name)
								<badge_order> = [0 1 2]
							else
								<badge_order> = [0 2 1]
							endif
						endif
					else
						song_breakdown_noncompetitive_id :se_setprops \{you_rock_fx_alpha = 0
							challenge_title_alpha = 1}
						<badge_order> = []
						<i> = 0
						begin
						AddArrayElement array = <badge_order> element = <i>
						<badge_order> = <array>
						<i> = (<i> + 1)
						repeat <array_Size>
					endif
					<i> = 0
					begin
					<index> = (<badge_order> [<i>])
					<is_targeted_challenge> = 0
					if NOT checksumequals a = <targeted_challenge> b = NULL
						if (<targeted_challenge> = (<player_challenge_stats> [<index>]).goal_name)
							<is_targeted_challenge> = 1
						endif
					endif
					song_breakdown_create_badge_and_apply_progress_to_meter {
						badge_parent_id = <qp_band_award_cont_id>
						challenge_stats = (<player_challenge_stats> [<index>])
						Player = 0
						badge_alpha = 1.0
						num_badges = <array_Size>
						is_band = 1
						is_targeted_challenge = <is_targeted_challenge>
					}
					<i> = (<i> + 1)
					repeat <array_Size>
				endif
			endif
		endif
	endif
	if ($ui_song_breakdown_already_animated_stats = 0)
		song_breakdown_noncompetitive_id :se_setprops \{stars_number_text = qs(0x03ac90f0)}
		song_breakdown_noncompetitive_id :SetTags num_stars = <stars>
		song_breakdown_noncompetitive_id :Obj_SpawnScriptNow ui_song_breakdown_normal_animate_stats params = {num_stars = <stars>}
		Change \{ui_song_breakdown_already_animated_stats = 1}
	endif
endscript

script song_breakdown_get_highest_completed_challenge_level \{gold_level = !f1768515945
		platinum_level = !f1768515945
		diamond_level = !f1768515945
		current_progress = !f1768515945
		is_targeting_friend = !i1768515945
		player_challenge_id = 0x00000000}
	<highest_completed> = 0
	if (<current_progress> >= <gold_level>)
		<highest_completed> = 1
	endif
	if (<current_progress> >= <platinum_level>)
		<highest_completed> = 2
	endif
	if (<current_progress> >= <diamond_level>)
		<highest_completed> = 3
	endif
	<friend_gamertag> = qs(0x03ac90f0)
	if (<is_targeting_friend> = 0)
		switch <highest_completed>
			case 3
			<percent_to_next> = 0
			case 2
			<percent_to_next> = (((<current_progress> - <platinum_level>) * 1.0) / ((<diamond_level> - <platinum_level>) * 1.0))
			case 1
			<percent_to_next> = (((<current_progress> - <gold_level>) * 1.0) / ((<platinum_level> - <gold_level>) * 1.0))
			case 0
			default
			<percent_to_next> = ((<current_progress> * 1.0) / (<gold_level> * 1.0))
		endswitch
	else
		<percent_to_next> = 0
		gman_getdata goal = quickplay Player = <Player> Name = targeted_challenge_friend_index
		gman_getdata goal = quickplay Player = <Player> Name = targeted_challenge_friend_scores
		<target_score> = ((<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>]).score)
		if (<target_score> > 0)
			<percent_to_next> = ((<current_progress> * 1.0) / (<target_score> * 1.0))
		endif
		<friend_gamertag> = ((<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>]).gamertag)
	endif
	return {
		highest_completed = <highest_completed>
		percent_to_next = <percent_to_next>
		friend_gamertag = <friend_gamertag>
	}
endscript

script song_breakdown_check_if_challenge_applicable 
	RequireParams \{[
			challenge
			Player
		]
		all}
	challenge_applicable = 0
	getplayerinfo <Player> part
	required_band = (($<challenge>).required_band)
	GetArraySize <required_band>
	if (<array_Size> > 0)
		if (<array_Size> = 1)
			switch (<required_band> [0])
				case lead
				if (<part> = guitar)
					challenge_applicable = 1
				endif
				case bass
				if (<part> = bass)
					challenge_applicable = 1
				endif
				case drum
				if (<part> = drum)
					challenge_applicable = 1
				endif
				case vocal
				if (<part> = vocals)
					challenge_applicable = 1
				endif
				default
				song_breakdown_check_if_band_challenge_applicable challenge = <challenge>
				challenge_applicable = <band_challenge_applicable>
			endswitch
			is_band_challenge = 0
		else
			song_breakdown_check_if_band_challenge_applicable challenge = <challenge>
			challenge_applicable = <band_challenge_applicable>
			is_band_challenge = 1
		endif
	endif
	return {
		challenge_applicable = <challenge_applicable>
		is_band_challenge = <is_band_challenge>
	}
endscript

script song_breakdown_check_if_band_challenge_applicable 
	RequireParams \{[
			challenge
		]
		all}
	band_challenge = 0
	getnumplayersingame
	GetArraySize (($<challenge>).required_band)
	if (<num_players> >= <array_Size>)
		<band_challenge> = 1
	endif
	return band_challenge_applicable = <band_challenge>
endscript

script ui_song_breakdown_setup_handler_scripts \{add_button_pills = 1}
	<continue_script> = nullscript
	<back_script> = nullscript
	<option_script> = nullscript
	<option2_script> = nullscript
	<pad_l1_script> = nullscript
	<continue_text> = qs(0x182f0173)
	<back_text> = qs(0x03ac90f0)
	<option_text> = qs(0x3f11367e)
	<option2_text> = qs(0x03ac90f0)
	<pad_l1_text> = qs(0x03ac90f0)
	<back_params> = {}
	<option_params> = {}
	<option2_params> = {}
	<pad_l1_params> = {}
	<transition_param> = None
	<can_scroll_stats> = 1
	<show_broadcast> = 0
	<message_id> = song_won
	<spawn_net_timer> = 0
	gamemode_gettype
	if GotParam \{end_of_setlist_transition}
		transition_param = end_of_setlist_transition
		if ($is_network_game = 1)
			GetNumPlayers
			get_local_players_in_game
			if NOT (<num_local_players> >= <num_players>)
				<continue_script> = net_ui_song_breakdown_continue_to_next_screen_gig_complete
			endif
			<back_script> = postgame_lobby_quit
			<back_params> = {id = song_breakdown_noncompetitive_id confirm_script = confirm_quit_online confirm_params = {save = 1}}
			<back_text> = qs(0x67d9c56d)
			if NOT (<num_local_players> >= <num_players>)
				<option_script> = song_breakdown_go_to_stats_from_transition
				<option_params> = {transition_param = <transition_param>}
			endif
			<option2_script> = net_ui_song_breakdown_show_players_list
			<option2_text> = qs(0xd16792bf)
			<option2_params> = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 0)
				<continue_text> = qs(0x03ac90f0)
			endif
		elseif is_current_song_a_jam_session
			wii_is_broadcast_allowed
			<show_broadcast> = <is_broadcast_allowed>
			<continue_script> = ui_song_breakdown_continue_to_next_screen_gig_complete
			playlist_getsize
			if (<playlist_size> = 1)
				<option2_script> = song_breakdown_retry_challenge
				<option2_text> = qs(0x5d8b66a0)
			endif
		else
			<continue_script> = ui_song_breakdown_continue_to_next_screen_gig_complete
			<option_script> = song_breakdown_go_to_stats_from_transition
			<option_params> = {transition_param = <transition_param>}
			if (<Type> = quickplay)
				playlist_getsize
				if (<playlist_size> = 1)
					<option2_script> = song_breakdown_retry_challenge
					<option2_text> = qs(0x5d8b66a0)
				endif
				wii_is_broadcast_allowed
				<show_broadcast> = <is_broadcast_allowed>
			elseif (<Type> = career)
				wii_is_broadcast_allowed
				if ($current_chapter = quest_chapter_finale)
					<show_broadcast> = <is_broadcast_allowed>
					<message_id> = career_complete
				elseif is_encore_song
					<show_broadcast> = <is_broadcast_allowed>
					<message_id> = encore_complete
				endif
			endif
			if is_roadie_battle_coop
				<option2_script> = song_breakdown_retry_challenge
				<option2_text> = qs(0x5d8b66a0)
			endif
		endif
		<transition_param> = end_of_setlist_transition
	elseif GotParam \{ENCORE_TRANSITION}
		<continue_script> = ui_song_breakdown_continue_to_next_screen_encore
		if ($is_network_game = 0)
			<option_script> = song_breakdown_go_to_stats_from_transition
		else
			<option2_script> = net_ui_song_breakdown_show_players_list
			<option2_text> = qs(0xd16792bf)
			<option2_params> = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			getplayerinfo ($g_net_leader_player_num) is_local_client
			if (<is_local_client> = 0)
				<continue_text> = qs(0x03ac90f0)
			endif
		endif
		<transition_param> = ENCORE_TRANSITION
	elseif ((GotParam continue_setlist_transition) || (GotParam add_setlist_continue_handlers))
		if GotParam \{continue_setlist_transition}
			<transition_param> = continue_setlist_transition
			<can_scroll_stats> = 0
		else
			<transition_param> = add_setlist_continue_handlers
		endif
		if (GotParam add_setlist_continue_handlers)
			if GotParam \{continue_setlist_transition}
				RemoveParameter \{continue_setlist_transition}
			endif
			wii_is_broadcast_allowed
			<show_broadcast> = <is_broadcast_allowed>
			<transition_param> = add_setlist_continue_handlers
			<can_scroll_stats> = 1
			if NOT InNetGame
				<continue_script> = ui_song_breakdown_continue_to_next_screen_song_transition
			endif
			if ($last_song_played != jamsession)
				if InNetGame
					GetNumPlayers
					get_local_players_in_game
					if NOT (<num_local_players> >= <num_players>)
						<option_script> = song_breakdown_go_to_stats_from_transition
						<option_params> = {transition_param = <transition_param>}
					endif
				else
					<option_script> = song_breakdown_go_to_stats_from_transition
					<option_params> = {transition_param = <transition_param>}
				endif
			endif
			if ($is_network_game = 1)
				<option2_script> = net_ui_song_breakdown_show_players_list
				<option2_text> = qs(0xd16792bf)
				<option2_params> = {
					screen_id = song_breakdown_noncompetitive_id
					destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
				}
				GetNumPlayers
				get_local_players_in_game
				if (<num_local_players> >= <num_players>)
					<back_script> = postgame_lobby_quit
					<back_params> = {id = song_breakdown_noncompetitive_id confirm_script = confirm_quit_online confirm_params = {save = 1}}
					<back_text> = qs(0x67d9c56d)
				else
					if NOT (GotParam no_timer)
						<spawn_net_timer> = 1
					endif
				endif
			endif
		endif
	elseif (GotParam net_transition_not_career)
		<transition_param> = net_transition_not_career
		if ($is_network_game = 1)
			GetNumPlayers
			get_local_players_in_game
			if NOT (<num_local_players> >= <num_players>)
				gamemode_gettype
				if (<Type> = quickplay && $g_net_quickplay_show_unlock_screen = 1)
					<spawn_net_timer> = 1
					spawn_timer_params = {
						continue_back_to_gameplay = 0
					}
				else
					<continue_script> = net_ui_song_breakdown_go_to_setlist
					<continue_text> = qs(0x182f0173)
				endif
				<option_script> = song_breakdown_go_to_stats_from_transition
				<option_text> = qs(0x3f11367e)
				<option_params> = {transition_param = <transition_param>}
			endif
			<option2_script> = net_ui_song_breakdown_show_players_list
			<option2_text> = qs(0xd16792bf)
			<option2_params> = {
				screen_id = song_breakdown_noncompetitive_id
				destroy_players_list_script = net_ui_song_breakdown_destroy_players_list
			}
			<back_script> = postgame_lobby_quit
			<back_params> = {id = song_breakdown_noncompetitive_id confirm_script = confirm_quit_online confirm_params = {save = 1}}
			<back_text> = qs(0x67d9c56d)
		endif
	else
		ScriptAssert \{'Invalid transition from song breakdown'}
	endif
	wii_is_broadcast_allowed
	<show_broadcast> = <is_broadcast_allowed>
	if isbandcheating
		show_broadcast = 0
	endif
	if isngc
		if (<transition_param> = continue_setlist_transition)
			<show_broadcast> = 0
		endif
	endif
	gamemode_gettype
	if (<show_broadcast> = 1 && <Type> = quickplay)
		if NOT isbandcheating
			if social_networks_broadcast_allowed
				if checksumequals a = <message_id> b = song_won
					if NOT is_current_song_a_jam_session
						if GMan_GoalIsActive \{goal = quickplay}
							gman_getdata \{goal = quickplay
								Name = targeted_challenge}
							if NOT checksumequals a = <targeted_challenge> b = NULL
								gman_getdata \{goal = quickplay
									Name = targeted_challenge_inst_config}
								ExtendCrc <targeted_challenge> '_info' out = targeted_challenge_info
								if ((<targeted_challenge_inst_config> = Band) || (<targeted_challenge_inst_config> = traditional_band))
									formatText checksumName = player_challenge_id '%n' n = ($<targeted_challenge_info>.Name)
									gman_getdata goal = <player_challenge_id> Name = current_progress
								else
									formatText checksumName = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.Name) p = ($g_leader_player_num)
									gman_getdata goal = <player_challenge_id> Player = ($g_net_leader_player_num) Name = current_progress
								endif
								switch <targeted_challenge>
									case qp_whammy_time
									case qp_sustain_time
									case qp_multiplier_time
									case qp_multiplier_time_band
									case qp_rockout_time
									case qp_spower_time
									case qp_spower_time_band
									current_progress = (<current_progress> / 1000.0)
									default
									if GotParam \{current_progress}
										tmp_progress = <current_progress>
										CastToInteger \{tmp_progress}
										current_progress = <tmp_progress>
									endif
								endswitch
								quickplay_get_grade goal_id = <player_challenge_id>
								if (<pending_grade> > 0)
									if song_breakdown_is_single_player_game
										message_id = beat_challenge
										if gman_ispowerscoreenabled
											message_id = beat_power_challenge
										endif
									else
										message_id = band_beat_challenge
									endif
									switch (<pending_grade>)
										case 1
										challenge_grade = gold
										case 2
										challenge_grade = platinum
										case 3
										challenge_grade = diamond
										default
										challenge_grade = gold
									endswitch
								endif
								quickplay_targeting_player_get_result
								if checksumequals a = <Result> b = success
									quickplay_targeting_player_get_opponent_gamertag
									if NOT ischecksum <gamertag>
										if song_breakdown_is_single_player_game
											message_id = beat_player_challenge
											if gman_ispowerscoreenabled
												message_id = beat_player_power_challenge
											endif
										else
											message_id = band_beat_player_challenge
										endif
										friend_gamertag = <gamertag>
									else
										message_id = song_won
										if gman_ispowerscoreenabled
											message_id = beat_power_challenge
										endif
									endif
								elseif NOT checksumequals a = <Result> b = not_targeting_player
									message_id = song_won
									if gman_ispowerscoreenabled
										message_id = beat_power_challenge
									endif
								endif
							endif
						endif
						if checksumequals a = <message_id> b = song_won
							if isSinglePlayerGame
								if NOT gman_ispowerscoreenabled
									getstarsfromdetailedstats Player = ($g_leader_player_num)
									if (<stars> > 5)
										message_id = song_won_full_combo
									endif
									get_percent_notes_hit player_index = ($g_leader_player_num)
									if (<percent_notes_hit> = 100 && <stars> < 6)
										message_id = song_won_100_percent
									endif
								endif
							endif
							if gman_ispowerscoreenabled
								message_id = beat_power_challenge
							endif
						endif
					endif
					if checksumequals a = <message_id> b = song_won
						if NOT song_breakdown_is_single_player_game
							message_id = band_song_won
						endif
					endif
				endif
				<pad_l1_text> = ($g_social_networks_broadcast_string)
				<pad_l1_script> = social_networks_choose_broadcast
				<pad_l1_params> = {
					message_id = <message_id>
					passed_variables = {
						challenge_type = <targeted_challenge>
						challenge_grade = <challenge_grade>
						challenge_player = <friend_gamertag>
						challenge_score = <current_progress>
					}
				}
			endif
		endif
	endif
	printf channel = wilson qs(0x9c6ebfa6) s = <transition_param>
	song_breakdown_noncompetitive_id :SetTags {
		transition_param = <transition_param>
	}
	if (<add_button_pills> != 0)
		if (GotParam no_wait)
			SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
				screen_element_id = song_breakdown_noncompetitive_id
				continue_script = <continue_script>
				back_script = <back_script>
				option_script = <option_script>
				option2_script = <option2_script>
				pad_l1_script = <pad_l1_script>
				continue_text = <continue_text>
				back_text = <back_text>
				option_text = <option_text>
				option2_text = <option2_text>
				pad_l1_text = <pad_l1_text>
				back_params = <back_params>
				option_params = <option_params>
				option2_params = <option2_params>
				pad_l1_params = <pad_l1_params>
				transition_param = <transition_param>
				can_scroll_stats = <can_scroll_stats>
				spawn_net_timer = <spawn_net_timer>
				spawn_timer_params = <spawn_timer_params>
				no_wait
			}
		else
			SpawnScriptNow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
				screen_element_id = song_breakdown_noncompetitive_id
				continue_script = <continue_script>
				back_script = <back_script>
				option_script = <option_script>
				option2_script = <option2_script>
				pad_l1_script = <pad_l1_script>
				continue_text = <continue_text>
				back_text = <back_text>
				option_text = <option_text>
				option2_text = <option2_text>
				pad_l1_text = <pad_l1_text>
				back_params = <back_params>
				option_params = <option_params>
				option2_params = <option2_params>
				pad_l1_params = <pad_l1_params>
				transition_param = <transition_param>
				can_scroll_stats = <can_scroll_stats>
				spawn_net_timer = <spawn_net_timer>
				spawn_timer_params = <spawn_timer_params>
			}
		endif
	endif
endscript

script net_ui_song_breakdown_show_players_list 
	RequireParams \{[
			device_num
			screen_id
			destroy_players_list_script
		]
		all}
	if (<device_num> = ($primary_controller))
		LaunchEvent Type = unfocus target = <screen_id>
		ui_sfx \{menustate = Generic
			uitype = select}
		if <screen_id> :GetSingleTag players_list_id
			if ScreenElementExists id = <players_list_id>
				DestroyScreenElement id = <players_list_id>
			endif
		endif
		band_lobby_create_popup_menu_players_list \{list_type = matchmaking_done}
		AssignAlias \{id = current_menu
			alias = band_lobby_popup_menu}
		if current_menu :GetSingleTag \{desc_id}
			<screen_id> :SetTags players_list_id = <desc_id>
			current_menu :se_setprops {
				event_handlers = [
					{
						pad_back
						<destroy_players_list_script>
						params = {
							players_list_id = <desc_id>
						}
					}
				]
			}
			LaunchEvent \{Type = focus
				target = current_menu}
			Change \{net_song_breakdown_timer_screen_id = band_lobby_popup_menu}
			add_user_control_helper controller = ($primary_controller) text = qs(0xaf4d5dd2) button = red z = 100000
		endif
	endif
endscript

script net_ui_song_breakdown_destroy_players_list \{players_list_id = !q1768515945}
	DestroyScreenElement id = <players_list_id>
	LaunchEvent \{Type = focus
		target = song_breakdown_noncompetitive_id}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		Change \{net_song_breakdown_timer_screen_id = song_breakdown_noncompetitive_id}
		if song_breakdown_noncompetitive_id :GetSingleTag \{transition_param}
			ui_song_breakdown_setup_handler_scripts <transition_param> no_wait no_timer add_button_pills = 1
		endif
	endif
endscript

script ui_return_song_breakdown 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		Change \{net_song_breakdown_timer_screen_id = song_breakdown_noncompetitive_id}
		if NOT ScreenElementExists \{id = band_lobby_popup_menu}
			if song_breakdown_noncompetitive_id :GetSingleTag \{transition_param}
				ui_song_breakdown_setup_handler_scripts <transition_param> no_wait add_button_pills = 1
			endif
		else
			add_user_control_helper controller = ($primary_controller) text = ($band_lobby_strings.button_select) button = green z = 100000
			band_lobby_update_button_helpers controller = ($primary_controller) menu = playerslist
		endif
	endif
endscript

script ui_song_breakdown_hide_player_data 
	gamemode_gettype
	if (<Type> != freeplay)
		getnumplayersingame
	else
		freeplay_get_num_active_players
		num_players = <num_active_players>
	endif
	if song_breakdown_noncompetitive_id :desc_resolvealias \{Name = alias_player_stat_list}
		num_data_strips_to_hide = (4 - <num_players>)
		if (<num_data_strips_to_hide> > 0)
			GetScreenElementChildren id = <resolved_id>
			i = 3
			begin
			(<children> [<i>]) :se_setprops alpha = 0
			<i> = (<i> - 1)
			repeat <num_data_strips_to_hide>
		endif
	endif
endscript

script ui_song_breakdown_get_basic_player_data \{player_index = 1}
	gamemode_gettype
	getscorefromdetailedstats Player = <player_index>
	getbestrunfromdetailedstats Player = <player_index>
	getmaxnotesfromdetailedstats Player = <player_index>
	getnoteshitfromdetailedstats Player = <player_index>
	getstarsfromdetailedstats Player = <player_index>
	getvocalstreakphrasesfromdetailedstats Player = <player_index>
	getvocalphrasequalityfromdetailedstats Player = <player_index>
	getvocalphrasemaxqualfromdetailedstats Player = <player_index>
	gettotalnotesfromdetailedstats Player = <player_index>
	getplayerinfo <player_index> part
	getplayerinfo <player_index> difficulty
	if (<max_notes> = 0)
		max_notes = 1
	endif
	getplayerinfo <player_index> difficulty
	getplayerinfo <player_index> double_kick_drum
	getplayerinfo <player_index> part
	if (<part> = drum && <difficulty> = expert && <double_kick_drum> = 1)
		difficulty_text = qs(0x7a19b5f7)
	else
		get_difficulty_text difficulty = <difficulty>
	endif
	CastToInteger \{score}
	formatText TextName = score_text qs(0x73307931) s = <score> usecommas
	ui_song_breakdown_get_player_display_name player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			<percent_notes_hit> = 1
		endif
		if GotParam \{no_units}
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		else
			formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit>
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
			if GotParam \{no_units}
				formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
			else
				formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit> DecimalPlaces = 0
			endif
			formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<streak_text> = qs(0x6a5cf46c)
			<score_text> = qs(0x6a5cf46c)
			percent_notes_hit = 0.0
		endif
	endif
	formatText \{TextName = cash_text
		qs(0x03ac90f0)}
	ui_song_breakdown_get_player_instrument_texture part = <part>
	getplayerinfo <player_index> double_kick_drum
	ui_song_breakdown_get_player_difficulty_texture {
		part = <part>
		difficulty = <difficulty>
		double_kick_drum = <double_kick_drum>
	}
	return <...>
endscript

script ui_song_breakdown_get_player_display_name 
	RequireParams \{[
			player_index
		]
		all}
	if inroadiebattlemode
		if roadie_battle_find_roadie_for_player Player = <player_index>
			roadie_battle_form_team_name roadie = <roadie>
			return player_name_text = <roadie_team_name>
		endif
	endif
	<Name> = qs(0x00000000)
	if (($is_network_game = 1) || (isps3))
		getplayerinfo <player_index> gamertag
		<Name> = ($<gamertag>)
	endif
	if (<Name> = qs(0x00000000))
		formatText TextName = player_name_text qs(0x5c5cedaa) p = <player_index>
	else
		<player_name_text> = <Name>
	endif
	return player_name_text = <player_name_text>
endscript

script ui_song_breakdown_get_player_instrument_texture 
	RequireParams \{[
			part
		]
		all}
	switch (<part>)
		case guitar
		icon_texture = icon_guitar_fill
		case bass
		icon_texture = icon_bass_fill
		case drum
		icon_texture = icon_drum_fill
		case vocals
		icon_texture = icon_vocals_fill
	endswitch
	return icon_texture = <icon_texture>
endscript

script ui_song_breakdown_get_player_difficulty_texture 
	RequireParams \{[
			part
			difficulty
			double_kick_drum
		]
		all}
	switch (<difficulty>)
		case beginner
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
		if (<part> = drum)
			if (<double_kick_drum> = 1)
				diff_texture = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	return diff_texture = <diff_texture>
endscript

script get_percent_notes_hit 
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script ui_song_breakdown_add_handlers_for_next_transition_spawned \{screen_element_id = !q1768515945
		continue_script = !q1768515945
		back_script = !q1768515945
		option_script = !q1768515945
		option2_script = !q1768515945
		pad_l1_script = nullscript
		continue_text = 0x69696969
		back_text = 0x69696969
		option_text = 0x69696969
		option2_text = 0x69696969
		pad_l1_text = qs(0x03ac90f0)
		transition_param = !q1768515945
		can_scroll_stats = !i1768515945
		spawn_net_timer = !i1768515945}
	if isSinglePlayerGame
		array = []
	else
		if (<can_scroll_stats> = 1)
			array = [
				{pad_up song_breakdown_scroll_stats params = {direction = up}}
				{pad_down song_breakdown_scroll_stats params = {direction = down}}
				{pad_left song_breakdown_scroll_stats params = {direction = left}}
				{pad_right song_breakdown_scroll_stats params = {direction = right}}
			]
		else
			array = []
		endif
	endif
	if NOT (<continue_script> = nullscript)
		if GotParam \{continue_params}
			AddArrayElement array = <array> element = {pad_choose <continue_script> params = <continue_params>}
		else
			AddArrayElement array = <array> element = {pad_choose <continue_script>}
		endif
		if (<continue_text> != qs(0x03ac90f0))
			if NOT user_control_helper_exists \{button = green}
				add_user_control_helper ($ui_song_breakdown_helper_params) text = <continue_text> button = green z = 100000
			else
				user_control_helper_change_text text = <continue_text> button = green
			endif
		endif
	endif
	if NOT (<back_script> = nullscript)
		if GotParam \{back_params}
			AddArrayElement array = <array> element = {pad_back <back_script> params = <back_params>}
		else
			AddArrayElement array = <array> element = {pad_back <back_script>}
		endif
		if (<back_text> != qs(0x03ac90f0))
			if NOT user_control_helper_exists \{button = red}
				add_user_control_helper ($ui_song_breakdown_helper_params) text = <back_text> button = red z = 100000
			else
				user_control_helper_change_text text = <back_text> button = red
			endif
		endif
	endif
	if NOT (<option2_script> = nullscript)
		if GotParam \{option2_params}
			AddArrayElement array = <array> element = {pad_option2 <option2_script> params = <option2_params>}
		else
			AddArrayElement array = <array> element = {pad_option2 <option2_script>}
		endif
		if (<option2_text> != qs(0x03ac90f0))
			if NOT user_control_helper_exists \{button = yellow}
				add_user_control_helper ($ui_song_breakdown_helper_params) text = <option2_text> button = yellow z = 100000
			else
				user_control_helper_change_text text = <option2_text> button = yellow
			endif
		endif
	endif
	if NOT (<option_script> = nullscript)
		if GotParam \{option_params}
			AddArrayElement array = <array> element = {pad_option <option_script> params = <option_params>}
		else
			AddArrayElement array = <array> element = {pad_option <option_script>}
		endif
		if (<option_text> != qs(0x03ac90f0))
			if NOT user_control_helper_exists \{button = blue}
				add_user_control_helper ($ui_song_breakdown_helper_params) text = <option_text> button = blue z = 100000
			else
				user_control_helper_change_text text = <option_text> button = blue
			endif
		endif
	endif
	if NOT (<pad_l1_script> = nullscript)
		if GotParam \{pad_l1_params}
			AddArrayElement array = <array> element = {pad_L1 <pad_l1_script> params = <pad_l1_params>}
		else
			AddArrayElement array = <array> element = {pad_L1 <pad_l1_script>}
		endif
		if (<pad_l1_text> != qs(0x03ac90f0))
			if NOT user_control_helper_exists \{button = orange}
				add_user_control_helper ($ui_song_breakdown_helper_params) text = <pad_l1_text> button = orange z = 100000
			else
				user_control_helper_change_text text = <pad_l1_text> button = orange
			endif
		endif
	else
		AddArrayElement array = <array> element = {pad_L1 <pad_l1_script>}
	endif
	if (<spawn_net_timer> = 1)
		if ($net_song_breakdown_timer_running = 0)
			gamemode_gettype
			if (<Type> = competitive)
				if ui_event_exists_in_stack \{Name = 'song_breakdown_shreddfest_match_complete'}
					SpawnScriptNow {
						net_ui_song_breakdown_start_timer_spawned
						params = {
							continue_to_next_song
							screen_id = <screen_element_id>
							<spawn_timer_params>
						}
					}
				else
					SpawnScriptNow {
						net_ui_song_breakdown_competitive_start_timer_spawned
						params = {
							screen_id = <screen_element_id>
							<transition_param>
							<spawn_timer_params>
						}
					}
				endif
			else
				SpawnScriptNow {
					net_ui_song_breakdown_start_timer_spawned
					params = {
						continue_to_next_song
						screen_id = <screen_element_id>
						<spawn_timer_params>
					}
				}
			endif
		endif
	endif
	<screen_element_id> :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
	<screen_element_id> :SetTags transition_param = <transition_param>
	song_breakdown_check_bot_play
	if (<bot_play> = 0)
		song_breakdown_get_exclusive_devices
		if ScreenElementExists id = <screen_element_id>
			<screen_element_id> :se_setprops {
				exclusive_device = <exclusive_devices>
			}
		endif
	endif
	if NOT (GotParam no_wait)
		Wait \{10
			gameframes}
	else
	endif
	if ScreenElementExists id = <screen_element_id>
		if NOT isscreenelementinfocus id = <screen_element_id>
			LaunchEvent Type = focus target = <screen_element_id>
		else
		endif
	else
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_gig_complete 
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = ($primary_controller))
		<check_earned_stars> = 0
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			<check_earned_stars> = 1
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
		endif
		printf \{channel = sfx
			qs(0x911e2573)}
		printf \{channel = zdebug
			'continue on from song breakdown after gig complete'}
		GetPakManCurrent \{map = zones}
		if (<pak> != z_studio)
			gamemode_gettype
			if (<Type> != career)
				if IsSoundEventPlaying \{surge_during_stats_screen}
					StopSoundEvent \{surge_during_stats_screen
						fade_time = 1
						fade_type = linear}
				endif
				if ScriptExists \{audio_crowd_play_swells_during_stats_screen}
					KillSpawnedScript \{Name = audio_crowd_play_swells_during_stats_screen}
				endif
				SpawnScriptNow \{sfx_backgrounds_new_area
					params = {
						BG_SFX_Area = frontend_menu_music
						fadeouttime = 5
						fadeouttype = linear
					}}
				One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 1 immediate = <immediate>
			endif
		endif
		printf \{qs(0x2bd3b055)}
		Change \{songtime_paused = 0}
		SoundEvent \{event = audio_ui_song_complete_menu_out}
		GetPakManCurrent \{map = zones}
		if (<check_earned_stars> = 1)
			song_breakdown_check_for_earned_stars_transition
			if (<go_to_earned_stars> = 1)
				song_breakdown_transition_to_qp_earned_stars
			else
				ui_win_song_continue_next_menu
			endif
		else
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script net_ui_song_breakdown_continue_to_next_screen_gig_complete 
	RequireParams \{[
			device_num
		]
		all}
	getplayerinfo ($g_net_leader_player_num) controller
	getplayerinfo ($g_net_leader_player_num) bot_play
	getplayerinfo ($g_net_leader_player_num) is_local_client
	if (<bot_play> = 1)
		getplayerinfo ($g_net_leader_player_num) bot_original_controller
		<controller> = <bot_original_controller>
	endif
	if ((<device_num> = <controller>) && (<is_local_client> = 1))
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = song_complete_shreddfest_id}
			LaunchEvent \{Type = unfocus
				target = song_complete_shreddfest_id}
			song_complete_shreddfest_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
			qp_earned_stars_screen_id :se_setprops \{block_events}
		endif
		SoundEvent \{event = audio_ui_song_complete_menu_out}
		printf \{channel = sfx
			qs(0x7751fe7c)}
		GetPakManCurrent \{map = zones}
		if (<pak> != z_studio)
			gamemode_gettype
			if (<Type> != career)
				SpawnScriptNow \{sfx_backgrounds_new_area
					params = {
						BG_SFX_Area = frontend_menu_music
						fadeouttime = 5
						fadeouttype = linear
					}}
				One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 1 immediate = <immediate>
				SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
				StopSoundEvent \{$g_current_crowd_swell_short_soundevent
					fade_time = 5
					fade_type = linear}
			endif
		endif
		if IsHost
			if ($net_breakdown_continue_msg_sent = 0)
				Change \{net_breakdown_continue_msg_sent = 1}
				SendStructure \{callback = ui_win_song_continue_next_menu
					data_to_send = {
						None
					}}
			else
				return
			endif
		else
			SendStructure \{callback = net_ui_song_breakdown_continue_to_next_screen_gig_complete
				data_to_send = {
					None
				}}
			return
		endif
		ui_win_song_continue_next_menu
	endif
endscript

script ui_win_song_continue_next_menu 
	gamemode_gettype
	switch (<Type>)
		case quickplay
		quickplay_unload_challenges
		if ($last_song_played = jamsession)
			ui_sfx \{menustate = Generic
				uitype = select}
			jam_ratesong_check_for_rating
		else
			song_breakdown_qp_check_for_rewards
			if (<has_unlocked_rewards> = 1)
				if NOT GotParam \{no_sound}
					ui_sfx \{menustate = Generic
						uitype = select}
				endif
				generic_event_choose \{state = uistate_rewards_unlocked_qp
					data = {
						continue_back_to_gameplay = 0
					}}
			else
				if NOT GotParam \{no_sound}
					ui_sfx \{menustate = Generic
						uitype = select}
				endif
				if should_show_roadie_challenge_target_select_screen
					ui_sfx \{menustate = Generic
						uitype = select}
					generic_event_choose \{state = uistate_roadie_challenge_target_select
						data = {
							transition = next_song
						}}
					return
				endif
				if NOT ui_event_exists_in_stack \{Name = 'songlist'}
					generic_event_back \{state = uistate_mainmenu}
				else
					if sdcardmanagerfunc \{func = card_recently_ejected}
						if dlcmanagerfunc func = get_content_flags content_name = ($g_songlist_targeted_song)
							if (<content_flags>.present = 0 && <content_flags>.archived = 1)
								Change \{g_songlist_targeted_song = NULL}
							endif
						endif
					endif
					if NOT ($g_songlist_targeted_song = NULL)
						Change \{g_songlist_force_to_challenges = 1}
					endif
					pushdisablerendering \{context = going_into_songlist
						Type = unchecked}
					ui_event \{event = menu_back
						data = {
							state = uistate_songlist
						}}
				endif
			endif
		endif
		case career
		ui_win_song_career_continue
		case practice
		ui_destroy_song_breakdown
		end_practice_song
		if ($practice_return_state = Uistate_gameplay)
			reset_practice_mode
			shut_down_practice_mode
		endif
		if ($came_to_practice_from = main_menu)
			ui_sfx \{menustate = Generic
				uitype = select}
			generic_event_back \{state = uistate_select_song_section}
		else
			Change game_mode = ($came_to_practice_from)
			return_to_quickplay_from_practice
		endif
		case competitive
		persistent_band_stop_and_unload_anims
		kill_gem_scroller
		gman_shutdowngamemodegoal
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_back \{state = uistate_mainmenu}
		default
		ScriptAssert \{'Current game_mode not supported in ui_win_song_continue_next_menu'}
	endswitch
endscript

script ui_win_song_career_continue 
	SpawnScriptNow \{ui_win_song_career_continue_spawned}
endscript

script ui_win_song_career_continue_spawned 
	printf \{qs(0xe4fd1933)}
	SpawnScriptNow \{sfx_backgrounds_new_area
		params = {
			BG_SFX_Area = FrontEnd
			fadeintime = 1.5
			fadeintype = linear
			fadeouttime = 1.5
			fadeouttype = linear
		}}
	One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 1 immediate = <immediate>
	if NOT quest_progression_is_chapter_rush
		ui_sfx \{menustate = Generic
			uitype = select}
	endif
	ui_event_wait_for_safe
	is_net_career_client = 0
	if console_is_net_career_client
		<is_net_career_client> = 1
		<encore_ready> = ($g_net_career_progression.career_progression_tags.encore_ready)
	else
		GetGlobalTags savegame = ($primary_controller) career_progression_tags param = encore_ready
	endif
	if (<encore_ready> = 1)
		<current_chapter> = ($current_chapter)
		quest_progression_get_number_of_completed_chapters savegame = ($primary_controller)
		ui_quest_get_vo_array chapter_name = <current_chapter>
		recent_unlock_data = ($g_quest_recent_unlocked_awards)
		GetArraySize <recent_unlock_data>
		if (<array_Size> > 0)
			ui_event_get_top
			if ((<base_name> = 'rock_record') || (<base_name> = 'song_summary_details') || (<base_name> = 'online_quit_warning'))
				ui_event \{event = menu_back
					state = uistate_song_breakdown}
				ui_event_wait_for_safe
			endif
			ui_event {
				event = menu_change
				state = uistate_quest_unlocks
				data = {
					next_state_name = uistate_quest_map
					next_state_params = {
						play_outro_vo = 1
						outro_vo_strings = <vo_array>
					}
				}
			}
		else
			generic_event_back \{state = uistate_quest_map_giglist}
		endif
	else
		get_savegame_from_controller controller = ($primary_controller)
		<current_chapter> = ($current_chapter)
		quest_progression_check_for_chapter_complete savegame = <savegame> chapter_global = <current_chapter>
		recent_unlock_data = ($g_quest_recent_unlocked_awards)
		show_unlock_screen = 0
		GetArraySize <recent_unlock_data> param = recent_unlock_size
		if (<recent_unlock_size> > 0)
			<show_unlock_screen> = 1
		endif
		if quest_progression_is_chapter_finale
			ui_quest_get_vo_array chapter_name = <current_chapter>
			if (<show_unlock_screen> = 1)
				if ininternetmode
					band_lobby_career_mark_save_local_players
					ui_event_wait {
						event = menu_change
						state = uistate_quest_unlocks
						data = {
							next_state_name = uistate_quest_map
							next_state_params = {
								play_outro_vo = 1
								outro_vo_strings = <vo_array>
								play_career_outro_movie = 1
							}
						}
					}
				else
					ui_memcard_autosave {
						event = menu_change
						state = uistate_quest_unlocks
						data = {
							next_state_name = uistate_quest_map
							next_state_params = {
								play_outro_vo = 1
								outro_vo_strings = <vo_array>
								play_career_outro_movie = 1
							}
						}
					}
				endif
			else
				if ininternetmode
					band_lobby_career_mark_save_local_players
					ui_event_wait {
						event = menu_back
						state = uistate_quest_map
						data = {
							play_outro_vo = 0
							outro_vo_strings = <vo_array>
							play_career_outro_movie = 1
						}
					}
				else
					ui_memcard_autosave event = menu_back state = uistate_quest_map data = {play_outro_vo = 0 outro_vo_strings = <vo_array> play_career_outro_movie = 1}
				endif
			endif
		elseif quest_progression_is_chapter_rush
			ui_quest_get_vo_array chapter_name = <current_chapter>
			if (<show_unlock_screen> = 1)
				ui_event {
					event = menu_change
					state = uistate_quest_unlocks
					data = {
						next_state_name = uistate_quest_map
						next_state_params = {
							play_outro_vo = 1
							outro_vo_strings = <vo_array>
						}
					}
				}
			else
				generic_event_back state = uistate_quest_map data = {play_outro_vo = 0 outro_vo_strings = <vo_array>}
			endif
		elseif quest_progression_is_chapter_credits
			ui_quest_get_vo_array chapter_name = <current_chapter>
			if (<show_unlock_screen> = 1)
				ui_event \{event = menu_change
					state = uistate_quest_unlocks
					data = {
						next_state_name = uistate_quest_map
						next_state_params = {
							net_play_song = 0
						}
					}}
			else
				hide_glitch \{num_frames = 10}
				generic_event_back \{state = uistate_quest_map_giglist
					data = {
						net_play_song = 0
					}}
			endif
		else
			if (<show_unlock_screen> = 1)
				ui_event \{event = menu_change
					state = uistate_quest_unlocks
					data = {
						next_state_name = uistate_quest_map
						next_state_params = {
							net_play_song = 0
						}
					}}
			else
				hide_glitch \{num_frames = 10}
				generic_event_back \{state = uistate_quest_map_giglist
					data = {
						net_play_song = 0
					}}
			endif
		endif
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_encore 
	RequireParams \{[
			device_num
		]
		all}
	if ($is_network_game = 1)
		getplayerinfo ($g_net_leader_player_num) controller
		if (<device_num> != <controller>)
			return
		endif
		if IsHost
			if ($net_encore_msg_start_sent = 0)
				Change \{net_encore_msg_start_sent = 1}
				SendStructure \{callback = encore_play
					data_to_send = {
						None
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_encore
				data_to_send = {
					None
				}}
			SoundEvent \{event = audio_ui_song_complete_menu_out}
			return
		endif
	else
		if (<device_num> != ($primary_controller))
			return
		endif
	endif
	LaunchEvent \{Type = unfocus
		target = song_breakdown_noncompetitive_id}
	printf \{channel = zdebug
		'continue on to encore after song complete'}
	SoundEvent \{event = audio_ui_song_complete_menu_out}
	encore_play
endscript

script encore_play 
	printf \{qs(0x045d21cc)}
	start_encore
	Change \{gameplay_loading_transition = 1}
	Change \{gameplay_restart_song = 1}
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_event_wait_for_safe
	generic_event_back \{nosound
		state = Uistate_gameplay}
endscript

script net_ui_song_breakdown_go_to_setlist 
	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio)
		gamemode_gettype
		if (<Type> != career)
			SpawnScriptNow \{sfx_backgrounds_new_area
				params = {
					BG_SFX_Area = frontend_menu_music
					fadeouttime = 5
					fadeouttype = linear
				}}
			One_Shot_SoundEvent SoundEvent = audio_crowd_oneshots_do_nothing waitTime = 1 immediate = <immediate>
			SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
			StopSoundEvent \{$g_current_crowd_swell_short_soundevent
				fade_time = 5
				fade_type = linear}
		endif
	endif
	if NOT GotParam \{device_num}
		<device_num> = ($primary_controller)
	endif
	if (<device_num> = ($primary_controller))
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = song_complete_shreddfest_id}
			LaunchEvent \{Type = unfocus
				target = song_complete_shreddfest_id}
			song_complete_shreddfest_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
			qp_earned_stars_screen_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = rewards_qp_screen_id}
			LaunchEvent \{Type = unfocus
				target = rewards_qp_screen_id}
			rewards_qp_screen_id :se_setprops \{block_events}
		endif
		ui_sfx \{menustate = Generic
			uitype = select}
		if IsHost
			SendStructure \{callback = net_ui_song_breakdown_goto_setlist
				data_to_send = {
					None
				}}
			ui_event_wait_for_safe
			net_save_and_uistate_change \{event = menu_back
				state = uistate_songlist}
		else
			SendStructure \{callback = net_ui_song_breakdown_go_to_setlist
				data_to_send = {
					None
				}}
		endif
	endif
endscript

script net_ui_song_breakdown_goto_setlist 
	if IsHost
		SendStructure \{callback = net_ui_song_breakdown_goto_setlist
			data_to_send = {
				None
			}}
	endif
	if ($g_net_song_breakdown_gone_to_setlist = 0)
		Change \{g_net_song_breakdown_gone_to_setlist = 1}
		ui_event_wait_for_safe
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = song_complete_shreddfest_id}
			LaunchEvent \{Type = unfocus
				target = song_complete_shreddfest_id}
			song_complete_shreddfest_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
			qp_earned_stars_screen_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = song_breakdown_competitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_competitive_id}
			song_breakdown_competitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = rewards_qp_screen_id}
			LaunchEvent \{Type = unfocus
				target = rewards_qp_screen_id}
			rewards_qp_screen_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = stats_summary_id}
			LaunchEvent \{Type = unfocus
				target = stats_summary_id}
			stats_summary_id :se_setprops \{block_events}
		endif
		gamemode_gettype
		if (<Type> = quickplay)
			net_save_and_uistate_change \{event = menu_back
				state = uistate_songlist
				is_popup}
		else
			net_save_and_uistate_change \{event = menu_back
				state = uistate_songlist}
		endif
	endif
endscript

script song_breakdown_go_to_stats_from_transition 
	RequireParams \{[
			device_num
			transition_param
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	net_counter_increment \{counter_name = globalcounter_detailed_stats}
	if (<device_num> = ($primary_controller))
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = song_breakdown_competitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_competitive_id}
			song_breakdown_competitive_id :se_setprops \{block_events}
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
			qp_earned_stars_screen_id :se_setprops \{block_events}
		endif
		if ($is_network_game = 1)
			gamemode_gettype
			if ((<Type> = career) || (<Type> = quickplay))
				if (<transition_param> != end_of_setlist_transition)
					if ($song_breakdown_countdown_time_added = 0)
						if IsHost
							net_song_breakdown_add_to_timer
						else
							Change \{song_breakdown_countdown_time_added = 2}
							SendStructure \{callback = net_song_breakdown_add_to_timer
								data_to_send = {
									None
								}}
						endif
					endif
				endif
			else
				if ($song_breakdown_countdown_time_added = 0)
					if IsHost
						net_song_breakdown_add_to_timer
					else
						Change \{song_breakdown_countdown_time_added = 2}
						SendStructure \{callback = net_song_breakdown_add_to_timer
							data_to_send = {
								None
							}}
					endif
				endif
			endif
		else
			KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
			Change \{song_breakdown_countdown_time = -1}
		endif
		ui_event_wait_for_safe
		ui_sfx \{menustate = Generic
			uitype = select}
		generic_event_choose state = uistate_song_summary_details data = {transition_param = <transition_param>}
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition 
	RequireParams \{[
			device_num
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if (<device_num> = ($primary_controller))
		<check_earned_stars> = 0
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
			<check_earned_stars> = 1
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			LaunchEvent \{Type = focus
				target = qp_earned_stars_screen_id}
		endif
		ui_sfx \{menustate = Generic
			uitype = select}
		gamemode_gettype
		if (<Type> != career)
			SoundEvent \{event = $g_current_crowd_swell_short_soundevent}
			SoundEvent \{event = $g_current_crowd_swell_med_soundevent}
		endif
		SoundEvent \{event = audio_ui_song_complete_menu_out}
		resetyieldinfo \{yield = FALSE}
		StopRendering
		if ($last_song_played = jamsession)
			jam_ratesong_check_for_rating \{is_definitely_last_song = 0}
		else
			gamemode_gettype
			if (<Type> = quickplay)
				quickplay_unload_challenges
			endif
			if is_current_song_a_jam_session
				jam_song_back_to_gameplay end_time = ($sb_jam_song_end_time)
			else
				go_to_earned_stars = 0
				if (<check_earned_stars> = 1)
					song_breakdown_check_for_earned_stars_transition
				endif
				if (<go_to_earned_stars> = 1)
					song_breakdown_transition_to_qp_earned_stars
					StartRendering
				else
					if (<Type> = quickplay)
						song_breakdown_qp_check_for_rewards
					else
						<has_unlocked_rewards> = 0
					endif
					if (<has_unlocked_rewards> = 1)
						StartRendering
						generic_event_choose \{state = uistate_rewards_unlocked_qp
							data = {
								continue_back_to_gameplay = 1
							}}
					else
						Change \{songtime_paused = 0}
						ui_event_wait_for_safe
						generic_event_back \{nosound
							state = Uistate_gameplay}
					endif
				endif
			endif
		endif
	endif
endscript

script song_breakdown_check_bot_play 
	bot_play_is_enabled = 0
	getnumplayersingame \{on_screen
		local}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen
			local}
		begin
		getplayerinfo <Player> bot_play
		if (<bot_play> = 1)
			bot_play_is_enabled = 1
			break
		endif
		getnextplayer on_screen local Player = <Player>
		repeat <num_players_shown>
	endif
	return bot_play = <bot_play_is_enabled>
endscript

script song_breakdown_get_exclusive_devices 
	exclusive_devices = []
	if GotParam \{band_leader_only}
		AddArrayElement array = <exclusive_devices> element = ($primary_controller)
		<exclusive_devices> = <array>
	else
		getnumplayersingame \{on_screen
			local}
		if (<num_players_shown> > 0)
			getfirstplayer \{on_screen
				local}
			begin
			getplayerinfo <Player> controller
			AddArrayElement array = <exclusive_devices> element = <controller>
			<exclusive_devices> = <array>
			getnextplayer on_screen local Player = <Player>
			repeat <num_players_shown>
		endif
	endif
	return exclusive_devices = <exclusive_devices>
endscript

script ui_song_breakdown_clean_up_highest_multipliers 
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		setplayerinfo <Player> highest_multiplier = 1
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script getscorefromdetailedstats \{Player = 1}
	score = ($song_stats_backup [(<Player> - 1)].score)
	return score = <score>
endscript

script getbestrunfromdetailedstats \{Player = 1}
	best_run = ($song_stats_backup [(<Player> - 1)].best_run)
	return best_run = <best_run>
endscript

script getstarsfromdetailedstats \{Player = 1}
	stars = ($song_stats_backup [(<Player> - 1)].stars)
	return stars = <stars>
	printf <stars>
endscript

script getnoteshitfromdetailedstats \{Player = 1}
	notes_hit = ($song_stats_backup [(<Player> - 1)].notes_hit)
	return notes_hit = <notes_hit>
endscript

script getmaxnotesfromdetailedstats \{Player = 1}
	max_notes = ($song_stats_backup [(<Player> - 1)].max_notes)
	return max_notes = <max_notes>
endscript

script gettotalnotesfromdetailedstats \{Player = 1}
	total_notes = ($song_stats_backup [(<Player> - 1)].total_notes)
	return total_notes = <total_notes>
endscript

script getspphraseshitfromdetailedstats \{Player = 1}
	sp_phrases_hit = ($song_stats_backup [(<Player> - 1)].sp_phrases_hit)
	return sp_phrases_hit = <sp_phrases_hit>
endscript

script getspphrasestotalfromdetailedstats \{Player = 1}
	sp_phrases_total = ($song_stats_backup [(<Player> - 1)].sp_phrases_total)
	return sp_phrases_total = <sp_phrases_total>
endscript

script getavgmultiplierfromdetailedstats \{Player = 1}
	avg_multiplier = ($song_stats_backup [(<Player> - 1)].avg_multiplier)
	return avg_multiplier = <avg_multiplier>
endscript

script getvocalstreakphrasesfromdetailedstats \{Player = 1}
	vocal_streak_phrases = ($song_stats_backup [(<Player> - 1)].vocal_streak_phrases)
	return vocal_streak_phrases = <vocal_streak_phrases>
endscript

script getvocalphrasequalityfromdetailedstats \{Player = 1}
	vocal_phrase_quality = ($song_stats_backup [(<Player> - 1)].vocal_phrase_quality)
	return vocal_phrase_quality = <vocal_phrase_quality>
endscript

script getvocalphrasemaxqualfromdetailedstats \{Player = 1}
	vocal_phrase_max_qual = ($song_stats_backup [(<Player> - 1)].vocal_phrase_max_qual)
	return vocal_phrase_max_qual = <vocal_phrase_max_qual>
endscript

script song_breakdown_drop_player 
	printf \{qs(0xe0296c2b)}
	printstruct <...>
	if (<is_game_over> = 0)
		wait_for_safe_shutdown
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			screen_id = song_breakdown_noncompetitive_id
		elseif ScreenElementExists \{id = song_breakdown_competitive_id}
			screen_id = song_breakdown_competitive_id
		elseif ScreenElementExists \{id = song_complete_shreddfest_id}
			screen_id = song_complete_shreddfest_id
		elseif ScreenElementExists \{id = stats_summary_id}
			screen_id = stats_summary_id
		elseif ScreenElementExists \{id = gig_complete_noncompetitive_id}
			screen_id = gig_complete_noncompetitive_id
		elseif ScreenElementExists \{id = rewards_unlocked_screen_id}
			screen_id = rewards_unlocked_screen_id
		elseif ScreenElementExists \{id = rewards_qp_screen_id}
			screen_id = rewards_qp_screen_id
		elseif ScreenElementExists \{id = game_rules_screen_id}
			screen_id = game_rules_screen_id
			if game_rules_screen_id :obj_getchecksumtag \{tag_name = menu_id
					assert = 0}
				<screen_id> = <checksum_value>
			endif
		elseif ScreenElementExists \{id = votinginterface}
			screen_id = current_menu
		endif
		getplayerinfo <dropped_player_num> Band
		removeplayerfromband Player = <dropped_player_num> Band = <Band>
		setplayerinfo <dropped_player_num> is_local_client = 0
		setplayerinfo <dropped_player_num> net_id_first = 0
		setplayerinfo <dropped_player_num> net_id_second = 0
		setplayerinfo <dropped_player_num> net_obj_id = -1
		setplayerinfo <dropped_player_num> Band = 1
		setplayerinfo <dropped_player_num> party_id = -1
		setplayerinfo <dropped_player_num> in_game = 0
		if playerinfoequals <dropped_player_num> is_onscreen = 1
			LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <dropped_player_num>
		endif
		getplayerinfo <dropped_player_num> gamertag
		if GotParam \{screen_id}
			switch <drop_reason>
				case net_message_player_quit
				formatText TextName = drop_msg qs(0x567f10d8) s = <name_string>
				case net_message_player_dropped
				case net_message_player_timed_out
				formatText TextName = drop_msg qs(0xd4b272d7) s = <name_string>
				default
				drop_msg = qs(0x00000000)
			endswitch
			Change GlobalName = <gamertag> NewValue = <drop_msg>
			add_dropped_player_to_dialog_box parent = <screen_id> msg_text = <drop_msg>
			song_breakdown_remove_strip_for_dropped_player
		endif
	endif
endscript

script sb_kill_timer_remove_handlers 
	KillSpawnedScript \{Name = net_ui_song_breakdown_start_timer_spawned}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		screen_id = song_breakdown_noncompetitive_id
	elseif ScreenElementExists \{id = song_breakdown_competitive_id}
		screen_id = song_breakdown_competitive_id
	elseif ScreenElementExists \{id = song_complete_shreddfest_id}
		screen_id = song_complete_shreddfest_id
	elseif ScreenElementExists \{id = stats_summary_id}
		screen_id = stats_summary_id
	elseif ScreenElementExists \{id = gig_complete_noncompetitive_id}
		screen_id = gig_complete_noncompetitive_id
	elseif ScreenElementExists \{id = rewards_unlocked_screen_id}
		screen_id = rewards_unlocked_screen_id
	elseif ScreenElementExists \{id = game_rules_screen_id}
		screen_id = game_rules_screen_id
		game_rules_screen_id :se_setprops \{block_events}
		if game_rules_screen_id :obj_getchecksumtag \{tag_name = menu_id
				assert = 0}
			<screen_id> = <checksum_value>
		endif
	elseif ScreenElementExists \{id = rewards_qp_screen_id}
		screen_id = rewards_qp_screen_id
	elseif ScreenElementExists \{id = votinginterface}
		screen_id = current_menu
	endif
	if GotParam \{screen_id}
		LaunchEvent Type = unfocus target = <screen_id>
		<screen_id> :se_setprops {
			net_timer_text_alpha = 0
			event_handlers = [
				{pad_choose nullscript}
				{pad_option nullscript}
				{pad_L1 nullscript}
				{pad_start nullscript}
				{pad_back postgame_lobby_quit params = {id = <screen_id>}}
			]
			replace_handlers
		}
	endif
	if ScreenElementExists \{id = rockrecordinterface}
		LaunchEvent \{Type = unfocus
			target = rockrecordinterface}
	elseif ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ScreenElementExists \{id = band_lobby_manage_player}
		if band_lobby_manage_player :desc_resolvealias \{Name = alias_game_rules_vmenu
				param = menu_id}
			LaunchEvent Type = unfocus target = <menu_id>
		endif
	endif
endscript

script song_breakdown_end_game 
	printf \{qs(0x47ac8b43)}
	destroy_dialog_box
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		changeglobalinteger \{global_name = g_band_lobby_kill_switch
			new_value = 1}
		OnExitRun \{drop_listener_cleanup}
		getnumplayersingame \{local}
		if (<num_players> > 0)
			getfirstplayer \{local}
			begin
			getplayerinfo <Player> controller
			if NOT CheckForSignIn controller_index = <controller> dont_set_primary
				printf qs(0x6e784de6) d = <controller>
				return
			endif
			getnextplayer local Player = <Player>
			repeat <num_players>
		endif
		net_disable_pause
		ui_event_wait_for_safe
		sb_kill_timer_remove_handlers
		ui_event_get_top
		if (<base_name> = 'online_quit_warning' || (<base_name> = 'award_case'))
			generic_event_back
			ui_event_wait_for_safe
		elseif (<base_name> = 'unlock_tracker')
			LaunchEvent \{Type = unfocus
				target = unlock_tracker}
		elseif (<base_name> = 'memcard')
			begin
			if NOT ui_event_exists_in_stack \{Name = 'memcard'}
				if ($g_memcard_ingame_is_paused = 0)
					break
				endif
			endif
			Wait \{1
				gameframe}
			printf \{'waiting for autosave to finish'}
			repeat
			ui_event_wait_for_safe
		endif
		if ScreenElementExists \{id = SongList}
			songlist_end_game <...>
			return
		endif
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formatText TextName = msg qs(0x78bb855f) s = <first_msg>
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if ScreenElementExists \{id = dialog_box_container}
			dialog_box_container :se_setprops \{z_priority = 1500.2}
		endif
		if ScreenElementExists \{id = dialog_box_desc_id}
			dialog_box_desc_id :Obj_SpawnScriptNow song_breakdown_end_game_spawned id = not_ui_player_drop_scripts params = {<...>}
		endif
	endif
	OnExitRun \{nullscript}
endscript

script song_breakdown_end_game_spawned 
	Change \{net_ready_to_start = 1}
	OnExitRun \{drop_listener_cleanup}
	printf \{qs(0x60090de2)}
	Wait \{3
		Seconds}
	printf \{qs(0xa43fad2b)}
	destroy_net_popup
	<add_quit_prompt> = 1
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		screen_id = song_breakdown_noncompetitive_id
	elseif ScreenElementExists \{id = song_breakdown_competitive_id}
		screen_id = song_breakdown_competitive_id
	elseif ScreenElementExists \{id = song_complete_shreddfest_id}
		screen_id = song_complete_shreddfest_id
	elseif ScreenElementExists \{id = stats_summary_id}
		screen_id = stats_summary_id
	elseif ScreenElementExists \{id = gig_complete_noncompetitive_id}
		screen_id = gig_complete_noncompetitive_id
	elseif ScreenElementExists \{id = rewards_unlocked_screen_id}
		screen_id = rewards_unlocked_screen_id
	elseif ScreenElementExists \{id = game_rules_screen_id}
		screen_id = game_rules_screen_id
		game_rules_screen_id :se_setprops \{unblock_events}
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
		if game_rules_screen_id :obj_getchecksumtag \{tag_name = menu_id
				assert = 0}
			<screen_id> = <checksum_value>
		endif
		<add_quit_prompt> = 0
	elseif ScreenElementExists \{id = rewards_qp_screen_id}
		screen_id = rewards_qp_screen_id
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
		if rewards_qp_screen_id :desc_resolvealias \{Name = alias_rewards_list
				param = strips_menu_id}
			if GetScreenElementChildren id = <strips_menu_id>
				GetArraySize \{children}
				if (<array_Size> > 0)
					if (<array_Size> > $g_rewards_unlocked_max_strips)
						add_user_control_helper \{text = qs(0xde41a641)
							button = strumbar
							z = 100000}
					endif
				endif
			endif
		endif
	elseif ScreenElementExists \{id = votinginterface}
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
	endif
	if ScreenElementExists \{id = rockrecordinterface}
		screen_id = rockrecordinterface
		<add_quit_prompt> = 0
	elseif ScreenElementExists \{id = band_lobby_manage_player}
		if band_lobby_manage_player :desc_resolvealias \{Name = alias_game_rules_vmenu
				param = menu_id}
			<add_quit_prompt> = 0
			screen_id = <menu_id>
		endif
	elseif ScreenElementExists \{id = current_menu}
		<add_quit_prompt> = 0
		screen_id = current_menu
	endif
	gamemode_gettype
	if (<Type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		quit_network_game_early
		band_lobby_restore_prematchmaking_settings
		if ui_event_is_top_popup
			ui_memcard_autosave_all_players \{memcard_event = menu_replace
				event = menu_back
				state = uistate_band_lobby}
		else
			ui_memcard_autosave_all_players \{event = menu_back
				state = uistate_band_lobby}
		endif
	elseif GotParam \{screen_id}
		<screen_id> :se_setprops unblock_events
		LaunchEvent Type = focus target = <screen_id>
		if (<add_quit_prompt> = 1)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x67d9c56d) button = red z = 100000
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xd16792bf) button = yellow z = 100000
		endif
		if checksumequals a = <screen_id> b = rockrecordinterface
			rockrecordinterface :se_getprops
			add_gamertag_helper exclusive_device = <exclusive_device>
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			if isxenonorwindx
				add_user_control_helper \{text = qs(0xfcc51f45)
					button = yellow
					z = 100000}
			endif
		endif
	endif
endscript

script create_ui_star_particles \{parent = root_window
		Pos = (0.0, 0.0)
		z = 15.5}
	Obj_GetID
	<parent> = <objID>
	Destroy2DParticleSystem \{id = ui_star_particles}
	if ScreenElementExists \{id = ui_screen_flash}
		DestroyScreenElement \{id = ui_screen_flash}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = ui_screen_flash
		parent = <parent>
		z_priority = 1000
		texture = white
		blend = add
		rgba = [255 255 255 200]
		alpha = 1
		dims = (1280.0, 720.0)
		Pos = (640.0, 360.0)
	}
	Wait \{1
		gameframe}
	ui_screen_flash :SetProps \{alpha = 0
		time = 0.2
		motion = ease_out}
	Create2DParticleSystem {
		id = ui_star_particles
		Pos = <Pos>
		parent = <parent>
		z_priority = <z>
		texture = song_summary_score_star_glow
		blend = add
		start_color = [255 255 255 255]
		end_color = [100 25 0 50]
		start_scale = (1.5, 1.5)
		end_scale = (0.08, 0.08)
		start_angle_spread = 360.0
		min_rotation = -500
		max_rotation = 500
		emit_start_radius = 25.0
		emit_radius = 155.0
		Emit_Rate = 0.00032000002
		emit_dir = 0
		emit_spread = 360.0
		velocity = 15.0
		friction = (0.1, 0.01)
		time = 0.5
	}
	Wait \{1
		gameframe}
	Destroy2DParticleSystem \{id = ui_star_particles
		kill_when_empty}
	ui_screen_flash :se_waitprops
	if ScreenElementExists \{id = ui_screen_flash}
		DestroyScreenElement \{id = ui_screen_flash}
	endif
	return
endscript

script create_ui_star_particles_multi \{parent = root_window
		Pos = (0.0, 0.0)
		z = 15.5}
	Obj_GetID
	<parent> = <objID>
	Destroy2DParticleSystem \{id = ui_star_particles_multi}
	if ScreenElementExists \{id = ui_screen_flash}
		DestroyScreenElement \{id = ui_screen_flash}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = ui_screen_flash
		parent = <parent>
		z_priority = 1000
		texture = white
		blend = add
		rgba = [255 255 255 200]
		alpha = 1
		dims = (1280.0, 720.0)
		Pos = (640.0, 360.0)
	}
	Wait \{1
		gameframe}
	ui_screen_flash :SetProps \{alpha = 0
		time = 0.2
		motion = ease_out}
	Create2DParticleSystem {
		id = ui_star_particles_multi
		Pos = <Pos>
		parent = <parent>
		z_priority = <z>
		texture = song_summary_score_star_glow
		blend = add
		start_color = [255 255 255 255]
		end_color = [100 25 0 50]
		start_scale = (1.5, 1.5)
		end_scale = (0.08, 0.08)
		start_angle_spread = 360.0
		min_rotation = -500
		max_rotation = 500
		emit_start_radius = 25.0
		emit_radius = 155.0
		Emit_Rate = 0.00032000002
		emit_dir = 0
		emit_spread = 360.0
		velocity = 15.0
		friction = (0.1, 0.01)
		time = 0.5
	}
	Wait \{1
		gameframe}
	Destroy2DParticleSystem \{id = ui_star_particles_multi
		kill_when_empty}
	ui_screen_flash :se_waitprops
	if ScreenElementExists \{id = ui_screen_flash}
		DestroyScreenElement \{id = ui_screen_flash}
	endif
	return
endscript

script create_ui_medalion_particles \{parent = root_window
		Pos = (0.0, 0.0)
		z = 15.5}
	Obj_GetID
	<parent> = <objID>
	Destroy2DParticleSystem \{id = ui_medallion_particles}
	Create2DParticleSystem {
		id = ui_medallion_particles
		Pos = <Pos>
		parent = <parent>
		z_priority = <z>
		texture = glow_fx
		blend = add
		start_color = [255 255 255 255]
		end_color = [100 25 0 50]
		start_scale = (0.2, 0.2)
		end_scale = (0.08, 0.08)
		start_angle_spread = 360.0
		min_rotation = -500
		max_rotation = 500
		emit_start_radius = 25.0
		emit_radius = 55.0
		Emit_Rate = 0.00032000002
		emit_dir = 0
		emit_spread = 360.0
		velocity = 15.0
		friction = (0.1, 0.01)
		time = 0.5
	}
	Wait \{1
		gameframe}
	Destroy2DParticleSystem \{id = ui_medallion_particles
		kill_when_empty}
	return
endscript

script anim_star_wiggle_loop \{game_type = !q1768515945}
	if (<game_type> = career)
		<star_alpha> = song_summary_star_career_alpha
		<zero_alpha> = song_summary_star_qp_alpha
	else
		if gman_ispowerscoreenabled
			<star_alpha> = song_summary_star_career_alpha
			<zero_alpha> = song_summary_star_qp_alpha
		else
			<star_alpha> = song_summary_star_qp_alpha
			<zero_alpha> = song_summary_star_career_alpha
		endif
	endif
	begin
	my_alpha = Random (@ 1 @ 0.9 @ 0.8 )
	my_alpha2 = Random (@ 1 @ 0.8 )
	my_scale1 = Random (@ (1.03, 0.96999997) @ (0.96999997, 1.03) @*20 (1.0, 1.0) )
	my_scale2 = Random (@ (1.01, 1.0) @ (1.0, 1.01) @*20 (1.1, 1.1) )
	AddParam structure_name = anim_struct Name = <star_alpha> value = <my_alpha>
	se_setprops {
		<anim_struct>
		motion = ease_out
		time = 0.1
	}
	se_setprops {
		song_summary_star_scale = <my_scale2>
		song_summary_star2_scale = <my_scale1>
		motion = ease_out
		time = 0.2
	}
	se_waitprops
	repeat
endscript

script ui_song_breakdown_pulse_stats_arrows_spawned \{arrow_pulse_time = 5.0
		delayed = 0}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if NOT isSinglePlayerGame
			if (<delayed> = 1)
				Wait <arrow_pulse_time> Seconds
			endif
			begin
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_scroll_left_arrow_spawned}
			Wait \{0.2
				Seconds}
			song_breakdown_noncompetitive_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_scroll_right_arrow_spawned}
			Wait <arrow_pulse_time> Seconds
			repeat
		endif
	endif
endscript

script ui_song_breakdown_pulse_scroll_left_arrow_spawned 
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_left_arrow_scale = 1.5
			time = 0.3
			relative_scale
			motion = ease_in}
		song_breakdown_noncompetitive_id :se_waitprops
		Wait \{0.3
			Seconds}
		song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_left_arrow_scale = 1
			time = 0.1
			relative_scale
			motion = ease_out}
	endif
endscript

script ui_song_breakdown_pulse_scroll_right_arrow_spawned 
	song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_right_arrow_scale = 1.5
		time = 0.3
		relative_scale
		motion = ease_in}
	song_breakdown_noncompetitive_id :se_waitprops
	Wait \{0.3
		Seconds}
	song_breakdown_noncompetitive_id :se_setprops \{stats_scroll_right_arrow_scale = 1
		time = 0.1
		relative_scale
		motion = ease_out}
endscript

script chapter_complete_text_anim 
	begin
	se_setprops \{Scale = (1.5, 1.5)}
	se_waitprops
	se_setprops \{Scale = (0.9, 0.9)
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (1.15, 1.15)
		time = 0.15
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (0.95, 0.95)
		time = 0.25
		motion = ease_out}
	se_waitprops
	se_setprops \{Scale = (1.0, 1.0)
		time = 0.2
		motion = smooth}
	se_waitprops
	Wait \{0.7
		Seconds}
	repeat
endscript

script song_breakdown_add_handlers_for_song_transition 
	if InNetGame
		gamemode_gettype
		GetNumPlayers
		get_local_players_in_game
		if (<Type> = pro_faceoff || <Type> = competitive || (<Type> = quickplay && $g_net_quickplay_show_unlock_screen = 1))
			continue_between_net_songs
		elseif (<num_local_players> >= <num_players>)
			if (<Type> = quickplay)
				ui_song_breakdown_setup_handler_scripts \{net_transition_not_career
					add_button_pills = 1}
			else
				ui_song_breakdown_setup_handler_scripts \{end_of_setlist_transition
					add_button_pills = 1}
			endif
		else
			generic_net_sync \{callback = continue_between_net_songs}
		endif
	else
		ui_event_get_top
		<add_button_pills> = 1
		if (<base_name> = 'universal_help')
			<add_button_pills> = 0
		endif
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			ui_song_breakdown_setup_handler_scripts add_setlist_continue_handlers add_button_pills = <add_button_pills>
		elseif ScreenElementExists \{id = song_breakdown_competitive_id}
			ui_song_breakdown_competitive_setup_handler_scripts \{add_setlist_continue_handlers}
		endif
		if (<base_name> = 'universal_help')
			if ScreenElementExists \{id = universal_help_popup_id}
				LaunchEvent \{Type = focus
					target = universal_help_popup_id}
			endif
		endif
	endif
endscript

script song_breakdown_apply_quickplay_badges_single_player \{badge_alpha = !f1768515945}
	if GMan_GoalIsActive \{goal = quickplay}
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			getfirstplayer \{on_screen
				local}
			quickplay_get_challenge_outro_stats Player = <Player>
			GetArraySize <player_challenge_stats>
			if (<array_Size> > 0)
				<top_menu_alias> = alias_quickplay_bonus_badge_menu_top
				if NOT song_breakdown_noncompetitive_id :desc_resolvealias Name = <top_menu_alias> param = top_badge_menu_id
					ScriptAssert 'Could not resolve alias for quickplay badges: %m' m = <top_menu_alias>
				endif
				gman_getdata \{goal = quickplay
					Name = targeted_challenge}
				if NOT checksumequals a = <targeted_challenge> b = NULL
					quickplay_targeting_player_get_result
					if NOT checksumequals a = <Result> b = not_targeting_player
						switch <Result>
							case success
							<you_rock_text> = qs(0x98a03633)
							case fail
							<you_rock_text> = qs(0x1e8ddef8)
							case tie
							<you_rock_text> = qs(0xdc65b6c7)
						endswitch
						quickplay_targeting_player_get_opponent_gamertag
						<opponent_gamertag> = <gamertag>
						NetSessionFunc func = get_gamertag params = {controller = ($primary_controller)}
						if (<opponent_gamertag> = <Name>)
							<gamertag_text> = qs(0xaacb668e)
						else
							formatText TextName = gamertag_text qs(0x5d9eae64) g = <opponent_gamertag>
						endif
					else
						gman_getdata \{goal = quickplay
							Name = targeted_challenge_inst_config}
						ExtendCrc <targeted_challenge> '_info' out = targeted_challenge_info
						if ((<targeted_challenge_inst_config> = Band) || (<targeted_challenge_inst_config> = traditional_band))
							formatText checksumName = player_challenge_id '%n' n = ($<targeted_challenge_info>.Name)
						else
							formatText checksumName = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.Name) p = ($g_leader_player_num)
						endif
						quickplay_get_grade goal_id = <player_challenge_id>
						switch (<pending_grade>)
							case 1
							<you_rock_text> = qs(0xbc96471a)
							case 2
							<you_rock_text> = qs(0x79485ae4)
							case 3
							<you_rock_text> = qs(0x9973028a)
							default
							<you_rock_text> = qs(0x03ac90f0)
						endswitch
						<i> = 0
						begin
						if (<targeted_challenge> = (<player_challenge_stats> [<i>]).goal_name)
							quickplay_get_challenge_name_string_from_checksum goal_name = ((<player_challenge_stats> [<i>]).goal_name) Player = ($g_leader_player_num)
							gamertag_text = <challenge_name_string>
						endif
						<i> = (<i> + 1)
						repeat <array_Size>
					endif
					song_breakdown_noncompetitive_id :se_setprops {
						you_rock_label_text = <you_rock_text>
						gamertag_label_text = <gamertag_text>
					}
					if (<array_Size> = 1)
						<badge_order> = [0]
					elseif (<array_Size> = 2)
						if (<targeted_challenge> = (<player_challenge_stats> [0]).goal_name)
							<badge_order> = [0 1]
						else
							<badge_order> = [1 0]
						endif
					elseif (<array_Size> = 3)
						if (<targeted_challenge> = (<player_challenge_stats> [0]).goal_name)
							<badge_order> = [1 0 2]
						elseif (<targeted_challenge> = (<player_challenge_stats> [1]).goal_name)
							<badge_order> = [0 1 2]
						else
							<badge_order> = [0 2 1]
						endif
					endif
				else
					song_breakdown_noncompetitive_id :se_setprops \{you_rock_fx_alpha = 0
						challenge_title_alpha = 1}
					<badge_order> = []
					<i> = 0
					begin
					AddArrayElement array = <badge_order> element = <i>
					<badge_order> = <array>
					<i> = (<i> + 1)
					repeat <array_Size>
				endif
				<badge_menu_id> = <top_badge_menu_id>
				<i> = 0
				begin
				<index> = (<badge_order> [<i>])
				<is_targeted_challenge> = 0
				if NOT checksumequals a = <targeted_challenge> b = NULL
					if (<targeted_challenge> = (<player_challenge_stats> [<index>]).goal_name)
						<is_targeted_challenge> = 1
					endif
				endif
				song_breakdown_create_badge_and_apply_progress_to_meter {
					badge_parent_id = <badge_menu_id>
					challenge_stats = (<player_challenge_stats> [<index>])
					Player = <Player>
					badge_alpha = <badge_alpha>
					num_badges = <array_Size>
					is_band = 0
					is_multiplayer = 0
					is_targeted_challenge = <is_targeted_challenge>
				}
				<i> = (<i> + 1)
				repeat <array_Size>
				song_breakdown_noncompetitive_id :SetTags qp_num_badges = <array_Size>
			elseif gman_ispowerscoreenabled
				song_breakdown_noncompetitive_id :se_setprops \{you_rock_power_challenge_alpha = 1.0
					you_rock_fx_alpha = 0.0
					challenge_title_alpha = 0.0}
			endif
		endif
	endif
endscript

script song_breakdown_apply_quickplay_badges_multi_player \{Player = !i1768515945
		panel_id = !q1768515945}
	if GMan_GoalIsActive \{goal = quickplay}
		quickplay_get_challenge_outro_stats Player = <Player>
		GetArraySize <player_challenge_stats>
		if (<array_Size> = 0)
			return
		endif
		<badge_loop_num> = <array_Size>
		<badge_menu_alias> = alias_bonus_badge_menu_single
		<use_small_badges> = 0
		if (<array_Size> > 4)
			<badge_menu_alias> = alias_bonus_badge_menu_top
			<badge_loop_num> = 4
			<use_small_badges> = 1
		endif
		if <panel_id> :desc_resolvealias Name = <badge_menu_alias> param = badge_menu_top_id
			<i> = 0
			begin
			song_breakdown_create_badge_and_apply_progress_to_meter {
				badge_parent_id = <badge_menu_top_id>
				challenge_stats = (<player_challenge_stats> [<i>])
				Player = <Player>
				badge_alpha = 1.0
				use_small_badges = <use_small_badges>
				is_band = 0
				is_multiplayer = 1
			}
			<i> = (<i> + 1)
			repeat <badge_loop_num>
			if (<array_Size> > 4)
				if <panel_id> :desc_resolvealias Name = alias_bonus_badge_menu_bottom param = badge_menu_bottom_id
					begin
					song_breakdown_create_badge_and_apply_progress_to_meter {
						badge_parent_id = <badge_menu_bottom_id>
						challenge_stats = (<player_challenge_stats> [<i>])
						Player = <Player>
						badge_alpha = 1.0
						use_small_badges = <use_small_badges>
						is_band = 0
						is_multiplayer = 1
					}
					<i> = (<i> + 1)
					repeat (<array_Size> - <badge_loop_num>)
				endif
			endif
		endif
	endif
endscript

script song_breakdown_fill_qp_unlock_meter_multi_player \{Player = !i1768515945
		panel_id = !q1768515945
		text_color = 0x69696969}
	if NOT StructureContains \{structure = text_color
			Color}
		ScriptAssert \{'Missing color param in text_color struct!'}
	endif
	getplayerinfo <Player> total_award_points
	getplayerinfo <Player> recent_award_points
	<starting_award_points_total> = (<total_award_points> - <recent_award_points>)
	quickplay_find_award_point_level award_points = <starting_award_points_total>
	<previous_award_point_level> = <award_point_level>
	quickplay_find_award_point_level award_points = <total_award_points>
	quickplay_get_outro_percentages {
		previous_points = <total_award_points>
		current_points = <total_award_points>
		previous_level = (<award_point_level> - 1)
		current_level = <award_point_level>
	}
	<end_percentage> = (<end_percentage> * 100.0)
	CastToInteger \{end_percentage}
	<award_points_scale> = ((<end_percentage> * 1.0) / 100.0)
	formatText TextName = current_rank_text qs(0xbe6a77af) l = <award_point_level>
	if ((<next_award_points_threshold> - <total_award_points>) = 1)
		formatText TextName = current_total_text qs(0xaa4e1267) l = (<award_point_level> + 1)
	else
		formatText TextName = current_total_text qs(0x2a3a3e3c) s = (<next_award_points_threshold> - <total_award_points>) l = (<award_point_level> + 1)
	endif
	formatText TextName = new_stars_text qs(0x3ffaa621) s = <recent_award_points>
	<meter_scale> = (((1.0, 0.0) * <award_points_scale>) + ((0.0, 1.0) * 1))
	<panel_id> :se_setprops {
		rank_text = <current_rank_text>
		rank_meter_caption_text = <current_total_text>
		new_star_caption_text = <new_stars_text>
		meter_fill_scale = <meter_scale>
	}
	getplayerinfo <Player> controller
	getplayerinfo <Player> is_local_client
	if (<is_local_client> = 1)
		if (<controller> < 4)
			<panel_id> :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
				local_id = <controller>
				local_user_index = <controller>
				se_prop = gamerpic_texture
				failure_texture = icon_gh6
			}
		endif
	else
		getplayerinfo ($g_leader_player_num) controller
		getplayerinfo <Player> gamertag
		getplayerinfo <Player> net_id_first
		getplayerinfo <Player> net_id_second
		<array> = []
		AddArrayElement array = <array> element = <net_id_first>
		AddArrayElement array = <array> element = <net_id_second>
		generateasciifromutf16 string = ($<gamertag>)
		<panel_id> :Obj_SpawnScriptNow gamerpic_set_screenelement_texture params = {
			net_id_64_bit = <array>
			net_id_gamertag = <nlstring>
			local_user_index = <controller>
			se_prop = gamerpic_texture
			failure_texture = icon_gh6
		}
	endif
endscript

script song_breakdown_create_badge_and_apply_progress_to_meter \{badge_parent_id = !q1768515945
		challenge_stats = 0x69696969
		Player = !i1768515945
		badge_alpha = !f1768515945
		num_badges = 0
		is_band = 0
		use_small_badges = 0
		is_multiplayer = 0
		from_pause_menu = 0
		is_targeted_challenge = 0}
	<container_parent_created> = 0
	if (<is_band> = 0)
		if (<from_pause_menu> = 1)
			<badge_cont_dims> = (230.0, 60.0)
			<badge_pos> = (0.0, -8.0)
			<badge_scale> = (1.5, 1.5)
		elseif (<use_small_badges> = 0)
			if (<is_targeted_challenge> = 0)
				<badge_pos> = (0.0, 0.0)
				<badge_cont_dims> = (50.0, 40.0)
				<badge_scale> = (0.9, 0.9)
			else
				if (<num_badges> = 3)
					<badge_pos> = (0.0, 8.0)
				else
					<badge_pos> = (0.0, 0.0)
				endif
				<badge_cont_dims> = (58.0, 46.0)
				<badge_scale> = (1.2, 1.2)
			endif
		else
			<badge_cont_dims> = (50.0, 20.0)
			<badge_pos> = (0.0, -8.0)
			<badge_scale> = (0.7, 0.7)
		endif
		CreateScreenElement {
			parent = <badge_parent_id>
			Type = ContainerElement
			pos_anchor = [center , center]
			just = [center , center]
			Pos = (0.0, 0.0)
			dims = <badge_cont_dims>
			alpha = <badge_alpha>
		}
		<container_parent_created> = 1
		<parent_id> = <id>
		<meter_alpha> = 1.0
		<band_params> = {
			Pos = <badge_pos>
			Scale = <badge_scale>
		}
	else
		if (<is_targeted_challenge> = 0)
			<badge_pos> = (0.0, -40.0)
			<badge_cont_dims> = (60.0, 40.0)
			<badge_scale> = (0.9, 0.9)
		else
			if (<num_badges> = 3)
				<badge_pos> = (0.0, -32.0)
			else
				<badge_pos> = (0.0, -40.0)
			endif
			<badge_cont_dims> = (69.0, 46.0)
			<badge_scale> = (1.2, 1.2)
		endif
		CreateScreenElement {
			parent = <badge_parent_id>
			Type = ContainerElement
			pos_anchor = [center , center]
			just = [center , center]
			dims = <badge_cont_dims>
			autosizedims = true
			alpha = <badge_alpha>
		}
		<container_parent_created> = 1
		<parent_id> = <id>
		<meter_alpha> = 1.0
		<band_params> = {
			Pos = <badge_pos>
			Scale = <badge_scale>
		}
	endif
	quickplay_get_challenge_icon base_name = (<challenge_stats>.goal_name)
	CreateScreenElement {
		parent = <parent_id>
		Type = descinterface
		desc = 'HUD_meter_challenge'
		pos_anchor = [center , center]
		just = [center , center]
		autosizedims = true
		alpha = <meter_alpha>
		challenge_icon_texture = <icon_name>
		challenge_icon_alpha = 1.0
		gamer_tag_text = qs(0x03ac90f0)
		frame_effects_alpha = 0.0
		<band_params>
	}
	<badge_id> = <id>
	<player_challenge_id> = (<challenge_stats>.instance_name)
	current_progress = 0
	calculated_targets = [0 0 0]
	if GMan_GoalIsActive goal = <player_challenge_id>
		gman_getdata goal = <player_challenge_id> Player = <Player> Name = current_progress
		gman_getdata goal = <player_challenge_id> Player = <Player> Name = calculated_targets
	else
		if StructureContains \{structure = challenge_stats
				current_progress}
			current_progress = (<challenge_stats>.current_progress)
			calculated_targets = (<challenge_stats>.calculated_targets)
		endif
	endif
	GetArraySize <calculated_targets>
	if (<array_Size> != 3)
		ScriptAssert 'Incorrect number of challenge levels for challenge %t' t = (<challenge_stats>.goal_name)
	endif
	quickplay_targeting_player_get_result Player = <Player>
	<is_targeting_friend> = 1
	if (<Result> = not_targeting_player)
		<is_targeting_friend> = 0
	endif
	if NOT checksumequals a = <player_challenge_id> b = <target_instance_name>
		<is_targeting_friend> = 0
	endif
	song_breakdown_get_highest_completed_challenge_level {
		gold_level = ((<calculated_targets> [0]) * 1.0)
		platinum_level = ((<calculated_targets> [1]) * 1.0)
		diamond_level = ((<calculated_targets> [2]) * 1.0)
		current_progress = (<current_progress> * 1.0)
		is_targeting_friend = <is_targeting_friend>
		player_challenge_id = <player_challenge_id>
	}
	if (<highest_completed> > 0)
		<badge_id> :se_setprops frame_effects_alpha = 1.0
	endif
	<points_earned_for_challenge> = 0
	if ((<challenge_stats>.challenge_grade) > 0)
		<points_earned_for_challenge> = (<challenge_stats>.challenge_grade)
	endif
	<previous_points_earned> = 0
	if ((<challenge_stats>.previous_grade) > 0)
		<previous_points_earned> = (<challenge_stats>.previous_grade)
	endif
	<badge_id> :SetTags {
		challenge_stats = <challenge_stats>
		points_earned_for_challenge = <points_earned_for_challenge>
		previous_points_earned = <previous_points_earned>
		container_parent_created = <container_parent_created>
	}
	if (<container_parent_created> = 1)
		<parent_id> :SetTags {
			challenge_stats = <challenge_stats>
			points_earned_for_challenge = <points_earned_for_challenge>
			container_parent_created = <container_parent_created>
		}
	endif
	<diamond_level> = 3
	if ((<challenge_stats>.challenge_grade) >= <diamond_level>)
		RemoveParameter \{highest_completed}
	endif
	song_breakdown_apply_ticks_to_challenge_meter {
		hud_challenge_meter_id = <badge_id>
		Player = <Player>
		level = (<challenge_stats>.challenge_grade)
		highest_completed = <highest_completed>
		percent_to_next = <percent_to_next>
		is_band = <is_band>
		player_challenge_id = <player_challenge_id>
		from_pause_menu = <from_pause_menu>
	}
endscript

script song_breakdown_apply_ticks_to_challenge_meter \{hud_challenge_meter_id = !q1768515945
		Player = !i1768515945
		level = !i1768515945
		percent_to_next = !f1768515945
		is_band = !i1768515945
		total_time = 0.0
		from_pause_menu = 0
		player_challenge_id = !q1768515945}
	if <hud_challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
		<dx> = (360.0 / ($challange_meter_num_ticks))
		<degree> = 0
		<cnt> = 0
		begin
		CreateScreenElement {
			Type = SpriteElement
			parent = <led_container>
			alpha = 0.0
			pos_anchor = [center center]
			rot_angle = <degree>
			Pos = (0.0, 0.0)
			texture = meter_challenge_led
		}
		<degree> = (<degree> + <dx>)
		<cnt> = (<cnt> + 1)
		repeat ($challange_meter_num_ticks)
		<fill_challenge_meter> = 0
		if isSinglePlayerGame
			if ($ui_song_breakdown_already_animated_stats = 1)
				<fill_challenge_meter> = 1
			endif
		else
			<fill_challenge_meter> = 1
		endif
		if ((<from_pause_menu> = 1) || (<fill_challenge_meter> = 1))
			band_params = {}
			if (<is_band> = 1)
				AddParam \{structure_name = band_params
					Name = isband
					value = 1}
			endif
			quickplay_targeting_player_get_result Player = <Player>
			<is_targeting_friend> = 1
			if (<Result> = not_targeting_player)
				<is_targeting_friend> = 0
			endif
			if NOT checksumequals a = <player_challenge_id> b = <target_instance_name>
				<is_targeting_friend> = 0
			endif
			fill_challenge_meter_to {
				percent = <percent_to_next>
				Player = <Player>
				level = <level>
				highest_completed = <highest_completed>
				challenge_meter_id = <hud_challenge_meter_id>
				use_friend_target = <is_targeting_friend>
				<band_params>
			}
		endif
	endif
endscript

script song_breakdown_animate_award_points_text_spawned \{total_time = !f1768515945
		Player = !i1768515945}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		quickplay_get_overall_awards_progress Player = <Player>
		quickplay_get_recent_award_points Player = <Player>
		<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
		<time_per_point> = 0.1
		if (<total_time> > 0.0)
			if (<recent_award_points> > 0)
				<time_per_point> = (<total_time> / <recent_award_points>)
			endif
		endif
		<starting_recent_award_points> = 0
		<song_star_total> = <recent_award_points>
		begin
		<starting_award_points_total> = (<starting_award_points_total> + 1)
		<starting_recent_award_points> = (<starting_recent_award_points> + 1)
		<song_star_total> = (<song_star_total> - 1)
		if (<starting_award_points_total> > <current_award_points_total>)
			break
		endif
		formatText TextName = award_points_song_main_text qs(0xffe94857) t = <song_star_total>
		formatText TextName = total_points_main_text qs(0x0204c31d) t = <starting_award_points_total> usecommas
		song_breakdown_noncompetitive_id :se_setprops {
			total_points_main_text = <total_points_main_text>
		}
		song_breakdown_noncompetitive_id :se_waitprops
		Wait <time_per_point> Seconds
		repeat <recent_award_points>
		song_breakdown_noncompetitive_id :se_setprops \{star_highlight_alpha = 0.0
			star_total_anim_alpha = 0.0
			star_total_anim2_alpha = 0.0}
	endif
endscript

script song_breakdown_animate_award_points_meter_spawned \{total_time = !f1768515945
		Player = !i1768515945}
	<meter_width> = 264.0
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		quickplay_get_overall_awards_progress Player = <Player>
		quickplay_get_recent_award_points Player = <Player>
		<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
		quickplay_find_award_point_level award_points = <starting_award_points_total>
		if (<at_max_level> = 0)
			<previous_award_point_level> = <award_point_level>
			song_breakdown_noncompetitive_id :se_setprops \{award_points_menu_alpha = 1.0
				total_pts_alpha = 1.0
				star_total_scale = 1.0
				time = 0.2}
			quickplay_find_award_point_level award_points = <current_award_points_total>
			quickplay_get_outro_percentages {
				previous_points = <starting_award_points_total>
				current_points = <current_award_points_total>
				previous_level = <previous_award_point_level>
				current_level = <award_point_level>
			}
			quickplay_get_next_threshold level = <previous_award_point_level>
			<passed_a_level> = 0
			<full_levels_passed> = 0
			if ((<award_point_level> - <previous_award_point_level>) > 0)
				<passed_a_level> = 1
				<full_levels_passed> = (<award_point_level> - <previous_award_point_level> - 1)
			endif
			<start_percentage_int> = (<start_percentage> * 100)
			CastToInteger \{start_percentage_int}
			formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <starting_award_points_total>)
			formatText TextName = level_text qs(0x801f5b44) l = (<previous_award_point_level> + 1)
			song_breakdown_noncompetitive_id :se_setprops {
				award_points_label_text = <level_text>
				award_points_percentage_text = <percentage_text>
				award_points_percentage_alpha = 1
				award_points_fill_pos = (((1.0, 0.0) * (<start_percentage> * <meter_width> - 263.0)) + ((0.0, 1.0) * 5))
			}
			Wait \{0.2
				Seconds}
			song_breakdown_noncompetitive_id :se_waitprops
			if (<passed_a_level> = 0)
				if ((<end_percentage> - <start_percentage>) <= 0.0)
					<time_per_percentage_point> = 0.0
				else
					<time_per_percentage_point> = ((<total_time> * 1.0) / ((<end_percentage> - <start_percentage>) * 100.0))
				endif
			else
				<diff_percent_from_start> = ((1.0 - <start_percentage>) * 100.0)
				<diff_percent_to_end> = (<end_percentage> * 100.0)
				<full_levels_passed_percentage> = (<full_levels_passed> * 100.0)
				if ((<diff_percent_from_start> + <diff_percent_to_end> + <full_levels_passed_percentage>) = 0.0)
					<time_per_percentage_point> = 0.0
				else
					<time_per_percentage_point> = ((<total_time> * 1.0) / (<diff_percent_from_start> + <diff_percent_to_end> + <full_levels_passed_percentage>))
				endif
				roundtointeger \{diff_percent_from_start}
				if (<diff_percent_from_start> > 0)
					if (<time_per_percentage_point> < 0)
						time_per_percentage_point = 0
					endif
					begin
					<start_percentage> = (<start_percentage> + 0.01)
					<start_percentage_int> = (<start_percentage> * 100.0)
					roundtointeger \{start_percentage_int}
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_fill_pos = (((1.0, 0.0) * (<start_percentage> * <meter_width> - 263.0)) + ((0.0, 1.0) * 5))
						time = <time_per_percentage_point>
					}
					Wait <time_per_percentage_point> Seconds
					repeat <diff_percent_from_start>
				endif
				<award_point_level> = <previous_award_point_level>
				if (<full_levels_passed> > 0)
					begin
					<award_point_level> = (<award_point_level> + 1)
					formatText TextName = level_text qs(0x801f5b44) l = (<award_point_level> + 1)
					quickplay_get_next_threshold level = (<award_point_level> - 1)
					<previous_threshold> = <next_threshold>
					quickplay_get_next_threshold level = <award_point_level>
					formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <previous_threshold>)
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_label_text = <level_text>
						award_points_label_scale = 1.2
						award_points_percentage_text = <percentage_text>
						award_points_fill_pos = (-263.0, 5.0)
					}
					Wait \{0.1
						Seconds}
					song_breakdown_noncompetitive_id :se_waitprops
					song_breakdown_noncompetitive_id :se_setprops \{award_points_label_scale = 1.0}
					Wait \{0.1
						Seconds}
					song_breakdown_noncompetitive_id :se_waitprops
					<start_percentage> = 0.0
					if (<time_per_percentage_point> < 0)
						time_per_percentage_point = 0
					endif
					begin
					<start_percentage> = (<start_percentage> + 0.01)
					<start_percentage_int> = (<start_percentage> * 100.0)
					roundtointeger \{start_percentage_int}
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_fill_pos = (((1.0, 0.0) * (<start_percentage> * <meter_width> - 263.0)) + ((0.0, 1.0) * 5))
						time = <time_per_percentage_point>
					}
					Wait <time_per_percentage_point> Seconds
					repeat 100
					repeat <full_levels_passed>
				endif
				<award_point_level> = (<award_point_level> + 1)
				GetArraySize ($award_point_progression)
				if (<award_point_level> < (<array_Size> + 1))
					formatText TextName = level_text qs(0x801f5b44) l = (<award_point_level> + 1)
					quickplay_get_next_threshold level = (<award_point_level> - 1)
					<previous_threshold> = <next_threshold>
					quickplay_get_next_threshold level = <award_point_level>
					if (<at_max_level> = 1)
						<level_text> = qs(0xac31afea)
					endif
					formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <previous_threshold>)
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_label_text = <level_text>
						award_points_label_scale = 1.2
						award_points_percentage_text = <percentage_text>
						award_points_fill_pos = (-263.0, 5.0)
					}
					song_breakdown_noncompetitive_id :se_waitprops
					Wait \{0.1
						Seconds}
					song_breakdown_noncompetitive_id :se_setprops \{award_points_label_scale = 1.0}
					Wait \{0.1
						Seconds}
					song_breakdown_noncompetitive_id :se_waitprops
				else
					song_breakdown_noncompetitive_id :se_setprops {
						stars_to_next_level_alpha = 0.0
						max_level_text_alpha = 1.0
						award_points_fill_pos = (((1.0, 0.0) * (<meter_width> - 263.0)) + ((0.0, 1.0) * 5))
					}
				endif
			endif
			GetArraySize ($award_point_progression)
			if (<award_point_level> < (<array_Size> + 1))
				<end_percentage_int> = (<end_percentage> * 100)
				roundtointeger \{end_percentage_int}
				if (<passed_a_level> = 1)
					<start_percentage> = 0.0
					num_loops = <end_percentage_int>
				else
					<start_percentage_int> = (<start_percentage> * 100)
					roundtointeger \{start_percentage_int}
					num_loops = (<end_percentage_int> - <start_percentage_int>)
				endif
				if (<num_loops> > 0)
					if (<time_per_percentage_point> < 0)
						time_per_percentage_point = 0
					endif
					begin
					<start_percentage> = (<start_percentage> + 0.01)
					<start_percentage_int> = (<start_percentage> * 100.0)
					roundtointeger \{start_percentage_int}
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_fill_pos = (((1.0, 0.0) * (<start_percentage> * <meter_width> - 263.0)) + ((0.0, 1.0) * 5))
						time = <time_per_percentage_point>
					}
					Wait <time_per_percentage_point> Seconds
					repeat <num_loops>
					quickplay_get_outro_percentages {
						previous_points = <starting_award_points_total>
						current_points = <current_award_points_total>
						previous_level = <previous_award_point_level>
						current_level = <award_point_level>
					}
					<max_level_params> = {}
					quickplay_get_next_threshold level = <award_point_level>
					if (<at_max_level> = 1)
						<max_level_params> = {
							award_points_label_text = qs(0xac31afea)
						}
					endif
					formatText TextName = percentage_text qs(0x66680619) p = (<next_threshold> - <current_award_points_total>)
					song_breakdown_noncompetitive_id :se_setprops {
						award_points_percentage_text = <percentage_text>
						<max_level_params>
					}
				endif
			endif
		endif
	endif
endscript

script song_breakdown_qp_check_for_rewards 
	getnumplayersingame \{local}
	<has_unlocked_rewards> = 0
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		progression_quickplay_get_rewards_just_unlocked Player = <Player>
		GetArraySize <rewards_just_unlocked>
		if (<array_Size> > 0)
			<has_unlocked_rewards> = 1
			break
		endif
		getnextplayer local Player = <Player>
		repeat <num_players>
	endif
	return has_unlocked_rewards = <has_unlocked_rewards>
endscript

script song_breakdown_reveal_qp_badges \{badge_menu_id = !q1768515945
		Player = !i1768515945}
	if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
		if GetScreenElementChildren id = <badge_menu_id>
			GetArraySize <children>
			<num_badges> = <array_Size>
			<badge_menu_children> = <children>
			if (<num_badges> > 0)
				song_breakdown_noncompetitive_id :GetSingleTag \{current_song_star_total}
				<i> = 0
				begin
				SpawnScriptNow \{audio_delay_icon_appear}
				(<badge_menu_children> [<i>]) :se_setprops {
					Scale = 1.2
					alpha = 1
					time = 0.2
				}
				(<badge_menu_children> [<i>]) :se_waitprops
				song_breakdown_noncompetitive_id :se_setprops \{star_highlight_alpha = 0.0
					time = 0.1}
				(<badge_menu_children> [<i>]) :se_setprops {
					Scale = 1.0
					time = 0.2
				}
				(<badge_menu_children> [<i>]) :se_waitprops
				if NOT ScreenElementExists id = (<badge_menu_children> [<i>])
					return
				endif
				container_parent_created = 0
				(<badge_menu_children> [<i>]) :GetSingleTag container_parent_created
				<hud_challenge_meter_id> = (<badge_menu_children> [<i>])
				if (<container_parent_created> = 1)
					GetScreenElementChildren id = (<badge_menu_children> [<i>])
					GetArraySize <children>
					if (<array_Size> != 1)
						ScriptAssert \{'Incorrect number of children for quickplay badge container!'}
					endif
					<hud_challenge_meter_id> = (<children> [0])
				endif
				quickplay_targeting_player_get_result Player = <Player>
				<is_targeting_friend> = 1
				if (<Result> = not_targeting_player)
					<is_targeting_friend> = 0
				endif
				if <hud_challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
					if (<badge_menu_children> [<i>]) :GetSingleTag challenge_stats
						<player_challenge_id> = (<challenge_stats>.instance_name)
						if NOT checksumequals a = <player_challenge_id> b = <target_instance_name>
							<is_targeting_friend> = 0
						endif
						<level> = (<challenge_stats>.challenge_grade)
						if GMan_GoalIsActive goal = <player_challenge_id>
							gman_getdata goal = <player_challenge_id> Player = <Player> Name = current_progress
							gman_getdata goal = <player_challenge_id> Player = <Player> Name = calculated_targets
						else
							current_progress = (<challenge_stats>.current_progress)
							calculated_targets = (<challenge_stats>.calculated_targets)
						endif
						GetArraySize <calculated_targets>
						if (<array_Size> != 3)
							ScriptAssert 'Incorrect number of challenge levels for challenge %t' t = (<challenge_stats>.goal_name)
						endif
						song_breakdown_get_highest_completed_challenge_level {
							gold_level = ((<calculated_targets> [0]) * 1.0)
							platinum_level = ((<calculated_targets> [1]) * 1.0)
							diamond_level = ((<calculated_targets> [2]) * 1.0)
							current_progress = (<current_progress> * 1.0)
							is_targeting_friend = <is_targeting_friend>
							player_challenge_id = <player_challenge_id>
						}
						<points_earned_for_challenge> = 0
						if ((<challenge_stats>.challenge_grade) > 0)
							<points_earned_for_challenge> = (<challenge_stats>.challenge_grade)
						endif
						if (<level> < 1)
							fill_challenge_meter_to {
								percent = <percent_to_next>
								Player = <Player>
								level = <level>
								challenge_meter_id = <hud_challenge_meter_id>
								use_friend_target = <is_targeting_friend>
								animate_meter = 1
							}
						else
							<level_count> = 1
							<fill_percent_to_next> = 0.0
							<animate_meter> = 0
							begin
							if (<level_count> = <level>)
								<fill_percent_to_next> = <percent_to_next>
								if NOT ((<fill_percent_to_next> = 0.0) || (<level_count> = 3))
									<animate_meter> = 1
								endif
							endif
							fill_challenge_meter_to {
								percent = <fill_percent_to_next>
								Player = <Player>
								level = <level_count>
								challenge_meter_id = <hud_challenge_meter_id>
								animate_meter = <animate_meter>
								use_friend_target = <is_targeting_friend>
							}
							<level_count> = (<level_count> + 1)
							Wait \{0.2
								Seconds}
							repeat <level>
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <num_badges>
			endif
		endif
	endif
endscript

script song_breakdown_apply_career_medallion_progress \{wait_time = 0.0
		song_stars_earned = !i1768515945
		current_total_stars = !i1768515945
		stars_needed_for_transform = !i1768515945
		stars_needed_for_max = !i1768515945
		apply_initial = 0
		desc_id = song_breakdown_noncompetitive_id
		use_16_textures = 0
		force_stats_finished_animating = 0
		animating_callback = nullscript
		apply_blue_flame = 0
		stop_at_blue = 0
		encore_completed = 1
		force_red_fill = 0
		domination_unlocked = 0}
	if (<desc_id> = song_breakdown_noncompetitive_id)
		<desc_id> :desc_resolvealias Name = alias_meter_transform param = meter_transform_id
	else
		<meter_transform_id> = <desc_id>
	endif
	if NOT ScreenElementExists id = <meter_transform_id>
		return
	endif
	if <meter_transform_id> :desc_resolvealias Name = alias_challenge_led_container param = led_cont_id
		<starting_total_stars> = (<current_total_stars> - <song_stars_earned>)
		<blue_to_red> = 0
		<use_red_meter> = 0
		<num_fill_loops> = 1
		if (((<starting_total_stars> < <stars_needed_for_transform> || <encore_completed> = 0) && <stars_needed_for_transform> != 0) || <domination_unlocked> = 1)
			<max_stars> = <stars_needed_for_transform>
			if (<apply_initial> = 0)
				if (<current_total_stars> > <stars_needed_for_transform> && <stop_at_blue> = 0)
					<blue_to_red> = 1
					<num_fill_loops> = 2
				endif
			endif
		else
			<max_stars> = <stars_needed_for_max>
			if (<stop_at_blue> = 0)
				<use_red_meter> = 1
			endif
		endif
		if (<apply_initial> = 0)
			if (<max_stars> > 0)
				<starting_percent> = ((<starting_total_stars> * 1.0) / (<max_stars> * 1.0))
				<percent_done> = ((<current_total_stars> * 1.0) / (<max_stars> * 1.0))
			else
				starting_percent = 0.0
				percent_done = 1.0
			endif
		else
			<starting_percent> = 0
			if (<max_stars> > 0)
				<percent_done> = ((<starting_total_stars> * 1.0) / (<max_stars> * 1.0))
			else
				<percent_done> = 1.0
			endif
		endif
		if (<percent_done> > 1.0)
			<percent_done> = 1.0
		endif
		if (<force_red_fill> = 1)
			use_red_meter = 1
		endif
		begin
		<diff_percent> = (<percent_done> - <starting_percent>)
		if (<diff_percent> > 0)
			<final_angle> = (360.0 * <starting_percent>)
			<rot_angle> = 0
			if (<use_16_textures> = 1)
				<angle_to_add> = (360.0 / 16.0)
				begin
				if (<rot_angle> + <angle_to_add> > <final_angle>)
					break
				endif
				<rot_angle> = (<rot_angle> + <angle_to_add>)
				repeat
			else
				<rot_angle> = (360 * <starting_percent>)
			endif
			if (<diff_percent> > 0.0)
				<wait_time_per_sprite> = (<wait_time> / (<diff_percent> * 100.0))
			else
				<wait_time_per_sprite> = 0.0
			endif
			if NOT ScreenElementExists id = <led_cont_id>
				return
			endif
			<led_cont_id> :se_setprops alpha = 1
			song_breakdown_create_medallion_progress {
				parent = <led_cont_id>
				start_rot_angle = <rot_angle>
				percent_to_stop = <percent_done>
				use_red = <use_red_meter>
				wait_time_per_sprite = <wait_time_per_sprite>
				use_16_textures = <use_16_textures>
			}
			if (<percent_done> >= 1.0 || <domination_unlocked> = 1)
				if NOT ScreenElementExists id = <led_cont_id>
					return
				endif
				<stats_finished_animating> = 0
				if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
					song_breakdown_noncompetitive_id :GetSingleTag \{stats_finished_animating}
				endif
				if (<domination_unlocked> = 1)
					use_red_meter = 0
				endif
				if (<force_stats_finished_animating> = 1)
					<stats_finished_animating> = 1
				endif
				if (<stats_finished_animating> = 0)
					if GotParam \{quest_breakdown}
						SoundEvent \{event = audio_ui_career_medallion_flip_encore}
					else
						if (<domination_unlocked> = 0)
							SoundEvent \{event = audio_ui_career_medallion_flip}
						endif
					endif
					if (<stop_at_blue> = 0 && <domination_unlocked> = 0)
						<led_cont_id> :se_setprops alpha = 0
					endif
					if NOT ScreenElementExists id = <meter_transform_id>
						return
					endif
					<meter_transform_id> :desc_resolvealias Name = alias_meter_scale_map param = meter_scale_map_id
					<meter_scale_map_id> :obj_spawnscript ui_scale_transform_meter
					Wait (0.2 * $g_domination_anim_speed) Seconds
					if NOT ScreenElementExists id = <meter_transform_id>
						return
					endif
					<meter_transform_id> :Obj_SpawnScriptNow <animating_callback> params = <animating_callback_params>
					<meter_transform_id> :Obj_SpawnScriptNow create_ui_medalion_particles params = {Pos = (-38.0, -30.0)}
					Wait (0.2 * $g_domination_anim_speed) Seconds
					if NOT ScreenElementExists id = <meter_transform_id>
						return
					endif
					if (<use_red_meter> > 0)
						SoundEvent \{event = audio_ui_career_medallion_explode}
						<meter_transform_id> :se_setprops {
							transformed_fx_final_alpha = 1.0
							transformed_fx_alpha = 0.0
							time = (0.2 * $g_domination_anim_speed)
						}
					elseif (<encore_completed> = 0)
						<meter_transform_id> :se_setprops {
							transformed_fx_final_alpha = 0.0
							time = (0.2 * $g_domination_anim_speed)
						}
					endif
					if NOT ScreenElementExists id = <meter_transform_id>
						return
					endif
				elseif (<encore_completed> = 1)
					if NOT ScreenElementExists id = <led_cont_id>
						return
					endif
					<led_cont_id> :se_setprops alpha = 0
					if (<use_red_meter> > 0)
						<meter_transform_id> :se_setprops {
							transformed_fx_final_alpha = 1.0
						}
					else
					endif
				endif
			endif
		endif
		if (<blue_to_red> = 1)
			<blue_to_red> = 0
			starting_percent = 0.0
			<percent_done> = ((<current_total_stars> * 1.0) / (<stars_needed_for_max> * 1.0))
			if (<percent_done> > 1.0)
				<percent_done> = 1.0
			endif
			<use_red_meter> = 1
			DestroyScreenElement id = <led_cont_id> preserve_parent
		endif
		repeat <num_fill_loops>
	endif
	if ($g_domination_anim_speed != $g_domination_anim_default)
		Change g_domination_anim_speed = ($g_domination_anim_speed * $g_domination_anim_accelerator)
	endif
endscript

script song_breakdown_create_medallion_progress \{parent = !q1768515945
		start_rot_angle = !f1768515945
		percent_to_stop = !f1768515945
		use_red = 0
		wait_time_per_sprite = 0.0
		use_16_textures = 0
		play_slow_fill_sfx = 0}
	if (<use_red> = 0)
		if (<use_16_textures> = 1)
			<medallion_texture> = medalion_meter_16
		else
			<medallion_texture> = medalion_meter
		endif
	else
		if (<use_16_textures> = 1)
			<medallion_texture> = medalion_meter_red_16
		else
			<medallion_texture> = medalion_meter_red
		endif
	endif
	if (<use_16_textures> = 0 && <percent_to_stop> > 0.96999997 && <percent_to_stop> < 1.0)
		percent_to_stop = 0.96999997
	endif
	<final_check_angle> = (360.0 * <percent_to_stop>)
	<angle_to_add> = 1
	<offset> = 0
	if (<use_16_textures> = 1)
		<offset> = 8
		<angle_to_add> = (360.0 / 16.0)
		<final_check_angle> = ((360.0 * <percent_to_stop>) + <offset> - <angle_to_add>)
	endif
	<start_rot_angle> = (<start_rot_angle> + <offset>)
	if ((<wait_time_per_sprite> > 0) && (<angle_to_add> = 1))
		last_song_played = ($last_song_played)
		if NOT (<last_song_played> = ($quest_chapter_finale.songs [2]))
			<play_slow_fill_sfx> = 1
			SoundEvent \{event = stats_screen_loop}
		endif
	elseif ((<wait_time_per_sprite> > 0) && (<angle_to_add> > 10))
		<play_slow_fill_sfx> = 0
		SpawnScriptNow audio_medallion_status_logic_fast params = {percentage = <percent_to_stop>}
	endif
	begin
	if (<start_rot_angle> > <final_check_angle>)
		StopSoundEvent \{stats_screen_loop
			fade_type = linear
			fade_time = 0.1}
		break
	endif
	if NOT ScreenElementExists id = <parent>
		return
	endif
	if (<play_slow_fill_sfx> = 1)
		<loop_pitch> = (((<start_rot_angle> - 360) / 50) + 2)
		printf channel = sfx 'pitch=%s' s = <loop_pitch>
		SetSoundParams stats_screen_loop pitch = <loop_pitch>
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <medallion_texture>
		rgba = [255 255 255 255]
		rot_angle = <start_rot_angle>
		just = [center center]
		pos_anchor = [center center]
		Pos = (0.0, -1.0)
		alpha = 1.0
		z_priority = 104
	}
	<start_rot_angle> = (<start_rot_angle> + <angle_to_add>)
	if (<wait_time_per_sprite> > 0.0)
		Wait <wait_time_per_sprite> Seconds
	endif
	repeat
endscript

script song_breakdown_retry_challenge \{device_num = !i1768515945}
	quickplay_unload_challenges \{reset_targets = 0}
	if (<device_num> = ($primary_controller))
		if inroadiebattlemode
			gman_getdata \{goal = quickplay
				Name = targeted_challenge}
			if (<targeted_challenge> != NULL)
				roadie_battle_goto_ds_menu \{aids = $roadie_battle_signed_in_ds_aids
					menu_name = challenge}
			endif
		endif
		ui_sfx \{menustate = Generic
			uitype = select}
		if ScreenElementExists \{id = song_breakdown_noncompetitive_id}
			song_breakdown_noncompetitive_id :se_setprops \{block_events}
			LaunchEvent \{Type = unfocus
				target = song_breakdown_noncompetitive_id}
		elseif ScreenElementExists \{id = qp_earned_stars_screen_id}
			qp_earned_stars_screen_id :se_setprops \{block_events}
			LaunchEvent \{Type = unfocus
				target = qp_earned_stars_screen_id}
		endif
		create_loading_screen
		Change \{songtime_paused = 0}
		Change \{gameplay_restart_song = 1}
		generic_event_back \{state = Uistate_gameplay}
	endif
endscript

script in_song_breakdown_state 
	if ui_event_exists_in_stack \{Name = 'song_breakdown'
			above = 'gameplay'}
		return \{true}
	elseif ui_event_exists_in_stack \{Name = 'song_breakdown_competitive'
			above = 'gameplay'}
		return \{true}
	elseif ui_event_exists_in_stack \{Name = 'song_breakdown_shreddfest_match_complete'
			above = 'gameplay'}
		return \{true}
	endif
	return \{FALSE}
endscript

script song_breakdown_transition_to_qp_earned_stars 
	gamemode_gettype
	if NOT isSinglePlayerGame
		ScriptAssert \{'Transitioning to earned stars screen when not playing a singleplayer game!'}
	elseif (<Type> != quickplay)
		ScriptAssert \{'Transitioning to earned stars screen when not playing a quickplay game!'}
	endif
	song_breakdown_noncompetitive_id :se_setprops \{block_events}
	LaunchEvent \{Type = unfocus
		target = song_breakdown_noncompetitive_id}
	song_breakdown_noncompetitive_id :GetSingleTag \{transition_param}
	printf channel = wilson qs(0xdefc7c48) t = <transition_param>
	ui_sfx \{menustate = Generic
		uitype = select}
	generic_event_choose {
		state = uistate_qp_earned_stars
		data = {
			transition_param = <transition_param>
		}
	}
endscript

script song_breakdown_check_for_earned_stars_transition 
	gamemode_gettype
	<go_to_earned_stars> = 0
	if isSinglePlayerGame
		if (<Type> = quickplay)
			if (($last_song_played) != jamsession)
				<go_to_earned_stars> = 1
			endif
		endif
	endif
	return go_to_earned_stars = <go_to_earned_stars>
endscript

script challenge_frame 
	song_breakdown_noncompetitive_id :se_setprops \{challenge_frame_pos = (-500.0, 0.0)
		challenge_frame_alpha = 0.0
		time = 0.2
		motion = ease_in}
	Wait \{0.2
		Seconds}
	song_breakdown_noncompetitive_id :se_setprops \{challenge_frame_pos = (10.0, 0.0)
		challenge_frame_alpha = 0.5
		time = 0.2
		motion = ease_out}
	Wait \{0.2
		Seconds}
	song_breakdown_noncompetitive_id :se_setprops \{challenge_frame_pos = (0.0, 0.0)
		challenge_frame_alpha = 1.0
		time = 0.1
		motion = ease_in}
	Wait \{0.1
		Seconds}
endscript

script career_meter_anim_in 
	song_breakdown_noncompetitive_id :se_setprops \{meter_transform_scale = (0.0, 0.0)
		frame_anim_pos = (0.0, 100.0)
		frame_anim_alpha = 0.0
		time = 0.2
		motion = ease_in}
	Wait \{0.2
		Seconds}
	song_breakdown_noncompetitive_id :se_setprops \{meter_transform_scale = (0.95, 0.95)
		frame_anim_pos = (0.0, -20.0)
		frame_anim_alpha = 1.0
		time = 0.2
		motion = ease_out}
	Wait \{0.2
		Seconds}
	song_breakdown_noncompetitive_id :se_setprops \{meter_transform_scale = (0.75, 0.75)
		frame_anim_pos = (0.0, 0.0)
		time = 0.1
		motion = ease_in}
	Wait \{0.1
		Seconds}
endscript

script wii_is_broadcast_allowed 
	is_broadcast_allowed = 0
	if social_networks_broadcast_allowed
		<is_broadcast_allowed> = 1
		if NOT facebook_check_is_registered_flag
			if NOT twitter_check_is_registered_flag
				<is_broadcast_allowed> = 0
				printf \{'nothing registered'}
			endif
		endif
	endif
	return is_broadcast_allowed = <is_broadcast_allowed>
endscript

script display_rival_add_available_notification 
	if InNetGame
		display_notification = 0
		getnumplayersingame \{remote}
		if (<num_players> > 0)
			getfirstplayer \{remote}
			begin
			getplayerinfo <Player> net_id_first
			getplayerinfo <Player> net_id_second
			net_id = [0 , 0]
			SetArrayElement ArrayName = net_id index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = net_id index = 1 NewValue = <net_id_second>
			band_lobby_get_rival_op net_id = <net_id>
			if (<rival_op> = add)
				<display_notification> = 1
				break
			endif
			RemoveParameter \{net_id}
			getnextplayer Player = <Player> remote
			repeat <num_players>
		endif
		if (<display_notification> = 1)
			displaynotification high_priority text = ($wii_notification_strings.rival_add_available) Type = rival
		endif
	endif
endscript
