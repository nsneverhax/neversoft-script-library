gh4_career_drum_songs = {
	prefix = 'career_drum'
	part = drum
	num_tiers = 1
	tier1 = {
		$gh4_1_intro_tier
	}
}
gh4_career_drum_progression_unlock_order = {
	name = 'Career_Drum'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
	}
}
gh4_career_drum_gig_complete_params = {
	career_drum
	unlock_order = gh4_career_drum_progression_unlock_order
	part = 'Drum'
}
gh4_career_drum_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_career_drum_init
		atom_params = {
		}
	}
	{
		name = drum_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 1
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_drum_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_drum_init 
	printf \{qs(0xf347395d)}
endscript

script progression_career_drum_endoffirstupdate 
	printf \{qs(0xd8377944)}
endscript
