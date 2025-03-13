new_unlockables = [
]
unlock_atoms = [
]

script execute_unlock_atoms 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	player_idx = 1
	begin
	getplayerinfo <player_idx> is_local_client
	if (<is_local_client> = 1)
		formattext checksumname = player_status 'player%p_status' p = <player_idx>
		get_savegame_from_player_status player_status = <player_status>
		change current_progression_savegame = <savegame>
		register_new_progression_atoms ($current_progression_flag) keep_current_savegame
	endif
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
endscript

script setup_unlock_atoms 
	printf channel = atom qs(0x2e86b17a) s = ($current_progression_savegame)
	progression_get_total_stars
	change progression_total_stars_unlocked = <total_stars>
	change \{unlock_atoms = [
		]}
	if gotparam \{career_band}
		setup_unlock_atoms_band
	elseif gotparam \{career_guitar}
		setup_unlock_atoms_guitar
	elseif gotparam \{career_bass}
		setup_unlock_atoms_bass
	elseif gotparam \{career_drum}
		setup_unlock_atoms_drums
	elseif gotparam \{career_vocals}
		setup_unlock_atoms_vocals
	endif
endscript

script setup_unlock_atoms_generic 
	requireparams \{[
			part
		]
		all}
	atoms = ($unlock_atoms)
	switch (<part>)
		case 'band'
		bonus_params = {career_band}
		reward_array = $progression_band_rewards
		tier_global = gh4_career_band_songs
		case 'guitar'
		bonus_params = {career_guitar}
		reward_array = $progression_guitar_rewards
		tier_global = gh4_career_guitar_songs
		case 'bass'
		bonus_params = {career_bass}
		reward_array = $progression_bass_rewards
		tier_global = gh4_career_bass_songs
		case 'drum'
		bonus_params = {career_drum}
		reward_array = $progression_drum_rewards
		tier_global = gh4_career_drum_songs
		case 'vocals'
		bonus_params = {career_vocals}
		reward_array = $progression_vocals_rewards
		tier_global = gh4_career_vocals_songs
	endswitch
	getarraysize <reward_array>
	printf channel = atom qs(0xe81a25e5) r = <reward_array>
	if (<array_size> > 0)
		i = 0
		begin
		current_reward = (<reward_array> [<i>])
		formattext checksumname = name 'career_%p_reward_%n' p = <part> n = <i> addtostringlookup = true
		removeparameter \{atom}
		if structurecontains structure = <current_reward> stars
			atom = {
				name = <name>
				type = scr
				atom_script = progression_add_new_unlocks
				atom_params = {<current_reward> name = <name>}
				depends_on = [
					{
						type = scr
						scr = progression_check_for_total_stars
						params = {stars = (<current_reward>.stars)}
					}
				]
				permanent = false
			}
		elseif structurecontains structure = <current_reward> song
			atom = {
				name = <name>
				type = scr
				atom_script = progression_add_new_unlocks
				atom_params = {<current_reward> name = <name>}
				depends_on = [
					{
						type = scr
						scr = progression_check_for_song_complete
						params = {part = <part> song = (<current_reward>.song)}
					}
				]
				permanent = false
			}
		endif
		if gotparam \{atom}
			addarrayelement array = <atoms> element = <atom>
			atoms = <array>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	change unlock_atoms = <atoms>
	return {index = <index> bonus_params = <bonus_params> reward_array = <reward_array>}
endscript

script setup_unlock_atoms_band 
	setup_unlock_atoms_generic \{part = 'band'}
	atoms = ($unlock_atoms)
	change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_guitar 
	setup_unlock_atoms_generic \{part = 'guitar'}
	atoms = ($unlock_atoms)
	change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_bass 
	setup_unlock_atoms_generic \{part = 'bass'}
	atoms = ($unlock_atoms)
	change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_drums 
	setup_unlock_atoms_generic \{part = 'drum'}
	atoms = ($unlock_atoms)
	change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_vocals 
	setup_unlock_atoms_generic \{part = 'vocals'}
	atoms = ($unlock_atoms)
	change unlock_atoms = <atoms>
endscript

script progression_add_new_unlocks 
	printf 'progression_add_new_unlocks %n' n = <name> dontassertforchecksums channel = atom
	new_unlockables_array = ($new_unlockables)
	if gotparam \{car_pieces}
		getarraysize <car_pieces>
		my_array = []
		if (<array_size> > 0)
			i = 0
			begin
			if NOT is_part_unlocked part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) savegame = ($current_progression_savegame)
				set_current_band_part_flags part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) unlocked savegame = ($current_progression_savegame)
				get_savegame_from_controller controller = ($primary_controller)
				if (<savegame> = ($current_progression_savegame))
					addarrayelement array = <my_array> element = (<car_pieces> [<i>])
					my_array = <array>
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		getarraysize <my_array>
		if (<array_size> > 0)
			if NOT gotparam \{hidden}
				if gotparam \{group_name}
					addarrayelement array = <new_unlockables_array> element = {type = car_pieces group_name = <group_name> char_pieces = <my_array>}
				else
					addarrayelement array = <new_unlockables_array> element = {type = car_pieces char_pieces = <my_array>}
				endif
				new_unlockables_array = <array>
				changed = 1
			endif
		endif
	endif
	if gotparam \{character}
		get_musician_profile_struct_by_id id = <character> savegame = ($current_progression_savegame)
		if NOT is_profile_unlocked savegame = ($current_progression_savegame) profile_struct = <profile_struct>
			unlock_profile id = <character> savegame = ($current_progression_savegame)
			get_savegame_from_controller controller = ($primary_controller)
			if (<savegame> = ($current_progression_savegame))
				addarrayelement array = <new_unlockables_array> element = {type = character item = <character>}
				new_unlockables_array = <array>
				changed = 1
			endif
		endif
	endif
	printf \{channel = atom
		qs(0xdf221bf9)}
	get_savegame_from_controller controller = ($primary_controller)
	printf channel = atom qs(0xd260f8a6) c = ($primary_controller)
	if (<savegame> = ($current_progression_savegame))
		printf \{channel = atom
			qs(0xc1050b03)}
		if gotparam \{level}
			printf \{channel = atom
				qs(0xa2d5a800)}
			if gotparam \{stars}
				printf \{channel = atom
					qs(0xda26104b)}
				progression_get_total_stars
				unlock_stars = <stars>
				if issingleplayergame
					getplayerinfo \{1
						part}
				else
					part = band
				endif
				formattext {
					checksumname = venue_checksum
					'%s_%i'
					s = ($levelzones.<level>.name)
					i = ($instrument_list.<part>.text_nl)
				}
				if globaltagexists <venue_checksum> noassert = 1
					getglobaltags <venue_checksum> param = unlocked
					setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
					printf channel = atom qs(0xac97f409) n = ($levelzones.<level>.name)
					if (<unlocked> = 0)
						printf channel = atom qs(0xdcb956aa) n = ($levelzones.<level>.name)
						addarrayelement array = <new_unlockables_array> element = {type = level item = <level>}
						new_unlockables_array = <array>
						changed = 1
					else
						printf channel = atom qs(0x04eea0c8) n = ($levelzones.<level>.name)
					endif
				endif
			elseif gotparam \{song}
				if issingleplayergame
					getplayerinfo \{1
						part}
				else
					part = band
				endif
				formattext {
					checksumname = venue_checksum
					'%s_%i'
					s = ($levelzones.<level>.name)
					i = ($instrument_list.<part>.text_nl)
				}
				if globaltagexists <venue_checksum> noassert = 1
					getglobaltags <venue_checksum> param = unlocked
					setglobaltags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
					if (<unlocked> = 0)
						addarrayelement array = <new_unlockables_array> element = {type = level item = <level>}
						new_unlockables_array = <array>
						changed = 1
					endif
				endif
			endif
			printstruct <...> channel = what
		endif
	endif
	if gotparam \{changed}
		printf \{channel = bort
			qs(0x34f2c9b4)}
		change new_unlockables = <new_unlockables_array>
	endif
endscript

script progression_get_new_unlocks 
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
	change \{new_unlockables = [
		]}
endscript

script progression_check_for_5_stars \{part = 'guitar'}
	formattext checksumname = tier_global 'gh4_career_%p_songs' p = <part>
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	num_songs = 0
	tier_num = 1
	begin
	formattext checksumname = tier 'tier%d' d = <tier_num>
	getarraysize ($<tier_global>.<tier>.songs)
	songlist_size = <array_size>
	song_count = 0
	begin
	<song> = ($<tier_global>.<tier>.songs [<song_count>])
	if NOT progression_check_for_song_5_stars song = <song> part = <part>
		return \{false}
	endif
	<song_count> = (<song_count> + 1)
	repeat <songlist_size>
	tier_num = (<tier_num> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{true}
endscript

script progression_check_for_song_5_stars 
	requireparams \{[
			song
		]
		all}
	if NOT structurecontains structure = ($gh_songlist_props.<song>) never_show_in_setlist
		get_song_saved_in_globaltags song = <song>
		get_song_allowed_in_quickplay song = <song>
		if NOT ((<saved_in_globaltags> = 1) && (<allowed_in_quickplay> = 1))
			return \{true}
		endif
	else
		return \{true}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.name)
	i = 0
	begin
	formattext checksumname = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	getglobaltags <song_checksum> params = {stars} savegame = ($current_progression_savegame)
	if (<stars> = 5)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{false}
endscript

script progression_check_for_song_complete 
	requireparams \{[
			song
		]
		all}
	if NOT structurecontains structure = $permanent_songlist_props <song>
		return \{false}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.name)
	i = 0
	begin
	formattext checksumname = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	getglobaltags <song_checksum> params = {stars} savegame = ($current_progression_savegame)
	if (<stars> >= 3)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{false}
endscript

script progression_check_for_total_stars 
	requireparams \{[
			stars
		]
		all}
	total_stars = ($progression_total_stars_unlocked)
	printstruct <...> channel = atom
	if (<stars> <= <total_stars>)
		return \{true}
	endif
	return \{false}
endscript
