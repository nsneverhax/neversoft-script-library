gh4_1_dummy_tier_data = {
	title = qs(0x58763da6)
	songs = [
		backinthesaddle
		barkatthemoon
		barracuda
		beastandtheharlot
	]
}
gh4_1_intro_tier = {
	title = qs(0x0d48cfc6)
	songs = [
		backinthesaddle
	]
	level = load_z_canyon
	stars = 0
	encore_stars = 0
	unlocked_levels = [
		load_z_amazon
	]
}
gh4_career_band_songs = {
	prefix = 'career_band'
	part = Band
	num_tiers = 8
	tier1 = {
		title = qs(0xea47b2d9)
		songs = [
			iloverockandroll
			heartshapedbox
			hitmewithyourbestshot
			rockandrollallnite
			takemeout
			morethanafeeling
			stellar
		]
		stars = 0
		encore_stars = 16
		level = load_z_amazon
	}
	tier2 = {
		title = qs(0x12b22730)
		songs = [
			iwannarock
			woman
			thembones
			godzilla
			laydown
			takeitoff
			killinginthenameof
		]
		stars = 21
		encore_stars = 37
		level = load_z_canyon
	}
	tier3 = {
		title = qs(0x68a5b300)
		songs = [
			roundandround
			cherrypie
			shoutatthedevil
			heyyou
			unsung
			missmurder
			nothinbutagoodtime
		]
		stars = 42
		encore_stars = 58
		level = load_z_icecap
	}
	tier4 = {
		title = qs(0xdabbabe2)
		songs = [
			carryonmywaywardson
			backinthesaddle
			monkeywrench
			mother
			messageinabottle
			smokeonthewater
			killerqueen
		]
		stars = 63
		encore_stars = 79
		level = load_z_london
	}
	tier5 = {
		title = qs(0xb859513b)
		songs = [
			electriceye
			thunderkiss65
			freya
			barracuda
			stop
			nooneknows
			trippinonahole
		]
		stars = 84
		encore_stars = 100
		level = load_z_sphinx
	}
	tier6 = {
		title = qs(0xf416949e)
		songs = [
			psychobillyfreakout
			cultofpersonality
			cowboysfromhell
			barkatthemoon
			yyz
			laidtorest
			freebird
		]
		stars = 105
		encore_stars = 121
		level = load_z_greatwall
	}
	tier7 = {
		title = qs(0xc0fcc8f7)
		songs = [
			thetrooper
			playwithme
			caughtinamosh
			rainingblood
			beastandtheharlot
		]
		stars = 126
		level = load_z_atlantis
	}
	tier8 = {
		title = qs(0xf079fba9)
		songs = [
			throughthefire
		]
		stars = 141
		level = load_z_quebec
		end_with_credits
	}
}
gh4_career_band_progression_unlock_order = {
	Name = 'Career_Band'
	freegigs = {
		gig1 = {
			Name = 'gig1'
			num = 1
		}
		gig2 = {
			Name = 'gig2'
			num = 2
		}
		gig3 = {
			Name = 'gig3'
			num = 3
		}
		gig4 = {
			Name = 'gig4'
			num = 4
		}
		gig5 = {
			Name = 'gig5'
			num = 5
		}
		gig6 = {
			Name = 'gig6'
			num = 6
		}
		gig7 = {
			Name = 'gig7'
			num = 7
		}
		gig8 = {
			Name = 'gig8'
			num = 8
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
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_band_init
		atom_params = {
		}
	}
	{
		Name = band_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_band_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_band_init 

endscript

script progression_career_band_endoffirstupdate 

endscript
