points_per_note = {
	easy = 50.0
	medium = 50.0
	hard = 50.0
	expert = 50.0
}
points_per_note_per_beat = {
	easy = 25.0
	medium = 25.0
	hard = 25.0
	expert = 25.0
}

script reset_score 
	change structurename = <player_status> score = 0
	change structurename = <player_status> notes_hit = 0
	change structurename = <player_status> total_notes = 0
	change structurename = <player_status> best_run = 0
	change structurename = <player_status> current_run = 0
	change structurename = <player_status> sp_phrases_hit = 0
	change structurename = <player_status> multiplier_count = 0
	change structurename = <player_status> num_multiplier = 0
	change structurename = <player_status> time_in_lead = 0.0
	last_time_in_lead = 0.0
	last_time_in_lead_player = -1
	get_song_prefix song = ($current_song)
	formattext checksumname = song_section_array '%s_markers' s = <song_prefix>
	change current_section_array = <song_section_array>
	change \{current_section_array_entry = 0}
	formattext checksumname = detailstats_array '%s_last_song_detailed_stats' s = (<player_status>.text)
	change structurename = <player_status> current_detailedstats_array_entry = 0
	change structurename = <player_status> current_detailedstats_array = <detailstats_array>
	formattext checksumname = detailstats_array_max '%s_last_song_detailed_stats_max' s = (<player_status>.text)
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
	fast_base_score = ($<player_status>.base_score)
	fast_max_notes = ($<player_status>.max_notes)
	fast_sp_phrases_total = ($<player_status>.sp_phrases_total)
	if ($devil_finish = 1)
		return
	endif
	base_score = 0
	max_notes = 0
	sim_bot_score = 0
	sim_bot_multiplier = 1
	sim_bot_note_count = 0
	fretbar_array = ($<player_status>.current_song_fretbar_array)
	if (<fretbar_array> = none)
		return
	endif
	fretbar_count = 0
	getarraysize $<fretbar_array>
	fretbar_size = <array_size>
	get_song_prefix song = ($current_song)
	formattext checksumname = song_section_array '%s_markers' s = <song_prefix>
	getarraysize ($<song_section_array>)
	song_section_array_size = <array_size>
	formattext checksumname = detailstats_array_max '%s_last_song_detailed_stats_max' s = (<player_status>.text)
	getarraysize ($<detailstats_array_max>)
	array_count = 0
	begin
	setarrayelement arrayname = <detailstats_array_max> globalarray index = <array_count> newvalue = 0
	array_count = (<array_count> + 1)
	repeat <array_size>
	starpower_array = ($<player_status>.current_song_star_array)
	starpower_array_entry = 0
	starpower_on = 0
	getarraysize ($<starpower_array>)
	starpower_array_size = <array_size>
	sp_phrases_total = 0
	if ($game_mode = p2_faceoff)
		faceoff_array_entry = 0
		gemfiller_on = 0
		get_song_prefix song = ($current_song)
		formattext checksumname = faceoff_array '%s_faceoff%p' s = <song_prefix> p = ($<player_status>.text) addtostringlookup
		getarraysize $<faceoff_array>
		faceoff_array_size = <array_size>
	else
		gemfiller_on = 1
	endif
	song = ($<player_status>.current_song_gem_array)
	difficulty = $current_difficulty
	getarraysize $<song>
	song_size = (<array_size> / $num_song_columns)
	array_count = 0
	if (<song_size> = 0)
		change structurename = <player_status> max_notes = 0
		change structurename = <player_status> base_score = 0
		return
	endif
	section_index = 0
	last_array_count = -1
	begin
	time = ($<song> [<array_count>])
	begin
	if ((<fretbar_count> + 1) = (<fretbar_size> - 1))
		break
	endif
	beat_time = ($<fretbar_array> [(<fretbar_count> + 1)] - $<fretbar_array> [<fretbar_count>])
	if ($<fretbar_array> [(<fretbar_count> + 1)] > <time>)
		break
	endif
	fretbar_count = (<fretbar_count> + 1)
	repeat
	if ($game_mode = p2_faceoff)
		begin
		if (<faceoff_array_entry> >= <faceoff_array_size>)
			break
		endif
		faceoff_starttime = ($<faceoff_array> [<faceoff_array_entry>] [0])
		faceoff_endtime = (<faceoff_starttime> + $<faceoff_array> [<faceoff_array_entry>] [1])
		if (<gemfiller_on> = 1)
			if (<faceoff_endtime> <= <time>)
				gemfiller_on = 0
				printf "gemfiller_on %a %i" a = <gemfiller_on> i = <time>
				faceoff_array_entry = (<faceoff_array_entry> + 1)
			else
				break
			endif
		elseif (<gemfiller_on> = 0)
			if (<faceoff_starttime> <= <time>)
				gemfiller_on = 1
				printf "gemfiller_on %a %i" a = <gemfiller_on> i = <time>
			else
				break
			endif
		endif
		repeat
	endif
	begin
	if (<starpower_array_entry> >= <starpower_array_size>)
		break
	endif
	star_starttime = ($<starpower_array> [<starpower_array_entry>] [0])
	star_endtime = (<star_starttime> + $<starpower_array> [<starpower_array_entry>] [1])
	if (<starpower_on> = 1)
		if (<star_endtime> <= <time>)
			starpower_on = 0
			printf "starpower_on %a %i" a = <starpower_on> i = <time>
			starpower_array_entry = (<starpower_array_entry> + 1)
		else
			break
		endif
	elseif (<starpower_on> = 0)
		if (<star_starttime> <= <time>)
			starpower_on = 1
			printf "starpower_on %a %i" a = <starpower_on> i = <time>
			if (<gemfiller_on> = 1)
				sp_phrases_total = (<sp_phrases_total> + 1)
			endif
		else
			break
		endif
	endif
	repeat
	begin
	if (<song_section_array_size> > (<section_index> + 1))
		if ($<song_section_array> [(<section_index> + 1)].time > <time>)
			break
		else
			section_index = (<section_index> + 1)
		endif
	else
		break
	endif
	repeat
	if (<gemfiller_on> = 1)
		sim_bot_note_count = (<sim_bot_note_count> + 1)
		max_notes = (<max_notes> + 1)
		setarrayelement arrayname = <detailstats_array_max> globalarray index = <section_index> newvalue = (($<detailstats_array_max> [<section_index>]) + 1)
	endif
	getarraysize \{$gem_colors}
	color = 0
	whammy_value = -1
	length = ($<song> [(<array_count> + 1)])
	value_bitfield = ($<song> [(<array_count> + 2)])
	begin
	value = 0
	if NOT ((<value_bitfield> / 2) * 2 = <value_bitfield>)
		value = <length>
	endif
	value_bitfield = (<value_bitfield> / 2)
	if (<gemfiller_on> = 1 &&
			<value> > 0)
		if (<whammy_value> = -1)
			whammy_value = <value>
		endif
		base_score = (<base_score> + $points_per_note.<difficulty>)
		if (<sim_bot_note_count> < 10)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<difficulty>)
		elseif (<sim_bot_note_count> < 20)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<difficulty> * 2)
		elseif (<sim_bot_note_count> < 30)
			sim_bot_score = (<sim_bot_score> + $points_per_note.<difficulty> * 3)
		else
			sim_bot_score = (<sim_bot_score> + $points_per_note.<difficulty> * 4)
		endif
	endif
	color = (<color> + 1)
	repeat <array_size>
	if (<gemfiller_on> &&
			<whammy_value> > (<beat_time> / 2.0) &&
			<last_array_count> != <array_count>)
		last_array_count = <array_count>
		whammy_score = 0
		whammy_value = (<whammy_value> - $whammy_shorten * <beat_time>)
		whammy_value_beat = <whammy_value>
		finished = 0
		whammy_fretbar_count = <fretbar_count>
		begin
		whammy_beat_time = ($<fretbar_array> [(<whammy_fretbar_count> + 1)] - $<fretbar_array> [<whammy_fretbar_count>])
		if (<whammy_value> > <whammy_beat_time>)
			whammy_value_beat = <whammy_beat_time>
			whammy_value = (<whammy_value> - <whammy_beat_time>)
		else
			whammy_value_beat = <whammy_value>
			finished = 1
		endif
		additional_score = ($points_per_note_per_beat.<difficulty> * 1.0)
		additional_score = (<additional_score> * <whammy_value_beat>)
		additional_score = (<additional_score> / <whammy_beat_time>)
		whammy_score = (<whammy_score> + <additional_score>)
		if (<sim_bot_note_count> < 10)
			sim_bot_score = (<sim_bot_score> + <additional_score>)
		elseif (<sim_bot_note_count> < 20)
			sim_bot_score = (<sim_bot_score> + <additional_score> * 2)
		elseif (<sim_bot_note_count> < 30)
			sim_bot_score = (<sim_bot_score> + <additional_score> * 3)
		else
			sim_bot_score = (<sim_bot_score> + <additional_score> * 4)
		endif
		printf "Simbot %i Entry %a Whammy %d" i = <sim_bot_score> a = <array_count> d = <additional_score>
		if (<finished> = 1)
			break
		endif
		repeat
		printf "Score %i Entry %a Color %t + whammy %v" i = <base_score> a = <array_count> t = <color> v = <whammy_score>
		base_score = (<base_score> + <whammy_score>)
	endif
	array_count = (<array_count> + $num_song_columns)
	repeat <song_size>
	printstruct <...>
	change structurename = <player_status> max_notes = <max_notes>
	change structurename = <player_status> base_score = <base_score>
	change structurename = <player_status> sp_phrases_total = <sp_phrases_total>
	casttointeger \{fast_base_score}
	casttointeger \{base_score}
	if (<fast_base_score> != <base_score> ||
			<fast_max_notes> != <max_notes> ||
			<fast_sp_phrases_total> != <sp_phrases_total>)
		scriptassert \{"Mismatch in CalcSongScoreInfo"}
	endif
endscript

script hit_note 
	change structurename = <player_status> notes_hit = ($<player_status>.notes_hit + 1)
	change structurename = <player_status> current_run = ($<player_status>.current_run + 1)
	change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	if ($<player_status>.current_run > $<player_status>.best_run)
		change structurename = <player_status> best_run = ($<player_status>.current_run)
	endif
	get_current_multiplier player_status = <player_status>
	difficulty = $current_difficulty
	change structurename = <player_status> score = ($<player_status>.score + (<multiplier> * $points_per_note.<difficulty>))
endscript

script miss_note 
	change structurename = <player_status> total_notes = ($<player_status>.total_notes + 1)
	change structurename = <player_status> current_run = 0
endscript

script unnecessary_note 
	change structurename = <player_status> current_run = 0
endscript

script update_score_fast 
	updatescorefastinit player_status = <player_status>
	begin
	getsongtimems
	updatescorefastperframe player_status = <player_status> time = <time>
	wait \{1
		gameframe}
	repeat
endscript

script update_score 
	last_score = -1
	last_star = -1.0
	last_health = -1.0
	last_run = -1
	extendcrc scoremeter_wheel_100000 <player_text> out = wheel_100000
	extendcrc scoremeter_wheel_10000 <player_text> out = wheel_10000
	extendcrc scoremeter_wheel_1000 <player_text> out = wheel_1000
	extendcrc scoremeter_wheel_100 <player_text> out = wheel_100
	extendcrc scoremeter_wheel_10 <player_text> out = wheel_10
	extendcrc scoremeter_wheel_1 <player_text> out = wheel_1
	extendcrc rockmeter_bulb0 <player_text> out = bulb0
	extendcrc rockmeter_bulb1 <player_text> out = bulb1
	extendcrc rockmeter_bulb2 <player_text> out = bulb2
	extendcrc rockmeter_bulb3 <player_text> out = bulb3
	extendcrc rockmeter_bulb4 <player_text> out = bulb4
	extendcrc rockmeter_bulb5 <player_text> out = bulb5
	extendcrc rockmeter_bulb_lit0 <player_text> out = bulb_lit0
	extendcrc rockmeter_bulb_lit1 <player_text> out = bulb_lit1
	extendcrc rockmeter_bulb_lit2 <player_text> out = bulb_lit2
	extendcrc rockmeter_bulb_lit3 <player_text> out = bulb_lit3
	extendcrc rockmeter_bulb_lit4 <player_text> out = bulb_lit4
	extendcrc rockmeter_bulb_lit5 <player_text> out = bulb_lit5
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
		setscreenelementprops id = <wheel_100000> anglex = (<step> * <score_100000>)
		setscreenelementprops id = <wheel_10000> anglex = (<step> * <score_10000>)
		setscreenelementprops id = <wheel_1000> anglex = (<step> * <score_1000>)
		setscreenelementprops id = <wheel_100> anglex = (<step> * <score_100>)
		setscreenelementprops id = <wheel_10> anglex = (<step> * <score_10>)
		setscreenelementprops id = <wheel_1> anglex = (<step> * <score_1>)
	endif
	<star> = ($<player_status>.star_power_amount)
	if NOT (<last_star> = <star>)
		<last_star> = <star>
		<amount_per_bulb> = (100.0 / 6.0)
		if (<star> >= <amount_per_bulb>)
			doscreenelementmorph id = <bulb0> alpha = 0
			doscreenelementmorph id = <bulb_lit0> alpha = 1
		else
			doscreenelementmorph id = <bulb0> alpha = 1
			doscreenelementmorph id = <bulb_lit0> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 2))
			doscreenelementmorph id = <bulb1> alpha = 0
			doscreenelementmorph id = <bulb_lit1> alpha = 1
		else
			doscreenelementmorph id = <bulb1> alpha = 1
			doscreenelementmorph id = <bulb_lit1> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 3))
			doscreenelementmorph id = <bulb2> alpha = 0
			doscreenelementmorph id = <bulb_lit2> alpha = 1
		else
			doscreenelementmorph id = <bulb2> alpha = 1
			doscreenelementmorph id = <bulb_lit2> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 4))
			doscreenelementmorph id = <bulb3> alpha = 0
			doscreenelementmorph id = <bulb_lit3> alpha = 1
		else
			doscreenelementmorph id = <bulb3> alpha = 1
			doscreenelementmorph id = <bulb_lit3> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 5))
			doscreenelementmorph id = <bulb4> alpha = 0
			doscreenelementmorph id = <bulb_lit4> alpha = 1
		else
			doscreenelementmorph id = <bulb4> alpha = 1
			doscreenelementmorph id = <bulb_lit4> alpha = 0
		endif
		if (<star> >= (<amount_per_bulb> * 6))
			doscreenelementmorph id = <bulb5> alpha = 0
			doscreenelementmorph id = <bulb_lit5> alpha = 1
		else
			doscreenelementmorph id = <bulb5> alpha = 1
			doscreenelementmorph id = <bulb_lit5> alpha = 0
		endif
	endif
	<health> = ($health_scale - $<player_status>.current_health)
	if NOT (<last_health> = <health>)
		<last_health> = <health>
		<rot> = (((<health> / $health_scale) * (0.65000004 * 2.0)) - 0.65000004)
		extendcrc rockmeter_needle <player_text> out = needle
		setscreenelementprops id = <needle> anglez = <rot>
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
		formattext checksumname = dark_bulb 'ScoreMeter_Bulb%n%p' n = <index> p = <player_text>
		formattext checksumname = lit_bulb 'ScoreMeter_Bulb_Lit%n%p' n = <index> p = <player_text>
		if (<bulbs> > <index>)
			doscreenelementmorph id = <dark_bulb> alpha = 0
			doscreenelementmorph id = <lit_bulb> alpha = 1
		else
			doscreenelementmorph id = <dark_bulb> alpha = 1
			doscreenelementmorph id = <lit_bulb> alpha = 0
		endif
		<index> = (<index> + 1)
		repeat 10
		get_current_multiplier <...>
		mults = [1 , 2 , 3 , 4 , 6 , 8]
		idx = 0
		begin
		<index> = (<mults> [<idx>])
		formattext checksumname = multiplier_element 'ScoreMeter_Multiplier%n%p' n = <index> p = <player_text>
		if (<multiplier> = <index>)
			doscreenelementmorph id = <multiplier_element> alpha = 1
		else
			doscreenelementmorph id = <multiplier_element> alpha = 0
		endif
		<idx> = (<idx> + 1)
		repeat 6
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
