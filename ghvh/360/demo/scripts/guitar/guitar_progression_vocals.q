gh4_career_vocals_songs = {
	prefix = 'career_vocals'
	part = vocals
	num_tiers = 1
	tier1 = {
		$gh4_3_intro_tier
	}
}
gh4_career_vocals_progression_unlock_order = {
	name = 'Career_Vocals'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
	}
}
gh4_career_vocals_gig_complete_params = {
	career_vocals
	unlock_order = gh4_career_vocals_progression_unlock_order
	part = 'Vocals'
}
gh4_career_vocals_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_career_vocals_init
		atom_params = {
		}
	}
	{
		name = vocals_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_vocals_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_vocals
					part = 'Vocals'
					gig = 1
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_vocals_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_vocals_init 
	printf \{qs(0x27427fc4)}
endscript

script progression_career_vocals_endoffirstupdate 
	printf \{qs(0x850bf005)}
endscript
