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
	Change structurename = <player_status> score = 0
	Change structurename = <player_status> guitar_performance_score = 0
	Change structurename = <player_status> current_health = 1.0
	Change structurename = <player_status> notes_hit = 0
	Change structurename = <player_status> total_notes = 0
	Change structurename = <player_status> best_run = 0
	Change structurename = <player_status> current_run = 0
	Change structurename = <player_status> beginning_run = 0
	Change structurename = <player_status> sp_phrases_hit = 0
	Change structurename = <player_status> star_power_use_count = 0
	Change structurename = <player_status> vocal_streak_phrases = 0
	Change structurename = <player_status> vocal_total_phrases = 0
	Change structurename = <player_status> vocal_phrase_quality = 0.0
	Change structurename = <player_status> vocal_phrase_max_qual = 0.0
	Change structurename = <player_status> time_in_lead = 0.0
	Change structurename = <player_status> lowest_health = 1.0
	Change structurename = <player_status> has_held_notes = 0
	Change structurename = <player_status> whammy_every_note = 0
	Change structurename = <player_status> slide_wah_every_note = 0
	Change structurename = <player_status> in_band_streak = 0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	if ($<player_status>.Player = 1)
		get_song_section_array Player = ($<player_status>.Player)
		Change current_section_array = $<song_section_array>
		Change \{current_section_array_entry = 0}
	endif
	formatText checksumName = detailstats_array '%s_last_song_detailed_stats' s = ($<player_status>.text)
	Change structurename = <player_status> current_detailedstats_array_entry = 0
	Change structurename = <player_status> current_detailedstats_array = <detailstats_array>
	formatText checksumName = detailstats_array_max '%s_last_song_detailed_stats_max' s = ($<player_status>.text)
	Change structurename = <player_status> current_detailedstats_max_array = <detailstats_array_max>
	GetArraySize ($<detailstats_array>)
	array_count = 0
	begin
	SetArrayElement ArrayName = <detailstats_array> globalarray index = <array_count> NewValue = 0
	SetArrayElement ArrayName = <detailstats_array_max> globalarray index = <array_count> NewValue = 0
	array_count = (<array_count> + 1)
	repeat <array_Size>
endscript

script calc_songscoreinfo \{player_status = player1_status}
	get_song_prefix song = ($current_song)
	CalcSongScoreInfo <...>
	return
endscript

script hit_note 
	Change structurename = <player_status> notes_hit = ($<player_status>.notes_hit + 1)
	Change structurename = <player_status> current_run = ($<player_status>.current_run + 1)
	Change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	if (($<player_status>.notes_hit) > ($<player_status>.total_notes))
		ScriptAssert qs(0xe48d59b9) i = ($<player_status>.notes_hit) t = ($<player_status>.total_notes)
	endif
	if ($<player_status>.current_run > $<player_status>.best_run)
		Change structurename = <player_status> best_run = ($<player_status>.current_run)
	endif
	get_current_multiplier player_status = <player_status>
	if (<multiplier> > $<player_status>.highest_multiplier)
		Change structurename = <player_status> highest_multiplier = <multiplier>
	endif
	difficulty = ($player1_status.difficulty)
	Change structurename = <player_status> score = ($<player_status>.score + (<multiplier> * $points_per_note.<difficulty>))
endscript

script miss_note 
	Change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	Change structurename = <player_status> current_run = 0
endscript

script unnecessary_note 
	Change structurename = <player_status> current_run = 0
endscript

script update_score_fast \{player_on_screen = 1}
	UpdateScoreFastInit player_status = <player_status> player_on_screen = <player_on_screen>
	begin
	GetSongTimeMs
	UpdateScoreFastPerFrame player_status = <player_status> time = <time>
	if ($debug_showsongtime = On)
		if ScreenElementExists \{id = debug_songtime_text}
			formattimems ms = <time>
			formatText TextName = debug_songtime qs(0x0204c31d) t = <formatted_time>
			debug_songtime_text :se_setprops text = <debug_songtime>
		endif
	endif
	WaitOneGameFrame
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
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case vocals
		<part_string> = 'vocals'
		default
		<part_string> = 'guitar'
	endswitch
	get_song_prefix song = ($current_song)
	formatText checksumName = song_section_array '%s_%p_markers' s = <song_prefix> p = <part_string>
	<player_status> = ($0x2994109a [<Player>])
	Change structurename = <player_status> current_song_section_array = <song_section_array>
endscript

script get_song_section_array \{Player = 1}
	<player_status> = ($0x2994109a [<Player>])
	return song_section_array = ($<player_status>.current_song_section_array)
endscript

script get_average_multiplier 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> base_score
	if (<base_score> > 0)
		getplayerinfo <Player> score
		if ($game_mode != p2_pro_faceoff && $game_mode != p2_faceoff)
			avg = ((1.0 * <score>) / (1.0 * <base_score>))
		else
			getplayerinfo <Player> sim_bot_score
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
			CastToInteger \{int_percent}
			Mod a = <int_percent> b = 1000
			MathFloor <percent>
			if (<Mod> >= 500)
				return adjusted_percent = (<floor> + 1)
			else
				return adjusted_percent = <floor>
			endif
		endif
	endif
endscript
