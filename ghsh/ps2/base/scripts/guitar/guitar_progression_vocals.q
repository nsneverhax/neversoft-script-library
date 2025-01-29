gh4_career_vocals_songs = {
	prefix = 'career_vocals'
	part = vocals
	num_tiers = 8
	tier1 = {
		title = qs(0xea47b2d9)
		songs = [
			heartshapedbox
			psychobillyfreakout
			freebird
			unsung
			godzilla
			takemeout
			killinginthenameof
		]
		stars = 0
		encore_stars = 16
		level = load_z_amazon
	}
	tier2 = {
		title = qs(0x12b22730)
		songs = [
			nooneknows
			thembones
			rainingblood
			heyyou
			iwannarock
			stellar
			rockandrollallnite
		]
		stars = 21
		encore_stars = 37
		level = load_z_canyon
	}
	tier3 = {
		title = qs(0x68a5b300)
		songs = [
			missmurder
			laidtorest
			monkeywrench
			morethanafeeling
			iloverockandroll
			hitmewithyourbestshot
			barkatthemoon
		]
		stars = 42
		encore_stars = 58
		level = load_z_icecap
	}
	tier4 = {
		title = qs(0xdabbabe2)
		songs = [
			messageinabottle
			laydown
			freya
			caughtinamosh
			trippinonahole
			takeitoff
			woman
		]
		stars = 63
		encore_stars = 79
		level = load_z_london
	}
	tier5 = {
		title = qs(0xb859513b)
		songs = [
			roundandround
			cultofpersonality
			nothinbutagoodtime
			barracuda
			thunderkiss65
			stop
			carryonmywaywardson
		]
		stars = 84
		encore_stars = 100
		level = load_z_sphinx
	}
	tier6 = {
		title = qs(0xf416949e)
		songs = [
			electriceye
			cowboysfromhell
			backinthesaddle
			shoutatthedevil
			cherrypie
			mother
			smokeonthewater
		]
		stars = 105
		encore_stars = 121
		level = load_z_greatwall
	}
	tier7 = {
		title = qs(0xc0fcc8f7)
		songs = [
			beastandtheharlot
			thetrooper
			playwithme
			killerqueen
		]
		stars = 126
		level = load_z_atlantis
	}
	tier8 = {
		title = qs(0xf079fba9)
		songs = [
			throughthefire
		]
		stars = 136
		level = load_z_quebec
		end_with_credits
	}
}
gh4_career_vocals_progression_unlock_order = {
	Name = 'Career_Vocals'
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
gh4_career_vocals_gig_complete_params = {
	career_vocals
	unlock_order = gh4_career_vocals_progression_unlock_order
	part = 'Vocals'
}
gh4_career_vocals_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_vocals_init
		atom_params = {
		}
	}
	{
		Name = vocals_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_vocals_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_vocals
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_vocals_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_vocals_init 

endscript

script progression_career_vocals_endoffirstupdate 

endscript
