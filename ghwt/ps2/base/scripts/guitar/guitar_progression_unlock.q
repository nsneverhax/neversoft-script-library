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

	atoms = ($unlock_atoms)
	switch (<part>)
		case 'band'
		bonus_params = {career_band}
		reward_array = $progression_band_rewards
		case 'guitar'
		bonus_params = {career_guitar}
		reward_array = $progression_guitar_rewards
		case 'bass'
		bonus_params = {career_bass}
		reward_array = $progression_bass_rewards
		case 'drum'
		bonus_params = {career_drum}
		reward_array = $progression_drum_rewards
		case 'vocals'
		bonus_params = {career_vocals}
		reward_array = $progression_vocals_rewards
	endswitch
	depend_atoms = []
	j = 1
	begin
	formatText checksumName = depend_atom '%p_career_gig%n_complete' p = <part> n = <j>
	AddArrayElement array = <depend_atoms> element = <depend_atom>
	depend_atoms = <array>
	j = (<j> + 1)
	repeat 13
	index = 0
	i = 1
	begin
	formatText checksumName = Name '%p_gig%n_reward' p = <part> n = <i> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {Type = atom atoms = <depend_atoms> depend_func = count count = <i>}
	depends_on = <array>
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	i = (<i> + 1)
	repeat 13
	formatText checksumName = Name '%p_every_gig_reward' p = <part> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {Type = atom atoms = <depend_atoms>}
	depends_on = <array>
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	formatText checksumName = Name '%p_five_star_reward' p = <part> AddToStringLookup = true
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_5_stars
				params = {part = <part>}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
	return {index = <index> bonus_params = <bonus_params> reward_array = <reward_array>}
endscript

script setup_unlock_atoms_band 
	setup_unlock_atoms_generic \{part = 'band'}
	atoms = ($unlock_atoms)
	formatText \{checksumName = Name
		'%p_Today_reward'
		p = 'band'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = today part = 'band'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_guitar 
	setup_unlock_atoms_generic \{part = 'guitar'}
	atoms = ($unlock_atoms)
	formatText \{checksumName = Name
		'%p_BossZakk_reward'
		p = 'guitar'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = bosszakk part = 'guitar'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	formatText \{checksumName = Name
		'%p_BossTed_reward'
		p = 'guitar'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = bossted part = 'guitar'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_bass 
	setup_unlock_atoms_generic \{part = 'bass'}
	atoms = ($unlock_atoms)
	formatText \{checksumName = Name
		'%p_DemolitionMan_reward'
		p = 'bass'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = demolitionman part = 'bass'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_drums 
	setup_unlock_atoms_generic \{part = 'drum'}
	atoms = ($unlock_atoms)
	formatText \{checksumName = Name
		'%p_Dammit_reward'
		p = 'drum'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = dammit part = 'drum'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
endscript

script setup_unlock_atoms_vocals 
	setup_unlock_atoms_generic \{part = 'vocals'}
	atoms = ($unlock_atoms)
	formatText \{checksumName = Name
		'%p_MiseryBusiness_reward'
		p = 'vocals'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = miserybusiness part = 'vocals'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	formatText \{checksumName = Name
		'%p_CrazyTrain_reward'
		p = 'vocals'
		AddToStringLookup = true}
	atom = {
		Name = <Name>
		Type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) Name = <Name>}
		depends_on = [
			{
				Type = Scr
				Scr = progression_check_for_song_complete
				params = {song = crazytrain part = 'vocals'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	Change unlock_atoms = <atoms>
endscript

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
			if GotParam \{group_name}
				AddArrayElement array = <new_unlockables_array> element = {Type = car_pieces group_name = <group_name> char_pieces = <my_array>}
			else
				AddArrayElement array = <new_unlockables_array> element = {Type = car_pieces char_pieces = <my_array>}
			endif
			new_unlockables_array = <array>
			changed = 1
		endif
	endif
	if GotParam \{characters}
		GetArraySize <characters>
		if (<array_Size> > 0)
			i = 0
			begin
			get_musician_profile_struct_by_id id = (<characters> [<i>]) savegame = ($current_progression_savegame)
			if NOT is_profile_unlocked savegame = ($current_progression_savegame) profile_struct = <profile_struct>
				unlock_profile id = (<characters> [<i>]) savegame = ($current_progression_savegame)
				get_savegame_from_controller controller = ($primary_controller)
				if (<savegame> = ($current_progression_savegame))
					AddArrayElement array = <new_unlockables_array> element = {Type = character item = (<characters> [<i>])}
					new_unlockables_array = <array>
					changed = 1
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if GotParam \{changed}
		Change new_unlockables = <new_unlockables_array>
	endif
endscript

script progression_get_new_unlocks 
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
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
