gh3_general_coop_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_coop_init
		atom_params = {
		}
	}
	{
		Name = quickplay_coop_5star
		Type = Scr
		atom_script = progression_coop_5star
		atom_params = {
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = quickplay_coop_complete_songs
		Type = Scr
		atom_script = progression_coop_complete_songs
		atom_params = {
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckAllSongsCompleted
				params = {
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_coop_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_coop_init 

endscript

script progression_coop_endoffirstupdate 

endscript

script progression_coop_5star 

endscript

script progression_coop_complete_songs 

endscript

script register_new_progression_atoms 
	index = ($difficulty_list_props.($current_difficulty).index)
	SetProgressionDifficulty difficulty = <index>
	DeRegisterAtoms
	RegisterAtoms \{Name = achievement
		$Achievement_Atoms}
	get_progression_globals game_mode = ($game_mode)
	if NOT (<progression_global> = None)
		RegisterAtoms Name = Progression $<progression_global>
		UpdateAtoms \{Name = Progression}
	endif
endscript
