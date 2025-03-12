gh4_career_bass_songs = {
	prefix = 'career_bass'
	part = bass
	num_tiers = 1
	tier1 = {
		title = qs(0xea47b2d9)
		songs = [
			takemeout
			woman
			rockandrollallnite
		]
		stars = 0
		encore_stars = 16
		level = load_z_icecap
	}
}
gh4_career_bass_progression_unlock_order = {
	name = 'Career_Bass'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
	}
}
gh4_career_bass_gig_complete_params = {
	career_bass
	unlock_order = gh4_career_bass_progression_unlock_order
	part = 'Bass'
}
gh4_career_bass_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_career_bass_init
		atom_params = {
		}
	}
	{
		name = bass_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_bass_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_bass
					gig = 1
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_bass_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_bass_init 
	printf \{qs(0x2f3f7ae0)}
endscript

script progression_career_bass_endoffirstupdate 
	printf \{qs(0xb5eaf894)}
endscript
