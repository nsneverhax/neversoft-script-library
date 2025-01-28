gstar_power_triggered = 0
achievement_atoms = [
	{
		name = perfectionist
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_perfectionist
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = who_needs_the_power
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_whoneedsthepower
			}
		]
	}
	{
		name = tone_deaf
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_tone_deaf
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = star_mania
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_star_mania
			}
		]
	}
	{
		name = life_of_the_party
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_life_of_the_party
			}
		]
	}
	{
		name = search_and_destroy
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_search_and_destroy
			}
		]
	}
	{
		name = button_masher
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_button_masher
			}
		]
	}
	{
		name = big_ol_pile_of_wins
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_big_ol_pile_of_wins
			}
		]
	}
	{
		name = half_mill_club
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_half_mill_club
			}
		]
	}
	{
		name = millionaire_club
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_millionaire_club
			}
		]
	}
	{
		name = higher_than_most
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_higher_than_most
			}
		]
	}
	{
		name = leaders_of_the_pack
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_leaders_of_the_pack
			}
			{
				type = scr
				scr = achievements_issongwon
			}
		]
	}
	{
		name = enlightened_guitarist
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_enlightened_guitarist
			}
		]
	}
	{
		name = thats_what_friends_are_for
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
					game_mode = p2_career
					difficulty = any
				}
			}
		]
	}
	{
		name = easy_rider
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
		name = medium_rare
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
					difficulty = medium
				}
			}
		]
	}
	{
		name = always_hard
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
					difficulty = hard
				}
			}
		]
	}
	{
		name = right_hand_of_god
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
					difficulty = expert
				}
			}
		]
	}
	{
		name = solo_career
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
					difficulty = all
				}
			}
		]
	}
	{
		name = axe_grinder
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = easy
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = rock_guru
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = medium
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = shredder
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = hard
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = guitar_hero
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = expert
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = easy_duo
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = easy
					mode = p2_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = medium_duo
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = medium
					mode = p2_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = hard_duo
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = hard
					mode = p2_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = living_legends
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = expert
					mode = p2_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = smokin_aces
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_smokin_aces
			}
		]
	}
	{
		name = first_big_score
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_first_big_score
			}
		]
	}
	{
		name = half_a_mill
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_half_a_mill
			}
		]
	}
	{
		name = first_mill
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_first_mill
			}
		]
	}
	{
		name = guitar_wizard
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
		name = back_up_hero
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
	{
		name = welcome_to_hell
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_welcome_to_hell
			}
		]
	}
	{
		name = hendrix_reborn
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_hendrix_reborn
			}
		]
	}
	{
		name = whammy_mania
		type = scr
		atom_script = achievements_dummyscript
		atom_params = {
			achievement
		}
		depends_on = [
			{
				type = scr
				scr = achievements_whammy_mania
			}
			{
				type = scr
				scr = achievements_issongwon
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
	if ($game_mode = p2_career)
		if ($player1_status.controller = ($primary_controller))
			if ($player1_status.part = rhythm)
				setglobaltags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				setglobaltags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
		elseif ($player2_status.controller = ($primary_controller))
			if ($player2_status.part = rhythm)
				setglobaltags ($current_song) params = {beaten_coop_as_rhythm = 1}
			else
				setglobaltags ($current_song) params = {beaten_coop_as_lead = 1}
			endif
		endif
	endif
	if ($game_mode = p2_coop)
		if ($player1_status.part = rhythm)
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
		if ($current_song = thrufireandflames && $current_difficulty = expert && $boss_battle = 0 && $end_credits = 0)
			writeachievements \{achievement = only_the_l33t}
		endif
	endif
endscript

script achievements_perfectionist 
	printf \{"Achievements_PERFECTIONIST"}
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
	if ($game_mode = p2_coop ||
			$game_mode = p2_career)
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
		if ($current_song = thrufireandflames && $current_difficulty = expert)
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

script achievements_half_mill_club 
	printf \{"Achievements_HALF_MILL_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 499999)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_millionaire_club 
	printf \{"Achievements_MILLIONAIRE_CLUB"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 999999)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_higher_than_most 
	printf \{"Achievements_HIGHER_THAN_MOST"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if (($player1_status.score + $player2_status.score) > 699999)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_leaders_of_the_pack 
	printf \{"Achievements_LEADERS_OF_THE_PACK"}
	if ($game_mode = p2_career || $game_mode = p2_coop)
		if ($player1_status.total_notes = $player1_status.notes_hit)
			if NOT ($player1_status.total_notes = 0)
				return \{true}
			endif
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
	formattext checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
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

script achievement_axe_collector 
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
	guitar_array = ($secret_guitars)
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
	guitar_array = ($secret_basses)
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
	guitar_array = ($bonus_guitar_finishes)
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
	guitar_array = ($bonus_bass_finishes)
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

script achievement_track_master 
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

script achievement_got_em_all 
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
	if NOT achievement_track_master
		return \{false}
	endif
	if NOT achievement_axe_collector
		return \{false}
	endif
	if NOT achievement_got_em_all
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
	if achievement_axe_collector
		writeachievements \{achievement = axe_collector}
	endif
	if achievement_track_master
		writeachievements \{achievement = track_master}
	endif
	if achievement_got_em_all
		writeachievements \{achievement = got_em_all}
	endif
	if achievement_burning_a_hole_in_your_pocket
		writeachievements \{achievement = burning_a_hole_in_your_pocket}
	endif
	if achievements_welcome_to_hell
		writeachievements \{achievement = welcome_to_hell}
	endif
endscript

script achievements_isgamefinished 
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
	get_progression_globals game_mode = <game_mode>
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

script achievements_smokin_aces 
	printf \{"Achievements_SMOKIN_ACES"}
	if ($game_mode = p2_career)
		if ($player1_status.score > 1000000)
			return \{true}
		endif
	endif
	return \{false}
endscript

script achievements_first_big_score 
	printf \{"Achievements_FIRST_BIG_SCORE"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.score > 250000)
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
		if ($player1_status.score > 1000000)
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
	get_progression_globals \{game_mode = p2_coop}
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
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if NOT ($boss_battle = 1)
			if (<completion> > 89)
				writeachievements \{achievement = almost_got_it}
			endif
		endif
		get_difficulty_text_nl difficulty = ($current_difficulty)
		get_song_prefix song = ($current_song)
		formattext checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		getglobaltags <songname> param = failedtimes
		failedtimes = (<failedtimes> + 1)
		setglobaltags <songname> params = {failedtimes = <failedtimes>}
		getarraysize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl difficulty = ($difficulty_list [<array_count>])
		get_song_prefix song = ($current_song)
		formattext checksumname = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
		getglobaltags <songname> param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		printstruct <...>
		array_count = (<array_count> + 1)
		repeat <array_size>
		if (<total_failedtimes> > 9)
			writeachievements \{achievement = blowin_it}
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
