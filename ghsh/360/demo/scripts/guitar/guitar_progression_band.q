gh4_1_dummy_tier_data = {
	title = qs(0xd351ed19)
	songs = [
		backinthesaddle
		barkatthemoon
		barracuda
		beastandtheharlot
		bxlagtest
	]
}
gh4_1_debug_tier = {
	title = qs(0xeb2271ef)
	songs = [
		tenseconddebug
		elevenseconddebug
		twelveseconddebug
	]
	level = load_z_icecap
	stars = 0
	debug_gig
}
gh4_1_intro_tier = {
	title = qs(0x0d48cfc6)
	songs = [
		rockandrollallnite
	]
	level = load_z_icecap
	stars = 0
	encore_stars = 0
	unlocked_levels = [
		load_z_icecap
	]
}
gh4_career_band_songs = {
	prefix = 'career_band'
	part = band
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
gh4_career_band_progression_unlock_order = {
	name = 'Career_Band'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
	}
}
gh4_career_band_gig_complete_params = {
	career_band
	unlock_order = gh4_career_band_progression_unlock_order
	part = 'Band'
}
gh4_career_band_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_career_band_init
		atom_params = {
		}
	}
	{
		name = band_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 1
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_band_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_band_init 
	printf \{qs(0x86f732a4)}
endscript

script progression_career_band_endoffirstupdate 
	printf \{qs(0xdcf0b0f3)}
endscript
