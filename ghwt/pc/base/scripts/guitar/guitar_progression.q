current_progression_savegame = 0
progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_got_sponsored_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = guitar
cash_system_rules = [
	{
		diff = easy_rhythm
		newstars = 3
		oldstars = 0
		cash = 35
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 0
		cash = 85
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 0
		cash = 150
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 3
		cash = 50
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 3
		cash = 115
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 4
		cash = 65
	}
	{
		diff = easy
		newstars = 3
		oldstars = 0
		cash = 75
	}
	{
		diff = easy
		newstars = 4
		oldstars = 0
		cash = 175
	}
	{
		diff = easy
		newstars = 5
		oldstars = 0
		cash = 300
	}
	{
		diff = easy
		newstars = 4
		oldstars = 3
		cash = 100
	}
	{
		diff = easy
		newstars = 5
		oldstars = 3
		cash = 225
	}
	{
		diff = easy
		newstars = 5
		oldstars = 4
		cash = 125
	}
	{
		diff = medium
		newstars = 3
		oldstars = 0
		cash = 150
	}
	{
		diff = medium
		newstars = 4
		oldstars = 0
		cash = 350
	}
	{
		diff = medium
		newstars = 5
		oldstars = 0
		cash = 600
	}
	{
		diff = medium
		newstars = 4
		oldstars = 3
		cash = 200
	}
	{
		diff = medium
		newstars = 5
		oldstars = 3
		cash = 450
	}
	{
		diff = medium
		newstars = 5
		oldstars = 4
		cash = 250
	}
	{
		diff = hard
		newstars = 3
		oldstars = 0
		cash = 300
	}
	{
		diff = hard
		newstars = 4
		oldstars = 0
		cash = 700
	}
	{
		diff = hard
		newstars = 5
		oldstars = 0
		cash = 1200
	}
	{
		diff = hard
		newstars = 4
		oldstars = 3
		cash = 400
	}
	{
		diff = hard
		newstars = 5
		oldstars = 3
		cash = 900
	}
	{
		diff = hard
		newstars = 5
		oldstars = 4
		cash = 500
	}
	{
		diff = expert
		newstars = 3
		oldstars = 0
		cash = 450
	}
	{
		diff = expert
		newstars = 4
		oldstars = 0
		cash = 1050
	}
	{
		diff = expert
		newstars = 5
		oldstars = 0
		cash = 1800
	}
	{
		diff = expert
		newstars = 4
		oldstars = 3
		cash = 600
	}
	{
		diff = expert
		newstars = 5
		oldstars = 3
		cash = 1350
	}
	{
		diff = expert
		newstars = 5
		oldstars = 4
		cash = 750
	}
]
songs_implemented = {
}

script progression_checksong5star 
	printf \{qs(0xb04c15e0)}
	get_progression_globals game_mode = ($game_mode)
	songlist = <tier_global>
	tier = 1
	begin
	setlist_prefix = ($<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<songlist>.<tier_checksum>.songs)
	unlocked = 0
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <tier>
	getglobaltags <gig_name>
	if (<unlocked> = 0 && <completed> = 0)
		return \{false}
	endif
	array_count = 0
	begin
	if ($current_progression_flag = career_band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<songlist>.part) song = ($<songlist>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<songlist>.part) song = ($<songlist>.<tier_checksum>.songs [<array_count>])
	endif
	getglobaltags <song_checksum> param = unlocked
	getglobaltags <song_checksum> param = stars
	if NOT progression_isbosssong tier_global = <tier_global> tier = <tier> song = ($<songlist>.<tier_checksum>.songs [<array_count>])
		if NOT (<stars> = 5)
			return \{false}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<songlist>.num_tiers)
	return \{true}
endscript

script progression_checkdiff 
	printf \{qs(0xfc49ebf7)}
	progression_getdifficulty
	if NOT (<diff> = <difficulty>)
		return \{false}
	endif
	if gotparam \{mode}
		if NOT ($game_mode = <mode>)
			return \{false}
		endif
	endif
	return \{true}
endscript

script progression_songfailed 
	printf \{qs(0xb3ef858d)}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		updateatoms \{name = progression}
	endif
	if NOT ($is_attract_mode = 1)
		change \{achievements_songwonflag = 0}
		achievements_update
	endif
	if isxenon
		if NOT ($current_song = jamsession)
			writesongdatatofile \{failed = 1}
		endif
	endif
endscript

script progression_songwon 
	printf \{qs(0xaea36534)}
	additional_cash = 0
	change \{progression_beat_game_last_song = 0}
	change \{progression_unlock_tier_last_song = 0}
	change \{progression_got_sponsored_last_song = 0}
	change \{progression_play_completion_movie = 0}
	update_song_star_rating
	if issingleplayergame
		getplayerinfo \{1
			part}
	else
		part = band
	endif
	get_difficulty_text_nl difficulty = ($player1_status.difficulty)
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	if ($current_song != jamsession)
		if issingleplayergame
			get_player_percent_accuracy \{player_index = 1}
		else
			gamemode_getnumplayersshown
			p = 1
			gold_stars = 1
			begin
			get_player_percent_accuracy player_index = <p>
			if (<percent_notes_hit> != 100)
				gold_stars = 0
			endif
			p = (<p> + 1)
			repeat <num_players_shown>
			if (<gold_stars> = 1)
				<percent_notes_hit> = 100
			else
				<percent_notes_hit> = 0
			endif
		endif
		if (<percent_notes_hit> = 100)
			if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
				setglobaltags <songname> params = {tr_percent100 = 1}
			endif
			if ($game_mode = p1_quickplay ||
					$game_mode = p1_career)
				setglobaltags <songname> params = {achievement_gold_star = 1}
			endif
		endif
	endif
	gamemode_gettype
	if (<type> = career)
		get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
		songlist = <tier_global>
		bandname_id = band_info
		setglobaltags <bandname_id> params = {first_play = 0} all_active_players = 1
		getglobaltags \{progression
			params = current_tier}
		getglobaltags \{progression
			params = current_song_count}
		getglobaltags \{progression
			params = career_using_createagig}
		song_count = <current_song_count>
		if gotparam \{current_tier}
			setlist_prefix = ($<songlist>.prefix)
			formattext checksumname = tier_checksum 'tier%s' s = <current_tier>
			if (<career_using_createagig> = 1)
				if ($current_progression_flag = career_band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song)
				endif
			else
				if ($current_progression_flag = career_band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<song_count>]) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
				endif
			endif
			if progression_isbosssong tier_global = <tier_global> tier = <current_tier> song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
				change \{structurename = player1_status
					stars = 5}
			endif
			if issingleplayergame
				getplayerinfo \{1
					stars}
				new_stars = <stars>
				getplayerinfo \{1
					score}
				new_score = <score>
			else
				new_stars = ($band1_status.stars)
				new_score = ($band1_status.score)
			endif
			if ($is_network_game = 0)
				progression_cashmilestonessongwon
			endif
			if issingleplayergame
				get_player_percent_accuracy \{player_index = 1}
			else
				gamemode_getnumplayersshown
				p = 1
				gold_stars = 1
				begin
				get_player_percent_accuracy player_index = <p>
				if (<percent_notes_hit> != 100)
					gold_stars = 0
				endif
				p = (<p> + 1)
				repeat <num_players_shown>
				if (<gold_stars> = 1)
					<percent_notes_hit> = 100
				else
					<percent_notes_hit> = 0
				endif
			endif
			if (<percent_notes_hit> = 100)
				setglobaltags <song_checksum> params = {percent100 = 1} all_active_players = 1
			endif
			gamemode_getnumplayersshown
			if (<num_players_shown> > 0)
				if is_boss_battle_song
					num_players_shown = 1
				endif
				<player> = 1
				begin
				getplayerinfo <player> is_local_client
				if (<is_local_client> = 1)
					getplayerinfo <player> controller
					getsavegamefromcontroller controller = <controller>
					getglobaltags <song_checksum> savegame = <savegame> param = stars
					old_stars = <stars>
					getglobaltags <song_checksum> savegame = <savegame> param = score
					old_score = <score>
					if (<new_stars> > <old_stars>)
						setglobaltags <song_checksum> savegame = <savegame> params = {stars = <new_stars>}
						if ($primary_controller = <controller>)
							if ($current_tab = tab_setlist)
								if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) nocash
									progression_awardcash old_stars = <stars> new_stars = <new_stars>
								endif
							endif
						endif
					endif
					if (<new_score> > <old_score>)
						casttointeger \{new_score}
						setglobaltags <song_checksum> savegame = <savegame> params = {score = <new_score>}
					endif
				endif
				player = (<player> + 1)
				repeat <num_players_shown>
			endif
			setup_encore = 1
			getglobaltags \{progression
				params = career_play_song_and_end
				noassert = 1}
			if gotparam \{career_play_song_and_end}
				if (<career_play_song_and_end> = 1)
					setup_encore = 0
				endif
			endif
			if (<career_using_createagig> = 1)
				setup_encore = 0
			endif
			if (<setup_encore> = 1)
				getarraysize ($<tier_global>.<tier_checksum>.songs)
				getglobaltags \{progression
					params = current_song_count}
				if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
					if ((<current_song_count> + 1) = (<array_size> - 1))
						change \{current_transition = preencore}
						<current_song_count> = (<current_song_count> + 1)
						setglobaltags progression params = {current_song_count = <current_song_count> encore_song = ($<tier_global>.<tier_checksum>.encorep1)}
					endif
				endif
			endif
			if ($is_network_game = 0)
				format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
				getglobaltags <gig_name> param = completed
				if (<completed> = 0)
					if structurecontains structure = ($<tier_global>.<tier_checksum>) end_with_credits
						if progression_career_check_gig_complete ($current_progression_flag) gig = ($current_gig_number)
							change \{end_credits = 1}
							get_movie_id_by_name movie = ($<tier_global>.end_movie)
							setglobaltags <id> params = {unlocked = 1} all_active_players = 1
						endif
					endif
				endif
			endif
		endif
		if NOT ($current_song = jamsession)
			if globaltagexists \{$current_song
					noassert = 1}
				setglobaltags \{$current_song
					all_active_players = 1
					params = {
						unlocked = 1
					}}
			endif
		endif
		if iswinport
			0xf9e188de <...>
		endif
		execute_unlock_atoms
	elseif (<type> = quickplay && $is_network_game = 0)
		progression_cashmilestonessongwon
	endif
	progression_updatedetailedstatsforgig
	if isxenon
		if NOT ($current_song = jamsession)
			writesongdatatofile
		endif
	endif
endscript

script update_song_star_rating 
	gamemode_getnumplayersshown
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	new_stars = 3
	if ($<player_status>.score >= $<player_status>.base_score * ($star_rating_cutoffs.star5 [(<num_players_shown> - 1)]))
		new_stars = 5
	elseif ($<player_status>.score >= $<player_status>.base_score * ($star_rating_cutoffs.star4 [(<num_players_shown> - 1)]))
		new_stars = 4
	endif
	change structurename = <player_status> stars = <new_stars>
	player = (<player> + 1)
	repeat $current_num_players
	player = 1
	summed_averages = 0.0
	begin
	get_average_multiplier player = <player>
	summed_averages = (<summed_averages> + <average_multiplier>)
	player = (<player> + 1)
	repeat <num_players_shown>
	band_avg_multiplier = (<summed_averages> / <num_players_shown>)
	band_stars = 3
	if (<band_avg_multiplier> >= ($star_rating_cutoffs.star5 [0]))
		band_stars = 5
	elseif (<band_avg_multiplier> >= ($star_rating_cutoffs.star4 [0]))
		band_stars = 4
	endif
	change structurename = band1_status stars = <band_stars>
endscript

script get_player_percent_accuracy 
	requireparams \{[
			player_index
		]
		all}
	if NOT playerinfoequals <player_index> part = vocals
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> max_notes
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	mathfloor <percent_notes_hit>
	<percent_notes_hit> = <floor>
	return percent_notes_hit = <percent_notes_hit>
endscript
end_credits = 0
boss_devil_score = 0

script progression_endcredits 
	printf \{qs(0x08c313c4)}
	change boss_devil_score = ($player1_status.score)
	reset_score \{player_status = player1_status}
	change \{current_level = load_z_credits}
	change \{current_song = $final_credits_song}
	create_loading_screen
	load_venue
	spawnscriptnow \{credits_screenfx}
	restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) starttime = 0 end_credits_restart = 1
	generic_event_choose \{state = uistate_play_song}
	spawnscriptnow \{scrolling_list_begin}
endscript

script progression_endcredits_done 
	if ($end_credits = 1)
		change structurename = player1_status score = ($boss_devil_score)
		change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script playmovie_endcredits 
	killmovie \{textureslot = 1}
	preloadmovie \{movie = 'Fret_Flames'
		textureslot = 1
		texturepri = -2
		no_loop
		no_hold}
	begin
	if (ismoviepreloaded textureslot = 1)
		startpreloadedmovie \{textureslot = 1}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script progression_awardcash 
	printf \{qs(0xf198ad82)}
	additional_cash = 0
	get_current_band_info
	getglobaltags <band_info>
	getglobaltags \{progression
		params = current_song_count}
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	getglobaltags <gig_name> param = cash_earned
	setglobaltags <gig_name> params = {cash_earned = (<cash_earned> + <additional_cash>)}
	getglobaltags \{progression
		params = current_song_count}
	return additional_cash = <additional_cash>
endscript

script progression_countcompletedsongsincurrenttier 
	completed_songs = 0
	tier_size = 0
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	if NOT (<tier_global> = 0 || $current_gig_number = 0)
		progression_getnumtiersong tier_global = <tier_global> tier = ($current_gig_number) all
		song_count = 0
		begin
		progression_gettiersong tier_global = <tier_global> tier = ($current_gig_number) song_count = <song_count>
		getglobaltags <song_checksum> param = stars
		if NOT (<stars> = 0)
			completed_songs = (<completed_songs> + 1)
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs> total_songs = <tier_size>}
endscript

script progression_getnumtiersong 
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	if gotparam \{all}
		return tier_size = <array_size>
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_size = (<array_size> - 1)
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
		array_size = (<array_size> - 1)
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) boss
		array_size = (<array_size> - 1)
	endif
	return tier_size = <array_size>
endscript

script progression_gettiersong 
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song = <song> song_checksum = <song_checksum>
endscript

script progression_getbosssong 
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) boss
		return \{song_count = -1
			song = none
			song_checksum = none}
	endif
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_size> - 1)
	if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_count = (<array_count> - 1)
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script progression_getencoresong \{type = any}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	if (<type> = any)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					song = none
					song_checksum = none}
			endif
		endif
	endif
	if (<type> = p1)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	if (<type> = p2)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_size> - 1)
	if (<type> = p1)
		if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if ($current_progression_flag = career_band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	endif
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script progression_isbosssong 
	if NOT gotparam \{tier}
		return \{false}
	endif
	query_song = <song>
	progression_getbosssong <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script progression_isencoresong 
	query_song = <song>
	progression_getencoresong <...> type = p1
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	progression_getencoresong <...> type = p2
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script progression_unlocksong \{encore = 0
		boss = 0
		unlocked = 0}
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	begin
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <song>)
		if ($current_progression_flag = career_band)
			get_band_difficulty
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
		else
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
		endif
		setglobaltags <song_checksum> all_active_players = 1 params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script progression_getdifficulty 
	difficulty = ($player1_status.difficulty)
	if ($game_mode = p2_career)
		get_minimum_difficulty difficulty1 = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty)
		difficulty = <minimum_difficulty>
	endif
	return difficulty = <difficulty>
endscript

script progression_setprogressionnodeflags 
	changenodeflag \{ls_always
		1}
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode)
	tier = ($current_gig_number)
	if ($coop_dlc_active = 0)
		if ($game_mode = p1_career ||
				$game_mode = p2_career ||
				$game_mode = p3_career ||
				$game_mode = p4_career)
			if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
				ls_encore = 1
			endif
			progression_getdifficulty
			progression_countcompletedsongsincurrenttier
			if (<completed_songs> >= (<total_songs> - 1))
				ls_3_5 = 1
			endif
		endif
	endif
	if ($debug_encore)
		<ls_encore> = 1
	endif
	printf qs(0xd8a1c35d) d = <ls_encore> i = <ls_3_5>
	if (<ls_encore> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			0}
		changenodeflag \{ls_encore_post
			1}
	elseif (<ls_3_5> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	else
		changenodeflag \{ls_3_5_pre
			1}
		changenodeflag \{ls_3_5_post
			0}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	endif
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_setup '%s_SetupNodeflags' s = <pakname>
		if scriptexists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
endscript
gh4_demo_songs = {
	prefix = 'demo'
	num_tiers = 4
	tier1 = {
		songs = [
			beatit
			rebelyell
		]
		level = load_z_goth
		defaultunlocked = 2
	}
	tier2 = {
		songs = [
			crazytrain
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier3 = {
		songs = [
			americanwoman
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier4 = {
		songs = [
			everlong
		]
		level = load_z_military
		defaultunlocked = 1
	}
}
bonus_progression = {
	tier_global = bonus_songs
	progression_global = none
}
download_guitar_progression = {
	tier_global = gh4_download_songs_guitar
	progression_global = none
}
download_bass_progression = {
	tier_global = gh4_download_songs_bass
	progression_global = none
}
download_drum_progression = {
	tier_global = gh4_download_songs_drum
	progression_global = none
}
download_vocals_progression = {
	tier_global = gh4_download_songs_vocals
	progression_global = none
}
download_band_progression = {
	tier_global = gh4_download_songs_band
	progression_global = none
}
demo_progression = {
	tier_global = gh4_demo_songs
	progression_global = none
}
career_guitar_progression = {
	tier_global = gh4_career_guitar_songs
	progression_global = gh4_career_guitar_progression
}
career_bass_progression = {
	tier_global = gh4_career_bass_songs
	progression_global = gh4_career_bass_progression
}
career_drum_progression = {
	tier_global = gh4_career_drum_songs
	progression_global = gh4_career_drum_progression
}
career_vocals_progression = {
	tier_global = gh4_career_vocals_songs
	progression_global = gh4_career_vocals_progression
}
career_band_progression = {
	tier_global = gh4_career_band_songs
	progression_global = gh4_career_band_progression
}

script get_progression_globals \{use_current_tab = 0}
	if NOT gotparam \{game_mode}
		game_mode = ($game_mode)
	endif
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			bonus = 1
		elseif ($current_tab = tab_downloads)
			download = 1
		endif
	endif
	if ($is_demo_mode = 1)
		if gotparam \{bonus}
			addparams ($bonus_progression)
		elseif gotparam \{download}
			addparams ($download_progression)
		elseif (<game_mode> = p1_career)
			addparams ($demo_progression_career)
		elseif (<game_mode> = p1_quickplay)
			addparams ($demo_progression_quickplay)
		else
			addparams ($demo_progression_multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if gotparam \{download}
		if gotparam \{career_guitar}
			addparams ($download_guitar_progression)
		elseif gotparam \{career_bass}
			addparams ($download_bass_progression)
		elseif gotparam \{career_drum}
			addparams ($download_drum_progression)
		elseif gotparam \{career_vocals}
			addparams ($download_vocals_progression)
		elseif gotparam \{career_band}
			addparams ($download_band_progression)
		endif
	endif
	if gotparam \{career_band}
		addparams ($career_band_progression)
	elseif gotparam \{career_guitar}
		addparams ($career_guitar_progression)
	elseif gotparam \{career_bass}
		addparams ($career_bass_progression)
	elseif gotparam \{career_drum}
		addparams ($career_drum_progression)
	elseif gotparam \{career_vocals}
		addparams ($career_vocals_progression)
	elseif gotparam \{bonus}
		addparams ($bonus_progression)
	elseif ($band_mode_mode = career)
		addparams ($career_band_progression)
	elseif ($band_mode_mode = quickplay)
		addparams ($career_band_progression)
	elseif (<game_mode> = p1_career)
		addparams ($career_guitar_progression)
	elseif (<game_mode> = p2_career)
		addparams ($career_band_progression)
	elseif (<game_mode> = p1_quickplay)
		addparams ($career_guitar_progression)
	elseif (<game_mode> = p2_quickplay)
		addparams ($career_band_progression)
	elseif (<game_mode> = p2_coop)
		addparams ($career_band_progression)
	else
		addparams ($career_band_progression)
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script progression_set_new_song_in_gig_list 
	printf \{'progression_set_new_song_in_gig_list'}
	printscriptinfo \{'progression_set_new_song_in_gig_list'}
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	formattext \{checksumname = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	getarraysize ($<tier_global>.<tiername>.songs)
	song_size = <array_size>
	getglobaltags \{progression}
	if (<career_using_createagig> = 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
		setglobaltags <gig_name> params = {started = 1} all_active_players = 1
		if gotparam \{career_play_song_and_end}
			if (<career_play_song_and_end> = 1)
				return \{false}
			endif
		endif
	endif
	if ($quickplay_song_list_current != -1)
		if quickplay_set_new_song_in_gig_list
			return \{true}
		endif
	else
		if ((<current_song_count> + 1) < <song_size>)
			<current_song_count> = (<current_song_count> + 1)
			change current_song = ($<tier_global>.<tiername>.songs [<current_song_count>])
			setglobaltags progression params = {current_song_count = <current_song_count>}
			if structurecontains structure = ($<tier_global>.<tiername>) boss
				if ($current_song = ($<tier_global>.<tiername>.boss))
					setglobaltags <gig_name> params = {boss_unlocked = 1} all_active_players = 1
				endif
			endif
			printf \{'*************************************************************************'}
			printf \{channel = progression
				'*****************'}
			printf \{channel = progression
				'$current_song = %c'
				c = $current_song}
			printf \{channel = progression
				'*****************'}
			printf \{'*************************************************************************'}
			updateatoms \{name = progression}
			return \{true}
		endif
	endif
	updated_progression = 0
	if (<career_using_createagig> = 0)
		gamemode_getnumplayersshown
		player_index = 0
		begin
		getplayerinfo (<player_index> + 1) is_local_client
		if (<is_local_client> != 0)
			getplayerinfo (<player_index> + 1) controller
			getsavegamefromcontroller controller = <controller>
			getglobaltags <gig_name> savegame = <savegame> params = completed
			if (<completed> = 0)
				setglobaltags <gig_name> params = {completed = 1} savegame = <savegame>
				change \{allow_career_progression_check = 1}
				change current_progression_savegame = <savegame>
				register_new_progression_atoms ($current_progression_flag) keep_current_savegame
				updated_progression = 1
				change \{allow_career_progression_check = 0}
			elseif (<completed> = -1)
				setglobaltags <gig_name> params = {completed = 2} savegame = <savegame>
			endif
		endif
		player_index = (<player_index> + 1)
		repeat <num_players_shown>
		if ($current_level != load_z_credits)
			formattext {
				checksumname = venue_checksum
				'%s_%i'
				s = ($levelzones.($current_level).name)
				i = ($instrument_list.($<tier_global>.part).text_nl)
				addtostringlookup = true
			}
			setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
			formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.($current_level).name)
			setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
		endif
	endif
	if (<updated_progression> = 0)
		updateatoms \{name = progression}
	endif
	if ishost
		sendstructure \{callback = savegigcomplete
			data_to_send = {
				none
			}}
	endif
	if NOT ($is_attract_mode = 1)
		change \{achievements_newgigwonflag = 1}
		achievements_update
		change \{achievements_newgigwonflag = 0}
	endif
	return \{false}
endscript

script savegigcomplete 
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	formattext \{checksumname = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	getarraysize ($<tier_global>.<tiername>.songs)
	song_size = <array_size>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	setglobaltags <gig_name> params = {started = 1}
	getglobaltags <gig_name> params = completed
	if (<completed> = 0)
		setglobaltags <gig_name> params = {completed = 1}
		change \{allow_career_progression_check = 1}
	elseif (<completed> = -1)
		setglobaltags <gig_name> params = {completed = 2}
	endif
	formattext {
		checksumname = venue_checksum
		'%s_%i'
		s = ($levelzones.($current_level).name)
		i = ($instrument_list.($<tier_global>.part).text_nl)
		addtostringlookup = true
	}
	setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.($current_level).name)
	setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	updateatoms \{name = progression}
	change \{allow_career_progression_check = 0}
endscript

script quickplay_set_new_song_in_gig_list 
	if ($quickplay_song_list_current = -1)
		return \{false}
	endif
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{false}
	endif
	change quickplay_song_list_current = ($quickplay_song_list_current + 1)
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{false}
	else
		change current_song = ($quickplay_song_list [($quickplay_song_list_current)])
		return \{true}
	endif
endscript

script quickplay_end_of_gig_list 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{true}
	endif
	<quickplay_song_list_current> = ($quickplay_song_list_current + 1)
	if (<quickplay_song_list_current> >= $num_quickplay_song_list)
		return \{true}
	else
		return \{false}
	endif
endscript

script progression_check_for_gig_end 
	getglobaltags \{progression}
	if (<career_using_createagig> = 1)
		if quickplay_end_of_gig_list
			return \{true}
		endif
	else
		get_progression_globals ($current_progression_flag)
		formattext \{checksumname = tiername
			'tier%d'
			d = $current_gig_number}
		getarraysize ($<tier_global>.<tiername>.songs)
		if ((<current_song_count> + 1) >= <array_size>)
			return \{true}
		endif
		if gotparam \{career_play_song_and_end}
			if (<career_play_song_and_end> = 1)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script debug_unlock_next_gig \{part = band}
	temp = $allow_career_progression_check
	change \{allow_career_progression_check = 1}
	progression_flag = career_band
	unlock_order = gh4_career_band_progression_unlock_order
	if (<part> = guitar)
		<progression_flag> = career_guitar
		<unlock_order> = gh4_career_guitar_progression_unlock_order
	elseif (<part> = bass)
		<progression_flag> = career_bass
		<unlock_order> = gh4_career_bass_progression_unlock_order
	elseif (<part> = drum)
		<progression_flag> = career_drum
		<unlock_order> = gh4_career_drum_progression_unlock_order
	elseif (<part> = vocals)
		<progression_flag> = career_vocals
		<unlock_order> = gh4_career_vocals_progression_unlock_order
	endif
	progression_career_gig_complete <...> (<progression_flag>)
	change allow_career_progression_check = <temp>
endscript

script register_new_progression_atoms 
	index = ($difficulty_list_props.($player1_status.difficulty).index)
	setprogressiondifficulty difficulty = <index>
	deregisteratoms
	if NOT gotparam \{keep_current_savegame}
		getsavegamefromcontroller controller = ($primary_controller)
		change current_progression_savegame = <savegame>
	endif
	get_progression_globals game_mode = ($game_mode) <...>
	if NOT (<progression_global> = none)
		setup_unlock_atoms <...>
		array = $<progression_global>
		getarraysize \{$unlock_atoms}
		if (<array_size> > 0)
			i = 0
			begin
			addarrayelement array = <array> element = ($unlock_atoms [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
		registeratoms name = progression <array>
		updateatoms \{name = progression}
	endif
endscript

script progression_career_check_challenge_complete 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	formattext checksumname = challenge_crc 'challenge%d_completed' d = <challenge_num>
	getglobaltags <gig_name>
	if ((<...>.<challenge_crc>) = 1)
		return \{true}
	endif
	return \{false}
endscript

script check_gig_completed_quick 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	getglobaltags <gig_name>
	if (<completed> = 1 || <completed> = 2)
		return \{true}
	endif
	return \{false}
endscript

script check_gig_unlocked 
	get_progression_globals <...>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig>
	getglobaltags <gig_name>
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script unlock_special_event_challenge 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	getglobaltags <gig_name>
	if (<challenge_num> = 2)
		setglobaltags <gig_name> params = {challenge2_unlocked = 1}
		if (<challenge2_unlocked> != 1)
			setglobaltags <gig_name> params = {completed = -1}
		endif
	elseif (<challenge_num> = 3)
		setglobaltags <gig_name> params = {challenge3_unlocked = 1}
		if (<challenge3_unlocked> != 1)
			setglobaltags <gig_name> params = {completed = -1}
		endif
	endif
endscript

script progression_career_check_gig_complete savegame = ($current_progression_savegame)
	printf \{qs(0x567674eb)}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	if gotparam \{gig}
		formattext checksumname = tier 'tier%d' d = <gig>
		getarraysize ($<tier_global>.<tier>.songs)
		num_required = <array_size>
		array_entry = 0
		begin
		diff_index = 0
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier>.songs [<array_entry>]) difficulty_index = <diff_index>
		getglobaltags <song_checksum> savegame = <savegame> params = stars
		if (<stars> > 2)
			<num_required> = (<num_required> - 1)
			break
		endif
		diff_index = (<diff_index> + 1)
		repeat 5
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		if (<num_required> <= 0)
			return \{true}
		endif
	endif
	return \{false}
endscript
allow_career_progression_check = 0

script progression_career_gig_complete savegame = ($current_progression_savegame)
	if ($allow_career_progression_check = 0)
		return
	endif
	change \{allow_career_progression_check = 0}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	set_got_unlocked = 0
	set_num = 1
	begin
	formattext checksumname = setnum 'unlockset%d' d = <set_num>
	if NOT structurecontains structure = $<unlock_order> <setnum>
		break
	endif
	set_has_none = 0
	if structurecontains structure = ($<unlock_order>.<setnum>) none
		set_has_none = 1
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = ($<unlock_order>.<setnum>.none)
		getglobaltags <gig_name> savegame = <savegame>
		if (<unlocked> = 0)
			setglobaltags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			return
		endif
	endif
	if (<set_has_none> = 0)
		gig_num = 1
		begin
		formattext checksumname = gignum 'gig%d' d = <gig_num>
		if NOT structurecontains structure = ($<unlock_order>.<setnum>) <gignum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<gignum>.name)
		gig_number = ($<unlock_order>.<setnum>.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		getglobaltags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			setglobaltags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			formattext checksumname = tiername 'tier%d' d = <gig_number>
			getarraysize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			setglobaltags ($<tier_global>.<tiername>.songs [<song_index>]) savegame = <savegame> params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_size>
		endif
		<gig_num> = (<gig_num> + 1)
		repeat
		specialevent_num = 1
		begin
		formattext checksumname = specialeventnum 'special_event%d' d = <specialevent_num>
		if NOT structurecontains structure = ($<unlock_order>.<setnum>) <specialeventnum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<specialeventnum>.name)
		gig_num = ($<unlock_order>.<setnum>.<specialeventnum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		getglobaltags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			setglobaltags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			formattext checksumname = tiername 'tier%d' d = <gig_num>
			getarraysize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			setglobaltags ($<tier_global>.<tiername>.songs [<song_index>]) savegame = <savegame> params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_size>
		endif
		<specialevent_num> = (<specialevent_num> + 1)
		repeat
		paytoplay_num = 1
		begin
		formattext checksumname = paytoplaynum 'pay_to_play%d' d = <paytoplay_num>
		if NOT structurecontains structure = ($<unlock_order>.<setnum>) <paytoplaynum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<paytoplaynum>.name)
		gig_number = ($<unlock_order>.<setnum>.<paytoplaynum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		getglobaltags <gig_name> savegame = <savegame> noassert = 1
		if (<unlocked> = 0)
			setglobaltags <gig_name> savegame = <savegame> params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
		endif
		<paytoplay_num> = (<paytoplay_num> + 1)
		repeat
		if (<set_got_unlocked> = 1)
			return
		endif
	endif
	<set_num> = (<set_num> + 1)
	repeat
endscript

script progression_career_gig_unlock 
	printf \{'Progression_Career_Gig_Unlock'}
	printstruct <...>
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig_name>
	getglobaltags <gig_name>
	if (<unlocked> = 0)
		setglobaltags <gig_name> savegame = ($current_progression_savegame) params = {unlocked = 1 first_time_unlocked = 1}
	endif
endscript

script progression_cleardetailedstatsforgig 
	change \{gig_detailed_stats = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{gig_detailed_stats_band = {
		}}
endscript

script progression_updatedetailedstatsforgig 
	progression_cleardetailedstatsforgig
	<default_song_stats> = {
		song = ($current_song)
	}
	gamemode_getnumplayersshown
	if (<num_players_shown> > 0)
		<player_idx> = 0
		begin
		<player> = (<player_idx> + 1)
		getplayerinfo <player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <player> score
			casttointeger \{score}
			getplayerinfo <player> cash_rank_up
			getplayerinfo <player> new_cash
			getplayerinfo <player> career_earnings
			getplayerinfo <player> stars
			getplayerinfo <player> notes_hit
			getplayerinfo <player> total_notes
			getplayerinfo <player> sp_phrases_hit
			getplayerinfo <player> sp_phrases_total
			getplayerinfo <player> best_run
			getplayerinfo <player> max_notes
			getplayerinfo <player> vocal_streak_phrases
			getplayerinfo <player> vocal_phrase_quality
			getplayerinfo <player> vocal_phrase_max_qual
			get_average_multiplier player = <player>
			<avg_multiplier> = <average_multiplier>
			get_song_section_arrays_for_player player = <player>
			<curr_song_stats> = {
				<default_song_stats>
				score = <score>
				stars = <stars>
				notes_hit = <notes_hit>
				best_run = <best_run>
				max_notes = <max_notes>
				total_notes = <total_notes>
				sp_phrases_hit = <sp_phrases_hit>
				sp_phrases_total = <sp_phrases_total>
				avg_multiplier = <avg_multiplier>
				cash_rank_up = <cash_rank_up>
				new_cash = <new_cash>
				career_earnings = <career_earnings>
				vocal_streak_phrases = <vocal_streak_phrases>
				vocal_phrase_quality = <vocal_phrase_quality>
				vocal_phrase_max_qual = <vocal_phrase_max_qual>
				detailed_stats = <detailed_stats>
				detailed_stats_max = <detailed_stats_max>
				section_names = <section_names>
			}
			getarraysize \{$gig_detailed_stats}
			if (<array_size> < 10)
				<stats_all> = ($gig_detailed_stats)
				<old_stats_player> = (<stats_all> [<player_idx>])
				addarrayelement array = <old_stats_player> element = <curr_song_stats>
				setarrayelement arrayname = stats_all index = <player_idx> newvalue = <array>
				change globalname = gig_detailed_stats newvalue = <stats_all>
			else
				scriptassert 'Played more than %d songs in the current gig.' d = <array_size>
			endif
		endif
		<player_idx> = (<player_idx> + 1)
		repeat <num_players_shown>
	endif
	if (($current_num_players) > 1)
		current_band_stats = {
			stars = ($band1_status.stars)
			score = ($band1_status.score)
			high_mult = ($band1_status.high_mult)
			high_2p_streak = ($band1_status.high_2p_streak)
			high_3p_streak = ($band1_status.high_3p_streak)
			high_4p_streak = ($band1_status.high_4p_streak)
		}
		change gig_detailed_stats_band = <current_band_stats>
	endif
endscript

script get_song_section_arrays_for_player 
	requireparams \{[
			player
		]
		all}
	<detailed_stats> = []
	<detailed_stats_max> = []
	<section_names> = []
	formattext checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> addtostringlookup
	formattext checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> addtostringlookup
	getplayerinfo <player> current_song_section_array
	if (<current_song_section_array> = none)
		return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
	endif
	<song_section_array> = <current_song_section_array>
	getmarkerarraysize array = <song_section_array>
	if (<array_size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		formattext textname = marker_text qs(0x73307931) s = (($<song_section_array> [<i>]).marker)
		addarrayelement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript

script progression_gig_get_highest_difficulty_completed 
	get_progression_globals <...> ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = 4
	if gotparam \{gig}
		formattext checksumname = tier 'tier%d' d = <gig>
		getarraysize ($<tier_global>.<tier>.songs)
		num_required = <array_size>
		array_entry = 0
		begin
		song = ($<tier_global>.<tier>.songs [<array_entry>])
		progression_song_get_highest_difficulty_completed song = <song> ($current_progression_flag)
		if (<diff_index> != -1)
			num_required = (<num_required> - 1)
			if (<diff_index> < <highest_diff_index>)
				highest_diff_index = <diff_index>
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		if (<num_required> <= 0)
			get_difficulty_text_nl difficulty = ($difficulty_list [<highest_diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
		endif
	endif
	return highest_diff_completed = <highest_diff_completed>
endscript

script progression_song_get_highest_difficulty_completed 
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = -1
	if gotparam \{song}
		diff_index = 0
		getarraysize \{$difficulty_list}
		diff_size = <array_size>
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = ($difficulty_list [<diff_index>])
		getglobaltags <song_checksum> params = stars
		if (<stars> > 2)
			get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
			<highest_diff_index> = <diff_index>
		endif
		<diff_index> = (<diff_index> + 1)
		repeat <diff_size>
	endif
	return highest_diff_completed = <highest_diff_completed> diff_index = <highest_diff_index>
endscript

script 0x37ee468a 
	get_progression_globals <...>
	savegame = ($current_progression_savegame)
	0xb7d9d74d = 0
	num_unlocked = 0
	i = 1
	begin
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <i>
	getglobaltags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		<num_unlocked> = (<num_unlocked> + 1)
	endif
	if (<completed> = 1 || <completed> = 2)
		<0xb7d9d74d> = (<0xb7d9d74d> + 1)
	endif
	<i> = (<i> + 1)
	repeat (($<tier_global>.num_tiers) - 2)
	return 0xb7d9d74d = <0xb7d9d74d> num_unlocked = <num_unlocked>
endscript

script 0xf9e188de 
	get_progression_globals <...>
	savegame = ($current_progression_savegame)
	begin
	0x37ee468a
	printf qs(0x690492e0) a = <0xb7d9d74d> b = <num_unlocked>
	formattext checksumname = 0x723effed 'winport_completed_to_unlocked_%d' d = <0xb7d9d74d>
	if NOT structurecontains structure = ($<tier_global>) <0x723effed>
		return
	endif
	0x7cb62b37 = ($<tier_global>.<0x723effed>)
	printf qs(0xabe4541e) a = <0x7cb62b37>
	if (<num_unlocked> < <0x7cb62b37>)
		change \{allow_career_progression_check = 1}
		progression_flag = career_band
		unlock_order = gh4_career_band_progression_unlock_order
		progression_career_gig_complete <...> (<progression_flag>)
		change \{allow_career_progression_check = 0}
	else
		break
	endif
	repeat
endscript
