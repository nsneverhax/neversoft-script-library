points_per_note = {
	easy = 50.0
	medium = 50.0
	hard = 50.0
	expert = 50.0
	beginner = 50.0
}
points_per_note_per_beat = {
	easy = 25.0
	medium = 25.0
	hard = 25.0
	expert = 25.0
	beginner = 25.0
}

script reset_score 
	setplayerinfo <player> score = 0.0
	setplayerinfo <player> guitar_performance_score = 0
	setplayerinfo <player> current_health = 1.0
	setplayerinfo <player> notes_hit = 0
	setplayerinfo <player> notes_created = 0
	setplayerinfo <player> total_notes = 0
	setplayerinfo <player> unnecessary_notes = 0
	setplayerinfo <player> best_run = 0
	setplayerinfo <player> current_run = 0
	setplayerinfo <player> beginning_run = 0
	setplayerinfo <player> sp_phrases_hit = 0
	setplayerinfo <player> star_power_use_count = 0
	setplayerinfo <player> vocal_streak_phrases = 0
	setplayerinfo <player> vocal_total_phrases = 0
	setplayerinfo <player> vocal_multiplier = 1
	setplayerinfo <player> vocal_phrase_quality = 0.0
	setplayerinfo <player> vocal_phrase_max_qual = 0.0
	setplayerinfo <player> vocal_phrase_fp_max_qual = 0.0
	setplayerinfo <player> time_in_lead = 0.0
	setplayerinfo <player> lowest_health = 1.0
	setplayerinfo <player> has_held_notes = 0
	setplayerinfo <player> whammy_every_note = 0
	setplayerinfo <player> slide_wah_every_note = 0
	setplayerinfo <player> star_power_amount = 0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	setplayerinfo <player> last_inactive_gem_time = 0
	setplayerinfo <player> is_dead = 0
	setplayerinfo <player> grace_period_on = 0
	formattext checksumname = detailstats_array 'p%s_last_song_detailed_stats' s = <player>
	setplayerinfo <player> current_detailedstats_array_entry = 0
	setplayerinfo <player> current_detailedstats_array = <detailstats_array>
	formattext checksumname = detailstats_array_max 'p%s_last_song_detailed_stats_max' s = <player>
	setplayerinfo <player> current_detailedstats_max_array = <detailstats_array_max>
	setarrayelement arrayname = <detailstats_array> globalarray all newvalue = 0
	setarrayelement arrayname = <detailstats_array_max> globalarray all newvalue = 0
	change \{whammy_mania_achievement_invalidated = 0}
	change \{gstar_power_triggered = 0}
	formattext checksumname = ns_meter_id 'sidebar_right_ns_meterp%p' p = <player>
	if screenelementexists id = <ns_meter_id>
		resetplayernotestreak player = <player>
		updaterunchange player = <player>
	endif
	change \{band_moment_temp_mult_time = 0}
	change \{band_moment_temp_mult_increase = 0}
endscript

script calc_songscoreinfo \{player = 1}
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	calcsongscoreinfo <...>
endscript

script hit_note 
	get_current_multiplier
	old_multiplier = <multiplier>
	addtoplayerinfo <player> notes_hit = 1
	addtoplayerinfo <player> current_run = 1
	addtoplayerinfo <player> total_notes = 1
	getplayerinfo <player> current_run
	getplayerinfo <player> best_run
	if (<current_run> > <best_run>)
		setplayerinfo <player> best_run = <current_run>
	endif
	get_current_multiplier player = <player>
	getplayerinfo <player> highest_multiplier
	if (<multiplier> > <highest_multiplier>)
		setplayerinfo <player> highest_multiplier = <multiplier>
	endif
	getplayerinfo <player> difficulty
	addtoplayerinfo <player> score = (<multiplier> * $points_per_note.<difficulty>)
endscript

script miss_note 
	addtoplayerinfo <player> total_notes = 1
	setplayerinfo <player> current_run = 0
endscript

script unnecessary_note 
	setplayerinfo <player> current_run = 0
endscript

script update_score_fast \{player = 1
		player_on_screen = 1}
	updatescorefastinit player = <player> player_on_screen = <player_on_screen>
	begin
	getsongtimems
	updatescorefastperframe player = <player> time = <time>
	if ($debug_showsongtime = on)
		if screenelementexists \{id = debug_songtime_text}
			formattimems ms = <time>
			formattext textname = debug_songtime qs(0x9d784377) t = <formatted_time>
			debug_songtime_text :se_setprops text = <debug_songtime> unhide
		endif
	endif
	if ($debug_showsongname = on)
		if screenelementexists \{id = debug_songname_text}
			gman_songfunc \{func = get_current_song}
			name = ($gh_songlist_props.<current_song>.name)
			formattext textname = debug_songname qs(0xbcb5d9f3) t = <name>
			debug_songname_text :se_setprops text = <debug_songname> unhide
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script get_current_multiplier 
	multiplier = 4
	getplayerinfo <player> current_run
	if (<current_run> < 10)
		<multiplier> = 1
	elseif (<current_run> < 20)
		<multiplier> = 2
	elseif (<current_run> < 30)
		<multiplier> = 3
	endif
	if playerinfoequals <player> star_power_used = 1
		<multiplier> = (<multiplier> * 2)
	endif
	return multiplier = <multiplier>
endscript

script get_song_section_array 
	if NOT gotparam \{player}
		getfirstplayer
	endif
	getplayerinfo <player> part
	gman_songtool_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = <part>
	return song_section_array = <marker_array>
endscript

script get_average_multiplier 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> base_score
	if (<base_score> > 0)
		getplayerinfo <player> score
		if ($game_mode != p2_pro_faceoff)
			if (($competitive_rules = faceoff) || ($competitive_rules = team_faceoff) || ($competitive_rules = elimination) || ($competitive_rules = team_elimination))
				getplayerinfo <player> score_scale_ratio
				<base_score> = (<base_score> * <score_scale_ratio>)
			endif
			avg = ((1.0 * <score>) / (1.0 * <base_score>))
		else
			getplayerinfo <player> sim_bot_score
			getplayerinfo \{1
				sim_bot_score
				out = sim_bot_score1}
			getplayerinfo \{2
				sim_bot_score
				out = sim_bot_score2}
			<avg_sim_bot> = ((<sim_bot_score1> + <sim_bot_score2>) / 2.0)
			<avg> = ((<score> * <sim_bot_score>) / (<base_score> * <avg_sim_bot>))
		endif
		if (<avg> < 1.0)
			<avg> = 1.0
		endif
	else
		avg = 1.0
	endif
	return average_multiplier = <avg>
endscript
