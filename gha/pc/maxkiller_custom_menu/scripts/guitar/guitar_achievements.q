gstar_power_triggered = 0
jailbait_achievement = 0
subway_achievement = 0
achievement_atoms = [
	{
		name = make_it
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = easy
				}
			}
		]
	}
	{
		name = movin_out
		type = scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = medium
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = medium
				}
			}
		]
	}
	{
		name = rock_in_a_hard_place
		type = scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = hard
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = hard
				}
			}
		]
	}
	{
		name = dream_on
		type = scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = expert
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = expert
				}
			}
		]
	}
	{
		name = aerosmith
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_aerosmith
			}
		]
	}
	{
		name = jailbait
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_play_at_venue
				params = {
					venue = load_z_nipmuc
				}
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = subway
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_play_at_venue
				params = {
					venue = load_z_maxskc
				}
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = on_the_road_again
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_unlocked_venue
				params = {
					venue = load_z_fenway
				}
			}
		]
	}
	{
		name = nine_lives
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_unlocked_venue
				params = {
					venue = load_z_nine_lives
				}
			}
		]
	}
	{
		name = critical_mass
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_unlocked_venue
				params = {
					venue = load_z_jpplay
				}
			}
		]
	}
	{
		name = march_19th_2001
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_unlocked_venue
				params = {
					venue = load_z_hof
				}
			}
		]
	}
	{
		name = no_more_no_more
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 1
				}
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 2
				}
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 3
				}
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 4
				}
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 5
				}
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 6
				}
			}
		]
	}
	{
		name = same_old_song_and_dance
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = any
				}
			}
			{
				type = scr
				scr = achievements_isgamefinished
				params = {
					game_mode = p1_career
					difficulty = any
					bonus
				}
			}
		]
	}
	{
		name = score_hero
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_score_hero
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = get_it_up
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_career_score_threshold
				params = {
					threshold = 1999999
				}
				permanent = false
			}
		]
	}
	{
		name = eat_the_rich
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_career_cash_threshold
				params = {
					threshold = 49999
				}
				permanent = false
			}
		]
	}
	{
		name = i_dont_want_to_miss_a_thing
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = false
			}
			{
				type = scr
				scr = achievements_100percent_performance
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = gems
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_gems
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = sick_as_a_dog
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = false
			}
			{
				type = scr
				scr = achievements_5starsong
				params = {
				}
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = aint_that_a_b____h
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_100percent_performance
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = dude_looks_like_a_lady
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_dude_looks_like_a_lady
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = woman_of_the_world
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_woman_of_the_world
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = spaced
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_spaced
				permanent = false
			}
			{
				type = scr
				scr = achievements_issongwon
				permanent = false
			}
		]
	}
	{
		name = what_it_takes
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_what_it_takes
			}
		]
	}
	{
		name = deuces_are_wild
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_coopbeatenpart
				params = {
					part = guitar
				}
			}
		]
	}
	{
		name = love_me_two_times
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_coopbeatenpart
				params = {
					part = rhythm
				}
			}
		]
	}
]
achievements_songwonflag = 0

script achievements_issongwon 
	if ($achievements_songwonflag = 1)
		return \{true}
	endif
	return \{false}
endscript

script achievements_dummyscript 
endscript

script achievements_songwon 
	if ($game_mode = p1_career)
		getglobaltags \{achievement_info}
		total_cash_in_career_mode = (<total_cash_in_career_mode> + <additional_cash>)
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		setglobaltags achievement_info params = {total_cash_in_career_mode = <total_cash_in_career_mode>
			total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		if ($current_difficulty = easy)
			total_points_in_career_mode_easy = (<total_points_in_career_mode_easy> + $player1_status.score)
			setglobaltags achievement_info params = {total_points_in_career_mode_easy = <total_points_in_career_mode_easy>}
		endif
		if ($current_difficulty = medium)
			total_points_in_career_mode_medium = (<total_points_in_career_mode_medium> + $player1_status.score)
			setglobaltags achievement_info params = {total_points_in_career_mode_medium = <total_points_in_career_mode_medium>}
		endif
		if ($current_difficulty = hard)
			total_points_in_career_mode_hard = (<total_points_in_career_mode_hard> + $player1_status.score)
			setglobaltags achievement_info params = {total_points_in_career_mode_hard = <total_points_in_career_mode_hard>}
		endif
		if ($current_difficulty = expert)
			total_points_in_career_mode_expert = (<total_points_in_career_mode_expert> + $player1_status.score)
			setglobaltags achievement_info params = {total_points_in_career_mode_expert = <total_points_in_career_mode_expert>}
		endif
		achievements_checkcareertotals
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($gstar_power_triggered >= 3)
			writeachievements \{achievement = when_i_needed_you}
		endif
		if ($game_mode = p2_quickplay)
			if (($player1_status.total_notes = $player1_status.notes_hit) && ($player2_status.total_notes = $player2_status.notes_hit))
				if NOT (($player1_status.total_notes = 0) && ($player2_status.total_notes = 0))
					writeachievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		elseif ($game_mode = p2_coop)
			if ($player1_status.total_notes = $player1_status.notes_hit)
				if NOT ($player1_status.total_notes = 0)
					writeachievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		endif
		if (($player1_status.character_id = bradw) && ($player2_status.character_id = tomh))
			writeachievements \{achievement = back_in_the_saddle}
		elseif (($player1_status.character_id = tomh) && ($player2_status.character_id = bradw))
			writeachievements \{achievement = back_in_the_saddle}
		endif
		if (($primary_controller) = ($player1_status.controller))
			player_status = player1_status
		else
			player_status = player2_status
		endif
		if ($<player_status>.part = rhythm)
			setglobaltags ($current_song) params = {beaten_coop_as_rhythm = 1}
		else
			setglobaltags ($current_song) params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
		formattext checksumname = hendrix_checksum 'hendrix_achievement_%s' s = <difficulty_text_nl>
		getglobaltags <bandname_id> param = <hendrix_checksum>
		getglobaltags \{user_options
			params = lefty_flip_p1}
		if ((<...>.<hendrix_checksum>) = 2)
		elseif ((<...>.<hendrix_checksum>) = -1)
			addparam name = <hendrix_checksum> structure_name = new_params value = <lefty_flip_p1>
			setglobaltags <bandname_id> params = <new_params>
		elseif NOT ((<...>.<hendrix_checksum>) = <lefty_flip_p1>)
			addparam name = <hendrix_checksum> structure_name = new_params value = 2
			setglobaltags <bandname_id> params = <new_params>
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = kingsandqueens && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			writeachievements \{achievement = only_the_l33t}
		endif
	endif
endscript

script achievements_100percent_performance 
	printf \{"Achievements_100percent_performance"}
	if ($is_attract_mode = 0 &&
			($game_mode = p1_career ||
				$game_mode = p1_quickplay))
		if ($player1_status.notes_hit = $player1_status.max_notes &&
				$player1_status.max_notes > 0)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_whoneedsthepower 
	printf \{"Achievements_WhoNeedsThePower"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{false}
	endif
	if ($is_network_game = 0 &&
			($game_mode = p2_pro_faceoff ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_battle))
		return \{false}
	endif
	printf \{"star power trigged  = %d"
		d = $gstar_power_triggered}
	if ($player1_status.score > 199999 &&
			$gstar_power_triggered = 0 &&
			$current_song = cultofpersonality)
		return \{true}
	endif
	return \{false}
endscript

script achievements_tone_deaf 
	printf \{"Achievements_TONE_DEAF"}
	if ($game_mode = p1_quickplay ||
			($game_mode = p1_career && $boss_battle = 0))
		getglobaltags \{user_options}
		if ($current_difficulty = expert)
			if (<guitar_volume> = 0)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script achievements_star_mania 
	printf \{"Achievements_STAR_MANIA"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{false}
	endif
	if NOT ($game_mode = p1_quickplay)
		return \{false}
	endif
	printf \{"star power trigged  = %d"
		d = $gstar_power_triggered}
	if ($gstar_power_triggered > 2)
		if ($current_song = kingsandqueens && $current_difficulty = expert)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_life_of_the_party 
	printf \{"Achievements_LIFE_OF_THE_PARTY"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_search_and_destroy 
	printf \{"Achievements_SEARCH_AND_DESTROY"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_button_masher 
	printf \{"Achievements_BUTTON_MASHER"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_big_ol_pile_of_wins 
	printf \{"Achievements_BIG_OL_PILE_OF_WINS"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_enlightened_guitarist 
	array_entry = 0
	get_songlist_size
	num_gold_star_games = 0
	begin
	get_songlist_checksum index = <array_entry>
	get_difficulty_text_nl \{difficulty = expert}
	get_song_prefix song = <song_checksum>
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	getglobaltags <songname>
	if (<achievement_gold_star> = 1)
		num_gold_star_games = (<num_gold_star_games> + 1)
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	if (<num_gold_star_games> > 19)
		return \{true}
	endif
	return \{false}
endscript

script achievement_toys_in_the_attic 
	printf \{"Achievement_TOYS_IN_THE_ATTIC"}
	guitar_array = ($bonus_guitars)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	guitar_array = ($bonus_basses)
	getarraysize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	getglobaltags <guitar_id>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script achievement_big_ten_inch_record 
	getarraysize ($bonus_songs_info)
	index = 0
	begin
	getglobaltags ($bonus_songs_info [<index>].item)
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script achievement_kings_and_queens 
	character_array = ($secret_characters)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script achievement_walk_this_way 
	character_array = ($secret_characters)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if ((<unlocked> = 1) && (<character_array> [<index>].info_name = dmc))
		return \{true}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript

script achievement_burning_a_hole_in_your_pocket 
	getarraysize ($bonus_videos)
	index = 0
	begin
	video_checksum = ($bonus_videos [<index>].id)
	getglobaltags <video_checksum>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if NOT achievement_big_ten_inch_record
		return \{false}
	endif
	if NOT achievement_toys_in_the_attic
		return \{false}
	endif
	if NOT achievement_kings_and_queens
		return \{false}
	endif
	character_array = ($bonus_outfits)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	character_array = ($bonus_styles)
	getarraysize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	getglobaltags <character_id>
	if (<unlocked> = 0)
		return \{false}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script achievement_checkbuyachievements 
	if achievement_toys_in_the_attic
		writeachievements \{achievement = toys_in_the_attic}
	endif
	if achievement_big_ten_inch_record
		writeachievements \{achievement = big_ten_inch_record}
	endif
	if achievement_kings_and_queens
		writeachievements \{achievement = kings_and_queens}
	endif
	if achievement_walk_this_way
		writeachievements \{achievement = walk_this_way}
	endif
	if achievement_burning_a_hole_in_your_pocket
		writeachievements \{achievement = burning_a_hole_in_your_pocket}
	endif
	if achievements_welcome_to_hell
		writeachievements \{achievement = welcome_to_hell}
	endif
endscript

script achievements_isgamefinished 
	printf \{"Achievements_IsGameFinished"}
	if NOT gotparam \{difficulty}
		scriptassert \{"No difficulty"}
	endif
	if NOT gotparam \{game_mode}
		scriptassert \{"No game mode"}
	endif
	getarraysize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	if gotparam \{bonus}
		get_progression_globals game_mode = <game_mode> bonus
	else
		get_progression_globals game_mode = <game_mode>
	endif
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
	getglobaltags <gametype_checksum>
	if (<difficulty> = any)
		if (<complete> = 1)
			return \{true}
		endif
	endif
	if (<difficulty> = all)
		if (<complete> = 0)
			return \{false}
		endif
	endif
	if (<difficulty> = ($difficulty_list [<array_count>]))
		if (<complete> = 1)
			return \{true}
		else
			return \{false}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	if (<difficulty> = any)
		return \{false}
	else
		return \{true}
	endif
endscript

script achievements_score_hero 
	printf \{"Achievements_SCORE_HERO"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if (($player1_status.score > 325000) && ($current_song = trainkeptarollin))
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_half_a_mill 
	printf \{"Achievements_HALF_A_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 500000)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_first_mill 
	printf \{"Achievements_FIRST_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 750000)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_checkcareertotals 
	getglobaltags \{achievement_info}
	if (<total_cash_in_career_mode> > 350000)
		writeachievements \{achievement = never_gonna_spend_it_all}
	endif
	if (<total_notes_in_career_mode> > 250000)
		writeachievements \{achievement = notes_from_hell}
	endif
	if (<total_points_in_career_mode> > 100000000)
		writeachievements \{achievement = billion_gulp}
	endif
endscript

script achievements_coopbeatenpart 
	printf \{"Achievements_CoopBeatenPart"}
	get_progression_globals \{game_mode = p2_quickplay}
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	begin
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	getglobaltags ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if (<part> = rhythm)
		if (<beaten_coop_as_rhythm> = 0)
			return \{false}
		endif
	else
		if (<beaten_coop_as_lead> = 0)
			return \{false}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{true}
endscript

script achievements_welcome_to_hell 
	getglobaltags \{achievement_info
		param = ranked_matches_played}
	if (<ranked_matches_played> < 100)
		return \{false}
	endif
	if NOT achievement_burning_a_hole_in_your_pocket
		return \{false}
	endif
	if NOT achievements_isgamefinished \{game_mode = p1_career
			difficulty = all}
		return \{false}
	endif
	return \{true}
endscript

script achievements_hendrix_reborn 
	getglobaltags \{achievement_info}
	if (<hendrix_achievement_lefty_off> = 1 &&
			<hendrix_achievement_lefty_on> = 1)
		return \{true}
	endif
	return \{false}
endscript

script achievements_whammy_mania 
	if ($current_song = numberofthebeast)
		if ($game_mode = p1_career || $game_mode = p1_quickplay)
			if ($whammy_mania_achievement_invalidated = 0)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script achievements_songfailed 
	completion = 0
	get_song_end_time song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	casttointeger \{completion}
	if NOT ($current_song = bossjoe)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		if ($game_mode = p2_coop || $game_mode = p2_quickplay)
			getglobaltags <songname> param = coop_failedtimes
			coop_failedtimes = (<coop_failedtimes> + 1)
			setglobaltags <songname> params = {coop_failedtimes = <coop_failedtimes>}
		else
			getglobaltags <songname> param = failedtimes
			failedtimes = (<failedtimes> + 1)
			setglobaltags <songname> params = {failedtimes = <failedtimes>}
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		getarraysize \{$gh3_songlist}
		total_songs = <array_size>
		getarraysize \{$difficulty_list}
		total_diffs = <array_size>
		total_song_failures = 0
		song_count = 0
		begin
		diffs_count = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<diffs_count>])
		get_song_prefix song = ($gh3_songlist [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		getglobaltags <songname> param = coop_failedtimes
		total_song_failures = (<total_song_failures> + <coop_failedtimes>)
		if (<total_song_failures> > 4)
			writeachievements \{achievement = nobodys_fault}
			break
		endif
		diffs_count = (<diffs_count> + 1)
		repeat <total_diffs>
		song_count = (<song_count> + 1)
		repeat <total_songs>
		if (<completion> > 94)
			writeachievements \{achievement = fallen_angels}
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		getarraysize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		getglobaltags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		array_count = (<array_count> + 1)
		repeat <array_size>
		if (<total_failedtimes> > 9)
			writeachievements \{achievement = night_in_the_ruts}
		endif
	endif
	if ($game_mode = p1_career)
		getglobaltags \{achievement_info}
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		setglobaltags achievement_info params = {total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		achievements_checkcareertotals
	endif
endscript

script achievements_net_game_completed 
	if NOT gotparam \{outcome}
		return
	endif
	if ($is_network_game = 1 && (netsessionfunc func = isranked obj = match))
		if (<outcome> = win)
			retrieve_player_net_id \{player = 2}
			checkandwritemakerachievement player_xuid = <net_id>
			if ($game_mode = p2_pro_faceoff)
				writeachievements \{achievement = my_fist_your_face}
				if ((($player1_status.score) - ($player2_status.score)) > 9999)
					writeachievements \{achievement = walkin_the_dog}
				endif
			elseif ($game_mode = p2_faceoff)
				writeachievements \{achievement = dont_get_mad_get_even}
			elseif ($game_mode = p2_battle)
				if (($player1_status.final_blow_powerup) = 7)
					writeachievements \{achievement = soul_saver}
				endif
			endif
		elseif (<outcome> = lose)
			if ($game_mode = p2_pro_faceoff)
				writeachievements \{achievement = you_see_me_crying}
			elseif ($game_mode = p2_faceoff)
				writeachievements \{achievement = falling_off}
			endif
		endif
	endif
endscript

script achievements_what_it_takes 
	printf \{"Achievements_WHAT_IT_TAKES"}
	if ($is_network_game = 1)
		getglobaltags \{achievement_info}
		if (<ranked_matches_played> > 19)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_spaced 
	printf \{"Achievements_SPACED"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{false}
	endif
	if (($gstar_power_triggered = 0) && ($player1_status.star_power_amount >= 50.0))
		return \{true}
	endif
	return \{false}
endscript

script achievements_woman_of_the_world 
	printf \{"Achievements_WOMAN_OF_THE_WORLD"}
	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{false}
	endif
	if (($player1_status.character_id) = casey ||
			($player1_status.character_id) = judy ||
			($player1_status.character_id) = midori)
		return \{true}
	endif
	return \{false}
endscript

script achievements_dude_looks_like_a_lady 
	printf \{"Achievements_DUDE_LOOKS_LIKE_A_LADY"}
	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1 ||
			$is_network_game = 1)
		return \{false}
	endif
	if (($player1_status.character_id) = izzy)
		return \{true}
	endif
	return \{false}
endscript

script achievement_progression_difficulty_threshold 
	printf \{"Achievement_progression_difficulty_threshold"}
	if NOT gotparam \{difficulty}
		return \{false}
	endif
	switch <difficulty>
		case easy
		starting_index = 0
		case medium
		starting_index = 1
		case hard
		starting_index = 2
		case expert
		starting_index = 3
	endswitch
	getarraysize \{$difficulty_list}
	index = <starting_index>
	begin
	if progression_checkdiff diff = ($difficulty_list [<index>])
		return \{true}
	endif
	index = (<index> + 1)
	repeat (<array_size> - <starting_index>)
	return \{false}
endscript

script achievements_career_score_threshold 
	printf \{"Achievements_Career_Score_Threshold"}
	if NOT gotparam \{threshold}
		return \{false}
	endif
	get_progression_globals \{game_mode = p1_career}
	summation_career_score tier_global = <tier_global>
	if (<career_score> > <threshold>)
		return \{true}
	endif
	return \{false}
endscript

script achievements_unlocked_venue 
	printf \{"Achievements_Unlocked_Venue"}
	if NOT gotparam \{venue}
		return \{false}
	endif
	get_levelzonearray_size
	array_count = 0
	begin
	get_levelzonearray_checksum index = <array_count>
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
	getglobaltags <venue_checksum> params = {unlocked}
	if ((<venue> = <level_checksum>) && (<unlocked> = 1))
		return \{true}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	return \{false}
endscript

script achievements_aerosmith 
	printf \{"Achievements_AEROSMITH"}
	get_progression_globals \{game_mode = p1_career}
	if ($game_mode = p1_career)
		array_count = 0
		begin
		setlist_prefix = ($<tier_global>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		getglobaltags <tiername> param = aerosmith_unlocked
		if (<aerosmith_unlocked> = 1)
			return \{true}
		endif
		array_count = (<array_count> + 1)
		repeat ($<tier_global>.num_tiers)
	endif
	return \{false}
endscript

script achievements_gems 
	printf \{"Achievements_GEMS"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{false}
	endif
	if (($player1_status.sp_phrases_hit) = ($player1_status.sp_phrases_total))
		return \{true}
	endif
	return \{false}
endscript

script achievements_5starsong 
	printf \{"Achievements_5StarSong"}
	if (($player1_status.stars) >= 5)
		return \{true}
	endif
	return \{false}
endscript

script achievements_stack_career 
	printf \{"Achievements_Stack_Career"}
	if NOT gotparam \{difficulty}
		return
	endif
	switch <difficulty>
		case medium
		writeachievements \{achievement = make_it}
		case hard
		writeachievements \{achievement = make_it}
		writeachievements \{achievement = movin_out}
		case expert
		writeachievements \{achievement = make_it}
		writeachievements \{achievement = movin_out}
		writeachievements \{achievement = rock_in_a_hard_place}
	endswitch
endscript

script achievements_play_at_venue 
	printf \{"Achievements_Play_At_Venue"}
	if NOT gotparam \{venue}
		return \{false}
	endif
	if ($jailbait_achievement = 1 && <venue> = load_z_nipmuc)
		return \{true}
	endif
	if ($subway_achievement = 1 && <venue> = load_z_maxskc)
		return \{true}
	endif
	return \{false}
endscript

script achievements_career_cash_threshold 
	if NOT gotparam \{threshold}
		return \{false}
	endif
	getglobaltags \{achievement_info}
	if (<total_cash_in_career_mode> > <threshold>)
		return \{true}
	endif
	return \{false}
endscript
