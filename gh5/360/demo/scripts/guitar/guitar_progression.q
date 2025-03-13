
script reset_progression_atoms \{force_update = 1
		async = 0}
	requireparams \{[
			savegame
		]
		all}
	conditional_async_wait async = <async> text = qs(0x8c29435c)
	lockglobaltags \{push_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xa704109f)
	create_player_progression_atoms savegame = <savegame> async = <async>
	conditional_async_wait async = <async> text = qs(0xbe1f21de)
	if NOT gotparam \{completed_atoms_array}
		printf \{'setup_progression_atoms Error: No atoms were loaded or created'}
		return
	endif
	conditional_async_wait async = <async> text = qs(0xf15eb719)
	registeratoms savegame = <savegame> <completed_atoms_array>
	conditional_async_wait async = <async> text = qs(0xe8458658)
	if (<force_update> = 1)
		updateatoms savegame = <savegame>
	endif
	conditional_async_wait async = <async> text = qs(0xc368d59b)
	lockglobaltags \{pop_progression_writes_only}
	conditional_async_wait async = <async> text = qs(0xda73e4da)
endscript

script update_active_players_atoms 
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		get_savegame_from_player player = <player>
		updateatoms savegame = <savegame>
		getnextplayer local player = <player>
		repeat <num_players>
	endif
endscript

script create_player_progression_atoms \{async = 0}
	if NOT gotparam \{savegame}
		scriptassert \{'create_player_progression_atoms Error: No savegame defined'}
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
	if NOT gotparam \{savegame}
		scriptassert \{qs(0x9243e736)}
		return
	endif
	i = 1
	index = 0
	getarraysize \{$venue_progression}
	createlocalarray name = atoms type = struct size = <array_size>
	begin
	formattext checksumname = name 'venue_%a_unlock' a = <i> addtostringlookup = true
	depends_on = []
	addarrayelement array = <depends_on> element = {
		type = scr
		scr = progression_career_check_venue_unlock
		params = {($venue_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = scr
		atom_script = progression_career_do_venue_unlock
		atom_params = {($venue_progression [<index>]) savegame = <savegame>}
		depends_on = <depends_on>
	}
	setarrayelement arrayname = atoms index = <index> newvalue = <atom>
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
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<venue_to_unlock>.name)
	setglobaltags <venue_checksum> params = {unlocked = 1} savegame = <savegame> packtype = venuetags progression = true
	venue_struct = {
		reward_type = venue
		venue_checksum = <venue_to_unlock>
	}
	progression_add_just_unlocked_item reward_struct = <venue_struct> player_savegame = <savegame>
endscript

script progression_get_stars_to_next_venue 
	getarraysize \{$venue_progression}
	lowest_diff = 500000
	next_venue = none
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
	if (<next_venue> = none)
		<lowest_diff> = 0
	endif
	return stars_to_next = <lowest_diff> next_venue = <next_venue>
endscript

script progression_get_venue_stars_total 
	requireparams \{[
			player
			venue
		]
		all}
	if NOT gman_goalisactive \{goal = career}
		scriptassert qs(0xe5b9f37c) a = <venue>
		return
	endif
	gman_challengemanagerfunc goal = career tool = challenges func = get_challenges_for_venue params = {venue = <venue>}
	if NOT gotparam \{challenge_list}
		scriptassert qs(0x11c64938) a = <venue>
		return
	endif
	getarraysize <challenge_list>
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
	getarraysize \{$gig_progression}
	createlocalarray name = atoms type = struct size = <array_size>
	begin
	formattext checksumname = name 'gig_%a_unlock' a = <i> addtostringlookup = true
	depends_on = []
	addarrayelement array = <depends_on> element = {
		type = scr
		scr = progression_career_check_gig_unlock
		params = {($gig_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = scr
		atom_script = progression_career_do_gig_unlock
		atom_params = {($gig_progression [<index>]) savegame = <savegame> name = <name>}
		depends_on = <depends_on>
	}
	setarrayelement arrayname = atoms index = <index> newvalue = <atom>
	index = (<index> + 1)
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0x058ed75c)
	repeat <array_size>
	return gig_atoms = <atoms>
endscript

script progression_career_check_gig_unlock 
	if gotparam \{unlocked_with_venue}
		return \{true}
	elseif gotparam \{requires_completed_gig}
		getglobaltags <requires_completed_gig> param = completed savegame = <savegame>
		if (<completed> = 1)
			return \{true}
		endif
	elseif gotparam \{requires_completed_gig_list}
		getarraysize <requires_completed_gig_list>
		i = 0
		begin
		getglobaltags (<requires_completed_gig_list> [<i>]) param = completed savegame = <savegame>
		if (<completed> = 0)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
		return \{true}
	elseif gotparam \{requires_venue_stars}
		formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<current_venue>.name)
		getglobaltags <venue_checksum> param = venue_stars savegame = <savegame>
		if (<venue_stars> >= <requires_venue_stars>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script progression_career_do_gig_unlock 
	setglobaltags savegame = <savegame> <gig_to_unlock> params = {unlocked = 1} packtype = gigtags progression = true
	if (<current_venue> = load_z_subway)
		if gotparam \{unlocked_with_venue}
			setglobaltags savegame = <savegame> <gig_to_unlock> params = {has_been_played = 1} packtype = gigtags progression = true
		endif
	endif
	gig_struct = {
		reward_type = gig
		gig_checksum = <gig_to_unlock>
	}
	progression_add_just_unlocked_item reward_struct = <gig_struct> player_savegame = <savegame>
endscript

script progression_get_gig_song_stars_possible 
	requireparams \{[
			gig_name
		]
		all}
	song_stars = 0
	if structurecontains structure = ($<gig_name>) predefined_playlist
		playlist = ($<gig_name>.predefined_playlist)
		getarraysize <playlist>
		song_stars = (<array_size> * ($max_song_stars))
	else
		song_stars = (($<gig_name>.num_songs) * ($max_song_stars))
	endif
	return song_stars = <song_stars>
endscript

script progression_get_gig_song_stars_earned 
	requireparams \{[
			gig_name
			player
		]
		all}
	stars_earned = 0
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags <gig_name> savegame = <savegame>
	stars_earned = (<song1_stars_earned>)
	if (<completed_gold> = 1)
		stars_earned = (<stars_earned> + ($gig_star_rewards.<gig_name>.gold))
	endif
	if (<completed_platinum> = 1)
		stars_earned = (<stars_earned> + ($gig_star_rewards.<gig_name>.platinum))
	endif
	if (<completed_diamond> = 1)
		stars_earned = (<stars_earned> + ($gig_star_rewards.<gig_name>.diamond))
	endif
	return gig_stars_earned = <stars_earned>
endscript

script progression_get_gig_challenge_stars_earned 
	requireparams \{[
			gig_name
			player
		]
		all}
	highest_completed_difficulty = 0
	challenge_stars = 0
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags <gig_name> savegame = <savegame>
	if (<completed> = 1)
		highest_completed_difficulty = 1
	endif
	if (<completed_gold> = 1)
		highest_completed_difficulty = 2
		challenge_stars = (<challenge_stars> + ($gig_star_rewards.<gig_name>.gold))
	endif
	if (<completed_platinum> = 1)
		highest_completed_difficulty = 3
		challenge_stars = (<challenge_stars> + ($gig_star_rewards.<gig_name>.platinum))
	endif
	if (<completed_diamond> = 1)
		highest_completed_difficulty = 4
		challenge_stars = (<challenge_stars> + ($gig_star_rewards.<gig_name>.diamond))
	endif
	return highest_earned = <highest_completed_difficulty> challenge_stars = <challenge_stars>
endscript

script progression_get_gig_stars_total 
	requireparams \{[
			gig_name
		]
		all}
	stars_max = 0
	if structurecontains structure = ($gig_star_rewards) <gig_name>
		progression_get_gig_song_stars_possible gig_name = <gig_name>
		stars_max = (<stars_max> + <song_stars>)
		challenge_stars_max = ($gig_star_rewards.<gig_name>.gold)
		challenge_stars_max = (<challenge_stars_max> + ($gig_star_rewards.<gig_name>.platinum))
		challenge_stars_max = (<challenge_stars_max> + ($gig_star_rewards.<gig_name>.diamond))
	else
		scriptassert qs(0x5b591831) a = <gig_name>
	endif
	unlocked = 0
	if gotparam \{player}
		getplayerinfo <player> controller
		get_savegame_from_controller controller = <controller>
		getglobaltags <gig_name> savegame = <savegame> param = unlocked
	endif
	return gig_max_stars = (<stars_max> + <challenge_stars_max>) unlocked = <unlocked> gig_challenge_max_stars = <challenge_stars_max>
endscript

script progression_get_earned_song_stars_array 
	requireparams \{[
			gig_name
			player
		]
		all}
	song_stars = [0 0 0]
	getplayerinfo <player> controller
	get_savegame_from_controller controller = <controller>
	getglobaltags <gig_name> savegame = <savegame>
	setarrayelement arrayname = song_stars index = 0 newvalue = <song1_stars_earned>
	return song_stars = <song_stars>
endscript
career_rewards_just_unlocked = [
]

script progression_create_rewards_atoms_array \{async = 0}
	i = 1
	player = 1
	index = 0
	getarraysize \{$reward_progression}
	createlocalarray name = atoms type = struct size = <array_size>
	begin
	formattext checksumname = name 'reward_%a_unlock' a = <i> addtostringlookup = true
	depends_on = []
	addarrayelement array = <depends_on> element = {
		type = scr
		scr = progression_career_check_reward_unlock
		params = {($reward_progression [<index>]) savegame = <savegame>}
	}
	depends_on = <array>
	atom = {
		name = <name>
		type = scr
		atom_script = progression_career_do_reward_unlock
		atom_params = {reward_struct = ($reward_progression [<index>]) reward_progression_index = <index> name = <name> savegame = <savegame> player = <player>}
		depends_on = <depends_on>
	}
	setarrayelement arrayname = atoms index = <index> newvalue = <atom>
	index = (<index> + 1)
	i = (<i> + 1)
	conditional_async_wait async = <async> text = qs(0x113a3caf)
	repeat <array_size>
	return reward_atoms = <atoms>
endscript

script progression_career_check_reward_unlock 
	criteria_passed = 0
	getglobaltags <requires_completed_gig> savegame = <savegame>
	if (<completed> = 1)
		if gotparam \{requires_completed_difficulty}
			switch <requires_completed_difficulty>
				case none
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
	requireparams \{[
			reward_struct
			reward_progression_index
			savegame
			player
		]
		all}
	reward_type = (<reward_struct>.reward_type)
	switch (<reward_type>)
		case cas
		car_pieces = (<reward_struct>.car_pieces)
		getarraysize <car_pieces>
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
		formattext checksumname = formatted_checksum 'venue_%s' s = ($levelzones.<venue_checksum>.name) addtostringlookup = true
		if NOT gotparam \{formatted_checksum}
			scriptassert qs(0xac1635a7) a = <venue>
			return
		endif
		setglobaltags <formatted_checksum> params = {unlocked = 1} savegame = <savegame> progression = true
		case character
		profile_idx = (<reward_struct>.profile_idx)
		unlock_profile id = ($preset_musician_profiles_locked [<profile_idx>].name) savegame = <savegame>
		case cheat
		cheat_name = (<reward_struct>.cheat_name)
		set_progression_cheat_unlocked cheat_name = <cheat_name> savegame = <savegame> player = <player>
		case cas_texture
		texture = (<reward_struct>.texture)
		set_cas_texture_unlocked_flag savegame = <savegame> texture = <texture>
	endswitch
	if structurecontains structure = (<reward_struct>) run_career_outro_and_credits
		if NOT innetgame
			change \{end_credits = 1}
		else
			unlock_career_finale_video_and_achievement
		endif
	endif
	reward_struct = (<reward_struct> + {reward_progression_index = <reward_progression_index>})
	progression_add_just_unlocked_item reward_struct = <reward_struct> player_savegame = <savegame>
endscript

script progression_add_just_unlocked_item 
	requireparams \{[
			reward_struct
			player_savegame
		]
		all}
	gamemode_gettype
	if (<type> != career)
		return
	endif
	getsavegamefromcontroller controller = ($primary_controller)
	if (<savegame> != <player_savegame>)
		return
	endif
	temp_array = ($career_rewards_just_unlocked)
	getarraysize <temp_array>
	if (<array_size> > 4)
		return
	endif
	reward_type = (<reward_struct>.reward_type)
	if (<array_size> > 0)
		i = 0
		begin
		check_struct = (<temp_array> [<i>])
		switch (<reward_type>)
			case cas
			if structurecontains \{structure = check_struct
					frontend_desc}
				frontend_desc = ((<temp_array> [<i>]).frontend_desc)
				if (<frontend_desc> = (<reward_struct>.frontend_desc))
					return
				endif
			endif
			case venue
			if structurecontains \{structure = check_struct
					venue_checksum}
				type = ((<temp_array> [<i>]).reward_type)
				venue_checksum = ((<temp_array> [<i>]).venue_checksum)
				if ((<type> = venue) && (<venue_checksum> = (<reward_struct>.venue_checksum)))
					return
				endif
			endif
			case gig
			if structurecontains \{structure = check_struct
					gig_checksum}
				type = ((<temp_array> [<i>]).reward_type)
				gig_checksum = ((<temp_array> [<i>]).gig_checksum)
				if ((<type> = gig) && (<gig_checksum> = (<reward_struct>.gig_checksum)))
					return
				endif
			endif
			case character
			if structurecontains \{structure = check_struct
					profile_idx}
				type = ((<temp_array> [<i>]).reward_type)
				index = ((<temp_array> [<i>]).profile_idx)
				if ((<type> = character) && (<index> = (<reward_struct>.profile_idx)))
					return
				endif
			endif
			case cheat
			if structurecontains \{structure = check_struct
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
	addarrayelement array = <temp_array> element = <reward_struct>
	change career_rewards_just_unlocked = <array>
endscript

script progression_get_rewards_just_unlocked 
	return rewards_just_unlocked = ($career_rewards_just_unlocked)
endscript

script progression_clear_rewards_just_unlocked 
	change \{career_rewards_just_unlocked = [
		]}
endscript

script get_rewards_for_gig 
	requireparams \{[
			gig_name
		]
		all}
	getarraysize \{$reward_progression}
	i = 0
	begin
	if structurecontains structure = (($reward_progression) [<i>]) requires_completed_gig
		required_gig = ($reward_progression [<i>].requires_completed_gig)
		if (<required_gig> = <gig_name>)
			frontend_desc = qs(0x587f8983)
			unlock_icon = 0x00000000
			required_difficulty = 0x00000000
			if structurecontains structure = (($reward_progression) [<i>]) frontend_desc
				frontend_desc = ($reward_progression [<i>].frontend_desc)
			endif
			if structurecontains structure = (($reward_progression) [<i>]) vague_frontend_desc
				vague_frontend_desc = ($reward_progression [<i>].vague_frontend_desc)
			endif
			if structurecontains structure = (($reward_progression) [<i>]) unlock_icon
				unlock_icon = ($reward_progression [<i>].unlock_icon)
			endif
			if structurecontains structure = (($reward_progression) [<i>]) requires_completed_difficulty
				required_difficulty = ($reward_progression [<i>].requires_completed_difficulty)
			endif
			if gotparam \{vague_frontend_desc}
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
	requireparams \{[
			song_checksum
		]
		all}
	getfirstplayer \{on_screen}
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
		endif
		if (<new_score> > <old_score>)
			casttointeger \{new_score}
			setglobaltags <song_checksum> savegame = <savegame> params = {score = <new_score>}
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
endscript

script progression_calculate_star_penalty 
	penalty = 0
	if (($cheat_invincible) = 1)
		penalty = (<penalty> + 1)
	endif
	return penalty = <penalty>
endscript

script progression_reward_stars 
	if ($end_credits > 0)
		return
	endif
	gman_challengemanagerfunc \{goal = career
		tool = challenges
		func = get_current_challenge}
	if NOT structurecontains structure = ($gig_star_rewards) <current_challenge>
		scriptassert 'Error rewarding stars: Challenge "%s" not found in $gig_star_rewards' s = <current_challenge>
	endif
	gman_getgrade goal = <current_challenge>
	gman_venuefunc \{goal = career
		tool = venue_handler
		func = get_current_venue}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<current_venue>.name)
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		get_savegame_from_controller controller = <controller>
		getglobaltags <current_challenge> savegame = <savegame>
		star_reward = 0
		getsongstatshistory
		getarraysize <song_stats_history>
		getfirstplayer \{local
			out = first_player}
		getplayerinfo <first_player> band
		<star_penalty> = 0
		band = (<band> - 1)
		all_gold = 1
		new_stars = 0
		if (<array_size> >= 1)
			song_index = 0
			earned = ((<song_stats_history> [<song_index>] [<band>].band_stars) - <star_penalty>)
			if (<earned> < 0)
				earned = 0
			endif
			if (<earned> > <song1_stars_earned>)
				setglobaltags <current_challenge> params = {song1_stars_earned = <earned>} savegame = <savegame> progression = true
				new_stars = (<new_stars> + (<earned> - <song1_stars_earned>))
			endif
			if ((<song_stats_history> [<song_index>] [<band>].is_gold_stars) = 0)
				all_gold = 0
			endif
		endif
		if (<all_gold> = 1)
			setglobaltags <current_challenge> params = {earned_gold_stars = 1} savegame = <savegame> progression = true
		endif
		if ((<completed> = 0) && (<pending_grade> >= 1))
			setglobaltags <current_challenge> params = {completed = 1} savegame = <savegame> progression = true
		endif
		if ((<completed_gold> = 0) && (<pending_grade> >= 2))
			setglobaltags <current_challenge> params = {completed_gold = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($gig_star_rewards.<current_challenge>.gold))
		endif
		if ((<completed_platinum> = 0) && (<pending_grade> >= 3))
			setglobaltags <current_challenge> params = {completed_platinum = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($gig_star_rewards.<current_challenge>.platinum))
		endif
		if ((<completed_diamond> = 0) && (<pending_grade> >= 4))
			setglobaltags <current_challenge> params = {completed_diamond = 1} savegame = <savegame> progression = true
			new_stars = (<new_stars> + ($gig_star_rewards.<current_challenge>.diamond))
		endif
		get_current_progression_stars savegame = <savegame>
		total_stars = (<total_stars> + <new_stars>)
		set_progression_stars new_total_stars = <total_stars> savegame = <savegame>
		getglobaltags <venue_checksum> param = venue_stars savegame = <savegame>
		setglobaltags <venue_checksum> params = {venue_stars = (<venue_stars> + <new_stars>)} savegame = <savegame> progression = true
		getnextplayer local player = <player>
		repeat <num_players>
	endif
	update_active_players_atoms
	gman_setgrade goal = <current_challenge>
endscript

script get_current_progression_stars 
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	if NOT getglobaltags career_progression_tags param = total_stars savegame = <savegame> noassert = 1
		return \{total_stars = 0}
	endif
	return total_stars = <total_stars>
endscript

script set_progression_stars 
	requireparams \{[
			new_total_stars
		]
		all}
	if NOT gotparam \{savegame}
		get_savegame_from_controller controller = ($primary_controller)
	endif
	setglobaltags savegame = <savegame> career_progression_tags params = {total_stars = <new_total_stars>} progression = true
	if savegamegetprogression savegame = <savegame>
		formattext checksumname = field 'progression_header%d' d = <progression> addtostringlookup = true
		setglobaltags savegame = <savegame> <field> params = {stars = <new_total_stars>}
	endif
endscript

script get_progression_globals 
	return \{progression_global = gh5_career_guitar_progression}
endscript

script progression_songwon 
	printf \{qs(0xaea36534)}
	update_song_star_rating
	if issingleplayergame
		getfirstplayer \{out = player_one}
		getplayerinfo <player_one> part
	else
		part = band
	endif
	get_highest_difficulty
	get_difficulty_text_nl difficulty = <highest_difficulty>
	gman_songtool_getcurrentsong
	get_song_prefix song = <current_song>
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	gamemode_gettype
	if (<current_song> != jamsession)
		if ((<type> = quickplay) || (<type> = career))
			getnumplayersingame \{local}
			getfirstplayer \{local}
			begin
			get_savegame_from_player player = <player>
			setglobaltags <current_song> savegame = <savegame> params = {completed = 1}
			getnextplayer player = <player> local
			repeat <num_players>
		endif
	endif
	progression_updatedetailedstatsforgig
	if (<current_song> != jamsession)
		gamemode_gettype
		if ((<type> = career) || (<type> = quickplay))
			if NOT isbandcheating
				menu_top_rockers_get_top_rocker_data
				if gotparam \{score}
					consider_setlist_score player_score = <score> player_stars = <stars> player_percentage = <percent_notes_hit> songname = <songname>
				endif
			endif
		endif
	endif
	if isxenonorwindx
		if NOT (<current_song> = jamsession)
			writesongdatatofile
		endif
	endif
endscript

script progression_songfailed 
	printf \{qs(0xb3ef858d)}
	if ($game_mode = gh4_p1_career ||
			$game_mode = gh4_p2_career)
		update_active_players_atoms
	endif
	if ($current_song != $last_song_failed)
		change last_song_failed = ($current_song)
		change \{current_song_failed_num = 1}
	else
		change current_song_failed_num = ($current_song_failed_num + 1)
	endif
	if ($current_song_failed_num < 3)
		if isxenonorwindx
			if NOT is_current_song_a_jam_session
				writesongdatatofile \{failed = 1}
			endif
		endif
	endif
endscript

script update_song_star_rating 
	printf \{qs(0x7f4ad2e6)}
	getnumplayersingame \{local}
	getfirstplayer \{local}
	printf qs(0xf2259a9f) i = <num_players>
	if (<num_players> > 0)
		begin
		getplayerinfo <player> projected_song_stars
		getplayerinfo <player> band
		<stars> = <projected_song_stars>
		casttointeger \{stars}
		setplayerinfo <player> stars = <stars>
		getbandinfo <band> projected_song_stars out = band_projected_song_stars
		band_stars = <band_projected_song_stars>
		casttointeger \{band_stars}
		setbandinfo <band> stars = <band_stars>
		printstruct <...>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
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

script unlock_career_finale_video_and_achievement 
	getarraysize \{$bonus_videos}
	i = 0
	begin
	video_id = ((($bonus_videos) [<i>]).id)
	if (<video_id> = career_ending)
		getnumplayersingame \{local}
		getfirstplayer \{local}
		begin
		getplayerinfo <player> controller
		getsavegamefromcontroller controller = <controller>
		setglobaltags savegame = <savegame> <video_id> params = {unlocked = 1} packtype = unlockedtags
		fire_achievement name = achievement_thetraditional controller = <controller>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script unlock_and_goto_credits 
	unlock_career_finale_video_and_achievement
	ui_memcard_autosave_all_players \{event = menu_change
		state = uistate_end_credits}
endscript

script progression_endcredits 
	progression_getcreditssong
	gman_songtool_setcurrentsong song = <credits_song>
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = frontend
		fadeouttime = 2
		fadeouttype = linear}
	if memheapexists \{name = heap_song}
		destroy_song_and_musicstudio_heaps \{do_unloads}
	endif
	setbinkheap \{heap_cas_cache}
	playmovieandwait \{noblack
		movie = 'career_ending'
		no_script_wait
		noskip}
	progression_getcreditsvenue
	change current_level = <credits_venue>
	setbinkheap \{heap_bink}
	waitformovie_endcredits
	setup_all_crowd_sounds_based_on_zone
	create_loading_screen
	load_venue
	create_song_and_musicstudio_heaps
	if NOT ui_event_exists_in_stack \{name = 'gameplay'}
		return
	endif
	change \{gameplay_restart_song = 1}
	generic_event_back \{nosound
		state = uistate_gameplay}
	spawnscriptnow \{scrolling_list_begin_credits}
endscript

script progression_endcredits_done 
	destroy_credits_menu
endscript

script progression_getcreditssong 
	credits_gig_checksum = ($gig_credits)
	if NOT structurecontains structure = ($<credits_gig_checksum>) predefined_playlist
		scriptassert \{'Progression_GetCreditsSong: Couldnt find a predefined_playlist in the $credits_gig struct'}
	endif
	getarraysize (($<credits_gig_checksum>).predefined_playlist)
	if (<array_size> != 1)
		scriptassert 'Progression_GetCreditsSong: %a songs in $gig_credits playlist, when there should be 1' a = <array_size>
	endif
	credits_song_checksum = (($<credits_gig_checksum>).predefined_playlist [0])
	return credits_song = <credits_song_checksum>
endscript

script progression_getcreditsvenue 
	credits_gig_checksum = ($gig_credits)
	if NOT structurecontains structure = ($<credits_gig_checksum>) venue
		scriptassert \{'Progression_GetCreditsVenue: Couldnt find a venue in the $credits_gig struct, this is odd'}
	endif
	credits_venue_checksum = (($<credits_gig_checksum>).venue)
	return credits_venue = <credits_venue_checksum>
endscript

script progression_isencoresong 
	return \{false}
endscript

script progression_setprogressionnodeflags 
	changenodeflag \{ls_always
		1}
	ls_encore = 0
	ls_3_5 = 0
	if ($debug_encore)
		<ls_encore> = 1
	endif
	if ($encore_transitioned_played = true)
		ls_encore = 1
	else
		gamemode_gettype
		if (<type> = career)
			getpakmancurrent \{map = zones}
			if is_encore_song
				ls_encore = 1
			endif
		endif
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

script quickplay_set_new_song_in_gig_list 
	if gman_songfunc \{func = is_play_list_finished}
		return \{false}
	endif
	printf \{qs(0x34a870a3)}
	gman_printcontents
	gman_songfunc \{func = switch_to_next_song_in_play_list}
	return \{true}
endscript

script quickplay_end_of_gig_list 
	if gman_songfunc \{func = is_play_list_finished}
		return \{true}
	endif
	return \{false}
endscript

script progression_check_for_gig_end 
	if gman_songfunc \{func = is_play_list_finished}
		return \{true}
	endif
	return \{false}
endscript

script progression_cleardetailedstatsforgig 
	change \{song_stats_backup = [
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
	change \{song_stats_backup_band = [
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

script progression_updatedetailedstatsforgig 
	gman_songtool_getcurrentsong
	progression_cleardetailedstatsforgig
	<default_song_stats> = {
		song = <current_song>
	}
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <player> score
		casttointeger \{score}
		getplayerinfo <player> stars
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		getplayerinfo <player> notes_created
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
		setarrayelement arrayname = stats_all index = (<player> - 1) newvalue = <curr_song_stats>
		change globalname = song_stats_backup newvalue = <stats_all>
		getnextplayer player = <player>
		repeat <num_players>
	endif
	getbandsstatus
	if gotparam \{bands}
		getarraysize <bands>
		bands_size = <array_size>
		if (<bands_size> > 0)
			band_idx = 0
			begin
			band = (<band_idx> + 1)
			getbandinfo <band> stars
			getbandinfo <band> score
			getbandinfo <band> high_mult
			getbandinfo <band> high_1p_streak
			getbandinfo <band> high_2p_streak
			getbandinfo <band> high_3p_streak
			getbandinfo <band> high_4p_streak
			getbandinfo <band> band_moments_hit
			getbandinfo <band> band_moments_possible
			current_band_stats = {
				stars = <stars>
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
			setarrayelement arrayname = band_stats_all index = <band_idx> newvalue = <current_band_stats>
			change globalname = song_stats_backup_band newvalue = <band_stats_all>
			band_idx = (<band_idx> + 1)
			repeat <bands_size>
		endif
	endif
	if NOT gotparam \{failed_or_practice}
		addhistoryforcurrentsong
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
	formattext checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> addtostringlookup = true
	formattext checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> addtostringlookup = true
	get_song_section_array player = <player>
	getarraysize <song_section_array>
	if (<array_size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		formattext textname = marker_text qs(0x73307931) s = ((<song_section_array> [<i>]).marker)
		addarrayelement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript
