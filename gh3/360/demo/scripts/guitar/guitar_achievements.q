gStar_Power_Triggered = 0
Achievement_Atoms = [
	{
		Name = PERFECTIONIST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_PERFECTIONIST
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = WHO_NEEDS_THE_POWER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WhoNeedsThePower
			}
		]
	}
	{
		Name = TONE_DEAF
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_TONE_DEAF
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = STAR_MANIA
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_STAR_MANIA
			}
		]
	}
	{
		Name = LIFE_OF_THE_PARTY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_LIFE_OF_THE_PARTY
			}
		]
	}
	{
		Name = SEARCH_AND_DESTROY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SEARCH_AND_DESTROY
			}
		]
	}
	{
		Name = BUTTON_MASHER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_BUTTON_MASHER
			}
		]
	}
	{
		Name = BIG_OL_PILE_OF_WINS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_BIG_OL_PILE_OF_WINS
			}
		]
	}
	{
		Name = 0x4f06f909
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = 0x9f0b7e04
			}
		]
	}
	{
		Name = MILLIONAIRE_CLUB
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_MILLIONAIRE_CLUB
			}
		]
	}
	{
		Name = HIGHER_THAN_MOST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HIGHER_THAN_MOST
			}
		]
	}
	{
		Name = LEADERS_OF_THE_PACK
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_LEADERS_OF_THE_PACK
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = ENLIGHTENED_GUITARIST
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_ENLIGHTENED_GUITARIST
			}
		]
	}
	{
		Name = THATS_WHAT_FRIENDS_ARE_FOR
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
					game_mode = p2_career
					difficulty = any
				}
			}
		]
	}
	{
		Name = EASY_RIDER
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
		Name = MEDIUM_RARE
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
					difficulty = medium
				}
			}
		]
	}
	{
		Name = ALWAYS_HARD
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
					difficulty = hard
				}
			}
		]
	}
	{
		Name = RIGHT_HAND_OF_GOD
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
					difficulty = expert
				}
			}
		]
	}
	{
		Name = SOLO_CAREER
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
					difficulty = all
				}
			}
		]
	}
	{
		Name = AXE_GRINDER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = ROCK_GURU
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = SHREDDER
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = GUITAR_HERO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = EASY_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = MEDIUM_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = HARD_DUO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = LIVING_LEGENDS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = SMOKIN_ACES
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SMOKIN_ACES
			}
		]
	}
	{
		Name = FIRST_BIG_SCORE
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_FIRST_BIG_SCORE
			}
		]
	}
	{
		Name = HALF_A_MILL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HALF_A_MILL
			}
		]
	}
	{
		Name = FIRST_MILL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_FIRST_MILL
			}
		]
	}
	{
		Name = GUITAR_WIZARD
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
		Name = BACK_UP_HERO
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
	{
		Name = WELCOME_TO_HELL
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WELCOME_TO_HELL
			}
		]
	}
	{
		Name = HENDRIX_REBORN
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_HENDRIX_REBORN
			}
		]
	}
	{
		Name = WHAMMY_MANIA
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WHAMMY_MANIA
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
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
	if ($game_mode = p2_career)
		if ($player1_status.controller = ($primary_controller))
			if ($player1_status.part = rhythm)
				SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
		elseif ($player2_status.controller = ($primary_controller))
			if ($player2_status.part = rhythm)
				SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
		endif
	endif
	if ($game_mode = p2_coop)
		if ($player1_status.part = rhythm)
			SetGlobalTags ($current_song) params = {beaten_coop_as_rhythm = 1}
		else
			SetGlobalTags ($current_song) params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		formatText checksumName = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
		GetGlobalTags <bandname_id> param = 0x44e7c9db
		GetGlobalTags \{user_options
			params = lefty_flip_p1}
		if (<0x44e7c9db> = 2)
		elseif (<0x44e7c9db> = -1)
			SetGlobalTags <bandname_id> params = {0x44e7c9db = <lefty_flip_p1>}
		elseif NOT (<0x44e7c9db> = <lefty_flip_p1>)
			SetGlobalTags <bandname_id> params = {0x44e7c9db = 2}
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = thrufireandflames && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{achievement = ONLY_THE_L33T}
		endif
	endif
endscript

script Achievements_PERFECTIONIST 
	printf \{"Achievements_PERFECTIONIST"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$game_mode = p2_battle)
		return \{FALSE}
	endif
	if ($player1_status.notes_hit = $player1_status.max_notes &&
			$player1_status.max_notes > 0)
		return \{true}
	endif
	if ($game_mode = p1_career ||
			$game_mode = p1_quickplay ||
			$boss_battle = 1 ||
			$is_network_game = 1)
		return \{FALSE}
	endif
	if ($player2_status.notes_hit = $player2_status.max_notes &&
			$player2_status.max_notes > 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script Achievements_WhoNeedsThePower 
	printf \{"Achievements_WhoNeedsThePower"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	printf \{"star power trigged  = %d"
		d = $gStar_Power_Triggered}
	if ($player1_status.score > 199999 &&
			$gStar_Power_Triggered = 0 &&
			$current_song = cultofpersonality)
		return \{true}
	endif
	return \{FALSE}
endscript

script Achievements_TONE_DEAF 
	printf \{"Achievements_TONE_DEAF"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	GetGlobalTags \{user_options}
	if ($current_difficulty = expert)
		if (<guitar_volume> = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_STAR_MANIA 
	printf \{"Achievements_STAR_MANIA"}
	if ($game_mode = training ||
			$game_mode = practice ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	printf \{"star power trigged  = %d"
		d = $gStar_Power_Triggered}
	if ($gStar_Power_Triggered > 2)
		if ($current_song = thrufireandflames && $current_difficulty = expert)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LIFE_OF_THE_PARTY 
	printf \{"Achievements_LIFE_OF_THE_PARTY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SEARCH_AND_DESTROY 
	printf \{"Achievements_SEARCH_AND_DESTROY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BUTTON_MASHER 
	printf \{"Achievements_BUTTON_MASHER"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BIG_OL_PILE_OF_WINS 
	printf \{"Achievements_BIG_OL_PILE_OF_WINS"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script 0x9f0b7e04 
	printf \{"Achievements_HALF_A_MILL_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.score > 499999)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_MILLIONAIRE_CLUB 
	printf \{"Achievements_MILLIONAIRE_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.score > 999999)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HIGHER_THAN_MOST 
	printf \{"Achievements_HIGHER_THAN_MOST"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.score > 699999)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LEADERS_OF_THE_PACK 
	printf \{"Achievements_LEADERS_OF_THE_PACK"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.total_notes = $player1_status.notes_hit)
			if NOT ($player1_status.total_notes = 0)
				return \{true}
			endif
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
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
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

script Achievement_AXE_COLLECTOR 
	guitar_array = ($Bonus_Guitars)
	store_add_secret_guitars_and_basses guitar_array = (<guitar_array>)
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

script Achievement_TRACK_MASTER 
	GetArraySize ($Bonus_Songs_Info)
	index = 0
	begin
	formatText checksumName = bonus_song_checksum '%p_song%i_tier%s' p = 'bonus' i = (<index> + 1) s = 1
	GetGlobalTags <bonus_song_checksum>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	return \{true}
endscript

script Achievement_GOT_EM_ALL 
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

script 0x281a5e9d 
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
	if NOT Achievement_TRACK_MASTER
		return \{FALSE}
	endif
	if NOT Achievement_AXE_COLLECTOR
		return \{FALSE}
	endif
	guitar_array = ($Bonus_Guitar_Finishes)
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
	if NOT Achievement_GOT_EM_ALL
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
	if Achievement_AXE_COLLECTOR
		WriteAchievements \{achievement = AXE_COLLECTOR}
	endif
	if Achievement_TRACK_MASTER
		WriteAchievements \{achievement = TRACK_MASTER}
	endif
	if Achievement_GOT_EM_ALL
		WriteAchievements \{achievement = GOT_EM_ALL}
	endif
	if 0x281a5e9d
		WriteAchievements \{achievement = 0x8cab62c0}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{achievement = WELCOME_TO_HELL}
	endif
endscript

script Achievements_IsGameFinished 
	if NOT GotParam \{difficulty}
		ScriptAssert \{"No difficulty"}
	endif
	if NOT GotParam \{game_mode}
		ScriptAssert \{"No game mode"}
	endif
	GetArraySize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
	get_progression_globals game_mode = <game_mode>
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

script Achievements_SMOKIN_ACES 
	printf \{"Achievements_SMOKIN_ACES"}
	if ($game_mode = p2_career)
		if ($player1_status.score > 1000000)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_BIG_SCORE 
	printf \{"Achievements_FIRST_BIG_SCORE"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 250000)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_A_MILL 
	printf \{"Achievements_HALF_A_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 500000)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_MILL 
	printf \{"Achievements_FIRST_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 1000000)
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
	if (<total_points_in_career_mode> > 1000000000)
		WriteAchievements \{achievement = BILLION_GULP}
	endif
endscript

script Achievements_CoopBeatenPart 
	get_progression_globals \{game_mode = p2_coop}
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
	if NOT 0x281a5e9d
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
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if NOT ($boss_battle = 1)
			if (<completion> > 89)
				WriteAchievements \{achievement = ALMOST_GOT_IT}
			endif
		endif
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		failedtimes = (<failedtimes> + 1)
		SetGlobalTags <songname> params = {failedtimes = <failedtimes>}
		GetArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		GetGlobalTags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		printstruct <...>
		array_count = (<array_count> + 1)
		repeat <array_Size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{achievement = BLOWIN_IT}
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
