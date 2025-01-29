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
	Change structurename = <player_status> vocal_phrase_quality = 0.0
	Change structurename = <player_status> vocal_phrase_max_qual = 0.0
	Change structurename = <player_status> time_in_lead = 0.0
	Change structurename = <player_status> lowest_health = 1.0
	Change structurename = <player_status> has_held_notes = 0
	Change structurename = <player_status> whammy_every_note = 0
	Change structurename = <player_status> slide_wah_every_note = 0
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
	Change \{whammy_mania_achievement_invalidated = 0}
	Change \{gStar_Power_Triggered = 0}
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
			formatText TextName = debug_songtime qs(0x9d784377) t = <formatted_time>
			debug_songtime_text :se_setprops text = <debug_songtime>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script update_score 
	last_score = -1
	last_star = -1.0
	last_health = -1.0
	last_run = -1
	ExtendCrc ScoreMeter_Wheel_100000 <player_text> out = Wheel_100000
	ExtendCrc ScoreMeter_Wheel_10000 <player_text> out = Wheel_10000
	ExtendCrc ScoreMeter_Wheel_1000 <player_text> out = Wheel_1000
	ExtendCrc ScoreMeter_Wheel_100 <player_text> out = Wheel_100
	ExtendCrc ScoreMeter_Wheel_10 <player_text> out = Wheel_10
	ExtendCrc ScoreMeter_Wheel_1 <player_text> out = Wheel_1
	ExtendCrc RockMeter_Bulb0 <player_text> out = Bulb0
	ExtendCrc RockMeter_Bulb1 <player_text> out = Bulb1
	ExtendCrc RockMeter_Bulb2 <player_text> out = Bulb2
	ExtendCrc RockMeter_Bulb3 <player_text> out = Bulb3
	ExtendCrc RockMeter_Bulb4 <player_text> out = Bulb4
	ExtendCrc RockMeter_Bulb5 <player_text> out = Bulb5
	ExtendCrc RockMeter_Bulb_Lit0 <player_text> out = Bulb_Lit0
	ExtendCrc RockMeter_Bulb_Lit1 <player_text> out = Bulb_Lit1
	ExtendCrc RockMeter_Bulb_Lit2 <player_text> out = Bulb_Lit2
	ExtendCrc RockMeter_Bulb_Lit3 <player_text> out = Bulb_Lit3
	ExtendCrc RockMeter_Bulb_Lit4 <player_text> out = Bulb_Lit4
	ExtendCrc RockMeter_Bulb_Lit5 <player_text> out = Bulb_Lit5
	begin
	<score> = ($<player_status>.score)
	if NOT (<last_score> = <score>)
		<last_score> = <score>
		<score_1000000> = (<score> / 1000000)
		<score_100000> = (<score> / 100000)
		<score_10000> = (<score> / 10000)
		<score_1000> = (<score> / 1000)
		<score_100> = (<score> / 100)
		<score_10> = (<score> / 10)
		<score_1> = (<score> - (<score_10> * 10))
		<score_10> = (<score_10> - (<score_100> * 10))
		<score_100> = (<score_100> - (<score_1000> * 10))
		<score_1000> = (<score_1000> - (<score_10000> * 10))
		<score_10000> = (<score_10000> - (<score_100000> * 10))
		<score_100000> = (<score_100000> - (<score_1000000> * 10))
		<step> = ((3.1415927 * 2.0) / 10.0)
		SetScreenElementProps id = <Wheel_100000> anglex = (<step> * <score_100000>)
		SetScreenElementProps id = <Wheel_10000> anglex = (<step> * <score_10000>)
		SetScreenElementProps id = <Wheel_1000> anglex = (<step> * <score_1000>)
		SetScreenElementProps id = <Wheel_100> anglex = (<step> * <score_100>)
		SetScreenElementProps id = <Wheel_10> anglex = (<step> * <score_10>)
		SetScreenElementProps id = <Wheel_1> anglex = (<step> * <score_1>)
	endif
	<star> = ($<player_status>.star_power_amount)
	if NOT (<last_star> = <star>)
		<last_star> = <star>
		<amount_per_bulb> = (100.0 / 6.0)
		if (<star> >= <amount_per_bulb>)
			legacydoscreenelementmorph id = <Bulb0> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit0> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb0> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit0> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 2))
			legacydoscreenelementmorph id = <Bulb1> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit1> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb1> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit1> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 3))
			legacydoscreenelementmorph id = <Bulb2> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit2> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb2> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit2> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 4))
			legacydoscreenelementmorph id = <Bulb3> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit3> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb3> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit3> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 5))
			legacydoscreenelementmorph id = <Bulb4> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit4> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb4> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit4> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 6))
			legacydoscreenelementmorph id = <Bulb5> alpha = 0
			legacydoscreenelementmorph id = <Bulb_Lit5> alpha = 1
		else
			legacydoscreenelementmorph id = <Bulb5> alpha = 1
			legacydoscreenelementmorph id = <Bulb_Lit5> alpha = 0
		endif
	endif
	<health> = ($health_scale - $<player_status>.current_health)
	if NOT (<last_health> = <health>)
		<last_health> = <health>
		<rot> = (((<health> / $health_scale) * (0.65000004 * 2.0)) - 0.65000004)
		ExtendCrc RockMeter_Needle <player_text> out = Needle
		SetScreenElementProps id = <Needle> anglez = <rot>
	endif
	<run> = ($<player_status>.current_run)
	if NOT (<last_run> = <run>)
		<last_run> = <run>
		<bulbs> = 0
		if (<run> > 40)
			<bulbs> = 10
		else
			if (<run> > 30)
				<bulbs> = (<run> - 30)
			else
				if (<run> > 20)
					<bulbs> = (<run> - 20)
				else
					if (<run> > 10)
						<bulbs> = (<run> - 10)
					else
						<bulbs> = <run>
					endif
				endif
			endif
		endif
		index = 0
		begin
		formatText checksumName = dark_bulb 'ScoreMeter_Bulb%n%p' n = <index> p = <player_text>
		formatText checksumName = lit_bulb 'ScoreMeter_Bulb_Lit%n%p' n = <index> p = <player_text>
		if (<bulbs> > <index>)
			legacydoscreenelementmorph id = <dark_bulb> alpha = 0
			legacydoscreenelementmorph id = <lit_bulb> alpha = 1
		else
			legacydoscreenelementmorph id = <dark_bulb> alpha = 1
			legacydoscreenelementmorph id = <lit_bulb> alpha = 0
		endif
		<index> = (<index> + 1)
		repeat 10
		get_current_multiplier <...>
		mults = [1 , 2 , 3 , 4 , 6 , 8]
		idx = 0
		begin
		<index> = (<mults> [<idx>])
		formatText checksumName = multiplier_element 'ScoreMeter_Multiplier%n%p' n = <index> p = <player_text>
		if (<multiplier> = <index>)
			legacydoscreenelementmorph id = <multiplier_element> alpha = 1
		else
			legacydoscreenelementmorph id = <multiplier_element> alpha = 0
		endif
		<idx> = (<idx> + 1)
		repeat 6
	endif
	Wait \{1
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
	formatText checksumName = player_status 'player%d_status' d = <Player>
	Change structurename = <player_status> current_song_section_array = <song_section_array>
endscript

script get_song_section_array \{Player = 1}
	formatText checksumName = player_status 'player%p_status' p = <Player>
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
