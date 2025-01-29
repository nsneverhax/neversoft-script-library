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
		<player_status> = ($0x2994109a [<player_idx>])
		get_savegame_from_player_status player_status = <player_status>
		Change current_progression_savegame = <savegame>
		register_new_progression_atoms ($current_progression_flag) keep_current_savegame
	endif
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
endscript

script setup_unlock_atoms 
	printf channel = atom qs(0x2e86b17a) s = ($current_progression_savegame)
	progression_get_total_stars
	Change progression_total_stars_unlocked = <total_stars>
	Change \{unlock_atoms = [
		]}
	if GotParam \{career_band}
		setup_unlock_atoms_band
	elseif GotParam \{career_guitar}
		setup_unlock_atoms_guitar
	elseif GotParam \{career_bass}
		setup_unlock_atoms_bass
	elseif GotParam \{career_drum}
		setup_unlock_atoms_drums
	elseif GotParam \{career_vocals}
		setup_unlock_atoms_vocals
	endif
endscript

script setup_unlock_atoms_generic 
	RequireParams \{[
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
	GetArraySize <reward_array>
	if (<array_Size> > 0)
		i = 0
		begin
		current_reward = (<reward_array> [<i>])
		formatText checksumName = Name 'career_%p_reward_%n' p = <part> n = <i> AddToStringLookup = true
		RemoveParameter \{atom}
		if StructureContains structure = <current_reward> stars
			atom = {
				Name = <Name>
				Type = Scr
				atom_script = progression_add_new_unlocks
				atom_params = {<current_reward> Name = <Name>}
				depends_on = [
					{
						Type = Scr
						Scr = progression_check_for_total_stars
						params = {stars = (<current_reward>.stars)}
					}
				]
				permanent = FALSE
			}
		elseif StructureContains structure = <current_reward> song
			atom = {
				Name = <Name>
				Type = Scr
				atom_script = progression_add_new_unlocks
				atom_params = {<current_reward> Name = <Name>}
				depends_on = [
					{
						Type = Scr
						Scr = progression_check_for_song_complete
						params = {part = <part> song = (<current_reward>.song)}
					}
				]
				permanent = FALSE
			}
		elseif StructureContains structure = <current_reward> songs
			atom = {
				Name = <Name>
				Type = Scr
				atom_script = progression_add_new_unlocks
				atom_params = {<current_reward> Name = <Name>}
				depends_on = [
					{
						Type = Scr
						Scr = bx_progression_check_for_songs_complete
						params = {part = <part> songs = (<current_reward>.songs)}
					}
				]
				permanent = FALSE
			}
		endif
		if GotParam \{atom}
			AddArrayElement array = <atoms> element = <atom>
			atoms = <array>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	Change unlock_atoms = <atoms>
	return {index = <index> bonus_params = <bonus_params> reward_array = <reward_array>}
endscript

script setup_unlock_atoms_band 
	setup_unlock_atoms_generic \{part = 'band'}
	atoms = ($unlock_atoms)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_guitar 
	setup_unlock_atoms_generic \{part = 'guitar'}
	atoms = ($unlock_atoms)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_bass 
	setup_unlock_atoms_generic \{part = 'bass'}
	atoms = ($unlock_atoms)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_drums 
	setup_unlock_atoms_generic \{part = 'drum'}
	atoms = ($unlock_atoms)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_vocals 
	setup_unlock_atoms_generic \{part = 'vocals'}
	atoms = ($unlock_atoms)
	Change unlock_atoms = <atoms>
endscript
0x1259192e = 0

script progression_add_new_unlocks 
	if ($ps2_car_part_scripts_loaded = 0)
		unload_song_anims
		ps2_load_car_part_script
	endif
	new_unlockables_array = ($new_unlockables)
	if GotParam \{car_pieces}
		GetArraySize <car_pieces>
		my_array = []
		if (<array_Size> > 0)
			i = 0
			begin
			if NOT is_part_unlocked part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) savegame = ($current_progression_savegame)
				set_current_band_part_flags part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) unlocked savegame = ($current_progression_savegame)
				get_savegame_from_controller controller = ($primary_controller)
				if (<savegame> = ($current_progression_savegame))
					AddArrayElement array = <my_array> element = (<car_pieces> [<i>])
					my_array = <array>
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
		GetArraySize <my_array>
		if (<array_Size> > 0)
			if NOT GotParam \{hidden}
				if GotParam \{group_name}
					AddArrayElement array = <new_unlockables_array> element = {Type = car_pieces group_name = <group_name> char_pieces = <my_array>}
				else
					AddArrayElement array = <new_unlockables_array> element = {Type = car_pieces char_pieces = <my_array>}
				endif
				new_unlockables_array = <array>
				changed = 1
			endif
		endif
	endif
	if GotParam \{character}
		get_musician_profile_struct_by_id id = <character> savegame = ($current_progression_savegame)
		if NOT is_profile_unlocked savegame = ($current_progression_savegame) profile_struct = <profile_struct>
			unlock_profile id = <character> savegame = ($current_progression_savegame)
			get_savegame_from_controller controller = ($primary_controller)
			if (<savegame> = ($current_progression_savegame))
				AddArrayElement array = <new_unlockables_array> element = {Type = character item = <character>}
				new_unlockables_array = <array>
				changed = 1
			endif
		endif
	endif
	get_savegame_from_controller controller = ($primary_controller)
	if (<savegame> = ($current_progression_savegame))
		if GotParam \{level}
			if GotParam \{stars}
				progression_get_total_stars
				unlock_stars = <stars>
				if isSinglePlayerGame
					getplayerinfo \{1
						part}
				else
					part = Band
				endif
				formatText {
					checksumName = venue_checksum
					'%s_%i'
					s = ($LevelZones.<level>.Name)
					i = ($instrument_list.<part>.text_nl)
				}
				if globaltagexists <venue_checksum> noassert = 1
					GetGlobalTags <venue_checksum> param = unlocked
					SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
					if (<unlocked> = 0)
						AddArrayElement array = <new_unlockables_array> element = {Type = level item = <level>}
						new_unlockables_array = <array>
						changed = 1
						formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level>.Name)
						if globaltagexists <venue_checksum> noassert = 1
							SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
						endif
					endif
				endif
			elseif GotParam \{song}
				if isSinglePlayerGame
					getplayerinfo \{1
						part}
				else
					part = Band
				endif
				formatText {
					checksumName = venue_checksum
					'%s_%i'
					s = ($LevelZones.<level>.Name)
					i = ($instrument_list.<part>.text_nl)
				}
				if globaltagexists <venue_checksum> noassert = 1
					GetGlobalTags <venue_checksum> param = unlocked
					SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
					if (<unlocked> = 0)
						AddArrayElement array = <new_unlockables_array> element = {Type = level item = <level>}
						new_unlockables_array = <array>
						changed = 1
						formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level>.Name)
						if globaltagexists <venue_checksum> noassert = 1
							SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
						endif
					endif
				endif
			elseif GotParam \{songs}
				if isSinglePlayerGame
					getplayerinfo \{1
						part}
				else
					part = Band
				endif
				formatText {
					checksumName = venue_checksum
					'%s_%i'
					s = ($LevelZones.<level>.Name)
					i = ($instrument_list.<part>.text_nl)
				}
				if globaltagexists <venue_checksum> noassert = 1
					GetGlobalTags <venue_checksum> param = unlocked
					SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
					if (<unlocked> = 0)
						AddArrayElement array = <new_unlockables_array> element = {Type = level item = <level>}
						new_unlockables_array = <array>
						changed = 1
						formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level>.Name)
						if globaltagexists <venue_checksum> noassert = 1
							SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
						endif
					endif
				endif
			endif
		endif
	endif
	if GotParam \{changed}
		Change new_unlockables = <new_unlockables_array>
	endif
	printstruct primary_controller = ($primary_controller) <...> channel = atoms
endscript

script progression_get_new_unlocks 
	printscriptinfo \{'progression_get_new_unlocks'
		channel = atom}
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
	printscriptinfo \{'progression_reset_new_unlocks'
		channel = atom}
	Change \{new_unlockables = [
		]}
endscript

script progression_check_for_5_stars \{part = 'guitar'}
	formatText checksumName = tier_global 'gh4_career_%p_songs' p = <part>
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	num_songs = 0
	tier_num = 1
	begin
	formatText checksumName = Tier 'tier%d' d = <tier_num>
	GetArraySize ($<tier_global>.<Tier>.songs)
	songlist_size = <array_Size>
	song_count = 0
	begin
	<song> = ($<tier_global>.<Tier>.songs [<song_count>])
	if NOT progression_check_for_song_5_stars song = <song> part = <part>
		return \{FALSE}
	endif
	<song_count> = (<song_count> + 1)
	repeat <songlist_size>
	tier_num = (<tier_num> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{true}
endscript

script progression_check_for_song_5_stars 
	RequireParams \{[
			song
		]
		all}
	if NOT StructureContains structure = ($gh_songlist_props.<song>) never_show_in_setlist
		get_song_saved_in_globaltags song = <song>
		get_song_allowed_in_quickplay song = <song>
		if NOT ((<saved_in_globaltags> = 1) && (<allowed_in_quickplay> = 1))
			return \{true}
		endif
	else
		return \{true}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.Name)
	i = 0
	begin
	formatText checksumName = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	GetGlobalTags <song_checksum> params = {stars} savegame = ($current_progression_savegame)
	if (<stars> = 5)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{FALSE}
endscript

script progression_check_for_song_complete 
	RequireParams \{[
			song
		]
		all}
	if NOT StructureContains structure = $permanent_songlist_props <song>
		return \{FALSE}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.Name)
	i = 0
	begin
	formatText checksumName = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	GetGlobalTags <song_checksum> params = {stars} savegame = ($current_progression_savegame)
	if (<stars> >= 3)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{FALSE}
endscript

script bx_progression_check_for_songs_complete 
	RequireParams \{[
			songs
		]
		all}
	k = 0
	GetArraySize <songs>
	bx_songs_completed = 0
	bx_songs_total = <array_Size>
	begin
	if NOT StructureContains structure = $permanent_songlist_props (<songs> [<k>])
		return \{FALSE}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.(<songs> [<k>]).Name)
	i = 0
	begin
	formatText checksumName = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	GetGlobalTags <song_checksum> params = {unlocked} savegame = ($current_progression_savegame)
	if (<unlocked> = 1)
		bx_songs_completed = (<bx_songs_completed> + 1)
		break
	endif
	i = (<i> + 1)
	repeat 5
	k = (<k> + 1)
	repeat <array_Size>
	if (<bx_songs_completed> = <bx_songs_total>)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script progression_check_for_total_stars 
	RequireParams \{[
			stars
		]
		all}
	total_stars = ($progression_total_stars_unlocked)
	if (<stars> <= <total_stars>)
		return \{true}
	endif
	return \{FALSE}
endscript
