gh3_general_coop_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_coop_init
		atom_params = {
		}
	}
	{
		name = quickplay_coop_5star
		type = scr
		atom_script = progression_coop_5star
		atom_params = {
		}
		depends_on = [
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = quickplay_coop_complete_songs
		type = scr
		atom_script = progression_coop_complete_songs
		atom_params = {
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkallsongscompleted
				params = {
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_coop_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_coop_init 
	printf \{"Progression_Coop_Init"}
endscript

script progression_coop_endoffirstupdate 
	printf \{"Progression_Coop_EndOfFirstUpdate"}
endscript

script progression_coop_5star 
	printf \{"Progression_Coop_5Star"}
endscript

script progression_coop_complete_songs 
	printf \{"Progression_Coop_Complete_Songs"}
endscript

script register_new_progression_atoms 
	index = ($difficulty_list_props.($current_difficulty).index)
	setprogressiondifficulty difficulty = <index>
	deregisteratoms
	registeratoms \{name = achievement
		$achievement_atoms}
	get_progression_globals game_mode = ($game_mode)
	if NOT (<progression_global> = none)
		registeratoms name = progression $<progression_global>
		updateatoms \{name = progression}
	endif
endscript
