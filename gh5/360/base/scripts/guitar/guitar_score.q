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
	setplayerinfo <Player> score = 0.0
	setplayerinfo <Player> guitar_performance_score = 0
	setplayerinfo <Player> current_health = 1.0
	setplayerinfo <Player> notes_hit = 0
	setplayerinfo <Player> notes_created = 0
	setplayerinfo <Player> total_notes = 0
	setplayerinfo <Player> unnecessary_notes = 0
	setplayerinfo <Player> best_run = 0
	setplayerinfo <Player> current_run = 0
	setplayerinfo <Player> beginning_run = 0
	setplayerinfo <Player> sp_phrases_hit = 0
	setplayerinfo <Player> star_power_use_count = 0
	setplayerinfo <Player> vocal_streak_phrases = 0
	setplayerinfo <Player> vocal_total_phrases = 0
	setplayerinfo <Player> vocal_multiplier = 1
	setplayerinfo <Player> vocal_phrase_quality = 0.0
	setplayerinfo <Player> vocal_phrase_max_qual = 0.0
	setplayerinfo <Player> vocal_phrase_fp_max_qual = 0.0
	setplayerinfo <Player> time_in_lead = 0.0
	setplayerinfo <Player> lowest_health = 1.0
	setplayerinfo <Player> has_held_notes = 0
	setplayerinfo <Player> whammy_every_note = 0
	setplayerinfo <Player> slide_wah_every_note = 0
	setplayerinfo <Player> star_power_amount = 0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	setplayerinfo <Player> last_inactive_gem_time = 0
	setplayerinfo <Player> is_dead = 0
	setplayerinfo <Player> grace_period_on = 0
	formatText checksumName = detailstats_array 'p%s_last_song_detailed_stats' s = <Player>
	setplayerinfo <Player> current_detailedstats_array_entry = 0
	setplayerinfo <Player> current_detailedstats_array = <detailstats_array>
	formatText checksumName = detailstats_array_max 'p%s_last_song_detailed_stats_max' s = <Player>
	setplayerinfo <Player> current_detailedstats_max_array = <detailstats_array_max>
	SetArrayElement ArrayName = <detailstats_array> globalarray all NewValue = 0
	SetArrayElement ArrayName = <detailstats_array_max> globalarray all NewValue = 0
	Change \{whammy_mania_achievement_invalidated = 0}
	Change \{gStar_Power_Triggered = 0}
	formatText checksumName = ns_meter_id 'sidebar_right_ns_meterp%p' p = <Player>
	if ScreenElementExists id = <ns_meter_id>
		resetplayernotestreak Player = <Player>
		updaterunchange Player = <Player>
	endif
	Change \{band_moment_temp_mult_time = 0}
	Change \{band_moment_temp_mult_increase = 0}
endscript

script calc_songscoreinfo \{Player = 1}
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	CalcSongScoreInfo <...>
endscript

script hit_note 
	get_current_multiplier
	old_multiplier = <multiplier>
	addtoplayerinfo <Player> notes_hit = 1
	addtoplayerinfo <Player> current_run = 1
	addtoplayerinfo <Player> total_notes = 1
	getplayerinfo <Player> current_run
	getplayerinfo <Player> best_run
	if (<current_run> > <best_run>)
		setplayerinfo <Player> best_run = <current_run>
	endif
	get_current_multiplier Player = <Player>
	getplayerinfo <Player> highest_multiplier
	if (<multiplier> > <highest_multiplier>)
		setplayerinfo <Player> highest_multiplier = <multiplier>
	endif
	getplayerinfo <Player> difficulty
	addtoplayerinfo <Player> score = (<multiplier> * $points_per_note.<difficulty>)
endscript

script miss_note 
	addtoplayerinfo <Player> total_notes = 1
	setplayerinfo <Player> current_run = 0
endscript

script unnecessary_note 
	setplayerinfo <Player> current_run = 0
endscript

script update_score_fast \{Player = 1
		player_on_screen = 1}
	UpdateScoreFastInit Player = <Player> player_on_screen = <player_on_screen>
	begin
	GetSongTimeMs
	UpdateScoreFastPerFrame Player = <Player> time = <time>
	if ($debug_showsongtime = On)
		if ScreenElementExists \{id = debug_songtime_text}
			formattimems ms = <time>
			formatText TextName = debug_songtime qs(0x9d784377) t = <formatted_time>
			debug_songtime_text :se_setprops text = <debug_songtime> unhide
		endif
	endif
	if ($debug_showsongname = On)
		if ScreenElementExists \{id = debug_songname_text}
			gman_songfunc \{func = get_current_song}
			Name = ($gh_songlist_props.<current_song>.Name)
			formatText TextName = debug_songname qs(0xbcb5d9f3) t = <Name>
			debug_songname_text :se_setprops text = <debug_songname> unhide
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script get_current_multiplier 
	multiplier = 4
	getplayerinfo <Player> current_run
	if (<current_run> < 10)
		<multiplier> = 1
	elseif (<current_run> < 20)
		<multiplier> = 2
	elseif (<current_run> < 30)
		<multiplier> = 3
	endif
	if playerinfoequals <Player> star_power_used = 1
		<multiplier> = (<multiplier> * 2)
	endif
	return multiplier = <multiplier>
endscript

script get_song_section_array 
	if NOT GotParam \{Player}
		getfirstplayer
	endif
	getplayerinfo <Player> part
	gman_songtool_getcurrentsong
	songfilemanager func = get_marker_array song_name = <current_song> part = <part>
	return song_section_array = <marker_array>
endscript

script get_average_multiplier 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> base_score
	if (<base_score> > 0)
		getplayerinfo <Player> score
		if ($game_mode != p2_pro_faceoff)
			if (($competitive_rules = faceoff) || ($competitive_rules = team_faceoff) || ($competitive_rules = elimination) || ($competitive_rules = team_elimination))
				getplayerinfo <Player> score_scale_ratio
				<base_score> = (<base_score> * <score_scale_ratio>)
			endif
			avg = ((1.0 * <score>) / (1.0 * <base_score>))
		else
			getplayerinfo <Player> sim_bot_score
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
