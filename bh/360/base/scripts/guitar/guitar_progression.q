
script reset_progression_atoms \{force_update = 1
		async = 0}
	RequireParams \{[
			savegame
		]
		all}
	conditional_async_wait async = <async> text = qs(0x8c29435c)
	LockGlobalTags \{push_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xa704109f)
	create_player_progression_atoms savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0xbe1f21de)
	if NOT GotParam \{completed_atoms_array}
		printf \{'setup_progression_atoms Error: No atoms were loaded or created'}
		return
	endif
	conditional_async_wait async = <async> text = qs(0xf15eb719)
	RegisterAtoms savegame = <savegame> <completed_atoms_array>
	conditional_async_wait async = <async> text = qs(0xe8458658)
	if (<force_update> = 1)
		UpdateAtoms savegame = <savegame>
	endif
	conditional_async_wait async = <async> text = qs(0xc368d59b)
	LockGlobalTags \{pop_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xda73e4da)
endscript

script update_active_players_atoms 
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		get_savegame_from_player player = <player>
		UpdateAtoms savegame = <savegame>
		GetNextPlayer local player = <player>
		repeat <num_players>
	endif
endscript

script create_player_progression_atoms \{async = 0}
	if NOT GotParam \{savegame}
		ScriptAssert \{'create_player_progression_atoms Error: No savegame defined'}
	endif
	conditional_async_wait async = <async> text = qs(0x1780bad2)
	progression_create_venue_atoms_array savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0x3cade911)
	progression_create_gigs_atoms_array savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0x25b6d850)
	progression_create_rewards_atoms_array savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0x6af74e97)
	return completed_atoms_array = (<venue_atoms> + <gig_atoms> + <reward_atoms>)
endscript

script load_player_progression_atoms 
endscript

script progression_create_venue_atoms_array \{async = 0}
	if NOT GotParam \{savegame}
		ScriptAssert \{qs(0x9243e736)}
		return
	endif
	i = 1
	index = 0
	GetArraySize \{$venue_progression}
	CreateLocalArray name = atoms type = struct size = <array_size>
	begin
	FormatText checksumname = name 'venue_%a_unlock' a = <i> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		type = Scr
		Scr = progression_career_check_venue_unlock
		params = {($venue_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	<struct_to_pass> = ($venue_progression [<index>])
	<venue_to_check> = (<struct_to_pass>.venue_to_unlock)
	if NOT StructureContains structure = ($LevelZones) <venue_to_check>
		<struct_to_pass> = {<struct_to_pass> venue_to_unlock = load_Z_EasterIsland}
	endif
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_career_do_venue_unlock
		atom_params = {<struct_to_pass> savegame = <savegame>}
		depends_on = <depends_on>
	}
	SetArrayElement arrayName = atoms index = <index> newValue = <atom>
	index = (<index> + 1)
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0xb4fceb4e)
	repeat <array_size>
	return venue_atoms = <atoms>
endscript

script progression_career_check_venue_unlock 
	get_current_progression_stars savegame = <savegame>
	if (<total_stars> >= <stars_required>)
		return \{true}
	endif
	return \{false}
endscript

script progression_career_do_venue_unlock 
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<venue_to_unlock>.name)
	SetGlobalTags <venue_checksum> params = {unlocked = 1} savegame = <savegame> packtype = venuetags Progression = true
	venue_struct = {
		reward_type = venue
		venue_checksum = <venue_to_unlock>
	}
	progression_add_just_unlocked_item reward_struct = <venue_struct> player_savegame = <savegame>
endscript

script progression_get_stars_to_next_venue 
	GetArraySize \{$venue_progression}
	lowest_diff = 500000
	next_venue = None
	i = 0
	begin
	cur_venue_atom = ($venue_progression [<i>])
	get_current_progression_stars
	if ((<cur_venue_atom>.stars_required) > <total_stars>)
		diff = ((<cur_venue_atom>.stars_required) - <total_stars>)
		if (<diff> < <lowest_diff>)
			lowest_diff = <diff>
			next_venue = (<cur_venue_atom>.venue_to_unlock)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<next_venue> = None)
		<lowest_diff> = 0
	endif
	return stars_to_next = <lowest_diff> next_venue = <next_venue>
endscript

script progression_get_venue_stars_total 
	RequireParams \{[
			player
			venue
		]
		all}
	if NOT GMan_GoalIsActive \{goal = career}
		ScriptAssert qs(0xe5b9f37c) a = <venue>
		return
	endif
	GMan_ChallengeManagerFunc goal = career tool = challenges func = get_challenges_for_venue params = {venue = <venue>}
	if NOT GotParam \{challenge_list}
		ScriptAssert qs(0x11c64938) a = <venue>
		return
	endif
	GetArraySize <challenge_list>
	if (<array_size> = 0)
		return \{venue_max_stars = 0}
	endif
	i = 0
	stars_total = 0
	available_total = 0
	begin
	gig = (<challenge_list> [<i>])
	progression_get_gig_stars_total gig_name = <gig> player = <player>
	stars_total = (<stars_total> + <gig_max_stars>)
	if (<unlocked> = 1)
		available_total = (<available_total> + <gig_max_stars>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return venue_max_stars = <stars_total> venue_available_max_stars = <available_total>
endscript

script progression_create_gigs_atoms_array \{async = 0}
	i = 1
	index = 0
	GetArraySize \{$gig_progression}
	CreateLocalArray name = atoms type = struct size = <array_size>
	begin
	FormatText checksumname = name 'gig_%a_unlock' a = <i> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		type = Scr
		Scr = progression_career_check_gig_unlock
		params = {($gig_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_career_do_gig_unlock
		atom_params = {($gig_progression [<index>]) savegame = <savegame> name = <name>}
		depends_on = <depends_on>
	}
	SetArrayElement arrayName = atoms index = <index> newValue = <atom>
	index = (<index> + 1)
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0x058ed75c)
	repeat <array_size>
	return gig_atoms = <atoms>
endscript

script progression_career_check_gig_unlock 
	if GotParam \{unlocked_with_venue}
		return \{true}
	elseif GotParam \{requires_completed_gig}
		GetGlobalTags <requires_completed_gig> param = completed savegame = <savegame>
		if (<completed> = 1)
			return \{true}
		endif
	elseif GotParam \{requires_completed_gig_list}
		GetArraySize <requires_completed_gig_list>
		i = 0
		begin
		GetGlobalTags (<requires_completed_gig_list> [<i>]) param = completed savegame = <savegame>
		if (<completed> = 0)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
		return \{true}
	elseif GotParam \{requires_venue_stars}
		if StructureContains structure = ($LevelZones) <current_venue>
			FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<current_venue>.name)
			GetGlobalTags <venue_checksum> param = venue_stars savegame = <savegame>
			if (<venue_stars> >= <requires_venue_stars>)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script progression_career_do_gig_unlock 
	SetGlobalTags savegame = <savegame> <gig_to_unlock> params = {unlocked = 1} packtype = gigtags Progression = true
	if (<current_venue> = load_Z_Subway)
		if GotParam \{unlocked_with_venue}
			SetGlobalTags savegame = <savegame> <gig_to_unlock> params = {has_been_played = 1} packtype = gigtags Progression = true
		endif
	endif
	gig_struct = {
		reward_type = gig
		gig_checksum = <gig_to_unlock>
	}
	progression_add_just_unlocked_item reward_struct = <gig_struct> player_savegame = <savegame>
endscript

script progression_get_gig_song_stars_possible 
	RequireParams \{[
			gig_name
		]
		all}
	song_stars = 0
	if StructureContains structure = ($<gig_name>) predefined_playlist
		playlist = ($<gig_name>.predefined_playlist)
		GetArraySize <playlist>
		song_stars = (<array_size> * ($max_song_stars))
	else
		song_stars = (($<gig_name>.num_songs) * ($max_song_stars))
	endif
	return song_stars = <song_stars>
endscript

script progression_get_gig_song_stars_earned 
	RequireParams \{[
			gig_name
			player
		]
		all}
	stars_earned = 0
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	stars_earned = (<song1_stars_earned>)
	progression_get_gig_star_rewards gig_name = <gig_name>
	if (<completed_gold> = 1)
		stars_earned = (<stars_earned> + (<gig_star_rewards>.gold))
	endif
	if (<completed_platinum> = 1)
		stars_earned = (<stars_earned> + (<gig_star_rewards>.platinum))
	endif
	if (<completed_diamond> = 1)
		stars_earned = (<stars_earned> + (<gig_star_rewards>.diamond))
	endif
	return gig_stars_earned = <stars_earned>
endscript

script progression_get_gig_challenge_stars_earned 
	RequireParams \{[
			gig_name
			player
		]
		all}
	highest_completed_difficulty = 0
	challenge_stars = 0
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	progression_get_gig_star_rewards gig_name = <gig_name>
	if (<completed> = 1)
		highest_completed_difficulty = 1
	endif
	if (<completed_gold> = 1)
		highest_completed_difficulty = 2
		challenge_stars = (<challenge_stars> + (<gig_star_rewards>.gold))
	endif
	if (<completed_platinum> = 1)
		highest_completed_difficulty = 3
		challenge_stars = (<challenge_stars> + (<gig_star_rewards>.platinum))
	endif
	if (<completed_diamond> = 1)
		highest_completed_difficulty = 4
		challenge_stars = (<challenge_stars> + (<gig_star_rewards>.diamond))
	endif
	return highest_earned = <highest_completed_difficulty> challenge_stars = <challenge_stars>
endscript

script progression_get_gig_stars_total 
	RequireParams \{[
			gig_name
		]
		all}
	stars_max = 0
	progression_get_gig_song_stars_possible gig_name = <gig_name>
	stars_max = (<stars_max> + <song_stars>)
	progression_get_gig_star_rewards gig_name = <gig_name>
	challenge_stars_max = (<gig_star_rewards>.gold)
	challenge_stars_max = (<challenge_stars_max> + (<gig_star_rewards>.platinum))
	challenge_stars_max = (<challenge_stars_max> + (<gig_star_rewards>.diamond))
	unlocked = 0
	if GotParam \{player}
		GetPlayerInfo <player> controller
		get_savegame_from_controller controller = <controller>
		GetGlobalTags <gig_name> savegame = <savegame> param = unlocked
	endif
	return gig_max_stars = (<stars_max> + <challenge_stars_max>) unlocked = <unlocked> gig_challenge_max_stars = <challenge_stars_max>
endscript

script progression_get_gig_star_rewards 
	RequireParams \{[
			gig_name
		]
		all}
	gig_star_rewards = ($gig_star_rewards.default_star_rewards)
	if StructureContains structure = ($gig_star_rewards) <gig_name>
		gig_star_rewards = ($gig_star_rewards.<gig_name>)
	endif
	return gig_star_rewards = <gig_star_rewards>
endscript

script progression_get_earned_song_stars_array 
	RequireParams \{[
			gig_name
			player
		]
		all}
	song_stars = [0 0 0]
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	SetArrayElement arrayName = song_stars index = 0 newValue = <song1_stars_earned>
	return song_stars = <song_stars>
endscript
career_rewards_just_unlocked = [
]

script progression_create_rewards_atoms_array \{async = 0}
	i = 1
	player = 1
	index = 0
	GetArraySize \{$reward_progression}
	CreateLocalArray name = atoms type = struct size = <array_size>
	begin
	FormatText checksumname = name 'reward_%a_unlock' a = <i> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {
		type = Scr
		Scr = progression_career_check_reward_unlock
		params = {($reward_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_career_do_reward_unlock
		atom_params = {reward_struct = ($reward_progression [<index>]) reward_progression_index = <index> name = <name> savegame = <savegame> player = <player>}
		depends_on = <depends_on>
	}
	SetArrayElement arrayName = atoms index = <index> newValue = <atom>
	index = (<index> + 1)
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0x113a3caf)
	repeat <array_size>
	return reward_atoms = <atoms>
endscript

script progression_career_check_reward_unlock 
	criteria_passed = 0
	if NOT GlobalTagExists <requires_completed_gig> savegame = <savegame>
		ScriptAssert qs(0x92bc5c27) s = <requires_completed_gig>
		return \{false}
	endif
	GetGlobalTags <requires_completed_gig> savegame = <savegame>
	if (<completed> = 1)
		if GotParam \{requires_completed_difficulty}
			switch <requires_completed_difficulty>
				case None
				criteria_passed = 1
				case gold
				if (<completed_gold> = 1)
					criteria_passed = 1
				endif
				case platinum
				if (<completed_platinum> = 1)
					criteria_passed = 1
				endif
				case diamond
				if (<completed_diamond> = 1)
					criteria_passed = 1
				endif
			endswitch
		else
			criteria_passed = 1
		endif
	endif
	if (<criteria_passed> = 1)
		return \{true}
	endif
	return \{false}
endscript

script progression_career_do_reward_unlock 
	RequireParams \{[
			reward_struct
			reward_progression_index
			savegame
			player
		]
		all}
	reward_type = (<reward_struct>.reward_type)
	switch (<reward_type>)
		case CAS
		car_pieces = (<reward_struct>.car_pieces)
		GetArraySize <car_pieces>
		i = 0
		begin
		part = ((<car_pieces> [<i>]).part)
		desc_id = ((<car_pieces> [<i>]).desc_id)
		printf 'Unlocking CAS %a in %b through rewards system' a = <desc_id> b = <part> channel = progression_unlocks
		set_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = <savegame>
		i = (<i> + 1)
		repeat <array_size>
		case venue
		case venue_reward
		venue_checksum = (<reward_struct>.venue_checksum)
		FormatText checksumname = formatted_checksum 'venue_%s' s = ($LevelZones.<venue_checksum>.name) AddToStringLookup = true
		if NOT GotParam \{formatted_checksum}
			ScriptAssert qs(0xac1635a7) a = <venue>
			return
		endif
		SetGlobalTags <formatted_checksum> params = {unlocked = 1} savegame = <savegame> Progression = true
		case character
		profile_idx = (<reward_struct>.profile_idx)
		unlock_profile id = ($Preset_Musician_Profiles_Locked [<profile_idx>].name) savegame = <savegame>
		case cheat
		cheat_name = (<reward_struct>.cheat_name)
		original_savegame = <savegame>
		GetFirstPlayer \{local
			out = search_player}
		GetNumPlayersInGame \{local}
		begin
		get_savegame_from_player player = <search_player>
		if (<original_savegame> = <savegame>)
			player = <search_player>
			break
		endif
		GetNextPlayer player = <search_player> local out = search_player
		repeat <num_players>
		set_progression_cheat_unlocked cheat_name = <cheat_name> savegame = <savegame> player = <player>
		savegame = <original_savegame>
		case CAS_texture
		texture = (<reward_struct>.texture)
		set_cas_texture_unlocked_flag savegame = <savegame> texture = <texture>
	endswitch
	if StructureContains structure = (<reward_struct>) run_career_outro_and_credits
		if NOT InNetGame
			Change \{end_credits = 1}
		else
			unlock_career_finale_video_and_achievement
		endif
	endif
	reward_struct = (<reward_struct> + {reward_progression_index = <reward_progression_index>})
	progression_add_just_unlocked_item reward_struct = <reward_struct> player_savegame = <savegame>
endscript

script progression_add_just_unlocked_item 
	RequireParams \{[
			reward_struct
			player_savegame
		]
		all}
	GameMode_GetType
	if (<type> != career)
		return
	endif
	GetSavegameFromController controller = ($primary_controller)
	if (<savegame> != <player_savegame>)
		return
	endif
	temp_array = ($career_rewards_just_unlocked)
	GetArraySize <temp_array>
	if (<array_size> > 10)
		return
	endif
	reward_type = (<reward_struct>.reward_type)
	if (<array_size> > 0)
		i = 0
		begin
		check_struct = (<temp_array> [<i>])
		switch (<reward_type>)
			case CAS
			if StructureContains \{structure = check_struct
					frontend_desc}
				frontend_desc = ((<temp_array> [<i>]).frontend_desc)
				if (<frontend_desc> = (<reward_struct>.frontend_desc))
					return
				endif
			endif
			case venue
			if StructureContains \{structure = check_struct
					venue_checksum}
				type = ((<temp_array> [<i>]).reward_type)
				venue_checksum = ((<temp_array> [<i>]).venue_checksum)
				if ((<type> = venue) && (<venue_checksum> = (<reward_struct>.venue_checksum)))
					return
				endif
			endif
			case gig
			if StructureContains \{structure = check_struct
					gig_checksum}
				type = ((<temp_array> [<i>]).reward_type)
				gig_checksum = ((<temp_array> [<i>]).gig_checksum)
				if ((<type> = gig) && (<gig_checksum> = (<reward_struct>.gig_checksum)))
					return
				endif
			endif
			case character
			if StructureContains \{structure = check_struct
					profile_idx}
				type = ((<temp_array> [<i>]).reward_type)
				index = ((<temp_array> [<i>]).profile_idx)
				if ((<type> = character) && (<index> = (<reward_struct>.profile_idx)))
					return
				endif
			endif
			case cheat
			if StructureContains \{structure = check_struct
					cheat_name}
				type = ((<temp_array> [<i>]).reward_type)
				name = ((<temp_array> [<i>]).cheat_name)
				if ((<type> = cheat) && (<name> = (<reward_struct>.cheat_name)))
					return
				endif
			endif
		endswitch
		i = (<i> + 1)
		repeat <array_size>
	endif
	AddArrayElement array = <temp_array> element = <reward_struct>
	Change career_rewards_just_unlocked = <array>
endscript

script progression_get_rewards_just_unlocked 
	return rewards_just_unlocked = ($career_rewards_just_unlocked)
endscript

script progression_clear_rewards_just_unlocked 
	Change \{career_rewards_just_unlocked = [
		]}
endscript

script get_rewards_for_gig 
	RequireParams \{[
			gig_name
		]
		all}
	GetArraySize \{$reward_progression}
	i = 0
	begin
	if StructureContains structure = (($reward_progression) [<i>]) requires_completed_gig
		required_gig = ($reward_progression [<i>].requires_completed_gig)
		if (<required_gig> = <gig_name>)
			frontend_desc = qs(0x587f8983)
			unlock_icon = 0x00000000
			required_difficulty = 0x00000000
			if StructureContains structure = (($reward_progression) [<i>]) frontend_desc
				frontend_desc = ($reward_progression [<i>].frontend_desc)
			endif
			if StructureContains structure = (($reward_progression) [<i>]) vague_frontend_desc
				vague_frontend_desc = ($reward_progression [<i>].vague_frontend_desc)
			endif
			if StructureContains structure = (($reward_progression) [<i>]) unlock_icon
				unlock_icon = ($reward_progression [<i>].unlock_icon)
			endif
			if StructureContains structure = (($reward_progression) [<i>]) requires_completed_difficulty
				required_difficulty = ($reward_progression [<i>].requires_completed_difficulty)
			endif
			if GotParam \{vague_frontend_desc}
				return gig_rewards = {
					frontend_desc = <frontend_desc>
					vague_frontend_desc = ($<vague_frontend_desc>)
					unlock_icon = <unlock_icon>
					required_difficulty = <required_difficulty>
				}
			else
				return gig_rewards = {
					frontend_desc = <frontend_desc>
					unlock_icon = <unlock_icon>
					required_difficulty = <required_difficulty>
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{gig_rewards = {
		}
		no_rewards = 1}
endscript

script progression_reward_song_stars 
	RequireParams \{[
			song_checksum
		]
		all}
	GetFirstPlayer \{on_screen}
	begin
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 1)
		GetPlayerInfo <player> controller
		GetSavegameFromController controller = <controller>
		GetGlobalTags <song_checksum> savegame = <savegame> param = STARS
		old_stars = <STARS>
		GetGlobalTags <song_checksum> savegame = <savegame> param = score
		old_score = <score>
		if (<new_stars> > <old_stars>)
			SetGlobalTags <song_checksum> savegame = <savegame> params = {STARS = <new_stars>}
		endif
		if (<new_score> > <old_score>)
			CastToInteger \{new_score}
			SetGlobalTags <song_checksum> savegame = <savegame> params = {score = <new_score>}
		endif
	endif
	GetNextPlayer on_screen player = <player>
	repeat <num_players_shown>
endscript

script progression_calculate_star_penalty 
	penalty = 0
	if (($Cheat_Invincible) = 1)
		penalty = (<penalty> + 1)
	endif
	return penalty = <penalty>
endscript

script progression_reward_stars 
	if ($end_credits > 0)
		return
	endif
	GMan_ChallengeManagerFunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	GMan_GetGrade goal = <current_challenge>
	GMan_VenueFunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<current_venue>.name)
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		GetPlayerInfo <player> controller
		get_savegame_from_controller controller = <controller>
		GetGlobalTags <current_challenge> savegame = <savegame>
		star_reward = 0
		GetSongStatsHistory
		GetArraySize <song_stats_history>
		GetFirstPlayer \{local
			out = first_player}
		GetPlayerInfo <first_player> Band
		<star_penalty> = 0
		Band = (<Band> - 1)
		all_gold = 1
		new_stars = 0
		if (<array_size> >= 1)
			song_index = 0
			earned = ((<song_stats_history> [<song_index>] [<Band>].band_stars) - <star_penalty>)
			if (<earned> < 0)
				earned = 0
			endif
			if (<earned> > <song1_stars_earned>)
				SetGlobalTags <current_challenge> params = {song1_stars_earned = <earned>} savegame = <savegame> Progression = true
				new_stars = (<new_stars> + (<earned> - <song1_stars_earned>))
			endif
			if ((<song_stats_history> [<song_index>] [<Band>].is_gold_stars) = 0)
				all_gold = 0
			endif
		endif
		progression_get_gig_star_rewards gig_name = <current_challenge>
		if (<all_gold> = 1)
			SetGlobalTags <current_challenge> params = {earned_gold_stars = 1} savegame = <savegame> Progression = true
		endif
		if ((<completed> = 0) && (<pending_grade> >= 1))
			SetGlobalTags <current_challenge> params = {completed = 1} savegame = <savegame> Progression = true
		endif
		if ((<completed_gold> = 0) && (<pending_grade> >= 2))
			SetGlobalTags <current_challenge> params = {completed_gold = 1} savegame = <savegame> Progression = true
			new_stars = (<new_stars> + (<gig_star_rewards>.gold))
		endif
		if ((<completed_platinum> = 0) && (<pending_grade> >= 3))
			SetGlobalTags <current_challenge> params = {completed_platinum = 1} savegame = <savegame> Progression = true
			new_stars = (<new_stars> + (<gig_star_rewards>.platinum))
		endif
		if ((<completed_diamond> = 0) && (<pending_grade> >= 4))
			SetGlobalTags <current_challenge> params = {completed_diamond = 1} savegame = <savegame> Progression = true
			new_stars = (<new_stars> + (<gig_star_rewards>.diamond))
		endif
		get_current_progression_stars savegame = <savegame>
		total_stars = (<total_stars> + <new_stars>)
		set_progression_stars new_total_stars = <total_stars> savegame = <savegame>
		GetGlobalTags <venue_checksum> param = venue_stars savegame = <savegame>
		SetGlobalTags <venue_checksum> params = {venue_stars = (<venue_stars> + <new_stars>)} savegame = <savegame> Progression = true
		GetNextPlayer local player = <player>
		repeat <num_players>
	endif
	update_active_players_atoms
	GMan_SetGrade goal = <current_challenge>
endscript

script get_current_progression_stars 
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if NOT GetGlobalTags career_progression_tags param = total_stars savegame = <savegame> noassert = 1
		return \{total_stars = 0}
	endif
	return total_stars = <total_stars>
endscript

script set_progression_stars 
	RequireParams \{[
			new_total_stars
		]
		all}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	SetGlobalTags savegame = <savegame> career_progression_tags params = {total_stars = <new_total_stars>} Progression = true
	if SaveGameGetProgression savegame = <savegame>
		FormatText checksumname = Field 'progression_header%d' d = <Progression> AddToStringLookup = true
		SetGlobalTags savegame = <savegame> <Field> params = {STARS = <new_total_stars>}
	endif
endscript

script get_progression_globals 
	return \{progression_global = GH5_Career_Guitar_Progression}
endscript

script Progression_SongWon 
	printf \{qs(0xaea36534)}
	update_song_star_rating
	if isSinglePlayerGame
		GetFirstPlayer \{out = player_one}
		GetPlayerInfo <player_one> part
	else
		part = Band
	endif
	get_highest_difficulty
	get_difficulty_text_nl difficulty = <highest_difficulty>
	GMan_SongTool_GetCurrentSong
	get_song_prefix song = <current_song>
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	GameMode_GetType
	if (<current_song> != jamsession)
		if ((<type> = quickplay) || (<type> = career))
			GetNumPlayersInGame \{local}
			GetFirstPlayer \{local}
			begin
			get_savegame_from_player player = <player>
			SetGlobalTags <current_song> savegame = <savegame> params = {completed = 1}
			GetNextPlayer player = <player> local
			repeat <num_players>
		endif
	endif
	Progression_UpdateDetailedStatsForGig
	if (<current_song> != jamsession)
		GameMode_GetType
		if ((<type> = career) || (<type> = quickplay))
			if NOT IsBandCheating
				menu_top_rockers_get_top_rocker_data
				if GotParam \{score}
					consider_setlist_score player_score = <score> player_stars = <STARS> player_percentage = <percent_notes_hit> songname = <songname>
				endif
			endif
		endif
	endif
	if IsXenonOrWinDX
		if NOT (<current_song> = jamsession)
			WriteSongDataToFile
		endif
	endif
endscript

script Progression_SongFailed 
	printf \{qs(0xb3ef858d)}
	if ($game_mode = gh4_p1_career ||
			$game_mode = gh4_p2_career)
		update_active_players_atoms
	endif
	GMan_SongFunc \{func = get_current_song}
	if NOT RetailBuild
		if (<current_song> != $last_song_failed)
			Change last_song_failed = <current_song>
			Change \{current_song_failed_num = 1}
		else
			Change current_song_failed_num = ($current_song_failed_num + 1)
		endif
	endif
	if ($current_song_failed_num < 3)
		if IsXenonOrWinDX
			if NOT is_current_song_a_jam_session
				WriteSongDataToFile \{failed = 1}
			endif
		endif
	endif
endscript

script update_song_star_rating 
	printf \{qs(0x7f4ad2e6)}
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	printf qs(0xf2259a9f) i = <num_players>
	if (<num_players> > 0)
		begin
		GetPlayerInfo <player> projected_song_stars
		GetPlayerInfo <player> Band
		<STARS> = <projected_song_stars>
		CastToInteger \{STARS}
		SetPlayerInfo <player> STARS = <STARS>
		GetBandInfo <Band> projected_song_stars out = band_projected_song_stars
		band_stars = <band_projected_song_stars>
		CastToInteger \{band_stars}
		SetBandInfo <Band> STARS = <band_stars>
		printstruct <...>
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
endscript

script get_player_percent_accuracy 
	RequireParams \{[
			player_index
		]
		all}
	if NOT PlayerInfoEquals <player_index> part = vocals
		GetPlayerInfo <player_index> notes_hit
		GetPlayerInfo <player_index> max_notes
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		GetPlayerInfo <player_index> vocal_phrase_quality
		GetPlayerInfo <player_index> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	mathFloor <percent_notes_hit>
	<percent_notes_hit> = <floor>
	return percent_notes_hit = <percent_notes_hit>
endscript
end_credits = 0

script unlock_career_finale_video_and_achievement 
	printf \{qs(0x5cccdb86)}
	GetNumPlayersInGame \{local}
	GetFirstPlayer \{local}
	begin
	GetPlayerInfo <player> controller
	GetSavegameFromController controller = <controller>
	fire_achievement name = Achievement_TheLongRoadAhead controller = <controller>
	GetNextPlayer player = <player> local
	repeat <num_players>
endscript

script unlock_and_goto_credits 
	unlock_career_finale_video_and_achievement
	ui_memcard_autosave_all_players \{event = menu_change
		state = UIstate_end_credits}
endscript

script Progression_EndCredits 
	Progression_GetCreditsSong
	GMan_SongTool_SetCurrentSong song = <credits_song>
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd
		fadeouttime = 2
		fadeouttype = linear}
	if MemHeapExists \{name = heap_song}
		destroy_song_and_musicstudio_heaps \{do_unloads}
	endif
	SetBinkHeap \{heap_cas_cache}
	Progression_GetCreditsVenue
	Change current_level = <credits_venue>
	SetBinkHeap \{heap_bink}
	create_loading_screen
	Load_Venue
	Setup_All_Crowd_Sounds_Based_On_Zone
	create_song_and_musicstudio_heaps
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		return
	endif
	Change \{gameplay_restart_song = 1}
	generic_event_back \{nosound
		state = uistate_gameplay}
	spawnscriptnow \{scrolling_list_begin_credits}
endscript

script Progression_EndCredits_Done 
	destroy_credits_menu
endscript

script Progression_GetCreditsSong 
	credits_gig_checksum = ($gig_credits)
	if NOT StructureContains structure = ($<credits_gig_checksum>) predefined_playlist
		ScriptAssert \{'Progression_GetCreditsSong: Couldnt find a predefined_playlist in the $credits_gig struct'}
	endif
	GetArraySize (($<credits_gig_checksum>).predefined_playlist)
	if (<array_size> != 1)
		ScriptAssert 'Progression_GetCreditsSong: %a songs in $gig_credits playlist, when there should be 1' a = <array_size>
	endif
	credits_song_checksum = (($<credits_gig_checksum>).predefined_playlist [0])
	return credits_song = <credits_song_checksum>
endscript

script Progression_GetCreditsVenue 
	credits_gig_checksum = ($gig_credits)
	if NOT StructureContains structure = ($<credits_gig_checksum>) venue
		ScriptAssert \{'Progression_GetCreditsVenue: Couldnt find a venue in the $credits_gig struct, this is odd'}
	endif
	credits_venue_checksum = (($<credits_gig_checksum>).venue)
	return credits_venue = <credits_venue_checksum>
endscript

script Progression_IsEncoreSong 
	return \{false}
endscript

script Progression_SetProgressionNodeFlags 
	ChangeNodeFlag \{LS_ALWAYS
		1}
	ls_encore = 0
	ls_3_5 = 0
	if ($debug_encore)
		<ls_encore> = 1
	endif
	if ($encore_transitioned_played = true)
		ls_encore = 1
	else
		GameMode_GetType
		if (<type> = career)
			GetPakManCurrent \{map = zones}
			if is_encore_song
				if Transition_DoesCurrentVenueSupportEncore
					ls_encore = 1
				endif
			endif
		endif
	endif
	ChangeNodeFlag \{LS_BAND_GENERIC
		1}
	ChangeNodeFlag \{LS_BAND_NODOUBT
		0}
	ChangeNodeFlag \{LS_SONG_DONTSPEAK
		0}
	ChangeNodeFlag \{LS_SONG_LOVESTORY
		0}
	ChangeNodeFlag \{LS_SONG_PICTURETOBURN
		0}
	ChangeNodeFlag \{LS_SONG_YOUBELONGWITHME
		0}
	GMan_SongFunc \{func = get_current_song}
	switch (<current_song>)
		case DontSpeak
		GameMode_GetType
		if (<type> = career)
			ChangeNodeFlag \{LS_BAND_GENERIC
				0}
			ChangeNodeFlag \{LS_BAND_NODOUBT
				1}
			ChangeNodeFlag \{LS_SONG_DONTSPEAK
				1}
		endif
		case JustaGirl
		GameMode_GetType
		if (<type> = career)
			ChangeNodeFlag \{LS_BAND_GENERIC
				0}
			ChangeNodeFlag \{LS_BAND_NODOUBT
				1}
		endif
		case LoveStory
		ChangeNodeFlag \{LS_SONG_LOVESTORY
			1}
		case PictureToBurn
		ChangeNodeFlag \{LS_SONG_PICTURETOBURN
			1}
		case YouBelongWithMe
		ChangeNodeFlag \{LS_SONG_YOUBELONGWITHME
			1}
	endswitch
	printf qs(0xd8a1c35d) d = <ls_encore> i = <ls_3_5>
	if (<ls_encore> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			0}
		ChangeNodeFlag \{LS_ENCORE_POST
			1}
	elseif (<ls_3_5> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	else
		ChangeNodeFlag \{LS_3_5_PRE
			1}
		ChangeNodeFlag \{LS_3_5_POST
			0}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		FormatText checksumname = zone_setup '%s_SetupNodeflags' s = <pakname>
		if ScriptExists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
endscript

script quickplay_set_new_song_in_gig_list 
	if GMan_SongFunc \{func = is_play_list_finished}
		return \{false}
	endif
	printf \{qs(0x34a870a3)}
	GMan_PrintContents
	GMan_SongFunc \{func = switch_to_next_song_in_play_list}
	return \{true}
endscript

script quickplay_end_of_gig_list 
	if GMan_SongFunc \{func = is_play_list_finished}
		return \{true}
	endif
	return \{false}
endscript

script progression_check_for_gig_end 
	if GMan_SongFunc \{func = is_play_list_finished}
		return \{true}
	endif
	return \{false}
endscript

script Progression_ClearDetailedStatsForGig 
	Change \{song_stats_backup = [
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	Change \{song_stats_backup_band = [
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
			{
			}
		]}
endscript

script Progression_UpdateDetailedStatsForGig 
	GMan_SongTool_GetCurrentSong
	Progression_ClearDetailedStatsForGig
	<default_song_stats> = {
		song = <current_song>
	}
	GetNumPlayersInGame
	if (<num_players> > 0)
		GetFirstPlayer
		begin
		GetPlayerInfo <player> score
		CastToInteger \{score}
		GetPlayerInfo <player> STARS
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> total_notes
		GetPlayerInfo <player> notes_created
		GetPlayerInfo <player> sp_phrases_hit
		GetPlayerInfo <player> sp_phrases_total
		GetPlayerInfo <player> best_run
		GetPlayerInfo <player> max_notes
		GetPlayerInfo <player> vocal_streak_phrases
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_max_qual
		get_average_multiplier player = <player>
		<avg_multiplier> = <average_multiplier>
		get_song_section_arrays_for_player player = <player>
		<curr_song_stats> = {
			<default_song_stats>
			score = <score>
			STARS = <STARS>
			notes_hit = <notes_hit>
			best_run = <best_run>
			max_notes = <max_notes>
			total_notes = <total_notes>
			notes_created = <notes_created>
			sp_phrases_hit = <sp_phrases_hit>
			sp_phrases_total = <sp_phrases_total>
			avg_multiplier = <avg_multiplier>
			vocal_streak_phrases = <vocal_streak_phrases>
			vocal_phrase_quality = <vocal_phrase_quality>
			vocal_phrase_max_qual = <vocal_phrase_max_qual>
			detailed_stats = <detailed_stats>
			detailed_stats_max = <detailed_stats_max>
			section_names = <section_names>
		}
		<stats_all> = ($song_stats_backup)
		SetArrayElement arrayName = stats_all index = (<player> - 1) newValue = <curr_song_stats>
		Change globalname = song_stats_backup newValue = <stats_all>
		GetNextPlayer player = <player>
		repeat <num_players>
	endif
	GetBandsStatus
	if GotParam \{bands}
		GetArraySize <bands>
		bands_size = <array_size>
		if (<bands_size> > 0)
			band_idx = 0
			begin
			Band = (<band_idx> + 1)
			GetBandInfo <Band> STARS
			GetBandInfo <Band> score
			GetBandInfo <Band> high_mult
			GetBandInfo <Band> high_1p_streak
			GetBandInfo <Band> high_2p_streak
			GetBandInfo <Band> high_3p_streak
			GetBandInfo <Band> high_4p_streak
			GetBandInfo <Band> band_moments_hit
			GetBandInfo <Band> band_moments_possible
			current_band_stats = {
				STARS = <STARS>
				score = <score>
				high_mult = <high_mult>
				high_1p_streak = <high_1p_streak>
				high_2p_streak = <high_2p_streak>
				high_3p_streak = <high_3p_streak>
				high_4p_streak = <high_4p_streak>
				band_moments_hit = <band_moments_hit>
				band_moments_possible = <band_moments_possible>
			}
			<band_stats_all> = ($song_stats_backup_band)
			SetArrayElement arrayName = band_stats_all index = <band_idx> newValue = <current_band_stats>
			Change globalname = song_stats_backup_band newValue = <band_stats_all>
			band_idx = (<band_idx> + 1)
			repeat <bands_size>
		endif
	endif
	if NOT GotParam \{failed_or_practice}
		AddHistoryForCurrentSong
	endif
endscript

script get_song_section_arrays_for_player 
	RequireParams \{[
			player
		]
		all}
	<detailed_stats> = []
	<detailed_stats_max> = []
	<section_names> = []
	FormatText checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> AddToStringLookup = true
	FormatText checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> AddToStringLookup = true
	get_song_section_array player = <player>
	GetArraySize <song_section_array>
	if (<array_size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		FormatText TextName = marker_text qs(0x73307931) s = ((<song_section_array> [<i>]).marker)
		AddArrayElement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript
