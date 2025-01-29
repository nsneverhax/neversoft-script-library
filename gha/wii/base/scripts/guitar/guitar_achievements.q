gStar_Power_Triggered = 0
Achievement_Atoms = [
	{
		Name = make_it
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = easy
				}
			}
		]
	}
	{
		Name = movin_out
		Type = Scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = medium
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = medium
				}
			}
		]
	}
	{
		Name = rock_in_a_hard_place
		Type = Scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = hard
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = hard
				}
			}
		]
	}
	{
		Name = dream_on
		Type = Scr
		atom_script = achievements_stack_career
		atom_params = {
			difficulty = expert
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = expert
				}
			}
		]
	}
	{
		Name = aerosmith
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_aerosmith
			}
		]
	}
	{
		Name = jailbait
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_play_at_venue
				params = {
					venue = load_z_nipmuc
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = subway
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_play_at_venue
				params = {
					venue = load_z_maxskc
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = on_the_road_again
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_unlocked_venue
				params = {
					venue = load_z_fenway
				}
			}
		]
	}
	{
		Name = nine_lives
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_unlocked_venue
				params = {
					venue = load_z_nine_lives
				}
			}
		]
	}
	{
		Name = critical_mass
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_unlocked_venue
				params = {
					venue = load_z_jpplay
				}
			}
		]
	}
	{
		Name = march_19th_2001
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_unlocked_venue
				params = {
					venue = load_z_hof
				}
			}
		]
	}
	{
		Name = no_more_no_more
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 1
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 2
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 3
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 4
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 5
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				params = {
					Tier = 6
				}
			}
		]
	}
	{
		Name = same_old_song_and_dance
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = any
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				params = {
					game_mode = p1_career
					difficulty = any
					Bonus
				}
			}
		]
	}
	{
		Name = score_hero
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_score_hero
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = get_it_up
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_career_score_threshold
				params = {
					THRESHOLD = 1999999
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = eat_the_rich
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_career_cash_threshold
				params = {
					THRESHOLD = 49999
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = i_dont_want_to_miss_a_thing
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = achievements_100percent_performance
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = gems
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_gems
				permanent = FALSE
			}
		]
	}
	{
		Name = sick_as_a_dog
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievement_progression_difficulty_threshold
				params = {
					difficulty = medium
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = achievements_5starsong
				params = {
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = aint_that_a_b____h
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_100percent_performance
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = dude_looks_like_a_lady
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_dude_looks_like_a_lady
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = woman_of_the_world
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_woman_of_the_world
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = spaced
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_spaced
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = what_it_takes
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = achievements_what_it_takes
			}
		]
	}
	{
		Name = deuces_are_wild
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				params = {
					part = guitar
				}
			}
		]
	}
	{
		Name = love_me_two_times
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				params = {
					part = rhythm
				}
			}
		]
	}
]
Achievements_SongWonFlag = 0

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script Achievements_DummyScript 
endscript

script Achievements_SongWon 
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_cash_in_career_mode = (<total_cash_in_career_mode> + <additional_cash>)
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		SetGlobalTags achievement_info params = {total_cash_in_career_mode = <total_cash_in_career_mode>
			total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		if ($current_difficulty = easy)
			total_points_in_career_mode_easy = (<total_points_in_career_mode_easy> + $player1_status.score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_easy = <total_points_in_career_mode_easy>}
		endif
		if ($current_difficulty = medium)
			total_points_in_career_mode_medium = (<total_points_in_career_mode_medium> + $player1_status.score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_medium = <total_points_in_career_mode_medium>}
		endif
		if ($current_difficulty = hard)
			total_points_in_career_mode_hard = (<total_points_in_career_mode_hard> + $player1_status.score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_hard = <total_points_in_career_mode_hard>}
		endif
		if ($current_difficulty = expert)
			total_points_in_career_mode_expert = (<total_points_in_career_mode_expert> + $player1_status.score)
			SetGlobalTags achievement_info params = {total_points_in_career_mode_expert = <total_points_in_career_mode_expert>}
		endif
		Achievements_CheckCareerTotals
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($gStar_Power_Triggered >= 3)
			WriteAchievements \{achievement = when_i_needed_you}
		endif
		if ($game_mode = p2_quickplay)
			if (($player1_status.total_notes = $player1_status.notes_hit) && ($player2_status.total_notes = $player2_status.notes_hit))
				if NOT (($player1_status.total_notes = 0) && ($player2_status.total_notes = 0))
					WriteAchievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		elseif ($game_mode = p2_coop)
			if ($player1_status.total_notes = $player1_status.notes_hit)
				if NOT ($player1_status.total_notes = 0)
					WriteAchievements \{achievement = let_the_music_do_the_talking}
				endif
			endif
		endif
		if (($player1_status.character_id = bradw) && ($player2_status.character_id = tomh))
			WriteAchievements \{achievement = back_in_the_saddle}
		elseif (($player1_status.character_id = tomh) && ($player2_status.character_id = bradw))
			WriteAchievements \{achievement = back_in_the_saddle}
		endif
		if (($primary_controller) = ($player1_status.controller))
			player_status = player1_status
		else
			player_status = player2_status
		endif
		if ($<player_status>.part = rhythm)
			SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
		else
			SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formatText checksumName = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
		formatText checksumName = hendrix_checksum 'hendrix_achievement_%s' s = <difficulty_text_nl>
		GetGlobalTags <bandname_id> param = <hendrix_checksum>
		GetGlobalTags \{user_options
			params = lefty_flip_p1}
		if ((<...>.<hendrix_checksum>) = 2)
		elseif ((<...>.<hendrix_checksum>) = -1)
			AddParam Name = <hendrix_checksum> structure_name = new_params value = <lefty_flip_p1>
			SetGlobalTags <bandname_id> params = <new_params>
		elseif NOT ((<...>.<hendrix_checksum>) = <lefty_flip_p1>)
			AddParam Name = <hendrix_checksum> structure_name = new_params value = 2
			SetGlobalTags <bandname_id> params = <new_params>
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = kingsandqueens && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{achievement = ONLY_THE_L33T}
		endif
	endif
endscript

script achievements_100percent_performance 

	if ($is_attract_mode = 0 &&
			($game_mode = p1_career ||
				$game_mode = p1_quickplay))
		if ($player1_status.notes_hit = $player1_status.max_notes &&
				$player1_status.max_notes > 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_WhoNeedsThePower 

	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if ($is_network_game = 0 &&
			($game_mode = p2_pro_faceoff ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_battle))
		return \{FALSE}
	endif

	if ($player1_status.score > 199999 &&
			$gStar_Power_Triggered = 0 &&
			$current_song = cultofpersonality)
		return \{true}
	endif
	return \{FALSE}
endscript

script Achievements_TONE_DEAF 

	if ($game_mode = p1_quickplay ||
			($game_mode = p1_career && $boss_battle = 0))
		GetGlobalTags \{user_options}
		if ($current_difficulty = expert)
			if (<guitar_volume> = 0)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_STAR_MANIA 

	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if NOT ($game_mode = p1_quickplay)
		return \{FALSE}
	endif

	if ($gStar_Power_Triggered > 2)
		if ($current_song = kingsandqueens && $current_difficulty = expert)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LIFE_OF_THE_PARTY 

	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SEARCH_AND_DESTROY 

	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BUTTON_MASHER 

	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BIG_OL_PILE_OF_WINS 

	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_ENLIGHTENED_GUITARIST 
	array_entry = 0
	get_songlist_size
	num_gold_star_games = 0
	begin
	get_songlist_checksum index = <array_entry>
	get_difficulty_text_nl \{difficulty = expert}
	get_song_prefix song = <song_checksum>
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	if (<achievement_gold_star> = 1)
		num_gold_star_games = (<num_gold_star_games> + 1)
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (<num_gold_star_games> > 19)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievement_toys_in_the_attic 

	guitar_array = ($Bonus_Guitars)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Basses)
	GetArraySize <guitar_array>
	index = 0
	begin
	guitar_id = (<guitar_array> [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script achievement_big_ten_inch_record 
	GetArraySize ($Bonus_Songs_Info)
	index = 0
	begin
	GetGlobalTags ($Bonus_Songs_Info [<index>].item)
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script achievement_kings_and_queens 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script achievement_walk_this_way 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if ((<unlocked> = 1) && (<character_array> [<index>].info_name = dmc))
		return \{true}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script Achievement_BURNING_A_HOLE_IN_YOUR_POCKET 
	GetArraySize ($Bonus_videos)
	index = 0
	begin
	video_checksum = ($Bonus_videos [<index>].id)
	GetGlobalTags <video_checksum>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if NOT achievement_big_ten_inch_record
		return \{FALSE}
	endif
	if NOT achievement_toys_in_the_attic
		return \{FALSE}
	endif
	if NOT achievement_kings_and_queens
		return \{FALSE}
	endif
	character_array = ($Bonus_Outfits)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	character_array = ($Bonus_Styles)
	GetArraySize <character_array>
	index = 0
	begin
	character_id = (<character_array> [<index>].id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script Achievement_CheckBuyAchievements 
	if achievement_toys_in_the_attic
		WriteAchievements \{achievement = toys_in_the_attic}
	endif
	if achievement_big_ten_inch_record
		WriteAchievements \{achievement = big_ten_inch_record}
	endif
	if achievement_kings_and_queens
		WriteAchievements \{achievement = kings_and_queens}
	endif
	if achievement_walk_this_way
		WriteAchievements \{achievement = walk_this_way}
	endif
	if Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		WriteAchievements \{achievement = BURNING_A_HOLE_IN_YOUR_POCKET}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{achievement = WELCOME_TO_HELL}
	endif
endscript

script Achievements_IsGameFinished 

	if NOT GotParam \{difficulty}
		ScriptAssert \{'No difficulty'}
	endif
	if NOT GotParam \{game_mode}
		ScriptAssert \{'No game mode'}
	endif
	GetArraySize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	if GotParam \{Bonus}
		get_progression_globals game_mode = <game_mode> Bonus
	else
		get_progression_globals game_mode = <game_mode>
	endif
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
	GetGlobalTags <gametype_checksum>
	if (<difficulty> = any)
		if (<complete> = 1)
			return \{true}
		endif
	endif
	if (<difficulty> = all)
		if (<complete> = 0)
			return \{FALSE}
		endif
	endif
	if (<difficulty> = ($difficulty_list [<array_count>]))
		if (<complete> = 1)
			return \{true}
		else
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if (<difficulty> = any)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script achievements_score_hero 

	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if (($player1_status.score > 325000) && ($current_song = trainkeptarollin))
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_A_MILL 

	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 500000)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_MILL 

	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 750000)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_CheckCareerTotals 
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > 350000)
		WriteAchievements \{achievement = NEVER_GONNA_SPEND_IT_ALL}
	endif
	if (<total_notes_in_career_mode> > 250000)
		WriteAchievements \{achievement = NOTES_FROM_HELL}
	endif
	if (<total_points_in_career_mode> > 100000000)
		WriteAchievements \{achievement = BILLION_GULP}
	endif
endscript

script Achievements_CoopBeatenPart 

	get_progression_globals \{game_mode = p2_quickplay}
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	GetGlobalTags ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if (<part> = rhythm)
		if (<beaten_coop_as_rhythm> = 0)
			return \{FALSE}
		endif
	else
		if (<beaten_coop_as_lead> = 0)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{true}
endscript

script Achievements_WELCOME_TO_HELL 
	GetGlobalTags \{achievement_info
		param = ranked_matches_played}
	if (<ranked_matches_played> < 100)
		return \{FALSE}
	endif
	if NOT Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		return \{FALSE}
	endif
	if NOT Achievements_IsGameFinished \{game_mode = p1_career
			difficulty = all}
		return \{FALSE}
	endif
	return \{true}
endscript

script Achievements_HENDRIX_REBORN 
	GetGlobalTags \{achievement_info}
	if (<hendrix_achievement_lefty_off> = 1 &&
			<hendrix_achievement_lefty_on> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script Achievements_WHAMMY_MANIA 
	if ($current_song = numberofthebeast)
		if ($game_mode = p1_career || $game_mode = p1_quickplay)
			if ($whammy_mania_achievement_invalidated = 0)
				return \{true}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SongFailed 
	completion = 0
	get_song_end_time song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	CastToInteger \{completion}
	if NOT ($current_song = bossjoe)
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		if ($game_mode = p2_coop || $game_mode = p2_quickplay)
			GetGlobalTags <songname> param = coop_failedtimes
			coop_failedtimes = (<coop_failedtimes> + 1)
			SetGlobalTags <songname> params = {coop_failedtimes = <coop_failedtimes>}
		else
			GetGlobalTags <songname> param = failedtimes
			failedtimes = (<failedtimes> + 1)
			SetGlobalTags <songname> params = {failedtimes = <failedtimes>}
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		GetArraySize \{$gh3_songlist}
		total_songs = <array_Size>
		GetArraySize \{$difficulty_list}
		total_diffs = <array_Size>
		total_song_failures = 0
		song_count = 0
		begin
		diffs_count = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<diffs_count>])
		get_song_prefix song = ($gh3_songlist [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> param = coop_failedtimes
		total_song_failures = (<total_song_failures> + <coop_failedtimes>)
		if (<total_song_failures> > 4)
			WriteAchievements \{achievement = nobodys_fault}
			break
		endif
		diffs_count = (<diffs_count> + 1)
		repeat <total_diffs>
		song_count = (<song_count> + 1)
		repeat <total_songs>
		if (<completion> > 94)
			WriteAchievements \{achievement = fallen_angels}
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		GetArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		array_count = (<array_count> + 1)
		repeat <array_Size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{achievement = night_in_the_ruts}
		endif
	endif
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.notes_hit)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.score)
		SetGlobalTags achievement_info params = {total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		Achievements_CheckCareerTotals
	endif
endscript

script achievements_net_game_completed 
	if NOT GotParam \{outcome}
		return
	endif
	if ($is_network_game = 1 && (NetSessionFunc func = isranked Obj = match))
		if (<outcome> = win)
			retrieve_player_net_id \{Player = 2}
			CheckAndWriteMakerAchievement player_xuid = <net_id>
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{achievement = my_fist_your_face}
				if ((($player1_status.score) - ($player2_status.score)) > 9999)
					WriteAchievements \{achievement = walkin_the_dog}
				endif
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{achievement = dont_get_mad_get_even}
			elseif ($game_mode = p2_battle)
				if (($player1_status.final_blow_powerup) = 7)
					WriteAchievements \{achievement = soul_saver}
				endif
			endif
		elseif (<outcome> = lose)
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{achievement = you_see_me_crying}
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{achievement = falling_off}
			endif
		endif
	endif
endscript

script achievements_what_it_takes 

	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_played> > 19)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script achievements_spaced 

	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($gStar_Power_Triggered = 0) && ($player1_status.star_power_amount >= 50.0))
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_woman_of_the_world 

	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = Casey ||
			($player1_status.character_id) = Judy ||
			($player1_status.character_id) = Midori)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_dude_looks_like_a_lady 

	is_aerosmith_song song = ($current_song)
	is_joe_perry_song song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1 ||
			$is_network_game = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = Izzy)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievement_progression_difficulty_threshold 

	if NOT GotParam \{difficulty}
		return \{FALSE}
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
	GetArraySize \{$difficulty_list}
	index = <starting_index>
	begin
	if Progression_CheckDiff diff = ($difficulty_list [<index>])
		return \{true}
	endif
	index = (<index> + 1)
	repeat (<array_Size> - <starting_index>)
	return \{FALSE}
endscript

script achievements_career_score_threshold 

	if NOT GotParam \{THRESHOLD}
		return \{FALSE}
	endif
	get_progression_globals \{game_mode = p1_career}
	summation_career_score tier_global = <tier_global>
	if (<career_score> > <THRESHOLD>)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_unlocked_venue 

	if NOT GotParam \{venue}
		return \{FALSE}
	endif
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum> params = {unlocked}
	if ((<venue> = <level_checksum>) && (<unlocked> = 1))
		return \{true}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script achievements_aerosmith 

	get_progression_globals \{game_mode = p1_career}
	if ($game_mode = p1_career)
		array_count = 0
		begin
		setlist_prefix = ($<tier_global>.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
		GetGlobalTags <tiername> param = aerosmith_unlocked
		if (<aerosmith_unlocked> = 1)
			return \{true}
		endif
		array_count = (<array_count> + 1)
		repeat ($<tier_global>.num_tiers)
	endif
	return \{FALSE}
endscript

script achievements_gems 

	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.sp_phrases_hit) = ($player1_status.sp_phrases_total))
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_5starsong 

	if (($player1_status.stars) >= 5)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_stack_career 

	if NOT GotParam \{difficulty}
		return
	endif
	switch <difficulty>
		case medium
		WriteAchievements \{achievement = make_it}
		case hard
		WriteAchievements \{achievement = make_it}
		WriteAchievements \{achievement = movin_out}
		case expert
		WriteAchievements \{achievement = make_it}
		WriteAchievements \{achievement = movin_out}
		WriteAchievements \{achievement = rock_in_a_hard_place}
	endswitch
endscript

script achievements_play_at_venue 

	if NOT GotParam \{venue}
		return \{FALSE}
	endif
	if ($current_level = <venue>)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_career_cash_threshold 
	if NOT GotParam \{THRESHOLD}
		return \{FALSE}
	endif
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > <THRESHOLD>)
		return \{true}
	endif
	return \{FALSE}
endscript
