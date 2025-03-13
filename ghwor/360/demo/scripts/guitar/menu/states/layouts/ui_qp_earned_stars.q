g_qp_earned_stars_strip_reveal_time = 0.2
g_qp_earned_stars_new_stars_time = 0.0
g_qp_earned_stars_total_stars_time = 0.25

script ui_init_qp_earned_stars 
	change \{ui_song_breakdown_already_animated_stats = 0}
endscript

script ui_create_qp_earned_stars \{transition_param = !q1768515945}
	printf channel = wilson qs(0x1d67d949) t = <transition_param>
	gamemode_gettype
	if NOT issingleplayergame
		scriptassert \{'In the single player qp earned stars screen when multiplayer!!'}
	elseif (<type> != quickplay)
		scriptassert \{'In the single player qp earned stars screen when not playing quickplay!!'}
	endif
	if innetgame
		scriptassert \{'In the single player qp earned stars screen for online when playing mulitplayer!'}
	endif
	playlist_getcurrentsong
	<my_song> = <current_song>
	if NOT ($game_mode = practice)
		if NOT ($last_song_played = none)
			<my_song> = ($last_song_played)
		endif
	endif
	if (($last_song_played) = jamsession)
		<song_title> = (($last_jam_song_props).jam_display_name)
		<band_name> = (($last_jam_song_props).jam_artist_name)
	else
		get_song_title song = <my_song>
		get_song_original_artist song = <my_song>
		if (<original_artist> = 0)
			<band_name> = qs(0x13c0666a)
		else
			get_song_artist song = <my_song> with_year = 0
			<band_name> = <song_artist>
		endif
	endif
	<previous_song_stars> = 0
	<previous_grade> = 0
	if (<type> = quickplay)
		getfirstplayer
		quickplay_get_challenge_outro_stats player = <player>
		getarraysize <player_challenge_stats>
		if (<array_size> > 0)
			<previous_song_stars> = (<player_challenge_stats> [0].previous_song_stars)
		endif
	endif
	getfirstplayer
	getstarsfromdetailedstats player = <player>
	quickplay_get_overall_awards_progress player = <player>
	quickplay_get_recent_award_points player = <player>
	<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
	formattext textname = total_points_main_text qs(0x0204c31d) t = <starting_award_points_total> usecommas
	quickplay_get_challenge_outro_stats player = <player>
	uistack_createboundscreenelement {
		parent = root_window
		type = descinterface
		id = qp_earned_stars_screen_id
		desc = 'qp_earned_stars'
		song_title_text = <song_title>
		band_name_text = <band_name>
		total_stars_text_text = <total_points_main_text>
		alpha = 1
		stars_earned_star_scale = 1.2
		stars_earned_pulse_alpha = 0
		stars_earned_pulse_scale = 1
		tags = {
			player = <player>
			stars = <stars>
			player_challenge_stats = <player_challenge_stats>
			starting_award_points_total = <starting_award_points_total>
			recent_award_points = <recent_award_points>
			current_award_points_total = <current_award_points_total>
			previous_song_stars = <previous_song_stars>
			meter_width = 250.0
			transition_param = <transition_param>
		}
	}
	if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_rank_capsule}
		<resolved_id> :obj_spawnscriptnow gamerpic_set_screenelement_texture params = {
			local_id = ($primary_controller)
			local_user_index = ($primary_controller)
			se_prop = gamerpic_texture
			failure_texture = icon_gh6
		}
	else
		scriptassert \{qs(0x6aaf11b6)}
	endif
	if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_stats_bg_anim
			param = stats_bg_anim_id}
		if ($ui_song_breakdown_already_animated_stats = 0)
			<stats_bg_anim_id> :obj_spawnscript qp_earned_stars_enter_flash
		else
			<stats_bg_anim_id> :se_setprops alpha = 0
		endif
	else
		scriptassert \{'ui_art'}
	endif
	if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_stars_earned_star}
		assignalias id = <resolved_id> alias = stars_earned_star
	else
		scriptassert \{qs(0x363cd3a2)}
	endif
	if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_total_stars_star}
		assignalias id = <resolved_id> alias = total_stars_star
	else
		scriptassert \{qs(0x54be5270)}
	endif
	qp_earned_stars_setup_handler_scripts transition_param = <transition_param>
	if gman_ispowerscoreenabled
		formattext checksumname = goal_id 'qp_power_score_points_p%d' d = <player>
		quickplay_get_grade goal_id = <goal_id>
		formattext textname = power_score_number qs(0x8c5c152d) n = <stars>
		formattext textname = previous_best_number qs(0x8c5c152d) n = (<previous_grade>)
		qp_earned_stars_screen_id :se_setprops {
			challenge_stats_cont_alpha = 0.0
			power_challenge_stats_cont_alpha = 1.0
			power_score_number_text = <power_score_number>
			previous_best_number_text = <previous_best_number>
		}
		qp_earned_stars_screen_id :obj_spawnscriptnow ui_create_qp_earned_stars_power_challenge_spawned params = {
			player = <player>
		}
	else
		qp_earned_stars_screen_id :obj_spawnscriptnow ui_create_qp_earned_stars_spawned params = {
			previous_song_stars = <previous_song_stars>
			player = <player>
			player_challenge_stats = <player_challenge_stats>
		}
	endif
endscript

script ui_create_qp_earned_stars_spawned 
	if (($ui_song_breakdown_already_animated_stats) = 0)
		<total_time> = 5.0
		qp_earned_stars_initial_populate previous_song_stars = <previous_song_stars>
		qp_earned_stars_challenges_initial_populate {
			player = <player>
			player_challenge_stats = <player_challenge_stats>
		}
		qp_earned_stars_rank_meter_initial_populate player = <player>
		qp_earned_stars_animate_screen total_animate_time = <total_time>
		change \{ui_song_breakdown_already_animated_stats = 1}
	else
		<total_time> = 0.0
		qp_earned_stars_initial_populate previous_song_stars = <previous_song_stars>
		qp_earned_stars_challenges_initial_populate {
			player = <player>
			player_challenge_stats = <player_challenge_stats>
		}
		qp_earned_stars_animate_screen total_animate_time = <total_time>
	endif
endscript

script ui_create_qp_earned_stars_power_challenge_spawned \{player = !i1768515945}
	if (($ui_song_breakdown_already_animated_stats) = 0)
		<total_time> = 5.0
		qp_earned_stars_rank_meter_initial_populate player = <player>
		change \{ui_song_breakdown_already_animated_stats = 1}
	else
		<total_time> = 0.0
	endif
	qp_earned_stars_animate_screen total_animate_time = <total_time>
endscript

script ui_destroy_qp_earned_stars 
	clean_up_user_control_helpers
	if screenelementexists \{id = qp_earned_stars_screen_id}
		destroyscreenelement \{id = qp_earned_stars_screen_id}
	endif
	if issoundplaying \{stats_screen_loop}
		stopsound \{stats_screen_loop}
	endif
endscript

script ui_return_qp_earned_stars 
	qp_earned_stars_screen_id :getsingletag \{transition_param}
	qp_earned_stars_setup_handler_scripts transition_param = <transition_param>
endscript

script ui_deinit_qp_earned_stars 
	change \{ui_song_breakdown_already_animated_stats = 0}
endscript

script qp_earned_stars_initial_populate \{previous_song_stars = !i1768515945}
	soundevent \{event = stats_screen_second_menu_appear}
	if screenelementexists \{id = qp_earned_stars_screen_id}
		if (<previous_song_stars> > 0)
			if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_song_star_menu
					param = song_star_menu}
				if getscreenelementchildren id = <song_star_menu>
					<i> = 0
					begin
					(<children> [<i>]) :se_setprops {
						rgba = white
						alpha = 0.5
					}
					<i> = (<i> + 1)
					repeat <previous_song_stars>
				endif
			endif
		endif
	endif
endscript

script qp_earned_stars_challenges_initial_populate \{player = !i1768515945
		player_challenge_stats = !a1768515945}
	soundevent \{event = stats_screen_second_menu_appear}
	printf \{channel = wilson
		qs(0x199adecc)}
	if screenelementexists \{id = qp_earned_stars_screen_id}
		getarraysize <player_challenge_stats>
		printstruct channel = wilson <player_challenge_stats>
		if (<array_size> > 0)
			<i> = 0
			begin
			formattext checksumname = challenge_strip_alias 'alias_qp_earned_stars_challenge_strip_%n' n = (<i> + 1)
			if qp_earned_stars_screen_id :desc_resolvealias name = <challenge_strip_alias> param = strip_id
				extendcrc ((<player_challenge_stats> [<i>]).goal_name) '_info' out = goal_name_id
				quickplay_get_challenge_name_string_from_checksum goal_name = ((<player_challenge_stats> [<i>]).goal_name) player = <player>
				challenge_name = <challenge_name_string>
				printf channel = wilson qs(0x7ce6dfc9) n = <challenge_name>
				if (($ui_song_breakdown_already_animated_stats) = 0)
					<alpha> = 0.0
				else
					<alpha> = 1.0
				endif
				<strip_id> :se_setprops {
					alpha = <alpha>
					challenge_name_text = <challenge_name>
				}
				<previous_points_earned> = 0
				if (((<player_challenge_stats> [<i>]).previous_grade) > 0)
					<previous_points_earned> = ((<player_challenge_stats> [<i>]).previous_grade)
					if <strip_id> :desc_resolvealias name = alias_challenge_star_menu param = challenge_stars_id
						if getscreenelementchildren id = <challenge_stars_id>
							getarraysize \{children
								param = children_size}
							<j> = 0
							begin
							(<children> [<j>]) :se_setprops {
								rgba = white
								alpha = 0.5
							}
							<j> = (<j> + 1)
							if (<j> >= <children_size>)
								break
							endif
							repeat <previous_points_earned>
						endif
					endif
				endif
				if <strip_id> :desc_resolvealias name = alias_challenge_meter_container param = challenge_cont_id
					song_breakdown_create_badge_and_apply_progress_to_meter {
						badge_parent_id = <challenge_cont_id>
						challenge_stats = (<player_challenge_stats> [<i>])
						player = <player>
						badge_alpha = <alpha>
						is_band = 0
						is_multiplayer = 0
					}
				endif
				<strip_id> :settags challenge_stats = (<player_challenge_stats> [<i>])
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script qp_earned_stars_rank_meter_initial_populate \{player = !i1768515945
		desc_id = qp_earned_stars_screen_id
		meter_width = 250.0}
	soundevent \{event = stats_screen_second_menu_appear}
	printf \{channel = wilson
		qs(0xeb94b66c)}
	if screenelementexists id = <desc_id>
		printf \{channel = wilson
			qs(0xf708b37d)}
		<desc_id> :getsingletag meter_width
		if <desc_id> :desc_resolvealias name = alias_rank_capsule param = rank_capsule_id
			printf \{channel = wilson
				qs(0x8863e014)}
			<desc_id> :getsingletag current_award_points_total
			<desc_id> :getsingletag recent_award_points
			<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
			formattext textname = total_points_main_text qs(0x0204c31d) t = <starting_award_points_total> usecommas
			quickplay_find_award_point_level award_points = <starting_award_points_total>
			<previous_award_point_level> = <award_point_level>
			printf channel = wilson qs(0x732977dd) l = <award_point_level>
			quickplay_find_award_point_level award_points = <current_award_points_total>
			printf channel = wilson qs(0x732977dd) l = <award_point_level>
			quickplay_get_outro_percentages {
				previous_points = <starting_award_points_total>
				current_points = <current_award_points_total>
				previous_level = <previous_award_point_level>
				current_level = <award_point_level>
			}
			printstruct channel = wilson <...>
			quickplay_get_next_threshold level = <previous_award_point_level>
			if ((<next_threshold> - <starting_award_points_total>) = 1)
				formattext textname = level_text qs(0xb9fa8e1a) l = (<previous_award_point_level> + 1)
			else
				formattext textname = level_text qs(0x27915675) p = (<next_threshold> - <starting_award_points_total>) l = (<previous_award_point_level> + 1)
			endif
			formattext textname = rank_text qs(0x545e649b) r = <previous_award_point_level>
			printf channel = wilson qs(0xc2405a84) r = (<start_percentage>)
			printf channel = wilson qs(0xd600ca1a) r = (<meter_width>)
			printf channel = wilson qs(0x811feef8) r = (<start_percentage> * <meter_width>)
			<rank_capsule_id> :se_setprops {
				rank_text = <rank_text>
				rank_meter_caption_text = <level_text>
				meter_fill_dims = (((1.0, 0.0) * (<start_percentage> * <meter_width>)) + ((0.0, 1.0) * 20))
			}
		endif
	endif
endscript

script qp_earned_stars_animate_screen \{total_animate_time = 0.0}
	if screenelementexists \{id = qp_earned_stars_screen_id}
		qp_earned_stars_screen_id :getsingletag \{player}
		qp_earned_stars_screen_id :getsingletag \{stars}
		qp_earned_stars_screen_id :getsingletag \{previous_song_stars}
		qp_earned_stars_screen_id :getsingletag \{starting_award_points_total}
		qp_earned_stars_screen_id :getsingletag \{recent_award_points}
		qp_earned_stars_screen_id :getsingletag \{player_challenge_stats}
		<time_per_star> = 0.0
		qp_earned_stars_calculate_stars_for_this_song {
			player_challenge_stats = <player_challenge_stats>
			song_stars = <stars>
		}
		if (<stars_for_this_song> > 0)
			<time_per_star> = (<total_animate_time> / <stars_for_this_song>)
		endif
		printf channel = wilson qs(0xec236184) t = <total_animate_time>
		printf channel = wilson qs(0xa9a62c87) s = <stars_for_this_song>
		printf channel = wilson qs(0x6b88891d) t = <time_per_star>
		if gman_ispowerscoreenabled
			if (<total_animate_time> > 0.0)
				wait ($g_qp_earned_stars_strip_reveal_time * 3.0) seconds
			endif
			soundevent \{event = audio_songcomplete_display_item}
			qp_earned_stars_screen_id :se_setprops \{power_score_strip_alpha = 1.0}
			if (<total_animate_time> > 0.0)
				wait ($g_qp_earned_stars_strip_reveal_time * 3.0) seconds
			endif
			soundevent \{event = audio_songcomplete_display_item}
			qp_earned_stars_screen_id :se_setprops \{previous_best_strip_alpha = 1.0}
			if (<total_animate_time> > 0.0)
				wait ($g_qp_earned_stars_strip_reveal_time * 3.0) seconds
			endif
		else
			if (<stars> > 0)
				if qp_earned_stars_screen_id :desc_resolvealias \{name = alias_song_star_menu
						param = star_menu_id}
					if getscreenelementchildren id = <star_menu_id>
						getarraysize \{children
							param = children_size}
						<i> = 0
						begin
						printf channel = wilson qs(0x566ff7da) i = (<i> + 1) p = <previous_song_stars>
						if ((<i> + 1) > <previous_song_stars>)
							(<children> [<i>]) :se_setprops {
								rgba = white
								alpha = 1.0
							}
							printf \{channel = wilson
								qs(0x8db3dbb5)}
						endif
						<i> = (<i> + 1)
						if (<i> >= <children_size>)
							break
						endif
						repeat <stars>
					endif
				endif
			endif
			if (<total_animate_time> > 0)
				wait ($g_qp_earned_stars_strip_reveal_time) seconds
			endif
			qp_earned_stars_screen_id :se_setprops \{song_stars_strip_alpha = 1.0}
			if (<total_animate_time> > 0)
				wait ($g_qp_earned_stars_strip_reveal_time) seconds
			endif
			<i> = 0
			begin
			formattext checksumname = challenge_strip_alias 'alias_qp_earned_stars_challenge_strip_%n' n = (<i> + 1)
			if qp_earned_stars_screen_id :desc_resolvealias name = <challenge_strip_alias> param = strip_id
				if <strip_id> :getsingletag challenge_stats
					printf channel = wilson qs(0x3067bbd9) a = <challenge_strip_alias>
					qp_earned_stars_reveal_challenge_meter {
						strip_id = <strip_id>
						challenge_stats = <challenge_stats>
						time_per_star = 0.0
					}
					soundevent \{event = audio_songcomplete_display_item}
					<strip_id> :se_setprops {
						alpha = 1.0
					}
					if (<total_animate_time> > 0)
						wait ($g_qp_earned_stars_strip_reveal_time) seconds
					endif
				endif
			endif
			<i> = (<i> + 1)
			repeat 3
		endif
		qp_earned_stars_screen_id :se_setprops \{stars_earned_strip_alpha = 1.0}
		if (<total_animate_time> > 0)
			wait ($g_qp_earned_stars_strip_reveal_time) seconds
		endif
		if (<recent_award_points> > 0)
			<i> = 0
			begin
			soundevent \{event = stats_screen_stars_counting}
			<i> = (<i> + 1)
			formattext textname = stars_earned_text qs(0x4fc4b28c) n = <i>
			qp_earned_stars_screen_id :se_setprops {
				stars_earned_text_text = <stars_earned_text>
			}
			qp_earned_stars_screen_id :se_setprops \{stars_earned_pulse_alpha = 0
				stars_earned_pulse_scale = 1
				stars_earned_star_scale = 1.2
				time = 0.1}
			if (<total_animate_time> > 0)
				wait \{0.05
					seconds}
			endif
			qp_earned_stars_screen_id :se_setprops \{stars_earned_pulse_alpha = 1
				stars_earned_pulse_scale = 2
				stars_earned_star_scale = 1.75
				time = 0.1}
			if (<total_animate_time> > 0)
				wait \{0.05
					seconds}
			endif
			qp_earned_stars_screen_id :se_setprops \{stars_earned_pulse_alpha = 0
				stars_earned_pulse_scale = 2.75
				stars_earned_star_scale = 1.2
				time = 0.1}
			if (<total_animate_time> > 0)
				wait \{0.05
					seconds}
				wait ($g_qp_earned_stars_new_stars_time) seconds
			endif
			repeat <recent_award_points>
			if (<total_animate_time> > 0)
				wait ($g_qp_earned_stars_new_stars_time) seconds
			endif
			if (<total_animate_time> > 0)
				qp_earned_stars_screen_id :obj_spawnscriptnow qp_earned_stars_fill_total_stars params = {
					starting_award_points_total = <starting_award_points_total>
					recent_award_points = <recent_award_points>
				}
			else
				formattext textname = total_stars_text qs(0xb22939c6) n = (<starting_award_points_total> + <recent_award_points>) usecommas
				qp_earned_stars_screen_id :se_setprops {
					total_stars_text_text = <total_stars_text>
				}
			endif
		endif
		if (<total_animate_time> > 0)
			qp_earned_stars_animate_rank_meter {
				total_time = ($g_qp_earned_stars_total_stars_time * <recent_award_points>)
				player = <player>
			}
		else
			qp_earned_stars_animate_rank_meter {
				total_time = 0.0
				player = <player>
			}
		endif
	endif
endscript

script qp_earned_stars_fill_total_stars \{starting_award_points_total = !i1768515945
		recent_award_points = !i1768515945}
	createscreenelement \{type = spriteelement
		parent = stars_earned_star
		texture = ac_wgt_gold_star_sm
		dims = (64.0, 64.0)
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		pos = (0.0, 0.0)
		rgba = easy_md
		blend = add}
	wait \{1
		gameframe}
	getscreenelementposition id = <id> absolute
	<abs_pos> = <screenelementpos>
	getscreenelementposition \{id = total_stars_star
		absolute}
	<target_pos> = <screenelementpos>
	<total> = <starting_award_points_total>
	begin
	soundevent \{event = stats_screen_stars_dropping}
	<id> :se_setprops {
		pos = (0.0, 0.0)
		alpha = 1
	}
	<total> = (<total> + 1)
	<id> :se_setprops {
		pos = (3.0, 100.0)
		rot_angle = 360
		scale = 0.5
		time = ($g_qp_earned_stars_total_stars_time / 2.0)
	}
	wait ($g_qp_earned_stars_total_stars_time / 2.0) seconds
	<id> :se_setprops alpha = 0
	formattext textname = total_stars_text qs(0xb22939c6) n = <total> usecommas
	qp_earned_stars_screen_id :se_setprops {
		total_stars_text_text = <total_stars_text>
	}
	qp_earned_stars_scale_animation
	repeat <recent_award_points>
	destroyscreenelement id = <id>
endscript

script qp_earned_stars_scale_animation 
	createscreenelement \{type = spriteelement
		parent = total_stars_star
		texture = ac_wgt_gold_star_sm
		dims = (64.0, 64.0)
		just = [
			center
			center
		]
		pos_anchor = [
			center
			center
		]
		pos = (0.0, 0.0)
		rgba = easy_md
		blend = add}
	<id> :se_setprops {
		scale = 3
		alpha = 0
		time = ($g_qp_earned_stars_total_stars_time / 2.0)
	}
	wait ($g_qp_earned_stars_total_stars_time / 2.0) seconds
	destroyscreenelement id = <id>
endscript

script qp_earned_stars_reveal_challenge_meter \{strip_id = !q1768515945
		challenge_stats = 0x69696969
		time_per_star = !f1768515945}
	if screenelementexists \{id = qp_earned_stars_screen_id}
		qp_earned_stars_screen_id :getsingletag \{player}
		if <strip_id> :desc_resolvealias name = alias_challenge_meter_container param = challenge_cont_id
			if getscreenelementchildren id = <challenge_cont_id>
				resolvescreenelementid id = {(<children> [0]) child = 0}
				<hud_challenge_meter_id> = <resolved_id>
				(<children> [0]) :se_setprops {
					alpha = 1.0
					pos = (0.0, -8.0)
				}
				<hud_challenge_meter_id> :se_setprops {
					scale = 1.0
					alpha = 1.0
				}
				<hud_challenge_meter_id> :se_waitprops
				if <hud_challenge_meter_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
					<player_challenge_id> = (<challenge_stats>.instance_name)
					<level> = (<challenge_stats>.challenge_grade)
					if gman_goalisactive goal = <player_challenge_id>
						gman_getdata goal = <player_challenge_id> player = <player> name = current_progress
						gman_getdata goal = <player_challenge_id> player = <player> name = calculated_targets
					else
						current_progress = 0
						calculated_targets = [0 0 0]
					endif
					getarraysize <calculated_targets>
					if (<array_size> != 3)
						scriptassert 'Incorrect number of challenge levels for challenge %t' t = (<challenge_stats>.goal_name)
					endif
					<is_targeting_friend> = 0
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
							player = <player>
							level = <level>
							challenge_meter_id = <hud_challenge_meter_id>
							is_targeting_friend = <is_targeting_friend>
							animate_meter = 1
						}
					else
						<level_count> = 1
						<fill_percent_to_next> = 0.0
						<animate_meter> = 0
						if <strip_id> :desc_resolvealias name = alias_challenge_star_menu param = star_menu_id
							begin
							if (<level_count> = <level>)
								<fill_percent_to_next> = <percent_to_next>
								if NOT ((<fill_percent_to_next> = 0.0) || (<level_count> = 3))
									<animate_meter> = 1
								endif
							endif
							fill_challenge_meter_to {
								percent = <fill_percent_to_next>
								player = <player>
								level = <level_count>
								challenge_meter_id = <hud_challenge_meter_id>
								animate_meter = <animate_meter>
								use_friend_target = <is_targeting_friend>
							}
							if ((<level_count> > 0) && (<level_count> < 4))
								if (<level_count> > (<challenge_stats>.previous_grade))
									printf \{channel = wilson
										qs(0x8db3dbb5)}
									if getscreenelementchildren id = <star_menu_id>
										(<children> [(<level_count> - 1)]) :se_setprops {
											rgba = white
											alpha = 1.0
										}
									endif
								endif
							endif
							<level_count> = (<level_count> + 1)
							if ($ui_song_breakdown_already_animated_stats = 0)
								wait <time_per_star> seconds
							endif
							repeat <level>
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script qp_earned_stars_animate_rank_meter \{total_time = !f1768515945
		player = !i1768515945
		desc_id = qp_earned_stars_screen_id
		meter_width = 250.0
		time_step = 0.05}
	printf \{channel = wilson
		qs(0xa7d5a35b)}
	if screenelementexists id = <desc_id>
		<desc_id> :getsingletag meter_width
		if <desc_id> :desc_resolvealias name = alias_rank_capsule param = rank_capsule_id
			printf \{channel = wilson
				qs(0xac4f518e)}
			quickplay_get_overall_awards_progress player = <player>
			quickplay_get_recent_award_points player = <player>
			<starting_award_points_total> = (<current_award_points_total> - <recent_award_points>)
			quickplay_find_award_point_level award_points = <starting_award_points_total>
			if (<at_max_level> = 0)
				<previous_award_point_level> = <award_point_level>
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
				printf channel = wilson qs(0x0e157616) l = <passed_a_level>
				if (<total_time> = 0)
					<rank_capsule_id> :se_setprops {
						meter_fill_dims = (((1.0, 0.0) * (<end_percentage> * <meter_width>)) + ((0.0, 1.0) * 20))
					}
					quickplay_get_outro_percentages {
						previous_points = <starting_award_points_total>
						current_points = <current_award_points_total>
						previous_level = <previous_award_point_level>
						current_level = <award_point_level>
					}
					<max_level_params> = {}
					quickplay_get_next_threshold level = <award_point_level>
					if ((<next_threshold> - <current_award_points_total>) = 1)
						formattext textname = level_text qs(0xb9fa8e1a) l = (<award_point_level> + 1)
					else
						formattext textname = level_text qs(0x27915675) p = (<next_threshold> - <current_award_points_total>) l = (<award_point_level> + 1)
					endif
					formattext textname = rank_text qs(0x545e649b) r = <award_point_level>
					<rank_capsule_id> :se_setprops {
						rank_text = <rank_text>
						rank_meter_caption_text = <level_text>
					}
					return
				endif
				if (<passed_a_level> = 0)
					getarraysize ($award_point_progression)
					<num_loops> = (<total_time> / <time_step>)
					roundtointeger \{num_loops}
					<time_step> = (<total_time> / <num_loops>)
					<percent_diff> = ((<end_percentage> - <start_percentage>) / <num_loops>)
					playsound \{stats_screen_loop
						vol = -20
						num_loops = -1
						buss = front_end}
					begin
					<start_percentage> = (<start_percentage> + <percent_diff>)
					<rank_capsule_id> :se_setprops {
						meter_fill_dims = (((1.0, 0.0) * (<start_percentage> * <meter_width>)) + (0.0, 20.0))
						time = <time_step>
					}
					setsoundparams stats_screen_loop pitch = (<start_percentage> * 10)
					wait <time_step> seconds
					repeat <num_loops>
					stopsound \{stats_screen_loop
						fade_time = 0.2
						fade_type = linear}
					quickplay_get_outro_percentages {
						previous_points = <starting_award_points_total>
						current_points = <current_award_points_total>
						previous_level = <previous_award_point_level>
						current_level = <award_point_level>
					}
					<max_level_params> = {}
					quickplay_get_next_threshold level = <award_point_level>
					if ((<next_threshold> - <current_award_points_total>) = 1)
						formattext textname = level_text qs(0xb9fa8e1a) l = (<award_point_level> + 1)
					else
						formattext textname = level_text qs(0x27915675) p = (<next_threshold> - <current_award_points_total>) l = (<award_point_level> + 1)
					endif
					formattext textname = rank_text qs(0x545e649b) r = <award_point_level>
					<rank_capsule_id> :se_setprops {
						rank_text = <rank_text>
						rank_meter_caption_text = <level_text>
						rank_meter_caption_scale = (1.1, 1.1)
						glow_alpha = 1.0
						glow_scale = (1.0, 1.0)
						time = 0.1
					}
					wait \{0.1
						seconds}
					<rank_capsule_id> :se_setprops {
						rank_meter_caption_scale = (1.0, 1.0)
						glow_alpha = 0.0
						glow_scale = (0.0, 1.0)
						time = 0.1
					}
					wait \{0.1
						seconds}
				else
					<num_loops> = (<total_time> / <time_step>)
					roundtointeger \{num_loops}
					<time_step> = (<total_time> / <num_loops>)
					<phase_1_percent> = (1.0 - <start_percentage>)
					<phase_2_percent> = (<full_levels_passed> * 1.0)
					<phase_3_percent> = <end_percentage>
					<total_percentage_change> = (<phase_1_percent> + <phase_2_percent> + <phase_3_percent>)
					if (<phase_1_percent> > 0.0)
						<phase_1_loops> = ((<phase_1_percent> / <total_percentage_change>) * <num_loops>)
						roundtointeger \{phase_1_loops}
						<percent_diff> = (<phase_1_percent> / <phase_1_loops>)
						playsound \{stats_screen_loop
							vol = -20
							num_loops = -1
							buss = front_end}
						begin
						<start_percentage> = (<start_percentage> + <percent_diff>)
						<rank_capsule_id> :se_setprops {
							meter_fill_dims = (((1.0, 0.0) * (<start_percentage> * <meter_width>)) + (0.0, 20.0))
							time = <time_step>
						}
						setsoundparams stats_screen_loop pitch = (<start_percentage> * 10)
						wait <time_step> seconds
						repeat <phase_1_loops>
						stopsound \{stats_screen_loop
							fade_time = 0.2
							fade_type = linear}
						playsound \{powers_star_acquire
							vol = -13
							buss = front_end}
					endif
					quickplay_get_next_threshold level = (<award_point_level> - 1)
					<previous_threshold> = <next_threshold>
					quickplay_get_next_threshold level = <award_point_level>
					<award_point_level> = <previous_award_point_level>
					if (<full_levels_passed> > 0)
						begin
						<award_point_level> = (<award_point_level> + 1)
						quickplay_get_next_threshold level = (<award_point_level> - 1)
						<previous_threshold> = <next_threshold>
						quickplay_get_next_threshold level = <award_point_level>
						if ((<next_threshold> - <previous_threshold>) = 1)
							formattext textname = level_text qs(0xb9fa8e1a) l = (<award_point_level> + 1)
						else
							formattext textname = level_text qs(0x27915675) p = (<next_threshold> - <previous_threshold>) l = (<award_point_level> + 1)
						endif
						formattext textname = rank_text qs(0x545e649b) r = <award_point_level>
						<rank_capsule_id> :se_setprops {
							rank_text = <rank_text>
							rank_meter_caption_text = <level_text>
							meter_fill_dims = (0.0, 20.0)
							rank_meter_caption_scale = (1.1, 1.1)
							glow_alpha = 1.0
							glow_scale = (1.0, 1.0)
							time = 0.1
						}
						wait \{0.1
							seconds}
						<rank_capsule_id> :se_setprops {
							rank_meter_caption_scale = (1.0, 1.0)
							glow_alpha = 0.0
							glow_scale = (0.0, 1.0)
							time = 0.1
						}
						wait \{0.1
							seconds}
						<phase_2_loops> = ((1.0 / <total_percentage_change>) * <num_loops>)
						roundtointeger \{phase_2_loops}
						<percent_diff> = (1.0 / <phase_2_loops>)
						<start_percentage> = 0.0
						playsound \{stats_screen_loop
							vol = -20
							num_loops = -1
							buss = front_end}
						begin
						<start_percentage> = (<start_percentage> + <percent_diff>)
						<rank_capsule_id> :se_setprops {
							meter_fill_dims = (((1.0, 0.0) * (<start_percentage> * <meter_width>)) + (0.0, 20.0))
							time = <time_step>
						}
						setsoundparams stats_screen_loop pitch = (<start_percentage> * 10)
						wait <time_step> seconds
						repeat <phase_2_loops>
						stopsound \{stats_screen_loop
							fade_time = 0.2
							fade_type = linear}
						playsound \{powers_star_acquire
							vol = -13
							buss = front_end}
						repeat <full_levels_passed>
					endif
					<rank_capsule_id> :se_setprops {
						meter_fill_dims = (0.0, 20.0)
					}
					<award_point_level> = (<award_point_level> + 1)
					formattext textname = rank_text qs(0x545e649b) r = <award_point_level>
					quickplay_get_next_threshold level = (<award_point_level> - 1)
					<previous_threshold> = <next_threshold>
					quickplay_get_next_threshold level = <award_point_level>
					if ((<next_threshold> - <current_award_points_total>) = 1)
						formattext textname = level_text qs(0xb9fa8e1a) l = (<award_point_level> + 1)
					else
						formattext textname = level_text qs(0x27915675) p = (<next_threshold> - <current_award_points_total>) l = (<award_point_level> + 1)
					endif
					<rank_capsule_id> :se_setprops {
						rank_text = <rank_text>
						rank_meter_caption_text = <level_text>
						rank_meter_caption_scale = (1.1, 1.1)
						glow_alpha = 1.0
						glow_scale = (1.0, 1.0)
						time = 0.1
					}
					wait \{0.1
						seconds}
					<rank_capsule_id> :se_setprops {
						rank_meter_caption_scale = (1.0, 1.0)
						glow_alpha = 0.0
						glow_scale = (0.0, 1.0)
						time = 0.1
					}
					wait \{0.1
						seconds}
					if (<phase_3_percent> > 0.0)
						<phase_3_loops> = ((<phase_3_percent> / <total_percentage_change>) * <num_loops>)
						roundtointeger \{phase_3_loops}
						<percent_diff> = (<phase_3_percent> / <phase_3_loops>)
						<start_percentage> = 0.0
						playsound \{stats_screen_loop
							vol = -20
							num_loops = -1
							buss = front_end}
						begin
						<start_percentage> = (<start_percentage> + <percent_diff>)
						<rank_capsule_id> :se_setprops {
							meter_fill_dims = (((1.0, 0.0) * (<start_percentage> * <meter_width>)) + (0.0, 20.0))
							time = <time_step>
						}
						setsoundparams stats_screen_loop pitch = (<start_percentage> * 10)
						wait <time_step> seconds
						repeat <phase_3_loops>
						stopsound \{stats_screen_loop
							fade_time = 0.2
							fade_type = linear}
					endif
				endif
			endif
		endif
	endif
endscript

script qp_earned_stars_setup_handler_scripts \{add_button_pills = 1
		transition_param = !q1768515945}
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
	<can_scroll_stats> = 1
	<show_broadcast> = 0
	<message_id> = song_won
	<spawn_net_timer> = 0
	gamemode_gettype
	if (<transition_param> = end_of_setlist_transition)
		if is_current_song_a_jam_session
			<continue_script> = ui_song_breakdown_continue_to_next_screen_gig_complete
		else
			<continue_script> = ui_song_breakdown_continue_to_next_screen_gig_complete
			<option_script> = song_breakdown_go_to_stats_from_transition
			<option_params> = {transition_param = <transition_param>}
			if (<type> = quickplay)
				playlist_getsize
				if (<playlist_size> = 1)
					<option2_script> = song_breakdown_retry_challenge
					<option2_text> = qs(0x5d8b66a0)
				endif
				<show_broadcast> = 1
			endif
		endif
	elseif ((<transition_param> = continue_setlist_transition) || (<transition_param> = add_setlist_continue_handlers))
		<show_broadcast> = 1
		<transition_param> = add_setlist_continue_handlers
		<can_scroll_stats> = 1
		if NOT innetgame
			<continue_script> = ui_song_breakdown_continue_to_next_screen_song_transition
		endif
		if ($last_song_played != jamsession)
			<option_script> = song_breakdown_go_to_stats_from_transition
			<option_params> = {transition_param = <transition_param>}
		endif
	else
		scriptassert \{'Invalid transition from earned stars screen!'}
	endif
	if isbandcheating
		show_broadcast = 0
	endif
	if (<show_broadcast> = 1)
		if social_networks_broadcast_allowed
			<pad_l1_text> = ($g_social_networks_broadcast_string)
			<pad_l1_script> = social_networks_choose_broadcast
			<pad_l1_params> = {message_id = <message_id>}
		endif
	endif
	if (<add_button_pills> = 0)
		qp_earned_stars_screen_id :settags transition_param = <transition_param>
	else
		if (gotparam no_wait)
			spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
				screen_element_id = qp_earned_stars_screen_id
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
				no_wait
			}
		else
			spawnscriptnow ui_song_breakdown_add_handlers_for_next_transition_spawned params = {
				screen_element_id = qp_earned_stars_screen_id
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
			}
		endif
	endif
endscript

script qp_earned_stars_calculate_stars_for_this_song \{player_challenge_stats = !a1768515945
		song_stars = !i1768515945}
	printf \{channel = wilson
		qs(0x0107bee1)}
	printstruct channel = wilson <...>
	<stars_for_this_song> = <song_stars>
	getarraysize <player_challenge_stats>
	if (<array_size> > 0)
		<i> = 0
		begin
		<level> = ((<player_challenge_stats> [<i>]).challenge_grade)
		if (<level> > 0)
			<stars_for_this_song> = (<stars_for_this_song> + (<level> - 1))
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	printf channel = wilson qs(0x650c2c19) s = <stars_for_this_song>
	return stars_for_this_song = <stars_for_this_song>
endscript

script qp_earned_stars_enter_flash 
	se_setprops \{alpha = 0
		time = 0.05}
	se_waitprops
	se_setprops \{alpha = 1
		time = 0.05}
	se_waitprops
	se_setprops \{alpha = 0.5
		time = 0.075}
	se_waitprops
	se_setprops \{alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{alpha = 0
		time = 0.1}
	se_waitprops
endscript
