
script ui_init_quest_breakdown 
	Change \{respond_to_signin_changed = 1}
	Change \{respond_to_signin_changed_all_players = 1}
	Change \{respond_to_signin_changed_func = None}
	Change \{songtime_paused = 1}
	Change \{playing_song = 0}
	social_networks_broadcast_init
	disable_pause
endscript

script ui_deinit_quest_breakdown 
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		if ($shutdown_game_for_signin_change_flag = 1 || ($g_connection_loss_dialogue = 1 && $is_network_game = 1))
			wait_for_start_gem_scroller_completion
		endif
	endif
endscript

script ui_create_quest_breakdown \{starttime = !i1768515945
		restart = 1}
	if ScreenElementExists \{id = song_outro_anims_container}
		DestroyScreenElement \{id = song_outro_anims_container}
	endif
	get_song_title song = ($last_song_played)
	<stat_params> = {
		song_summary_score_star_texture = songlist_star_full
		headline_text = <song_title>
	}
	using_single_player_screen = 0
	getnumplayersingame
	if (<num_players> > 1)
		AddParam \{structure_name = stat_params
			Name = song_summary_sp_alpha
			value = 0}
		AddParam \{structure_name = stat_params
			Name = song_summary_mp_alpha
			value = 1}
		getfirstplayer
		getplayerinfo <Player> Band
		<stars> = ($song_stats_backup_band [(<Band> - 1)].stars)
		<score> = ($song_stats_backup_band [(<Band> - 1)].score)
		CastToInteger \{score}
		formatText TextName = stars_text qs(0x76b3fda7) d = <stars>
		AddParam structure_name = stat_params Name = stars_text value = <stars_text>
		formatText TextName = score_text qs(0x76b3fda7) d = <score> usecommas
		AddParam structure_name = stat_params Name = score_text value = <score_text>
		free_slot = 1
		begin
		get_fullname_for_player Player = <Player> no_character_names
		formatText checksumName = textnamechecksum 'name_P%d_text' d = <free_slot>
		formatText TextName = <textnamechecksum> qs(0x73307931) s = <fullname>
		AddParam structure_name = stat_params Name = <textnamechecksum> value = (<...>.<textnamechecksum>)
		get_percent_notes_hit player_index = <Player>
		formatText checksumName = textnamechecksum 'metric_P%d_text' d = <free_slot>
		formatText TextName = <textnamechecksum> qs(0x6cd5ba93) s = <percent_notes_hit>
		AddParam structure_name = stat_params Name = <textnamechecksum> value = (<...>.<textnamechecksum>)
		getplayerinfo <Player> part
		formatText checksumName = textnamechecksum 'icon_instrument_P%d_fill_texture' d = <free_slot>
		formatText checksumName = <textnamechecksum> 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
		AddParam structure_name = stat_params Name = <textnamechecksum> value = (<...>.<textnamechecksum>)
		formatText checksumName = textnamechecksum 'icon_instrument_P%d_out_texture' d = <free_slot>
		formatText checksumName = <textnamechecksum> 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
		AddParam structure_name = stat_params Name = <textnamechecksum> value = (<...>.<textnamechecksum>)
		formatText checksumName = textnamechecksum 'icon_instrument_P%d_alpha' d = <free_slot>
		AddParam structure_name = stat_params Name = <textnamechecksum> value = 1
		free_slot = (<free_slot> + 1)
		getnextplayer Player = <Player>
		repeat <num_players>
		<alias_meter_transform> = alias_meter_mp_transform
	else
		using_single_player_screen = 1
		AddParam \{structure_name = stat_params
			Name = song_summary_sp_alpha
			value = 1}
		AddParam \{structure_name = stat_params
			Name = song_summary_mp_alpha
			value = 0}
		getfirstplayer
		ui_song_breakdown_get_basic_player_data player_index = <Player>
		getavgmultiplierfromdetailedstats Player = <Player>
		formatText TextName = stars_text qs(0x76b3fda7) d = <stars>
		formatText TextName = multiplier_text qs(0xc5ac21c2) d = <avg_multiplier> DecimalPlaces = 1
		formatText TextName = score_text qs(0x76b3fda7) d = <score> usecommas
		AddParam structure_name = stat_params Name = score_text value = <score_text>
		AddParam structure_name = stat_params Name = stars_text value = <stars_text>
		AddParam structure_name = stat_params Name = streak_text value = <streak_text>
		AddParam structure_name = stat_params Name = accuracy_text value = <percent_text>
		AddParam structure_name = stat_params Name = multiplier_text value = <multiplier_text>
		<alias_meter_transform> = alias_meter_sp_transform
	endif
	if InNetGame
		event_handlers = [
			{pad_choose ui_net_quest_breakdown_continue}
		]
	else
		event_handlers = [
			{pad_choose ui_quest_transformation_continue}
		]
	endif
	getplayerinfo ($g_leader_player_num) controller
	CreateScreenElement {
		Type = descinterface
		desc = 'song_summary_mini'
		parent = root_window
		id = questbreakdownid
		<stat_params>
		exclusive_device = <controller>
		event_handlers = <event_handlers>
	}
	getsavegamefromcontroller controller = ($primary_controller)
	<current_chapter> = ($current_chapter)
	<hero_info> = ($<current_chapter>.hero_info)
	quest_get_char_icon hero_name_nl = ($<hero_info>.name_nl) chapter_name = <current_chapter>
	quest_progression_get_number_of_stars_earned savegame = <savegame> chapter_global = <current_chapter>
	<stars_needed_for_transform> = ($<current_chapter>.stars_for_encore)
	if quest_progression_is_chapter_finale
		quest_progression_get_current_song_num
		if (<song_num> = 1)
			<stars_needed> = ($<current_chapter>.stars_for_song1)
		elseif (<song_num> = 2)
			<stars_needed> = ($<current_chapter>.stars_for_song2)
		endif
		ui_quest_show_only_meter move_meter = <using_single_player_screen>
	endif
	<stars_needed_for_max> = ($<current_chapter>.stars_for_reward)
	get_savegame_from_controller controller = ($primary_controller)
	if quest_progression_is_chapter_rush
		do_special_breakdown = 1
	elseif quest_progression_is_chapter_finale
		do_special_breakdown = 1
	else
		do_special_breakdown = 0
		start_crowd_surging_sfx_over_preencore_ministats_screen
	endif
	stop_at_blue = 1
	if (<do_special_breakdown> = 1)
		songs_array = ($<current_chapter>.songs)
		GetArraySize <songs_array> param = num_songs
		song_num = 1
		counter = 0
		last_song = ($last_song_played)
		playlist_getcurrentsong
		begin
		if ($last_song_played = (<songs_array> [<counter>]))
			song_num = (<counter> + 1)
			break
		endif
		counter = (<counter> + 1)
		repeat <num_songs>
		<one_fraction> = ((1.0 / <num_songs>) * 100.0)
		CastToInteger \{one_fraction}
		<stars> = <one_fraction>
		<stars_earned> = (<one_fraction> * <song_num>)
		<stars_needed_for_transform> = 100
		<stars_needed_for_max> = 300
		ui_quest_show_only_meter move_meter = <using_single_player_screen>
		force_red_fill = 1
		force_stats_finished_animating = 0
		stop_at_blue = 0
	endif
	<prev_stars_done> = (<stars_earned> - <stars>)
	questbreakdownid :desc_resolvealias \{Name = alias_meter_sp_transform}
	<resolved_id> :se_setprops icon_character_texture = <character_texture>
	questbreakdownid :desc_resolvealias \{Name = alias_meter_mp_transform}
	<resolved_id> :se_setprops icon_character_texture = <character_texture>
	if quest_progression_is_chapter_finale
		last_song_played = ($last_song_played)
		if (<last_song_played> = ($quest_chapter_finale.songs [0]))
			stars = 5
			stars_earned = 5
			stars_needed_for_transform = 10
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 1
		elseif (<last_song_played> = ($quest_chapter_finale.songs [1]))
			stars = 5
			stars_earned = 10
			stars_needed_for_transform = 10
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 1
		elseif (<last_song_played> = ($quest_chapter_finale.songs [2]))
			stars = 0
			stars_earned = 15
			stars_needed_for_transform = 15
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 0
		endif
	endif
	questbreakdownid :desc_resolvealias Name = <alias_meter_transform>
	song_breakdown_apply_career_medallion_progress {
		song_stars_earned = <stars>
		current_total_stars = <stars_earned>
		stars_needed_for_transform = <stars_needed_for_transform>
		stars_needed_for_max = <stars_needed_for_max>
		apply_initial = 1
		desc_id = <resolved_id>
		force_red_fill = <force_red_fill>
		force_stats_finished_animating = <force_stats_finished_animating>
		stop_at_blue = <stop_at_blue>
		quest_breakdown
	}
	quest_progression_get_chapter_tag savegame = ($primary_controller) chapter_global = <current_chapter> param = completed
	<apply_blue_flame> = 0
	if (<stars_earned> >= <stars_needed_for_transform> && <completed> = 0)
		<apply_blue_flame> = 1
	endif
	if quest_progression_is_chapter_finale
		last_song_played = ($last_song_played)
		if (<last_song_played> = ($quest_chapter_finale.songs [0]))
			stars = 5
			stars_earned = 5
			stars_needed_for_transform = 10
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 1
			apply_blue_flame = 0
		elseif (<last_song_played> = ($quest_chapter_finale.songs [1]))
			stars = 5
			stars_earned = 10
			stars_needed_for_transform = 10
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 1
			apply_blue_flame = 0
		elseif (<last_song_played> = ($quest_chapter_finale.songs [2]))
			stars = 5
			stars_earned = 5
			stars_needed_for_transform = 10
			stars_needed_for_max = 15
			force_red_fill = 0
			stop_at_blue = 1
			apply_blue_flame = 0
		endif
	endif
	questbreakdownid :desc_resolvealias Name = <alias_meter_transform>
	song_breakdown_apply_career_medallion_progress {
		song_stars_earned = <stars>
		current_total_stars = <stars_earned>
		stars_needed_for_transform = <stars_needed_for_transform>
		stars_needed_for_max = <stars_needed_for_max>
		desc_id = <resolved_id>
		wait_time = 0.1
		animating_callback = ui_quest_breakdown_medallion_animating_callback
		apply_blue_flame = <apply_blue_flame>
		force_red_fill = <force_red_fill>
		force_stats_finished_animating = <force_stats_finished_animating>
		stop_at_blue = <stop_at_blue>
		quest_breakdown
	}
	if (<restart> = 1)
		SpawnScriptLater restart_gem_scroller params = {starttime = <starttime> practice_intro = 0 loading_transition = 1 no_render = 0}
	endif
endscript

script ui_quest_breakdown_medallion_animating_callback 
endscript

script ui_quest_breakdown_add_handlers 
	if NOT ScreenElementExists \{id = questbreakdownid}
		return
	endif
	if quest_progression_is_chapter_rush
		if InNetGame
			if IsHost
				sync_host_and_client \{callback = ui_quest_breakdown_continue}
			endif
		else
			ui_quest_breakdown_continue
		endif
	elseif quest_progression_is_chapter_finale
		if InNetGame
			if IsHost
				sync_host_and_client \{callback = ui_quest_breakdown_continue}
			endif
		else
			ui_quest_breakdown_continue
		endif
	else
		AssignAlias \{id = questbreakdownid
			alias = current_menu}
		LaunchEvent \{Type = focus
			target = current_menu}
		stop_crowd_surging_sfx_over_preencore_ministats_screen
		if InNetGame
			if IsHost
				sync_host_and_client \{callback = ui_quest_breakdown_continue}
			endif
		else
			ui_quest_breakdown_continue
		endif
	endif
endscript

script ui_quest_breakdown_broadcast_confirm 
	spawnscript \{ui_quest_breakdown_broadcast_return}
endscript

script ui_quest_breakdown_broadcast_cancel 
	spawnscript \{ui_quest_breakdown_broadcast_cancel_spawned}
endscript

script ui_quest_breakdown_broadcast_cancel_spawned 
	ui_event \{event = menu_back}
	ui_quest_breakdown_broadcast_return
endscript

script ui_quest_breakdown_broadcast_return 
	ui_event_wait_for_safe
	clean_up_user_control_helpers
	ui_quest_breakdown_add_handlers
endscript

script ui_destroy_quest_breakdown 
	if ScreenElementExists \{id = questbreakdownid}
		DestroyScreenElement \{id = questbreakdownid}
	endif
	clean_up_user_control_helpers
endscript

script ui_quest_breakdown_continue 
	Change \{songtime_paused = 0}
	generic_event_back \{nosound
		state = Uistate_gameplay}
	ui_destroy_quest_breakdown
endscript

script ui_quest_show_only_meter \{move_meter = 0}
	rush_offset = (400.0, 0.0)
	finale_offset = (220.0, 0.0)
	if ScreenElementExists \{id = questbreakdownid}
		questbreakdownid :se_setprops \{gradient_bg_alpha = 0.0
			frame_height_alpha = 0.0
			column_r_alpha = 0.0
			column_l_alpha = 0.0
			row_stripes_alpha = 0.0
			results_alpha = 0.0}
	endif
	if (<move_meter> = 1)
		if ScreenElementExists \{id = questbreakdownid}
			if quest_progression_is_chapter_rush
				questbreakdownid :se_setprops {
					song_summary_position_pos = {<rush_offset> relative}
				}
			elseif quest_progression_is_chapter_finale
				questbreakdownid :se_setprops {
					song_summary_position_pos = {<finale_offset> relative}
				}
			endif
		endif
	endif
endscript
