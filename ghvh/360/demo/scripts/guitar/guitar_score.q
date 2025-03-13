points_per_note = {
	easy = 50.0
	medium = 50.0
	hard = 50.0
	expert = 50.0
	easy_rhythm = 50.0
}
points_per_note_per_beat = {
	easy = 25.0
	medium = 25.0
	hard = 25.0
	expert = 25.0
	easy_rhythm = 25.0
}

script reset_score 
	change structurename = <player_status> score = 0
	change structurename = <player_status> guitar_performance_score = 0
	change structurename = <player_status> current_health = 1.0
	change structurename = <player_status> notes_hit = 0
	change structurename = <player_status> total_notes = 0
	change structurename = <player_status> best_run = 0
	change structurename = <player_status> current_run = 0
	change structurename = <player_status> beginning_run = 0
	change structurename = <player_status> sp_phrases_hit = 0
	change structurename = <player_status> star_power_use_count = 0
	change structurename = <player_status> vocal_streak_phrases = 0
	change structurename = <player_status> vocal_total_phrases = 0
	change structurename = <player_status> vocal_phrase_quality = 0.0
	change structurename = <player_status> vocal_phrase_max_qual = 0.0
	change structurename = <player_status> time_in_lead = 0.0
	change structurename = <player_status> lowest_health = 1.0
	change structurename = <player_status> has_held_notes = 0
	change structurename = <player_status> whammy_every_note = 0
	change structurename = <player_status> slide_wah_every_note = 0
	change structurename = <player_status> in_band_streak = 0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	if ($<player_status>.player = 1)
		get_song_section_array player = ($<player_status>.player)
		change current_section_array = $<song_section_array>
		change \{current_section_array_entry = 0}
	endif
	formattext checksumname = detailstats_array '%s_last_song_detailed_stats' s = ($<player_status>.text)
	change structurename = <player_status> current_detailedstats_array_entry = 0
	change structurename = <player_status> current_detailedstats_array = <detailstats_array>
	formattext checksumname = detailstats_array_max '%s_last_song_detailed_stats_max' s = ($<player_status>.text)
	change structurename = <player_status> current_detailedstats_max_array = <detailstats_array_max>
	getarraysize ($<detailstats_array>)
	array_count = 0
	begin
	setarrayelement arrayname = <detailstats_array> globalarray index = <array_count> newvalue = 0
	setarrayelement arrayname = <detailstats_array_max> globalarray index = <array_count> newvalue = 0
	array_count = (<array_count> + 1)
	repeat <array_size>
	change \{whammy_mania_achievement_invalidated = 0}
	change \{gstar_power_triggered = 0}
endscript

script calc_songscoreinfo \{player_status = player1_status}
	get_song_prefix song = ($current_song)
	calcsongscoreinfo <...>
	return
endscript

script hit_note 
	change structurename = <player_status> notes_hit = ($<player_status>.notes_hit + 1)
	change structurename = <player_status> current_run = ($<player_status>.current_run + 1)
	change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	if (($<player_status>.notes_hit) > ($<player_status>.total_notes))
		scriptassert qs(0xe48d59b9) i = ($<player_status>.notes_hit) t = ($<player_status>.total_notes)
	endif
	if ($<player_status>.current_run > $<player_status>.best_run)
		change structurename = <player_status> best_run = ($<player_status>.current_run)
	endif
	get_current_multiplier player_status = <player_status>
	if (<multiplier> > $<player_status>.highest_multiplier)
		change structurename = <player_status> highest_multiplier = <multiplier>
	endif
	difficulty = ($player1_status.difficulty)
	change structurename = <player_status> score = ($<player_status>.score + (<multiplier> * $points_per_note.<difficulty>))
endscript

script miss_note 
	change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	change structurename = <player_status> current_run = 0
endscript

script unnecessary_note 
	change structurename = <player_status> current_run = 0
endscript

script update_score_fast \{player_on_screen = 1}
	updatescorefastinit player_status = <player_status> player_on_screen = <player_on_screen>
	begin
	getsongtimems
	updatescorefastperframe player_status = <player_status> time = <time>
	if ($debug_showsongtime = on)
		if screenelementexists \{id = debug_songtime_text}
			formattimems ms = <time>
			formattext textname = debug_songtime qs(0x9d784377) t = <formatted_time>
			debug_songtime_text :se_setprops text = <debug_songtime>
		endif
	endif
	if ($debug_showsongframe = 1)
		if screenelementexists \{id = debug_songframe_text}
			f = (<time> * 0.03)
			formattext textname = debug_songframe qs(0x2c12dbf1) f = <f>
			debug_songframe_text :se_setprops text = <debug_songframe>
		endif
	endif
	if ($debug_showsongframe = 2)
		if screenelementexists \{id = debug_songframe_text}
			f = (<time> * 0.06)
			formattext textname = debug_songframe qs(0x2b70d298) f = <f>
			debug_songframe_text :se_setprops text = <debug_songframe>
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script get_current_multiplier 
	multiplier = 4
	if ($<player_status>.current_run < 10)
		<multiplier> = 1
	elseif ($<player_status>.current_run < 20)
		<multiplier> = 2
	elseif ($<player_status>.current_run < 30)
		<multiplier> = 3
	endif
	if ($<player_status>.star_power_used = 1)
		<multiplier> = (<multiplier> * 2)
	endif
	return <...>
endscript

script set_song_section_array 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	switch <part>
		case vocals
		<part_string> = 'vocals'
		default
		<part_string> = 'guitar'
	endswitch
	get_song_prefix song = ($current_song)
	formattext checksumname = song_section_array '%s_%p_markers' s = <song_prefix> p = <part_string>
	formattext checksumname = player_status 'player%d_status' d = <player>
	change structurename = <player_status> current_song_section_array = <song_section_array>
endscript

script get_song_section_array \{player = 1}
	formattext checksumname = player_status 'player%p_status' p = <player>
	return song_section_array = ($<player_status>.current_song_section_array)
endscript

script get_average_multiplier 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> base_score
	if (<base_score> > 0)
		getplayerinfo <player> score
		if ($game_mode != p2_pro_faceoff && $game_mode != p2_faceoff)
			avg = ((1.0 * <score>) / (1.0 * <base_score>))
		else
			getplayerinfo <player> sim_bot_score
			<avg_sim_bot> = (($player1_status.sim_bot_score + $player2_status.sim_bot_score) / 2.0)
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

script adjust_percent_for_display 
	if (<percent> >= 100)
		return \{adjusted_percent = 100}
	else
		if (<percent> >= 99)
			return \{adjusted_percent = 99}
		elseif (<percent> <= 0)
			return \{adjusted_percent = 0}
		elseif (<percent> <= 1)
			return \{adjusted_percent = 1}
		else
			int_percent = (<percent> * 1000)
			casttointeger \{int_percent}
			mod a = <int_percent> b = 1000
			mathfloor <percent>
			if (<mod> >= 500)
				return adjusted_percent = (<floor> + 1)
			else
				return adjusted_percent = <floor>
			endif
		endif
	endif
endscript
