gh4_career_guitar_songs = {
	prefix = 'career_guitar'
	part = guitar
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
gh4_career_guitar_progression_unlock_order = {
	name = 'Career_Guitar'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
	}
}
gh4_career_guitar_gig_complete_params = {
	career_guitar
	unlock_order = gh4_career_guitar_progression_unlock_order
	part = 'Guitar'
}
gh4_career_guitar_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_career_guitar_init
		atom_params = {
		}
	}
	{
		name = guitar_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_guitar_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_guitar
					gig = 1
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_guitar_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_guitar_init 
	printf \{qs(0x8cea406d)}
endscript

script progression_career_guitar_endoffirstupdate 
	printf \{qs(0x957d3532)}
endscript

script update_progression_guitar 
	updateatoms \{name = progression}
endscript
