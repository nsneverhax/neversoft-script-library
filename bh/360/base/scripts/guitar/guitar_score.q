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
	SetPlayerInfo <player> score = 0.0
	SetPlayerInfo <player> guitar_performance_score = 0
	SetPlayerInfo <player> current_health = 1.0
	SetPlayerInfo <player> notes_hit = 0
	SetPlayerInfo <player> notes_created = 0
	SetPlayerInfo <player> total_notes = 0
	SetPlayerInfo <player> unnecessary_notes = 0
	SetPlayerInfo <player> best_run = 0
	SetPlayerInfo <player> current_run = 0
	SetPlayerInfo <player> beginning_run = 0
	SetPlayerInfo <player> sp_phrases_hit = 0
	SetPlayerInfo <player> star_power_use_count = 0
	SetPlayerInfo <player> vocal_streak_phrases = 0
	SetPlayerInfo <player> vocal_total_phrases = 0
	SetPlayerInfo <player> vocal_multiplier = 1
	SetPlayerInfo <player> vocal_phrase_quality = 0.0
	SetPlayerInfo <player> vocal_phrase_max_qual = 0.0
	SetPlayerInfo <player> vocal_phrase_fp_max_qual = 0.0
	SetPlayerInfo <player> time_in_lead = 0.0
	SetPlayerInfo <player> lowest_health = 1.0
	SetPlayerInfo <player> has_held_notes = 0
	SetPlayerInfo <player> whammy_every_note = 0
	SetPlayerInfo <player> slide_wah_every_note = 0
	SetPlayerInfo <player> star_power_amount = 0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	SetPlayerInfo <player> last_inactive_gem_time = 0
	SetPlayerInfo <player> is_dead = 0
	SetPlayerInfo <player> grace_period_on = 0
	FormatText checksumname = detailstats_array 'p%s_last_song_detailed_stats' s = <player>
	SetPlayerInfo <player> current_detailedstats_array_entry = 0
	SetPlayerInfo <player> current_detailedstats_array = <detailstats_array>
	FormatText checksumname = detailstats_array_max 'p%s_last_song_detailed_stats_max' s = <player>
	SetPlayerInfo <player> current_detailedstats_max_array = <detailstats_array_max>
	SetArrayElement arrayName = <detailstats_array> GlobalArray all newValue = 0
	SetArrayElement arrayName = <detailstats_array_max> GlobalArray all newValue = 0
	Change \{whammy_mania_achievement_invalidated = 0}
	Change \{gStar_Power_Triggered = 0}
	FormatText checksumname = ns_meter_id 'sidebar_right_ns_meterp%p' p = <player>
	if ScreenElementExists id = <ns_meter_id>
		ResetPlayerNoteStreak player = <player>
		UpdateRunChange player = <player>
	endif
	Change \{band_moment_temp_mult_time = 0}
	Change \{band_moment_temp_mult_increase = 0}
endscript

script calc_songscoreinfo \{player = 1}
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	CalcSongScoreInfo <...>
endscript

script hit_note 
	get_current_multiplier
	old_multiplier = <Multiplier>
	AddToPlayerInfo <player> notes_hit = 1
	AddToPlayerInfo <player> current_run = 1
	AddToPlayerInfo <player> total_notes = 1
	GetPlayerInfo <player> current_run
	GetPlayerInfo <player> best_run
	if (<current_run> > <best_run>)
		SetPlayerInfo <player> best_run = <current_run>
	endif
	get_current_multiplier player = <player>
	GetPlayerInfo <player> highest_multiplier
	if (<Multiplier> > <highest_multiplier>)
		SetPlayerInfo <player> highest_multiplier = <Multiplier>
	endif
	GetPlayerInfo <player> difficulty
	AddToPlayerInfo <player> score = (<Multiplier> * $points_per_note.<difficulty>)
endscript

script miss_note 
	AddToPlayerInfo <player> total_notes = 1
	SetPlayerInfo <player> current_run = 0
endscript

script unnecessary_note 
	SetPlayerInfo <player> current_run = 0
endscript

script update_score_fast \{player = 1
		player_on_screen = 1}
	UpdateScoreFastInit player = <player> player_on_screen = <player_on_screen>
	begin
	GetSongTimeMs
	UpdateScoreFastPerFrame player = <player> time = <time>
	if ($debug_showsongtime = on)
		if ScreenElementExists \{id = debug_songtime_text}
			FormatTimeMs ms = <time>
			FormatText TextName = debug_songtime qs(0x9d784377) t = <formatted_time>
			debug_songtime_text :SE_SetProps text = <debug_songtime> unhide
		endif
	endif
	if ($debug_showsongname = on)
		if ScreenElementExists \{id = debug_songname_text}
			GMan_SongFunc \{func = get_current_song}
			name = ($gh_songlist_props.<current_song>.name)
			FormatText TextName = debug_songname qs(0xbcb5d9f3) t = <name>
			debug_songname_text :SE_SetProps text = <debug_songname> unhide
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script get_current_multiplier 
	Multiplier = 4
	if PlayerInfoEquals <player> part = vocals
		GetPlayerInfo <player> vocal_multiplier
		<Multiplier> = <vocal_multiplier>
	else
		GetPlayerInfo <player> current_run
		if (<current_run> < 10)
			<Multiplier> = 1
		elseif (<current_run> < 20)
			<Multiplier> = 2
		elseif (<current_run> < 30)
			<Multiplier> = 3
		endif
	endif
	if PlayerInfoEquals <player> star_power_used = 1
		<Multiplier> = (<Multiplier> * 2)
	endif
	return Multiplier = <Multiplier>
endscript

script get_song_section_array 
	if NOT GotParam \{player}
		GetFirstPlayer
	endif
	GetPlayerInfo <player> part
	GMan_SongTool_GetCurrentSong
	SongFileManager func = get_marker_array song_name = <current_song> part = <part>
	return song_section_array = <marker_array>
endscript

script get_average_multiplier 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> base_score
	if (<base_score> > 0)
		GetPlayerInfo <player> score
		if ($game_mode != p2_pro_faceoff)
			if (($competitive_rules = faceoff) || ($competitive_rules = team_faceoff) || ($competitive_rules = elimination) || ($competitive_rules = team_elimination))
				GetPlayerInfo <player> score_scale_ratio
				<base_score> = (<base_score> * <score_scale_ratio>)
			endif
			avg = ((1.0 * <score>) / (1.0 * <base_score>))
		else
			GetPlayerInfo <player> sim_bot_score
			GetPlayerInfo \{1
				sim_bot_score
				out = sim_bot_score1}
			GetPlayerInfo \{2
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
