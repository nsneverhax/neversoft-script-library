gh4_career_guitar_songs = {
	prefix = 'career_guitar'
	part = guitar
	num_tiers = 8
	tier1 = {
		title = qs(0xea47b2d9)
		songs = [
			iloverockandroll
			rockandrollallnite
			smokeonthewater
			shoutatthedevil
			hitmewithyourbestshot
			heartshapedbox
			killerqueen
		]
		stars = 0
		encore_stars = 16
		level = load_z_amazon
	}
	tier2 = {
		title = qs(0x12b22730)
		songs = [
			takemeout
			morethanafeeling
			woman
			cherrypie
			messageinabottle
			heyyou
			stellar
		]
		stars = 21
		encore_stars = 37
		level = load_z_canyon
	}
	tier3 = {
		title = qs(0x68a5b300)
		songs = [
			barracuda
			laydown
			killinginthenameof
			unsung
			thembones
			godzilla
			iwannarock
		]
		stars = 42
		encore_stars = 58
		level = load_z_icecap
	}
	tier4 = {
		title = qs(0xdabbabe2)
		songs = [
			carryonmywaywardson
			missmurder
			thunderkiss65
			mother
			backinthesaddle
			nooneknows
			roundandround
		]
		stars = 63
		encore_stars = 79
		level = load_z_london
	}
	tier5 = {
		title = qs(0xb859513b)
		songs = [
			monkeywrench
			trippinonahole
			freya
			nothinbutagoodtime
			takeitoff
			stop
			yyz
		]
		stars = 84
		encore_stars = 100
		level = load_z_sphinx
	}
	tier6 = {
		title = qs(0xf416949e)
		songs = [
			cowboysfromhell
			caughtinamosh
			electriceye
			laidtorest
			cultofpersonality
			thetrooper
			beastandtheharlot
		]
		stars = 105
		encore_stars = 121
		level = load_z_greatwall
	}
	tier7 = {
		title = qs(0xc0fcc8f7)
		songs = [
			barkatthemoon
			psychobillyfreakout
			freebird
			rainingblood
			playwithme
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
gh4_career_guitar_progression_unlock_order = {
	Name = 'Career_Guitar'
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
gh4_career_guitar_gig_complete_params = {
	career_guitar
	unlock_order = gh4_career_guitar_progression_unlock_order
	part = 'Guitar'
}
gh4_career_guitar_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_guitar_init
		atom_params = {
		}
	}
	{
		Name = guitar_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_guitar_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_guitar
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_guitar_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_guitar_init 

endscript

script progression_career_guitar_endoffirstupdate 

endscript

script update_progression_guitar 
	UpdateAtoms \{Name = Progression}
endscript
